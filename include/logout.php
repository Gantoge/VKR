<?php
session_start();
unset($_SESSION['username']);
unset($_SESSION['success_message']);
header("Location: ../index1.php");
exit();
?>
