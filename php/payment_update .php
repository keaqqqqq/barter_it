<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '/home4/keaqqqqq/PHPMailer-master/src/Exception.php';
require '/home4/keaqqqqq/PHPMailer-master/src/PHPMailer.php';
require '/home4/keaqqqqq/PHPMailer-master/src/SMTP.php';

include_once("dbconnect.php");
$userid = $_GET['userid'];
$phone = $_GET['phone'];
$amount = $_GET['amount'];
$email = $_GET['email'];
$name = $_GET['name'];

$data = array(
    'id' =>  $_GET['billplz']['id'],
    'paid_at' => $_GET['billplz']['paid_at'] ,
    'paid' => $_GET['billplz']['paid'],
    'x_signature' => $_GET['billplz']['x_signature']
);

$paidstatus = $_GET['billplz']['paid'];
if ($paidstatus=="true"){
    $paidstatus = "Success";
}else{
    $paidstatus = "Failed";
}
$receiptid = $_GET['billplz']['id'];
$signing = '';
foreach ($data as $key => $value) {
    $signing.= 'billplz'.$key . $value;
    if ($key === 'paid') {
        break;
    } else {
        $signing .= '|';
    }
}
 
$signed= hash_hmac('sha256', $signing, 'S-85ECwffiigmhMG9Pbg0nlQ');
if ($signed === $data['x_signature']) {
    if ($paidstatus == "Success"){ //payment success
         $sqlcart = "SELECT * FROM `tbl_carts` WHERE user_id = '$userid' ORDER BY seller_id ASC";
        $result = $conn->query($sqlcart);
        $seller = "";
        $singleorder = 0;
        $i =0;
        $numofrows = $result->num_rows;
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $seller_id = $row['seller_id'];
                $itemid = $row['item_id'];
                $orderqty = $row['cart_qty'];
                $order_paid = $row['cart_price'];
                
                if ($i==0){
                    $seller = $seller_id;
                }
                
                if ($seller == $seller_id){
                    $singleorder = $singleorder + $order_paid;    
                }else{
                    $sqlorder ="INSERT INTO `tbl_orders`( `order_bill`, `order_paid`, `buyer_id`, `seller_id`, `order_status`) VALUES ('$receiptid','$singleorder','$userid','$seller','New')";
                    $conn->query($sqlorder);
                    $seller = $seller_id;
                    $singleorder = $order_paid;
                }
                
                if ($i == ($numofrows-1)){
                     $singleorder = $singleorder; 
                    $sqlorder ="INSERT INTO `tbl_orders`( `order_bill`, `order_paid`, `buyer_id`, `seller_id`, `order_status`) VALUES ('$receiptid','$singleorder','$userid','$seller','New')";
                    $conn->query($sqlorder);
                }
                $i++;
                
                $sqlorderdetails = "INSERT INTO `tbl_orderdetails`(`order_bill`, `item_id`, `orderdetail_qty`, `orderdetail_paid`, `buyer_id`, `seller_id`) VALUES ('$receiptid','$itemid','$orderqty','$order_paid','$userid','$seller_id')";
                $conn->query($sqlorderdetails);
                $sqlupdateitemqty = "UPDATE `tbl_items` SET `item_qty`= (item_qty - $orderqty) WHERE `item_id` = '$itemid'";
                $conn->query($sqlupdateitemqty);
            }
            $sqldeletecart = "DELETE FROM `tbl_carts` WHERE user_id = '$userid'";
            $conn->query($sqldeletecart);
        }
        
        echo "
        <html><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
        <link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">
        <body>
        <center><h4>Receipt</h4></center>
        <table class='w3-table w3-striped'>
        <th>Item</th><th>Description</th>
        <tr><td>Name</td><td>$name</td></tr>
        <tr><td>Email</td><td>$email</td></tr>
        <tr><td>Phone</td><td>$phone</td></tr>
        <tr><td>Paid Amount</td><td>RM$amount</td></tr>
        <tr><td>Paid Status</td><td class='w3-text-green'>$paidstatus</td></tr>
        </table><br>
        
        </body>
        </html>";
    }
    else 
    {
         echo "
        <html><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
        <link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">
        <body>
        <center><h4>Receipt</h4></center>
        <table class='w3-table w3-striped'>
        <th>Item</th><th>Description</th>
        <tr><td>Name</td><td>$name</td></tr>
        <tr><td>Email</td><td>$email</td></tr>
        <tr><td>Phone</td><td>$phone</td></tr>
        <tr><td>Paid</td><td>RM $amount</td></tr>
        <tr><td>Paid Status</td><td class='w3-text-red'>$paidstatus</td></tr>
        </table><br>
        
        </body>
        </html>";
    }
}

$subject = 'Barter_IT - Payment Confirmation';
    $body = "
    <html>
    <head>
    <title></title>
    </head>
    <body>
    <h5>Barter_IT - Payment Confirmation</h5>
    <p>Dear $name,<br><br>Thank you for your payment of RM$amount. We have received your payment and your order has been processed.<br><br>Please keep this receipt for your reference.<br><br>Payment Details:<br>Receipt ID: $receiptid<br>Paid Amount: RM$amount<br><br>If you have any questions or concerns, please contact our support team.<br><br>Best regards, Barter_IT
    </p>
    </body>
    </html>
    ";


$mail = new PHPMailer(true);
try {
    $mail->isSMTP();
    $mail->Host       = 'mail.keaqqqqq.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'barter_it@keaqqqqq.com';
    $mail->Password   = '!keaqiu123';
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
    $mail->Port       = 465;

    $mail->setFrom('barter_it@keaqqqqq.com', 'Barter_IT');
    $mail->addAddress($email, $name);
    $mail->isHTML(true);
    $mail->Subject = $subject;
    $mail->Body    = $body;

    $mail->send();

    echo "Payment confirmation email sent successfully.";
} catch (Exception $e) {
    echo "Failed to send payment confirmation email. Error: " . $mail->ErrorInfo;
}

?>
