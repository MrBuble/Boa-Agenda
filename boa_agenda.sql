-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: boa_agenda
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agenda` (
  `id_consulta` int(11) NOT NULL,
  `hora` time DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `atendente` int(11) DEFAULT NULL,
  KEY `FK_usuarios_Medico_idx` (`usuario`),
  KEY `FK_Atendente_idx` (`atendente`),
  CONSTRAINT `FK_Atendente` FOREIGN KEY (`atendente`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `sobrenome` varchar(50) DEFAULT NULL,
  `cep` varchar(15) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `celular` varchar(12) DEFAULT NULL,
  `numero` varchar(4) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `login` varchar(8) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `endereco` varchar(70) DEFAULT NULL,
  `cpf` varchar(12) DEFAULT NULL,
  `rg` varchar(12) DEFAULT NULL,
  `tipo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'boa_agenda'
--

--
-- Dumping routines for database 'boa_agenda'
--
/*!50003 DROP PROCEDURE IF EXISTS `pr_in_agenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_in_agenda`(
in `_hora` time,
in `_dia` date ,
in `_usuario` int,
in `_atendente` int
)
begin 
INSERT INTO `boa_agenda`.`agenda`
(`id_consulta`,
`hora`,
`dia`,
`usuario`,
`atendente`)
VALUES
(
`_id_consulta`,
`_hora`,
`_dia`,
`_usuario`,
`_atendente`);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_in_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_in_user`(IN `_nome` VARCHAR(50), IN `_sobrenome` VARCHAR(50), IN `_cep` VARCHAR(15), IN `_telefone` VARCHAR(11), IN `_celular` VARCHAR(12), IN `_numero` VARCHAR(4), IN `_email` VARCHAR(50), IN `_login` VARCHAR(8), IN `_senha` VARCHAR(8), IN `_endereco` VARCHAR(70), IN `_cpf` VARCHAR(12), IN `_rg` VARCHAR(12), IN `_tipo` INT)
begin
DECLARE EXIT HANDLER for SQLEXCEPTION
begin
	 SELECT 'erro desconhecido';
end;

	IF(!EXISTS(SELECT (1) from `usuarios` where cpf = _cpf OR rg = _rg)) THEN    
        INSERT INTO `usuarios`(      
            `nome`
            ,`sobrenome`
            ,`cep`
            ,`telefone`
            ,`celular`
            ,`numero`
            ,`email`
            ,`login`
            ,`senha`
            ,`endereco`
            ,`cpf`
            ,`rg`
        	,`tipo`) 
            VALUES (
            `_nome`
            ,`_sobrenome`
            ,`_cep`
            ,`_telefone`
            ,`_celular`
            ,`_numero`
            ,`_email`
            ,`_login`
            ,`_senha`
            ,`_endereco`
            ,`_cpf`
            ,`_rg`
            ,`_tipo`
            );
            SELECT 'Cadastro realizado com sucesso';
        ELSE 
        	select 'cpf ou rg ja cadastrados';
		end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_up_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_up_user`(IN `_id` INT, IN `_nome` VARCHAR(50), IN `_sobrenome` VARCHAR(50), IN `_cep` VARCHAR(15), IN `_telefone` VARCHAR(11), IN `_celular` VARCHAR(12), IN `_numero` VARCHAR(4), IN `_email` VARCHAR(50), IN `_login` VARCHAR(8), IN `_senha` VARCHAR(8), IN `_endereco` VARCHAR(70), IN `_cpf` VARCHAR(12), IN `_rg` VARCHAR(12), IN `_tipo` INT)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'erro desconhecido';
    END;  
IF(!EXISTS(SELECT (1) FROM `usuarios` WHERE cpf = _cpf and id_usuario = _id) OR
     !EXISTS(SELECT(1) FROM `usuarios` WHERE rg = _rg and id_usuario = _id)) THEN
UPDATE
    `usuarios`
SET
    `nome` = `_nome`,
    `sobrenome` = `_sobrenome`,
    `cep` = `_cep`,
    `telefone` = `_telefone`,
    `celular` = `_celular`,
    `numero` = `_numero`,
    `email` = `_email`,
    `login` = `_login`,
    `senha` = `_senha`,
    `endereco` = `_endereco`,
    `cpf` = `_cpf`,
    `rg` = `_rg`,
    `tipo` = `_tipo`
WHERE
    `id_usuario` = `_id`;
SELECT
    'Dados atualizado com sucesso'; ELSE
SELECT
    'cpf ou rg ja cadastrados';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-18 22:51:14