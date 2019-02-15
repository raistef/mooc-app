<?php
error_reporting(E_ERROR | E_PARSE);
//Here is the implemetation of the feature that calculates how many points are added to the score of the user
include("connection.php");

$email = $_GET["email"];
$course = $_GET["course"];
$points = $_GET["points"];
$quiz = 3;
$first=0;
$second=0;
$sum=0;
$score=0;
$level="";
$skills=array();
$new_skills=array();
$fields=array();
$new_fields=array();


//Check if the user took the quiz before
$sql = "Select * from User_quiz where email='".$email."' and c_id='".$course."' and quiz_number='".$quiz."'";	
$result = mysql_query($sql, $link); 
$rows=mysql_num_rows($result);

if ($rows==0){
	//If the user didn't take the quiz before, save the result of the quiz
	$sql1="insert into User_quiz values ('".$course."','".$email."','".$quiz."','".$points."')";
	$result_insert = mysql_query($sql1, $link);
	if ($points>=40){
		//if the user passed the quiz, check if they passed the other quizzes in the course
		$sql2 = "Select points from User_quiz where email='".$email."' and c_id='".$course."' and quiz_number=1";
		$result1 = mysql_query($sql2, $link);
		while($data = mysql_fetch_row($result1))
		{   
		$first="$data[0]";
		}
		$sql3 = "Select points from User_quiz where email='".$email."' and c_id='".$course."' and quiz_number=2";
		$result2 = mysql_query($sql3, $link);
		while($data = mysql_fetch_row($result2))
		{   
		$second="$data[0]";
		}
		
		//if they passed the other quizzes calculate the average grade in order to be able to see how many points this course adds to the user's score and to update the grade
		if ($second>40 &&$first>40){
			$sum=$first+$second+$points;
			$average = $sum/3;
			$grade="";
			
			if ($average<60) {
				$score=5;
				$grade="C";
			}
			else if ($average<80) {
				$score=10;
				$grade="B";
			}
			else if ($average<99) {
				$score=15;
				$grade="A";
			}
			else if ($average=100) {
				$score=20;
				$grade="A";
			}
			
			//Update the grade
			$sql_grade = "UPDATE user_course SET grade = '".$grade."' where  c_id='".$course."' and email ='".$email."'";
			$result_grade = mysql_query($sql_grade, $link);
			
			
		}
		
		//Check the level of the course the user has taken and add points accordiingly
		$sql4 = "Select course_level from courses where course_ID='".$course."'";
		$result3 = mysql_query($sql4, $link);
		$rows1=mysql_num_rows($result3);
		if ($rows1!=0){
			while($data = mysql_fetch_row($result3))
		{   
			$level="$data[0]";
		}
		
		if ($level="medium"){
			$score+=5;
		}
		else if ($level="advanced"){
			$score+=10;
		}
		}
		
		
		//Check the relevance of the type of the course the user has taken and add points accordiingly
		
		//1.Get all skills that the user has achieved through the courses the user has passed
		
		$sql5 = "Select skill from course_skill where c_id in (Select c_id from courses where email='".$email."' and grade!=F)";
		$result4 = mysql_query($sql5, $link);
		
		while($data = mysql_fetch_row($result4))
		{   
			array_push($skills,"$data[0]");
		}
		
		//2.Get the skills that the freshly passed course has
		$sql_skill = "Select skill from course_skill where c_id='".$course."'";
		$result_skill = mysql_query($sql_skill, $link);
		while($data = mysql_fetch_row($result_skill))
		{   
			array_push($new_skills,"$data[0]");
		}
		
		//offer 5 more points if a new skill has been achieved
		foreach($new_skills as $new_skill){
			if (!(in_array($new_skill, $skills))) {
				$score+=5;
			}
		}
		
		//3.Select fields that the user has achieved skills in and save them in an array
		$sql_field = "Select field from skills where skill in (Select skill from course_skill where c_id in (Select c_id from courses where email='".$email."' and grade!=F))";
		$result_field = mysql_query($sql_field, $link);
		while($data = mysql_fetch_row($result_field))
		{   
			array_push($fields,"$data[0]");
		}
		
		//4.Select fields that the skills of the freshly passed course are part of
		$sql_field2 = "select field from skills where skill in (Select skill from course_skill where c_id='".$course."')";
		$result_field2 = mysql_query($sql_field2, $link);
		while($data = mysql_fetch_row($result_field2))
		{   
			array_push($new_fields,"$data[0]");
		}
		//offer 10 more points if at least a skill in a new field has been achieved
		foreach($new_fields as $new_field){
			if (!(in_array($new_field, $fields))) {
				$score+=10;
			}
		}
		
		//offer extra points if the number of 10 skills has been achieved
		if ($skills=10){
			$score+=10;
		}
		
		//Add $score points to the user
		$sql_score = "UPDATE users SET points=points+'".$score."' where email='".$email."'";
		$result_score = mysql_query($sql_score, $link);
		
	}
	echo "<script>alert('We have recorded the result!');</script>";
	//go to the url of the course
	echo "<script>window.location.replace('".$course.".html?email=".$email."');</script>";
	
}

else {
	echo "<script>alert('You have attempted this quiz before and we can not update your score. Sorry!');</script>";
	echo "<script>window.location.replace('".$course.".html?email=".$email."');</script>";
}

?>

