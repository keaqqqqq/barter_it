<?php
$servername = "localhost";
$username = "keaqqqqq_admin";
$password = "************";
$dbname = "keaqqqqq_barter_it";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
?>
