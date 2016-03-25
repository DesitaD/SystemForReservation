<%@page import="javaResources.Reservation"%>
<%@page import="javaResources.Room"%>
<%@page import="javaResources.ReservationsDAO"%>
<%@page import="javaResources.UsersLogin"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="CSS/styleRes.css" rel="stylesheet" />
</head>
<body onLoad="displayResult()">
	<%
		int result = 0;
		int show = 0;
		if (request.getParameter("submit") != null) {
			ReservationsDAO reservationManager = new ReservationsDAO();
			String user = new String();
			int room = 0;
			Date dat = Date.valueOf("2016-01-22");
			Time startTime = Time.valueOf("00:01:00");
			Time endTime = Time.valueOf("00:01:00");
			if (request.getParameter("employee") != null && request.getParameter("roomNum") != null
					&& request.getParameter("date") != null && request.getParameter("start") != null
					&& request.getParameter("end") != null) {
				user = request.getParameter("employee");
				room = Integer.valueOf(request.getParameter("roomNum"));
				dat = Date.valueOf(request.getParameter("date"));
				startTime = Time.valueOf(request.getParameter("start"));
				endTime = Time.valueOf(request.getParameter("end"));
				Reservation reserve = new Reservation(user, room, dat, startTime, endTime);
				if (reservationManager.isTheRoomFree(reserve.getRoomId(), reserve.getDate(), reserve.getStartTime(),
						reserve.getEndTime())) {
					result = reservationManager.createReservation(reserve);
				} else {
					result = 2;
				}
			}
		}
		if (request.getParameter("check") != null) {
			response.sendRedirect("check.jsp");
		}
	%>
	<div class="container">
		<form id="signup" name="reservationForm" action="Reservation.jsp"
			method="POST">
			<div class="header">
				<h1>Reservations</h1>
				<div class="sep"></div>
				<div class="inputs">
					<table border="0">
						<tbody>
							<tr>
								<td>Enter your full name:</td>
								<td><input type="text" name="employee" value="" size="30" /></td>
							</tr>
							<tr>
								<td>Select a room:</td>
								<td><select name="roomNum">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10</option>
								</select> <input type="submit" value="Show details" name="show" /></td>
							</tr>
							<tr>
								<td>Enter date for reservation:</td>
								<td><input type="text" name="date" value=""
									placeholder="(format(yyyy-mm-dd))" size="30" /></td>
							</tr>
							<tr>
								<td>Enter start hour:</td>
								<td><input type="text" name="start" value=""
									placeholder="(format hh:mm:ss)" size="30" /></td>
							</tr>
							<tr>
								<td>Enter end hour</td>
								<td><input type="text" name="end" value=""
									placeholder="(format hh:mm:ss)" size="30" /></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="hidden" value="<%=result%>" /> <input
						type="reset" value="Cancel" name="clear" /> <input type="submit"
						value="Submit" name="submit" /> <input type="submit"
						value="Check rooms availability" name="check" />
				</div>
			</div>
			<div class="sep"></div>
			<div class="inputs">
				<%
					if (request.getParameter("show") != null) {
						ReservationsDAO reservation = new ReservationsDAO();
						Room room = reservation.checkRoom(Integer.parseInt(request.getParameter(("roomNum"))));
				%>
				<ul>
					<li><span><%=room.toString()%> </span></li>
				</ul>
				<%
					}
				%>
			</div>
	</div>
	</form>
	</div>
	<script type="text/javascript">
	<!--
		function displayResult() {
			if (document.reservationForm.hidden.value == 1) {
				alert("Your reservation was successful!!! :)");
			}
			if (document.reservationForm.hidden.value == 2) {
				alert("Sorry but the room is busy!!! Please enter another room or check when the room is free!");
			}

		}
		-->
	</script>
</body>
</html>