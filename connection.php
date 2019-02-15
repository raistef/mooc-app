<?php
//Connect to the database
//reused file
if (!$link = mysql_connect("localhost", "root", "root")) {
		echo 'Could not connect to Database';
		exit;
	}

if (!mysql_select_db('eduday', $link)) {
		echo 'Could not select database';
		exit;
	}
?>
