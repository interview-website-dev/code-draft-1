<style>
.dropbtn {
	color: blue;
	font-size: 16px;
	border: none;
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
</style>

<table style="float: right;padding-top: 30px;padding-right:30px">
		<tr>
			<td style="text-align: center"></td>
		</tr>
		<tr>
			<td style="text-align: center">
				<div class="dropdown">

					<div class="dropbtn">${firstname}</div>
					<div class="dropdown-content">

						<a href="profile?companyMailId=${companyemailid}">profile</a> <a
							href="Logoutsuccess">Log out</a>
					</div>

				</div>
			</td>
		</tr>
	</table>
<h1 style="color: rgb(0, 0, 255); font-family: Impact, fantasy">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	Walk-in Interview</h1>
	
<hr />
