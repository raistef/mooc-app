<?php

//get the list of the courses an instructor teaches
include("connection.php");
$email = $_GET["email"];
$result=mysql_query("select name, course_ID from courses where course_ID in (select course_ID from courses where email='".$email."')",$link);


while($data = mysql_fetch_row($result))
{   
	echo "<div class='row mt-5 ml-5' style=''>";
    echo "<p class='col-4'>$data[0]</p>";
	echo "<a class='col-2'href='demo.html?email=".$email."'><button class='btn btn-primary'>Go to course</button></a>";
    echo "</div>";
}
echo "</div>";
?>
