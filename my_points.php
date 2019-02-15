<?php
//get the points for a user
include("connection.php");
$email = $_GET["email"];
$result=mysql_query("select points from users where email='".$email."'");


while($data = mysql_fetch_row($result))
{   
	echo "<span style='color:white;font-size:120%;font-weight:bold;display:inline-block;padding-top:30px;padding-right;10px;'>Your points: <span style='color:red;'>$data[0]</span> </span>";
	
}

?>
