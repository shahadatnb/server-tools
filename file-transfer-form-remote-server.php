<?php
set_time_limit(0);

$ch = curl_init("https://shahadat.asiancoder.com/wp-content/themes/shahadat/images/ab.jpg");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_BINARYTRANSFER, true);
$output = curl_exec($ch);

$fh = fopen("ab.jpg", 'w');
fwrite($fh, $output);
fclose($fh);


?>