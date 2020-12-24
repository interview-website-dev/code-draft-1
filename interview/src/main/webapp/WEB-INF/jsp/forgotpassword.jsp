<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
function newpassform() { 
	var lo = document.forms["forgotpasswordform"]["companyemailid"].value;
	  if (lo == "") {
	    alert("Please enter company email Id");
	    
	    return false;};
	  //PASSWORD
		  var p = document.forms["forgotpasswordform"]["password"].value;
		  if (p == "") {
		    alert("Password Cannot Be Empty");
		    return false;
		    }
		  if((p.length <= 5) || (p.length > 20)){
			  alert("Password should be between 5 and 20");
			  return false;
		  }
		  //CONFIRMPASSWORD
		  var cp = document.forms["forgotpasswordform"]["confirmpassword"].value;
		  if(p!=cp){
			  alert("Password didnt match");
			  return false;
		  }
}</script>
</head>
<body>
<h4 style="text-align: center;">Forgot Password</h4>

	<form:form id="forgotpasswordform" modelAttribute="user" action="forgotpasswordProcess" onsubmit="return newpassform()"
		method="post">
		<table align="center">
			<tr>
				<td><form:label path="companyemailid">Companyemailid: </form:label></td>
				<td><form:input path="companyemailid" name="companyemailid" id="companyemailid" /></td>
			</tr>
			<tr>
				<td><form:label path="password">Password</form:label></td>
				<td><form:password path="password" name="password" id="password" /></td>
			</tr>
			<tr>
				<td><form:label path="confirmpassword">ConfirmPassword</form:label></td>
				<td><form:password path="confirmpassword" name="confirmpassword" id="confirmpassword" /></td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><br><form:button id="forgotpassword" name="forgotpassword" style="background-color:Cyan">Save</form:button></td>
			</tr>

			<tr></tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</form:form>
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>

</body>
</html>