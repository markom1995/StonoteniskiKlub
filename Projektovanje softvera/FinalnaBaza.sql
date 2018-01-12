-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dzoksrs_db
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Temporary view structure for view `aktivni_zaposleni`
--

DROP TABLE IF EXISTS `aktivni_zaposleni`;
/*!50001 DROP VIEW IF EXISTS `aktivni_zaposleni`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `aktivni_zaposleni` AS SELECT 
 1 AS `Id`,
 1 AS `JMB`,
 1 AS `Ime`,
 1 AS `ImeRoditelja`,
 1 AS `Prezime`,
 1 AS `Pol`,
 1 AS `DatumRodjenja`,
 1 AS `Fotografija`,
 1 AS `DatumOd`,
 1 AS `DatumDo`,
 1 AS `Plata`,
 1 AS `Tip_Id`,
 1 AS `Tip`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clan`
--

DROP TABLE IF EXISTS `clan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clan` (
  `Aktivan` tinyint(4) NOT NULL,
  `Registrovan` tinyint(4) NOT NULL,
  `OSOBA_Id` int(11) NOT NULL,
  PRIMARY KEY (`OSOBA_Id`),
  CONSTRAINT `fk_CLAN_OSOBA1` FOREIGN KEY (`OSOBA_Id`) REFERENCES `osoba` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
INSERT INTO `clan` VALUES (1,1,3),(1,1,4),(1,1,5),(1,0,23),(1,1,24),(1,1,27),(1,1,29),(1,0,30),(1,0,31);
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clanarina`
--

DROP TABLE IF EXISTS `clanarina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clanarina` (
  `Mjesec` int(11) NOT NULL,
  `Godina` year(4) NOT NULL,
  `TRANSAKCIJA_Id` int(11) NOT NULL,
  `CLAN_OSOBA_Id` int(11) NOT NULL,
  PRIMARY KEY (`TRANSAKCIJA_Id`),
  KEY `fk_CLANARINA_CLAN1_idx` (`CLAN_OSOBA_Id`),
  CONSTRAINT `fk_CLANARINA_CLAN1` FOREIGN KEY (`CLAN_OSOBA_Id`) REFERENCES `clan` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLANARINA_TRANSAKCIJA1` FOREIGN KEY (`TRANSAKCIJA_Id`) REFERENCES `transakcija` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clanarina`
--

LOCK TABLES `clanarina` WRITE;
/*!40000 ALTER TABLE `clanarina` DISABLE KEYS */;
INSERT INTO `clanarina` VALUES (3,2017,1,3),(4,2017,2,3),(4,2017,3,4);
/*!40000 ALTER TABLE `clanarina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clanstvo`
--

DROP TABLE IF EXISTS `clanstvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clanstvo` (
  `DatumOd` date NOT NULL,
  `DatumDo` date DEFAULT NULL,
  `CLAN_OSOBA_Id` int(11) NOT NULL,
  PRIMARY KEY (`DatumOd`,`CLAN_OSOBA_Id`),
  KEY `fk_CLANSTVO_CLAN1_idx` (`CLAN_OSOBA_Id`),
  CONSTRAINT `fk_CLANSTVO_CLAN1` FOREIGN KEY (`CLAN_OSOBA_Id`) REFERENCES `clan` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clanstvo`
--

LOCK TABLES `clanstvo` WRITE;
/*!40000 ALTER TABLE `clanstvo` DISABLE KEYS */;
INSERT INTO `clanstvo` VALUES ('2017-12-22',NULL,23);
/*!40000 ALTER TABLE `clanstvo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributer_opreme`
--

DROP TABLE IF EXISTS `distributer_opreme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributer_opreme` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  `Telefon` varchar(45) DEFAULT NULL,
  `Adresa` varchar(45) DEFAULT NULL,
  `Mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributer_opreme`
--

LOCK TABLES `distributer_opreme` WRITE;
/*!40000 ALTER TABLE `distributer_opreme` DISABLE KEYS */;
INSERT INTO `distributer_opreme` VALUES (1,'MalinaDOO','051/123-456','Krfska 60C',NULL),(2,'BradaDOO','051/125-345','Brace Jugovica 100',NULL),(3,'JovoDOO','051/125-645','Marka Kraljevica 150','joco95@gmail.com');
/*!40000 ALTER TABLE `distributer_opreme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dnevni_red_stavka`
--

DROP TABLE IF EXISTS `dnevni_red_stavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnevni_red_stavka` (
  `RedniBroj` int(11) NOT NULL,
  `Naslov` varchar(45) NOT NULL,
  `Tekst` varchar(1000) DEFAULT NULL,
  `SKUPSTINA_Id` int(11) NOT NULL,
  PRIMARY KEY (`RedniBroj`,`SKUPSTINA_Id`),
  KEY `fk_DNEVNI_RED_STAVKA_SKUPSTINA1_idx` (`SKUPSTINA_Id`),
  CONSTRAINT `fk_DNEVNI_RED_STAVKA_SKUPSTINA1` FOREIGN KEY (`SKUPSTINA_Id`) REFERENCES `skupstina` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnevni_red_stavka`
--

LOCK TABLES `dnevni_red_stavka` WRITE;
/*!40000 ALTER TABLE `dnevni_red_stavka` DISABLE KEYS */;
INSERT INTO `dnevni_red_stavka` VALUES (1,'Izbor trenera','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam volutpat posuere purus.',3),(1,'Kupovina namirnica','Svjezi odojak = 500 KM',4),(1,'8. mart','14. februar.',5),(1,'Odrzavanje memorijalnog turnira','Memorijalni turnir.',6),(2,'Izbor direktora','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',3),(2,'Odrzavanje turnira','Treba odrzati turnir.',4),(2,'Usvajanje budzeta','Koliki treba budzet?',6),(3,'Organizovanje turnira','Turnir u BL.',3);
/*!40000 ALTER TABLE `dnevni_red_stavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dogadjaj`
--

DROP TABLE IF EXISTS `dogadjaj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dogadjaj` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Opis` varchar(500) DEFAULT NULL,
  `DOGADJAJ_TIP_Id` int(11) NOT NULL,
  `KORISNICKI_NALOG_Id` int(11) NOT NULL,
  `Pocetak` datetime NOT NULL,
  `Kraj` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_DOGADJAJ_DOGADJAJ_TIP1_idx` (`DOGADJAJ_TIP_Id`),
  KEY `fk_DOGADJAJ_KORISNICKI_NALOG1_idx` (`KORISNICKI_NALOG_Id`),
  CONSTRAINT `fk_DOGADJAJ_DOGADJAJ_TIP1` FOREIGN KEY (`DOGADJAJ_TIP_Id`) REFERENCES `dogadjaj_tip` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DOGADJAJ_KORISNICKI_NALOG1` FOREIGN KEY (`KORISNICKI_NALOG_Id`) REFERENCES `korisnicki_nalog` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dogadjaj`
--

LOCK TABLES `dogadjaj` WRITE;
/*!40000 ALTER TABLE `dogadjaj` DISABLE KEYS */;
INSERT INTO `dogadjaj` VALUES (1,'Zakazan trening',1,2,'2018-01-10 07:00:00','2018-01-10 08:30:00'),(2,'Zakazana skupstina',1,2,'2018-01-24 18:00:00','2018-01-24 20:00:00');
/*!40000 ALTER TABLE `dogadjaj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dogadjaj_tip`
--

DROP TABLE IF EXISTS `dogadjaj_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dogadjaj_tip` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tip` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dogadjaj_tip`
--

LOCK TABLES `dogadjaj_tip` WRITE;
/*!40000 ALTER TABLE `dogadjaj_tip` DISABLE KEYS */;
INSERT INTO `dogadjaj_tip` VALUES (1,'Trening'),(2,'Skupstina');
/*!40000 ALTER TABLE `dogadjaj_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donacija`
--

DROP TABLE IF EXISTS `donacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donacija` (
  `RedniBroj` int(11) NOT NULL,
  `Opis` varchar(500) DEFAULT NULL,
  `Kolicina` decimal(8,2) DEFAULT NULL,
  `NovcaniIznos` decimal(8,2) DEFAULT NULL,
  `NovcanaDonacija` tinyint(4) NOT NULL,
  `Obradjeno` tinyint(4) NOT NULL,
  `SPONZOR_Id` int(11) NOT NULL,
  `UGOVOR_RedniBroj` int(11) NOT NULL,
  `OPREMA_TIP_Id` int(11) DEFAULT NULL,
  `TRANSAKCIJA_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`RedniBroj`,`SPONZOR_Id`,`UGOVOR_RedniBroj`),
  KEY `fk_UGOVOR_SPONZOR_DONACIJA` (`SPONZOR_Id`,`UGOVOR_RedniBroj`),
  KEY `fk_DONACIJA_OPREMA_TIP` (`OPREMA_TIP_Id`),
  KEY `fk_DONACIJA_TRANSAKCIJA` (`TRANSAKCIJA_Id`),
  CONSTRAINT `fk_DONACIJA_OPREMA_TIP` FOREIGN KEY (`OPREMA_TIP_Id`) REFERENCES `oprema_tip` (`Id`),
  CONSTRAINT `fk_DONACIJA_TRANSAKCIJA` FOREIGN KEY (`TRANSAKCIJA_Id`) REFERENCES `transakcija` (`Id`),
  CONSTRAINT `fk_UGOVOR_SPONZOR_DONACIJA` FOREIGN KEY (`SPONZOR_Id`, `UGOVOR_RedniBroj`) REFERENCES `ugovor_sponzor` (`SPONZOR_Id`, `RedniBroj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donacija`
--

LOCK TABLES `donacija` WRITE;
/*!40000 ALTER TABLE `donacija` DISABLE KEYS */;
INSERT INTO `donacija` VALUES (1,'Novcana donacija',NULL,500.00,1,0,5,2,NULL,NULL),(1,'Donacija sorceva',30.00,NULL,0,0,5,3,3,NULL),(1,'Novcana donacija',NULL,300.00,1,0,6,2,NULL,NULL),(1,'Donacija stolova',2.00,NULL,0,1,7,2,5,NULL),(2,'Novcana donacija',NULL,500.00,1,0,5,2,NULL,NULL),(2,'Donacija majica',30.00,NULL,0,0,5,3,1,NULL),(2,'Novcana donacija',NULL,300.00,1,0,6,2,NULL,NULL);
/*!40000 ALTER TABLE `donacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `donacija_detaljno`
--

DROP TABLE IF EXISTS `donacija_detaljno`;
/*!50001 DROP VIEW IF EXISTS `donacija_detaljno`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `donacija_detaljno` AS SELECT 
 1 AS `SponzorId`,
 1 AS `Naziv`,
 1 AS `Adresa`,
 1 AS `Mail`,
 1 AS `UgovorRb`,
 1 AS `DatumOd`,
 1 AS `DatumDo`,
 1 AS `UgovorOpis`,
 1 AS `DonacijaRb`,
 1 AS `DonacijaOpis`,
 1 AS `Kolicina`,
 1 AS `NovcaniIznos`,
 1 AS `NovcanaDonacija`,
 1 AS `Obradjeno`,
 1 AS `TRANSAKCIJA_Id`,
 1 AS `OPREMA_TIP_Id`,
 1 AS `Tip`,
 1 AS `Model`,
 1 AS `Proizvodjac`,
 1 AS `ImaVelicinu`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `izvjestaj_stavka`
--

DROP TABLE IF EXISTS `izvjestaj_stavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `izvjestaj_stavka` (
  `RedniBroj` int(11) NOT NULL,
  `Naslov` varchar(45) NOT NULL,
  `Tekst` varchar(1000) DEFAULT NULL,
  `SKUPSTINA_Id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RedniBroj`,`SKUPSTINA_Id`),
  KEY `fk_IZVJESTAJ_STAVKA_SKUPSTINA1_idx` (`SKUPSTINA_Id`),
  CONSTRAINT `fk_IZVJESTAJ_STAVKA_SKUPSTINA1` FOREIGN KEY (`SKUPSTINA_Id`) REFERENCES `skupstina` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izvjestaj_stavka`
--

LOCK TABLES `izvjestaj_stavka` WRITE;
/*!40000 ALTER TABLE `izvjestaj_stavka` DISABLE KEYS */;
INSERT INTO `izvjestaj_stavka` VALUES (1,'Odojak','Odojak kupljen i pojeden.',4),(1,'8. mart','Ipak je 8. mart.',5),(2,'Turnir','Turnir odrzan.',4);
/*!40000 ALTER TABLE `izvjestaj_stavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorija`
--

DROP TABLE IF EXISTS `kategorija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorija` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  `Link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorija`
--

LOCK TABLES `kategorija` WRITE;
/*!40000 ALTER TABLE `kategorija` DISABLE KEYS */;
INSERT INTO `kategorija` VALUES (1,'Senior','http://www.stsbih.com.ba/index.php/rang-liste/seniori'),(2,'Seniorka','http://www.stsbih.com.ba/index.php/rang-liste/seniorke'),(3,'Junior','http://www.stsbih.com.ba/index.php/rang-liste/juniori'),(4,'Juniorka','http://www.stsbih.com.ba/index.php/rang-liste/juniorke'),(5,'Kadet','http://www.stsbih.com.ba/index.php/rang-liste/kadeti'),(6,'Kadetkinja','http://www.stsbih.com.ba/index.php/rang-liste/kadetkinje'),(7,'MlaÄ‘i kadet','http://www.stsbih.com.ba/index.php/rang-liste/mladi-kadeti'),(8,'MlaÄ‘a kadetkinja','http://www.stsbih.com.ba/index.php/rang-liste/mlade-kadetkinje'),(9,'NajmlaÄ‘i kadet','http://www.stsbih.com.ba/index.php/rang-liste/najmladi-kadeti'),(10,'NajmlaÄ‘a kadetkinja','http://www.stsbih.com.ba/index.php/rang-liste/najmlade-kadetkinje');
/*!40000 ALTER TABLE `kategorija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnicki_nalog`
--

DROP TABLE IF EXISTS `korisnicki_nalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korisnicki_nalog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `KorisnickoIme` varchar(20) NOT NULL,
  `LozinkaHash` binary(60) DEFAULT NULL,
  `DatumRegistracije` date NOT NULL,
  `Aktivan` tinyint(4) NOT NULL,
  `ULOGA_Id` int(11) NOT NULL,
  `ZAPOSLENI_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `KorisnickoIme_UNIQUE` (`KorisnickoIme`),
  KEY `fk_KORISNIK_ULOGA1_idx` (`ULOGA_Id`),
  KEY `fk_KORISNICKI_NALOG_ZAPOSLENI1_idx` (`ZAPOSLENI_Id`),
  CONSTRAINT `fk_KORISNICKI_NALOG_ZAPOSLENI1` FOREIGN KEY (`ZAPOSLENI_Id`) REFERENCES `zaposleni` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_KORISNIK_ULOGA1` FOREIGN KEY (`ULOGA_Id`) REFERENCES `korisnicki_nalog_tip` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnicki_nalog`
--

LOCK TABLES `korisnicki_nalog` WRITE;
/*!40000 ALTER TABLE `korisnicki_nalog` DISABLE KEYS */;
INSERT INTO `korisnicki_nalog` VALUES (1,'Admin','$2a$12$hZFea90kEzpJbomE3ldiA.8gSsGBhz2GPZuNlVabtsdlf4EejeDOS','2018-01-01',1,1,NULL),(2,'petar123',NULL,'2018-01-05',0,2,18),(3,'marko123',NULL,'2018-01-05',0,2,16),(6,'markom','$2a$12$kdOdFpdUC1C/00zfq9X2B.bAIT5pCUiYTVgbe49HMN27B8fXG7i/G','2018-01-05',1,3,16),(7,'dejan123','$2a$12$.i10BLtDICH/DUdGtqwFzOq7MfsCBn6trYsi0kPEiXzOUIgIssfsi','2018-01-05',1,5,34),(8,'sekretar','$2a$12$HU6oAh1Ya5aiSCxOySPyYuvR5xT/4rWV5dw2/eeov5Ml4ppLgAU8W','2018-01-05',1,2,19),(11,'racunovodja',NULL,'2017-01-01',1,4,NULL),(13,'user','$2a$12$duyYn/SDoTPcnSxil3PfGOXuJZPTjxGwa64eVM9qnYgd2ZaTF22ea','2018-01-05',1,4,16),(14,'maja','$2a$12$6ghCkTROnWC6efQ5wu2i0.2HJS26nrVpI76AMw/xhQBJyPuBxf5MW','2018-01-05',1,4,20);
/*!40000 ALTER TABLE `korisnicki_nalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnicki_nalog_tip`
--

DROP TABLE IF EXISTS `korisnicki_nalog_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korisnicki_nalog_tip` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Moguce mjenjanje imena tabele',
  `Naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnicki_nalog_tip`
--

LOCK TABLES `korisnicki_nalog_tip` WRITE;
/*!40000 ALTER TABLE `korisnicki_nalog_tip` DISABLE KEYS */;
INSERT INTO `korisnicki_nalog_tip` VALUES (1,'Administrator'),(2,'Sekretar'),(3,'Trener'),(4,'RaÄunovoÄ‘a'),(5,'Organizator turnira');
/*!40000 ALTER TABLE `korisnicki_nalog_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mec`
--

DROP TABLE IF EXISTS `mec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mec` (
  `RUNDA_ZRIJEB_Id` int(11) NOT NULL,
  `RUNDA_Broj` int(11) NOT NULL,
  `RedniBroj` int(11) NOT NULL,
  `Rezultat` char(3) DEFAULT NULL,
  `TIM1_Id` int(11) DEFAULT NULL,
  `TIM2_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`RUNDA_ZRIJEB_Id`,`RUNDA_Broj`,`RedniBroj`),
  KEY `fk_MEC_TIM1_idx` (`TIM1_Id`),
  KEY `fk_MEC_TIM2_idx` (`TIM2_Id`),
  CONSTRAINT `fk_MEC_RUNDA1` FOREIGN KEY (`RUNDA_ZRIJEB_Id`, `RUNDA_Broj`) REFERENCES `runda` (`ZRIJEB_Id`, `Broj`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEC_TIM1` FOREIGN KEY (`TIM1_Id`) REFERENCES `tim` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEC_TIM2` FOREIGN KEY (`TIM2_Id`) REFERENCES `tim` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mec`
--

LOCK TABLES `mec` WRITE;
/*!40000 ALTER TABLE `mec` DISABLE KEYS */;
/*!40000 ALTER TABLE `mec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narudzba`
--

DROP TABLE IF EXISTS `narudzba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `narudzba` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` date NOT NULL,
  `OpremaKluba` tinyint(4) NOT NULL,
  `Obradjeno` tinyint(4) NOT NULL,
  `DISTRIBUTER_OPREME_Id` int(11) NOT NULL,
  `Obrisan` tinyint(4) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_NARUDZBA_DISTRIBUTER_OPREME1_idx` (`DISTRIBUTER_OPREME_Id`),
  CONSTRAINT `fk_NARUDZBA_DISTRIBUTER_OPREME1` FOREIGN KEY (`DISTRIBUTER_OPREME_Id`) REFERENCES `distributer_opreme` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narudzba`
--

LOCK TABLES `narudzba` WRITE;
/*!40000 ALTER TABLE `narudzba` DISABLE KEYS */;
INSERT INTO `narudzba` VALUES (1,'2017-08-21',0,1,1,0),(2,'2017-09-21',1,1,3,0);
/*!40000 ALTER TABLE `narudzba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narudzba_stavka`
--

DROP TABLE IF EXISTS `narudzba_stavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `narudzba_stavka` (
  `NARUDZBA_Id` int(11) NOT NULL,
  `OPREMA_TIP_Id` int(11) NOT NULL,
  `Velicina` varchar(10) NOT NULL,
  `Kolicina` int(11) NOT NULL,
  `Cijena` decimal(8,2) NOT NULL,
  `Obradjeno` tinyint(4) NOT NULL,
  PRIMARY KEY (`NARUDZBA_Id`,`OPREMA_TIP_Id`,`Velicina`),
  KEY `fk_NARUDZBA_has_OPREMA_TIP_OPREMA_TIP1_idx` (`OPREMA_TIP_Id`),
  KEY `fk_NARUDZBA_has_OPREMA_TIP_NARUDZBA1_idx` (`NARUDZBA_Id`),
  CONSTRAINT `fk_NARUDZBA_has_OPREMA_TIP_NARUDZBA1` FOREIGN KEY (`NARUDZBA_Id`) REFERENCES `narudzba` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_NARUDZBA_has_OPREMA_TIP_OPREMA_TIP1` FOREIGN KEY (`OPREMA_TIP_Id`) REFERENCES `oprema_tip` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narudzba_stavka`
--

LOCK TABLES `narudzba_stavka` WRITE;
/*!40000 ALTER TABLE `narudzba_stavka` DISABLE KEYS */;
INSERT INTO `narudzba_stavka` VALUES (1,1,'L',1,15.00,1),(1,1,'XL',2,15.00,1),(1,2,'S',1,12.50,1),(2,5,'-',5,1350.00,1);
/*!40000 ALTER TABLE `narudzba_stavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novcana_sredstva`
--

DROP TABLE IF EXISTS `novcana_sredstva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `novcana_sredstva` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sezona` char(9) NOT NULL,
  `Budzet` decimal(8,2) NOT NULL,
  `Prihodi` decimal(8,2) NOT NULL,
  `Rashodi` decimal(8,2) NOT NULL,
  `Obrisan` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novcana_sredstva`
--

LOCK TABLES `novcana_sredstva` WRITE;
/*!40000 ALTER TABLE `novcana_sredstva` DISABLE KEYS */;
/*!40000 ALTER TABLE `novcana_sredstva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oprema`
--

DROP TABLE IF EXISTS `oprema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oprema` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OPREMA_TIP_Id` int(11) NOT NULL,
  `NARUDZBA_Id` int(11) DEFAULT NULL,
  `Obrisan` tinyint(4) NOT NULL,
  `Velicina` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_OPREMA_OPREMA_TIP1_idx` (`OPREMA_TIP_Id`),
  KEY `fk_OPREMA_NARUDZBA1_idx` (`NARUDZBA_Id`),
  CONSTRAINT `fk_OPREMA_NARUDZBA1` FOREIGN KEY (`NARUDZBA_Id`) REFERENCES `narudzba` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OPREMA_OPREMA_TIP1` FOREIGN KEY (`OPREMA_TIP_Id`) REFERENCES `oprema_tip` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oprema`
--

LOCK TABLES `oprema` WRITE;
/*!40000 ALTER TABLE `oprema` DISABLE KEYS */;
INSERT INTO `oprema` VALUES (1,5,2,0,'-'),(2,5,2,0,'-'),(3,5,2,1,'-'),(4,5,2,0,'-'),(5,5,2,0,'-'),(6,1,1,1,'XL'),(7,1,1,0,'XL'),(8,1,1,0,'L'),(9,2,1,0,'S'),(10,5,NULL,0,'-'),(11,5,NULL,0,'-');
/*!40000 ALTER TABLE `oprema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oprema_clan`
--

DROP TABLE IF EXISTS `oprema_clan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oprema_clan` (
  `OPREMA_Id` int(11) NOT NULL,
  `CLAN_Id` int(11) NOT NULL,
  PRIMARY KEY (`OPREMA_Id`),
  KEY `fk_OPREMA_CLAN_CLAN1_idx` (`CLAN_Id`),
  CONSTRAINT `fk_OPREMA_CLAN_CLAN1` FOREIGN KEY (`CLAN_Id`) REFERENCES `clan` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OPREMA_CLAN_OPREMA1` FOREIGN KEY (`OPREMA_Id`) REFERENCES `oprema` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oprema_clan`
--

LOCK TABLES `oprema_clan` WRITE;
/*!40000 ALTER TABLE `oprema_clan` DISABLE KEYS */;
INSERT INTO `oprema_clan` VALUES (7,3),(8,3),(6,4),(9,4);
/*!40000 ALTER TABLE `oprema_clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oprema_klub`
--

DROP TABLE IF EXISTS `oprema_klub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oprema_klub` (
  `Opis` varchar(200) NOT NULL,
  `Aktivan` tinyint(4) NOT NULL,
  `OPREMA_Id` int(11) NOT NULL,
  `Donirana` tinyint(4) NOT NULL,
  `DONACIJA_SPONZOR_Id` int(11) DEFAULT NULL,
  `DONACIJA_UGOVOR_RedniBroj` int(11) DEFAULT NULL,
  `DONACIJA_RedniBroj` int(11) DEFAULT NULL,
  PRIMARY KEY (`OPREMA_Id`),
  KEY `fk_OPREMA_DONACIJA` (`DONACIJA_SPONZOR_Id`,`DONACIJA_UGOVOR_RedniBroj`,`DONACIJA_RedniBroj`),
  CONSTRAINT `fk_OPREMA_DONACIJA` FOREIGN KEY (`DONACIJA_SPONZOR_Id`, `DONACIJA_UGOVOR_RedniBroj`, `DONACIJA_RedniBroj`) REFERENCES `donacija` (`SPONZOR_Id`, `UGOVOR_RedniBroj`, `RedniBroj`),
  CONSTRAINT `fk_OPREMA_KLUB_OPREMA1` FOREIGN KEY (`OPREMA_Id`) REFERENCES `oprema` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oprema_klub`
--

LOCK TABLES `oprema_klub` WRITE;
/*!40000 ALTER TABLE `oprema_klub` DISABLE KEYS */;
INSERT INTO `oprema_klub` VALUES ('Nova oprema.',1,1,0,NULL,NULL,NULL),('Nova oprema.',1,2,0,NULL,NULL,NULL),('Nova oprema.',1,3,0,NULL,NULL,NULL),('Nova oprema.',1,4,0,NULL,NULL,NULL),('',1,5,0,NULL,NULL,NULL),('OPis',1,10,1,7,2,1),('OPis',1,11,1,7,2,1);
/*!40000 ALTER TABLE `oprema_klub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oprema_tip`
--

DROP TABLE IF EXISTS `oprema_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oprema_tip` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tip` varchar(45) NOT NULL,
  `Proizvodjac` varchar(45) NOT NULL,
  `Model` varchar(45) NOT NULL,
  `ImaVelicinu` tinyint(4) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oprema_tip`
--

LOCK TABLES `oprema_tip` WRITE;
/*!40000 ALTER TABLE `oprema_tip` DISABLE KEYS */;
INSERT INTO `oprema_tip` VALUES (1,'Majica','Adidas','M100',1),(2,'Majica','Adidas','Z150',1),(3,'Sorc','Tibhar','M1543',1),(4,'Duks','Nike','Z342',1),(5,'Sto','Tibhar','S786',0);
/*!40000 ALTER TABLE `oprema_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osoba`
--

DROP TABLE IF EXISTS `osoba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osoba` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `JMB` char(13) NOT NULL,
  `Ime` varchar(45) NOT NULL,
  `ImeRoditelja` varchar(45) DEFAULT NULL,
  `Prezime` varchar(45) NOT NULL,
  `Pol` char(1) NOT NULL COMMENT 'mora biti M ili Å½',
  `DatumRodjenja` date NOT NULL,
  `Fotografija` longblob,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `JMB_UNIQUE` (`JMB`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
INSERT INTO `osoba` VALUES (3,'2703996105051','Helena','Brkanlic','Zarko','Z','1996-03-03',NULL),(4,'2703996105052','Helena','Brkanlic','Zarko','Z','1996-03-03',NULL),(5,'2703996105053','Helena','Brkanlic','Zarko','Z','1996-03-03',NULL),(6,'0101970100001','Marko','Petar','Markovic','M','1970-01-01',NULL),(8,'0202980100002','Petar','Marko','Petrovic','M','1980-02-02',NULL),(9,'0303971100003','Marija','Milos','Maric','Z','1971-03-03',NULL),(12,'0505993100005','Ana','Janko','Anicic','Z','1993-05-05',NULL),(15,'0404958100004','Jovan','Mitar','Jovanovic','M','1958-04-04',NULL),(16,'0101970100301','Marko','Petar','Markovic','M','1970-01-01',NULL),(18,'0202980100202','Petar','Marko','Petrovic','M','1980-02-02',NULL),(19,'0303971100403','Marija','Milos','Maric','Z','1971-03-03',NULL),(20,'0404958104004','Jovan','Mitar','Jovanovic','M','1958-04-04',NULL),(21,'0505993150005','Ana','Janko','Anicic','Z','1993-05-05',NULL),(22,'0121970100301','Marko','Petar','Markovic','M','1970-01-01',NULL),(23,'1234567890123','Marko','Radovan','Malinovic','M','1995-11-13','ÿ\Øÿ\á\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0ğ\0\Ò\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0ú8n\r\Èu\Í)TnT…Ÿ\æ*òª;\\¶G#¥jA`Œ¨zw\Í3pŒb\Ë\ëÚ–)ĞŒ0\Ç^ÕŸ¨–1´£vIÇ­\0>	\Ò\è, p\Ù\Ç9\ÅM¸! q\ÍRÓùQ¶\É\éÓŠm\Ş›”²œğ=\è\Õ\Ò\îŠ&Û“š…ƒ¶HÛŸ»NÙ“’½A÷úP\â<n\ê=hHö^@\0ŒŠ¬\à¹H Zóÿ\0ˆ?´\'>?“\â/Z\Ù\\~È„\É6?\Ü^G\ãŠ\â4\Ï\Û3á¶½,qi:ö§©O\'—m§\È\×7`«\Ğşt\ÏzHË®IÛ¡Ç¥hÄ DÀ\ÊóÒ¼N\ë\â\Ä;\Òf\Ò~jÛT\êZ¬\Î\ÃÔ¨\ÜG\âk\Ä_´¿Œ>\é/«x\Ï\áEŞ•£DÁ^\î\×Y‚b§\Ğ+`±ö¹ô|aÀy\"¤Àd<w\È\Í|•{ÿ\0ğ\Ä\Æ!¢øCÄš²2‚\Ï\å$AO§$\ç\ëO·ÿ\0‚„h14cRğ\'‰\ìm‹|ó\íŠ@£\×h94\Ì÷o24?\rµu\'†¦O¼‹_71ˆ\à\Åz‰¾;x+\âÿ\0\Ã‰</¬\Å{\'\Úm\Ö[W\'‹\æ\ÏÌ\È\é\ÔdW—K9#­y˜§y#\è²\Åjmù™“ı¡qO\È?ñ\ÚVnsÀaL·\Ü\ç=Wÿ\0A©Ns:\â°=$†\ã ‘\Í.İ£8\ÇÒš\0	\éOó\ÂûŞ´U“\ç`\íüqN+»€y\év\àg8<S²Á\æ‚Hœc,	§Gó\0wu§m\à\ä\ÏÒœ\0\íŒ\Ğ$…=É­\ïø™ô¯\Ü\ÊI·\'9\êW\Ü{W>FF3»¾i­À s¹¨”T•˜š¹\ëi«BÈ§\íœŒõW„Ÿ­\Íõu\ÜË”ûmÔ†\àc¾i\Ó† )\ïQ±,@\Ï\Ù\â\0\àŸ”óS_L|z²‹\ÇC\ïÚ„f,¹_—¿zw™\ßo\ÔR´Œ·~½?JbWÀ`¸\â«4D\È*£Ö®cªƒŒTeB‚„ƒœñ@\ía‘Hv\07¯ı¦ş7^x\Ö\Û\Âş*|Yª©e”\Ëepfaı\âxQ\ë\Í{¡+—<–>Ã©ı+\à\Í~ox³\Ä~3½9¹½ºe¶\ÏH\ãV)eU-õ4Ò».1»±\É\Å\à{g½\Ô@\Õ5e&{\Û\Ó\æI4‡–9>•“\âM\n\ÛH‰5ı8\r;T\Ò\Ø]\Ã=·\ÈrŒA®\ÛS»W!>R\0©ŸA\ÔıIÉ¬\Ét9ü[¨i´º\Ön£³\0vBÙ‘¾C\Z¶•‡¢}¢~\Ö~¸°·™%\Ôõ!®&°\Ò\'Ø¨,ªãƒœ\â¾_ø\íñ\Ó\ã\çÅ«‰\ìnÿ\0„48\ã‚\Â2\Ç,\åwI)B[$/#Œb¾şĞ´û\é\ÖV}\Ò\Ş4‰5Ø»T\0\àW\çÕ¥„6¾ E$B/°\ë—S¼dc‚C/‡5Õ£\îhÃ£¥´\é\È9D\×2`b%…•‰|-š\åÅ°a\0\áwœ“\ïø\Õùu¡-…\È\Ã}®\ê\\\Èı¶Š+&µ:\ÎkXğ»\Ã{³¡Iı›­Û°t–/•d#¬•\è>5Xxº\Ò8µ8\ßI¿`c0\Ä \êªıÿ\0e°kôª¿	­mgñ·Œô;˜#\Æ\æ(nŒ\0T±\Ècƒ\ÜûW&q\ægV\Z¤¡QF/Fzô„=ı\È\åÜ§ƒş\Í=À<\\€\Ñõ?\İ\İ.”Í©iŠ\Êt\äJƒoH\ä=G¢·\ç[\Z\'‰-5\åq<S\Æv\Ëm2\ì–#\è\ÊC\Ğ×š\×cÛŒ¯¾Œ\Ó\Ú\Ù\Ï\Ç4¥r¤íš˜*‚\ê{ú\Ó&œ\ÅM\Íl Cƒ€}E@ø\r’:şU`· \ä/\ëLu$dŠb±\\p=©©ü\é\Û\Éı)6®rr}J¸‹½‡Œô\Æi® ‚AúR±`\ãš¶Šw\â?*)Xzf\Ê@<ô\à|\ÂH|zqH²ùƒk0r(X\É$\Î:÷¯lø\Ç98œ\Ó\Z@ƒ \Æ\ÌG9§\ä*\àó\ïU\æ \ç‚Nz{P41\äa‚»³)V\à‰3Á\Ç\ëL ‘\ßñ¦È»pr@\í\Í)x²\ì\ÛxcT•	óV\Îv_÷„mŠüôğ\å\àŸ\Â\ZDJ\"/1\Éş&jıñ5şŸ¥h\×W:¥\ÌVš|p±¸šf\nŠ„Ä“\ìkó^/\éşš}+PûE’@\îm$¹·xş\ÑnX˜¤P@8*F(\æŠvlÖ–\çZ\î#R\ÌB¨$œ^\×û\'ş\Ï~$ø—«\Â~u–ğÖ„‰-›,V\ê÷s©8’h·q\Z¶6† œŠ\â~ş\Ïş$ı¢µ›y®¬.ô/‡ñ:µ\Õı\Ê¥¿Ps\åB§­Ğ·LWé¦…¤YøwK´\Ót\ëx\í,m\"Xa‚%\Â\"…P=\0ùqGÔ¡õ\\—´{µ­—ùŸAƒÁ{_~ªÓ§™\çö^ğ$\È_W¶\Ô|ApykWTW\'\ÔuUü~xüyğş‡ğóö†\ÖÂ»\Û\Âz°XVtgxö5ı\ì+#¼¯\ä\àœv¯\Ñ_Š\ZŞ¯\â\Íe<á¶¸³\ê%›W\ÖcRŸhÄ‚¨Çƒ4€P>\è%j\Æø¯û/xs\â\'\Âğe´	¥EiW0¯6s/\İa\Ü\äğ\İ\Û$k\ã2<ş¶]^5±õe%=,\İ\ÒO\í5\Ğë¯„Œ\â\Õ$•¿~xQUu\Øu?‡\Ş(¸ğ¯Œm¯Ú¤I\ÄW#´‘1\à«uüjsq\Z¡r\ê\î,1ù\×ô\r*°­Rœ“OT\Ö\Ìù\×x»=\ç`ŠI \02I\ì+\×?d/†>ñ„üñ#\â•“øvK¤µ³º\Ô\"\Å#\ç‘H#,Áx\äô¯ğÏ…õŸ(‹Á¾F¹švÿ\0Q@LPg\æfn™\Æp:“_rx\á™¬ø\Ú\ßÀ~C\'€ş\Ãh«b\ØÙ©j2¯˜%˜wT0SÁ-“Ò¾‰ó:Th<<ggk¶©/Õ½CI¹{F®¶WÙ³\ÆõO\ÙóYø§ğsF\Öü9¤K&\èµja-.PvÎ­.\Ò>\é$qT<Eûüo[x5øEoµ«eù%²½xdq\İ2\íe?\İ\'\Üb¿E–%TÚ€tÀ¥n€f¿%\Zc\é5\nIr­¯vşl÷>©µnş[˜\æ\ã]ğ\ÍÕ¾—\ã__x[Ys°%\ÜG\ìó°ÿ\0S«g°\ÎkTÈ¥I\ä0¯\Ğ?\ZøDñÿ\0‡\îtmN‡S\ÓnÃ€{2‘Ê°\ê`Šø\ão\Â?\Zü\0\Ö-å°µox\î\àCos4¡.¬ØŸ–)]¾REcŒğ	¾ÿ\0#\âz9¤½d¡S¢¾\Ò\æsŒ¨­u]ú•–A€1‘ıhv€;g9¬=/\Å·\×òiò\Ç>«Eş·M¿ˆ\ÃpŸğ\ê=\×\"µ\Ød8Ç½}Â³WBRM]\r$\çt¥À\îx¤\Î\ŞO¥&ğT\ã9¦ˆfš[¯T!l\ãŒt§a‡\0“ŸZqû¿\çEC\åIÿ\0=ûTH[ ùÓ·\0ß’Ç‘QÂªòœñ¹\ãò©$T-€\ßOzö‹cC!—#°÷ \å‰Ü¤qœ\ã¥;\Ë*\01p\0\Î\Í°\É#^£<s\Ğ\Õw1ŸoZ³*¹\á}}j¤‘œ˜}1š\0ó+[\r;\â/¼C©ø‘‘¼\àLm¥¢¹¿	½\×ø\Ö%#j¬\Õ\Şø\ádµôø\ãm.	\ï%‡\ËÑ´{¸U\ÓM´\'*XÌ®0\ÌO\nQ\Ğ\×Ï²xs\\ñ?\Â¦[øˆ\évzÿ\0Œ.\ìµ\r6\Ö3ö»\é\ä¼\Ëi\İE‰¼ğ9\Å{Í‡Á|2\Ôm/|\âıGS³„ºĞ¼Uz\×6óBXb”\Ñ:¯#¨=\r~%\Ä8™N½G\íùdÛŠNöIyômõüO®ÁRQ§F\ëFıY\î\Öğ¤ª\"„UT(À\ĞÂ¬)\0\ß5dñ´\î­\Í~C&\Û\Ôú&‘<erI$úT…»d\0*\ãŒ•\æ%µø™\â\Ï^X\é¶\nğüMå®§\å­\åõ\Ï-\Z’%ô-–ö­(\Ğöò|\ÒI-\Û’9\çî«¥sK\â\ÇÁ/üj\ÒNñn‹oªF™0\Ì~I¡\'º8\å~=«\Ä4\ïø&¿\Â+KÅ–u×¯­Á\Ï\ÙgÔ–G¡\Ú\"½1¾x®\Ô	¬¾1ø\È^A½[{ˆXÿ\0µA‘\ì\r7Lø§\âo‡Zİ–ñ2\Ú\Ë\ìwÒ‹k/ijR\ÒI\Â6Lİv“\ÆE}&¡I\Ò\Ëñm¥öSiù\Ú\é~ŸR\äÔªC\çşgm\à†^øa£\'\Âú5¦‹b f+X\Â\ï?\Şf\ê\ÇÜš\æ<5\á½w\Ã¼S¨-¨Ÿ\Ã#±¶®•\Ô5½\ä\nc*\Êy*\èAt \æ½FA\æ\0ÀU[€Bq÷½kÄ6¯\ï=£\æsVmİ½÷=gE%¥¶±oxÁ\Å8°q€y¯ °ø¯øC\â\Ä^ñcEu¤\ë\ï#øWŠ1$U\Ü\Ös(\ãx\\²·ñ\0A\æ½ubkNXn^fš’ºkf¿\à\n2R¿F‰#\Ë/=k/\Ä:\r‰t{½+T´†ş\Â\éS[Î¡•ÔU«\î\å2¸Ç¡¡ù‰r2MrBR„”\â\ì\Ñ|½\Ï-ñ\ÇÀox\ß\Ãöº>¯ Á,¬6—\nJ\Ü[*Œ/—6w©5ò—\ÅO€ş+ø2³jZ|·>/ğtc21]Ú…Šy€ÿ\0Zƒû\Ëó\ÔW\ß7\n‡hq€:f©L\"°\0*k\ër®!\Å\å\ÓV“”z¦\î¾Fs¡\Z‹\İ\Ñ÷G\æıı¾«iÕ´\Ë=¼ª]A;ªq\É\ÇZô?\ÚS\à¬õ•ñ§‡£6\Ş\ÔnDz¶\Zş\î\Îw8[„\î«7\0k\ÎĞ‡\àk÷Œ¿K1\Ã\ÇE\èşôû3\ÍiÅ¸\Ët5AnŸ{½I´²€Ö\Ü\ç \ã8¯DC\nCùŠ)\ŞPö¢‹öj«¤9\êi’\ÅJö\ëAı\ÙùH`G\ãM,L{°0§¥{G\Æ\n\Ììª¿y@ü)È‹øJdd¾@\Ç<•\'*2Æ‡\ç$“\Ğu\Z\ìD™PYOAYZöµg i·7·\Ó{x€f|9\'\0\09$’\0’N+P\È:¦{×œügñ¯ü+MLñqÓ†µ‡©E|\Úq<\\0WX\Æ?‹lŒ­·©\Ç=!¿\r?go‹÷ş<¸ñnŸ£i\ZO†¾\ßsª\ézoŠ\'’;…x\ÕfŠ Jğ¤ª“‘¼“\Ívş6ø±ã†w\ZFƒ\â/Go\â}gQƒOÒ¥²º7\Zu\æ\æVY0\n&\æ*\ËÛ­x\ï\ì‡ÿ\03ñg|i\â+‰\Ği°hVz|÷ÿ\0n²·1I«\0°…\É23³mU\Æ\â\Ø÷¯zğ“âŠ>;|umı—\"Ûµ¿‡¼8\Çq\Ò\í\Üå¥—·\Ú$İº>ZüÛŠpùM\ZŠ\êtWÕ¿‘\î\à*b”)½:¤ó“\Ü\â—$pjÌ	9Ò«:F0kùï›˜û»PXf¸M\ã6‰¤k³hz}¶§\â}z&]3\Ãömu,Gı\áT\ã³0>\Õ\Ø\ê’Otm\ã\çÉ“\Éÿ\0®›N\ßü{ñ÷ƒà¦Ÿ¿gı7Kğd^×¯®\í\Ó:Ş ­rI|\ÌL\ìÁ¾iq<“\è¾ó…r\n9\Ô\ê:òiF\Ú-\Ù\ä\æ©á¢¹\çĞ·Ÿ\ìü8\Êş*ğ§‹<!b\ÅGö–±¥2Ú¡=H…‚}[Š\í5m#Dø‹\á[›¤ƒU\Ñu;m­±ƒ¤Ñ°á•‡„0\è@\"½\á§\Ä_üuøg¦x£Do¶øY·,‰u	\\•tulŒ‚#‘^-\ámNğ\Å\ïxO\Ã\áağå½½–£ŸŸ<ÁÄ¢ÿ\0°Upƒ¸\à\0k\İ\â.¡•\á76¹^©¿\È\à\Âc\å^~Î¢Z†›¦Ç¡i¶\ÖP<¯,1™X»\0ªe$\àOZ	o0\ÍYù\Î\0\éQM$Qn@À\È;µù73m¹j\Ùô‘²\Ñ]ûHøz\ãVøe¨^\é‡f·¢mÖ¬&”šß€{nP\Ê}z…|M‰ü5¤\ë\ä\ê‘] €$El~‘Uõ+E¾²¹·œx\Ş&¡”©‘®öb¼’\ã\à_ƒ\ÖG.\Öö\Ïl	8iG\àª{M{\\»\Şû²ô’\Ûğ1qµ_Uù¼$G?Jz®H9\0\ëQ\Ü:Có61šÏ\Ë\Èv¹(zŠñT.o¢Y®M\Î\Ğ\ãhœTK…9\0\Ôdœ€G>´­û¶y\\s[¤–…¢‡‹|1§x\×\Ãz‡©\Ä\'\Óõ\Z\Öd=Õ†	\ã9\â¿:¼=cq¢\Åy£]»Iw£\ŞM¦\Ê\îr\Ìbrª\ÇÜ®\Ó_¤bM\Ìp0¸\â¾øµ¥\ãÏ\íP†\î\â\ßR@;bÿ\0ñ\å&¿O\àŒD£R®½\ZMzõ<\ìTW2—]Œ#\0gÒš\ä\ì$iÌ¤”İŸ1 \ãkõÓQ˜S\ëE?qõ¢f[…w#vN1øÓ‚Ÿ7À\èER²v\ÛÁ$“\Çvb$\Ş\Õ\ír2ƒw.;š`!†\É=i\Êø\'x\ÏsX^)ñ¦‰\à»½\Öõ[M*\Õ2|Ë¹U3\ìå°^Àm2 \ŞpAæ¼‹\â\Ä=Kø—¢Y\ê \Ş\Û\è\Ñj¦•n¾eÎ£|Ä¥¤1\Æ9b\ç=†4–<[ñjõ¬şøR{‹;dñ>½[XF?¼Š~y}@½‡\á/\ì\ã¤xZ“\Å:µÁñ7n-Æ¹wVA¹ô‰\0\à\ÉM|/ñBt9¹¦\Ó\Ñ?\Íô=|\n¥Y©\Ú\Éug/ğ“öw—Yñ±ø™\ãıJ°×Ÿ\æÓ´+E§sºVQû\ÙıXğ§8æ¾‘\Û\ÇJ…H‘Ÿ ©\r¼Wó\Æ?[QN³\Ñh’\Ù.‡\ÖB”i+D*9À(sR“)»ö¯5w5\å@¾µó§\Ç\Ø{Àõ\ã\â?!´_3‰&¹·@ğ\İÿ\0=¡8\rõ\Zú3õ¨dªœW­\Çbrú\×\r7\å\×\ÕR:\Ñåšº<—Â	ø£\á/\r\Øø[Iø‘¦xÃ–(!‚\r\ÃÁ*F;+3°rr\Ø÷®ÿ\0Á>°ğ>Ÿ<qusw+\\\Ş_\Ş\Êe¹»™¾ô’¹å›· \0jÀ\àœI©‹m\\÷\Ízü\ï0Ì ©bj¶–¶\Ù|\ìeK	F‹½8Ù“\ï\Ã\îY\Ğ™ğn¦£kœJ±\É\ãµ°é“œ×„£mNµ˜8\ß\"Å€ıkÉ¿e\Ù\Ä\ì\"$\"ÿ\0PˆL]\È+×‘@xøş%şb¼köo²\Û\à=F0!ñ­ô»cık\ÚÃ¥,[÷\ä\ÌeüXú¯w#\ÜÊ®Jù`p=}\êhFğx)“ XQ•<\éN`PT\çœW”Úµ‘²C£À\àµV\í‰\È\\ğJ\Üd\00G½0¯˜­\ëBVÕm§¯\é_|{š+\Ú#\Ä\â\ŞSM\Ó\Ò\\ºû\\\í>ø \×\Ú×—\ÙC$³:¤1©grp@\Ëô\0\×\çœz\ãx\×Ä¾\'ñcWZ\Õ&¸„Ÿù\à§d_†\Õ\Ï\ã_¦p^OR¿D­ógŸŠ•ùc\çr\è\Èô\É:ğ9FiH\Ï<Ğ«°O\\\×\ë\ç(\ï“\ÔşTS|Á\ê( V>¾‹®I\ÃOµx7ÿ\0k3T¼\Òü+£¿ˆ®m\Ø\Å&¡$\Â+$pT0\æL»x\íš\íÿ\0h\rvÿ\0\Ãÿ\0	|I{§K\ä\ŞqKĞ¦öTf\à1\Å|Ki\â-.Õµ:Ğ——Jˆ™!v\'©õ>¦«1\Å\Õ\Ã\Å*Q»rG\ÌahÆ«¼İ‘\èú\×\ÆßŠ> †hÏŠ-tX\äÛ¤\éê®£\Ğ;’\Z\ã¼w­x7\ÄG\\¹\ZG5ûÄ¾+´k¦Odm\Ø_¨Z5»u\ÑS”˜­¼;\Î\ĞF{u¨ü7\âK?\é\ÂöÈ±‹qBv°#\ÔW\Ç\Ö\ÆcjB^\ÓX\ìô\Ó\Ğö\ãB„Z\åZîºşşÕºgÄV\Û\Ã:Æ<1\âCöXR@ö·AFXB\Üa€\çi\ÇL\×\ÑA‡cø\×\æ\Âè¥¸ø\Åğş`\Ít\Ú\äz…P\Ì\ç\è9¯\ÓÈ¹\ä;}+òLÿ\0KR)+)&\Úó]®{xi¹E§­‰q“V\"}\Ãıj ¨\0Ry„_$\ÕÎ†¹‹,§j9¤\Ø\È\Ì	şÒ–9ı\é\Ìp	©K]Löv+\Ì\ê¼\Õ”v‹*xŸ¥Zh‹\ç5’}š2¸\ÜXc¼t\Ø\Ú:+-Ô†,MK+’Ga\ëQ1,I\Ç$\à1\Æ;U½]\Ê\Ëóù\Ô\Æ%Sº €”Rs\É\íVÀ\Üx¢[€ n\Çò¯$ø:\ÙC\ã­!Â‰t\ï\ê\n@?\Ã#,ªqÛ†¯\\# Â¼oÁ¹\Ò~>|MÒ¾\ê\êiú\ÜY-º3{\áW¯‚^\Ó\r^Ÿ’sÿ\0‚cSIF^¨õ\ÉÊœ\ÓI\Ê0={UUs´p\Êz\ÔÍ»!¸;«Ëµ†<È¥rpiRP2<\Ô\Z¥í®™e5\İÜ‘\Ão’YX*¨%‰<\0=kã¿‹µµñyôo‡³6‘\áñ˜§ñ)_\ß\\veµS÷W·˜ß€¯w+\Ê1´ù(­\í\ìŒjÖ%\æúw\í[ñ¦!iqğó\ÃWk6»¨¦\ÍJxwöu©ûÛˆ\è\î>U^ k\Âtûh\ì,¢¶pÄªˆ }\Ğ\0ªš.…g [¼v¨\Û\åc$\ÓH\Å\ä•\ÏVf<–>¦´pvŒw\ë_»eym,¯¨Sw{·İ_4§\')oùCûsš{À\í\íM8n*D‰ˆ\Îök\Ø7\Ê”S÷{~”P\Óü#¼¬h±Š-Bİ¡\Ş:£U¿\n\nü\ãO_xG\âÖ¡¦\êĞˆu	\áxom\È9VL~ñ{q‚¹úw°\àa²Kg¥x\ç\Æ„šo\Ä\ßx\Z\Ö\æ\ä\èw·r^[®«nŠd°\ïŠ6\Ï…ƒ§®8\Åtf\n+:’v²\ß\ÈùL<š¨¢º´|]¦X=÷„µ\îÿ\0I´ó-—\'ªŸš3ô \â¡øD!\Òü6\Ö8†ş¤ûD®§<p{c½zOÄŸ€\ß~ø¦=R÷Ã§W\Òn,ŸRÑ˜<wÍˆN\ÂrOË´ñ\Î3]\Ç\Ão\Øû\Ä\ßµ›kŸhøO\ÃÑ\Ó\Ë~¡o\î\0<\Ç\ZòĞ³tÀ¯…¯\ÃÆ„¥:‹\Ù\Ë[¦«um\Ù\î\Æ2rVN\ëKY\ìz‡\ìMğ½õ}j\ï\âü³^\ÃG.?\Ö18uÿ\0g€Š{ü\Õö^pp+7@Ğ¬¼1£Y\ézm´vv6¬0ÁÂ¢€ Woñ§I“\ãU\Ç\Ã_±ŞZ-0jj1ÿ\0£²÷A\ëŸÓµ~9­W5\ÄN­8¾X­h¯\ëSß¦£J)I\ê\ß\Ş\ÏF/SÖ0( iŒ\ÙÇµCp\à°>õ\á%s¢Å¨dTZ’c‘r=*’ğ N\ŞM\Ö\âq»º<¾üH×š\â_x&\Ê\ËLI\Z8n<G¨5´÷\01\ÖV*¤ƒ\Ç$sŠµ\à‰\×zö¿w\á\ß\è\Òxs\Åñl\Ó	 º‡8ó`”`:ƒ\Ã§\Ö?µ\Ë\ï‰^2\Ğ\îe³\Ò\ì^9üCª[±WA\Ëg’>c\ÕW\ÜÖ¿\ÅO_]\Ë\á}wEµkcD\Õb•R?¼ö².\á2‡a\rUõ>ÎƒQ¥V\n’mZ÷]¯~\ç$y“r‹nß¡ß©(§o^´¹2“Œw§ù{U€9\0¨ (û½ºšù™\İb¢Šr’¾µm\İqœfš\ì\0Á©\ì{†a«\Û\éUñj\Äh\ÄÁ…x\ç\Åv>ø¯\à_²\ÂõŸ\ÃZ”•f;­Ù½„«·?\íW¯B‚8ÀœW=ñ3Á6¿<«øz\é\Ú½€ªM\ÃC !’E=Š°SøWv´h\×\\ÿ\0´~¯\ÈÎ¤\\£¦\ëTk ‚1¿Z7\ÛqÀ\é^{ğoÇ—^\'\Ñ.tuR\ß\Åz\ßÙº­º¾s\"¨\Û2÷\Û\"\á”û‘Ú»«™†Ÿ³’YcVƒè œ~”\ëa¥J·±—¿³ô\ÍJ<\Èù\×\ãV“©ş\Ğş!ñô\Ûù¬|3 [\í·}¦ûQd/\r±o\î\'Ã¹ \Zù\ÓÃ’ù\Ú-›¼—TIİ»~V\\v\Ã)¯«fA\ï\Âkt9š÷]¹¹\Õn\åaó<²L\Ù\Ï\ÑUT{\nù\ËÅº/ü#_<m£€V(uFº„vN«\"\ãñ-_°ğ\æ!S­W/Š²…­\æú¿¼ò§Ú«İ”€\'¥&\ä\ãúóC)Œw¦ˆÊ¹ \×ŞˆyP9‘]ƒò;b€K)©¸e\\\0(¥¿)O¯\çEV\ÇûCó¢€>Á’T\ßN•\Å|_°º¹ğlšŸ}OE¸‹Vµ	÷Ù¡mÌ£İ“p÷®\Ó&3°šqŒ”\Ë\ç®Ezõ!\Z°p–\ÏC\â\ã\'	).‡Aª\èzo\Åÿ\0„rZAp’Y\êöK5¥\Ôg\î1\á\ÅX)öÁ©şø\Î_ø\Ò\îñ|fÕ\ÃS…¾ôwp’ƒõ 0öa^[ğ\ß\ÅKğc\ÄM\ám]ş\Ï\à\İV\áŸE¼“ˆ\ì§v\ËY»tUf%£\'Œ’¾•\Ò\ê7\Ñ|+ø\Éö\×a‡<bR	Û¢[\êj0İ—\ÎA´Ÿ\ï(õ¯\ç\Ë*­ƒ©W5{7(>\ëªû¿#\îpø˜ÖŒj\ÇÑ\Â~^I¬\ë9,5	Pµkk†*a70\ír@<®\á\Î\í\rIuy&İ Wğ»á¦‹ğ“K\Õl4%ºK;\ëù5Š\æs GûÊ™\è¹\çòt\áNNRjJ\ÖVÑ®·}M¶Ú²Ğ·\ào‹ú<K\â­\n\Ã\íi\áË¡ix—V\æ1“Ñ”ªppk¬–}Í‘TR(£¹’d‚8¤˜ƒ#ª€Ï›ˆ?[„Œeˆ\Å:ªœ¥zQiYh\İõ¶½º„n•›¹r6\Ê)=Ey\ß\Å?ˆWZ)´ğ\ï‡#[\ßjùK()l\Z\êo\îÆ\ÚlQx\ë\âÑ°\Õ\Ã>±&ñs&Z\Æ)6\Ãd§-Ô#_ö~ót½XøsğğøD]\êz­\áÖ¼U©•mCSuÛ¼»Kü/@£\êrMwP\Ã\Ç\r_\ê“\ë\æ\×Eù™JNo’7\Ø\Öøs\àK_‡ş¶Ò­®f\Ü\Ó\İ^KÌ—S¹\İ$\Î{³6O°À\í]d`\ã\ææ²µ_\é~ûÔ¯\à±7—kn&}¦Y[î¢¬\Ç\ĞVºœ\Õ\æ×•J’öµ/®·5‚ŠV]¸r±jvİ‚{dÕ‰\Ô:c5[;\\\Öb‰€9\Æ\rWmñ\É\Ç\İ\Å=X\ÈqRŒm9\äŠ[s¸Á§ùÁ\\v8\æ*d€Mxı\ç\Ç´Ÿ:‚5˜ \Óì´\Úv¦\ï±%™Õ™¡v\'hb+\Ó Ö»0\ØZ¸·/d¯Ê®ı4Û¹2©Zıt1>8\Ø\êwÿ\0ü3$\â&\Ò8õm,É…Ô­\0ˆÀr²‚v\Äz•_µ§\ÃÙ´ÛˆµÛ»\ß\r\êQD~Ñ£\ê\Ö3Gp§o* )W\'\nœ\Ö~‘\áüPø³\ã\İÀ5{\Û]6\ÂX\îÈ”\ÛG¹Øª²•¸\Î@+\Åz\ë\ÙÁp\Ë,\ĞE+C<j\Ì?3_SZXz0§N¼\\§µ½š\ÛN·H\áŒj6\å’3\Ïf­.÷Fø1\á\ë[û94ù\Í$6Ò¯3<JÃ³ma‘^;ûFi¢\Ã\ã47HKE›\ÄñJW?]¬}XfU\Ú3…=+\å\ï\Ún\á%ø¥\á\äFVhô{ø=32\à:õøs*ù¼ª\Ú\Ü\É\İX¨RŠ\ì\Ò<É†\à=\é@+\È\Î1\Î)Ì«\Üd~¢—q \È_jıŒ\å\ZS\' ŸnÔŒr	Ç½Ye\ÊrA%~\\ñI½\\`2=(ŠSú\ÑV	Á\Æ:{QJÁd}m\æ£p	İš{>ô\'#\Ğ\ÕTö9zw©\ãƒ\02W­{g\Ä\êzM‡‰ô›3R¶Šò\Ê\åLsC*\åXAƒ^Kñ\×Åø{­X0‹\Ç~\ß\ÇR™¢\Ô,\ãVh§\0‡ğ\ÊXn]½N+Ø¢ H\Ç\åR\ÜE\Ä/ñ‰ÁVR2\n‘‚\î\â¸qX*È¥Z)\Ù\é\İ3jU§I\Ş\Çğ÷\â×ˆü\á5~%h\Ò%´£E\â]%õ´‘‘ò´\åcm»rÁJ·^+\Ó4Ÿ‹×¡2\Øø§F;\âö5#\ê¬Aˆ¯%ğï‰¯~Jú~¡\rÆ¥ğñ˜ı\î%2Ï£†91È£%\íÁ?+•Ez®Ÿ\á\ß\0xú(õ[m\Ãú\ä(e¾K8eûAŸ5øy–ıG/oI¤\İÓ\Â\×ùüÏ¶\Âb=´„¯\İ=Ñ¬üuğ6‘0…5\è5{\Ö\á,tek\é\ÜôÀXñ\"²oˆ_d1Ák/ÃŸ\r¿\Ê\×²j÷ş\Â¬\0\âb\Ì=+Ó´h¾ˆÇ£\évZ\\gªX\Û$ ıv€MM­øKğÍƒ\Şj\×öº]¢ò\Ó\ŞL± üXŒşó¯N\ØjmË£zı\Ëo\Ì\íqrWœ¬¼´3<ğûBø{¥›\r\Z\Ém£v2M#ò\Ï!\êò9\å\Øú±ª>$iŸ\í`3$·ú¥\Ó\ìt«5\ßsy\'eEôõcò¨\äšó_~ÒešŸ\Ø>©dnbµºñ=\Üš]˜Á÷\Zl1/#\'\İø/\á~›\à—¼ñ·¨¾¹\âI¢\"û_\ÔJ«\Ç%#_»Cû«ø“]\r:v\Äc®\Ûz.­®ı—\âJœ_¹K§^\ÅO‡¿5\ín?ø\Ù\â½ñ9B¶¶Q|\Ö\ÚLgşYÃŸ¼\ä`4§–<\nõ yÁµN)R8Tp\Ñ2†V ‚2ö\Å	t\ìø\ÆF2\rxøš\Ó\ÄOšZ[D–‰y\Â\n\n\ß\Ó\'¸$°T\çFöQÁm¹#\'Ò­”\ï\îªw\É3*ºu+\n\Æ	]i\Û\Ø7–­\æ†š°ö\ã Æ¸_\Zx\Ï\Å^kI´?Á\âD$^[Ex!¹±ˆ0\Ú\Ç\ÕXjó\Ï|k½ø¥E\áO\'ˆü-ã›»\Ûtoµ\éL¦\Æ%p\Ò\Ë#cd\Ú\á\ì\àWuº¾#–I®W»¾Ë»[œ³­\Ét÷üıCø‰ñ{ÃŸ5\ß\é¾!¸k¬™\Ä’/ú:”1Yøs	\ÏZó\Ûh¿ü]\ã\íj{[}g\Ã\×\Ò\ÚX\ÚI<A\á¹[xˆgMÃ•\Ä‡\Ùh|G©xÀkş:\Õt½nK;Y,´ûK#¬Œ²º¹m\ÎÁTc¢Œ\â»It\È\"FS6\Ñ(?)B…G½Õ¡‚%\ÜÚ³i\é½ôBPGy\ìºu9¿\è\Zw†ô\Ëm7K³‡N²€b;{tˆ	\ÉÀ¡\æl;C95¤\ë\Ö:®¡ª\ÙÁ1yôË¯²Ü®\Ò6É´8\ë\Ô`sW¤pÅ²F\à‘Ö¹\ê)ó?i{\ï®ú›+[\İØŠV!0NrqŸJù\ã_†\à\Ò~=ê·ª\í[I·º_˜\n±GÀ<§µö Á\0‚¹Zø\×\âî¹«kŸ5»K»kX\ì4~\Åm4L|\ÉVP²€\Ãıy÷¯´\á%\'v\Ú\Î\ç&&\ÍG\Ô\ÉÀÀ û\nqM\Ü´z‘\Å3vÓ;®\à~£Ò¿^¹\ÎH\Ñ7˜\â@\èq\ÅG*”l’I<Œw4\äó–-¸÷I\ä\Ôw\0³ıÒ¸w¤¾\Ñş\Ï\éE4*c\ïÊŠ±j}|v\Ä\Ä=­E\æA ı\ã\ĞsR\Ü(”\ä”)ŠDx\äş•\í5¦&S\ÈiÁÀ ’?:„Lˆ\Î0\Äz\àœ\Ôw‘Y\Æ\ÒL\É}ZI\"õl\n\0òT1\á€*x<u®6„zB^É©hWºŸ„µ	Nd›@º6\Ë)õxğQ¾\Ü\Ö_‰?h_\0xrF‚\ã\Ä0^\Ş.G\Ù4\Åk¹Iô\Û#?S\\U\ç\í«\ê—\Ã^¾h›\î\İë³­¤]ƒsšÆ¥:u£\ËR*Iôj\è¸\ÎPw‹³=.x¡)/\Äÿ\04g«s\n6?\Ş	š\Çıü%\à¿xÆ­ª\İ7‹uı[’\Ş\×n\Zò[H¨CµşQ¹ƒ\ã5ó?h_Š°øŠm%õ}3E\Ş;•:]˜Ä‚I’H#®+½ı‚¥Ô¦ø£ñ\nöò\êKù\î\ímo&¸œ.\ç”\ÈÁ‰\Ú\0\ä\nø$ÀĞ£–U©‡ŠƒZ\İ$›ò=|iÎºŒ\İ\Ó\î}­\ãXx¿ÁúŸ‡ocÙ§\ß[=³,@.ÀÃ‚¸\à8#\Å|ùªMñ\Ç^¾ø7y¤{6öZ§‹!ºS±rq(Cóù\Ï\Z\ão@\Ù9\Å}%yªÉ‚\â!\å\È\Ï5\Ä|4Û¨|@ø›°ñ«[Ø«\î\Åj¼¡c_‹\à13¡J¤ä”¹m%{\é+\î}]Z|ÒŠN\×\ÑúI\ÄøG\á­\ÇÃ©4\İe¼e\Òt»Ø¬\í\îv\Èn¼\áò¨XşbğTú×¶|0\Ñüa¥\è&/kv\Zæ ¬«\Ú}£[¢Æª[q%™ˆ,O\'Š\í]0°zŒœS˜\Ãe}+—˜\ÇSQmİ½\İüŸE\äi\nN.\îM\ÛD.Â£\'¿½2f0¦\â85.\ÒÀ|£µAz\ÂHš0É\Ê+\Æ[›•&p\Ò\àr1\ÅYµ\Î$\ÜH# qùTIf\íÏxÈ«\Ñ1¤dq\Ík)YY\ì\ÏP7±\ÇÒ±±\ì$½\ë~X\Öl‡\\®9ú\×\ã\Ïhÿ\0?²\'\Õ\'{h5;øô\è_ieH\ĞÇ°8\ÆO|V¸xÊ¬\Õ8+\ÉôDÉ¨®fô8\ï[µ§\Æ_[)+‹M2øŒ\ËB\ÉEzd\ZW™\ÆŸÆ¼\ß\Ã?\Ú\ZüfP¾—¦@\çı³\æ6?5\épO2K°Ä§•5\ë\æ<Ê¢¶ü±üŒh\ìıY\Ïxû\\\ÓşøKSñ±;G¦iñ‰eh\ã.ê¥‚ğ£’rGJø\Û\Æ~3Ñ¼{ñK\Ä:Şp/4¹¡³ˆ\\dW‘b;‡\Ì\È\ÈŞ¾¾øùg­ğWÆ°NJ\Ät›†b§]\Ù±ùkò\ÇMñæ½£iój6:ö¹¤\ŞøfA\ì.\Ù1\Ç\ÜW\è<„HT\Ä\ëÌ¼­¡\æcñ\nH\Æ[n}\\²\í uôŒ€[i\ÏP¸\Û_]\ÙCºß‡5\Û(YCyĞ…¸g\'\Ë\äuô®“D\×<5\â4o°\ŞCxıZ&™„‰õV!‡\å_¥¸¸îŒ©Ö…O…¯¼µ#*d\Ûœ°«›\ËUq¾e\Æy;ºÖ¸\Ò\ì\ã\ÚV\Ú6\'øŠ\çñ©Å¤	&Lh7Œ(¢\èß•³ûJ\ÓşzCùš+sËƒ\Ô~BŠwC´_ø‹ñ\ÓAø}tºf\ÙõzE\İ‘§óØ±\é\Zû¶+\ÉuOˆÿ\0üY)^\é\Ş\r´n\Ø\Ãö»?Ú‘şP~‚²ü=\á›?\Ã(€I-\Í\Ãy—7—^{‡=Y\Øò\Çô«^½YNûds³x[PÔ˜>«\ãjRw-©4+ø*\0ek\ß	4iò[]]\êò>V“R™öP¬p~„WoEO3\Ã\Ù…}s\á›\ëkh5H\Ä\Ğ\Ü\ÛB±-\å¹8€8`xa\ë\Ïz\ï0=+Œø†¿\ÙW\ZˆS\åm>ñb˜öòŒ°%O\á]˜\éN(c<sã…‰µñ‡u00“,¶w :~ ×ª~\Ãz\Ê\éÿ\0õ=\È\Úz>\ä\ê\Ğ\Êÿ\0j\æ~0\èO®xP)k«M·°c®ø\Î\ì~+¸W“xg\ÆÚ—ƒ5=+Åº„j\Zs‹\ÈS8YT&õV\\ƒøzW™™\á^;WÚ²õ\ètáªª5c7²g\ë4±—ŠD\î\ÊEy÷\Ã\í^\Û\Ã3ø—i¨·–}n+\Äó¥T³[¢Ç·=rU‡H\Ålü.ø“£üYğ>›\â]\ê+›k¨u·dÀ\İw§#\ë\\w\í	\à\ê\Ö\Zˆo4Ø¦\Ömu}6\Ş+Ì°u®FWƒƒ×ŒƒŒœb¿ğ´\\+OˆM9hô\êµıºœ¯R\Z\Û_‘\ë\Í}-Ú±Œù{‡Õ›;•¸?\ë|\ÃÖ©Û‘ğGVo\æiÖ³G\Ó<€©8\Û\Çjğ\å´QÒNHÀ\Ïz@®¤dG~ø§@D«½[r·\"¥Ák™\é \È‹‘Ò”œ\ÇcOhÂƒ‘òòI¤(a\å\ëš.&v’¤=«\Æÿ\0i\rGñ×‡<; _\Î\Z+ŸXZH q\æF\ìŒc•a\Ãú\nö	³\Z0 ƒÖ¾q\Òü	®\ëÿ\0´§‰õ8ol\Ó\Âú^«e¨\Ü\Ú\Æf½[\"«´ıİ¸p[<\ä\n÷òx\Æ5eˆ”­\ì\Õ×›\ìsb\åQJ÷v;…\ß\rµ?[\ë\ZÆ¯·¬\ê3F\Ó]$F%ò\âŒG\à“\ÈQ–=Øš\î!2À	‘8\'¨5:\È^ NN“[“U\Î\Î;W5|Dñu*=_\È\Ò1PI#ƒı¢õ\åğ÷À_6\×	¤\\(pº\ìójü¼Ó´Sqm\á\İ	\Í\Ìöö\Ì !ŸôS_fş\Ş_ °ğ¶“ğ\î\ÚU“R\×n#\éó¤m¸–ô\ÜÀ\ì\r|\Ãğ\ÛO:¯Ä«I1˜´\ËY.›\Ğ;‹ún¯Û¸3	<>^\êM[\İzw>K6¨ªVQD{\ÊFª8\\\Ø\ãŠ\Å\×<¢øˆfûOŠI‡İ¸A²U>¡\×+s°”W\Ü&\Ç\nt?øHnÒ¯Î¿§¯ü¸jM‰\Ôz$Ã¯°aø\Õ\ïx÷Jñ¨¸Š\ÒY!¿¶%nl.d\Ñ\Ô2÷\ãŠ\ë:õ¯)øŸ\à«k]~\Ç\Å6\ÓI¦\\[k«\Ûn-\Ç	1\ìÀ6\à©ö¬\åN2\Õh\ÏF†6¥6”µG¥sş\Í\ç\çTø•n|¯\ì]\ë\Ëù|ÿ\0´²ù˜\ãv1\Æz\ãŞŠ\çö3=¯\Ñ\îzeR\à\×yò\âQKƒF\r\0sŸ,¡\à}v\02\Æ\ÎF_÷‚\îªÖ‡/¿´ô\r6ó97±J~¬ ŸÖ§\ÕaóôË¸\È\á\á‘5\"°~Heø}\á\âNH²E?†Gô šD#+\0\ÊA„wóMÖşñ« Iş®\ÚS5©?\Å„²şD•ü+\éœ\ZòÏ\Ş\Zv²¶ñ-¬e®4Ü­Ê¨É’İ\Íõ*~aøÓ‹\Ñ`­OFÑ¼g©øz[‹;Rh¤¸µ)¶\Û\ê0’7+¡á¤‰¹V;[ WÕŸ\àføa«]\Â7I§˜us\Ì+?\İ\r_™¶\Z\æ—§\ëZ5Ñµ\Õ,e[«;¥\è®9õV\Ü\Zı\'øñ{Lø\çğú-DE7ª¿fÔ´\æ\Ã}p¸e õVê§ºšü‡Š²\ê˜L\\38]\Æú®\Ç\Õe¸…R›¡-O3©ğ\ç\Äx¾óR´\Ñõ+}B\æÀ\Åö¤ƒù&EŞ€‘\ÆJœñÒºE³“aŞ§x\æ¼{\Â^\Ñ>\Z|k}3H\Óí´;Y\ÑVh\á¶Mˆ\ÓA1\ß\Ç÷Š\ÈÒ½ª[Ô…s¸`­~m§\nU¡w$\Õ÷\×sİ¥&\âÔ·Z\à–kE1ª\0ğO«\Öó´ñe“k\Ïz§$\Ìò\çn3šd’\à’p½yœ¼\Û\îljÚ§#¶qQ\Ã/›p6úŠÀš\"ğ¹ód\Êdƒš9e1\à±\äpA¦©\'\Ô/coR·\ê\Æ\â+k“i<‘2\Çpª\Æ\Äp\ÛOœ\Z\ä~\Zø\"\ë\Âzn®uMPk:Æ«z÷×·\Ë\0]Êª(T\íUU\0úÖªJ\è 4Œy\éšd’H€X.}k¦©\nn”Z³µô\×B\ZM©=\Ñ<lcG\\ü\Ê\Äc\ÔW\rñâµ·ƒeµ\Òl-›]ñf ±\Ñ-[\çsÿ\0=$=#ˆ¼\Í\Ça“]„²\ÙJwW„~ÔŸ`øS\á£ı–\ã\Æz\ämeg(EócŒ}\éYº\í@NM\ÄW­•\á~·Š.^fö[|ß¡†\"§³¦\äİ‘ñ—\Åv:·Å½nú\îıuJ\Ó6·š˜û“\İg3\Çğ\Å¨”¦ºÏz3&‹{®Ê…d\Õf\İG\"ùSóù›ñ¯,µ\Ò%\Ô\îtıÑ˜\Ü_\Éå´¤\å–?½,Œ}q}Z¾˜Ó¬a\Ó,`´·A v\0`\nş”£IP¥\ZK¢Hø\n“ö’r\îX¢Š+S0¬ŸiI­økT°·\Ò/\Ğ\í%O\à@5­M•w\Æ\Ëı\å#ó\ç\Şø¯lt4\Ï!3hü\Î?‹h\Ï\ëEx\êŸf,‘\åü½ûqE\0}…O)”¹4\0\ê)»¨\İ@\r¹‚Aş\Ë#\\§\ÂcŸ‡º{@G\ä\í]E\Ûíµ•ğ£üt\×1ğ©Jü<\Ğ}\íƒ~lÆ€:\êŠx\Ò\â\'ŠEWFYH\È ğA§î¤ œ|E\á\É<\â6Ò™X\é—%¥Ó¥=\0\êĞ“ê½½Vº_…?µ?‚\Ş7‡\Ä:z½Í„Ê°\êšzøù€¼£şz/U=ù\é:ğ…¿t	´ùO•0ı\å½À42º\Ãñ\ë\ê3^	l\×0\Íqa‘¨\Ú?•qlŒ¾ªÃ}\ë*ô)\â\éJUtÕš.•9)EÙ£ô\Âö\×Nø\Å\á½Ä¾\Z\Öş\Ís\İ/U·Q BËµ‘ı\åa•e<ñØŠ\ê¼;ı­g¤Û¦¹=¥\íøÎ’\Î&9\ãj±$q¦¿>gÿ\0\×|C\ä^I,\Ş¿—u\åºü\Æ\ÊBq\ç\Æ?»ı\åG#šı\r\Óu(5{(o-%K›I\ãYbš&¬2H\ê¯À³Ü®¾W5FZ\Ó\Ş.\ÚÛµÏ¶Á\â!ˆ2\Ñõ_©µ\Şv\0=F\nYF\Õ\èóU¬øÀ c\ëV9;ˆÁñY\Ù¡°·\Í&H]§ V|r–Œ8\ÇRjôùš3°\í€zŠÏ‚%ùÀR¥O š\Ú;;’ÉI ÿ\0“I\æ_ŸŒû\Ócßr\0õªÚ®£k¦\Ù\Ïqw<v\Öğ#I$²°TE%˜€\n¸Á\ÎJ1Z‰é¹Ÿ\ã\é¼)¨\ë\Ú\Ô\ëŸe‘Ÿ«7÷UGvc€©¯\Í?ø\ëPø“\â\íKÅš\Ñ\Íp6ÁnÍ•³¶+÷\Ç,{±5\Ù~\Ğ%ø\Õ\âd‚\Å\Ş?i’g\à\Ş\Ê87?º:*úsŞ¼÷\Ã“\Çş!\ZpR4‹VW\Ô%õXAõ=[\Ğ}k÷^È–[K\ë—\ï$¾\ä|vaŒöòöpz/Å·ÁO»\Çqâ‹¸\ÊK|¢+4a\Ê[ƒ\Ş\Å\Ï?LW«S` …#ETEPªª0\0\0ö©6\×\Ü7s\ÆE;mi\0\ÚAõ§m¦¿Ê»½9 ˆu)ˆ\Ôn€	_ùš*\Íİ¸ºšPÙºzœ\Ñ@j\ÑE\0QE\0gøŠ\àZh\Z”\ä\àGk+ôF¬ß‡0oø~3\Õlb?š\çú\Ô?\îM¯\Ãı}Áùš\Ñ\ã_«aş…[š5 °\Òl­@À†\âÿ\0¾T\éO (¢Š@\æ_|\r-ük\â.\"ú•šmš\ës\0\ä¯û\Ë\Õ^›A\0Œ\Z¤\ìÌ¶·0\ê\É4L$ŠEÊŸQ\î?B+\ß?e\Ú¾j¶şñÁÿ\0„Jò]¶7r·\Zt¬Õ±=\"bxş\é>†¼\ß\âW\Ãy49\æ\×ôRğ1-}§\Â>ğ\êeŒvaüJ:ıkŠK}Z\Ä2•š\Şeô\á”\×?G2\ÃÊ…e{ı\éôh\è¡^T&§~º¤‚D\ßp\È\Ç4\åù\Æ\å>õñ¯\ì‘ûHµ…ÅŸ\Ã\ß\İ3DZ.©;\ç\ÌQ\Ò\ÚF?\Ä\İc\Ôq\ÔW\ØrI\æ>\Ìkù\Ó4\Ê\ëex™Pª½u\Üû¬>\"8ˆ)\Ç\ç\ä.-œ•U\É\àu¬\Ûy€wpr¬\Ù­.ß”\äú\ç¥szÿ\0ˆtÿ\0é—º–­yj†Y®%8HÀõ¯:•9T|‘Wo§s¡\ÉE]šº†¡Ÿe=\íÄ©¼*d’I\"*’I<\0+\à¿\Ú7ö†“\ã\r\ìº$–ş\r…ñ4\ã(ú›\Üu8\Å\ÔñT><~\ĞÚÆ‹·\Ót\ã6›\à´l­¹\ÊI¨\Ñ\åU;ªw\êŞ•\äq\ÅyªjPhúDBmFu\Ê\ç\îÂƒƒ#\Ê=;+ö~á¥„\å\Å\â×¿\Ñvõ>S˜{KÒ¤ô\êû‹ga{\â-Z-Gö¶P\ÓNFR\Ö>…\Û\ßû«\Ü\×\Ğ>ğµ—„4H4\ë$\Äq\Í#}ùı\æcİ‰ª~ğ=—‚4‘mo™®d;\înœ|ó\Èz³OA\Ğ\n\éF{Wè­\0¹úQŸ¥ûQÏµ ı(\ÏÒ}¨\çÚ€ı*±r-4›\Ù\É\0GO¦\\\çÚ¹¯‰W†\ÃÀ> Ÿ<­Œ¡~¬»Gş…@c\á\ï‡\Æ\ë@\Óf*	’\Ú\'\'\ê€\Ñ^Ë i\ëi¡i°yc÷VÑ§\ä QTÿ\Ù'),(24,'1234567890321','Dario','Marko','PejiÄ‡','M','2005-01-01',NULL),(27,'123456789021','SrÄ‘an','Marko','SamardÅ¾ija','M','2000-01-01',NULL),(28,'1312995100024','?or?e',NULL,'Turja?anin','M','1995-12-13',NULL),(29,'0101990100080','Jovan','Mitar','Jovanovic','M','1990-01-01',NULL),(30,'0202991100081','Stevan','Pajo','Stevanovic','M','1991-02-02',NULL),(31,'0303992100082','Marija','Gvido','Maric','Z','1992-03-03',NULL),(33,'0606961100006','Mitar','Jovance','Miric','M','1961-06-06',NULL),(34,'0101960100025','Dejan','Lazar','Dejanovic','M','1960-01-01',NULL),(35,'1234567890122','Marko',NULL,'MalinoviÄ‡','M','2018-01-04',NULL),(38,'1472583691472','Mile','Milance','Milic','M','2018-01-01','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0			\n		\r\r # #%$$\Z(,)%+!$&%#	# # #$$$$#$###$$$$$$$$$$$$$#$$$$$$$$$$$$$$$$$$$$$ÿ\Â\0 \0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ú\0\0\0\0\0:\âŠ õ÷¬|\È\0{fYù\é\Í9Sµƒ¬\ê*$\ŞL\ÚZÚ™¶;ctLˆ„\Äx¥\ZÀğ´\É\ËÆ„•/Î ŒGX‘q‚÷\Ò=2\á˜\çõ+^m½Y—©¶K¥E±FÚš\"\í\Î\Íşœ„¦ğ¸\àjc¥O(¢LK\å¶°°\"$ù+üB¯\ïYf.» x\Å+”ß·\îHªZ\å5Œ\Ñ&H\È\â^-Jşœ¯Ló…«Á\"{w®¡\æ$=%”\Â\Ú\0\ÊmŠŠ<2\Â)\ç¤¸\Â¥“}]-\ÉõÏ–£f¾dhku\ä¥ø›ˆNB zf´FêŠ²›[Pøª6ô\ä“L\0\ír\Õ\ì!,’ª®\Æ8z\éM£²#¹f÷3R½†/%…FBb»\ÄaJH\Ì(\ÍbUe§.–\'¯\Ø\ZS’š*HSx¨û~Ÿ$^\Û\Îuc1\îe\ë,÷bgH¬X4tˆ£w\äIñ	d™_½±\ÕR÷\Õ2˜´M™2f\Øòp¤\Z‘+°j\Ã\Õ]sœ\Ãá‘ƒ^ì‡3\ÈUÙƒ½•ªC^«\ÔD¥µ7\0\Ô{ôn·§§\é¹ú[Š³\")…˜‚\Ò(\ïzP\\aúğW609-Ó´ Yµ\äöL\Û0¬š¦i¹H\Ï£ä€;¾©Õ•l•‘;¬©¢$Ê4m¸„©\Ï÷‚dî¾š]‘ú4\Å1ƒew®\Ç\Î9¢\Å*·*\ä¬\rC°`Q\'­¯ )!\Æôb0†\æ\ÆS<¡OJ™	\nÂ”³\r~Tu‰\ç\Å\Üf—\æ£\ÉtL5‚İµ\êö\æt³(4m‰¥a)te/\ÂI3»s\n¡d(úŠ#2F¤AÀ1™9\Ò\"Î¦™rWkj\'ü›OÂ˜.Fš÷%ªYSx\ÌG²W–t}\íq6¨mùŒ\ŞF\ê\Ü~3V\×\ìˆÒ¥’•\0g@LıÖ´v“8£±õUûB\æz\Ò\Ï,“\È\"S¶ø+R…\Í\í|\èş\ÎA	D =§\ìú\"\Ôv\Ë\ìG8´x\çj†¥‰°´û)Sˆ LU\Ë	Œ«”\È\îÍfE¦à±”O2G˜µŠ¦o~¦xRÆ‘\Zc\Îó´…WËœ\\&\îÒ‰\ë\ÓRt¤¹C¬\Z\0Ò˜¡hZ$R9–Š×”l„\ÃJwxr7\ÖÖ²Rg\0…\ÊKLBú^ŠS0‰¯\\\ì\î½|¢N7©¦}  \é¦/µ…tÔ˜¢g’\êºA.\ÒZs7\ÑP˜«1O\Î+PC$mW«R0B–€\Ş\Ğ ¹(W\Å\Î\Ê\\T¡\Æwr‡Ï¬–ª*^¿jL@}\ÔÙµúWt\ß#\Ëulm£×†€£%\'ú£\Ë!23‡\Æ~g@\Z­k‰…÷s\ÜJ«\nš\ä§)\ØSZ\"=\Ğ\É-]÷”*(\ËO?8\'\ÇÓ“\â\Ù\à¹/†·˜\ÜQ\Â;ºô,\Ûj—Tb\å^†Eu?X½E#“\ÑU4i¹.S·334\Ö×‘Ü—X\ÆZ\Ê~{@\Â\Ë\à9D\Ã\Ò—‘½!ªı7Õ—9\é.œü\à#Õš‘\Ü\éd†\ËC\Zb€T1fÔ­^ôòƒ\Îò[Ÿb\çœó_Gx@›Ö”º>zŒƒ\Ç\Z³\Æp\Õ^€NºÃ¨3T·&=\á\ÚSt?F¡±Jr\ÔKY>Œ\ç*fu õVB¥aŒ\rd;?Œ\ßR£\Ñ‰º0™\Ö/4\ÃV^\ÈKö\ì¨Z…\é\Òy”¡²œ°\'ò·vÖ¦tjyj§\Ò(8`´>ƒ\É4¬=±Ã›¢eˆøó‰\älÑ€{\Ük‚¿K\Ğdq\']œ\ŞÚ³W\ØU¦Í—!)S˜”\Åy¸´$G1\ÕQ¦¶\ç®ŠN5\n‚[\Ê)U\0¸=\Â=q·ø\à3u‘N¯gFdI+š†\èNœ”…””’CrJFÄ½\ìZs6@\Ù@ü/ô’JñlK\Ş{„/V\èP°ñ\Â)·|œˆ€As]\ê\'\'vJ\ê.\Ö\ÛmmL¥\âsq\éF…X05\"9\È~AF‰:Hû_½\İ\Ş¸Z3\à=¹¦y\ä]¹­)Nók\Ö\ÃCjf  NŒÅrK3Wº\ä\Úv2\ÒÚ›–½w†\Z•:Fı\İ\ç¼_\İ\Åw‚•#hšš\Ê5K¬\ê´%\Õ^|‚4$JYªV\È\æz\"é£³´	‰±:pr¿@mG\ïw}À4W!\î-•¹¤¨$VXVİ–~z¨¢¬\ÈÀb•R‹sW¶e\nŠ(Ú•7=DW¼/F \Ó<Ÿn¯\0.	)\ã\éÙ›<\Z\×•œºÈ°œ\Ö5T5‰0Rğ®¤¬Zg;À\Ù¥\äş\0\\X‚o¦ˆõ#\á©<v K\àñH£Å¶3\Ñ<	\Õ\İ+\ä½\ÆY1ˆQğ„\nR¼´4öw§ É‹$=Şƒ\ÏTšq¼?1P·‹I\â)\Îk\ã*PÍª³\Ş\İXPw;É•Œ´¯\íR#±ûv\îÏPH$š‹Ø•ôò¦uÁ‚Oú\r¹ª\äÇ™s^\Ñ\Ì\Ö\æC\\Öš£\ç´rÿ\0ŸM\ÒUºo&\É]n6³¶«^º¢tN,œ8B6n\ĞøKyS–\ÆP\×ùóAQmeT7Ôš²ˆ¾~]ıRùõ\Z›­8a;O0?\Øsy÷dıUó\Æ¤§óy\Ğ\É\ÖN%\İTmCô¦Ì“m9ó¿\è\'Wœ\ã·k×œÕ¥şen–…\ç¸\ïePv\á\Öp\È\Zú_\Ù\Ì\âœ\ë\îb\ï@^•>\Ë:š>\İCO¦Pß¹>\Ó\Ã{¢«şD“g½OV\Ü=)[‹\æiw\Ñ\Z\Ö\È\Æ\raœ´g\Îo£°Â¨m\n\ã}˜\Î\ë\âqB_Z\àsH»\Úÿ\0|Œ®].m~a~g³\Z”	C\Ø\ë)}l¨·yôN\Z\ë2‡L+\Ë\'\Ñ\ÅŞ \Ö$2a\áù~¦‰E‚E©\rÅªó\Â\Ìô)JG\ÃTk\Ì\0zxqfx¥I\Ä\',=\ÆuÓ—;Q`o\åFˆ\rÄ€‚8Ù˜Ó€k¡0¥4û7\0\Şw€\ã•q N\Åÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ú\0\0\0\0ô˜U2¦H5Q0›fG\0 ¡3–u\Ìn]\Ì\ÌØ£<ù¢j15¦¤lÕ³8âœ\Ê\ã Á0\èS‰3#F‘\ÑM&\á\ëÓ‚‚NY\Õ+j:3a°S<û»]\à `[!Á³v\æ;F\êô8€\rü \ÅyHº5\n-ôƒÓ·B9œ­ŠPp*\ram«\Éi™éŒ·\"ôE¿QM¼4kd:n‚œr§JŸ¤ƒXª\ÍJ¿t´=E±’h\İ6U\êüõ¯œ#‡“±n\Î\Ø\ç–Á+€‘®Vc\Òo\n\Ù\0FÈ¨p8«\'\égiù5Š\Õup\Æ5’-™§\Ä\ÒaR³Ù¹ˆD{)d³MBùªow-b›v‘°\Í\ÈH€\0p«K/KÇ¶iZû‹I#¢\Ú7f’DE4)Ò–>v~F¾w\Óöi§Ï»>½XgÙ˜@q6\à\0\×	”z(¸~\Ëam\ÊzV::5›&\É$Ša•>\â\íKŠú\ï,\Ó\Ö&q¬z&ñ]«AC\Ã6n˜n:\İ\Ñ\Ç	82d\Z9#¶w\\‡‚™\ìtkø\Ö\É6L\é\Å×®O\ìm`\äd,¶;7\Ìÿ\0E\È\Õj\Ğ0\r’‡P7\â\rúL‚Á^¼\èò®\×\å,/›³Š‹hÙˆ\âd«A™Ša)!fµL\åşk\ÚöÖ•Š¼\r}³Fj5s¦dMS”8\r”Ò³\Éö«	\ãÕ°Í¹£#XG5l’h¶¨[\íq%”˜·Ù¹‘a†\Ó#\ëxš\Üs;ŠAÁ“2©³T\å\ê\á$÷,¢ÂŒ[—\\Z\Íc™”e\rÑ“DÛ·aT\Ò\Z©3`¹MTp\ÏA]#+µ8ˆf1j)\ÅQ@\İªe`zC³NWª±Æ–š½]_¡\Î.=8ö\É@\Â_\İ\ÍX.H`™»¸\ÈD\×)ğ-b™¼fß‡duBhU\ÎD€ô\ÎF¶…_¦\ÆOÌ¦\ÇEĞ§Ch¸X”˜G4N¥+w²Yi\Şd\'¢´VğuŠœn\ÄJI„“\èª®™‡£\éômÑ‹hZ¬tJLœi»³±p°H\ÆFÆ¦(ZE\Æ\Ëd\Ê|\í­\î2‘µú\ÍF.1›–\ÍL2\0T\à‰ôo\Äıºqñ­\ØÀB¡Z×¶W+µşGAE\'\Æ­¶\Õ;•a[.¼´Uf±SŒH\Í\ÒL\Í\Ì~(`ŠESk[\'\Ó\î¯B9$³ªf+\ê»4¾x¤\Ô4\Z ù\Û{¥\ä}\Ş% kUŠ¼sŒ\0Išc€\Ç)H\Ê\ë*V¡¶²\é:\â3\Í\Û^µ\É,\ßE›„¬Ã³\ãœ\ÃF\Ö\ç\àqxŸ@\ÌW`ª•VQÀ&F\É\nºn˜\è\ÖTm˜\ëSo\\½u!	™Á\ÓT\Ô\ÜB\ê“U\Ú\Ä#$œc–\ÏEOW¼\é3\è•\Ø\Z­f)°L3 @‚§)[\ë*t\ÊI\ã¹²©VZ\Â\ÒNI\\,0•\Ø-Mƒ­\é}F›\æ\ÍfB¹^ªW\á\Ò&l¡‡A\\ºc‰j|*4]!\ÓÇ’/^\Î(…0ˆœ´\Ø-,kµ\æMùù_CmY\Æ\è\Ír½]­C²\â)&Q%ô¡q-0q\ÅC¶Ç®da\àN\Î\Ä\Ú*1GOE1I£h·¶D\Ãã¾…\Ó#+µ\È\n\Ôtjh6 08]R„“	piƒ•\å\ç¯‘TH¡NDÛ¨M5\à\n=ô¿±n²u\Ú\ä^69‘\"§I\Äø4`ˆMF¬6©D&¢\Ì\ÓP¡>®š§\ã\Ç>¾eô}3U†„¬×«\Í·n\ÙC€@~‚¨‡\n\0Ğ›«Ğ§;Ö¹¼\Z];é·®a5nr‚`\îef\íS5Fc\ĞH\×+0P±-“AÀ\áûÄ@P\ïŠ\0]6ñ\Ü ş\Ål›[=¤\È\ëR5¨Ôƒ‰)\é\Äpf[\ä­n¹^Š‹e\ÄB|Dt\0\èp\ĞV\ärşEüÄ¤Ô•v•]¾hq0Œ›¸};)9šeú“]­DÅ¶l€\à@\0\è\0¸\Ñ%\\Ë¹YIY—•šB:£\èXh¦J?””±2À\ß\ï\r«µ¨\Ù7f\0\â`&L\04\0\0\ãD\Ü9ã•»–•\äTig„LzN\Ş\ÍØ¥sJFi¯V`cY2nÓ€pˆ„À\êIÁ¢†ü?LNy(¹ŸK/aY^¶…pHX\Äø£\Û•\Şq§³ª@0nÙ‘’:<\âD1¸G¥\ZHoˆ]#\â\ÙL6yWÕ®¹LCK}›&²r.+–šª\nZªB\ï\èK„o³“ZôœŞ…?1PµVf\ÍTl\î\ÓI=\Îo8¾Êœh •ÿ\0Ÿ«ÒªQ×›^	\î\r\Èôª£û÷ŸıC?¾ùR÷-©y\Ë[\Æ}}\ê\é?$ø³t\È}c\ä­<ôGœ6lG_µù³H“¾\à\Z¾g\íO\rû\ZüA~¿\àDVi5*{_F\à¾\×Ò¼\ÅN©\ÕÈ‡¢\é¾\Ñğ\îÅ´|ñ\ÛvÊ–	\í\ê>Ö’ó\'‹4†;&\î¿):¨PÎ¨|»ºn™›í·¯Hø÷\Õö„F‚a\ã\Z¤~Á\êXFñ‚Y\é\ÕZ­\ìb~„ {“\Ã:\æ\×ó\Æ\Òûcó®…œ{p[\Ï^E÷Õ†£\áÛ­\'\Ôu¿7\îx‡µ¼Kj\Ó2US\Ò\Ù¢lÀ_B‰VóenU	h\çes8Áµ\ê\ÓM.i9\Ê	;9\nYû‹\×\ê:T\ËZ\r\"\Íoƒ¬OÀÚ©\Æ\ì¼e–­?f“o\İw‰%\ÅG88W¡Cñƒp»d\È\0\0¡”¬«n†œA$ø)4ù\Ğ8NP.ú(Œ\ÚÕ“\\tuNÂ³$@\ãuø\'2\ç\É\ÄRL\0D‚`\0+ÿ\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0ø\Û%¡\rii\Ø\Éi!\r,H3\rW\r$\\múÜŒ2\ÉI\Û‡\å\èHPK°\Ã5Ÿb\ä¬!®\É\Ø)\è@\çÔ¬Ij\Ã¶’.=OI\æò\ËD\ë \àHBˆµ•a†m>]&l´\Öô(¸;\nw\ÉX‡’unhRü\"\Ë\î\ìy´Š\é¡Ny%/$’H\ëŸŸË¥¢ş‹¹x\â\ä\ì \ì\î†\îv]¤[š½\Æ%ıK\\EtĞ§<“¤’I	¢iù\å–÷ı:i\â††ƒ„\Ñ\İ1/*“G\á°ô\Ôò±§	\Â0Ä’\ä¥9$\ìŸ™ô>¯\ÌNf®B\Zrvöô©%8?²ówo+\ÏG]Œ‘I.JÒ²AÂ¼r|¯\åU&›	-KöB]‹µ³–´Q}9b-ßªk\Íd²Ó¬9yh»—\à9i\Í\å\Í\ÉÔ¯h¬¸®[ö‡\íX}\Ün(¾œ)2\×\Ôõ!òJ\è¶\ã¤\ä\ì§\r/\'§4Z\'\Ïö1ğV£ÎpC·¹JI£|dˆ\ì‡\É\ç¡\Êó$q½WeIYAòô½‡\Ù}“ú¥…œ‹£\Ã¤¹:I\İd1\\79Ì’ú=5”Gu\Æl@\Ê\Å2²=­>;ë³®Ğ©Ø¶p\ÃK³@h`¡\Õµ}>_8\ì:ËŒw”¸¡ˆ>\\t\'u4»ğÿ\0Zš:Z¥f,¸²–X„=º\Õ!4œË¨\í_M¥\ç;:N\Ü|† \á†rt\Ó\àşªø\Ì:æ©—T‡\Í\Ä\\³º\ZiÌ™\\\íŸM\\\\xW]t“„ \×!	\ÙaˆTa÷M>µ§\ç®R\ê–ˆy“\çT“E‘€‡–\Ù\ÊTKúÜ¿<£\r:Ã¤—$	\ÙQAwA²F>(×§óc®Q—\ë-bùå» \Ú\ë0RÕ0‹\Ğ\î\áyê¦^w1™Q\\–•¡d—\ï\Ç{\ér3aHYr÷gnay\Ñ\ì\ß5v-f\î\"‚\ÔÖuc²Î“¢Š\ÎÂ–Å¤ÚŒ9bŸ&“øBN\\Ûº\Ìd\âƒg/7Œ6I\İtó(m\Óù´;/±\"ğd\ë•”…\ëL\\’Ÿ%\'}N\n\ÒrnC˜\İc	k3r»\é\âŒŞ”~iw\ËL’ô„¥%˜{¶$\ÊX¦\Ï2« \ë\ÃhÕ—ø¸K¾¤~q\'}v\r\\f\í¹#¨\Å;A\È\áØ¹*?šÀ3½ˆ	\ÑZv]6D˜2ª\áº^ú\Ê`d\ël\â\á•\ÆnÛ’–û\Êu~N\Üú%‡ò\é\Ş\ë\ß8t#,ók\Úx´\Ø$ª\ÖbÓŒ%\çµv|÷¾©£²\Å9%\î1vI\Æ\\r¼ùƒ5…w‰Ô›:3CK2²J\ËJ\Ê\Â.<Zz¼ò\Î5`¬ÑN\rxAöI8V\Ì\Ç\ÍX\ä\ä`\çî$¼’Ğ’’³¢[	m§spH\Ù ™Œ“”’I%xG<4¬´\ï/İ‡y	ÀIÓ¯\Ëó’”¢B\Ñô\Ëù8F	y\è\É;$’N—“„ò““³²\å4^T@\\»‹6,\á:\éXó\ï¹,©*[\Î’NI$óp\Ò\Ä\ä\âı%4w;:Ì±z˜±³‹Œgn\Ïe¯S^p”’p½8\çg’/`K\Ùy$ƒ‹CF\ØJ2[\Æ\"\á]¯KO2ZbĞ„¬7{(N¤£œ½œ%%\ä’A’,3³{¥\ÎÜŒH’\Õ\Ü{+\r‡™¼½ù\È{N—·)I:KÏ–òI*KS“œ„\0\áFV†;õˆJ/šÎ±ğ¸wy\Ò^²19r5\ÛòK“\ç\Åæ­\Î3L\Ô\Î\âú¦.‚~‡4\Äp˜ús™[S\É/¡\èv&V\Æ\îz{\Zˆw[ƒG`Y\ê\ìf³\ÃË¿÷/	©³ \ÆV¯ø\ïúÎ®¢¸ş\×Ä›¾¥oôü*yO ùYòŸ8cõ)\è~sô\ÜMOô?+\ê|\Ög¿\ÄO\ÜùGñ\ï³|¡^\Ï8ÿ\0\Üü®\Ëûuñ³\ä\èúšº’x}O“ı‹\ÇùŸ¸y/«\ì>Iõÿ\07\áöR\Å/‘ö\Zú…ô¯\Î~\ã|w¢ún\Ïşµò\Ñ\É\ådk\ë¯5\å½.³ñ~\È˜ZÚ¸Uõ^/o\ã\ßcò¾_\î9Àò~û{å¸ªúŸ¥|]_±\ãk|\é\ï øŸmò°cS\Îz\Ü}ú_O/\'t7û¦«CsœL¶\İYœ­€+ªa$İ…ŸÀ2\ÎbE\Ö\ÒS)—\Ñ7X±s5³™L•^I;	Yh.œd”—¾ƒ4^\åä“„c‚_>õ“½½\ä–bä¬¬’wW?\ËI$)+9!oy)\ÖÜ’K“œ\Ëga	\É%˜\á+-$““ÿ\Ä\0L\0	\0\0\0!1 \"2AQ5Raq‘03BCTrs’Á\Ñ#4Sb‚ƒ¡±ğ²\Â\áD¢£\Ò$@“ñÿ\Ú\0\0?²!F\İIV\Øy‡›{™fY‘r¿¼R3@˜4Sœ\Ò<÷ŸÇš¥e\ÈX|[¸s,FN‘S»TJ)¬.r†›µ^Á8®	\Ò\'?]TÖ¾›\"Nu\Õ\Ñ\æ¯\ÒW\æB-ˆ¢\ÄA\æ\éL‚Y:‘¸ı‰˜Uk¾NŞµ\âZ®Üƒ\í^&ŸÏÚŸƒ\Ïm\Ïj~V\ŞÆŸQRRTG×\ÃcŠö\ê\à©[¢\ä†G÷5®Ğ‚\n0¨c\ÌB#%7Ø«_©RQMe\Õ<¤ \Ô\àœò¦)\Æ\áH‡H§\é W\Ûem¶\æ\Ûd|`r}:’+\'(\é%“³(\ïrT‘\ÔK›Õ¢8Oğ4»\Ğñù\İÕÁ?¬hj}][¸Ì·õµ)\Õ\Õ\r=t\Ì^¤w4I³\Â\ŞQU\è\ì¤ûF:\Ğ;øJ|oŒ\Ù\âÇŸ\0»\Õ0\ÑbG-1ô\éÍºP……GwZr\ÃeZu)\ê\Ê8on\ä-\Õ6HOb~ªK[Etm—Dò¢½Ó½\àsl›\Ö@¦=:¢66ò84zTõ{Î İ³\Îw+X\Ò[L¯\ï\â‹\ëğ\İú\İwz\ÑGa\Ù)¹\Ûr=S\âSD@wM¾”<¾>\Ë÷v…UHúww³¿ó\çR7U\0\ÑcZ8\ãş-¶R?(M&\é¼&«¥uŠ>\ÂÊ­Ú”\î*!™\àzPCDU¯\ÅO`\İĞ’¤+)\æ\ê6\Ø\'e•‘Š\ÛJg¬\ÊZ­Ş\Õÿ\0\ÛÖ¥ªt’Y·–_B¦\ÃL„>±\ß\ÊjÑµ™bhhô)¡²-\Õ8#\Ìw§dr>7°B§©µ†9,%·\ŞUT\Æ~\ï6š\à±i3\Ío7M¤\Ø\\§?1Lm”aQG¨XT9Y™b\ïÔ…Ru)Êt³”˜¦EªGY		H:hœÀ\Ôñk .\å{N\Û#°«+!\Ìzh\ÑK&M$šM\Ä\Z“«ùªJX\é›f\ê\ïŒşô\×j£‘L	\íO\Ç\è6C`qi»t!2FWA•\ß\n\Ş?š‘†7\ä;xª6ğQ…^ü\Õ[¾\Ûg\Å\ïL©@\Ë\Ùa´ùœ4LhŠ?R\Äæ»œ§:”P’ÊK”ÁmO=[Zmu-P#Š†NŸş)‚À¼©J»,ˆE~i\Ø6\É\Z#(õ*·½\ÄFÎ¼Šš™”\ì\Ê:Ç®\îõt\×(ÜÁ<\'„U¶KÃ˜P\ÛÏ‰\á\ì\ëóUW*¡\ß\Å\Û\Öô9\ã\Äi²1\Ò\n‘š\"r\Æ\çw§œ\Îqô\íœ]\èh,£\n‘—!aÁ­\ÎUd™X±	õ)\Ò\æE<\Ùa\Ã1º¯­¶©&{İ¡NF¥	Ã¡ºe@“Ö¥$´À\'\êPAv¢´¢†Ù¨µ\ÑUEb{xª6oª§˜\Ñj;Qx\'§¢É¶Y¶V\ÙGQ¹}Á¿G…ˆ\ÓnŸœ7\Z*aw*q`«Ÿ’•\ç¿M¡»ŠjŒ,=—!Q°6¬Rk*\É.J$\ì*Cs¢„x<»T\Ù\ŞI\ïY\Ò\Ü{Si\â¦\Ì\ç({-\êN\Z¸[D]B‚i\';‘¸\âö\ë8\ïY\ÂûbFÛµZ\Ú#\Å\Ø6\Ç(<V/`÷»Ì‡ıD¬\n›yFùGÇ•\Éğ‹U\ìO\n@\Ù5;J·:•\âvx,o“%K‚B\Ã\ÕTl\íP·EŒ¸6³\Î\Õ\r<X”Ğ¢\r\Z„\Í EbrÜ¹TJyN+\r‹y-\ÏêªÈœ\ÔH\"\Ö\àœ{V\áÉ´e\Å26Á˜5R§«•r›)jl¡Á1\å¦\áI\Æÿ\0j<QAƒlrX,HŞŠ¦O¢\ß\î¹,\æŒ5­?´÷RS2Ap¥¢²u1BŠsŒNj²<\Z«\"@l\Ñœ\Õp \Ü)\0®ƒ7Ê·G…†»]Óº\ÍP…\Éyƒ<\Ö\Ù\rJ`P±a±\ê\Õ)\ÉØ±\ê\å1âœ°~©ô•3lÁ›µ<w,—ô\'\ØpLi\'U—+.¦”ŠpDY590\ê˜nº¡;k¶\r»\ÕR3aU\'÷\×\'¤µ\Ïw÷P\Ô- ¿bğe\à>’\ÊZcÜŸN{“¡!H\İj!ˆ@+¬—RÆˆ²\Î\î\0¡P\á\ÇUMˆn¥\ì\à\åPÎ¥m)ÓŠ¥\Å)^\Z\\\à\×Ob­³N÷ñ\Ø\í\Zš¡e\Õ%1qXu	mœx,B[2Êµ÷*bSŠ\Â\Zÿ\0\ÍT\îeµuÓ¥Ù¡]\êIb£1ôŸ\'fŠªh\Ì]S\Óu	Ìº „S8¦ñ¸mw7:oO\n­¡\×X)´\Ïrd¶P\Ô(\çŠnW!N¶RG\Zu4eM@UTÒ–ö)\"²sQ	Áš™Š@Š#f]¸qŠO~‡Ğ±*<®\Ş0i\Æ\á\\¦\Ô<(ª\Z\î<T‡¢£\nš;\Ùa4@\êFhÖ¬N~*y.J™\É\åv¨$-\Z \ç?‰P†³¦UMEÎ‰­/)”\Ãwc\ëR\Æ\Æ3+Q}’\çT\İ\n\àQmôNeŠ\rLCª±Èm\ÖúH« ó£º\Â\ÎG\ÔE\Üs&¹6DÉˆ\íPÔ•\rNš§á¢’7§„\Ç=\Zq3xjª\è{\ĞS\Ûd\äBhQ„ö\Ü)˜œ9˜eP?˜ô¾Iß‚®¤t:i±©‡ ¡j Š\ä*DqJ¬”23ª®¨¹\â¥r§mSJ\Ú\'<\åDfPR†2ıªN‹T\Òg„B²\â\Ù`V@›\Z\"\É\Û‡6\ë—%s\àğ\æ)\ã4˜´Ñ´A\È9¨\äQM¢mMH:o\îB&±­RÀ\É~\ZF *˜2§±š5Q…m\á=­%¤88&\Û£2|´ZH\Â\Ç}I©¼§X[n\æ¬ÁŒõ‰V“quQ%\ÉR¹<¢›\Å\ÔN–QZú©kŸ|‘¯—@ñ\Ö	\Ò4«ı¨\ìQek\"³&=9\Ú\'9]=m\ÔR\Ş\ÙÅ§2\å<@KO^\Î\rrk\ĞzMz¾Mœ…Y\Ã=(V(ª®x§0J\İV#‡Ø’Š¢\Å9¨\rT1\İKPªS\ÑGnW\à\ÕM\'¨ş„‹¢\ÜK£¢PMP,)\Ö{VóxÌ«\Ís®¥*RŠgn\Ã%³-ùk®!˜48u”&=…\Ç1D\ë¡M~\ÈôN\ØS/t\ãµ\Üû¦ÁŸ\Óÿ\0¥S>\ì\Êx³D\nMzA\Ë:-úlÇ½R›¨•º©ƒ5X…ÔµORS#\ÕQÁ¥\ÕZ¨OEv“\ã²„Œdğ¦¦(U–!S\Ì{\Ö\"Œ¿jªm®¤NEFš»S‚™\Ög0&Irš.­ª;@²wˆi¯\Ù\Î*\ê\å`U*°\Çu&±\Z\Äd‹ƒt\Ø\n@ õg[\Õšª\Åš\í¡\ÓBª\îÛª¦\İSÁw£Š ªÜ§:§¢\ærfŠS†\Î\ç\Ñ\Ê\ëÄ«i\r,¥®-\Ô\ŞÀ¦(\Õ!\Ô,><\ëfF*\Ş\Õ\'ôSx 5O\ÕTğ\n\Ê\Û,Tc¤8.İ\ãµüxjœnva¶G÷ôl¯±®-!Ã‹M\Â\å<.–Ÿgš\Üÿ\0I1ùš®®WWD«¨]ª¦—+S*\ìTX†š©rLdJ£¤ª¤¸·rªRñN\Ø\í¡`‘¼aq\\\ÛÚ±0Sı}Éª ©«gD•ŒH/eVuR\'\"š™\Å5=H\ÜÁZ\Ú+++(…\ß\êM\à»Wz\âv*û3\ä%úMş\èdBÁ*i\ê0\ç\ë˜g\ë# Hß¢ºº±\Å]F\ä\ÙôM™6uL\âE\Õ@\ÍØ˜Ü€”÷\İU0\Õ8lpGc8]¿ªc¦`¶€Z\Ë‚—q+òŒ\Ün¬¬!P²\ä*6\î©\î{–\'5Ë•Aºzrrjg\Å\"js.œÂ²¨Å‚`\ÑPû,À¢û’Ceö·\à%\ã\Öj²%]S\Î\êy™;8°\İr‚H\"\Äiõ\ã6ˆ‹·@©\nº\ŞX¦Ì›*…ú¨d¨exU-\à²R4UTı…‘dg\Òhş«9)›\éU®>\'±3ªœ,5—pU,±\ê\å1ONE7Š	‰\ãm\Ñ\0M\à‰\Ú\âû”]¦ÀPz¾\Ë\ìk›¸_¤\\\İ>\Ôâ¯·ªdŒ~Pz2|=U´o¡™\ÌwP\ë\Ì\n¸=ñ\Ø5¦Ú¦rrBıÙ—_R<‘`±uK»ô\n·\0§¥¤šq,…Ñ²\âöS\İ)‘½l·P\Âö\áÌ®\âm\Òj£©Œ=„\0™£\ãb³\Ş\İKH\ï²\Ü\Úÿ\0\Ñ>)_“›&I}Z\ãö£‚a\Í0’\Ğ7\ä{P\Âh\Ú\ßÕ£ö&a\Ôysx<A\Ü-&R@\r·QıÀ¢Š;\Ù\Íô‹ğ´7ˆr¬¤•Ğ¸1„»¹EÔ¸\æxÊŒ>6\ì›ö¬\ÛÆªÃš+^\Ãr¦	\á99v\ìc¬\äş	ª\É\Ì\Ùd\Z¸m%J\ëpu}ö_a\Ù}€\ë§bŠ¶\Z\è¼\Z²\Â@,\É{\ÕF-3»Ú¤ œ@“\ÔÛ¼6#mdı\"Š7	\â,¤?\Ñb®šZpğ\İ\ãm›¹{•\Í\Èú\âG¬FŠzjhh\"\Ñ[§-­u‡a\æš\0Ñ©=«rSiò\è\Ùu»‹‚\Ë\î^\İv¾\è\ÉœVöŸ¼¯ƒ¸£W\à\Õ\á‘ù‹\ÃÇ˜!û¡\Z÷÷5\Z\é;‚©¾ºg\İXl\Ù\\\'¸\ÕVÒ‰pUpX¹H,œ‘M7ö›D\Ş\'…”,¡U\Ê(•#®}\à=]}—\Ùt\nŠ¾F9\Ù\ÜP«¥wY–õ…°³\×\rQûaÚ˜\Æ:8\Í=·Yzó}+©)\ÕL5½\Í^|Ğ±z\é<k[QeƒbsüK==ˆ\Ì\ï9o	\í(ŸJ$\í>µö«…§¥pœıQyÁHû\ÔJ\ï\ŞTsX…÷\n›V)KbM•C-tğÆ›#«AY´MyM¬\ë2tËŠ<v]H\ëzÉ®çƒµ\æ\åaU\Å®Cr\'HòuFı\ê\åV(\ëRH}©d2fy\0/\Ñö>ş ¼gú\Å6w?«ûJ\ÔŠ\ÑüJmücP\ßj—•Ÿ{Sñ\Éû\Õãª“\æ²\éø½oœ>\êv-\\~Xûv#X~Y\è\Õ\Ô´®ö­\ã\Ï8ı¨Â©ä²¥¨XwH‹³EV\İJxNDll„h›ª\àU\Ğ+0²\'D›\n%Jú½ª«£c¢‰À°üWke7(±Á\ÌÂ\ÊHü¯ôG\ÄË¹Nµ\Üj\íNª\âÏ•\äzJD\Â,©¤To¸Mz<\ÍUØ• ±D¬è£° šTNT\Ò,\"]$3‚«c\Õ\ÊV\Ù9¡\ÙP—½\Û pWºq°O×›oq°YÓŸªyEˆ€ S\n…ùUÉ’&t‚\Ä)¬ª#±N¢À‚jb§}Š\Ãj2 7ŒX6[ª†X§„\äQ\Û{!)[\ç#3\Ğy+8\ßzO>\Ê\Ê\ÅX«,¾ó!\Õ]=\Ë>ˆH®²,©¬)¡1R\ËceªE”\àH\ÅYOª–Øœ6ƒ±©œoTSZÊ‚P\æ,F \æ›*Èµ*V\Ù9~²²²\rYU•‚\É\íY^n›Jq\×dœU\í°!\"c\îšB\",™%Š§6§DÊµ&IB©£\î\nhH\ìOb#˜ÒMr¥š\Ä,:®\Â\É\Ï\Ş±W\Óñ*¦=S\Â(û\Ø\Ùem–\Ø6\ŞüPh=ºû\Ãôd\æ° \ë&º\ë±£”„ÊfQNšğñb«)4¸SÅ•8#e¢µø&R;.wpY­døKFn\Å–T•9tº¢ª\Í\ÅTÇ¼j«¥7*xKJr(û\Èâ¬¬••¹€ ®¯\Ì\Ä\æB	7gÚ©ğ,Z¢\çA’A™·}•E=e\r\\t\Õ/\Ô\åv¸\Ëş‡\ÑW\â.”S\Éğv.\Ì\ë,C\Äha\ß\ÔH/—G\İSr{©†9\â{rH36\ï±Uøuv[\á,\r\Â\Ãğz\ìF7K›•®\Ès:Ú¬G«Ã·~[ú^®Su\îW\"÷_\ßÿ\0…4\ÓT¾^¼f\Î\Õ‡aµ˜óÁœ?GlÙ¸ªü¾‚ü\înL\ÙtuõTÜÄªaxœÜ’¶ï±²¬¤­\Ã%ŒUµ\âú:\áešª¥”´\İc\Ã[]{—\Åüøşÿ\0ü*\n\Zú\édŠô¢\ë]\Öí²¯Ã±,:6\ËQ/E\ç \Êû¨0<fh£™“\0×µ®m\ä \Ù\È`Xø\áR?ıJ8/(N†«ÿ\0)ü–!Eˆ\Ñ\ÉU2\İ\Òõlû¯rØ·Ÿ\ß^\å1O:?¿ÿ\0Ü¦+\çG÷\ÕUlÎ†\Ã;u76\Ü\æ7ko[o¬^\æq‘òŒûê®‡£a3°¾!ñ‡H*gºœGª:9\\n\í¦wÀ©\æ\Å*±ZšJJ—²\ÏvV\ç!¡¡”\'OşSù\'rs\ZwZV\æÂ­\Â1*&\çš;\Æ>;Naşz\ÖğuG†\Ö\×~¯	s|\î\0}¥{’\Äü\è¾ñü•^ˆ\Òù\"\Ì\Î×³¤\r\Õ\Ó!#9\Ôf6Sòc†\'\Êì…¬r¨(g¯›q³\Û6¦\Ê~L\â0C$\ï\È[\Ìl\íl°\ì2§{\ÙOn€»®lªpššj¨\é%Ë½—.[¹,O¾/¾½\Éb}ñ}ô\îJ\âmiy1\ØšÃ°º¬D½´ùo»³/rx¯|}{“\Å<\èşú¬Ã«\è-\á1‡ƒ¸‚µ{\ÚÖ¶‹Ü)\ß\ßU”sQT\Zyˆ\Î-{„œ\ìO\à\Óü\nÁ¼›GõM\\¥ò\Ì_B?\År3\á+}LüW+¼™ü\Öş+òe\Õşj¶*\ØO0\è¸qó]Ş¹;E-U0KÅ³\è|\áaª\åŸıñş\n>£~Š\Æ<¯Wô\Ñ\í\\Š\ã[\ê‹ıË•¾Lşk?ù.\ê¿5a\ŞDö„gN/K—$°\İ\Û] ³Ğ‹\èö\ì\ä§\ëõÿ\0\çj\å—\êP}w\àU(0\Øi)¢|\İ6B\Æ8e\'¤¦©Šª\Ï	¼o\ê›zUn-GBö²¦Lp\Ì4\'µcØ5u]©Ÿœ3Gio²^P\á°\Èø¤”‡°\å#)G”\ØO\í\Ürä™¾%9\ìİ¸ÿ\0Pª\ê-<µ„mÏ•G\Ë\ZG8\Ã#[\çhlš\àö‡4‡4j\ÇiˆES\0´Rô²÷Œ‡w&Wõƒ??(fx¢l	^ì©¾o\'´&=“D×vJ\Î\Ír¥\Â\ã©\Æe¤oÀG$…\ßA¥1Œ‰Œ¬h\ĞIÊ¬5\ÉúG=­\èªzˆª!lĞ»3Àş‰¸^1MYr\Æóœú\ï\ÒF\Ïo{\\\'0\ÓKS^ò:’nwş©\Ík˜\îX®MP\ZA]›­¾\İş¬s\Ë\Ô\Ëÿ\0Q\Ø\îQ\ám%®˜\ÜhzRò“\ntR4M«š\á\Ô+‘YôøªšM³¸fµÏ²–¯{Z`\\\Ú÷\Zjª eD2A ¯?šø9>‹“fƒ\Ş.¹@\ìø½G ı9øŸÀ§ù¬É´T\Õ\Êo+\Å2?\År3\á+}LüW+¼™ü\Ö~+òe\Õ~{ygÆøÿ\0Î£>‹V4ì¸µYıõ¿‘\\k}Q¹r·ÉŸ\Íg\â°?%\ÑıZ\"ú+£{\ZÑ³’Ÿ¯Wÿ\0Ÿr¦?{\İÖ\ÍsQŒx>{kŞ¹5\äŠ_\æ¬®Xk]Mõ_\î*H\ÙL—¤\ßï²¢·“­™\íœC½\é\ŞM\ïôV7-•}n\ã+C²7.º\ßE\Éx\Âkp\İ:\ŞĞ±¯&VıS•Ù¸·\ÇÌ°`\á†\Òf\ãºj\å¡ªVö\æqMwDz–r¹9®4~Œ‹Á^ \Âşh\Ï\êª\ëih!\Ï3ƒ\Z\ÑfG\Ú}\r\\““{_Xş×·0û\Ë45b;\ç\ÜÉ–Ş¤-b¹#Ÿ\Å\î¿\r\éÊ¹`Æšz\âk7\Ø%€\ÕxNNó\Öhİ»øP\0^Ã¥µÙ²\Î@{+Ÿ{\Ê\Zv’|Lş»]É \çgl¯\Òıÿ\0\ÕbòQ\É]#¨Àğs—.A”p\î\\‹øZÏ¢\Ï\ÅIec\âfc\ÆW7½3\Ã\à\æ\Ó2\ãP±~RÁN\Ù ¦%õKØ€\Å\ÇÖ©+©M3F\í—­Ø±7¸Sø\ŞW\Û\Õ~}lfHgH.K\âQ\ÍH\ÊG:\ÓCpœ\Ûö,O¦\Ä\\\×\È^\É\Z2\æor\Ãpª|:72—?®\ã\Å\ßæ«•¸”ok(b9‹]R;8‹,É”T)‹?\ÆZxÀøX%o¢\çUŒ•’2Ç‹µÁrÏñş	Fı©0\Ê^d–š7=\Æ\åÅ¼Jv†\åqğX¸y‹‘\\k}Q¹r·ÉŸ\Íg\â°?%\ÑıZª\Ä<¯ø)\àcë¹±X\î!–®Š‡Œ±¾_nƒg%?^¯ÿ\0>2\å7’§õ³û¢\ïş0“^H¥şgú\Ê\å\ëô¿V\ßõToSOô‡÷\Øü*\îs\ßMœus‹W‰ğ\ïšC÷W\'€f5ZÆ€\Z\İ\è¸ª˜QI|’7+¬£\ä¶Ã›#\ß\ès®‹XÛ¸†°vcu\ã¯­`‹Fú{\Î\ÉE£%r[\Ê\ßÀôş«½HO9ùWı\âˆ.7q¹XUw‹\ëY=®Î«\Ç{T3G<m’\'	\î\Õ\'&p¹Ÿt[}KC\È\nb§ŒG‰ƒA\İ\ë\\¦\ÅYY3 ×†+\İİz\ämW\ë„÷J\Ñıÿ\0\ÃR¹7ˆšššö×“}ù\ìD€	<§›‹\Ç1ùJ\ïk¶\':šX‰<z+\Äøw\Í\"û‹’:UW\ÃAıJ\Å\è\è*¤a³›‹\\;3f\ê[6¥fùş–©p\Ú)\é&§\ï\'W9¼W*iá§­dp1±³rÓ•¼8»U&°·F\ÇM\ËA\ë½bP2\núˆbcCF\Ûóe¢\é\ï`vG(ñlrm\áxu§\Åñz‘•ò¹­=\è§S¾s”8¶/m†)‹XÎ«z\Z*¹k*\ä\ŞÔ»;ÀË˜\ÙSb˜370LY\Ô7¢º««¯­\Ë\áO2d\êõE—±ÿ\0P\ïcñŸœc?%\ãüc\ç\î³òTuÕ´Yü\æ<ımºª\Å1\Z¸÷U—²ù²Ù¡AŒb°FØ¢˜µŒÑ­³tUU5uroj]\àeÍ Nš©ÓŠ—8™®Ÿ·¢¼}Œü\àû©j\ë©^ù)\ŞXù:\çMuU-U†y\ãv¥½¸wƒ\å·MS\â8µ4m†	#oU½õS5ud¬’¤—–h	·R\Éö>>-^:\Ç?n\ïc±\ÏÛŸûñ\ÏÛ»\Ø\ÅF#Ï¨…Å’\É|\Î\Ó]Wq\ßÛŸcq\ßÛŸû\Ò\â5šUNò\ß4Ÿö¨ lBÃz;•RÃ» *jŠŠI·\Ô\î\Èş—ñœc?$Ák\ßa\nš²ª‘Ù©¦twã”¡\Ê|X„iõ´*¬V¾¯£<\îs|\ŞeMU=$»\êw\ä}­™;”³ÁkªS¡[ù*JªŠI7´\ï,}­qÜŸ\â¯k˜\ê‚Z\ág7U\ä‰í‘†\Îi¸+\İ1ó“\ìg\ä½\Ğ\ã8?uŸ’÷AŒ|\àûù*jú\ÚG½ôò:N¹\Ó_j—\Ä\åc¢’r\æ<esl\İBŠIa{d‰Åi»H\âº<_\ç\'\î³òUU•5’oj]¼xo\ÃD9A‹aPl4\à\ß\ÉK,“\Ê\é¥9ówı›O2Sfó†\Ë#\ÑA]\ÌTÇ‹\"ğŒo‚i+m\Ö\Éb³\ç\ZªªK]\í÷ö¢\Ñ_œÎ°õ\Ûú p\Ë\ÚÌµ»Z¥Ë¼~N¦geú<\ê‡kna(sº-¶Û•®\ÒJ¹\ï\Ú\×X¨\Ü\Ş(•uœ¶\è¦99\ì,²š\×uU½…m—D\é\Ï*û?ÿ\Ä\0(\0\0\0\0\0\0!1AQ aq‘¡±ğ\Ñ\áñÁ0ÿ\Ú\0\0?«)e5q¤H\'Q†\ã\Ëyn1\ãx\ç;\"\Æw*\å_ªÕ€\Ì÷G\àCp†\\Ê‡¼GRùŞ¹˜\éˆ@KZº—Å†\Ì1E°Z—®^kQôwSt$\ç,—1\â	i*\Ü9‚‰Á¡õp\ï¹\ÊÜºXCµòJ&.…0’ºpóVEM7\Âø¹ç‡ƒO\Şcc¨nw\Ë\Õ\Ï0¸š}\Îj÷7Y\æ¢¶l:˜1&‰>>eõ2”6²l`D\"¨\ß38œ0\ÆH8‡nN\áP\0¾;}[†Z§}±\á«{_¨R\ì\éWõ0¾U{ù›\ßBh¿vø!ÚŸS»f\Å(r·–†yL\ß\è<\Ë÷»\à—\è¥ec\âS­.Je„påˆœ|óú–\Å\Ú\Ì\æ\àN\Òòš‚4\\¸”­¹—\ä\Ém¼K¬K\Í\î\'\Z‰\Æ8‹<´™‚Q*‹Ì\Åõ%ù¿S\ÂN\Ì_¦XC\ï§\Ü\ïK\å\Ü\0>=úÕ‹\Ë>M¿1¶…L\Î\ÂöbC~›o\ï+?¤\í·†0ñ9fù¸µ\î]1:¾¶(\á ~\å«’û\ê\'\nW‰mŠW˜ş#\ßú–¦r£G%\ÜKŒ\är¦!ŸARo›A\Â«Ç¾İ°Ç‰~\rAò\Â\Åı\Zˆõr¾Œc¦;|\ë\r\Íl\Í \á\Óõğš#w\Òı\Èô\èõ\æM¨.3ûÏ•/Iù	“w(‚ø,°\ÅÑ®Öı\Ì\ç\Ät5UU.;—¢\r\\)¶)c\è#I\Û\ÑpeV•»¦=0=ù\'£µJ¯n\İñ\İL\\\Ã[Ä¢\'V±›ğ¡\ÃCŒ\ä‰\Ó^>}‘y´iwÁ\å”BK†E\ÃBì—·%±T>k,>j—3¹z\Í\ã\Zq›‚5B\Â(‰\èÍ½;\ÓQ\êm÷\ìA‰¦Q1¤†\"b8c§•\ÔÑ‡\rŒK•Ğ›iõ\àÿ\0\\\é·\n\Ê8ó‹¹¬$Uù\ë\Å\Ä~—ó\íO6¥\ä£s\æ\\\\S\â_]\Ñz\æ\ä0GP\ÑÇ¤T¢]C‰ù(x8b¹ùY\Ëc’U’\Ø	j÷5!\à5Ü\ÕX!£\Ğjğ\ÄaGs·6‚k,¸²dºüL³©\Ã\'n\à¨\â/Ba‚$Ú¢G\Û„\Ï÷ş\ë\ÈQbvJ\'FfemDfLÀ\áô³6\å\Ó3\éÔº\"\Z,«Ì¯4®¥\ê˜ù–=Ûµ”\ëNò\ÊA#\İ\îšlE£REªñ\ÙÜ¿¡T\âS\Ò_(#Rá©º\\ZiÁÏ§\àX+ö@¿\éOìªERÎ²\éL›™7\'—®ÿ\0\Z(œ{KŠy˜\Ä\ír±\ìp8\Ô<³13œ;ø‘XŸœ‚\\µ˜ú\à\Â\Zñ¼Co9\ï•\â)\Ü\Û1Ü¤Acµ–™fl\í34zt\áÅ§¡Ïœ\ä~\Ëi\ìG•\Ö:Ñ½B³SS>¥1ƒI™Œxš\Ë FÁÁP&˜9©˜ª}Ï¹-xµ\ßd\Â|J!Á}·À˜e\ê;Ù®[X„öÙ¶\áG˜\ÍÌ”A!ô\Ä]®‡™¤m;Ÿ\ÆòµJÄ·:Š\Ø\Îó¸\ë$i…\î%\ßqhŒBö™\Èw0f{šòT\Ã;¯ı	Ñ±«\à\È\ZE^¥†‚\Î\ë”\İQ\é\ßÁjA\ÄDÊ²\íAN\Z4y<B+\ÛV¿c2t\Ëñ\0Z*³\×+_hVZ!HIp!µôBd{€,9|¿Õ˜·ou3\Ùz…MGˆ1•—‡K\ìS¤”s;T{C6D\ë¨\îa£\í!m	½û%{5\âSP ¥p6X–8 M_·\á\Ç)•˜–>eõ0(G¡ª®$—\ÆŞŸ?$W\ìw\'i+Ë°‚\Ö\Z·/eñ*I\0¨ \à½\Ëo\Ì0`…©v\Z¸\ìi5F]\Ş+Q;\Ì[RÀ5À\ÇòCXüp×¸i†ãª–ú·\ßbŸ]uşXÿ\0\Î]vË¨¦|¦t\áŠ/Ty„\Ñv!¹g:´J×…\î9x\Ñ\ä\Ì\î,&.ù*ø—°fò!¹§‹ö—{—¯kJ\"‚-ƒ•e\Æ\n\"\È:&\êwEa@|Dˆ–	¹[&a\ß9”g\rğ\ß\Ô\r™¿d9,£ß¾vº•Ja \n\Âˆ/\\aº\"n$K	™G\rX\Í7Í™»s¸´“b:c\×¿­À®‘\ÜOt¯½°x­;.\æ\Ù}ñV ÁIx0Ò‰\í\ä\\­-$a,*(HÄ¬Tvø\Ã\àƒ²a¹v.W¶`\Ãy”\ä›Eò†3\âe¥£-p\ëL®÷)up¬zÒŠÈŸ0#4pf…@÷\çi\ŞmÁ=\Ïf}\Õ=Ê®\ç~\Ï;\É\"9Hiµ\ÆA\ãW|{f¤ºeDA\å†~Ò¡\Ô\\¢\âŒ\ÅqC\í3§˜ ù„ID_s.f\Ğ6\Åp„9Y„\ï¶×›d»ÿ\0\ç¨\è%0F!2‹\\\î8t”º£)Æ–ˆ&\äŠ<³~m¸&\ÊZ»^\Ó0ö\Ã:EI\Ãu˜CQ¿>N|ğr%|voq\Ìq-†\àY”R“X\Ù2\ÏÌ”ß˜< \î‡DiÅ¾ÿ\0\â¸\é, ¼R\äg\å,©h)r3Ğ–ƒ\r\İw(ƒ¶H*\ÂW¡/‚Pcğ¢–=\â\âóCŠAQ¥\Ğ\ãf7pİ\Ì\ÍL\×Äº\ÏQ_´\Íb¢p9\ïB–—\â\Ö;UJğ\n\rqOE¨\Õ?”®\ÚøH}\æÁĞ†g}x\âp\É\\\ÃÆ¡l[.J1/CUw¦\\\Ûf\î)x«¹@`Ce\âWak\Îm‰ZN¥÷‰/_1Ç¾:>Ó®¾óf-D\Z¹Ls\àRQ¦·ˆ\Æv¼K±\áC*Á „\Í88œ_\áò–L\ÉLy\ì\ç\å¤#Š4\Ó\ïÀ\ÂQÂ¶JÊ„V’¢[\Â\Úm=C¸ğ\â\Ã-¶eq2\âm\Åsfxãª”õİ»&w²Z’‡»¯.\Ë\Û/1\æw\à²\ÇA‹qRÌ®‚\ÔmŒ\åJ\æa&8\ÍBZ¹\í(„VÁM[M¦ó\Õc\åú+(‹c_>O\Ä\n2o†ZK!G\0u-¬\Íy—Á{vE‚—5L1yZ%\n\â\Ï ·ˆ{#yş#\Ã\É¾\ÍL„¯\ÇQ\Æ*Y›¹‰š\Å\ÅF5ı\ÌP\Z\Ä»%\\0\ë¯©Du75Á‚V/D\Ğ1\Ú/\nK°\Â\Ú`\Â.	\ç÷@\Ïó)¥Á‡ù\Îï˜ƒS}\É{÷\åE#±h]“f\Å,	ø\nÀDÔ–û˜\Ì\ËÜ ¬È¶‘\Õ+=\Ñ5\Ò*\ëù–«r,–Œhb/¶Rc\rğ«<\ß(æ „«pÏ—û¨ˆ—Š\Z–¥‡n.}\ìZ&\á\0QP\È\é\n²İ³.;)À2Á”\İT\Ç0[ó\r.%Z+\â/W	½‹J\â\êu“\æ_¥\à¶\Ä\ÔhAŠøp\áÀ\àÁÜ¦¿\Ï\Ş<+\Ç^%†}\æqTTª«”“.=\åu&[ÿ\0šù\Ë\Z(\ÎU\Â{Y€Si\ÔÃŠ\Èe¾i´/9‰\åfŸ\äŒRª&e¢x´›\'\íŒõ­¥\Ó(\è/9¨º•p\êc˜Ä¤¦:›gi¼ù:}¹™¸\Â3€\Âd\ÙTn\áDU(\Ì\ï±\ë\ZŒJ¦&Ñ…Œ_,\èß¯†wÏ¼„_[¾ ¢ó,°ªšøC\İ\çKEH \Å\Úa5/õR;R\ï¼Qû‹\çK\Ë)\nCOs\ß\Ât£T¦˜ EGìŠ‚7A;	m¹TŒ½;\Ä\Í,\Ë\ß)Mñw±4†)Nvjgm˜ 6Xî†¢AX\ç|õ\êÜ¿Eğ¨Ë¦a®t\Ç/“¬ÿ\01x§ºCGL«ûbQü¢\ZIñSø˜AlùŸ\é•W‡ş#®zóÀ\ãª@\ê™\ì\'@|†lşª›w÷‡\ï\â\Úı²š–c8…i^\æø8˜rxj6œ‹\àZ›ˆc·…rŒš\Î\á\ê¿Eø—s1YrØ²\å\Ô\ê\ã\Úg\"`\Õù3,/·üLÅ¥ø&\ÚÍŠ.• !S9\à\Ñ.±¾!y(ˆ¬\ÊDE#‹š™\à\Öh„\Ğ\Ã\Çl†uöˆ¨\æ\Ä¦¥)‚‹\Ò6NØ­ŸI\éy¾^:Á\È\Æ\àú<¸/˜EBjiº©Y@Ì¼\Äñ\ËQK\åy‚1‹eµöK\Ô%\ï\á\Ú1ƒ\Ñ`ø”P\ÔGb\ÃòÅ†Í¼_H<m\ÍV+ı7.¥´\ê`J¡kD€\âj_ˆ\à\ÇU)­\rqqøe¨¢1F!\è(¢¦d.¶\rE!y¸aqJ\à\âù} x0a\æ1P\Ò=k‡\\\\¾\ÅS.n…QN£†Qp6\ã¯\Z&Á*•\Ór±LK¥f\Ö)m‘tUJã‘±ƒ\Å2³\ËP½\Åm;Š,J\Öø‰PŒX”\ï€‹ (‹\ÌË”ı=YŒV{ÅœT¸2\ÜT«+9‹‘BŒA(¹|a2ñh\ìvL\ë!]ª\\–TV“\ì\Óû¥‚- U5@º˜\á¨ò\Èiy/—\Ñ|Ğ“Ë…\Å\ÅE\ãEb”\ë<V5KUŠŠ\áÍŠ§\Ìb-À˜Î›!\îµP%9\Êv\Ê,}…v]•\Ş/¦l¦Lñ˜\Ş{=]\â\ZÇ”*bš¬_³\0şSULÁ\Ç)\Ş^\\C€ü3fŸ²lõJ^_ÍŠÆ\Øö\'~‚\Ê\ê\æ\ng`¬ŸÃˆ‰A<1y\\wYw\ä\Ïû¨{?*Á·ô\rx‹\İ÷°\Òüù±0fH\Zø\n(\" ¦¤¡7\æ/\å\Å»ØƒóY>“*\Âu»¥-$†?T¢% š\É´\\M©fó¤3X•\åZš {Ë¸»Nè©˜YµzZ\î\Ñsh¶¸‡ıd»MÔ´D4©º©Gù“şª8ˆ•‡\ï\ëjƒnk3ş²6@¡¾/ˆ#:#ˆ¼~§‚ÿ\0\Ñù\î|Î\ï‰ı,\\C·A÷ Ÿ™IŒ1öf\ß9ş›ø™|\Ş\ë<Æ¯\í‰ıGó^\ïó/\ìGSû~|ôEaŒ\Ì>eTpûŒX\Õ!|Ã¢5eÚº¨#®’RI&>Q¾$¤ZA¥µóM¦¶\Ä\ÈY‘…ñM\Ì’<(\ë\×@°\ïŸVk\Øi>\é7a„’š\î5–\Õ\"~–‹A\ïô+\ŞcŒ,­g\n\ÕÈ“:¤GõÈ¨|[\È\ÂÂ–…\ìpñ™\Ü§K´\rv¤ş\Ã\Ì1\ÕÁ´¨s2wr‡–òş¿s¦üO\Ã)|\Óù’\Ã\×\ã\Ì<Cp{G\\ş«ø\áv\r¦w\î?±ó:?¶\'ôŸ\Ì	m?<~\ìÿ\0¸ñ>i‘Iı\ç˜\Õı±?­ŠÆ\Ë\×ğÅ³\×ø\Ì{Ÿ\×ò€e®øV\î½ıø”{#š\n%\İ\ã<DS`ûµl©1K}\ÍL·{q‹\Å\íª\ÍCC_r¸jœ;u\î;>b”*8\ĞB\ë0PU\Ã\Ã\æ$„mw\ÔYâ·®$\ŞGüH¬­ÿ\0:¯\ÙL\Ã!x»u¢0q];¯\Ù0à½µ\Û\æ€›\ïEŒ.ay+rA¡V^·˜Vne\æŠ\Ğz†¾\âe\Ï\Û2xI¢ò\Ş\Ò.K›Z\Æ&1‚\Z^“SôBQ8x\0m¨y¯õp	Æœ\áš?¤\å¾(`r\è\×\Ñp9w00(ÿ\0Áõ\ß\îC\İB3ögı§‰^\Ì)}\Ø\0~œ1«ûbS\r5xHŒ\Øw·À\É\î~·ş\çõ^1_{ÿ\0¼\Ê\àk•ş4D\ÎiW¸¦Ãš\Ú\0Š	–±M>ğ\Û\Şiòq7-G\nRú\Î\æ2r/”­Š÷ş#\íôó¿¹[X\×Lµ‡\Ş,\rŒfÔ–M˜<\àÀ6ÿ\0´¹5}«\n{ş\ÅXš\Ä~\'Xú|*?©vÀ^‚.}øˆ1µói6²›ş&\0>¢k©\Üe\à4ÀbC\ì_¼wiaI’\ïF»f\Õhùx´Š\áyf\Êû\İ\äMGF_,Áv£5Y]\İBT\Ô¯\Ù0ŒCj¦€Ÿ—¼§3#z¨\0¸ø¨Œ…\ß	+º\Øù`j\Ïfa§[e4û $œ\0´1^XhašeJ~¨\â\Í|Á¿w~ò‰l€\İg¢8ş¦¬ó,ÿ\0”-.\Ï+(–\Í\nµ\Ö ;y.Â›³„_õüK\Äd>v³¼o‰\â\ÍgÀOğ\Ä\ÚU¾\ï\íj,])\0\á\Ş\ãZ5¥2$#n”`~M0Yó-Á•İ”£ûò/T™v-\Çq•\æ¬9l\ÌfVaQ)\ê9c\Òi„˜t\Ìy\ç:\×\"·¾‘ÿ\0Ş…~\Ì\à†*N€H¡†k\å…\Ïš\ÂšÍ¢\ßPŒ(úM\Ç/¡p	W‰­B\Ö\'|\\ª-\ã\Üanhœe\É$\Z–cQ\Ù\ÙQÄ¸ÿ\0ò3 Š™\Ø8˜\n\Ôm+‚+±(º¿”¬\rn\ët\æóú„WL\İ[¨§™d²,¹h¾¥œ\ß\Ä\ä$˜9b\ÆYJ\Ä\ng]\â\å‰lrƒ{A;cy—\Ô5:š\Å+L\ÅO²$glDME\ã>Š\ä\ÅA‚\Ë\Ñ\r§~¢<-Ÿÿ\Ä\0&\0\0\0\0\0\0\0 0@ÿ\Ú\0\0\ë¢\n€ğ’\ßS°¿=ÅŠNûõõõ\é¡\",ªV1Öµ\Ø>\â\íJ.7 ™™8He„\îwùë®‚ŠŞ²¥5\Öl¬İ¶õ·\Ãz75\ìCz\îu\Ğ&<¾)eB¡Œ¨76W5¼¸\Ül‚<vffk¤iavıüü\Ø\ZÊ²ƒ\ä]›¼\ÉÛ„MRh†‡ş„\éKf³êµ9h\ßr‘L\Ì+ ¨U)Kg »Nš•\È9\"e’\ĞÑ¡„Ç±\ì@{öaŸ?,·W–÷nÁ\×qµÓ­-0\ÃKi¿[j`\æƒ\è1\Ä\Ë) ¥i¢„Íœ¢\Ş<š\Õ\Ë7›\á†<pÑ½tÅ½\Ç`fL²·\Ø=¸:lE¢\æ­\Ò\Ñ\Û&a‹2)\Ê\Ä\×\ç‚}\Ñe‘BĞµ­¼#W‚·œ‚\å¡Wwk·ƒö \'\Ñ&S,›½–6®Õº¼f©\í[«ddd \Ã0µ«—‹’ş„¤L‚±&=t-t\ä9–¿\Ç\Å\\“^9{n±XF€ôw\îcÙ‘nY\Õ\à°e½c±WGFX\å\â\Å9üQz\Ê\"\Â\Å%cc­k²·”e\êj\Ò\ãÿ\0<¹\\\ßc5€ÁŒ:ö ‚a÷°\Ü\çñ\Z“\ç)e\"¢\è\è\Õ=Nº¼XT\Ì\Ì|[*8Â±y®P\ÆÊ‹¹³jü[]\ïr%†\Øğ\Çó\Ñı\İôf?v>H¸]•¤\ÒA²«\ÊŞ·¬£)O’#;#\ZVrb±Z\ã&*½k\ç§_/™3$1/kı f	X\àˆ ı	“VÚ¼\Z±ò\é\ÙU˜÷»Sm6\Ö\Å\Ù·­\ëz\İ\n €-\\št¹\Úk•ŠW*[›[Œš\Zª—\Ë\æD\È®*\Ú„“4`\ĞAù \ÃW#]-W\â™^_ü\ßù•\ç\ãfÕUô®\Êm©\ëzÚ¶B…,\0fc\Ğqò\İk.2\ã);l\Í\î\ÇOF–°n7›,²\×.\Ö5F\çe)\'®Œ0A\0\Ã\ì\Õ\Ê×i\ÉÃ»\È÷%”^2±¶8\Õ\ä!º§­ê²»©[E¶X¸¹\njZ—q—.\ŞO°-\Çqğ+%YºZfC*ªYô\ÑO\×Ñ† ôaöÇœ\Õ\Å,z\ì®\Ü\\œ<¬:«¦\ê\Ş\Ù^f³iƒ•[ÿ\0+µmR¥]H#e‡®\ÍA@ S77\íò5ti1kKNQ\È/˜\";}“\ß\à@=}«rŠx­–##&F=ø\Öa]Œ]¯µñ²ô»~Z3¥´\ÛQB®¤\ë‘V\ìY‰\ä\îSG®Â¥\å†Ó”o&_…¶9$ú*Wğ?mf\Âk\ìÇ´Vô½OCc>&N¿ş¶\ÍfVM¤\Ú\áe)t\Ée–­ªD#kF—\"ƒ‡r\èrq\Zùri¸“dX#\æA†c\Ø>Œ0A‹7th2j·é•\Ôils‹f>Î¼”\Äm>\Ç&\Ûvy8Q\ÒÕ¹H1}g&’\Ìx³qF\ËD\Ú\ÆÉ™\' æ›‰4Q\éƒz\ë\Ğôg~Œ0A{WÊ¡\êµ\\’¦±P¢ú¶\Âú\ë¿]5ö\çdÿ\0|\n­®ñxpŞ’rG\âyXñf\Än\ï\ÓY¬7K³*aüKCùXŞ„$ş;d¸7\Ö\ßu²º\Ä\n¹kŸNN¿\'[5™›Kuµ`KE\âğá‰9ğû1¢M›r[8­\Z\Ê\î—NQº1÷\Ù$\ÃùXğA;öa3ì½ZkÔ­‹bX–Wevä­¸öc[°«Xøµ\ë\Ú\Ép¼8`\â\é·:Ü%°¨nl\Ú[\Æ\è\Å7K¥\Ó(_Ù„÷\ÙbZ\'µ\0“\ì\Ã>\á9UcYM«bØ–%‰bYYjÚ¼ºóªa…`³\\\ÌnÇ;\Ì|÷\ÇNxnEf\n\è«Eº],™\"ø\Âva÷ô!‰\íC§~\Ì>\Äe‡®\ÊVPŒ›³NUşio3\Ç“7 ¿z6¿\är§\æ6r»9)İ³l[1Ú‡Á\Øñ¯(š™¥¹e\Â\áh¸4´a;ıƒ\ì\Ã\èş»f\ÈÄ«\"«\Õÿ\0§!¸±±[\ì^.w\nô.I\"°wò4ñ\êò{±µºÜ‹…\Â\áp¸á¡;\ïô öa†}ı{\é\éz3\å\ËO}˜•ˆ *²ÿ\0?ø\å\nÿ\0:ñ«Á\á8›*2ñ¯œw-\r‹x¼\\—22|ö`ƒ\Ø?²Kz¾¡.6µ\Ïùÿ\0:¨M:ñ\Ó\Æ[@ú\\>=G~xŸı\Ó\rR\àS‡F.\ïc½œf\ÌCj\Ş/\Ëk`Ğ“\'Ñ†?\0ÿ\0¯±gfz\0k*\ÖW­\ÆÁªU-]š\\˜V\à\ÛzŞ¶!¦¦¥ª9õò|}\×[’·…‚\È\è\é\ßû\ëı½÷\ßs²+[ƒQ¦\Ôz§\rMô\Øt¹N\Ì.W\r¦©–\Ù\Èq˜\èr¬k…\âÁdbÑ‘—ñóóÿ\0\Å\Ür¤E†Vkz\í®\ê\î¢\ç™T\åQ‚\Ø96KE’\ÈÌ[We/Kl\é\ÜS ·\î…±£Æù0û\ï¿Fõõ\ß¾Ü¬a5\Å+jÚ–ª\ËñmÁ¨\Õ}²\Édp±—¥\É\İa\"i²­—Ë¥¡\ãF\ä\Îûü]u;ô\'\Ğ=v\Ê¢\êIV7T\ëj^¬¶—7Ø¯*\É/{6EÉ«3%-È«mƒ“N^K^lk¿Lm6¶{ \ÂÁŒ£Fpı{y´}—2\Õmw›\í_(\Øó>ÿ\0sÈµ\\„ó}\Âó¹\äzY›\Í8\Ç(\ä[\Ñ\ä|şS©\æ¼øù7ÿ\0H\Öòwòşˆœÿ\0;yÿ\0¡!è¹–£x™™§’m\Ó\È\ç\Ézf»M\×$ÿ\0•\í6œ\Ïe°\×òı\Ûv\Ü\í¹\Í\Ïe·np¼\ç[»²\Ë9®§=S\×}Í¤\æ³\Æs\Ê\Ó\ÆSšßlü`¹Ó‚+\Ï-?g8œ\'o\ä}\Ş,òñX\ä<[k§\ã¼_O|\Ç\âXœ3\È§Â·\Ç\Ù	\ãıõv[å“Xñ\ï\Î\Ãqu´p|ü>7”–s½¶şA\Ùpób\×\Ã5ü?\ÊO\Ö\ÜNjğ\Ôo\Ö\Ösi\ãS\åY\ã9\ÍÃ«·‹¦d\ávÿ\0\Ïò»ø\Ösx*Y‹<…<i•ùü_96\rv¯\Èãƒ·\\Ñ¼T¸¶‹|¨R\Ç\å\Zmgk\â­Yò€ñsówõº†·\ã	F»DQ8Yò-Ä¾w\Zm-VNı±\Ú\×\ä=.ƒ“î·>\ÓóY\Çôy\Ø>/MŒ\Ç\Şcr?+W\ãQ\Î_«\â:šW\ÈÇ‹×‘\Å\ã|nZ9%|«œf^G5®¾§FFòqÂ¯WF«˜j3p\è\æ™Vğ=“µøµó½>Y8ù95Ÿ\ÉM\Äñy‡\Å\ßp¬Í.\Ò\å\ÏÁ\rvÃ†\áñgÅ·Œkõ[7 n$8u|G?G…\Ç2¸®.œ\ë_…\æ\èpø\Û&o\×\ê²\èn$xšq<­Gøˆ\á\ØZ:V\×Ç·k©N€¯e\ë²\Ò/\×h+\Ç\Úa/\ÎÀN+n3q_ñq\Æs5Xšœoñœ<x\ÕIj÷ß®\à–ø\ëö \Æ\n\Åd\Ç]\Ã¦òXu\ì\Ãø0û?£\é§\Ö)ü\Úø\ï±\ï¹ó;`ßÀúx±mY¬\ï³\ï¾û0\Ãş§,ÿ\Ä\0:\0\0\0\0\0!1 \"A0@%2BQ#$3CRTaqP&4b‘ÿ\Ú\0?\0ñcóS)2D‰*>\è^ÿ\0\'“ƒg©ùy8B‹“[·5´\Ä\Ã;ıRò¨yP-\"@‰Se\Z„g\Ê\'“ƒg©ù¸1	³­¨<‰m1¹\ß\êœ\Êr]\Ë*I¹OaJ“j‹ê—•ò”MB³É¨K¹q/\Ä\"$DMs\æ\Õ\àšiH§]r\Ä\Ìyr\Ì#ƒ—\ä\ì=\È\Ûm	¡\Ê\å\È\ìpprüxúE\áŸ‚o%Zm¤\ËıFX‹ŞŠ˜R­\é-)ò\âY\Ò\ãa/h•ı‰$HŒ{¢…^\èƒËŠ*Û¾&“b’Ï—“ËœÁ\êF b.9§“ğ\à\åù\'¤ÿ\0ğ¶³Od³\"\ëQ“X%ºh»\\\n¢ğ\Ç\ÊRö%\Ô\\\Å&)v1\ä\à\ä\áxö8F\Æ,UjmC\Ûb,\îs\â„\ÌùqóÕ	C>¦]\ê—.sy‰B\Ù\'·’8\ÂFGOï•5°v’\êDsi6pŸ•\î=(\Ë9;\npRY%Z±Šq\àJ$\Î\ç&o&_“?:=²Fœ\\²KU\Ô\ŞP­£x\îCƒŸzd¨T\Ü*Há¯#/Ã“ƒ“°£\ÍóqLs¨†¡j98ñ\äI-\ë,\Å/K]ÔM(\ä\Æ>^< \Ú9\íbq9ğ\ÆL¿N<8\Z£1Õ¸’fg¡Fš0Œ·\á\ß\Å$sôs‹$’L…”ª<\ç\Ç(\ÃğX3\à\Æ1ø?&P\Û\Ê–œSFŸG„c…3uô†¶ğb\'åœœyp#Ÿ O\Ø\ÃÁS§˜²­÷2\ÑË¸NŠb…\çR¬²¢\ÃcF|yB\Â0™øù:—­‰$a3–rpwòm_!|¯\Âm¼Š7Z1\á¼€\â/\Ô_©÷#…\ÉÔ„\×q3>\rcóu \ÉZT!ZšCŒ›‡(\á\n$)§È«7\Ç9\îRñ\ÆN\â3‘#>	£/\Ç|\Ë^“môE+F\'À°\É,\àœI\"I•QV8&±–nk“(R¼ü\í–\äJ•EÎ¥4üyGØ²Qm&N¬\Î\"ğ(\Ä\å™\É\Ü\îsá¿¤N¤\rÕ¡Q¡\Ó=2°7†rğ‰AòF)pRe6:\\ğBi,ŠHr~8ò¿9ª\Ë\ØRŠ¢\Î\Í\ÒG(\ÄEN”Î­y©V<\rB<^<³¹Ï†\æ$%ô~©\n­„\ê{¡«¥Mö9HB2˜ò$»O(«©9({›°›#4„\Ä\Ä.|ñ©MÁ’³«½\n\â,\Û#,\ÄF©O«Y‘R‹Á\ZpH\Â;\Î\çx¿£\ÍD\ÅR„¢t.ù\ãi\Z\Öğ~òñ~\"\Äó„s\Ø\äQ‰+iğGlSd\'E$\Ç\"—›3GRŸÊª-\à\Í8´cb9R’*\ÎMpA¨ŠIœœy²?¢÷7\'}š\áI~qÎ„S„È˜˜†3>.)›\ÙR“X&\å&9A‘©4gÇ‡s¨œX\ì\îVµ¼†e\nYDa–‘(\Ï\ÆRğ\à\ä\ãÍŸšşC¸¤\ê%\Ø\ÛQ\ÓlN\"LFLø¼\r&<È”rÍ&ˆJQhtâ©S|’¸¬ÿ\0C±ÁÁ\Ëò®ºBt£OÃƒ	Š\rJ‰£4\âpr\Î\Ë1Ÿ¢_!t¥;:\îHr‚\ä\ç\Ã>	ˆXºd\\{vR*\ÛIdŒ¢²9Àõå…ƒ†wòpn½Á›µğŒ\ã¥~°\Ú1Á\Ã9g\ä\Ç\Ñ?6<r÷‰­­›^E\åF\äeö]ŒwDw‚\\Š¦ƒ“ƒƒ—\ã\ê1~Ñ±\ÒI§†Tº¦“1\'‘Bœ\Ù×¹\ÂTM¨\á\ÎóôkÍ“\'$jAä•½\\Jiø±øHr\"A¡s‚NL©s\åŠ(\äXÈ¹\ä\êC=\È*rõ\ê3„\ÊQ\r\í´bŞ¡×ºyQğ\á\Î\ç?YÀ\ê>ªöd\ÄüVY®\ã‹\à»E\ë5)È¹œ}eœÄ ò¶‘)“‡¾|jrşqªKùÆ¢ÿ\09¨¿\ÎU˜«/\Ìe˜\'gYºlw\Ô&¦7Fht\îdsN+\îw;˜\Ï\Ö&ºgAõ#\âıD“\ä”\ê4™²9d\É>\ç\èŠË±[úJ\Ïò“]\ÙÜ‘&CúHI\ï¸ÿ\0\ì!0(\ÊNb­	\í\àR‹GJM¢P”Sfø.Eƒ¹\Ü\îc?[Ÿ	{È¿D³\ê\îeyb¿0—\æü¢ş’(O±9~R§\è/i=˜Ÿ°Ÿ±\'\îM®\å\ä\ä½\éEe`\ß8·ÁÒ˜šK&\è¦p\ÎYÀ\Óú‡\åLD¿BM>[; ÿ\0BO´MR\È5Iÿ\0 \Ô\×\ä5÷‰<¦2Aó\Ö)¯\ç0\ï#L‡±^ÅŠü¦š¿’i«ù%›\íÂ°*‰\äŠ\Ï\Ép7ƒ0G,\îr\Ì\ä\Ï\Ö?,&BE™di¹ü™z\nk	\"\ìGk\àyxE“#4Œ£>E\â¸Q¾$œ‹Y’\ä\Ê8gs¿‹úù\"H¦S2ÿ\0ø\ã\Çr7d\\œ¸šY39órv\ä)ÀR\ËÁÑ\æ\ãÉ˜£¹\Ü\ï\ä_ôX~DoG–Y:BœPšù£ƒu6N5\é\Íe‘©M\Î\çúvs\à\Ó8‘1wH©Aÿ\0ƒw¹Ÿ+‡aT¤\ÛH\èO¸¥“(\îwù\Ï\ÈşNÁCŠ“!\Ş3#.\'2?’d¢ÿ\0i\"2ü#¹o™\Ål‘Aö\îT_\n_ƒ§ø9!6ª@§\Ò\îT‹U$·1Ô¦ª\Ç\Ñ\"r\â]ˆSYƒ\Ë?eÓ‡qB—¯–$ò(®QFªo² (¬³ü\àtùŒòS—\ã\Ò\ìFl–\äF¼0\ÅO”t$“e)E\ç\ØQ\Î6\Ìûh¯ª2Á	=³™7%\êôQ]9e•&ÿ\0fø#\ï<³w¹gY¶ı%5\ìC\Ú%xvyDgüW‚0şr\\O¼pT§\ér?Sdû\à\ß\Ãòú\Ò:yF™c]Ñº¨÷¢\×V¡\Z¶\Òô²\ËFŒeu/K,uYl´Y¥\éõ%Jê§©\Z²nÖ§b\ÃI’W“\ÆK-Zœ\åk<¨š*¨é«†¤Bşœ*Æ¯¢C”\r+h–\"\Ë-J\á\Û\Ú\×\ä\Óô\ë\ÉZ\ÜW{\ÑCP¨\êQ¯¾û,Ä«\ì§\Êu•²º{™-.„.«\Üz$-Y\É\Ú\\giF\Ê\âV÷W/z4·\Ş\ášW÷L¥ªP©skqû8\ZU:Ò¡\×{‘£·ÿ\0\Éf‘RJ*\á\å”ô\Ú1¸¯S\Ğ\Í\nO¯&.\Ã4úóŠ§s–\ÊwI\r±Ô„²-:Sœ\Ş\Ø#M‡\n\éšo÷l·¾qP¯¹²›†\æi\Ö9\ßsµš&í®»4›\é*võö¶Zi´~\Ñ^Y‰£^V´*z™c¥PûMiú\r\î¬m­\êz¤Yi\Õ{¹ñ#O½²©{NY§BÌ©:4|;\ïYšY(Â·,´\Ó ª\\\ËgÃ“xu\Z>ƒÂ¬\ËM\'os–R…)Vœ³ƒ\áø\Õt\'?R(\Ş\ÒU!\Ì\ë~^OK>ú\Ô\Ù÷5¹û½‘÷Œú\Õú~Ì¯¤\Ü\ÂTûº‡\Ø\åFY\ÊhjG\ï³\Ç\ê}Õ§B¡%;\íŸ{\Õÿ\0G\ß÷§ün¡\É\âœû‘¬\á¥SS\îb\â‰÷F˜~ñ}š\å\î¥ysB‰2óN¹«os³F¥«\Û*–°\ÌQ_H\Óo\é\ÖXrC•i\ã¾Oˆ«Ò…zV\ÜL\×\éÖ§)\Ûf#†ƒ¾$‰_\Ş\Ú\Û\Å\áÌ¼¥MJ5Ô™_O®©7\ÌI\İY/VgLu#‰ÁŸ¸^´*“§\rør\'…›•’\çN\Ô7~\\Y\è0¼\Äi\Z–©x\Ş\íÓ‘¬ÎŸ^SP™w§\×T+®œ \ê‡\îl\ê½\Õ N\Êóô”3N§	eUY½\Å)¼¡¦¨K<dÿ\0Ú—Cj‰wl\×j(T…/C5\êP©:Š³±‰Jò•¢–\×\"úõ¤®“P.l.\éU¡[b\Ç^‡?™¥©T\Ï\êtô«,¹?/\'¥Ÿ}j?\ìûš\Üı\Ú\Äû\Æcz\íò‰\Òi\Édœ±¹\ä}-Lıö\ì\é\é6\r‘”f˜=1¿ÕŸ{\Õÿ\0G\ß÷¤©\ÉU\ÆZê¤œ\ê†.(ÿ\0³\î0-Sd7“zs­·–I|EuN_…`İ§5\îS£iQAwLõ\\µ\İ3\ã—gJt*½·&§F\ÅGSõ\Ö\ÒdŒk¶Q-9ú¹D¹v¡\Ê\É,_\n”™˜³:uó*\Å\Óp—1>)’‚…FjZ½\ä#(6\ÑV†mF=¢Q†µi*¯òQ8\ÍòQ¡MR\âDº÷Iv#eª\\\Î<BeJÔ¡JO;IER“X\É:¹SyÀ\èü)VMcrc\ëM.ù?ò§JTn^\Ïöj4,\é»ùo¬f\Î\ÆE{šW4$ˆn!:Sº\Æ\â\êµk{ûÊ¸£!GÒ»r\Ô&\ãqP±²‚]‘øŸ•¹¦u)\á©\Ü\Îşœs	š–‡A\ĞTº\Ğf§¯UŒªCöh­f§{^8r*-Q”Wv[jÿ\0\rÓ…X\âªl¯mq:5£\Ó\ÚEPÔœ^\ãm\ÕISg\ÄT(Æ§#\â~½T»s„ˆ\Ê\ßKx\Üù?R\Æ8d©k—µ\ZÊ‘O\áU\'O©6t¬5\rB­<M\'«¸*‹#zF˜\Ú\àó\Ü`¨ôº*#¿Zmg87i³KF­\ë\'c¥^¶e‡“\â*QP…\ÃPG\ÄnpNá·\Ãô*Ï™p\\X\\Ò¾¡\\OˆjÓ”`¶&^jö\æl–g\Î8›Ed§£\\Á,²­C\ÔZÜ¨¥±şP’Ib\'\ÛmjRH»\Ó.¹¡Òš5úU>¯R£«WR©šÕ¤OKµ\ëÕ§šó*V¡F\â+”:—h¸†™R”p\é£\í7”©Ïƒ\ìú\èöj\"…jŸAF1ºi#\â	T§t\Ê\ËJÓ¥.[(\Ü\ê–4\ê\Ãt$ÊšT•kfİšİ(Ó¡r\ã\\j\Zb¹­-ó5\ê:Œ\í¨\Ô\ÌZ\ê\ÂÖ¬ÿ\0:Iù}\Íü®¢·q/\Ğ\Òn*)Ôµ\Ì\Í*\ÍF*‡…:\n)z\Í*ò´\ëU´\İ9,\èÊ\n *\åÎ½{N¬¤X\éJv¶\İ3BªÜ¥aÉ >>\Âh\ĞÙ‹M­wû:ô÷\ÆŸg[}®Æ2ê»«ui¾lt(N)l‚#(B…*X§#GNu§c\ëE–¡iB•{mĞ‰¦\ÙW\ßBNH¹v\îœ;#Lº»u.\íwÍ–Z|eNÒ†\Ô\ÅUF3†S4)¸\ÊvlĞ¿°4,¦¬9,\ëĞ½\Í\rÔ¢hr†ac˜š?‡aÁaf³ok¶DaG	`q §¨ª”ªG|¢SnP°\Ú\ÑR\ßrŒ¶O\"©2\Îò7V\İsE”›V˜4\Û	)Sµ\Ú\È\Ñj´*r[\ŞQ:\Ô2™ Q­\n\Ë(\\Ó«F\âø£B¡8×&B½)QK46\çeÉ¡d4Õ’\Éc}J\Ëmğ¢Q«J½½®\ÙD\ëSt\ëS\ßEšÛ’²M,©ô(\Ó\é@øª\ëÔ¶\Ä\ÙF\ÎÚ…:q\Â6\Å\Ô_!x¡|\Å\à\Çó6±!?§{^\rc«\ê\\Øºÿ\0\è_•¨¬\ä³m\äÿ\Ä\0\"\0\0\0\0\0\0\0\0\0 0ÿ\Ú\0\0B´ÁN\à \î;CXñbú˜f8¢dX\ì\"ÁZ@	¸ ƒ\Ñ`‹Z@\0\èA*}ZğF\0À?E\èp \ìAĞ‚<P£\Ğõˆ¾¡@@\0Öºv&´ ‹±VTlcJ\ÓNb,l¦\Íûÿ\0|gŒõ\È\Ì+)ƒ\ÔK%]‚X‚a«œ‚±bö±}tø)‚\"(©†k»<\å—ó\×Fª¶Õ“S\äc\è%’®\Ä0\Ùe‹1–óq®,^\ÖQşHS±\Æ\ÅD»:Æµ5\âSm7_N‚ôÑPÁbc\Ê„É–D‹M\"•ôC®\âÅ‚\"\Î;\Ù	ef\Ä``ƒ½k¤+|{/­OM\ZU4&b¢·x‘B\0­Jú!‡\İbÁJ±ª®d\Ú•“ ‚\Ä©Ù¬^¬‚„\Ó1\Å¦]”¬QXõMhúWB|<~Y\Ú\rF40Aˆ¡d³©\êÈ°t:°‰†d>A@Š¡B\í¿Mh\Ã7¹QE²…\Ï[))¤aĞ‚„A<@-E—Rñ¢\í.Vb2İ¢Å•\Ê\×p@:0Ä†!$˜}*Š¨âœ•ş/CR¡A:AAòò\Ğ5Ù”†V:2\æb“’\Â,X±lR ô0\ÄFJ¦¡n=²Ú»=\ËøŠ¬¨¡I°AD ÀA©\åµR!†[¦œj\î—\"\ÊÆ–@z„a\ìJW¢\Üsge6 P¶I¥ªd‚\n•†4A*{\ë\0“¶T˜\É.²\Â ‹+jn{¦{ABõ®$ò\0\Äe²·Gİ€ÄŸ\Î\Ú,A7´)x¡{¥®¨-&b*‡—\ØLP¡bö ¡†a5Å©f\àq\ä@G­ÿ\0­nQ+XÉ‘E•ô…\n\Ç\0\Õ\êk•%‘f\"\ë\"\Ë\"(X±{C Ád˜aj@\ĞªX\Z\n•`\ëbÚ·«±…øö\ÔP‚‚<¤º\í\â\Ì8\Ç%±`ˆª½9C\å\åĞƒ²fµXĞƒµb6bM‚P\Ê\ÔD2ku¬T¶\ÂDX;“¯S`³ Ø‚,X±\nœ©òòC\éPĞƒ\ĞL;3’oZ\è\Èq\åd\Ë\Ñ\å\n%\ÄÁX\ã,ª”Œ‰aX°E‹~>>!@@}«!†\0qcVWZ\èÍ¡ ‹j±é·K‚\0;eƒ¦P2M±bÁ,øøøø\ê}T¨@\ĞA0(\r1\"¾\È3ZHŒ^·B\à\Z,_\\`\Ã4	eV,E‹Ø€˜zÑ‡­\ïjU‘‰C\Ô2¦²Z‘­M‘\\¬™`–\"\Åô\Z& y”v±`‚,_BI=˜a„ôj›ba\ë]QeÀ©\èAõ1x\Ö\àò1:\Ó\áü[°—aıo¬1—R\ä¹0ãŒ¨bJûX }1\Ş\Ì>««+nµ+f\0„!“\Õ\Ìc7ã¹­MkP\Âw“1¬Gº»«X§¥‚\ìG;Ù‡\Ûj\ÊÀˆ\0õj²}w½\ï~[ß÷³6e5%]FB°H ƒ¡/[’Nÿ\0\È•\Ö\Íw­M\è\nüü÷¿³ö¾\Ï\Ù9\r’y\ĞûŸg\ì}ƒgôk©ñ\ÆZ¸X ‚È¬¿òv\0\ïZ\ëZEf\ëı\æòLSIChµ\"•\ì@8N#\äLˆ¥JÁ\ÔA\ØöMM\ï\Ó^£¥	$\Â&¥E\ábö \ZN+™“_‚\Å\",\Ş\ÇBÇ°‚\Ã\ÃZzñ0\Íh$t¾²µÁĞ€\ÊÀŠ\r\r¶õ°‹Øƒ½ú \0h(\0­;üLÖ´D,L†«Ğ‚	¢3±¾¶…ƒ\Ğv\ìA\0\0\0<`kB	¿ø\nÊ«\à\Ë\àF¢\Ãñ\ÔñS\äT(Q\r\â)²’µœ{.„j¹¯ ¨Œ\0ÀCZ!‹_„\ŞÃƒĞ‚´ñx8˜f7›\Çcq\Ù<jp™Ô \ÃÁ\Ê\â±8œü<_\Å\Æ\ã2x¬nñ“\Ç~?\âğ×‡\Ë\ãm\ÅV˜ô~/\â\åñ‚Œn9x,\Î;¸¬\\[8\Ì,LŒ/\Æ+ğø¸\í\Ã#%|U\ÕW\ê&\âg\È\'\Å\ç\È\'y,n\äCsqO\Å\ç?8\Ë\âp8L8IòEÀä«·;;”\Ê\ÎV\î_ƒ™W§6ƒœ\Åó–Xy¿|J«¾-¹ª£ˆÄº¾”UŸ§)ñ¡›jsYJŒy6›\ßBa\Î\"|‚|^|†p\á\Ç\É&4\æWø|fsóˆ…´ÓƒŸ#_>\n|…\èˆù6rã“–	8…ù)\Û\Î\Z‡™™Á\ÎJ:üu¾GWyJ\riŸi6]œ~4o¦¼şAŸ+9œ\ï}< ğY™v;•\ÆL\ì\Ük¹±K_~\Ç\ä+\ÄK²9,Ë9\Èÿ\0 \ÄÁ| dc\×Â³ó,\Z|t\åµù\'ŠÊ¥\ì\á\ëNo3·&\Ş\'.\é]ª\á|trVñY\ïƒ\ËS\Ä\å\'°5e\×\Ë_\ÊŒ~Büº¹r‡1ú\é\É\ãg[\ÈQ\É]–r%FSfŠS+2\â[8ò‡“ªÿ\0¼yól§!¹+l±r—–·=š‹_‘£!ùsŸú\'‘ªûó\ß>\×¯cˆƒ½ï­÷³V\ŞmkX…½‡~V ÷X \"o~¢4uöMz‚;ğğh‘Y¬ò•ŸPh^{\Ô\0z¬ş>?ÿ\Ä\04\0\0\0\0\0\0! 01@\"A$#2BPQRSb%3CDaÿ\Ú\0?\0\é!B‹’\Ñ;™ş±¿‚l“$2D‹\r|q^\Ùdw3\å¦\\EŠ’}‰»\\£OACøS‘JD%”T¤ğ‰.µ‹>^m„Jc–YJš#K«/’³ù$\Æø¡_%EòN/,¥YdQ\ìYô\ìX¹w\ÃkvH•K2™\\r\ÄG$;õ6ŠG©”4_¨\Ø\Òó½Gvˆ\é\ãb¤\ÛÈ—spºw\à\â\Å$m\ÏR\ìV,¼Æ‘\'!ii\äu&\İü+XUQ³§vYP®ú(^\nH[»ÛŸü6Š¢\éİ–HÁw\å¦Ë¡¶6†?\n\Å\ÕÍœ¹BQ\ã“w\ÃWŒ\Ó0\'\".\"\àüm7«sdöòY\r\Ü\Ï\rxù=¥¤{D\Ëğc\Ç\Õô\ÅU\r2Ü·cf\Ó3\'´jCHlLBˆ‹ª\äl°[—(Vò²c1È„\\c.†4[“\rİ‹rd²P¼›\ã‚\Ò\å|S„\ÅbÏz,RE¹lŒ1¶?sY£u3lŸ.x¡7!»3\Â\Üö/lŸ	£¹g\ÓBğ¬o…™i>™¾(I2Í™\áe\ÎÑº§\Æ\Ãv.‹¿>Ò±¾7]˜\á~¹‘$w\êd\ì+}?lĞ§ƒá¦\\R\à‹.92`\ÇI\Ã|2YXeº\å·&y½¦Yf`\Édc91\à.t.hR‰‹|–\ä\Ï.Q\ì=\ÆLe—ócÁ\ÏKá›¹\\†\ÅF­®h!N÷4ô\æ\ÔF2\å\Ä\Ä\"$H‘ […\Ñf%bë…ŸYu¹ö—B\åHrJ-6Q”›bc\"D‰q¹fdºLIù/¢ø\"\Í\"D‰\Æ!!!ı\È»,ø]¿ğ²%\ÅŒH„„!±²D‰ÿ\0rd†\ËpMø™&Lc\ë_†‡‰$y®.§cr\ág\âÜ¿?4g§f&Œ\ÇÛƒb—NÏ†\äwğ_V\å\âŸ\êÁ³ôd±qOõ\à\Úı¹\"û&òP.Xr\ZB\Ø.l/ûÿ\0i|ÿ\0\Äÿ\0ˆ\âF¡U•P“7–Güş%»‘’*q#{71ZÈ©¢&É¢²%>\ì•>Ì­!üù|/Ì¤:©I#ğ\î\Ã\Ö;@z\\\Í²Ü–-3WC\Õÿ\0\ÛCÒ´ª|•T¬F‹qe˜µ=\èe¢Uól‡øgk\\” \å´õª8¤z=\Ñ:\ÙH×¯\Ø}C\æ£Q&‰Ô‚iP_°ú‚M¸Ÿˆ“‚YET®bø5Q½\Ñ$Hô‡_,\×ÿ\0¯ÿ\0t»Ä’m\ZªZ75rW±R‡\í¹*®Ö±:T\Ü\ìJµG‰Ò¦\ä\Ñ*õ\ZH\ÔÆªƒ5š‘­f¶)³S©–\ÔkÒº5ÿ\0&«M\İ£H­Q\\\Ø\ìûó`÷ğ´º™ù\Ó?%‰h´\ìZ¨\Í$KMN¢‘º¶œûzg\çjµ ûi‹ú}Õ¤\ÒY%\nRB\É÷š±Æ6Št¨Ó‹y¢œ$™\r5HE²:ºô\\E\n*•««Xú~Æ©	\ê¦\ÅOO)aNj-µ\îzsx²-õ{A\n”fš³‰ø¨:`}|©ü\ÓÓ¹FGªòJ\ã\Ó\ëw\ÚÈJÿ\0\è\éÕ«t)B¤G	Vmú„\ZQlúu\Ú]\Í.\Ù$o¯Pôh\Éÿ\0aW¨£¶Æš½\ßrJqE\á	\ê\ä{ùp{´ }\Ô\ÏÎ‘ù,Sú}(\Îqb³°¡SL}½1ºõ\ÒCQX-SP}´\Ïúu3{Y\n9\ìwg\Şj\Å-Y-\ÑEôl“\Õ$†ªRl\İJÏ£É¿V94?úøEõ-2\Új…ª`›¥)\"ñ?Q÷´8½\ï\Ò%;Ï¹KKNºu	ª3±U\Õd½²>’¨»›\èA24\ê\ÆÂœ\æˆÓ…F\ßQˆ½(·\ØúÜ£”Ÿ¥\Ø\Û^B­F[§\Ó[\ÔrP¥ºBR‹)útòn\ÕIõÌ“D?NL¡©›“e\r\nn\äjKlYMh)$ò::úm?iJ¤orqw¹	B)À\Ò\ÕË¦£N­ (T«\ì)½<R‰Iı>0q/ª%\Ë]T!\ì)=+W!\rT\Ûe9QvbUYMib› µ)¦^¥&\Í<\é\ÒNF\åÒ¹ôôŸ\ä”Ö¾«xFš¶pr\îh\ã$÷\\¡¤…“ª¦;`^-\n.\ÊQ \í\"¤*\ÊÌ›N\ä©URf—Un4®m\Ü\Ó\é!†z³\Û‚•›):m\Üõ*I6P\Ø\Ş\áOT›(OOÙ ÿ\0I \Û/\É\'\rmgğN\Z:©2\Ö\É<šI·&Q…u„iQ\ÌJm\"Ëš\Ä\è5µ•\ÒV™^j\ÎC›÷2¥(\ìİV–ö\îÊ´°¤N»¼¤TI%T\Ô?üÆ¢®ô\ë\\t7¸Ô±WP¶Ê­\Ê\ÔV\ÅW«\İû\Çk7\î+Jw“„Ü“+V‹NW$ç¸­§§§bu\ç.\âŒ`Ñ©R‚R5\ß\ì5İ½Bpn¤]›5oØ¦k\"×¼¯YfC\î\Ç,À\è\å;¥‡2/$MEu+\Z–\í¸\ÔTÃ˜\åÜ\'x²½¬\ä:/t]DÕ·’’5\n))\Z\ïö\Z\çP\Õ\é\ææ›5•£±\Ë©§ši\Ø\ÕmOyWU/Q³V£\é)\àr–OoŠ\Ç\Å!ø\\¢ˆø\ìcğ×‡2Gÿ\Ù');
/*!40000 ALTER TABLE `osoba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plata`
--

DROP TABLE IF EXISTS `plata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plata` (
  `TRANSAKCIJA_Id` int(11) NOT NULL,
  `ZAPOSLENI_OSOBA_Id` int(11) NOT NULL,
  PRIMARY KEY (`TRANSAKCIJA_Id`),
  KEY `fk_PLATA_ZAPOSLENI1_idx` (`ZAPOSLENI_OSOBA_Id`),
  CONSTRAINT `fk_PLATA_TRANSAKCIJA1` FOREIGN KEY (`TRANSAKCIJA_Id`) REFERENCES `transakcija` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLATA_ZAPOSLENI1` FOREIGN KEY (`ZAPOSLENI_OSOBA_Id`) REFERENCES `zaposleni` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plata`
--

LOCK TABLES `plata` WRITE;
/*!40000 ALTER TABLE `plata` DISABLE KEYS */;
/*!40000 ALTER TABLE `plata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potvrda`
--

DROP TABLE IF EXISTS `potvrda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `potvrda` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CLAN_OSOBA_Id` int(11) NOT NULL,
  `POTVRDA_TIP_Id` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Tekst` longblob NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_CLAN_has_POTVRDA_TIP_POTVRDA_TIP1_idx` (`POTVRDA_TIP_Id`),
  KEY `fk_CLAN_has_POTVRDA_TIP_CLAN1_idx` (`CLAN_OSOBA_Id`),
  CONSTRAINT `fk_CLAN_has_POTVRDA_TIP_CLAN1` FOREIGN KEY (`CLAN_OSOBA_Id`) REFERENCES `clan` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLAN_has_POTVRDA_TIP_POTVRDA_TIP1` FOREIGN KEY (`POTVRDA_TIP_Id`) REFERENCES `potvrda_tip` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potvrda`
--

LOCK TABLES `potvrda` WRITE;
/*!40000 ALTER TABLE `potvrda` DISABLE KEYS */;
/*!40000 ALTER TABLE `potvrda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potvrda_tip`
--

DROP TABLE IF EXISTS `potvrda_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `potvrda_tip` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tip` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potvrda_tip`
--

LOCK TABLES `potvrda_tip` WRITE;
/*!40000 ALTER TABLE `potvrda_tip` DISABLE KEYS */;
/*!40000 ALTER TABLE `potvrda_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prikaz_clana`
--

DROP TABLE IF EXISTS `prikaz_clana`;
/*!50001 DROP VIEW IF EXISTS `prikaz_clana`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prikaz_clana` AS SELECT 
 1 AS `Id`,
 1 AS `JMB`,
 1 AS `Ime`,
 1 AS `ImeRoditelja`,
 1 AS `Prezime`,
 1 AS `Pol`,
 1 AS `DatumRodjenja`,
 1 AS `Fotografija`,
 1 AS `Aktivan`,
 1 AS `Registrovan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prikaz_clanarina`
--

DROP TABLE IF EXISTS `prikaz_clanarina`;
/*!50001 DROP VIEW IF EXISTS `prikaz_clanarina`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prikaz_clanarina` AS SELECT 
 1 AS `id`,
 1 AS `ime`,
 1 AS `prezime`,
 1 AS `mjesec`,
 1 AS `godina`,
 1 AS `datum`,
 1 AS `iznos`,
 1 AS `opis`,
 1 AS `Tip`,
 1 AS `OSOBA_Id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prikaz_opreme_clana`
--

DROP TABLE IF EXISTS `prikaz_opreme_clana`;
/*!50001 DROP VIEW IF EXISTS `prikaz_opreme_clana`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prikaz_opreme_clana` AS SELECT 
 1 AS `Id`,
 1 AS `OPREMA_TIP_Id`,
 1 AS `Obrisan`,
 1 AS `Tip`,
 1 AS `Proizvodjac`,
 1 AS `Model`,
 1 AS `NARUDZBA_Id`,
 1 AS `Velicina`,
 1 AS `CLAN_Id`,
 1 AS `JMB`,
 1 AS `Ime`,
 1 AS `Prezime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prikaz_opreme_kluba`
--

DROP TABLE IF EXISTS `prikaz_opreme_kluba`;
/*!50001 DROP VIEW IF EXISTS `prikaz_opreme_kluba`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prikaz_opreme_kluba` AS SELECT 
 1 AS `Id`,
 1 AS `Donirana`,
 1 AS `OPREMA_TIP_Id`,
 1 AS `Obrisan`,
 1 AS `Tip`,
 1 AS `Proizvodjac`,
 1 AS `Model`,
 1 AS `NARUDZBA_Id`,
 1 AS `DONACIJA_SPONZOR_Id`,
 1 AS `DONACIJA_UGOVOR_RedniBroj`,
 1 AS `DONACIJA_RedniBroj`,
 1 AS `Velicina`,
 1 AS `Opis`,
 1 AS `Aktivan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prikaz_plata`
--

DROP TABLE IF EXISTS `prikaz_plata`;
/*!50001 DROP VIEW IF EXISTS `prikaz_plata`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prikaz_plata` AS SELECT 
 1 AS `OSOBA_Id`,
 1 AS `Ime`,
 1 AS `Prezime`,
 1 AS `ImeRoditelja`,
 1 AS `JMB`,
 1 AS `Pol`,
 1 AS `DatumRodjenja`,
 1 AS `Fotografija`,
 1 AS `Aktivan`,
 1 AS `Iznos`,
 1 AS `Datum`,
 1 AS `Opis`,
 1 AS `Id`,
 1 AS `Tip`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prikaz_transakcija`
--

DROP TABLE IF EXISTS `prikaz_transakcija`;
/*!50001 DROP VIEW IF EXISTS `prikaz_transakcija`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prikaz_transakcija` AS SELECT 
 1 AS `Id`,
 1 AS `Datum`,
 1 AS `Iznos`,
 1 AS `Opis`,
 1 AS `jeUplata`,
 1 AS `Tip`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prikaz_troskovi_oprema`
--

DROP TABLE IF EXISTS `prikaz_troskovi_oprema`;
/*!50001 DROP VIEW IF EXISTS `prikaz_troskovi_oprema`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prikaz_troskovi_oprema` AS SELECT 
 1 AS `Id`,
 1 AS `DISTRIBUTER_OPREME_Id`,
 1 AS `TRANSAKCIJA_Id`,
 1 AS `Datum`,
 1 AS `Iznos`,
 1 AS `Opis`,
 1 AS `Tip`,
 1 AS `nDatum`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prikaz_troskovi_turnir`
--

DROP TABLE IF EXISTS `prikaz_troskovi_turnir`;
/*!50001 DROP VIEW IF EXISTS `prikaz_troskovi_turnir`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prikaz_troskovi_turnir` AS SELECT 
 1 AS `turnirId`,
 1 AS `Naziv`,
 1 AS `turnirDatum`,
 1 AS `Id`,
 1 AS `Datum`,
 1 AS `Iznos`,
 1 AS `Opis`,
 1 AS `Tip`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prikaz_uplata_turnir`
--

DROP TABLE IF EXISTS `prikaz_uplata_turnir`;
/*!50001 DROP VIEW IF EXISTS `prikaz_uplata_turnir`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `prikaz_uplata_turnir` AS SELECT 
 1 AS `Ime`,
 1 AS `Prezime`,
 1 AS `osobaId`,
 1 AS `iznos`,
 1 AS `datum`,
 1 AS `opis`,
 1 AS `Tip`,
 1 AS `prijavaId`,
 1 AS `transakcijaId`,
 1 AS `TURNIR_Id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `registracija`
--

DROP TABLE IF EXISTS `registracija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registracija` (
  `Sezona` char(9) NOT NULL,
  `Datum` date NOT NULL,
  `KATEGORIJA_Id` int(11) NOT NULL,
  `Plasman` int(11) DEFAULT NULL,
  `CLAN_Id` int(11) NOT NULL,
  `A` int(11) DEFAULT NULL,
  `A1` int(11) DEFAULT NULL,
  `B` int(11) DEFAULT NULL,
  `B1` int(11) DEFAULT NULL,
  `C` int(11) DEFAULT NULL,
  `C1` int(11) DEFAULT NULL,
  `D` int(11) DEFAULT NULL,
  `D1` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `E1` int(11) DEFAULT NULL,
  `F` int(11) DEFAULT NULL,
  `F1` int(11) DEFAULT NULL,
  `Kup` int(11) DEFAULT NULL,
  `Pr.Liga` int(11) DEFAULT NULL,
  `Play-off` int(11) DEFAULT NULL,
  `Ukupno` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sezona`,`KATEGORIJA_Id`,`CLAN_Id`),
  KEY `fk_REGISTRACIJA_KATEGORIJA1_idx` (`KATEGORIJA_Id`),
  KEY `fk_REGISTRACIJA_CLAN1_idx` (`CLAN_Id`),
  CONSTRAINT `fk_REGISTRACIJA_CLAN1` FOREIGN KEY (`CLAN_Id`) REFERENCES `clan` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTRACIJA_KATEGORIJA1` FOREIGN KEY (`KATEGORIJA_Id`) REFERENCES `kategorija` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registracija`
--

LOCK TABLES `registracija` WRITE;
/*!40000 ALTER TABLE `registracija` DISABLE KEYS */;
INSERT INTO `registracija` VALUES ('2017/2018','2017-09-09',1,45,27,0,0,0,0,0,0,5,20,0,0,0,0,0,NULL,NULL,25),('2017/2018','2017-09-01',1,NULL,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2017/2018','2017-09-11',7,3,24,30,90,45,105,20,90,30,180,0,0,0,0,0,NULL,NULL,590);
/*!40000 ALTER TABLE `registracija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runda`
--

DROP TABLE IF EXISTS `runda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runda` (
  `ZRIJEB_Id` int(11) NOT NULL,
  `Broj` int(11) NOT NULL,
  PRIMARY KEY (`ZRIJEB_Id`,`Broj`),
  CONSTRAINT `fk_RUNDA_ZRIJEB1` FOREIGN KEY (`ZRIJEB_Id`) REFERENCES `zrijeb` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runda`
--

LOCK TABLES `runda` WRITE;
/*!40000 ALTER TABLE `runda` DISABLE KEYS */;
/*!40000 ALTER TABLE `runda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skupstina`
--

DROP TABLE IF EXISTS `skupstina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skupstina` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skupstina`
--

LOCK TABLES `skupstina` WRITE;
/*!40000 ALTER TABLE `skupstina` DISABLE KEYS */;
INSERT INTO `skupstina` VALUES (3,'2018-02-01'),(4,'2018-01-23'),(5,'2018-03-08'),(6,'2018-04-01');
/*!40000 ALTER TABLE `skupstina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponzor`
--

DROP TABLE IF EXISTS `sponzor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponzor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  `Adresa` varchar(45) DEFAULT NULL,
  `Mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponzor`
--

LOCK TABLES `sponzor` WRITE;
/*!40000 ALTER TABLE `sponzor` DISABLE KEYS */;
INSERT INTO `sponzor` VALUES (5,'Malina Sport','Petra Kocica 25, 78000 Banjaluka, RS, BiH','info@malina.com'),(6,'Pekara Brada','Karadjordjeva 30, 78000 Banjaluka, RS, BiH','info@brada.com'),(7,'Knjizara Helena','Savska bb, Srbac, RS, BiH','info@helena.com'),(8,'Cvjecara Maja','Krfska bb, Kukulje, RS, BiH','info@maja.com'),(9,'Malina Sport','Petra Kocica 25, 78000 Banjaluka, RS, BiH','info@malina.com'),(10,'Pekara Brada','Karadjordjeva 30, 78000 Banjaluka, RS, BiH','info@brada.com'),(11,'Knjizara Helena','Savska bb, Srbac, RS, BiH','info@helena.com'),(12,'Cvjecara Maja','Krfska bb, Kukulje, RS, BiH','info@maja.com');
/*!40000 ALTER TABLE `sponzor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefon`
--

DROP TABLE IF EXISTS `telefon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefon` (
  `BrojTelefona` varchar(15) NOT NULL,
  `OSOBA_Id` int(11) DEFAULT NULL,
  `SPONZOR_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`BrojTelefona`),
  KEY `fk_TELEFON_OSOBA_idx` (`OSOBA_Id`),
  KEY `fk_TELEFON_SPONZOR1_idx` (`SPONZOR_Id`),
  CONSTRAINT `fk_TELEFON_OSOBA` FOREIGN KEY (`OSOBA_Id`) REFERENCES `osoba` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TELEFON_SPONZOR1` FOREIGN KEY (`SPONZOR_Id`) REFERENCES `sponzor` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefon`
--

LOCK TABLES `telefon` WRITE;
/*!40000 ALTER TABLE `telefon` DISABLE KEYS */;
INSERT INTO `telefon` VALUES ('065/111-111',29,NULL),('065/111-112',29,NULL),('065/222-111',30,NULL),('065/333-111',31,NULL),('065/333-112',31,NULL),('065/333-113',31,NULL),('066/555-333',23,NULL);
/*!40000 ALTER TABLE `telefon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tim`
--

DROP TABLE IF EXISTS `tim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tim` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UCESNIK1_PRIJAVA_Id` int(11) NOT NULL,
  `UCESNIK2_PRIJAVA_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_TIM_UCESNIK_PRIJAVA1_idx` (`UCESNIK1_PRIJAVA_Id`),
  KEY `fk_TIM_UCESNIK_PRIJAVA2_idx` (`UCESNIK2_PRIJAVA_Id`),
  CONSTRAINT `fk_TIM_UCESNIK_PRIJAVA1` FOREIGN KEY (`UCESNIK1_PRIJAVA_Id`) REFERENCES `ucesnik_prijava` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TIM_UCESNIK_PRIJAVA2` FOREIGN KEY (`UCESNIK2_PRIJAVA_Id`) REFERENCES `ucesnik_prijava` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tim`
--

LOCK TABLES `tim` WRITE;
/*!40000 ALTER TABLE `tim` DISABLE KEYS */;
INSERT INTO `tim` VALUES (1,1,NULL),(2,2,NULL);
/*!40000 ALTER TABLE `tim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip_transakcije`
--

DROP TABLE IF EXISTS `tip_transakcije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tip_transakcije` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tip` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_transakcije`
--

LOCK TABLES `tip_transakcije` WRITE;
/*!40000 ALTER TABLE `tip_transakcije` DISABLE KEYS */;
INSERT INTO `tip_transakcije` VALUES (1,'Clanarina');
/*!40000 ALTER TABLE `tip_transakcije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transakcija`
--

DROP TABLE IF EXISTS `transakcija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transakcija` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` date NOT NULL,
  `Iznos` decimal(8,2) NOT NULL,
  `Opis` varchar(100) DEFAULT NULL,
  `jeUplata` tinyint(4) NOT NULL,
  `TIP_TRANSAKCIJE_Id` int(11) NOT NULL,
  `Obrisan` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_TRANSAKCIJA_TIP_TRANSAKCIJE1_idx` (`TIP_TRANSAKCIJE_Id`),
  CONSTRAINT `fk_TRANSAKCIJA_TIP_TRANSAKCIJE1` FOREIGN KEY (`TIP_TRANSAKCIJE_Id`) REFERENCES `tip_transakcije` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transakcija`
--

LOCK TABLES `transakcija` WRITE;
/*!40000 ALTER TABLE `transakcija` DISABLE KEYS */;
INSERT INTO `transakcija` VALUES (1,'2017-03-03',20.00,'opisss',1,1,0),(2,'2017-03-03',20.00,'opisss',1,1,0),(3,'2017-03-03',20.00,'opisss',1,1,0),(4,'2017-03-03',20.00,'opisss',1,1,0),(5,'2017-03-03',20.00,'opisss',1,1,0),(6,'2017-03-03',20.00,'opisss',1,1,0),(7,'2017-03-03',20.00,'opisss',1,1,0),(8,'2017-03-03',20.00,'opisss',1,1,0);
/*!40000 ALTER TABLE `transakcija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trening`
--

DROP TABLE IF EXISTS `trening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trening` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` date NOT NULL,
  `Opis` varchar(250) DEFAULT NULL,
  `CLAN_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_TRENING_CLAN1_idx` (`CLAN_Id`),
  CONSTRAINT `fk_TRENING_CLAN1` FOREIGN KEY (`CLAN_Id`) REFERENCES `clan` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trening`
--

LOCK TABLES `trening` WRITE;
/*!40000 ALTER TABLE `trening` DISABLE KEYS */;
INSERT INTO `trening` VALUES (1,'2017-12-21','Trening je bio dobar, ali ja sam joÅ¡ bolji',23),(2,'2017-12-22','Test danaÅ¡nji datum\nok',23),(3,'2017-11-29','Helena trening',5),(4,'2016-10-11','2016',23),(5,'2017-10-12','2017',23),(6,'2017-12-08','Proba',23),(7,'2017-12-28','forhendi?i?',23);
/*!40000 ALTER TABLE `trening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troskovi_oprema`
--

DROP TABLE IF EXISTS `troskovi_oprema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `troskovi_oprema` (
  `TRANSAKCIJA_Id` int(11) NOT NULL,
  `NARUDZBA_Id` int(11) NOT NULL,
  PRIMARY KEY (`TRANSAKCIJA_Id`),
  KEY `fk_TROSKOVI_OPREMA_NARUDZBA1_idx` (`NARUDZBA_Id`),
  CONSTRAINT `fk_TROSKOVI_OPREMA_NARUDZBA1` FOREIGN KEY (`NARUDZBA_Id`) REFERENCES `narudzba` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TROSKOVI_OPREMA_TRANSAKCIJA1` FOREIGN KEY (`TRANSAKCIJA_Id`) REFERENCES `transakcija` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troskovi_oprema`
--

LOCK TABLES `troskovi_oprema` WRITE;
/*!40000 ALTER TABLE `troskovi_oprema` DISABLE KEYS */;
/*!40000 ALTER TABLE `troskovi_oprema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troskovi_turnir`
--

DROP TABLE IF EXISTS `troskovi_turnir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `troskovi_turnir` (
  `TRANSAKCIJA_Id` int(11) NOT NULL,
  `TURNIR_Id` int(11) NOT NULL,
  PRIMARY KEY (`TRANSAKCIJA_Id`),
  KEY `fk_TROSKOVI_TURNIR_TURNIR1_idx` (`TURNIR_Id`),
  CONSTRAINT `fk_TROSKOVI_TURNIR_TRANSAKCIJA1` FOREIGN KEY (`TRANSAKCIJA_Id`) REFERENCES `transakcija` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TROSKOVI_TURNIR_TURNIR1` FOREIGN KEY (`TURNIR_Id`) REFERENCES `turnir` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troskovi_turnir`
--

LOCK TABLES `troskovi_turnir` WRITE;
/*!40000 ALTER TABLE `troskovi_turnir` DISABLE KEYS */;
/*!40000 ALTER TABLE `troskovi_turnir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnir`
--

DROP TABLE IF EXISTS `turnir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turnir` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  `Datum` date NOT NULL,
  `Zavrsen` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnir`
--

LOCK TABLES `turnir` WRITE;
/*!40000 ALTER TABLE `turnir` DISABLE KEYS */;
INSERT INTO `turnir` VALUES (1,'1. Me?unarodni turnir Banja Luka Open','2018-01-04',0);
/*!40000 ALTER TABLE `turnir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnir_kategorija`
--

DROP TABLE IF EXISTS `turnir_kategorija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turnir_kategorija` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Kategorija` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnir_kategorija`
--

LOCK TABLES `turnir_kategorija` WRITE;
/*!40000 ALTER TABLE `turnir_kategorija` DISABLE KEYS */;
INSERT INTO `turnir_kategorija` VALUES (1,'MuÅ¡ki singl'),(2,'Å½enski singl'),(3,'MuÅ¡ki dubl'),(4,'Å½enski dubl');
/*!40000 ALTER TABLE `turnir_kategorija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucesce_na_turniru`
--

DROP TABLE IF EXISTS `ucesce_na_turniru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucesce_na_turniru` (
  `TRANSAKCIJA_Id` int(11) NOT NULL,
  `UCESNIK_PRIJAVA_Id` int(11) NOT NULL,
  PRIMARY KEY (`TRANSAKCIJA_Id`),
  KEY `fk_UCESCE_NA_TURNIRU_UCESNIK_PRIJAVA1_idx` (`UCESNIK_PRIJAVA_Id`),
  CONSTRAINT `fk_UCESCE_NA_TURNIRU_TRANSAKCIJA1` FOREIGN KEY (`TRANSAKCIJA_Id`) REFERENCES `transakcija` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UCESCE_NA_TURNIRU_UCESNIK_PRIJAVA1` FOREIGN KEY (`UCESNIK_PRIJAVA_Id`) REFERENCES `ucesnik_prijava` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucesce_na_turniru`
--

LOCK TABLES `ucesce_na_turniru` WRITE;
/*!40000 ALTER TABLE `ucesce_na_turniru` DISABLE KEYS */;
/*!40000 ALTER TABLE `ucesce_na_turniru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ucesnik_prijava`
--

DROP TABLE IF EXISTS `ucesnik_prijava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ucesnik_prijava` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TURNIR_Id` int(11) NOT NULL,
  `TURNIR_KATEGORIJA_Id` int(11) NOT NULL,
  `OSOBA_Id` int(11) NOT NULL,
  `Datum` date NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_UCESNIK_has_TURNIR_TURNIR1_idx` (`TURNIR_Id`),
  KEY `fk_PRIJAVA_TURNIR_KATEGORIJA1_idx` (`TURNIR_KATEGORIJA_Id`),
  KEY `fk_PRIJAVA_OSOBA1_idx` (`OSOBA_Id`),
  CONSTRAINT `fk_PRIJAVA_OSOBA1` FOREIGN KEY (`OSOBA_Id`) REFERENCES `osoba` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRIJAVA_TURNIR_KATEGORIJA1` FOREIGN KEY (`TURNIR_KATEGORIJA_Id`) REFERENCES `turnir_kategorija` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UCESNIK_has_TURNIR_TURNIR1` FOREIGN KEY (`TURNIR_Id`) REFERENCES `turnir` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucesnik_prijava`
--

LOCK TABLES `ucesnik_prijava` WRITE;
/*!40000 ALTER TABLE `ucesnik_prijava` DISABLE KEYS */;
INSERT INTO `ucesnik_prijava` VALUES (1,1,1,28,'2017-12-28'),(2,1,1,35,'2018-01-12');
/*!40000 ALTER TABLE `ucesnik_prijava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ugovor_sponzor`
--

DROP TABLE IF EXISTS `ugovor_sponzor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ugovor_sponzor` (
  `RedniBroj` int(11) NOT NULL,
  `DatumOd` date NOT NULL,
  `DatumDo` date DEFAULT NULL,
  `SPONZOR_Id` int(11) NOT NULL,
  `Opis` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`RedniBroj`,`SPONZOR_Id`),
  KEY `fk_UGOVOR_SPONZOR_SPONZOR1_idx` (`SPONZOR_Id`),
  CONSTRAINT `fk_UGOVOR_SPONZOR_SPONZOR1` FOREIGN KEY (`SPONZOR_Id`) REFERENCES `sponzor` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ugovor_sponzor`
--

LOCK TABLES `ugovor_sponzor` WRITE;
/*!40000 ALTER TABLE `ugovor_sponzor` DISABLE KEYS */;
INSERT INTO `ugovor_sponzor` VALUES (1,'2014-01-01','2020-01-01',5,'Ugovor o sponzorisanju'),(1,'2017-02-02','2018-01-01',6,'Ugovor o sponzorisanju'),(1,'2017-02-02','2019-01-01',7,'Ugovor o sponzorisanju'),(1,'2015-02-02','2020-01-01',8,'Ugovor o sponzorisanju'),(1,'2014-01-01','2020-01-01',9,'Ugovor o sponzorisanju'),(1,'2017-02-02','2018-01-01',10,'Ugovor o sponzorisanju'),(1,'2017-02-02','2019-01-01',11,'Ugovor o sponzorisanju'),(1,'2015-02-02','2020-01-01',12,'Ugovor o sponzorisanju'),(2,'2017-12-23',NULL,5,'Novcana donacija'),(2,'2017-12-25',NULL,6,'Novcana donacija'),(2,'2017-12-26',NULL,7,'Donacija rekvizita'),(3,'2017-12-25',NULL,5,'Donacija sportske opreme'),(3,'2017-12-25',NULL,6,'Novcana donacija'),(3,'2017-12-26',NULL,7,'Donacija rekvizita'),(4,'2017-12-23',NULL,5,'Novcana donacija'),(5,'2017-12-25',NULL,5,'Donacija sportske opreme');
/*!40000 ALTER TABLE `ugovor_sponzor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposleni`
--

DROP TABLE IF EXISTS `zaposleni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaposleni` (
  `Aktivan` tinyint(4) NOT NULL,
  `OSOBA_Id` int(11) NOT NULL,
  PRIMARY KEY (`OSOBA_Id`),
  KEY `fk_ZAPOSLENI_OSOBA1_idx` (`OSOBA_Id`),
  CONSTRAINT `fk_ZAPOSLENI_OSOBA1` FOREIGN KEY (`OSOBA_Id`) REFERENCES `osoba` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposleni`
--

LOCK TABLES `zaposleni` WRITE;
/*!40000 ALTER TABLE `zaposleni` DISABLE KEYS */;
INSERT INTO `zaposleni` VALUES (1,16),(1,18),(1,19),(1,20),(1,21),(1,22),(1,31),(1,33),(1,34),(1,38);
/*!40000 ALTER TABLE `zaposleni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposleni_tip`
--

DROP TABLE IF EXISTS `zaposleni_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaposleni_tip` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tip` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposleni_tip`
--

LOCK TABLES `zaposleni_tip` WRITE;
/*!40000 ALTER TABLE `zaposleni_tip` DISABLE KEYS */;
INSERT INTO `zaposleni_tip` VALUES (1,'Sekretar'),(2,'Trener'),(3,'Racunovodja'),(4,'Direktor'),(5,'Pomocno osoblje'),(6,'Sekretar'),(7,'Trener'),(8,'Racunovodja'),(9,'Direktor'),(10,'Pomocno osoblje');
/*!40000 ALTER TABLE `zaposleni_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposlenje`
--

DROP TABLE IF EXISTS `zaposlenje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaposlenje` (
  `ZAPOSLENI_TIP_Id` int(11) NOT NULL,
  `ZAPOSLENI_OSOBA_Id` int(11) NOT NULL,
  `DatumOd` date NOT NULL,
  `DatumDo` date DEFAULT NULL,
  `Plata` decimal(8,2) NOT NULL,
  PRIMARY KEY (`ZAPOSLENI_TIP_Id`,`ZAPOSLENI_OSOBA_Id`,`DatumOd`),
  KEY `fk_ZAPOSLENI_TIP_has_ZAPOSLENI_ZAPOSLENI1_idx` (`ZAPOSLENI_OSOBA_Id`),
  KEY `fk_ZAPOSLENI_TIP_has_ZAPOSLENI_ZAPOSLENI_TIP1_idx` (`ZAPOSLENI_TIP_Id`),
  CONSTRAINT `fk_ZAPOSLENI_TIP_has_ZAPOSLENI_ZAPOSLENI1` FOREIGN KEY (`ZAPOSLENI_OSOBA_Id`) REFERENCES `zaposleni` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ZAPOSLENI_TIP_has_ZAPOSLENI_ZAPOSLENI_TIP1` FOREIGN KEY (`ZAPOSLENI_TIP_Id`) REFERENCES `zaposleni_tip` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposlenje`
--

LOCK TABLES `zaposlenje` WRITE;
/*!40000 ALTER TABLE `zaposlenje` DISABLE KEYS */;
INSERT INTO `zaposlenje` VALUES (1,19,'2001-08-10',NULL,1000.00),(1,38,'2018-01-01','2018-01-01',750.00),(2,18,'2011-06-05',NULL,850.00),(2,22,'2010-05-05',NULL,850.00),(2,33,'2016-07-05','2020-05-05',450.00),(3,20,'2007-07-07',NULL,1100.00),(3,34,'2015-01-01',NULL,750.00),(5,21,'2016-05-05','2018-05-05',450.00);
/*!40000 ALTER TABLE `zaposlenje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zrijeb`
--

DROP TABLE IF EXISTS `zrijeb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zrijeb` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TURNIR_Id` int(11) NOT NULL,
  `TURNIR_KATEGORIJA_Id` int(11) NOT NULL,
  `BrojTimova` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `fk_ZRIJEB_TURNIR_KATEGORIJA1_idx` (`TURNIR_KATEGORIJA_Id`),
  KEY `fk_ZRIJEB_TURNIR1` (`TURNIR_Id`),
  CONSTRAINT `fk_ZRIJEB_TURNIR1` FOREIGN KEY (`TURNIR_Id`) REFERENCES `turnir` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ZRIJEB_TURNIR_KATEGORIJA1` FOREIGN KEY (`TURNIR_KATEGORIJA_Id`) REFERENCES `turnir_kategorija` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zrijeb`
--

LOCK TABLES `zrijeb` WRITE;
/*!40000 ALTER TABLE `zrijeb` DISABLE KEYS */;
/*!40000 ALTER TABLE `zrijeb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dzoksrs_db'
--

--
-- Dumping routines for database 'dzoksrs_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `dodajPrijavu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodajPrijavu`(in pTurnirId int,in pTurnirKategorijaId int,in pIdOsobe int,
in pDatum date,out rezultat int)
begin
    insert into UCESNIK_PRIJAVA (TURNIR_Id,TURNIR_KATEGORIJA_Id,OSOBA_Id,Datum)
	values (pTurnirId,pTurnirKategorijaId,pidOsobe,pDatum);
    
    select Id from UCESNIK_PRIJAVA order by Id desc limit 1 into rezultat;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_budzet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_budzet`(in inSezona varchar(54), in inIznos decimal)
begin
	declare broj int default 0;
    select count(*) from NOVCANA_SREDSTVA n where n.Sezona=inSezona into broj;
    if broj>0 then signal sqlstate '45000' set message_text='Postoji evidentirani iznos budzeta za izabranu sezonu.'; end if;
    insert into NOVCANA_SREDSTVA values (null, inSezona, inIznos, 0, 0);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_clanarinu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_clanarinu`( in inDatum date, in inIznos decimal(8,2), inOpis varchar(100), 
															in inMjesec int(11), in inGodina year(4), 
                                                            in inClanId int(11),out outId int(11))
begin
	
	insert into TRANSAKCIJA values (null, inDatum, inIznos, inOpis, 1, 1);
    insert into CLANARINA values (inMjesec, inGodina, (select max(Id) from TRANSAKCIJA), inClanId);
    select max(Id) into outId from TRANSAKCIJA;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_dogadjaj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_dogadjaj`(in pOpis varchar(100),
								in pDogadjajTipId int,
                                in pKorisnickiNalogId int,
                                in pPocetak DateTime,
                                in pKraj DateTime,
                                out pRezId int)
begin
	declare brojac int default 0;
	set pRezId=-1;
    if(pPocetak >= pKraj) then
    begin
		set pRezId=-2;
	end;
    else
		begin
			select count(*) from dogadjaj 
			where ((DOGADJAJ_TIP_Id=pDogadjajTipId) and ((pPocetak>Pocetak and pPocetak<Kraj) or (pKraj>Pocetak and pKraj<Kraj)))
			into brojac;
            if(brojac = 0) then
				begin
					insert into DOGADJAJ values(null, pOpis, pDogadjajTipId, pKorisnickiNalogId, pPocetak, pKraj);
                    select max(Id) from DOGADJAJ into pRezId;
				end;
            end if;
		end;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_donaciju` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_donaciju`(in pSponzorId int,
								in pRedniBrojUgovor int,
                                in pOpis varchar(100),
                                in pKolicina decimal(8,2),
                                in pNovcaniIznos decimal(8,2),
                                in pNovcanaDonacija boolean,
                                in pOpremaTipId int,
                                out pUspjesno boolean)
begin
	declare rb int default 1;
	if( ((pKolicina is not null) and (pOpremaTipId=false or pNovcanaDonacija=true or pKolicina<0)) or
		((pNovcaniIznos is not null) and (pOpremaTipId=true or pNovcanaDonacija=false or pNovcaniIznos<0))) then
	begin
		set pUspjesno = false;
        signal sqlstate 'ERROR';
    end;
    else
		begin
			select max(RedniBroj) from DONACIJA where SPONZOR_Id=pSponzorId and UGOVOR_RedniBroj=pRedniBrojUgovor into rb;
            if(rb is null) then
				set rb = 1;
			else
				set rb = rb + 1;
			end if;
            insert into DONACIJA values(rb, pOpis, pKolicina, pNovcaniIznos, pNovcanaDonacija,
										false, pSponzorId, pRedniBrojUgovor, pOpremaTipId, null);
			set pUspjesno=true;
        end;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_instance_opreme_kluba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_instance_opreme_kluba`( in inBrojInstanci int(11), in inDonirana boolean, in inOpremaTipId int(11), inNarudzbaId int(11),
																   in inDonacijaId int(11), in inDonacijaSponzor int(11), in inDonacijaUgovor int(11), 
                                                                   in inVelicina varchar(10), in inOpis varchar(200))
begin
	declare i int(11);
    set i = 1;
	while i <= inBrojInstanci do
		call dodaj_opremu_kluba (inDonirana, inOpremaTipId, inNarudzbaId, inDonacijaId, inDonacijaSponzor, inDonacijaUgovor, inVelicina, inOpis);
		set i = i + 1;
    end while;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_opremu_clana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_opremu_clana`(in inOpremaTipId int(11), inNarudzbaId int(11), in inVelicina varchar(10), in inClanId boolean)
begin
	insert into oprema values (null, inOpremaTipId, inNarudzbaId, false, inVelicina);
    insert into oprema_clan values ((select max(Id) from oprema), inClanId);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_opremu_kluba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_opremu_kluba`( in inDonirana boolean, in inOpremaTipId int(11), inNarudzbaId int(11), 
															in inDonacijaId int(11), in inDonacijaSponzor int(11), in inDonacijaUgovor int(11),
                                                            in inVelicina varchar(10), in inOpis varchar(200))
begin
	insert into oprema values (null, inOpremaTipId, inNarudzbaId, false, inVelicina);
    insert into oprema_klub values (inOpis, true, (select max(Id) from oprema), inDonirana, inDonacijaSponzor, inDonacijaUgovor, inDonacijaId);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_platu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_platu`( in inDatum date, in inIznos decimal(8,2), in inOpis varchar(100), in inZaposleniId int(11), out outId int(11))
begin
	insert into TRANSAKCIJA values (null, inDatum, inIznos, inOpis, 0, 2);
    insert into PLATA values ((select max(Id) from transakcija), inZaposleniId);
    select max(Id) into outId from TRANSAKCIJA;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_sponozra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_sponozra`(in pNaziv varchar(45),
								in pAdresa varchar(45),
                                in pMail varchar(45),
                                in pDatumOd date,
                                in pDatumDo date,
                                in pOpis varchar(100),
                                out pUspjesno boolean)
begin
	declare exit handler for sqlexception
    begin
		set pUspjesno = false;
        rollback;
        resignal;
    end;
    start transaction;
		insert into SPONZOR values(null, pNaziv, pAdresa, pMail);
		call dodaj_sponzorski_ugovor(pDatumOd, pDatumDo, (select max(Id) from SPONZOR), pOpis, pUspjesno);
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_sponzorski_ugovor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_sponzorski_ugovor`(in pDatumOd date,
                                         in pDatumDo date,
                                         in pSponzorId int,
                                         in pOpis varchar(100),
                                         out pUspjesno boolean)
begin
	declare rb int default 1;
	if ((pDatumDo is not null) and (datediff(pDatumOd, pDatumDo) > 0)) then
	begin
        set pUspjesno = false;
        signal sqlstate 'ERROR';
	end;
	else
		begin
			select max(RedniBroj) from UGOVOR_SPONZOR where SPONZOR_Id=pSponzorId into rb;
            if(rb is null) then
				set rb = 1;
			else
				set rb = rb + 1;
			end if;
            insert into UGOVOR_SPONZOR values(rb, pDatumOd, pDatumDo, pSponzorId, pOpis);
            set pUspjesno = true;
		end;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_troskovi_oprema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_troskovi_oprema`( in inDatum date, in inIznos decimal(8,2), inOpis varchar(100), 
															
                                                            in inNarudzbaId int(11), out outId int(11))
begin
	
	insert into TRANSAKCIJA values (null, inDatum, inIznos, inOpis, 1, 3);
    insert into TROSKOVI_OPREMA values ((select max(Id) from TRANSAKCIJA), inNarudzbaId);
    select max(Id) into outId from TRANSAKCIJA;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_troskovi_turnir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_troskovi_turnir`( in inDatum date, in inIznos decimal(8,2), inOpis varchar(100), 
															
                                                            in inTurnirId int(11), out outId int(11))
begin
	
	insert into TRANSAKCIJA values (null, inDatum, inIznos, inOpis, 1, 3,FALSE);
    insert into TROSKOVI_TURNIR values ((select max(Id) from transakcija), inTurnirId);
    select max(Id) into outId from TRANSAKCIJA;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_zaposlenje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_zaposlenje`(in pZaposleni_tip_id int,
								  in pOsoba_id int, 
								  in pDatum_od date, 
                                  in pDatum_do date, 
                                  in pPlata decimal(8,2), 
                                  out pUspjesno boolean)
begin
	if  ((pDatum_do is not null) and datediff(pDatum_od, pDatum_do) > 0) or (pPlata < 0) then
    begin
		set pUspjesno = false;
        signal sqlstate 'ERROR';
	end;
	else
		begin
			insert into ZAPOSLENJE values(pZaposleni_tip_id, pOsoba_id, pDatum_od, pDatum_do, pPlata);
            set pUspjesno=true;
        end;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_zaposlenog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_zaposlenog`(in pJmb char(13), 
								  in pIme varchar(45), 
                                  in pIme_roditelja varchar(45), 
								  in pPrezime varchar(45), 
                                  in pPol char(1), 
                                  in pDatum_rodjenja date, 
                                  in pFotografija longblob,
								  in pZaposleni_tip_id int, 
                                  in pDatum_od date, 
                                  in pDatum_do date, 
                                  in pPlata decimal(8,2), 
								  out pId int)
begin
	declare pUspjesno boolean default false;
	declare exit handler for sqlexception
    begin
		set pId=-1;
        rollback;
        resignal;
    end;
    start transaction;
		insert into OSOBA values(null, pJmb, pIme, pIme_roditelja, pPrezime, pPol, pDatum_rodjenja, pFotografija);
		insert into ZAPOSLENI values(true, (select max(Id) from OSOBA));
		call dodaj_zaposlenje(pZaposleni_tip_id, (select max(Id) from OSOBA), pDatum_od, pDatum_do, pPlata, pUspjesno);
        select max(Id) from OSOBA into pId;
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `kreirajDublZrijeb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kreirajDublZrijeb`(in pIdTurnira int,in pIdKategorije int,in pBrojTimova int,out pFlag boolean)
begin
    declare ukupno int default 0;
	declare idZrijeba int default 0;
	declare brojac int default 1;
    
    select count(*) into ukupno
    from ZRIJEB;
    
    insert into ZRIJEB (TURNIR_Id,TURNIR_KATEGORIJA_Id,BrojTimova) values (pIdTurnira,pIdKategorije,pBrojTimova);
    
	select Id from ZRIJEB order by Id desc limit 1 into idZrijeba;
    
    petlja1: while brojac<5 do
		insert into RUNDA (ZRIJEB_Id,Broj) values (idZrijeba,brojac);
		set brojac=brojac+1;
    end while petlja1;
    
    set brojac=1;
    
    petlja2: while brojac<=8 do
		insert into MEC (RUNDA_ZRIJEB_Id,RUNDA_Broj,RedniBroj) values (idZrijeba,1,brojac);
		set brojac=brojac+1;
    end while petlja2;
    
    set brojac=1;
    
    petlja3: while brojac<=4 do
		insert into MEC (RUNDA_ZRIJEB_Id,RUNDA_Broj,RedniBroj) values (idZrijeba,2,brojac);
		set brojac=brojac+1;
    end while petlja3;
    
    set brojac=1;
    
    petlja4: while brojac<=2 do
		insert into MEC (RUNDA_ZRIJEB_Id,RUNDA_Broj,RedniBroj) values (idZrijeba,3,brojac);
		set brojac=brojac+1;
    end while petlja4;
    
    insert into MEC (RUNDA_ZRIJEB_Id,RUNDA_Broj,RedniBroj) values (idZrijeba,4,1);
    
    if (select count(*) from ZRIJEB) > ukupno then
		set pFlag=true;
	else
		set pFlag=false;
    end if;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `kreirajSinglZrijeb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kreirajSinglZrijeb`(in pIdTurnira int,in pIdKategorije int,in pBrojTimova int,out pFlag boolean)
begin
    declare ukupno int default 0;
	declare idZrijeba int default 0;
	declare brojac int default 1;
    
    select count(*) into ukupno
    from ZRIJEB;
    
    insert into ZRIJEB (TURNIR_Id,TURNIR_KATEGORIJA_Id,BrojTimova) values (pIdTurnira,pIdKategorije,pBrojTimova);
    
	select Id from ZRIJEB order by Id desc limit 1 into idZrijeba;
    
    petlja1: while brojac<6 do
		insert into RUNDA (ZRIJEB_Id,Broj) values (idZrijeba,brojac);
		set brojac=brojac+1;
    end while petlja1;
    
    set brojac=1;
    
    petlja2: while brojac<=16 do
		insert into MEC (RUNDA_ZRIJEB_Id,RUNDA_Broj,RedniBroj) values (idZrijeba,1,brojac);
		set brojac=brojac+1;
    end while petlja2;
    
    set brojac=1;
    
    petlja3: while brojac<=8 do
		insert into MEC (RUNDA_ZRIJEB_Id,RUNDA_Broj,RedniBroj) values (idZrijeba,2,brojac);
		set brojac=brojac+1;
    end while petlja3;
    
    set brojac=1;
    
    petlja4: while brojac<=4 do
		insert into MEC (RUNDA_ZRIJEB_Id,RUNDA_Broj,RedniBroj) values (idZrijeba,3,brojac);
		set brojac=brojac+1;
    end while petlja4;
    
    set brojac=1;
    
    petlja5: while brojac<=2 do
		insert into MEC (RUNDA_ZRIJEB_Id,RUNDA_Broj,RedniBroj) values (idZrijeba,4,brojac);
		set brojac=brojac+1;
    end while petlja5;
    
    insert into MEC (RUNDA_ZRIJEB_Id,RUNDA_Broj,RedniBroj) values (idZrijeba,5,1);
    
    if (select count(*) from ZRIJEB) > ukupno then
		set pFlag=true;
	else
		set pFlag=false;
    end if;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `postojiJmb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `postojiJmb`(in pJmb char(13),in pIdTurnira int,in pIdKategorije int,out pFlag boolean)
begin
    if (select count(*) from UCESNIK_PRIJAVA u inner join OSOBA o 
		on u.OSOBA_Id=o.Id where o.JMB=pJmb and 
        (u.TURNIR_Id<>pIdTurnira or u.TURNIR_KATEGORIJA_Id<>pIdKategorije))>0 then
		set pFlag=true;
	else
		set pFlag=false;
    end if;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `postojiZrijeb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `postojiZrijeb`(in pIdTurnira int,in pIdKategorije int,out pFlag boolean)
begin
    if (select count(*) from ZRIJEB where TURNIR_Id=pIdTurnira and TURNIR_KATEGORIJA_Id=pIdKategorije)>0 then
		set pFlag=true;
	else
		set pFlag=false;
    end if;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prijaviDublTim` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prijaviDublTim`(in pId1 int,in pId2 int,out pFlag boolean)
begin
    declare ukupno int default 0;
    
    select count(*) into ukupno
    from TIM;
    
    insert into TIM (UCESNIK1_PRIJAVA_Id,UCESNIK2_PRIJAVA_Id) values (pId1,pId2);
    
    if (select count(*) from TIM) > ukupno then
		set pFlag=true;
	else
		set pFlag=false;
    end if;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prijaviSinglTim` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prijaviSinglTim`(in pId int,out pFlag boolean)
begin
    declare ukupno int default 0;
    
    select count(*) into ukupno
    from TIM;
    
    insert into TIM (UCESNIK1_PRIJAVA_Id) values (pId);
    
    if (select count(*) from TIM) > ukupno then
		set pFlag=true;
	else
		set pFlag=false;
    end if;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prijaviUcesnika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prijaviUcesnika`(in pJmb char(13), in pIme varchar(45),in pPrezime varchar(45), 
 in pPol char(1), in pDatumRodjenja date, in pTurnirId int,
 in pTurnirKategorijaId int, in pDatum date, out rezultat int)
begin
	declare idOsobe int default 0;
    
	insert into OSOBA (JMB,Ime,Prezime,Pol,DatumRodjenja) 
	values (pJmb,pIme,pPrezime,pPol,pDatumRodjenja);
    
	select Id from OSOBA order by Id desc limit 1 into idOsobe;
    
    insert into UCESNIK_PRIJAVA (TURNIR_Id,TURNIR_KATEGORIJA_Id,OSOBA_Id,Datum)
	values (pTurnirId,pTurnirKategorijaId,idOsobe,pDatum);
    
    select Id from UCESNIK_PRIJAVA order by Id desc limit 1 into rezultat;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_clanarinu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_clanarinu`( in inOsobaId int, in inId int, in inDatum date, in inIznos decimal(8,2), inOpis varchar(100), 
															in inMjesec int(11), in inGodina year(4))
begin
	update TRANSAKCIJA SET Datum=inDatum, Iznos=inIznos, Opis=inOpis where Id=inId;
	update CLANARINA SET Mjesec=inMjesec, Godina=inGodina, CLAN_OSOBA_Id=inOsobaId where TRANSAKCIJA_Id=inId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_platu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_platu`(in inOsobaId int, in inId int, in inDatum date, in inIznos decimal(8,2), in inOpis varchar(100))
begin
	update TRANSAKCIJA SET Datum=inDatum, Iznos=inIznos, Opis=inOpis where Id=inId;
	update PLATA SET ZAPOSLENI_OSOBA_Id=inOsobaId where TRANSAKCIJA_Id=inId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_troskovi_oprema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_troskovi_oprema`( in inNarudzbaId int, in inId int, in inDatum date, in inIznos decimal(8,2), inOpis varchar(100))
begin
	update TRANSAKCIJA SET datum=inDatum, iznos=inIznos, opis=inOpis where Id=inId;
	update TROSKOVI_OPREMA SET NARUDZBA_Id=inNarudzbaId where TRANSAKCIJA_Id=inId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_troskovi_turnir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_troskovi_turnir`( in inTurnirId int, in inId int, in inDatum date, in inIznos decimal(8,2), inOpis varchar(100))
begin
	update TRANSAKCIJA SET datum=inDatum, iznos=inIznos, opis=inOpis where Id=inId;
	update TROSKOVI_TURNIR SET TURNIR_Id=inTurnirId where TRANSAKCIJA_Id=inId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `aktivni_zaposleni`
--

/*!50001 DROP VIEW IF EXISTS `aktivni_zaposleni`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `aktivni_zaposleni` AS select `o`.`Id` AS `Id`,`o`.`JMB` AS `JMB`,`o`.`Ime` AS `Ime`,`o`.`ImeRoditelja` AS `ImeRoditelja`,`o`.`Prezime` AS `Prezime`,`o`.`Pol` AS `Pol`,`o`.`DatumRodjenja` AS `DatumRodjenja`,`o`.`Fotografija` AS `Fotografija`,`zap`.`DatumOd` AS `DatumOd`,`zap`.`DatumDo` AS `DatumDo`,`zap`.`Plata` AS `Plata`,`zt`.`Id` AS `Tip_Id`,`zt`.`Tip` AS `Tip` from (((`osoba` `o` join `zaposleni` `z` on((`o`.`Id` = `z`.`OSOBA_Id`))) join `zaposlenje` `zap` on((`z`.`OSOBA_Id` = `zap`.`ZAPOSLENI_OSOBA_Id`))) join `zaposleni_tip` `zt` on((`zap`.`ZAPOSLENI_TIP_Id` = `zt`.`Id`))) where ((curdate() between `zap`.`DatumOd` and `zap`.`DatumDo`) or ((curdate() > `zap`.`DatumOd`) and isnull(`zap`.`DatumDo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `donacija_detaljno`
--

/*!50001 DROP VIEW IF EXISTS `donacija_detaljno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `donacija_detaljno` AS select `s`.`Id` AS `SponzorId`,`s`.`Naziv` AS `Naziv`,`s`.`Adresa` AS `Adresa`,`s`.`Mail` AS `Mail`,`u`.`RedniBroj` AS `UgovorRb`,`u`.`DatumOd` AS `DatumOd`,`u`.`DatumDo` AS `DatumDo`,`u`.`Opis` AS `UgovorOpis`,`d`.`RedniBroj` AS `DonacijaRb`,`d`.`Opis` AS `DonacijaOpis`,`d`.`Kolicina` AS `Kolicina`,`d`.`NovcaniIznos` AS `NovcaniIznos`,`d`.`NovcanaDonacija` AS `NovcanaDonacija`,`d`.`Obradjeno` AS `Obradjeno`,`d`.`TRANSAKCIJA_Id` AS `TRANSAKCIJA_Id`,`d`.`OPREMA_TIP_Id` AS `OPREMA_TIP_Id`,`ot`.`Tip` AS `Tip`,`ot`.`Model` AS `Model`,`ot`.`Proizvodjac` AS `Proizvodjac`,`ot`.`ImaVelicinu` AS `ImaVelicinu` from (((`sponzor` `s` join `ugovor_sponzor` `u` on((`s`.`Id` = `u`.`SPONZOR_Id`))) join `donacija` `d` on(((`s`.`Id` = `d`.`SPONZOR_Id`) and (`u`.`RedniBroj` = `d`.`UGOVOR_RedniBroj`)))) left join `oprema_tip` `ot` on((`d`.`OPREMA_TIP_Id` = `ot`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prikaz_clana`
--

/*!50001 DROP VIEW IF EXISTS `prikaz_clana`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_clana` AS select `o`.`Id` AS `Id`,`o`.`JMB` AS `JMB`,`o`.`Ime` AS `Ime`,`o`.`ImeRoditelja` AS `ImeRoditelja`,`o`.`Prezime` AS `Prezime`,`o`.`Pol` AS `Pol`,`o`.`DatumRodjenja` AS `DatumRodjenja`,`o`.`Fotografija` AS `Fotografija`,`c`.`Aktivan` AS `Aktivan`,`c`.`Registrovan` AS `Registrovan` from (`osoba` `o` join `clan` `c`) where (`o`.`Id` = `c`.`OSOBA_Id`) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prikaz_clanarina`
--

/*!50001 DROP VIEW IF EXISTS `prikaz_clanarina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_clanarina` AS select `t`.`Id` AS `id`,`o`.`Ime` AS `ime`,`o`.`Prezime` AS `prezime`,`cl`.`Mjesec` AS `mjesec`,`cl`.`Godina` AS `godina`,`t`.`Datum` AS `datum`,`t`.`Iznos` AS `iznos`,`t`.`Opis` AS `opis`,`tt`.`Tip` AS `Tip`,`c`.`OSOBA_Id` AS `OSOBA_Id` from ((((`osoba` `o` join `clan` `c`) join `transakcija` `t`) join `clanarina` `cl`) join `tip_transakcije` `tt` on(((`tt`.`Id` = `t`.`TIP_TRANSAKCIJE_Id`) and (`o`.`Id` = `c`.`OSOBA_Id`) and (`t`.`Id` = `cl`.`TRANSAKCIJA_Id`) and (`cl`.`CLAN_OSOBA_Id` = `c`.`OSOBA_Id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prikaz_opreme_clana`
--

/*!50001 DROP VIEW IF EXISTS `prikaz_opreme_clana`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_opreme_clana` AS select `o`.`Id` AS `Id`,`o`.`OPREMA_TIP_Id` AS `OPREMA_TIP_Id`,`o`.`Obrisan` AS `Obrisan`,`ot`.`Tip` AS `Tip`,`ot`.`Proizvodjac` AS `Proizvodjac`,`ot`.`Model` AS `Model`,`o`.`NARUDZBA_Id` AS `NARUDZBA_Id`,`o`.`Velicina` AS `Velicina`,`oc`.`CLAN_Id` AS `CLAN_Id`,`os`.`JMB` AS `JMB`,`os`.`Ime` AS `Ime`,`os`.`Prezime` AS `Prezime` from (((`oprema` `o` join `oprema_clan` `oc`) join `oprema_tip` `ot`) join `osoba` `os` on(((`o`.`Id` = `oc`.`OPREMA_Id`) and (`o`.`OPREMA_TIP_Id` = `ot`.`Id`) and (`os`.`Id` = `oc`.`CLAN_Id`)))) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prikaz_opreme_kluba`
--

/*!50001 DROP VIEW IF EXISTS `prikaz_opreme_kluba`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_opreme_kluba` AS select `o`.`Id` AS `Id`,`ok`.`Donirana` AS `Donirana`,`o`.`OPREMA_TIP_Id` AS `OPREMA_TIP_Id`,`o`.`Obrisan` AS `Obrisan`,`ot`.`Tip` AS `Tip`,`ot`.`Proizvodjac` AS `Proizvodjac`,`ot`.`Model` AS `Model`,`o`.`NARUDZBA_Id` AS `NARUDZBA_Id`,`ok`.`DONACIJA_SPONZOR_Id` AS `DONACIJA_SPONZOR_Id`,`ok`.`DONACIJA_UGOVOR_RedniBroj` AS `DONACIJA_UGOVOR_RedniBroj`,`ok`.`DONACIJA_RedniBroj` AS `DONACIJA_RedniBroj`,`o`.`Velicina` AS `Velicina`,`ok`.`Opis` AS `Opis`,`ok`.`Aktivan` AS `Aktivan` from ((`oprema` `o` join `oprema_klub` `ok`) join `oprema_tip` `ot` on(((`o`.`Id` = `ok`.`OPREMA_Id`) and (`o`.`OPREMA_TIP_Id` = `ot`.`Id`)))) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prikaz_plata`
--

/*!50001 DROP VIEW IF EXISTS `prikaz_plata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_plata` AS select `z`.`OSOBA_Id` AS `OSOBA_Id`,`o`.`Ime` AS `Ime`,`o`.`Prezime` AS `Prezime`,`o`.`ImeRoditelja` AS `ImeRoditelja`,`o`.`JMB` AS `JMB`,`o`.`Pol` AS `Pol`,`o`.`DatumRodjenja` AS `DatumRodjenja`,`o`.`Fotografija` AS `Fotografija`,`z`.`Aktivan` AS `Aktivan`,`t`.`Iznos` AS `Iznos`,`t`.`Datum` AS `Datum`,`t`.`Opis` AS `Opis`,`t`.`Id` AS `Id`,`tt`.`Tip` AS `Tip` from ((((`osoba` `o` join `zaposleni` `z`) join `transakcija` `t`) join `plata` `p`) join `tip_transakcije` `tt` on(((`tt`.`Id` = `t`.`TIP_TRANSAKCIJE_Id`) and (`o`.`Id` = `z`.`OSOBA_Id`) and (`t`.`Id` = `p`.`TRANSAKCIJA_Id`) and (`p`.`ZAPOSLENI_OSOBA_Id` = `z`.`OSOBA_Id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prikaz_transakcija`
--

/*!50001 DROP VIEW IF EXISTS `prikaz_transakcija`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_transakcija` AS select `t`.`Id` AS `Id`,`t`.`Datum` AS `Datum`,`t`.`Iznos` AS `Iznos`,`t`.`Opis` AS `Opis`,`t`.`jeUplata` AS `jeUplata`,`tip`.`Tip` AS `Tip` from (`transakcija` `t` join `tip_transakcije` `tip` on((`t`.`TIP_TRANSAKCIJE_Id` = `tip`.`Id`))) where (`tip`.`Id` > 4) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prikaz_troskovi_oprema`
--

/*!50001 DROP VIEW IF EXISTS `prikaz_troskovi_oprema`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_troskovi_oprema` AS select `n`.`Id` AS `Id`,`n`.`DISTRIBUTER_OPREME_Id` AS `DISTRIBUTER_OPREME_Id`,`tt`.`TRANSAKCIJA_Id` AS `TRANSAKCIJA_Id`,`t`.`Datum` AS `Datum`,`t`.`Iznos` AS `Iznos`,`t`.`Opis` AS `Opis`,`tip`.`Tip` AS `Tip`,`n`.`Datum` AS `nDatum` from (((`transakcija` `t` join `tip_transakcije` `tip`) join `narudzba` `n`) join `troskovi_oprema` `tt` on(((`t`.`Id` = `tt`.`TRANSAKCIJA_Id`) and (`tt`.`NARUDZBA_Id` = `n`.`Id`) and (`t`.`TIP_TRANSAKCIJE_Id` = `tip`.`Id`)))) where ((`n`.`Obrisan` = FALSE) and (`n`.`OpremaKluba` = TRUE)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prikaz_troskovi_turnir`
--

/*!50001 DROP VIEW IF EXISTS `prikaz_troskovi_turnir`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_troskovi_turnir` AS select `turnir`.`Id` AS `turnirId`,`turnir`.`Naziv` AS `Naziv`,`turnir`.`Datum` AS `turnirDatum`,`t`.`Id` AS `Id`,`t`.`Datum` AS `Datum`,`t`.`Iznos` AS `Iznos`,`t`.`Opis` AS `Opis`,`tip`.`Tip` AS `Tip` from (((`transakcija` `t` join `tip_transakcije` `tip`) join `turnir`) join `troskovi_turnir` `tt` on(((`t`.`Id` = `tt`.`TRANSAKCIJA_Id`) and (`tt`.`TURNIR_Id` = `turnir`.`Id`) and (`t`.`TIP_TRANSAKCIJE_Id` = `tip`.`Id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prikaz_uplata_turnir`
--

/*!50001 DROP VIEW IF EXISTS `prikaz_uplata_turnir`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_uplata_turnir` AS select `o`.`Ime` AS `Ime`,`o`.`Prezime` AS `Prezime`,`o`.`Id` AS `osobaId`,`t`.`Iznos` AS `iznos`,`t`.`Datum` AS `datum`,`t`.`Opis` AS `opis`,`tip`.`Tip` AS `Tip`,`u`.`Id` AS `prijavaId`,`t`.`Id` AS `transakcijaId`,`u`.`TURNIR_Id` AS `TURNIR_Id` from ((((`osoba` `o` join `ucesnik_prijava` `u`) join `transakcija` `t`) join `tip_transakcije` `tip`) join `ucesce_na_turniru` `uc` on(((`o`.`Id` = `u`.`OSOBA_Id`) and (`u`.`Id` = `uc`.`UCESNIK_PRIJAVA_Id`) and (`t`.`Id` = `uc`.`TRANSAKCIJA_Id`) and (`t`.`TIP_TRANSAKCIJE_Id` = `tip`.`Id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-12 16:17:32
