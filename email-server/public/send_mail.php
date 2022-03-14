<?php
require_once dirname(__FILE__,2).'/vendor/autoload.php';
require_once dirname(__FILE__,2).'/bootstrap/env.php';

$json = file_get_contents('php://input');
$request = json_decode($json);

if(isset($request->name, $request->email, $request->subject, $request->message)){
    if(sendMail($request) == 1){
        echo getResponse(200, "Message is sent");
    } else {
        echo getResponse(500, "Message is not sent");
    }
} else {
    echo getResponse(400, "Wrong data!");
}

function getResponse($code, $message)
{
    if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
        header('Access-Control-Allow-Origin: http://localhost:3000');
        header('Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS');
        header('Access-Control-Allow-Headers: token, Content-Type');
        header('Access-Control-Max-Age: 1728000');
        header('Content-Length: 0');
        header('Content-Type: text/plain');
        die();
    }

    header('Access-Control-Allow-Origin: *');
    header('Content-Type: multipart/form-data');

    $status = array(
        200 => '200 OK',
        400 => '400 Bad Request',
        422 => 'Unprocessable Entity',
        500 => '500 Internal Server Error'
    );

    header_remove();
    http_response_code($code);
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Status: ' . $status[$code]);

    return json_encode(array(
        'status' => $code < 300,
        'message' => $message
    ));
}

function sendMail($request){
    $transport = (new Swift_SmtpTransport($_ENV ['SMTP_SERVER'], $_ENV ['SMTP_PORT']))
      ->setUsername($_ENV ['USER_EMAIL'])
      ->setPassword($_ENV ['USER_PASSWORD'])
      ->setEncryption($_ENV ['MAIL_ENCRIPTYION']);
    $mailer = new Swift_Mailer($transport);
    $message = (new Swift_Message('Question from IOT WEB LAB site'))
      ->setFrom([$request->email => $request->name])
      ->setTo([$_ENV ['USER_EMAIL'] => 'IOT WEB LAB'])
      ->setBody('User name: '.$request->name.'
          Email: '.$request->email.'
          Link: '.$request->link.'
          Message: '.$request->message);
    if($request->file){
      $message->attach($request->file);
    }      
      
    $result = $mailer->send($message);
    return $result;
}