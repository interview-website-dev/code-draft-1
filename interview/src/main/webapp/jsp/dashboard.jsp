<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
</head>
<body>
<%-- <h3 align="right"><a href ="jsp/home.jsp">Back</a></h3>
<h2 align="center">${headerMessage}</h2> --%>
<h3 align="center">You Have Registered With The Following Info</h3>
<table align="center" border="5px">

<tr>
<td>Firstname</td>
<td>${firstname}</td>
</tr>

<tr>
<td>Lastname</td>
<td>${lastname}</td>
</tr>

<tr>
<td>Company email id</td>
<td>${companyemailid}</td>
</tr>

<tr>
<td>Mobile Number</td>
<td>${mobilenumber}</td>
</tr>

<tr>
<td>Company Name</td>
<td>${companyname}</td>
</tr>

<tr>
<td>City</td>
<td>${city}</td>
</tr>
<%-- </table>
	<table>
		<tr>
			<td>Welcome ${firstname}</td>
		</tr>
		<tr>
			<td>Lastname</td>
			<td>${user.lastname}</td>
			</tr>
		<tr>
		</tr>
		<tr>
		</tr> --%>
		<tr>
			</tr>
	</table>
	<a href="home.jsp">Home</a>
		
</body>
</html>