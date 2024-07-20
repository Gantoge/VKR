<?php
// Подключение к БД
$servername = "localhost";
$database = "Objects";
$db_username = "root";
$db_password = "Hbnf100500";

//Проверка подключения

$link = new mysqli($servername, $db_username, $db_password, $database);
if ($link->connect_error) {
    die("Ошибка подключения: " . $link->connect_error);
}
?>