-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 30 2023 г., 05:29
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car_service_gc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL COMMENT 'id машины',
  `car_country` varchar(256) NOT NULL COMMENT 'страна изготовитель',
  `car_brand` varchar(256) NOT NULL COMMENT 'марка машины',
  `car_model` varchar(256) NOT NULL COMMENT 'модель машины',
  `availability` varchar(256) NOT NULL COMMENT 'наличие',
  `price` int(11) NOT NULL COMMENT 'цена машины'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='таблица с основной информацией о машине';

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `c_id` int(11) NOT NULL COMMENT 'id клиента',
  `c_fname` varchar(256) NOT NULL COMMENT 'имя ',
  `c_sname` varchar(256) NOT NULL COMMENT 'фамилия ',
  `c_mname` varchar(256) NOT NULL COMMENT 'отчество ',
  `passport_serial` int(11) NOT NULL COMMENT 'серия паспорта ',
  `passport_number` int(11) NOT NULL COMMENT 'номер паспорта ',
  `address` varchar(256) NOT NULL COMMENT 'адрес',
  `phone` varchar(50) NOT NULL COMMENT 'номер телефона '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='информация о клиенте';

-- --------------------------------------------------------

--
-- Структура таблицы `client_cars`
--

CREATE TABLE `client_cars` (
  `car_id` int(11) NOT NULL COMMENT 'id машины',
  `c_id` int(11) NOT NULL COMMENT 'id клиента',
  `delivery` varchar(256) NOT NULL COMMENT 'доставка (да, нет)',
  `payment_method` varchar(256) NOT NULL COMMENT 'вид оплаты (нал, безнал)(кредит, разовая оплата)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tech_data`
--

CREATE TABLE `tech_data` (
  `car_id` int(11) NOT NULL COMMENT 'id машины',
  `body_type` varchar(256) NOT NULL COMMENT 'тип кузова',
  `door_num` int(11) NOT NULL COMMENT 'количество дверей',
  `seats_num` int(11) NOT NULL COMMENT 'количество мест',
  `engine_type` varchar(256) NOT NULL COMMENT 'тип двигателя',
  `engine_layout` varchar(256) NOT NULL COMMENT 'расположение двигателя',
  `engine_displacement` varchar(256) NOT NULL COMMENT 'рабочий объём двигателя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='технические данные машины';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`c_id`);

--
-- Индексы таблицы `client_cars`
--
ALTER TABLE `client_cars`
  ADD KEY `car_id` (`car_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Индексы таблицы `tech_data`
--
ALTER TABLE `tech_data`
  ADD KEY `car_id` (`car_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id машины';

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id клиента';

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `client_cars`
--
ALTER TABLE `client_cars`
  ADD CONSTRAINT `client_cars_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `client_cars_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `client` (`c_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tech_data`
--
ALTER TABLE `tech_data`
  ADD CONSTRAINT `tech_data_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
