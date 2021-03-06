<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Profile</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/script.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		var u = document.forms["edit"]["ugname"].value;
		if (u == "null") {
			document.forms["edit"]["ugname"].value = "";
		}
		document.getElementById("skillsfieldset").disabled = true;
	});
	function validate() {
		//FIRSTNAME

		var x = document.forms["edit"]["firstname"].value;
		var y = document.forms["edit"]["lastname"].value;
		var e = document.forms["edit"]["emailid"].value;
		var m = document.forms["edit"]["mobilenumber"].value;

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
		//CITY
		var ci = document.forms["edit"]["city"].value;
		if (ci == "") {
			document.getElementById("cit").innerHTML = "City Name cannot be empty";
			return false;
		}
		var skillname = document.getElementsByClassName("skillnameclass");
		var j;
		for (j = 0; j < skillname.length; j++) {
			if (skillname[j].value === "select a skill") {
				skillname[j].style.borderColor = "red";
				return false;
			}
		}
		var i;
		var valuesAlreadySeen = new Array();

		for (i = 0; i < skillname.length; i++) {
			var value = skillname[i].value;
			if (valuesAlreadySeen.indexOf(value) !== -1) {
				alert("enter unique values");
				return false;
			}
			valuesAlreadySeen.push(value);
		}

		var z = document.getElementsByClassName("proficiencylevelclass");
		var k;
		for (k = 0; k < z.length; k++) {
			if (z[k].value === "select a level") {
				z[k].style.borderColor = "red";
				return false;
			}
		}

	}

	function onButtonClick() {
		document.forms["edit"]["edit"].className = "show";
		document.getElementById("editprofile").className = "hide";
		document.forms["edit"]["firstname"].disabled = false;
		document.forms["edit"]["lastname"].disabled = false;
		document.forms["edit"]["emailid"].disabled = false;
		document.forms["edit"]["mobilenumber"].disabled = false;
		document.forms["edit"]["city"].disabled = false;
		document.forms["edit"]["schname"].disabled = false;
		document.forms["edit"]["schcity"].disabled = false;
		document.forms["edit"]["schpassedyear"].disabled = false;
		document.forms["edit"]["schmarks"].disabled = false;
		document.forms["edit"]["ugname"].disabled = false;
		document.forms["edit"]["ugcity"].disabled = false;
		document.forms["edit"]["ugspecialization"].disabled = false;
		document.forms["edit"]["ugpassedyear"].disabled = false;
		document.forms["edit"]["ugmarks"].disabled = false;
		document.forms["edit"]["pgname"].disabled = false;
		document.forms["edit"]["pgcity"].disabled = false;
		document.forms["edit"]["pgspecialization"].disabled = false;
		document.forms["edit"]["pgpassedyear"].disabled = false;
		document.forms["edit"]["pgmarks"].disabled = false;
		document.getElementById("skillsfieldset").disabled = false;
	}
</script>
<script>
	function addRow(tableID) {

		var table = document.getElementById(tableID);

		var rowCount = table.rows.length;
		var i = rowCount - 2;
		var row = table.insertRow(rowCount);

		var cell2 = row.insertCell(0);
		/* var selectList = table.rows[2].querySelector('select'); */
		var selectList = $('select.form-control');
		var element2 = selectList.clone();
		element2.removeAttr("name");
		element2.attr('name', 'candidateskills[' + i + '].Skillname');
		element2.removeAttr("class");
		element2.attr('class', 'skillnameclass');
		element2.appendTo(cell2);
		var element4 = document.createElement("input");
		element4.type = "hidden";
		element4.name = "candidateskills[" + i + "].Candidateid";
		element4.value = "${candidateid}";
		cell2.appendChild(element4);
		var cell3 = row.insertCell(1);
		var selectList = $('select.form-control1');
		var element3 = selectList.clone();
		element3.removeAttr("name");
		element3.attr('name', 'candidateskills[' + i + '].Proficiencylevel');
		element3.removeAttr("class");
		element3.attr('class', 'proficiencylevelclass');
		element3.appendTo(cell3);

	}
</script>
<script>
	function deleteRow(tableID) {

		var table = document.getElementById(tableID);
		var rowCount = table.rows.length;

		if (rowCount <= 3) {
			alert("Cannot delete all the rows.");

		} else {
			table.deleteRow(rowCount - 1);
		}
		;

	}
</script>


<style>
legend {
	background-color: rgba(30, 139, 195, 1);
	color: white;
	padding: 5px 10px;
	border: 2px solid grey;
	width: 300px;
	margin: 0 auto;
}

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

fieldset {
	background-color: rgba(173, 216, 230, 0.5);
	max-width: 1025px;
	padding: 16px;
}
</style>
<style>
//
Remove the style tags while pasting this code into '.css ' file

#frm_data th, tr, td {
	background: skyblue;
	color: darkblue;
	text-align: center;
	background-color: skyblue;
	border-radius: 3px;
	padding: 0px;
}

#frm_data th {
	padding: 5px;
}

input {
	padding: 5px;
}

#sub_button {
	background-color: skyblue;
	border-radius: 5px;
}

input[type=checkbox] {
	padding: 5px;
	position: relative;
	cursor: pointer;
	position: relative;
}

input[type=checkbox]:before {
	content: "";
	display: block;
	position: absolute;
	width: 16px;
	height: 16px;
	top: 0;
	left: 0;
	border: 2px solid #555555;
	border-radius: 3px;
	background-color: white;
}

input[type=checkbox]:checked:after {
	content: "";
	display: block;
	width: 5px;
	height: 10px;
	border: solid black;
	border-width: 0 2px 2px 0;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	position: absolute;
	top: 2px;
	left: 6px;
}

select {
	display: block;
	font-size: 16px;
	font-family: sans-serif;
	font-weight: 700;
	color: #444;
	line-height: 1.3;
	padding: .6em 1.4em .5em .8em;
	width: 350px;
	max-width: 100%;
	/* useful when width is set to anything other than 100% */
	box-sizing: border-box;
	margin: 0;
	border: 1px solid #aaa;
	box-shadow: 0 1px 0 1px rgba(0, 0, 0, .04);
	border-radius: .5em;
	background-color: #fff;
}
</style>
</head>
<body>
	<h1 style="text-align: center;">PROFILE</h1>

	<form:form id="edit" modelAttribute="CandidateSkillForm"
		action="candidateProfileProcess?CandidateId=${candidateid}"
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
				<td><form:label path="emailid">Companyemailid</form:label></td>
				<td><form:input path="emailid" name="emailid"
						value="${emailid}" id="emailid" disabled="true" /><span
					id="cemail" style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="mobilenumber">Mobilenumber</form:label></td>
				<td><form:input path="mobilenumber" name="mobilenumber"
						value="${mobilenumber}" id="mobilenumber" disabled="true" /><span
					id="mnumber" style="font-style: italic; color: red;"></span></td>
			</tr>
			<tr>
				<td><form:label path="city">City</form:label></td>
				<td><form:input path="city" name="city" disabled="true"
						id="city" value="${city}" /><span id="cit"
					style="font-style: italic; color: red;"></span></td>
			</tr>
		</table>
		<br>
		<br>
		<center>
			<fieldset>
				<legend>School Details</legend>
				<table>
					<tr>
						<td>
						<td>&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td><form:label path="schname">Name</form:label></td>
						<td><form:input path="schname" name="schname" disabled="true"
								id="schname" value="${candidate.getSchname()}" /><span id="s"
							style="font-style: italic; color: red;"></span></td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td><form:label path="schcity">City</form:label></td>
						<td><form:input path="schcity" name="schcity" disabled="true"
								id="schcity" value="${candidate.getSchcity()}" /><span id="sc"
							style="font-style: italic; color: red;"></span></td>

					</tr>
					<tr>
						<td>
						<td>&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td><form:label path="schpassedyear">Passed Year</form:label></td>
						<td><form:input path="schpassedyear" name="schpassedyear"
								disabled="true" id="schpassedyear"
								value="${candidate.getSchpassedyear()}" /><span id="sch"
							style="font-style: italic; color: red;"></span></td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td><form:label path="schmarks">Marks</form:label></td>
						<td><form:input path="schmarks" name="schmarks"
								disabled="true" id="schmarks" value="${candidate.getSchmarks()}" /><span
							id="schm" style="font-style: italic; color: red;"></span>&nbsp;&nbsp;
							in %</td>
					</tr>
					<tr>
						<td>
						<td>&nbsp;&nbsp;&nbsp;</td>
					</tr>
				</table>
			</fieldset>
		</center>
		<br>
		<br>

		<center>
			<fieldset>



				<legend>UG Details</legend>

				<br>
				<table>

					<tr>
						<td><form:label path="ugname">Name</form:label></td>
						<td><form:input path="ugname" name="ugname" disabled="true"
								id="ugname" value="${candidate.getUgname()}" /><span id="u"
							style="font-style: italic; color: red;"></span></td>
						<td>&nbsp;&nbsp;&nbsp;</td>

						<td><form:label path="ugcity">City</form:label></td>
						<td><form:input path="ugcity" name="ugcity" disabled="true"
								id="ugcity" value="${candidate.getUgcity()}" /><span id="ug"
							style="font-style: italic; color: red;"></span></td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td><form:label path="ugspecialization">Specialization</form:label></td>
						<td><form:input path="ugspecialization"
								name="ugspecialization" disabled="true" id="ugspecialization"
								value="${candidate.getUgspecialization()}" /><span id="ugs"
							style="font-style: italic; color: red;"></span></td>




					</tr>
				</table>
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td><form:label path="ugpassedyear">Passed Year</form:label></td>
						<td><form:input path="ugpassedyear" name="ugpassedyear"
								disabled="true" id="ugpassedyear"
								value="${candidate.getUgpassedyear()}" /><span id="ugp"
							style="font-style: italic; color: red;"></span></td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td><form:label path="ugmarks">Marks</form:label></td>
						<td><form:input path="ugmarks" name="ugmarks" disabled="true"
								id="ugmarks" value="${candidate.getUgmarks()}" /><span id="ugm"
							style="font-style: italic; color: red;"></span>&nbsp;&nbsp;&nbsp;in
							%</td>

					</tr>
					<tr>
						<td>
						<td>&nbsp;&nbsp;&nbsp;</td>
					</tr>
				</table>

			</fieldset>
		</center>
		<br>
		<br>
		<center>
			<fieldset>


				<legend>PG Details</legend>
				<br>
				<table>
					<tr>
						<td>
						<td>&nbsp;&nbsp;&nbsp;</td>
					</tr>

					<tr>
						<td><form:label path="pgname">Name</form:label></td>
						<td><form:input path="pgname" name="pgname" disabled="true"
								id="pgname" value="${candidate.getPgname()}" /> <span id="pgn"
							style="font-style: italic; color: red;"></span></td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td><form:label path="pgcity">City</form:label></td>
						<td><form:input path="pgcity" name="pgcity" disabled="true"
								id="pgcity" value="${candidate.getPgcity()}" /><span id="pgc"
							style="font-style: italic; color: red;"></span></td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td><form:label path="pgspecialization">Specialization</form:label></td>
						<td><form:input path="pgspecialization"
								name="pgspecialization" disabled="true" id="pgspecialization"
								value="${candidate.getPgspecialization()}" /><span id="pgs"
							style="font-style: italic; color: red;"></span></td>
					</tr>
				</table>
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;
						<td></td>
					</tr>
					<tr>
						<td><form:label path="pgpassedyear">Passed Year</form:label></td>
						<td><form:input path="pgpassedyear" name="pgpassedyear"
								disabled="true" id="pgpassedyear"
								value="${candidate.getPgpassedyear()}" /><span id="pgp"
							style="font-style: italic; color: red;"></span></td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td><form:label path="pgmarks">Marks</form:label></td>
						<td><form:input path="pgmarks" name="pgmarks" disabled="true"
								id="pgmarks" value="${candidate.getPgmarks()}" /><span id="pgm"
							style="font-style: italic; color: red;"></span>&nbsp;&nbsp;&nbsp;in
							%</td>
					</tr>
					<tr>
						<td>
						<td>&nbsp;&nbsp;&nbsp;</td>
					</tr>


				</table>
			</fieldset>
			<br> <br>
			<fieldset id="skillsfieldset">
				<legend>Skills</legend>
				<table class="table table-striped table-hover"
					style="text-align: center;" id="item-table">
					<tr>
						<td></td>
						<td><div style="display: none;">
								<select name="sample1" class="form-control1">
									<option value="select a level">select a level</option>
									<c:forEach var="plitem1" items="${proficiencyleveldata}">

										<option value="${plitem1}">${plitem1}</option>

									</c:forEach>
								</select>
							</div></td>
						<td><div style="display: none;">

								<select name="sample2" class="form-control">

									<option value="select a skill">select a skill</option>
									<c:forEach var="item1" items="${Skilllist}">
										<option value="${item1}">${item1}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><input type="button" value="Add Row"
							style="background-color: #4CAF50; border: none; color: white; padding: 5px 16px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;"
							id="btn-addrow" onclick="addRow('item-table');"
							class="btn-success form-control" /></td>
						<td><input type="button" value="Remove"
							style="background-color: red; border: none; color: white; padding: 5px 16px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;"
							onclick="deleteRow('item-table');"
							class="form-control btn-danger" /></td>
					</tr>
					<tr>
						<th style="text-align: center">Skill Name</th>
						<th style="text-align: center">Proficiency Level</th>

					</tr>


					<c:if test="${validator eq 'true'}">
						<tr>
							<td> <input
									name="candidateskills[0].Candidateid"
									type="hidden" value="${candidateid}" /> <select name="candidateskills[0].Skillname"
								class="skillnameclass">
									<option value="select a skill">select a skill</option>

									<c:forEach var="item2" items="${Skilllist}">
										<option value="${item2}">${item2}</option>
									</c:forEach>
							</select></td>
							<td><select name="candidateskills[0].Proficiencylevel"
								class="proficiencylevelclass">
									<option value="select a level">select a level</option>

									<c:forEach var="plitem2" items="${proficiencyleveldata}">

										<option value="${plitem2}">${plitem2}</option>

									</c:forEach>
							</select></td>
						</tr>
					</c:if>
					<c:if test="${validator ne 'true'}">

						<c:forEach var="skill" items="${candidateSkills}"
							varStatus="skillstatus" >
							<tr>
								<td class="col-md-4"><input
									name="candidateskills[${skillstatus.index}].Candidateid"
									type="hidden" value="${skill.getCandidateid()}" /> <select
									name="candidateskills[${skillstatus.index}].Skillname" class="skillnameclass">
										<option value="${skill.getSkillname()}">${skill.getSkillname()}</option>
										<c:set var="skilln" value="${skill.getSkillname()}" />
										<c:forEach var="item" items="${Skilllist}">
											<c:if test="${item ne skilln}">
												<option value="${item}">${item}</option>
											</c:if>
										</c:forEach>
								</select></td>

								<td class="col-md-4"><select
									name="candidateskills[${skillstatus.index}].Proficiencylevel" class="proficiencylevelclass">
										<option value="${skill.getProficiencylevel()}">${skill.getProficiencylevel()}</option>
										<c:set var="skillp" value="${skill.getProficiencylevel()}" />
										<c:forEach var="plitem" items="${proficiencyleveldata}">
											<c:if test="${plitem ne skillp}">
												<option value="${plitem}">${plitem}</option>
											</c:if>
										</c:forEach>
								</select></td>

							</tr>
						</c:forEach>
					</c:if>

				</table>
			</fieldset>
		</center>
		<center>
			<table>
				<tr>
					<td></td>

					<td><br> <form:button id="edit" name="edit" class="hide">Save</form:button>

					</td>
				</tr>

				<tr></tr>
				<tr>
					<td></td>

				</tr>
			</table>
		</center>
	</form:form>
	<center>
		<br> <input type="button" id="editprofile" name="answer"
			value="Edit Profile" class="show" onclick="onButtonClick()" />
	</center>
</body>
</html>