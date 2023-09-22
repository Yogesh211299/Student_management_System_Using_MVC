<%@page import="com.jspiders.springmvc.pojo.StudentPojo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  List<StudentPojo> students=(List<StudentPojo>)request.getAttribute("students");
String msg = (String) request.getAttribute("msg");
%>
<jsp:include page="NavBar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
fieldset table {
	margin: auto;
	text-align: left;
}

fieldset {
	background-color: pink;
	margin: 15px 520px;
	text-align: center;
}

legend {
	background-color: olive;
}

#tab1{
background-color: white;
	border: 1px solid black;
	width: 100%;
	border: 1px solid black;
}
#tab1 td{
        text-align:center;
        border: 1px solid black;
}
</style>
</head>
<body>
	<div align="center">
		<fieldset>
			<legend>Add Student Details</legend>
			<form action="./add" method="post">
				<table>
					<tr>
						<td>Name</td>
						<td><input type="text" name="name" placeholder="Name"></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="text" name="email" placeholder="Email"></td>
					</tr>
					<tr>
						<td>Contact</td>
						<td><input type="text" name="contact" placeholder="Contact"></td>
					</tr>
					<tr>
						<td>Address</td>
						<td><input type="text" name="address" placeholder="Address"></td>
					</tr>
				</table>
				<input type="submit" value="ADD">

			</form>
		</fieldset>
		<%
		if (msg != null) {
		%>
		<h1 style="color: red"><%=msg%>
		</h1>
		<%
		}
		%>
			<% if(students != null){ %>
		<table id="tab1">
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>EMAIL</th>
				<th>CONTACT</th>
				<th>ADDRESS</th>
			</tr>
			<%for (StudentPojo pojo : students) {%>
			<tr>
				<td><%=pojo.getId()%></td>
				<td><%=pojo.getName()%></td>
				<td><%=pojo.getEmail()%></td>
				<td><%=pojo.getContact()%></td>
				<td><%=pojo.getAddress()%></td>
			</tr>
			<%
			}
			%>
		</table>
     <%} %>
	</div>

</body>
</html>