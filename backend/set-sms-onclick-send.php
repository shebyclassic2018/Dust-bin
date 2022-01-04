<?php 
require "dbconn.php";
$sms = $_POST['sms'];
$recipient = $_POST['recipient'];

$date = new DateTime("now", new DateTimeZone('Africa/Nairobi'));

$today =$date->format("Y-m-d");
$sms = $conn->query("SELECT * FROM message WHERE sender = '1' AND status = 'Pending' AND DATE(created_at) = '$today'");
if ($mysqli_num_rows($sms) == 0) {
    $insert = $conn->query("INSERT INTO message VALUES (null, '1', '$recipient','$sms', 'Pending', now())");
}
