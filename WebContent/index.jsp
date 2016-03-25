<%@page import="javaResources.ReservationsDAO"%>
<%@page import="javaResources.UsersLogin"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="CSS/style.css" rel="stylesheet" />
<title>ReservatinSystem</title>
</head>
<body>
	<%
		if (request.getParameter("submit") != null) {
			ReservationsDAO reservationManager = new ReservationsDAO();
			int result = 0;
			String user = new String();
			String pass = new String();
			if (request.getParameter("user") != null && request.getParameter("pass") != null) {
				user = request.getParameter("user");
				pass = request.getParameter("pass");
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();
				String curDate = dateFormat.format(date);
				UsersLogin newUser = new UsersLogin(user, pass, curDate);
				result = reservationManager.login(newUser);
			}
			response.sendRedirect("Reservation.jsp");
		}
	%>
	<div class="container">
		<form id="signup" name="loginForm" action="index.jsp" method="POST">
			<div class="header">
				<h2>Login</h2>
			</div>
			<div class="sep"></div>
			<div class="inputs">
				<input type="text" name="user" placeholder="Enter your username"
					size="50" /> <input type="text" name="pass"
					placeholder="Enter your password" size="50" /> <input type="reset"
					value="Cancel" name="clear" /> <input type="submit" value="Submit"
					name="submit" />
			</div>
		</form>
	</div>
</body>
</html>