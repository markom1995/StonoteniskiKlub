-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dzoksrs_db
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clanarina`
--

LOCK TABLES `clanarina` WRITE;
/*!40000 ALTER TABLE `clanarina` DISABLE KEYS */;
/*!40000 ALTER TABLE `clanarina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clanstvo`
--

LOCK TABLES `clanstvo` WRITE;
/*!40000 ALTER TABLE `clanstvo` DISABLE KEYS */;
/*!40000 ALTER TABLE `clanstvo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `distributer_opreme`
--

LOCK TABLES `distributer_opreme` WRITE;
/*!40000 ALTER TABLE `distributer_opreme` DISABLE KEYS */;
INSERT INTO `distributer_opreme` VALUES (1,'Juventa Sport','051/212-011','Veselina Masleše 3',NULL),(2,'Linea','051/652-763','Jevrejska BB',NULL),(3,'Jaćimović Sport','051/798-111','Marka Kraljevica 150A','sport@jacimovic.com');
/*!40000 ALTER TABLE `distributer_opreme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dnevni_red_stavka`
--

LOCK TABLES `dnevni_red_stavka` WRITE;
/*!40000 ALTER TABLE `dnevni_red_stavka` DISABLE KEYS */;
/*!40000 ALTER TABLE `dnevni_red_stavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dogadjaj`
--

LOCK TABLES `dogadjaj` WRITE;
/*!40000 ALTER TABLE `dogadjaj` DISABLE KEYS */;
/*!40000 ALTER TABLE `dogadjaj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dogadjaj_tip`
--

LOCK TABLES `dogadjaj_tip` WRITE;
/*!40000 ALTER TABLE `dogadjaj_tip` DISABLE KEYS */;
INSERT INTO `dogadjaj_tip` VALUES (1,'Trening'),(2,'Skupština');
/*!40000 ALTER TABLE `dogadjaj_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `donacija`
--

LOCK TABLES `donacija` WRITE;
/*!40000 ALTER TABLE `donacija` DISABLE KEYS */;
/*!40000 ALTER TABLE `donacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `izvjestaj_stavka`
--

LOCK TABLES `izvjestaj_stavka` WRITE;
/*!40000 ALTER TABLE `izvjestaj_stavka` DISABLE KEYS */;
/*!40000 ALTER TABLE `izvjestaj_stavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `kategorija`
--

LOCK TABLES `kategorija` WRITE;
/*!40000 ALTER TABLE `kategorija` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategorija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `korisnicki_nalog`
--

LOCK TABLES `korisnicki_nalog` WRITE;
/*!40000 ALTER TABLE `korisnicki_nalog` DISABLE KEYS */;
INSERT INTO `korisnicki_nalog` VALUES (1,'admin','$2a$12$YMIFpKrTy7mVcAw7ArPqEO7PxpRiT9tTlo.L9Vx.0i.xbDnljcCsW','2018-01-27',1,1,NULL),(2,'sekretar','$2a$12$Y6Su8oLFTz1ulv7tCdut1eoONuY4YlpeGJXo6D5fTxWXsUs4P5nwe','2018-01-27',1,2,NULL),(3,'trener','$2a$12$GzC6rUE5NyYNZRrKSBM1eOQrbWIGMxdltFTv8MfOdts0mNgFgV1pG','2018-01-27',1,3,NULL),(4,'racunovodja','$2a$12$J1/F3L0Ley825CTpYPCgyOOCE2aGn.cRshykqyMVZH1zjIy3H5MBq','2018-01-27',1,4,NULL),(5,'organizator','$2a$12$s.W2CqO1IBrOy5mj20HbEOfIAUnetgWRxAxltRqTs8E0pbi/D43qy','2018-01-27',1,5,NULL);
/*!40000 ALTER TABLE `korisnicki_nalog` ENABLE KEYS */;
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
-- Dumping data for table `mec`
--

LOCK TABLES `mec` WRITE;
/*!40000 ALTER TABLE `mec` DISABLE KEYS */;
/*!40000 ALTER TABLE `mec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `narudzba`
--

LOCK TABLES `narudzba` WRITE;
/*!40000 ALTER TABLE `narudzba` DISABLE KEYS */;
INSERT INTO `narudzba` VALUES (1,'2018-01-25',0,0,1,0),(2,'2018-01-24',1,1,3,0),(3,'2018-01-20',1,0,3,0);
/*!40000 ALTER TABLE `narudzba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `narudzba_stavka`
--

LOCK TABLES `narudzba_stavka` WRITE;
/*!40000 ALTER TABLE `narudzba_stavka` DISABLE KEYS */;
INSERT INTO `narudzba_stavka` VALUES (1,1,'L',1,15.99,0),(1,1,'XL',2,15.99,0),(1,2,'S',1,12.99,0),(2,5,'-',5,1350.99,1),(3,6,'-',5,1790.99,0);
/*!40000 ALTER TABLE `narudzba_stavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `novcana_sredstva`
--

LOCK TABLES `novcana_sredstva` WRITE;
/*!40000 ALTER TABLE `novcana_sredstva` DISABLE KEYS */;
/*!40000 ALTER TABLE `novcana_sredstva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oprema`
--

LOCK TABLES `oprema` WRITE;
/*!40000 ALTER TABLE `oprema` DISABLE KEYS */;
INSERT INTO `oprema` VALUES (60,5,2,0,'-'),(61,5,2,0,'-'),(62,5,2,0,'-'),(63,5,2,0,'-'),(64,5,2,0,'-');
/*!40000 ALTER TABLE `oprema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oprema_clan`
--

LOCK TABLES `oprema_clan` WRITE;
/*!40000 ALTER TABLE `oprema_clan` DISABLE KEYS */;
/*!40000 ALTER TABLE `oprema_clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oprema_klub`
--

LOCK TABLES `oprema_klub` WRITE;
/*!40000 ALTER TABLE `oprema_klub` DISABLE KEYS */;
INSERT INTO `oprema_klub` VALUES ('Nova oprema.',1,60,0,NULL,NULL,NULL),('Nova oprema.',1,61,0,NULL,NULL,NULL),('Nova oprema.',1,62,0,NULL,NULL,NULL),('Nova oprema.',1,63,0,NULL,NULL,NULL),('Nova oprema.',1,64,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oprema_klub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oprema_tip`
--

LOCK TABLES `oprema_tip` WRITE;
/*!40000 ALTER TABLE `oprema_tip` DISABLE KEYS */;
INSERT INTO `oprema_tip` VALUES (1,'Majica','Adidas','M100',1),(2,'Majica','Adidas','Z150',1),(3,'Šorc','Tibhar','M1543',1),(4,'Duks','Nike','Z342',1),(5,'Sto','Tibhar','S786',0),(6,'Sto','Tibhar','S798',0);
/*!40000 ALTER TABLE `oprema_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
/*!40000 ALTER TABLE `osoba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `plata`
--

LOCK TABLES `plata` WRITE;
/*!40000 ALTER TABLE `plata` DISABLE KEYS */;
/*!40000 ALTER TABLE `plata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `potvrda`
--

LOCK TABLES `potvrda` WRITE;
/*!40000 ALTER TABLE `potvrda` DISABLE KEYS */;
/*!40000 ALTER TABLE `potvrda` ENABLE KEYS */;
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
-- Dumping data for table `registracija`
--

LOCK TABLES `registracija` WRITE;
/*!40000 ALTER TABLE `registracija` DISABLE KEYS */;
/*!40000 ALTER TABLE `registracija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `runda`
--

LOCK TABLES `runda` WRITE;
/*!40000 ALTER TABLE `runda` DISABLE KEYS */;
/*!40000 ALTER TABLE `runda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `skupstina`
--

LOCK TABLES `skupstina` WRITE;
/*!40000 ALTER TABLE `skupstina` DISABLE KEYS */;
/*!40000 ALTER TABLE `skupstina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sponzor`
--

LOCK TABLES `sponzor` WRITE;
/*!40000 ALTER TABLE `sponzor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponzor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `telefon`
--

LOCK TABLES `telefon` WRITE;
/*!40000 ALTER TABLE `telefon` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tim`
--

LOCK TABLES `tim` WRITE;
/*!40000 ALTER TABLE `tim` DISABLE KEYS */;
/*!40000 ALTER TABLE `tim` ENABLE KEYS */;
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
-- Dumping data for table `transakcija`
--

LOCK TABLES `transakcija` WRITE;
/*!40000 ALTER TABLE `transakcija` DISABLE KEYS */;
/*!40000 ALTER TABLE `transakcija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trening`
--

LOCK TABLES `trening` WRITE;
/*!40000 ALTER TABLE `trening` DISABLE KEYS */;
/*!40000 ALTER TABLE `trening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `troskovi_oprema`
--

LOCK TABLES `troskovi_oprema` WRITE;
/*!40000 ALTER TABLE `troskovi_oprema` DISABLE KEYS */;
/*!40000 ALTER TABLE `troskovi_oprema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `troskovi_turnir`
--

LOCK TABLES `troskovi_turnir` WRITE;
/*!40000 ALTER TABLE `troskovi_turnir` DISABLE KEYS */;
/*!40000 ALTER TABLE `troskovi_turnir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `turnir`
--

LOCK TABLES `turnir` WRITE;
/*!40000 ALTER TABLE `turnir` DISABLE KEYS */;
/*!40000 ALTER TABLE `turnir` ENABLE KEYS */;
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
-- Dumping data for table `ucesce_na_turniru`
--

LOCK TABLES `ucesce_na_turniru` WRITE;
/*!40000 ALTER TABLE `ucesce_na_turniru` DISABLE KEYS */;
/*!40000 ALTER TABLE `ucesce_na_turniru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ucesnik_prijava`
--

LOCK TABLES `ucesnik_prijava` WRITE;
/*!40000 ALTER TABLE `ucesnik_prijava` DISABLE KEYS */;
/*!40000 ALTER TABLE `ucesnik_prijava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ugovor_sponzor`
--

LOCK TABLES `ugovor_sponzor` WRITE;
/*!40000 ALTER TABLE `ugovor_sponzor` DISABLE KEYS */;
/*!40000 ALTER TABLE `ugovor_sponzor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `zaposleni`
--

LOCK TABLES `zaposleni` WRITE;
/*!40000 ALTER TABLE `zaposleni` DISABLE KEYS */;
/*!40000 ALTER TABLE `zaposleni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `zaposleni_tip`
--

LOCK TABLES `zaposleni_tip` WRITE;
/*!40000 ALTER TABLE `zaposleni_tip` DISABLE KEYS */;
INSERT INTO `zaposleni_tip` VALUES (1,'Sekretar'),(2,'Trener'),(3,'Računovođa'),(4,'Direktor'),(5,'Pomoćno osoblje'),(6,'Sekretar');
/*!40000 ALTER TABLE `zaposleni_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `zaposlenje`
--

LOCK TABLES `zaposlenje` WRITE;
/*!40000 ALTER TABLE `zaposlenje` DISABLE KEYS */;
/*!40000 ALTER TABLE `zaposlenje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `zrijeb`
--

LOCK TABLES `zrijeb` WRITE;
/*!40000 ALTER TABLE `zrijeb` DISABLE KEYS */;
/*!40000 ALTER TABLE `zrijeb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-27 10:02:49
