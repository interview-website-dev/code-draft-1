<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body style="background-color: rgba(173, 216, 230, 0.3)">

	<table width="100%" height="100%" align="center">
		<tr height="20%">
			<td><tiles:insertAttribute name="header" /></td>
		</tr>

		<tr height="540">
			<td style="vertical-align: top"><tiles:insertAttribute
					name="body" /></td>
		</tr>

		<tr height="60">
			<td><tiles:insertAttribute name="footer" /></td>
		</tr>
	</table>

</body>
</html>
