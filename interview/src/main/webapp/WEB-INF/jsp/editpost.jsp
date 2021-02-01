<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

	<h1 style="text-align: center;">Edit Post Job</h1>
	<form:form id="postform" modelAttribute="SkillForm"
		action="editpost?firstname=${firstname}&companyMailId=${companyemailid}"
		onsubmit="return validate()" method="post">
		<INPUT type="hidden" name="Userid" value="${Userid}" />


		<br>
		<br>

		<table align="center">
			<tr>
				<td><form:label path="positionname">Position Name</form:label></td>
				<td><form:input path="positionname" name="positionname"
						id="positionname" value="${Positionname}" /><span id="pname"
					style="font-style: italic; color: red;"></span></td>
			</tr>

			<tr>
				<td><form:label path="date">Date Of Interview</form:label></td>
				<td><form:input type="date" path="date" name="date" id="date"
						value="${Date}" /><span id="dat"
					style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="location">Interview Location</form:label></td>
				<td><form:input path="location" name="location" id="location"
						value="${Location}" /><span id="loc"
					style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="address">Address</form:label></td>
				<td><form:textarea id="address" path="address" name="address"
						rows="4" cols="50" value="${Address}" /><span id="add"
					style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="qualification">Basic Qualification</form:label></td>
				<td><form:input path="qualification" name="qualification"
						id="qualification" value="${Qualification}" /><span id="qual"
					style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="salary">Salary</form:label></td>
				<td><form:input path="salary" name="salary" id="salary"
						value="${Salary}" /><span id="sal"
					style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="noofposition">No.Of.Postions</form:label></td>
				<td><form:input path="noofposition" name="noofposition"
						id="noofposition" value="${Noofposition}" /><span id="nopos"
					style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td></td>
				<td><br> <form:button id="next" name="next"
						style="background-color:Cyan">Next</form:button>
			</tr>
			<tr></tr>
			<tr>
				<td></td>

			</tr>
		</table>
		<INPUT type="hidden" name="Positionid" value="${Positionid}" />
		<table class="table table-striped table-hover"
			style="visibility: hidden"
			style="background-color:rgba(173, 216, 230, 0.5); text-align: center;width:350px"
			id="item-table">

			<tr>

				<th style="text-align: center">Skill Name</th>
				<th style="text-align: center">Proficiency Level</th>

			</tr>
			<c:forEach var="skill" items="${skills}" varStatus="status">
				<tr>
					<td><input type="hidden"
						name="skills[${status.index}].Positionid"
						value="${skill.getPositionid()}" /> <input type="hidden"
						name="skills[${status.index}].Skillname"
						value="${skill.getSkillname()}" /></td>
					<td><input type="hidden"
						name="skills[${status.index}].Proficiencylevel"
						value="${skill.getProficiencylevel()}" /></td>
				</tr>
			</c:forEach>
		</table>
	</form:form>

</body>

</html>