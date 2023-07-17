<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");

if (isset($_POST['userid'])){
	$userid = $_POST['userid'];	
	$sqlsaveddetails = "SELECT * FROM `tbl_saved` INNER JOIN `tbl_items` ON tbl_saved.item_id = tbl_items.item_id WHERE tbl_saved.user_id = '$userid' AND tbl_saved.status = '1'";
} else {
    $sqlsaveddetails = "NA";
}

$result = $conn->query($sqlsaveddetails);
if ($result->num_rows > 0) {
    $saveddetails["saveddetails"] = array();
	while ($row = $result->fetch_assoc()) {
        $saveddetailslist = array();
        $saveddetailslist['item_id'] = $row['item_id'];
        $saveddetailslist['user_id'] = $row['user_id'];
        $saveddetailslist['item_name'] = $row['item_name'];
        $saveddetailslist['item_type'] = $row['item_type'];
        $saveddetailslist['item_desc'] = $row['item_desc'];
        $saveddetailslist['item_price'] = $row['item_price'];
        $saveddetailslist['item_qty'] = $row['item_qty'];
        $saveddetailslist['item_lat'] = $row['item_lat'];
        $saveddetailslist['item_long'] = $row['item_long'];
        $saveddetailslist['item_state'] = $row['item_state'];
        $saveddetailslist['item_locality'] = $row['item_locality'];
		$saveddetailslist['item_date'] = $row['item_date'];
        array_push($saveddetails["saveddetails"], $saveddetailslist);
    }
    $response = array('status' => 'success', 'data' => $saveddetails);
    sendJsonResponse($response);
} else {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray) {
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>
