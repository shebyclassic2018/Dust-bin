<?php
    $level = $_POST['level'];

    $conn = new mysqli("localhost","root","","bin");
    // if($level <= 10) {
    //     $recipient = "0718800422";
    //     $check = $conn->query("SELECT recipient, status, DATE(created_at) AS created_at FROM message WHERE status = 'Pending'");
    //     $exit = false;
    //     foreach($check as $row) {
    //         if ($recipient == $row['recipient'] && $row['status'] == 'Sent' && $row['created_at'] == date('Y-m-d')){
    //             $exit = true;
    //             return;
    //         }
    //     }
    //    if (!$exit) {
    //     $insert = $conn->query("INSERT INTO message VALUES (null, '1', '$recipient','Waste is fully Come to collect them', 'Pending', now())");
    //    }
    // }
    $conn->query("UPDATE waste_level SET level = '$level'");