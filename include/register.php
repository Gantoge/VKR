<?php
$servername = "localhost";
$database = "Objects";
$db_username = "root";
$db_password = "Hbnf100500";


$link = new mysqli($servername, $db_username, $db_password, $database);

if ($link->connect_error) {
    die("Ошибка подключения: " . $link->connect_error);
}


    if (isset($_POST['username']) && isset($_POST['password']) && isset($_POST['confirm_password'])) {
        $username = trim($_POST["username"]);
        $password = trim($_POST["password"]);
        $confirm_password = trim($_POST["confirm_password"]);
     
        

        if (empty($username) || empty($password) || empty($confirm_password)) {
            echo "Пожалуйста, заполните все поля.";
        } elseif ($password != $confirm_password) {
            echo "Пароли не совпадают.";
        } else {
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $username = $link->real_escape_string($username);

            $hashed_password = $link->real_escape_string($hashed_password);

            $sql = "INSERT INTO users (username, password) VALUES ('$username', '$hashed_password')";

            if ($link->query($sql) === TRUE) {
                echo '<script>
                        alert("Регистрация прошла успешно.");
                        window.location.href = "'.basename($_SERVER['PHP_SELF']).'";
                    </script>';
            } else {
                echo "Ошибка: " . $link->error;
            }
        }
    }



?>