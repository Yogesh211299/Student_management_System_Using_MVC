<%@page import="com.jspiders.springmvc.pojo.AdminPojo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%String msg=(String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
legend {
	background-color: olive;
	text-align: center;
}

fieldset {
	background-color: pink;
}

div {
	margin: 0 auto;
	margin-top: 40vh;
	width: 400px;
}
h3{

}
</style>
</head>
<body>

	<div align="center">
	<%if(msg != null){ %>
<h3><%=msg %></h3>
<%} %>
		<fieldset>
			<legend>Login Page</legend>
			<form action="./login" method="post">
				<table>
					<tr>
						<td>Username</td>
						<td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password"></td>
					</tr>
				</table>
				<input type="submit" value="LOGIN">
			</form>
			<a href="http://localhost:8080/springmvc/createAccount">Don't
				have an account? Create New Account</a>
		</fieldset>
	</div>

</body>
</html>