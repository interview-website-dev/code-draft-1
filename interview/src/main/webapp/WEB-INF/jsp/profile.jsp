<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
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
	function validate() {
		//FIRSTNAME

		var x = document.forms["edit"]["firstname"].value;
		var y = document.forms["edit"]["lastname"].value;
		var e = document.forms["edit"]["companyemailid"].value;
		var m = document.forms["edit"]["mobilenumber"].value;
		var com = document.forms["edit"]["companyname"].value;
		var ci = document.forms["edit"]["city"].value;

		if (x == "") {
			document.getElementById("fname").innerHTML = "Firstname cannot be empty";
			return false;
		}
		if ((x.length <= 2) || (x.length > 20)) {
			document.getElementById("fname").innerHTML = "Firstname should be between 2 and 20";

			return false;
		}
		if (!isNaN(x)) {
			document.getElementById("fname").innerHTML = "only characters are allowed in FirstName";
			return false;
		}

		//LASTNAME

		if (y == "") {
			document.getElementById("lname").innerHTML = "lastname cannot be empty";
			return false;
		}

		if (!isNaN(y)) {
			document.getElementById("lname").innerHTML = "only characters are allowed in LastName";
			return false;
		}

		//EMAILID
		if (e == "") {
			document.getElementById("cemail").innerHTML = "Email cannot be empty";
			return false;
		}
		if (e.indexOf('@') <= 0) {
			document.getElementById("cemail").innerHTML = "Invalid email id";
		}
		if ((e.charAt(e.length - 4) != '.') && (e.charAt(e.length - 3) != '.')) {
			document.getElementById("cemail").innerHTML = "Invalid Email id length";
		}
		//MOBILE
		if (m == "") {
			document.getElementById("mnumber").innerHTML = "Mobile number cannot be empty";
			return false;
		}
		if (isNaN(m)) {
			document.getElementById("mnumber").innerHTML = "Mobile number cannot be in characters";
			return false;
		}
		if (m.length != 10) {
			document.getElementById("mnumber").innerHTML = "Mobile number must be 10 digits only";
			return false;
		}
		//COMPANYNAME
		if (com == "") {
			document.getElementById("cname").innerHTML = "Company Name cannot be empty";
			return false;
		}
		//CITY
		var ci = document.forms["regForm"]["city"].value;
		if (ci == "") {
			document.getElementById("cit").innerHTML = "City Name cannot be empty";
			return false;
		}

	}
	function onButtonClick() {
		document.forms["edit"]["edit"].className = "show";
		document.getElementById("editprofile").className = "hide";
		document.forms["edit"]["firstname"].disabled = false;
		document.forms["edit"]["lastname"].disabled = false;
		document.forms["edit"]["companyemailid"].disabled = false;
		document.forms["edit"]["mobilenumber"].disabled = false;
		document.forms["edit"]["companyname"].disabled = false;
		document.forms["edit"]["city"].disabled = false;
	}
</script>
<style>
.inputField {
	pointer-events: none;
}

.hide {
	display: none;
}

.show {
	background-color: Cyan;
	display: block;
}
</style>
</head>
<body>
	<h1 style="text-align: center;">PROFILE</h1>

	<form:form id="edit" modelAttribute="user"
		action="updateProcess?companyMailId=${companyemailid}&Userid=${userid}"
		onsubmit="return validate()" method="post">
		<br>
		<br>
		<table align="center">

			<tr>
				<td><form:label path="firstname">Firstname</form:label></td>
				<td><form:input path="firstname" name="firstname"
						id="firstname" value="${firstname}" disabled="true" /><span
					id="fname" style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="lastname">Lastname</form:label></td>
				<td><form:input path="lastname" name="lastname" disabled="true"
						value="${lastname}" id="lastname" /><span id="lname"
					style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="companyemailid">Companyemailid</form:label></td>
				<td><form:input path="companyemailid" name="companyemailid"
						value="${companyemailid}" id="companyemailid" disabled="true" /><span
					id="cemail" style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="mobilenumber">Mobilenumber</form:label></td>
				<td><form:input path="mobilenumber" name="mobilenumber"
						value="${mobilenumber}" id="mobilenumber" disabled="true" /><span
					id="mnumber" style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="companyname">Companyname</form:label></td>
				<td><form:input path="companyname" name="companyname"
						id="companyname" value="${companyname}" disabled="true" /><span
					id="cname" style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="city">City</form:label></td>
				<td><form:input path="city" name="city" disabled="true"
						id="city" value="${city}" /><span id="cit"
					style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td></td>
				<td><br> <form:button id="edit" name="edit" class="hide">Submit</form:button></td>
			</tr>

			<tr></tr>
			<tr>
				<td></td>

			</tr>
		</table>

	</form:form>
	<center>
		<br> <input type="button" id="editprofile" name="answer"
			value="Edit Profile" class="show" onclick="onButtonClick()" />
	</center>
</body>
</html>