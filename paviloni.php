<?php
include('include/callback.php');
include('include/register.php');
include('include/login.php');
include('include/db.php');
include('include/submit_application.php');
$current_page = basename($_SERVER['PHP_SELF']);
?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>Павильоны</title>
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
    <link rel="manifest" href="/site.webmanifest">
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,400;0,500;0,700;1,300&display=swap"
        rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

    <nav>
    <div class="nav-logo">
            <img src="img/Gerb.png" style="margin-right: 20px"alt="Эмблема">
            <h1>
                АРЕНДА <font color="BB0E0E"> ТОРГОВЫХ ОБЪЕКТОВ</font> В ПАРКАХ МОСКВЫ
            </h1>
            <?php if (isset($_SESSION['username'])): ?>
            <div class="exit-login"><b>Привет</b>, <font color="#BB0E0E"><?php echo htmlspecialchars($_SESSION['username']); ?></font>!</div>
            <a href="include/logout.php"><img src="img/exit.png" style="margin-left: 15px; width:19px; height:19px"></a>
            <?php else: ?>
            <button id="btn-nav-logo">Войти<img src="img/login.png" style="padding-left: 10px;" alt="login"></button>
            <?php endif; ?>
        </div>
        <!-- Модальное окно формы авторизации -->
        <div class="modal" id="loginModal">
            <div class="modal__content">
                <button class="modal__close-button"><img src="./img/close.svg" alt="Закрыть"></button>
                <h1 class="modal__title" text align="center">Авторизация</h1>
                <p class="modal__description">

                <form action="" method="post">
                    <label>
                        <input type="text" id="login" name="login" placeholder="Логин" required>
                    </label>
                    <label>
                        <br>
                        <input type="password" id="lpassword" name="lpassword" placeholder="Пароль" required>
                    </label>
                    <br>
                    <input class="send" type="submit" name="submit" value="Войти">
                </form>
                <p text align="center">Нет аккаунта? <a href="#" id="register-link">Зарегистрироваться</a></p>
                </p>
                </p>
            </div>
        </div>
        <!-- -->

        <!-- Модальное окно для регистрации -->
        <div class="modal" id="registerModal">
            <div class="modal__content">
                <button class="modal__close-button"><img src="./img/close.svg" alt="Закрыть"></button>
                <h1 class="modal__title" text align="center">Регистрация</h1>
                <p class="modal__description">
                <form action="" method="post">
             
                    <label>
                        <input type="text" id="username" name="username" placeholder="Имя пользователя" required >
                    </label>
                    <br>

                    <label>
                        <input type="password" id="password" name="password" placeholder="Пароль" required>
                    </label>
                    <br>
                    <label>
                        <input type="password" id="confirm_password" name="confirm_password"
                            placeholder="Подтвердите пароль" required>
                    </label>
                    <br>
                    <label>
                        <input class="send" type="submit" value="Зарегистрироваться"></input>
                    </label>
                </form>
                </p>
            </div>
        </div>
        <!-- -->
        <div class="navbar">
    <li class="<?php if ($current_page == 'index1.php') echo 'active'; ?>"><a href="index1.php">Главная</a></li>
    <li class="<?php if ($current_page == 'TorgovieAvtomati.php') echo 'active'; ?>"><a href="TorgovieAvtomati.php">Торговые автоматы</a></li>
    <li class="<?php if ($current_page == 'kioski.php') echo 'active'; ?>"><a href="kioski.php">Киоски</a></li>
    <li class="<?php if ($current_page == 'peredvijnie.php') echo 'active'; ?>"><a href="peredvijnie.php">Передвижные торговые объекты</a></li>
    <li class="<?php if ($current_page == 'paviloni.php') echo 'active'; ?>"><a href="paviloni.php">Павильоны</a></li>
    <li id="callback-button">Обратная связь</li>
</div>
        <!-- Модальное окно обратной связи -->
        <div class="modal" id="callbackModal">
            <div class="modal__content">
                <button class="modal__close-button"><img src="./img/close.svg" alt="Закрыть"></button>
                <h1 class="modal__title" text align="center">Свяжитесь с нами</h1>
                <p class="modal__description">
                <form action="" method="POST">

                    <label>
                        <input class type="text" id="name" name="name" placeholder="Фамилия Имя Отчество" required>
                    </label>
                    <label>
                        <br>
                        <input type="text" id="phone" name="phone" placeholder="Номер телефона +7" required>
                    </label>
                    <br>
                    <input class="send" type="submit" name="submit" value="Отправить">
                </form>
                </p>
            </div>
        </div>
        <!-- -->
       
    </nav>
    <header>
        <div class="main-text">
            <span>Аренда павильонов в парках Москвы – это отличная возможность для создания комфортного и прибыльного бизнеса 
            в живописных и посещаемых местах столицы. </span>
        </div>
        <img class="img-header" src="img/pav 1.png" alt="Павильон" style="margin:60px auto 60px auto; display:block">
       
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Введите метро">
        <?php
     $sql = "SELECT *
      FROM pavilony";
            $result = $link->query($sql); 
            while ($row = $result->fetch_assoc())
            { 
             echo '
         <div class="cards-container">
            <div class="vending_machine-container">
             <img src='.$row['foto_objekta'].' width="338px" height="319px">
                                 <span class="cards-container-db">
                                     <li><b>
                                             <font color="red" size="5px"> '.$row['ploshchad_objekta'].'</font>
                                         </b></li>
                                     <li>
                                         <font size="4px"><b>'.$row['tip_objekta_id'].'</b></font>
                                     </li>
                                     <li>'.$row['adres'].'</li>
                                    <li><b>Начальная цена за объект: </b>'.$row['nachalnaya_cena'].' руб.</li>
                                     <li><b>Размер задатка: </b>'.$row['razmer_zadatka'].' руб.</li>
                                     <li><b>Вид торгов: </b>'.$row['vid_torgov_id'].'</li>
                                     <li><img src='.$row['image_metro_line_id'].'></li>
                                        <li id="metro"> <font size="5em"><b>'.$row['stanciya_metro_id'].'</b></font></li>
                                 </span>
                                 <input class="open-modal" type="button" value="Подать заявку" data-id="' . $row['id'] . '" data-type="' . $row['tip_objekta_id'] . '">
                                 </div>
                             </div>
                          ';
            }
       
       ?>
 
   
    
 <!-- Модальное окно для заполнения заявки-->
 <div class="modal" id="applicationModal">
            <div class="modal__content">
                <button class="modal__close-button"><img src="./img/close.svg" alt="Закрыть"></button>
                <h1 class="modal__title" text align="center">Заявка на участие в торгах</h1>
                <p class="modal__description">
                <form action="" method="POST" enctype="multipart/form-data">
                
                    <input type="hidden" name="applicant_name" value="<?php echo $_SESSION['username']; ?>">
                    <input type="hidden" id="objekt_id" name="objekt_id">
                <input type="hidden" id="objekt_type" name="objekt_type">
                <br>
                <br>
                    <br>
                    <b>Загрузите документы (PDF/DOCX):</b>
                    <br><br>
                    Оригинал или копия любого документа, который подтверждает полномочия руководителя. Для ООО — приказ,
                    положение или протокол общего собрания участников, для ИП — свидетельство ОГРИП и паспорт.
                    <br>
                    <label>
                        <br>
                        <input type="file" name="document1" accept=".pdf,.docx" required>
                        <br>
                    </label>
                    Копия выписки из ЕГРЮЛ, выданная в течение 6 месяцев до подачи документов.
                    <br>
                    <label>
                        <br>
                        <input type="file" name="document2" accept=".pdf,.docx" required>
                    </label>
                    <br>
                    <label>
                        <input type="email" id="password" name="email" placeholder="Ваш Email" required>
                    </label>
                    <br>
                    <input class="send" type="submit" name="submit" value="Отправить заявку">
                </form>
                </p>
            </div>
        </div>
        <!-- -->
    </header>
    <main>
        <div class="main-info">
            <h2>Как принять участие в торгах?</h2>
            <br>
            <hr color="#BB0E0E" width="780px">
            <li><img src="img/Frame 3.png" alt="1"> Выберите объект. В карточке есть описание объекта,
                указаны сумма задатка и ссылка на площадку, где пройдут торги.</li>
            <hr color="#BB0E0E" width="780px">
            <li><img src="img/Frame 4.png" alt="2">
                <a href="https://mbm.mos.ru/article/start/poluchenie-ehlektronnoj-podpisi/kak-poluchit-elektronnuyu-podpis_841144"
                    target="_blank">
                    Получите</a> электронную подпись, если ее нет. Она понадобится для регистрации на торговой
                площадке
            </li>
            <hr color="#BB0E0E" width="780px">
            <li><img src="img/Frame 5.png" alt="3"><br>Внесите задаток.</li>
            <hr color="#BB0E0E" width="780px">
            <li><img src="img/Frame 6.png" alt="4"><br>Подайте заявку.</li>
        </div>
        <div class="main-info-2">
            <h2>Какие документы нужны для заявки?</h2>
            <br>
            <span class="span-1">
                <li>Оригинал или копия любого документа, который подтверждает полномочия
                    руководителя. Для ООО — приказ, положение или протокол общего
                    собрания участников, для ИП — свидетельство ОГРИП и паспорт.</li>
                <li>Юрлицам — копия выписки из ЕГРЮЛ, выданная в течение 6 месяцев до подачи документов.</li>
                <li>ИП — копия выписки из ЕГРИП, выданная в течение 6 месяцев до подачи документов.</li>
                <li>Если в аукционе участвует представитель — доверенность. ИП и самозанятым ее придется заверить у
                    нотариуса.</li>
                <br>
                Для участия в торгах отправьте документы в электронном виде. <br><br>
                Если проблем с документами нет, в течение часа на почту придет уведомление о приеме заявки.
                Чтобы арендовать точку, подключитесь к торгам в нужный день и предложите лучшую цену.
            </span>
            <br><br>
            <h2>На сколько заключают договор?</h2>
            <br>
            <span class="span-2">
                На 5 лет. Однако некоторые объекты могут работать только в определенное время.
                Киоски для продажи мороженого и прохладительных напитков — с 1 мая по 1 октября,
                а объекты по продаже горячих напитков и выпечки — с 1 октября по 1 мая. Остальные торговые объекты
                могут
                работать круглогодично.
            </span>
        </div>
    </main>
    <footer>
        <img src="img/Gerb2.png" alt="Герб">
        <div class="footer-info">
           
            <br>
            ©2024 Аренда торговых объектов в парках Москвы
        </div>
    </footer>
    <script>
     $(function() {
        $('.open-modal').click(function() {
        const objektId = $(this).data('id');
        const objektType = $(this).data('type');

        <?php if (isset($_SESSION['username'])): ?>
            $('#objekt_id').val(objektId);
            $('#objekt_type').val(objektType);
            $('#applicationModal').addClass('modal_active');
        <?php else: ?>
            $('#loginModal').addClass('modal_active');
            $('#loginModal').data('objekt_id', objektId);
            $('#loginModal').data('objekt_type', objektType);
        <?php endif; ?>
        });
    });
    </script>
    <script src="js/script.js"></script>
</body>

</html>