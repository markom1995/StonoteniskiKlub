DROP SCHEMA IF EXISTS `dzoksrs_db`;
CREATE SCHEMA `dzoksrs_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dzoksrs_db`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_DOGADJAJ_DOGADJAJ_TIP1_idx` (`DOGADJAJ_TIP_Id`),
  KEY `fk_DOGADJAJ_KORISNICKI_NALOG1_idx` (`KORISNICKI_NALOG_Id`),
  CONSTRAINT `fk_DOGADJAJ_DOGADJAJ_TIP1` FOREIGN KEY (`DOGADJAJ_TIP_Id`) REFERENCES `dogadjaj_tip` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DOGADJAJ_KORISNICKI_NALOG1` FOREIGN KEY (`KORISNICKI_NALOG_Id`) REFERENCES `korisnicki_nalog` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `skupstina`
--

DROP TABLE IF EXISTS `skupstina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skupstina` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` date NOT NULL,
  `Aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_TRENING_CLAN1_idx` (`CLAN_Id`),
  CONSTRAINT `fk_TRENING_CLAN1` FOREIGN KEY (`CLAN_Id`) REFERENCES `clan` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`RedniBroj`,`SPONZOR_Id`),
  KEY `fk_UGOVOR_SPONZOR_SPONZOR1_idx` (`SPONZOR_Id`),
  CONSTRAINT `fk_UGOVOR_SPONZOR_SPONZOR1` FOREIGN KEY (`SPONZOR_Id`) REFERENCES `sponzor` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`ZAPOSLENI_TIP_Id`,`ZAPOSLENI_OSOBA_Id`,`DatumOd`),
  KEY `fk_ZAPOSLENI_TIP_has_ZAPOSLENI_ZAPOSLENI1_idx` (`ZAPOSLENI_OSOBA_Id`),
  KEY `fk_ZAPOSLENI_TIP_has_ZAPOSLENI_ZAPOSLENI_TIP1_idx` (`ZAPOSLENI_TIP_Id`),
  CONSTRAINT `fk_ZAPOSLENI_TIP_has_ZAPOSLENI_ZAPOSLENI1` FOREIGN KEY (`ZAPOSLENI_OSOBA_Id`) REFERENCES `zaposleni` (`OSOBA_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ZAPOSLENI_TIP_has_ZAPOSLENI_ZAPOSLENI_TIP1` FOREIGN KEY (`ZAPOSLENI_TIP_Id`) REFERENCES `zaposleni_tip` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
CREATE   PROCEDURE `dodajPrijavu`(in pTurnirId int,in pTurnirKategorijaId int,in pIdOsobe int,
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_budzet`(in inSezona varchar(54), in inIznos decimal)
begin
	declare broj int default 0;
    select count(*) from NOVCANA_SREDSTVA n where n.Sezona=inSezona and n.Obrisan=false into broj;
    if broj>0 then signal sqlstate '45000' set message_text='Postoji evidentirani iznos budzeta za izabranu sezonu.'; end if;
    insert into NOVCANA_SREDSTVA values (null, inSezona, inIznos, 0, 0,false);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_clanarinu`( in inDatum date, in inIznos decimal(8,2), inOpis varchar(100), 
															in inMjesec int(11), in inGodina year(4), 
                                                            in inClanId int(11),out outId int(11))
begin
	declare broj int default 0;
	select count(*) from CLANARINA c inner join TRANSAKCIJA t where c.TRANSAKCIJA_Id=t.id and c.Mjesec=inMjesec and c.Godina=inGodina and c.CLAN_OSOBA_Id=inClanId and t.Obrisan=false into broj;
	if broj>0 then signal sqlstate '45000' set message_text='Postoji takva clanarina.'; end if;
	insert into transakcija values (null, inDatum, inIznos, inOpis, 1, 1,false);
    insert into clanarina values (inMjesec, inGodina, (select max(Id) from transakcija), inClanId);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_dogadjaj`(in pOpis varchar(100),
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
			where (((DOGADJAJ_TIP_Id=pDogadjajTipId) and ((pPocetak>Pocetak and pPocetak<Kraj) or (pKraj>Pocetak and pKraj<Kraj))) and (Aktivan=true))
			into brojac;
            if(brojac = 0) then
				begin
					insert into DOGADJAJ values(null, pOpis, pDogadjajTipId, pKorisnickiNalogId, pPocetak, pKraj, true);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_donaciju`(in pSponzorId int,
								in pRedniBrojUgovor int,
                                in pOpis varchar(100),
                                in pKolicina decimal(8,2),
                                in pNovcaniIznos decimal(8,2),
                                in pNovcanaDonacija boolean,
                                in pOpremaTipId int,
                                out pRedniBroj int)
begin
	declare rb int default 1;
	if( ((pKolicina is not null) and (pOpremaTipId=false or pNovcanaDonacija=true or pKolicina<0)) or
		((pNovcaniIznos is not null) and (pOpremaTipId=true or pNovcanaDonacija=false or pNovcaniIznos<0))) then
	begin
		set pRedniBroj = -1;
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
			set pRedniBroj=rb;
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
CREATE   PROCEDURE `dodaj_instance_opreme_kluba`( in inBrojInstanci int(11), in inDonirana boolean, in inOpremaTipId int(11), inNarudzbaId int(11),
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
CREATE   PROCEDURE `dodaj_opremu_clana`(in inOpremaTipId int(11), inNarudzbaId int(11), in inVelicina varchar(10), in inClanId boolean)
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
CREATE   PROCEDURE `dodaj_opremu_kluba`( in inDonirana boolean, in inOpremaTipId int(11), inNarudzbaId int(11), 
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_platu`( in inDatum date, in inIznos decimal(8,2), in inOpis varchar(100), in inZaposleniId int(11), out outId int(11))
begin
	insert into TRANSAKCIJA values (null, inDatum, inIznos, inOpis, 0, 2,false);
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
CREATE   PROCEDURE `dodaj_sponozra`(in pNaziv varchar(45),
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
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_sponzora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_sponzora`(in pNaziv varchar(45),
								in pAdresa varchar(45),
                                in pMail varchar(45),
                                in pDatumOd date,
                                in pDatumDo date,
                                in pOpis varchar(100),
                                out pId int,
                                out pRedniBroj int)
begin
	declare exit handler for sqlexception
    begin
		set pId = -1;
        set pRedniBroj = -1;
        rollback;
        resignal;
    end;
    start transaction;
		insert into SPONZOR values(null, pNaziv, pAdresa, pMail, true);
		call dodaj_sponzorski_ugovor(pDatumOd, pDatumDo, (select max(Id) from SPONZOR), pOpis, pRedniBroj);
        select max(Id) from SPONZOR into pid;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_sponzorski_ugovor`(in pDatumOd date,
                                         in pDatumDo date,
                                         in pSponzorId int,
                                         in pOpis varchar(100),
                                         out pId int)
begin
	declare rb int default 1;
	if ((pDatumDo is not null) and (datediff(pDatumOd, pDatumDo) > 0)) then
	begin
		set pId = -1;
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
            insert into UGOVOR_SPONZOR values(rb, pDatumOd, pDatumDo, pSponzorId, pOpis, true);
            set pId = rb;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_troskovi_oprema`( in inDatum date, in inIznos decimal(8,2), inOpis varchar(100), 
															
                                                            in inNarudzbaId int(11), out outId int(11))
begin
	declare broj int default 0;
	select count(*) from TROSKOVI_OPREMA c inner join TRANSAKCIJA t inner join NARUDZBA n where c.TRANSAKCIJA_Id=t.Id and c.NARUDZBA_Id=inNarudzbaId and n.Id=inNarudzbaId and n.OpremaKluba=true and t.Obrisan=false into broj;
	if broj>0 then signal sqlstate '45000' set message_text='Postoji unos za troskove opreme vezan za odabranu narudzbu.'; end if;
	insert into TRANSAKCIJA values (null, inDatum, inIznos, inOpis, 1, 3, false);
    insert into TROSKOVI_OPREMA values ((select max(Id) from transakcija), inNarudzbaId);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_troskovi_turnir`( in inDatum date, in inIznos decimal(8,2), inOpis varchar(100), 
															
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
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_uplatu_turnir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_uplatu_turnir`( in inPrijavaId int,  in inDatum date, in inIznos decimal(8,2),in inOpis varchar(100), out outId int(11))
begin
	declare broj int default 0;
	select count(*) from UCESCE_NA_TURNIRU c inner join TRANSAKCIJA t where c.TRANSAKCIJA_Id=t.Id and c.UCESNIK_PRIJAVA_Id=inPrijavaId and t.Obrisan=false into broj;
	if broj>0 then signal sqlstate '45000' set message_text='Postoji evidentirana uplata za turnir odabranog ucesnika.'; end if;
	insert into TRANSAKCIJA values (null, inDatum, inIznos, inOpis, 1, 4,false);
    insert into UCESCE_NA_TURNIRU values ((select max(Id) from TRANSAKCIJA), inPrijavaId);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_zaposlenje`(in pZaposleni_tip_id int,
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
			insert into ZAPOSLENJE values(pZaposleni_tip_id, pOsoba_id, pDatum_od, pDatum_do, pPlata, true);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `dodaj_zaposlenog`(in pJmb char(13), 
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
CREATE   PROCEDURE `kreirajDublZrijeb`(in pIdTurnira int,in pIdKategorije int,in pBrojTimova int,out pFlag boolean)
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
CREATE   PROCEDURE `kreirajSinglZrijeb`(in pIdTurnira int,in pIdKategorije int,in pBrojTimova int,out pFlag boolean)
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
CREATE   PROCEDURE `postojiJmb`(in pJmb char(13),in pIdTurnira int,in pIdKategorije int,out pFlag boolean)
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
CREATE   PROCEDURE `postojiZrijeb`(in pIdTurnira int,in pIdKategorije int,out pFlag boolean)
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
CREATE   PROCEDURE `prijaviDublTim`(in pId1 int,in pId2 int,out pFlag boolean)
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
CREATE   PROCEDURE `prijaviSinglTim`(in pId int,out pFlag boolean)
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
CREATE   PROCEDURE `prijaviUcesnika`(in pJmb char(13), in pIme varchar(45),in pPrezime varchar(45), 
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `update_clanarinu`( in inId int, in inDatum date, in inIznos decimal(8,2), inOpis varchar(100), 
															in inMjesec int(11), in inGodina year(4))
begin
	update TRANSAKCIJA SET datum=inDatum, iznos=inIznos, opis=inOpis where Id=inId;
    update CLANARINA SET Mjesec=inMjesec, Godina=inGodina where TRANSAKCIJA_Id=inId;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `update_platu`( in inId int, in inDatum date, in inIznos decimal(8,2), in inOpis varchar(100))
begin
	update TRANSAKCIJA SET Datum=inDatum, Iznos=inIznos, Opis=inOpis where Id=inId;
	#update PLATA SET ZAPOSLENI_OSOBA_Id=inOsobaId where TRANSAKCIJA_Id=inId;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `update_troskovi_oprema`( in inNarudzbaId int, in inId int, in inDatum date, in inIznos decimal(8,2), inOpis varchar(100))
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `update_troskovi_turnir`(  in inId int, in inDatum date, in inIznos decimal(8,2), inOpis varchar(100))
begin
	update TRANSAKCIJA SET datum=inDatum, iznos=inIznos, opis=inOpis where Id=inId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_uplatu_turnir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `update_uplatu_turnir`( in inId int, in inDatum date, in inIznos decimal(8,2), inOpis varchar(100))
begin
	update TRANSAKCIJA SET datum=inDatum, iznos=inIznos, opis=inOpis where Id=inId;
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
/*!50013   SQL SECURITY DEFINER */
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
/*!50013   SQL SECURITY DEFINER */
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
/*!50013   SQL SECURITY DEFINER */
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
/*!50013   SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_clanarina` AS select `t`.`Id` AS `id`,`o`.`Ime` AS `ime`,`o`.`Prezime` AS `prezime`,`cl`.`Mjesec` AS `mjesec`,`cl`.`Godina` AS `godina`,`t`.`Datum` AS `datum`,`t`.`Iznos` AS `iznos`,`t`.`Opis` AS `opis`,`tt`.`Tip` AS `Tip`,`c`.`OSOBA_Id` AS `OSOBA_Id` from ((((`osoba` `o` join `clan` `c`) join `transakcija` `t`) join `clanarina` `cl`) join `tip_transakcije` `tt` on(((`tt`.`Id` = `t`.`TIP_TRANSAKCIJE_Id`) and (`o`.`Id` = `c`.`OSOBA_Id`) and (`t`.`Id` = `cl`.`TRANSAKCIJA_Id`) and (`cl`.`CLAN_OSOBA_Id` = `c`.`OSOBA_Id`)))) where (`t`.`Obrisan` = FALSE) */;
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
/*!50013   SQL SECURITY DEFINER */
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
/*!50013   SQL SECURITY DEFINER */
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
/*!50013   SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_plata` AS select `z`.`OSOBA_Id` AS `OSOBA_Id`,`o`.`Ime` AS `Ime`,`o`.`Prezime` AS `Prezime`,`o`.`ImeRoditelja` AS `ImeRoditelja`,`o`.`JMB` AS `JMB`,`o`.`Pol` AS `Pol`,`o`.`DatumRodjenja` AS `DatumRodjenja`,`o`.`Fotografija` AS `Fotografija`,`z`.`Aktivan` AS `Aktivan`,`t`.`Iznos` AS `Iznos`,`t`.`Datum` AS `Datum`,`t`.`Opis` AS `Opis`,`t`.`Id` AS `Id`,`tt`.`Tip` AS `Tip` from ((((`osoba` `o` join `zaposleni` `z`) join `transakcija` `t`) join `plata` `p`) join `tip_transakcije` `tt` on(((`tt`.`Id` = `t`.`TIP_TRANSAKCIJE_Id`) and (`o`.`Id` = `z`.`OSOBA_Id`) and (`t`.`Id` = `p`.`TRANSAKCIJA_Id`) and (`p`.`ZAPOSLENI_OSOBA_Id` = `z`.`OSOBA_Id`)))) where (`t`.`Obrisan` = FALSE) */;
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
/*!50013   SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_transakcija` AS select `t`.`Id` AS `Id`,`t`.`Datum` AS `Datum`,`t`.`Iznos` AS `Iznos`,`t`.`Opis` AS `Opis`,`t`.`jeUplata` AS `jeUplata`,`tip`.`Tip` AS `Tip` from (`transakcija` `t` join `tip_transakcije` `tip` on((`t`.`TIP_TRANSAKCIJE_Id` = `tip`.`Id`))) where ((`tip`.`Id` > 4) and (`t`.`Obrisan` = FALSE)) */;
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
/*!50013   SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_troskovi_oprema` AS select `n`.`Id` AS `Id`,`n`.`DISTRIBUTER_OPREME_Id` AS `DISTRIBUTER_OPREME_Id`,`tt`.`TRANSAKCIJA_Id` AS `TRANSAKCIJA_Id`,`t`.`Datum` AS `Datum`,`t`.`Iznos` AS `Iznos`,`t`.`Opis` AS `Opis`,`tip`.`Tip` AS `Tip`,`n`.`Datum` AS `nDatum` from (((`transakcija` `t` join `tip_transakcije` `tip`) join `narudzba` `n`) join `troskovi_oprema` `tt` on(((`t`.`Id` = `tt`.`TRANSAKCIJA_Id`) and (`tt`.`NARUDZBA_Id` = `n`.`Id`) and (`t`.`TIP_TRANSAKCIJE_Id` = `tip`.`Id`)))) where ((`n`.`Obrisan` = FALSE) and (`n`.`OpremaKluba` = TRUE) and (`t`.`Obrisan` = FALSE)) */;
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
/*!50013   SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_troskovi_turnir` AS select `turnir`.`Id` AS `turnirId`,`turnir`.`Naziv` AS `Naziv`,`turnir`.`Datum` AS `turnirDatum`,`t`.`Id` AS `Id`,`t`.`Datum` AS `Datum`,`t`.`Iznos` AS `Iznos`,`t`.`Opis` AS `Opis`,`tip`.`Tip` AS `Tip` from (((`transakcija` `t` join `tip_transakcije` `tip`) join `turnir`) join `troskovi_turnir` `tt` on(((`t`.`Id` = `tt`.`TRANSAKCIJA_Id`) and (`tt`.`TURNIR_Id` = `turnir`.`Id`) and (`t`.`TIP_TRANSAKCIJE_Id` = `tip`.`Id`)))) where (`t`.`Obrisan` = FALSE) */;
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
/*!50013   SQL SECURITY DEFINER */
/*!50001 VIEW `prikaz_uplata_turnir` AS select `o`.`Ime` AS `Ime`,`o`.`Prezime` AS `Prezime`,`o`.`Id` AS `osobaId`,`t`.`Iznos` AS `iznos`,`t`.`Datum` AS `datum`,`t`.`Opis` AS `opis`,`tip`.`Tip` AS `Tip`,`u`.`Id` AS `prijavaId`,`t`.`Id` AS `transakcijaId`,`u`.`TURNIR_Id` AS `TURNIR_Id` from ((((`osoba` `o` join `ucesnik_prijava` `u`) join `transakcija` `t`) join `tip_transakcije` `tip`) join `ucesce_na_turniru` `uc` on(((`o`.`Id` = `u`.`OSOBA_Id`) and (`u`.`Id` = `uc`.`UCESNIK_PRIJAVA_Id`) and (`t`.`Id` = `uc`.`TRANSAKCIJA_Id`) and (`t`.`TIP_TRANSAKCIJE_Id` = `tip`.`Id`)))) where (`t`.`Obrisan` = FALSE) */;
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

-- Dump completed on 2018-01-27  8:02:20
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
-- Dumping data for table `dogadjaj_tip`
--

LOCK TABLES `dogadjaj_tip` WRITE;
/*!40000 ALTER TABLE `dogadjaj_tip` DISABLE KEYS */;
INSERT INTO `dogadjaj_tip` VALUES (1,'Trening'),(2,'Skupština');
/*!40000 ALTER TABLE `dogadjaj_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `korisnicki_nalog_tip`
--

LOCK TABLES `korisnicki_nalog_tip` WRITE;
/*!40000 ALTER TABLE `korisnicki_nalog_tip` DISABLE KEYS */;
INSERT INTO `korisnicki_nalog_tip` VALUES (1,'Administrator'),(2,'Sekretar'),(3,'Trener'),(4,'Računovođa'),(5,'Organizator turnira');
/*!40000 ALTER TABLE `korisnicki_nalog_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `potvrda_tip`
--
LOCK TABLES `potvrda_tip` WRITE;
/*!40000 ALTER TABLE `potvrda_tip` DISABLE KEYS */;
INSERT INTO `potvrda_tip` VALUES (1,'Učlanjivanje'),(2,'Iščlanjivanje'),(3,'Aktivan član'),(4,'Pravdanje'),(5,'Prazno');
/*!40000 ALTER TABLE `potvrda_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tip_transakcije`
--

LOCK TABLES `tip_transakcije` WRITE;
/*!40000 ALTER TABLE `tip_transakcije` DISABLE KEYS */;
INSERT INTO `tip_transakcije` VALUES (1,'Članarina'),(3,'Plata'),(4,'Sredstva za opremu'),(5,'Uplata za turnir'),(6,'Sredstva za turnir'),(7,'Donacija');
/*!40000 ALTER TABLE `tip_transakcije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `turnir_kategorija`
--

LOCK TABLES `turnir_kategorija` WRITE;
/*!40000 ALTER TABLE `turnir_kategorija` DISABLE KEYS */;
INSERT INTO `turnir_kategorija` VALUES (1,'Muški singl'),(2,'Ženski singl'),(3,'Muški dubl'),(4,'Ženski dubl');
/*!40000 ALTER TABLE `turnir_kategorija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `zaposleni_tip`
--

LOCK TABLES `zaposleni_tip` WRITE;
/*!40000 ALTER TABLE `zaposleni_tip` DISABLE KEYS */;
INSERT INTO `zaposleni_tip` VALUES (1,'Sekretar'),(2,'Trener'),(3,'Računovođa'),(4,'Direktor'),(5,'Pomoćno osoblje'),(6,'Sekretar');
/*!40000 ALTER TABLE `zaposleni_tip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-26 16:47:11
LOCK TABLES `korisnicki_nalog` WRITE;
/*!40000 ALTER TABLE `korisnicki_nalog` DISABLE KEYS */;
INSERT INTO `korisnicki_nalog` VALUES (1,'admin','$2a$12$YMIFpKrTy7mVcAw7ArPqEO7PxpRiT9tTlo.L9Vx.0i.xbDnljcCsW','2018-01-27',1,1,NULL),(2,'sekretar','$2a$12$Y6Su8oLFTz1ulv7tCdut1eoONuY4YlpeGJXo6D5fTxWXsUs4P5nwe','2018-01-27',1,2,NULL),(3,'trener','$2a$12$GzC6rUE5NyYNZRrKSBM1eOQrbWIGMxdltFTv8MfOdts0mNgFgV1pG','2018-01-27',1,3,NULL),(4,'racunovodja','$2a$12$J1/F3L0Ley825CTpYPCgyOOCE2aGn.cRshykqyMVZH1zjIy3H5MBq','2018-01-27',1,4,NULL),(5,'organizator','$2a$12$s.W2CqO1IBrOy5mj20HbEOfIAUnetgWRxAxltRqTs8E0pbi/D43qy','2018-01-27',1,5,NULL);
/*!40000 ALTER TABLE `korisnicki_nalog` ENABLE KEYS */;
UNLOCK TABLES;
