CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cod_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `endereco` text NOT NULL,
  `endereco_1` text,
  `endereco_2` text,
  `num_endereco` varchar(20) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` char(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `fone_fixo` varchar(14) DEFAULT NULL,
  `celular` varchar(14) NOT NULL,
  `celular_1` varchar(14) DEFAULT NULL,
  `email_comercial` varchar(100) DEFAULT NULL,
  `email_contato` varchar(100) NOT NULL,
  `email_contato1` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

CREATE DEFINER=`root`@`localhost`*/ TRIGGER `cliente_AFTER_INSERT` AFTER INSERT ON `cliente` FOR EACH ROW BEGIN
INSERT INTO cliente_historico 
VALUE (NOW(),
'INSERIR',
NEW.nome,
 NEW.cpf,
  NEW.endereco,
   NEW.endereco_1,
    NEW.endereco_2,
     NEW.num_endereco,
      NEW.bairro,
       NEW.cidade,
        NEW.uf,
         NEW.cep,
          NEW.fone_fixo,
           NEW.celular,
            NEW.celular_1,
             NEW.email_comercial,
              NEW.email_contato,
               NEW.email_contato1);
END;

CREATE DEFINER=`root`@`localhost` TRIGGER `cliente_AFTER_UPDATE` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
INSERT INTO cliente_historico 
VALUE (NOW(),
'UPDATE',
NEW.nome,
 NEW.cpf,
  NEW.endereco,
   NEW.endereco_1,
    NEW.endereco_2,
     NEW.num_endereco,
      NEW.bairro,
       NEW.cidade,
        NEW.uf,
         NEW.cep,
          NEW.fone_fixo,
           NEW.celular,
            NEW.celular_1,
             NEW.email_comercial,
              NEW.email_contato,
               NEW.email_contato1);



END */;;


--
-- Table structure for table `cliente_historico`
--

DROP TABLE IF EXISTS `cliente_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_historico` (
  `data` datetime DEFAULT NULL,
  `acao` varchar(10) DEFAULT NULL,
  `novo_nome` varchar(100) NOT NULL,
  `novo_cpf` varchar(20) NOT NULL,
  `novo_endereco` text NOT NULL,
  `novo_endereco_1` text,
  `novo_endereco_2` text,
  `novo_num_endereco` varchar(20) NOT NULL,
  `novo_bairro` varchar(50) NOT NULL,
  `novo_cidade` varchar(50) NOT NULL,
  `novo_uf` varchar(2) NOT NULL,
  `novo_cep` varchar(10) NOT NULL,
  `novo_fone_fixo` varchar(14) DEFAULT NULL,
  `novo_celular` varchar(14) NOT NULL,
  `novo_celular_1` varchar(14) DEFAULT NULL,
  `novo_email_comercial` varchar(100) DEFAULT NULL,
  `novo_email_contato` varchar(100) NOT NULL,
  `novo_email_contato1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `cod_empresa` int NOT NULL AUTO_INCREMENT,
  `nome_razao_soc` varchar(255) NOT NULL,
  `nome_fantasia` varchar(255) NOT NULL,
  `cnpj` bigint NOT NULL,
  `endereco` text NOT NULL,
  `num_endereco` varchar(20) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` char(20) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `fone_fixo` varchar(14) DEFAULT NULL,
  `celular` varchar(14) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `inscri_estad` varchar(9) DEFAULT NULL,
  `inscr_muni` varchar(11) DEFAULT NULL,
  `data_criacao` varchar(10) DEFAULT NULL,
  `responsavel` varchar(150) NOT NULL,
  `cliente_copy1_cod_cliente` int NOT NULL,
  `fornecedor_cod_empresa` int NOT NULL,
  `cliente_cod_cliente` int NOT NULL,
  PRIMARY KEY (`cod_empresa`),
  KEY `fk_empresa_fornecedor1_idx` (`fornecedor_cod_empresa`),
  KEY `fk_empresa_cliente1_idx` (`cliente_cod_cliente`),
  CONSTRAINT `fk_empresa_cliente1` FOREIGN KEY (`cliente_cod_cliente`) REFERENCES `cliente` (`cod_cliente`),
  CONSTRAINT `fk_empresa_fornecedor1` FOREIGN KEY (`fornecedor_cod_empresa`) REFERENCES `fornecedor` (`cod_fornec`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE 50017 DEFINER=`root`@`localhost` TRIGGER `empresa_AFTER_INSERT` AFTER INSERT ON `empresa` FOR EACH ROW BEGIN
INSERT INTO empresa_historico VALUE 
(NOW(),
'INSERIR',
NEW.nome_razao_soc,
NEW.nome_fantasia,
 NEW.cnpj,
 NEW.endereco,
 NEW.num_endereco,
 NEW.bairro,
 NEW.cidade,
 NEW.uf, 
 NEW.cep,
 NEW.fone_fixo,
 NEW.celular,
 NEW.email,
 NEW.inscri_estad,
 NEW.inscr_muni,
 NEW.data_criacao,
 NEW.responsavel, 
 NEW.cliente_copy1_cod_cliente,
 NEW.fornecedor_cod_empresa,
 NEW.cliente_cod_cliente);
END ; 

CREATE DEFINER=`root`@`localhost` TRIGGER `empresa_AFTER_UPDATE` AFTER UPDATE ON `empresa` FOR EACH ROW BEGIN
INSERT INTO empresa_historico VALUE 
(NOW(),
'UPDATE',
NEW.nome_razao_soc,
NEW.nome_fantasia,
 NEW.cnpj,
 NEW.endereco,
 NEW.num_endereco,
 NEW.bairro,
 NEW.cidade,
 NEW.uf, 
 NEW.cep,
 NEW.fone_fixo,
 NEW.celular,
 NEW.email,
 NEW.inscri_estad,
 NEW.inscr_muni,
 NEW.data_criacao,
 NEW.responsavel, 
 NEW.cliente_copy1_cod_cliente,
 NEW.fornecedor_cod_empresa,
 NEW.cliente_cod_cliente);
END */;

--
-- Table structure for table `empresa_historico`
--

DROP TABLE IF EXISTS `empresa_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_historico` (
  `data` datetime DEFAULT NULL,
  `acao` varchar(10) DEFAULT NULL,
  `novo_nome_razao` varchar(250) NOT NULL,
  `novo_nome_fantasia` varchar(250) NOT NULL,
  `novo_cnpj` varchar(20) NOT NULL,
  `novo_endereco` text NOT NULL,
  `novo_num_endereco` varchar(20) NOT NULL,
  `novo_bairro` varchar(50) NOT NULL,
  `novo_cidade` varchar(50) NOT NULL,
  `novo_uf` char(2) NOT NULL,
  `novo_cep` varchar(10) NOT NULL,
  `novo_fone_fixo` varchar(14) DEFAULT NULL,
  `novo_celular` varchar(14) NOT NULL,
  `novo_email` varchar(100) DEFAULT NULL,
  `novo_inscri_estad` varchar(100) NOT NULL,
  `novo_inscri_muni` varchar(100) DEFAULT NULL,
  `novo_data_criacao` varchar(100) NOT NULL,
  `responsavel` varchar(150) NOT NULL,
  `novo_cliente_copy1_cod_cliente` int NOT NULL,
  `novo_fornecedor_cod_empresa` int NOT NULL,
  `novo_cliente_cod_cliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `cod_fornec` int NOT NULL AUTO_INCREMENT,
  `nome_razao_soc` varchar(255) NOT NULL,
  `nome_fantasia` varchar(255) NOT NULL,
  `cnpj` bigint NOT NULL,
  `endereco` text NOT NULL,
  `endereco_1` text NOT NULL,
  `endereco_2` text NOT NULL,
  `num_endereco` varchar(20) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` char(20) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `fone_fixo` varchar(14) DEFAULT NULL,
  `celular` varchar(14) NOT NULL,
  `celular_1` varchar(14) NOT NULL,
  `email_comercial` varchar(100) DEFAULT NULL,
  `email_contato` varchar(45) DEFAULT NULL,
  `email_contato2` varchar(45) DEFAULT NULL,
  `inscri_estad` varchar(9) DEFAULT NULL,
  `inscr_muni` varchar(11) DEFAULT NULL,
  `data_criacao` varchar(10) DEFAULT NULL,
  `responsavel` varchar(150) NOT NULL,
  PRIMARY KEY (`cod_fornec`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
 
 /* CREATING A TRIGGER FOR INSERT, UPDATE */

CREATE DEFINER=`root`@`localhost`TRIGGER `fornecedor_AFTER_INSERT` AFTER INSERT ON `fornecedor` FOR EACH ROW BEGIN
INSERT INTO fornecedor_historico VALUE 
(NOW(),
'INSERIR',
NEW.nome_razao_soc,
NEW.nome_fantasia, 
NEW.cnpj,
NEW.endereco,
NEW.endereco_1,
NEW.endereco_2, 
NEW.num_endereco,
NEW.bairro,
NEW.cidade,
NEW.uf,
NEW.cep, 
NEW.fone_fixo, 
NEW.celular,
NEW.celular_1,
NEW.email_comercial,
NEW.email_contato,
NEW.email_contato2,
NEW.inscri_estad, 
NEW.inscr_muni, 
NEW.data_criacao,
NEW.responsavel);
END ;
CREATE DEFINER=`root`@`localhost`TRIGGER `fornecedor_AFTER_UPDATE` AFTER UPDATE ON `fornecedor` FOR EACH ROW BEGIN
INSERT INTO fornecedor_historico 
VALUE (NOW(),
'UPDATE',
NEW.nome_razao_soc,
NEW.nome_fantasia, 
NEW.cnpj,
NEW.endereco,
NEW.endereco_1,
NEW.endereco_2, 
NEW.num_endereco,
NEW.bairro,
NEW.cidade,
NEW.uf,
NEW.cep, 
NEW.fone_fixo,
NEW.celular,
NEW.celular_1,
NEW.email_comercial,
NEW.email_contato,
NEW.email_contato2, 
NEW.inscri_estad, 
NEW.inscr_muni,
NEW.data_criacao,
NEW.responsavel);
END ;

--
-- Table structure for table `fornecedor_historico`
--

DROP TABLE IF EXISTS `fornecedor_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor_historico` (
  `data` datetime DEFAULT NULL,
  `acao` varchar(10) DEFAULT NULL,
  `nome_razao_soc` varchar(255) NOT NULL,
  `nome_fantasia` varchar(255) NOT NULL,
  `cnpj` bigint NOT NULL,
  `novo_endereco` text NOT NULL,
  `novo_endereco_1` text,
  `novo_endereco_2` text,
  `novo_num_endereco` varchar(20) NOT NULL,
  `novo_bairro` varchar(50) NOT NULL,
  `novo_cidade` varchar(50) NOT NULL,
  `novo_uf` varchar(2) NOT NULL,
  `novo_cep` varchar(10) NOT NULL,
  `novo_fone_fixo` varchar(14) DEFAULT NULL,
  `novo_celular` varchar(14) NOT NULL,
  `novo_celular_1` varchar(14) DEFAULT NULL,
  `novo_email_comercial` varchar(100) DEFAULT NULL,
  `novo_email_contato` varchar(100) NOT NULL,
  `novo_email_contato2` varchar(100) DEFAULT NULL,
  `inscri_estad` varchar(9) DEFAULT NULL,
  `inscr_muni` varchar(11) DEFAULT NULL,
  `data_criacao` varchar(10) DEFAULT NULL,
  `responsavel` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
