
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Insert title here</title>
<style>
input[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	border: none;
	background-color: rgba(173, 216, 230, 0.0)
}

textarea {
	background-color: rgba(173, 216, 230, 0.0)
}

input[type=text]:focus {
	border: none;
}

legend {
	background-color: rgba(30, 139, 195, 1);
	color: white;
	padding: 5px 10px;
	border: 2px solid grey;
	width: 300px;
	margin: 0 auto;
}

fieldset {
	background-color: rgba(173, 216, 230, 0.5);
	max-width: 1000px;
	padding: 16px;
}
</style>
</head>
<body>

	<form:form modelAttribute="SkillForm" method="post">
		<INPUT type="hidden" name="Positionname" value="${Positionname}" />
		<INPUT type="hidden" name="Date" value="${Date}" />
		<INPUT type="hidden" name="Location" value="${Location}" />
		<INPUT type="hidden" name="Address" value="${Address}" />
		<INPUT type="hidden" name="Qualification" value="${Qualification}" />
		<INPUT type="hidden" name="Salary" value="${Salary}" />
		<INPUT type="hidden" name="Noofposition" value="${Noofposition}" />
		<INPUT type="hidden" name="Userid" value="${Userid}" />
		<INPUT type="hidden" name="Positionid" value="${Positionid}" />
		<br>
		<br>

		<center>
			<form:input path="userid" name="userid" type="hidden" id="userid"
				disabled="true" value="${Userid}" />
			<fieldset>
				<legend>Summary</legend>

				<table>
					<tr>
						<td><form:label path="positionname">Position Name</form:label></td>
						<td><form:input path="positionname" name="positionname"
								id="positionname" disabled="true" value="${Positionname}" /><span
							id="pname" style="font-style: italic; color: red;"></span></td>
					</tr>
					<tr>
						<td><form:input path="userid" name="userid" type="text"
								id="userid" value="${Userid}" /></td>
					</tr>
					<tr>
						<td><form:label path="date">Date Of Interview</form:label></td>
						<td><form:input path="date" name="date" id="date"
								disabled="true" value="${Date}" /><span id="dat"
							style="font-style: italic; color: red;"></span></td>
					</tr>
					<tr>
						<td><form:label path="location">Interview Location</form:label></td>
						<td><form:input path="location" name="location" id="location"
								disabled="true" value="${Location}" /><span id="loc"
							style="font-style: italic; color: red;"></span></td>
					</tr>
					<tr>
						<td><form:label path="address">Address</form:label></td>
						<td><form:input id="address" name="address" path="address"
								disabled="true" value="${Address}" /><span id="add"
							style="font-style: italic; color: red;"></span></td>
					</tr>
					<tr>
						<td><form:label path="qualification">Basic Qualification</form:label></td>
						<td><form:input path="qualification" name="qualification"
								id="qualification" disabled="true" value="${Qualification}" /><span
							id="qual" style="font-style: italic; color: red;"></span></td>
					</tr>
					<tr>
						<td><form:label path="salary">Salary</form:label></td>
						<td><form:input path="salary" name="salary" id="salary"
								disabled="true" value="${Salary}" /><span id="sal"
							style="font-style: italic; color: red;"></span></td>
					</tr>
					<tr>
						<td><form:label path="noofposition">No.Of.Postions</form:label></td>
						<td><form:input path="noofposition" name="noofposition"
								id="noofposition" disabled="true" value="${Noofposition}" /><span
							id="nopos" style="font-style: italic; color: red;"></span></td>
					</tr>

					<tr>
						<td></td>
						<td><br>
						<td><br></td>

					</tr>
					<tr></tr>
					<tr>
						<td></td>

					</tr>

				</table>

				<legend>Required Skills</legend>
				<br>
				<br>
				<table class="table table-striped table-hover"
					style="background-color: rgba(173, 216, 230, 0.5); text-align: center; width: 350px"
					id="item-table">

					<tr>

						<th style="text-align: center">Skill Name</th>
						<th style="text-align: center">Proficiency Level</th>

					</tr>
					<c:forEach var="skill" items="${skills}" varStatus="status">
						<tr>
							<td><input type="hidden"
								name="skills[${status.index}].Positionid"
								value="${skill.getPositionid()}" /> <input type="text"
								name="skills[${status.index}].Skillname"
								value="${skill.getSkillname()}" /></td>
							<td><input type="text"
								name="skills[${status.index}].Proficiencylevel"
								value="${skill.getProficiencylevel()}" /></td>
						</tr>
					</c:forEach>
				</table>
			</fieldset>
			<form:button id="next" name="edit"
				formaction="EditProcess?firstname=${firstname}&companyMailId=${companyemailid}"
				style="background-color:Cyan">Edit</form:button>
			&nbsp;&nbsp;&nbsp;
			<form:button id="save" name="Save" style="background-color:Cyan"
				formaction="SummaryProcess">Save</form:button>
		</center>
	</form:form>

</body>

</html>