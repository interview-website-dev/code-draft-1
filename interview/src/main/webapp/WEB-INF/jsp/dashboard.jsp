<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers thead {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: blue;
	color: white;
}

.scrolldown {
	overflow: scroll;
	height: 200px;
}

.message {
	color: red;
	font-size: 22px;
}
</style>
</head>
<body>

	<center>
		<div id="hideDiv" class="message">${message}</div>
	</center>

	<c:set var="lensetter" value="${postlist}" />
	<c:set var="len" value="${fn:length(lensetter)}" />
	<c:if test="${len == 0}">
		<h2>You do not have posted any job. Would you like to post a new
			Job</h2>
	</c:if>
	<center>
		<a
			href="post?userid=${userid}&firstname=${firstname}&companyMailId=${companyemailid}"><button
				style="background-color: Cyan">Post a job</button></a>
	</center>
	<br>
	<br>
	<br>

	<c:if test="${len > 0}">

		<table id="customers" class="scrolldown">
			<thead>
				<tr>
					<td>Post Name</td>
					<td>Walk in date</td>
					<td>Posted date</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${postlist}" varStatus="status">
					<tr>
						<td><a href="userviewpostdetails?positionid=${post.getPositionid()}&companyMailId=${companyemailid}&firstname=${firstname}">${post.getPositionname()}</a></td>
						<td>${post.getDate()}</td>
						<td>${post.getRegisteredtime()}</td>
						<td><a
							href="viewapplication?Positionid=${post.getPositionid()}&Userid=${userid}&firstname=${firstname}&companyMailId=${companyemailid}">View
								application</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</body>
</html>
