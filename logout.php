<?php
session_start();
$_SESSION['id_user'] = $user['id_user'];
unset($_SESSION['id_user']);
header("Location: index.php");
?>