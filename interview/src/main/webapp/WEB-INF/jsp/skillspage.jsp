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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/script.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<title>Insert title here</title>

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

input[type=text] {
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

th, td {
	padding: 5px;
}

fieldset {
	background-color: rgba(173, 216, 230, 0.5);
	max-width: 1000px;
	padding: 5px;
}

legend {
	background-color: rgba(30, 139, 195, 1);
	color: white;
	padding: 5px 10px;
	border: 2px solid grey;
	width: 300px;
	margin: 0 auto;
	font-size: 20px;
}
</style>
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
		element2.attr('name', 'skills[' + i + '].Skillname');
		element2.removeAttr("class");
		element2.attr('class','skillnameclass');
		element2.appendTo(cell2);
		var element4 = document.createElement("input");
		element4.type = "hidden";
		element4.name = "skills[" + i + "].Positionid";
		element4.value = "${Positionid}";
		cell2.appendChild(element4);
		var cell3 = row.insertCell(1);
		var selectList = $('select.form-control1');
		var element3 = selectList.clone();
		element3.removeAttr("name");
		element3.attr('name', 'skills[' + i + '].Proficiencylevel');
		element3.removeAttr("class");
		
	element3.attr('class', 'proficiencylevelclass');
		element3.appendTo(cell3);
		/* var used = new Set;
		   $('select.skillnameclass').each(function () {
		     var reset = false;
		     $('option', this).each(function () {
		       var hide = used.has($(this).text());
		       if (hide && $(this).is(':selected')) reset = true;
		       $(this).prop('hidden', hide);
		     });
		     if (reset) $('option:not([hidden]):first', this).prop('selected', true);  
		     used.add($('option:selected', this).text());
		   }); */

	}
</script>
<script>
function deleteRow(tableID) {
	
	var table = document.getElementById(tableID);
	var rowCount = table.rows.length;

	
			if (rowCount <= 3) {
				alert("Cannot delete all the rows.");
			
			}else{
				table.deleteRow(rowCount -1);
			};
		
}
</script>
<script>
function skval(){
	 var y = document.getElementsByClassName("skillnameclass");
	 var j;
	for (j = 0; j < y.length; j++) {
		if(y[j].value=== "select a skill"){
			y[j].style.borderColor = "red";
			return false;
		}
	}
	var i;
		var valuesAlreadySeen = new Array();

		  for (i = 0; i < y.length; i++) {
		   var value = y[i].value;
		    if (valuesAlreadySeen.indexOf(value) !== -1) {
		    	alert("enter unique values");
		      return false;
		    }
		    valuesAlreadySeen.push(value);
		  }
	
	var z = document.getElementsByClassName("proficiencylevelclass");
	var k;
	for (k = 0; k < z.length; k++) {
		if(z[k].value=== "select a level"){
			z[k].style.borderColor = "red";
			return false;
		}
		}
 
}
</script>
<script>
/* $(function validate() {
	
	  $('select.skillnameclass').change(function() {
	    var used = new Set;
	    $('select.skillnameclass').each(function () {
	      var reset = false;
	      $('option', this).each(function () {
	        var hide = used.has($(this).text());
	        if (hide && $(this).is(':selected')) reset = true;
	        $(this).prop('hidden', hide);
	      });
	      if (reset) $('option:not([hidden]):first', this).prop('selected', true);  
	      used.add($('option:selected', this).text());
	    });
	  }).trigger('change'); // run at load
	}); */
</script>
</head>
<body>
	<center>
		<fieldset>
			<legend>Enter Skills</legend>
			<form:form modelAttribute="SkillForm"
				action="skillProcess?firstname=${firstname}&companyMailId=${companyemailid}"
				method="post" onsubmit="return skval()">
				<INPUT type="hidden" name="Positionname" value="${Positionname}" />
				<INPUT type="hidden" name="Date" value="${Date}" />
				<INPUT type="hidden" name="Location" value="${Location}" />
				<INPUT type="hidden" name="Address" value="${Address}" />
				<INPUT type="hidden" name="Qualification" value="${Qualification}" />
				<INPUT type="hidden" name="Salary" value="${Salary}" />
				<INPUT type="hidden" name="Noofposition" value="${Noofposition}" />
				<INPUT type="hidden" name="Userid" value="${Userid}" />
				<INPUT type="hidden" name="Positionid" value="${Positionid}" />
				<center>
					<table class="table table-striped table-hover"
						style="background-color: rgba(173, 216, 230, 0.5); text-align: center;"
						id="item-table">
						<tr>
							<td></td>

							<td><div style="display: none;">
									<select name="sample1" class="form-control1" id="sample1">
									<option value="select a level">select a level</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
								</div></td>
							<td><div style="display: none;">
									<select name="sample2" class="form-control" id="sample2">
									<option value="select a skill">select a skill</option>
										<c:forEach var="item" items="${Skilllist}" varStatus="status">
											<option value="${item}">${item}</option>
										</c:forEach>
									</select>
								</div></td>
							<td><input type="button" value="Add Row"
								style="background-color: #4CAF50; border: none; color: white; padding: 5px 16px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;"
								}id="btn-addrow" onclick="addRow('item-table');"
								class="btn-success form-control" /> </td><td><input type="button"
								style="background-color: red; border: none; color: white; padding: 5px 16px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;"
								value="Remove" onclick="deleteRow('item-table');"
								class="form-control btn-danger" /></td>
						</tr>
						<tr>
						
							<th style="text-align: center; font-size: 20px">Skill Name</th>
							<th style="text-align: center; font-size: 20px">Proficiency
								Level</th>

						</tr>
						<tr>
							
							<td class="col-md-4"><input name="skills[0].Positionid"
								type="hidden" value="${Positionid}"> <select
								name="skills[0].Skillname" class="skillnameclass">
								<option value="select a skill">select a skill</option>
								<c:forEach var="item" items="${Skilllist}">
										<option value="${item}">${item}</option>
									</c:forEach> 
							</select></td>

							<td class="col-md-4"><select
								name="skills[0].Proficiencylevel" class="proficiencylevelclass">
								<option value="select a level">select a level</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
							</select></td>
						</tr>

					</table>
				</center>
				<br>
				<br>
				<center>
					<form:button id="next" name="next" style="background-color:Cyan">Next</form:button>
				</center>
			</form:form>
		</fieldset>
	</center>
</body>
</html>


