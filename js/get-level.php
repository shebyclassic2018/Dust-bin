<?php
$conn = new mysqli("localhost","root","","bin");

$select = $conn->query("SELECT * FROM waste_level");
foreach($select as $row) {
    echo $row['level'];
}