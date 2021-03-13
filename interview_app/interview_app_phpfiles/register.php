<?php
	$db = mysqli_connect('localhost','root','','interview');
	if (!$db) {
		echo "Database connection failed";
	}

	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$emailid = $_POST['emailid'];
	$mobilenumber = $_POST['mobilenumber'];
	$password = $_POST['password'];

	$sql = "SELECT username FROM candidates WHERE emailid = '".$emailid."'";

	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Error");
	}else{
		$insert = "INSERT INTO candidates(firstname,lastname,emailid,mobilenumber,password)VALUES('".$firstname."','".$lastname."','".$emailid."','".$mobilenumber."','".$password."')";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode("Success");
		}
	}

?>