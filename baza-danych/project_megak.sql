-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220714.346923e20a
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 15 Lip 2022, 18:42
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
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `attraction`
--

INSERT INTO `attraction` (`id`, `nameAttraction`, `town`, `text`, `idCategory`, `valueLike`, `img`, `active`) VALUES
('0a3bc589-d3f1-4689-a2f7-0624bbc22644', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 5, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('0c3cdd5f-ce9c-403a-971a-3a3587550623', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 5, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('18c735ef-a6df-4ebb-a145-48d07030047d', 'Jezioro lazurowe', 'k.Poznania', 'Piękne Jezioro lazurowe!', 1, 0, 'https://travelstory.pl/wp-content/uploads/2018/10/DJI_0595-1024x767.jpg', 0),
('1b9377f0-0fc2-4cd6-8838-84195b74c7ff', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('1e48f242-a5fe-4ac0-b4c2-7036a6f1ebe1', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('24d9994d-7b76-4e5e-83be-217cbefc4b0b', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('2b7e4c28-19ae-4463-b641-aec05db12454', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('3584282e-0ce0-43b6-85d8-83b68bbb9c52', 'Plaża w Decznie ', 'Świecie', 'Piękna plaża w Decznie', 3, 0, 'https://d-art.ppstatic.pl/kadry/k/r/b0/bf/5f76eb7c3b94b_o_full.jpg', 0),
('5bbd2093-1838-45b1-8d67-ad98e7330265', 'dawdawdawdwadawd', 'dawdawdaw', 'awdawdawdawdaww', 3, 0, 'https://grudziadz.pl/uploads/galleries/38b722904bda131c489314d7a302f721.jpg', 0),
('6f3a06a9-5ead-4ba8-9cd6-abe0ab722268', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('8769debe-b139-4893-a090-041d64c073a9', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('9043a2b1-282a-4313-845f-984f70b4ee9c', 'Piękny rynek w Grudziądzu', 'Grudziądz', 'Grudziądzki Rynek to plac w kształcie prostokąta o wymiarach 54 × 70 m, z odejściem ośmiu ulic w czterech rogach.', 1, 1, 'https://grudziadz.pl/uploads/galleries/38b722904bda131c489314d7a302f721.jpg', 0),
('952a794b-772c-4902-858f-7891c89cacd2', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('9bfb0232-0fd5-4c41-aab3-d00d0cfcba05', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 1, 17, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('ae177f59-7665-4a9d-ad72-7b39ad52e765', 'Piękne Góry w Tatrach', 'Zakopane', 'Piękne góry w tatrach! :D', 1, 5, 'https://apartamentyzakopane.pl/blog/wp-content/uploads/2020/04/20120719_AB3_0543.jpg', 0),
('af7d0150-749c-4e36-b658-ae4d45b7b05e', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('be93b471-0aea-4135-bc6e-8d5784285e41', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('c0f92c88-4907-45e0-982e-b2970c2674a7', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('d2e1cbe3-704b-4d62-94e6-9152ac297c8a', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('e1efc78c-39d7-4d64-b61f-ec6185fe9fbe', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('fc1eb0a5-1f6d-47d2-bd5e-908ccec8bf7b', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0),
('fc559a95-3dbd-4767-bb96-659b6db78f99', 'Spichrze Grudziądzkie', 'Grudziądz', 'Spichrze piekne :D', 2, 0, 'https://grudziadz.pl/uploads/galleries/b63b0b7bfc5d5e409424846ee1b7b63b.jpg', 0);

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
