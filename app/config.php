<?php
$url = $_SERVER["SERVER_NAME"];  
define('PATH', realpath('.'));
define('SUBFOLDER', false);
define('URL', 'https://hitmanpanel.cfd');
define('STYLESHEETS_URL', '//hitmanpanel.cfd' );
date_default_timezone_set('Asia/Kolkata');
error_reporting(0);
return [
  'db' => [
    'name'    =>  'hitmanp1_Admin' ,
    'host'    =>  'localhost',
    'user'    =>  'hitmanp1_Admin' ,
    'pass'    =>  'hitmanp1_Admin' ,
    'charset' =>  'utf8mb4' 
  ]
];
?>