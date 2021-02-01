<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<script>
	function regform() {
		//FIRSTNAME

		var x = document.forms["regForm"]["firstname"].value;
		var y = document.forms["regForm"]["lastname"].value;
		var p = document.forms["regForm"]["password"].value;
		var cp = document.forms["regForm"]["confirmpassword"].value;
		var e = document.forms["regForm"]["emailid"].value;
		var m = document.forms["regForm"]["mobilenumber"].value;
		var ci = document.forms["regForm"]["city"].value;

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

		//PASSWORD
		if (p == "") {
			document.getElementById("pwd").innerHTML = "Password Cannot Be Empty";
			return false;
		}
		if ((p.length <= 8) || (p.length > 20)) {
			document.getElementById("pwd").innerHTML = "Password should be between 8 and 20";
			return false;
		}
		//CONFIRMPASSWORD

		if (p != cp) {
			document.getElementById("cpwd").innerHTML = "Password didnt match";
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
		//CITY
		var ci = document.forms["regForm"]["city"].value;
		if (ci == "") {
			document.getElementById("cit").innerHTML = "City Name cannot be empty";
			return false;
		}

	}
	$(document).ready(function() {
		var len = document.getElementById("len").value;
		var length = parseInt(len);
		;
		var list = new Array();
		var i;
		for (i = 0; i < length; i++) {
			var x = i;
			x = x.toString();
			var y = document.getElementById(x).value;
			list.push(y);
		}
		var finallist = list;
		$("#city").autocomplete({
			source : finallist
		});
	});
</script>
<style>
h5 {
	color: red;
}
</style>
</head>
<body>
	<c:set var="len" value="${listCity}" />
	<input type="hidden" id="len" name="len" value="${fn:length(len)}">
	<c:forEach var="str" items="${listCity}" varStatus="status">
		<input type="hidden" id="${status.index}" name="${status.index}"
			value="${str}" />
	</c:forEach>
	<h1 style="text-align: center;">REGISTRATION FORM</h1>
	<form:form id="regForm" modelAttribute="candidate"
		action="candidateregisterProcess" onsubmit="return regform()"
		method="post">

		<br>

		<br>
		<center>
			<br>
			<h5>${hello}</h5>
			<br>
			<table>
				<tr>
					<td><form:label path="firstname">First Name</form:label></td>
					<td><form:input path="firstname" name="firstname"
							id="firstname" /><span id="fname"
						style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="lastname">Last Name</form:label></td>
					<td><form:input path="lastname" name="lastname" id="lastname" /><span
						id="lname" style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="emailid">Email-Id</form:label></td>
					<td><form:input path="emailid" name="emailid" id="emailid" /><span
						id="cemail" style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="mobilenumber">Mobile Number</form:label></td>
					<td><form:input path="mobilenumber" name="mobilenumber"
							id="mobilenumber" /><span id="mnumber"
						style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="password">Password</form:label></td>
					<td><form:password path="password" name="password"
							id="password" /><span id="pwd"
						style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="confirmpassword">Confirm Password</form:label></td>
					<td><form:password path="confirmpassword"
							name="confirmpassword" id="confirmpassword" /><span id="cpwd"
						style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="city">City</form:label></td>
					<td><form:input path="city" name="city" id="city" /> <span
						id="cit" style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td></td>
					<td><br> <form:button id="register" name="register"
							style="background-color:Cyan">Register</form:button></td>
				</tr>
				<tr></tr>
				<tr>
					<td></td>

				</tr>
			</table>
		</center>
	</form:form>
</body>
</html>