package javaResources;

import java.sql.Date;
import java.sql.Time;

public class Reservation {
	private String employee;
	private int roomId;
	private Date date;
	private Time startTime;
	private Time endTime;

	public Reservation(String employee, int roomId, Date date, Time start, Time end) {
		if (date != null) {
			this.employee = employee;
			this.roomId = roomId;
			this.date = date;
			this.startTime = start;
			this.endTime = end;
		}
	}

	public String getEmployee() {
		return employee;
	}

	public void setEmployee(String employee) {
		this.employee = employee;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public Time getStartTime() {
		return startTime;
	}

	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}

	public Time getEndTime() {
		return endTime;
	}

	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
