<?php 
	$db = mysqli_connect('localhost','root','','interview');

	$emailid = $_POST['emailid'];
	$password = $_POST['password'];
	$latestupdatedtime = $_POST['latestupdatedtime'];

	$update = "UPDATE employers SET password ='" + password + "',latestupdatedtime ='"
				+ latestupdatedtime + "' where emailid = '" + emailid + "'";

	$query = mysqli_query($db,$update);
	$count = mysqli_num_rows($result);

	if ($query) {
		echo json_encode("Success");
	}else{
		echo json_encode("Error");
	}

?>