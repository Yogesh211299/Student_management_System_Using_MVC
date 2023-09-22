<%@page import="com.jspiders.springmvc.pojo.StudentPojo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<StudentPojo> students = (List<StudentPojo>) request.getAttribute("students");
String msg = (String) request.getAttribute("msg");
StudentPojo pojo = (StudentPojo) request.getAttribute("student");
%>
<jsp:include page="NavBar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form {
	margin-top: 10px;
}

form table {
	margin: auto;
	width: 100%;
}

tr {
	text-align: center;
}

tr>th {
	color: red;
}

fieldset table {
	margin: auto;
	text-align: left;
}

fieldset {
	margin: 15px 520px;
	text-align: center;
}

legend {
	color: white;
	background-color: #333;
}

#tab1 {
	background-color: white;
	border: 1px solid black;
	width: 100%;
	border: 1px solid black;
}

#tab1 td {
	text-align: center;
	border: 1px solid black;
}
</style>

</head>
<body>
	<div align="center">
		<%
		if (pojo == null) {
		%>
		<fieldset>
			<legend>Search student to Update</legend>
			<form action="./update" method="post">
				<table>
					<tr>
						<td>ENTER ID</td>
						<td><input type="text" name="id"></td>
					</tr>
				</table>
				<input type="submit" value="SELECT">
			</form>
		</fieldset>
		<%
		} else {
		%>

		<fieldset>
			<legend>Update student details</legend>
			<form action="./updateStudent" method="post">
				<table>
					<tr>
						<td>ID</td>
						<td><%=pojo.getId()%></td>
						<td><input type="text" name="id" value="<%= pojo.getId()%>" hidden="true"></td>
					</tr>
					<tr>
						<td>NAME</td>
						<td><input type="text" name="name" value="<%= pojo.getName()%>"></td>
					</tr>
					<tr>
						<td>EMAIL</td>
						<td><input type="text" name="email" value="<%= pojo.getEmail()%>"></td>
					</tr>
					<tr>
						<td>CONTACT</td>
						<td><input type="text" name="contact" value="<%= pojo.getContact()%>"></td>
					</tr>
					<tr>
						<td>ADDRESS</td>
						<td> <input type="text" name="address" value="<%= pojo.getAddress()%>"> </td>
					</tr>
					
				</table>
				<input type="submit" value="UPDATE">
			</form>
		</fieldset>

		<%
		}
		%>
		
		<%if(msg != null){ %>
            
            <h3><%= msg %></h3>
            <%} %>
		<%
		if (students != null) {
		%>
		<table id="tab1">
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>EMAIL</th>
				<th>CONTACT</th>
				<th>ADDRESS</th>
			</tr>
			<%
			for (StudentPojo student : students) {
			%>
			<tr>
				<td><%=student.getId()%></td>
				<td><%=student.getName()%></td>
				<td><%=student.getEmail()%></td>
				<td><%=student.getContact()%></td>
				<td><%=student.getAddress()%></td>
			</tr>
			<%
			}
			%>
		</table>
		<% } %>

	</div>

</body>
</html>