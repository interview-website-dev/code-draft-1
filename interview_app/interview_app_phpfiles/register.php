<?php
	$db = mysqli_connect('localhost','root','','interview');
	if (!$db) {
		echo "Database connection failed";
	}

	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$emailid = $_POST['emailid'];
	$mobilenumber = $_POST['mobilenumber'];
	$city = $_POST['city'];
	$password = $_POST['password'];

	$sql = "SELECT username FROM candidates WHERE emailid = '".$emailid."'";

	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Error");
	}else{
		$insert = "INSERT INTO candidates(firstname,lastname,emailid,mobilenumber,city,password)VALUES('".$firstname."','".$lastname."','".$emailid."','".$mobilenumber."','".$city."','".$password."')";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode("Success");
		}
	}

?>