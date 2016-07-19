CREATE DATABASE  IF NOT EXISTS `universidade` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `universidade`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: universidade
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `Matricula` char(10) NOT NULL,
  `AtendEsp` char(3) DEFAULT NULL,
  `CodC` int(11) NOT NULL,
  KEY `Matricula` (`Matricula`),
  KEY `CodC` (`CodC`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `pessoa` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`CodC`) REFERENCES `curso` (`CodC`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
REPLACE INTO `aluno` (`Matricula`, `AtendEsp`, `CodC`) VALUES ('2005051111','Não',54),('2005058645','Não',55),('2009026755','Sim',55),('2012020987','Não',33),('2013083322','Não',54),('2014080453','Sim',55),('2015086743','Não',33);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordenador`
--

DROP TABLE IF EXISTS `coordenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordenador` (
  `Matricula` char(10) NOT NULL,
  `AdicionalCoord` decimal(10,2) DEFAULT NULL,
  `CodInst` int(11) DEFAULT NULL,
  KEY `Matricula` (`Matricula`),
  KEY `CodInst` (`CodInst`),
  CONSTRAINT `coordenador_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `pessoa` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coordenador_ibfk_2` FOREIGN KEY (`CodInst`) REFERENCES `instituto` (`CodInst`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordenador`
--

LOCK TABLES `coordenador` WRITE;
/*!40000 ALTER TABLE `coordenador` DISABLE KEYS */;
REPLACE INTO `coordenador` (`Matricula`, `AdicionalCoord`, `CodInst`) VALUES ('1999103687',3500.00,15),('2000110123',3500.00,15),('2005017689',3500.00,11);
/*!40000 ALTER TABLE `coordenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `CodC` int(11) NOT NULL,
  `NomeCurso` varchar(30) NOT NULL,
  `MatCoor` char(10) DEFAULT NULL,
  `DtInicoor` date DEFAULT NULL,
  `CodInst` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodC`),
  KEY `MatCoor` (`MatCoor`),
  KEY `CodInst` (`CodInst`),
  CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`MatCoor`) REFERENCES `coordenador` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`CodInst`) REFERENCES `instituto` (`CodInst`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
REPLACE INTO `curso` (`CodC`, `NomeCurso`, `MatCoor`, `DtInicoor`, `CodInst`) VALUES (33,'MEDICINA','2005017689','2011-02-23',11),(54,'CIÊNCIAS DA COMPUTAÇÃO','1999103687','2008-07-12',15),(55,'SISTEMAS DE INFORMAÇÃO','2000110123','2010-11-25',15);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `coddisc` int(11) NOT NULL,
  `nomedisc` varchar(30) NOT NULL,
  `cargahoraria` int(11) DEFAULT NULL,
  PRIMARY KEY (`coddisc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
REPLACE INTO `disciplina` (`coddisc`, `nomedisc`, `cargahoraria`) VALUES (1,'Anatomia Humana',252),(2,'Bioquímica',108),(13,'Imunologia',100),(18,'Microbiologia',100),(27,'Patologia Funcional',300),(29,'Oftalmologia',30),(46,'Psiquiatria',100),(47,'Clínica Cirúrgica',240),(110,'Arquitetura de Computadores',64),(111,'Introdução à Programação',64),(112,'Cálculo 1',64),(113,'Introdução à Computação',64),(121,'Engenharia de Software',64),(122,'Programação Imperativa',64),(123,'Sistemas Digitais',64),(124,'Cálculo 2',64),(130,'Progr Orientada a Objetos',96),(131,'Estruturas de Dados',64),(132,'Teoria dos Grafos',64),(139,'Programação para Web',96),(140,'Banco de Dados',64),(141,'Projeto de Software',64),(147,'Redes de Computadores',64),(155,'Sistemas Distribuídos',64),(156,'Arquitetura de Software',64);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_pessoa`
--

DROP TABLE IF EXISTS `email_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_pessoa` (
  `Matricula` char(10) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`Matricula`,`Email`),
  CONSTRAINT `email_pessoa_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `pessoa` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_pessoa`
--

LOCK TABLES `email_pessoa` WRITE;
/*!40000 ALTER TABLE `email_pessoa` DISABLE KEYS */;
REPLACE INTO `email_pessoa` (`Matricula`, `Email`) VALUES ('1999103687','robertotelles@facu.com'),('2000110123','joao@facu.com'),('2001084433','osmarcardoso@facu.com'),('2005017689','anarita@facu.com'),('2005017999','giovana@outro.com'),('2005051111','mariaclaudia@facu.com'),('2005051111','mariaclaudia@outro.com'),('2005058645','ernesto@facu.com'),('2005058645','ernesto@outro.com'),('2006033456','fabiola@facu.com'),('2009026755','antoniosantos@facu.com'),('2009095743','carlosac@facu.com'),('2010054256','laurafc@facu.com'),('2010054256','laurafeliciano@outro.com'),('2011015658','paulohenrique@facu.com'),('2012020987','helena@facu.com'),('2013083322','cristinanc@facu.com'),('2014080453','eduardacb@facu.com'),('2015086743','danielanunes@facu.com'),('2015086743','daninues@outro.com');
/*!40000 ALTER TABLE `email_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `IdEnd` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(30) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `cep` varchar(12) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdEnd`)
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
REPLACE INTO `endereco` (`IdEnd`, `logradouro`, `num`, `complemento`, `bairro`, `cidade`, `cep`, `estado`, `pais`) VALUES (1001,'Rua',18,'Casa','Setor Centro','Goiânia','74000-011','Goiás','Brasil'),(1002,'Avenida Brasil',788,'Ed Morada, Bl 1 Apto 410','Setor Sul','Goiânia','74111-000','Goiás','Brasil'),(1003,'Rua GB 13',0,'Qd 5, Lt3, Cs 2','Setor Campinas','Goiânia','74555-098','Goiás','Brasil'),(1004,'Rua D 33',55,'Casa','Setor Jaó','Goiânia','74878-012','Goiás','Brasil'),(1005,'Rua 007',333,'Casa','Jardim Primavera','Goiânia','74112-043','Goiás','Brasil'),(1006,'Avenida 85',459,'Ed Azul, Apto 509','Setor Marista','Goiânia','74565-123','Goiás','Brasil'),(1007,'Rua F 12',0,'Qd 13, Lt 4, Cs 1','Setor Goiânia II','Goiânia','74234-987','Goiás','Brasil'),(1008,'Rua S 44',0,'Qd 10, Lt 5, Cs 1','Setor Oeste','Goiânia','74098-890','Goiás','Brasil'),(1009,'Avenida Goiás',1098,'Ed Milenium, Apto 606','Setor Centro','Goiânia','74655-876','Goiás','Brasil'),(1010,'Rua 65',321,'Casa','Setor Vilanova','Goiânia','74543-099','Goiás','Brasil'),(1011,'Rua 67',679,'Casa','Jardim Europa','Goiânia','74998-001','Goiás','Brasil'),(1012,'Rua 121',567,'Ed Plaza, Apto 707','Setor Bueno','Goiânia','74343-088','Goiás','Brasil'),(1013,'Rua F 33',0,'Qd 5, Lt 4','Setor Oeste','Goiânia','74988-065','Goiás','Brasil'),(1014,'Avenida Jose Oliveira',578,'Casa','Jardim Guanabara','Goiânia','74334-133','Goiás','Brasil'),(1015,'Avenida D 6',2090,'Ed Dom Pedro, Apto 111','Setor Aeroporto','Goiânia','74577-067','Goiás','Brasil'),(1016,'Rua 79',344,'Casa','Setor Campinas','Goiânia','74132-044','Goiás','Brasil');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_curricular`
--

DROP TABLE IF EXISTS `grade_curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_curricular` (
  `CodDisc` int(11) NOT NULL,
  `CodC` int(11) NOT NULL,
  `PeriodoFluxo` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`CodDisc`,`CodC`),
  KEY `CodC` (`CodC`),
  CONSTRAINT `grade_curricular_ibfk_1` FOREIGN KEY (`CodDisc`) REFERENCES `disciplina` (`coddisc`) ON UPDATE CASCADE,
  CONSTRAINT `grade_curricular_ibfk_2` FOREIGN KEY (`CodC`) REFERENCES `curso` (`CodC`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_curricular`
--

LOCK TABLES `grade_curricular` WRITE;
/*!40000 ALTER TABLE `grade_curricular` DISABLE KEYS */;
REPLACE INTO `grade_curricular` (`CodDisc`, `CodC`, `PeriodoFluxo`) VALUES (1,33,'1º - 2º'),(2,33,'1º - 2º'),(13,33,'3º'),(18,33,'4º'),(27,33,'5º - 6º'),(29,33,'6º'),(46,33,'8º'),(47,33,'8º'),(110,55,'1º'),(111,55,'1º'),(112,54,'1º'),(113,54,'1º'),(121,54,'5º'),(121,55,'2º'),(122,55,'2º'),(123,54,'2º'),(124,54,'2º'),(130,54,'3º'),(130,55,'3º'),(131,55,'3º'),(132,54,'3º'),(139,55,'4º'),(140,54,'4º'),(141,54,'7º'),(141,55,'4º'),(147,55,'5º'),(155,54,'6º'),(156,55,'6º');
/*!40000 ALTER TABLE `grade_curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graduacao`
--

DROP TABLE IF EXISTS `graduacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graduacao` (
  `SITUACAOGRAD` varchar(20) NOT NULL,
  `Mat` char(10) NOT NULL,
  `DtMudancaSit` date NOT NULL,
  PRIMARY KEY (`SITUACAOGRAD`,`Mat`,`DtMudancaSit`),
  KEY `Mat` (`Mat`),
  CONSTRAINT `graduacao_ibfk_1` FOREIGN KEY (`Mat`) REFERENCES `aluno` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graduacao`
--

LOCK TABLES `graduacao` WRITE;
/*!40000 ALTER TABLE `graduacao` DISABLE KEYS */;
REPLACE INTO `graduacao` (`SITUACAOGRAD`, `Mat`, `DtMudancaSit`) VALUES ('Concluída','2005051111','2011-12-13'),('Ingresso','2005051111','2005-07-03'),('Regular','2005051111','2005-07-03'),('Regular','2005051111','2007-01-25'),('Trancada','2005051111','2006-08-22'),('Concluída','2005058645','2009-12-14'),('Ingresso','2005058645','2005-07-18'),('Regular','2005058645','2005-07-18'),('Regular','2005058645','2007-08-05'),('Trancada','2005058645','2007-02-10'),('Concluída','2009026755','2013-12-17'),('Ingresso','2009026755','2009-02-03'),('Regular','2009026755','2009-02-03'),('Ingresso','2012020987','2012-02-18'),('Regular','2012020987','2012-02-18'),('Regular','2012020987','2015-02-07'),('Trancada','2012020987','2014-02-13'),('Ingresso','2013083322','2013-08-05'),('Regular','2013083322','2013-08-05'),('Ingresso','2014080453','2014-08-08'),('Regular','2014080453','2014-08-08'),('Ingresso','2015086743','2015-02-11'),('Regular','2015086743','2015-02-11');
/*!40000 ALTER TABLE `graduacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_turma`
--

DROP TABLE IF EXISTS `horario_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario_turma` (
  `CodD` int(11) NOT NULL,
  `Semestre` char(2) NOT NULL,
  `Ano` int(11) NOT NULL,
  `Horario` varchar(8) NOT NULL,
  PRIMARY KEY (`CodD`,`Semestre`,`Ano`,`Horario`),
  CONSTRAINT `horario_turma_ibfk_1` FOREIGN KEY (`CodD`, `Semestre`, `Ano`) REFERENCES `turma` (`CodD`, `Semestre`, `Ano`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_turma`
--

LOCK TABLES `horario_turma` WRITE;
/*!40000 ALTER TABLE `horario_turma` DISABLE KEYS */;
REPLACE INTO `horario_turma` (`CodD`, `Semestre`, `Ano`, `Horario`) VALUES (1,'1º',2012,'2M1234'),(1,'1º',2012,'4M1234'),(1,'1º',2015,'2M1234'),(1,'1º',2015,'4M1234'),(2,'1º',2012,'3T2345'),(2,'1º',2012,'5M234'),(2,'1º',2015,'3T3345'),(2,'1º',2015,'5M234'),(13,'1º',2013,'4M1234'),(13,'1º',2013,'6M34'),(13,'1º',2016,'4M1234'),(13,'1º',2016,'6M34'),(18,'2º',2013,'3M1234'),(18,'2º',2013,'4T12'),(29,'2º',2014,'2T12'),(110,'1º',2007,'2M1234'),(110,'1º',2009,'2N2345'),(110,'1º',2014,'2M1234'),(110,'2º',2005,'2N2345'),(110,'2º',2014,'2N2345'),(111,'1º',2009,'3N2345'),(111,'1º',2014,'3N2345'),(111,'2º',2005,'3N2345'),(112,'2º',2005,'3M1234'),(112,'2º',2013,'3M1234'),(113,'2º',2005,'4M1234'),(113,'2º',2013,'4M1234'),(121,'1º',2006,'5N2345'),(121,'1º',2009,'6M1234'),(121,'1º',2015,'6N1234'),(121,'2º',2009,'6N1234'),(121,'2º',2015,'6M1234'),(122,'1º',2006,'4N2345'),(122,'1º',2015,'4N2345'),(122,'2º',2009,'4N2345'),(123,'1º',2006,'4T2345'),(123,'1º',2014,'4T2345'),(124,'1º',2006,'5M1234'),(124,'1º',2014,'5M1234'),(130,'1º',2010,'3N23'),(130,'1º',2010,'6N2345'),(130,'2º',2006,'3N23'),(130,'2º',2006,'6N2345'),(130,'2º',2007,'4T23'),(130,'2º',2007,'6M1234'),(130,'2º',2014,'4T23'),(130,'2º',2014,'6M1234'),(130,'2º',2015,'3N23'),(130,'2º',2015,'6N2345'),(131,'1º',2010,'5N2345'),(131,'2º',2006,'5N2345'),(131,'2º',2015,'5N2345'),(132,'1º',2007,'6T2345'),(132,'2º',2014,'6T2345'),(139,'1º',2006,'3N2345'),(139,'1º',2006,'5N45'),(139,'1º',2016,'3N2345'),(139,'1º',2016,'5N45'),(139,'2º',2010,'3N2345'),(139,'2º',2010,'5N45'),(140,'1º',2007,'2T1234'),(140,'1º',2015,'2T1234'),(141,'1º',2016,'4N2345'),(141,'2º',2007,'4N2345'),(141,'2º',2008,'3M1234'),(141,'2º',2010,'4N2345'),(147,'1º',2011,'5N2345'),(147,'2º',2007,'5N2345'),(155,'1º',2008,'6T2345'),(155,'1º',2016,'6T2345'),(156,'1º',2008,'2N2345'),(156,'2º',2011,'2N2345');
/*!40000 ALTER TABLE `horario_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instituto`
--

DROP TABLE IF EXISTS `instituto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instituto` (
  `CodInst` int(11) NOT NULL,
  `NomeInst` varchar(30) NOT NULL,
  PRIMARY KEY (`CodInst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instituto`
--

LOCK TABLES `instituto` WRITE;
/*!40000 ALTER TABLE `instituto` DISABLE KEYS */;
REPLACE INTO `instituto` (`CodInst`, `NomeInst`) VALUES (2,'AGRONOMIA'),(6,'LETRAS'),(11,'MEDICINA'),(13,'ODONTOLOGIA'),(15,'INFORMÁTICA'),(20,'EDUCAÇÃO FÍSICA');
/*!40000 ALTER TABLE `instituto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_turmas`
--

DROP TABLE IF EXISTS `notas_turmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas_turmas` (
  `CodD` int(11) NOT NULL,
  `Semestre` char(2) NOT NULL,
  `Ano` int(11) NOT NULL,
  `MatAl` char(10) NOT NULL,
  `Nota` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CodD`,`Semestre`,`Ano`,`MatAl`,`Nota`),
  KEY `MatAl` (`MatAl`),
  CONSTRAINT `notas_turmas_ibfk_1` FOREIGN KEY (`CodD`, `Semestre`, `Ano`) REFERENCES `turma` (`CodD`, `Semestre`, `Ano`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notas_turmas_ibfk_2` FOREIGN KEY (`MatAl`) REFERENCES `aluno` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_turmas`
--

LOCK TABLES `notas_turmas` WRITE;
/*!40000 ALTER TABLE `notas_turmas` DISABLE KEYS */;
REPLACE INTO `notas_turmas` (`CodD`, `Semestre`, `Ano`, `MatAl`, `Nota`) VALUES (110,'1º',2007,'2005051111',9.20),(112,'2º',2005,'2005051111',7.90),(113,'2º',2005,'2005051111',6.50),(121,'1º',2009,'2005051111',7.60),(124,'1º',2006,'2005051111',8.40),(130,'2º',2007,'2005051111',6.80),(132,'1º',2007,'2005051111',8.90),(140,'1º',2007,'2005051111',7.90),(141,'2º',2008,'2005051111',7.20),(155,'1º',2008,'2005051111',7.20),(110,'2º',2005,'2005058645',7.30),(111,'2º',2005,'2005058645',8.00),(121,'1º',2006,'2005058645',8.50),(122,'1º',2006,'2005058645',8.20),(123,'1º',2006,'2005058645',9.00),(130,'2º',2006,'2005058645',6.50),(131,'2º',2006,'2005058645',7.60),(139,'1º',2006,'2005058645',7.50),(141,'2º',2007,'2005058645',8.80),(147,'2º',2007,'2005058645',8.60),(156,'1º',2008,'2005058645',6.90),(110,'1º',2009,'2009026755',8.70),(111,'1º',2009,'2009026755',9.00),(121,'2º',2009,'2009026755',8.00),(122,'2º',2009,'2009026755',7.60),(130,'1º',2010,'2009026755',7.80),(131,'1º',2010,'2009026755',8.00),(139,'2º',2010,'2009026755',8.50),(141,'2º',2010,'2009026755',6.50),(147,'1º',2011,'2009026755',9.00),(156,'2º',2011,'2009026755',8.20),(1,'1º',2012,'2012020987',7.50),(2,'1º',2012,'2012020987',9.00),(13,'1º',2013,'2012020987',7.00),(18,'2º',2013,'2012020987',8.00),(29,'2º',2014,'2012020987',5.10),(110,'1º',2014,'2013083322',7.30),(112,'2º',2013,'2013083322',7.00),(113,'2º',2013,'2013083322',8.50),(121,'2º',2015,'2013083322',5.50),(124,'1º',2014,'2013083322',5.00),(130,'2º',2014,'2013083322',8.80),(132,'2º',2014,'2013083322',9.00),(140,'1º',2015,'2013083322',6.20),(155,'1º',2016,'2013083322',0.00),(110,'2º',2014,'2014080453',4.90),(111,'1º',2014,'2014080453',6.90),(121,'1º',2015,'2014080453',7.00),(122,'1º',2015,'2014080453',3.80),(123,'1º',2014,'2014080453',7.80),(130,'2º',2015,'2014080453',8.40),(131,'2º',2015,'2014080453',4.80),(139,'1º',2016,'2014080453',0.00),(141,'1º',2016,'2014080453',0.00),(1,'1º',2015,'2015086743',8.80),(2,'1º',2015,'2015086743',8.20),(13,'1º',2016,'2015086743',0.00);
/*!40000 ALTER TABLE `notas_turmas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `Matricula` char(10) NOT NULL,
  `DtMat` date DEFAULT NULL,
  `Cpf` char(11) NOT NULL,
  `Num_Idt` varchar(12) DEFAULT NULL,
  `OrgaoExp_Idt` varchar(10) DEFAULT NULL,
  `NomeComp` varchar(40) NOT NULL,
  `Dt_Nasc` date DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Login` varchar(15) DEFAULT NULL,
  `Senha` varchar(15) DEFAULT NULL,
  `IdEnd` int(11) DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  KEY `IdEnd` (`IdEnd`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`IdEnd`) REFERENCES `endereco` (`IdEnd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
REPLACE INTO `pessoa` (`Matricula`, `DtMat`, `Cpf`, `Num_Idt`, `OrgaoExp_Idt`, `NomeComp`, `Dt_Nasc`, `Sexo`, `Login`, `Senha`, `IdEnd`) VALUES ('1999103687','1999-10-12','65747564732','55989923','SSPGO','ROBERTO TELLES ANTUNES NETO','1972-04-13','M','robertoinf','r1133227',1001),('2000110123','2000-11-10','01234567887','11233564','SSPMG','JOÃO PEDRO DA SILVA JÚNIOR','1970-05-03','M','profjoao','progamacao',1002),('2001084433','2001-08-01','66775533290','22331178','SSPMT','OSMAR CARDOSO DOS REIS','1975-10-19','M','osmar6574','665543oc',1003),('2005017689','2005-01-23','78954432789','23145365','SSPGO','ANA RITA DE CASSIA','1975-12-11','F','anaritac','3453anar',1004),('2005017999','2005-01-25','99880076589','44322122','SSPRS','GIOVANA CRISTINA FIDELIS','1977-05-07','F','giovanacf1','gi445567',1005),('2005051111','2005-07-03','98795436210','67433890','SSPGO','MARIA CLÁUDIA REGINA LOPES','1983-06-08','F','mariacrl','java567c',1006),('2005058645','2005-07-18','38878776990','19876542','SSPRN','ERNESTO GONÇALVES FILHO','1986-06-23','M','ernesto11','23456432',1007),('2006033456','2006-03-22','54432219987','09112334','SSPGO','FABIOLA FERREIRA LIMA','1987-04-25','F','fabiola12','fab7654',1008),('2009026755','2009-02-03','89898977884','78786600','SSPGO','ANTONIO SANTOS DE JESUS','1990-02-21','M','antonio45','66554488',1009),('2009095743','2009-09-12','32564321089','67332191','SSPRJ','CARLOS AUGUSTO CESAR','1982-11-27','M','profcac','1carlosinf',1010),('2010054256','2010-05-29','44433222332','00998876','SSPDF','LAURA FELICIANO CAXIAS','1983-02-14','F','laura44','456443578',1011),('2011015658','2011-01-04','76932445690','32445960','SSPDF','PAULO HENRIQUE PEREIRA COSTA','2002-08-30','M','phpereira','SI2011ufg',1012),('2012020987','2012-02-18','18971123778','77875098','SSPSP','HELENA VIANA CUNHA','1993-09-19','F','helena12','134654h',1013),('2013083322','2013-08-05','32323424241','34343467','SSPGO','CRISTINA NEVES CASTRO','1993-03-19','F','crisnc','cris44553',1014),('2014080453','2014-08-08','08997653217','78443229','SSPPA','EDUARDA CARVALHO BARBOSA','2005-03-15','F','eduarda2014','987654edu',1015),('2015086743','2015-02-11','75757443357','78786991','SSPDF','DANIELA NUNES SAMPAIO','1994-10-02','F','dani2015','dani1234',1016);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `Matricula` char(10) NOT NULL,
  `Salario` decimal(10,2) DEFAULT NULL,
  `Titulo` varchar(30) DEFAULT NULL,
  `CodInst` int(11) DEFAULT NULL,
  KEY `Matricula` (`Matricula`),
  KEY `CodInst` (`CodInst`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `pessoa` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `professor_ibfk_2` FOREIGN KEY (`CodInst`) REFERENCES `instituto` (`CodInst`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
REPLACE INTO `professor` (`Matricula`, `Salario`, `Titulo`, `CodInst`) VALUES ('2005017689',10000.00,'Doutorado em Patologia',11),('2010054256',7800.00,'Mestrado em Oftalmologia',11),('2005017999',7000.00,'Mestrado em Ciências da Comput',15),('2001084433',7000.00,'Mestrado em Ciências da Comput',15),('1999103687',11000.00,'Doutorado em Ciências da Comp',15),('2000110123',10000.00,'Doutorado em Ciências da Comp',15);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala_turma`
--

DROP TABLE IF EXISTS `sala_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sala_turma` (
  `CodD` int(11) NOT NULL,
  `Semestre` char(2) NOT NULL,
  `Ano` int(11) NOT NULL,
  `Sala` varchar(10) NOT NULL,
  PRIMARY KEY (`CodD`,`Semestre`,`Ano`,`Sala`),
  CONSTRAINT `sala_turma_ibfk_1` FOREIGN KEY (`CodD`, `Semestre`, `Ano`) REFERENCES `turma` (`CodD`, `Semestre`, `Ano`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala_turma`
--

LOCK TABLES `sala_turma` WRITE;
/*!40000 ALTER TABLE `sala_turma` DISABLE KEYS */;
REPLACE INTO `sala_turma` (`CodD`, `Semestre`, `Ano`, `Sala`) VALUES (1,'1º',2012,'A 111'),(1,'1º',2012,'A 201'),(1,'1º',2015,'A 111'),(1,'1º',2015,'A 201'),(2,'1º',2012,'A 308'),(2,'1º',2012,'A 309'),(2,'1º',2015,'A 308'),(2,'1º',2015,'A 309'),(13,'1º',2013,'A 102'),(13,'1º',2013,'A 105'),(13,'1º',2016,'A 102'),(13,'1º',2016,'A 105'),(18,'2º',2013,'A 204'),(18,'2º',2013,'A 205'),(29,'2º',2014,'A 309'),(110,'1º',2007,'B 101'),(110,'1º',2009,'B 101'),(110,'1º',2014,'B 101'),(110,'2º',2005,'B 101'),(110,'2º',2014,'B 101'),(111,'1º',2009,'B 203'),(111,'1º',2014,'B 203'),(111,'2º',2005,'B 203'),(112,'2º',2005,'B 207'),(112,'2º',2013,'B 207'),(113,'2º',2005,'B 208'),(113,'2º',2013,'B 208'),(121,'1º',2006,'B 202'),(121,'1º',2009,'B 202'),(121,'1º',2015,'B 202'),(121,'2º',2009,'B 202'),(121,'2º',2015,'B 202'),(122,'1º',2006,'B 302'),(122,'1º',2015,'B 302'),(122,'2º',2009,'B 302'),(123,'1º',2006,'B 309'),(123,'1º',2014,'B 309'),(124,'1º',2006,'B 106'),(124,'1º',2014,'B 106'),(130,'1º',2010,'B 104'),(130,'1º',2010,'B 305'),(130,'2º',2006,'B 104'),(130,'2º',2006,'B 305'),(130,'2º',2007,'B 104'),(130,'2º',2007,'B 305'),(130,'2º',2014,'B 104'),(130,'2º',2014,'B 305'),(130,'2º',2015,'B 104'),(130,'2º',2015,'B 305'),(131,'1º',2010,'B 106'),(131,'2º',2006,'B 106'),(131,'2º',2015,'B 106'),(132,'1º',2007,'B 208'),(132,'2º',2014,'B 208'),(139,'1º',2006,'B 103'),(139,'1º',2006,'B 303'),(139,'1º',2016,'B 103'),(139,'1º',2016,'B 303'),(139,'2º',2010,'B 103'),(139,'2º',2010,'B 303'),(140,'1º',2007,'B 304'),(140,'1º',2015,'B 304'),(141,'1º',2016,'C 101'),(141,'2º',2007,'C 101'),(141,'2º',2008,'C 101'),(141,'2º',2010,'C 101'),(147,'1º',2011,'C 203'),(147,'2º',2007,'C 203'),(155,'1º',2008,'C 306'),(155,'1º',2016,'C 306'),(156,'1º',2008,'C 107'),(156,'2º',2011,'C 107');
/*!40000 ALTER TABLE `sala_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico_adm`
--

DROP TABLE IF EXISTS `tecnico_adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico_adm` (
  `Matricula` char(10) NOT NULL,
  `Salario` decimal(10,2) DEFAULT NULL,
  `Funcao` varchar(20) DEFAULT NULL,
  `CodInst` int(11) DEFAULT NULL,
  KEY `Matricula` (`Matricula`),
  KEY `CodInst` (`CodInst`),
  CONSTRAINT `tecnico_adm_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `pessoa` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tecnico_adm_ibfk_2` FOREIGN KEY (`CodInst`) REFERENCES `instituto` (`CodInst`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico_adm`
--

LOCK TABLES `tecnico_adm` WRITE;
/*!40000 ALTER TABLE `tecnico_adm` DISABLE KEYS */;
REPLACE INTO `tecnico_adm` (`Matricula`, `Salario`, `Funcao`, `CodInst`) VALUES ('2006033456',3000.00,'Secretaria',15),('2009095743',3000.00,'Secretario',15),('2011015658',2800.00,'Aux Suporte',11);
/*!40000 ALTER TABLE `tecnico_adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone_pessoa`
--

DROP TABLE IF EXISTS `telefone_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone_pessoa` (
  `Matricula` char(10) NOT NULL,
  `Telefone` varchar(11) NOT NULL,
  PRIMARY KEY (`Matricula`,`Telefone`),
  CONSTRAINT `telefone_pessoa_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `pessoa` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone_pessoa`
--

LOCK TABLES `telefone_pessoa` WRITE;
/*!40000 ALTER TABLE `telefone_pessoa` DISABLE KEYS */;
REPLACE INTO `telefone_pessoa` (`Matricula`, `Telefone`) VALUES ('1999103687','6233222100'),('1999103687','6299991111'),('2000110123','6288881112'),('2001084433','6233443322'),('2001084433','6277666655'),('2005017689','6298784435'),('2005017999','6281112345'),('2005051111','6297764455'),('2005058645','6288226556'),('2006033456','6298995466'),('2009026755','6231110000'),('2009026755','6286556712'),('2009095743','6289004772'),('2010054256','6287656780'),('2011015658','6291336754'),('2012020987','6290563289'),('2013083322','6234563244'),('2013083322','6293116789'),('2014080453','6288136766'),('2015086743','6288891166');
/*!40000 ALTER TABLE `telefone_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `CodD` int(11) NOT NULL,
  `Semestre` char(2) NOT NULL,
  `Ano` int(11) NOT NULL,
  `MatP` char(10) DEFAULT NULL,
  PRIMARY KEY (`CodD`,`Semestre`,`Ano`),
  KEY `MatP` (`MatP`),
  CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`CodD`) REFERENCES `disciplina` (`COdDisc`),
  CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`MatP`) REFERENCES `professor` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
REPLACE INTO `turma` (`CodD`, `Semestre`, `Ano`, `MatP`) VALUES (110,'1º',2007,'1999103687'),(110,'1º',2009,'1999103687'),(110,'1º',2014,'1999103687'),(110,'2º',2005,'1999103687'),(110,'2º',2014,'1999103687'),(121,'1º',2006,'1999103687'),(121,'1º',2009,'1999103687'),(121,'1º',2015,'1999103687'),(121,'2º',2009,'1999103687'),(121,'2º',2015,'1999103687'),(130,'1º',2010,'1999103687'),(130,'2º',2006,'1999103687'),(130,'2º',2007,'1999103687'),(130,'2º',2014,'1999103687'),(130,'2º',2015,'1999103687'),(140,'1º',2007,'1999103687'),(140,'1º',2015,'1999103687'),(111,'1º',2009,'2000110123'),(111,'1º',2014,'2000110123'),(111,'2º',2005,'2000110123'),(122,'1º',2006,'2000110123'),(122,'1º',2015,'2000110123'),(122,'2º',2009,'2000110123'),(131,'1º',2010,'2000110123'),(131,'2º',2006,'2000110123'),(131,'2º',2015,'2000110123'),(141,'1º',2016,'2000110123'),(141,'2º',2007,'2000110123'),(141,'2º',2008,'2000110123'),(141,'2º',2010,'2000110123'),(112,'2º',2005,'2001084433'),(112,'2º',2013,'2001084433'),(123,'1º',2006,'2001084433'),(123,'1º',2014,'2001084433'),(132,'1º',2007,'2001084433'),(132,'2º',2014,'2001084433'),(147,'1º',2011,'2001084433'),(147,'2º',2007,'2001084433'),(2,'1º',2012,'2005017689'),(2,'1º',2015,'2005017689'),(18,'2º',2013,'2005017689'),(113,'2º',2005,'2005017999'),(113,'2º',2013,'2005017999'),(124,'1º',2006,'2005017999'),(124,'1º',2014,'2005017999'),(139,'1º',2006,'2005017999'),(139,'1º',2016,'2005017999'),(139,'2º',2010,'2005017999'),(155,'1º',2008,'2005017999'),(155,'1º',2016,'2005017999'),(156,'1º',2008,'2005017999'),(156,'2º',2011,'2005017999'),(1,'1º',2012,'2010054256'),(1,'1º',2015,'2010054256'),(13,'1º',2013,'2010054256'),(13,'1º',2016,'2010054256'),(29,'2º',2014,'2010054256');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmas_semestre`
--

DROP TABLE IF EXISTS `turmas_semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turmas_semestre` (
  `CodD` int(11) NOT NULL,
  `Semestre` char(2) NOT NULL,
  `Ano` int(11) NOT NULL,
  `MatAl` char(10) NOT NULL,
  `HorasFaltas` int(11) DEFAULT NULL,
  `StatusAluno` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CodD`,`Semestre`,`Ano`,`MatAl`),
  KEY `MatAl` (`MatAl`),
  CONSTRAINT `turmas_semestre_ibfk_1` FOREIGN KEY (`CodD`, `Semestre`, `Ano`) REFERENCES `turma` (`CodD`, `Semestre`, `Ano`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `turmas_semestre_ibfk_2` FOREIGN KEY (`MatAl`) REFERENCES `aluno` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmas_semestre`
--

LOCK TABLES `turmas_semestre` WRITE;
/*!40000 ALTER TABLE `turmas_semestre` DISABLE KEYS */;
REPLACE INTO `turmas_semestre` (`CodD`, `Semestre`, `Ano`, `MatAl`, `HorasFaltas`, `StatusAluno`) VALUES (1,'1º',2012,'2012020987',26,'Aprovado'),(1,'1º',2015,'2015086743',24,'Aprovado'),(2,'1º',2012,'2012020987',6,'Aprovado'),(2,'1º',2015,'2015086743',12,'Aprovado'),(13,'1º',2013,'2012020987',14,'Aprovado'),(13,'1º',2016,'2015086743',22,'Matriculado'),(18,'2º',2013,'2012020987',0,'Aprovado'),(29,'2º',2014,'2012020987',6,'Reprovado'),(110,'1º',2007,'2005051111',3,'Aprovado'),(110,'1º',2009,'2009026755',0,'Aprovado'),(110,'1º',2014,'2013083322',20,'Reprovado'),(110,'2º',2005,'2005058645',4,'Aprovado'),(110,'2º',2014,'2014080453',4,'Reprovado'),(111,'1º',2009,'2009026755',6,'Aprovado'),(111,'1º',2014,'2014080453',12,'Aprovado'),(111,'2º',2005,'2005058645',0,'Aprovado'),(112,'2º',2005,'2005051111',10,'Aprovado'),(112,'2º',2013,'2013083322',14,'Reprovado'),(113,'2º',2005,'2005051111',4,'Aprovado'),(113,'2º',2013,'2013083322',12,'Aprovado'),(121,'1º',2006,'2005058645',10,'Aprovado'),(121,'1º',2009,'2005051111',2,'Aprovado'),(121,'1º',2015,'2014080453',6,'Aprovado'),(121,'2º',2009,'2009026755',4,'Aprovado'),(121,'2º',2015,'2013083322',4,'Reprovado'),(122,'1º',2006,'2005058645',4,'Aprovado'),(122,'1º',2015,'2014080453',4,'Reprovado'),(122,'2º',2009,'2009026755',6,'Aprovado'),(123,'1º',2006,'2005058645',10,'Aprovado'),(123,'1º',2014,'2014080453',2,'Aprovado'),(124,'1º',2006,'2005051111',12,'Aprovado'),(124,'1º',2014,'2013083322',6,'Reprovado'),(130,'1º',2010,'2009026755',8,'Aprovado'),(130,'2º',2006,'2005058645',8,'Aprovado'),(130,'2º',2007,'2005051111',8,'Aprovado'),(130,'2º',2014,'2013083322',10,'Aprovado'),(130,'2º',2015,'2014080453',6,'Aprovado'),(131,'1º',2010,'2009026755',0,'Aprovado'),(131,'2º',2006,'2005058645',2,'Aprovado'),(131,'2º',2015,'2014080453',0,'Reprovado'),(132,'1º',2007,'2005051111',4,'Aprovado'),(132,'2º',2014,'2013083322',6,'Aprovado'),(139,'1º',2006,'2005058645',4,'Aprovado'),(139,'1º',2016,'2014080453',4,'Matriculado'),(139,'2º',2010,'2009026755',6,'Aprovado'),(140,'1º',2007,'2005051111',2,'Aprovado'),(140,'1º',2015,'2013083322',20,'Reprovado'),(141,'1º',2016,'2014080453',6,'Matriculado'),(141,'2º',2007,'2005058645',4,'Aprovado'),(141,'2º',2008,'2005051111',8,'Aprovado'),(141,'2º',2010,'2009026755',14,'Aprovado'),(147,'1º',2011,'2009026755',0,'Aprovado'),(147,'2º',2007,'2005058645',0,'Aprovado'),(155,'1º',2008,'2005051111',12,'Aprovado'),(155,'1º',2016,'2013083322',10,'Matriculado'),(156,'1º',2008,'2005058645',14,'Aprovado'),(156,'2º',2011,'2009026755',8,'Aprovado');
/*!40000 ALTER TABLE `turmas_semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'universidade'
--

--
-- Dumping routines for database 'universidade'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-13 18:28:49
