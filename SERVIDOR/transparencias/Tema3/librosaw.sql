-- MySQL dump 10.11
--
-- Host: localhost    Database: librosaw
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `authors` (
  `AU_ID` varchar(255) NOT NULL,
  `AU_LNAME` varchar(255) NOT NULL,
  `AU_FNAME` varchar(255) NOT NULL,
  `PHONE` varchar(255) default NULL,
  `ADDRESS` varchar(255) default NULL,
  `CITY` varchar(255) default NULL,
  `STATE` varchar(255) default NULL,
  `ZIP` varchar(255) default NULL,
  `CONTRACT` bit(1) default NULL,
  PRIMARY KEY  (`AU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES ('172-32-1176','White','Johnson','408 496-7223','10932 Bigge Rd.','Menlo Park','CA','94025',''),('213-46-8915','Green','Marjorie','415 986-7020','309 63rd St. #411','Oakland','CA','94618',''),('238-95-7766','Carson','Cheryl','415 548-7723','589 Darwin Ln.','Berkeley','CA','94705',''),('267-41-2394','O\'Leary','Michael','408 286-2428','22 Cleveland Av. #14','San Jose','CA','95128',''),('274-80-9391','Straight','Dean','415 834-2919','5420 College Av.','Oakland','CA','94609',''),('341-22-1782','Smith','Meander','913 843-0462','10 Mississippi Dr.','Lawrence','KS','66044','\0'),('409-56-7008','Bennet','Abraham','415 658-9932','6223 Bateman St.','Berkeley','CA','94705',''),('427-17-2319','Dull','Ann','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301',''),('472-27-2349','Gringlesby','Burt','707 938-6445','PO Box 792','Covelo','CA','95428',''),('486-29-1786','Locksley','Charlene','415 585-4620','18 Broadway Av.','San Francisco','CA','94130',''),('527-72-3246','Greene','Morningstar','615 297-2723','22 Graybar House Rd.','Nashville','TN','37215','\0'),('648-92-1872','Blotchet-Halls','Reginald','503 745-6402','55 Hillsdale Bl.','Corvallis','OR','97330',''),('672-71-3249','Yokomoto','Akiko','415 935-4228','3 Silver Ct.','Walnut Creek','CA','94595',''),('712-45-1867','del Castillo','Innes','615 996-8275','2286 Cram Pl. #86','Ann Arbor','MI','48105',''),('722-51-5454','DeFrance','Michel','219 547-9982','3 Balding Pl.','Gary','IN','46403',''),('724-08-9931','Stringer','Dirk','415 843-2991','5420 Telegraph Av.','Oakland','CA','94609','\0'),('724-80-9391','MacFeather','Stearns','415 354-7128','44 Upland Hts.','Oakland','CA','94612',''),('756-30-7391','Karsen','Livia','415 534-9219','5720 McAuley St.','Oakland','CA','94609',''),('807-91-6654','Panteley','Sylvia','301 946-8853','1956 Arlington Pl.','Rockville','MD','20853',''),('846-92-7186','Hunter','Sheryl','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301',''),('893-72-1158','McBadden','Heather','707 448-4982','301 Putnam','Vacaville','CA','95688','\0'),('899-46-2035','Ringer','Anne','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152',''),('998-72-3567','Ringer','Albert','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152','');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titleauthor`
--

DROP TABLE IF EXISTS `titleauthor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `titleauthor` (
  `AU_ID` varchar(255) NOT NULL,
  `TITLE_ID` varchar(255) NOT NULL,
  PRIMARY KEY  (`AU_ID`,`TITLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `titleauthor`
--

LOCK TABLES `titleauthor` WRITE;
/*!40000 ALTER TABLE `titleauthor` DISABLE KEYS */;
INSERT INTO `titleauthor` VALUES ('172-32-1176','PS3333'),('213-46-8915','BU1032'),('213-46-8915','BU2075'),('238-95-7766','PC1035'),('267-41-2394','BU1111'),('267-41-2394','TC7777'),('274-80-9391','BU7832'),('409-56-7008','BU1032'),('427-17-2319','PC8888'),('472-27-2349','TC7777'),('486-29-1786','PC9999'),('486-29-1786','PS7777'),('648-92-1872','TC4203'),('672-71-3249','TC7777'),('712-45-1867','MC2222'),('722-51-5454','MC3021'),('724-80-9391','BU1111'),('724-80-9391','PS1372'),('756-30-7391','PS1372'),('807-91-6654','TC3218'),('846-92-7186','PC8888'),('899-46-2035','MC3021'),('899-46-2035','PS2091'),('998-72-3567','PS2091'),('998-72-3567','PS2106');
/*!40000 ALTER TABLE `titleauthor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `titles` (
  `TITLE_ID` varchar(255) NOT NULL,
  `TITLE` varchar(255) default NULL,
  `TYPE` varchar(255) default NULL,
  `PUB_ID` varchar(255) default NULL,
  `PRICE` double default NULL,
  `ADVANCE` double default NULL,
  `ROYALTY` int(11) default NULL,
  `YTD_SALES` int(11) default NULL,
  `NOTES` varchar(255) default NULL,
  `PUBDATE` varchar(40) default NULL,
  PRIMARY KEY  (`TITLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES ('BU1032','The Busy Executive\'s Database Guide','business    ','1389',19.99,5000,10,4095,'An overview of available database systems with emphasis on common business applications. Illustrated.','1991-06-12 00:00:00'),('BU1111','Cooking with Computers: Surreptitious Balance Sheets','business    ','1389',11.95,5000,10,3876,'Helpful hints on how to use your electronic resources to the best advantage.','1991-06-09 00:00:00'),('BU2075','You Can Combat Computer Stress!','business    ','0736',2.99,10125,24,18722,'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.','1991-06-30 00:00:00'),('BU7832','Straight Talk About Computers','business    ','1389',19.99,5000,10,4095,'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.','1991-06-22 00:00:00'),('MC2222','Silicon Valley Gastronomic Treats','mod_cook    ','0877',19.99,0,12,2032,'Favorite recipes for quick, easy, and elegant meals.','1991-06-09 00:00:00'),('MC3021','The Gourmet Microwave','mod_cook    ','0877',2.99,15000,24,22246,'Traditional French gourmet recipes adapted for modern microwave cooking.','1991-06-18 00:00:00'),('MC3026','The Psychology of Computer Cooking','UNDECIDED   ','0877',NULL,NULL,NULL,NULL,NULL,'2000-08-06 01:33:54'),('PC1035','But Is It User Friendly?','popular_comp','1389',22.95,7000,16,8780,'A survey of software for the naive user, focusing on the \'friendliness\' of each.','1991-06-30 00:00:00'),('PC8888','Secrets of Silicon Valley','popular_comp','1389',20,8000,10,4095,'Muckraking reporting on the world\'s largest computer hardware and software manufacturers.','1994-06-12 00:00:00'),('PC9999','Net Etiquette','popular_comp','1389',NULL,NULL,NULL,NULL,'A must-read for computer conferencing.','2000-08-06 01:33:54'),('PS1372','Computer Phobic AND Non-Phobic Individuals: Behavior Variations','psychology  ','0877',21.59,7000,10,375,'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don\'t.','1991-10-21 00:00:00'),('PS2091','Is Anger the Enemy?','psychology  ','0736',10.95,2275,12,2045,'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.','1991-06-15 00:00:00'),('PS2106','Life Without Fear','psychology  ','0736',7,6000,10,111,'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.','1991-10-05 00:00:00'),('PS3333','Prolonged Data Deprivation: Four Case Studies','psychology  ','0736',19.99,2000,10,4072,'What happens when the data runs dry?  Searching evaluations of information-shortage effects.','1991-06-12 00:00:00'),('PS7777','Emotional Security: A New Algorithm','psychology  ','0736',7.99,4000,10,3336,'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.','1991-06-12 00:00:00'),('TC3218','Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean','trad_cook   ','0877',20.95,7000,10,375,'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.','1991-10-21 00:00:00'),('TC4203','Fifty Years in Buckingham Palace Kitchens','trad_cook   ','0877',11.95,4000,14,15096,'More anecdotes from the Queen\'s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.','1991-06-12 00:00:00'),('TC7777','Sushi, Anyone?','trad_cook   ','0877',14.99,8000,10,4095,'Detailed instructions on how to make authentic Japanese sushi in your spare time.','1991-06-12 00:00:00');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-10-29 10:15:39
 
