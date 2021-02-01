<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PassChange</title>
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
	function passchange() {
		var p = document.forms["forgotpassword"]["password"].value;
		var cp = document.forms["forgotpassword"]["confirmpassword"].value;
		//PASSWORD

		if (p == "") {
			document.getElementById("pw").innerHTML = "Password Cannot Be Empty";
			return false;
		}
		if ((p.length <= 8) || (p.length > 20)) {
			document.getElementById("pw").innerHTML = "Password should be between 8 and 20";
			return false;
		}
		//CONFIRMPASSWORD

		if (p != cp) {
			document.getElementById("cpw").innerHTML = "Password didnt match";
			return false;
		}
	}
</script>

</head>
<body>
	<h4 style="text-align: center;">Forgot Password</h4>

	<form:form id="forgotpassword" modelAttribute="candidate"
		action="candidatepasschangeProcess?MailId=${emailid}&candidateid=${candidateid}"
		onsubmit="return passchange()" method="post">
		<br>
		<br>
		<br>
		<table align="center">
			<tr>
				<td><form:label path="password">Password</form:label></td>
				<td><form:password path="password" name="password"
						id="password" /><span id="pw"
					style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="confirmpassword">Confirm Password</form:label></td>
				<td><form:password path="confirmpassword"
						name="confirmpassword" id="confirmpassword" /><span id="cpw"
					style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><br> <form:button
						id="candidateforgotpassword" name="candidateforgotpassword"
						style="background-color:Cyan">Save</form:button></td>
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