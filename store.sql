-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Окт 21 2022 г., 15:04
-- Версия сервера: 8.0.30-0ubuntu0.22.04.1
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Goods`
--

CREATE TABLE `Goods` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Goods`
--

INSERT INTO `Goods` (`id`, `name`, `price`) VALUES
(1, 'Iphone X', 300),
(2, 'TV', 400),
(3, 'PS4', 100),
(4, 'Mac', 350),
(5, 'Fridge', 50),
(6, 'Iphone 7', 150),
(7, 'PS5', 200);

-- --------------------------------------------------------

--
-- Структура таблицы `orderList`
--

CREATE TABLE `orderList` (
  `id_orders` int UNSIGNED NOT NULL,
  `id_good` int UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orderList`
--

INSERT INTO `orderList` (`id_orders`, `id_good`, `quantity`, `price`) VALUES
(1, 5, 1, 50),
(2, 6, 1, 150),
(3, 7, 2, 200),
(4, 2, 1, 400),
(4, 3, 2, 100),
(1, 4, 1, 350),
(7, 2, 4, 400),
(8, 6, 1, 150);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int UNSIGNED NOT NULL,
  `person` int UNSIGNED DEFAULT NULL,
  `date_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `person`, `date_time`) VALUES
(1, 1, '2022-10-13'),
(2, 2, '2022-10-19'),
(3, 3, '2022-10-20'),
(4, 4, '2022-10-21'),
(5, 4, '2022-10-21'),
(6, 1, '2022-10-13'),
(7, 3, '2022-10-29'),
(8, 2, '2022-10-30');

-- --------------------------------------------------------

--
-- Структура таблицы `People`
--

CREATE TABLE `People` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `surname` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `People`
--

INSERT INTO `People` (`id`, `name`, `surname`, `birthday`) VALUES
(1, 'Andrew', 'Hawkins', '2002-12-29'),
(2, 'John', 'Fuerst', '2001-09-13'),
(3, 'Richard', 'Gomez', '1995-02-23'),
(4, 'Hovard', 'Silverman', '1998-11-04'),
(5, 'Jesse', 'Sutradhar', '2003-08-21');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Goods`
--
ALTER TABLE `Goods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `price` (`price`);

--
-- Индексы таблицы `orderList`
--
ALTER TABLE `orderList`
  ADD KEY `order_list_ibfk_1` (`id_good`),
  ADD KEY `order_list_ibfk_2` (`id_orders`),
  ADD KEY `order_list_ibfk_3` (`price`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person` (`person`);

--
-- Индексы таблицы `People`
--
ALTER TABLE `People`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Goods`
--
ALTER TABLE `Goods`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `People`
--
ALTER TABLE `People`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orderList`
--
ALTER TABLE `orderList`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`id_good`) REFERENCES `Goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_list_ibfk_3` FOREIGN KEY (`price`) REFERENCES `Goods` (`price`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`person`) REFERENCES `People` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
