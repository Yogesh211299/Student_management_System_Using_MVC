<%@page import="com.jspiders.springmvc.pojo.StudentPojo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="NavBar.jsp"></jsp:include>
<%
StudentPojo pojo = (StudentPojo) request.getAttribute("student");
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
		<fieldset>
			<legend>Search Student</legend>
			<form action="./search" method="post">
				<table>

					<tr>
						<td>ENTER ID</td>
						<td><input type="text" name="id"></td>
					</tr>
				</table>
				<input type="submit" value="SEARCH">
			</form>
		</fieldset>
	
	<%if(msg != null){ %>
	<h1><%=msg %></h1>
	<%} %>
		<%if(pojo != null){ %>
		<table id="tab1">
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>EMAIL</th>
				<th>CONTACT</th>
				<th>ADDRESS</th>
			</tr>
			<tr>
				<td><%=pojo.getId()%></td>
				<td><%=pojo.getName()%></td>
				<td><%=pojo.getEmail()%></td>
				<td><%=pojo.getContact()%></td>
				<td><%=pojo.getAddress()%></td>
			</tr>
		</table>
		<%} %>
	</div>

</body>
</html>