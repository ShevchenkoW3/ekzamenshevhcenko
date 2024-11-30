-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 30 2024 г., 10:11
-- Версия сервера: 5.7.39
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ekzamenshevchenko`
--

-- --------------------------------------------------------

--
-- Структура таблицы `arenda`
--

CREATE TABLE `arenda` (
  `id_arenda` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_car` int(11) NOT NULL,
  `arenda_start` date DEFAULT NULL,
  `arenda_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id_car` int(11) NOT NULL,
  `name_car` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `img` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id_car`, `name_car`, `price`, `img`) VALUES
(1, 'Toyota Camry', '1500.00', 'car1.jpg'),
(2, 'Volkswagen Golf', '1200.00', 'car2.jpg'),
(3, 'Ford Focus', '1300.00', 'car3.jpg'),
(4, 'BMW X5', '3000.00', 'car4.jpg'),
(5, 'Mercedes-Benz', '2500.00', 'car5.jpg'),
(6, 'Hyundai Tucson', '1800.00', 'car6.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `fio` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `fio`, `login`, `password`) VALUES
(1, 'Иванов Иван Иванович', 'aaa', '123');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `arenda`
--
ALTER TABLE `arenda`
  ADD PRIMARY KEY (`id_arenda`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_car` (`id_car`);

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id_car`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `arenda`
--
ALTER TABLE `arenda`
  MODIFY `id_arenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id_car` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `arenda`
--
ALTER TABLE `arenda`
  ADD CONSTRAINT `arenda_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arenda_ibfk_2` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id_car`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
