DROP TABLE IF EXISTS `PlaylistSong`;
DROP TABLE IF EXISTS `Song`;
DROP TABLE IF EXISTS `Album`;
DROP TABLE IF EXISTS `Artist`;
DROP TABLE IF EXISTS `Genre`;
DROP TABLE IF EXISTS `Playlist`;
DROP TABLE IF EXISTS `Subscription`;
DROP TABLE IF EXISTS `User`;

CREATE DATABASE `music_streaming_sevice`;

USE `music_streaming_sevice`;

/*Table structure for table `User`*/

CREATE TABLE `User` (
  `user_ID` VARCHAR(80) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `birth_date` DATE NOT NULL,
  `country` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`user_ID`)
);

/*Data for the table `User`*/

INSERT INTO `User` (`user_ID`, `name`, `surname`, `birth_date`, `country`) values
('sophie.muller@web.de', 'Sophie', 'Muller', '1990-05-15', 'Germany'),
('anna.jansen@gmail.com', 'Anna', 'Jansen', '1988-09-21', 'Norway'),
('luca.rossi@libero.it', 'Luca', 'Rossi', '1995-02-08', 'Italy'),
('marie.dubois@orange.fr', 'Marie', 'Dubois', '1992-07-12', 'France'),
('michaelwilson@gmail.com', 'Michael', 'Wilson', '1985-12-03', 'USA'),
('pedro.santos@hotmail.es', 'Pedro', 'Santos', '1991-03-27', 'Spain'),
('emilyjones@yahoo.co.uk', 'Emily', 'Jones', '1987-11-19', 'United Kingdom'),
('david.wagner@web.de', 'David', 'Wagner', '1994-06-25', 'Germany'),
('ethanthomas@gmail.com', 'Ethan', 'Thomas', '1993-09-08', 'USA'),
('marco-ruggiero@studio.unibo.it', 'Marco', 'Ruggiero', '1998-04-30', 'Italy');

/*Table structure for table `Subscription`*/

CREATE TABLE `Subscription` (
  `subscription_id` varchar(60) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `status` varchar(30) NOT NULL,
  `next_payment_date` date DEFAULT NULL,
  PRIMARY KEY (`subscription_id`, `user_id`),
  CONSTRAINT `subscription_user_fk` FOREIGN KEY (`user_id`)
    REFERENCES `User` (`user_id`)
);

/*Data for the table `Subscription`*/

INSERT INTO `Subscription` (`subscription_id`, `user_id`, `paymentDate`, `total`, `status`, `next_payment_date`) VALUES
('sub_001', 'sophie.muller@web.de', '2023-06-01', 19.99, 'Active', '2023-07-01'),
('sub_002', 'anna.jansen@gmail.com', '2023-06-05', 14.99, 'Active', '2023-07-05'),
('sub_003', 'luca.rossi@libero.it', '2023-06-08', 9.99, 'Active', '2023-07-08'),
('sub_004', 'marie.dubois@orange.fr', '2023-06-12', 12.99, 'Active', '2023-07-12'),
('sub_005', 'michaelwilson@gmail.com', '2023-06-15', 17.99, 'Active', '2023-07-15'),
('sub_006', 'pedro.santos@hotmail.es', '2023-06-18', 9.99, 'Active', '2023-07-18'),
('sub_007', 'emilyjones@yahoo.co.uk', '2023-06-20', 14.99, 'Active', '2023-07-20'),
('sub_008', 'david.wagner@web.de', '2023-06-25', 19.99, 'Active', '2023-07-25'),
('sub_009', 'ethanthomas@gmail.com', '2023-06-28', 12.99, 'Active', '2023-07-28'),
('sub_010', 'marco-ruggiero@studio.unibo.it', '2023-06-30', 9.99, 'Active', '2023-07-30');

/*Table structure for table `Playlist`*/

CREATE TABLE `Playlist` (
  `playlist_ID` VARCHAR(50) NOT NULL,
  `playlist_title` VARCHAR(100) NOT NULL,
  `user_ID` VARCHAR(80) NOT NULL,
  `creation_date` DATE NOT NULL,
  PRIMARY KEY (`playlist_ID`),
  CONSTRAINT `playlist_fk` FOREIGN KEY (`user_ID`) 
  REFERENCES `User` (`user_ID`)
);

/*Data for the table `Playlist`*/

INSERT INTO `Playlist` (`playlist_ID`, `playlist_title`, `user_ID`, `creation_date`) VALUES
('pl.c55eac5615944707ba318e18f8020', 'Pop Hits', 'sophie.muller@web.de', '2023-06-01'),
('pl.c55eac5615944707ba318e18f8021', 'Throwback Jams', 'anna.jansen@gmail.com', '2023-06-05'),
('pl.c55eac5615944707ba318e18f8022', 'EDM Party Mix', 'luca.rossi@libero.it', '2023-06-08'),
('pl.c55eac5615944707ba318e18f8023', 'Rock Anthems', 'marie.dubois@orange.fr', '2023-06-12'),
('pl.c55eac5615944707ba318e18f8024', 'R&B Grooves', 'michaelwilson@gmail.com', '2023-06-15'),
('pl.c55eac5615944707ba318e18f8025', 'Country Classics', 'pedro.santos@hotmail.es', '2023-06-18'),
('pl.c55eac5615944707ba318e18f8026', 'Alternative Vibes', 'emilyjones@yahoo.co.uk', '2023-06-20'),
('pl.c55eac5615944707ba318e18f8027', 'Hip Hop Essentials', 'david.wagner@web.de', '2023-06-25'),
('pl.c55eac5615944707ba318e18f8028', 'Indie Discoveries', 'ethanthomas@gmail.com', '2023-06-28'),
('pl.c55eac5615944707ba318e18f8029', 'Latin Fiesta', 'marco-ruggiero@studio.unibo.it', '2023-06-30');

/*Table structure for table `Genre`*/

CREATE TABLE `Genre` (
  `genre_ID` INT NOT NULL,
  `genre_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`genre_ID`)
);

/*Data for the table `Genre`*/

INSERT INTO `Genre` (`genre_ID`, `genre_name`) VALUES
('976439548', 'Pop'),
('976439549', 'Rock'),
('976439550', 'Hip Hop'),
('976439551', 'Electronic'),
('976439552', 'Country'),
('976439553', 'R&B'),
('976439554', 'Jazz'),
('976439555', 'Classical'),
('976439556', 'Reggae'),
('976439557', 'Funk');

/*Table structure for table `Artist`*/

CREATE TABLE `Artist` (
  `artist_ID` INT NOT NULL,
  `artist_name` VARCHAR(50) NOT NULL,
  `birth_place` VARCHAR(50) DEFAULT NULL,
  `birth_date` DATE DEFAULT NULL,
  `genre_ID` INT NOT NULL,
  PRIMARY KEY (`artist_ID`),
  CONSTRAINT `artist_fk` FOREIGN KEY (`genre_ID`) 
  REFERENCES `Genre` (`genre_ID`)
);

/*Data for the table `Artist`*/

INSERT INTO `Artist` (`artist_ID`, `artist_name`, `birth_place`, `birth_date`, `genre_ID`) VALUES
(471260289, 'Taylor Swift', 'Reading, Pennsylvania, USA', '1989-12-13', 976439548),
(471260290, 'Ed Sheeran', 'Halifax, West Yorkshire, England', '1991-02-17', 976439549),
(471260291, 'Beyoncé', 'Houston, Texas, USA', '1981-09-04', 976439550),
(471260292, 'Calvin Harris', 'Dumfries, Scotland', '1984-01-17', 976439551),
(471260293, 'Johnny Cash', 'Kingsland, Arkansas, USA', '1932-02-26', 976439552),
(471260294, 'Aretha Franklin', 'Memphis, Tennessee, USA', '1942-03-25', 976439553),
(471260295, 'Miles Davis', 'Alton, Illinois, USA', '1926-05-26', 976439554),
(471260296, 'Ludwig van Beethoven', 'Bonn, Germany', '1770-12-17', 976439555),
(471260297, 'Bob Marley', 'Nine Mile, Saint Ann Parish, Jamaica', '1945-02-06', 976439556),
(471260298, 'James Brown', 'Barnwell, South Carolina, USA', '1933-05-03', 976439557);

/*Table structure for table `Album`*/

CREATE TABLE `Album` (
  `album_ID` INT NOT NULL,
  `album_title` VARCHAR(50) NOT NULL,
  `artist_ID` INT NOT NULL,
  `release_date` DATE NOT NULL,
  `genre_ID` INT NOT NULL,
  `copyright` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`album_ID`),
  CONSTRAINT `album_fk_1` FOREIGN KEY (`artist_ID`) 
  REFERENCES `Artist` (`artist_ID`),
  CONSTRAINT `album_fk_2` FOREIGN KEY (`genre_ID`) 
  REFERENCES `Genre`(`genre_ID`)
);

/*Data for the table `Album`*/

INSERT INTO `Album` (`album_ID`, `album_title`, `artist_ID`, `release_date`, `genre_ID`, `copyright`)
VALUES
(1615584999, '1989', 471260289, '2014-10-27', 976439548, '© 2014 Big Machine Records, LLC'),
(1615585000, '÷', 471260290, '2017-03-03', 976439549, '© 2017 Asylum Records UK, a division of Atlantic Records UK, a Warner Music Group company'),
(1615585001, 'Lemonade', 471260291, '2016-04-23', 976439550, '© 2016 Parkwood Entertainment LLC, under exclusive license to Columbia Records, a Division of Sony Music Entertainment'),
(1615585002, 'Motion', 471260292, '2014-10-31', 976439551, '© 2014 Sony Music Entertainment UK Limited'),
(1615585003, 'At Folsom Prison', 471260293, '1968-05-01', 976439552, '© 1968 Sony Music Entertainment'),
(1615585004, 'Lady Soul', 471260294, '1968-01-22', 976439553, '© 1968 Atlantic Recording Corporation for the United States and WEA International Inc. for the world outside of the United States'),
(1615585005, 'Kind of Blue', 471260295, '1959-08-17', 976439554, '© 1959 Columbia Records, a division of Sony Music Entertainment'),
(1615585006, 'Symphony No. 5', 471260296, '1808-12-17', 976439555, 'Public Domain'),
(1615585007, 'Legend: The Best Of Bob Marley And The Wailers', 471260297, '1984-05-08', 976439556, '© 1984 Island Records, a division of Universal Music Operations Limited'),
(1615585008, '20 All-Time Greatest Hits!', 471260298, '1991-09-24', 976439557, '© 1991 Universal Records, a Division of UMG Recordings, Inc.');

/*Table structure for table `Song`*/

CREATE TABLE `Song` (
  `song_ID` VARCHAR(50) NOT NULL,
  `song_title` VARCHAR(50) NOT NULL,
  `album_ID` INT NOT NULL,
  `artist_ID` INT NOT NULL,
  `duration` TIME NOT NULL,
  `song_number` INT NOT NULL,
  `genre_ID` INT NOT NULL,
  `composer` VARCHAR(100) NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`song_ID`),
  CONSTRAINT `song_fk_2` FOREIGN KEY (`artist_ID`) 
  REFERENCES `Artist` (`artist_ID`),
  CONSTRAINT `song_fk_3` FOREIGN KEY (`genre_ID`) 
  REFERENCES `Genre` (`genre_ID`)
);

/*Data for the table `Song`*/

INSERT INTO `Song` (`song_ID`, `song_title`, `album_ID`, `artist_ID`, `duration`, `song_number`, `genre_ID`, `composer`, `year`) 
VALUES 
('1615585000?i=1615585008', 'Shape of You', 1615585000, 471260290, '00:03:54', 1, 976439549, 'Ed Sheeran, Steve Mac, Johnny McDaid', 2017),
('1615585000?i=1615585009', 'Castle on the Hill', 1615585000, 471260290, '00:04:21', 2, 976439549, 'Ed Sheeran, Benjamin Levin', 2017),
('1615585001?i=1615585010', 'Formation', 1615585001, 471260291, '00:03:26', 1, 976439550, 'Beyoncé, Khalif Brown, Asheton Hogan, Michael L. Williams II', 2016),
('1615585001?i=1615585011', 'Sorry', 1615585001, 471260291, '00:03:53', 2, 976439550, 'Beyoncé, Diana Gordon, Sean "Melo-X" Rhoden, Thomas Wesley Pentz', 2016),
('1615585002?i=1615585012', 'Summer', 1615585002, 471260292, '00:03:42', 1, 976439551, 'Calvin Harris', 2014),
('1615585002?i=1615585013', 'Blame', 1615585002, 471260292, '00:03:32', 2, 976439551, 'Calvin Harris, John Newman', 2014),
('1615585003?i=1615585014', 'Folsom Prison Blues', 1615585003, 471260293, '00:02:51', 1, 976439552, 'Johnny Cash', 1955),
('1615585003?i=1615585015', 'Cocaine Blues', 1615585003, 471260293, '00:02:50', 2, 976439552, 'T.J. "Red" Arnall', 1968),
('1615585004?i=1615585016', 'Chain of Fools', 1615585004, 471260294, '00:02:45', 1, 976439553, 'Don Covay', 1967),
('1615585004?i=1615585017', '(You Make Me Feel Like) A Natural Woman', 1615585004, 471260294, '00:02:42', 2, 976439553, 'Gerry Goffin, Carole King, Jerry Wexler', 1967);

/*Table structure for table `PlaylistSong`*/

CREATE TABLE `PlaylistSong` (
  `playlist_ID` VARCHAR(50) NOT NULL,
  `song_ID` VARCHAR(50) NOT NULL,
  `addDate` DATE NOT NULL,
  PRIMARY KEY (`playlist_ID`, `song_ID`),
  CONSTRAINT `playlistsong_fk_1` FOREIGN KEY (`playlist_ID`) 
  REFERENCES `Playlist` (`playlist_ID`),
  CONSTRAINT `playlistsong_fk_2` FOREIGN KEY (`song_ID`) 
  REFERENCES `Song` (`song_ID`)
);

/*Data for the table `PlaylistSong`*/

INSERT INTO PlaylistSong (playlist_ID, song_ID, addDate) VALUES
('pl.c55eac5615944707ba318e18f8020', '1615585000?i=1615585008', '2023-06-01'),
('pl.c55eac5615944707ba318e18f8020', '1615585000?i=1615585009', '2023-06-01'),
('pl.c55eac5615944707ba318e18f8021', '1615585001?i=1615585010', '2023-06-05'),
('pl.c55eac5615944707ba318e18f8021', '1615585001?i=1615585011', '2023-06-05'),
('pl.c55eac5615944707ba318e18f8022', '1615585002?i=1615585012', '2023-06-08'),
('pl.c55eac5615944707ba318e18f8022', '1615585002?i=1615585013', '2023-06-08'),
('pl.c55eac5615944707ba318e18f8023', '1615585003?i=1615585014', '2023-06-12'),
('pl.c55eac5615944707ba318e18f8023', '1615585003?i=1615585015', '2023-06-12'),
('pl.c55eac5615944707ba318e18f8024', '1615585004?i=1615585016', '2023-06-15'),
('pl.c55eac5615944707ba318e18f8024', '1615585004?i=1615585017', '2023-06-15');