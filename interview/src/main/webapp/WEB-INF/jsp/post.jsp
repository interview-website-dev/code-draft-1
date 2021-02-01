<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	function postform() {
		//FIRSTNAME

		var po = document.forms["postform"]["positionname"].value;
		var d = document.forms["postform"]["date"].value;
		var lo = document.forms["postform"]["location"].value;
		var ad = document.forms["postform"]["address"].value;
		var bq = document.forms["postform"]["qualification"].value;
		var sa = document.forms["postform"]["salary"].value;
		var np = document.forms["postform"]["noofposition"].value;

		// Position Name
		if (po == "") {
			document.getElementById("pname").innerHTML = "Position Name cannot be empty";
			return false;
		}
		//Date of Interview
		if (d == "") {
			document.getElementById("dat").innerHTML = "Date Of Interview cannot be empty";
			return false;
		}
		//Interview Location
		if (lo == "") {
			document.getElementById("loc").innerHTML = "Interview Location Cannot Be Empty";
			return false;
		}
		//address
		if (ad == "") {
			document.getElementById("add").innerHTML = "Address didnt match";
			return false;
		}
		//Basic Qualification
		if (bq == "") {
			document.getElementById("qual").innerHTML = "Basic Qualification cannot be empty";
			return false;
		}
		//Salary
		if (sa == "") {
			document.getElementById("sal").innerHTML = "Salary number cannot be empty";
			return false;
		}
		if (isNaN(sa)) {
			document.getElementById("sal").innerHTML = "Salary cannot be in characters";
			return false;
		}
		//No Of Position
		if (np == "") {
			document.getElementById("nopos").innerHTML = "No Of Position cannot be empty";
			return false;
		}
	}
</script>


</head>

<body>


	<h1 style="text-align: center;">Post Job</h1>
	<form:form id="postform" modelAttribute="post"
		action="postProcess?firstname=${firstname}&companyMailId=${companyemailid}"
		onsubmit="return postform()" method="post">

		<br>
		<br>
		<center>
			<form:input path="userid" name="userid" type="hidden" id="userid"
				value="${userid}" />
			<form:input path="positionid" name="positionid" type="hidden"
				id="positionid" value="${newpositionid}" />
			<table>
				<tr>
					<td><form:label path="positionname">Position Name</form:label></td>
					<td><form:input path="positionname" name="positionname"
							id="positionname" /><span id="pname"
						style="font-style: italic; color: red;"></span></td>
				</tr>

				<tr>
					<td><form:label path="date">Date Of Interview</form:label></td>
					<td><form:input type="date" path="date" name="date" id="date" /><span
						id="dat" style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="location">Interview Location</form:label></td>
					<td><form:input path="location" name="location" id="location" /><span
						id="loc" style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="address">Address</form:label></td>
					<td><textarea id="address" name="address" rows="4" cols="50"></textarea><span
						id="add" style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="qualification">Basic Qualification</form:label></td>
					<td><form:input path="qualification" name="qualification"
							id="qualification" /><span id="qual"
						style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="salary">Salary</form:label></td>
					<td><form:input path="salary" name="salary" id="salary" /><span
						id="sal" style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td><form:label path="noofposition">No.Of.Postions</form:label></td>
					<td><form:input path="noofposition" name="noofposition"
							id="noofposition" /><span id="nopos"
						style="font-style: italic; color: red;"></span></td>
				</tr>
				<tr>
					<td></td>
					<td><br> <form:button id="next" name="next"
							style="background-color:Cyan">Next</form:button></td>
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