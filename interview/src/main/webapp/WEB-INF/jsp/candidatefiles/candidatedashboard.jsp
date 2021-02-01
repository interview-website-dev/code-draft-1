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
.dropbtn {
	color: blue;
	font-size: 16px;
	border: none;
}

.message {
	color: red;
	font-size: 22px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: relatives;
	background-color: #f1f1f1;
	min-width: 50px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: blue;
	font-size: 12px;
	padding-top: 10px;
	padding-bottom: 10px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	
}

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
</style>
</head>
<body>
	<center>
		<div id="hideDiv" class="message">${message}</div>
	</center>

	<br>
	<br>
	<br>
	<br>
	<table id="customers">
		<thead>
			<tr>

				<td>Company Name</td>
				<td>Post Name</td>
				<td>Walk in date</td>
				<td>Posted date</td>
				<td>Status</td>
			</tr>
		</thead>
		<c:forEach var="post" items="${postlist}" varStatus="status">
			<tr>
				<td>${post.getCompanyname()}</td>
				<td><a
					href="postdetails?positionid=${post.getPositionid()}&candidateid=${candidateid}&firstname=${firstname}">${post.getPositionname()}</a></td>
				<td>${post.getDate()}</td>
				<td>${post.getRegisteredtime()}</td>
				<td><c:set var="testpositionid" value="${post.getPositionid()}" />
					<c:forEach var="appliedpost" items="${appliedpostids}">

						<c:if test="${appliedpost eq testpositionid}">
							<a
								href="postdetails?positionid=${post.getPositionid()}&candidateid=${candidateid}&firstname=${firstname}">Applied</a>
						</c:if>



					</c:forEach></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
