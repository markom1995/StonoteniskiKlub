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
INSERT INTO `kategorija` VALUES (1,'Senior','http://www.stsbih.com.ba/index.php/rang-liste/seniori'),(2,'Seniorka','http://www.stsbih.com.ba/index.php/rang-liste/seniorke'),(3,'Junior','http://www.stsbih.com.ba/index.php/rang-liste/juniori'),(4,'Juniorka','http://www.stsbih.com.ba/index.php/rang-liste/juniorke'),(5,'Kadet','http://www.stsbih.com.ba/index.php/rang-liste/kadeti'),(6,'Kadetkinja','http://www.stsbih.com.ba/index.php/rang-liste/kadetkinje'),(7,'Mlađi kadet','http://www.stsbih.com.ba/index.php/rang-liste/mladi-kadeti'),(8,'Mlađa kadetkinja','http://www.stsbih.com.ba/index.php/rang-liste/mlade-kadetkinje'),(9,'Najmlađi kadet','http://www.stsbih.com.ba/index.php/rang-liste/najmladi-kadeti'),(10,'Najmlađa kadetkinja','http://www.stsbih.com.ba/index.php/rang-liste/najmlade-kadetkinje');
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
INSERT INTO `korisnicki_nalog_tip` VALUES (1,'Administrator'),(2,'Sekretar'),(3,'Trener'),(4,'Računovođa'),(5,'Organizator turnira');
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
  `Pol` char(1) NOT NULL COMMENT 'mora biti M ili Ž',
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
INSERT INTO `osoba` VALUES (3,'2703996105051','Helena','Brkanlic','Zarko','Z','1996-03-03',NULL),(4,'2703996105052','Helena','Brkanlic','Zarko','Z','1996-03-03',NULL),(5,'2703996105053','Helena','Brkanlic','Zarko','Z','1996-03-03',NULL),(6,'0101970100001','Marko','Petar','Markovic','M','1970-01-01',NULL),(8,'0202980100002','Petar','Marko','Petrovic','M','1980-02-02',NULL),(9,'0303971100003','Marija','Milos','Maric','Z','1971-03-03',NULL),(12,'0505993100005','Ana','Janko','Anicic','Z','1993-05-05',NULL),(15,'0404958100004','Jovan','Mitar','Jovanovic','M','1958-04-04',NULL),(16,'0101970100301','Marko','Petar','Markovic','M','1970-01-01',NULL),(18,'0202980100202','Petar','Marko','Petrovic','M','1980-02-02',NULL),(19,'0303971100403','Marija','Milos','Maric','Z','1971-03-03',NULL),(20,'0404958104004','Jovan','Mitar','Jovanovic','M','1958-04-04',NULL),(21,'0505993150005','Ana','Janko','Anicic','Z','1993-05-05',NULL),(22,'0121970100301','Marko','Petar','Markovic','M','1970-01-01',NULL),(23,'1234567890123','Marko','Radovan','Malinovic','M','1995-11-13','�\��\�\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0�\�\0C\0\n\n\n\r\r�\�\0C		\r\r��\0\0�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0\0\0?\0�8n\r\�u\�)TnT��\�*��;\\�G#�jA`��zw\�3p�b\�\�ږ)Ќ0\�^՟��1��vIǭ\0>	\�\�,�p\�\�9\�M�! �q\�RӐ�Q�\�\�ӊm\������=\�\�\�\�&ۓ�����H۟�Nٓ��A��P\�<n\�=hH�^@\0���\�H Z��\0�?�\'�>?�\�/Z\�\\�~Ȅ\�6?\�^G\�\�4\�\�3ᶽ,qi:����O\'��m�\�\�7`�\��t�\�zHˮIۡǥhĠD�\��ҼN\�\�\�;\�f\�~j۞T\�Z�\�\�Ԩ\�G\�k\�_���>\�/�x\�\�Eޕ�D�^\�\�Y�b�\�+`����|a�y\"��d<w\�\�|�{�\0�\�\�!��CĚ�2�\�\�$AO�$\�\�O��\0��h14cR�\'�\�m�|�\�@�\�h94\��o�24?\r�u\'��O��_71�\�\�z���;x+\��\0\��</�\�{\'\�m\�[W\'�\�\�̍\�\�\�dW�K9#�y��y#\�\�jm�����q�O\�?�\�Vns�aL��\�\�=W�\0A�Ns�:\�=$�\� �\�.ݣ8\�Қ\0	\�O�\��޴U�\�`\��qN+��y\�v\�g8<S��\�H�c,	�G�\0wu�m\�\�\�Ҝ\0\�\�$�=ɭ\�����\�\�I�\'9\�W\�{W>FF3��i�� s����T����\�i�Bȧ\����W�����\��u\�˔�mԆ\�c�i\�� )\�Q�,@\�\�\�\0\����S_L|z��\�C\�ڄf,�_��z�w�\�o\�R���~�?JbW�`��\�4D\��*�֮c����TeB�����@\�a�Hv\07����7^x\�\�\��*|Y��e��\�epfa�\�xQ\�\�{�+�<�>é�+\�\�~ox�\�~3�9���e�\�H\�V)�eU-�4һ.1��\�\�\�{g�\�@\�5e&{\�\�\�I4��9>��\�M\n\�H�5�8\r;T\�\�]\�=�\�r�A�\�S�W!>R\0��A\��Iɬ\�t9�[�i���\�n��\0vBّ��C\Z�����}�~\�~����%\��!��&�\�\'�ب,�ボ\�_�\��\�\�\�ū�\�n��\0�48\�\�2\�,\�wI)B[$/#�b��д�\�\�V�}�\�\�4�5ػT\0\�W\�ե�6� E$B/�\�S�dc�C/�5գ\�hã��\�\�9D\�2`b%���|-�\�Űa\0\�w��\��\��u�-�\�\�}�\�\\\����+&�:\�kX�\�{��I���۰t�/�d#���\�>5Xx�\�8�8\�I�`c0\� \���\0e�k���	�mg��;�#�\�\�(n�\0T�\�c�\��W&q\�gV\Z��QF/Fz�=�\�\�ܧ��\�=�<\\�\��?\�\�.�ͩi�\��t\�J�oH\�=G��\�[\Z\'�-5\�q<S\�v\�m2\�#\�\�C\�ך\�cی���\�\�\�\�\�4�r��횘*�\�{�\�&��\�M\�l C��}E@�\r�:�U`�� \�/\�Lu$d�b�\\p=���\�\�\��)6�rr}�J�������\�i� �A�R�`\���w\�?*)Xzf\�@<���\�|\�H|zqH���k0r(X\�$\�:��l��\�98�\�\Z@��\�\�G9�\�*\��\�U\� \�Nz{P41\�a�����)V\��3�\�\�L �\��Ȼpr@\�\�)x�\�\�xcT�	�V\�v_��m����\�\��\�\ZDJ\"/1\��&j��5���h\�W:�\�V�|p���f\n��ē\�k�^/\���}+P�E�@\�m$��x�\�nX��P@8*F(\�vl֖\�Z\�#R\�B�$�^\��\'�\�~$���\�~u��ք�-��,V\��s�8�h�q\Z�6� ��\�~�\��$����y��.�/��:�\��\���Ps\�B���зLW馅�Y�wK�\�t\�x\�,m\"Xa�%\�\"�P=\0��qGԡ�\\��{�����A��{_~�ӧ�\��^�$\�_W�\�|Apyk�WT�W\'\�uU�~x�y�������\�»\�\�z�XVtgx�5�\�+#��\�\��v�\�_�\Zޯ\�\�e<ᶸ��\�%�W\�cR�hĂ�ǃ4�P>\�%�j\����/xs\�\'\��e�	�EiW0�6s/\�a\�\��\�\�$�k\�2<��]^5��e%=,\�\�O\�5\�믄�\�\�$��~xQUu\�u?�\�(��m��ڝ�I\�W#��1\�u�jsq\Z�r\�\�,1�\��\r*��R��OT\�\��\�x�=\�`�I \02I\�+\�?d/�>����#\����vK����\�\"\�#\�H#,�x\����υ���(���F��v�\0Q@LPg\�fn�\�p:�_rx\����\�\��~C\'��\�h�b\�٩j2��%�wT0S�-�Ҿ��:Th<<ggk���/սCI�{F��Wٳ\��O\��Y����sF\��9�K&\�ja-.Pvέ.\�>\�$qT<E��o[x5�Eo��e�%��xdq\�2\�e?\�\'\�b�E�%Tڀt��n�f�%�\Zc\�5\nIr��v�l�>��n�[�\�\�]�\�վ�\�__x[Ys�%\�G\���\0�S�g�\�kTȥI\�0�\�?\Z�D��\0�\�tmN�S\�nÀ{2�ʰ\�`��\�o\�?\Z�\0\�-尵ox\�\�Cos4�.�؟�)]�REc��	��\0#\�z9���d�S���\�\�s���u]���A�1��hv�;g9�=/\��\��i�\�>��E��M��\�p��\�=\�\"�\�d8ǽ}³WBRM]\r$\�t��\�x�\�\�O�&�T\�9��f�[�T!l\�t�a�\0��Zq���\�EC\�I�\0=�TH[ �ӷ\0ߒǑQª��\��$T-�\�Oz���cC!�#���\�ܤq�\�;\�*\01p\0\�\��\�#^�<�s\�\�w1�oZ�*�\�}}j����}1�\0�+[\r;\�/��C�����\�Lm����	��\��\�%#j��\�\��\�d����\�m.	\�%�\�Ѵ{�U\�M�\'*X̮0\�O\nQ\�\�ϲxs\\�?\��[��\�vz�\0�.\�\r6\�3��\�\�\�i\�E���9\�{͇�|2\�m/|\��GS���мUz\�6�BXb��\�:�#�=\r~%\�8�N�G\��dۊN�Iy�m��O��RQ�F\�F�Y\�\���\"�UT(�\�¬)\0\�5d�\�\�~C&\�\��&�<erI$�T��d\0*\��\�%���\�\�^X\��\n��M宧\�\��\�-\Z�%�-���(\���|\�I-\��9\�sK\�\��/�j\�N�n�o�F�0\�~I�\'�8\�~�=�\�4\��&�\�+KŖuׯ��\�\�gԏ�G�\�\"�1�x�\�	��1�\�^A�[{�X�\0�A�\�\r7L��\�o�Zݖ��2\�\�\�wҋk/ijR\�I\�6Lݎv�\�E}&��I\�\��m��Si�\�\�~�R\�ԪC\��gm\��^�a��\'\��5��b�f+X\�\�?\�f\�\�ܚ\�<5\�w\��S�-��\�#�����\�5�\�\nc*\�y*\�At \�FA\�\0�U[�Bq��kĎ6�\�=�\�sVmݽ�=gE%���ox�\�8�q�y� �����C\�\�^�cEu�\�\�#�W�1$U\�\�s(\�x\\���\0A\�ubkNXn^f���kf�\�\n2R�F�#\�/=k/\�:\r��t{�+T���\�\�S[Ρ�ԎU��\�\�2�ǡ���r2MrBR��\�\�\�|�\�-�\��ox\�\���>���,��6�\nJ\�[*�/�6w�5�\�O��+�2�jZ|�>/�tc21]څ�y��\0Z��\��\�W\�7\n�hq�:f�L\"��\0*k\�r�!\�\�\�V��z�\�Fs�\Z�\�\��G\������iմ\�=��]A;�q\�\�Z�?\�S\���񧇣6\�\�nDz��\Z�\�\�w8[�\�7\0�k\�Ї\�k���K1\�\�E\����3\�iŸ\�t5An�{�I���֐�\�\��\�8�DC\nC��)\�P�����j��9\�i�\�J�\�A�\��H`G\�M,L{�0��{G\�\n\�쪿y@�)ȋ��Jdd�@\�<�\'*2Ƈ\�$�\�u\Z\�D�PYOAYZ��g�i�7�\�{x�f|9\'\0\09$�\0�N+P\�:�{ל�g��+ML�qӆ���E|\�q<\\0WX\�?�l����\�=!�\r?go���<��n��i\ZO��\�s�\�zo�\'�;��x\�f� J𤪓���\�v�6��㏆w\ZF�\�/Go\�}gQ�Oҥ��7\Zu\�\�VY0\n&\�*\�ۭx\�\��\03�g�|i\�+�\�i�hVz|��\0n��1I�\0��\�23�mU\�\�\���z��⏊>;|um��\"۵���8\�q\�\�\�套�\�$ݏ�>Z�ۊp�M\Z��\�tWտ�\�\�*b�)�:���\�\�$pj̐	9ҫ:�F0k����PXf�M\�6��k�hz}��\�}z&]3\��mu,G�\�T\�0>\�\�\�O�tm\�\�ɓ\��\0��N\��{���ট�g�7K�d^ׯ�\�\�:ޠ�rI|\�L\���iq<�\���r\n9\�\�:�iF\�-\�\�\��ᢹ\�з�\��8\��*�<!b\�G����2ڡ=H��}[�\�5m#D��\�[���U\�u;m����Ѱᕇ�0\�@\"�\�\�_�u�g�x�Do��Y�,�u	\\�tul��#�^-\�mN�\�\�xO\�\�a�彽����<�Đ��\0�Up���\�\0k\�\�.��\�76�^��\�\�\�c\�^~΢Z����ǡi�\�P<�,1�X�\0�e�$\�OZ	o0\�Y��\�\0\�QM$Qn@�\�;��73m�j\����\�]�H�z\�V�e�^\�f��m֬&��߀{nP\�}�z�|M��5�\�\�\��] �$El~�U�+E������x\�&������b��\�\�_�\�G.\��\�l	8�iG\�{M{\\�\�����\��1q�_U��$G?J�z�H9\0\�Q\�:C�61�ϝ\�\�v�(z��T.o�Y�M\�\�\�h�TK�9\0\�d��G>����y\\s[������|1�x\�\�z���\�\'\��\Z\�d=Ն	\�9\�:�=cq�\�y�]�Iw�\�M�\�\�r\�br�\�ܮ\�_�bM\�p0�\�����\�Ϗ\�P�\�\�\�R@;b�\0�\�&�O\��D�R��\ZMz�<\�TW2�]�#\0gҚ\�\�$i̤��ݟ1 \�k�ӏQ�S\�E?q���f[�w#vN1�ӂ�7�\�ER�v\��$�\�vb$�\�\�\�r2�w.;�`!�\�=i\��\'x\�sX^)�\��\��[M*\�2|˹U3\�台^�m2 \�pA漋\�\�=K���Y\�\�\�\�\�j��n�eΣ|ĥ�1\�9b\�=�4�<[�j����R{�;d�>�[XF?��~y}@��\�/\�\�xZ�\�:���7�n-ƹwVA���\0\�\�M|/�Bt9��\�\�?\��=|\n�Y�\�\�ug/��w�Y���\��J�ן\�Ӵ+E�s�VQ�\��X�8澑\�\�J�H�����\r�W�\�?[QN�\�h�\�.�\�B�i+D*9�(sR��)�����5w5�\�@���\�\�{��\�\�?!�_3�&��@�\��\0=�8\r�\Z�3��d���W��\�br��\�\r7\�\�\�R�:\�嚺<�	��\�/\r\��[I���xÖ(!�\r\��*F;+3�rr\����\0�>��>�<�qusw+\\\�_\�\�e�������囷�\0j�\��I��m\\�\�z�\�0̠�bj���\�|\�eK	F��8ٓ\�\�\�Y\���n��k�J�\�\��铜ׄ�mN��8\�\"�ŀ�kɿe\�\�\�\"$\"�\0P��L]\�+ב@x��%�b�k�o�\�\�=F0!����c�k\�å,[��\�\�e�X��w#\�ʮJ�`p=}\�hF�x)��XQ�<\�N`PT\�W�ڵ��C��\���V\�\�\\�J�\�d\00G�0���\�BVՁm��\�_|{�+�\�#\�\�\�SM\�\�\\��\\\�>� \�\�ח\�C$�:�1�grp@\��\0\�\�z\�x\�ľ\'�cWZ\�&����\�d_�\�\�\�_�p^OR�D��g����c\�r\�\���\�:�9FiH\�<Ы�O\\\�\�\�(\�\��TS|�\�(�V>���I\�O�x7��\0k3T�\��+����m\�\�&�$\�+$�pT0\�L�x\�\��\0h\rv�\0\��\0	|I{�K\�\�qKЦ�Tf\�1\�|Ki\�-.յ:З�J��!�v\'��>��1\�\�\�\�*Q�rG\�ahƫ�ݑ\��\�\�ߊ> �hϊ-tX\�ۤ\�ꮣ\�;�\Z\�w�x7\�G\\�\ZG�5�ľ+�k�Odm\�_�Z�5�u\�S�����;\�\�F{u��7\�K?\�\��ȱ�qBv�#\�W\�\�\�cjB^\�X\��\�\��\�B�Z\�Z��պgčV\�\�:Ɛ<1\�C�XR@��AFXB\�a�\�i\�L\�\�A�c�\�\�\�襸�\���`\�t\�\��z�P\�\�\�9�\�ȹ\�;}+�L�\0KR)+)&\��]�{xi�E���q�V\"}\��j �\0Ry�_$\�Ά��,��j9�\�\�\�	�Җ9�\�\�p	�K]L�v+\�\�\��v�*x��Zh�\�5�}�2�\�Xc�t\�\�:+-Ԇ,MK+�Ga\�Q1,I\�$\��1\�;U�]\�\���\�\�%S����Rs\�\�V�\�x�[� n\��$�:\�C\�!t\�\�\n@?\�#,�qۆ�\\# �¼o��\�~>|MҾ\�\�i�\�Y-�3�{\�W��^\�\r^��s�\0�cSIF^��\�ʜ\�I\�0={UUs�p\�z\�ͻ!�;�˵��<ȥrpiRP2<\�\Z��e5\�ܑ\�o�YX*�%�<\0=k㿋���y�o��6�\���)_\�\\ve�S�W��߀�w+\�1��(�\�\�j֍%\��w\�[�!iq��\�Wk6���\�Jxw�u��ۈ\�\�>U^�k\�t�h\�,���pĪ��}\�\0��.�g�[�v�\�\�c$\�H\�\�\�Vf<�>��pv�w\�_�eym,��Sw{�ݞ_4�\')o�C�s�{�\�\�M�8n*D��\��k\�7\��S�{~�P\��#���h��-Bݡ\�:�U�\n\n�\�O_xG\�֡�\�Јu	\�xom\�9VL~�{q���w�\�a�Kg�x\�\���o\�\�x\Z\�\�\�\�w�r^[��n�d�\�6\�����8\�tf\n+:�v�\�\��L<�����|]�X=����\��\0I��-�\'���3� \��D!\��6\�8����D��<p{c�zOğ�\�~��=R�çW\�n,�Rј<w͈N\�r�O˴�\�3]\�\�o\��\�\���k�h�O\�ѐ\�\�~�o\�\0<\�\Z�гt�����\�Ƅ�:�\�\�[���um\�\�\�2rVN\�KY\�z�\�M��}j\�\����^\�G.?\�18�u�\0g��{�\��^pp+7@Ь�1�Y\�zm�vv6��0�¢��Wo�I�\�U\�\�_�ލZ-0jj1�\0���A\�ӵ~9��W5\�N�8�X�h�\�Sߦ�J)I\�\�\�\�F/S֏0( �i�\�ǵCp\�>�\�%s�ŨdTZ�c��r=*��N\�M\�\�q��<��Hך\�_x&\�\�LI\Z8n<G�5��\01\�V*���\�$s��\��\�z��w\�\�\�\�xs\���l\�	���8�`�`:�\��\�?��\�\�^2\�\�e�\�\�^9�C�[�WA�\�g�>c\�W\�ֿ\�O_]\�\�}wE�k�cD\�b�R?���.\�2�a\r�U�>΃Q�V\n�mZ�]�~\�$y�r�nߏ�ߩ(�o^��2��w��{U�9\0���(�������\�b��r���m\�q�f�\�\0��\�{�a��\�\�U�j\�h\���x\�\�v>��\�_�\���\�Z���f;�ٽ���?\�W�B�8��W=�3�6�<��z\�\����M\�C !�E=��S�Wv�h\�\\�\0�~��\�Τ\\��\�Tk��1��Z7�\�q�\�^{�oǗ^\'\�.t�uR\�\�z\�ٺ���s\"�\�2�\�\"\���ڻ������YcV��蠜~�\�a�J������\�J<\��\�\�V���\��!���\���|3�[\��}��Qd/\r�o\�\'ù \Z�\�Ò�\�-���TIݻ~V\\v\�)��fA\�\�kt9��]��\�n\�a�<�L\�\�\�UT{\n�\�ź/�#_<m��V(uF��vN�\"\��-_��\�!S�W/����\�����ګݔ�\'�&\�\���C)�w��ʹ \�ވyP9�]��;b�K)��e\\\0(��)O�\�EV\��C�>��T\�N�\�|_����l���}OE��V�	�١ṃݓp��\�&3��q��\�\�Ez�!\Z�p�\�C\�\�\'	).�A�\�zo\��\0�rZAp�Y\��K5�\�g\�1\�\�X)�����\�_�\�\��|�f՞\�S���wp���� 0�a^[�\�\�K�c\�M\�m]�\�\�\�V\�E���\�v\�Y�tUf%�\'����\�\�7\�|+�\��\�a�<bR	ۢ[\�j0�ݗ\�A��\�(��\�\�*���W5{7(>\���#\�p��֌j\�ў\�~^I�\�9,5	P�kk�*a70\�r@<�\�\�\�\rIuy&ݞ�W�ᦋ�K\�l4%�K;\��5�\�s �G�ʙ\�\��t\�NNRjJ\�VѮ�}M�ڲз\�o���<K\�\n\�\�i\�ˡix�V\�1�є��ppk��}͑TR(���d�8���#��ώ��?�[��e�\�:���zQiYh\������n���r6\�)=Ey\�\�?�WZ)��\�#[\�j�K()l�\Z\�o\�Ɲ\�lQx\�\�Ѱ\�\�>�&�s&Z\�)6\�d��-ԝ#_�~�t�X�s���D]\�z�\�ּU��mCSuۼ��K�/@�\�rMwP\�\�\r_\�\�\�\�E��JNo�7\�\��s\�K_���ҭ��f\�\�\�^K̗S�\�$\�{�6O��\�]d`\�\�沵_\�~�ԯ\�7�kn&}�Y[�\�\�V���\�\�וJ���/��5��V]�r��jv݂{dՉ\�:c5[;\\\�b��9\�\rWm�\�\�\�\�=X\�qR�m9\�[s�����\\v8\�*d�Mx�\�\����:��5� \�썝�\�v�\�%�ՙ�v\'hb+\� ֻ0\�Z��/d�ʮ�4۹2�Z�t1>8\�\�w�\0�3$\�&\�8�m,Ʌԭ\0��r��v\�z��_��\�ٴۈ�ۻ\�\r\�QD~ѣ\�\�3Gp�o*�)W\'�\n�\�~�\��P��\�\��5{\�]6\�X\�Ȕ\�G�ت����\�@+\�z\�\��p\�,\�E+�C<j\�?3_SZXz0�N�\\����\�N�H\�j6\��3\�f�.�F�1\�\�[�94�\�$6ҍ�3<Jóma�^;�Fi�\�\�47H�KE��\��JW?]�}XfU\�3�=+\�\�\�n\�%��\�\�FVh�{��=32\�:��s*���\�\�\�\�X�R�\�\�<Ɇ\�=\�@+\�\�1\�)̫\�d~��q \�_j��\�\ZS\' �nԌr	ǽYe\�rA%~\\�I�\\`�2=(��S�\�V	�\�:{QJ�d}m\�p	ݚ{>�\'#\�\�T��9zw�\��\02W�{g\�\�zM�����3R���\�\�LsC*\�X�A�^K�\�Ş�{�X0�\�~�\�\�R��\�,\�Vh�\0��\�Xn]�N+آ H\�\�R\�E\�/��VR2\n��\�\�qX*ȥZ)\�\�\�3jU�I\�\���\�׈�\�5~%h\�%���E\�]%������\�cm�r�J�^+\�4���ס2\���F�;\��5#\�A��%�~J�~�\rƥ����\�%2ϣ�91ȣ%\��?+�Ez��\�\�\0x�(�[m\��\�(e�K8e�A�5�y��G/oI�\�ӏ\�\���϶\�b=���\�=ѝ��u�6�0�5\�5{\�\�,tek\�\���X��\"�o�_d1�k/ß\r�\�\��j��\��\0�\�b\�=+Ӵh��ǣ\�vZ\\g�X\�$ �v�MM���K�̓\�j\���]��\�\�L� �X���N\�jmˣz�\�o\�\�qrW����3<��B�{��\r\Z\�m�v2M#�\�!\��9\�\����>$i�\�`3$���\�\�t�5\�sy\'eE��c�\��_~Ҟe��\�>�dnb���=\��]����\Zl1/#\'\��/\�~�\��������\�I�\"�_\�J�\�%#_�C����]\r:v\�c�\�z.����\�J�_�K�^\�O��5\�n?�\�\��9B��Q|\�\�Lg�Yß�\�`4��<\n� y��N)R8Tp\�2�V �2�\�	t\��\�F2\rx��\�\�O�Z[D��y\�\n\n\�\�\'�$�T\�F�Q�m�#\'ҭ�\�\�w\�3*�u+\n\�	]i\�\�7��\����\� �Ƹ_\Zx\�\�^kI�?�\�D$^[Ex!���0\�\�\�X�j�\�|k����E\�O\'��-㛻\�to�\�L�\�%p\�\�#cd\�\�\�\�Wu��#�I�W��˻[���\�t���C���{ß5\�\�!�k��\��/�:�1Y�s�	\�Z�\�h��]\�\�j{[}g\�\�\�\�X\�I<A\�[x�gMÕ\��\�h|G�x�k�:\�t�nK;Y,��K#�����m\��Tc��\�It\�\"FS6\�(?)B��G�ա��%\�ڳi\��BP�Gy\�u9�\�\Zw��\�m7K��N��b;{t�	\���\�l;C95��\�\�:���\��1y�˯�ܮ\�6ɴ8\�\�`sW�pŲF\��ֹ\�)�?i{\���+[\�؊V!0Nrq�J�\�_�\�\�~=귪\�[I��_��\n�G�<�������\0��Z�\�\�k�5�K�kX\�4~\�m4L|\�VP��\���y���\�%\'�v\�\�\�&&\�G\�\��� �\nqM\��z�\�3vӐ;�\�~�ҿ^�\�H\�7�\�@\�q\�G*�l�I<�w4\���-��I\�\�w\0��Ҹw��\��\�\�E4*c\�ʊ�j}|v\�\�=��E\�A �\�\�sR\�(�\��)�Dx\���\�5�&S�\�i�� �?:�L�\�0\�z\��\�w�Y\�\�L\�}ZI\"��l\n\0��T1\�*x<u�6�zB^ɩhW����	Nd�@�6\�)�x�Q��\�\�_�?h_\0xrF�\�\�0^\�.G\�4\�k�I�\�#?S\\U\�\��\��\�^�h�\�\�볭�]�s�ƥ:u�\�R*I�j\�\�Pw��=.x��)/\��\04g��s\n6?\�	�\����%\�x�ƭ�\�7�u�[�\�\�n\Z�[H�C��Q��\�5��?h_����m%�}3E\�;�:]���ĂI�H#�+����Ԧ���\n��\�K�\�\�mo&��.\�\���\�\0\�\n��$�У�U����Z\�$��=|iκ�\�\�\�}�\�Xx�����oc٧\�[=�,@.�Â�\�8#\�|��M�\�^��7y�{6�Z��!�S�rq(C��\�\Z\�o@\�9\�}%y�ɂ\�!\�\�\�5\�|4ۨ|@����[ث\�\�j��c_�\�13�J�䔹m%{\�+\�}]Z|ҊN\�\��I\��G\�\�é4\�e�e\�t�ج�\�\�v\�n�\��X�b�T�׶|0\��a�\�&/kv\Z栬�\�}�[�ƪ[q%��,O\'�\�]0�z��S�\�e}+��\�SQmݽ\���E\�i\nN.\�M\�D.£\'��2f0�\�85.\��|��Az\�H�0ɍ\�+\�[��&p\�\�r1\�Y��\�$\�H# q�TIf\�ϐxȫ\�1�dq\�k)YY\�\�P7�\�ұ��\�$��\�~X\�l�\\�9�\�\�\�h�\0?�\'\�\'{h5;��\�_ieH\�ǰ8\�O|V�xʬ\�8+\��Dɨ�f�8\�[��\�_[)+�M2��\�B�\�Ezd\ZW�\��Ƽ\�\�?\�\Z�fP���@\���\�6?5\�pO2K�ħ�5\�\�<ʢ�����h\��Y\�x�\\\���KS��;G�i�eh\�.ꥂ�rGJ�\�\�~3Ѽ{�K\�:ށp/4����\\dW�b;�\�\�\�޾���g��WưNJ\�t��b�]\���k�\�M�潣i�j6:�������\��fA\�.\�1�\�\�W\�<��HT\�\�̝���\�c�\n�H\�[n}\\�\� u�[i\�P�\�_]\�C�߇5\�(YCyЅ��g\'\�\�u���D\�<5\�4o�\�Cx�Z&����V!�\�_���օO����#*d\�����\�Uq�e\�y;�ָ\�\�\�\�V\�6\'��\��Ť	&Lh7�(�\�ߕ��J\��zC��+s˃\�~B�wC��_���\�A�}t�f\���zE\�����ر\�\Z��+\�uO��\0�Y)�^\�\�\r�n�\�\����?ڑ�P~���=\�?\�(�I-\�\�y�7�^{�=Y\��\���^�YN�ds�x[PԘ>�\�jRw-�4+�*\0ek\�	4�i�[]]\��>V�R��P�p~�WoEO3\�\��}s\�\�kh5H\�\�\�\�B�-\�8�8`xa\�\�z\�0=+����\�W\Z�S\�m>�b�����%O\�]�\�N(c<sㅉ���u00�,�w :~�ת~\�z\�\��\0��=\�\�z>\�\�\�\���\0j\�~0\�O�xP)k�M��c��\�\�~+�W�xg\�ڗ�5=+ź�j\Zs�\�S8YT��&�V\\��zW��\�^;Wڲ�\�t᪪5c7�g\�4���D\�\�Ey�\�\�^\�\�3��i���}n+\��T�[�Ƿ=rU�H\�l�.����Y�>�\�]\�+�k��u��d�\�w�#\�\\w\�	\��\�\�\Z�o4ئ\�mu}6\�+̰u��FW��׌���b���\\+O�M9h�\�����R\Z\�_�\�\�}-ڱ��{�՛;��?\�|\�֩ۑ�GVo\�iֳG\�<��8\�\�j�\��QҍNH�\�z@��dG~��@D��[r�\"��k�\�\���Ҕ���\�cOh���I�(a\�\�.&v���=�\��\0i\rG�ׇ<;�_\�\Z+�XZH q\�F\��c�a\��\n�	�\Z0 �־q\��	�\��\0����8ol\�\��^�e�\�\�\�f�[\"���ݸp[<\�\n��x\�5e���\�\�כ\�sb\�QJ�v;�\�\r�?[\�\ZƯ��\�3F\�]$F%�\�G\��\�Q�=ؚ\�!2�	�8\'�5:\�^ NN�[�U\�\�;W5|D�u*=_\�\�1PI#����\�����_6\�	�\\(p�\��j��ӴSqm\�\�	\�\���\��!��S_f�\�_ ���\�\�U�R\�n#�\���m���\��\�\r|\��\�O:�īI1��\�Y.�\�;���n�۸3	<>^\�M[�\�zw>K6��VQ�D{\�F�8\\\�\�\�\�<���f�O�I�ݸA�U>�\�+s��W\�&\�\nt?�Hnүο����jM�\�z$ï�a�\�\�x�J񨸊\�Y!��%nl.d\�\�2�\�\�:��)��\�k]~\�\�6\�I�\\[k�\�n-\�	1\��6�\���\�N2\�h\�F�6�6��G�s�\�\�\�T��n|�\�]\�\��|�\0����\�v1\�z\�ފ\��3=�\�\�zeR\�\�y�\�QK�F\r\0s�,��\�}v\02\�\�F_��\��֏�/���\r6�97�J~���֧\�a��˸\�\�\�5\"�~He�}\�\�NH�E?�G���D#+\0\�A�w�M֐����I��\�S5�?\����D��+\�\Z�ύ\�\Zv���-�e�4ܭʨɒݏ\��*~a�Ӌ\�`�OFѼg��z[��;Rh����)�\�\�0�7+�ᤉ�V;[ W՟\�f�a�]\�7I��us\�+�?\�\r_��\Z�\��\�Z5ѵ\�,e[�;�\�9�V\�\Z�\'��{L�\���-DE7��fԴ\�\�}�p�e �Vꧺ�����\�L\\38]\���\�\�e��R��-O3��\�\�x��R�\��+}B\��\������&Eހ�\�J��ҺE��aާ�x\�{\�^\�>\Z|k}3H\��;Y\�Vh\�M�\�A1\�\���\�ҽ�[ԅs�`�~m��\nU�w$\��\�sݥ&\�ԷZ\��kE1�\0�O�\���e�k\�z�$\��\�n3�d�\��p�y��\�\�ljڧ#�qQ\�/�p6����\"��d\�d���9e1\�\�pA��\'\�/coR��\�\�\�+k�i<�2\�p�\�\�p\�O�\Z\�~\Z�\"\�\�zn�uMPk:ƫz�׷\�\0�]ʪ(T\�UU\0�֪J\�4�y\�d�H��X.}k��\nn�Z���\�B\ZM�=\�<lcG\\�\�\�c\�W\r�⵷�e�\�l-�]�f��\�-[\�s�\0=$=#��\�\�a�]��\�JwW�~ԟ`�S\����\�\�z\�meg(E�c�}\�Y�\�@NM\�W��\�~���.^f�[|ߡ�\"���\�ݑ�\�v:�Žn�\��u�J\�6�����\�g3\��\������ρz3&�{�ʅd\�f\�G\"�S����,�\�%\�\�t�ј\�_\�崤\�?�,�}q�}Z��Ӭa\�,`��A �v\0`\n���IP�\ZK�H�\n���r\�X��+S0��iI��kT���\�/\�\�%O\�@5�M�w\�\��\�#�\�\���lt4\�!3h�\�?�h\�\�Ex\�f,�\����qE\0}�O)��4\0\�)��\�@\r��A�\�#\\�\�c���{@G\�\�]E\�����t\�1�J�<\�}\�~lƀ:\�x\�\�\'�EWFYH\� �A��|E\�\�<\�6ҙX\�%�ӥ=\0\�Г꽽V�_�?�?�\�7�\�:z�̈́ʰ\�z������z/U=�\�:����t	��O�0�\��42�\��\�\�3^	l\�0\�qa��\�?�ql����Ð}\�*�)\�\�J�Ut՚.�9)E٣�\��\�N�\�\�ľ\Z\��\�s\�/U�Q B˵���\�a�e<�؊\�;��g�ۦ�=�\��Β\��&9\�j�$q���>g�\0�\�|C\�^I,\���u\��\�\�Bq\�\�?��\�G#��\r\�u(5{(o-%K�I\�Yb�&��2H\����ܮ�W5FZ\�\�.\�۵϶�\�!��2\��_��\�v\0=F\nYF\�\��U���� c\�V9;���Y\����\�&H]� V|r��8\�Rj���3�\�z�ς%��R�O �\�;;�ɏI �\0�I\�_���\�cߞr\0��ڮ�k�\�\�qw<v\��#I$��TE%���\n��\�J1Z�鹟\�\��)�\�\�\�\��e���7�UGvc���\�?�\�P��\�\�KŚ\�\�p6�n͕��+�\�,{�5\�~\�%�\�\�d�\�\�?i�g\�\�\�87?�:*�s޼�\��\��!\ZpR4�VW\�%�XA�=[\�}k�^Ȗ[K\��\�$�\�|va����pz/ŝ��O�\�q⋸\�K|�+4a\�[��\�\�\�?LW�S`� �#ETEP��0\0\0��6\�\�7s\�E;mi\0\�A��m��ʻ�9��u)�\�n�	_��*\�݁���Pٺz�\�@j\�E\0QE\0g��\�Zh\Z�\�\�Gk+�F�߇0o�~3\�lb?�\��\�?\�M�\��}���\�\�_�a��[�5��\�l�@��\��\0�T\�O�(��@\�_|\r-�k\�.\"���m�\�s\0\��\�\�^�A\0�\Z�\�̶�0\�\�4L$�EʟQ\�?B+\�?e�\��j�����\0�J�]�7r�\Zt�ձ=\"bx�\�>��\�\�W\�y49\�\��R�1-}�\�>�\�e�va�J:�k��K}Z\�2��\�e�\�\�?G2\�ʅe{�\��h\�^T&�~���D\�p\�\�4\��\�\�>��\��H��ş\�\�\�3DZ.�;\�\�Q\�\�F?\�\�c\�q\�W\�rI\�>\��k�\�4\�\�ex�P��u\���>\"8�)\�\�\�.-��U\�\�u�\�y�wpr�\��.ߔ\��\�sz�\0�t�\0闺��y��j�Y�%8H���:�9T|�Wo�s�\�E]�����e=\�ĩ�*d�I\"*��I<\0+\�\�7���\�\r\��$��\r��4\�(��\�u8\�\��T><~\�ڏƋ�\�t\�6�\�l��\�I�\�\�U;�w\�ޕ\�q\�y�jPh�DBmFu\�\�\��#�\�=;�+�~᥄\�\�\�׿\�v�>S�{KҤ�\���ga{\�-Z-G��P\�NFR\�>�\�\���\�\�\�>𵗄4H4\�$\�q�\�#}��\�c݉�~�=��4�mo��d;\�n�|�\�z�OA\�\n\�F{W譞\0��Q���Qϵ �(\�Ҏ}�\�ڀ�*��r-4�\�\�\0G�O��\\\�ڹ��W�\��> �<���~��G��@c\�\�\�\�@\�f*	�\�\'\'\�\�^ˠi\�i�i�yc�Vѧ\�QT�\�'),(24,'1234567890321','Dario','Marko','Pejić','M','2005-01-01',NULL),(27,'123456789021','Srđan','Marko','Samardžija','M','2000-01-01',NULL),(28,'1312995100024','?or?e',NULL,'Turja?anin','M','1995-12-13',NULL),(29,'0101990100080','Jovan','Mitar','Jovanovic','M','1990-01-01',NULL),(30,'0202991100081','Stevan','Pajo','Stevanovic','M','1991-02-02',NULL),(31,'0303992100082','Marija','Gvido','Maric','Z','1992-03-03',NULL),(33,'0606961100006','Mitar','Jovance','Miric','M','1961-06-06',NULL),(34,'0101960100025','Dejan','Lazar','Dejanovic','M','1960-01-01',NULL),(35,'1234567890122','Marko',NULL,'Malinović','M','2018-01-04',NULL),(38,'1472583691472','Mile','Milance','Milic','M','2018-01-01','�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0			\n		\r\r # #%$$\Z(,)%+!$&%#	# # #$$$$#$###$$$$$$$$$$$$$#$$$$$$$$$$$$$$$$$$$$$�\�\0 \0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0\0\0\0\0�:\� ����|\�\0{fY�\�\�9S���\�*$\�L\�Zڙ�;ctL��\�x�\Z��\�\�Ɓ��/Ξ��GX�q��\�=2\�\��+^m�Y���K�E�Fښ\"\�\�\������\�jc�O(�LK\����\"$�+�B�\�Yf.���x\�+�߷\�H�Z\�5�\�&H\�\�^-J���L��\"{w��\�$=%�\�\�\0\�m��<2\�)\���\���}]-\��ϖ��f�dhku\����NB�zf�Fꊲ�[P��6�\�L\0\�r\�\�!,���\�8z\�M��#�f�3R��/%��FBb�\�aJH\�(\�bUe�.�\'�\�\ZS��*HSx��~�$^\�\�uc1��\�e\�,��bgH�X4t��w\�I��	d�_���\�R�\�2��M�2f\��p�\Z�+�j\�\�]s�\�ᑃ^읇3\�Uك���C^�\�D���7\0\�{�n���\��[��\")���\�(\�zP\\a��W��609-Ӵ�Y�\���L\�0���i�H\��䀞;��Օl��;���$ʝ4m���\���d]��4\�1�ew�\�\�9�\�*�*\�\rC�`Q\'��� )!\��b0�\�\�S<��OJ�	\n�\r�~Tu�\�\�\�f�\�\�tL5�ݵ\��\�t�(4m��a)te/\�I3�s\n�d(��#�2F�A�1��9\�\"Φ��rWkj\'��O.F��%�YSx\�G�W�t�}\�q6�m��\�F\�\�~3V\�\�ҥ��\0g@L�ִv�8���U�B\�z\�\�,�\�\"S��+R�\�\�|\��\�A	D�=�\��\"\�v�\�\�G8�x\�j������)S� LU\�	���\�\�͞fE�౔O2G����o�~�xRƑ\Zc\�󴍅W˜\\&\�҉\�\�Rt��C�\Z\0Ҙ�hZ$R9��הl�\�Jwxr7\�ֲR�g\0�\�KLB��^�S0��\\\�\�|�N7��}� \�/��tԘ�g�\�A.\�Zs7\�P��1O\�+PC$mW�R0B����\�\� �(W\�\�\�\\�T�\�wr�Ϭ��*^�jL@}\�ٵ�Wt\�#\�ulm��ם����%\'���\�!23�\�~g@\Z�k���s\�J�\n�\�)\�SZ\"=��\�\�-]��*(\�O?8\'�\�ӓ\�\�\�/���\�Q\�;��,\�j�Tb\�^�Eu?X�E#�\�U4i�.S�334�\�בܗX\�Z\�~{@\�\�\�9D\�\����!��7՗9\�.��\�#՚�\�\�d�\�C\Zb�T1fԭ^��\��[�b\��_Gx@�֔�>z��\�\Z�\�p\�^�N�è3T�&=\�\�St?F��Jr\�KY>�\�*fu��VB�a�\rd;?�\�R�\���0�\�/4\�V^\�K�\�Z�\�\�y�����\'�v֦tjyj�\�(8`�>�\�4�=��Û�e���\�lр{\�k��K\�dq\']�\�ڳW\�U�͗!)S��\��y��$G1\�Q��\���N5\n�[\�)U\0�=\�=q��\�3u�N�gFdI+��\�N������CrJFĽ\�Zs6@\�@�/��J�lK\�{�/V\�P��\�)�|���As]\�\'\'vJ\�.\�\�mmL�\�sq\�F�X05\"9\�~�AF�:H�_�\�\��Z3�\�=��y\�]��)N�k\�\�C�jf  N�ŎrK3W�\�\�v2\�ڛ��w�\Z�:F�\�\�_\�\�w��#h��\�5K��\�%\�^|�4$JY�V\�\�z\"飳�	��:pr�@�mG\�w}�4W!\�-�����$�VXVݖ~z���\��b�R�sW�e\n�(ڕ7=DW�/F�\�<�n�\0.	)\�\�ٛ<\Z\����Ȱ�\�5T5�0�R���Zg;�\��\��\0\\X�o���#\�<v�K\��H�Ŷ3\�<	\�\�+\�\�Y1�Q��\nR��4�w� �ɋ$=ރ\�T�q�?1P���I\�)\�k\�*Pͪ�\�\�XPw;ɕ����\�R#��v\�ώ�PH$��ؕ���u��O�\r��\�Ǚs^\�\�\�\�C\\֚�\�r�\0�M\�U�o&\�]n6���^��tN,�8B6n\��KyS�\�P\���AQ�meT7Ԛ���~]�R��\Z��8a;O0?\�sy�d�U�\����y\�\�\�N%\�TmC���̓m9�\�\'W�\�kלե�en��\�\�ePv\�\�p\�\Z�_�\�\�\�\�\�b\�@^�>�\�:�>\�CO��P߹>\�\�{�����D�g�OV\�=)�[�\�iw\�\Z\�\�\�\ra��g\�o��¨m\n�\�}��\�\�\�qB_Z\�sH�\��\0|��].m~a~g��\Z�	�C\�\�)}l��y�N\Z\�2�L+\�\'\�\�ޠ\�$2a\��~��E�E�\rŪ�\�\���)�JG\�Tk\�\0zxqfx�I\�\',=\�uӗ��;Q`o\�F�\rĀ�8٘Ӏk�0�4�7\0\�w�\�q�N\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0\0\0\0��U2�H5Q0�fG\0��3�u\�n]\�\�أ<��j1�5��lճ8✍\�\��0\�S�3#F�\�M&\�\�ӂ�NY\�+j:3a�S<��]\� `[!��v\�;F\��8�\r� \�yH�5\n-�ӷB9���Pp*\ram�\�i�錷\"�E��Q�M�4kd:n��r�J���X�\�J�t�=E��h\�6U\�����#���n\�\�\��+����Vc\�o\n\�\0FȨp8��\'\�gi�5�\�up\�5�-��\�\�aR��ٹ�D{)d�MB��ow-b�v��\�\�H�\0p�K/KǶiZ��I#�\�7f�DE4)Җ>v~F�w\��i�ϻ>�X�g٘@q6\�\0\�	�z(�~\�am\�zV::5�&\�$�a�>\�\�K��\�,\�\�&�q�z&�]�AC\�6n�n:\�\�\�	82d\Z9#�w\\����\�tk�\�\�6L\�\�׮O\�m`\�d,�;7\��\0E\�\�j\�0\r��P7\�\r�L��^�\��\�\�,/�����hو\�d�A��a)!f�L\��k\��֕��\r}�Fj5s�d�MS�8\r�ҳ\���	\�հ͹�#XG5l�h��[\�q%���ٹ�a��\�#\�x�\�s;�A��2��T\�\�\�$�,�[�\\Z\�c���e\rѓD۷aT\�\Z�3`�MTp\�A]#+�8�f1j)\�Q@\��e`zC�NW���Ɲ���]_�\�.=8�\�@\�_\�\�X.H`���\�D\�)�-b��f߇duBh�U\�D��\�F��_�\�O̦\�EЧCh�X��G4N�+w��Yi\�d\'��V�u��n\�JI��\������\��mыhZ�tJL�i���p�H\�FƦ(ZE\�\�d\�|\�\�2���\�F.1��\�L2\0T\���o\���q�\��B�Z׶W+��GAE\'\���\�;�a[.��Uf�S��H\�\�L\�\�~(`�ESk[\'\�\�B9$��f+\�4�x�\�4\Z ��\�{��\�}\�%�kU��s�\0I�c�\�)H\�\�*V���\�:\�3\�\�^�\�,\�E���ó\�\�F\�\�\�qx�@\�W`��VQ�&F\�\n�n�\�\�Tm�\�So\\�u!	��\�T\�\�B\�U\�\�#$�c�\�EOW�\�3\��\�\Z�f)�L3��@��)[\�*t�\�I\���VZ\�\�NI\\,0�\�-M��\�}F�\�\�fB�^�W\�\�&l��A\\�c�j|*4]!\�ǒ/^\�(�0���\�-,k�\�M��_CmY\�\�\��r�]�C�\�)&Q%���q-0q\�C�Ǯda\�N\�\�\�*1GOE1I�h��D\�㾅\�#+�\�\n\�tjh6 08]R��	pi��\�\���TH�NDۨM5\�\n=���n�u\�\�^69�\"�I\��4`�MF�6�D&�\�\�P�>���\�\�>��e�}3U���׫\��n\�C�@~���\n\0Л�Ч;ֹ�\Z];鷮a5nr�`\�ef\�S5Fc\�H\�+0P�-�A�\��Ď@P\�\0]6�\� �\�l�[=�\�\�R5�ԃ�)\�\�pf[\�n�^���e\�B|Dt\0\�p\�V\�r�E�Ĥԕv�]�h�q0���};)9�e���]�DŶ�l�\�@\0\�\0�\�%\\˹YIY���B:�\�Xh�J?���2�\�\�\r���\�7f\0\�`&L\04\0\0\�D\�9㕞����\�Tig�LzN\�\�إsJF�i�V`cY2nӀp���\�I����?LNy(��K/aY^��pHX\���\��\�q���@0�nّ�:<\�D1�G�\ZHo�]#\�\�L6yWծ�LCK}�&�r.+���\nZ�B\�\�K�o���Z��ޅ?1P�Vf\�Tl\�\�I=\�o8�ʜh ��\0����ҪQכ^	\�\r\���������C?��R�-�y\�[\�}}\�\�?$��t\�}c\�<�G�6lG_���H��\�\Z�g\�O\r�\Z�A~�\�DVi5*{_F\�\�Ҽ\�N�\�ȇ�\�\��\�Ŵ|�\�vʖ	\�\�>֒�\'�4�;&\�):�PΏ�|��n���H��\���F�a\�\Z�~��\�XF�Y\�\�Z�\�b~��{�\�:\�\��\�\��c󮅜{p[\�^E�Ն�\�ۭ\'\�u�7\�x���Kj�\�2US\�\��l�_B�V�enU	h\�es8��\�\�M.i9\�	;9\nY���\�\�:T\�Z\r\"\�o��O�ک\�\�e��?f�o\�w�%\�G88W�C�p�d\�\0\0����n��A$�)�4�\�8NP.�(�\�Փ\\tuN�$@\�u�\'2\�\�\�RL\0D�`\0+�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0�\�%�\rii\�\�i!\r,H3\rW\r$\\m�܌2\�I\��\�\�HPK�\�5�b\�!�\�\�)\�@\�ԬIj\���.=OI\��\�D\� \�HB���a�m>]&l�\��(�;\nw\�X��unhR�\"\�\�\�y��\�Ny%/$�H\���˥����x\�\�\� \�\�\�v]��[��\�%�K\\EtЧ<���I	�i�\���:i\�����\�\�1/*�G\���\��	\�0Ē\�9$\�����>�\�Nf�B\Zrv���%8?��wo+\�G]��I.JҲA¼r|�\�U&�	-K�B]�����Q}9b-�ߪk\�d�Ӭ9yh��\�9i\�\�\�\�ԯh���[��\�X}\�n(��)2\�\��!�J\�\�\�\�\r/\'�4Z\'\��1�V�΍pC��JI�|d�\�\�\�\��$q�WeIYA����\�}����������\���:I\�d1\\79̒�=�5�Gu\�l@\�\�2�=�>;볮Щضp\�K�@�h`�\��}>_8\�:ˌw����>\\t\'u4���\0Z�:Z�f,���X�=�\�!4�˨\�_M��\�;:�N\�|� \�rt\�\����\�:橗T�\�\�\\��\Z�i̙\\\�M\\\\xW]t�� \�!	\�a�Ta�M>��\�R\���y�\�T�E����\�\�TK�ܿ<�\r:ä�$	\�QAwA�F>(ק�c�Q�\�-b�廠\�\�0R՝0�\�\�\�yꝦ^w�1�Q\\���d�\�\�{\�r3aHYr�gnay\�\�\�5v-f\�\"�\�֞uc�Γ��\�Ťڌ9b�&��BN\\ۺ\�d\�g/7�6I\�t�(m\����;/�\"�d\����\�L\\��%\'}N\n\�r�nC�\�c	k3r�\�\�ޔ~iw\�L���%�{�$\�X�\�2� \�\�h՗���K����~q\'}v\r\\f\�#�\�;A\�\�ع*?��3��	\�Zv]�6D�2�\�^�\�`d\�l\�\�\�nے��\�u~N\��%��\�\�\�\�8t#,�k\�x�\�$�\�bӌ%\�v|������\�9%\�1vI\�\\r���5�w�ԛ:3CK2�J\�J\�\�.<Zz��\�5`�юN\rxA�I8V\�\�\�X\�\�`\�$��В���[	m�spH\� �����I%xG<4��\�/݇y	�Iӯ�\�󒔢B\��\���8F	y\�\�;$�N���򓓳�\�4^T@\\��6,\�:�\�X�\�,�*[\��NI$��p\�\�\�\��%4w;:̱z�����gn\�e�S^p��p�8\�g�/`K\�y$��CF\�J2[\�\"\�]�KO2ZbЄ�7{(N�������%%\�A�,3�{�\�܌H�\�\�{+\r�����\�{N��)I:KϞ��I*KS���\0\�FV�;��J/�α�wy\�^�19r5\��K�\�\�揭\�3L\�\�\���.�~�4\�p��s�[S\�/�\�v&V\�\�z{\Z�w[�G`Y\�\�f�\�˿�/	���\�V��\��ή���\�ě��o��*yO��Y�8c�)\�~s�\�MO�?+\�|\�g�\�O\��G�\�|�^\�8�\0\���\��u�\�\�����x}O���\����y/�\�>I��\07\��R\�/��\Z����\�~�\�|w��n\����\�\�\�dk\�5\�.��~\��ZڸU�^/o\�\�c�_\�9��~�{帪���|]_�\�k|\�\���m��cS\�z\�}���_O/\'t7����Cs�L�\�Y���+�a$݅��2\�bE\�\�S)�\�7X�s5��L��^I;	Yh.�d����4^\�䓄c�_>����\�b䬬�wW?\�I$)+9!oy)\�ܒK���\�ga	\�%�\�+-$���\�\0L\0	\0\0\0!1 \"2AQ5Raq�03BCTrs���\�#4Sb�����\�\�D��\�$@���\�\0\0?�!F\�IV\�y��{�fY�r��R3@�4S�\�<��ǚ�e\�X|[�s,FN�S�TJ)�.r���^�8�	\�\'?]T־�\"Nu\�\�\��\�W\�B�-��\�A\�\�L�Y:�����Uk�N޵\�Z�܃\�^&�Ϗڟ�\�m\�j~V\�ƟQRRTG׍\�c��\�\�[��\�G�5�Ђ\n0�c\�B#%7ث_�R�QMe\�<� \�\�����)\�\�H�H�\�W\�em�\�\�d|`r}:�+\'(\�%��(\�rT�\�K�բ8�O�4�\���\�Վ�?�hj}][�̷��)\�\�\r=t\�^�w4I�\�\�QU\�\��F:\�;�J|o�\�\�ǟ\0�\�0\�bG-1�\�ͺP��GwZr\�eZu)\�\�8on\�-\�6HOb~�K[Etm�D�ӽ\�sl�\�@�=:�66�84zT�{Πݳ\�w+X\�[L�\�\�\���\��\��wz\�Ga\�)�\�r=S\�SD@wM��<�>\��v�UH�ww���\�R7U\0\�cZ8\��-�R?(M&\�&���u�>\�ʭڔ\�*!�\�zPCDU�\�O`\�В�+�)\�\�6\�\'e�����\�Jg�\�Z�ލ\��\0\�֥�t�Y��_B�\�L�>�\�\�jѵ�bhh�)��-\�8#\�w�dr>7��B�����9,%�\�UT\�~\�6��\�i3\�o7M�\�\\�?1Lm�aQG�XT9Y�b\�ԅRu)ʐt������E�GY		H:h��\��k�.\�{N\�#��+!\�zh\�K&M$��M\�\Z�����JX\�f\�\���\�j��L	\�O\�\�6�C`qi�t!2FWA�\�\n\�?���7\�;x�6�Q�^�\�[�\�g\�\�L��@\�\�a���4Lh�?R\�滜�:�P�ʞK��mO=[Zmu-P#��N��)����J��,�E~i\�6\�\Z#(�*��\�Fμ����\�\�:Ǯ\��t\�(ܝ�<\'�U�KØP\�ω\�\�\��UW*�\�\�\�\��9\�\�i�1\�\n��\"r\�\�w��\�q�\�]\�h,�\n��!a��\�Ud�X�	�)\�\�E<\�a\�1�����&{ݡNF�	�á�e@�֥$��\'\�PAv������٨�\�UEb{x�6o����\�j;Qx\'���ɶY�V\�GQ�}���G��\�n���7\Z*aw*q`����\�M���j�,=�!Q�6�Rk*\�.J$\�*Cs��x<�T\�\�I\�Y\�\�{Si\�\�\�({-\�N\Z�[D]B�i\';��\��\�8\�Y\��bF۵Z\�#\�\�6\�(<V/`��̇�D�\n�yF�GǕ\���U\�O\n@�\�5;J�:�\�vx,�o�%K�B\�\�Tl\�P�E��6�\�\�\r�<X�Т\r\Z�\� EbrܹTJyN+\r�y-\�ꪁȜ\�H\"\�\��{V\�ɴe\�26��5R���r�)jl��1\�\�I\��\0j<QA�lrX,Hފ�O�\�\�,\�5�?��RS2Ap���u1B�s�Nj�<\Z�\"@l\��\�p� \�)\0��7ʷG���]Ӻ\�P��\�y�<\�\�\r�J`P�a�\�\�)\�ر\�\�1➜�~���3l���<w,��\'\�pLi\'U�+.����pDY590\�n��;k�\r�\�R3aU\'�\�\'��\�w�P\�-��b�e\��>�\�ZcܟN{��!H\�j!�@+��Rƈ�\�\�\0�P\�\�UM�n�\�\�\�PΥm)ӊ�\�)^\Z\\\�\�Ob���N��\�\�\Z��e\�%1qXu	m�x,B[2ʵ�*b�S�\�\Z�\0\�T\�e�uӥ١]\�Ib�1��\'f��h\�]S\�u	̺ �S8���mw7:oO\n��\�X)�\�rd�P\�(\��nW!N��RG\Zu4eM@UTҖ�)\"�sQ	����@�#f]�q�O�~�б*<�\�0i\�\�\\�\�<(�\Z\�<T���\n�;\�a4@\�F�h֬N~*y.J�\�\�v�$-\Z \�?�P���UMEΉ�/)�\�wc\�R\�\�3+Q}��\�T\�\n\�Qm�Ne�\rLC���Ȟm\��H� �\�\�G\�E\�s&�6DɈ\�Pԕ\rN��ᢒ7��\�=\Zq3xj�\�{\�S\�d\�BhQ��\�)��9�eP�?���I߂��t:i�����j��\�*DqJ��23����\�r��mSJ�\�\'<\�DfPR�2��N�T\�g�B�\�\�`V@�\Z\"\�\��6\��%s\��\�)\�4��ѝ�A\�9�\�QM�mM�H:o\�B&��R�\�~\ZF�*�2���5Q�m\�=�%�88&\��2|�ZH�\�\�}I���X[n\�����V�quQ%\�R�<��\�\�N�QZ��k�|���@�\�	\�4���\�Qek\"�&=9\�\'9]=m\�R\�\�ŧ2\�<@KO^\�\rrk\�zMz�M��Y\�=(V(��x�0J\�V#�ؒ���\�9�\rT1\�KP�S\�GnW\�\�M\'�����\�K���PMP,)\�{V�x̫�\�s��*R��gn\�%�-�k��!�48u�&=�\�1D\�M~\��N\�S/t\�\�����\��\0�S>\�\�x�D\nMzA\�:-�lǽR�������5X�ԵORS#\�Q��\�Z�OEv�\����d�(U�!S\�{\�\"��j�m��NEF��S���\�g0&Ir�.��;@�w�i�\�\�*\�\�`U*�\�u&�\Z\�d��t\�\n@���g[\���\��\��\�B�\�۪�\�S�w�� �ܧ:��\�rf�S�\�\�\�\�\�īi\r,��-\�\���(\�!\�,><\�fF*\�\�\'�Sx�5O\�T�\n\�\�,Tc�8.ݎ\��xj�nva�G��l���-!ËM\�\�<.��g�\��\0I1�����WWD��]���+S*\�TX���rLdJ�������r�R�N\�\�`��aq\\\�ڱ0S�}ɪ ��gD��H/eVuR\'\"��\�5=H\��Z\�+++(�\�\�M\�Wz\�v�*�3\�%�M�\�dB��*i\�0\�\�g�\�#��Hߢ���\�]F\�\��M�6uL\�E\�@\�ؘ܀��\�U0\�8lpGc8�]��c�`��Z\���q+�\�n��!P�\�*6\�\�{�\'5˕A�zrrjg\�\"js.�²��ł`\�P�,�����Ce��\�%\�\�j�%]S\�\�y�;8�\�r��H\"\�i��\�6����@�\n�\�X�̛*���d�exU-\�R4UT���dg\�h��9)�\�U�>\'�3���,5�pU,�\�\�1ONE7�	�\�m\�\0M\��\�\���]��Pz�\�\�k���_�\\\�>\�⯷�d�~Pz2|=�U�o��\�wP\�\�\n���=�\�5�ڦrrB�ٗ_R<�`�uK��\n�\0����q,�Ѳ\��S�\�)��l�P\��\�̮\�m\�j���=�\0��\�b�\�\�KH\�\�\��\0\�>)_����&I}Z\����a\�0���\�7\�{P\�h\�\�գ�&a\�ysx<A\�-�&R@\r�Q����;\�\����7�r���и1���E�Ը\�xʌ>6\���\�ƪÚ+^\�r�	\�99v\�c�\��	�\�\�\�d\Z�m%J\�pu�}�_a\�}�\�b��\Z\�\Z�\�@,\�{\�F-3�ڏ� �@�\�ۼ6#md�\"�7	�\�,�?\�b��Zp�\�\�m��{��\�\��\�G�F�zjhh\"\�[�-�u�a\�\0ѩ=�rSi�\�\�u���\�\�^\�v�\�\��V�������W\�\�\���\�ǘ�!��\Z��5\Z\�;�����g\�Xl\�\\\'�\�V҉pUpX�H,��M7��D\�\'��,�U\�(�#�}\�=]}�\�t\n��F�9\�\�P��wY�����\�\rQ��aژ\�:8\�=�Yz�}+�)\�L5�\�^|бz\�<k[Qe�bs��K==�\�\�9o	\�(�J$\�>������p��Q�y�H�\�J\�\�TsX��\n�V)KbM�C-t��ƛ#�AY�MyM��\�2t�ˊ<v]H\�zɮ烵\�\�aU\��Cr\'H�uF�\�\�V(\�RH}�d2fy\0/\��>���g��\�6w?��J\��\��Jm�cP\�j���{S�\��\�㪓\��\���o�>\�v-\\~X�v#X~Y\�\�\�����\�\�8��©䲥�XwH��EV\�JxNDll�h��\�U\�+0�\'D�\n%J������c�����Wke7(��\�\�H���G\�˹N�\�j\�N��\�ϕ\�zJD\�,��To�Mz�<\�U�ؕ �D�裰 �TNT\�,\"]$3��c\�\�V\�9�\�P��\� �pW�q�Oכoq�Yӟ�yE����S\n��Uɒ&t�\�)��#�N����jb�}�\�j2�7�X�6[��X��\�Q\�{!)[\�#3\�y+8\�z�O>\�\�\�X�,��!\�]=\�>�H��,��)�1R\�ce�E�\�H\�YO��؜6����oTSZʂP\�,F \�*ȵ*V\�9~���\rYU��\�\�Y^n�Jq\�d�U\�!\"c\�B\",�%���6�Dʵ&IB��\�\nhH\�Ob#�ҁMr��\�,:�\�\�\�\��W\��*�=S\�(�\�\�em�\�6\��Ph=��\��d\� \�&�\����ʍfQN���b�)4�Sŕ8#e���&R;.wpY�d�KFn\��T�9t���\�\�TǼj��7*xKJr(�\�⬬�������\�\�\�B	7gک�,Z�\�A�A��}�E=e\r\\t\�/\�\�v��\���\�W\�.�S\��v.\�\�,C\�ha\�\�H/�G\�Sr{��9\�{rH36\�U�uv[\�,\r\�\��z\�F7K���\�s:ڬG�÷~[�^�Su\�W\"��_\��\0�4\�T��^�f\�\��a������?Glٍ������\�nL\�tu�TܞĪa�x�ܒ�ﱲ���\�%�U�\��:\�e�����\�c\�[]{�\�����\0�*\n\Z�\�d���\�]\��ñ,:6\�Q/E\� \���0<fh���\0׵�m\� \�\�`X�\�R?�J8/(N���\0)��!E�\�\�U2\�\��l��rط�\�^\�1O:?��\0ܦ+\�G�\�UlΆ�\�;u76\�\�7ko[o�^\�q���ꮇ�a3��!�H*g��G�:9\\n\���w��\�\�*�Z�JJ��\�vV\�!���\'�O�S�\'rs\ZwZV\�­\�1*&\�;\�>;Na�z\��uG�\�\�~�	s|\�\0}�{�\��\����^�\��\"\�\�׳�\r\�\�!#9\�f6S�c�\'\�셬��r�(g��q�\�6�\�~L\�0C$\�\�[\�l\�l�\�2�{\�On���l�p��j�\�%˽�.[�,O�/��\�b}�}�\�J\�miy1\���ð��D���o��/rx�|}{�\�<\����ë\�-\�1�����{\�֞��ܞ)\�\�U�sQT\Zy�\�-{��\�O\�\��\n���G�M\\��\�_B?\�r3\�+}L�W+���\��+�e\��j��*\�O0\�q�]޹;E-U0Kų\�|\�a�\����\n>�~�\�<�W�\�\�\\�\�[\��˕�L�k?��.�\�5�a\�D��gN/K�$�\�\�] ��Ћ\��\�\�\���\0\�j\�\�P}w\�U(0\�i)�|\�6B\�8e\'�����\�	�o\�zUn-GB���L�p\�4\'�c؍5u]���3Gio��^P\�\������\�#)G�\�O\�\�r䙾%9\�ݸ�\0P�\�-<��mϕG\�\ZG8\�#[\�hl�\���4�4�j\�i�ES\0�R�����w&W��??(fx��l	^쩾o\'�&=�DׁvJ\�\�r�\�\�\�e�o�G$�\�A�1�����h\�Iʬ5�\��G�=�\�z��!lл3����^1MYr\���\�\�F\�o{\\\'0\�KS^�:�nw���\�k�\�X�MP\ZA]���\���s\�\�\��\0Q\�\�Q\�m%��\�hzR�\ntR4M��\�\�+�Y�����M��f�ϲ���{Z`�\\\��\Zj� eD2A �?��9>��f�\�.�@\���G���9������ɴT\�\�o+\�2?\�r3\�+}L�W+���\�~+�e\�~{ygƏ��\0Σ>�V4층Y����\\k}Q�r�ɟ\�g\�?%\��Z\"��+�{\Zѳ���W�\0�r�?{\�֍\�sQ�x>{k޹5\�_\���Xk]M�_\�*H\�L��\�ﲢ����\�C�\�\�M\��V7-��}n\�+C�7.�\�E\�x\�kp\�:\�б�&V�S�ٸ�\�̰`\�\�f\�j\��V�\�qMwDz�r�9�4~����^ \��h\�\�\�ih!\�3�\Z\�fG\�}\r\\��{_X�׷0�\�45b;\�\�ɖޤ-b�#�\�\�\r\�ʹ`ƚ�z\�k7\�%�\�xNN�\�hݻ�P\0^Î��ٲ�\�@{+�{\�\Zv�|L��]ɠ\�gl�\���\0\�b�Q\�]#���s�.A�p\�\\��ZϢ\�\�Iec\�fc\�W7�3\�\�\�\�2\�P�~R�N\� �%�K؀\�\�֩+��M3F\��ر7��S�\�W\�\�~}lfHgH.K\�Q\�H\�G:\�Cp�\��,O�\�\\\�\�^\�\Z2\�or\�p�|:72�?�\�\�\�櫕��ok(b9�]�R;8�,ɔT)�?\�Zx��X%o�\�U����2ǋ��rύ��	�F��0\�^d��7=\�\�żJv�\�q�X�y��\\k}Q�r�ɟ\�g\�?%\��Z�\�<���)\�c빱X\�!��������_n�g%?^��\0>2\�7������\��0�^H��g�\�\�\���V\��ToSO��\��*�\�s\�M�us�W��\�C�W\'�f5Zƀ\Z\�\����Q�I|�7+��\�Û#\�\�s��X۸��v�cu\���`�F�{\�\�E�%r[\�\������HO9�W�\�.7q�XUw�\�Y=�Ϋ\�{T3G<m�\'	\�\�\'&p��t[}KC\�\nb��G��A\�\�\\�\�YY3 �׆+\�ݎz\�mW\���J\���\0\�R�7�����ד}�\�D�	<���\�1�J�\�k�\':�X�<z+\��w\�\"���:UW�\�A�J\�\�\�*�a���\\;�3f\�[6��f����p\�)�\�&��\�\'W9�W*i᧭dp1��rӕ�8�U&��F\�M\�A\�bP2\n��bcCF\��e�\�\�`vG(�lrm\�xu��\��z���=�\�S�s�8�/m�)�XΫz\Z*�k*\�\�Ի;�˘\�Sb��370LY\�7������\�\�O2d\��E�����\0P\�c��c?%\��c\�\��TuմY�\�<�m��\�1\Z��U����١A�b�Fآ���ѭ�tUU5uroj]�\�e͠N��ӊ�8������}��\���j\�^�)\�X�:\�MuU�-U�y\�v���w�\�MS\�8�4m�	#oU��S5ud�����h	�R\��>>-^:\�?n\�c��\�۟���\�ۻ\�\�F#Ϩ�Œ\�|\�\�]W�q\�۟c�q\�۟�\�\�5�UN�\�4����lBÏz�;�Rû *j��I�\�\�\������c?$�k\�a\n����٩�tw㔡\�|X�i��*�V���<\�s|\�eMU=$�\�w\�}��;���k�S�[�*J��I7�\�,}�qܟ�\�k�\�Z\�g7U\�푆\�i�+\�1�\�g\�\�\�8?u���A�|\���*j�\�G���:N�\�_j�\�\�c��r\�<esl\�B�Ia{d�ŏi�H\��<_\�\'\��UU�5�oj]�xo\�D9A�aPl4\�\�\�K,�\�\�9��w���O2Sf��\�#\�A]\�Tǋ\"���o�i+m\�\�b�\�\Z��K]\����\�_�ΰ�\���p\�\�̵�Z�˼~N�ge�<\�kna(s�-�ە�\�J�\�\�\�X�\�\�(�u��\�99\�,��\�uU���m�D\�\�*�?�\�\0(\0\0\0\0\0\0!1AQ aq�����\�\���0�\�\0\0?�)e5q�H\'Q�\�\�yn1\�x\�;\"\�w*\�_�Հ\��G\�Cp�\\ʇ�GR�޹�\�@KZ��ņ\�1E�Z��^kQ�wSt$\�,�1\�	i*\�9�����p\�\�ܺXC��J&.�0��p�VEM�7\���燃O\�cc�nw\�\�\�0���}\�j�7Y\���l:�1&���>>e�2�6�l`D\"�\�38�0\�H8�nN\�P\0�;}[�Z�}�\�{_�R\�\�W�0�U{��\�Bh�v��!ڟS�f\�(r����yL\�\�<\���\��\�ec\�S�.Je�p刜|���\�\�\�\�\�N\���4\\�����\�\�m�K�K\�\�\'�\Z�\�8��<���Q*�̍\��%��S\�N\�_��XC\�\�\�K\�\�\0>=�Ջ\�>M�1��L\�\��bC~�o\�+?�\��0�9f���\�]1:��(\� ~\�����\�\'\nW�m��W��#\����r�G%\�K�\�r�!�ARo�A\��Ǿݰǉ~\rA�\�\��\Z��r��c�;|\�\r\�l\� \�\���#w\��\��\��\�M�.3�ϕ/I�	�w(��,�\�Ѯ֝�\�\�\�t5UU.�;��\r\\)�)c\�#I\�\�peV���=�0=�\'��J�n\��\�L\\\�[Ģ\'V���\�C�\�\�^>}�y�iw�\�BK�E\�B엷%�T>k,>j�3�z\�\�\Zq��5B\�(�\�ͽ;�\�Q\�m��\�A��Q1��\"b8c��\�ч\r�K�Лi�\��\0��\\\�\n\�8󋹬$U��\�\�\�~��\�O6�\�s\�\\\\S\�_]\�z\�\�0GP\�ǤT�]C��(x8b��Y\�c�U�\�	j�5!\�5܁\�X!�\�j�\�a�Gs�6�k,��d��L��\�\'n\�\�/Ba�$ڢG�\��\���\�\�QbvJ\'FfemDfL�\���6\�\�3�\�Ժ\"\Z,�̯4��\����=۵�\�N�\�A#\�\��lE�RE��\�ܿ��T\�S\�_(#R᩺\\Zi�ϧ\�X+�@�\�O쪎E�Rβ\�L��7\'���\0\Z(�{K�y�\�\�r�\�p8\�<�13�;��X���\\���\�\�\Z��Co9\�\�)\�\�1ܤAc����fl\�34zt\�ŧ�Ϝ\�~\�i\�G�\�:ѽB�SS>�1�I��x�\� F���P&�9���}Ϲ-x�\�d\�|J!�}���e\�;ٮ[X���ٶ\�G�\�̔A!�\�]����m;�\��Jķ:�\�\��\�$i�\�%\�qh�B��\�w0f{��T\�;��	ѱ�\�\�\ZE^���\�\�\�Q\�\��jA\�Dʲ\�AN\Z4y<B+\�V�c2t\��\0Z*�\�+_hVZ!HIp!��Bd{�,9|�՘�ou3\�z�MG�1���K�\�S��s;T{C6D\�\�a��\�!m	��%{5\�SP���p6X�8 M_�\�\�)���>e�0(G���$�\�ޟ?$W\�w\'i+˰�\�\Z�/e�*I\0� \�\�o�\�0`��v\Z�\�i5F]\�+Q;\�[R�5�\��CX�p�׸i�㪖��\�b�]u�X�\0\�]v˨�|�t\���/Ty�\�v!�g:�Jׅ\�9x\�\�\�\�,&.�*���f�!������{��kJ\"�-��e\�\n\"\�:&\�wEa@|D��	�[&a\�9�g\r�\�\�\r��d9,�߾v��Ja \n\��/\\a�\"n$K	�G\rX\�7͙�s���b:c\�������\�Ot���x�;.\�\�}�V��Ix0҉\�\�\\�-$a,*(HĬTv�\�\���a�v.W�`\�y�\�E�3\�e��-p\�L��)�up�zҊȟ0#4pf�@�\�i\�m�=\�f}\�=ʮ\�~\�;\�\"9Hi�\�A\�W|{f��eDA\�~ҡ\�\\�\�\�qC\�3�����ID_s.f\�6\�p�9Y�\�כd���\0\��\�%0F!2�\\\�8t���)Ɩ�&\�<�~m�&\�Z�^\�0�\�:EI\��u�CQ�>N|�r%|voq\�q-��\�Y�R�X\�2\�̎�ߘ< \��Diž�\0\�\�,���R\�g\�,�h)r3Ж�\r\�w(��H*\�W�/�Pc�=\�\��C�AQ��\�\�f7pݏ\�\�L\�ĺ\�Q_�\�b�p9\�B��\�\�;UJ�\n\rqOE�\�?��\��H}\��Іg}x\�p\�\\\�ơl[.J1/CUw�\\\�f\�)x��@`Ce\�Wak\�m��ZN���/_1Ǿ:>Ӯ��f-D\Z�Ls\�RQ���\�v�K�\�C*����\�88�_\��L\�Ly\�\�\�#�4\�\��\�Q¶JʄV��[\�\�m=C��\�\�-�eq2\�m\�sfx㪔�ݻ&w�Z����.\�\�/1\�w\�\�A�qR̮�\�m�\�J\�a&8\�BZ�\�(�V�M[M��\�c\��+(�c�_>O\�\n2o�Z�K!G\0u-�\�y��{vE��5L1yZ%\n�\��\����{#y�#\�\��\�L��\�Q\�*Y����\�\�F5�\�P\Z\��%\\0\���Du75��V/D\�1\�/\nK�\�\�`\�.	\��@\��)�����\�S}\�{�\�E#��h]�f\�,	��\n�DԖ��\�\�ܠ�ȶ�\�+=\�5\�*\�����r,��hb/�Rc\r�<\�(栄�pϗ�����\Z���n.}\�Z&\�\0QP\�\�\n�ݳ.;�)�2��\�T\�0[�\r�.%Z+\�/W	��J\�\�u�\�_�\�\�\�hA��p\��\��ܦ�\�\�<+\�^%��}\�qTT����.=\�u&[�\0��\�\Z(\�U\�{Y�Si\�Ð�\�e�i�/9�\�f�\�R�&e�x��\'\�����\�(\�/9���p\�c�Ĥ�:�gi��:}���\�3�\�d\�Tn\�DU(\�\�\�\Z�J�&х�_,\�߯�wϼ�_[����,����C\�\�KEH \�\�a5/��R;R\�Q���\�K\�)\nCOs\�\�t�T�� EG슂7A;	m�T��;\�\�,\�\�)M�w�4�)Nvjgm� 6X�AX\�|�\�ܿE�˦a�t\�/���\01x��C�GL���bQ��\ZI�S��Al��\��W��#�z��\�@\�\�\'@|�l���w��\�\�\������c8�i^\��8�rxj6��\�Z��c��r��\�\�\�E��s1Yrز\�\�\�\�\�g\"`\��3,/��Lť�&\�͊.� �!S9�\�\�.��!y(��\�DE#����\�\�h�\�\�\�l�u���\�\���)��\�6Nح�I\�y�^:��\�\�\��<�/�EBji��Y@̼\��\�QK\�y��1�e��K\�%\�\�\�1�\�`��P\�Gb\��ņͼ_H<m\�V+��7.��\�`J�kD�\�j_�\�\�U)�\rqq�e���1F!\�(��d.�\rE!y�a�q�J\�\��} x0a\�1P\�=k�\\\\�\�S.n�QN��Qp6\�\Z&�*�\�r�LK�f\�)m�tUJ㑱�\�2���\�P�\�m;�,J\���P�X�\�� (�\�˔�=Y�V{ō�T�2\�T�+9��B�A(��|a2�h\�vL\�!]�\\�TV�\�\����- U5@��\��\�iy/�\�|Г˅\�\�E\�Eb�\�<V5KU��\�͊�\�b-���Λ!\�P%9\�v\�,}�v]�\�/�l�L��\�{=]\�\Zǔ*b��_��\0�SUL�\�)\�^\\C��3f��l�J^_�͊ƞ\��\'~�\�\�\�\ng`��È�A<1y�\\wY�w\�\���{?*���\rx�\���\����0fH\Z�\n(\" ����7\�/\�\��؃�Y>�*\�u��-$�?�T�%��\��\\M�f��3X�\�Z��{ː��N詘Y�zZ�\�\�sh����d�MԴD4���G����8���\�\�j�nk3��6@��/�#:#��~���\0\���\�|Ώ\��,\\C�A� ��I�1�f\�9����|\�\�<Ư\��G�^\��/\�GS�~|�Ea�\�>eTp��X\�!|â5eں��#��RI&>Q�$�ZA���M��\�\�Y���M\��<(\�\�@�\�Vk\�i>\�7a���\�5�\�\"~��A\��+\�c�,�g\n\�ȓ:�G�Ȩ|[�\�\��\�p�\��K��\rv��\�\�1\����s2wr�����s��O\�)|\���\�\�\�\�<Cp{G\\���\�v\r�w\�?��:?�\'��\�	m?<~\��\0��>i�I�\�\���?��Ǝ\�\��ų\��\�{�\��e��V\����{#�\n%\�\�<DS`��l��1K}�\�L��{q�\�\�\�CC_r�j�;u�\�;>b��*8\�B\�0PU\�\�\�$�mw\�Yⷮ$\�G�H���\0:�\�L\�!x�u�0q];�\�0ཱུ\�\���\�E�.ay+rA�V^��Vne\��\�z��\�e\�\�2xI��\�\�.K�Z\�&1�\Z^�S�BQ8x\0m�y��p	Ɯ\�?�\�(�`r\�\�\�p9w00(�\0��\�\�C�\�B3�g���^\�)}\�\0~�1��bS\r5xH�\�w��\�\�~��\��^1_{�\0�\�\�k��4D\�iW��Ú\�\0�	��M>�\�\�i�q7-G\nR�\�\�2�r/�����#\�����[X\�L���\�,\r�fԖM�<\��6�\0��5}�\n{�\�X��\�~\'X�|*?�v�^�.}��1��i6���&\0>�k�\�e\�4�bC\�_�wiaI�\�F�f\�h�x��\�yf\��\�\�MGF_,�v�5Y]\�BT\��\�0�Cj������3#z�\0�����\�	+��\��`j\�fa�[e4� $�\0�1^Xha�eJ~�\�\�|��w~�l�\�g�8����,�\0�-.\�+(�\�\n�\� ;y.��_��K\�d>v��o�\�\�g�O�\�\�U�\�\�j,])\0\�\�\�Z5�2$#n�`~M0Y�-��ݔ����/T��v-\�q�\�9l\�fVaQ)\�9c�\�i��t\�y\�:\�\"����\0ޅ~\�\��*N�H��k\�\��\��͢\�P�(�M\�/�p	W��B\�\'|\\�-\�\�anh�e\�$\Z�cQ\�\�Qĸ�\0�3���\�8�\n\�m+�+�(����\rn\�t\����WL\�[���d�,�h���\�\�\�$�9b\�YJ\�\ng]�\�\�lr�{A;�c�y�\�5:�\�+L\�O�$glDME\�>�\�\�A�\�\�\r�~�<-��\�\0&\0\0\0\0\0\0\0 0@�\�\0\0\�\n��\�S��=ŊN����\��\",�V1ֵ\�>\�\�J.7 ����8He�\�w�뮂�޲�5\�l�ݶ��\�z75\�Cz\�u\�&<�)eB���76W5��\�l�<vffk�iav���\�\Zʲ�\�]��\�ۄMRh����\�Kf�ꝵ9h\�r�L\�+ �U)Kg �N��\�9\"e�\�ѡ�Ǳ\�@{�a�?,�W��n�\�q�ӭ-0\�Ki�[j`\�\�1\�\�) �i��͜�\�<�\�\�7�\�<pѽtŽ\�`�fL��\�=�:lE�\�\�\�\�&a�2)\�\�\�\�}\�e�Bе����#�W����\�Wwk��� \'\�&S,���6�պ�f�\�[�ddd \�0���������L��&=t-t\�9��\�\�\\��^9{n�XF��w\�cّnY\�\�e�c�WGFX\�\�\�9�Qz\�\"\�\�%cc�k���e\�j\�\��\0<��\\\�c5���:� �a���\�\��\Z�\�)e\"�\�\�\�=N���XT\�\�|[*8±y�P\�ʋ��j�[]\�r%�\��\��\��\��f?v>H�]��\�A��\�޷��)O�#;#\ZVr�b�Z\�&*�k\��_/�3$1/k� f	X\�� �	�Vڼ\Z��\�\�U���Sm6\�\�\���\�z\�\n �-\\�t�\�k��W*[��[��\Z��\�\�D\��*\���4`\�A� \�W#]-W\�^_�\���\�\�f՝U��\�m�\�zڶB�,\0fc\�q�\�k.2\�);l\�\�\�OF��n7�,�\�.\�5F\�e)\'��0A\0\�\�\�\�׍i\�û\��%�^2��8\�\�!���겻�[E�X��\njZ�q�.\�O�-\�q�+%�Y�ZfC*�Y�\�O\�ц �a�ǜ\�\�,z\�\�\\�<�:��\�\�\�^f�i��[�\0+�mR�]H#e��\�A@�S77\��5ti1kKNQ\�/�\";}�\�\�@=}�r�x��##&F=�\�a]�]������~Z3��\�QB���\�V�\�Y�\�\�SG�¥\�Ӕo&_��9$�*W�?mf\�k\�ǴV��OCc>&N���\�fVM�\�\�e)t\�e����D#kF�\"��r\�rq\Z��ri��dX#��\�A�c\�>�0A�7th2j�镐\�ils�f>μ�\�m>\�&\�vy8Q\�չH1}g&�\�x�qF\�D\�\�ə\' 曉�4Q\�z\�\��g~�0A{Wʡ\�\\���P���\��\�]5�\�d�\0|\n���xpޒrG\�yX�f\�n\�\�Y�7K��*a�KC�Xބ$�;d�7\�\�u��\�\n�k�NN�\'[�5��Ku�`KE\��၉9��1�M�r[8�\Z\�\�NQ�1�\�$\��X�A;�a3읽Zkԭ�bX�Wev䭸�c[���X��\�\�\�p�8`\�\�:ܞ%��nl\�[\�\�\�7K�\�(_ل�\�bZ\'�\0�\�\�>\�9UcYM�bؖ%�bYYjڼ��a�`�\\\�nǍ;\�|�\�NxnEf\n\�E�],�\"�\�va���!�\�C�~\�>\�e��\�VP����NU�io3\��7 �z6�\�r�\�6r�9)ݝ�l[1ڇ�\���(����e\�\�h�4�a�;��\�\�\���f\�ī\"�\��\0�!���[\�^.w\n�.I\"��w�4�\��{���܋�\�\�p�ᡍ;\�� �a�}�{\�\�z3\�\�O}���� *��\0?�\�\n�\0:��\�8�*2�w-\r�x�\\�22|�`�\�?�Kz��.6�\���\0:�M:�\�\�[@�\\>=G~x��\�\rR\�S�F.\�c���f\�Cj\�/\�k`Г\'ц?\0�\0��gfz\0k*\�W�\���U-]�\\�V\�\�z޶!����9��|}\�[����\�\�\�\���\����\�s�+[�Q�\�z��\r�M�\�t�N\�.W\r���\�\�q�\�r�k�\��dbё�����\0\�\�r�E�Vkz\�\�\�\�T\�Q�\�96KE�\�̏[We/Kl\�\�S��\����ƍ�0�\�F��\��ܬa5\�+jږ�\��m��\�}�\�dp���\�\�a\"i���˥�\�F�\�\���]u;�\'\�=v\��\�IV7T\�j^���7د*\�/{6Eɫ3%-ȫm���N^K^lk�Lm6�{ \����Fp�{y�}�2\�mw�\�_(\��>�\0sȵ\\��}\��\�z�Y�\�8\�(\�[\�\�|�S�\����7�\0H\��w�����\0;y�\0��!蹖�x����m\�\�\�\�z�f�M\�$�\0�\�6�\�e�\����\�v\�\�\�\�e�np�\�[��\�9��=S\�}ͤ\�\�s\�\�\�S��ߞl�`�ӂ+\�-?�g8�\'o\�}\�,��X\�<[k��\�_O|\�\�X�3\��·\�\�	\���v[哏X�\�\�\�qu�p|�>7��s���A\�p�b\�\�5�?\�O�\�\�Nj�\�o\�\�si\�S\�Y\�9\�ë���d\�v�\0\���\�sx*Y�<�<i����_96\rv�\�ヷ\\ѼT���|�R\�\�\Zmg�k\�Y��s�w�����\�	F�D�Q8Y�-ľw\Zm-VN��\�\�\�=.��>\��Y\��y\�>/M�\�\�cr?+W\�Q\�_�\�:�W\�ǋב\�\�|nZ9%|��f^G5���FF�q¯WF��j3p\�\�V�=�����>Y8�95�\�M\��y�\�\�p�͏.\�\�\��\rvÆ\��gŷ�k�[7��n$8u|G?G�\�2��.�\�_�\�\�p�\�&o\�\�\�n$x�q<�G��\�\�Z:V\�Ƿk�N��e\�\�/\�h+\�\�a/\��N+n3q_�q\�s5X��o�<x\�Ij�߮\���\�� �\�\n\�d\�]\���Xu\�\��0�?�\�\�)�\��\�\��;`ߐ��x�mY�\�\��0\���,�\�\0:\0\0\0\0\0!1 \"A0@%2BQ#$3CRTaqP&4b��\�\0?\0�c�S)2D�*>\�^�\0\'��g��y8B��[�5�\�\�;�R򨐏yP-\"@�Se\Z�g\�\'��g���1	���<�m1�\�\�\�r]\�*I�OaJ�j�ꗕ�MB�ɨK�q/\�\"$DMs\�\�\��iH�]r\�\�yr\�#��\�\�=\�\�m	�\�\�\�\�ppr�x�E\��o%Zm�\��FX�ފ�R�\�-)�\�Y\�\�a/h���$H�{��^\�ˊ*۾&�b�ϗ�˜�\�F b.9���\�\��\'��\0�Od�\"\�Q�X%�h��\\\n��\�\�R�%\�\\\�&)v1\�\�\�\�x�8F\�,UjmC\�b,\�s\�\��q�Ս	C>�]\�.sy�B\�\'��8\�FGO5�v�\�Dsi6p��\�=(\�9;\npRY%Z��q\�J$\�\�&o&_�?:=�F�\\�KU\�\�P���x\�C��zd�T\�*�Hឯ#/Ó����\��qLs���j98�\�I-\�,\�/K]Ԑ�M�(\�\�>^<�\�9\�bq9�\�L�N<8\Z�1ո�fg�F�0��\�\�\�$s�s�$�L���<\�\�(\��X3\�\�1�?&P\�\���SF�G�c�3u��b\'圜yp#��O\�\��S�����2\��˸�N�b�\�R����\�cF|yB\�0���:���$a3�rpw�m_!|�\�m��7Z1\��\�/\�_��#�\�Ԅ\�q3>\rc�u \�ZT!Z�C���(\�\n$)�ȫ7\�9\�R�\�N\�3�#>	�/\�|\�^�m�E+F\'��\�,\��I\"I�QV8&��nk�(R��\��\�J�EΥ4�yGزQm&N�\�\"�(\�\�\�\�\�sၿ�N�\rաQ�\�=2�7��r��A�F)pRe6:\\�Bi,�Hr~8�9�\�\�R��\�\�\�G(\�EN�έy�V<\rB<^<��φ\�$%�~�\n��\�{���M�9HB2��$�O(��9({���#4�\�\�.|�M�����\n\�,\�#,\�F�O�Y�R��\ZpH\�;�\�\�x��\�D\�R��t.�\�i\Z\��~��~\"\��s\�\�Q�+i�GlSd\'�E$�\�\"��3GR�ʪ-\�\�8�cb9R�*\�MpA��I��y�?��7\'}�\�I~q΄S�Ș��3>.)�\�R�X&\�&9A��4gǇs��X\�\�V���e\nYDa��(\�\�R�\�\�\�͟��C��\�%\�\�Q\�lN\"LFL��\r&<Ȕr͍&�JQht␩S|����\0C���\��Bt�OÃ	�\r�J��4\�pr\�\�1��_!t�;:\�Hr�\�\�\�>	�X�d\\{vR*\�Id���9��坅��w�pn������\���~�\�1�\�9g\�\�\�?6<r�����^E\�F\�e�]�wDw�\\�������\�\�1~ѱ\�I��T���1\'�B�\�׹\�TM�\�\���k͓\'$jA䕽\\Ji���Hr\"A�s�NL�s\�(\�Xȹ\�\�C=\�*r�\�3�\�Q�\r\�bޡ׺yQ�\�\�\�?Y�\�>��d\��VY�\�\�E\�5)ȹ�}e�Ġ򶑏)����|jr�q�K�Ƣ�\09��\�U��/\�e�\'gY�lw\�&�7Fht\�dsN+\�w;�\�\�&�gA�#�\��D�\�\�4��9d\�>\�\�˱[�J\��]\�ܑ&C�HI\��\0\�!0(\�Nb�	\�\�R�GJM�P�Sf�.E��\�\�c?[�	{ȿD�\�\�eyb�0�\�����(O�9~R�\�/i=�����\'\�M�\�\�\�\�Ee`\�8��Ҙ�K&\��p\�Y�\���\�LD�BM>[;��\0BO�MR\�5I�\0 \�\�\�5��<��2A�\�)�\�0\�#L��^Ŋ�����i��%�\��°*�\�\�\�p7�0G,\�r\�\�\�\�?,&BE�di���z\nk	\"\�Gk\�yxE�#4��>E\�Q�$���Y�\�\�8gs����\"H�S2�\0�\�\�r7d\\����Y39�rv\�)�R\��ѐ\�\�ɘ��\�\�\�_�X~DoG�Y:B�P����u6N5\�\�e��M\�\��vs\�\�8�1wH�A�\0�w��+�aT��\�H\�O����(\�w�\�\��N�C��!\�3#.\'2?�d��\0i\"2�#�o�\�l�A�\�T_�\n_����9!6�@��\�\�T�U$�1Ԧ�\�\�\"r\�]�SY�\�?eӇqB���$�(�QF�o� �(���\�t���S�\�\�\�Fl�\�F�0\�O�t$�e)E\�\�Q\�6\���h���2�	=��7%\���Q]9e�&�\0f�#\�<�w�gY��%5\�C\�%xvyDg�W�0�r\\O�pT�\�r?Sd�\�\�\���\�:yF�c]Ѻ���\�V�\Z�\���\�F�eu/K,uYl��Y�\��%Jꧩ\Z�n֧b\�I�W�\�K-Z�\�k<��*�髆�B��*Ư�C��\r+h�\"\�-J\�\�\�\�\�\��\�\�Z\�W{\�CP�\�Q���,ī\�\�u���{�-.�.�\�z$-Y\�\�\\giF\�\�V�W/z4�\�\�W�L��P�skq�8\ZU:ҡ\�{����\0\�f�RJ*\�\��\�1��S\�\�\nO�&�.\�4��s�\�wI\r�Ԅ�-:S�\�\�#M�\n\�o�l��qP�����\�i\�9\�s��&�4�\�*v���Zi�~\�^Y��^V��*z�c�P�Mi�\r\�m�\�z�Yi\�{��#O���{NY�B̩:�4|;\�Y�Y(·,�\� �\\\�gÓxu\Z>�¬\�M\'os�R�)V���\��\�t\'?R(\�\�U!\�\�~^OK>�\�\��5��������\��~̯�\�\�T���\�\�FY\�hjG\�\�\�}է�B�%;\�{\��\0G\����n�\�\����\�S�S\�b\��F�~�}�\�\�ysB�2�N��os�F��\�*��\�Q_H\�o\�\�XrC�i\�O��҅zV\�L\�\�֧)\�f#���$�_\�\�\�\�\�̼�MJ5ԙ_O��7\�I\�Y/VgLu#����^�*��\r�r\'����\�N\�7~\\Y\�0�\�i\Z��x\�\�ӑ�Ο^SP�w�\�T+���\��\�l\�\� N\�����3N�	eUY�\�)�����K<d�\0ڗC�j�wl\�j(T�/C5\�P�:����J򕢖\�\"�����P.l.\�U�[b\�^�?���T\�\�t��,��?/\'��}j?\���\��\�\��\�cz\��\�i\�d���\�}-L��\�\�\�6\r��f��=1�՟{\��\0G\����\�U\�Zꤜ�\�.(�\0�\�0�-Sd7�zs���I|EuN_�`ݧ5\�S�iQAwL�\\�\�3\�gJt*���&�F\�GS�\�\�d�k�Q-�9��D�v�\�\�,_\n����:u�*\�\�p�1>)���FjZ�\�#(6\�V��mF=�Q��i*��Q�8\��Q��MR\�D��Iv#e�\\\�<BeJԡJO;IER�X\�:�Sy�\��)VMcrc\�M.�?��JTn^\��j4,\��o�f\�\�E{�W4�$��n!:S�\�\�\�k{�ʸ�!Gһr\�&\�qP���]������u)\��\�\���s	���A\�T�\�f��U��C�h�f�{^8r*-Q�Wv[j�\0\rӅX\�l�mq:5�\�\�EPԜ^\�m\�ISg\�T(Ɲ�#\�~�T�s��\�\�Kx\��?R\�8d�k��\ZʑO\�U\'O�6t�5\rB�<M\'���*�#zF�\�\��\�`���*#��Zmg87i�K�F�\�\'c�^�e��\�*QP�\�PG\�npNᎷ\��*ϙp\\X\\Ҿ�\\O�jӔ`�&^j�\�l��g\�8�Ed��\\�,��C\�Zܨ���P�Ib\'\�mjRH�\�.��Қ5�U>�R��WR��դOK�\�է��*V�F\�+�:�h�����R�p\�\�7��σ\��\��j\"�j��AF1�i#\�	T�t\�\�Jӥ.[(\�\�4\�\�t$ʚT�kfݚݝ(ӡr\�\\j\Zb��-�5\�:�\�\�\�Z\�\�֬�\0:�I�}\�����q/\�\�n*)Ե\�\�*\�F*��:\n)z\�*�\�U�\�9,\�ʍ\n �*\�ν{N��X\�Jv�\�3B�ܥaɠ>>\�h\�ًM�w�:��\��g[}��ƍ2껫ui�lt(N)l�#(B�*X�#GNu�c\�E��iB�{mЉ�\�W\�B�NH�v\�;#L��u.\�w͖Z|eN҆\�\�UF3�S4)�\�vlп�4,��9,\�Ѝ�\�\rԢhr�ac��?�a�af�ok�DaG	`q������G|�SnP�\�\�R\�r���O\"�2\��7V\�sE��V�4\�	)S�\�\�\�j�*r[\�Q�:\�2��Q�\n�\�(\\ӫF\���B�8׍�&B�)Q�K46\�eɡd�4Ւ\�c}J�\�m���Q�J���\�D\�St\�S\�E�ے�M,��(\�\�@��\�Զ\�\�F\�څ:q\�6\�\�_!x�|\�\�\��6�!?�{^\rc�\�\\غ��\0\�_�����\�m\��\�\0\"\0\0\0\0\0\0\0\0\0 0�\�\0\0B��N\� \�;CX�b��f8�dX\�\"�Z@	� �\�`�Z@\0\�A*}Z�F\0�?E\�p \�AЂ<P�\�����@@\0ֺv&� ��VTlcJ\�Nb,l�\���\0|g��\�\�+)�\�K%]��X�a����b��}t�)�\"(��k�<\��\�F��ՓS\�c�\�%��\�0\�e�1��q�,^\�Q�HS�\�\�D�:Ƶ5\�Sm7_N��эP�bc\��ɖD�M\"��C�\�ł\"\�;�\�	ef\�``��k�+|{/�OM\ZU4&b��x�B�\0�J�!�\�b�J���d\��� �\��٬^���\�1\��]���QX�Mh�WB|<~Y\�\rF40A��d��\�Ȱt:���d>A@��B\�Mh\�7�QE��\�[))�aЂ�A<@-E�R�\�.Vb2ݢŕ\�\�p@:0Ć!$�}*��✕�/CR�A:AA��\�5ٔ�V:2\�b��\�,X�lR �0\��FJ��n=�ڻ=\������I�AD �A�\�R!�[��j\�\"\�Ɩ@z�a\�JW�\�sge6 P�I��d�\n��4A*{\�\0��T�\�.�\� �+jn{�{AB��$�\0\�e��G݀ğ\�\�,A7�)x�{����-&b*��\�LP�b� ��a5ũf\�q\�@G��\0�nQ+XɑE��\n\�\0\�\�k�%�f\"\�\"\�\"(X�{C �d�a�j@\��X\Z\n�`\�bڷ�����\�P��<��\�\�\�8\�%�`���9C\�\�Ѓ�f�XЃ�b6bM�P\�\�D�2ku�T�\�DX;���S`� ؂,X�\n�����C\�PЃ\�L;3�oZ\�\�q\�d\�\�\�\n%\��X\�,����aX�E�~>>!@@}�!�\0qcVWZ\�͡��j��鎷K�\0;e��P2M�b�,����\�}T�@\�A0(\r1\"�\�3ZH�^�B\��\Z,_\\`\�4	�eV,E�؀�zч�\�jU��C\�2��Z���M�\\��`�\"\��\Z�& y�v�`�,_BI=�a��j�ba\�]Qe��\�A��1x\�\��1:\�\��[��a�o�1�R\�0㌨bJ�X }1\�\�>��+n�+f\0�!�\�\�c7㹭MkP\�w�1�G���X���\�G;ه\�j\���\0�j�}w�\�~[ߎ��6e5%]FB�H ��/[�N�\0\��\�\�w�M\�\n��������\�\�9\r�y\���g\�}�g�k���\�Z�X �Ȭ��v\0\�Z\�ZEf\���\��LSICh�\"�\�@8N#\�L��J�\�A\��MM\�\�^��	$\�&�E\�b� �\ZN+��_�\�\",\�\�Bǰ�\�\�Zz�0\�h$t����Ѐ\���\r\r�����؃�� \0h(\0�;�LִD,L���Ђ	�3�����\�v\�A\0\0\0<`kB	��\nʐ�\�\�\�F�\��\��S\�T(Q\r\�)����{.�j�����\0�CZ!�_�\�ÃЂ���x8�f7�\�cq\�<jp�Ԡ\��\�\�8��<_\�\�\�2x�n��\�~?\��ׇ\�\�m\�V��~/\�\��n9x,\�;��\\[8\�,L�/\�+���\�\�#%|U\�W\�&\�g\�\'\�\�\�\'y,n\�CsqO\�\�?8�\�\�p8L8I�E�䫷;;�\�\�V\�_��W�6��\��Xy�|J��-����ĺ��U��)�jsYJ��y6�\�Ba\�\"|�|^|�p\�\�\�&4\�W�|fs󈅴Ӄ�#_>\n|�\��6r㓖	8��)\�\�\Z����\�J:�u�GWyJ\ri�i6]�~4o���A�+9�\�}<��Y�v;�\�L\�\�k��K_�~\�\�+\�K�9,ˏ9\��\0 \��| dc\�³�,\Z|t\��\'�ʥ\�\�\�No3��&\�\'.\�]�\�|trV�Y\�\�S�\�\�\'�5e\�\�_\��~B���r�1�\�\�\�g[\�Q\�]�r%FSf�S+2\�[8򇓪�\0�y�l�!�+l��r���=��_��!�s��\'����\�>\��c���ﭞ��V\�mkX���~V��X \"o~�4u�Mz�;��h�Y��Ph^{\�\0z��>?�\�\04\0\0\0\0\0\0! 01@\"A$#2BPQRSb%3CDa�\�\0?\0\�!B��\�;�����l�$2D�\r|q^\�dw3\�\\E��}��\\�OAC�S�JD%�T���.��>^m�Jc�YJ�#K�/���$\���_%E�N/,�YdQ\�Y�\�X�w\�kvH�K2��\\r\�G$;�6�G��4_�\�\��Gv�\�\�b�\�ȗsp�w\�\�\�$m\�R\�V,�Ƒ\'!ii\�u&\��+XUQ��vYP��(^\nH[�۟�6��\�ݖH�w\�ˡ�6�?\n\�\�͜�BQ\�w\�W�\�0\'\".\"\��m7�sd��Y\r\�\�\rx�=��{D\��c\�\��\�U\r2ܷcf\�3\'�jCHlLB���\�l�[�(V�c�1Ȅ\\c.�4[�\r݋rd�P��\�\�\�|S�\�bώz,RE�l�1�?sY�u3l�.x�7!��3\�\��/l�	��g\�B�o��i>���(I2͙\�e\�Ѻ�\�\�v.��>ұ�7]�\�~��$w\�d\�+}?lЧ�ၦ\\R\��.�92`\�I\�|2YXe�\�&y��Yf`\�dc�91\�.t.hR���|�\�\�.Q\�=\�Le��c�\�K᛹\\�\�F��h!N�4�\�\�F2\�\�\�\"$H� [�\�f%b녟Yu���B\�HrJ-6Q��bc\"D�q�fd�LI�/��\"\�\"D�\�!!!�\��,�]��%\��H��!��D��\0rd�\�pM��&Lc�\�_���$y�.�cr\�g\�ܿ?4g�f&�\�ۃb�Nφ\�w�_V\�\�\����d�qO�\�\���\"�&�P.Xr\ZB\�.l/��\0i|��\0\��\0�\�F�U�P�7�G��%���*q#{71Zȩ�&ɢ�%>\�>̭!���|/̤:�I#�\�\�\�;@z\\\��ܖ-3WC\��\0\�CҴ�|�T�F�qe��=�\�e�U�l��gk\\� \���8�z=\�:\�Hׯ\�}C\��Q&�ԂiP_���M�����YET��b�5Q�\�$H�_,\��\0���\0t�Ēm\Z��Z75rW�R�\�*�ֱ:T\�\�J�G�Ҧ\�\�*�\ZH\�ƪ�5����f�)�S��\�kҺ5�\0&�M\��H�Q\\\�\���`�����\�?%�h�\�Z�\�$KMN������zg\�j����i��}դ\�Y%\n�RB\����ƍ6�t�Ӌy��$�\r5HE�:��\\E\n�*���X�~Ʃ	\�\�OO)aNj-�\�zsx�-�{A\n�f�����:�`�}|��\�ӹF�G���J\�\�\�w\�ȍJ�\0\�\�իt)B�G	Vm��\ZQl�u\�]\�.\�$o�P�h\��\0aW���ƚ�\�rJqE\�	\�\�{�p{���}\�\�Α�,S�}(\�qb���SL}�1��\�CQX-SP}�\��u3{Y\n9\�wg\�j\�-Y-\�E��l�\�$��Rl\�J�ϣɿV94?��E�-2\�j��`��)\"�?Q��8�\�\�%;ϹKKN��u	�3�U\�d��>����\�A24\�\�\�ӅF�\�Q��(�\��ܣ���\�\�^B�F[��\�[\�rP��BR�)�t�n\�I��̓D?NL����e\r\nn\�jKlYMh)$�::�m?iJ�orqw�	B)�\�\�ˁ��N��(T�\�)�<R�I�>0q/�%\�]T!\�)=+W!\rT\�e9QvbUYMib� �)�^�&\�<\�\�NF�\�ҹ���\�־�xF���pr\�h\�$�\\������;`^-\n.\�Q�\�\"�*\�̛N\�URf�Un4�m\�\�\�!�z�\����):m\��*I6P\�\�\�OT�(OO٠�\0I�\�/\�\'\rmg�N\Z:�2\�\�<�I�&Q�u�i�Q\�Jm\"˚\�\�5��\�V�^j\�C��2�(\�݁V��\�ʴ��N���TI%T\�?�Ƣ��\�\\t7�ԱWP�ʭ\�\�V\�W�\��\�k7\�+Jw��ܓ+V�NW$縭���bu\�.\�`ѩR�R5\�\�5ݽBpn�]�5oئk\"׼�YfC\�\�,�\�\�;��2/$M��Eu+\Z�\�\�TØ\�ܝ\'x���\�:/t]�Dշ��5\n))\Z\��\Z\�P\�\�\�杛5���\����i\�\�mOyWU/Q�V�\�)\�r�Oo�\�\�!�\\����\�c�ׇ2G�\�');
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
INSERT INTO `trening` VALUES (1,'2017-12-21','Trening je bio dobar, ali ja sam još bolji',23),(2,'2017-12-22','Test današnji datum\nok',23),(3,'2017-11-29','Helena trening',5),(4,'2016-10-11','2016',23),(5,'2017-10-12','2017',23),(6,'2017-12-08','Proba',23),(7,'2017-12-28','forhendi?i?',23);
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
INSERT INTO `turnir_kategorija` VALUES (1,'Muški singl'),(2,'Ženski singl'),(3,'Muški dubl'),(4,'Ženski dubl');
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
