-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 06 Kwi 2023, 09:24
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projektpai`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `category`
--

INSERT INTO `category` (`id_category`, `name`) VALUES
(1, 'Muzyka'),
(2, 'Sport'),
(3, 'Geografia'),
(4, 'Historia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  `link` varchar(512) DEFAULT NULL,
  `answerA` varchar(128) NOT NULL,
  `answerB` varchar(128) NOT NULL,
  `answerC` varchar(128) NOT NULL,
  `answerD` varchar(128) NOT NULL,
  `correct` varchar(128) NOT NULL,
  `id_category` int(11) NOT NULL,
  `counterA` int(11) DEFAULT 0,
  `counterB` int(11) DEFAULT 0,
  `counterC` int(11) DEFAULT 0,
  `counterD` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `questions`
--

INSERT INTO `questions` (`id`, `content`, `link`, `answerA`, `answerB`, `answerC`, `answerD`, `correct`, `id_category`, `counterA`, `counterB`, `counterC`, `counterD`) VALUES
(1, 'Jaki zespół wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1SBzyXpdVhBvbf4hEnLQwUmHhJbn3TVE_', 'Coldplay', '3 Doors Down', 'Nickelback', 'Guns N\' Roses', '3 Doors Down', 1, 0, 1, 0, 0),
(2, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1HiF1bJmUAsB2BaN5wI1k-msjhrnYKD5z', 'Stressed Out', 'Night Changes', 'Love Story', '7 Years', '7 Years', 1, 0, 0, 0, 0),
(3, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1kDM7K5JdIHxa7sZSROo1G8_plU1nnz-K', 'Creep', 'Fly Away', 'Dream On', 'Hero', 'Dream On', 1, 0, 0, 0, 0),
(4, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=198mpXP7G1kptaFtW56CfjfzvR2ljwO_n', 'Tired', 'Suns and Stars', 'Firework', 'In Your Eyes', 'Tired', 1, 0, 0, 0, 0),
(5, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1zmQ0RBkYyjkGNujsjCCF8LHUesoXg0XR', 'Ai Se Eu Te Pego', 'Fix You', 'A Sky Full Of Stars', 'My Universe', 'A Sky Full Of Stars', 1, 0, 0, 1, 0),
(6, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1ysR_0gtBu6TWY5W6CeSoVbn3AD9eEy5L', 'Rewrite the Stars', 'Wake Me Up', 'The Nights', 'Hey Brother', 'The Nights', 1, 0, 1, 0, 1),
(7, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1Mr_JgemrGkoRJDurb0HUA60Zj-H1S7-o', 'It will be OK', 'Waves', 'Before You Go', 'Be Alright', 'Be Alright', 1, 0, 0, 0, 1),
(8, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1pJpDO3bGn8DIn1jrjd6tnJl0b8u24Lym', 'Bon Jovi', 'Rolling Stones', 'Green Day', 'Metallica', 'Bon Jovi', 1, 1, 0, 0, 1),
(9, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1xRuSQp0_yzdc22gu2fdlCEKlDphHSqIB', 'Andrea Bocelli', 'Bryan Adams', 'Thomas Rhett', 'Mick Jagger', 'Bryan Adams', 1, 0, 0, 0, 0),
(10, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1mqDZsPo-l3wb4GIRt4-KZW6CF7xtZuXK', 'Carly Rae Jepsen', 'Katy Perry', 'Taylor Swift', 'Christina Aguilera', 'Carly Rae Jepsen', 1, 0, 0, 0, 0),
(11, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1g-Ywqx9QfLMnyU7janmvTiktI7AAWkNN', 'One Republic', 'One Direction', 'Coldplay', 'Twenty One Pilots', 'Coldplay', 1, 0, 0, 0, 0),
(12, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1DsmeegqESCP3KJuMHVALknnJAmyThQRo', 'Daniel Powter', 'Harry Styles', 'Justin Timberlake', 'Jason Mraz', 'Daniel Powter', 1, 0, 0, 0, 0),
(13, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1VLt_mxfjVZV8SLWbxrPCs6-Q4prM-5u8', 'Swedish House Mafia', 'Red Hot Chili Peppers', 'Vader', 'Iron Maiden', 'Swedish House Mafia', 1, 0, 0, 0, 0),
(14, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=17fE1JmXGdTbDsHnlEZY90FqP6MtZwRhE', 'Happier', 'Castle on the Hill', 'Give Me Love', 'Photograph', 'Photograph', 1, 0, 0, 0, 0),
(15, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1Wgv7ALJBAP7HSGqSHwCv2tDT9GIQf33r', 'Zayn Malik', 'Liam Payne', 'Ed Sheeran', 'Justin Bieber', 'Ed Sheeran', 1, 0, 1, 2, 0),
(16, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1NyBewtiZDPI_mcNj68baeZy6-4feHi1R', 'Overpass Graffiti', 'Something Just Like This', 'Galway Girl', 'Shape of You', 'Galway Girl', 1, 0, 0, 1, 0),
(17, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1MCutXrUlcjvnatVI2Fc2XNRHnl3qJxKG', 'Perfect', 'Apologize', 'You Are Beautiful', 'Beautiful in White', 'Perfect', 1, 2, 0, 0, 0),
(18, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=17jeCzIdcVaw51fc4C1UPfP7lUbVnxYyD', 'Eric Clapton', 'John Lennon', 'Paul McCartney', 'Sting', 'Eric Clapton', 1, 0, 0, 0, 0),
(19, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1zTYPzuJFd5CoDec7IYrWEjQbcVltI6V9', 'Someone You Know', 'Everyday Life', 'Every Person', 'Sunset Magic', 'Everyday Life', 1, 0, 1, 0, 0),
(20, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1-qlU9enZ6XbkaXwbOgzMzl-RxSNHrHSb', 'Boulevard of Broken Dreams', 'Nothing Else Matter', 'Numb', 'In the End', 'Boulevard of Broken Dreams', 1, 0, 0, 0, 0),
(21, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1afwzZYeou5QMSwmtnQ0bcbEq37kq-hSC', 'What I\'ve Done', 'Paradise City', 'Here Without You', 'I Don\'t Want To Miss a Thing', 'I Don\'t Want To Miss a Thing', 1, 0, 0, 1, 0),
(22, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1CUgOiWWc3zasHhVapHPemA01IqH5arTS', 'Enemy', 'Radioactive', 'Demons', 'Natural', 'Radioactive', 1, 0, 1, 0, 0),
(23, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1NHFFdCSbwhLlwGozmLhUWZh5CzUKfyAY', 'Lifehouse', 'Kings of Leon', 'Snow Patrol', 'Coldplay', 'Kings of Leon', 1, 0, 0, 0, 0),
(24, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=12s5iNneC0prv7cvKw4kvhwjFJY_Yl4yv', 'AC/DC', 'Kings of Leon', 'Guns N\' Roses', 'Led Zeppelin', 'Guns N\' Roses', 1, 0, 0, 2, 0),
(25, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1zRZEIIKbkZl8OnB6IX38Vubo85MwdDz4', 'Ed Sheeran', 'Passenger', 'James Bay', 'James Morrison', 'Passenger', 1, 0, 1, 0, 0),
(26, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1PzelyXwRvyiO6R7VxRpWTjI5jAwd7cPt', 'Numb', 'In the End', 'Leave Out All the Rest', 'Shadow of the Day', 'In the End', 1, 0, 1, 0, 0),
(27, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=16oSfcob9-y1cZR2_B1Sv9jrFxiY6MZnd', 'One Republic', 'The Script', 'Parachute', 'Maroon 5', 'Maroon 5', 1, 0, 0, 0, 1),
(28, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1RGe_J6_rMjR68gNr2FpiVr6j4qO7nOqx', 'Metallica', 'Iron Maiden', 'AC/DC', 'Scorpions', 'Metallica', 1, 0, 0, 1, 0),
(29, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1xvbk9N4mfSJ_rhJHnFflpFncAOtubemn', 'Wherever You Will Go', 'Numb', 'Behind Blue Eyes', 'In the Shadows', 'Numb', 1, 0, 1, 0, 1),
(30, 'Kto wykonuje tę piosenkę?', 'https://drive.google.com/uc?export=download&id=1BEcq-NQxTQZmXz24hP_L75LxAv2lx_ww', '5 Seconds of Summer', 'The Vamps', 'Shawn Mendes', 'One Direction', 'One Direction', 1, 0, 0, 0, 2),
(31, 'Kto wykonuje tę piosenkę?', 'https://drive.google.com/uc?export=download&id=1XD4WHoocUMqQeOR-xDQSGaS_X-9ihGR6', 'One Republic', 'Coldplay', 'X Ambassadors', 'Imagine Dragons', 'One Republic', 1, 1, 0, 0, 1),
(32, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1rGd-NIVh7zxqCjn2Ydn4BTtTbrD1FocW', 'River Flows In You', 'Light Through the Day', 'Una Mattina', 'Kiss the Rain', 'River Flows In You', 1, 1, 0, 0, 0),
(33, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1zmXLlot7kRI6VAnPsnUmWaIjjKd1fyTs', 'Justin Timberlake', 'Bruno Mars', 'Robin Thicke', 'Craig David', 'Justin Timberlake', 1, 0, 0, 0, 0),
(34, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1synUZvPpnUG0t7f_vZokSl9TurxUrDWU', 'Wildest Dreams', 'Fearless', 'Everything Has Changed', 'Exile', 'Exile', 1, 0, 0, 0, 1),
(35, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1F6LTkhBo3jpeQ5XMeFPTFT3UTPSFoTa7', 'Everything Has Changed', 'Photograph', 'Thinking Out Loud', 'You Belong With Me', 'Everything Has Changed', 1, 0, 0, 2, 0),
(36, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=1jdOob9xnmgxJ-kxoZ-LJNi2pNsO12hZC', 'Coldplay', 'U2', 'Lukas Graham', 'Radiohead', 'Coldplay', 1, 0, 0, 0, 0),
(37, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1VPILdV6r1npPVHFInlWboivr9w9CLLFE', 'Perfect', 'The a Team', 'Thinking Out Loud', 'I See Fire', 'Thinking Out Loud', 1, 0, 0, 1, 0),
(38, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1NdD2Id0zg08wBekRwuxOIYsZ0MNReP_Y', 'Iris', 'Seven Nation Army', 'You Found Me', 'Chasing Cars', 'Iris', 1, 0, 0, 0, 1),
(39, 'Kto wykonuje ten utwór?', 'https://drive.google.com/uc?export=download&id=12FCXmAuAjbSTCyiqk0-1D9yL3VdIGfgW', 'Thomas Rhett i Katy Perry', 'Ed Sheeran i Taylor Swift', 'Adam Levine i Demi Lovato', 'Adam Lambert i Ariana Grande', 'Thomas Rhett i Katy Perry', 1, 3, 1, 0, 0),
(40, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1NCvu5Vp0xL0NcuGaQeuMsqRJl2oWyj53', 'Get And Start', 'Get to Me', 'Up&Up', 'Be Where Your Feet Are', 'Up&Up', 1, 0, 0, 1, 0),
(41, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1YgZNut5DicHNEZ5yrYsZLYAN0uSKey00', 'A Sky Full of Stars', 'Every You Every Me', 'How To Save a Life', 'Viva la Vida', 'Viva la Vida', 1, 0, 0, 0, 1),
(42, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=14hosZ-apJzPue-YM_ojUv7Rvuo-k7Iqj', 'Hey Brother', 'Levels', 'Wake Me Up', 'Without You', 'Wake Me Up', 1, 0, 0, 0, 0),
(43, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1HXRvDJZdRcQs5l7jVARRks8xMag3jKbc', 'See You Again', 'Hello', 'Last Breath', 'So High', 'See You Again', 1, 0, 0, 0, 0),
(44, 'Ile medali olimpijskich ma Adam Małysz?', NULL, '0', '1', '3', '4', '4', 2, 0, 0, 0, 0),
(45, 'Gdzie zaczyna się Turniej Czterech Skoczni?', NULL, 'w Innsbrucku', 'w Bischofshofen', 'w Garmisch-Partenkirschen', 'w Oberstdorfie', 'w Oberstdorfie', 2, 1, 0, 0, 0),
(46, 'Które miejsce zajął Adam Małysz w ostatnim konkursie PŚ w swojej karierze w Planicy w 2011 roku?', NULL, '1', '2', '3', '4', '3', 2, 0, 0, 0, 0),
(47, 'Gdzie rozgrywane są tradycyjnie ostatnie zawody w sezonie PŚ w skokach narciarskich?', NULL, 'w Lahti', 'w Oslo', 'w Oberstdorfie', 'w Planicy', 'w Planicy', 2, 0, 0, 0, 1),
(48, 'Ile wynosi rekord Polski Kamila Stocha?', NULL, '251.5m', '248.5m', '254m', '245.5m', '251.5m', 2, 0, 0, 0, 0),
(49, 'Który z skoczków nie jest indywidualnym mistrzem olimpijskim?', NULL, 'Thomas Morgenstern', 'Gregor Schlierenzauer', 'Simon Ammann', 'Andreas Wellinger', 'Gregor Schlierenzauer', 2, 0, 1, 0, 0),
(50, 'Gdzie rozgrywane są tradycyjnie zawody PŚ i TCS w skokach narciarskich w Nowy Rok?', NULL, 'w Oberstdorfie', 'w Bad Mitterndorf', 'w Garmisch-Partenkirschen', 'w Oslo', 'w Garmisch-Partenkirschen', 2, 0, 0, 0, 0),
(51, 'Gdzie odbyły się Zimowe Igrzyska Olimpijskie w 2018 roku?', NULL, 'w Sochi', 'w Pyeongchang', 'w Vancouver', 'w Salt Lake City', 'w Pyeongchang', 2, 0, 0, 1, 0),
(52, 'Jaki sport uprawia Mikaela Shiffrin?', NULL, 'Siatkówka', 'Narciarstwo alpejskie', 'Biegi narciarskie', 'Badminton', 'Narciarstwo alpejskie', 2, 0, 0, 0, 0),
(53, 'Najsłynniejszy podjazd w Tour de Pologne to:', NULL, 'Gliczarów', 'Bukowina Tatrzańska', 'Babia Góra', 'Gubałówka', 'Gliczarów', 2, 0, 0, 0, 0),
(54, 'Ile złotych medali olimpijskich ma Justyna Kowalczyk?', NULL, '0', '1', '2', '3', '2', 2, 0, 0, 1, 0),
(55, 'Kto był największą rywalką Justyny Kowalczyk?', NULL, 'Marit Bjoergen', 'Adrianna Folis', 'Kikkan Randall', 'Heidi Weng', 'Marit Bjoergen', 2, 0, 0, 0, 0),
(56, 'Jak nazywają się zawody rozgrywane w biegach narciarskich na przełomie roku zakończone wspinaczką na górę Alpe Cermis?', NULL, 'Raw Air', 'Nordic Cup', 'World Cup Finals', 'Tour de Ski', 'Tour de Ski', 2, 1, 0, 0, 0),
(57, 'Roger Federer, Rafael Nadal, Novak Djokovic to przedstawiciele której dyscypliny sportu?', NULL, 'Koszykówki', 'Pływania', 'Siatkówki', 'Tenisa', 'Tenisa', 2, 0, 0, 0, 0),
(58, 'Kto jako pierwszy na świecie zjechał z góry K2 na nartach?', NULL, 'Andrzej Bargiel', 'Marcel Hirscher', 'Jean Kirgoff', 'Stanisław Karpiel-Bułecka', 'Andrzej Bargiel', 2, 0, 0, 0, 0),
(59, 'Zawody Wielkiego Szlema w tenisie rozgrywane w Londynie to: ', NULL, 'Roland Garros', 'Wimbledon', 'US Open', 'Great Britain Cup', 'Wimbledon', 2, 0, 0, 0, 0),
(60, 'Ile razy Robert Kubica wygrał wyścig Grand Prix Formuły 1?', NULL, '0', '1', '2', '3', '1', 2, 0, 0, 0, 0),
(61, 'Który z wyścigów kolarskich nie należy do tzw. Wielkich Tourów?', NULL, 'Giro d\'Italia', 'Tour de France', 'Vuelta a Espana', 'Circle of US', 'Circle of US', 2, 0, 0, 0, 1),
(62, 'Kamil Semeniuk, Paweł Zatorski, Mateusz Bieniek to przedstawiciele której dyscypliny sportu?', NULL, 'Tenisa', 'Siatkówki', 'Koszykówki', 'Lekkoatletyki', 'Siatkówki', 2, 0, 2, 0, 0),
(63, 'Jaką dyscyplinę sportu uprawia Dawid Tomala?', NULL, 'Bieg na 800m', 'Rzut młotem', 'Chód sportowy', 'Skok o tyczce', 'Chód sportowy', 2, 0, 0, 0, 0),
(64, 'Do którego państwa należy Grenlandia?', NULL, 'do Wielkiej Brytanii', 'do Danii', 'do Stanów Zjednoczonych', 'do Kanady', 'do Danii', 3, 0, 0, 0, 0),
(65, 'Flaga Austrii składa się z kolorów:', NULL, 'żółtego, czerwonego i żółtego', 'białego i niebieskiego', 'czerwonego, białego i czerwonego', 'czerwonego, białego i czarnego', 'czerwonego, białego i czerwonego', 3, 0, 0, 0, 0),
(66, 'Narodowa góra Słowaków to', NULL, 'Krywań', 'Sławkowski Szczyt', 'Rysy', 'Gerlach', 'Krywań', 3, 1, 0, 0, 0),
(67, 'Najdalej wysunięty na południe punkt Polski znajduje się w', NULL, 'Bieszczadach', 'Tatrach', 'Sudetach', 'Karkonoszach', 'Bieszczadach', 3, 1, 0, 0, 0),
(68, 'Aby dostać się na Rysy najkrótszą drogą od strony polskiej musimy minąć:', NULL, 'Czarny Staw Gąsienicowy', 'Zielony Staw Kieżmarski', 'Morskie Oko', 'Wielki Staw w Dolinie Pięciu Stawów Polskich', 'Morskie Oko', 3, 0, 0, 0, 0),
(69, 'Schronisko Murowaniec leży w pobliżu:', NULL, 'Czarnego Stawu Gąsienicowego', 'Zielonego Stawu Kieżmarskiego', 'Morskiego Oka', 'Wielkiego Stawu w Dolinie Pięciu Stawów Polskich', 'Czarnego Stawu Gąsienicowego', 3, 0, 0, 0, 0),
(70, 'W którym państwie oficjalnym językiem jest język portugalski?', NULL, 'w Argentynie', 'w Brazylii', 'na Kubie', 'w Urugwaju', 'w Brazylii', 3, 0, 1, 0, 0),
(71, 'Gdzie znajduje się Góra Kościuszki?', NULL, 'w Polsce', 'w Austrii', 'w USA', 'w Australii', 'w Australii', 3, 0, 0, 0, 0),
(72, 'Jak nazywa się najwyższy szczyt Alp?', NULL, 'Mont Blanc', 'Weisshorn', 'Matterhorn', 'Grossglockner', 'Mont Blanc', 3, 0, 1, 0, 0),
(73, 'Największy stan w USA pod względem powierzchni to', NULL, 'Teksas', 'Alaska', 'Kalifornia', 'Montana', 'Alaska', 3, 0, 0, 0, 0),
(74, 'Który z podanych kontynentów ma najwięcej mieszkańców?', NULL, 'Ameryka Północna', 'Ameryka Południowa', 'Europa+Australia', 'Afryka', 'Afryka', 3, 0, 0, 0, 2),
(75, 'W którym województwie znajduje się Koszalin?', NULL, 'w warmińsko-mazurskim', 'w zachodniopomorskim', 'w pomorskim', 'w kujawsko-pomorskim', 'w zachodniopomorskim', 3, 0, 2, 0, 0),
(76, 'W którym województwie znajduje się Szczyrk?', NULL, 'w małopolskim', 'w podkarpackim', 'w śląskim', 'w opolskim', 'w śląskim', 3, 0, 0, 2, 0),
(77, 'W którym województwie znajduje się Sandomierz?', NULL, 'w lubelskim', 'w podkarpackim', 'w świętokrzyskim', 'w małopolskim', 'w świętokrzyskim', 3, 0, 0, 1, 0),
(78, 'W którym województwie znajdują się Skierniewice?', NULL, 'w mazowieckim', 'w wielkopolskim', 'w kujawsko-pomorskim', 'w łódzkim', 'w łódzkim', 3, 0, 0, 0, 0),
(79, 'W którym województwie znajduje się Inowrocław?', NULL, 'w mazowieckim', 'w wielkopolskim', 'w kujawsko-pomorskim', 'w podlaskim', 'w kujawsko-pomorskim', 3, 0, 0, 1, 0),
(80, 'Które województwo jest najmniejsze pod względem powierzchni?', NULL, 'lubuskie', 'śląskie', 'łódzkie', 'opolskie', 'opolskie', 3, 0, 0, 0, 0),
(81, 'Gdzie znajduje się Gujana Francuska?', NULL, 'w Europie', 'w Afryce', 'w Australii i Oceanii', 'w Ameryce Południowej', 'w Ameryce Południowej', 3, 0, 0, 0, 0),
(82, 'Gdzie znajduje się Przylądek Dobrej Nadzei?', NULL, 'w Europie', 'w Afryce', 'w Australii i Oceanii', 'w Ameryce Południowej', 'w Afryce', 3, 0, 0, 0, 0),
(83, 'Największą wyspą świata jest', NULL, 'Australia', 'Grenlandia', 'Madagaskar', 'Hawaje', 'Grenlandia', 3, 0, 1, 0, 0),
(84, 'Ruchome wydmy znajdziemy w', NULL, 'Parku Narodowym Ujście Warty', 'Wolińskim Parku Narodowym', 'Wigierskim Parku Narodowym', 'Słowińskim Parku Narodowym', 'Słowińskim Parku Narodowym', 3, 0, 0, 0, 2),
(85, 'Wyspa Bożego Narodzenia położona jest na', NULL, 'Oceanie Atlantyckim', 'Oceanie Spokojnym', 'Oceanie Indyjskim', 'Oceanie Arktycznym', 'Oceanie Indyjskim', 3, 0, 0, 0, 0),
(86, 'Wyspa Wielkanocna położona jest na', NULL, 'Oceanie Atlantyckim', 'Oceanie Spokojnym', 'Oceanie Indyjskim', 'Oceanie Arktycznym', 'Oceanie Spokojnym', 3, 0, 0, 1, 0),
(87, 'W którym stanie położone jest Chicago?', NULL, 'w Ohio', 'w Pensylwanii', 'w Karolinie Północnej', 'w Illinois', 'w Illinois', 3, 0, 0, 0, 1),
(88, 'W którym stanie położone jest San Francisco?', NULL, 'na Florydzie', 'w Oklahomie', 'w Teksasie', 'w Kalifornii', 'w Kalifornii', 3, 0, 0, 0, 0),
(89, 'Powierzchnia którego państwa graniczącego z Polską jest najmniejsza?', NULL, 'Słowacji', 'Czech', 'Litwy', 'Białorusi', 'Słowacji', 3, 0, 0, 0, 0),
(90, 'Ile mieszkańców ma Lublin?', NULL, 'ok. 250 tys', 'ok. 290 tys', 'ok. 340 tys', 'ok. 315 tys', 'ok. 340 tys', 3, 0, 0, 0, 0),
(91, 'Zamek świętego Anioła, Fontanna di Trevi, Bazylika św.Pawła za Murami to zabytki', NULL, 'Mediolanu', 'Turynu', 'Neapolu', 'Rzymu', 'Rzymu', 3, 0, 0, 0, 0),
(92, 'Stolica Australii to', NULL, 'Melbourne', 'Sydney', 'Canberra', 'Pearl', 'Canberra', 3, 0, 1, 1, 0),
(93, 'Stolica Kanady to', NULL, 'Ottawa', 'Vancouver', 'Montreal', 'Quebec', 'Ottawa', 3, 0, 0, 0, 0),
(94, 'Stolica Brazylii to', NULL, 'Sao Paolo', 'Brasilia', 'Belo Horizonte', 'Rio de Janeiro', 'Brasilia', 3, 0, 0, 0, 0),
(95, 'Stolica Iranu to', NULL, 'Teheran', 'Bagdad', 'Islamabad', 'Damaszek', 'Teheran', 3, 1, 0, 0, 0),
(96, 'Stolica Słowenii to', NULL, 'Bratysława', 'Belgrad', 'Kiszyniów', 'Ljublana', 'Ljublana', 3, 0, 0, 0, 1),
(97, 'Stolica Chorwacji to', NULL, 'Dubrownik', 'Split', 'Orebic', 'Zagrzeb', 'Zagrzeb', 3, 1, 0, 0, 0),
(98, 'Stolica Chile to', NULL, 'Santiago', 'River Plate', 'Rangangua', 'Lima', 'Santiago', 3, 1, 0, 0, 1),
(99, 'Stolica Nigerii to', NULL, 'Abudża', 'Kapsztad', 'Tunis', 'Dakar', 'Abudża', 3, 0, 0, 0, 0),
(100, 'Stolica Liechtensteinu to', NULL, 'Liechtenstein', 'Vaduz', 'Berno', 'Tyrol', 'Vaduz', 3, 0, 0, 0, 0),
(101, 'Kiedy Polska wstąpiła do Unii Europejskiej?', NULL, '3 maja 2001', '1 stycznia 2005', '1 maja 2004', '1 czerwca 1999', '1 maja 2004', 4, 0, 0, 0, 0),
(102, 'Który władca walczył w bitwie pod Grunwaldem?', NULL, 'Bolesław Chrobry', 'Władysław Łokietek', 'Kazimierz Wielki', 'Władysław Jagiełło', 'Władysław Jagiełło', 4, 0, 1, 0, 0),
(103, 'Któremu odkrywcy zawdzięczamy nazwę Ameryka?', NULL, 'Da Gama', 'Vespucci', 'Galapagi', 'Kolumb', 'Vespucci', 4, 0, 1, 0, 0),
(104, 'W którym zaborze znalazł się Lublin po 1795 roku?', NULL, 'w rosyjskim', 'w pruskim', 'w węgierskim', 'w austriackim', 'w austriackim', 4, 0, 0, 0, 0),
(105, 'Na ile województw była podzielona Polska przed 1999 rokiem?', NULL, 'na 49', 'na 17', 'na 35', 'na 75', 'na 49', 4, 0, 0, 0, 0),
(106, 'Kto był bezpośrednim poprzednikiem papieża Jana Pawła II na tronie papieskim?', NULL, 'Benedykt XVI', 'Jan XXIII', 'Paweł VI', 'Jan Paweł I', 'Jan Paweł I', 4, 0, 0, 0, 0),
(107, 'Ostatni król Polski z dynastii Piastów to:', NULL, 'Władysław Łokietek', 'Bolesław Krzywousty', 'Kazimierz Wielki', 'Mieszko III Samotny', 'Kazimierz Wielki', 4, 0, 0, 1, 0),
(108, 'Pierwszy król Polski wybrany przez wolną elekcję to:', NULL, 'Henryk Walezy', 'Władysław Jagiełło', 'August II Mocny', 'Kazimierz Odnowiciel', 'Henryk Walezy', 4, 1, 0, 0, 0),
(109, 'Za panowania którego władcy Polacy zodobyli Moskwę?', NULL, 'za Kazimierza Wielkiego', 'za Władysława Jagiełły', 'za Jana Kazimierza', 'za Zygmunta Starego', 'za Zygmunta Starego', 4, 0, 0, 0, 0),
(110, 'Anschluss to:', NULL, 'rozpad III Rzeszy', 'atak III Rzeszy na ZSRR', 'przyłączenie Austrii do III Rzeszy', 'sojusz III Rzeszy z Włochami i Japonią', 'przyłączenie Austrii do III Rzeszy', 4, 1, 0, 0, 0),
(111, 'Który z władców podzielił Polskę na dzielnice (tzw. rozbicie dzielnicowe)?', NULL, 'Bolesław Chrobry', 'Wacław II', 'Władysław Wygnaniec', 'Bolesław Krzywousty', 'Bolesław Krzywousty', 4, 0, 0, 0, 1),
(112, 'Za rządów którego Prezydenta wybuchła II Wojna Światowa?', NULL, 'za Władysława Sikorskiego', 'za Ignacego Paderewskiego', 'za Ignacego Mościckiego', 'za Wincentego Witosa', 'za Ignacego Mościckiego', 4, 0, 0, 0, 0),
(113, 'Które wydarzenie było przyczyną przyłączenia się Stanów Zjednoczonych do II Wojny Światowej?', NULL, 'Atak III Rzeszy na Polskę', 'Atak III Rzeszy na ZSRR', 'Atak III Rzeszy na amerykański okręt podwodny', 'Atak na bazę Pearl Harbor', 'Atak na bazę Pearl Harbor', 4, 0, 0, 0, 0),
(114, 'Które wydarzenie było bezpośrednią przyczyną wybuchu I Wojny Światowej?', NULL, 'Atak Niemiec na Francję', 'zamach na cesarza Niemiec', 'Konflikt w sprawie kolonii afrykańskich', 'Zamach na arcyksięcia austriackiego Franciszka Ferdynanda', 'Zamach na arcyksięcia austriackiego Franciszka Ferdynanda', 4, 0, 0, 0, 0),
(115, 'Który zawodnik nie wygrał wszystkich konkursów podczas jednego Turnieju Czterech Skoczni?', NULL, 'Kamil Stoch', 'Ryoyu Kobayashi', 'Adam Małysz', 'Sven Hannawald', 'Adam Małysz', 2, 1, 0, 0, 0),
(116, 'Kto był bezpośrednim poprzednikiem Elżbiety II na brytyjskim tronie?', NULL, 'Karol II', 'Edward VIII', 'Jerzy VI', 'Wilhelm IV', 'Jerzy VI', 4, 0, 0, 1, 0),
(117, 'Z jakim krajem nie graniczy Francja?', NULL, 'z Brazylią', 'z Andorą', 'z Włochami', 'z Holandią', 'z Holandią', 3, 0, 0, 0, 0),
(118, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1Tgud2MKmGi2gtEDiBAJBOBotzpV6xT4U', 'Canon in D', 'River flows in you', 'Moonlight Sonata', 'Hallelujah', 'Canon in D', 1, 1, 0, 0, 0),
(119, 'Kto wykonuje tę piosenkę?', 'https://drive.google.com/uc?export=download&id=14uJ9hoYKN9Wdv31RZYUcVphfde0OU0h5', 'Maroon 5', 'Linkin Park', 'Aerosmith', 'Coldplay', 'Coldplay', 1, 0, 0, 0, 0),
(120, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1gnZ-QExo7Q9A6lyklkD6mrIn_U1Ufkmd', 'Happier', 'Perfect', 'Afterglow', 'Give Me Love', 'Give Me Love', 1, 0, 0, 0, 0),
(121, 'Kto wykonuje tę piosenkę?', 'https://drive.google.com/uc?export=download&id=1fXT8qXRXHfN_RsEQJz-1YC314A-VJONe', 'Bruno Mars', 'Ed Sheeran', 'James Arthur', 'Sam Smith', 'Ed Sheeran', 1, 0, 1, 0, 1),
(122, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1in69zSIqtT2GmBS1sdtRF8OmeAoh7fqt', 'I\'m Yours', 'Lego House', 'One', 'The Joker and the Queen', 'Lego House', 1, 0, 0, 0, 0),
(123, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1XD4SINFpJbDPIOPwSDxBaCbbr0PlC7r0', 'All of the Stars', 'I See Fire', 'The a Team', 'Thinking Out Loud', 'The a Team', 1, 0, 0, 1, 0),
(124, 'Jak nazywa się ten utwór?', 'https://drive.google.com/uc?export=download&id=1QJIeATvpk3jaybm6GCPQFr6iwaeA3Ag2', 'Boulevard Of Broken Dreams', 'What I\'ve Done', 'In the End', 'Numb', 'In the End', 1, 0, 0, 0, 0),
(125, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1DhOACC67eHHPig98flHCiWWeC27Z_kpt', 'Leave Out All the Rest', 'New Divide', 'Somewhere I Belong', 'Numb', 'Leave Out All the Rest', 1, 2, 0, 0, 0),
(126, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1xOR6GT9qsO3BX2XvUGR0KqO6ANKAog9C', 'Chasing Cars', 'This Ain\'t Goodbye', 'A Sky Full Of Stars', 'Trouble', 'Chasing Cars', 1, 0, 0, 0, 0),
(127, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1hZbxFwY-mktzf8A9gB_6y3zejFmK3y18', 'Blank Space', 'Lover', 'Cardigan', 'Love Story', 'Cardigan', 1, 0, 0, 0, 0),
(128, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1Kc-bXRnJNEgHTjRTqs1XRxcnSRZQWfpA', 'The Scientist', 'Clocks', 'Paradise', 'Fix You', 'The Scientist', 1, 0, 0, 0, 0),
(129, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1RTNxAkvd-N54nfyHJa34ALwdXbZY9K1d', 'You Belong With Me', 'Love Story', 'All Too Well', 'ME!', 'Love Story', 1, 0, 0, 0, 0),
(130, 'Jak nazywa się ta piosenka?', 'https://drive.google.com/uc?export=download&id=1JhGfz1t9cDUYIHGqZvpQggafrWrmnxKv', 'Viva la Vida', 'Revolution', 'Sweet Child O\'Mine', 'Adventure of Lifetime', 'Viva la Vida', 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `login` varchar(64) NOT NULL,
  `password` varchar(512) NOT NULL,
  `bestresult` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id_user`, `login`, `password`, `bestresult`) VALUES
(3, 'Patryk', '$2a$10$53Ha8zw8ZVXPLrYTvZh0DOfdR/VAxa9MXCoS4YOMe1GvvhH6.1IMK', 34),
(6, 'Julianne', '$2a$10$SK2QTWMi1NTodgqhtySAROyuM2UNCDIwmuFMxgVxtLptWRw.1Vd2.', 0),
(7, 'Szymon', '$2a$10$bgkIZdWKMJ7snhRCpVY4De.AANM66IGe97jwRqsQzAuWDjMm5ZGB2', 12),
(8, 'Kacper', '$2a$10$O4pvqnXg1gAXKPzWgTJ6reA4Lom9GMMBUJY8H1U7wLsJaL69QwE72', 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indeksy dla tabeli `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
