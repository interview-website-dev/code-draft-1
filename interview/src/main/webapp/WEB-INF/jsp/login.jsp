<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	function logform() {
		var lo = document.forms["loginForm"]["companyemailid"].value;
		if (lo == "") {
			document.getElementById("uname").innerHTML = "Please enter company email Id";
			return false;
		}

	}
</script>
<style>
body {
	background-color: rgba(173, 216, 230, 0.3)
}
</style>
<style>
h5 {
	color: red;
}
</style>

</head>
<body>
	<br>
	<br>
	<br>
	<center>


		<h4 style="text-align: center;">Employer Login</h4>
		<form:form id="loginForm" modelAttribute="user" action="loginProcess"
			onsubmit="return logform()" method="post">
			<br>
			<h5>${message1}</h5>
			<h5>${message2}</h5>
			<br>
			<table align="center">
				<tr>
					<td><form:label path="companyemailid">Username: </form:label></td>
					<td></td>
					<td><form:input path="companyemailid" name="companyemailid"
							placeholder="Company emailid" id="companyemailid" /><span
						id="uname" style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="password">Password:</form:label></td>
					<td></td>
					<td><form:password path="password" name="password"
							id="password" /></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td align="left"><br> <form:button id="login"
							name="login" style="background-color:Cyan">Login</form:button></td>
				</tr>

				<tr></tr>
				<tr>
					<td><br> <a href="forgotpassword">Forget
							Password?&nbsp;&nbsp; </a><br></td>
					<td></td>
					<td><br> <a href="register"> Not a Member Yet? Create
							an Account </a></td>
				</tr>
			</table>
		</form:form>
		<table align="center">
			<tr>
				<td style="font-style: italic; color: red;"></td>
			</tr>
		</table>
	</center>
</body>
</html>