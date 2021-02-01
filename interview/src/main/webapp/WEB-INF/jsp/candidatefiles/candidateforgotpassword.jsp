<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
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
<style>
h5 {
	color: red;
}
</style>

<script>
	function newpassform() {
		var lo = document.forms["forgotpasswordform"]["emailid"].value;

		if (lo == "") {
			document.getElementById("ue").innerHTML = "Please enter company email Id";

			return false;
		}
	}
</script>
</head>
<body>
<br><br><br>
	<h4 style="text-align: center;">Forgot Password</h4>

	<form:form id="fpemailidform" modelAttribute="candidate"
		action="candidatefpProcess" onsubmit="return newpassform()"
		method="post">
		<br>
		<br>
		<br>
		<table align="center">
			<tr>
				<td><form:label path="emailid">User Name </form:label></td>
				<td><form:input path="emailid" name="emailid" id="emailid" /><span
					id="ue" style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><br> <form:button id="forgotpassword"
						name="forgotpassword" style="background-color:Cyan">Change Password</form:button></td>
			</tr>

			<tr></tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</form:form>
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>

</body>
</html>