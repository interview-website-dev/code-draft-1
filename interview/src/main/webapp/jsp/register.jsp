<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
function regform() { 
	//FIRSTNAME
	var x = document.forms["regForm"]["firstname"].value;
	  if (x == "") {
	    alert("FirstName Cannot Be Empty");
	    return false;}
	  if ((x.length <=2)|| (x.length >20)){
		  alert("Firstname lenght must be between 2 and 20");
	  	return false;
	  }
	  if(!isNaN(x)){
		  alert("only characters are allowed in FirstName");
		  return false;
	  }
	  
	  //LASTNAME
	  var y = document.forms["regForm"]["lastname"].value;
	  if (y == "") {
	    alert("LastName Cannot Be Empty");
	    return false;
	    }
	  if(!isNaN(y)){
			  alert("only characters are allowed in LastName");
			  return false;
		  }
	  
	  //PASSWORD
	  var p = document.forms["regForm"]["password"].value;
	  if (p == "") {
	    alert("Password Cannot Be Empty");
	    return false;
	    }
	  if((p.length <= 5) || (p.length > 20)){
		  alert("Password should be between 5 and 20");
		  return false;
	  }
	  //CONFIRMPASSWORD
	  var cp = document.forms["regForm"]["confirmpassword"].value;
	  if(p!=cp){
		  alert("Password didnt match");
		  return false;
	  }
	  //EMAILID
	  var e = document.forms["regForm"]["companyemailid"].value;
	  if(e == ""){
		  alert("Email cannot be empty");
		  return false;
	  }
	  if(e.indexOf('@') <= 0 ){
		  alert("Invalid email id");
	  }
	  if ((e.charAt(e.length-4)!='.') && (e.charAt(e.length-3)!='.')){
		  alert("Invalid Email id length");
	  }
	  //MOBILE
	  var m = document.forms["regForm"]["mobilenumber"].value;
	  if(m== ""){
		  alert("Mobile number cannot be empty");
		  return false;
	  }
	  if(isNaN(m)){
		  alert("Mobile number cannot be in characters");
		  return false;
	  }
	  if(m.length!=10){
		  alert("Mobile number must be 10 digits only");
		  return false;
	  }
	  //COMPANYNAME
	  var com = document.forms["regForm"]["companyname"].value;
	  if(com==""){
		  alert("Company Name cannot be empty");
		  return false;
	 }
	  //CITY
	  var ci = document.forms["regForm"]["city"].value;
	  if(ci==""){
		  alert("City Name cannot be empty");
		  return false;
	  }
	     
	  
}</script>

</head>
<body>
		<h1 style="text-align: center;">REGISTRATION FORM</h1> 
		<form:form id="regForm" modelAttribute="user" action="registerProcess" onsubmit="return regform()"
		method="post">

		<table align="center">
			<tr>
				<td><form:label path="firstname">Firstname</form:label></td>
				<td><form:input path="firstname" name="firstname" id="firstname" /></td>
			</tr>
			<tr>
				<td><form:label path="lastname">Lastname</form:label></td>
				<td><form:input path="lastname" name="lastname"
						id="lastname" /></td>
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
				<td><form:label path="companyemailid">Companyemailid</form:label></td>
				<td><form:input path="companyemailid" name="companyemailid"
						id="companyemailid" /></td>
			</tr>
			<tr>
				<td><form:label path="mobilenumber">Mobilenumber</form:label></td>
				<td><form:input path="mobilenumber" name="mobilenumber" id="mobilenumber" /></td>
			</tr>
			<tr>
				<td><form:label path="companyname">Companyname</form:label></td>
				<td><form:input path="companyname" name="companyname" id="companyname" /></td>
			</tr>
			<tr>
				<td><form:label path="city">City</form:label></td>
				<td><form:input path="city" name="city" id="city" /></td>
			</tr>
			<tr>
				<td></td>
				<td><form:button id="register" name="register">Register</form:button></td>
			</tr>
			<tr></tr>
			<tr>
				<td></td>
				
			</tr>
		</table>
	</form:form>

</body>

</html>