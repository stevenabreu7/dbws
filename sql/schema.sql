-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: dbws
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  CONSTRAINT `Admin_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `locid` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `gid` (`gid`),
  KEY `locid` (`locid`),
  KEY `catid` (`catid`),
  CONSTRAINT `Event_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `UserGroup` (`gid`),
  CONSTRAINT `Event_ibfk_2` FOREIGN KEY (`locid`) REFERENCES `Location` (`locid`),
  CONSTRAINT `Event_ibfk_3` FOREIGN KEY (`catid`) REFERENCES `Category` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventInvite`
--

DROP TABLE IF EXISTS `EventInvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventInvite` (
  `iid` int(11) NOT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `eid` (`eid`),
  CONSTRAINT `EventInvite_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `Invite` (`iid`),
  CONSTRAINT `EventInvite_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `Event` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventInvite`
--

LOCK TABLES `EventInvite` WRITE;
/*!40000 ALTER TABLE `EventInvite` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventInvite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventRequest`
--

DROP TABLE IF EXISTS `EventRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventRequest` (
  `reqid` int(11) NOT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`reqid`),
  KEY `eid` (`eid`),
  CONSTRAINT `EventRequest_ibfk_1` FOREIGN KEY (`reqid`) REFERENCES `Request` (`reqid`),
  CONSTRAINT `EventRequest_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `Event` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventRequest`
--

LOCK TABLES `EventRequest` WRITE;
/*!40000 ALTER TABLE `EventRequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invite`
--

DROP TABLE IF EXISTS `Invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invite` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `uid` (`uid`),
  CONSTRAINT `Invite_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invite`
--

LOCK TABLES `Invite` WRITE;
/*!40000 ALTER TABLE `Invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InviteNotification`
--

DROP TABLE IF EXISTS `InviteNotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InviteNotification` (
  `nid` int(11) NOT NULL,
  `iid` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `iid` (`iid`),
  CONSTRAINT `InviteNotification_ibfk_1` FOREIGN KEY (`nid`) REFERENCES `Notification` (`nid`),
  CONSTRAINT `InviteNotification_ibfk_2` FOREIGN KEY (`iid`) REFERENCES `Invite` (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InviteNotification`
--

LOCK TABLES `InviteNotification` WRITE;
/*!40000 ALTER TABLE `InviteNotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `InviteNotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `locid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`locid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notification`
--

DROP TABLE IF EXISTS `Notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `Message` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `uid` (`uid`),
  CONSTRAINT `Notification_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification`
--

LOCK TABLES `Notification` WRITE;
/*!40000 ALTER TABLE `Notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OneTimeEvent`
--

DROP TABLE IF EXISTS `OneTimeEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OneTimeEvent` (
  `eid` int(11) NOT NULL,
  `day` date DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  PRIMARY KEY (`eid`),
  CONSTRAINT `OneTimeEvent_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `Event` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OneTimeEvent`
--

LOCK TABLES `OneTimeEvent` WRITE;
/*!40000 ALTER TABLE `OneTimeEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `OneTimeEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organizer`
--

DROP TABLE IF EXISTS `Organizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organizer` (
  `uid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`eid`),
  KEY `eid` (`eid`),
  CONSTRAINT `Organizer_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  CONSTRAINT `Organizer_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `Event` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organizer`
--

LOCK TABLES `Organizer` WRITE;
/*!40000 ALTER TABLE `Organizer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professor`
--

DROP TABLE IF EXISTS `Professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Professor` (
  `uid` int(11) NOT NULL,
  `research_area` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  CONSTRAINT `Professor_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professor`
--

LOCK TABLES `Professor` WRITE;
/*!40000 ALTER TABLE `Professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecurringAttendance`
--

DROP TABLE IF EXISTS `RecurringAttendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecurringAttendance` (
  `uid` int(11) NOT NULL,
  `rsid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rsid`),
  KEY `rsid` (`rsid`),
  CONSTRAINT `RecurringAttendance_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  CONSTRAINT `RecurringAttendance_ibfk_2` FOREIGN KEY (`rsid`) REFERENCES `RecurringSingle` (`rsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecurringAttendance`
--

LOCK TABLES `RecurringAttendance` WRITE;
/*!40000 ALTER TABLE `RecurringAttendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecurringAttendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecurringEvent`
--

DROP TABLE IF EXISTS `RecurringEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecurringEvent` (
  `recid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `occurrences` int(11) NOT NULL,
  PRIMARY KEY (`recid`),
  KEY `eid` (`eid`),
  CONSTRAINT `RecurringEvent_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `Event` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecurringEvent`
--

LOCK TABLES `RecurringEvent` WRITE;
/*!40000 ALTER TABLE `RecurringEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecurringEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecurringSingle`
--

DROP TABLE IF EXISTS `RecurringSingle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecurringSingle` (
  `rsid` int(11) NOT NULL AUTO_INCREMENT,
  `recid` int(11) DEFAULT NULL,
  `day` date NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  PRIMARY KEY (`rsid`),
  KEY `recid` (`recid`),
  CONSTRAINT `RecurringSingle_ibfk_1` FOREIGN KEY (`recid`) REFERENCES `RecurringEvent` (`recid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecurringSingle`
--

LOCK TABLES `RecurringSingle` WRITE;
/*!40000 ALTER TABLE `RecurringSingle` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecurringSingle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Request`
--

DROP TABLE IF EXISTS `Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Request` (
  `reqid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`reqid`),
  KEY `uid` (`uid`),
  CONSTRAINT `Request_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Request`
--

LOCK TABLES `Request` WRITE;
/*!40000 ALTER TABLE `Request` DISABLE KEYS */;
/*!40000 ALTER TABLE `Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RequestNotification`
--

DROP TABLE IF EXISTS `RequestNotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestNotification` (
  `nid` int(11) NOT NULL,
  `reqid` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `reqid` (`reqid`),
  CONSTRAINT `RequestNotification_ibfk_1` FOREIGN KEY (`nid`) REFERENCES `Notification` (`nid`),
  CONSTRAINT `RequestNotification_ibfk_2` FOREIGN KEY (`reqid`) REFERENCES `Request` (`reqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RequestNotification`
--

LOCK TABLES `RequestNotification` WRITE;
/*!40000 ALTER TABLE `RequestNotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `RequestNotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Residence`
--

DROP TABLE IF EXISTS `Residence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Residence` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Residence`
--

LOCK TABLES `Residence` WRITE;
/*!40000 ALTER TABLE `Residence` DISABLE KEYS */;
/*!40000 ALTER TABLE `Residence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SingularAttendance`
--

DROP TABLE IF EXISTS `SingularAttendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SingularAttendance` (
  `uid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`eid`),
  KEY `eid` (`eid`),
  CONSTRAINT `SingularAttendance_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  CONSTRAINT `SingularAttendance_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `Event` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SingularAttendance`
--

LOCK TABLES `SingularAttendance` WRITE;
/*!40000 ALTER TABLE `SingularAttendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `SingularAttendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `uid` int(11) NOT NULL,
  `department` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `uid` int(11) NOT NULL,
  `major` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `rid` (`rid`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`),
  CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `Residence` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activated` tinyint(1) NOT NULL,
  `joined` date NOT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `rid` (`rid`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `Residence` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroup`
--

DROP TABLE IF EXISTS `UserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroup` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max` int(11) DEFAULT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroup`
--

LOCK TABLES `UserGroup` WRITE;
/*!40000 ALTER TABLE `UserGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroupInvite`
--

DROP TABLE IF EXISTS `UserGroupInvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroupInvite` (
  `iid` int(11) NOT NULL,
  `gid` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `gid` (`gid`),
  CONSTRAINT `UserGroupInvite_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `Invite` (`iid`),
  CONSTRAINT `UserGroupInvite_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `UserGroup` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroupInvite`
--

LOCK TABLES `UserGroupInvite` WRITE;
/*!40000 ALTER TABLE `UserGroupInvite` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserGroupInvite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroupMembership`
--

DROP TABLE IF EXISTS `UserGroupMembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroupMembership` (
  `gid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`gid`,`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `UserGroupMembership_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `UserGroup` (`gid`),
  CONSTRAINT `UserGroupMembership_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroupMembership`
--

LOCK TABLES `UserGroupMembership` WRITE;
/*!40000 ALTER TABLE `UserGroupMembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserGroupMembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroupOwner`
--

DROP TABLE IF EXISTS `UserGroupOwner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroupOwner` (
  `gid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`gid`,`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `UserGroupOwner_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `UserGroup` (`gid`),
  CONSTRAINT `UserGroupOwner_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `User` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroupOwner`
--

LOCK TABLES `UserGroupOwner` WRITE;
/*!40000 ALTER TABLE `UserGroupOwner` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserGroupOwner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-08 21:30:38
