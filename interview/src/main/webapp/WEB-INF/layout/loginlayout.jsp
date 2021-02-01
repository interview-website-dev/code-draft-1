<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<style>
.center {
	height: 200px;
	position: relative;
	border: 3px solid green;
}

.center table {
	margin: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
</style>
</head>
<body style="background-color: rgba(173, 216, 230, 0.3)">
<center>
	<table>
		<tr height="600">
			<td style="vertical-align: top"><tiles:insertAttribute
					name="body" /></td>
		</tr>
	</table>
</center>
</body>
</html>
