-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 22 2024 г., 20:16
-- Версия сервера: 8.2.0
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `objects`
--

-- --------------------------------------------------------

--
-- Структура таблицы `applications`
--

DROP TABLE IF EXISTS `applications`;
CREATE TABLE IF NOT EXISTS `applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `applicant_name` varchar(255) NOT NULL,
  `applicant_email` varchar(255) NOT NULL,
  `objekt_id` int NOT NULL,
  `objekt_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `document1` varchar(255) NOT NULL,
  `document2` varchar(255) NOT NULL,
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `applicant_name` (`applicant_name`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `callback`
--

DROP TABLE IF EXISTS `callback`;
CREATE TABLE IF NOT EXISTS `callback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imya` varchar(255) NOT NULL,
  `nomer_telefona` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `images_metro`
--

DROP TABLE IF EXISTS `images_metro`;
CREATE TABLE IF NOT EXISTS `images_metro` (
  `id` int NOT NULL,
  `image_metro` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_metro` (`image_metro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `images_metro`
--

INSERT INTO `images_metro` (`id`, `image_metro`) VALUES
(1, 'img/1.png'),
(10, 'img/10.png'),
(2, 'img/2.png'),
(3, 'img/3.png'),
(4, 'img/4.png'),
(6, 'img/6.png'),
(7, 'img/7.png'),
(8, 'img/8.png');

-- --------------------------------------------------------

--
-- Структура таблицы `kioski`
--

DROP TABLE IF EXISTS `kioski`;
CREATE TABLE IF NOT EXISTS `kioski` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tip_objekta_id` varchar(255) DEFAULT NULL,
  `ploshchad_objekta` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stanciya_metro_id` varchar(255) DEFAULT NULL,
  `adres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nachalnaya_cena` decimal(65,0) NOT NULL,
  `razmer_zadatka` decimal(65,0) NOT NULL,
  `vid_torgov_id` varchar(255) DEFAULT NULL,
  `image_metro_line_id` varchar(255) DEFAULT NULL,
  `foto_objekta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_metro_line_id` (`image_metro_line_id`),
  KEY `stanciya_metro_id` (`stanciya_metro_id`),
  KEY `tip_objekta_id` (`tip_objekta_id`),
  KEY `vid_torgov_id` (`vid_torgov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `kioski`
--

INSERT INTO `kioski` (`id`, `tip_objekta_id`, `ploshchad_objekta`, `stanciya_metro_id`, `adres`, `nachalnaya_cena`, `razmer_zadatka`, `vid_torgov_id`, `image_metro_line_id`, `foto_objekta`) VALUES
(1, 'Киоск', '14 М²', 'Перово', 'ВАО, улица Лазо, владение 7, юго-западная часть Перовского парка культуры и отдыха', 56000, 448000, 'Право осуществления торговой деятельности', 'img/8.png', 'img/Kioski/1.jpg'),
(2, 'Киоск', '15 М²', 'Ховрино', 'САО, Прибрежный проезд 7, (возле скейт-парка) ГАУК г. Москвы \"МПК \"Северное Тушино\" (НТО15)', 60750, 486000, 'Право осуществления торговой деятельности', 'img/2.png', 'img/Kioski/2.jpg'),
(3, 'Киоск', '13 М²', 'Сокольники', 'ВАО, 1-й Лучевой просек, 9, территория парка Сокольники', 55900, 426000, 'Право осуществления торговой деятельности', 'img/1.png', 'img/Kioski/3.jpg'),
(4, 'Киоск', '12 М²', 'Воробьёвы горы', 'ЗАО, ул. Косыгина, 10, территория парка Воробьёвы горы', 49400, 416000, 'Право осуществления торговой деятельности', 'img/1.png', 'img/Kioski/4.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `pavilony`
--

DROP TABLE IF EXISTS `pavilony`;
CREATE TABLE IF NOT EXISTS `pavilony` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tip_objekta_id` varchar(255) DEFAULT NULL,
  `ploshchad_objekta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stanciya_metro_id` varchar(255) DEFAULT NULL,
  `adres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nachalnaya_cena` decimal(65,2) NOT NULL,
  `razmer_zadatka` decimal(65,2) NOT NULL,
  `vid_torgov_id` varchar(255) DEFAULT NULL,
  `image_metro_line_id` varchar(255) DEFAULT NULL,
  `foto_objekta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stanciya_metro_id` (`stanciya_metro_id`),
  KEY `vid_torgov_id` (`vid_torgov_id`),
  KEY `pavilony_ibfk_4` (`image_metro_line_id`),
  KEY `tip_objekta_id` (`tip_objekta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `pavilony`
--

INSERT INTO `pavilony` (`id`, `tip_objekta_id`, `ploshchad_objekta`, `stanciya_metro_id`, `adres`, `nachalnaya_cena`, `razmer_zadatka`, `vid_torgov_id`, `image_metro_line_id`, `foto_objekta`) VALUES
(1, 'Павильон', '120 М²', 'Селигерская', 'САО, парк по Ангарской улице в северной части парка, вблизи Большого пруда (НТО 1)', 168000.00, 1344000.00, 'Право размещения нестационарного объекта', 'img/10.png', 'img/Paviloni/1.jpg'),
(2, 'Павильон', '54,8 М²', 'Проспект Вернадского', 'ЗАО, ГАУК г. Москвы ПКиО «Фили», территория парка 50-летия Октября, Проспект Вернадского, д. 14а', 90000.00, 720000.00, 'Право осуществления торговой деятельности', 'img/1.png', 'img/Paviloni/2.jpg'),
(3, 'Павильон', '103 М²', 'Красные Ворота', 'ВАО, «Сад культуры и отдыха им. Н.Э. Баумана», справа от главной аллеи, возле правой стены парка', 101970.00, 815760.00, 'Право осуществления торговой деятельности', 'img/1.png', 'img/Paviloni/3.jpg'),
(4, 'Павильон', '115 М²', 'Филёвский парк', 'ЗАО ,ул. Б. Филевская 22, стр. 13 территория ГАУК г. Москвы ПКиО \"Фили\" (НТО 15)', 214760.00, 1718080.00, 'Право осуществления торговой деятельности', 'img/4.png', 'img/Paviloni/4.jpg'),
(5, 'Павильон', ' 209,28 М²', 'Ховрино', 'г. Москва, ГАУК г. Москвы \"МПК \"Северное Тушино\", Парк между каналом им. Москвы и Левобережной улицей, Левобережная улица, 32 (возле госпиталя № 6) (НТО 10)', 213591.17, 1708729.36, 'Право осуществления торговой деятельности', 'img/2.png', 'img/Paviloni/5.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `stancii_metro`
--

DROP TABLE IF EXISTS `stancii_metro`;
CREATE TABLE IF NOT EXISTS `stancii_metro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazvanie` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nazvanie` (`nazvanie`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `stancii_metro`
--

INSERT INTO `stancii_metro` (`id`, `nazvanie`) VALUES
(10, 'Беломорская'),
(7, 'ВДНХ'),
(16, 'Воробьёвы горы'),
(3, 'Красные Ворота'),
(6, 'Октябрьская'),
(5, 'Парк Культуры'),
(11, 'Парк Победы'),
(14, 'Перово'),
(2, 'Проспект Вернадского'),
(9, 'Речной Вокзал'),
(1, 'Селигерская'),
(8, 'Сокольники'),
(12, 'Сокольники'),
(4, 'Филёвский парк'),
(15, 'Ховрино');

-- --------------------------------------------------------

--
-- Структура таблицы `tipy_objektov`
--

DROP TABLE IF EXISTS `tipy_objektov`;
CREATE TABLE IF NOT EXISTS `tipy_objektov` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazvanie` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nazvanie` (`nazvanie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tipy_objektov`
--

INSERT INTO `tipy_objektov` (`id`, `nazvanie`) VALUES
(2, 'Киоск'),
(4, 'Павильон'),
(1, 'Передвижной торговый объект'),
(3, 'Торговый автомат');

-- --------------------------------------------------------

--
-- Структура таблицы `torgovye_avtomaty`
--

DROP TABLE IF EXISTS `torgovye_avtomaty`;
CREATE TABLE IF NOT EXISTS `torgovye_avtomaty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tip_objekta_id` varchar(255) DEFAULT NULL,
  `ploshchad_objekta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stanciya_metro_id` varchar(255) DEFAULT NULL,
  `adres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nachalnaya_cena` decimal(65,2) DEFAULT NULL,
  `razmer_zadatka` decimal(65,2) NOT NULL,
  `vid_torgov_id` varchar(255) DEFAULT NULL,
  `image_metro_line_id` varchar(255) DEFAULT NULL,
  `foto_objekta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_metro_line_id` (`image_metro_line_id`),
  KEY `stanciya_metro_id` (`stanciya_metro_id`),
  KEY `tip_objekta_id` (`tip_objekta_id`),
  KEY `vid_torgov_id` (`vid_torgov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `torgovye_avtomaty`
--

INSERT INTO `torgovye_avtomaty` (`id`, `tip_objekta_id`, `ploshchad_objekta`, `stanciya_metro_id`, `adres`, `nachalnaya_cena`, `razmer_zadatka`, `vid_torgov_id`, `image_metro_line_id`, `foto_objekta`) VALUES
(1, 'Торговый автомат', '4,5 М²', 'Парк Культуры', 'ЗАО, ул.Крымский Вал, 9, территория центрального парка культуры и отдыха им. М.Горького', 54500.00, 340000.00, 'Право размещения нестационарного объекта', 'img/1.png', 'img/TorgAvt/1.jpg'),
(2, 'Торговый автомат', '1,44 М²', 'Октябрьская', 'ЗАО, ул. Крымский Вал, з/у 9 (НТО № 202 Ленинская площадь (Центральный вход слева', 92060.00, 920600.00, 'Право размещения нестационарного объекта', 'img/7.png', 'img/TorgAvt/2.jpg'),
(3, 'Торговый автомат', '1,5 М²', 'ВДНХ', 'СВАО, просп. Мира, 119, стр. 58, территория парках ВДНХ, Центр славянской письменности Слово', 87000.00, 734000.00, 'Право размещения нестационарного объекта', 'img/6.png', 'img/TorgAvt/3.jpg'),
(4, 'Торговый автомат', '3,6 М²', 'Сокольники', 'ВАО, Митьковский пр., 17, территория парка Сокольники', 368000.00, 177000.00, 'Право размещения нестационарного объекта', 'img/1.png', 'img/TorgAvt/4.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `torgovye_peredvizhnye_objekty`
--

DROP TABLE IF EXISTS `torgovye_peredvizhnye_objekty`;
CREATE TABLE IF NOT EXISTS `torgovye_peredvizhnye_objekty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tip_objekta_id` varchar(255) DEFAULT NULL,
  `ploshchad_objekta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stanciya_metro_id` varchar(255) DEFAULT NULL,
  `adres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nachalnaya_cena` decimal(65,2) NOT NULL,
  `razmer_zadatka` decimal(65,2) NOT NULL,
  `vid_torgov_id` varchar(255) DEFAULT NULL,
  `image_metro_line_id` varchar(255) DEFAULT NULL,
  `foto_objekta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_metro_line_id` (`image_metro_line_id`),
  KEY `stanciya_metro_id` (`stanciya_metro_id`),
  KEY `tip_objekta_id` (`tip_objekta_id`),
  KEY `vid_torgov_id` (`vid_torgov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `torgovye_peredvizhnye_objekty`
--

INSERT INTO `torgovye_peredvizhnye_objekty` (`id`, `tip_objekta_id`, `ploshchad_objekta`, `stanciya_metro_id`, `adres`, `nachalnaya_cena`, `razmer_zadatka`, `vid_torgov_id`, `image_metro_line_id`, `foto_objekta`) VALUES
(1, 'Передвижной торговый объект', '1,25 М²', 'Речной Вокзал', 'САО, Ленинградское шоссе, 51, территория парка Северного речного вокзала', 29000.00, 211300.00, 'Право осуществления торговой деятельности', 'img/2.png', 'img/Peredvijnie/1.jpg'),
(2, 'Передвижной торговый объект', '1,3 М²', 'Парк Победы', 'ЗАО, площадь Победы, 3, стр. 2, территория парка Победы на Поклонной горе', 34000.00, 254000.00, 'Право осуществления торговой деятельности', 'img/3.png', 'img/Peredvijnie/2.jpg'),
(3, 'Передвижной торговый объект', '6 М²', 'Сокольники', 'ВАО, ул. Сокольнический Вал, 1, стр. 1, территория парка Сокольники', 43000.00, 330000.00, 'Право осуществления торговой деятельности', 'img/1.png', 'img/Peredvijnie/3.jpg'),
(4, 'Передвижной торговый объект', '2 М²', 'Речной Вокзал', 'САО, Лениградское ш., д. 51Б, территория парка Северного речного вокзала', 78000.00, 514000.00, 'Право осуществления торговой деятельности', 'img/2.png', 'img/Peredvijnie/4.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(64, 'Рита', '$2y$10$cwfThPcCsMpHJGOEe7XF1uC38TKDarr4TOAlnnv56O3f6zE/GRq66', '2024-06-03 04:37:11'),
(67, 'Кучерова Маргарита', '$2y$10$lK2IspQp8aNSH.ixeluqreYYEps5B6.cNFHMcbX/et0xWWxb6K3a.', '2024-06-10 21:01:31');

-- --------------------------------------------------------

--
-- Структура таблицы `vidy_torgov`
--

DROP TABLE IF EXISTS `vidy_torgov`;
CREATE TABLE IF NOT EXISTS `vidy_torgov` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazvanie` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nazvanie` (`nazvanie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `vidy_torgov`
--

INSERT INTO `vidy_torgov` (`id`, `nazvanie`) VALUES
(1, 'Право осуществления торговой деятельности'),
(2, 'Право размещения нестационарного объекта');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`applicant_name`) REFERENCES `users` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `kioski`
--
ALTER TABLE `kioski`
  ADD CONSTRAINT `kioski_ibfk_1` FOREIGN KEY (`image_metro_line_id`) REFERENCES `images_metro` (`image_metro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `kioski_ibfk_2` FOREIGN KEY (`stanciya_metro_id`) REFERENCES `stancii_metro` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `kioski_ibfk_3` FOREIGN KEY (`tip_objekta_id`) REFERENCES `tipy_objektov` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `kioski_ibfk_4` FOREIGN KEY (`vid_torgov_id`) REFERENCES `vidy_torgov` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `pavilony`
--
ALTER TABLE `pavilony`
  ADD CONSTRAINT `pavilony_ibfk_1` FOREIGN KEY (`image_metro_line_id`) REFERENCES `images_metro` (`image_metro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pavilony_ibfk_2` FOREIGN KEY (`stanciya_metro_id`) REFERENCES `stancii_metro` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pavilony_ibfk_3` FOREIGN KEY (`tip_objekta_id`) REFERENCES `tipy_objektov` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pavilony_ibfk_4` FOREIGN KEY (`vid_torgov_id`) REFERENCES `vidy_torgov` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `torgovye_avtomaty`
--
ALTER TABLE `torgovye_avtomaty`
  ADD CONSTRAINT `torgovye_avtomaty_ibfk_1` FOREIGN KEY (`image_metro_line_id`) REFERENCES `images_metro` (`image_metro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `torgovye_avtomaty_ibfk_2` FOREIGN KEY (`stanciya_metro_id`) REFERENCES `stancii_metro` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `torgovye_avtomaty_ibfk_3` FOREIGN KEY (`tip_objekta_id`) REFERENCES `tipy_objektov` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `torgovye_avtomaty_ibfk_4` FOREIGN KEY (`vid_torgov_id`) REFERENCES `vidy_torgov` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `torgovye_peredvizhnye_objekty`
--
ALTER TABLE `torgovye_peredvizhnye_objekty`
  ADD CONSTRAINT `torgovye_peredvizhnye_objekty_ibfk_1` FOREIGN KEY (`image_metro_line_id`) REFERENCES `images_metro` (`image_metro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `torgovye_peredvizhnye_objekty_ibfk_2` FOREIGN KEY (`stanciya_metro_id`) REFERENCES `stancii_metro` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `torgovye_peredvizhnye_objekty_ibfk_3` FOREIGN KEY (`tip_objekta_id`) REFERENCES `tipy_objektov` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `torgovye_peredvizhnye_objekty_ibfk_4` FOREIGN KEY (`vid_torgov_id`) REFERENCES `vidy_torgov` (`nazvanie`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
