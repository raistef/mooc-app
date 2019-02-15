<?php
	include("connection.php");
	
	$email = $_POST["email"];
	$pass = $_POST["pass"];
	$fname = $_POST["fname"];
	$lname = $_POST["lname"];
	
	//register a new user
	
	$sql = "Insert into Users values ('$email', '$pass','$fname', '$lname', 0)";	
	$result = mysql_query($sql, $link); 
	if ($result==1){
		echo "<script type='text/javascript'>alert('You have been successfully signed up! Please sign in to start our courses!');</script>";
		echo "<script type='text/javascript'>window.location.replace('index.html');</script>";
	}
	
	else {
		echo "<script type='text/javascript'>alert('Could not sign you up :(. Check if you are already a member...');</script>";
		echo "<script type='text/javascript'>window.location.replace('index.html');</script>";
	}
?>
