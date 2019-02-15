<?php
	include("connection.php");
	session_start();
	$email = $_POST["email"];
	$pass = $_POST["pass"];
	$_SESSION['user'] = $email;
	$type="";
		
//Check the login details and the type of user
	
	if ($_POST['user']=='instructor') {
		$sql = "Select * FROM instructors WHERE email = '" . $email . "' and password = '" .$pass . "'";
		$type="instructor";
		
	} else if ($_POST['user']=='student') {
		
		$sql = "Select * FROM users WHERE email = '" . $email . "' and password = '" .$pass . "'";	
		$type="student";
	}
	
	
	$result = mysql_query($sql, $link); 
 
	$found = false;
 	while ($row = mysql_fetch_assoc($result)) {	
		$found = true;
	}
	//checck the validity of login details and the type
	if ($found && $type=="student") {
		//student
		header("location:student_logged.html?email=" . $email);
	} else if ($found && $type=="instructor"){
		// instructor
		header("location:instructor_logged.html?email=" . $email);
		
	}
	else {
		//in case the login details are invalid
		echo "<script type='text/javascript'>alert('Your login credentials are not valid. Try again!');
		window.history.go(-1)</script>;"; //go back in browser history
		
	}
?>




