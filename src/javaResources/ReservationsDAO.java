package javaResources;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class ReservationsDAO {
	Connection connection = null;

	public Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
			String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:63729;databasename=SystemForReservations;integratedSecurity=true;";
			connection = DriverManager.getConnection(url, "sa", "sa123");
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public void closeConnection(Connection connection) {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int createReservation(Reservation reservation) {
		int result = 0;
		String insSQL = "insert into Reservations (employee, roomNumber, date, startTime, endTime) values (?,?,?,?,?);";
		Connection connect = getConnection();
		try {
			PreparedStatement statement = connect.prepareStatement(insSQL);
			statement.setString(1, reservation.getEmployee());
			statement.setInt(2, reservation.getRoomId());
			statement.setDate(3, reservation.getDate());
			statement.setTime(4, reservation.getStartTime());
			statement.setTime(5, reservation.getEndTime());
			result = statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connect);
		}
		return result;
	}

	public Room checkRoom(int roomNumber) {
		String sql = "select * from Rooms where roomId=?;";
		Connection connection = getConnection();
		Room room = new Room(0, 0, true, false);
		try {
			PreparedStatement state = connection.prepareStatement(sql);
			state.setInt(1, roomNumber);
			ResultSet result = state.executeQuery();
			while (result.next()) {
				room = new Room(result.getInt("roomId"), result.getInt("capacity"), result.getBoolean("tv"),
						result.getBoolean("projector"));
				System.out.println(room.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return room;
	}

	public List<String> checkAvailability(String start, String end) {
		List<String> busy = new ArrayList<>();
		String sql = "Select roomNumber, date, startTime, endTime from Reservations where date between ? and ?;";
		Connection connect = getConnection();
		try {
			PreparedStatement statement = connect.prepareStatement(sql);
			// statement.setInt(1, roomNumber);
			statement.setDate(1, java.sql.Date.valueOf(start));
			statement.setDate(2, java.sql.Date.valueOf(end));
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				int i = 0;
				busy.add(i, "Room " + result.getInt("roomNumber") + " is busy on " + result.getDate("date") + " from "
						+ result.getTime("startTime") + " to " + result.getTime("endTime") + " o'clock");
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connect);
		}
		return busy;
	}

	public boolean isTheRoomFree(int roomNumber, Date date, Time start, Time end) {
		boolean flag = true;
		String sql = "Select date,roomNumber, startTime, endTime from Reservations where roomNumber=? and date=?;";
		Connection connect = getConnection();
		try {
			PreparedStatement statement = connect.prepareStatement(sql);
			statement.setInt(1, roomNumber);
			statement.setDate(2, date);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				if (result.getInt(result.findColumn("roomNumber")) != 0) {
					if (result.getTime("startTime").equals(start) || result.getTime("endTime").equals(end)) {
						flag = false;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connect);
		}
		return flag;
	}

	public int login(UsersLogin user) {
		String insSQL = "insert into Users (username, password, date) values (?,?,?);";
		int result = 0;
		Connection connect = getConnection();
		try {
			PreparedStatement statement = connect.prepareStatement(insSQL);
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getPassword());
			statement.setDate(3, user.getLoginDate());
			result = statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connect);
		}
		return result;
	}

	public static void main(String[] args) {

	}

}
