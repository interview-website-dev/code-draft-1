<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="spring"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		setTimeout(function() {
			$("#hideDiv").fadeOut(1500);
		}, 3000)

	})
</script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#pendingapplications {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
	background-color: rgba(173, 216, 230, 1);
}

#pendingapplications td, #pendingapplications th {
	padding: 8px;
	text-align: center;
}

#applicationstatus {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#applicationstatus td, #applicationstatus th {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

hr.appdivider {
	border: 3px solid blue;
	border-radius: 1px;
}

.message {
	color: red;
	font-size: 22px;
}
</style>
</head>
<body>
	<h2 style="text-align: center;">Applications</h2>
	<br>
	<table id="applicationstatus">
		<tr>
			<td style="background-color: rgba(173, 216, 230, 1)">Received
				Applications</td>
			<td style="background-color: blue; color: white">${receivedCount}</td>
			<td style="background-color: rgba(173, 216, 230, 1)">Shortlisted
				Applications</td>
			<td style="background-color: blue; color: white">${shortlistedCount}</td>
			<td style="background-color: rgba(173, 216, 230, 1)">Rejected
				Applications</td>
			<td style="background-color: blue; color: white">${rejectedCount}</td>
			<td style="background-color: rgba(173, 216, 230, 1)">Pending
				Applications</td>
			<td style="background-color: blue; color: white">${pendingCount}</td>
		</tr>
	</table>
	<br>
	<center>
		<div id="hideDiv" class="message">${message}</div>
	</center>
	<br>
	<c:forEach var="application" items="${pendingapplications}"
		varStatus="pendingappcount">
		<hr class="appdivider">
		<table id="pendingapplications">
			<tr>
				<td>${application.getFirstname()}&nbsp;&nbsp;${application.getLastname()}</td>
				<td></td>
				<td><c:set var="degreedeterminer" value="" />
					<c:set var="pgname" value="${application.getPgspecialization()}" />
					<c:choose>
						<c:when test="${pgname eq degreedeterminer}">
				${application.getUgspecialization()}
				</c:when>
						<c:otherwise>
				
				${application.getPgspecialization()}
				</c:otherwise>
					</c:choose></td>
				<td><c:choose>
						<c:when test="${pgname eq degreedeterminer}">
				${application.getUgpassedyear()}
				</c:when>
						<c:otherwise>
				
				${application.getPgpassedyear()}
				</c:otherwise>
					</c:choose></td>
				<td><c:choose>
						<c:when test="${pgname eq degreedeterminer}">
				${application.getUgcity()}
				</c:when>
						<c:otherwise>
				
				${application.getPgcity()}
				</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td>Skills</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Skill Name</td>
				<td>Proficiency Level</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<c:set var="appcanid" value="${application.getCandidateid()}" />
			<c:forEach var="skill" items="${candidateskills}">
				<c:set var="skillcanid" value="${skill.getCandidateid()}" />
				<c:if test="${skillcanid eq appcanid}">
					<tr>
						<td>${skill.getSkillname()}</td>
						<td>${skill.getProficiencylevel()}</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<td><a
					href="viewapplicationdetails?Positionid=${Positionid}&Userid=${Userid}&Candidateid=${application.getCandidateid()}&firstname=${firstname}&companyMailId=${companyemailid}"><input
						type="button" value="View Details"
						style="background-color: blue; border: none; color: white; padding: 5px 16px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;"></a></td>
				<td><a
					href="shortlist?Positionid=${Positionid}&Userid=${Userid}&shortlistedcandidateid=${application.getCandidateid()}&firstname=${firstname}&companyMailId=${companyemailid}"><input
						type="button" value="Short list"
						style="background-color: #4CAF50; border: none; color: white; padding: 5px 16px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;"></a></td>
				<td><a
					href="reject?Positionid=${Positionid}&Userid=${Userid}&rejectedcandidateid=${application.getCandidateid()}&firstname=${firstname}&companyMailId=${companyemailid}"><input
						type="button" value="Reject"
						style="background-color: red; border: none; color: white; padding: 5px 16px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;"></a></td>

				<td></td>
				<td></td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>