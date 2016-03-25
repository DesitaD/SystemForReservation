<%@page import="javaResources.ReservationsDAO"%>
<%@page import="java.util.List;"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="CSS/styleRes.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<form id="signup" name="roomCheck" action="check.jsp" method="POST">
			<div class="header">
				<h1>Check rooms</h1>
				<div class="sep"></div>
				<div class="inputs">
					<table border="0">
						<tbody>
							<tr>
								<td>Enter start date:</td>
								<td><input type="text" name="startdate" value=""
									placeholder="(format(yyyy-mm-dd))" size="30" /></td>
							</tr>
							<tr>
								<td>Enter end date:</td>
								<td><input type="text" name="enddate" value=""
									placeholder="(format(yyyy-mm-dd))" size="30" /></td>
							</tr>

						</tbody>
					</table>
					<input type="reset" value="Cancel" name="clear" /> <input
						type="submit" value="Check" name="submit" /> <input type="submit"
						value="Return to reservation form" name="reserv" />
				</div>
				<div class="sep"></div>
				<div class="inputs">
					<%
						if (request.getParameter("reserv") != null) {
							response.sendRedirect("Reservation.jsp");
						}
						if (request.getParameter("submit") != null && request.getParameter("startdate") != null && request.getParameter("enddate") != null) {
								ReservationsDAO res = new ReservationsDAO();
								List<String> busyRooms = res.checkAvailability(request.getParameter("startdate"),
										request.getParameter("enddate"));
					%>
					<ul>
						<%
							for (String busy : busyRooms) {
						%>
						<li><span><%=busy%></span></li>
						<%
							}
								}
						%>
					</ul>
				</div>
			</div>
		</form>
	</div>
</body>
</html>