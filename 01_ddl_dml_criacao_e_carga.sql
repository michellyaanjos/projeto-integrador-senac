-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: controle_kits_cirurgicos
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `composicao_kit`
--

DROP TABLE IF EXISTS `composicao_kit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composicao_kit` (
  `quantidade_padrao` int NOT NULL,
  `id_kit` int NOT NULL,
  `id_produto` int NOT NULL,
  PRIMARY KEY (`id_kit`,`id_produto`),
  KEY `fk_composicao_kit_kit_cirurgico1_idx` (`id_kit`),
  KEY `fk_composicao_kit_produto1_idx` (`id_produto`),
  CONSTRAINT `fk_composicao_kit_kit_cirurgico1` FOREIGN KEY (`id_kit`) REFERENCES `kit_cirurgico` (`id_kit`),
  CONSTRAINT `fk_composicao_kit_produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composicao_kit`
--

LOCK TABLES `composicao_kit` WRITE;
/*!40000 ALTER TABLE `composicao_kit` DISABLE KEYS */;
INSERT INTO `composicao_kit` VALUES (8,1,15),(4,1,43),(7,2,11),(7,2,24),(5,3,24),(4,3,30),(8,4,41),(8,4,48),(4,5,6),(2,5,14),(3,6,6),(6,6,49),(4,7,8),(7,7,12),(1,8,13),(3,8,28),(5,9,41),(5,9,42),(1,10,24),(7,10,48),(8,11,31),(5,11,34),(3,12,23),(2,12,32),(4,13,10),(6,13,36),(6,14,25),(1,14,30),(8,15,17),(2,15,49),(5,16,23),(2,16,30),(1,17,3),(2,17,19),(8,18,5),(2,18,34),(8,19,25),(8,19,42),(6,20,2),(3,20,35),(7,21,2),(2,21,9),(5,22,6),(1,22,11),(2,23,3),(2,23,48),(5,24,22),(3,24,47),(8,25,16),(6,25,31);
/*!40000 ALTER TABLE `composicao_kit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conferencia_movimentacao`
--

DROP TABLE IF EXISTS `conferencia_movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conferencia_movimentacao` (
  `quantidade_enviada` int NOT NULL,
  `quantidade_utilizada` int DEFAULT '0',
  `quantidade_devolvida` int NOT NULL DEFAULT '0',
  `id_movimentacao` int NOT NULL,
  `id_produto` int NOT NULL,
  PRIMARY KEY (`id_movimentacao`,`id_produto`),
  KEY `fk_conferencia_movimentacao_movimentacao1_idx` (`id_movimentacao`),
  KEY `fk_conferencia_movimentacao_produto1_idx` (`id_produto`),
  CONSTRAINT `fk_conferencia_movimentacao_movimentacao1` FOREIGN KEY (`id_movimentacao`) REFERENCES `movimentacao` (`id_movimentacao`),
  CONSTRAINT `fk_conferencia_movimentacao_produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conferencia_movimentacao`
--

LOCK TABLES `conferencia_movimentacao` WRITE;
/*!40000 ALTER TABLE `conferencia_movimentacao` DISABLE KEYS */;
INSERT INTO `conferencia_movimentacao` VALUES (2,0,2,1,3),(2,2,0,1,48),(2,1,1,2,3),(2,1,0,2,48),(8,8,0,4,5),(2,1,1,4,34),(2,2,0,6,3),(2,1,1,6,48),(1,1,0,7,3),(2,1,1,7,19),(7,4,2,8,11),(7,3,3,8,24),(5,1,4,10,23),(2,2,0,10,30),(1,0,1,11,24),(7,6,1,11,48),(5,5,0,13,24),(4,3,1,13,30),(5,5,0,17,23),(2,0,2,17,30),(5,4,1,18,24),(4,0,4,18,30),(5,1,4,19,22),(3,2,1,19,47),(3,2,1,20,6),(6,5,1,20,49),(8,8,0,22,25),(8,5,3,22,42),(8,8,0,27,17),(2,1,1,27,49),(1,0,0,28,13),(3,3,0,28,28),(8,6,2,29,15),(4,2,2,29,43),(4,1,3,30,10),(6,3,3,30,36),(5,1,3,31,24),(4,0,3,31,30),(5,4,1,32,6),(1,0,1,32,11),(3,0,3,33,6),(6,1,5,33,49),(1,0,0,34,13),(3,0,3,34,28),(1,0,1,36,3),(2,1,1,36,19),(8,5,3,37,31),(5,0,4,37,34),(5,5,0,38,41),(5,0,5,38,42);
/*!40000 ALTER TABLE `conferencia_movimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratante`
--

DROP TABLE IF EXISTS `contratante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratante` (
  `id_contratante` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `tipo_contratante` varchar(50) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  PRIMARY KEY (`id_contratante`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratante`
--

LOCK TABLES `contratante` WRITE;
/*!40000 ALTER TABLE `contratante` DISABLE KEYS */;
INSERT INTO `contratante` VALUES (1,'Hospital São Gabriel','Hospital Privado','40.048.764/0001-71'),(2,'Hospital Regional de Santos','Hospital Público','62.912.808/0001-00'),(3,'Hospital Monte Verde','Hospital Privado','55.850.037/0001-09'),(4,'Hospital Beneficente Bom Pastor','Filantrópico','13.826.538/0001-00'),(5,'Secretaria de Saúde de Diadema Sul','Secretaria de Saúde','55.355.778/0001-05'),(6,'Clínica Cantareira','Clínica','89.432.627/0001-25'),(7,'Hospital Beneficente Aliança','Filantrópico','15.860.214/0001-05'),(8,'Hospital Regional de Barueri','Hospital Público','68.421.083/0001-26'),(9,'Hospital Regional de Mogi das Cruzes','Hospital Público','59.066.882/0001-30'),(10,'Hospital Sol Nascente','Hospital Privado','91.126.584/0001-00'),(11,'Hospital Nova Esperança','Hospital Privado','50.932.448/0001-11'),(12,'Secretaria de Saúde de Ribeirão Preto','Secretaria de Saúde','55.263.097/0001-17'),(13,'Secretaria de Saúde de Santo André','Secretaria de Saúde','75.828.025/0001-87'),(14,'Hospital Santa Cecília','Hospital Privado','92.201.805/0001-11'),(15,'Hospital Regional de Sorocaba','Hospital Público','25.438.299/0001-91'),(16,'Hospital Bela Vista','Hospital Privado','42.157.116/0001-89'),(17,'Hospital Beneficente São Rafael','Filantrópico','59.415.771/0001-92'),(18,'Clínica Nossa Senhora Aparecida','Clínica','98.357.951/0001-17'),(19,'Hospital Estrela do Sul','Hospital Privado','21.744.325/0001-59'),(20,'Clínica Vitória Régia','Clínica','78.855.765/0001-09'),(21,'Secretaria de Saúde de Jundiaí','Secretaria de Saúde','33.735.569/0001-54'),(22,'Hospital Regional de Taubaté','Hospital Público','73.279.264/0001-08'),(23,'Hospital Regional de Guarulhos','Hospital Público','61.547.428/0001-43'),(24,'Hospital Beneficente Boa Vista','Filantrópico','53.528.144/0001-81'),(25,'Clínica Santa Rita','Clínica','86.608.565/0001-71'),(26,'Clínica Recanto Feliz','Clínica','27.883.655/0001-01'),(27,'Secretaria de Saúde de Bauru','Secretaria de Saúde','16.204.842/0001-03'),(28,'Secretaria de Saúde de Barueri Norte','Secretaria de Saúde','69.967.750/0001-33'),(29,'Hospital Regional de Diadema','Hospital Público','13.145.037/0001-50'),(30,'Hospital Planalto','Hospital Privado','94.951.838/0001-04'),(31,'Hospital Luz do Dia','Hospital Privado','11.253.739/0001-21'),(32,'Hospital Jardim América','Hospital Privado','34.196.898/0001-37'),(33,'Secretaria de Saúde de Campinas','Secretaria de Saúde','31.046.028/0001-93'),(34,'Clínica São Judas','Clínica','93.755.559/0001-02'),(35,'Hospital Regional de São Paulo','Hospital Público','84.754.072/0001-14'),(36,'Hospital Vale Verde','Hospital Privado','17.547.354/0001-53'),(37,'Secretaria de Saúde de Franca','Secretaria de Saúde','96.439.061/0001-29'),(38,'Clínica Santa Luzia','Clínica','98.479.188/0001-05'),(39,'Hospital Santa Beatriz','Hospital Privado','67.555.218/0001-83'),(40,'Clínica Bom Jesus','Clínica','34.886.193/0001-41'),(41,'Hospital Cruz Azul','Hospital Privado','17.336.882/0001-63'),(42,'Hospital Beneficente Horizonte','Filantrópico','93.472.855/0001-04'),(43,'Hospital Alvorada','Hospital Privado','78.983.298/0001-94'),(44,'Hospital Beneficente Vida Nova','Filantrópico','32.290.044/0001-90'),(45,'Hospital Regional de Osasco','Hospital Público','32.485.272/0001-15'),(46,'Clínica Pró-Vida','Clínica','30.226.978/0001-37'),(47,'Hospital Beneficente Esperança','Filantrópico','14.385.817/0001-30'),(48,'Clínica Girassol','Clínica','72.528.070/0001-28'),(49,'Hospital Beneficente Santa Aurora','Filantrópico','11.594.502/0001-04'),(50,'Hospital Regional de Piracicaba','Hospital Público','93.166.323/0001-30');
/*!40000 ALTER TABLE `contratante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento` (
  `id_documento` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(50) NOT NULL,
  `data_emissao` date NOT NULL,
  `data_validade` date NOT NULL,
  `caminho_arquivo` varchar(255) NOT NULL,
  `id_usuario` int NOT NULL,
  `id_kit` int DEFAULT NULL,
  `id_contratante` int DEFAULT NULL,
  `id_processo` int DEFAULT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `fk_documento_usuario_idx` (`id_usuario`),
  KEY `fk_documento_kit_cirurgico1_idx` (`id_kit`),
  KEY `fk_documento_contratante1_idx` (`id_contratante`),
  KEY `fk_documento_processo_licitatorio1_idx` (`id_processo`),
  CONSTRAINT `fk_documento_contratante1` FOREIGN KEY (`id_contratante`) REFERENCES `contratante` (`id_contratante`),
  CONSTRAINT `fk_documento_kit_cirurgico1` FOREIGN KEY (`id_kit`) REFERENCES `kit_cirurgico` (`id_kit`),
  CONSTRAINT `fk_documento_processo_licitatorio1` FOREIGN KEY (`id_processo`) REFERENCES `processo_licitatorio` (`id_processo`),
  CONSTRAINT `fk_documento_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (1,'Registro ANVISA','2025-05-30','2026-09-17','/documentos/2025/registroanvisa_001.pdf',9,8,NULL,NULL),(2,'Registro ANVISA','2021-12-16','2026-04-08','/documentos/2021/registroanvisa_002.pdf',13,7,NULL,NULL),(3,'Registro ANVISA','2024-02-06','2026-05-04','/documentos/2024/registroanvisa_003.pdf',44,2,NULL,NULL),(4,'Registro ANVISA','2021-09-03','2026-06-08','/documentos/2021/registroanvisa_004.pdf',17,9,NULL,NULL),(5,'Registro ANVISA','2024-04-19','2030-08-17','/documentos/2024/registroanvisa_005.pdf',31,6,NULL,NULL),(6,'Registro ANVISA','2023-01-14','2028-01-27','/documentos/2023/registroanvisa_006.pdf',13,17,NULL,NULL),(7,'Registro ANVISA','2025-04-06','2027-12-31','/documentos/2025/registroanvisa_007.pdf',24,22,NULL,NULL),(8,'Registro ANVISA','2023-08-29','2027-05-13','/documentos/2023/registroanvisa_008.pdf',41,12,NULL,NULL),(9,'Registro ANVISA','2024-05-04','2027-10-05','/documentos/2024/registroanvisa_009.pdf',40,3,NULL,NULL),(10,'Registro ANVISA','2022-08-11','2029-12-30','/documentos/2022/registroanvisa_010.pdf',4,19,NULL,NULL),(11,'Registro ANVISA','2024-02-12','2028-12-07','/documentos/2024/registroanvisa_011.pdf',15,20,NULL,NULL),(12,'Registro ANVISA','2025-01-12','2028-07-19','/documentos/2025/registroanvisa_012.pdf',31,1,NULL,NULL),(13,'Certificado de Esterilização','2026-10-10','2027-04-08','/documentos/2026/certificadodeesterilizacao_013.pdf',3,10,NULL,NULL),(14,'Certificado de Esterilização','2026-06-08','2026-12-05','/documentos/2026/certificadodeesterilizacao_014.pdf',18,15,NULL,NULL),(15,'Certificado de Esterilização','2026-08-09','2027-02-05','/documentos/2026/certificadodeesterilizacao_015.pdf',46,4,NULL,NULL),(16,'Certificado de Esterilização','2026-06-23','2026-12-20','/documentos/2026/certificadodeesterilizacao_016.pdf',20,4,NULL,NULL),(17,'Certificado de Esterilização','2026-07-06','2027-01-02','/documentos/2026/certificadodeesterilizacao_017.pdf',44,14,NULL,NULL),(18,'Certificado de Esterilização','2026-05-19','2026-11-15','/documentos/2026/certificadodeesterilizacao_018.pdf',31,11,NULL,NULL),(19,'Certificado de Esterilização','2026-07-12','2027-01-08','/documentos/2026/certificadodeesterilizacao_019.pdf',20,5,NULL,NULL),(20,'Certificado de Esterilização','2026-10-27','2027-04-25','/documentos/2026/certificadodeesterilizacao_020.pdf',4,3,NULL,NULL),(21,'Certificado de Esterilização','2026-07-14','2027-01-10','/documentos/2026/certificadodeesterilizacao_021.pdf',49,14,NULL,NULL),(22,'Certificado de Esterilização','2026-05-24','2026-11-20','/documentos/2026/certificadodeesterilizacao_022.pdf',13,21,NULL,NULL),(23,'Laudo Técnico','2026-04-23','2027-04-23','/documentos/2026/laudotecnico_023.pdf',35,1,NULL,NULL),(24,'Laudo Técnico','2026-01-25','2027-01-25','/documentos/2026/laudotecnico_024.pdf',21,13,NULL,NULL),(25,'Laudo Técnico','2026-01-24','2027-01-24','/documentos/2026/laudotecnico_025.pdf',41,21,NULL,NULL),(26,'Laudo Técnico','2026-02-27','2027-02-27','/documentos/2026/laudotecnico_026.pdf',17,32,NULL,NULL),(27,'Laudo Técnico','2026-08-08','2027-08-08','/documentos/2026/laudotecnico_027.pdf',44,22,NULL,NULL),(28,'Laudo Técnico','2026-05-02','2027-05-02','/documentos/2026/laudotecnico_028.pdf',3,23,NULL,NULL),(29,'Nota Fiscal','2026-10-31','2027-10-31','/documentos/2026/notafiscal_029.pdf',46,32,44,NULL),(30,'Nota Fiscal','2026-09-17','2027-09-17','/documentos/2026/notafiscal_030.pdf',45,28,4,NULL),(31,'Nota Fiscal','2026-07-04','2027-07-04','/documentos/2026/notafiscal_031.pdf',24,13,35,NULL),(32,'Nota Fiscal','2026-05-20','2027-05-20','/documentos/2026/notafiscal_032.pdf',36,41,34,NULL),(33,'Nota Fiscal','2026-07-05','2027-07-05','/documentos/2026/notafiscal_033.pdf',26,35,49,NULL),(34,'Nota Fiscal','2026-02-20','2027-02-20','/documentos/2026/notafiscal_034.pdf',41,42,49,NULL),(35,'Nota Fiscal','2026-01-20','2027-01-20','/documentos/2026/notafiscal_035.pdf',28,30,44,NULL),(36,'Nota Fiscal','2026-02-05','2027-02-05','/documentos/2026/notafiscal_036.pdf',42,39,3,NULL),(37,'Edital','2026-08-27','2026-09-29','/documentos/2026/edital_037.pdf',16,NULL,24,31),(38,'Edital','2026-08-13','2026-09-25','/documentos/2026/edital_038.pdf',15,NULL,10,10),(39,'Edital','2026-12-18','2027-02-06','/documentos/2026/edital_039.pdf',14,NULL,30,43),(40,'Edital','2026-09-16','2026-10-24','/documentos/2026/edital_040.pdf',14,NULL,23,50),(41,'Edital','2026-11-18','2027-01-01','/documentos/2026/edital_041.pdf',44,NULL,3,26),(42,'Edital','2026-12-26','2027-01-25','/documentos/2026/edital_042.pdf',8,NULL,5,8),(43,'Proposta Comercial','2026-11-19','2026-11-25','/documentos/2026/propostacomercial_043.pdf',48,NULL,7,42),(44,'Proposta Comercial','2027-01-16','2027-02-06','/documentos/2027/propostacomercial_044.pdf',31,NULL,29,23),(45,'Proposta Comercial','2026-08-06','2026-08-22','/documentos/2026/propostacomercial_045.pdf',12,NULL,25,45),(46,'Proposta Comercial','2026-11-09','2026-11-26','/documentos/2026/propostacomercial_046.pdf',42,NULL,17,17),(47,'Contrato','2026-10-06','2027-10-06','/documentos/2026/contrato_047.pdf',45,NULL,10,10),(48,'Contrato','2026-09-05','2027-09-05','/documentos/2026/contrato_048.pdf',12,NULL,25,45),(49,'Certidão Negativa','2026-09-17','2027-03-16','/documentos/2026/certidaonegativa_049.pdf',49,NULL,28,NULL),(50,'Certidão Negativa','2026-09-12','2027-03-11','/documentos/2026/certidaonegativa_050.pdf',28,NULL,28,NULL);
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit_cirurgico`
--

DROP TABLE IF EXISTS `kit_cirurgico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kit_cirurgico` (
  `id_kit` int NOT NULL AUTO_INCREMENT,
  `numero_lote` varchar(50) NOT NULL,
  `fabricante` varchar(100) NOT NULL,
  `status_operacional` varchar(30) NOT NULL,
  PRIMARY KEY (`id_kit`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kit_cirurgico`
--

LOCK TABLES `kit_cirurgico` WRITE;
/*!40000 ALTER TABLE `kit_cirurgico` DISABLE KEYS */;
INSERT INTO `kit_cirurgico` VALUES (1,'LT-2026-0001','CirurTech Equipamentos','Em trânsito'),(2,'LT-2026-0002','CirurTech Equipamentos','Em uso'),(3,'LT-2026-0003','Instrumentais Paulista S.A.','Em trânsito'),(4,'LT-2026-0004','MedCirúrgica Ltda','Disponível'),(5,'LT-2026-0005','CirurTech Equipamentos','Disponível'),(6,'LT-2026-0006','Hospimed Instrumentais','Em uso'),(7,'LT-2026-0007','Instrumentais Paulista S.A.','Em uso'),(8,'LT-2026-0008','BioSteril Produtos Médicos','Em uso'),(9,'LT-2026-0009','Hospimed Instrumentais','Em uso'),(10,'LT-2026-0010','Instrumentais Paulista S.A.','Disponível'),(11,'LT-2026-0011','Surgimax Indústria','Em esterilização'),(12,'LT-2026-0012','Hospimed Instrumentais','Em uso'),(13,'LT-2026-0013','CirurTech Equipamentos','Em esterilização'),(14,'LT-2026-0014','Instrumentais Paulista S.A.','Em esterilização'),(15,'LT-2026-0015','MedCirúrgica Ltda','Disponível'),(16,'LT-2026-0016','Hospimed Instrumentais','Disponível'),(17,'LT-2026-0017','Surgimax Indústria','Em uso'),(18,'LT-2026-0018','CirurTech Equipamentos','Disponível'),(19,'LT-2026-0019','Surgimax Indústria','Em trânsito'),(20,'LT-2026-0020','CirurTech Equipamentos','Em trânsito'),(21,'LT-2026-0021','BioSteril Produtos Médicos','Disponível'),(22,'LT-2026-0022','Ortomed Brasil','Em uso'),(23,'LT-2026-0023','Ortomed Brasil','Disponível'),(24,'LT-2026-0024','CirurTech Equipamentos','Disponível'),(25,'LT-2026-0025','CirurTech Equipamentos','Disponível'),(26,'LT-2026-0026','MedCirúrgica Ltda','Disponível'),(27,'LT-2026-0027','Instrumentais Paulista S.A.','Disponível'),(28,'LT-2026-0028','BioSteril Produtos Médicos','Em manutenção'),(29,'LT-2026-0029','CirurTech Equipamentos','Em esterilização'),(30,'LT-2026-0030','Instrumentais Paulista S.A.','Em manutenção'),(31,'LT-2026-0031','BioSteril Produtos Médicos','Disponível'),(32,'LT-2026-0032','MedCirúrgica Ltda','Disponível'),(33,'LT-2026-0033','CirurTech Equipamentos','Disponível'),(34,'LT-2026-0034','Surgimax Indústria','Disponível'),(35,'LT-2026-0035','Instrumentais Paulista S.A.','Disponível'),(36,'LT-2026-0036','Hospimed Instrumentais','Disponível'),(37,'LT-2026-0037','BioSteril Produtos Médicos','Em manutenção'),(38,'LT-2026-0038','CirurTech Equipamentos','Em manutenção'),(39,'LT-2026-0039','MedCirúrgica Ltda','Disponível'),(40,'LT-2026-0040','BioSteril Produtos Médicos','Disponível'),(41,'LT-2026-0041','Instrumentais Paulista S.A.','Disponível'),(42,'LT-2026-0042','Ortomed Brasil','Disponível'),(43,'LT-2026-0043','BioSteril Produtos Médicos','Disponível'),(44,'LT-2026-0044','Instrumentais Paulista S.A.','Disponível'),(45,'LT-2026-0045','CirurTech Equipamentos','Disponível'),(46,'LT-2026-0046','BioSteril Produtos Médicos','Disponível'),(47,'LT-2026-0047','Instrumentais Paulista S.A.','Disponível'),(48,'LT-2026-0048','Surgimax Indústria','Em esterilização'),(49,'LT-2026-0049','Hospimed Instrumentais','Em esterilização'),(50,'LT-2026-0050','Ortomed Brasil','Disponível');
/*!40000 ALTER TABLE `kit_cirurgico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacao`
--

DROP TABLE IF EXISTS `movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacao` (
  `id_movimentacao` int NOT NULL AUTO_INCREMENT,
  `data_envio` date NOT NULL,
  `data_retorno` date DEFAULT NULL,
  `id_kit` int NOT NULL,
  PRIMARY KEY (`id_movimentacao`),
  KEY `fk_movimentacao_kit_cirurgico1_idx` (`id_kit`),
  CONSTRAINT `fk_movimentacao_kit_cirurgico1` FOREIGN KEY (`id_kit`) REFERENCES `kit_cirurgico` (`id_kit`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao`
--

LOCK TABLES `movimentacao` WRITE;
/*!40000 ALTER TABLE `movimentacao` DISABLE KEYS */;
INSERT INTO `movimentacao` VALUES (1,'2026-01-13','2026-01-18',23),(2,'2026-01-18','2026-01-30',23),(3,'2026-01-22','2026-02-01',4),(4,'2026-01-26','2026-02-04',18),(5,'2026-03-04','2026-03-16',2),(6,'2026-03-08','2026-03-15',23),(7,'2026-03-17','2026-03-26',17),(8,'2026-03-31','2026-04-12',2),(9,'2026-04-09','2026-04-14',21),(10,'2026-04-11','2026-04-23',16),(11,'2026-04-26','2026-04-28',10),(12,'2026-05-07','2026-05-10',6),(13,'2026-05-08','2026-05-20',3),(14,'2026-05-09','2026-05-15',7),(15,'2026-05-12','2026-05-14',10),(16,'2026-05-21','2026-06-01',21),(17,'2026-06-04','2026-06-06',16),(18,'2026-06-14','2026-06-20',3),(19,'2026-06-14','2026-06-27',24),(20,'2026-07-04','2026-07-14',6),(21,'2026-07-12','2026-07-22',21),(22,'2026-07-19','2026-07-29',19),(23,'2026-07-20','2026-07-30',8),(24,'2026-07-28','2026-08-06',2),(25,'2026-08-07','2026-08-17',12),(26,'2026-08-14','2026-08-19',18),(27,'2026-08-17','2026-08-25',15),(28,'2026-08-31','2026-09-03',8),(29,'2026-09-05','2026-09-07',1),(30,'2026-09-09','2026-09-17',13),(31,'2026-09-12','2026-09-22',3),(32,'2026-09-17','2026-09-26',22),(33,'2026-09-25','2026-10-06',6),(34,'2026-09-28','2026-10-02',8),(35,'2026-09-28','2026-10-02',18),(36,'2026-10-03','2026-10-08',17),(37,'2026-10-03','2026-10-17',11),(38,'2026-10-03','2026-10-11',9),(39,'2026-10-25',NULL,8),(40,'2026-10-27',NULL,7),(41,'2026-10-28',NULL,2),(42,'2026-10-28',NULL,9),(43,'2026-10-30',NULL,6),(44,'2026-10-31',NULL,17),(45,'2026-11-06',NULL,22),(46,'2026-11-06',NULL,12),(47,'2026-11-07',NULL,3),(48,'2026-11-08',NULL,19),(49,'2026-11-11',NULL,20),(50,'2026-11-12',NULL,1);
/*!40000 ALTER TABLE `movimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processo_licitatorio`
--

DROP TABLE IF EXISTS `processo_licitatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processo_licitatorio` (
  `id_processo` int NOT NULL AUTO_INCREMENT,
  `numero_processo` varchar(50) NOT NULL,
  `status_processo` varchar(30) NOT NULL,
  `data_limite` date NOT NULL,
  `id_contratante` int NOT NULL,
  PRIMARY KEY (`id_processo`),
  KEY `fk_processo_licitatorio_contratante1_idx` (`id_contratante`),
  CONSTRAINT `fk_processo_licitatorio_contratante1` FOREIGN KEY (`id_contratante`) REFERENCES `contratante` (`id_contratante`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processo_licitatorio`
--

LOCK TABLES `processo_licitatorio` WRITE;
/*!40000 ALTER TABLE `processo_licitatorio` DISABLE KEYS */;
INSERT INTO `processo_licitatorio` VALUES (1,'PE-001/2026','Em análise','2027-02-21',7),(2,'PE-002/2026','Encerrado','2026-10-06',32),(3,'CC-003/2026','Homologado','2026-10-01',23),(4,'PE-004/2026','Homologado','2026-09-15',7),(5,'TP-005/2026','Homologado','2026-09-06',30),(6,'TP-006/2026','Homologado','2026-08-02',4),(7,'TP-007/2026','Aberto','2027-03-01',7),(8,'PE-008/2026','Aberto','2027-01-25',5),(9,'CC-009/2026','Aberto','2027-03-26',7),(10,'CC-010/2026','Homologado','2026-09-25',10),(11,'CC-011/2026','Encerrado','2026-11-10',28),(12,'PE-012/2026','Homologado','2026-10-24',5),(13,'TP-013/2026','Encerrado','2026-08-12',17),(14,'CC-014/2026','Em análise','2027-02-04',20),(15,'PE-015/2026','Aberto','2027-03-26',27),(16,'CC-016/2026','Homologado','2026-07-18',17),(17,'TP-017/2026','Aberto','2026-11-26',17),(18,'PE-018/2026','Aberto','2027-02-12',34),(19,'CC-019/2026','Homologado','2026-11-13',16),(20,'PE-020/2026','Encerrado','2026-10-10',22),(21,'CC-021/2026','Encerrado','2026-09-01',26),(22,'TP-022/2026','Aberto','2027-02-22',7),(23,'CC-023/2026','Em análise','2027-02-06',29),(24,'CC-024/2026','Aberto','2027-01-10',23),(25,'TP-025/2026','Em análise','2026-12-27',31),(26,'PE-026/2026','Aberto','2027-01-01',3),(27,'PE-027/2026','Aberto','2026-11-28',35),(28,'PE-028/2026','Encerrado','2026-08-29',28),(29,'CC-029/2026','Aberto','2027-01-13',17),(30,'PE-030/2026','Homologado','2026-10-14',5),(31,'PE-031/2026','Homologado','2026-09-29',24),(32,'TP-032/2026','Encerrado','2026-08-22',35),(33,'PE-033/2026','Aberto','2026-11-26',27),(34,'PE-034/2026','Encerrado','2026-08-29',5),(35,'PE-035/2026','Cancelado','2026-08-06',25),(36,'PE-036/2026','Homologado','2026-09-09',2),(37,'CC-037/2026','Em análise','2027-01-26',29),(38,'PE-038/2026','Homologado','2026-07-27',10),(39,'CC-039/2026','Encerrado','2026-09-23',4),(40,'PE-040/2026','Em análise','2027-02-18',27),(41,'TP-041/2026','Em análise','2027-02-11',10),(42,'PE-042/2026','Em análise','2026-11-25',7),(43,'PE-043/2026','Aberto','2027-02-06',30),(44,'PE-044/2026','Homologado','2026-10-14',19),(45,'PE-045/2026','Homologado','2026-08-22',25),(46,'PE-046/2026','Aberto','2027-01-01',5),(47,'PE-047/2026','Aberto','2027-01-04',6),(48,'CC-048/2026','Homologado','2026-10-21',17),(49,'PE-049/2026','Aberto','2026-12-03',8),(50,'PE-050/2026','Homologado','2026-10-24',23);
/*!40000 ALTER TABLE `processo_licitatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) NOT NULL,
  `codigo_rastreabilidade` varchar(50) NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `codigo_rastreabilidade_UNIQUE` (`codigo_rastreabilidade`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Pinça Kelly reta 14 cm','BR-RST-000001'),(2,'Pinça Kelly curva 14 cm','BR-RST-000002'),(3,'Pinça Halsted mosquito reta 12 cm','BR-RST-000003'),(4,'Pinça Halsted mosquito curva 12 cm','BR-RST-000004'),(5,'Pinça Allis 15 cm','BR-RST-000005'),(6,'Pinça Kocher reta 16 cm','BR-RST-000006'),(7,'Pinça Backhaus 13 cm','BR-RST-000007'),(8,'Pinça de dissecção anatômica 14 cm','BR-RST-000008'),(9,'Pinça de dissecção dente de rato 14 cm','BR-RST-000009'),(10,'Pinça Adson com dente 12 cm','BR-RST-000010'),(11,'Pinça Adson sem dente 12 cm','BR-RST-000011'),(12,'Pinça Foerster curva 18 cm','BR-RST-000012'),(13,'Pinça Rochester-Pean curva 16 cm','BR-RST-000013'),(14,'Pinça Pozzi 24 cm','BR-RST-000014'),(15,'Tesoura Mayo reta 15 cm','BR-RST-000015'),(16,'Tesoura Mayo curva 15 cm','BR-RST-000016'),(17,'Tesoura Metzenbaum curva 18 cm','BR-RST-000017'),(18,'Tesoura íris reta 11 cm','BR-RST-000018'),(19,'Porta-agulha Mayo-Hegar 16 cm','BR-RST-000019'),(20,'Porta-agulha Mathieu 14 cm','BR-RST-000020'),(21,'Cabo de bisturi nº 3','BR-RST-000021'),(22,'Cabo de bisturi nº 4','BR-RST-000022'),(23,'Afastador Farabeuf (par)','BR-RST-000023'),(24,'Afastador Senn-Miller (par)','BR-RST-000024'),(25,'Afastador Volkmann 4 garras','BR-RST-000025'),(26,'Afastador Doyen 3 cm','BR-RST-000026'),(27,'Afastador autostático Gelpi','BR-RST-000027'),(28,'Afastador Balfour','BR-RST-000028'),(29,'Cuba redonda inox 500 ml','BR-RST-000029'),(30,'Cuba rim inox 26 cm','BR-RST-000030'),(31,'Bacia inox 3 L','BR-RST-000031'),(32,'Cânula de aspiração Yankauer','BR-RST-000032'),(33,'Cureta de Volkmann nº 2','BR-RST-000033'),(34,'Espéculo vaginal Collin médio','BR-RST-000034'),(35,'Campo cirúrgico estéril 80x80 cm','BR-RST-000035'),(36,'Compressa de gaze estéril 7,5x7,5 cm','BR-RST-000036'),(37,'Avental cirúrgico estéril descartável','BR-RST-000037'),(38,'Luva cirúrgica estéril tam. 7,5','BR-RST-000038'),(39,'Luva cirúrgica estéril tam. 8,0','BR-RST-000039'),(40,'Lâmina de bisturi nº 11','BR-RST-000040'),(41,'Lâmina de bisturi nº 15','BR-RST-000041'),(42,'Lâmina de bisturi nº 22','BR-RST-000042'),(43,'Seringa descartável 20 ml','BR-RST-000043'),(44,'Fio de sutura nylon 3-0','BR-RST-000044'),(45,'Fio de sutura algodão 2-0','BR-RST-000045'),(46,'Dreno de Penrose nº 1','BR-RST-000046'),(47,'Sonda uretral nº 12','BR-RST-000047'),(48,'Cureta uterina de Sims','BR-RST-000048'),(49,'Pinça saca-bocado óssea','BR-RST-000049'),(50,'Osteótomo reto 10 mm','BR-RST-000050');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil_acesso` varchar(50) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Mariana Oliveira','mariana.oliveira@kitsmed.com.br','12068c9fdbddc4efb7c2aa62c28cf156dd7c60e61cc47126aa38a01f92d383b8','Administrador'),(2,'João Cardoso','joao.cardoso@kitsmed.com.br','921cd086e417a0eada86d2d0fe6b3f3054de11ac42d0efb834957baa1af01636','Comercial'),(3,'Carla Gomes','carla.gomes@kitsmed.com.br','1ce2dd478e84b2a236b2da0493d49bf4dd9c922df534c44923405c4253d08ff0','Logística'),(4,'Nicolas Cardoso','nicolas.cardoso@kitsmed.com.br','f0aada2c15232c613db26cac2dc09955942fc9a0a0154c8d48e2e819b713f575','Licitações'),(5,'Paulo Dias','paulo.dias@kitsmed.com.br','f4e2f361b223e86e92e4df7e9a1b0fbc4d56b2c3fe70d63a94b07ad9679c9058','Licitações'),(6,'Felipe Vieira','felipe.vieira@kitsmed.com.br','366bf25538428cedae8e657efd4e111edac50ef90528d10acc3ea14d0f22c4c8','Licitações'),(7,'Mariana Gomes','mariana.gomes@kitsmed.com.br','ab1ee4b1bf0cefb8e7a0b7c3c9498c7aa6d3d8cee29d355130e3f7da0ab06ea9','Qualidade'),(8,'Nicolas Martins','nicolas.martins@kitsmed.com.br','60f807753922c89102212c119003b1c53acb7e501182e13b39eeef6d8d25db9c','Comercial'),(9,'Karen Gomes','karen.gomes@kitsmed.com.br','e1e2b6d90d2dd61a7e6d26efd74d39cf6ac61b5a8261baddbb96b791cce8f7f5','Comercial'),(10,'Rafaela Barbosa','rafaela.barbosa@kitsmed.com.br','80261cccf38b3dd254e220156550974f85034f642b992388f40fc7f46c802be7','Comercial'),(11,'Gabriela Gomes','gabriela.gomes@kitsmed.com.br','8fb8bf9a460f43c4169c34176507fc1ed5373fdbd761a80ab2303dbade6ba5ce','Logística'),(12,'Henrique Nogueira','henrique.nogueira@kitsmed.com.br','f97c69b048becf1b19c01f8c14689e685193eabf9f66d00a664d1d962469f19f','Logística'),(13,'Karen Vieira','karen.vieira@kitsmed.com.br','933d0b8366c6273ef285684ec4c7babf5982528109cb638d41363d55daef002a','Logística'),(14,'Olívia Ferreira','olivia.ferreira@kitsmed.com.br','86846d957fa10f5848ce33691fb0ec5b17f5c0e553e4ef768002f9f5a2eb0e36','Qualidade'),(15,'Gabriela Almeida','gabriela.almeida@kitsmed.com.br','02e8199bb01b4013bfe6e636c2e07ce547fad49f083c8398e367d3667cd43d81','Logística'),(16,'Gabriela Lima','gabriela.lima@kitsmed.com.br','59c417e7c250e01260d6b1e50188f51dd33dc32acf0986fdd273918664189607','Qualidade'),(17,'Diego Cardoso','diego.cardoso@kitsmed.com.br','0205f8263702ddb58e351e30ad22f5359ff80c051ea284d7d8fa3b172ccddd09','Logística'),(18,'Nicolas Dias','nicolas.dias@kitsmed.com.br','e3b3034e25468fb58d084b0c8f20565fd91044a019719d2dd2b70b1f0e82d9e4','Licitações'),(19,'Gabriela Vieira','gabriela.vieira@kitsmed.com.br','c36fa748d5551918f4c31ab8521332558d08fbace69025cdfb30cdd5c9eb5de2','Qualidade'),(20,'Ana Vieira','ana.vieira@kitsmed.com.br','bd681655c5ed7fa073cead5990f2718eed29f0f6db5706469c8c17e41b140d21','Logística'),(21,'Isabela Lima','isabela.lima@kitsmed.com.br','108c022989f866d86d352f1ad23f1dc7f900128a4d017b0d606715cef416d949','Qualidade'),(22,'Karen Barbosa','karen.barbosa@kitsmed.com.br','d979d69eb17d5c1a732c5ce21aad79c267c72d8d7ceaa5b0d29b6ed4cafc0741','Logística'),(23,'Ana Martins','ana.martins@kitsmed.com.br','d02e0e8c9ebd34d8d3eae12473c48eae88cd43cf6e78aa95fec17230cf379434','Licitações'),(24,'João Lima','joao.lima@kitsmed.com.br','36392d4480ea739de793d2030b15c0a940646560ab7a0a052db3f4d89ce9c5a7','Administrador'),(25,'Carla Cardoso','carla.cardoso@kitsmed.com.br','9d6dba21b64d6bf6992b467a85f6272ca5187c8e1e717d5b9e538cf54e5d5cfd','Administrador'),(26,'Olívia Cardoso','olivia.cardoso@kitsmed.com.br','dfd889c7e64b55c44dabb7783bfee3c860e87145b41c83d6ab649bf7c17fe747','Logística'),(27,'Olívia Barbosa','olivia.barbosa@kitsmed.com.br','d66348b36717e87e55c861d1613c720c3b86045d889c0bedf42269a56e021d91','Comercial'),(28,'Olívia Oliveira','olivia.oliveira@kitsmed.com.br','763835edad812ae09de24b1e918ec0b06ef5569fbf6e30db4fd91d9b52cfc7e3','Licitações'),(29,'Sérgio Pereira','sergio.pereira@kitsmed.com.br','244b4f7b57540b0fde72f703380681f1fba0a43427fe1655e7a99e15f97c3ea8','Comercial'),(30,'Eduarda Cardoso','eduarda.cardoso@kitsmed.com.br','2562d99e9061e9155c384725ea35490a0aa9d8ffd80a2a570ccd2387d9e51065','Logística'),(31,'Olívia Nogueira','olivia.nogueira@kitsmed.com.br','28782dc322bbdeb8b8b9ae5eb81b39076a0bf6a55582ff1468ec38297561fa99','Licitações'),(32,'Bruno Teixeira','bruno.teixeira@kitsmed.com.br','c22cbdc00ea9f7a2614fa52861f9816ce15365d3acf1c689a3a4b97e61d7171d','Administrador'),(33,'Rafaela Almeida','rafaela.almeida@kitsmed.com.br','59d5e200650708261a72ac1aec459514eae112b63c488737786b729ccafda4ef','Comercial'),(34,'Eduarda Martins','eduarda.martins@kitsmed.com.br','e0acfb19e11e02d19fdf652277099547097bd3f9d4c88b839717c226dde4204b','Logística'),(35,'Bruno Gomes','bruno.gomes@kitsmed.com.br','2e43f284e63218a7e02d1136116e8880993df4565b65852b97354b51775aa83c','Qualidade'),(36,'Diego Oliveira','diego.oliveira@kitsmed.com.br','e49c19b4e419c2352c0e96a44e87f143694c6281309fb5394887cd32762dcb6f','Qualidade'),(37,'Vinícius Martins','vinicius.martins@kitsmed.com.br','864c84825d80cf4e7a66bffd0c3bd2176b43701ba2705bfe8cbc8ee2e755fb86','Licitações'),(38,'Bruno Dias','bruno.dias@kitsmed.com.br','a8459d961331d404ef9a371964a3727bacdbaf187a019e592466790fcaaa7e1f','Logística'),(39,'Olívia Almeida','olivia.almeida@kitsmed.com.br','04550dd19527389a0176b147883f3046ea05b284de8fbbd0f5ede62784ea7540','Administrador'),(40,'Rafaela Cardoso','rafaela.cardoso@kitsmed.com.br','871303d76d987a04393d0299a027bd74af39523df49fc09fb1485d2b6cdd0d13','Comercial'),(41,'Felipe Cardoso','felipe.cardoso@kitsmed.com.br','2559857088276e79ccbe22450ebe93c5153b86963d5611d323d11ea9e1573617','Licitações'),(42,'Tatiane Martins','tatiane.martins@kitsmed.com.br','69320392a90820a1bf09f3068208b2a85d6d5a3d64205d3c1014665737c9ae90','Logística'),(43,'Karen Lima','karen.lima@kitsmed.com.br','38cbdc0c89701cd8f7e5964c95eb95fd36d7c87c0657415ab3ceb8841d70ebaa','Comercial'),(44,'Eduarda Ribeiro','eduarda.ribeiro@kitsmed.com.br','3dba3c2a8ade12e8f45418eb068502f611a3b2585329c7c456ebaa8a6ffaab52','Licitações'),(45,'Diego Nogueira','diego.nogueira@kitsmed.com.br','147f31b7a3b355d60b32a25115c22b54e1009d95d4a50fee6eaf295356d058c8','Licitações'),(46,'Felipe Ribeiro','felipe.ribeiro@kitsmed.com.br','5b06c9b7fca2e1a6f9046b45c922d1c5aa04309c72eefd058994c08c0fbf1739','Licitações'),(47,'Henrique Teixeira','henrique.teixeira@kitsmed.com.br','ff48e2f0bc6e5f673cca04ffdf1887e57c1cbbac47d3dfe4d92894b8881a5b3b','Qualidade'),(48,'Felipe Pereira','felipe.pereira@kitsmed.com.br','83137d2c9e83f0c7a051c1111a095c9288c484cca77e32c29fee913cb85e5da9','Comercial'),(49,'Felipe Nogueira','felipe.nogueira@kitsmed.com.br','840e07988fec7642db3356cf329162ba5dc3d8ebc6c5c49f468fed61eadc8c81','Logística'),(50,'João Almeida','joao.almeida@kitsmed.com.br','ee938e6e9ddbeb640a0f79af185b599750a0245a6de085baf788e92ffe46232a','Qualidade');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-17 19:37:02
