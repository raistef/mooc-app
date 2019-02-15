<?php
	include("connection.php");
	$email = $_POST["email"];
	$pass1=$_POST["pass1"];
	$pass2=$_POST["pass2"];
	
	if ($pass1==$pass2){
		//$sql = "UPDATE users SET password='".$pass1."' WHERE email='".$email."'";	
		$sql = "UPDATE users SET password='".$pass1."' WHERE email='".$email."'";	
		$result=mysql_query($sql,$link);
		if ($result=1){
			echo "<script type='text/javascript'>alert('You have changed your password successfully!');window.history.go(-1)</script>";
		}
		else {
			//go back in browser history
			echo "<script type='text/javascript'>alert('Something went wrong :( ');window.history.go(-1)</script>";
		}
		
	}
	else {
		//go back in browser history
		echo "<script type='text/javascript'>alert('The passwords are not the same..');window.history.go(-1)</script>";
		
	}
	
?>