<?php
require_once dirname(__FILE__,2).'/vendor/autoload.php';
require_once dirname(__FILE__,2).'/bootstrap/env.php';

$json = file_get_contents('php://input');
$request = $_POST;

if($request){
    if(sendMail($request) == 1 && sendSelfMail($request) == 1){
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
    // header('Content-Type: application/json');
    header('Content-Type: multipart/form-data');
    header('Status: ' . $status[$code]);

    return json_encode(array(
        'status' => $code < 300,
        'message' => $message
    ));
}
function sendSelfMail($request){
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $ip = $_SERVER['REMOTE_ADDR'];
    }  
    
    $location = file_get_contents("http://ipinfo.io/".$ip."/geo");  
    $location = json_decode($location, true);
    $region   = $location['region'];
    $city     = $location['city'];
    $country  = $location['country'];

    $transport = (new Swift_SmtpTransport($_ENV ['SMTP_SERVER'], $_ENV ['SMTP_PORT']))
      ->setUsername($_ENV ['USER_EMAIL'])
      ->setPassword($_ENV ['USER_PASSWORD'])
      ->setEncryption($_ENV ['MAIL_ENCRIPTYION']);
    $mailer = new Swift_Mailer($transport);

    $message = (new Swift_Message('Question from IOT WEB LAB site'))
      ->setFrom([$request["email"] => $request["name"]])
      ->setTo([$_ENV ['USER_EMAIL'] => 'IOT WEB LAB'])
      ->addPart('
        <div style="margin-top: 10px; font-size: 14px">
          <div style="width: 100px; display: inline-block"><b>User name: </b></div><div style=" display: inline-block">'.$request["name"].'</div>
        </div>
        <div style="margin-top: 10px; font-size: 14px">
          <div style="width: 100px; display: inline-block"><b>Email: </b></div><div style=" display: inline-block">'.$request["email"].'</div>
        </div>
        <div style="margin-top: 10px; font-size: 14px">  
          <div style="width: 100px; display: inline-block"><b>Link: </b></div><div style=" display: inline-block">'.$request["link"].'</div>
        </div>
        <hr style="margin-top: 10px;">
        <div style="margin-top: 50px; font-size: 14px">
          <h1 style="text-align: center;">'.$request["subject"].'</h1>
          <p style="padding-left: 20px;">'.$request["message"].'</p>
        </div>
        <hr style="margin-top: 10px;">
        <table style="margin-top: 50px">
          <thead>
              <tr>
                  <th cols="3" style="width: 100px">IP</th>
                  <th cols="3" style="width: 100px">Country</th>
                  <th cols="3" style="width: 100px">Region</th>
                  <th cols="3" style="width: 100px">City</th>
              </tr>
          </thead>
          <tbody>
              <tr>
                  <td cols="3" style="width: 100px; text-align: center;">'.$ip.'</td>
                  <td cols="3" style="width: 100px; text-align: center;">'.$country.'</td>
                  <td cols="3" style="width: 100px; text-align: center;">'.$region.'</td>
                  <td cols="3" style="width: 100px; text-align: center;">'.$city.'</td>      
              </tr>
          </tbody>
        </table>', "text/html"
        );
    if($request["file"] !== 'null'){
      $attachment = Swift_Attachment::fromPath($_FILES["file"]["tmp_name"])->setFilename($_FILES["file"]["name"]);
      $message->attach($attachment);
    }      
      
    $result = $mailer->send($message);
    return $result;
}

function sendMail($request){
    $transport = (new Swift_SmtpTransport($_ENV ['SMTP_SERVER'], $_ENV ['SMTP_PORT']))
      ->setUsername($_ENV ['USER_EMAIL'])
      ->setPassword($_ENV ['USER_PASSWORD'])
      ->setEncryption($_ENV ['MAIL_ENCRIPTYION']);
    $mailer = new Swift_Mailer($transport);
    $message = (new Swift_Message('Thanks for you question'));
    $message
      ->setFrom([$_ENV ['USER_EMAIL'] => $request["IOT WEB LAB"]])
      ->setTo([$request["email"] => $request["name"]])
      ->setBody(
        '<html>' .
        ' <body>' .
        '<div style="padding: 20px">'.
        '<img src="'.$message->embed(Swift_Image::fromPath('logo.png')).'" alt="logo" />'.
      '</div>'.
      '<h3>Dear, '.$request["name"].'</h3>'.
      '<div>'.$request["feedback"].'</div>', "text/html");     
      
    $result = $mailer->send($message);
    return $result;
}