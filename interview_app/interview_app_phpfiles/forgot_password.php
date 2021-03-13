<?php 
	$db = mysqli_connect('localhost','root','','interview');

	$emailid = $_POST['emailid'];

	$sql = "SELECT * FROM candidates WHERE emailid = '".$emailid."'";

	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Success");
	}else{
		echo json_encode("Error");
	}

?>