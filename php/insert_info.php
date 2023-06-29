<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");
$userid = $_POST['userid'];
$item_name = $_POST['itemname'];
$item_desc = $_POST['itemdesc'];
$item_type = $_POST['type'];
$item_price = $_POST['itemprice'];
$item_qty = $_POST['itemqty'];
$latitude = $_POST['latitude'];
$longitude = $_POST['longitude'];
$state = $_POST['state'];
$locality = $_POST['locality'];

// Get the last item ID
$sqlselect = "SELECT MAX(item_id) AS latest_item_id FROM tbl_items";
$result = $conn->query($sqlselect);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $latestItemId = $row['latest_item_id'];
} else {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

// Insert the item information into the last item ID row
$sqlinsert = "UPDATE `tbl_items` SET `user_id`='$userid', `item_name`='$item_name', `item_desc`='$item_desc', `item_type`='$item_type', `item_price`='$item_price', `item_qty`='$item_qty', `item_lat`='$latitude', `item_long`='$longitude', `item_state`='$state', `item_locality`='$locality' WHERE `item_id`='$latestItemId'";

try {
    if ($conn->query($sqlinsert) === TRUE) {
        $response = array('status' => 'success', 'data' => array('item_id' => $latestItemId));
        sendJsonResponse($response);
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
