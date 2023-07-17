<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '/home4/keaqqqqq/PHPMailer-master/src/Exception.php';
require '/home4/keaqqqqq/PHPMailer-master/src/PHPMailer.php';
require '/home4/keaqqqqq/PHPMailer-master/src/SMTP.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");

if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['phone']) && isset($_POST['password'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $password = sha1($_POST['password']);
    $otp = rand(10000, 99999);

    $sqlinsert = "INSERT INTO `tbl_users` (`user_email`, `user_name`, `user_phone`, `user_password`, `otp`) VALUES ('$email','$name','$phone','$password','$otp')";

    if ($conn->query($sqlinsert) === TRUE) {
        mailOtp($email, $name, $otp);
        $response = array('status' => 'success', 'data' => null);
        sendJsonResponse($response);
    } else {
        $response = array('status' => 'failed', 'data' => null);
        sendJsonResponse($response);
    }
} else {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}

function mailOtp($email, $name, $otp)
{
    $subject = 'Barter_IT - Account Verification';
    $body = "
    <html>
    <head>
    <title></title>
    </head>
    <body>
    <h5>Barter_IT - Account Verification</h5>
    <p>Dear $name,<br>
    Thank you for registering your account with us. To complete your registration, please click on the following button/link<br><br>
    <a href='https://keaqqqqq.com/barter_it/php/verify.php?email=$email&otp=$otp'><button>Verify your account</button></a><br><br>
    Once your account has been verified, you can open the Barter_IT app on your phone and login.<br>
    </body>
    </html>
    ";

    $mail = new PHPMailer(true);
    try {
        $mail->isSMTP();                                            // Send using SMTP
        $mail->Host       = 'mail.keaqqqqq.com';                    // Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
        $mail->Username   = 'barter_it@keaqqqqq.com';                // SMTP username
        $mail->Password   = '!keaqiu123';                           // SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            // Enable implicit TLS encryption
        $mail->Port       = 465;                                    // TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

        // Recipients
        $mail->setFrom('barter_it@keaqqqqq.com', 'Barter_IT mail notification');
        $mail->addAddress($email, $name);                           // Add a recipient

        // Content
        $mail->isHTML(true);                                        // Set email format to HTML
        $mail->Subject = $subject;
        $mail->Body    = $body;
        $mail->send();
        // echo 'Message has been sent';
    } catch (Exception $e) {
        // echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }
}
?>
