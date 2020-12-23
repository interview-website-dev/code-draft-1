<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
<style>
      body {
        text-align: center;
      }
      .inputField {
        pointer-events: none;
      }
     </style>
</head>
<body>
<%-- <h3 align="right"><a href ="jsp/home.jsp">Back</a></h3>
<h2 align="center">${headerMessage}</h2> --%>
<h3 align="center">User Profile</h3>

<label for="Firstname">Firstname:</label>  
  <input type="text" id="firstname" name="firstname" value=${firstname} readonly><br><br>
  
<label for="Lastname">Lastname:</label>  
  <input type="text" id="lastname" name="lastname" value=${lastname} readonly><br><br>
  
<label for="Companyemailid">Companyemailid:</label>  
  <input type="text" id="companyemailid" name="companyemailid" value=${companyemailid} readonly><br><br>
  
<label for="Mobilenumber">MobileNumber:</label>  
  <input type="text" id="mobilenumber" name="mobilenumber" value=${mobilenumber} readonly><br><br>
  
<label for="Companyname">CompanyName:</label>  
  <input type="text" id="companyname" name="companyname" value=${companyname} readonly><br><br>
  
<label for="City">City:</label>  
  <input type="text" id="city" name="city" value=${city} readonly><br><br>
  



<%-- <tr>
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
</table>
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
		</tr>
		<tr>
			</tr>
	</table>
	<a href="home.jsp">Home</a> --%>
		
</body>
</html>