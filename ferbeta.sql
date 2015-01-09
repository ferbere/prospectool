-- MySQL dump 10.13  Distrib 5.1.44, for apple-darwin8.11.1 (i386)
--
-- Host: localhost    Database: ferbeta
-- ------------------------------------------------------
-- Server version	5.1.44

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
-- Table structure for table `activismo_index`
--

DROP TABLE IF EXISTS `activismo_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activismo_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(128) NOT NULL DEFAULT '',
  `passwd` varchar(128) DEFAULT NULL,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  `rango` int(5) NOT NULL DEFAULT '1',
  `email` varchar(35) NOT NULL DEFAULT '',
  `telefono` varchar(30) NOT NULL DEFAULT '',
  `celular` varchar(30) NOT NULL DEFAULT '',
  `domicilio` varchar(250) NOT NULL DEFAULT '',
  `poblacion` varchar(150) NOT NULL DEFAULT '',
  `estado` int(3) NOT NULL,
  `redes` int(11) NOT NULL,
  `discipulos` int(5) NOT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activated` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activismo_index`
--

LOCK TABLES `activismo_index` WRITE;
/*!40000 ALTER TABLE `activismo_index` DISABLE KEYS */;
INSERT INTO `activismo_index` VALUES (2,'normanda','45c51256de3ee177c1b403e438f32a0e','Alicia Normanda','',3,'normanda.alicia@gmail.com','10862136','','RevoluciÃ³n casi 200','98',15,0,0,'2014-12-27 09:00:46',1);
/*!40000 ALTER TABLE `activismo_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activismo_rango`
--

DROP TABLE IF EXISTS `activismo_rango`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activismo_rango` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `imagen` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activismo_rango`
--

LOCK TABLES `activismo_rango` WRITE;
/*!40000 ALTER TABLE `activismo_rango` DISABLE KEYS */;
INSERT INTO `activismo_rango` VALUES (1,'simpatizante',''),(2,'militante',''),(3,'hacktivista','');
/*!40000 ALTER TABLE `activismo_rango` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activismo_redes`
--

DROP TABLE IF EXISTS `activismo_redes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activismo_redes` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `imagen` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activismo_redes`
--

LOCK TABLES `activismo_redes` WRITE;
/*!40000 ALTER TABLE `activismo_redes` DISABLE KEYS */;
INSERT INTO `activismo_redes` VALUES (1,'facebook','fa-facebook-square'),(2,'twitter','fa-twitter-square');
/*!40000 ALTER TABLE `activismo_redes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activismo_redes_asigna`
--

DROP TABLE IF EXISTS `activismo_redes_asigna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activismo_redes_asigna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `red` int(3) NOT NULL,
  `cuenta` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activismo_redes_asigna`
--

LOCK TABLES `activismo_redes_asigna` WRITE;
/*!40000 ALTER TABLE `activismo_redes_asigna` DISABLE KEYS */;
/*!40000 ALTER TABLE `activismo_redes_asigna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_coordina`
--

DROP TABLE IF EXISTS `agenda_coordina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda_coordina` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `coordinador_id` int(5) NOT NULL,
  `dia_id` int(5) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_coordina`
--

LOCK TABLES `agenda_coordina` WRITE;
/*!40000 ALTER TABLE `agenda_coordina` DISABLE KEYS */;
INSERT INTO `agenda_coordina` VALUES (12,2,1);
/*!40000 ALTER TABLE `agenda_coordina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_dia`
--

DROP TABLE IF EXISTS `agenda_dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda_dia` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `campagna` int(2) NOT NULL DEFAULT '1',
  `fecha` date DEFAULT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_dia`
--

LOCK TABLES `agenda_dia` WRITE;
/*!40000 ALTER TABLE `agenda_dia` DISABLE KEYS */;
INSERT INTO `agenda_dia` VALUES (1,'MiÃ©rcoles 18 de julio de 2015',1,'2015-07-18',1),(2,'Jueves 19 de julio de 2015',1,'2015-07-19',1),(3,'Viernes 20 de julio de 2015',1,'2015-07-20',1),(4,'SÃ¡bado 21 de julio de 2015',1,'2015-07-21',1),(5,'Domingo 22 de julio de 2015',1,'2015-07-22',1),(6,'Martes 17 de julio de 2015',2,'2015-07-17',1),(7,'',1,'2015-02-17',1);
/*!40000 ALTER TABLE `agenda_dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_imparte`
--

DROP TABLE IF EXISTS `agenda_imparte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda_imparte` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `perfil` varchar(250) NOT NULL DEFAULT '',
  `curri` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_imparte`
--

LOCK TABLES `agenda_imparte` WRITE;
/*!40000 ALTER TABLE `agenda_imparte` DISABLE KEYS */;
INSERT INTO `agenda_imparte` VALUES (1,'Mario Alberto Pinetti','Izquierdo',''),(2,'Manolo Potamona','','');
/*!40000 ALTER TABLE `agenda_imparte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_programa`
--

DROP TABLE IF EXISTS `agenda_programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda_programa` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL DEFAULT '',
  `subtitulo` varchar(250) NOT NULL DEFAULT '',
  `categoria` int(2) NOT NULL DEFAULT '0',
  `imparte` int(3) NOT NULL DEFAULT '0',
  `dirigido` int(2) NOT NULL DEFAULT '0',
  `descripcion` text NOT NULL,
  `lugar` int(2) NOT NULL DEFAULT '0',
  `dia` int(5) NOT NULL DEFAULT '0',
  `hora_i` time NOT NULL DEFAULT '00:00:00',
  `hora_t` time NOT NULL DEFAULT '00:00:00',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_programa`
--

LOCK TABLES `agenda_programa` WRITE;
/*!40000 ALTER TABLE `agenda_programa` DISABLE KEYS */;
INSERT INTO `agenda_programa` VALUES (1,'Entrega de distinciones','',1,1,0,'',0,1,'14:00:00','14:45:00',1),(2,'Subida de contenidos','',0,2,0,'',0,1,'15:00:00','15:25:00',1);
/*!40000 ALTER TABLE `agenda_programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_categoria`
--

DROP TABLE IF EXISTS `articulos_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_categoria` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  `belong` int(3) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_categoria`
--

LOCK TABLES `articulos_categoria` WRITE;
/*!40000 ALTER TABLE `articulos_categoria` DISABLE KEYS */;
INSERT INTO `articulos_categoria` VALUES (1,'Blog','',0);
/*!40000 ALTER TABLE `articulos_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_conflicto`
--

DROP TABLE IF EXISTS `articulos_conflicto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_conflicto` (
  `id` smallint(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_conflicto`
--

LOCK TABLES `articulos_conflicto` WRITE;
/*!40000 ALTER TABLE `articulos_conflicto` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos_conflicto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_ediciones`
--

DROP TABLE IF EXISTS `articulos_ediciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_ediciones` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `imagen` varchar(10) NOT NULL,
  `ruta` varchar(159) NOT NULL,
  `liberada` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_ediciones`
--

LOCK TABLES `articulos_ediciones` WRITE;
/*!40000 ALTER TABLE `articulos_ediciones` DISABLE KEYS */;
INSERT INTO `articulos_ediciones` VALUES (1,'unica','','',1);
/*!40000 ALTER TABLE `articulos_ediciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_fotoedicion`
--

DROP TABLE IF EXISTS `articulos_fotoedicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_fotoedicion` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(50) NOT NULL,
  `paginas` varchar(50) DEFAULT NULL,
  `edicion` int(3) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=566 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_fotoedicion`
--

LOCK TABLES `articulos_fotoedicion` WRITE;
/*!40000 ALTER TABLE `articulos_fotoedicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos_fotoedicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_index`
--

DROP TABLE IF EXISTS `articulos_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_index` (
  `id` bigint(7) NOT NULL AUTO_INCREMENT,
  `categoria` smallint(2) NOT NULL DEFAULT '0',
  `titulo` varchar(250) NOT NULL,
  `subtitulo` varchar(50) NOT NULL DEFAULT '',
  `edicion` int(5) NOT NULL DEFAULT '0',
  `contenido` text NOT NULL,
  `publicado` smallint(1) NOT NULL DEFAULT '0',
  `autor` int(5) NOT NULL DEFAULT '0',
  `fecha` date DEFAULT NULL,
  `imagen` varchar(20) NOT NULL DEFAULT '',
  KEY `id` (`id`),
  FULLTEXT KEY `titulo` (`titulo`,`subtitulo`,`contenido`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_index`
--

LOCK TABLES `articulos_index` WRITE;
/*!40000 ALTER TABLE `articulos_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_mensaje`
--

DROP TABLE IF EXISTS `articulos_mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_mensaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel` int(8) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `contenido` text,
  `publicado` smallint(1) NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_mensaje`
--

LOCK TABLES `articulos_mensaje` WRITE;
/*!40000 ALTER TABLE `articulos_mensaje` DISABLE KEYS */;
INSERT INTO `articulos_mensaje` VALUES (1,2,'Hermosi','para@la','paranoia gonzalez','Qué bonito todo',0,'2014-09-12 23:03:00'),(2,2,'Otra cosa','cghis@moco','JPoncjho','Pos sí',0,'2014-09-12 23:03:41');
/*!40000 ALTER TABLE `articulos_mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_resaque`
--

DROP TABLE IF EXISTS `articulos_resaque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos_resaque` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `contenido` text NOT NULL,
  `vincula` int(3) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_resaque`
--

LOCK TABLES `articulos_resaque` WRITE;
/*!40000 ALTER TABLE `articulos_resaque` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos_resaque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners_dir`
--

DROP TABLE IF EXISTS `banners_dir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners_dir` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners_dir`
--

LOCK TABLES `banners_dir` WRITE;
/*!40000 ALTER TABLE `banners_dir` DISABLE KEYS */;
INSERT INTO `banners_dir` VALUES (0,'Central',''),(1,'Izq. Superior',''),(2,'Der. Superior',''),(3,'Izq. Inferior',''),(4,'Der. Inferior',''),(5,'Inferior',''),(7,'Superior',''),(6,'Ninguno','');
/*!40000 ALTER TABLE `banners_dir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners_ext`
--

DROP TABLE IF EXISTS `banners_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners_ext` (
  `id` smallint(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners_ext`
--

LOCK TABLES `banners_ext` WRITE;
/*!40000 ALTER TABLE `banners_ext` DISABLE KEYS */;
INSERT INTO `banners_ext` VALUES (1,'jpg'),(2,'swf'),(3,'gif');
/*!40000 ALTER TABLE `banners_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners_index`
--

DROP TABLE IF EXISTS `banners_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners_index` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(50) DEFAULT NULL,
  `orientacion` smallint(2) NOT NULL DEFAULT '1',
  `visible` smallint(1) NOT NULL DEFAULT '0',
  `nombre` varchar(250) NOT NULL,
  `contenido` text,
  `orden` int(2) NOT NULL DEFAULT '0',
  `banner` smallint(2) NOT NULL DEFAULT '6',
  `liga` varchar(250) NOT NULL,
  `count` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners_index`
--

LOCK TABLES `banners_index` WRITE;
/*!40000 ALTER TABLE `banners_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja_index`
--

DROP TABLE IF EXISTS `caja_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abre` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sesion` smallint(1) NOT NULL DEFAULT '0',
  `cierra` datetime DEFAULT NULL,
  `cantidad` decimal(19,2) DEFAULT '0.00',
  `cajero` int(5) NOT NULL DEFAULT '0',
  `fondo` decimal(19,2) NOT NULL DEFAULT '0.00',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja_index`
--

LOCK TABLES `caja_index` WRITE;
/*!40000 ALTER TABLE `caja_index` DISABLE KEYS */;
INSERT INTO `caja_index` VALUES (1,'2014-07-09 04:20:00',0,'2014-07-08 23:24:34','11367.00',2,'200.00'),(2,'2014-07-09 04:28:57',0,'2014-07-08 23:34:02','2994.00',2,'250.00'),(3,'2014-07-10 00:45:06',0,'2014-07-09 00:19:12','7320.00',1,'200.00'),(4,'2014-07-10 18:32:38',0,'2014-07-10 23:28:18','225.00',1,'300.00'),(5,'2014-07-11 19:04:02',0,'2014-07-11 16:19:02','105.00',1,'200.00'),(6,'2014-07-15 00:37:36',0,'2014-07-14 20:39:42','390.00',1,'300.00'),(7,'2014-07-15 14:31:35',0,'2014-07-15 10:29:53','318.00',1,'220.00'),(8,'2014-07-16 16:35:40',0,'2014-07-16 00:44:15','219.00',1,'200.00'),(9,'2014-07-17 18:09:11',0,NULL,'0.00',1,'200.00'),(10,'2014-10-20 19:46:14',0,'2014-10-20 15:48:54','0.00',1,'300.00'),(11,'2014-10-20 19:49:32',0,'2014-10-27 22:57:01','5000.00',1,'255.00');
/*!40000 ALTER TABLE `caja_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat-catalogo`
--

DROP TABLE IF EXISTS `cat-catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat-catalogo` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat-catalogo`
--

LOCK TABLES `cat-catalogo` WRITE;
/*!40000 ALTER TABLE `cat-catalogo` DISABLE KEYS */;
INSERT INTO `cat-catalogo` VALUES (2,'Ninguna',''),(1,'Vidrios',''),(2,'Vitrales',''),(3,'Canceles',''),(3,'Dise&ntilde;o','');
/*!40000 ALTER TABLE `cat-catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_asigna`
--

DROP TABLE IF EXISTS `catalogo_asigna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_asigna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` int(5) NOT NULL,
  `pieza` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_asigna`
--

LOCK TABLES `catalogo_asigna` WRITE;
/*!40000 ALTER TABLE `catalogo_asigna` DISABLE KEYS */;
INSERT INTO `catalogo_asigna` VALUES (1,1,1),(2,1,4),(3,1,14),(4,1,11),(9,2,26),(6,2,5),(7,2,9),(8,2,8),(10,2,2),(11,2,4),(12,2,10),(13,2,1);
/*!40000 ALTER TABLE `catalogo_asigna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_categoria`
--

DROP TABLE IF EXISTS `catalogo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_categoria` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(30) DEFAULT NULL,
  `belong` smallint(2) NOT NULL DEFAULT '0',
  `subelong` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_categoria`
--

LOCK TABLES `catalogo_categoria` WRITE;
/*!40000 ALTER TABLE `catalogo_categoria` DISABLE KEYS */;
INSERT INTO `catalogo_categoria` VALUES (1,'Default','',0,0);
/*!40000 ALTER TABLE `catalogo_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_dimensiones`
--

DROP TABLE IF EXISTS `catalogo_dimensiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_dimensiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `precio` decimal(19,2) NOT NULL DEFAULT '0.00',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `vincula` int(11) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_dimensiones`
--

LOCK TABLES `catalogo_dimensiones` WRITE;
/*!40000 ALTER TABLE `catalogo_dimensiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogo_dimensiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_ext`
--

DROP TABLE IF EXISTS `catalogo_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_ext` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL DEFAULT '',
  `descripcion` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_ext`
--

LOCK TABLES `catalogo_ext` WRITE;
/*!40000 ALTER TABLE `catalogo_ext` DISABLE KEYS */;
INSERT INTO `catalogo_ext` VALUES (0,'ninguno','sin formato'),(1,'jpg','fotos'),(2,'png','fotos'),(3,'swf','flash'),(4,'mov','video'),(5,'avi','video');
/*!40000 ALTER TABLE `catalogo_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_index`
--

DROP TABLE IF EXISTS `catalogo_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_index` (
  `id` bigint(7) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `descripcion` text,
  `imagen` varchar(100) NOT NULL DEFAULT 'sin_titulo',
  `subnombre` varchar(100) DEFAULT NULL,
  `categoria` int(3) NOT NULL DEFAULT '0',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `existe` int(4) NOT NULL DEFAULT '1',
  `bolean` smallint(1) NOT NULL DEFAULT '0',
  `precio` decimal(19,2) NOT NULL DEFAULT '0.00',
  `dimensiones` varchar(150) DEFAULT NULL,
  `orden` int(8) NOT NULL DEFAULT '0',
  `precio_alta2` decimal(19,2) NOT NULL DEFAULT '0.00',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_index`
--

LOCK TABLES `catalogo_index` WRITE;
/*!40000 ALTER TABLE `catalogo_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogo_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_label`
--

DROP TABLE IF EXISTS `catalogo_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_label` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_label`
--

LOCK TABLES `catalogo_label` WRITE;
/*!40000 ALTER TABLE `catalogo_label` DISABLE KEYS */;
INSERT INTO `catalogo_label` VALUES (1,'Rolando',''),(2,'Adriana','');
/*!40000 ALTER TABLE `catalogo_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_temporadas`
--

DROP TABLE IF EXISTS `catalogo_temporadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_temporadas` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_temporadas`
--

LOCK TABLES `catalogo_temporadas` WRITE;
/*!40000 ALTER TABLE `catalogo_temporadas` DISABLE KEYS */;
INSERT INTO `catalogo_temporadas` VALUES (1,'baja','2012-05-01','2012-10-31'),(2,'alta','2012-11-01','2012-12-20'),(3,'altisima','2012-12-21','2013-01-04'),(4,'alta2','2013-01-05','2013-04-30');
/*!40000 ALTER TABLE `catalogo_temporadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas_index`
--

DROP TABLE IF EXISTS `citas_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citas_index` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `contenido` text NOT NULL,
  `autor` varchar(100) NOT NULL DEFAULT '',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas_index`
--

LOCK TABLES `citas_index` WRITE;
/*!40000 ALTER TABLE `citas_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigo_categoria`
--

DROP TABLE IF EXISTS `codigo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codigo_categoria` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigo_categoria`
--

LOCK TABLES `codigo_categoria` WRITE;
/*!40000 ALTER TABLE `codigo_categoria` DISABLE KEYS */;
INSERT INTO `codigo_categoria` VALUES (1,'mysql'),(2,'php');
/*!40000 ALTER TABLE `codigo_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigo_index`
--

DROP TABLE IF EXISTS `codigo_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codigo_index` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `contenido` text NOT NULL,
  `categoria` int(3) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigo_index`
--

LOCK TABLES `codigo_index` WRITE;
/*!40000 ALTER TABLE `codigo_index` DISABLE KEYS */;
INSERT INTO `codigo_index` VALUES (1,'Consulta la DB','SELECT bunker.gadgets_botones_admin.imagen FROM bunker.gadgets_botones_admin																						',1),(2,'Golosinas para mesa de dulces','<?php echo \"hola mundo\" ?>',2),(3,'Onomatopeyas','<?php echo \"chanfle\" ?>					',2);
/*!40000 ALTER TABLE `codigo_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coment`
--

DROP TABLE IF EXISTS `coment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL DEFAULT '',
  `remite` varchar(150) NOT NULL DEFAULT '',
  `correo` varchar(50) NOT NULL DEFAULT '',
  `comentario` text,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `relativo` int(11) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coment`
--

LOCK TABLES `coment` WRITE;
/*!40000 ALTER TABLE `coment` DISABLE KEYS */;
INSERT INTO `coment` VALUES (1,'Algo estÃ¡ pasando...','Alicia','','que mis mensajes no aparecen, TRABAJEEEEN!!!','2010-12-03 08:40:26',2);
/*!40000 ALTER TABLE `coment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprar_directorio`
--

DROP TABLE IF EXISTS `comprar_directorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprar_directorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(128) NOT NULL DEFAULT '',
  `passwd` varchar(128) DEFAULT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `address` varchar(250) NOT NULL DEFAULT '',
  `city` varchar(150) NOT NULL DEFAULT '',
  `state` varchar(150) NOT NULL DEFAULT '',
  `country` varchar(20) DEFAULT NULL,
  `zip` varchar(10) NOT NULL DEFAULT '',
  `mail` varchar(35) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activated` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprar_directorio`
--

LOCK TABLES `comprar_directorio` WRITE;
/*!40000 ALTER TABLE `comprar_directorio` DISABLE KEYS */;
INSERT INTO `comprar_directorio` VALUES (0,'none',NULL,'ninguno','','','',NULL,'','','','2012-11-28 18:26:53',0),(1,'alicia','','Alicia Normanda Lindá','Revolución 199','Santa Anita, Tlaq.,','Jalisco','México','45600','normanda.alicia@gmail.com','10 86 2136','2012-11-08 18:01:21',1),(2,'ferbere','6654ffd4afc21be41bd0aa110eecdb27','Ramsés Figueroa','Revolución 199','Santa Anita, Tlaq.,','Jalisco','México','45600','saargo@gmail.com','10 86 2136','2012-11-08 20:03:55',1),(3,'oliver','acae273a5a5c88b46b36d65a25f5f435','Oliver Palurdo','Revolución 199','Santa Anita, Tlaq.,','Jalisco','México','45600','oliver@ferbere.com','10 86 2136','2012-11-08 20:06:42',1);
/*!40000 ALTER TABLE `comprar_directorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprar_index`
--

DROP TABLE IF EXISTS `comprar_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprar_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL,
  `suma` decimal(19,2) NOT NULL DEFAULT '0.00',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `catalogo` int(3) NOT NULL,
  `precio` decimal(19,2) NOT NULL DEFAULT '0.00',
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `cliente` int(11) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprar_index`
--

LOCK TABLES `comprar_index` WRITE;
/*!40000 ALTER TABLE `comprar_index` DISABLE KEYS */;
INSERT INTO `comprar_index` VALUES (11,'oliver','2160.00','2012-11-29 18:50:40',2,'270.00','2012-11-16','2012-11-24',0);
/*!40000 ALTER TABLE `comprar_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congreso_coordina`
--

DROP TABLE IF EXISTS `congreso_coordina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `congreso_coordina` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `coordinador_id` int(5) NOT NULL,
  `dia_id` int(5) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congreso_coordina`
--

LOCK TABLES `congreso_coordina` WRITE;
/*!40000 ALTER TABLE `congreso_coordina` DISABLE KEYS */;
INSERT INTO `congreso_coordina` VALUES (1,8,1),(2,17,1),(3,25,1),(4,5,2),(5,2,2),(6,26,2),(7,12,3),(8,27,3),(9,28,3),(10,17,4),(11,29,4);
/*!40000 ALTER TABLE `congreso_coordina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congreso_dia`
--

DROP TABLE IF EXISTS `congreso_dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `congreso_dia` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `congreso` smallint(2) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congreso_dia`
--

LOCK TABLES `congreso_dia` WRITE;
/*!40000 ALTER TABLE `congreso_dia` DISABLE KEYS */;
INSERT INTO `congreso_dia` VALUES (1,'Miércoles 18 de julio de 2012',1),(2,'Jueves 19 de julio de 2012',1),(3,'Viernes 20 de julio de 2012',1),(4,'Sábado 21 de julio de 2012',1),(5,'Domingo 22 de julio de 2012',1),(6,'Martes 17 de julio de 2012',2);
/*!40000 ALTER TABLE `congreso_dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congreso_imparte`
--

DROP TABLE IF EXISTS `congreso_imparte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `congreso_imparte` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `imparte` varchar(250) NOT NULL DEFAULT '',
  `perfil` varchar(250) NOT NULL DEFAULT '',
  `curri` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congreso_imparte`
--

LOCK TABLES `congreso_imparte` WRITE;
/*!40000 ALTER TABLE `congreso_imparte` DISABLE KEYS */;
INSERT INTO `congreso_imparte` VALUES (1,'Dr. Salvador Bueno Valenzuela','','Tesorero de la Academia Mexicana de Neurología'),(2,'Dr. Carlos Cuevas','','Presidente de la Academia Mexicana de Neurología'),(3,'Dr. Ulises Aguilar Baturoni','','Fisiologia y doctorado de Fisiologia  H. Syracussa New York Jefe de Neurofisiologia Hospital Juarez 2000 jefe de unidad de fisiologia UNAM. '),(4,'Dr. Francisco Javier Puerta Cuestas','','Neurofisiólogo y Somnólogo. Jefe del Servicio de Neurofisolofìa y de la Unidad de sueño Hospital la Ribera Valencia España. Ex presidente de la Sociedad Española de Sueño.'),(5,'Dra. Guadalupe Bonilla Mejía','','Neurologa IMSS centro medico nacional Neurofisiologia. Unidad Universitaria de Neurofisiologia H. Juarez 2000 Felow sueño Hospital la Ribera, Valencia España'),(6,'Dr. Juan Castrejón Chávez','','Neurólogo IMSS Centro Médico Nacional Neurofisiología. INNN Manuel velasco Suarez. Felos sueño Hospital la Ribera valencia Espana.'),(7,'Dr. Federico Micheli','','Neurólogo, Argentina'),(8,'Dra. Marisela Concepción Parra Bernal','','Neuróloga-Gerontóloga, Presidenta de ANNIMSS. México'),(9,'Dr. Bernardo Ng','','Psiquiatra. Tijuana, BC, México'),(10,'Dr. Francisco Javier Puertas, Dr. Juan Castrejón y Dra. Guadalupe Bonilla','',''),(11,'Dr. Victor M. Rivera-Olmos','','Neurólgo, profesor titular de Neurología, Baylor College of Medicine Maxine Mesinger Multiple Sclerosis Clinic, The Methodist Hospital, Houston, Texas, USA'),(12,'Dr. Miguel Ángel Macías Islas','','Profesor titular del departamento de Neurociencias, Centro Universitario de Ciencias de la Salud, Universidad de Guadalajara. Jefe del Departamento de Neurología, Hospital de Especialidades, Centro Médico Nacional de Occidente IMSS, Guadalajara, Jalisco.'),(13,'Dra. Adriana Horta','','IMSS, México'),(14,'Dr. Victor Rivera y Dr. Leonardo Llamas L.','',''),(21,'Dr. Antonio Rizzoli Córdoba ','','HIM'),(15,'Dra. Karina Vélez','','Neurólogoa IMSS. México'),(16,'Dr. Jaime Ruíz Chávez ','',''),(17,'Dra. Edith Alva Moncayo','','Neuróloga pediatra, H. La Raza IMSS, Secretaria de ANNIMSS. México'),(18,'Dra. María Castro Tarín  ','',''),(19,'Dra. Eunice López Correa ','',''),(20,'Dra. Guadalupe González de la Rosa','',''),(22,'Dr. David King-Stephens','Neurólogo, epileptólogo de los  E.U.','Escuela de Medicina, Universidad LaSalle, México. Internado en Medicina Interna en la Universidad de Yale, EUA (1998-1990).<br>\r\nResidencia en Neurología en la Universidad de Columbia, NY, EUA (1990-1993).<br>\r\nSubespecialidad en Epilepsia, Universidad de Yale, EUA (1993-1996).<br>\r\nDirector de neurofisiología, Co-director Servicio de Eplipsia, California Pacific Medical Center, San Francisco, CA, EUA (1999-presente).<br>\r\nPubliaciones: Neurology, Epilepsia, Epilepsia Research.'),(23,'Dr. Héctor González Usigli','','Subespecialidad en Trastornos del Movimiento desde Julio de 2011, en el departamento de Neurología de la Universidad de Cincinnati<br>\r\n\r\nResidencia en Neurología en el Hospital de Especialidades, Centro Médico Nacional de Occidente, IMSS, Universidad de Guadalajara.<br>\r\n\r\nEstudios de Medicina en la Universidad de Guadalajara, Centro Universitario de Ciencias de la Salud (1992.1998)'),(24,'Por confirmar (EU)','',''),(25,'Dr. Mario Mireles R.','',''),(26,'Dr. Francisco Javier Jiménez Gil','',''),(27,'Dr. Juan Lozano Zárate','',''),(28,'Dr. Roberto Partida Medina','',''),(29,'Dr. Leonardo Eleazar Cruz Alcalá','',''),(30,'Dra. Ingrid Eloísa Estrada Bellmann','','');
/*!40000 ALTER TABLE `congreso_imparte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congreso_programa`
--

DROP TABLE IF EXISTS `congreso_programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `congreso_programa` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `tema` varchar(250) NOT NULL,
  `subtema` varchar(250) NOT NULL DEFAULT '',
  `tipo` int(2) NOT NULL DEFAULT '0',
  `imparte` int(3) NOT NULL DEFAULT '0',
  `dirigido` int(2) NOT NULL DEFAULT '0',
  `descripcion` text NOT NULL,
  `lugar` int(2) NOT NULL DEFAULT '0',
  `hora_i` time NOT NULL DEFAULT '00:00:00',
  `hora_t` time NOT NULL DEFAULT '00:00:00',
  `dia` smallint(2) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congreso_programa`
--

LOCK TABLES `congreso_programa` WRITE;
/*!40000 ALTER TABLE `congreso_programa` DISABLE KEYS */;
INSERT INTO `congreso_programa` VALUES (1,'Inscripción y Registro','',1,0,0,'',0,'12:30:00','20:00:00',1),(2,'Pósters y Trabajos Libres','',2,1,0,'',0,'17:00:00','19:00:00',1),(3,'Inauguración','',1,0,0,'A cargo del Dr. Carlos Cuevas Presidente de la Academia Mexicana de Neurología.<br> Cena de Bienvenida.<br><br>\r\nInvitada especial Fundadora de la ANNIMSS<br> \r\nDra. Teresita Corona Vázquez. Directora de Instituto Nacional de Neurologia y Neurocirugía\r\n',0,'20:00:00','23:00:00',1),(4,'Ontogénesis y fisiología del sueño','',0,3,0,'',0,'08:00:00','08:40:00',2),(5,'Narcolepsia','',0,4,0,'',0,'08:40:00','09:40:00',2),(6,'Parasomnias','',0,5,0,'',0,'09:40:00','10:00:00',2),(7,'Síndrome de piernas inquietas y movimientos periódicos de piernas','',0,4,0,'',0,'10:30:00','11:30:00',2),(8,'Trastornos del sueño en Parkinson y Demencia','',0,6,0,'',0,'11:30:00','12:00:00',2),(9,'Actualidades del tratamiento de Enfermedad de Parkinson','',0,7,0,'',0,'12:00:00','13:00:00',2),(10,'Demencia y Parkinson','',0,2,0,'',0,'13:00:00','13:30:00',2),(11,'Simposio: Demencia de Alzheimer','',0,8,0,'',0,'14:00:00','14:30:00',2),(12,'Simposio: Actualidades del manejo de Alzheimer','',0,9,0,'',0,'14:30:00','15:00:00',2),(13,'Sesión de Casos Clínicos del Trastornos del Sueño','',0,10,0,'',0,'15:00:00','16:00:00',2),(14,'Rifa','',1,0,0,'',0,'16:00:00','17:00:00',2),(15,'Simposio: Actividades en tratamiento de la Esclerosis Múltiple ','',0,11,0,'',0,'08:00:00','09:00:00',3),(16,'Cognición y hallazgos neurofisiológicos en Esclerosis Múltiple','',0,12,0,'',0,'09:00:00','09:30:00',3),(38,'Simposio: Más allá de las manifestaciones motoras de la Enfermedad de Parkinson','',0,23,0,'',0,'11:00:00','11:40:00',3),(18,'Casos clínicos en Esclerosis Múltiple','',0,14,0,'',0,'09:30:00','10:30:00',3),(19,'Receso','',1,1,0,'',0,'10:30:00','11:00:00',3),(20,'Casos clínicos en Enfermedad Parkinson','',0,7,0,'',0,'11:40:00','12:40:00',3),(21,'Receso','',1,1,0,'',0,'12:40:00','13:00:00',3),(22,'Tratamiento profiláctico de la Migraña. Experiencia en Mexico','',0,15,0,'',0,'14:00:00','14:40:00',3),(23,'Rifa','',1,1,0,'',0,'14:40:00','15:00:00',3),(24,'Tiempo libre','',1,1,0,'',0,'15:00:00','20:00:00',3),(25,'Cena y entrega de reconocimientos','',1,1,0,'',0,'20:30:00','23:00:00',3),(26,'Simposio: Controversias en la aplicación de Inmunoglobulinas en Patologia Neurológica','',0,16,0,'',0,'08:00:00','09:00:00',4),(27,'Instrumento diagnóstico de los problemas del desarrollo infantil en México y Encuesta sobre las escalas de evaluación del desarrollo del niño a los asistentes.','',0,21,0,'',0,'09:00:00','09:40:00',4),(28,'Avances sobre tratamiento de Síndrome Epilépticos Catastróficos con los nuevos antiepilépticos Vs convencionales','',0,17,0,'',0,'09:40:00','10:10:00',4),(29,'Receso','',1,1,0,'',0,'11:10:00','11:40:00',4),(30,'TDAH  Avances en fisiopatología y aplicación en terapia farmacológica','',0,18,0,'',0,'11:40:00','12:20:00',4),(31,'Comorbilidades de TDAH en la paciente pediátrica','',0,19,0,'',0,'12:20:00','13:00:00',4),(32,'Tratamiento alternativo en TDAH en niños ','',0,20,0,'',0,'13:00:00','13:40:00',4),(33,'Comida de clausura y premiaciones','',1,1,0,'',0,'14:00:00','17:00:00',4),(34,'Salida','',1,0,0,'',0,'08:00:00','12:00:00',5),(35,'Receso','',1,0,0,'',0,'10:00:00','10:30:00',2),(36,'Receso','',1,0,0,'',0,'13:30:00','14:00:00',2),(37,'Simposio: Avances en el tratamiento de la epilepsia evidencias Vs. experiencias','',0,22,0,'',0,'10:10:00','11:10:00',4),(39,'Simposio: \"Diagnóstico de la Enfermedad de Pompe\" (comida)','',0,24,0,'',0,'13:00:00','14:00:00',3),(40,'Rifa','',1,0,0,'',0,'13:40:00','14:00:00',4),(41,'Incripciones (gratuitas)','',1,0,0,'',0,'08:00:00','09:00:00',6),(42,'Mitos y realidades en Epilepsia','',0,17,0,'',0,'09:00:00','10:00:00',6),(43,'Diagnóstico y tratamiento de Cefaleas','',0,1,0,'',0,'10:00:00','11:00:00',6),(44,'Trastornos de Déficit de Atención en Niños y Adolescentes','',0,17,0,'',0,'11:00:00','11:30:00',6),(45,'Trastornos de Déficit de Atención en Adultos','',0,8,0,'',0,'11:30:00','12:00:00',6),(46,'Mesa Redonda','',1,0,0,'',0,'12:00:00','12:30:00',6),(47,'Receso','',1,0,0,'',0,'12:30:00','13:00:00',6),(48,'Falla de memoria y demencias','',0,8,0,'',0,'13:00:00','14:00:00',6),(49,'Enfermedad de Parkinson, Diagnóstico y tratamiento','',0,30,0,'',0,'14:00:00','15:00:00',6);
/*!40000 ALTER TABLE `congreso_programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contador_index`
--

DROP TABLE IF EXISTS `contador_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contador_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) DEFAULT NULL,
  `hora` varchar(8) DEFAULT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `segundos` varchar(30) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contador_index`
--

LOCK TABLES `contador_index` WRITE;
/*!40000 ALTER TABLE `contador_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `contador_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporativa_index`
--

DROP TABLE IF EXISTS `corporativa_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporativa_index` (
  `id` bigint(7) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL DEFAULT '',
  `subtitulo` varchar(50) NOT NULL DEFAULT '',
  `contenido` text NOT NULL,
  `banner` smallint(6) NOT NULL DEFAULT '0',
  `publicado` smallint(1) NOT NULL DEFAULT '0',
  `autor` int(5) NOT NULL DEFAULT '0',
  `ruta` smallint(2) NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imagen` varchar(50) NOT NULL DEFAULT '',
  `orden` int(2) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporativa_index`
--

LOCK TABLES `corporativa_index` WRITE;
/*!40000 ALTER TABLE `corporativa_index` DISABLE KEYS */;
INSERT INTO `corporativa_index` VALUES (1,'Domicilio','','',0,1,1,0,'0000-00-00 00:00:00','',0),(2,'Perfil','','',0,1,0,0,'2012-08-30 15:27:00','',0),(3,'Su mensaje...','','<p>Su mensaje se ha enviado exitosamente.<br /><br /> En breve nos pondremos en contacto con usted.</p>\r\n<p>Muchas gracias</p>',0,1,1,0,'2010-12-08 00:12:27','',0),(5,'About nain','','',0,1,0,0,'2012-10-30 02:15:35','logo',0),(6,'Account created','','<p>Your account has been created. Please check your email, You should have recieved a notification for activate it. If not, please take a look at spam folder, it may be there.</p>',0,1,0,0,'2012-11-08 17:01:19','',0),(7,'Bank account information','','',0,1,0,0,'2012-11-12 05:03:43','',0),(9,'Error 404','','<p>La p&aacute;gina solicitada no existe.</p>',0,1,0,0,'2013-05-06 15:03:38','',0);
/*!40000 ALTER TABLE `corporativa_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporativa_resaque`
--

DROP TABLE IF EXISTS `corporativa_resaque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporativa_resaque` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `contenido` text NOT NULL,
  `vincula` int(3) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporativa_resaque`
--

LOCK TABLES `corporativa_resaque` WRITE;
/*!40000 ALTER TABLE `corporativa_resaque` DISABLE KEYS */;
/*!40000 ALTER TABLE `corporativa_resaque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporativa_rutas`
--

DROP TABLE IF EXISTS `corporativa_rutas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporativa_rutas` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporativa_rutas`
--

LOCK TABLES `corporativa_rutas` WRITE;
/*!40000 ALTER TABLE `corporativa_rutas` DISABLE KEYS */;
INSERT INTO `corporativa_rutas` VALUES (0,'ninguno');
/*!40000 ALTER TABLE `corporativa_rutas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descargar_index`
--

DROP TABLE IF EXISTS `descargar_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descargar_index` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(50) NOT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `disponible` smallint(1) NOT NULL DEFAULT '4',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descargar_index`
--

LOCK TABLES `descargar_index` WRITE;
/*!40000 ALTER TABLE `descargar_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `descargar_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directorio`
--

DROP TABLE IF EXISTS `directorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) NOT NULL DEFAULT '',
  `apellidos` varchar(250) DEFAULT NULL,
  `grupo` int(11) NOT NULL DEFAULT '0',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  `tratamiento` varchar(50) NOT NULL DEFAULT '',
  `apodo` varchar(50) NOT NULL DEFAULT '',
  `empresa` varchar(150) NOT NULL DEFAULT '',
  `cargo` varchar(150) NOT NULL DEFAULT '',
  `telefono_tr1` varchar(30) NOT NULL DEFAULT '',
  `telefono_tr2` varchar(30) NOT NULL DEFAULT '',
  `telefono_pa1` varchar(30) NOT NULL DEFAULT '',
  `telefono_pa2` varchar(30) NOT NULL DEFAULT '',
  `fax_tr` varchar(30) NOT NULL DEFAULT '',
  `fax_pa` varchar(30) NOT NULL DEFAULT '',
  `celular1` varchar(30) NOT NULL DEFAULT '',
  `celular2` varchar(30) NOT NULL DEFAULT '',
  `buscapersonas` varchar(80) NOT NULL DEFAULT '',
  `mail` varchar(50) NOT NULL DEFAULT '',
  `mail2` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `google_talk` varchar(50) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `facebook` varchar(50) NOT NULL DEFAULT '',
  `twitter` varchar(50) NOT NULL DEFAULT '',
  `direccion_tr` varchar(250) NOT NULL DEFAULT '',
  `ciudad_tr` varchar(150) NOT NULL DEFAULT '',
  `estado_tr` varchar(50) NOT NULL DEFAULT '',
  `cp_tr` varchar(10) NOT NULL DEFAULT '',
  `pais_tr` varchar(30) NOT NULL DEFAULT '',
  `direccion_tr2` varchar(250) NOT NULL DEFAULT '',
  `ciudad_tr2` varchar(150) NOT NULL DEFAULT '',
  `estado_tr2` varchar(50) NOT NULL DEFAULT '',
  `cp_tr2` varchar(10) NOT NULL DEFAULT '',
  `pais_tr2` varchar(30) NOT NULL DEFAULT '',
  `direccion_pa` varchar(250) NOT NULL DEFAULT '',
  `ciudad_pa` varchar(150) NOT NULL DEFAULT '',
  `estado_pa` varchar(50) NOT NULL DEFAULT '',
  `cp_pa` varchar(10) NOT NULL DEFAULT '',
  `pais_pa` varchar(30) NOT NULL DEFAULT '',
  `cumpleanos` date DEFAULT NULL,
  `web` varchar(50) NOT NULL DEFAULT '',
  `aniversario` date DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  `notas` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directorio`
--

LOCK TABLES `directorio` WRITE;
/*!40000 ALTER TABLE `directorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `directorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_fotos`
--

DROP TABLE IF EXISTS `eventos_fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos_fotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha` varchar(50) NOT NULL DEFAULT '',
  `participan` text NOT NULL,
  `imagen` varchar(80) NOT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `evento` int(5) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_fotos`
--

LOCK TABLES `eventos_fotos` WRITE;
/*!40000 ALTER TABLE `eventos_fotos` DISABLE KEYS */;
INSERT INTO `eventos_fotos` VALUES (1,'Promesa de transporte público','','','0',1,1);
/*!40000 ALTER TABLE `eventos_fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_index`
--

DROP TABLE IF EXISTS `eventos_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `fecha` varchar(100) NOT NULL DEFAULT '',
  `participan` text NOT NULL,
  `imagen` varchar(80) NOT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_index`
--

LOCK TABLES `eventos_index` WRITE;
/*!40000 ALTER TABLE `eventos_index` DISABLE KEYS */;
INSERT INTO `eventos_index` VALUES (1,'Esperando transporte gratuito','01-03-2013','<p>Y seguimos esperando que este Gobierno cumpla su promesa de dar transporte p&uacute;blico a los estudiantes.</p>','transporte_publico_gratuito',1);
/*!40000 ALTER TABLE `eventos_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categoria`
--

DROP TABLE IF EXISTS `faq_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_categoria` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categoria`
--

LOCK TABLES `faq_categoria` WRITE;
/*!40000 ALTER TABLE `faq_categoria` DISABLE KEYS */;
INSERT INTO `faq_categoria` VALUES (0,'Ninguna',''),(1,'General','');
/*!40000 ALTER TABLE `faq_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_index`
--

DROP TABLE IF EXISTS `faq_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_index` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `pregunta` text NOT NULL,
  `respuesta` text NOT NULL,
  `frecuencia` int(11) NOT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `categoria` int(3) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_index`
--

LOCK TABLES `faq_index` WRITE;
/*!40000 ALTER TABLE `faq_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos_categoria`
--

DROP TABLE IF EXISTS `fotos_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotos_categoria` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(30) DEFAULT NULL,
  `belong` smallint(2) NOT NULL DEFAULT '0',
  `subelong` smallint(1) NOT NULL DEFAULT '0',
  `descripcion` text NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_categoria`
--

LOCK TABLES `fotos_categoria` WRITE;
/*!40000 ALTER TABLE `fotos_categoria` DISABLE KEYS */;
INSERT INTO `fotos_categoria` VALUES (1,'Default','',0,0,'');
/*!40000 ALTER TABLE `fotos_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos_dimensiones`
--

DROP TABLE IF EXISTS `fotos_dimensiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotos_dimensiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `precio` decimal(19,2) NOT NULL DEFAULT '0.00',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `vincula` int(11) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_dimensiones`
--

LOCK TABLES `fotos_dimensiones` WRITE;
/*!40000 ALTER TABLE `fotos_dimensiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos_dimensiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos_ext`
--

DROP TABLE IF EXISTS `fotos_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotos_ext` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL DEFAULT '',
  `descripcion` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_ext`
--

LOCK TABLES `fotos_ext` WRITE;
/*!40000 ALTER TABLE `fotos_ext` DISABLE KEYS */;
INSERT INTO `fotos_ext` VALUES (7,'ninguno','sin formato'),(1,'jpg','fotos'),(2,'png','fotos'),(3,'swf','flash'),(4,'mov','video'),(5,'avi','video');
/*!40000 ALTER TABLE `fotos_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos_index`
--

DROP TABLE IF EXISTS `fotos_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotos_index` (
  `id` bigint(7) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `descripcion` text,
  `imagen` varchar(100) NOT NULL DEFAULT 'sin_titulo',
  `subnombre` varchar(100) DEFAULT NULL,
  `categoria` int(3) NOT NULL DEFAULT '0',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `ext` smallint(2) NOT NULL DEFAULT '0',
  `bolean` smallint(1) NOT NULL DEFAULT '0',
  `orden` int(3) NOT NULL DEFAULT '0',
  `fecha` date DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_index`
--

LOCK TABLES `fotos_index` WRITE;
/*!40000 ALTER TABLE `fotos_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gadgets_botones_admin`
--

DROP TABLE IF EXISTS `gadgets_botones_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gadgets_botones_admin` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `boton` varchar(50) DEFAULT NULL,
  `imagen` varchar(20) NOT NULL DEFAULT '',
  `ext` char(3) NOT NULL DEFAULT '',
  `ruta` varchar(100) NOT NULL,
  `gadget` smallint(2) NOT NULL DEFAULT '0',
  `privilegios` smallint(1) DEFAULT '2',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gadgets_botones_admin`
--

LOCK TABLES `gadgets_botones_admin` WRITE;
/*!40000 ALTER TABLE `gadgets_botones_admin` DISABLE KEYS */;
INSERT INTO `gadgets_botones_admin` VALUES (1,'Art&iacute;culo nuevo','fa-file','png','if_articulos.php',2,2,1),(2,'Editar art&iacute;culo','fa-pencil-square-o','png','bus_articulos.php',2,2,1),(3,'Categor&iacute;a nueva','fa-plus-square-o','png','if_categoria.php',2,2,1),(4,'Agregar gadget','fa-toggle-off','png','if_gadgets.php',1,2,1),(5,'Editar gadget','fa-pencil-square-o','png','bus_gadgets.php',1,2,1),(6,'Nueva informaci&oacute;n','fa-institution','png','if_corporativa.php',4,2,1),(7,'Editar informaci&oacute;n','fa-pencil-square-o','png','bus_corporativa.php',4,2,1),(8,'Agregar foto','fa-camera-retro','png','if_fotos.php',5,2,1),(9,'Administrar fotos','fa-file-photo-o','png','bus_fotos.php',5,2,1),(10,'Editar categor&iacute;a','fa-pencil-square-o','png','bus_categoria.php',2,2,1),(11,'Agregar botÃ³n Admin','fa-dot-circle-o','png','if_botones_admin.php',1,2,1),(12,'Agregar a cat&aacute;logo','fa-plus-square-o','png','if_catalogo.php',8,2,1),(13,'Editar cat&aacute;logo','fa-pencil-square-o','png','bus_catalogo.php',8,2,1),(14,'Nueva categorÃ­a','fa-plus-square-o','png','if_categoria.php',8,2,1),(15,'Editar categorÃ­a','fa-pencil-square-o','png','bus_categoria.php',8,2,1),(16,'Editar BotÃ³n Admin','fa-pencil-square-o','png','bus_botones_admin.php',1,2,1),(17,'Agregar submnÃº','fa-plus-square-o','png','if_submenu.php',1,2,1),(18,'Editar submn&uacute;','fa-pencil-square-o','png','bus_submenu.php',1,2,1),(19,'Agregar banner','fa-plus-square-o','png','if_banner.php',9,2,1),(20,'Editar banner','fa-pencil-square-o','png','bus_banner.php',9,2,1),(21,'Nuevo','fa-plus-square-o','png','if_proyectos.php',10,2,1),(22,'Editar proyecto','fa-pencil-square-o','png','bus_proyectos.php',10,2,1),(23,'Agregar usuario','fa-user','png','if_autor.php',3,2,1),(24,'Modificar usuario','fa-pencil-square-o','png','bus_user.php',3,5,1),(25,'Revisar mensajes','fa-envelope','png','bus_mensajes.php',6,2,1),(26,'Revisar visitantes','fa-line-chart','png','contador.php',7,2,1),(27,'Agregar Resaque','fa-quote-left','png','if_resaque.php',2,2,0),(28,'chas','none','png','if_corporativa_a.php',4,2,1),(29,'chas2','none','png','ip_corporativa_a.php',4,2,1),(31,'Agregar botÃ³n menÃº','fa-dot-circle-o','png','if_botones.php',29,2,1),(32,'Modifica articulo','none','png','if_articulos_a.php',2,2,1),(33,'Modifica categoria','none','png','if_categoria_a.php',2,2,1),(34,'Editar resaque','fa-pencil-square-o','png','bus_resaque.php',2,2,0),(35,'Editar resaque2','none','png','if_resaque_a.php',2,2,0),(36,'Editar user','none','png','if_autor_a.php',3,2,1),(37,'Editar foto','none','png','if_fotos_a.php',5,2,1),(38,'Revisar mensajes2','none','png','mensaje.php',6,2,1),(39,'borra articulo','none','png','borra.php',2,2,1),(40,'Modifica categoria catalogo','none','png','if_categoria_a.php',8,2,1),(41,'Modifica catalogo','none','png','if_catalogo_a.php',8,2,1),(42,'modificar banner','none','png','if_banner_a.php',9,2,1),(43,'Maqueta','fa-plus-square-o','png','if_maqueta.php',9,2,1),(44,'Editar maqueta','fa-pencil-square-o','png','bus_maqueta.php',9,2,1),(45,'Modificar maqueta','none','png','if_maqueta_a.php',9,2,1),(46,'Modificar proyectos','none','png','if_proyectos_a.php',10,2,1),(47,'Agregar publicaciÃ³n','fa-plus-square-o','png','if_publicaciones.php',11,2,1),(48,'Editar publicaciones','fa-pencil-square-o','png','bus_publicaciones.php',11,2,1),(49,'Modificar publicaciones','none','png','if_publicaciones_a.php',11,2,1),(50,'Noticia nueva','fa-plus-square-o','png','if_noticias.php',12,2,1),(51,'Editar noticia','fa-pencil-square-o','png','bus_noticias.php',12,2,1),(52,'Editar noticia INVI','none','png','if_noticias_a.php',12,2,1),(53,'Agregar testimonio','fa-plus-square-o','png','if_testimonios.php',13,2,1),(54,'Editar testimonio','fa-pencil-square-o','png','bus_testimonios.php',13,2,1),(55,'Modificar testimonio','none','png','if_testimonios_a.php',13,2,1),(56,'configuracion','fa-plus-square-o','png','if_configura_a.php',14,2,1),(57,'Crear hoja de estilo','fa-plus-square-o','png','if_templates.php',14,2,1),(58,'templates INVI','none','png','if_templates_a.php',14,2,1),(59,'Editar hoja de estilo','fa-pencil-square-o','png','bus_templates.php',14,2,1),(60,'Modificar botÃ³n menÃº','fa-pencil-square-o','png','bus_botones.php',29,2,1),(61,'botones admin INV','none','png','if_botones_admin_a.php',1,2,1),(62,'Agregar evento','fa-plus-square-o','png','if_evento.php',39,2,1),(63,'Editar evento','fa-pencil-square-o','png','bus_evento.php',39,2,1),(64,'evento INVI','none','png','if_evento_a.php',39,2,1),(65,'Agregar ponente','fa-plus-square-o','png','if_imparte.php',39,2,1),(66,'Editar ponente','fa-pencil-square-o','png','bus_imparte.php',39,2,1),(67,'ponente INVI','none','png','if_imparte_a.php',39,2,1),(68,'Agregar documento','fa-cloud-download','png','if_descargar.php',16,2,1),(69,'Editar descarga','fa-pencil-square-o','png','bus_descargar.php',16,2,1),(70,'descarga INVI','none','png','if_descargar_a.php',16,2,1),(71,'Agregar video','fa-video-camera','png','if_video.php',17,2,1),(72,'Editar video','fa fa-file-video-o','png','bus_video.php',17,2,1),(73,'Editar video INVI','none','png','if_video_a.php',17,2,1),(74,'Editar boton INVI','none','png','if_botones_a.php',29,2,1),(75,'editar gadget INVI','none','png','if_gadgets_a.php',1,2,1),(76,'Agregar liga','fa-link','png','if_ligas.php',18,2,1),(77,'Editar ligas','fa-pencil-square-o','png','bus_ligas.php',18,2,1),(78,'Editar ligas INVI','none','png','if_ligas_a.php',18,2,1),(79,'Agrega patrocinador','fa-plus-square-o','png','if_patrocinador.php',19,2,1),(80,'Editar Patrocinador','fa-pencil-square-o','png','bus_patrocinador.php',19,2,1),(81,'Editar Patrocinador INVI','none','png','if_patrocinador_a.php',19,2,1),(83,'Agregar/ editar coordinador','fa-pencil-square-o','png','bus_coordina.php',39,2,1),(84,'Editar coordina INVI','none','png','if_coordina.php',39,2,1),(85,'Agrega dÃ­a','fa-plus-square-o','png','if_dia.php',39,2,1),(86,'Edita dÃ­a','fa-pencil-square-o','png','bus_dia.php',39,2,1),(87,'Edita dÃ­a INVI','none','png','if_dia_a.php',39,2,1),(88,'Agregar ruta','a-plus-square-o','png','if_ruta.php',4,2,0),(89,'Editar ruta','fa-pencil-square-o','png','bus_ruta.php',4,2,0),(90,'Editar ruta INVI','none','png','if_ruta_a.php',4,2,1),(91,'Agregar resaque','a-plus-square-o','png','if_resaque.php',4,2,0),(92,'Editar resaque','fa-pencil-square-o','png','bus_resaque.php',4,2,0),(93,'Editar resaque INVI','none','png','if_resaque_a.php',4,2,1),(94,'Movimientos','fa-plus-square-o','png','registro.php',20,3,1),(128,'Edita FAQ','fa-pencil-square-o','png','bus_faq.php',22,1,1),(127,'Agrega FAQ','fa-question-circle','png','if_faq.php',22,1,1),(97,'Hacer respaldo','fa-cloud-download','png','exe_respaldo.php',31,2,1),(123,'Agrega categoria','fa-plus-square-o','png','if_categoria.php',5,2,1),(99,'Agregar edición','fa-plus-square-o','png','if_ediciones.php',2,2,0),(100,'Editar edición','fa-pencil-square-o','png','bus_ediciones.php',2,2,0),(101,'Edta ediciones INVI','none','png','if_ediciones_a.php',2,2,0),(102,'Agrega foto edición','fa-plus-square-o','png','if_fotoedicion.php',2,2,0),(103,'Edita fotoedicion','fa-pencil-square-o','png','bus_fotoedicion.php',2,2,0),(104,'Edita fotoedicion INVI','none','png','if_fotoedicion_a.php',2,2,0),(105,'Redactar mail masivo','fa-pencil-square-o','png','if_massive_mail.php',6,1,0),(106,'Edita mail masivo','fa-pencil-square-o','png','bus_massive_mail.php',6,1,0),(107,'Crea grupo envío','fa-plus-square-o','png','if_massive_grupo.php',6,2,0),(108,'Edita grupo envío','fa-pencil-square-o','png','bus_massive_grupo.php',6,2,0),(109,'Edita grupo envío INVI','none','png','if_massive_grupo_a.php',6,2,0),(110,'Editar mail masivo INVI','none','png','if_massive_mail_a.php',6,2,0),(111,'enviado','none','png','enviado.php',6,2,0),(112,'EXE mail INVI','none','png','exe_massive_mail.php',6,2,0),(113,'Agrega contacto','fa-user','png','if_massive_directorio.php',6,2,0),(114,'Editar contacto','fa-pencil-square-o','png','bus_massive_directorio.php',6,2,0),(115,'Editar contacto INVI','none','png','if_massive_directorio_a.php',6,2,0),(116,'PDF','fa-plus-square-o','png','pdf.php',6,2,0),(117,'Agrega contenido idioma','fa-plus-square-o','png','if_content.php',21,1,1),(118,'Editar contenido idioma','fa-pencil-square-o','png','bus_content.php',21,1,1),(119,'Editar idioma INVI','none','png','if_content_a.php',21,1,1),(120,'Agregar idioma','fa-plus-square-o','png','if_language.php',21,1,1),(121,'Editar idioma','fa-pencil-square-o','png','bus_language.php',21,1,1),(122,'Editar idioma INVI','none','png','if_language_a.php',21,1,1),(124,'Edita categoria','fa-pencil-square-o','png','bus_categoria.php',5,2,1),(125,'Edita catetgoria INVI','none','png','if_categoria_a.php',5,2,1),(126,'MÃ©dicos registrados','boton','png','bus_directorio.php',24,3,1),(129,'Edita FAQ INVI','none','png','if_faq_a.php',22,1,1),(130,'TEST','boton','png','ip_registro_a.php',19,1,1),(131,'Agrega categoria','fa-plus-square-o','png','if_categoria.php',22,1,1),(132,'Edita categoria','fa-pencil-square-o','png','bus_categoria.php',22,1,1),(133,'Edita categoria INVI','none','png','if_categoria_a.php',22,1,1),(134,'Medicos registrados INVO','none','png','if_directorio_a.php',24,1,1),(135,'Agrega temporada','fa-plus-square-o','png','if_temporadas.php',8,1,0),(136,'Edita temporadas','fa-pencil-square-o','png','bus_temporadas.php',8,1,0),(137,'Edita temproada INVI','none','png','if_temporadas_a.php',8,1,0),(138,'Agregar movimiento','fa-plus-square-o','png','if_registro.php',20,3,1),(139,'Edita registro INVI','none','png','if_registro_a.php',20,2,1),(140,'Agrega moneda','fa-plus-square-o','png','if_moneda.php',23,3,1),(141,'Edita moneda','fa-pencil-square-o','png','bus_moneda.php',23,3,1),(142,'Edita moneda','none','png','if_moneda_a.php',23,3,1),(143,'Agrega tarifa','fa-plus-square-o','png','if_tarifa.php',23,3,1),(144,'Edita tarifa','fa-pencil-square-o','png','bus_tarifa.php',23,3,1),(145,'Edita tarifa INVI','none','png','if_tarifa_a.php',23,3,1),(146,'Agrega habitación','fa-plus-square-o','png','if_habitacion.php',23,3,1),(147,'Edita habitación','fa-pencil-square-o','png','bus_habitacion.php',23,3,1),(148,'Edita habitación INVI','none','png','if_habitacion_a.php',23,3,1),(149,'Agrega medicamento','fa-plus-square-o','png','if_medicamento.php',24,3,1),(150,'Edita medicamento','fa-pencil-square-o','png','bus_medicamento.php',24,3,1),(151,'Edita medicamento INVI','none','png','if_medicamento_a.php',24,3,1),(152,'Agrega potencia','fa-plus-square-o','png','if_potencia.php',24,3,1),(153,'Edita potencia','fa-pencil-square-o','png','bus_potencia.php',24,3,1),(154,'Edita potencia INVi','none','png','if_potencia_a.php',24,3,1),(155,'Agrega registro','fa-plus-square-o','png','if_registro.php',25,1,1),(156,'Edita registro','fa-pencil-square-o','png','bus_registro.php',25,1,1),(157,'Edita registro INVI','none','png','if_registro_a.php',25,1,1),(158,'Busca padre INVI','none','png','bus_fili.php',25,1,1),(159,'Agrega cónyuge','none','png','bus_conyuge.php',25,1,1),(160,'Agrega hijos','none','png','bus_pater.php',25,1,1),(161,'Agrega perfil','fa-plus-square-o','png','if_perfil.php',26,2,0),(162,'Edita perfil','fa-user','png','bus_perfil.php',26,2,1),(163,'Edita perfil INVI','none','png','if_perfil_a.php',26,2,1),(164,'Agrega categoria','fa-plus-square-o','png','if_categoria.php',26,2,1),(165,'Edita categoria','fa-pencil-square-o','png','bus_categoria.php',26,2,1),(166,'Edita categoria INVI','none','png','if_categoria_a.php',26,2,1),(167,'Asigna comisión','fa-plus-square-o','png','if_asigna.php',26,2,0),(168,'Edita asigna comisión','fa-pencil-square-o','png','bus_asigna.php',26,2,0),(169,'Edita asigna comisión INVI','none','png','if_asigna_a.php',1,1,0),(170,'Agrega comisión','fa-plus-square-o','png','if_comisiones.php',26,2,0),(171,'Edita comisión','fa-pencil-square-o','png','bus_comisiones.php',26,2,0),(172,'Edita comisión INVI','none','png','if_comisiones_a.php',26,2,0),(173,'Agg BotÃ³n social','fa-plus-square-o','png','if_boton.php',26,2,0),(174,'Ed botÃ³n social','fa-pencil-square-o','png','bus_boton.php',26,2,0),(175,'Ed botÃ³n social INVI','none','png','if_boton_a.php',26,2,0),(176,'Asigna botÃ³n','fa-toggle-on','png','if_asigna_boton.php',26,2,1),(177,'Edita asigna botÃ³n','fa-pencil-square-o','png','bus_asigna_boton.php',26,2,1),(178,'Edita asigna botÃ³n INVI','none','png','if_asigna_boton_a.php',26,2,1),(179,'Ag propuesta','fa-plus-square-o','png','if_propuesta.php',35,2,1),(180,'Edita propuesta','fa-pencil-square-o','png','bus_propuesta.php',35,2,1),(181,'Edita propuesta INVI','none','png','if_propuesta_a.php',35,2,1),(185,'Agrega cita','fa-plus-square-o','png','if_citas.php',27,2,1),(186,'Edita cita','fa-pencil-square-o','png','bus_citas.php',27,2,1),(187,'Edita cita INVI','none','png','if_citas_a.php',27,2,1),(188,'Agrega evento','fa-plus-square-o','png','if_evento.php',28,2,1),(189,'Edita evento','fa-pencil-square-o','png','bus_evento.php',28,2,1),(190,'Edita evento INVI','none','png','if_evento_a.php',28,2,1),(191,'Agrega foto evento','fa-plus-square-o','png','if_evento_foto.php',28,2,0),(192,'Edita evento foto','fa-pencil-square-o','png','bus_evento_foto.php',28,2,0),(193,'Edita evento foto INVI','none','png','if_evento_foto_a.php',28,2,0),(194,'Agrega categoria','fa-plus-square-o','png','if_categoria.php',12,2,1),(195,'Edita categorÃ­a','fa-pencil-square-o','png','bus_categoria.php',12,2,1),(196,'Edita categorÃ­a INVI','none','png','if_categoria_a.php',12,2,1),(197,'Respaldos en sistema','fa-sort-amount-asc','png','bus_respaldo.php',31,2,1),(198,'Agrega cÃ³digo','fa-qrcode','png','if_qr.php',32,2,1),(199,'Edita cÃ³digo','fa-pencil-square-o','png','bus_qr.php',32,2,1),(200,'Edita cÃ³digo INVI','none','png','if_qr_a.php',32,2,1),(201,'Agrega quiz','fa-plus-square-o','png','if_quiz.php',33,1,1),(202,'Editar quiz','fa-pencil-square-o','png','bus_quiz.php',33,1,1),(203,'Editar quiz INVI','none','png','if_quiz_a.php',33,1,1),(204,'Agregar pregunta','fa-plus-square-o','png','if_ques.php',33,1,1),(205,'Editar pregunta','fa-pencil-square-o','png','bus_ques.php',33,1,1),(206,'Editar pregunta INVI','none','png','if_ques_a.php',33,1,1),(207,'Agregar respuesta','fa-plus-square-o','png','if_answ.php',33,1,1),(208,'Editar respuesta','fa-pencil-square-o','png','bus_answ.php',33,1,1),(209,'Editar respuesta INVI','none','png','if_answ_a.php',33,1,1),(210,'resultados INVI','none','png','resultados.php',33,2,1),(211,'resultados','resaque','png','pre_resultados.php',33,2,1),(212,'Agrega cÃ³digo','fa-plus-square-o','jpg','if_codigo.php',41,1,1),(213,'Edita cÃ³digo','fa-pencil-square-o','jpg','bus_codigo.php',41,1,1),(214,'Edita cÃ³digo INVI','none','jpg','if_codigo_a.php',41,1,1),(215,'Executa cÃ³digo','fa-bomb','jpg','exe_codigo.php',41,1,1),(216,'Agrega categoria','fa-plus-square-o','jpg','if_categoria.php',41,1,1),(217,'Edita categoria','fa-pencil-square-o','jpg','bus_categoria.php',41,1,1),(218,'Edita categoria INVI','none','jpg','if_categoria_a.php',41,1,1),(219,'Error 404','fa-bomb','jpg','index.php',42,1,1),(220,'Agrega privilegios','fa-plus-square-o','jpg','if_privilegios.php',3,2,1),(221,'Editar privilegios','fa-pencil-square-o','jpg','bus_privilegios.php',3,2,1),(222,'Editar privilegios INVI','none','jpg','if_privilegios_a.php',3,2,1),(223,'Agregar activista','fa-user','png','if_activista.php',36,2,1),(224,'Modificar activista','fa-pencil-square-o','png','bus_activista.php',36,5,1),(225,'Editar activista','none','png','if_activista_a.php',36,2,1),(226,'Agrega rango','fa-plus-square-o','jpg','if_rango.php',36,2,1),(227,'Editar rango','fa-pencil-square-o','jpg','bus_rango.php',36,2,1),(228,'Editar rango INVI','none','jpg','if_rango_a.php',36,2,1),(229,'Agregar red social','fa-plus-square-o','png','if_red.php',36,2,1),(230,'Modificar red social','fa-pencil-square-o','png','bus_red.php',36,5,1),(231,'Editar red social','none','png','if_red_a.php',36,2,1),(232,'Agrega complex template','fa-plus-square-o','png','if_complex.php',14,1,1),(233,'Edita complex template','fa-pencil-square-o','png','bus_complex.php',14,1,1),(234,'Edita complex template INVi','none','png','if_complex_a.php',14,1,1),(235,'Agrega ediciÃ³n','fa-plus-square-o','png','if_edicion.php',44,2,1),(236,'Modifica ediciÃ³n','fa-pencil-square-o','png','bus_edicion.php',44,2,1),(237,'Modifica ediciÃ³n INVI','none','png','if_edicion_a.php',44,2,1),(238,'Agrega temporada','fa-plus-square-o','png','if_temporadas.php',44,2,1),(239,'Edita temporada','fa-pencil-square-o','png','bus_temporadas.php',44,2,1),(240,'Edita temporada INVI','none','png','if_temporadas_a.php',44,2,1),(241,'Agrega cargo','fa-plus-square-o','png','if_cargo.php',44,2,1),(242,'Edita cargo','fa-pencil-square-o','png','bus_cargo.php',44,2,1),(243,'Edita cargo INVI','none','png','if_cargo_a.php',44,2,1),(244,'Agrega perspectiva','fa-plus-square-o','png','if_perspectiva.php',44,2,1),(245,'Edita perspectiva','fa-pencil-square-o','png','bus_perspectiva.php',44,2,1),(246,'Edita perspectiva INVI','none','png','if_perspectiva_a.php',44,2,1),(247,'Agrega anuncio','fa-plus-square-o','png','if_anuncio.php',44,2,1),(248,'Edita anuncio','fa-pencil-square-o','png','bus_anuncio.php',44,2,1),(249,'Edita anuncio INVI','none','png','if_anuncio_a.php',44,2,1);
/*!40000 ALTER TABLE `gadgets_botones_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gadgets_botones_posicion`
--

DROP TABLE IF EXISTS `gadgets_botones_posicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gadgets_botones_posicion` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gadgets_botones_posicion`
--

LOCK TABLES `gadgets_botones_posicion` WRITE;
/*!40000 ALTER TABLE `gadgets_botones_posicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gadgets_botones_posicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gadgets_index`
--

DROP TABLE IF EXISTS `gadgets_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gadgets_index` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `gadget` varchar(20) NOT NULL DEFAULT '',
  `ruta` varchar(50) NOT NULL DEFAULT '',
  `visible` smallint(1) NOT NULL DEFAULT '0',
  `privilegios` int(5) NOT NULL DEFAULT '1',
  `alias` varchar(50) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gadgets_index`
--

LOCK TABLES `gadgets_index` WRITE;
/*!40000 ALTER TABLE `gadgets_index` DISABLE KEYS */;
INSERT INTO `gadgets_index` VALUES (1,'gadgets','if_gadgets.php',1,1,'gadgets'),(2,'articulos','if_articulos.php',1,1,'blog'),(3,'usuario','if_autor.php',1,1,'usuario'),(4,'corporativa','if_corporativa.php',1,1,'corporativa'),(5,'fotos','if_fotos.php',1,1,'fotografia'),(6,'mensajes','bus_mensajes.php',1,1,'mensajes'),(7,'contador','contador.php',1,1,'contador'),(8,'catalogo','if_catalogo.php',1,1,'catalogo'),(9,'banners','if_banner.php',1,1,'banners'),(10,'proyectos','if_proyectos.php',0,1,'proyectos'),(11,'publicaciones','if_publicaciones.php',0,1,'publicaciones'),(12,'noticias','if_noticias.php',1,3,'noticias'),(13,'testimonios','if_testimonios.php',1,1,'testimonios'),(14,'configura','if_configura_a.php',1,1,'plantillas'),(15,'congreso','if_evento.php',0,1,'congreso'),(16,'descargar','if_descargar.php',1,1,'descargas'),(17,'video','if_video.php',1,1,'videos'),(18,'ligas','if_ligas.php',1,1,'ligas'),(19,'patrocinador','if_patrocinador.php',0,1,'patrocinadores'),(20,'comprar','registro.php',0,1,'comprar'),(21,'language','if_language.php',0,1,'idioma'),(22,'faq','if_faq.php',1,1,'faq'),(23,'hotel','if_habitacion.php',0,1,'hotel'),(24,'homeopop','if_medicamento.php',0,1,'homeopop'),(25,'genealogia','if_registro.php',0,1,'genealogia'),(26,'perfil','if_perfil.php',1,1,'perfil'),(27,'citas','if_citas.php',1,1,'citas'),(28,'consulta','if_consulta.php',0,1,'consulta'),(29,'menus','if_botones.php',1,1,'menus'),(30,'eventos','if_eventos.php',0,1,'eventos'),(31,'respaldo','bus_respaldo.php',1,1,'respaldar'),(32,'qr','if_qr.php',1,1,'qr'),(33,'quiz','if_quiz.php',1,1,'encuestas'),(34,'social','bus_contenidos.php',0,1,'social'),(35,'propuestas','if_propuesta.php',1,1,'propuestas'),(36,'activismo','if_activista.php',1,1,'activistas digitales'),(37,'escucho','if_escucho.php',1,1,'te escucho'),(38,'carga','if_carga.php',1,1,'carga de archivos'),(39,'agenda','if_evento.php',1,1,'agenda'),(40,'caja','if_caja.php',1,1,'caja'),(41,'codigo','if_codigo.php',1,1,'codigo'),(42,'error404','index.php',0,1,'error 404'),(43,'paralax','if_paraxila.php',0,3,'paraaax'),(44,'prospecta','if_edicion.php',1,1,'prospecta');
/*!40000 ALTER TABLE `gadgets_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genealogia_conyuge`
--

DROP TABLE IF EXISTS `genealogia_conyuge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genealogia_conyuge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(250) NOT NULL DEFAULT '',
  `conyuge` varchar(250) NOT NULL DEFAULT '',
  KEY `ide` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genealogia_conyuge`
--

LOCK TABLES `genealogia_conyuge` WRITE;
/*!40000 ALTER TABLE `genealogia_conyuge` DISABLE KEYS */;
INSERT INTO `genealogia_conyuge` VALUES (10,'2','1'),(2,'169','229'),(4,'76','54'),(5,'132','143'),(6,'366','333'),(7,'327','412'),(12,'11','8'),(13,'10','5'),(14,'35','13'),(15,'30','38'),(96,'63','68'),(17,'149','188'),(18,'149','177'),(19,'436','456'),(20,'176','198'),(21,'176','240'),(22,'72','41'),(23,'137','110'),(24,'288','296'),(25,'20','16'),(26,'49','73'),(27,'196','236'),(28,'117','148'),(29,'101','197'),(30,'155','195'),(31,'172','184'),(32,'160','225'),(33,'213','98'),(34,'127','210'),(35,'86','178'),(36,'59','79'),(37,'87','174'),(38,'162','228'),(39,'167','192'),(40,'219','150'),(41,'453','308'),(42,'309','418'),(43,'330','373'),(44,'405','323'),(45,'200','230'),(46,'9','7'),(47,'3','37'),(48,'36','19'),(49,'34','18'),(50,'22','40'),(51,'78','80'),(52,'70','46'),(54,'173','95'),(56,'203','222'),(57,'217','238'),(58,'506','145'),(59,'233','193'),(60,'233','215'),(62,'221','220'),(63,'129','211'),(64,'97','175'),(65,'216','153'),(66,'156','202'),(67,'208','146'),(68,'207','182'),(69,'136','226'),(70,'106','108'),(71,'100','115'),(72,'183','242'),(73,'77','69'),(74,'232','103'),(75,'112','89'),(76,'90','241'),(77,'234','194'),(78,'119','123'),(79,'107','189'),(80,'214','88'),(81,'51','42'),(82,'247','161'),(83,'212','105'),(84,'122','164'),(85,'190','157'),(86,'138','186'),(87,'185','126'),(88,'170','142'),(89,'133','144'),(90,'187','227'),(91,'60','56'),(92,'60','50'),(93,'159','205'),(95,'66','43'),(97,'168','141'),(98,'61','84'),(99,'204','116'),(100,'152','245'),(101,'224','124'),(102,'246','114'),(103,'102','508'),(104,'53','83'),(105,'163','99'),(106,'85','199'),(107,'125','135'),(108,'243','113'),(109,'237','94'),(110,'206','180'),(111,'209','235'),(112,'8','4'),(113,'55','48'),(114,'104','128'),(115,'131','248'),(116,'140','130'),(117,'121','181'),(118,'111','139'),(119,'109','154'),(120,'179','134'),(121,'171','239'),(122,'404','257'),(123,'279','306'),(124,'282','256'),(125,'310','345'),(126,'441','340'),(127,'425','283'),(128,'383','463'),(129,'399','266'),(130,'408','363'),(131,'272','281'),(132,'460','262');
/*!40000 ALTER TABLE `genealogia_conyuge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genealogia_fili`
--

DROP TABLE IF EXISTS `genealogia_fili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genealogia_fili` (
  `id` bigint(7) NOT NULL AUTO_INCREMENT,
  `fili` int(7) NOT NULL DEFAULT '0',
  `parent_f` int(2) NOT NULL DEFAULT '0',
  `parentesco` int(2) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=743 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genealogia_fili`
--

LOCK TABLES `genealogia_fili` WRITE;
/*!40000 ALTER TABLE `genealogia_fili` DISABLE KEYS */;
INSERT INTO `genealogia_fili` VALUES (1,309,169,1),(2,366,169,1),(4,453,169,1),(5,169,76,0),(6,169,54,1),(7,309,229,0),(8,366,229,0),(9,453,229,0),(10,132,76,0),(15,327,76,0),(12,132,54,1),(14,327,54,1),(16,330,132,1),(17,405,132,1),(18,408,132,1),(19,272,132,1),(20,272,143,0),(21,330,143,0),(22,405,143,0),(23,408,143,0),(24,484,327,1),(25,496,327,1),(26,478,327,1),(27,504,327,1),(28,484,412,0),(29,496,412,0),(30,478,412,0),(31,504,412,0),(32,476,366,1),(33,476,333,0),(34,503,366,1),(35,503,333,0),(40,6,1,1),(39,10,1,1),(41,8,1,1),(42,9,1,1),(43,3,1,1),(44,6,2,0),(45,10,2,0),(46,8,2,0),(47,9,2,0),(48,3,2,0),(49,21,8,1),(50,30,8,1),(51,20,8,1),(52,36,8,1),(53,21,11,0),(54,30,11,0),(55,20,11,0),(56,36,11,0),(272,39,10,1),(58,27,10,1),(59,26,10,1),(60,24,10,1),(61,33,10,1),(62,31,10,1),(63,35,10,1),(64,39,5,0),(65,27,5,0),(66,26,5,0),(67,24,5,0),(68,33,5,0),(69,31,5,0),(70,35,5,0),(71,66,30,1),(72,72,30,1),(73,66,38,0),(74,72,38,0),(75,93,66,1),(76,149,66,1),(77,191,66,1),(78,176,66,1),(79,93,43,0),(80,149,43,0),(81,191,43,0),(82,176,43,0),(83,436,149,1),(84,436,188,0),(85,339,149,1),(86,401,149,1),(87,500,436,0),(88,500,456,1),(89,339,177,0),(90,401,177,0),(91,382,176,1),(92,382,198,0),(93,390,176,1),(94,275,176,1),(95,390,240,0),(96,275,240,0),(97,137,72,0),(98,120,72,0),(99,137,41,1),(100,120,41,1),(101,288,137,1),(102,324,137,1),(103,324,110,0),(104,288,110,0),(105,49,20,1),(106,65,20,1),(107,45,20,1),(108,59,20,1),(109,78,20,1),(110,70,20,1),(111,69,20,1),(112,51,20,1),(113,49,16,0),(114,65,16,0),(115,45,16,0),(116,59,16,0),(117,78,16,0),(118,70,16,0),(119,69,16,0),(120,51,16,0),(121,196,49,1),(122,117,49,1),(123,101,49,1),(124,155,49,1),(125,172,49,1),(126,160,49,1),(127,213,49,1),(128,127,49,1),(129,86,49,1),(130,218,49,1),(131,196,73,0),(132,117,73,0),(133,101,73,0),(134,155,73,0),(135,172,73,0),(136,160,73,0),(137,213,73,0),(138,127,73,0),(139,86,73,0),(140,218,73,0),(141,395,196,0),(142,448,196,0),(143,253,196,0),(144,395,236,1),(145,448,236,1),(146,253,236,1),(147,336,148,1),(148,396,148,1),(149,336,117,0),(150,396,117,0),(151,291,101,1),(152,454,101,1),(153,449,101,1),(154,291,197,0),(155,454,197,0),(156,449,197,0),(157,347,155,1),(158,394,155,1),(159,302,155,1),(160,313,155,1),(161,347,195,0),(162,394,195,0),(163,302,195,0),(164,313,195,0),(165,376,172,1),(166,393,172,1),(167,362,172,1),(168,251,172,1),(169,376,184,0),(170,393,184,0),(171,362,184,0),(172,251,184,0),(173,352,160,1),(174,423,160,1),(175,435,160,1),(176,352,225,0),(177,423,225,0),(178,435,225,0),(179,284,213,0),(180,354,213,0),(181,263,213,0),(182,422,213,0),(183,284,98,1),(184,354,98,1),(185,263,98,1),(186,422,98,1),(187,411,127,1),(188,314,127,1),(189,307,127,1),(190,270,127,1),(191,411,210,0),(192,314,210,0),(193,307,210,0),(194,270,210,0),(195,254,86,1),(196,379,86,1),(197,254,178,0),(198,379,178,0),(199,87,59,1),(200,162,59,1),(202,167,59,1),(203,219,59,1),(204,200,59,1),(205,203,59,1),(206,217,59,1),(207,87,79,0),(208,162,79,0),(209,167,79,0),(210,219,79,0),(211,200,79,0),(212,203,79,0),(213,217,79,0),(214,377,87,1),(215,255,87,1),(216,299,87,1),(217,377,174,0),(218,255,174,0),(219,299,174,0),(220,361,162,1),(221,437,162,1),(222,361,228,0),(223,437,228,0),(224,357,167,1),(225,371,167,1),(226,357,192,0),(227,371,192,0),(228,440,219,0),(229,265,219,0),(230,440,150,1),(231,265,150,1),(232,481,453,0),(233,480,453,0),(234,493,453,0),(235,481,308,1),(236,480,308,1),(237,493,308,1),(238,488,309,1),(239,491,309,1),(240,488,418,0),(241,491,418,0),(242,492,330,0),(243,492,373,1),(244,483,405,0),(245,498,405,0),(246,489,405,0),(247,483,323,1),(248,498,323,1),(249,489,323,1),(250,385,200,1),(706,201,230,0),(705,385,230,0),(254,23,9,1),(255,34,9,1),(256,23,7,0),(257,34,7,0),(258,12,3,1),(259,15,3,1),(260,22,3,1),(261,32,3,1),(262,17,3,1),(263,29,3,1),(264,14,3,1),(265,12,37,0),(266,15,37,0),(267,22,37,0),(268,32,37,0),(269,17,37,0),(270,29,37,0),(271,14,37,0),(273,60,36,0),(274,43,36,0),(275,63,36,0),(276,76,36,0),(277,53,36,0),(278,60,19,1),(279,43,19,1),(280,63,19,1),(281,76,19,1),(282,53,19,1),(283,57,34,0),(284,62,34,0),(285,47,34,0),(286,57,18,1),(287,62,18,1),(288,47,18,1),(289,82,22,1),(290,54,22,1),(291,52,22,1),(292,75,22,1),(293,55,22,1),(294,82,40,0),(295,54,40,0),(296,52,40,0),(297,75,40,0),(298,55,40,0),(299,506,78,0),(300,233,78,0),(301,91,78,0),(302,221,78,0),(303,158,78,0),(304,506,80,1),(305,233,80,1),(306,91,80,1),(307,221,80,1),(308,158,80,1),(309,129,70,0),(310,129,46,1),(311,97,46,1),(312,216,46,1),(313,202,46,1),(314,166,46,1),(315,208,46,1),(316,207,46,1),(317,136,46,1),(318,106,46,1),(319,147,46,1),(320,100,46,1),(321,151,46,1),(322,173,46,1),(323,223,46,1),(324,96,46,1),(325,97,70,0),(326,216,70,0),(327,202,70,0),(328,208,70,0),(329,207,70,0),(330,136,70,0),(331,106,70,0),(332,166,70,0),(333,147,70,0),(334,100,70,0),(335,151,70,0),(336,173,70,0),(337,223,70,0),(338,96,70,0),(339,274,223,0),(340,276,173,1),(341,329,173,1),(342,367,203,0),(343,350,203,0),(344,367,222,1),(345,350,222,1),(346,421,217,0),(347,431,217,0),(348,421,238,1),(349,431,238,1),(350,335,506,0),(351,295,506,0),(352,458,506,0),(353,338,506,0),(354,341,506,0),(355,335,145,1),(356,295,145,1),(357,458,145,1),(358,338,145,1),(359,341,145,1),(360,397,233,1),(361,443,233,1),(362,397,193,0),(363,462,233,1),(364,443,215,0),(365,462,215,0),(366,426,221,1),(367,430,221,1),(368,269,221,1),(369,426,220,0),(370,430,220,0),(371,269,220,0),(372,372,129,1),(373,417,129,1),(374,372,211,0),(375,417,211,0),(376,413,97,1),(377,280,97,1),(378,259,97,1),(379,413,175,0),(380,280,175,0),(381,259,175,0),(382,346,216,0),(383,420,216,0),(384,386,216,0),(385,424,216,0),(386,346,153,1),(387,420,153,1),(388,386,153,1),(389,424,153,1),(390,402,156,1),(391,348,156,1),(392,402,202,0),(393,348,202,0),(394,337,208,0),(395,271,208,0),(396,466,208,0),(397,311,208,0),(398,337,146,1),(399,271,146,1),(400,466,146,1),(401,311,146,1),(402,438,207,0),(403,387,207,0),(404,428,207,0),(405,303,207,0),(406,438,182,1),(407,387,182,1),(408,428,182,1),(409,303,182,1),(410,319,136,1),(411,319,226,0),(412,289,106,1),(413,353,106,1),(414,289,108,0),(415,353,108,0),(416,286,100,1),(417,286,115,0),(418,375,115,0),(419,375,100,1),(420,392,183,1),(421,455,183,1),(422,392,242,0),(423,455,242,0),(424,183,77,0),(425,232,77,0),(426,112,77,0),(427,90,77,0),(428,234,77,0),(429,119,77,0),(430,107,77,0),(431,183,69,1),(432,232,69,1),(433,112,69,1),(434,90,69,1),(435,234,69,1),(436,119,69,1),(437,107,69,1),(438,416,232,0),(439,400,232,0),(440,301,232,0),(441,290,232,0),(442,416,103,1),(443,400,103,1),(444,301,103,1),(445,290,103,1),(446,257,112,0),(447,306,112,0),(448,256,112,0),(449,257,89,1),(450,306,89,1),(451,256,89,1),(452,445,90,1),(453,459,90,1),(454,445,241,0),(455,459,241,0),(456,444,234,1),(457,461,234,1),(458,278,234,1),(459,298,234,1),(460,457,234,1),(461,444,194,0),(462,461,194,0),(463,278,194,0),(464,298,194,0),(465,457,194,0),(466,389,119,1),(467,380,119,1),(468,370,119,1),(469,389,123,0),(470,380,123,0),(471,285,123,0),(472,370,123,0),(473,342,107,1),(474,294,107,1),(475,342,189,0),(476,294,189,0),(477,214,51,0),(478,247,51,0),(479,212,51,0),(480,122,51,0),(481,190,51,0),(482,138,51,0),(483,185,51,0),(484,170,51,0),(485,133,51,0),(486,214,42,1),(487,247,42,1),(488,212,42,1),(490,122,42,1),(491,190,42,1),(492,138,42,1),(493,185,42,1),(494,170,42,1),(495,133,42,1),(496,252,214,0),(497,264,214,0),(498,409,214,0),(499,359,214,0),(500,252,88,1),(501,264,88,1),(502,409,88,1),(503,359,88,1),(504,468,247,0),(505,378,247,0),(506,374,247,0),(507,464,247,0),(508,468,161,1),(509,378,161,1),(510,374,161,1),(511,464,161,1),(512,293,212,0),(513,260,212,0),(514,368,212,0),(515,250,212,0),(516,310,122,0),(517,441,122,0),(518,364,122,0),(519,425,190,0),(520,349,190,0),(521,344,190,0),(522,425,157,1),(523,349,157,1),(524,344,157,1),(525,419,138,1),(526,273,138,1),(527,419,186,0),(528,273,186,0),(529,384,185,0),(530,434,185,0),(531,384,126,1),(532,434,126,1),(533,415,170,1),(534,369,170,1),(535,450,170,1),(536,415,142,0),(537,369,142,0),(538,450,142,0),(539,325,133,1),(540,427,133,1),(541,325,144,0),(542,427,144,0),(543,365,187,0),(544,351,187,0),(545,321,187,0),(546,187,60,1),(547,187,50,0),(548,118,60,1),(549,159,60,1),(550,365,227,1),(551,351,227,1),(552,321,227,1),(553,356,159,1),(554,356,205,0),(555,168,63,1),(556,168,68,0),(557,383,168,1),(558,399,168,1),(559,383,141,0),(560,399,141,0),(561,204,61,1),(563,61,19,1),(564,61,36,0),(565,152,61,1),(566,224,61,1),(567,246,61,1),(568,102,61,1),(569,204,84,0),(570,152,84,0),(571,224,84,0),(572,246,84,0),(573,102,84,0),(574,507,204,0),(575,305,204,0),(576,469,204,0),(577,507,116,1),(578,305,116,1),(579,469,116,1),(580,403,152,1),(581,471,152,1),(582,403,245,0),(583,471,245,0),(584,433,224,0),(585,381,224,0),(586,332,224,0),(587,433,124,1),(588,381,124,1),(589,332,124,1),(590,304,246,0),(591,467,246,0),(592,163,53,0),(593,85,53,0),(594,125,53,0),(595,243,53,0),(596,237,53,0),(597,206,53,0),(598,209,53,0),(599,165,53,0),(600,163,83,1),(601,85,83,1),(602,125,83,1),(603,243,83,1),(604,237,83,1),(605,206,83,1),(606,209,83,1),(607,165,83,1),(608,360,163,1),(609,355,163,1),(610,447,163,1),(611,360,99,0),(612,355,99,0),(613,447,99,0),(614,312,85,0),(615,312,199,1),(616,320,125,0),(617,442,125,0),(618,261,125,0),(619,358,125,0),(620,320,135,1),(621,442,135,1),(622,261,135,1),(623,358,135,1),(624,297,243,0),(625,452,243,0),(626,297,113,1),(627,452,113,1),(628,300,206,0),(629,407,206,0),(630,388,206,0),(631,300,180,1),(632,407,180,1),(633,388,180,1),(634,446,209,0),(635,267,209,0),(636,331,209,0),(637,446,235,1),(638,267,235,1),(639,331,235,1),(640,28,8,1),(641,28,4,0),(642,104,55,0),(643,131,55,0),(644,140,55,0),(645,121,55,0),(646,111,55,0),(647,109,55,0),(651,179,55,0),(650,244,55,0),(659,104,48,1),(653,171,55,0),(654,316,104,1),(655,432,104,1),(656,334,104,1),(657,292,104,1),(658,410,104,1),(660,131,48,1),(661,140,48,1),(662,121,48,1),(663,111,48,1),(664,244,48,1),(665,179,48,1),(666,171,48,1),(667,316,128,0),(668,432,128,0),(669,334,128,0),(670,292,128,0),(671,410,128,0),(672,470,131,1),(673,470,248,0),(674,317,140,0),(675,328,140,0),(676,315,140,0),(677,391,121,0),(678,460,121,0),(679,258,121,0),(680,465,121,0),(681,391,181,1),(682,460,181,1),(683,258,181,1),(684,465,181,1),(685,326,111,0),(686,429,111,0),(687,277,111,0),(688,326,139,1),(689,429,139,1),(690,277,139,1),(691,398,109,0),(692,268,109,0),(693,451,109,0),(694,398,154,1),(695,268,154,1),(696,451,154,1),(697,322,179,0),(698,322,134,1),(699,439,171,1),(700,343,171,1),(701,414,171,1),(702,439,239,0),(703,343,239,0),(704,414,239,0),(707,201,200,1),(708,477,425,0),(709,479,425,0),(710,477,283,1),(711,479,283,1),(712,505,383,0),(713,502,383,0),(714,475,383,0),(715,505,463,1),(716,502,463,1),(717,475,463,1),(718,499,399,0),(719,473,399,0),(720,486,399,0),(721,494,399,0),(722,485,399,0),(723,499,266,1),(724,473,266,1),(725,486,266,1),(726,494,266,1),(727,485,266,1),(728,490,408,0),(729,474,408,0),(730,495,408,0),(731,501,408,0),(732,490,363,1),(733,474,363,1),(734,495,363,1),(735,501,363,1),(736,497,272,0),(737,487,272,0),(738,482,272,0),(739,497,281,1),(740,487,281,1),(741,482,281,1);
/*!40000 ALTER TABLE `genealogia_fili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genealogia_generacion`
--

DROP TABLE IF EXISTS `genealogia_generacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genealogia_generacion` (
  `id` smallint(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genealogia_generacion`
--

LOCK TABLES `genealogia_generacion` WRITE;
/*!40000 ALTER TABLE `genealogia_generacion` DISABLE KEYS */;
INSERT INTO `genealogia_generacion` VALUES (0,'Ninguna'),(1,'Primera'),(2,'Segunda'),(3,'Tercera'),(4,'Cuarta'),(5,'Quinta'),(6,'Sexta'),(7,'Septima');
/*!40000 ALTER TABLE `genealogia_generacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genealogia_index`
--

DROP TABLE IF EXISTS `genealogia_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genealogia_index` (
  `id` bigint(7) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `genero` int(1) NOT NULL DEFAULT '0',
  `fecha_nac` date NOT NULL DEFAULT '0000-00-00',
  `ocupacion` varchar(100) NOT NULL DEFAULT '',
  `casose` int(2) NOT NULL DEFAULT '0',
  `fecha_mat` date NOT NULL DEFAULT '0000-00-00',
  `fecha_fal` date NOT NULL DEFAULT '0000-00-00',
  `generacion` int(11) NOT NULL DEFAULT '0',
  `foto` varchar(11) NOT NULL DEFAULT '',
  `done` int(2) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=509 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genealogia_index`
--

LOCK TABLES `genealogia_index` WRITE;
/*!40000 ALTER TABLE `genealogia_index` DISABLE KEYS */;
INSERT INTO `genealogia_index` VALUES (1,'Juan Nepomuceno Zuloaga',1,'1823-05-16','',1,'1846-03-25','1895-06-06',1,'1',0),(2,'Dolores Méndez y Verduzco',0,'1814-09-19','',1,'1846-03-25','1894-02-20',1,'2',0),(3,'Carlos José Zuloaga y Méndez',1,'1857-05-28','',1,'0000-00-00','1898-06-26',2,'3',0),(4,'Carlota Higuera',0,'0000-00-00','',1,'0000-00-00','0000-00-00',2,'',1),(5,'Ignacia González',0,'1848-10-04','',1,'0000-00-00','1925-07-15',2,'',0),(6,'Ignacio Zuloaga y Méndez',1,'0000-00-00','',0,'0000-00-00','0001-00-00',2,'',0),(7,'Ines Semaría',0,'0000-00-00','',1,'0000-00-00','0000-00-00',2,'',0),(8,'Jesús Alejo Zuloaga y Méndez',1,'1852-07-17','',1,'0000-00-00','1921-08-18',2,'8',1),(9,'José María Anselmo Zuloaga y Méndez',1,'0000-00-00','',1,'0000-00-00','0000-00-00',2,'9',0),(10,'Juan M. Zuloaga y Mendez',1,'1847-07-21','',1,'0000-00-00','1925-05-02',2,'',0),(11,'Mariana González y González',0,'1849-07-25','',1,'0000-00-00','1906-09-01',2,'',0),(12,'Ana Maria Manuela Zuloaga y Vizcaino',0,'1883-06-17','',0,'0000-00-00','1883-12-30',3,'',0),(13,'Armando Mejia',1,'0000-00-00','',1,'0000-00-00','1943-09-15',3,'',0),(14,'Carlos Octavio Zuloaga y Vizcaino',1,'0000-00-00','',0,'0000-00-00','0000-00-00',3,'',0),(15,'Carlos Zuloaga y Vizcaino',1,'1884-06-27','',0,'0000-00-00','1884-06-29',3,'',0),(16,'Dolores Zuloaga y Vizcaino',0,'1867-06-08','',1,'0000-00-00','1983-05-18',3,'',0),(17,'Francisco Jose Zuloaga y Vizcaino',1,'0000-00-00','',0,'0000-00-00','0000-00-00',3,'',0),(18,'Guillermo Aguirre y Fierro',1,'0000-00-00','',1,'0000-00-00','0000-00-00',3,'',0),(19,'Jesús Álvarez del Castillo y Velazco',1,'1881-08-15','',1,'0000-00-00','1966-05-25',3,'',0),(20,'Jesús Mariano Zuloaga y González',1,'1878-10-07','',1,'0000-00-00','1947-05-17',3,'',0),(21,'José Alberto Zuloaga y González',1,'1876-08-06','',2,'0000-00-00','1915-04-01',3,'',0),(22,'José Alejo Zuloaga y Vizcaíno',1,'1885-07-17','',1,'0000-00-00','1983-01-10',3,'',0),(23,'Jose Lucio Zuloaga y Semaria',1,'0000-00-00','',0,'0000-00-00','0000-00-00',3,'',0),(24,'Jose Macario Zuloaga y Gonzalez',1,'1877-03-10','',0,'0000-00-00','1941-08-19',3,'',0),(25,'Josefina Peña',0,'0000-00-00','',0,'0000-00-00','0000-00-00',3,'',0),(26,'Juan Ignacio Zuloaga y Gonzalez',1,'1875-06-21','',2,'0000-00-00','1876-09-28',3,'',0),(27,'Juan Ma. De San Ignacio Zuloaga y Gonzalez',1,'1875-08-13','',2,'0000-00-00','1875-09-01',3,'',0),(28,'Juan Nepomuceno Fernando Zuloaga y Higuera',1,'1811-06-09','',0,'0000-00-00','0000-00-00',3,'',0),(29,'Juan Nepomuceno Zuloaga y Vizcaino',1,'0000-00-00','',0,'0000-00-00','0000-00-00',3,'',0),(30,'Leopoldo Eugenio Zuloaga y González',1,'1877-11-15','',1,'0000-00-00','1956-12-17',3,'',0),(31,'Maria De Los Dolores Zuloaga y Gonzalez',0,'1882-11-21','',0,'0000-00-00','1930-09-24',3,'',0),(32,'Maria De Los Dolores Zuloaga y Vizcaino',0,'0000-00-00','',0,'0000-00-00','0000-00-00',3,'',0),(33,'Maria Del Carmen Zuloaga y Gonzalez',0,'1882-11-07','',0,'0000-00-00','0001-00-00',3,'33',0),(34,'María Guadalupe Zuloaga y Semaría',0,'0000-00-00','',1,'0000-00-00','0000-00-00',3,'',0),(35,'Maria Josefina Zuloaga y Gonzalez',0,'1886-03-19','',1,'0000-00-00','1953-09-23',3,'35',0),(36,'María Manuela de los Dolores Zuloaga y González',0,'1882-06-08','',1,'0000-00-00','1972-11-01',3,'',0),(37,'Mariana Vizcaíno y Vizcaíno',0,'1860-04-19','',1,'0000-00-00','1953-01-26',2,'',0),(38,'Mercedes Remus y Gomez',0,'1879-01-18','',1,'0000-00-00','1963-12-08',3,'',0),(39,'Othon Zuloaga y Gonzalez',1,'1873-07-07','',2,'0000-00-00','1873-07-07',3,'',0),(40,'Paz De la Torre',0,'1892-03-18','',1,'0000-00-00','1971-08-30',3,'',0),(41,'Abelardo Hijar y Cañedo',1,'1906-05-19','',1,'0000-00-00','1980-05-08',4,'',0),(42,'Alfonso Iturbide y Rojas',1,'0000-00-00','',1,'0000-00-00','0000-00-00',4,'',0),(43,'Ana María Guadalupe Álvarez del Castillo y Zuloaga',0,'1911-03-24','',1,'0000-00-00','0000-00-00',4,'',1),(44,'Ana Maria Guadalupe Alvarez Del Castillo y Remus',0,'0000-00-00','',0,'0000-00-00','0000-00-00',4,'',0),(45,'Ana Maria Zuloaga y Zuloaga',0,'1914-07-23','',2,'0000-00-00','1916-05-08',4,'',1),(46,'Antonio Martin Del Campo y Enriquez',1,'1921-07-07','',1,'0000-00-00','1997-10-28',4,'',1),(47,'Armando Aguirre y Zuloaga',1,'0000-00-00','',0,'0000-00-00','0000-00-00',4,'',0),(48,'Carlos Enrigue y Villaseñor',1,'1911-11-29','',1,'0000-00-00','1983-05-13',4,'',1),(49,'Carlos José Senen Zuloaga y Zuloaga',1,'1911-10-30','',1,'0000-00-00','1914-12-31',4,'',0),(50,'Catalina Romandia y Herreros',0,'1925-11-29','',0,'0000-00-00','0000-00-00',4,'',0),(51,'Dolores Leticia Zuloaga y Zuloaga',0,'1925-08-20','',1,'0000-00-00','0000-00-00',4,'',1),(52,'Elena Zuloaga y De La Torre',0,'0000-00-00','',0,'0000-00-00','0000-00-00',4,'',0),(53,'Emma Alicia Margarita Alvarez Del Castillo y Zuloaga',0,'1920-05-13','',1,'0000-00-00','0000-00-00',4,'',1),(54,'Francisco José Zuloaga y de la Torre',1,'1914-10-22','Ing. civil y comerciante',1,'1941-11-26','1999-03-21',4,'',0),(55,'Gabriela Zuloaga y De La Torre',0,'1919-10-01','',1,'0000-00-00','0000-00-00',4,'',1),(56,'Guillermina Davila y Valdez',0,'0000-00-00','',0,'0000-00-00','0000-00-00',4,'',0),(57,'Guillermo Antonio Aguirre y Zuloaga',1,'1917-05-22','',0,'0000-00-00','0000-00-00',4,'',0),(58,'Ignacio Juan Francisco Zuloaga y Zuloaga',1,'1919-08-21','',2,'0000-00-00','1921-06-04',4,'',1),(59,'Jesús Alberto Zuloaga y Zuloaga',1,'1916-01-19','',1,'0000-00-00','1983-01-13',4,'',1),(60,'Jesús Mariano Raymundo Álvarez del Castillo y Zuloaga',1,'1910-02-19','',1,'0000-00-00','1973-07-04',4,'',1),(61,'Jorge Alvarez Del Castillo y Zuloaga',1,'1917-01-22','',1,'0000-00-00','0000-00-00',4,'',0),(62,'Jose Luis Antonio Aguirre y Zuloaga',1,'1919-01-06','',0,'0000-00-00','0000-00-00',4,'',0),(63,'Jose Othón Álvarez del Castillo y Zuloaga',1,'1912-07-02','',1,'0000-00-00','1982-10-25',4,'',1),(64,'Jose Zuloaga y Peña',1,'0000-00-00','',0,'0000-00-00','0000-00-00',4,'',0),(65,'José Zuloaga y Zuloaga',1,'1913-03-14','',2,'0000-00-00','1913-03-14',4,'',0),(66,'Leopoldo Antonio Lorenzo Zuloaga y Remus',1,'1908-07-07','',1,'0000-00-00','0000-00-00',4,'',1),(68,'Lillian Dieguez y Rodriguez',0,'1920-12-16','',1,'0000-00-00','2000-10-15',4,'',1),(69,'Luis Florencio Zuloaga y Zuloaga',1,'1923-10-27','',1,'0000-00-00','0000-00-00',4,'',1),(70,'Ma. Concepcion Zuloaga y Zuloaga',0,'1922-02-05','',1,'0000-00-00','1991-09-18',4,'',1),(71,'Ma. Del Carmen Zuloaga y Zuloaga',0,'1928-10-08','',0,'0000-00-00','0000-00-00',4,'',0),(72,'Ma. Elena Guillermina Zuloaga y Remus',0,'1911-06-25','',1,'0000-00-00','0000-00-00',4,'',0),(73,'Ma. Elena Santos y Hermosillo',0,'1928-11-22','',1,'0000-00-00','0000-00-00',4,'',0),(74,'Ma. Guadalupe Zuloaga y Zuloaga',0,'1933-05-02','',0,'0000-00-00','1933-05-02',4,'',0),(75,'Margarita Zuloaga y De La Torre',0,'0000-00-00','',0,'0000-00-00','0000-00-00',4,'',0),(76,'Maria del Carmen Álvarez del Castillo y Zuloaga',0,'1913-10-02','',1,'1941-11-26','1991-05-01',4,'',0),(77,'Maria Luisa Santoscoy',0,'1924-06-29','',1,'0000-00-00','1968-03-25',4,'',1),(78,'Mariana Zuloaga y Zuloaga',0,'1917-07-26','',1,'0000-00-00','0000-00-00',4,'',0),(79,'Marina Chavez y Huacuja',0,'1918-02-10','',1,'0000-00-00','1977-06-23',4,'',1),(80,'Mauro Alatorre y Salcido',1,'1912-09-02','',0,'0000-00-00','1962-06-13',4,'',1),(81,'Mayra Ontiveros',0,'0000-00-00','',0,'0000-00-00','0000-00-00',4,'',0),(82,'Paz Zuloaga y De La Torre',0,'0000-00-00','',0,'0000-00-00','0000-00-00',4,'',0),(83,'Roberto Izquierdo e Hijar',1,'1918-02-26','',1,'0000-00-00','0000-00-00',4,'',1),(84,'Stella Gregory y Remus',0,'1924-07-03','',1,'0000-00-00','0000-00-00',4,'',1),(85,'Adriana María Eugenia Izquierdo y Álvarez del Castillo',0,'1949-04-01','',1,'0000-00-00','0000-00-00',5,'',1),(86,'Alberto Clemente Zuloaga y Santos',1,'1964-11-12','',0,'0000-00-00','0000-00-00',5,'',0),(87,'Alberto Rafael Zuloaga y Chavez',1,'1947-01-01','',1,'0000-00-00','0000-00-00',5,'',0),(88,'Alejandro Covarrubias y Jimenez',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(89,'Alejandro Fernandez y Paniagua',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(90,'Alejandro Zuloaga y Santoscoy',1,'1954-07-21','',1,'0000-00-00','0000-00-00',5,'',1),(91,'Alfonso Alatorre y Zuloaga',1,'1953-07-18','',0,'0000-00-00','0000-00-00',5,'',1),(93,'Ana Rosa Margarita Zuloaga y Alvarez Del Castillo',0,'1937-05-18','',2,'0000-00-00','1937-08-30',5,'',0),(94,'Ana Rosa Marquez y Velazco',0,'1954-04-25','',1,'0000-00-00','0000-00-00',5,'',1),(95,'Andrea Thort',0,'0000-00-00','',0,'0000-00-00','0000-00-00',5,'',0),(96,'Andrés Martín del Campo y Zuloaga',1,'1966-04-16','',2,'0000-00-00','0000-00-00',5,'',1),(97,'Antonio Martín del Campo y Zuloaga',1,'1948-03-25','',1,'0000-00-00','0000-00-00',5,'',1),(98,'Arturo Gomez y Palomera',1,'1980-05-15','',1,'0000-00-00','0000-00-00',5,'',0),(99,'Begonia Fisure y Gomez',0,'1949-01-04','',1,'0000-00-00','0000-00-00',5,'',1),(100,'Benjamín Martín del Campo y Zuloaga',1,'1952-12-11','',1,'0000-00-00','0000-00-00',5,'',1),(101,'Carlos Alberto Zuloaga y Santos',1,'1949-08-16','',0,'0000-00-00','0000-00-00',5,'',0),(102,'Carlos Álvarez del Castillo y Gregory',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(103,'Carlos Díaz de León',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(104,'Carlos Enrigue y Zuloaga',1,'1947-12-31','',1,'0000-00-00','0000-00-00',5,'',1),(105,'Carlos Marquez',1,'0000-00-00','',0,'0000-00-00','0000-00-00',5,'',0),(106,'Carlos Martín del Campo y Zuloaga',1,'1956-03-18','',1,'0000-00-00','1986-09-03',5,'',1),(107,'Carlos Zuloaga y Santoscoy',1,'1961-11-04','',1,'0000-00-00','0000-00-00',5,'',1),(108,'Carmen Beatriz Eng',0,'1957-07-30','',1,'0000-00-00','0000-00-00',5,'',1),(109,'Carmen Enrigue y Zuloaga',0,'1956-07-13','',1,'0000-00-00','0000-00-00',5,'',1),(110,'Carmen Fernandez y Araico',0,'1947-06-07','',1,'0000-00-00','0000-00-00',5,'',0),(111,'Cristina Enrigue y Zuloaga',0,'1953-12-21','',1,'0000-00-00','0000-00-00',5,'',1),(112,'Cristina Zuloaga y Santoscoy',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(113,'Daniel Paredes y Rea',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(114,'David Solorzano y Jauregui',1,'0000-00-00','',0,'0000-00-00','0000-00-00',5,'',0),(115,'Diana Ceballos y Monraz',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(116,'Diego Delfin y Farias',1,'1936-11-05','',1,'0000-00-00','0000-00-00',5,'',1),(117,'Dolores Guadalupe Zuloaga y Santos',0,'1948-02-28','',1,'0000-00-00','0000-00-00',5,'',0),(118,'Eduardo Raymundo Alvarez del Castillo y Dávila',1,'1938-04-12','',0,'0000-00-00','1962-04-16',5,'',0),(119,'Eduardo Zuloaga y Santoscoy',1,'1958-07-28','',1,'0000-00-00','0000-00-00',5,'',1),(120,'Elena Cristina Mercedes Hijar y Zuloaga',0,'1936-02-14','',0,'0000-00-00','0000-00-00',5,'',0),(121,'Elena Enrigue y Zuloaga',0,'1951-06-22','',1,'0000-00-00','0000-00-00',5,'',1),(122,'Elena Ma. del Rayo Iturbide y Zuloaga',0,'1951-07-09','',1,'0000-00-00','0000-00-00',5,'',0),(123,'Elena Maytorena y Martinez Negrete',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(124,'Emigdio Gonzalez Guerra y Munguia',1,'1948-09-11','',0,'0000-00-00','0000-00-00',5,'',0),(125,'Emma Margarita Izquierdo y Álvarez del Castillo',0,'1950-10-19','',1,'0000-00-00','0000-00-00',5,'',1),(126,'Enrique Guizar y Leal',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(127,'Enrique Xavier Zuloaga y Santos',1,'1961-05-19','',1,'0000-00-00','0000-00-00',5,'',0),(128,'Fanny Lancaster Jones y Woogh',0,'1950-07-14','',1,'0000-00-00','0000-00-00',5,'',1),(129,'Felipe de Jesús Martin del Campo y Zuloaga',1,'1947-03-28','',1,'0000-00-00','0000-00-00',5,'',1),(130,'Felipe de Anda',1,'1945-06-28','',0,'0000-00-00','0000-00-00',5,'',0),(131,'Francisco Enrigue y Zuloaga',1,'1949-02-28','',1,'0000-00-00','2009-06-19',5,'',1),(132,'Francisco Guillermo Zuloaga y Alvarez del Castillo',1,'1942-08-22','Ingeniero químico',1,'1967-01-07','0000-00-00',5,'',0),(133,'Francisco Iturbide y Zuloaga',1,'1966-01-15','',1,'0000-00-00','0000-00-00',5,'',1),(134,'Francisco Javier Ruiz y Gonzalez',1,'1956-08-10','',1,'0000-00-00','0000-00-00',5,'',1),(135,'Francisco Lugo y Serrano',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(136,'Francisco Martin del Campo y Zuloaga',1,'1955-03-10','',1,'0000-00-00','0000-00-00',5,'',1),(137,'Gabriel Abelardo Hijar y Zuloaga',1,'1935-01-21','',1,'0000-00-00','0000-00-00',5,'',0),(138,'Gabriel Iturbide y Zuloaga',1,'1954-09-09','',1,'0000-00-00','0000-00-00',5,'',0),(139,'Gabriel Nieto y Luna',1,'1953-08-20','',1,'0000-00-00','0000-00-00',5,'',1),(140,'Gabriela Enrigue y Zuloaga',0,'1950-06-06','',1,'0000-00-00','0000-00-00',5,'',0),(141,'Gabriela Ontiveros y Ochoa',0,'1945-02-16','',1,'0000-00-00','0000-00-00',5,'',1),(142,'Gabriela Rugeiro y Luckas',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(143,'Gabriela Villaseñor y Urrea',0,'1945-01-08','',1,'1967-01-07','0000-00-00',5,'',0),(144,'Guadalupe Torrez y Lopez',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(145,'Guillermo Alatorre y Carrillo',1,'1975-03-15','',1,'0000-00-00','0000-00-00',5,'',1),(146,'Guillermo Loya y Hernandez',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(147,'Guillermo Martín del Campo y Zuloaga',1,'1957-05-31','',0,'0000-00-00','0000-00-00',5,'',0),(148,'Guillermo Nieto Martinez',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(149,'Hugo Antonio Zuloaga y Alvarez del Castillo',1,'1938-05-13','',1,'0000-00-00','0000-00-00',5,'',0),(150,'Humberto Cortez y Buenrostro',1,'1976-01-10','',1,'0000-00-00','0000-00-00',5,'',0),(151,'Ignacio Martín del Campo y Zuloaga',1,'1960-09-21','',0,'0000-00-00','0000-00-00',5,'',1),(152,'Jaime Alvarez del Castillo y Gregory',1,'1949-07-30','',1,'0000-00-00','0000-00-00',5,'',1),(153,'Jaime Lubín Zermeño y Acosta',1,'1945-06-11','',1,'0000-00-00','0000-00-00',5,'',1),(154,'Jaime Manuel Valdez y Simancas',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(155,'Jaime Martin Zuloaga y Santos',1,'1951-11-12','',1,'0000-00-00','0000-00-00',5,'',0),(156,'Javier Romo y Zúñiga',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(157,'Javier Santacruz',1,'0000-00-00','',0,'0000-00-00','0000-00-00',5,'',0),(158,'Jesús Carlos Alatorre y Zuloaga',1,'1957-06-01','',0,'0000-00-00','2004-12-28',5,'',1),(159,'Jesús Manuel Álvarez del Castillo y Romandia',1,'1957-07-01','',1,'0000-00-00','0000-00-00',5,'',1),(160,'Jesus Mario Zuloaga y Santos',1,'1955-02-02','',1,'0000-00-00','0000-00-00',5,'',0),(161,'Jorge Casillas',1,'1947-05-12','',1,'0000-00-00','0000-00-00',5,'',0),(162,'Jorge Guillermo Zuloaga y Chavez',1,'1948-03-20','',1,'0000-00-00','0000-00-00',5,'',0),(163,'Jorge José Rafael Izquierdo y Alvarez del Castillo',1,'1948-03-19','',1,'0000-00-00','0000-00-00',5,'',1),(164,'Jose Antonio Isaac',1,'1982-11-29','',0,'0000-00-00','0000-00-00',5,'',0),(165,'José de Jesús Izquierdo y Alvarez del Castillo',1,'1959-05-23','',0,'0000-00-00','0000-00-00',5,'',0),(166,'Jose Eduardo Martín del Campo y Zuloaga',1,'1951-03-18','',2,'0000-00-00','1974-10-05',5,'',1),(167,'Ignacio Zuloaga y Chávez',1,'1950-09-20','',1,'0000-00-00','0000-00-00',5,'',1),(168,'Jose Luis Alvarez Del Castillo y Dieguez',1,'1942-09-24','',1,'0000-00-00','0000-00-00',5,'',1),(169,'José Manuel Zuloaga y Álvarez del Castillo',1,'1944-03-19','Licenciado en administración de empresas y comerciante',1,'1968-06-08','0000-00-00',5,'169',0),(170,'Juan Bosco Iturbide y Zuloaga',1,'1960-01-11','',1,'0000-00-00','0000-00-00',5,'',0),(171,'Juan Enrigue y Zuloaga',1,'1959-01-22','',1,'0000-00-00','0000-00-00',5,'',1),(172,'Juan Jose Zuloaga y Santos',1,'1953-05-16','',1,'0000-00-00','0000-00-00',5,'',0),(173,'Juan Martín del Campo y Zuloaga',1,'1962-04-21','',1,'0000-00-00','0000-00-00',5,'',1),(174,'Judith Guadalupe Fernandez',0,'1950-08-14','',1,'0000-00-00','0000-00-00',5,'',0),(175,'Julieta Sáenz y Vichis',0,'1948-02-16','',1,'0000-00-00','0000-00-00',5,'',1),(176,'Leopoldo Juan Manuel Zuloaga y Alvarez del Castillo',1,'1953-10-26','',1,'0000-00-00','0000-00-00',5,'',0),(177,'Leticia Rodriguez Salazar',0,'1948-07-06','',1,'0000-00-00','0000-00-00',5,'',0),(178,'Liliana Reynaga',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(179,'Lorenza Enrigue y Zuloaga',0,'1957-10-29','',1,'0000-00-00','0000-00-00',5,'',1),(180,'Luis Felipe de Jesús Batiz y Vidrio',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(181,'Luis Gomez Portugal',1,'1948-07-17','',1,'0000-00-00','0000-00-00',5,'',1),(182,'Luis Omar Leon y Iberri',1,'1978-12-09','',1,'0000-00-00','0000-00-00',5,'',1),(183,'Luis Zuloaga Santoscoy',1,'1950-05-20','',1,'0000-00-00','0000-00-00',5,'',1),(184,'Luz Maria de Obeso',0,'1957-09-03','',1,'0000-00-00','0000-00-00',5,'',0),(185,'Luz Maria Iturbide y Zuloaga',0,'1955-11-20','',1,'0000-00-00','0000-00-00',5,'',0),(186,'Luz María Orozco y Gascón',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(187,'Ma. Catalina Rosalia de Jesús Alvarez del Castillo y Romandia',0,'1946-01-01','',1,'0000-00-00','0000-00-00',5,'',1),(188,'Ma. Concepcion Margarita Robles y Fregoso',0,'1941-12-05','',1,'0000-00-00','0000-00-00',5,'',0),(189,'María de la Luz Franco y Guijarro',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(190,'María de la Salud Iturbide y Zuloaga',0,'1953-04-15','',1,'0000-00-00','0000-00-00',5,'',0),(191,'Ma. de las Mercedes Zuloaga y Álvarez del Castillo',0,'1943-01-30','',0,'0000-00-00','0000-00-00',5,'',0),(192,'Ma. de los Angeles Aceves y Fernandez',0,'1949-11-27','',1,'1956-03-06','0000-00-00',5,'',0),(193,'Ma. del Carmen Moya y Gussi',0,'1952-12-04','',1,'0000-00-00','0000-00-00',5,'',1),(194,'María del Carmen Rocío y Cano',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(195,'Ma. del Carmen Saenz y Vilchis',0,'1975-11-08','',1,'0000-00-00','0000-00-00',5,'',0),(196,'Ma. Elena Zuloaga y Santos',0,'1942-10-14','',1,'0000-00-00','0000-00-00',5,'',0),(197,'Ma. Guadalupe Fernandez del Valle y Gallardo',0,'0000-00-00','',0,'0000-00-00','0000-00-00',5,'',0),(198,'Ma. Margarita del Rocío Verdugo y Bañuelos',0,'1953-09-12','',1,'0000-00-00','0000-00-00',5,'',0),(199,'Manuel Martinez',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(200,'Manuel Zuloaga y Chávez',1,'1954-04-26','',1,'0000-00-00','0000-00-00',5,'',1),(201,'Manuel Zuloaga y Montelongo',1,'1984-06-04','',0,'0000-00-00','0000-00-00',5,'',0),(202,'Margarita Martín del Campo y Zuloaga',0,'1950-03-27','',1,'0000-00-00','0000-00-00',5,'',1),(203,'María de Lourdes Zuloaga y Chávez',0,'1955-08-13','hogar',1,'0000-00-00','0000-00-00',5,'',1),(204,'María del Carmen Álvarez del Castillo y Gregory',0,'1947-11-05','',1,'0000-00-00','0000-00-00',5,'',0),(205,'Maria del Carmen Castañeda',0,'1960-01-27','',1,'0000-00-00','0000-00-00',5,'',1),(206,'María del Carmen Izquierdo y Álvarez del Castillo',0,'1954-07-12','',1,'0000-00-00','0000-00-00',5,'',1),(207,'Maria del Carmen Martin del Campo y Zuloaga',0,'1953-10-13','',1,'0000-00-00','0000-00-00',5,'',1),(208,'Maria del Rayo Martín del Campo y Zuloaga',0,'1952-06-29','',1,'0000-00-00','0000-00-00',5,'',1),(209,'María del Rosario Izquierdo y Álvarez del Castillo',0,'1957-05-29','',1,'0000-00-00','0000-00-00',5,'',1),(210,'Maria Elena Cerna y Colin',0,'1985-08-03','',1,'0000-00-00','0000-00-00',5,'',0),(211,'Maria Eugenia Medel',0,'1949-04-07','',1,'0000-00-00','0000-00-00',5,'',1),(212,'Maria Guadalupe Iturbide y Zuloaga',0,'1950-05-07','',1,'0000-00-00','0000-00-00',5,'',0),(213,'Maria Isabel Zuloaga y Santos',0,'1958-01-25','',1,'0000-00-00','0000-00-00',5,'',0),(214,'Maria Pilar Iturbide y Zuloaga',0,'1947-10-11','',1,'0000-00-00','0000-00-00',5,'',0),(215,'Maria Rosario Ibarra',0,'1966-01-25','',1,'0000-00-00','0000-00-00',5,'',0),(216,'María Concepción Martín del Campo y Zuloaga',0,'1949-03-14','',1,'0000-00-00','0000-00-00',5,'',1),(217,'Marina Zuloaga y Chávez',0,'1966-04-16','',1,'0000-00-00','0000-00-00',5,'',1),(218,'Mariana Zuloaga y Santos',0,'1970-08-08','',0,'0000-00-00','0000-00-00',5,'',0),(219,'Martha Leticia Zuloaga y Chavez',0,'1952-11-30','',1,'0000-00-00','0000-00-00',5,'',0),(220,'Martha Yolanda Oros',0,'1958-12-22','',1,'0000-00-00','0000-00-00',5,'',1),(221,'Mauro Francisco Alatorre y Zuloaga',1,'1955-02-17','',1,'0000-00-00','0000-00-00',5,'',1),(222,'Miguel Neal y Rendón',1,'1979-08-11','',1,'0000-00-00','0000-00-00',5,'',1),(223,'Mónica Alejandra Martín del Campo y Zuloaga',0,'1964-06-18','',0,'0000-00-00','0000-00-00',5,'',1),(224,'Monica Margarita Álvarez del Castillo y Gregory',0,'1953-07-20','',1,'0000-00-00','0000-00-00',5,'',1),(225,'Monica Elias',0,'1945-12-13','',1,'0000-00-00','0000-00-00',5,'',0),(226,'Myriam Hernandez',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(227,'Narciso Tostado y Gonzalez',1,'1943-06-08','',1,'0000-00-00','0000-00-00',5,'',1),(228,'Norali Franco y Abascal',0,'1958-07-01','',1,'0000-00-00','0000-00-00',5,'',0),(229,'Olga Diaque Lases',0,'1946-09-09','Ama de casa',1,'1968-06-08','0000-00-00',5,'229',0),(230,'Patricia Montelongo',0,'1959-01-22','hogar',1,'0000-00-00','0000-00-00',5,'',0),(231,'Patricia Noriega',0,'0000-00-00','',0,'0000-00-00','0000-00-00',5,'',0),(232,'Patricia Zuloaga y Santoscoy',0,'1951-05-24','',1,'0000-00-00','0000-00-00',5,'',1),(233,'Pedro Luis Alatorre y Zuloaga',1,'1952-01-16','',1,'0000-00-00','0000-00-00',5,'',1),(234,'Pedro Zuloaga y Santoscoy',1,'1955-08-24','',1,'0000-00-00','0000-00-00',5,'',1),(235,'Rafael Gomez y Diaz',1,'1958-11-17','',1,'0000-00-00','0000-00-00',5,'',1),(236,'Raul Elizarraras',1,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(237,'Roberto Manuel Izquierdo y Álvarez del Castillo',1,'1952-11-14','',1,'0000-00-00','0000-00-00',5,'',1),(238,'Roberto Zertuche y Fuentes',1,'1959-08-19','',1,'0000-00-00','0000-00-00',5,'',1),(239,'Rocio Rosales y Aranguren',0,'1966-09-07','',1,'0000-00-00','0000-00-00',5,'',1),(240,'Rosa Isela Cardona Villanueva',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(241,'Sandra Gonzalez',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(242,'Silvia Fernandez',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',1),(243,'Silvia Izquierdo y Alvarez Del Castillo	',0,'1951-10-02','',1,'0000-00-00','0000-00-00',5,'',1),(244,'Sofia Enrigue y Zuloaga',0,'1954-05-04','',0,'0000-00-00','0000-00-00',5,'',1),(245,'Sofia Aldana y Martínez',0,'1956-08-27','',1,'0000-00-00','0000-00-00',5,'',1),(246,'Stella Alvarez Del Castillo y Gregory',0,'1954-10-20','',1,'0000-00-00','0000-00-00',5,'',1),(247,'Susana Iturbide y Zuloaga',0,'1949-01-14','',1,'0000-00-00','0000-00-00',5,'',0),(248,'Susana Valencia y Morfin',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(249,'Teresa Aldape Gonzalez',0,'0000-00-00','',0,'0000-00-00','0000-00-00',5,'',0),(250,'Adrian Marquez y Iturbide',1,'1983-07-21','',0,'0000-00-00','0000-00-00',6,'',0),(251,'Adriana Isabel Zuloaga y de Obeso',0,'1988-11-11','',0,'0000-00-00','0000-00-00',6,'',0),(252,'Alejandro Covarrubias y Zuloaga',1,'1970-04-30','',0,'0000-00-00','0000-00-00',6,'',0),(253,'Alberto Elizarrarás y Zuloaga',1,'1970-05-27','',0,'0000-00-00','0000-00-00',6,'',1),(254,'Alberto Zuloaga y Reynaga',1,'1994-12-10','',0,'0000-00-00','0000-00-00',6,'',0),(255,'Alberto Zuloaga y Fernandez',1,'1972-07-08','',0,'0000-00-00','0000-00-00',6,'',0),(256,'Aldo Fernandez y Zuloaga',1,'1980-06-26','',1,'0000-00-00','0000-00-00',6,'',0),(257,'Alejandro Fernandez y Zuloaga',1,'1974-05-30','',1,'0000-00-00','0000-00-00',6,'',0),(258,'Alejandro Gomez y Enrigue',1,'1981-04-09','',0,'0000-00-00','0000-00-00',6,'',0),(259,'Alejandro Martin Del Campo y Saenz',1,'1978-10-09','',0,'0000-00-00','0000-00-00',6,'',0),(260,'Alfonso Marquez y Iturbide',1,'1974-05-15','',0,'0000-00-00','1974-05-17',6,'',0),(261,'Alian Cristopher Lugo y Izquierdo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(262,'Alicia Covarrubias',0,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(263,'Alonso Gomez y Zuloaga',1,'1986-04-26','',0,'0000-00-00','0000-00-00',6,'',0),(264,'Alvaro Covarrubias y Zuloaga',1,'1972-08-18','',0,'0000-00-00','0000-00-00',6,'',0),(265,'Alvaro Cortez y Zuloaga',1,'1979-03-09','',0,'0000-00-00','0000-00-00',6,'',0),(266,'Alvaro Diaz Del Castillo y Mendoza',1,'0000-00-00','',1,'0000-00-00','0000-00-00',6,'',1),(267,'Alvaro Gomez y Izquierdo',1,'1984-05-23','',0,'0000-00-00','0000-00-00',6,'',0),(268,'Alvaro Valdez y Enrigue',1,'1988-03-02','',0,'0000-00-00','0000-00-00',6,'',0),(269,'Ana Cecilia Alatorre y Oros',0,'1968-10-21','',0,'0000-00-00','0000-00-00',6,'',0),(270,'Ana Lorena Zuloaga y Cerna',0,'1998-01-07','',0,'0000-00-00','0000-00-00',6,'',0),(271,'Ana Maria Loya y Martin Del Campo',0,'1979-07-18','',0,'0000-00-00','0000-00-00',6,'',0),(272,'Ana Maria Zuloaga y Villaseñor',0,'1976-11-12','',1,'0000-00-00','0000-00-00',6,'',1),(273,'Ana Paula Iturbide y Orozco',0,'1986-05-04','',0,'0000-00-00','0000-00-00',6,'',0),(274,'Ana Paula Martin Del Campo',0,'1985-08-09','',0,'0000-00-00','0000-00-00',6,'',0),(275,'Ana Sofia Zuloaga y Cardona',0,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(276,'Andrea Martín del Campo y Thort',0,'1995-06-26','',0,'0000-00-00','0000-00-00',6,'',1),(277,'Andres Nieto y Enrigue',1,'1986-07-23','',0,'0000-00-00','0000-00-00',6,'',0),(278,'Andres Zuloaga y Cano',1,'1991-04-27','',0,'0000-00-00','0000-00-00',6,'',0),(279,'Anilú',0,'0000-00-00','',1,'0000-00-00','0000-00-00',6,'',0),(280,'Antonio Martin Del Campo y Saenz',1,'1975-10-25','',0,'0000-00-00','0000-00-00',6,'',0),(281,'Antonio Rodriguez y Gonzalez',1,'1971-05-16','',1,'0000-00-00','0000-00-00',6,'',1),(282,'Araceli',0,'0000-00-00','',1,'0000-00-00','0000-00-00',6,'',0),(283,'Armando Mora',1,'1968-11-03','',1,'0000-00-00','0000-00-00',6,'',1),(284,'Arturo Gomez y Zuloaga',1,'1981-03-27','',0,'0000-00-00','0000-00-00',6,'',0),(285,'Barbara Zuloaga y Maytorena',0,'1989-11-21','',0,'0000-00-00','0000-00-00',6,'',0),(286,'Benjamin Mart&iacute;n del Campo y Ceballos',1,'1983-06-05','',0,'0000-00-00','0000-00-00',6,'',0),(287,'Brenda Rodriguez Morores',0,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(288,'Carlos Alberto Hijar y Fernandez',1,'1970-07-06','',1,'0000-00-00','0000-00-00',6,'',0),(289,'Carlos Antonio Martin Del Campo y Eng',1,'1979-11-13','',0,'0000-00-00','0000-00-00',6,'',0),(290,'Carlos Diaz De Leon y Zuloaga',1,'1987-07-23','',0,'0000-00-00','0000-00-00',6,'',0),(291,'Carlos Jose Zuloaga y Fernandez Del Valle',1,'1979-10-03','',0,'0000-00-00','0000-00-00',6,'',0),(292,'Carlos Maria Enrigue y Lancaster Jones',1,'1982-06-08','',0,'0000-00-00','0000-00-00',6,'',0),(293,'Carlos Marquez y Iturbide',1,'1973-05-10','',0,'0000-00-00','0000-00-00',6,'',0),(294,'Carlos Zuloaga y Franco',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(295,'Cecilia Alatorre y Alatorre',0,'1978-05-02','',0,'0000-00-00','0000-00-00',6,'',0),(296,'Cristina Mojica Anaya',0,'0000-00-00','',1,'0000-00-00','0000-00-00',6,'',0),(297,'Daniel Paredes y Izquierdo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(298,'Daniel Zuloaga y Cano',1,'1997-08-11','',0,'0000-00-00','0000-00-00',6,'',0),(299,'Daniel Zuloaga y Fernandez',1,'1986-04-10','',0,'0000-00-00','0000-00-00',6,'',0),(300,'Daniela Batiz y Izquierdo',0,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(301,'Daniela Diaz De Leon y Zuloaga',0,'1980-05-21','',0,'0000-00-00','0000-00-00',6,'',0),(302,'David Josue Zuloaga y Saenz',1,'1981-02-08','',0,'0000-00-00','0000-00-00',6,'',0),(303,'David Leon y Martin Del Campo',1,'1988-08-13','',0,'0000-00-00','0000-00-00',6,'',0),(304,'David Solorzano y Álvarez del Castillo',1,'1975-11-05','',0,'0000-00-00','0000-00-00',6,'',0),(305,'Diego Delfin y Álvarez del Castillo',1,'1971-04-28','',0,'0000-00-00','0000-00-00',6,'',0),(306,'Diego Fernandez y Zuloaga',1,'1975-06-16','',1,'0000-00-00','0000-00-00',6,'',0),(307,'Diego Zuloaga y Cerna',1,'1992-12-08','',0,'0000-00-00','0000-00-00',6,'',0),(308,'Eduardo Navarro y Becerra',1,'1961-06-29','',1,'0000-00-00','0000-00-00',6,'',0),(309,'Eduardo Zuloaga y Diaque',1,'1973-09-07','',1,'0000-00-00','0000-00-00',6,'',0),(310,'Elena Isaac y Iturbide',0,'1975-07-25','',1,'0000-00-00','0000-00-00',6,'',1),(311,'Elena Loya y Martin Del Campo',0,'1984-03-14','',0,'0000-00-00','0000-00-00',6,'',0),(312,'Emanuel Ismael Martinez y Izquierdo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(313,'Emilio Miguel Zuloaga y Saenz',1,'1988-02-14','',0,'0000-00-00','0000-00-00',6,'',0),(314,'Enrique Zuloaga y Cerna',1,'1990-02-16','',0,'0000-00-00','0000-00-00',6,'',0),(315,'Eugenio De Anda y Enrigue',1,'1985-06-04','',0,'0000-00-00','0000-00-00',6,'',0),(316,'Fanny Enrigue y Lancaster Jones',0,'1976-06-06','',0,'0000-00-00','0000-00-00',6,'',0),(317,'Felipe De Anda y Enrigue',1,'1982-04-01','',0,'0000-00-00','0000-00-00',6,'',0),(318,'Fernando Gomez',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(319,'Francisco Martin Del Campo y Hernandez',1,'1981-10-15','',0,'0000-00-00','0000-00-00',6,'',0),(320,'Francisco Rafael Lugo y Izquierdo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(321,'Francisco Raymundo Tostado y Álvarez del Castillo',1,'1973-11-24','',0,'0000-00-00','0000-00-00',6,'',0),(322,'Francisco Ruiz y Enrigue',1,'1988-02-25','',0,'0000-00-00','0000-00-00',6,'',0),(323,'Francisco Sandoval y Flores',1,'1970-11-23','',1,'0000-00-00','0000-00-00',6,'',0),(324,'Gabriel Hijar y Fernandez',1,'1969-06-20','',0,'0000-00-00','0000-00-00',6,'',1),(325,'Gabriel Iturbide y Torres',1,'1996-05-08','',0,'0000-00-00','0000-00-00',6,'',0),(326,'Gabriel Nieto y Enrigue',1,'1981-08-20','',0,'0000-00-00','0000-00-00',6,'',0),(327,'Gabriel Zuloaga y Álvarez del Castillo',1,'1949-11-05','',1,'1975-10-04','2009-10-16',5,'',0),(328,'Gabriela De Anda y Enrigue',0,'1984-02-21','',0,'0000-00-00','0000-00-00',6,'',0),(329,'Gabriela Martin del Campo y Thort',0,'1998-06-14','',0,'0000-00-00','0000-00-00',6,'',1),(330,'Gabriela Zuloaga y Villaseñor',0,'1968-01-03','',1,'0000-00-00','0000-00-00',6,'',0),(331,'Gerardo Gomez y Izquierdo',1,'1985-10-15','',0,'0000-00-00','0000-00-00',6,'',0),(332,'Gerardo Gonzalez Guerra y Álvarez del Castillo',1,'1983-09-30','',0,'0000-00-00','0000-00-00',6,'',0),(333,'Gilda Chavez y Martinez',0,'1970-10-08','',1,'0000-00-00','0000-00-00',6,'',0),(334,'Guadalupe Enrigue y Lancaster Jones',0,'1980-03-06','',0,'0000-00-00','0000-00-00',6,'',0),(335,'Guillermo Alatorre y Alatorre',1,'1977-01-27','',0,'0000-00-00','0000-00-00',6,'',0),(336,'Guillermo Eugenio Nieto y Zuloaga',1,'1976-06-27','',0,'0000-00-00','0000-00-00',6,'',0),(337,'Guillermo Loya y Martin del Campo',1,'1978-02-20','',0,'0000-00-00','0000-00-00',6,'',0),(338,'Gustavo Alatorre y Alatorre',1,'1977-01-27','',0,'0000-00-00','0000-00-00',6,'',0),(339,'Hugo Zuloaga y Rodriguez',1,'1983-07-21','',0,'0000-00-00','0000-00-00',6,'',0),(340,'Ignacio Gonzalez y Cantu',1,'2002-03-20','',0,'0000-00-00','0000-00-00',6,'',0),(341,'Irene Alatorre y Alatorre',0,'1990-08-24','',0,'0000-00-00','0000-00-00',6,'',0),(342,'Iris Zuloaga y Franco',0,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(343,'Isabel Enrigue y Rosales',0,'2000-10-10','',0,'0000-00-00','0000-00-00',6,'',0),(344,'Ivette Santacruz y Iturbide',0,'1978-12-17','',0,'0000-00-00','0000-00-00',6,'',0),(345,'Jacinto Arenas',1,'2000-05-19','',0,'0000-00-00','0000-00-00',6,'',0),(346,'Jaime Lubin Zermeño y Martin Del Campo',1,'1975-06-11','',0,'0000-00-00','0000-00-00',6,'',0),(347,'Jaime Zuloaga y Saenz',1,'1976-07-27','',0,'0000-00-00','0000-00-00',6,'',0),(348,'Javier Romo y Martin Del Campo',1,'1979-12-25','',0,'0000-00-00','0000-00-00',6,'',0),(349,'Javier Santacruz y Iturbide',1,'1976-01-12','',0,'0000-00-00','0000-00-00',6,'',0),(350,'Jesus Alberto Neal y Zuloaga',1,'1985-02-23','',0,'0000-00-00','0000-00-00',6,'',0),(351,'Jesús Alejandro Tostado y Álvarez del Castillo',1,'1971-06-18','',0,'0000-00-00','0000-00-00',6,'',0),(352,'Jesús Armando Zuloaga y Elias',1,'1976-06-08','',0,'0000-00-00','0000-00-00',6,'',0),(353,'Jesús Ernesto Martin Del Campo y Eng',1,'1979-11-13','',0,'0000-00-00','0000-00-00',6,'',0),(354,'Jesús  Carlos G&oacute;mez y Zuloaga',1,'1983-08-27','',0,'0000-00-00','0000-00-00',6,'',0),(355,'Jesús Mariano Izquierdo y Fisure',1,'1970-10-05','',0,'0000-00-00','0000-00-00',6,'',0),(356,'Jesús Omar Álvarez del Castillo y Castañeda',1,'1975-06-08','',0,'0000-00-00','0000-00-00',6,'',0),(357,'Joel Zuloaga y Aceves',1,'1977-01-11','',0,'0000-00-00','0000-00-00',6,'',0),(358,'Jonathan Lugo y Izquierdo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(359,'Jorge Covarrubias y Zuloaga',1,'1980-11-10','',0,'0000-00-00','0000-00-00',6,'',0),(360,'Jorge Roman Izquierdo y Fisure',1,'1969-08-15','',0,'0000-00-00','0000-00-00',6,'',1),(361,'Jorge Zuloaga y Franco',1,'1980-08-22','',0,'0000-00-00','0000-00-00',6,'',0),(362,'José Andres Zuloaga y De Obeso',1,'1984-01-16','',0,'0000-00-00','0000-00-00',6,'',0),(363,'José Antonio Alvarez y Garcia',1,'1970-02-17','',1,'0000-00-00','0000-00-00',6,'',1),(364,'José Antonio Isaac y Iturbide',1,'1982-11-29','',0,'0000-00-00','0000-00-00',6,'',0),(365,'José Eduardo Tostado y Álvarez del Castillo',1,'1968-04-30','',0,'0000-00-00','0000-00-00',6,'',0),(366,'José Luis Zuloaga y Diaque',1,'1969-03-29','',1,'0000-00-00','0000-00-00',6,'',0),(367,'José Miguel Neal y Zuloaga',1,'1981-09-13','',0,'0000-00-00','0000-00-00',6,'',0),(368,'José Rodrigo Marquez y Iturbide',1,'1978-03-19','',0,'0000-00-00','0000-00-00',6,'',0),(369,'Juan Bosco Iturbide y Rugeiro',1,'1988-06-21','',0,'0000-00-00','0000-00-00',6,'',0),(370,'Juan Diego Zuloaga y Maytorena',1,'1991-07-09','',0,'0000-00-00','0000-00-00',6,'',0),(371,'Juan Fernando Zuloaga y Aceves',1,'1978-08-06','',0,'0000-00-00','0000-00-00',6,'',0),(372,'Juan Francisco Martin Del Campo y Medel',1,'1979-10-04','',0,'0000-00-00','0000-00-00',6,'',0),(373,'Juan Ignacio Michel y Zepeda',1,'1975-02-20','',1,'0000-00-00','0000-00-00',6,'',0),(374,'Juan Pablo Casillas y Iturbide',1,'1979-03-05','',0,'0000-00-00','0000-00-00',6,'',0),(375,'Juan Pablo Martin Del Campo y Ceballos',1,'1985-03-07','',0,'0000-00-00','0000-00-00',6,'',0),(376,'Juan Pablo Zuloaga y De Obeso',1,'1982-04-26','',0,'0000-00-00','0000-00-00',6,'',0),(377,'Judith Guadalupe Zuloaga y Fernandez',0,'1971-02-13','',0,'0000-00-00','0000-00-00',6,'',0),(378,'Julio Cesar Casillas y Iturbide',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(379,'Karina Emilia Zuloaga y Reynaga',0,'1998-10-07','',0,'0000-00-00','0000-00-00',6,'',0),(380,'Karla Elena Zuloaga y Maytorena',0,'1985-03-10','',0,'0000-00-00','0000-00-00',6,'',0),(381,'Karla Gonzalez Guerra y Álvarez del Castillo',0,'1975-11-07','',0,'0000-00-00','0000-00-00',6,'',0),(382,'Leopoldo Alberto Zuloaga y Verdugo',1,'1985-08-24','',0,'0000-00-00','0000-00-00',6,'',0),(383,'Lillian Lorenza Álvarez del Castillo y Ontiveros',0,'1968-03-20','',1,'0000-00-00','0000-00-00',6,'',1),(384,'Lizette Guizar y Iturbide',0,'1980-08-04','',0,'0000-00-00','0000-00-00',6,'',0),(385,'Lucia Patricia Zuloaga y Montelongo',0,'1980-12-21','',0,'0000-00-00','0000-00-00',6,'',0),(386,'Luciana Zermeño y Martin Del Campo',0,'1980-05-20','',0,'0000-00-00','0000-00-00',6,'',0),(387,'Luis Andres Leon y Martin Del Campo',1,'1982-11-28','',0,'0000-00-00','0000-00-00',7,'',0),(388,'Luis Batiz y Izquierdo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(389,'Luis Eduardo Zuloaga y Maytorena',1,'1984-05-09','',0,'0000-00-00','0000-00-00',6,'',0),(390,'Luis Fernando Zuloaga y Cardona',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(391,'Luis Gomez y Enrigue',1,'1974-01-02','',0,'0000-00-00','0000-00-00',6,'',0),(392,'Luis Zuloaga y Fernandez',1,'1974-01-18','',0,'0000-00-00','0000-00-00',6,'',0),(393,'Luz María Zuloaga y de Obeso',0,'1982-04-26','',0,'0000-00-00','0000-00-00',6,'',0),(394,'Ma. Carminia Zuloaga y Saenz',0,'1980-06-03','',0,'0000-00-00','0000-00-00',6,'',0),(395,'María de los Angeles Elizarraras y Zuloaga',0,'1967-08-17','',2,'0000-00-00','0000-00-00',6,'',1),(396,'Ma. de los Dolores Nieto y Zuloaga',0,'1978-11-18','',0,'0000-00-00','0000-00-00',6,'',0),(397,'Ma. del Carmen Alatorre y Moya',0,'1997-04-07','',0,'0000-00-00','0000-00-00',6,'',0),(398,'Manuel Valdez y Enrigue',1,'1986-01-29','',0,'0000-00-00','0000-00-00',6,'',0),(399,'Marcela Álvarez del Castillo y Ontiveros',0,'1969-08-03','',1,'0000-00-00','0000-00-00',6,'',1),(400,'Marcela Díaz de León y Zuloaga',0,'1978-11-22','',0,'0000-00-00','0000-00-00',6,'',0),(401,'Marco Antonio Zuloaga y Rodriguez',1,'1985-07-22','',0,'0000-00-00','0000-00-00',6,'',1),(402,'Margarita Romo y Martín del Campo',0,'1977-05-15','',0,'0000-00-00','0000-00-00',6,'',0),(403,'Maria Álvarez del Castillo y Aldana',0,'1976-12-09','',0,'0000-00-00','0000-00-00',6,'',0),(404,'María Aurora',0,'0000-00-00','',1,'0000-00-00','0000-00-00',6,'',0),(405,'María de la Paz Zuloaga y Villaseñor',0,'1970-03-04','',1,'0000-00-00','0000-00-00',6,'',0),(407,'María del Carmen Batiz y Izquierdo',0,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(408,'María del Carmen Zuloaga y Villaseñor',0,'1972-02-17','',1,'0000-00-00','0000-00-00',6,'',1),(409,'María del Pilar Covarrubias y Zuloaga',0,'1973-08-21','',0,'0000-00-00','0000-00-00',6,'',0),(410,'María del Rocio Enrigue y Lancaster Jones',0,'1985-08-15','',0,'0000-00-00','0000-00-00',6,'',0),(411,'María Elena Zuloaga y Cerna',0,'1986-06-08','',0,'0000-00-00','0000-00-00',6,'',0),(412,'María Gutierrez Hermosillo y Corvera',0,'1956-04-15','',1,'1975-10-04','0000-00-00',5,'',0),(413,'María Isabel Martín del Campo y Saenz',0,'1972-05-22','',0,'0000-00-00','0000-00-00',6,'',0),(414,'María José Enrigue y Rosales',0,'2001-12-12','',0,'0000-00-00','0000-00-00',6,'',0),(415,'María José Iturbide y Rugeiro',0,'1985-08-24','',0,'0000-00-00','0000-00-00',6,'',0),(416,'María Luisa Díaz de León y Zuloaga',0,'1976-07-31','',0,'0000-00-00','0000-00-00',6,'',0),(417,'María Martín del Campo y Medel',0,'1982-09-07','',0,'0000-00-00','0000-00-00',6,'',0),(418,'Mariana Diaz y Barba',0,'1976-01-20','',1,'0000-00-00','0000-00-00',6,'',0),(419,'Mariana Iturbide y Orozco',0,'1983-11-22','',0,'0000-00-00','0000-00-00',6,'',0),(420,'Mariana Zermeño y Martín del Campo',0,'1978-08-26','',0,'0000-00-00','0000-00-00',6,'',0),(421,'Marina Andrea Zertuche y Zuloaga',0,'1993-03-23','',0,'0000-00-00','0000-00-00',6,'',0),(422,'Marina Isabel Gomez y Zuloaga',0,'1989-12-02','',0,'0000-00-00','0000-00-00',6,'',0),(423,'Mario Alejandro Zuloaga y Elias',1,'1977-05-03','',0,'0000-00-00','0000-00-00',6,'',0),(424,'Mario Julian Zermeño y Martín del Campo',1,'1983-01-15','',0,'0000-00-00','0000-00-00',7,'',0),(425,'Mariza Santacruz y Iturbide',0,'1973-02-11','',1,'0000-00-00','0000-00-00',6,'',1),(426,'Martha Alejandra Alatorre y Oros',0,'1980-02-07','',0,'0000-00-00','0000-00-00',6,'',0),(427,'Mauricio Iturbide y Torres',1,'1999-02-22','',0,'0000-00-00','0000-00-00',6,'',0),(428,'Mauricio Leon y Martín del Campo',1,'1984-11-27','',0,'0000-00-00','0000-00-00',6,'',0),(429,'Mauricio Nieto y Enrigue',1,'1982-12-18','',0,'0000-00-00','0000-00-00',6,'',0),(430,'Mauro Francisco Alatorre y Oros',1,'1984-05-28','',0,'0000-00-00','0000-00-00',6,'',0),(431,'Mónica Alejandra Zertuche y Zuloaga',0,'1995-05-29','',0,'0000-00-00','0000-00-00',6,'',0),(432,'Mónica Enrigue y Lancaster Jones',0,'1978-02-10','',0,'0000-00-00','0000-00-00',6,'',0),(433,'Mónica Gonzalez Guerra y Álvarez del Castillo',0,'1972-01-19','',0,'0000-00-00','0000-00-00',6,'',0),(434,'Mónica Guizar y Iturbide',0,'1984-08-25','',0,'0000-00-00','0000-00-00',6,'',0),(435,'Mónica María Zuloaga y Elias',0,'1983-01-15','',0,'0000-00-00','0000-00-00',6,'',0),(436,'Myriam Zuloaga y Fregoso',0,'1965-09-17','',1,'0000-00-00','0000-00-00',6,'',0),(437,'Norali Paola Zuloaga y Franco',0,'1983-12-29','',0,'0000-00-00','0000-00-00',6,'',0),(438,'Omar Eduardo Leon y Martín del Campo',1,'1980-11-30','',0,'0000-00-00','0000-00-00',6,'',0),(439,'Paloma Enrigue y Rosales',0,'1996-10-07','',0,'0000-00-00','0000-00-00',6,'',0),(440,'Paulina Cortez y Zuloaga',0,'1977-12-12','',0,'0000-00-00','0000-00-00',6,'',0),(441,'Paulina Isaac y Iturbide',0,'1977-09-26','',1,'0000-00-00','0000-00-00',6,'',0),(442,'Paulo Christian Lugo y Izquierdo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(443,'Pedro Luis Alatorre y Ibarra',1,'1997-04-07','',0,'0000-00-00','0000-00-00',6,'',0),(444,'Pedro Zuloaga y Cano',1,'1986-09-11','',0,'0000-00-00','0000-00-00',6,'',0),(445,'Priscilla Zuloaga y Gonzalez',0,'1982-07-12','',0,'0000-00-00','0000-00-00',6,'',0),(446,'Rafael Gomez y Izquierdo',1,'1983-11-05','',0,'0000-00-00','0000-00-00',6,'',0),(447,'Raúl Bernardino Izquierdo y Fisure',1,'1975-07-16','',0,'0000-00-00','0000-00-00',6,'',0),(448,'Raúl Elizarraras y Zuloaga',1,'1968-09-05','',0,'0000-00-00','0000-00-00',6,'',1),(449,'Raymundo Zuloaga y Fernandez del Valle',1,'1993-12-22','',0,'0000-00-00','0000-00-00',6,'',0),(450,'Regina Iturbide y Rugeiro',0,'1990-06-04','',0,'0000-00-00','0000-00-00',6,'',0),(451,'Regina Valdez y Enrigue',0,'1993-01-02','',0,'0000-00-00','0000-00-00',6,'',0),(452,'Roberto Paredes y Izquierdo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(453,'Rocío Zuloaga y Diaque',0,'1971-04-24','',1,'0000-00-00','0000-00-00',6,'',0),(454,'Rodrigo Zuloaga y Fernandez del Valle',1,'1980-10-26','',0,'0000-00-00','0000-00-00',6,'',0),(455,'Rodrigo Zuloaga y Fernandez',1,'1978-07-14','',0,'0000-00-00','0000-00-00',6,'',0),(456,'Salvador Franco y Durán',1,'1967-09-21','',1,'0000-00-00','0000-00-00',6,'',0),(457,'Samuel Zuloaga y Cano',1,'1998-08-29','',0,'0000-00-00','0000-00-00',6,'',0),(458,'Sandra Alatorre y Alatorre',0,'1980-06-25','',0,'0000-00-00','0000-00-00',6,'',0),(459,'Sandra Zuloaga y Gonzalez',0,'1984-04-13','',0,'0000-00-00','0000-00-00',6,'',0),(460,'Santiago Gomez y Enrigue',1,'1979-01-18','',1,'0000-00-00','0000-00-00',6,'',1),(461,'Santiago Zuloaga y Cano',1,'1987-10-27','',0,'0000-00-00','0000-00-00',6,'',0),(462,'Sara Alatorre y Ibarra',0,'1998-07-03','',0,'0000-00-00','0000-00-00',6,'',0),(463,'Sergio Flores y Ochoa',1,'0000-00-00','',1,'0000-00-00','0000-00-00',6,'',0),(464,'Sofía Casillas y Iturbide',0,'1982-09-19','',0,'0000-00-00','0000-00-00',6,'',0),(465,'Sofía Gomez y Enrigue',0,'1990-09-01','',0,'0000-00-00','0000-00-00',6,'',0),(466,'Sofía Loya y Martín del Campo',0,'1981-05-21','',0,'0000-00-00','0000-00-00',6,'',0),(467,'Stella Solorzano y Álvarez del Castillo',0,'1978-04-06','',0,'0000-00-00','0000-00-00',6,'',0),(468,'Susana Casillas y Iturbide',0,'1975-02-20','',0,'0000-00-00','0000-00-00',6,'',0),(469,'Susana Delfin y Álvarez del Castillo',0,'1972-12-17','',0,'0000-00-00','0000-00-00',6,'',0),(470,'Susana Enrigue y Valencia',0,'1980-06-21','',0,'0000-00-00','0000-00-00',6,'',0),(471,'Vera Álvarez del Castillo y Aldana',0,'1978-01-20','',0,'0000-00-00','0000-00-00',6,'',0),(472,'Victoria Zuloaga y Noriega',0,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(473,'Álvaro Diaz Del Castillo y Álvarez del Castillo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',7,'',0),(474,'Ana Sofía Alvarez y Zuloaga',0,'1995-10-12','',0,'0000-00-00','0000-00-00',7,'',0),(475,'Andrés Flores y Álvarez del Castillo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',7,'',0),(476,'Andrés Zuloaga y Chavez',1,'2001-01-03','',2,'0000-00-00','0000-00-00',7,'',0),(477,'Armando Mora y Santacruz',1,'1998-11-03','',0,'0000-00-00','0000-00-00',7,'',0),(478,'Bernardo Zuloaga y Gutiérrez Hermosillo',1,'1980-10-11','',0,'0000-00-00','0000-00-00',6,'',0),(479,'Diego Mora y Santacruz',1,'2002-01-25','',0,'0000-00-00','0000-00-00',7,'',0),(480,'Diego Navarro y Zuloaga',1,'2000-09-28','',0,'0000-00-00','0000-00-00',7,'',0),(481,'Eduardo Navarro y Zuloaga',1,'1998-07-04','',0,'0000-00-00','0000-00-00',7,'',0),(482,'Fátima Rodriguez y Zuloaga',0,'0000-00-00','',0,'0000-00-00','0000-00-00',7,'',0),(483,'Francisco Sandoval y Zuloaga',1,'1998-07-10','',0,'0000-00-00','0000-00-00',7,'',0),(484,'Gabriel Zuloaga y Gutiérrez Hermosillo',1,'1976-08-28','',0,'0000-00-00','0000-00-00',6,'',0),(485,'Gabriela Díaz del Castillo y Álvarez del Castillo',0,'0000-00-00','',0,'0000-00-00','0000-00-00',7,'',0),(486,'Inés Díaz del Castillo y Álvarez del Castillo',0,'0000-00-00','',0,'0000-00-00','0000-00-00',7,'',0),(487,'Inés Rodríguez y Zuloaga',0,'2005-12-31','',0,'0000-00-00','0000-00-00',7,'',0),(488,'Iván Zuloaga y Díaz',1,'2002-03-19','',0,'0000-00-00','0000-00-00',7,'',0),(489,'Jimena Sandoval y Zuloaga',0,'2005-07-29','',0,'0000-00-00','0000-00-00',7,'',0),(490,'José Antonio Alvarez y Zuloaga',1,'1992-01-26','',0,'0000-00-00','0000-00-00',7,'',0),(491,'José Pablo Zuloaga y Díaz',1,'2004-09-18','',2,'0000-00-00','0000-00-00',7,'',0),(492,'Juan Ignacio Michel y Zuloaga',1,'1997-04-28','',0,'0000-00-00','0000-00-00',7,'',0),(493,'Juan Pedro Navarro y Zuloaga',1,'2004-08-06','',0,'0000-00-00','0000-00-00',7,'',0),(494,'Luis Díaz del Castillo y Álvarez del Castillo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',7,'',0),(495,'María José Alvarez y Zuloaga',0,'1998-03-19','',0,'0000-00-00','0000-00-00',7,'',0),(496,'María Zuloaga y Gutiérrez Hermosillo',0,'1978-08-05','',0,'0000-00-00','0000-00-00',6,'',0),(497,'Matías Rodriguez y Zuloaga',1,'2003-05-15','',0,'0000-00-00','0000-00-00',7,'',0),(498,'Mauricio Sandoval y Zuloaga',1,'2001-09-17','',0,'0000-00-00','0000-00-00',7,'',0),(499,'Paola Díaz del Castillo y Álvarez del Castillo',0,'0000-00-00','',0,'0000-00-00','0000-00-00',7,'',0),(500,'Salvador Franco y Zuloaga',1,'1986-08-05','',0,'0000-00-00','0000-00-00',7,'',0),(501,'Santiago Álvarez y Zuloaga',1,'2003-12-18','',0,'0000-00-00','0000-00-00',7,'',0),(502,'Santiago Flores y Álvarez del Castillo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',7,'',0),(503,'Santiago Zuloaga y Chávez',1,'1997-09-27','',0,'0000-00-00','0000-00-00',7,'',0),(504,'Santiago Zuloaga y Gutiérrez Hermosillo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',6,'',0),(505,'Sergio Flores y Álvarez del Castillo',1,'0000-00-00','',0,'0000-00-00','0000-00-00',7,'',0),(508,'Cecilia Rábago',0,'0000-00-00','',1,'0000-00-00','0000-00-00',5,'',0),(506,'Ana Cecilia Alatorre y Zuloaga',0,'1950-09-29','',1,'0000-00-00','0000-00-00',5,'',1),(507,'María del Carmen Delfín y Álvarez del Castillo',0,'1967-12-20','',0,'0000-00-00','0000-00-00',6,'',0);
/*!40000 ALTER TABLE `genealogia_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_estados`
--

DROP TABLE IF EXISTS `general_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_estados` (
  `id` smallint(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_estados`
--

LOCK TABLES `general_estados` WRITE;
/*!40000 ALTER TABLE `general_estados` DISABLE KEYS */;
INSERT INTO `general_estados` VALUES (1,'Aguascalientes','',1),(2,'Baja California','',1),(3,'Baja California Sur','',1),(4,'Campeche','',1),(5,'Coahuila','',1),(6,'Colima','',1),(7,'Chiapas','',1),(8,'Chihuahua','',1),(9,'Chiapas','',1),(10,'Distrito Federal','',1),(11,'Durango','',1),(12,'Guanajuato','',1),(13,'Guerrero','',1),(14,'Hidalgo','',1),(15,'Jalisco','',1),(16,'M&eacute;xico','',1),(17,'Michoac&aacute;n','',1),(18,'Morelos','',1),(19,'Nayarit','',1),(20,'Nuevo Le&oacute;n','',1),(21,'Oaxaca','',1),(22,'Puebla','',1),(23,'Quer&eacute;taro','',1),(24,'Quintana Roo','',1),(25,'San Luis Potos&iacute;','',1),(26,'Sinaloa','',1),(27,'Sonora','',1),(28,'Tabasco','',1),(29,'Tamaulipas','',1),(30,'Tlaxcala','',1),(31,'Veracruz','',1),(32,'Yucat&aacute;n','',1),(33,'Zacatecas','',1);
/*!40000 ALTER TABLE `general_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_ext`
--

DROP TABLE IF EXISTS `general_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_ext` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_ext`
--

LOCK TABLES `general_ext` WRITE;
/*!40000 ALTER TABLE `general_ext` DISABLE KEYS */;
INSERT INTO `general_ext` VALUES (0,'ninguno','sin formato'),(1,'jpg','fotos'),(2,'png','fotos'),(3,'swf','flash'),(4,'mov','video'),(5,'avi','video');
/*!40000 ALTER TABLE `general_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_municipios`
--

DROP TABLE IF EXISTS `general_municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_municipios` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `estado` smallint(3) NOT NULL DEFAULT '15',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_municipios`
--

LOCK TABLES `general_municipios` WRITE;
/*!40000 ALTER TABLE `general_municipios` DISABLE KEYS */;
INSERT INTO `general_municipios` VALUES (1,'Acatic',15,1),(2,'AcatlÃ¡n de JuÃ¡rez',15,1),(3,'Ahualulco de Mercado',15,1),(4,'Amacueca',15,1),(5,'AmatitÃ¡n',15,1),(6,'Ameca',15,1),(7,'San Juanito de Escobedo',15,1),(8,'Arandas',15,1),(9,'El Arenal',15,1),(10,'Atemajac de Brizuela',15,1),(11,'Atengo',15,1),(12,'Atenguillo',15,1),(13,'Atotonilco el Alto',15,1),(14,'Atoyac',15,1),(15,'AutlÃ¡n de Navarro',15,1),(16,'AyotlÃ¡n',15,1),(17,'Ayutla',15,1),(18,'La Barca',15,1),(19,'BolaÃ±os',15,1),(20,'Cabo Corrientes',15,1),(21,'Casimiro Castillo',15,1),(22,'CihuatlÃ¡n',15,1),(23,'ZapotlÃ¡n el Grande',15,1),(24,'Cocula',15,1),(25,'ColotlÃ¡n',15,1),(26,'ConcepciÃ³n de Buenos Aires',15,1),(27,'CuautitlÃ¡n de GarcÃ­a BarragÃ¡n',15,1),(28,'Cuautla',15,1),(29,'CuquÃ­o',15,1),(30,'Chapala',15,1),(31,'ChimaltitÃ¡n',15,1),(32,'ChiquilistlÃ¡n',15,1),(33,'Degollado',15,1),(34,'Ejutla',15,1),(35,'EncarnaciÃ³n de DÃ­az',15,1),(36,'EtzatlÃ¡n',15,1),(37,'El Grullo',15,1),(38,'Guachinango',15,1),(39,'Guadalajara',15,1),(40,'Hostotipaquillo',15,1),(41,'HuejÃºcar',15,1),(42,'Huejuquilla el Alto',15,1),(43,'La Huerta',15,1),(44,'IxtlahuacÃ¡n de los Membrillos',15,1),(45,'IxtlahuacÃ¡n del RÃ­o',15,1),(46,'JalostotitlÃ¡n',15,1),(47,'Jamay',15,1),(48,'JesÃºs MarÃ­a',15,1),(49,'JilotlÃ¡n de los Dolores',15,1),(50,'Jocotepec',15,1),(51,'JuanacatlÃ¡n',15,1),(52,'JuchitlÃ¡n',15,1),(53,'Lagos de Moreno',15,1),(54,'El LimÃ³n',15,1),(55,'Magdalena',15,1),(56,'Santa MarÃ­a del Oro',15,1),(57,'La Manzanilla de la Paz',15,1),(58,'Mascota',15,1),(59,'Mazamitla',15,1),(60,'MexticacÃ¡n',15,1),(61,'Mezquitic',15,1),(62,'MixtlÃ¡n',15,1),(63,'OcotlÃ¡n',15,1),(64,'Ojuelos de Jalisco',15,1),(65,'Pihuamo',15,1),(66,'PoncitlÃ¡n',15,1),(67,'Puerto Vallarta',15,1),(68,'Villa PurificaciÃ³n',15,1),(69,'Quitupan',15,1),(70,'El Salto',15,1),(71,'San CristÃ³bal de la Barranca',15,1),(72,'San Diego de AlejandrÃ­a',15,1),(73,'San Juan de los Lagos',15,1),(74,'San JuliÃ¡n',15,1),(75,'San Marcos',15,1),(76,'San MartÃ­n de BolaÃ±os',15,1),(77,'San MartÃ­n Hidalgo',15,1),(78,'San Miguel el Alto',15,1),(79,'GÃ³mez FarÃ­as',15,1),(80,'San SebastiÃ¡n del Oeste',15,1),(81,'Santa MarÃ­a de los Ãngeles',15,1),(82,'Sayula',15,1),(83,'Tala',15,1),(84,'Talpa de Allende',15,1),(85,'Tamazula de Gordiano',15,1),(86,'Tapalpa',15,1),(87,'TecalitlÃ¡n',15,1),(88,'TecolotlÃ¡n',15,1),(89,'Techaluta de Montenegro',15,1),(90,'TenamaxtlÃ¡n',15,1),(91,'Teocaltiche',15,1),(92,'TeocuitatlÃ¡n de Corona',15,1),(93,'TepatitlÃ¡n de Morelos',15,1),(94,'Tequila',15,1),(95,'TeuchitlÃ¡n',15,1),(96,'TizapÃ¡n el Alto',15,1),(97,'Tlajomulco de ZÃºÃ±iga',15,1),(98,'San Pedro Tlaquepaque',15,1),(99,'TolimÃ¡n',15,1),(100,'TomatlÃ¡n',15,1),(101,'TonalÃ¡',15,1),(102,'Tonaya',15,1),(103,'Tonila',15,1),(104,'Totatiche',15,1),(105,'TototlÃ¡n',15,1),(106,'Tuxcacuesco',15,1),(107,'Tuxcueca',15,1),(108,'Tuxpan',15,1),(109,'UniÃ³n de San Antonio',15,1),(110,'UniÃ³n de Tula',15,1),(111,'Valle de Guadalupe',15,1),(112,'Valle de JuÃ¡rez',15,1),(113,'San Gabriel',15,1),(114,'Villa Corona',15,1),(115,'Villa Guerrero',15,1),(116,'Villa Hidalgo',15,1),(117,'CaÃ±adas de ObregÃ³n',15,1),(118,'Yahualica de GonzÃ¡lez Gallo',15,1),(119,'Zacoalco de Torres',15,1),(120,'Zapopan',15,1),(121,'Zapotiltic',15,1),(122,'ZapotitlÃ¡n de Vadillo',15,1),(123,'ZapotlÃ¡n del Rey',15,1),(124,'Zapotlanejo',15,1),(125,'San Ignacio Cerro Gordo',15,1);
/*!40000 ALTER TABLE `general_municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_orientacion`
--

DROP TABLE IF EXISTS `general_orientacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_orientacion` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_orientacion`
--

LOCK TABLES `general_orientacion` WRITE;
/*!40000 ALTER TABLE `general_orientacion` DISABLE KEYS */;
INSERT INTO `general_orientacion` VALUES (1,'horizontal'),(2,'vertical');
/*!40000 ALTER TABLE `general_orientacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_sino`
--

DROP TABLE IF EXISTS `general_sino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_sino` (
  `id` smallint(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(5) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_sino`
--

LOCK TABLES `general_sino` WRITE;
/*!40000 ALTER TABLE `general_sino` DISABLE KEYS */;
INSERT INTO `general_sino` VALUES (0,'No'),(1,'Si');
/*!40000 ALTER TABLE `general_sino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_visible`
--

DROP TABLE IF EXISTS `general_visible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_visible` (
  `id` smallint(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(5) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_visible`
--

LOCK TABLES `general_visible` WRITE;
/*!40000 ALTER TABLE `general_visible` DISABLE KEYS */;
INSERT INTO `general_visible` VALUES (0,'No'),(1,'Si');
/*!40000 ALTER TABLE `general_visible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_estados`
--

DROP TABLE IF EXISTS `geo_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_estados` (
  `id` smallint(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_estados`
--

LOCK TABLES `geo_estados` WRITE;
/*!40000 ALTER TABLE `geo_estados` DISABLE KEYS */;
INSERT INTO `geo_estados` VALUES (1,'Aguascalientes','',1),(2,'Baja California','',1),(3,'Baja California Sur','',1),(4,'Campeche','',1),(5,'Coahuila','',1),(6,'Colima','',1),(7,'Chiapas','',1),(8,'Chihuahua','',1),(9,'Chiapas','',1),(10,'Distrito Federal','',1),(11,'Durango','',1),(12,'Guanajuato','',1),(13,'Guerrero','',1),(14,'Hidalgo','',1),(15,'Jalisco','',1),(16,'M&eacute;xico','',1),(17,'Michoac&aacute;n','',1),(18,'Morelos','',1),(19,'Nayarit','',1),(20,'Nuevo Le&oacute;n','',1),(21,'Oaxaca','',1),(22,'Puebla','',1),(23,'Quer&eacute;taro','',1),(24,'Quintana Roo','',1),(25,'San Luis Potos&iacute;','',1),(26,'Sinaloa','',1),(27,'Sonora','',1),(28,'Tabasco','',1),(29,'Tamaulipas','',1),(30,'Tlaxcala','',1),(31,'Veracruz','',1),(32,'Yucat&aacute;n','',1),(33,'Zacatecas','',1);
/*!40000 ALTER TABLE `geo_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_municipios_jal`
--

DROP TABLE IF EXISTS `geo_municipios_jal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_municipios_jal` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `estado` smallint(3) NOT NULL DEFAULT '15',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_municipios_jal`
--

LOCK TABLES `geo_municipios_jal` WRITE;
/*!40000 ALTER TABLE `geo_municipios_jal` DISABLE KEYS */;
INSERT INTO `geo_municipios_jal` VALUES (1,'Acatic',15,1),(2,'AcatlÃ¡n de JuÃ¡rez',15,1),(3,'Ahualulco de Mercado',15,1),(4,'Amacueca',15,1),(5,'AmatitÃ¡n',15,1),(6,'Ameca',15,1),(7,'San Juanito de Escobedo',15,1),(8,'Arandas',15,1),(9,'El Arenal',15,1),(10,'Atemajac de Brizuela',15,1),(11,'Atengo',15,1),(12,'Atenguillo',15,1),(13,'Atotonilco el Alto',15,1),(14,'Atoyac',15,1),(15,'AutlÃ¡n de Navarro',15,1),(16,'AyotlÃ¡n',15,1),(17,'Ayutla',15,1),(18,'La Barca',15,1),(19,'BolaÃ±os',15,1),(20,'Cabo Corrientes',15,1),(21,'Casimiro Castillo',15,1),(22,'CihuatlÃ¡n',15,1),(23,'ZapotlÃ¡n el Grande',15,1),(24,'Cocula',15,1),(25,'ColotlÃ¡n',15,1),(26,'ConcepciÃ³n de Buenos Aires',15,1),(27,'CuautitlÃ¡n de GarcÃ­a BarragÃ¡n',15,1),(28,'Cuautla',15,1),(29,'CuquÃ­o',15,1),(30,'Chapala',15,1),(31,'ChimaltitÃ¡n',15,1),(32,'ChiquilistlÃ¡n',15,1),(33,'Degollado',15,1),(34,'Ejutla',15,1),(35,'EncarnaciÃ³n de DÃ­az',15,1),(36,'EtzatlÃ¡n',15,1),(37,'El Grullo',15,1),(38,'Guachinango',15,1),(39,'Guadalajara',15,1),(40,'Hostotipaquillo',15,1),(41,'HuejÃºcar',15,1),(42,'Huejuquilla el Alto',15,1),(43,'La Huerta',15,1),(44,'IxtlahuacÃ¡n de los Membrillos',15,1),(45,'IxtlahuacÃ¡n del RÃ­o',15,1),(46,'JalostotitlÃ¡n',15,1),(47,'Jamay',15,1),(48,'JesÃºs MarÃ­a',15,1),(49,'JilotlÃ¡n de los Dolores',15,1),(50,'Jocotepec',15,1),(51,'JuanacatlÃ¡n',15,1),(52,'JuchitlÃ¡n',15,1),(53,'Lagos de Moreno',15,1),(54,'El LimÃ³n',15,1),(55,'Magdalena',15,1),(56,'Santa MarÃ­a del Oro',15,1),(57,'La Manzanilla de la Paz',15,1),(58,'Mascota',15,1),(59,'Mazamitla',15,1),(60,'MexticacÃ¡n',15,1),(61,'Mezquitic',15,1),(62,'MixtlÃ¡n',15,1),(63,'OcotlÃ¡n',15,1),(64,'Ojuelos de Jalisco',15,1),(65,'Pihuamo',15,1),(66,'PoncitlÃ¡n',15,1),(67,'Puerto Vallarta',15,1),(68,'Villa PurificaciÃ³n',15,1),(69,'Quitupan',15,1),(70,'El Salto',15,1),(71,'San CristÃ³bal de la Barranca',15,1),(72,'San Diego de AlejandrÃ­a',15,1),(73,'San Juan de los Lagos',15,1),(74,'San JuliÃ¡n',15,1),(75,'San Marcos',15,1),(76,'San MartÃ­n de BolaÃ±os',15,1),(77,'San MartÃ­n Hidalgo',15,1),(78,'San Miguel el Alto',15,1),(79,'GÃ³mez FarÃ­as',15,1),(80,'San SebastiÃ¡n del Oeste',15,1),(81,'Santa MarÃ­a de los Ãngeles',15,1),(82,'Sayula',15,1),(83,'Tala',15,1),(84,'Talpa de Allende',15,1),(85,'Tamazula de Gordiano',15,1),(86,'Tapalpa',15,1),(87,'TecalitlÃ¡n',15,1),(88,'TecolotlÃ¡n',15,1),(89,'Techaluta de Montenegro',15,1),(90,'TenamaxtlÃ¡n',15,1),(91,'Teocaltiche',15,1),(92,'TeocuitatlÃ¡n de Corona',15,1),(93,'TepatitlÃ¡n de Morelos',15,1),(94,'Tequila',15,1),(95,'TeuchitlÃ¡n',15,1),(96,'TizapÃ¡n el Alto',15,1),(97,'Tlajomulco de ZÃºÃ±iga',15,1),(98,'San Pedro Tlaquepaque',15,1),(99,'TolimÃ¡n',15,1),(100,'TomatlÃ¡n',15,1),(101,'TonalÃ¡',15,1),(102,'Tonaya',15,1),(103,'Tonila',15,1),(104,'Totatiche',15,1),(105,'TototlÃ¡n',15,1),(106,'Tuxcacuesco',15,1),(107,'Tuxcueca',15,1),(108,'Tuxpan',15,1),(109,'UniÃ³n de San Antonio',15,1),(110,'UniÃ³n de Tula',15,1),(111,'Valle de Guadalupe',15,1),(112,'Valle de JuÃ¡rez',15,1),(113,'San Gabriel',15,1),(114,'Villa Corona',15,1),(115,'Villa Guerrero',15,1),(116,'Villa Hidalgo',15,1),(117,'CaÃ±adas de ObregÃ³n',15,1),(118,'Yahualica de GonzÃ¡lez Gallo',15,1),(119,'Zacoalco de Torres',15,1),(120,'Zapopan',15,1),(121,'Zapotiltic',15,1),(122,'ZapotitlÃ¡n de Vadillo',15,1),(123,'ZapotlÃ¡n del Rey',15,1),(124,'Zapotlanejo',15,1),(125,'San Ignacio Cerro Gordo',15,1);
/*!40000 ALTER TABLE `geo_municipios_jal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeopop_consulta2`
--

DROP TABLE IF EXISTS `homeopop_consulta2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homeopop_consulta2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paciente` int(11) NOT NULL,
  `sintomas` varchar(250) NOT NULL,
  `medicamento` int(5) NOT NULL DEFAULT '0',
  `potencia` int(5) NOT NULL DEFAULT '0',
  `modo` varchar(150) DEFAULT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeopop_consulta2`
--

LOCK TABLES `homeopop_consulta2` WRITE;
/*!40000 ALTER TABLE `homeopop_consulta2` DISABLE KEYS */;
INSERT INTO `homeopop_consulta2` VALUES (1,'2013-02-24 00:36:07',2,'UNA',0,0,'','');
/*!40000 ALTER TABLE `homeopop_consulta2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeopop_directorio`
--

DROP TABLE IF EXISTS `homeopop_directorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homeopop_directorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `domicilio` varchar(250) NOT NULL,
  `poblacion` varchar(150) NOT NULL,
  `estado` varchar(150) NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `celular` varchar(30) DEFAULT NULL,
  `f_nac` date NOT NULL,
  `recomienda` varchar(250) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activated` smallint(1) NOT NULL DEFAULT '1',
  `sexo` smallint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeopop_directorio`
--

LOCK TABLES `homeopop_directorio` WRITE;
/*!40000 ALTER TABLE `homeopop_directorio` DISABLE KEYS */;
INSERT INTO `homeopop_directorio` VALUES (1,'Armida de la Vara y Porqui','Godrogro 1515','Pénjamo','Guanajuato','','56565656','33335555','1962-05-03','Juan Ortigoza','2013-02-19 18:03:12',0,2),(2,'José Zulaimán','Paseo de los pillos # 45','Acaponeta','Nayarit','zulaiman@bribon.com','555','','1937-06-22','Julio Cësar Chávez','2013-02-21 01:59:44',0,1),(3,'Lagrimita','Av. De los Payasos sin chiste #1000, colonia La perradita','Guadalajara','Jalisco','lagrima@gmail.com','','','1960-12-25','José Zulaimán','2013-02-22 03:42:08',1,1);
/*!40000 ALTER TABLE `homeopop_directorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeopop_directorio_medicos`
--

DROP TABLE IF EXISTS `homeopop_directorio_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homeopop_directorio_medicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(128) NOT NULL DEFAULT '',
  `passwd` varchar(128) DEFAULT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `address` varchar(250) NOT NULL DEFAULT '',
  `city` varchar(150) NOT NULL DEFAULT '',
  `state` varchar(150) NOT NULL DEFAULT '',
  `country` varchar(20) DEFAULT NULL,
  `zip` varchar(10) NOT NULL DEFAULT '',
  `mail` varchar(35) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `activated` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeopop_directorio_medicos`
--

LOCK TABLES `homeopop_directorio_medicos` WRITE;
/*!40000 ALTER TABLE `homeopop_directorio_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `homeopop_directorio_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeopop_medicamentos`
--

DROP TABLE IF EXISTS `homeopop_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homeopop_medicamentos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `potencia` int(3) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeopop_medicamentos`
--

LOCK TABLES `homeopop_medicamentos` WRITE;
/*!40000 ALTER TABLE `homeopop_medicamentos` DISABLE KEYS */;
INSERT INTO `homeopop_medicamentos` VALUES (0,'Ninguno',1);
/*!40000 ALTER TABLE `homeopop_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeopop_potencia`
--

DROP TABLE IF EXISTS `homeopop_potencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homeopop_potencia` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeopop_potencia`
--

LOCK TABLES `homeopop_potencia` WRITE;
/*!40000 ALTER TABLE `homeopop_potencia` DISABLE KEYS */;
INSERT INTO `homeopop_potencia` VALUES (0,'0'),(1,'6'),(2,'30'),(3,'200'),(4,'1000'),(5,'10000');
/*!40000 ALTER TABLE `homeopop_potencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_fecha`
--

DROP TABLE IF EXISTS `hotel_fecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_fecha` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `habitacion` smallint(2) NOT NULL,
  `personas` smallint(2) NOT NULL,
  `tarifa` smallint(2) DEFAULT NULL,
  `pagado` smallint(2) NOT NULL DEFAULT '1',
  `ocupacion` smallint(1) NOT NULL DEFAULT '4',
  `fecha` date DEFAULT NULL,
  `extras` decimal(19,2) NOT NULL DEFAULT '0.00',
  `visita_diaria` smallint(1) NOT NULL DEFAULT '0',
  `visita_mensual` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_fecha`
--

LOCK TABLES `hotel_fecha` WRITE;
/*!40000 ALTER TABLE `hotel_fecha` DISABLE KEYS */;
INSERT INTO `hotel_fecha` VALUES (1,101,3,8,1,4,'2013-02-12','0.00',0,0),(2,102,3,11,1,4,'2013-02-12','10.00',1,0);
/*!40000 ALTER TABLE `hotel_fecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_habitacion`
--

DROP TABLE IF EXISTS `hotel_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_habitacion` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `numero` int(3) NOT NULL,
  `tarifa_1` smallint(2) NOT NULL DEFAULT '0',
  `capacidad` smallint(2) NOT NULL,
  `tarifa_2` smallint(2) NOT NULL DEFAULT '0',
  `tarifa_3` smallint(2) NOT NULL DEFAULT '0',
  `tarifa_4` smallint(2) NOT NULL DEFAULT '0',
  `tarifa_5` smallint(2) NOT NULL DEFAULT '0',
  `tarifa_6` smallint(2) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_habitacion`
--

LOCK TABLES `hotel_habitacion` WRITE;
/*!40000 ALTER TABLE `hotel_habitacion` DISABLE KEYS */;
INSERT INTO `hotel_habitacion` VALUES (1,101,6,6,6,8,9,10,10),(2,102,4,6,4,5,7,8,8),(3,103,4,6,4,5,7,8,8),(4,104,4,6,4,5,7,8,8),(5,105,4,6,4,5,7,8,8),(6,106,4,6,4,5,7,8,8),(7,107,1,2,1,0,0,0,0),(8,108,2,3,2,3,0,0,0),(9,109,4,6,4,5,7,8,8),(10,201,6,6,6,8,9,10,10),(11,202,4,6,4,5,7,8,8),(12,203,4,6,4,5,7,8,8),(13,204,4,6,4,5,7,8,8),(14,205,4,6,4,5,7,8,8),(15,206,4,6,4,5,7,8,8),(16,207,4,6,4,5,7,8,8),(17,208,4,6,4,5,7,8,8),(18,209,2,4,2,3,4,0,0),(19,301,6,6,6,8,9,10,10),(20,302,4,6,4,5,7,8,8),(21,303,4,6,4,5,7,8,8),(22,304,4,6,4,5,7,8,8),(23,305,4,6,4,5,7,8,8),(24,306,4,6,4,5,7,8,8),(25,307,4,6,4,5,7,8,8),(26,308,4,6,4,5,7,8,8);
/*!40000 ALTER TABLE `hotel_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_moneda`
--

DROP TABLE IF EXISTS `hotel_moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_moneda` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cambio` decimal(19,2) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_moneda`
--

LOCK TABLES `hotel_moneda` WRITE;
/*!40000 ALTER TABLE `hotel_moneda` DISABLE KEYS */;
INSERT INTO `hotel_moneda` VALUES (1,'MX','1.00'),(2,'US','12.74');
/*!40000 ALTER TABLE `hotel_moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_ocupacion`
--

DROP TABLE IF EXISTS `hotel_ocupacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_ocupacion` (
  `id` smallint(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_ocupacion`
--

LOCK TABLES `hotel_ocupacion` WRITE;
/*!40000 ALTER TABLE `hotel_ocupacion` DISABLE KEYS */;
INSERT INTO `hotel_ocupacion` VALUES (1,'fisica'),(2,'programada'),(3,'reservada'),(4,'ninguna');
/*!40000 ALTER TABLE `hotel_ocupacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_pagado`
--

DROP TABLE IF EXISTS `hotel_pagado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_pagado` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_pagado`
--

LOCK TABLES `hotel_pagado` WRITE;
/*!40000 ALTER TABLE `hotel_pagado` DISABLE KEYS */;
INSERT INTO `hotel_pagado` VALUES (1,'efectivo'),(2,'credito'),(3,'debito'),(4,'reservado');
/*!40000 ALTER TABLE `hotel_pagado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_tarifa`
--

DROP TABLE IF EXISTS `hotel_tarifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_tarifa` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cantidad` decimal(19,2) NOT NULL,
  `moneda` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_tarifa`
--

LOCK TABLES `hotel_tarifa` WRITE;
/*!40000 ALTER TABLE `hotel_tarifa` DISABLE KEYS */;
INSERT INTO `hotel_tarifa` VALUES (0,'Ninguno','0.00',1),(1,'Uno','500.00',1),(2,'Dos','730.00',1),(3,'Tres','830.00',1),(4,'Cuatro','950.00',1),(5,'Cinco','1050.00',1),(6,'Seis','1100.00',1),(7,'Siete','1130.00',1),(8,'Ocho','1200.00',1),(9,'Nueve','1280.00',1),(10,'Diez','1350.00',1),(11,'Bungalow semana','385.00',2),(12,'Bungalow mes','1185.00',2),(13,'Suite semana','440.00',2),(14,'Suite mes','1350.00',2);
/*!40000 ALTER TABLE `hotel_tarifa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_content`
--

DROP TABLE IF EXISTS `language_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `subtitulo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `idioma` int(5) NOT NULL,
  `vinculo` int(11) NOT NULL,
  `contenido` text,
  `visible` smallint(1) NOT NULL DEFAULT '0',
  `secc_vincula` varchar(50) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_content`
--

LOCK TABLES `language_content` WRITE;
/*!40000 ALTER TABLE `language_content` DISABLE KEYS */;
INSERT INTO `language_content` VALUES (1,'Calappa','Sayulita · Villas','','',2,1,'<p>Es un conjunto de tres villas de lujo, ubicadas dentro del exclusivo condominio P&aacute;jaro de Fuego*, en Sayulita, Nayarit. Cada una de ellas est&aacute; equipada con aire acondicionado, televisi&oacute;n de pantalla plana en la sala de estar y en cada habitaci&oacute;n, lavavajillas, lavadora, calentador de agua, en fin. Habr&iacute;a que dar click a los botones correspondientes a las villas, para ver en lo particular qu&eacute; ofrece cada una.</p>\r\n<p>El condominio est&aacute; a menos de diez minutos de la playa, caminando; a veinte, en coche, del Aeropuerto Internacional de Puerto Vallarta; y muy pr&oacute;ximo a m&aacute;s de cinco campos de golf e innumerables restaurantes y boutiques. D&eacute; un paseo por las p&aacute;ginas de nuestro sitio, empiece ahora mismo a descubrir la Riviera Nayarit.</p>\r\n<p>&nbsp;</p>',1,''),(2,'','','En donde','fork',2,14,'',1,'gadgets_botones'),(3,'','','Pueblo','village',2,15,'',1,'gadgets_botones'),(4,'','','Servicios','wash',2,16,'',1,'gadgets_botones'),(5,'','','Me gusta','f',2,5,'',1,'gadgets_botones'),(6,'','','Danos un +','g+',2,6,'',1,'gadgets_botones'),(7,'','','Pinea algo','p',2,7,'',1,'gadgets_botones'),(8,'','','Inicio','',2,1,'',1,'gadgets_botones'),(9,'','','Villa BlueCrab','',2,2,'',1,'gadgets_botones'),(10,'','','Villa RedCrab','',2,3,'',1,'gadgets_botones'),(11,'','','Villa GreenCrab','',2,4,'',1,'gadgets_botones'),(12,'','','Disponibilidad','availability',2,11,'',1,'gadgets_botones'),(13,'','','Sayulita','palm',2,8,'',1,'gadgets_botones'),(14,'','','Alrededor','around',2,10,'',1,'gadgets_botones'),(15,'','','Campos de Golf','golf',2,17,'',1,'gadgets_botones'),(16,'','','Aeropuerto','plane',2,18,'',1,'gadgets_botones'),(17,'','','Actividades','dolphin',2,19,'',1,'gadgets_botones'),(18,'','','Contacto','contat',2,9,'',1,'gadgets_botones'),(19,'','','español','es',2,12,'',1,'gadgets_botones'),(20,'','','english','us',2,13,'',1,'gadgets_botones'),(21,'Acerca de Calappa','','','logo',2,5,'<p>Es una voz con que se distingue a un g&eacute;nero de cangrego, pertenecientes a la familia Calappidae, de donde deriva el Cangrejo Real. En la antig&uuml;edad se le relacionaba con la permanencia y la dureza, por asociaci&oacute;n con su caparaz&oacute;n. Puede ser un s&iacute;mbolo de evasi&oacute;n y contemplaci&oacute;n &mdash;locuci&oacute;n espa&ntilde;ola de: pensando en la inmortalidad del cangrejo&mdash;.</p>\r\n<p>En filosof&iacute;a, la inmortalidad del cangrejo se basa en que el cangrejo no tiene conciencia de s&iacute; mismo, y por lo tanto, tampoco tiene conciencia de que su existencia acabar&aacute;. Desde su punto de vista, y a todo efecto pr&aacute;ctico para &eacute;l mismo, el cangrejo es inmortal. Por ello, en la antig&uuml;edad, tanto al cangrejo como al escarabajo se les utiliz&oacute; para representar la inmortalidad.</p>\r\n<p>En ese sentido evasivo, hemos pensado en utilizar al cangrejo. Y concretamente a ese cangrejo rojo, que parece un ba&ntilde;ista saj&oacute;n que ha estado mucho tiempo expuesto al sol.<br />Un ba&ntilde;ista de ojos azules: un gringo. Y la idea es que, sin decirlo, el cliente se sienta invitado por alguien parecido a &eacute;l, que lo mira a los ojos sin parpadear.</p>\r\n<p>&nbsp;</p>',1,'corporativa_index'),(22,'','','Sesión','',2,20,'',1,'gadgets_botones'),(23,'','','Alojamiento','hosting',2,21,'',1,'gadgets_botones'),(24,'','','Testimonios','pen',2,22,'',1,'gadgets_botones'),(25,'','','Preguntas frecuentes','faq',2,23,'',1,'gadgets_botones');
/*!40000 ALTER TABLE `language_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_index`
--

DROP TABLE IF EXISTS `language_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_index` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_index`
--

LOCK TABLES `language_index` WRITE;
/*!40000 ALTER TABLE `language_index` DISABLE KEYS */;
INSERT INTO `language_index` VALUES (1,'english',''),(2,'español','');
/*!40000 ALTER TABLE `language_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligas_index`
--

DROP TABLE IF EXISTS `ligas_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligas_index` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `ruta` varchar(150) NOT NULL DEFAULT '',
  `contenido` text NOT NULL,
  `localidad` int(2) NOT NULL DEFAULT '0',
  `imagen` varchar(30) DEFAULT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `orden` smallint(2) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligas_index`
--

LOCK TABLES `ligas_index` WRITE;
/*!40000 ALTER TABLE `ligas_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ligas_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_index`
--

DROP TABLE IF EXISTS `mails_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `dirigido` varchar(120) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '0',
  `titulo` varchar(255) NOT NULL DEFAULT '',
  `mensaje` text,
  `tiempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `replies` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mensaje_id` (`replies`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_index`
--

LOCK TABLES `mails_index` WRITE;
/*!40000 ALTER TABLE `mails_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `mails_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_massive_confirmacion`
--

DROP TABLE IF EXISTS `mails_massive_confirmacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_massive_confirmacion` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_massive_confirmacion`
--

LOCK TABLES `mails_massive_confirmacion` WRITE;
/*!40000 ALTER TABLE `mails_massive_confirmacion` DISABLE KEYS */;
INSERT INTO `mails_massive_confirmacion` VALUES (0,'sin confirmar'),(1,'confirmado'),(2,'no va');
/*!40000 ALTER TABLE `mails_massive_confirmacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_massive_directorio`
--

DROP TABLE IF EXISTS `mails_massive_directorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_massive_directorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `grupo` smallint(1) NOT NULL DEFAULT '1',
  `telefono_celular` varchar(20) DEFAULT NULL,
  `telefono_particular` varchar(20) DEFAULT NULL,
  `telefono_trabajo` varchar(20) DEFAULT NULL,
  `invitacion` smallint(1) NOT NULL DEFAULT '1',
  `confirmacion` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_massive_directorio`
--

LOCK TABLES `mails_massive_directorio` WRITE;
/*!40000 ALTER TABLE `mails_massive_directorio` DISABLE KEYS */;
INSERT INTO `mails_massive_directorio` VALUES (1,'Ramsés Figueroa','ramses@ferbere.com',1,'3311323773','','10 86 2136',1,0),(109,'Alicia Normanda Lindá','normanda.alicia@gmail.com',1,'','','',1,0);
/*!40000 ALTER TABLE `mails_massive_directorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_massive_directorio_invi`
--

DROP TABLE IF EXISTS `mails_massive_directorio_invi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_massive_directorio_invi` (
  `id` smallint(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_massive_directorio_invi`
--

LOCK TABLES `mails_massive_directorio_invi` WRITE;
/*!40000 ALTER TABLE `mails_massive_directorio_invi` DISABLE KEYS */;
INSERT INTO `mails_massive_directorio_invi` VALUES (1,'Sólo mail'),(2,'Con estac.'),(3,'Sin estac.');
/*!40000 ALTER TABLE `mails_massive_directorio_invi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_massive_enviados`
--

DROP TABLE IF EXISTS `mails_massive_enviados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_massive_enviados` (
  `id` smallint(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(2) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_massive_enviados`
--

LOCK TABLES `mails_massive_enviados` WRITE;
/*!40000 ALTER TABLE `mails_massive_enviados` DISABLE KEYS */;
INSERT INTO `mails_massive_enviados` VALUES (0,'No'),(1,'Si');
/*!40000 ALTER TABLE `mails_massive_enviados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_massive_grupo`
--

DROP TABLE IF EXISTS `mails_massive_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_massive_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `imagen` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_massive_grupo`
--

LOCK TABLES `mails_massive_grupo` WRITE;
/*!40000 ALTER TABLE `mails_massive_grupo` DISABLE KEYS */;
INSERT INTO `mails_massive_grupo` VALUES (1,'Medios','',''),(2,'Monitoreo medios','',''),(3,'Todos','','');
/*!40000 ALTER TABLE `mails_massive_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_massive_mensajes`
--

DROP TABLE IF EXISTS `mails_massive_mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_massive_mensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `mensaje` text,
  `grupo` smallint(2) NOT NULL DEFAULT '1',
  `enviado` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_massive_mensajes`
--

LOCK TABLES `mails_massive_mensajes` WRITE;
/*!40000 ALTER TABLE `mails_massive_mensajes` DISABLE KEYS */;
INSERT INTO `mails_massive_mensajes` VALUES (2,'Completamente diferente','<p>En lo m&aacute;s rec&oacute;ndito de las Monta&ntilde;as Rocosas, un grupo de avezadas madres desaf&iacute;an al mal tiempo, la lluvia infernal y los vientos huracanados para llegar a la base secreta de la C.I.A (Centro de Inteligencia por el Amamantamiento)... Ha sido un largo periplo, pero se sienten orgullosas de si mismas porque han sido seleccionadas entre las madres m&aacute;s poseedoras de la verdad absoluta sobre la maternidad y la lactancia y por sus capacidades para \"educar\" y \"aleccionar\" a otras mujeres.</p>\r\n<p>En la base de la C.I.A. participar&aacute;n en una formaci&oacute;n experimental, el programa Ahora Sabr&aacute;s Explicar la Superioridad Omnipotente de la Realidad del Amamantamiento Supremo (m&aacute;s conocida por sus siglas ASESORAS), un entrenamiento de &eacute;lite para convertirse en la punta de lanza del nuevo programa ultrasecreto para la destrucci&oacute;n del orden mundial.</p>\r\n<p>Son apenas 15 o 20 madres, pero su misi&oacute;n ser&aacute; esparcirse y multiplicarse por el mundo, trabajando en c&eacute;lulas independientes, para implementar el programa Leche Amigable y Cooperativa para Tratar de Aleccionar y Normativizar Comportamientos Inteligentes Anteriores (LACTANCIA).</p>\r\n<p><br />El NO dejar&aacute; el mundo a nuestra<br />merced, &iexcl;&iexcl;&iexcl;Mua, ja, ja, ja!!!!<br />El objetivo final, por el que est&aacute;s mujeres llegar&iacute;an a entregar su vida, es promover la cultura de la lactancia, atrayendo madres al lado oscuro de la maternidad, haci&eacute;ndolas olvidar sus carreras profesionales y sus metas pre-maternales para convertirlas en indolentes zombies dominados por las bajas pasiones y los instintos m&aacute;s primitivos.</p>\r\n<p>&nbsp;</p>\r\n<p>Una vez conseguida la meta final y alcanzado el lavado de cerebro masivo, este ej&eacute;rcito de mujeres con la teta colgando formar&aacute;n una armada invencible que dominar&aacute; al resto de f&eacute;minas del mundo, con un mordisco brutal que trasnmitir&aacute; la infecci&oacute;n y permitir&aacute; el establecimiento de la cultura patriarcal m&aacute;s absoluta, subyugadora y asfixiante... Tambi&eacute;n denominada en clave secreta el Imperio o el Reverso Tenebroso.</p>\r\n<p>En la sesi&oacute;n de entrenamiento sobre Fingimiento de Inocencia Altruista (FIA) se puede escuchar la siguiente conversaci&oacute;n:<br />- Entrenador: &iquest;C&oacute;mo convencer&eacute;is a las mujeres para ponerse de vuestro lado?<br />- Amina: Yo les contar&iacute;a que los consejos que damos sobre lactancia est&aacute;n basados en la evidencia cient&iacute;fica.<br />- Entrenador (furioso): Eso no es suficiente, la evidencia cient&iacute;fica no llega a la parte m&aacute;s profunda del cerebro y se queda en lo superficial.<br />- Cristina: Pondr&iacute;a de relieve que no solo hablo por mi experiencia como madre, sino que me he formado sobre lactancia materna.<br />- Entrenador: &iexcl;&iexcl;&iexcl;No vale!!! Si quisieran formaci&oacute;n y t&iacute;tulo se ir&iacute;an a ver a sus pediatras y enfermeras.<br />- Cleo: Argumentar&iacute;a que cada madre tiene que seguir sus propios objetivos y adecuar su lactancia y maternidad a lo que ella realmente quiere y no a lo que imponen los dem&aacute;s.<br />- Entrenador: &iexcl;&iexcl;&iexcl;Ni se te ocurra!!! Nada m&aacute;s lejos de nuestro plan secreto que empoderar a las mujeres, queremos educarlas y aleccionarlas para que no se planteen nada y solo sigan nuestra verdad absoluta.<br />- Elo&iacute;sa: Yo har&iacute;a una competici&oacute;n para descubrir que madre tiene m&aacute;s Teta-Puntos y para poner de relieve lo mal que lo hacen las dem&aacute;s y lo que les queda por mejorar para descubrir la aut&eacute;ntica verdad.<br />- Entrenador: &iexcl;&iexcl;&iexcl;&iexcl;&iexcl;Ouuuuuu Yeaaaaa!!! Eso es. No queremos mujeres empoderadas, no queremos convencer por la evidencia, no queremos que las madres conf&iacute;en en su propio criterio a la hora de criar a sus hijos. &iexcl;&iexcl;&iexcl;Queremos esclavas que nos sigan ciegamente en la batalla final por la conquista del Nuevo Orden (NO)!!!! &iexcl;&iexcl;&iexcl;&iexcl;Mua, ja, ja, ja, ja!!!!!</p>\r\n<p>En la sesi&oacute;n de Planificaci&oacute;n Estrat&eacute;gica del Calendario de Hostilidades Ocultas (asignatura tambi&eacute;n conocida como PECHO), las nuevas guerreras aprenden estrategias de hostigamiento para que ninguna mujer escape de sus redes:</p>\r\n<p>- Entrenador: Ya hemos hablado de la tapadera (y la agenda real &iexcl;&iexcl;&iexcl;&iexcl;Mua, ja, ja, ja, ja!!!!!) de los grupos de lactancia y grupos de madres, ahora debatiremos sobre otras herramientas a nuestro alcance para preparar el terreno al NO.<br />- Fran&ccedil;oise: &iquest;Al No? Mi no comprendo.<br />- Entrenador: Ayyy, que llevamos aqu&iacute; un mes y no te enter&aacute;s... para preparar el terreno al Nuevo Orden, el &iexcl;&iexcl;&iexcl;NO!!! &iexcl;&iexcl;&iexcl;&iexcl;Mua, ja, ja, ja, ja!!!!!<br />- Fabiana: &iquest;Podemos colaborar con los centros de salud y hospitales cercanos para que nos deriven a las madres con problemas?<br />- Entrenador: A priori ese tipo de t&aacute;cticas podr&iacute;an funcionar, pero la verdadera fuerza de nuestras c&eacute;lulas de ASESORAS de LACTANCIA consiste en ese look de \"outsiders\" y luchadoras contra el sistema. Suele funcionar mucho mejor poner verdes a pediatras, ginec&oacute;logos y matronas y seleccionar a unos pocos profesionales de referencia a los que enviar a las mujeres sabiendo que ya est&aacute;n de nuestro lado &iexcl;&iexcl;&iexcl;&iexcl;Mua, ja, ja, ja, ja!!!!!<br />- Susana: &iquest;Y si nos abrimos un blog?<br />- Entrenador: Esa es una Acci&oacute;n Estrat&eacute;gica del PECHO de m&aacute;xima prioridad. Un blog ofrece una tribuna desde la que arengar a las masas y ofrecerles nuestras p&iacute;ldoras de verdad absoluta que se habr&aacute;n de tragar sin ning&uacute;n tipo de criterio y consideraci&oacute;n. Os convertir&eacute;is en gur&uacute;s y en madres blogueras iluminadas, impartiendo sabidur&iacute;a y conminando a las madres a hacer tribu, lo que las acercar&aacute; m&aacute;s todav&iacute;a a nuestras filas. &iexcl;&iexcl;&iexcl;&iexcl;Mua, ja, ja, ja, ja!!!!!<br />- Anna: &iquest;Tambi&eacute;n tenemos que imitar la risa mal&eacute;fica cuando hablemos con otras madres?<br />- Entrenador: &iexcl;&iexcl;&iexcl;Otra que no se entera ni del NODO!!! Ainssssss.</p>\r\n<p>&nbsp;</p>',1,0);
/*!40000 ALTER TABLE `mails_massive_mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_massive_phone`
--

DROP TABLE IF EXISTS `mails_massive_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_massive_phone` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `numero` varchar(20) NOT NULL,
  `vincula` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_massive_phone`
--

LOCK TABLES `mails_massive_phone` WRITE;
/*!40000 ALTER TABLE `mails_massive_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `mails_massive_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_massive_relacion`
--

DROP TABLE IF EXISTS `mails_massive_relacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_massive_relacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje_id` int(11) NOT NULL,
  `directorio_id` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_massive_relacion`
--

LOCK TABLES `mails_massive_relacion` WRITE;
/*!40000 ALTER TABLE `mails_massive_relacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mails_massive_relacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_status`
--

DROP TABLE IF EXISTS `mails_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_status` (
  `id` smallint(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_status`
--

LOCK TABLES `mails_status` WRITE;
/*!40000 ALTER TABLE `mails_status` DISABLE KEYS */;
INSERT INTO `mails_status` VALUES (0,'nuevo'),(1,'le&iacute;do');
/*!40000 ALTER TABLE `mails_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_botones`
--

DROP TABLE IF EXISTS `menus_botones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus_botones` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `posicion` int(1) NOT NULL DEFAULT '0',
  `imagen` varchar(20) NOT NULL DEFAULT '',
  `ruta` text NOT NULL,
  `privilegios` smallint(1) NOT NULL DEFAULT '2',
  `submenu` smallint(1) NOT NULL DEFAULT '0',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_botones`
--

LOCK TABLES `menus_botones` WRITE;
/*!40000 ALTER TABLE `menus_botones` DISABLE KEYS */;
INSERT INTO `menus_botones` VALUES (1,'inicio',7,'','index.php',16,1,1),(3,'contacto',7,'','contacto.php',16,1,1),(2,'trayectoria',7,'','perfil.php',16,1,1),(4,'Camello',7,'camel','camello.php',8,1,1);
/*!40000 ALTER TABLE `menus_botones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_posicion`
--

DROP TABLE IF EXISTS `menus_posicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus_posicion` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_posicion`
--

LOCK TABLES `menus_posicion` WRITE;
/*!40000 ALTER TABLE `menus_posicion` DISABLE KEYS */;
INSERT INTO `menus_posicion` VALUES (1,'Ninguno',''),(1,'Central',''),(2,'Izq. Superior',''),(3,'Der. Superior',''),(4,'Izq. Inferior',''),(5,'Der. Inferior',''),(6,'Inferior',''),(7,'Superior','');
/*!40000 ALTER TABLE `menus_posicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_submenu`
--

DROP TABLE IF EXISTS `menus_submenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus_submenu` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `vin` int(3) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_submenu`
--

LOCK TABLES `menus_submenu` WRITE;
/*!40000 ALTER TABLE `menus_submenu` DISABLE KEYS */;
INSERT INTO `menus_submenu` VALUES (1,'Ninguno',0);
/*!40000 ALTER TABLE `menus_submenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias_categoria`
--

DROP TABLE IF EXISTS `noticias_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias_categoria` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias_categoria`
--

LOCK TABLES `noticias_categoria` WRITE;
/*!40000 ALTER TABLE `noticias_categoria` DISABLE KEYS */;
INSERT INTO `noticias_categoria` VALUES (1,'Default','');
/*!40000 ALTER TABLE `noticias_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias_index`
--

DROP TABLE IF EXISTS `noticias_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias_index` (
  `id` bigint(7) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `subtitulo` varchar(50) NOT NULL DEFAULT '',
  `contenido` text NOT NULL,
  `publicado` smallint(1) NOT NULL DEFAULT '0',
  `fecha` date DEFAULT NULL,
  `imagen` varchar(50) NOT NULL DEFAULT '',
  `orden` int(2) NOT NULL DEFAULT '0',
  `categoria` int(3) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias_index`
--

LOCK TABLES `noticias_index` WRITE;
/*!40000 ALTER TABLE `noticias_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patrocinador_index`
--

DROP TABLE IF EXISTS `patrocinador_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patrocinador_index` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `ruta` varchar(150) NOT NULL DEFAULT '',
  `contenido` text NOT NULL,
  `localidad` int(2) NOT NULL DEFAULT '0',
  `imagen` varchar(30) DEFAULT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `orden` smallint(2) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrocinador_index`
--

LOCK TABLES `patrocinador_index` WRITE;
/*!40000 ALTER TABLE `patrocinador_index` DISABLE KEYS */;
INSERT INTO `patrocinador_index` VALUES (1,'Novartis','http://www.novartis.com.mx/10ybrand/NOVARTIS_WEB_2009/Soft_Templates/index.html','																		',0,'novartis.jpg',1,1),(2,'Probiomed','http://www.probiomed.com.mx/info.php?Lang=es','										',0,'probiomed.jpg',1,2),(3,'GENZYME','http://www.genzyme.com.mx/corp/mxgenz/gzla_p_ci_mx.asp','										',0,'genzyme.jpg',1,5),(4,'Boehringer','http://www.boehringer-ingelheim.com.mx/','										',0,'boehringer.jpg',1,4),(5,'UCB','http://www.ucb.com/worldwide/mexico','															',0,'ucb.jpg',1,3),(6,'Psicopharma','http://www.lokarri.com.mx/portfolio/laboratorios-psicopharma/','										',0,'psicopharma.jpg',1,7),(7,'Behring','http://www.cslbehring.com.mx/homepage','										',0,'behring.jpg',1,6),(8,'Merz Pharma','http://www.merz.com.mx/','										',0,'merz.jpg',0,NULL),(9,'ABBOTT','http://www.abbott.com/global/url/content/en_US/10.40.270:270/general_content/Global_Location_Profile_0055.htm','										',0,'abbott.jpg',1,8),(10,'Lundbeck','http://www.lundbeck.com/mx','															',0,'lundbeck.jpg',1,9),(11,'Comercializadora Electromed','http://www.annimss.org','					',0,'electromed.jpg',1,10),(12,'Cenarem','http://cenarem.com.mx/','					',0,'cenarem.jpg',1,11);
/*!40000 ALTER TABLE `patrocinador_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_asigna_boton`
--

DROP TABLE IF EXISTS `perfil_asigna_boton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_asigna_boton` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `diputado` int(3) NOT NULL,
  `boton_social` int(3) NOT NULL,
  `cuenta` varchar(50) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_asigna_boton`
--

LOCK TABLES `perfil_asigna_boton` WRITE;
/*!40000 ALTER TABLE `perfil_asigna_boton` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil_asigna_boton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_asigna_comisiones`
--

DROP TABLE IF EXISTS `perfil_asigna_comisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_asigna_comisiones` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `diputado` int(3) NOT NULL,
  `comision` int(3) NOT NULL,
  `preside` smallint(1) DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_asigna_comisiones`
--

LOCK TABLES `perfil_asigna_comisiones` WRITE;
/*!40000 ALTER TABLE `perfil_asigna_comisiones` DISABLE KEYS */;
INSERT INTO `perfil_asigna_comisiones` VALUES (1,1,1,0),(2,1,2,0),(3,1,3,0),(4,1,4,0),(5,1,5,0),(6,1,6,0),(7,1,7,0),(8,1,11,1),(9,2,5,1),(10,2,8,0),(11,2,9,0),(12,2,10,0),(13,2,11,0),(14,2,12,0),(15,2,13,0),(16,2,14,0),(17,3,4,1),(18,3,15,0),(19,3,1,0),(20,3,16,0),(21,3,10,0),(22,3,17,0),(23,3,20,0),(24,3,18,1),(25,3,19,0),(26,4,21,1),(27,4,22,1),(28,4,23,0),(29,4,24,0),(30,4,6,0),(31,4,7,0),(32,5,9,1),(33,5,16,0),(34,5,25,0),(35,5,4,0),(36,5,26,0),(37,5,27,0),(38,5,28,0),(39,6,6,1),(40,6,24,0),(41,6,29,1),(42,6,28,0),(43,7,2,1),(44,7,30,0),(45,7,3,0),(46,7,8,0),(47,7,6,0),(48,8,1,1),(49,8,31,0),(50,8,3,0),(51,8,4,0),(52,8,32,0),(53,9,33,1),(54,9,31,0),(55,9,9,0),(56,9,11,0),(57,9,34,0),(58,9,35,0),(59,9,7,0),(60,9,27,0),(61,10,36,1),(62,10,4,0),(63,10,34,0),(64,10,6,0),(65,10,7,0),(66,10,28,0),(67,11,7,1),(68,11,10,0),(69,11,24,0),(70,11,34,0),(71,11,6,0),(72,11,36,0),(73,11,27,0),(74,12,27,1),(75,12,25,0),(76,12,37,0),(77,12,11,0),(78,12,38,0),(79,12,7,0),(80,12,14,0),(81,13,16,1),(82,13,4,0),(83,13,5,0),(84,13,36,0),(85,13,14,0),(86,13,39,0);
/*!40000 ALTER TABLE `perfil_asigna_comisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_asigna_iniciativa`
--

DROP TABLE IF EXISTS `perfil_asigna_iniciativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_asigna_iniciativa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `diputado` int(3) NOT NULL,
  `iniciativa` int(5) NOT NULL,
  `suscribe` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_asigna_iniciativa`
--

LOCK TABLES `perfil_asigna_iniciativa` WRITE;
/*!40000 ALTER TABLE `perfil_asigna_iniciativa` DISABLE KEYS */;
INSERT INTO `perfil_asigna_iniciativa` VALUES (83,14,5,1),(2,7,3,1),(3,7,4,1),(82,14,1,1),(5,7,2,1),(6,2,6,1),(7,2,7,1),(8,2,8,1),(103,14,25,1),(10,9,10,1),(11,9,11,1),(84,3,81,1),(13,4,13,1),(14,4,14,1),(15,14,15,1),(16,4,16,1),(17,4,17,1),(18,4,18,1),(19,6,19,1),(20,6,20,1),(21,6,21,1),(22,6,22,1),(23,6,23,1),(24,6,24,1),(104,11,94,1),(26,13,26,1),(27,13,27,1),(28,13,28,1),(29,13,29,1),(30,13,30,1),(31,13,31,1),(32,13,32,1),(33,13,33,1),(34,13,34,1),(35,13,35,1),(36,13,36,1),(37,13,37,1),(38,13,38,1),(39,13,39,1),(40,13,40,1),(41,5,41,1),(42,5,42,1),(43,5,43,1),(44,5,44,1),(45,5,45,1),(46,5,46,1),(47,5,47,1),(48,5,48,1),(49,5,49,1),(50,5,50,1),(51,12,51,1),(52,12,52,1),(53,11,53,1),(54,11,54,1),(55,11,55,1),(56,11,56,1),(57,8,57,1),(58,8,58,1),(59,1,59,1),(60,1,60,1),(61,1,61,1),(62,10,62,1),(63,10,63,1),(64,10,64,1),(65,10,65,1),(66,10,66,1),(67,10,67,1),(68,10,68,1),(69,10,69,1),(70,10,70,1),(71,3,71,1),(72,8,72,1),(73,8,73,1),(74,8,74,1),(75,8,75,1),(76,1,76,1),(77,8,77,1),(78,8,78,1),(79,4,78,1),(80,8,79,1),(81,8,80,1),(85,3,82,1),(86,3,83,1),(87,3,84,1),(88,3,85,1),(89,3,86,1),(90,3,87,1),(91,3,88,1),(92,3,89,1),(93,3,90,1),(94,3,91,1),(95,3,92,1),(96,8,76,1),(97,9,76,1),(98,7,76,1),(99,4,76,1),(100,12,76,1),(101,13,76,1),(102,14,9,1),(105,11,95,1),(107,6,96,1),(109,4,97,1),(110,8,98,1),(111,8,99,1),(112,7,99,0),(113,4,99,0),(114,10,99,0),(115,12,99,0),(116,2,99,0),(117,9,100,1),(118,4,101,1),(119,9,101,0),(120,3,102,1),(121,8,103,1),(122,11,104,1),(123,12,105,1),(124,13,106,1),(125,14,107,0),(126,14,108,0),(127,4,109,1),(128,12,110,1),(129,14,111,1),(130,4,112,1),(131,2,112,1),(132,5,113,1),(133,12,114,1),(134,4,115,1),(135,1,116,1),(136,10,117,1),(137,11,118,1),(138,12,119,1),(139,3,120,1),(140,5,121,1),(141,5,122,1);
/*!40000 ALTER TABLE `perfil_asigna_iniciativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_boton_social`
--

DROP TABLE IF EXISTS `perfil_boton_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_boton_social` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_boton_social`
--

LOCK TABLES `perfil_boton_social` WRITE;
/*!40000 ALTER TABLE `perfil_boton_social` DISABLE KEYS */;
INSERT INTO `perfil_boton_social` VALUES (1,'twitter'),(2,'facebook'),(3,'youtube'),(4,'email'),(5,'instagram');
/*!40000 ALTER TABLE `perfil_boton_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_categoria`
--

DROP TABLE IF EXISTS `perfil_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_categoria` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(30) DEFAULT NULL,
  `belong` smallint(2) NOT NULL DEFAULT '0',
  `subelong` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_categoria`
--

LOCK TABLES `perfil_categoria` WRITE;
/*!40000 ALTER TABLE `perfil_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_comisiones`
--

DROP TABLE IF EXISTS `perfil_comisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_comisiones` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_comisiones`
--

LOCK TABLES `perfil_comisiones` WRITE;
/*!40000 ALTER TABLE `perfil_comisiones` DISABLE KEYS */;
INSERT INTO `perfil_comisiones` VALUES (0,'ninguna'),(1,'Ciencia y tecnología'),(2,'Desarrollo agrícola'),(3,'Desarrollo humano'),(4,'Educación'),(5,'Higiene y salud pública'),(6,'Puntos constitucionales, estudios legislativos y reglamentos'),(7,'Responsabilidades'),(8,'Asuntos electorales'),(9,'Desarrollo forestal'),(10,'Desarrollo urbano'),(11,'Ganadería'),(12,'Juventud y deporte'),(13,'Trabajo y previsión social'),(14,'Vigilancia'),(15,'Administración'),(16,'Desarrollo económico'),(17,'Planeación para el desarrollo'),(18,'Comisión especial para la revisión financiera y administrativa del Congreso'),(19,'Comité de adquisiciones'),(20,'Comité de planeación'),(21,'Comité de biblioteca, archivo y editorial'),(22,'Comité de proceso legislativo'),(23,'Asuntos metropolitanos'),(24,'Hacienda y presupuesto'),(25,'Desarrollo municipal'),(26,'Medio ambiente y desarrollo sustentable'),(27,'Seguridad pública y protección civil'),(28,'Vialidad, transporte y comunicaciones'),(29,'Comité de clasificación de información pública'),(30,'Asuntos migratorios'),(31,'Derechos humanos'),(32,'Turismo'),(33,'Comité de peticiones y atención ciudadana'),(34,'Justicia'),(35,'Participación ciudadana y acceso a la información pública'),(36,'Readaptación social'),(37,'Desarrollo regional'),(38,'Gobernación'),(39,'Comité de relaciones interparlamentarias y asuntos internacionales');
/*!40000 ALTER TABLE `perfil_comisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_index`
--

DROP TABLE IF EXISTS `perfil_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_index` (
  `id` bigint(7) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `descripcion` text,
  `imagen` varchar(100) NOT NULL DEFAULT 'sin_titulo',
  `nacido` varchar(150) NOT NULL,
  `categoria` int(3) NOT NULL DEFAULT '0',
  `visible` smallint(1) NOT NULL DEFAULT '1',
  `ext` smallint(2) NOT NULL DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `sala` varchar(100) DEFAULT NULL,
  `telefonos` varchar(100) DEFAULT NULL,
  `enlace` text,
  `orden` smallint(2) DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_index`
--

LOCK TABLES `perfil_index` WRITE;
/*!40000 ALTER TABLE `perfil_index` DISABLE KEYS */;
INSERT INTO `perfil_index` VALUES (0,'ninguno',NULL,'sin_titulo','',0,1,0,NULL,NULL,NULL,NULL,0),(4,'Tom Major','<p>Origini</p>\r\n<p>Originario di Bettola, un paesino in provincia di Piacenza (Emilia Romagna), Pier Luigi Bersani, nato il 29 settembre del 1951, viene da una famiglia di relativamente umili origini (suo padre &egrave; stato un meccanico e benzinaio). Dopo la scuola dellobbligo, Bersani decide di intraprendere i propri studi universitari presso lUniversit&agrave; di Bologna, dove si &egrave; laureato in filosofia (con una tesi dedicata al Papa Gregorio I). Dopo una breve esperienza lavorativa come insegnante di scuola, Bersani intraprende la carriera politica e amministrativa che ne distinguer&agrave; la vita professionale.Bersani a Bologna</p>\r\n<p>Linizio della carriera politica / affiliazioni politiche</p>\r\n<p>Bersani passa dal partito comunista Italiano al partito democratico di sinistra, diventando un membro della segreteria nazionale del partito dei democratici di sinistra (responsabile, tra le altre cose, del settore economico e finanziario del partito). Unaltra mansione di rilievo ricoperta da Bersani &egrave; il suo ruolo nellamministrazione regionale dellEmilia Romagna, dove ha coperto cariche di rilievo fino al 1996.</p>\r\n<p>Bersani verso il parlamento Europeo</p>\r\n<p>Dopo il ruolo ricoperto in qualit&agrave; di ministro dellindustria, del commercio e dellartigianato dal 1996 al 1999, Bersani passa successivamente al ministero dei trasporti (al centro-sinistra con Prodi, DAlema e Amato).</p>\r\n<p>Bersani diventa successivamente parlamentare Europeo nel 2004, rappresentando la regione nord-ovest del partito dei democratici di sinistra, e divenendo parte del comitato degli affari economici e monetari, nonch&eacute; del comitato per il mercato interno e la protezione dei consumatori.</p>\r\n<p>Bersani &egrave; anche stato membro della delegazione Europea per relazioni estere con paesi come Kazakhstan, Kyrgyzstan, Uzbekistan, Tajikistan, Turkmenistan, Mongolia e Bielorussia.</p>\r\n<p><br /> <br />Il ruolo durante il secondo governo Prodi.</p>\r\n<p>Bersani abbandona il lavoro nel parlamento Europeo in seguito alla rielezione alla camera dei deputati nel 2006, periodo in cui ricopre il ruolo di ministro delleconomia durante il governo del primo ministro Romano Prodi. In qualit&agrave; di ministro delleconomia e dello sviluppo, Pier Luigi Bersani ha il compito di introdurre le riforme necessarie per raggiungere una maggiore liberalizzazione del mercato e della concorrenza. In qualit&agrave; di ministro, Bersani ha risposto a queste esigenze con il  Decreto Legge 223 del 30 giugno 2006, successivamente convertito nella legge 248/2006, comunemente nota come \"decreto Bersani 1&Prime;. Questa regolazione &egrave; mirata principalmente a professionisti come i conducenti di taxi e farmacisti, anche se altri settori sono coinvolti.</p>\r\n<p>I decreti Bersani: Verso una maggiore liberalizzazione del mercato e della concorrenza</p>\r\n<p>In qualit&agrave; di ministro delleconomia e dello sviluppo, Pier Luigi Bersani ha il compito di introdurre le riforme necessarie per raggiungere una maggiore liberalizzazione del mercato e della concorrenza. In qualit&agrave; di ministro, Bersani ha risposto a queste esigenze con il  Decreto Legge 223 del 30 giugno 2006, successivamente convertito nella legge 248/2006, comunemente nota come \"decreto Bersani 1&Prime;. Questa regolazione &egrave; mirata principalmente a professionisti come i conducenti di taxi e farmacisti, anche se altri settori sono coinvolti.</p>\r\n<p>La politica di governo della concorrenza e della liberalizzazione non si fermer&agrave; al primo decreto Bersani, che viene &egrave; stato seguito dal secondo decreto Bersani attuato nel gennaio 2007, convertito nella legge 40 del 2 aprile 2007).</p>\r\n<p>A questi due decreti seguono successivamente una serie di distinte per la liberalizzazione delle professioni e di trasmissioni televisive, i servizi pubblici locali, e lenergia, nonch&eacute; la riduzione e la semplificazione delle procedure e tempistiche per lavvio di nuove imprese. Un altro progetto di legge propone di razionalizzare le competenze delle autorit&agrave; di regolamentazione, di modificare e potenziare le loro competenze, soprattutto in materia di concorrenza. Ancora un altro progetto di legge avrebbe leffetto di introdurre e disciplinare le procedure giudiziarie per azioni legali collettive. Il 25 ottobre 2009, Bersani prevale sugli \"avversari\"  Dario Franceschini e Ignazio Marino, alle elezioni per la leadership del partito democratico, diventando cos&igrave; il principale leader dellopposizione, con un punteggio di preferenza pari al 55,1 % tra tutti i membri del partito. Dal 7 novembre 2009, come deciso dallAssemblea Nazionale, Pier Luigi Bersani ricopre in maniera ufficiale l incarico di segretario del Partito Democratico in Italia, dopo aver sconfitto il sindaco di Firenze Matteo Renzi nel 2013 elezioni primarie.</p>\r\n<p>La situazione attuale</p>\r\n<p>Prima delle elezioni del 2013, Il partito democratico &egrave; rimasto in testa in termini di preferenze, ma il partito di Bersani &egrave; cresciuto di circa il 40% solo allinizio dellanno, a differenza del ex centro destra di Silvio Berlusconi, sceso intorno al 25%</p>\r\n<p>Nel marzo del 2013, il presidente della repubblica Italiana Giorgio Napolitano h chiesto a Bersani di formare un nuovo governo, ma Bersani non &egrave; riuscito a trovare un accordo per la formazione di un nuovo governo italiano includendo rete influenti come la nuova realt&agrave; politica nazionale del Movimento Cinque Stelle (nato per iniziativa dellex comico Beppe Grillo). Data la situazione di stallo del governo, Bersani ha annunciato il ritiro dal proprio ruolo nel partito democratico dopo il fallimento di Romano Prodi nellassicurarsi una maggioranza parlamentale per le elezioni governative</p>\r\n<p>&nbsp;</p>','mitin1.jpg','Bettola, Piacenza, Italia. 29 de septiembre de 1951',4,1,1,'majortom@groundcontrol.com','Major Tom Room','555 55 5667','<p>Rizzoli 8, 20132 Milano, Italia</p>',5);
/*!40000 ALTER TABLE `perfil_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_iniciativa`
--

DROP TABLE IF EXISTS `perfil_iniciativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_iniciativa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `texto` longtext,
  `nombre` varchar(250) NOT NULL,
  `categoria` smallint(1) NOT NULL DEFAULT '0',
  `visible` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_iniciativa`
--

LOCK TABLES `perfil_iniciativa` WRITE;
/*!40000 ALTER TABLE `perfil_iniciativa` DISABLE KEYS */;
INSERT INTO `perfil_iniciativa` VALUES (1,'<p>Controlla la tua bici regolarmente (soprattutto se &egrave; un po &nbsp;\"vissuta\"!) e assicurati che pneumatici, freni e catena siano in perfetto stato. Per verificare se hai le gomme bucate vale la vecchia, cara prova della tinozza d acqua: se la gomma \"fa le bolle\" significa che &egrave; da riparare o sostituire. Controlla che la bici sia tarata sul tuo peso e sulla tua altezza: una volta seduto devi toccare il suolo con la punta dei piedi.</p>','Controlla la tua bici regolarmente.',1,1),(2,'<p>Prima di partire dai un occhiata al tuo abbigliamento. Tacchi e infradito possono rivelarsi pericolosi durante la pedalata, cos&igrave; come gli orli troppo lunghi dei pantaloni (per questo esistono delle clip create apposta). Assicurati di non avere cinture o cappotti che possano infilarsi nella ruota mentre sei in movimento e, soprattutto se ti sposti di sera, renditi visibile: il giubbotto catarifrangente &egrave; d obbligo nelle gallerie urbane e sulle strade extraurbane dopo il tramonto, ma al buio si rivela molto utile anche in citt&agrave;. Se non l hai ancora fatto, monta delle luci anteriori e posteriori. Soprattutto: indossa un casco, della taglia giusta e calzato correttamente.</p>','Prima di partire dai un occhiata al tuo abbigliamento.',1,1),(3,'<p>Occupa il posto che ti spetta sulla strada e non rifugiarti sul margine destro se l asfalto &egrave; dissestato.</p>','Occupa il posto che ti spetta sulla strada e non rifugiarti sul margine destro se l asfalto è dissestato.',1,1),(4,'<p>Comunica in anticipo le tue intenzioni sugli spostamenti utilizzando le braccia. Prima di spostarti a destra o a sinistra controlla sempre dietro alla tua spalla se ci sono veicoli in avvicinamento. Compi le svolte pi&ugrave; difficili in due tempi, aspettando il verde al semaforo.</p>','Comunica in anticipo le tue intenzioni sugli spostamenti utilizzando le braccia.',1,1),(5,'<p>Niente cuffie nelle orecchie o auricolare del cellulare. Devi rimanere concentrato e tendere bene l orecchio ai rumori della strada (l accelerazione di un auto, la sirena di un ambulanza), e la musica non lo permette.</p>','Niente cuffie nelle orecchie o auricolare del cellulare.',1,1),(6,'<p>L apertura improvvisa delle portiere dei veicoli parcheggiati o dei taxi in sosta &egrave; una delle insidie pi&ugrave; pericolose per i ciclisti, che rischiano di essere urtati e scaraventati a terra. Tieniti sempre a debita distanza dalle auto ferme sul ciglio della strada.</p>','Tieniti sempre a debita distanza dalle auto ferme sul ciglio della strada.',1,1),(7,'<p>Conosci e rispetta la segnaletica stradale. Fermati ai semafori e non andare contro mano.</p>','Conosci e rispetta la segnaletica stradale.',1,1),(8,'<p>Cerca di prevenire le intenzioni degli altri guidatori stabilendo con loro un contatto visivo.</p>','Stabilendo con loro un contatto visivo.',1,1),(9,'<p>Attenzione a buche e rotaie. Cerca di evitare le prime e per attraversare le seconde assicurati di mettere le ruote di sbieco.</p>','Attenzione a buche e rotaie.',1,1),(10,'<p>Hai il campanello, usalo per segnalare il tuo arrivo ai pedoni. Evita di salire sui marciapiedi e, se proprio devi, porta la bici a mano.</p>','Usa il campanello.',1,1),(11,'<p>il principio &egrave; non euroscetticismo, ma pi&ugrave; Europa. Accelerare l integrazione politica, economica e fiscale; coordinare le politiche economiche e fiscali tramite nuove istituzioni comuni, dotate di legittimazione popolare e diretta. Una nuova architettura istituzionale della Eurozona, per raggiungere la quale &egrave; necessaria una collaborazione con le forze del centro liberale.</p>','Accelerare la integrazione politica, economica e fiscale.',2,1),(12,'<p>Difesa del principio di legalit&agrave;, lotta decisa alla evasione fiscale, contrasto severo dei reati contro l ambiente, rafforzamento normativa contro la corruzione. Riformulare il federalismo, per fare delle autonomie un punto di forza del Paese. Norme stringenti su conflitto di interessi, antitrust e libert&agrave; della informazione. Ridurre i costi della politica e la sua invadenza.</p>','Difesa del principio di legalità.',2,1),(13,'<p>Rimettere al centro la dignit&agrave; del lavoratore. Ridisegno profondo del sistema fiscale, per alleggerire il carico su lavoro e impresa; contrastare la precariet&agrave;; aiuti alle imprese per competere su qualit&agrave; e innovazione; politiche fiscali per sostenere la occupazione femminile.</p>','Rimettere al centro la dignità del lavoratore.',2,1),(14,'<p>Rimettere il Mezzogiorno al centro dell Agenda; combattere sprechi e inefficienze con una nuova strategia nazionale; correggere le storture di vecchi localismi clientelari. Giustizia civile e penale al servizio del cittadino.</p>','Rimettere il Mezzogiorno al centro dell Agenda.',2,1),(15,'<p>Misure pi&ugrave; incisive di valorizzazione del merito. Superare gli aspetti pi&ugrave; insostenibili della legge sulla procreazione assistita e garantire piena applicazione di quella sull aborto.</p>','Misure più incisive di valorizzazione del merito.',2,1),(16,'<p>Avviare riqualificazione e rigore della spesa per l istruzione, avendo come riferimento il grado di preparazione degli studenti e il reggiungimento degli obiettivi formativi. Piano contro la dispersione scolastica; investimento sulla ricerca avanzata nei settori trainanti e pi&ugrave; innovativi.</p>','Avviare riqualificazione e rigore della spesa per l istruzione.',2,1),(17,'<p>Politica industriale integralmente ecologica; indirizzare il sistema produttivo verso mobilit&agrave; sostenibile, risparmio ed efficienza energetica, beni culturali e storici, agenda digitale.</p>','Sviluppo sostenibile.',2,1),(18,'<p>Energia, patrimonio culturale e paesaggistico, servizi di welfare e formazione, sono beni che vanno regolati. Introdurre normative per definire la gestione pubblica o i compiti delle autorit&agrave; di controllo sulle finalit&agrave; pubbliche di questi servizi.</p>','Beni comuni.',2,1),(19,'<p>Valorizzare il principio costituzionale della laicit&agrave; dello Stato; norma che concede la cittadinanza italiana a chiunque sia nato e cresciuto in Italia; riconoscimento giuridico delle coppie omosessuali.</p>','Valorizzare il principio costituzionale della laicità dello Stato.',2,1),(20,'<p>Impegno delle forze di coalizione a sostenere lealmente e per tutto la arco della legislatura il premier scelto dalle primarie; affidare al premier la composizione di un governo snello, sottratto a logiche di spartizione e ispirato a criteri di competenza, rinnovamento e credibilit&agrave;; assicurare lealt&agrave; a impegni internazionali; sostenere il governo nella difesa della moneta unica e verso la creazione di un governo politico-economico federale della eurozona.</p>','Un governo snello, sottratto a logiche di spartizione e ispirato a criteri di competenza, ',2,1);
/*!40000 ALTER TABLE `perfil_iniciativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_iniciativa_cat`
--

DROP TABLE IF EXISTS `perfil_iniciativa_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_iniciativa_cat` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(30) DEFAULT NULL,
  `belong` smallint(2) NOT NULL DEFAULT '0',
  `subelong` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_iniciativa_cat`
--

LOCK TABLES `perfil_iniciativa_cat` WRITE;
/*!40000 ALTER TABLE `perfil_iniciativa_cat` DISABLE KEYS */;
INSERT INTO `perfil_iniciativa_cat` VALUES (0,'Ninguno',NULL,0,0),(1,'Propuesta',NULL,0,0),(2,'Compromiso',NULL,0,0);
/*!40000 ALTER TABLE `perfil_iniciativa_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_index`
--

DROP TABLE IF EXISTS `personal_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_index` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `cargo` varchar(50) NOT NULL DEFAULT '',
  `contacto` varchar(50) NOT NULL DEFAULT '',
  `contenido` text NOT NULL,
  `imagen` varchar(10) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_index`
--

LOCK TABLES `personal_index` WRITE;
/*!40000 ALTER TABLE `personal_index` DISABLE KEYS */;
INSERT INTO `personal_index` VALUES (1,'Dr. David Chung Arceo','Director General','direccion@ortobiologicos.org','','david'),(2,'Dr. Agnet Adeim To','Responsable Sanitario','agnet@otobiologicos.org','',''),(3,'Agnet Adeim Ot','responsable de Calidad','agnet@otobiologicos.org','',''),(4,'Agnet Adeim Ot','Subdirector MÃ©dico','agnet@otobiologicos.org','',''),(5,'Agnet Adeim Ot','Director de Operaciones','agnet@otobiologicos.org','',''),(6,'Agnet Adeim Ot','Equipo de procuraciÃ³n','agnet@otobiologicos.org','',''),(7,'Agnet Adeim Ot','Proceso','agnet@otobiologicos.org','',''),(8,'Agnet Adeim Ot','Acondicionamiento','agnet@otobiologicos.org','',''),(9,'Juan Pedro','Vendedor de Pitayas','pitaya@ortobiologicos.org','','');
/*!40000 ALTER TABLE `personal_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicion_banner`
--

DROP TABLE IF EXISTS `posicion_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posicion_banner` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicion_banner`
--

LOCK TABLES `posicion_banner` WRITE;
/*!40000 ALTER TABLE `posicion_banner` DISABLE KEYS */;
INSERT INTO `posicion_banner` VALUES (1,'cabezal'),(2,'bann1'),(3,'bann2'),(4,'bann3'),(5,'bann4'),(6,'footer'),(7,'pestana');
/*!40000 ALTER TABLE `posicion_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propuesta_categoria`
--

DROP TABLE IF EXISTS `propuesta_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propuesta_categoria` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(30) DEFAULT NULL,
  `belong` smallint(2) NOT NULL DEFAULT '0',
  `subelong` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propuesta_categoria`
--

LOCK TABLES `propuesta_categoria` WRITE;
/*!40000 ALTER TABLE `propuesta_categoria` DISABLE KEYS */;
INSERT INTO `propuesta_categoria` VALUES (1,'Ninguno',NULL,0,0),(1,'Propuesta',NULL,0,0),(2,'Compromiso',NULL,0,0);
/*!40000 ALTER TABLE `propuesta_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propuesta_index`
--

DROP TABLE IF EXISTS `propuesta_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propuesta_index` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `texto` longtext,
  `nombre` varchar(250) NOT NULL,
  `categoria` smallint(1) NOT NULL DEFAULT '0',
  `visible` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propuesta_index`
--

LOCK TABLES `propuesta_index` WRITE;
/*!40000 ALTER TABLE `propuesta_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `propuesta_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecta_anuncio`
--

DROP TABLE IF EXISTS `prospecta_anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecta_anuncio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `medidas` varchar(100) DEFAULT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  `precio` decimal(19,2) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecta_anuncio`
--

LOCK TABLES `prospecta_anuncio` WRITE;
/*!40000 ALTER TABLE `prospecta_anuncio` DISABLE KEYS */;
INSERT INTO `prospecta_anuncio` VALUES (1,'Portada','25.5 x 25.5 cms',1,'72000.00'),(2,'Contraportada','25.5 x 31 cms',1,'68000.00'),(3,'Segunda y tercera de forros','25.5 x 31 cms',1,'64000.00'),(4,'Centrales','53.2 x 31 cms',1,'128000.00'),(5,'Plana y media','40.3 x 31 cms',1,'96000.00'),(6,'Plana','25.5 x 31 cms',1,'64000.00'),(7,'Media plana','12.5 x 31 cms Ã³ 25 x 15.3 cms',1,'32000.00'),(8,'Tres octavos','22.5 x 12.5 cms',1,'24000.00'),(9,'Cuarto','12.5 x 15.3 cms Ã³ 25.5 x 7.5 cms',1,'16000.00'),(10,'Octavo','7.5 x 12.5 cms',1,'8000.00'),(11,'Dieciseisavo','7.5 x 7 cms',1,'4000.00');
/*!40000 ALTER TABLE `prospecta_anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecta_caracter`
--

DROP TABLE IF EXISTS `prospecta_caracter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecta_caracter` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecta_caracter`
--

LOCK TABLES `prospecta_caracter` WRITE;
/*!40000 ALTER TABLE `prospecta_caracter` DISABLE KEYS */;
INSERT INTO `prospecta_caracter` VALUES (1,'Cliente',1),(2,'No cliente',1);
/*!40000 ALTER TABLE `prospecta_caracter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecta_cargo`
--

DROP TABLE IF EXISTS `prospecta_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecta_cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecta_cargo`
--

LOCK TABLES `prospecta_cargo` WRITE;
/*!40000 ALTER TABLE `prospecta_cargo` DISABLE KEYS */;
INSERT INTO `prospecta_cargo` VALUES (1,'Propietario',1),(2,'Director',1),(3,'Gerente de ventas',1),(4,'Publicidad',1),(5,'Mercadotecnia',1),(6,'Asistente de DirecciÃ³n',1);
/*!40000 ALTER TABLE `prospecta_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecta_concrecion`
--

DROP TABLE IF EXISTS `prospecta_concrecion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecta_concrecion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` int(11) NOT NULL,
  `vendedor` int(11) NOT NULL,
  `edicion` int(11) NOT NULL DEFAULT '0',
  `anuncio` int(3) NOT NULL DEFAULT '0',
  `pagado` int(1) NOT NULL DEFAULT '0',
  `fecha` date NOT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecta_concrecion`
--

LOCK TABLES `prospecta_concrecion` WRITE;
/*!40000 ALTER TABLE `prospecta_concrecion` DISABLE KEYS */;
INSERT INTO `prospecta_concrecion` VALUES (8,3,4,556,7,1,'0000-00-00','2014-11-26 15:33:43'),(7,1,7,556,8,1,'0000-00-00','2014-12-03 11:50:08');
/*!40000 ALTER TABLE `prospecta_concrecion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecta_directorio`
--

DROP TABLE IF EXISTS `prospecta_directorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecta_directorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `empresa` varchar(250) NOT NULL DEFAULT '',
  `cargo` int(11) NOT NULL DEFAULT '1',
  `direccion` varchar(250) NOT NULL DEFAULT '',
  `ciudad` varchar(150) NOT NULL DEFAULT '',
  `estado` varchar(150) NOT NULL DEFAULT '',
  `pais` varchar(20) DEFAULT NULL,
  `cp` varchar(10) NOT NULL DEFAULT '',
  `rfc` varchar(15) NOT NULL DEFAULT '',
  `email` varchar(35) NOT NULL DEFAULT '',
  `telefono` varchar(30) NOT NULL DEFAULT '',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `caracter` smallint(1) NOT NULL DEFAULT '0',
  `perspectiva` smallint(1) NOT NULL DEFAULT '0',
  `vendedor` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecta_directorio`
--

LOCK TABLES `prospecta_directorio` WRITE;
/*!40000 ALTER TABLE `prospecta_directorio` DISABLE KEYS */;
INSERT INTO `prospecta_directorio` VALUES (1,'Phillip Roth','Laboratorio Juma',1,'Av. Abedules #sincuenta','120','15','','45600','JUR19991211RR4','roth@juma.mx','3337744545','2014-11-11 20:54:36',2,2,7),(2,'Mariano Grocery','Tortas la maÃ±osa',5,'CrispÃ­n de Santiago de Acaponeta #28','39','15','','44100','GROM60121033R','lamanosa@hotmail.com','3344556677','2014-11-11 21:49:33',2,4,7),(3,'Mercedes Loza','La canica',3,'CaÃ­da de agua #244, col. Espinosa MarÃ­a','39','15','','43678','LOSM891211R4U','lacanica@golletes.com','89384837','2014-11-12 12:07:34',1,3,4),(4,'BÃ¡rtulo MacÃ­as','Golondrinas \"El pajarero\"',2,'Ejido 44, col. Sin nombre','39','15','','44100','MAVB450606TR5','bart@fonseca.com.mx','45464748','2014-11-12 12:14:11',2,5,4),(5,'Will FÃ©rres','Teclados de computadora internacionales',1,'AtizapÃ¡n de Moreno #889','37','15','','46733','TEC021003PP7','tecladosinternales@gmail.com','33142424242','2014-11-12 12:16:27',2,3,7),(6,'Jose Luis','Fletes MontaÃ±o',2,'Av. de los Maestros 5959','39','15','','44500','','','','2014-11-13 00:03:38',2,2,4),(7,'Emilio Roque de la Posa','La gladiola',5,'Juan ZubarÃ¡n 1414','39','15','','44240','GGG0120200FDC','laglad@gmial.com','902929302','2014-11-26 12:06:46',2,2,4),(8,'Vladimir GonzÃ¡lez','Calabazas cristalizadas \"El dulce calabazaso\"',1,'Ptolomeo 14, colonia Pensadores no mexicano','39','15','','45450','GOPV451211o9o','vladi@hotmail.com','1212121212','2014-11-26 12:19:28',1,2,4),(9,'Felipe Ruvalcaba','Chilillos de Occidente',1,'Apolonio GuzmÃ¡n 28','39','15','','42565','CHII891210RR9','apolonio@chilillos.com','','2014-12-02 08:29:36',2,6,4);
/*!40000 ALTER TABLE `prospecta_directorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecta_edicion`
--

DROP TABLE IF EXISTS `prospecta_edicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecta_edicion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(6) NOT NULL DEFAULT '0',
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecta_edicion`
--

LOCK TABLES `prospecta_edicion` WRITE;
/*!40000 ALTER TABLE `prospecta_edicion` DISABLE KEYS */;
INSERT INTO `prospecta_edicion` VALUES (1,555,'2012-05-01','2012-05-07',1),(2,556,'2012-05-08','2012-05-17',1),(3,557,'2012-05-18','2012-05-24',1);
/*!40000 ALTER TABLE `prospecta_edicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecta_panel`
--

DROP TABLE IF EXISTS `prospecta_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecta_panel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `c_0` varchar(150) NOT NULL,
  `c_1` varchar(150) NOT NULL,
  `c_2` varchar(150) NOT NULL,
  `c_3` varchar(150) NOT NULL,
  `c_4` varchar(150) NOT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecta_panel`
--

LOCK TABLES `prospecta_panel` WRITE;
/*!40000 ALTER TABLE `prospecta_panel` DISABLE KEYS */;
INSERT INTO `prospecta_panel` VALUES (1,'ventas','dia','semana','mes','ano','',1),(2,'visitas','dia','semana','mes','ano','',1),(3,'vendedores','','','','','',1),(4,'directorio','clientes','prospecto','','','',0);
/*!40000 ALTER TABLE `prospecta_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecta_perspectiva`
--

DROP TABLE IF EXISTS `prospecta_perspectiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecta_perspectiva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecta_perspectiva`
--

LOCK TABLES `prospecta_perspectiva` WRITE;
/*!40000 ALTER TABLE `prospecta_perspectiva` DISABLE KEYS */;
INSERT INTO `prospecta_perspectiva` VALUES (1,'Muy bueno',1),(2,'Bueno',1),(3,'Regular',1),(4,'Malo',1),(5,'Muy malo',1),(6,'ninguna',1);
/*!40000 ALTER TABLE `prospecta_perspectiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecta_temporadas`
--

DROP TABLE IF EXISTS `prospecta_temporadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecta_temporadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `fecha` date DEFAULT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecta_temporadas`
--

LOCK TABLES `prospecta_temporadas` WRITE;
/*!40000 ALTER TABLE `prospecta_temporadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospecta_temporadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecta_visita`
--

DROP TABLE IF EXISTS `prospecta_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospecta_visita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `vendedor` int(11) NOT NULL,
  `empresa` int(11) NOT NULL,
  `se_anuncia` smallint(1) NOT NULL DEFAULT '0',
  `se_anuncia_so` smallint(1) NOT NULL DEFAULT '0',
  `se_intereso` smallint(1) NOT NULL DEFAULT '0',
  `resuelve` smallint(3) DEFAULT NULL,
  `observaciones_v` text,
  `observaciones_g` text,
  `observaciones_dg` text,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `que_dijo` text,
  `se_anuncia_d` varchar(250) DEFAULT NULL,
  `edicion` int(11) NOT NULL,
  `concrecion` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecta_visita`
--

LOCK TABLES `prospecta_visita` WRITE;
/*!40000 ALTER TABLE `prospecta_visita` DISABLE KEYS */;
INSERT INTO `prospecta_visita` VALUES (6,'2014-11-12',7,2,0,0,1,30,'Una buena promociÃ³n en Navidad, y cae.','No tiene mucho futuro.','Vaya nombre para un negocio de comida.','2014-11-12 11:20:17','Le habrÃ­a interesado para El buen fin.','En ninguna parte',556,0),(7,'2014-11-12',7,1,1,0,1,14,'PodrÃ­a funcionar','Hay que darle un aumento a tan buen vendedor.','','2014-11-12 11:29:01','Nada en especial','El informador',556,1),(8,'0000-00-00',4,3,1,1,1,20,'Ninguna','','','2014-11-12 12:09:51','Que ya es costumbre anunciarse','En la hojita parroquial',556,1),(10,'0000-00-00',4,4,0,0,1,24,'Ninguna','Ni perder el tiempo.','','2014-11-12 13:37:51','Nada','',556,0),(11,'0000-00-00',4,6,0,0,1,14,'Muchas posibilidades','','','2014-11-24 16:14:59','Que le traiga un descuento atractivo','El inoportuno',556,0),(15,'0000-00-00',4,9,0,0,1,22,'Es muy posible que se concrete.','','','2014-12-02 11:35:47','Que ya lo tenÃ­a en mente eso de buscarnos','El tren',557,0),(13,'0000-00-00',4,7,0,0,1,12,'El seÃ±or guarda los billetes acomodando cara con cara y se fija en los nÃºmeros de serie.','','','2014-11-26 12:10:13','PidiÃ³ descuento.','En el canal 4',557,0),(14,'0000-00-00',4,8,0,0,1,7,'La biznaga estÃ¡ muy buena.','','','2014-11-26 12:23:59','Que le llamara','',557,0);
/*!40000 ALTER TABLE `prospecta_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_index`
--

DROP TABLE IF EXISTS `proyectos_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_index` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL DEFAULT '',
  `contenido` text,
  `cliente` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `proyecto` varchar(50) DEFAULT NULL,
  `publicado` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_index`
--

LOCK TABLES `proyectos_index` WRITE;
/*!40000 ALTER TABLE `proyectos_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyectos_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicaciones_index`
--

DROP TABLE IF EXISTS `publicaciones_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicaciones_index` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL DEFAULT '',
  `genero` varchar(50) NOT NULL DEFAULT '',
  `editor` varchar(250) NOT NULL DEFAULT '',
  `ext` varchar(50) NOT NULL DEFAULT '',
  `year` int(4) NOT NULL DEFAULT '0',
  `imagen` varchar(20) DEFAULT NULL,
  `contenido` text,
  `publicado` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicaciones_index`
--

LOCK TABLES `publicaciones_index` WRITE;
/*!40000 ALTER TABLE `publicaciones_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicaciones_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qr_index`
--

DROP TABLE IF EXISTS `qr_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qr_index` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `url` varchar(250) NOT NULL,
  `qr` varchar(250) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr_index`
--

LOCK TABLES `qr_index` WRITE;
/*!40000 ALTER TABLE `qr_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `qr_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answ`
--

DROP TABLE IF EXISTS `quiz_answ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_answ` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta` varchar(250) NOT NULL DEFAULT '',
  `valida` tinyint(1) NOT NULL DEFAULT '0',
  `ques` int(3) NOT NULL DEFAULT '0',
  `imagen` varchar(50) DEFAULT NULL,
  `contenido` text,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answ`
--

LOCK TABLES `quiz_answ` WRITE;
/*!40000 ALTER TABLE `quiz_answ` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_answ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_index`
--

DROP TABLE IF EXISTS `quiz_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '0',
  `imagen` varchar(50) DEFAULT NULL,
  `contenido` text,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_index`
--

LOCK TABLES `quiz_index` WRITE;
/*!40000 ALTER TABLE `quiz_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_ques`
--

DROP TABLE IF EXISTS `quiz_ques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_ques` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(250) DEFAULT NULL,
  `quiz` int(3) NOT NULL DEFAULT '0',
  `imagen` varchar(50) DEFAULT NULL,
  `contenido` text,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_ques`
--

LOCK TABLES `quiz_ques` WRITE;
/*!40000 ALTER TABLE `quiz_ques` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_ques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_resu`
--

DROP TABLE IF EXISTS `quiz_resu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_resu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz` int(5) NOT NULL DEFAULT '0',
  `answ` varchar(250) NOT NULL DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_resu`
--

LOCK TABLES `quiz_resu` WRITE;
/*!40000 ALTER TABLE `quiz_resu` DISABLE KEYS */;
INSERT INTO `quiz_resu` VALUES (1,1,'1 6 10 12','2014-06-26 16:01:39'),(2,1,'2 5 8 16','2014-06-26 16:01:53'),(3,1,'1 6 9 16','2014-06-26 16:02:11'),(4,1,'3 4 8 14','2014-06-26 16:02:40'),(5,1,'1 5 9 14','2014-06-26 16:02:59'),(9,1,'2 4 9 14','2014-06-27 04:35:40'),(10,1,'2 4 10 11','2014-06-27 04:39:00'),(11,1,'2 4 8 13','2014-06-27 04:52:03'),(12,1,'2 4 10 13','2014-08-15 04:37:22'),(15,1,'2 4 8 13','2014-08-16 03:25:58'),(18,1,'1 5 10 11','2014-08-16 03:33:05'),(19,2,'17 21 26 29  ','2014-08-16 05:28:03'),(20,1,'2 4 9 11  ','2014-08-16 05:28:44'),(21,3,'34 37 42 48  ','2014-08-16 05:53:10'),(22,3,'36 39 41 48  ','2014-08-16 05:56:26'),(25,2,'18 21 26 29  ','2014-08-19 09:18:47'),(26,2,'19 22 25 32  ','2014-08-19 09:40:57'),(27,2,'17 21 26 29  ','2014-08-20 15:07:26'),(28,2,'19 22 27 32  ','2014-08-20 15:11:46'),(29,2,'18 21 27 29  ','2014-08-21 18:45:34'),(30,3,'36 39 41 48  ','2014-08-21 18:51:06'),(31,3,'35 39 43 47  ','2014-08-21 18:59:56'),(32,3,'33 39 41 48  ','2014-08-21 19:01:42'),(35,3,'33 37 42 48  ','2014-08-22 00:03:45'),(42,3,'33 39 41 48','2014-09-16 04:42:02'),(43,3,'33 39 41 48','2014-09-16 04:42:02'),(44,3,'33 39 41 48','2014-09-16 04:42:02'),(45,3,'33 39 41 48','2014-09-16 04:42:02'),(46,3,'33 39 41 48','2014-09-16 04:42:02'),(47,3,'33 39 41 48','2014-09-16 04:42:02'),(48,3,'33 39 41 48','2014-09-16 04:43:02'),(49,3,'33 39 41 48','2014-09-16 04:43:02'),(50,3,'33 39 41 48','2014-09-16 04:43:02'),(51,3,'33 39 41 48','2014-09-16 04:43:02'),(52,3,'33 39 41 48','2014-09-16 04:43:02'),(53,3,'33 39 41 48','2014-09-16 04:43:02'),(54,3,'33 38 42 47  ','2014-09-16 19:37:28'),(55,3,'34 39 43 47  ','2014-09-16 20:12:27'),(56,3,'34 38 42 46  ','2014-09-16 20:26:23'),(57,3,'33 39 43 47  ','2014-09-16 20:28:30'),(58,3,'35 39 43 47  ','2014-09-16 20:36:42'),(59,2,'17 22 26 31  ','2014-09-16 20:39:01'),(60,2,'20 24 28 30  ','2014-09-16 20:39:46'),(61,3,'33 39 41 48','2014-09-16 23:07:03'),(62,3,'33 39 41 48','2014-09-16 23:07:11'),(63,3,'33 39 41 48','2014-09-16 23:08:02'),(64,3,'33 39 41 48','2014-09-16 23:09:07'),(65,3,'33 39 41 48','2014-09-16 23:10:06'),(66,3,'35 39 43 47  ','2014-09-17 02:59:35'),(67,3,'33 38 42 46  ','2014-09-17 03:37:05'),(68,3,'34 38 42 46  ','2014-09-17 03:43:25'),(69,3,'34 38 42 46  ','2014-09-17 03:48:28'),(70,3,'34 38 42 46  ','2014-09-17 03:54:09'),(71,3,'34 38 42 46  ','2014-09-17 03:56:32'),(72,3,'34 38 42 46  ','2014-09-17 04:01:50'),(73,3,'33 37 41 45  ','2014-09-17 04:38:35'),(74,3,'33 39 41 48','2014-09-17 06:26:02'),(75,0,' ','2014-12-19 16:45:15'),(76,0,' ','2014-12-19 16:45:28'),(77,0,' ','2014-12-19 16:45:29'),(78,5,'50  ','2014-12-19 16:57:15'),(79,5,'50  ','2014-12-19 16:57:29'),(80,5,'51  ','2014-12-20 07:00:45'),(81,5,'50  ','2014-12-20 07:03:18');
/*!40000 ALTER TABLE `quiz_resu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_complex`
--

DROP TABLE IF EXISTS `template_complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_complex` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `content` varchar(150) NOT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '0',
  `orden` smallint(3) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_complex`
--

LOCK TABLES `template_complex` WRITE;
/*!40000 ALTER TABLE `template_complex` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_complex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_general`
--

DROP TABLE IF EXISTS `template_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_general` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `subtitulo` varchar(50) DEFAULT NULL,
  `correo1` varchar(50) DEFAULT NULL,
  `correo2` varchar(50) DEFAULT NULL,
  `correo3` varchar(50) DEFAULT NULL,
  `metatags` text,
  `dia` time DEFAULT NULL,
  `noche` time DEFAULT NULL,
  `url` varchar(250) NOT NULL,
  `pagina` varchar(100) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_general`
--

LOCK TABLES `template_general` WRITE;
/*!40000 ALTER TABLE `template_general` DISABLE KEYS */;
INSERT INTO `template_general` VALUES (1,'ferbeta','','contacto@groundcontrol.com','','','','00:00:00','00:00:00','../../../../htdocs','');
/*!40000 ALTER TABLE `template_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_index`
--

DROP TABLE IF EXISTS `template_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_index` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `css` varchar(50) NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '',
  `header` varchar(150) NOT NULL DEFAULT '',
  `navbar` varchar(150) NOT NULL DEFAULT '',
  `logo` varchar(150) NOT NULL DEFAULT '',
  `tit_maincontent` varchar(150) DEFAULT NULL,
  `maincontent` varchar(150) DEFAULT NULL,
  `main_object` varchar(150) DEFAULT NULL,
  `detail` varchar(150) DEFAULT NULL,
  `footer` varchar(150) NOT NULL DEFAULT '',
  `pagina` varchar(20) NOT NULL DEFAULT 'default',
  `bann1` varchar(150) DEFAULT NULL,
  `bann2` varchar(150) DEFAULT NULL,
  `bann3` varchar(150) DEFAULT NULL,
  `bann4` varchar(150) DEFAULT NULL,
  `bann0` varchar(150) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_index`
--

LOCK TABLES `template_index` WRITE;
/*!40000 ALTER TABLE `template_index` DISABLE KEYS */;
INSERT INTO `template_index` VALUES (1,'style_index.css','','banners/bann_header_banner.php','style/navbar.php','','','','','','main_footer.php','index','main_nivel1.php','main_nivel2.php','','main_nivel4.php',''),(2,'ferbeta','Panel de control','style/header.php','style/botones_admin.php','','panel_de_control','contained.php','','style/botones_aux.php','style/footer.php','default','','','','',''),(3,'ferbeta','Panel de control','style/header.php','style/botones_admin.php','','panel_de_control','panel.php','','style/botones_aux.php','style/footer.php','default','','','','',''),(4,'style_error404.css','Error 404','main_logos.php','style/navbar.php','','','','banners/bann0_error404.php','','main_footer.php','error404','','','','',''),(5,'style_sesion.css','SesiÃ³n','main_logos.php','style/navbar.php','','panel_de_control','sesion/contained.php','','','main_footer.php','sesion','','','','','');
/*!40000 ALTER TABLE `template_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonios_index`
--

DROP TABLE IF EXISTS `testimonios_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonios_index` (
  `id` bigint(7) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL DEFAULT '',
  `contenido` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orden` int(2) NOT NULL DEFAULT '0',
  `imagen` varchar(50) DEFAULT NULL,
  `visible` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonios_index`
--

LOCK TABLES `testimonios_index` WRITE;
/*!40000 ALTER TABLE `testimonios_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonios_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_index`
--

DROP TABLE IF EXISTS `usuario_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(128) NOT NULL DEFAULT '',
  `passwd` varchar(128) DEFAULT NULL,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `imagen` varchar(10) NOT NULL DEFAULT '',
  `nombramiento` varchar(50) NOT NULL DEFAULT '',
  `perfil` text NOT NULL,
  `maill` varchar(35) NOT NULL DEFAULT '',
  `telefono` varchar(30) NOT NULL DEFAULT '',
  `celular` varchar(30) NOT NULL DEFAULT '',
  `domicilio` varchar(250) NOT NULL DEFAULT '',
  `poblacion` varchar(150) NOT NULL DEFAULT '',
  `colaborador` smallint(2) NOT NULL DEFAULT '0',
  `privilegios` smallint(2) NOT NULL DEFAULT '5',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  `cp` int(8) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  `rfc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_index`
--

LOCK TABLES `usuario_index` WRITE;
/*!40000 ALTER TABLE `usuario_index` DISABLE KEYS */;
INSERT INTO `usuario_index` VALUES (1,'ferbere','b66a5c2600e9f61e6163bb1051457946','RamsesFigueroa','HellboGDL','webmaster','','ramses@ferbere.com','10·86·2136','11·32·3773','Revolución casi 200','Santa Anita, jalisco',0,1,NULL,NULL,NULL,NULL,NULL),(2,'patogp','1f0f70bf2b5ad94c7387e64c16dc455a','Patricia García','','','','patogp77@gmail.com','10862136','3311496013','Revolución casi 200','Santa Anita, Col. Ponciano Arriaga',0,2,'2012-11-28 01:54:03',NULL,NULL,NULL,NULL),(4,'neymar','70080aa08b4fe2b66aae3baea7e4a99f','Neymar Arístides','','','','','','','Gumersindo Tapia #48','Chetumala',0,5,'2014-11-11 04:29:52',NULL,NULL,NULL,NULL),(5,'director','3d4e992d8d8a7d848724aa26ed7f4176','Director','','','','','','','','',0,3,'2014-11-14 07:28:30',NULL,NULL,NULL,NULL),(6,'gerencia','742bd91d2d21061e40359913fbff49d7','Gerencia de Ventas','','','','','','','','',0,4,'2014-11-14 07:46:15',NULL,NULL,NULL,NULL),(7,'pilip','8bf7a73a2d837c8703f39ebdadf2b2f5','Pilipo El Angustiante','','','','','','','','',0,5,'2014-12-03 05:45:32',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuario_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_privilegios`
--

DROP TABLE IF EXISTS `usuario_privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_privilegios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_privilegios`
--

LOCK TABLES `usuario_privilegios` WRITE;
/*!40000 ALTER TABLE `usuario_privilegios` DISABLE KEYS */;
INSERT INTO `usuario_privilegios` VALUES (1,'ferbere'),(2,'admin'),(3,'directivo'),(4,'funcionario'),(5,'todo mundo');
/*!40000 ALTER TABLE `usuario_privilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_index`
--

DROP TABLE IF EXISTS `video_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `fecha` varchar(150) DEFAULT NULL,
  `liga` varchar(250) DEFAULT NULL,
  `descripcion` text,
  `visible` smallint(1) NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_index`
--

LOCK TABLES `video_index` WRITE;
/*!40000 ALTER TABLE `video_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_index` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-03 13:11:37
