<?php 
	$db = mysqli_connect('localhost','root','','interview');

	$emailid = $_POST['emailid'];
	$password = $_POST['password'];

	$sql = "SELECT * FROM candidates WHERE emailid = '".$emailid."' AND password = '".$password."'";

	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Success");
	}else{
		echo json_encode("Error");
	}

?>