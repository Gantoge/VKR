<?php

$servername = "localhost";
$database = "Objects";
$db_username = "root";
$db_password = "Hbnf100500";


$link = new mysqli($servername, $db_username, $db_password, $database);
if ($link->connect_error) {
    die("Ошибка подключения: " . $link->connect_error);
}

// Отправка данных из формы обратной связи
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['name']) && isset($_POST['phone']) && isset($_POST['submit'])) {
        $name = $link->real_escape_string($_POST['name']);
        $phone = $link->real_escape_string($_POST['phone']);

        $sql = "INSERT INTO callback (imya, nomer_telefona) VALUES ('$name', '$phone')";
        if ($link->query($sql) === TRUE) {
            echo '<script>
            alert("Данные отправлены!");
            window.location.href = "'.basename($_SERVER['PHP_SELF']).'";
        </script>';
        } else {
            echo "Error: " . $sql . "<br>" . $link->error;
        }
    } 
} 
?>