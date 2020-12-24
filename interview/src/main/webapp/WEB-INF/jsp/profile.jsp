<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
<script>
function validate() { 
	//FIRSTNAME
	var x = document.forms["edit"]["firstname"].value;
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
	  var y = document.forms["edit"]["lastname"].value;
	  if (y == "") {
	    alert("LastName Cannot Be Empty");
	    return false;
	    }
	  if(!isNaN(y)){
			  alert("only characters are allowed in LastName");
			  return false;
		  }
	  
	  //PASSWORD
	  var p = document.forms["edit"]["password"].value;
	  if (p == "") {
	    alert("Password Cannot Be Empty");
	    return false;
	    }
	  if((p.length <= 5) || (p.length > 20)){
		  alert("Password should be between 5 and 20");
		  return false;
	  }
	  //CONFIRMPASSWORD
	  var cp = document.forms["edit"]["confirmpassword"].value;
	  if(p!=cp){
		  alert("Password didnt match");
		  return false;
	  }
	  //EMAILID
	  var e = document.forms["edit"]["companyemailid"].value;
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
	  var m = document.forms["edit"]["mobilenumber"].value;
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
	  var com = document.forms["edit"]["companyname"].value;
	  if(com==""){
		  alert("Company Name cannot be empty");
		  return false;
	 }
	  //CITY
	  var ci = document.forms["edit"]["city"].value;
	  if(ci==""){
		  alert("City Name cannot be empty");
		  return false;
	  }
}
function onButtonClick(){
	document.forms["edit"]["edit"].className="show";
	document.forms["edit"]["firstname"].disabled=false;
	document.forms["edit"]["lastname"].disabled=false;
	document.forms["edit"]["companyemailid"].disabled=false;
	document.forms["edit"]["mobilenumber"].disabled=false;
	document.forms["edit"]["companyname"].disabled=false;
	document.forms["edit"]["city"].disabled=false;
	}
</script>
<style>
      body {
        text-align: center;
      }
      .inputField {
        pointer-events: none;
      }
      .hide{
  display:none;
}
.show{
background-color:Cyan;
  display:block;
}
     </style>
</head>
<body>
<%-- <h3 align="right"><a href ="jsp/home.jsp">Back</a></h3>
<h2 align="center">${headerMessage}</h2> --%>
<h1 style="text-align: center;">PROFILE</h1> 
		
<form:form id="edit" modelAttribute="user" action="updateProcess?companyMailId=${companyemailid}" onsubmit="return validate()"
		method="post">
		<table align="center">
		
			<tr>
				<td><form:label path="firstname">Firstname</form:label></td>
				<td><form:input path="firstname" name="firstname" id="firstname" value= "${firstname}" disabled="true"/></td>
			</tr>
			<tr>
				<td><form:label path="lastname">Lastname</form:label></td>
				<td><form:input path="lastname" name="lastname"  disabled="true" value="${lastname}"
						id="lastname" /></td>
			</tr>
			<%-- <tr>
				<td><form:label path="password">Password</form:label></td>
				<td><form:password path="password" name="password" id="password" readonly="true"/></td>
			</tr>
			<tr>
				<td><form:label path="confirmpassword">ConfirmPassword</form:label></td>
				<td><form:password path="confirmpassword" name="confirmpassword" id="confirmpassword" readonly="true"/></td>
			</tr> --%>
			<tr>
				<td><form:label path="companyemailid">Companyemailid</form:label></td>
				<td><form:input path="companyemailid" name="companyemailid" value="${companyemailid}"
						id="companyemailid"  disabled="true"/></td>
			</tr>
			<tr>
				<td><form:label path="mobilenumber">Mobilenumber</form:label></td>
				<td><form:input path="mobilenumber" name="mobilenumber"  value="${mobilenumber}" id="mobilenumber" disabled="true"/></td>
			</tr>
			<tr>
				<td><form:label path="companyname">Companyname</form:label></td>
				<td><form:input path="companyname" name="companyname" id="companyname" value="${companyname}"  disabled="true"/></td>
			</tr>
			<tr>
				<td><form:label path="city">City</form:label></td>
				<td><form:input path="city" name="city"  disabled="true" id="city" value="${city}" /></td>
			</tr>
			<tr>
				<td></td>
				<td><form:button id="edit" name="edit" class="hide">Submit</form:button></td>
			</tr>
			<tr></tr>
			<tr>
				<td></td>
				
			</tr>
		</table>
	</form:form>
	<center><input type="button" name="answer" value="Edit Profile" style="background-color:Cyan" onclick="onButtonClick()"/></center>
</body>
</html>