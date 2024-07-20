<?php
session_start();
$servername = "localhost";
$database = "Objects";
$db_username = "root";
$db_password = "Hbnf100500";

$link = new mysqli($servername, $db_username, $db_password, $database);

if ($link->connect_error) {
    die("Ошибка подключения: " . $link->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['login']) && isset($_POST['lpassword']) && isset($_POST['submit'])) {          
    $login = trim($_POST['login']);
    $password = mysqli_real_escape_string($link, $_POST['lpassword']);


    if (empty($login) || empty($password)) {
        echo "Пожалуйста, заполните все поля.";
    } else {
        $login = $link->real_escape_string($login);
        $sql = "SELECT username, password FROM users WHERE username = '$login'";
        $result = $link->query($sql);

        if ($result && $result->num_rows == 1) {
            $row = $result->fetch_assoc();

            if (password_verify($password, $row['password'])) {
               
                $_SESSION['username'] = $row['username'];
                echo '<script>
                        alert("Вход выполнен.");
                        window.location.href = "'.basename($_SERVER['PHP_SELF']).'";
                    </script>';
                exit();
            } else {
                echo "Неверный пароль.";
            }
        } else {
            echo "Пользователь с таким логином не найден.";
        }
    }
}

}
$link->close();
?>
