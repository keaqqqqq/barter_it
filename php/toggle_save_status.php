<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");

$userId = $_POST['userId'];
$itemId = $_POST['itemId'];
$isSaved = $_POST['isSaved'];

// Check if the item already exists for the user in tbl_saved
$sqlCheckSavedItem = "SELECT * FROM tbl_saved WHERE item_id = '$itemId' AND user_id = '$userId'";
$result = $conn->query($sqlCheckSavedItem);

if ($result->num_rows > 0) {
    // Item already exists, so update the saved status
    $sqlUpdateSavedStatus = "UPDATE tbl_saved SET status = '$isSaved' WHERE item_id = '$itemId' AND user_id = '$userId'";
    if ($conn->query($sqlUpdateSavedStatus) === TRUE) {
        $response = array("status" => "success", "message" => "Item saved status updated successfully");
        sendJsonResponse($response);
    } else {
        $response = array("status" => "error", "message" => "Failed to update item saved status");
        sendJsonResponse($response);
    }
} else {
    // Item does not exist, so insert a new row
    $sqlInsertSavedItem = "INSERT INTO tbl_saved (item_id, user_id, status) VALUES ('$itemId', '$userId', '$isSaved')";
    if ($conn->query($sqlInsertSavedItem) === TRUE) {
        $response = array("status" => "success", "message" => "Item saved successfully");
        sendJsonResponse($response);
    } else {
        $response = array("status" => "error", "message" => "Failed to save item");
        sendJsonResponse($response);
    }
}

// Close the database connection
$conn->close();

function sendJsonResponse($response) {
    header('Content-Type: application/json');
    echo json_encode($response);
}
?>
