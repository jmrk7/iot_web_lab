<?php
if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
    $ip = $_SERVER['HTTP_CLIENT_IP'];
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
    $ip = $_SERVER['REMOTE_ADDR'];
}


$location = file_get_contents("http://ipinfo.io/".$ip."/geo");
$location = json_decode($location, true);
$country  = $location['country'];
$region   = $location['region'];
$city     = $location['city'];

echo '<div>'.$contry."</div>";
echo '<div>'.$region."</div>";
echo '<div>'.$city."</div>";
echo '<div>'.$ip."</div>";