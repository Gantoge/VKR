<?php
session_start();
// Удаляем только данные авторизации из сессии
unset($_SESSION['username']);
unset($_SESSION['success_message']);
header("Location: index1.php");
exit();
?>
