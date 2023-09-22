<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
       color:white;
	background-color: olive;
}
</style>
</head>
<body>
	<div align="center">

		<fieldset>
			<legend>Create New Account</legend>
			<form action="./createAccount"  method="post">
			<table>
				<tr>
					<td>Username</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="text" name="password"></td>
				</tr>
			</table>
			<input type="submit" value="CREATE ACCOUNT">
			</form>
		</fieldset>
	</div>
</body>
</html>