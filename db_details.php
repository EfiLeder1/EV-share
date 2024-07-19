<?php
session_start();

// Database connection parameters
$db_host = getenv('DB_HOST');
$db_name = getenv('DB_NAME');
$db_user = getenv('DB_USER');
$db_password = getenv('DB_PASSWORD');

$conn = pg_connect("host=$db_host dbname=$db_name user=$db_user password=$db_password");

?>
