<?php 
// Creating connection
	$conn = new mysqli('localhost','root','','interview');
 
if ($conn->connect_error) {
 
	die("Connection failed: " . $conn->connect_error);
} 
 
	// Creating SQL command to fetch all records from cities Table.
	$sql = "SELECT employers.companyname, posts.* from employers inner join posts on employers.employerid = posts.employerid";
	 
	$result = $conn->query($sql);
 
if ($result->num_rows >0) {
 
	 while($row[] = $result->fetch_assoc()) {
	 
	 $item = $row;
	 
	 $json = json_encode($item, JSON_NUMERIC_CHECK);
	 
 }
 
} else {
	echo "No Data Found.";
}
echo $json;
$conn->close();
 
?>