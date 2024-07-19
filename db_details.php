<?php
session_start();

// Database connection parameters
$db_host = getenv('POSTGRES_HOST');
$db_name = getenv('POSTGRES_DATABASE');
$db_user = getenv('POSTGRES_USER');
$db_password = getenv('POSTGRES_PASSWORD');

$conn = pg_connect("host=$db_host dbname=$db_name user=$db_user password=$db_password");

?>
