CREATE DATABASE  IF NOT EXISTS `simodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `simodb`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: simodb
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `concepto`
--

DROP TABLE IF EXISTS `concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concepto` (
  `idconcepto` int NOT NULL AUTO_INCREMENT,
  `nombre_conc` varchar(1000) DEFAULT NULL,
  `unidad` varchar(100) DEFAULT NULL,
  `cantidad` decimal(12,2) DEFAULT NULL,
  `p_unitario` decimal(12,2) DEFAULT NULL,
  `monto` decimal(12,2) DEFAULT NULL,
  `partida_idpartida` int unsigned NOT NULL,
  PRIMARY KEY (`idconcepto`),
  KEY `fk_concepto_partida` (`partida_idpartida`),
  CONSTRAINT `fk_concepto_partida` FOREIGN KEY (`partida_idpartida`) REFERENCES `partida` (`idpartida`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dictamen`
--

DROP TABLE IF EXISTS `dictamen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dictamen` (
  `iddictamen` int NOT NULL AUTO_INCREMENT,
  `situacion` varchar(10) DEFAULT NULL,
  `municipio` varchar(35) DEFAULT NULL,
  `subregion` varchar(35) DEFAULT NULL,
  `capacidad_por` varchar(45) DEFAULT NULL,
  `arc_dictamen` varchar(100) DEFAULT NULL,
  `fecha_dictamen` date DEFAULT NULL,
  `fec_inicio` date DEFAULT NULL,
  `fec_termino` date DEFAULT NULL,
  `metas_alc_fechas` date DEFAULT NULL,
  `meta_porciento` varchar(15) DEFAULT NULL,
  `metas_por` varchar(15) DEFAULT NULL,
  `obra_idobra` int DEFAULT NULL,
  PRIMARY KEY (`iddictamen`),
  UNIQUE KEY `obra_idobra` (`obra_idobra`),
  CONSTRAINT `fk_dictamen_obra` FOREIGN KEY (`obra_idobra`) REFERENCES `obra` (`idobra`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expediente`
--

DROP TABLE IF EXISTS `expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expediente` (
  `idexpediente` int NOT NULL AUTO_INCREMENT,
  `acta_apoyo_inv` varchar(255) DEFAULT NULL,
  `ced_regi_obra` varchar(255) DEFAULT NULL,
  `explo_insu` varchar(255) DEFAULT NULL,
  `cro_micro` varchar(255) DEFAULT NULL,
  `res_eje_pro` varchar(255) DEFAULT NULL,
  `val_dic_fac` varchar(255) DEFAULT NULL,
  `num_gene_obra` varchar(255) DEFAULT NULL,
  `dic_imp_amb` varchar(255) DEFAULT NULL,
  `memo_des` varchar(255) DEFAULT NULL,
  `planeria` varchar(255) DEFAULT NULL,
  `acta_dona_prop` varchar(255) DEFAULT NULL,
  `memo_cal` varchar(255) DEFAULT NULL,
  `esp_tec` varchar(255) DEFAULT NULL,
  `cal_fis_finan` varchar(255) DEFAULT NULL,
  `cro_macro` varchar(255) DEFAULT NULL,
  `acta_acep_bene` varchar(255) DEFAULT NULL,
  `soli_obra_bene` varchar(255) DEFAULT NULL,
  `gas_indir` varchar(255) DEFAULT NULL,
  `fotografias_est` varchar(255) DEFAULT NULL,
  `presu_obra` varchar(255) DEFAULT NULL,
  `tar_pre_uni` varchar(255) DEFAULT NULL,
  `obra_idobra` int DEFAULT NULL,
  PRIMARY KEY (`idexpediente`),
  UNIQUE KEY `obra_idobra` (`obra_idobra`),
  CONSTRAINT `fk_expediente_obra` FOREIGN KEY (`obra_idobra`) REFERENCES `obra` (`idobra`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `fecha` datetime DEFAULT NULL,
  `accion` varchar(500) DEFAULT NULL,
  `usuario_idusuario` int NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  KEY `fk_movimientos_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_movimientos_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obra`
--

DROP TABLE IF EXISTS `obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra` (
  `idobra` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `bene_unidad` varchar(255) DEFAULT NULL,
  `subprograma` varchar(255) DEFAULT NULL,
  `programa` varchar(255) DEFAULT NULL,
  `rubros` varchar(45) DEFAULT NULL,
  `empleo_event` int DEFAULT NULL,
  `presupuesto` decimal(12,2) DEFAULT NULL,
  `bene_cantidad` float DEFAULT NULL,
  `cap_cantidad` float DEFAULT NULL,
  `cap_unidad` varchar(255) DEFAULT NULL,
  `ejecucion` varchar(15) DEFAULT NULL,
  `loca_col` varchar(45) DEFAULT NULL,
  `Presupuesto_idPresupuesto` int NOT NULL,
  `num_obra` varchar(100) DEFAULT NULL,
  `num_aproba` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idobra`),
  KEY `fk_obra_Presupuesto1_idx` (`Presupuesto_idPresupuesto`),
  CONSTRAINT `fk_obra_Presupuesto1` FOREIGN KEY (`Presupuesto_idPresupuesto`) REFERENCES `presupuesto` (`idPresupuesto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partida`
--

DROP TABLE IF EXISTS `partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partida` (
  `idpartida` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_par` varchar(500) DEFAULT NULL,
  `monto_tot` decimal(12,2) DEFAULT NULL,
  `obra_idobra` int NOT NULL,
  PRIMARY KEY (`idpartida`),
  KEY `fk_concepto_obra1_idx` (`obra_idobra`),
  CONSTRAINT `fk_partida_obra` FOREIGN KEY (`obra_idobra`) REFERENCES `obra` (`idobra`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `idperiodo` int NOT NULL AUTO_INCREMENT,
  `año` year DEFAULT NULL,
  `fecha_inicial` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  PRIMARY KEY (`idperiodo`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuesto` (
  `idPresupuesto` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `prodim` tinyint(1) DEFAULT NULL,
  `indirectos` tinyint(1) DEFAULT NULL,
  `monto_inici` decimal(12,2) DEFAULT NULL,
  `monto_rest` decimal(12,2) DEFAULT NULL,
  `periodo_idperiodo` int NOT NULL,
  PRIMARY KEY (`idPresupuesto`),
  KEY `fk_Presupuesto_periodo1_idx` (`periodo_idperiodo`),
  CONSTRAINT `fk_Presupuesto_periodo1` FOREIGN KEY (`periodo_idperiodo`) REFERENCES `periodo` (`idperiodo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `celular` varchar(155) DEFAULT NULL,
  `rol` varchar(100) DEFAULT NULL,
  `contraseña` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-07 21:33:58
