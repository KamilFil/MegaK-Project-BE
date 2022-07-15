-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220714.346923e20a
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 15 Lip 2022, 21:48
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `project_megak`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `att-caregory`
--

CREATE TABLE `att-caregory` (
  `idCategory` int(6) NOT NULL,
  `name` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `att-caregory`
--

INSERT INTO `att-caregory` (`idCategory`, `name`) VALUES
(1, 'INNE'),
(2, 'DLA-DZIECI'),
(3, 'JEZIORA');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attraction`
--

CREATE TABLE `attraction` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UUID()',
  `nameAttraction` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCategory` int(6) NOT NULL DEFAULT 1,
  `valueLike` smallint(4) NOT NULL DEFAULT 0,
  `img` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `attraction`
--

INSERT INTO `attraction` (`id`, `nameAttraction`, `town`, `text`, `idCategory`, `valueLike`, `img`, `active`) VALUES
('0a2cbbad-7c4b-4d03-af8f-d6c78182a1f4', 'Jezioro Wigry', 'Wigry', 'Jezioro Wigry należy do Wigierskiego Parku Narodowego. Jest to jeden z najczystszych akwenów w Polsce, stąd nazywane jest także jeziorem o kryształowej toni.', 3, 0, 'https://images.slonecznapolska.com.pl/news/2013051822541707454403-a1mb31.png', 0),
('2e4eef3f-fb55-4f3b-a9ef-ea02ebe9d6a8', 'Tor motocrossowy Sulnówko', 'Sulnówko', 'Tor motocrossowy to miejsce, gdzie możesz przeżyć prawdziwą przygodę. Da się na nim jeździć rowerem, motocyklem i quadem. Sprawdź, jakie są polskie tory crossowe polecane przez innych miłośników motoryzacji. Dowiedz się, jak stworzyć samodzielnie taki tor!', 1, 0, 'https://m.wm.pl/2021/04/n/4-706811.jpg', 0),
('67a5e2eb-cd99-4715-aaf8-a36fcfc0c140', 'MegaPark w stylu dzikiego zachodu!', 'Grudziądz', 'Mega Park powstał 1 maja 1997 roku. Zaczęliśmy od \"Rancho\" - saloonu, w którym zarówno dawniej jak i dziś specjalnością są smażone ryby. Po kolejnych rozbudowach powstało Zoo, Dziki Zachód czyli Miasteczko Westernowe Kansas oraz Mexico City. ', 2, 0, 'https://slodkoslodka.pl/wp-content/uploads/2020/07/IMG_20200712_164126523_HDR.jpg', 0),
('6aa2c353-b781-4a54-b295-951a30063923', 'Jezioro Drawsko', 'Drawsko', 'Jeziora w Polsce często mają wyspy. To leżące na Pojezierzu Drawskim może pochwalić się aż dwunastoma. Największa z nich to Bielawa ze śladami wczesnego osadnictwa. ', 3, 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Jezioro_Drawsko_%281%29.jpg/800px-Jezioro_Drawsko_%281%29.jpg', 0),
('7fba6034-845f-47bd-8f2a-fd281c5a74f5', 'Jezioro Piaseczno', 'Ludwin', 'Czysta woda sprawia, że miejsce jest popularnym ośrodkiem wypoczynkowym na Pojezierzu Łęczycko-Włodawskim. Ale, ale…to nie wszystko! Piaszczyste dno Jeziora Piaseczno kryje w sobie tajemnice, sięgające czasów Drugiej Wojny Światowej. ', 3, 0, 'https://leczna24.pl/f/p/piasenczno_728897927.jpg', 0),
('c6a7acc6-ff49-40fb-bb12-24d31093bd13', 'IT.Focus - Producent najlepszych programistów! :D', 'Katowice', 'Najlepsze producent programistów w Polsce! Zapraszamy na MegaK.pl oraz kanał Youtube: Programistyczne Świry, gdzie możecie znaleźć masę ciekawostek! :) ', 1, 777, 'https://www.zsel1.pl/wp-content/uploads/2022/03/xlogo_IT_focus-1170x827.jpg.pagespeed.ic.eHoKsxZ8kT.jpg', 0),
('ecbc7146-52a8-44bf-8eda-3801150fb69b', 'Mandoria - Park rozrywki', 'Rzgów', 'Największy całoroczny park rozrywki w Polsce - Mandoria to ponad 20 atrakcji pod dachem. Kolejki górskie, wielkie karuzele, zjeżdżalnie i inne atrakcje. Wszystko w jednym miejscu.', 2, 0, 'https://kopanina.pl/wp-content/uploads/2022/04/Tytulowe-732x380.jpg', 0),
('f03aa82d-a881-4a44-9c61-eb7d77f66ba6', 'Energylandia - Park dla dzieci i nie tylko! ', 'Zator', ' tematyczny park rozrywki położony w Zatorze w województwie małopolskim, otwarty 14 lipca 2014 roku. Największy park rozrywki w Polsce', 1, 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Energylandia_-_Formu%C5%82a%2C_Dragon_2018.jpg/1200px-Energylandia_-_Formu%C5%82a%2C_Dragon_2018.jpg', 0),
('f73d3f14-82a1-4351-a4e6-bf92e24d83eb', 'Farma Iluzji - Mościska', 'Mościska', 'Farma Iluzji to niezwykły park o charakterze rozrywkowo-edukacyjnym osadzony w kontekście iluzji. Łącząc w umiejętny sposób atrakcje dla całej rodziny z doświadczeniami i faktami naukowymi, wspomaga rozwój intelektualny i sensoryczny oraz zachęca do aktywnej zabawy na świeżym powietrzu i piknikowania.', 2, 0, 'https://www.dzieciochatki.pl/storage/files/Artykuly/farma-iluzji/wycieczka-z-dziecmi-na-farme-iluzji.jpg', 0);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `att-caregory`
--
ALTER TABLE `att-caregory`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indeksy dla tabeli `attraction`
--
ALTER TABLE `attraction`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idCategory` (`idCategory`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `att-caregory`
--
ALTER TABLE `att-caregory`
  MODIFY `idCategory` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `attraction`
--
ALTER TABLE `attraction`
  ADD CONSTRAINT `attraction_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `att-caregory` (`idCategory`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
