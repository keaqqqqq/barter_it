<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");
$userid = $_POST['userid'];
$image = $_POST['image'];
$image1 = $_POST['image1'];
$image2 = $_POST['image2'];

$sqlinsert = "INSERT INTO `tbl_items`(`user_id`, `item_image`, `item_image1`, `item_image2`) VALUES ('$userid', '$image', '$image1', '$image2')";

try {
    if ($conn->query($sqlinsert) === TRUE) {
        $itemID = $conn->insert_id; 
        $response = array('status' => 'success', 'data' => array('item_id' => $itemID));
        sendJsonResponse($response);
        $decoded_string = base64_decode($image);
        $decoded_string1 = base64_decode($image1);
        $decoded_string2 = base64_decode($image2);
        $path = '../assets/photo/'.$itemID.'_1.jpg';
        $path1 = '../assets/photo/'.$itemID.'_2.jpg';
        $path2 = '../assets/photo/'.$itemID.'_3.jpg';
        file_put_contents($path, $decoded_string);
        file_put_contents($path1, $decoded_string1);
        file_put_contents($path2, $decoded_string2);
    } else {
        $response = array('status' => 'failed', 'data' => null);
        sendJsonResponse($response);
    }
} catch(Exception $e) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}

$conn->close();

function sendJsonResponse($sentArray) {
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>
