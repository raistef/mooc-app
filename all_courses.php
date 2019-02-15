<?php

//get the list of courses from the database and their chapters to display them to the user
include("connection.php");

$result=mysql_query("select name, chapter1, chapter2, chapter3, chapter4, chapter5, chapter6 from courses",$link);

echo '<head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $( function() {
    $( "#accordion" ).accordion({
      collapsible: true
    });
  } );
  </script>
</head>';
echo '<div id="accordion" style="width:80%; margin:30px;">';

while($data = mysql_fetch_row($result))
{   
    echo "<h3>$data[0]</h3>";
    echo "<div>";
	echo "<p>$data[1]</p>";
	echo "<p>$data[2]</p>";
	echo "<p>$data[3]</p>";
	echo "<p>$data[4]</p>";
	echo "<p>$data[5]</p>";
	echo "<p>$data[6]</p>";
    echo "</div>";
}
echo "</div>";
?>
