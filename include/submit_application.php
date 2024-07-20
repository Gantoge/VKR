<?php
$servername = "localhost";
$database = "Objects";
$db_username = "root";
$db_password = "Hbnf100500";

$link = new mysqli($servername, $db_username, $db_password, $database);

if ($link->connect_error) {
    die("Ошибка подключения: " . $link->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['submit']) && isset($_POST['objekt_type']) && isset($_POST['email']) && isset($_POST['objekt_id'])) {
        $applicant_name = mysqli_real_escape_string($link, $_SESSION['username']);
        $objekt_id = mysqli_real_escape_string($link, $_POST['objekt_id']);
        $objekt_type = mysqli_real_escape_string($link, $_POST['objekt_type']);
        $applicant_email = mysqli_real_escape_string($link,$_POST['email']);

  
        $uploadDir = 'uploads/';
        $document1 = $uploadDir . basename($_FILES["document1"]["name"]);
        $document2 = $uploadDir . basename($_FILES["document2"]["name"]);

    
        if (move_uploaded_file($_FILES["document1"]["tmp_name"], $document1) && move_uploaded_file($_FILES["document2"]["tmp_name"], $document2)) {
          
            $current_page = basename($_SERVER['PHP_SELF']);
            if ($current_page == 'TorgovieAvtomati.php') {
                $objekt_type_query = "SELECT tip_objekta_id 
                FROM torgovye_avtomaty 
                WHERE torgovye_avtomaty.id = $objekt_id";
            } elseif ($current_page == 'kioski.php') {
                $objekt_type_query = "SELECT tip_objekta_id 
                FROM kioski 
                WHERE kioski.id = $objekt_id";
            } elseif ($current_page == 'peredvijnie.php') {
                $objekt_type_query = "SELECT tip_objekta_id  
                FROM torgovye_peredvizhnye_objekty 
                WHERE torgovye_peredvizhnye_objekty.id = $objekt_id";
            } elseif ($current_page == 'paviloni.php') {
                $objekt_type_query = "SELECT tip_objekta_id  
                FROM pavilony  
                WHERE pavilony.id = $objekt_id";
            } else {
                die("Ошибка: неверная страница.");
            }

            $objekt_type_result = $link->query($objekt_type_query);
            if ($objekt_type_result && $objekt_type_result->num_rows > 0) {
                $objekt_type = $objekt_type_result->fetch_assoc()['tip_objekta_id'];

                $sql = "INSERT INTO applications (applicant_name, applicant_email, objekt_id, objekt_type, document1, document2) 
                        VALUES ('$applicant_name', '$applicant_email', '$objekt_id', '$objekt_type', '$document1', '$document2')";

                if ($link->query($sql) === TRUE) {
                    echo '<script>
                        alert("Заявка успешно отправлена");
                        window.location.href = "'.basename($_SERVER['PHP_SELF']).'";
                    </script>';
                } else {
                    echo "Ошибка: " . $link->error;
                }
            } else {
                echo "Ошибка: не удалось определить тип объекта.";
            }
        } else {
            echo "Ошибка загрузки файлов.";
        }
    } else {
        echo "Все поля обязательны для заполнения.";
    }
}

?>