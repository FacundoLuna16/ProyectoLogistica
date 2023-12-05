-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: swiftlogix
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('000c151a-382e-4973-8230-64f10e2d4047',NULL,'idp-review-profile','master','9773918f-0674-4080-80d8-7027b88e59d1',0,10,_binary '\0',NULL,'c52e218e-4218-41b9-aa1c-ad0b072c1f6a'),('017ca6ef-fe1c-421a-8ccb-001380a7668d',NULL,'basic-auth-otp','siglo21','4cb892c6-3648-4ef6-a120-72f5cc78c35e',3,20,_binary '\0',NULL,NULL),('02187faf-3244-4780-928d-f79eb594816d',NULL,NULL,'master','9a0684cd-31cc-44c9-9919-773aef5f14fe',2,20,_binary '','de61622f-e5a8-4f18-9283-68a8af78577d',NULL),('027defd0-76d5-4648-b7e1-c0d04122f1c5',NULL,'conditional-user-configured','master','9cb74f9b-f3ee-405f-8939-e65be0485103',0,10,_binary '\0',NULL,NULL),('02cf1dd3-1078-4fcc-bca3-83eb0b15afae',NULL,'reset-credential-email','siglo21','716f31c6-5f8e-4d02-82e1-ade77e8bfb4f',0,20,_binary '\0',NULL,NULL),('038c9658-7eb6-43ff-8496-db4d97ed1f9c',NULL,'auth-cookie','master','20b19cfc-a4e9-428e-8563-24beb886afc7',2,10,_binary '\0',NULL,NULL),('04d60908-06e5-4b65-9cd2-e8a5cffcbc8a',NULL,NULL,'master','b2a61932-f148-4c71-a67e-d301b8f4d51a',1,20,_binary '','4c894ef6-21e5-4824-a13f-245d3f2a4401',NULL),('06b3fe4e-e6b8-4c64-b5d0-2521b5097e73',NULL,'reset-password','siglo21','716f31c6-5f8e-4d02-82e1-ade77e8bfb4f',0,30,_binary '\0',NULL,NULL),('08d53631-e1d2-45ca-9e90-ad2e45f727c1',NULL,'client-secret-jwt','master','c6cb4b6c-e47e-42ba-ab68-7edb0728dd17',2,30,_binary '\0',NULL,NULL),('08fab4b7-25af-4baf-b709-954ee86b79a3',NULL,'http-basic-authenticator','master','0bc73f64-33c5-46eb-a58f-f8ab06a23c21',0,10,_binary '\0',NULL,NULL),('0c94960c-e232-4c3c-bdaa-30138b82e585',NULL,NULL,'siglo21','06d8ce3f-a460-4c06-ac3a-25f3433cd8fb',1,20,_binary '','97f105b6-8117-4177-9580-ce367bdc57e9',NULL),('0cec7600-76ff-47dc-8c0c-44647bbde21b',NULL,NULL,'siglo21','13a7652a-a5b1-42be-ad90-d83cebddbcb3',0,20,_binary '','0406f843-5f0e-4288-8823-e16b9685dd59',NULL),('0dfb3960-8e75-4016-9160-4f2d1488370d',NULL,'idp-create-user-if-unique','siglo21','d661c000-8cd5-4a04-8169-e91f396cfb5a',2,10,_binary '\0',NULL,'00c8d410-367a-420e-b120-47c8dcbe74bd'),('1675d2dd-e7c5-4c91-8ab3-245439a818c5',NULL,'idp-confirm-link','siglo21','13a7652a-a5b1-42be-ad90-d83cebddbcb3',0,10,_binary '\0',NULL,NULL),('1d978336-5499-4b53-b8af-c6c32bbc9612',NULL,NULL,'master','20b19cfc-a4e9-428e-8563-24beb886afc7',2,30,_binary '','c91486df-4ec5-420f-a6e8-008cfc454f49',NULL),('21499230-afde-4b44-a78b-62bf6819abac',NULL,'reset-credentials-choose-user','siglo21','716f31c6-5f8e-4d02-82e1-ade77e8bfb4f',0,10,_binary '\0',NULL,NULL),('219ca849-b862-433c-a40e-1e3d03ff3228',NULL,'client-secret','master','c6cb4b6c-e47e-42ba-ab68-7edb0728dd17',2,10,_binary '\0',NULL,NULL),('21bf5d8a-df31-4cc1-826c-46fcbaf5ae1c',NULL,'http-basic-authenticator','siglo21','41b0660c-14da-4698-9acc-548a79386935',0,10,_binary '\0',NULL,NULL),('229f3b1d-b26b-4978-97fc-890c197c3006',NULL,NULL,'master','16130787-effb-49e6-8eff-6aa6ef2eb28b',1,40,_binary '','9cb74f9b-f3ee-405f-8939-e65be0485103',NULL),('283d18b8-f56d-4db2-bc68-92b769f46181',NULL,NULL,'siglo21','35e40b62-dbd0-4617-8b94-8e432affbb89',2,30,_binary '','06d8ce3f-a460-4c06-ac3a-25f3433cd8fb',NULL),('28923e86-1fb3-4006-a716-da01cfec77b3',NULL,'idp-confirm-link','master','de61622f-e5a8-4f18-9283-68a8af78577d',0,10,_binary '\0',NULL,NULL),('29a731d5-26d5-4713-aff7-948fd5af9a78',NULL,'identity-provider-redirector','siglo21','35e40b62-dbd0-4617-8b94-8e432affbb89',2,25,_binary '\0',NULL,NULL),('2f5d3b89-8ddc-43d8-9f36-468d37e51766',NULL,NULL,'master','9773918f-0674-4080-80d8-7027b88e59d1',0,20,_binary '','9a0684cd-31cc-44c9-9919-773aef5f14fe',NULL),('3086fc4a-2210-44fe-84b1-2c530177e07d',NULL,NULL,'siglo21','d661c000-8cd5-4a04-8169-e91f396cfb5a',2,20,_binary '','13a7652a-a5b1-42be-ad90-d83cebddbcb3',NULL),('30f14db2-525d-453d-a488-a9c10fae0426',NULL,'auth-otp-form','siglo21','5c0e7fc8-7ed6-4031-8cc5-007e45622330',0,20,_binary '\0',NULL,NULL),('3131875c-0daf-491d-9b7e-623e255ae407',NULL,'idp-email-verification','master','f8f84b17-70ed-4b12-9c19-9dda5ec8ee9f',2,10,_binary '\0',NULL,NULL),('332734e6-40d5-43ac-b395-dac1ed3c87be',NULL,NULL,'siglo21','7be6b858-67fb-4545-81ff-b9ed39d6e9ba',1,30,_binary '','e0e280dc-5023-43e2-b65a-8d3e30c85646',NULL),('33bcbeaf-9f88-4911-8a99-416ab9d87796',NULL,'basic-auth-otp','master','77c81fcb-4dc7-4247-a11a-ea11d72b8812',3,20,_binary '\0',NULL,NULL),('34ec1d1d-ebfb-44fc-b9c0-d402e8168b01',NULL,'docker-http-basic-authenticator','siglo21','ddec1a11-5f43-4102-95d6-d6e467a1560d',0,10,_binary '\0',NULL,NULL),('3a3f7738-eb4d-4f89-ab8e-73216436588e',NULL,'client-secret-jwt','siglo21','e5802a0d-cdca-4e48-ab02-58b6f4510408',2,30,_binary '\0',NULL,NULL),('3b4dfd8a-6bda-43f0-acf5-f3b7afd1146e',NULL,'basic-auth','siglo21','4cb892c6-3648-4ef6-a120-72f5cc78c35e',0,10,_binary '\0',NULL,NULL),('4af4bd65-acc8-4ace-a652-48fe8b1e5ea6',NULL,'docker-http-basic-authenticator','master','404283a2-ed02-4145-8a0f-1e1684463af1',0,10,_binary '\0',NULL,NULL),('4f0ec9c6-e26c-4e61-821e-b54891c12a2d',NULL,'auth-otp-form','master','4c894ef6-21e5-4824-a13f-245d3f2a4401',0,20,_binary '\0',NULL,NULL),('4f203b06-2ef8-4929-baec-edace66552a6',NULL,'registration-page-form','master','baa8db57-c19d-453a-bac9-17962ee73240',0,10,_binary '','df7e4aa2-b808-42db-86fb-23d220c43734',NULL),('4f6e52e8-4683-4235-a5a5-81c8c36a4441',NULL,'conditional-user-configured','siglo21','08327c66-9815-4889-8355-6802d740bcc4',0,10,_binary '\0',NULL,NULL),('52f5b804-9ff8-4d29-9c8e-a832b2780853',NULL,NULL,'siglo21','716f31c6-5f8e-4d02-82e1-ade77e8bfb4f',1,40,_binary '','08327c66-9815-4889-8355-6802d740bcc4',NULL),('576e9a12-2d49-4493-8b4b-ef63c77ea242',NULL,'conditional-user-configured','siglo21','5c0e7fc8-7ed6-4031-8cc5-007e45622330',0,10,_binary '\0',NULL,NULL),('580cdfb6-5fd4-42fa-b62a-523fd6ca3f62',NULL,'client-x509','siglo21','e5802a0d-cdca-4e48-ab02-58b6f4510408',2,40,_binary '\0',NULL,NULL),('59ff4bc2-a92e-42ac-8aff-212a72298af1',NULL,'auth-username-password-form','master','c91486df-4ec5-420f-a6e8-008cfc454f49',0,10,_binary '\0',NULL,NULL),('5f719bc0-6668-412c-83d1-0a6003752720',NULL,'auth-otp-form','siglo21','97f105b6-8117-4177-9580-ce367bdc57e9',0,20,_binary '\0',NULL,NULL),('600a6ea6-63a6-47bb-9274-e15b8efc12a1',NULL,'reset-password','master','16130787-effb-49e6-8eff-6aa6ef2eb28b',0,30,_binary '\0',NULL,NULL),('603a5ac9-5066-4022-af4b-484e33e9cb4a',NULL,'conditional-user-configured','master','4c894ef6-21e5-4824-a13f-245d3f2a4401',0,10,_binary '\0',NULL,NULL),('60703158-a017-44a2-bda6-4520ed24af32',NULL,'conditional-user-configured','siglo21','97f105b6-8117-4177-9580-ce367bdc57e9',0,10,_binary '\0',NULL,NULL),('610d565f-8bf8-436c-b3f3-b22d0fb217bd',NULL,'registration-recaptcha-action','siglo21','a65283e6-4093-41bc-8023-e50a536aded9',3,60,_binary '\0',NULL,NULL),('62e5f0de-a03e-4a00-b55a-9a70791e4d7a',NULL,NULL,'master','f8f84b17-70ed-4b12-9c19-9dda5ec8ee9f',2,20,_binary '','b2a61932-f148-4c71-a67e-d301b8f4d51a',NULL),('643d4dcf-960d-4d17-96a1-029951d748ee',NULL,'identity-provider-redirector','master','20b19cfc-a4e9-428e-8563-24beb886afc7',2,25,_binary '\0',NULL,NULL),('68f5d1ce-0b62-4c40-9aea-946dbb4ef708',NULL,'direct-grant-validate-password','master','958d276a-c304-4ba1-8750-1eb9e5696134',0,20,_binary '\0',NULL,NULL),('6c7624df-ad09-4962-b4e8-400d00d54356',NULL,'registration-password-action','master','df7e4aa2-b808-42db-86fb-23d220c43734',0,50,_binary '\0',NULL,NULL),('6d97686c-af6d-4317-afe1-55ccc1e96f58',NULL,NULL,'master','c91486df-4ec5-420f-a6e8-008cfc454f49',1,20,_binary '','dbab3fa5-0a22-49e5-bf01-dcfa6a236f5f',NULL),('6f7281c5-28af-40d1-b81e-b081f2d3651e',NULL,NULL,'master','958d276a-c304-4ba1-8750-1eb9e5696134',1,30,_binary '','c2538d6a-634b-4b24-89c8-bcb70b76227b',NULL),('7230a60a-c91c-4bef-b107-77236d4a7b08',NULL,'auth-spnego','siglo21','4cb892c6-3648-4ef6-a120-72f5cc78c35e',3,30,_binary '\0',NULL,NULL),('730c393a-6860-46ee-a1c1-950922940535',NULL,'idp-create-user-if-unique','master','9a0684cd-31cc-44c9-9919-773aef5f14fe',2,10,_binary '\0',NULL,'bff33290-9151-4ceb-9dfa-18b289f82cc0'),('74d6e526-2d26-416b-9ddc-c75473b1b092',NULL,NULL,'master','de61622f-e5a8-4f18-9283-68a8af78577d',0,20,_binary '','f8f84b17-70ed-4b12-9c19-9dda5ec8ee9f',NULL),('765f90e1-fe1c-4b17-b2ba-547655bd36bb',NULL,'client-jwt','master','c6cb4b6c-e47e-42ba-ab68-7edb0728dd17',2,20,_binary '\0',NULL,NULL),('76ff21a7-ce41-45f8-888e-aeaf2b5d4cc0',NULL,'idp-review-profile','siglo21','ba7e932b-f5a3-47f1-ac7e-0e890c78350d',0,10,_binary '\0',NULL,'ffaae23d-cdac-487e-b713-684f1c9368b8'),('778062fc-b94e-4a68-abb1-72fba00b912d',NULL,'auth-username-password-form','siglo21','06d8ce3f-a460-4c06-ac3a-25f3433cd8fb',0,10,_binary '\0',NULL,NULL),('858a7aff-6f3e-4e10-9055-e9fc06389da8',NULL,'conditional-user-configured','master','dbab3fa5-0a22-49e5-bf01-dcfa6a236f5f',0,10,_binary '\0',NULL,NULL),('885e6178-a6c2-4c3b-b083-40d220c8d9ad',NULL,'idp-username-password-form','siglo21','c202b57d-2eec-4f26-911c-5d1caf95e17e',0,10,_binary '\0',NULL,NULL),('890dc3f5-e623-4d84-9731-aa5b35335fdd',NULL,'idp-email-verification','siglo21','0406f843-5f0e-4288-8823-e16b9685dd59',2,10,_binary '\0',NULL,NULL),('8d1f49f4-7b94-4166-b55d-3ce9f1c892f1',NULL,'conditional-user-configured','master','c2538d6a-634b-4b24-89c8-bcb70b76227b',0,10,_binary '\0',NULL,NULL),('930940bc-d38d-4026-a367-88e5193e782d',NULL,'registration-recaptcha-action','master','df7e4aa2-b808-42db-86fb-23d220c43734',3,60,_binary '\0',NULL,NULL),('a83b4935-08fb-474e-af1a-d8571a563001',NULL,'client-x509','master','c6cb4b6c-e47e-42ba-ab68-7edb0728dd17',2,40,_binary '\0',NULL,NULL),('b0b17d75-25fc-443c-85b3-438e0fd6b2be',NULL,'no-cookie-redirect','siglo21','391d9dc0-44fe-41f4-9799-e6e9a815e9a8',0,10,_binary '\0',NULL,NULL),('b1cd3868-b67a-4c2c-a0c7-c6137d65b7dd',NULL,'registration-page-form','siglo21','988b74e5-9234-4fe4-929c-882def12417b',0,10,_binary '','a65283e6-4093-41bc-8023-e50a536aded9',NULL),('b495ebd8-dbe6-46ac-9a69-b68043d3f7cc',NULL,'auth-spnego','siglo21','35e40b62-dbd0-4617-8b94-8e432affbb89',3,20,_binary '\0',NULL,NULL),('b5a44197-ab4c-42a4-a29d-ed9a459f1f82',NULL,'registration-password-action','siglo21','a65283e6-4093-41bc-8023-e50a536aded9',0,50,_binary '\0',NULL,NULL),('b6023f49-cc7c-4d7f-9afb-7a558f4715b0',NULL,'reset-credential-email','master','16130787-effb-49e6-8eff-6aa6ef2eb28b',0,20,_binary '\0',NULL,NULL),('b641db61-877f-4a0b-847b-81d2e2054bac',NULL,'conditional-user-configured','siglo21','e0e280dc-5023-43e2-b65a-8d3e30c85646',0,10,_binary '\0',NULL,NULL),('b80561f9-923d-4fa3-a1b6-63d44ef1cdc4',NULL,'client-secret','siglo21','e5802a0d-cdca-4e48-ab02-58b6f4510408',2,10,_binary '\0',NULL,NULL),('b8ed458e-4468-47e0-9606-76aeb4e3a739',NULL,'auth-otp-form','master','dbab3fa5-0a22-49e5-bf01-dcfa6a236f5f',0,20,_binary '\0',NULL,NULL),('b9493bb7-e134-4b3f-9381-851c712bde93',NULL,NULL,'siglo21','391d9dc0-44fe-41f4-9799-e6e9a815e9a8',0,20,_binary '','4cb892c6-3648-4ef6-a120-72f5cc78c35e',NULL),('bf1355e7-d417-473d-a5e9-4be97acfeac2',NULL,'registration-profile-action','siglo21','a65283e6-4093-41bc-8023-e50a536aded9',0,40,_binary '\0',NULL,NULL),('bfd6e588-ab85-4884-8f80-0484b035fa56',NULL,NULL,'siglo21','ba7e932b-f5a3-47f1-ac7e-0e890c78350d',0,20,_binary '','d661c000-8cd5-4a04-8169-e91f396cfb5a',NULL),('c19e964e-79d7-4a12-85df-eaf4f457bc15',NULL,NULL,'master','c030e412-e27c-47a7-b92e-c1bcf6e55dd6',0,20,_binary '','77c81fcb-4dc7-4247-a11a-ea11d72b8812',NULL),('c20e1aaa-1b4b-4278-8bc0-b5c0a443041c',NULL,'idp-username-password-form','master','b2a61932-f148-4c71-a67e-d301b8f4d51a',0,10,_binary '\0',NULL,NULL),('c2ce6d9e-a6a2-42aa-b216-5b6e0f683e29',NULL,'direct-grant-validate-username','siglo21','7be6b858-67fb-4545-81ff-b9ed39d6e9ba',0,10,_binary '\0',NULL,NULL),('c7e7caf0-1a42-47ec-a806-3775adb39249',NULL,'direct-grant-validate-otp','siglo21','e0e280dc-5023-43e2-b65a-8d3e30c85646',0,20,_binary '\0',NULL,NULL),('cb4dbf1d-4e05-4a70-a6a3-8c2543e3f2c2',NULL,'reset-credentials-choose-user','master','16130787-effb-49e6-8eff-6aa6ef2eb28b',0,10,_binary '\0',NULL,NULL),('cc65ed17-e4af-4531-871e-468a68bbd942',NULL,'auth-spnego','master','20b19cfc-a4e9-428e-8563-24beb886afc7',3,20,_binary '\0',NULL,NULL),('d2476b2b-6714-4328-80c7-56edfbba0b21',NULL,'direct-grant-validate-otp','master','c2538d6a-634b-4b24-89c8-bcb70b76227b',0,20,_binary '\0',NULL,NULL),('d8c0aa78-14b5-4f60-b11a-8094e8674105',NULL,'no-cookie-redirect','master','c030e412-e27c-47a7-b92e-c1bcf6e55dd6',0,10,_binary '\0',NULL,NULL),('d8df45af-23c8-4a3a-9d28-06bcf3d3990b',NULL,'direct-grant-validate-username','master','958d276a-c304-4ba1-8750-1eb9e5696134',0,10,_binary '\0',NULL,NULL),('db6480d1-cf66-447b-b70a-63b910381317',NULL,'registration-user-creation','siglo21','a65283e6-4093-41bc-8023-e50a536aded9',0,20,_binary '\0',NULL,NULL),('dfdcb45d-c314-40ac-b4c8-b4d141066673',NULL,'reset-otp','siglo21','08327c66-9815-4889-8355-6802d740bcc4',0,20,_binary '\0',NULL,NULL),('e3bf9a9b-c310-4a83-8416-3e70b1075ae9',NULL,'registration-profile-action','master','df7e4aa2-b808-42db-86fb-23d220c43734',0,40,_binary '\0',NULL,NULL),('e7945e58-e784-4e87-882d-f5ebc140e398',NULL,NULL,'siglo21','0406f843-5f0e-4288-8823-e16b9685dd59',2,20,_binary '','c202b57d-2eec-4f26-911c-5d1caf95e17e',NULL),('e7fbb940-3839-4f42-8b11-22916570875a',NULL,'auth-spnego','master','77c81fcb-4dc7-4247-a11a-ea11d72b8812',3,30,_binary '\0',NULL,NULL),('eb151976-5eb3-417f-80a6-4d57222a61be',NULL,'basic-auth','master','77c81fcb-4dc7-4247-a11a-ea11d72b8812',0,10,_binary '\0',NULL,NULL),('f4978c02-1c1f-416b-a060-fa5b049b9bd6',NULL,'registration-user-creation','master','df7e4aa2-b808-42db-86fb-23d220c43734',0,20,_binary '\0',NULL,NULL),('f5b490c4-97e8-4c1d-ab8f-740dcc20e55c',NULL,NULL,'siglo21','c202b57d-2eec-4f26-911c-5d1caf95e17e',1,20,_binary '','5c0e7fc8-7ed6-4031-8cc5-007e45622330',NULL),('f6806931-f437-40b7-9d49-8c7f990a4b10',NULL,'reset-otp','master','9cb74f9b-f3ee-405f-8939-e65be0485103',0,20,_binary '\0',NULL,NULL),('fa40bf7c-19ce-44e6-9170-3760bec3679d',NULL,'direct-grant-validate-password','siglo21','7be6b858-67fb-4545-81ff-b9ed39d6e9ba',0,20,_binary '\0',NULL,NULL),('fb8f78bb-e468-4146-9d12-53ef09a4629a',NULL,'auth-cookie','siglo21','35e40b62-dbd0-4617-8b94-8e432affbb89',2,10,_binary '\0',NULL,NULL),('fc208eb3-a49e-476e-892c-85b297fd7232',NULL,'client-jwt','siglo21','e5802a0d-cdca-4e48-ab02-58b6f4510408',2,20,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0406f843-5f0e-4288-8823-e16b9685dd59','Account verification options','Method with which to verity the existing account','siglo21','basic-flow',_binary '\0',_binary ''),('06d8ce3f-a460-4c06-ac3a-25f3433cd8fb','forms','Username, password, otp and other auth forms.','siglo21','basic-flow',_binary '\0',_binary ''),('08327c66-9815-4889-8355-6802d740bcc4','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','siglo21','basic-flow',_binary '\0',_binary ''),('0bc73f64-33c5-46eb-a58f-f8ab06a23c21','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('13a7652a-a5b1-42be-ad90-d83cebddbcb3','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','siglo21','basic-flow',_binary '\0',_binary ''),('16130787-effb-49e6-8eff-6aa6ef2eb28b','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('20b19cfc-a4e9-428e-8563-24beb886afc7','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('35e40b62-dbd0-4617-8b94-8e432affbb89','browser','browser based authentication','siglo21','basic-flow',_binary '',_binary ''),('391d9dc0-44fe-41f4-9799-e6e9a815e9a8','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','siglo21','basic-flow',_binary '',_binary ''),('404283a2-ed02-4145-8a0f-1e1684463af1','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('41b0660c-14da-4698-9acc-548a79386935','saml ecp','SAML ECP Profile Authentication Flow','siglo21','basic-flow',_binary '',_binary ''),('4c894ef6-21e5-4824-a13f-245d3f2a4401','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('4cb892c6-3648-4ef6-a120-72f5cc78c35e','Authentication Options','Authentication options.','siglo21','basic-flow',_binary '\0',_binary ''),('5c0e7fc8-7ed6-4031-8cc5-007e45622330','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('716f31c6-5f8e-4d02-82e1-ade77e8bfb4f','reset credentials','Reset credentials for a user if they forgot their password or something','siglo21','basic-flow',_binary '',_binary ''),('77c81fcb-4dc7-4247-a11a-ea11d72b8812','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('7be6b858-67fb-4545-81ff-b9ed39d6e9ba','direct grant','OpenID Connect Resource Owner Grant','siglo21','basic-flow',_binary '',_binary ''),('958d276a-c304-4ba1-8750-1eb9e5696134','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('9773918f-0674-4080-80d8-7027b88e59d1','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('97f105b6-8117-4177-9580-ce367bdc57e9','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('988b74e5-9234-4fe4-929c-882def12417b','registration','registration flow','siglo21','basic-flow',_binary '',_binary ''),('9a0684cd-31cc-44c9-9919-773aef5f14fe','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('9cb74f9b-f3ee-405f-8939-e65be0485103','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('a65283e6-4093-41bc-8023-e50a536aded9','registration form','registration form','siglo21','form-flow',_binary '\0',_binary ''),('b2a61932-f148-4c71-a67e-d301b8f4d51a','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('ba7e932b-f5a3-47f1-ac7e-0e890c78350d','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','siglo21','basic-flow',_binary '',_binary ''),('baa8db57-c19d-453a-bac9-17962ee73240','registration','registration flow','master','basic-flow',_binary '',_binary ''),('c030e412-e27c-47a7-b92e-c1bcf6e55dd6','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('c202b57d-2eec-4f26-911c-5d1caf95e17e','Verify Existing Account by Re-authentication','Reauthentication of existing account','siglo21','basic-flow',_binary '\0',_binary ''),('c2538d6a-634b-4b24-89c8-bcb70b76227b','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('c6cb4b6c-e47e-42ba-ab68-7edb0728dd17','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('c91486df-4ec5-420f-a6e8-008cfc454f49','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('d661c000-8cd5-4a04-8169-e91f396cfb5a','User creation or linking','Flow for the existing/non-existing user alternatives','siglo21','basic-flow',_binary '\0',_binary ''),('dbab3fa5-0a22-49e5-bf01-dcfa6a236f5f','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('ddec1a11-5f43-4102-95d6-d6e467a1560d','docker auth','Used by Docker clients to authenticate against the IDP','siglo21','basic-flow',_binary '',_binary ''),('de61622f-e5a8-4f18-9283-68a8af78577d','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('df7e4aa2-b808-42db-86fb-23d220c43734','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('e0e280dc-5023-43e2-b65a-8d3e30c85646','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('e5802a0d-cdca-4e48-ab02-58b6f4510408','clients','Base authentication for clients','siglo21','client-flow',_binary '',_binary ''),('f8f84b17-70ed-4b12-9c19-9dda5ec8ee9f','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('00c8d410-367a-420e-b120-47c8dcbe74bd','create unique user config','siglo21'),('bff33290-9151-4ceb-9dfa-18b289f82cc0','create unique user config','master'),('c52e218e-4218-41b9-aa1c-ad0b072c1f6a','review profile config','master'),('ffaae23d-cdac-487e-b713-684f1c9368b8','review profile config','siglo21');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('00c8d410-367a-420e-b120-47c8dcbe74bd','false','require.password.update.after.registration'),('bff33290-9151-4ceb-9dfa-18b289f82cc0','false','require.password.update.after.registration'),('c52e218e-4218-41b9-aa1c-ad0b072c1f6a','missing','update.profile.on.first.login'),('ffaae23d-cdac-487e-b713-684f1c9368b8','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barrios`
--

DROP TABLE IF EXISTS `barrios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barrios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `barrios_id_zona` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9ulayj5kuu2kpylv836pw4chn` (`barrios_id_zona`),
  CONSTRAINT `FK9ulayj5kuu2kpylv836pw4chn` FOREIGN KEY (`barrios_id_zona`) REFERENCES `zonas` (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
INSERT INTO `barrios` VALUES (1,NULL,'EZFUERZO',1),(2,NULL,'HIBEPA',1),(3,NULL,'CUENCA XV',1),(4,NULL,'GRAN NEUQUEN NORTE',1),(5,NULL,'GRAN NEUQUEN SUR',1),(6,NULL,'SAN LORENZO NORTE',1),(7,NULL,'SAN LORENZO SUR',1),(8,NULL,'VALENTINA NORTE URBANA',1),(9,NULL,'HUILLICHEZ',1),(10,NULL,'UNION DE MAYO',1),(11,NULL,'MELIPAL',1),(12,NULL,'GREGORIO ALVAREZ',1),(13,NULL,'EL PROGRESO',1),(14,NULL,'VILLA CEFERINO',1),(15,NULL,'BARDAS SOLEADAS',1),(16,NULL,'CUMELEN',1),(17,NULL,'ISLA MALVINAS',1),(18,NULL,'CIUDAD INDUSTRIAL',1),(19,NULL,'COLONIA NUEVA ESPERANZA',1),(20,NULL,'ALMA FUERTE',1),(21,NULL,'PARQUE INDUSTRIAL',1),(22,NULL,'TERRAZAS DEL NEUQUEN',2),(23,NULL,'14 DE OCTUBRE COPOL',2),(24,NULL,'RINCON DE EMILIO',2),(25,NULL,'ALTA BARDA',2),(26,NULL,'AREA CENTRO OESTE',2),(27,NULL,'AREA CENTRO ESTE',2),(28,NULL,'SANTA GENOVEVA',2),(29,NULL,'VILLA FARREL',2),(30,NULL,'PROVINCIAS UNIDAS',2),(31,NULL,'SAPERE',2),(32,NULL,'CENTENARIO',2),(33,NULL,'VISTA ALEGRE',2),(34,NULL,'CINCO SALTOS',2),(35,NULL,'BARDA DEL MEDIO',2),(36,NULL,'C.CORDERO',2),(37,NULL,'BOUQUET ROLDAN',3),(38,NULL,'MILITAR',3),(39,NULL,'VALENTINA SUR RURAL',3),(40,'Balsa las Perlas','BALSA LAS PERLAS',3),(41,NULL,'TERMINAL NEUQUEN',3),(42,NULL,'CANAL V',3),(43,NULL,'LA SIRENA',3),(44,NULL,'PLOTTIER',3),(45,NULL,'CHINA MUERTA',3),(46,NULL,'SENILLOSA',3),(47,NULL,'AREA CENTRO SUR',4),(48,NULL,'NUEVO',4),(49,NULL,'VILLA FLORENCIA',4),(50,NULL,'RIO GRANDE',4),(51,NULL,'DON BOSCO II',4),(52,NULL,'VILLA MARIA',4),(53,NULL,'BELGRANO',4),(54,NULL,'MARIANO MORENO',4),(55,NULL,'CONFLUENCIA URBANO',4),(56,NULL,'CONFLUENCIA RURAL',4),(57,NULL,'DON BOSCO III',4),(58,NULL,'LIMAY',4),(59,NULL,'CIPOLLETTI',4),(60,NULL,'FERNANDEZ ORO',4),(61,NULL,'ALLEN',4),(62,NULL,'ROCA',4),(63,NULL,'MAINQUE',4);
/*!40000 ALTER TABLE `barrios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cambios_estado`
--

DROP TABLE IF EXISTS `cambios_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambios_estado` (
  `id_cambio_estado` int NOT NULL AUTO_INCREMENT,
  `fecha_hora_fin` datetime(6) DEFAULT NULL,
  `fecha_hora_inicio` datetime(6) DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `numero_factura` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cambio_estado`),
  KEY `FKo1m78rq0x6h37ehdhougr9m9t` (`estado_id`),
  KEY `FK8h9x56jl6m7mj7i5qdhjwpj0l` (`numero_factura`),
  CONSTRAINT `FK8h9x56jl6m7mj7i5qdhjwpj0l` FOREIGN KEY (`numero_factura`) REFERENCES `envios` (`numero_factura`),
  CONSTRAINT `FKo1m78rq0x6h37ehdhougr9m9t` FOREIGN KEY (`estado_id`) REFERENCES `estados_envio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambios_estado`
--

LOCK TABLES `cambios_estado` WRITE;
/*!40000 ALTER TABLE `cambios_estado` DISABLE KEYS */;
INSERT INTO `cambios_estado` VALUES (1,NULL,'2023-12-05 11:04:46.458965',1,'A-3232-2342334');
/*!40000 ALTER TABLE `cambios_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camiones`
--

DROP TABLE IF EXISTS `camiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camiones` (
  `patente` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camiones`
--

LOCK TABLES `camiones` WRITE;
/*!40000 ALTER TABLE `camiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `camiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('01154859-b752-419b-9c69-ae3107b012d5',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2fe31644-375d-45d2-afa2-0ace2492070f',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/siglo21/account/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/siglo21/console/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '',_binary '','siglo21-client-api-rest',0,_binary '',NULL,'http://localhost:3000',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/siglo21/account/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '',_binary '\0','siglo21-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','siglo21 Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('bbf4dad0-10e5-460e-98dc-e65303d74715',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d06663e0-ede9-48b2-a391-551f87ecb510',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e85555df-fd39-4956-976b-307ce89acaea',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('01154859-b752-419b-9c69-ae3107b012d5','S256','pkce.code.challenge.method'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','S256','pkce.code.challenge.method'),('42ce5f39-f315-496d-881f-7de13ac3ae08','S256','pkce.code.challenge.method'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','1800','access.token.lifespan'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','backchannel.logout.revoke.offline.tokens'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','true','backchannel.logout.session.required'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','client_credentials.use_refresh_token'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','display.on.consent.screen'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','exclude.session.state.from.auth.response'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','id.token.as.detached.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','oauth2.device.authorization.grant.enabled'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','oidc.ciba.grant.enabled'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','require.pushed.authorization.requests'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml_force_name_id_format'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.artifact.binding'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.assertion.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.authnstatement'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.client.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.encrypt'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.force.post.binding'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.multivalued.roles'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.onetimeuse.condition'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.server.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.server.signature.keyinfo.ext'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','tls.client.certificate.bound.access.tokens'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','true','use.refresh.tokens'),('d06663e0-ede9-48b2-a391-551f87ecb510','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('154a486c-3b78-400c-b872-3895677f7eca','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('19b6b82c-b8f7-4634-be79-efede78aab4e','offline_access','siglo21','OpenID Connect built-in scope: offline_access','openid-connect'),('279791da-86fa-4f67-84c7-b8f250adbcf1','profile','siglo21','OpenID Connect built-in scope: profile','openid-connect'),('28963099-19d3-4521-a02f-976d9671e893','phone','siglo21','OpenID Connect built-in scope: phone','openid-connect'),('2f0f3a95-4ac0-472b-bab5-057dcb976683','email','master','OpenID Connect built-in scope: email','openid-connect'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','email','siglo21','OpenID Connect built-in scope: email','openid-connect'),('7b2f4aa2-3e7b-4eaa-b502-f036ee2501be','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('7b628f28-9a74-40f1-ad32-16626715f649','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('80a98201-a009-4f95-a8d9-67b46623f54d','microprofile-jwt','siglo21','Microprofile - JWT built-in scope','openid-connect'),('92af6569-08f2-4df9-9f63-dadb8f9fa88f','address','master','OpenID Connect built-in scope: address','openid-connect'),('9dd53193-d502-4d19-80d9-87acf9580320','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','roles','siglo21','OpenID Connect scope for add user roles to the access token','openid-connect'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','role_list','siglo21','SAML role list','saml'),('b39fe518-d02f-4eac-942b-eeddf878c80f','web-origins','siglo21','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('b423d019-4240-484b-8b76-b7056094b7fe','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('c117a9f4-5714-48ee-a5d1-eedad00c1b7e','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('da127315-5241-4a8f-a46a-6bea0de8925e','address','siglo21','OpenID Connect built-in scope: address','openid-connect'),('ef9cfc6f-aa14-40b3-9afc-ec113ca9dcf1','role_list','master','SAML role list','saml');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('154a486c-3b78-400c-b872-3895677f7eca','false','display.on.consent.screen'),('154a486c-3b78-400c-b872-3895677f7eca','true','include.in.token.scope'),('19b6b82c-b8f7-4634-be79-efede78aab4e','${offlineAccessScopeConsentText}','consent.screen.text'),('19b6b82c-b8f7-4634-be79-efede78aab4e','true','display.on.consent.screen'),('279791da-86fa-4f67-84c7-b8f250adbcf1','${profileScopeConsentText}','consent.screen.text'),('279791da-86fa-4f67-84c7-b8f250adbcf1','true','display.on.consent.screen'),('279791da-86fa-4f67-84c7-b8f250adbcf1','true','include.in.token.scope'),('28963099-19d3-4521-a02f-976d9671e893','${phoneScopeConsentText}','consent.screen.text'),('28963099-19d3-4521-a02f-976d9671e893','true','display.on.consent.screen'),('28963099-19d3-4521-a02f-976d9671e893','true','include.in.token.scope'),('2f0f3a95-4ac0-472b-bab5-057dcb976683','${emailScopeConsentText}','consent.screen.text'),('2f0f3a95-4ac0-472b-bab5-057dcb976683','true','display.on.consent.screen'),('2f0f3a95-4ac0-472b-bab5-057dcb976683','true','include.in.token.scope'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','${emailScopeConsentText}','consent.screen.text'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','true','display.on.consent.screen'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','true','include.in.token.scope'),('7b2f4aa2-3e7b-4eaa-b502-f036ee2501be','','consent.screen.text'),('7b2f4aa2-3e7b-4eaa-b502-f036ee2501be','false','display.on.consent.screen'),('7b2f4aa2-3e7b-4eaa-b502-f036ee2501be','false','include.in.token.scope'),('7b628f28-9a74-40f1-ad32-16626715f649','${rolesScopeConsentText}','consent.screen.text'),('7b628f28-9a74-40f1-ad32-16626715f649','true','display.on.consent.screen'),('7b628f28-9a74-40f1-ad32-16626715f649','false','include.in.token.scope'),('80a98201-a009-4f95-a8d9-67b46623f54d','false','display.on.consent.screen'),('80a98201-a009-4f95-a8d9-67b46623f54d','true','include.in.token.scope'),('92af6569-08f2-4df9-9f63-dadb8f9fa88f','${addressScopeConsentText}','consent.screen.text'),('92af6569-08f2-4df9-9f63-dadb8f9fa88f','true','display.on.consent.screen'),('92af6569-08f2-4df9-9f63-dadb8f9fa88f','true','include.in.token.scope'),('9dd53193-d502-4d19-80d9-87acf9580320','${phoneScopeConsentText}','consent.screen.text'),('9dd53193-d502-4d19-80d9-87acf9580320','true','display.on.consent.screen'),('9dd53193-d502-4d19-80d9-87acf9580320','true','include.in.token.scope'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','${rolesScopeConsentText}','consent.screen.text'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','true','display.on.consent.screen'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','false','include.in.token.scope'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','${samlRoleListScopeConsentText}','consent.screen.text'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','true','display.on.consent.screen'),('b39fe518-d02f-4eac-942b-eeddf878c80f','','consent.screen.text'),('b39fe518-d02f-4eac-942b-eeddf878c80f','false','display.on.consent.screen'),('b39fe518-d02f-4eac-942b-eeddf878c80f','false','include.in.token.scope'),('b423d019-4240-484b-8b76-b7056094b7fe','${profileScopeConsentText}','consent.screen.text'),('b423d019-4240-484b-8b76-b7056094b7fe','true','display.on.consent.screen'),('b423d019-4240-484b-8b76-b7056094b7fe','true','include.in.token.scope'),('c117a9f4-5714-48ee-a5d1-eedad00c1b7e','${offlineAccessScopeConsentText}','consent.screen.text'),('c117a9f4-5714-48ee-a5d1-eedad00c1b7e','true','display.on.consent.screen'),('da127315-5241-4a8f-a46a-6bea0de8925e','${addressScopeConsentText}','consent.screen.text'),('da127315-5241-4a8f-a46a-6bea0de8925e','true','display.on.consent.screen'),('da127315-5241-4a8f-a46a-6bea0de8925e','true','include.in.token.scope'),('ef9cfc6f-aa14-40b3-9afc-ec113ca9dcf1','${samlRoleListScopeConsentText}','consent.screen.text'),('ef9cfc6f-aa14-40b3-9afc-ec113ca9dcf1','true','display.on.consent.screen');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('01154859-b752-419b-9c69-ae3107b012d5','154a486c-3b78-400c-b872-3895677f7eca',_binary '\0'),('01154859-b752-419b-9c69-ae3107b012d5','2f0f3a95-4ac0-472b-bab5-057dcb976683',_binary ''),('01154859-b752-419b-9c69-ae3107b012d5','7b2f4aa2-3e7b-4eaa-b502-f036ee2501be',_binary ''),('01154859-b752-419b-9c69-ae3107b012d5','7b628f28-9a74-40f1-ad32-16626715f649',_binary ''),('01154859-b752-419b-9c69-ae3107b012d5','92af6569-08f2-4df9-9f63-dadb8f9fa88f',_binary '\0'),('01154859-b752-419b-9c69-ae3107b012d5','9dd53193-d502-4d19-80d9-87acf9580320',_binary '\0'),('01154859-b752-419b-9c69-ae3107b012d5','b423d019-4240-484b-8b76-b7056094b7fe',_binary ''),('01154859-b752-419b-9c69-ae3107b012d5','c117a9f4-5714-48ee-a5d1-eedad00c1b7e',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('2fe31644-375d-45d2-afa2-0ace2492070f','154a486c-3b78-400c-b872-3895677f7eca',_binary '\0'),('2fe31644-375d-45d2-afa2-0ace2492070f','2f0f3a95-4ac0-472b-bab5-057dcb976683',_binary ''),('2fe31644-375d-45d2-afa2-0ace2492070f','7b2f4aa2-3e7b-4eaa-b502-f036ee2501be',_binary ''),('2fe31644-375d-45d2-afa2-0ace2492070f','7b628f28-9a74-40f1-ad32-16626715f649',_binary ''),('2fe31644-375d-45d2-afa2-0ace2492070f','92af6569-08f2-4df9-9f63-dadb8f9fa88f',_binary '\0'),('2fe31644-375d-45d2-afa2-0ace2492070f','9dd53193-d502-4d19-80d9-87acf9580320',_binary '\0'),('2fe31644-375d-45d2-afa2-0ace2492070f','b423d019-4240-484b-8b76-b7056094b7fe',_binary ''),('2fe31644-375d-45d2-afa2-0ace2492070f','c117a9f4-5714-48ee-a5d1-eedad00c1b7e',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('bbf4dad0-10e5-460e-98dc-e65303d74715','154a486c-3b78-400c-b872-3895677f7eca',_binary '\0'),('bbf4dad0-10e5-460e-98dc-e65303d74715','2f0f3a95-4ac0-472b-bab5-057dcb976683',_binary ''),('bbf4dad0-10e5-460e-98dc-e65303d74715','7b2f4aa2-3e7b-4eaa-b502-f036ee2501be',_binary ''),('bbf4dad0-10e5-460e-98dc-e65303d74715','7b628f28-9a74-40f1-ad32-16626715f649',_binary ''),('bbf4dad0-10e5-460e-98dc-e65303d74715','92af6569-08f2-4df9-9f63-dadb8f9fa88f',_binary '\0'),('bbf4dad0-10e5-460e-98dc-e65303d74715','9dd53193-d502-4d19-80d9-87acf9580320',_binary '\0'),('bbf4dad0-10e5-460e-98dc-e65303d74715','b423d019-4240-484b-8b76-b7056094b7fe',_binary ''),('bbf4dad0-10e5-460e-98dc-e65303d74715','c117a9f4-5714-48ee-a5d1-eedad00c1b7e',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('d06663e0-ede9-48b2-a391-551f87ecb510','154a486c-3b78-400c-b872-3895677f7eca',_binary '\0'),('d06663e0-ede9-48b2-a391-551f87ecb510','2f0f3a95-4ac0-472b-bab5-057dcb976683',_binary ''),('d06663e0-ede9-48b2-a391-551f87ecb510','7b2f4aa2-3e7b-4eaa-b502-f036ee2501be',_binary ''),('d06663e0-ede9-48b2-a391-551f87ecb510','7b628f28-9a74-40f1-ad32-16626715f649',_binary ''),('d06663e0-ede9-48b2-a391-551f87ecb510','92af6569-08f2-4df9-9f63-dadb8f9fa88f',_binary '\0'),('d06663e0-ede9-48b2-a391-551f87ecb510','9dd53193-d502-4d19-80d9-87acf9580320',_binary '\0'),('d06663e0-ede9-48b2-a391-551f87ecb510','b423d019-4240-484b-8b76-b7056094b7fe',_binary ''),('d06663e0-ede9-48b2-a391-551f87ecb510','c117a9f4-5714-48ee-a5d1-eedad00c1b7e',_binary '\0'),('db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce','154a486c-3b78-400c-b872-3895677f7eca',_binary '\0'),('db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce','2f0f3a95-4ac0-472b-bab5-057dcb976683',_binary ''),('db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce','7b2f4aa2-3e7b-4eaa-b502-f036ee2501be',_binary ''),('db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce','7b628f28-9a74-40f1-ad32-16626715f649',_binary ''),('db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce','92af6569-08f2-4df9-9f63-dadb8f9fa88f',_binary '\0'),('db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce','9dd53193-d502-4d19-80d9-87acf9580320',_binary '\0'),('db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce','b423d019-4240-484b-8b76-b7056094b7fe',_binary ''),('db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce','c117a9f4-5714-48ee-a5d1-eedad00c1b7e',_binary '\0'),('e85555df-fd39-4956-976b-307ce89acaea','154a486c-3b78-400c-b872-3895677f7eca',_binary '\0'),('e85555df-fd39-4956-976b-307ce89acaea','2f0f3a95-4ac0-472b-bab5-057dcb976683',_binary ''),('e85555df-fd39-4956-976b-307ce89acaea','7b2f4aa2-3e7b-4eaa-b502-f036ee2501be',_binary ''),('e85555df-fd39-4956-976b-307ce89acaea','7b628f28-9a74-40f1-ad32-16626715f649',_binary ''),('e85555df-fd39-4956-976b-307ce89acaea','92af6569-08f2-4df9-9f63-dadb8f9fa88f',_binary '\0'),('e85555df-fd39-4956-976b-307ce89acaea','9dd53193-d502-4d19-80d9-87acf9580320',_binary '\0'),('e85555df-fd39-4956-976b-307ce89acaea','b423d019-4240-484b-8b76-b7056094b7fe',_binary ''),('e85555df-fd39-4956-976b-307ce89acaea','c117a9f4-5714-48ee-a5d1-eedad00c1b7e',_binary '\0');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('19b6b82c-b8f7-4634-be79-efede78aab4e','8748520e-df8c-448c-b03a-f7e53b6bf973'),('c117a9f4-5714-48ee-a5d1-eedad00c1b7e','544bca16-9562-49bc-a4af-bc4f949519eb');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `numero_documento` varchar(255) DEFAULT NULL,
  `numero_telefono` varchar(255) DEFAULT NULL,
  `numero_telefono_alternativo` varchar(255) DEFAULT NULL,
  `id_tipo_documento` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `UKdunqebmukycxvi902q7ev0a8v` (`id_tipo_documento`,`numero_documento`),
  CONSTRAINT `FK158uydvsidi86jgv1skdhcms0` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipos_documentos` (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'app','algo 2121','algo@algo.com','nom','32222323','+54 23323233','',3),(3,'app','algo 2121','algo@algo.com','nom','32222323','+54 23323233','',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('0098e192-5eea-4102-bbf0-f69798acea5d','Trusted Hosts','siglo21','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('0a429143-71a0-4593-b37c-6f423095146b','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('0bfdf09e-d23d-4d49-9814-08741ba051a8','rsa-generated','siglo21','rsa-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('20217c77-2196-4ae6-9d79-e799d807904c','hmac-generated','siglo21','hmac-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('20d0e80e-2d0c-4660-bdee-a48289cacadb','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('2ae478f7-f417-4af7-9b21-351028a12484','Full Scope Disabled','siglo21','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('52c82a70-e1e9-49fb-a57a-19514d10598c','Allowed Client Scopes','siglo21','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('5cb5d720-649b-4cd4-b899-42ec2d4f9587','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('7420fe2e-e2f7-410d-b246-54f45931e81e','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('765cd604-3dd6-49b4-af5e-7363f1d7883e','Allowed Client Scopes','siglo21','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','authenticated'),('80275b15-09eb-4958-9108-7bcf5f538f38','Allowed Protocol Mapper Types','siglo21','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','authenticated'),('811288b9-8e90-487b-969b-82d36b785c27','rsa-enc-generated','siglo21','rsa-enc-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('937b8c2d-dfb2-4b42-a29b-bd38b36a6b60','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('ad72e957-8032-441d-bf13-85e65199622a','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('b0cf4df0-e86a-4a23-8242-117379948edb','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('b75485a4-f673-4081-9238-4b5e7f5eb222','Max Clients Limit','siglo21','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('ba5ec0d1-3d4e-45f6-8dce-97dd6eaa0946','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('bfa8d370-01ca-4bda-9333-ac7649508be0','Allowed Protocol Mapper Types','siglo21','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('c3a8ae9c-bf6d-42f3-b1f5-abf9ca4ddf6d','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('c7604a3c-d217-410a-841b-2d3cfe05b6b9','aes-generated','siglo21','aes-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('d7cb549b-bd24-4934-a2ca-32915a8316c2','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('f4051ae6-7205-48b9-ba39-2b254e984322','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('fa97c1ae-d765-4a26-ba90-6bbb1869af25','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('fe8e79e6-abbf-471b-8c5d-5d5fafd29144','Consent Required','siglo21','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('09b47c61-a281-49a0-bf77-62e8859ae105','52c82a70-e1e9-49fb-a57a-19514d10598c','allow-default-scopes','true'),('0c52b6be-fbe8-4de9-870c-e0c1e8880c2d','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-role-list-mapper'),('0d59d540-5c65-4199-85bc-69bce08a6227','0bfdf09e-d23d-4d49-9814-08741ba051a8','privateKey','MIIEowIBAAKCAQEAmqY75zLExSpr9lrNAblrqogsZPkSKuqo+W/tDcyIWxaqmvMgkP87aceR2uxEncGa1YN07FjgOnEAk2UIfiiWfbYSp6ulqF3nSObeIhgRKBifGnCerB2lXnv+lScmLrXQJMAA1aHZjTldHpPGCq9NON9WsA+OKmflWs53tJ2+ofAuSPW+abvRH1QrC7j91mgxLh/TjIDKkpzueMlcUBo7kr6aC4KAr7fkR3KrDhKB9tSzfHKdfMdUERG6Lad8sDqPvaByt8YKADnOPa/jmfWs9F3Xy3aBGySXmW+96XdW0SmRCNMbGHXW/R9A+a5mrZC7TWUAZXfBdpNFI1F+MOJcPwIDAQABAoIBADcGKo4qXCSi4WL4D7UrWgmFBfavQC2Q7KpDjp64RVPTjsQu+Uld5q/OWDECm69dsU+CxFlLjgx9JG1NJ2Zr3o+/9oc95WUwdBhWPHb5BTG1APcRVwN6UNp7V6uOEGHSQsqwnhtkyNkcresxPOeUU++GV3uxLS4dZVeX2rOi5K8NDgqRDT4uWVWQKAk6HsbruxWqFSqvPPvzACu4SjiGPyXx2wBJvQK50B8OLtFx2TRATs4JZaOGb75a90uQy3ZvaMDaIR/crmFJhhsHuzTKq6R2ukyD7L8TofRACIemdJRdNXtVX3vK5uYzUb6Vl3OapJ6EceW4ZvNZQkIaUC99epECgYEA1rTYs8pWqaX+UZ802EKpWvunYPgQBSLZ8DpKKdjjBPP++5sv8zAWq0/LoJa7318VB8VsoIYpCzILnuEZFRGwTu3KsEfTYtEDvA14rlKm3weGtc9m+0lZLVFF8U8TbqQ+Ina+nzIoS3icxRklY+bPF2ShMWGtuqpuggPhVByO4r0CgYEAuGR0Qgd/xZFAnvr5Ldf2Dyk2ssZHc4XZ09CS2Xxe2ZAiyiHWyYZRVSao4v21rlxcD5hH7e83xiw3xyGE3S/jQUUkoV6lzMaQWBghW6d1y7eLxFhYOz3XnLJ1aVwQjfdHw5VR/9QCHTbM63FwSVse6ZEkxHk2pFJdvuRd5Ir3CKsCgYAYYlOWH621+K8ob+9dfDylo5z/y0xueOXNfaE8nXAy+M8FnjtU4CpC7H4Qz+2oUbEev9I1bOcuaVGeiqwBk4+1dxYk7RNZzqkg61rAWYywGbe34EUu1sa0+dz6qeNoFmkkGt5NUDH5WEpdrBxt+yGb44bXB+PmJkMEqxIlLlUf9QKBgBxVIx/6MwHSfdFv0tXedyqBNKxnlxcDHCNVyxqr548afJ3+cRhqERk6ZXzrav0tp9+lkHfY6AMFTFTGq7mo4AxpaWV6O5OpdwhyPL3uj0UMIOe8g2Im8HhdW3ki8lA+DMLasMzUcLa4cuhCd/RtkeRlrvaZgXHiThFE2cCCMc8dAoGBAKrknuxOXTZZcokj1UMe3UdMomnDo5Lkon0j1ynEgEtSDMuWVTCln7N0e5J+4MAEi1Hd/o+Erb2miKRCPEUoNnhQqhTwJpRgEc3FvQDEIhBiRyh8iRd6S99E2aDRjtvfrrjDujFa48zqPiu//8GwFN3KRkaRBmKcbWDl8Eh5cgxK'),('0daa6be6-e5b1-4b34-ad65-51d29226ee8c','c3a8ae9c-bf6d-42f3-b1f5-abf9ca4ddf6d','max-clients','200'),('17ac0eb4-389d-444b-b0d7-0bdd0bb5a689','937b8c2d-dfb2-4b42-a29b-bd38b36a6b60','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('1a64f821-0e2d-4656-9cbd-8c514d903aa7','0a429143-71a0-4593-b37c-6f423095146b','keyUse','SIG'),('1b4d2524-75d9-4ae0-bd7b-0cfa1abd57ff','7420fe2e-e2f7-410d-b246-54f45931e81e','priority','100'),('204914bc-2572-4abf-bc2c-7a344e6aabd0','0a429143-71a0-4593-b37c-6f423095146b','privateKey','MIIEpAIBAAKCAQEAt+bXBcJ0PbIi35pfBfML9UcchdQ8AtapSoLtMByWzq89WCb5t6UcypFY3YcWMMewZB5Wg1uc7RrCoL7LpWIQLa63tHiq0PzDllUo32G9oBlmb5zRTVWiXCGSMJ2ZNAeWMCIU8KiL0aEDbuQs1o4fKDSOvjCby6k8uprGG2Vfe/GYlxpI/MnXEHiSg6wdq8CcEWAN/m/PLmulYvf5tMghFedFAuGDvSNKwNkVh0HFQ35lz+Nrh+wJM3UIYym3LuGeOlcGNAHRIvMJyBIXSoOpoNHQmo4Fh+DqWgxduy5AIz9MIIkdPpiMVbXsSYFZ0HsRdwCuYVLxcKD1ZusEsvZcywIDAQABAoIBAQCWFqkgwz45aBw8H/IzmdQFn77wnnFH48gQzuAjpwGRt8W6Hz0pG3FvBcbgLbL3ptIYNAZpeKiPfoqfxHfSB0Gq9vBpMx4+KDy8gc402cF4W6KVrwfHNP+ob6GvWcBCjXqO2BH9A6HxOZbitwi9JwrYtmRVZriQNBQjO9Q5YbfXH8j3VmVOjTJ9500dDV0rKTQWKPFd+WWAK0bsecOAYnYrG2K8vGIPa61oluRvDzOdZdkh0BItiKhBnqXOcwpBVNObyN+FhZqCgMNHc0VgdFU8OCvHsmC+OSuretTO99ktBIpNrUxap66La/ZT9/yWz6CwHa+xmhBMtxgl80xHURfxAoGBAOGnRnARc/s6vYwQ1tLKCWDavBQnlYPA20cFEjDlRWiwSOMHCGJgo2Hc8MqPOy1yVhIOyJbzwDZg6jGhQPv4vzUODecCuRPxMKSOGyqCyl1Q0fitAPbETxO7E2/JAOwK+mXfcOdpZv3Qg5VkcYbnoF0aajSqRHH9LPf+dsJcKAHJAoGBANCiJoCJkeHjksI720KFwHGN6Eg+GOB4/pXDeNc/97PC3Ghx0DR7sVBVVZcy9I9mZh6P33UepsDoBL3atkRUbkSLxeMlyraUTl1HwXpnylkad+3x9By7ZS78VG0Sz6NDnoPPez8TPyJdpopMiv6KqSGhzxep1CZPE3UcZPOlZNPzAoGBAMrc/UAnEKPdbSaMxPR/2eqO+uMLqyjlqrywXGhE1h+FzCD945W912RVoswX9FWpIqPdUowS2syIWEMB+1ALkqp51hnGoujAvsBRWS7golk+HWZ48hLm7UiJuLGYfRG31ODc/b2tToAEgyc9Q6rKdar94lkycZIgz9qrk8yr2POxAoGABSneNhQxjhupyDDfDlhtGOJgO1l+GCAmfOJnnTwyDzrlZZhbhNEC5HAYPDPApcPtBxiceTOXAPM9Gs3M8Qf96qhi72pCCB7Hibt66GKlOWtUSIlSd1uT94O7Oy/Z/7pus+hwrnD1gQ48TvPyBLa91N1CWN2VKJWQb7eSMA2J300CgYAeFAmEtZ9MFqQKLlMycrfaTysB/cWQFuj8b5Vliv7fcIO9OLixeHtNQMn0lYKrh7zfvVMgFmeS3BQV7lxHnr6rD1+v1YhgK7e2W8ikktcyM8vgKc8e/KPsCzrH/NOTNIGIrHmHn/5+EUsULM7JbPGK37Rt8BIntiTQqAqY85Vo8g=='),('209ae866-ab50-49b4-86a0-fa6e6c8e361d','ad72e957-8032-441d-bf13-85e65199622a','keyUse','ENC'),('2308c7a9-38a0-48f2-8b62-caaaf1209b23','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('25bf75ae-6bed-455f-94be-9df10bb7f824','5cb5d720-649b-4cd4-b899-42ec2d4f9587','algorithm','HS256'),('27fe7b00-4ba1-4ced-8aac-02c5c6616da1','937b8c2d-dfb2-4b42-a29b-bd38b36a6b60','allowed-protocol-mapper-types','oidc-address-mapper'),('2d9ce231-a229-4e6e-bf5a-25383867e662','0bfdf09e-d23d-4d49-9814-08741ba051a8','certificate','MIICnTCCAYUCBgGMOY/BwzANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdzaWdsbzIxMB4XDTIzMTIwNTEwMzc1MVoXDTMzMTIwNTEwMzkzMVowEjEQMA4GA1UEAwwHc2lnbG8yMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJqmO+cyxMUqa/ZazQG5a6qILGT5EirqqPlv7Q3MiFsWqprzIJD/O2nHkdrsRJ3BmtWDdOxY4DpxAJNlCH4oln22Eqerpahd50jm3iIYESgYnxpwnqwdpV57/pUnJi610CTAANWh2Y05XR6TxgqvTTjfVrAPjipn5VrOd7SdvqHwLkj1vmm70R9UKwu4/dZoMS4f04yAypKc7njJXFAaO5K+mguCgK+35Edyqw4SgfbUs3xynXzHVBERui2nfLA6j72gcrfGCgA5zj2v45n1rPRd18t2gRskl5lvvel3VtEpkQjTGxh11v0fQPmuZq2Qu01lAGV3wXaTRSNRfjDiXD8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAWEZwODNQYnZ14dssLbI9sT4EzNp9SIqCenWCPFHmVHYpKjC0r/Xudwl50FvbiOUk2R0AJfEZqx53yjNmtMMgbDj2TrOxQLoNBLQgFD/eL2wmjdeYylBQbsCuPfC7FR57K2N0GOb4zJ9XmVvjmfQNBpZW5lJCUdv8/pq0oMAU+uHonXvod4l35A9WeoWnvE9PkU17jFtR01HEApFQpYLgP97Ag0neoJxRcn5FPd+t8TReMXGnwm4Q6gOWNS1G/mDx8uIsMTtqghBz+qSn7ozX8JgINCZRoVdqDtzO7xVwGLu7C8V1Sr9TNdMO1fjv1RvdofLOzQ1jcXqOl4sGcJcHkA=='),('33bac16b-0691-4fbf-91a6-8b6a28dce4ea','937b8c2d-dfb2-4b42-a29b-bd38b36a6b60','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('35a9a472-7fdb-4c34-9509-b33f2f0ba798','937b8c2d-dfb2-4b42-a29b-bd38b36a6b60','allowed-protocol-mapper-types','saml-role-list-mapper'),('3effca36-0ef4-4f7b-8f2a-0ea48bf97cc5','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('40be362c-3bee-440d-9790-073aebbad697','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-address-mapper'),('42004b2d-1803-4bd8-899d-cfe3bad35879','5cb5d720-649b-4cd4-b899-42ec2d4f9587','kid','b95573d3-d977-41b3-bd31-c53f25835e97'),('43f2f404-c353-4f2f-a4ae-7ebda05f3bfc','811288b9-8e90-487b-969b-82d36b785c27','privateKey','MIIEowIBAAKCAQEAhs5QuctR5MXUOV78Xoctu1pEFeCAlZzgCWQaNm8OelQlqEd+ZGo72Mx89oC8D95tCehLftfCEaJ6WZ3mwyVaMT/jtUsYkuJ7/Ip6bDW5KRT+Ctv288HyNrwzmJQRJ1fRllZvAkxx//TWZCvsWAknijeDIpCreSU4U1I1SrkOhQV0zIx0tjnZEKlGhWBk2+acPc2s6V8Y05RZsktzleRYjfaljwE1S0kRbo/we4uEQ3KwmJzNHlvW3AWHc/JWN+8etnVbMdWCM7nYAYg7wjc8xXZ63TCgx00amEdm/uxLNU1I9W/wBd18uM6OykOiURwn1hytwcQOIYxOZLF9Lb1iyQIDAQABAoIBAHk5UtKhCdXGKKAm0J9YxEE0XQGnTzo7RiRrxj6pA8XxoaOAFyLJfWPqD33EKlnC1R8Rq8I216fwCkJIgll+X2rmXyiKjWCZFpH1HT3t2cIdxI2TXLG6+MtL1sIgdISCrlCZDV5tzB412A1gijpokQvz+5K7sddRJyOWS6IUZAAtmNTKvfW30dUsVy2eLurLS/S2Os/ER+QCEPhH2jpjnde2zXnSVNgo7VC8atrTBHT740mH16eoOgwbE4wy07sHKWqzx4W7NotWs43gZty6LagnGaTGWd9mqgVMMeG6XIhV1FSGcKdKPfBcqh/vnD8+xEboaPpdtX7TaDdhMpuTleECgYEA+lEFia8mQmtyrklI+I5wcdcxdwOqXUW3lXTEPFapsJbsqUUcuQL8W79KRqJpYN6CK1/mkvgrrMqmAgQacK+OUdQQrOrIYN5eLqTt3UDqvqLmMjBZQkPXlsawPRzQRZumeUflfzy+7VN321B4bGONJLshz5MrcKdi8A/V6zWLSTUCgYEAid3h1NiSgkBFMnel+hlGE3cdsaCXONjAGgVighTnRU1HYogCozW1gLna2aR14cju67H+5Pxo2k4Gkc14CXlsOQMJUfJr3kMZjZfnw7hq6lJBdh74rwPBpcmoXmjI7oXOr1CSDfbh2GMcrIXjYQYbCtSFFK0ucYzIuN8AzAakecUCgYBqp6MIa0yN+GJAyJEC9w4KM3qsDy/D1jTGxZ3nZ7WdvHDSHtSCMDd+kB8BwanM0IH+ITqJXJyfXykkqsLpSKQHUahZRSBjxduzXCrNnx9mYtpagCdICMgPQlFNeL11K0DfZDbw490mGe5zz/G/nRtCj0l0vGxB79BEITswoPvcEQKBgF64jmcxYP+Sbrhs0iFR6f6HsWQP5LYO3XVDS9n5yKepn6kHr2A5D3ngt4ce4kr9RYG0Kl9jOBr8zrCwDY/c18kX1/hwaUIsscrBml+zPem+F/Gy98Mu/oYMVdx/e8W9MzLqVV64x5RnDBVQa9eGXWAEgWaiUa18P5AczyxeR/TNAoGBAOgAVD9eaX8Zcahew4FSCW84fIjWOEOQziCCgWMpJTAumqyIsSlX+GjdrHcgigswGmcyuP0eAkAnzxvtN3hueINabxsSTxJ8fa5arsAw2O0TGyYd4XcAEEYr6OVNN/7MInNXWxp/jxSskmlQSp+t8M/KFhzXJ8PO7R7E8RIHThOD'),('4998ac9c-f60d-4fc8-8005-307e16b5f658','5cb5d720-649b-4cd4-b899-42ec2d4f9587','priority','100'),('49d8e6a1-062a-4b76-9509-5eb1a5d9578e','ba5ec0d1-3d4e-45f6-8dce-97dd6eaa0946','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('4cdbe480-8749-4710-aada-d7eb261316c1','811288b9-8e90-487b-969b-82d36b785c27','algorithm','RSA-OAEP'),('4cf2dfc6-9047-4992-a683-3a206cf054e2','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-role-list-mapper'),('4de38046-c969-4bd7-856a-d92ba1a2b54b','c7604a3c-d217-410a-841b-2d3cfe05b6b9','secret','MSGvSSWN__rHtbP-g7hspg'),('5327c383-cfdb-4188-8592-e80950d62ed6','c7604a3c-d217-410a-841b-2d3cfe05b6b9','kid','ff9207a2-ba74-41ff-8afb-3a1f0cb1a98d'),('5c11dda5-8d9c-4c5a-8930-05d825091ac8','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('5fc667cb-296a-49f9-946f-30fe26be94cc','937b8c2d-dfb2-4b42-a29b-bd38b36a6b60','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('60bc4859-84cc-40ef-9515-b7d54b3da8d4','ba5ec0d1-3d4e-45f6-8dce-97dd6eaa0946','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('6436b618-608a-4f10-b1be-c6fd4c9ff47e','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-user-property-mapper'),('6933928d-3d8a-4aa4-a576-a3d7c9765f72','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('6ab9efb8-6db3-44d4-8e2a-5f68f7fc9997','20217c77-2196-4ae6-9d79-e799d807904c','secret','wXOZzg5P6v7UwvRij4rxRIQqnK7KQ0dZjOSJtSMR7soSAE7Ccl5kzjYAK_gQF0f8Bwqor9oNpF4lzIseE1z93Q'),('6c1ca111-4580-4dc8-821a-384c4566063f','ad72e957-8032-441d-bf13-85e65199622a','priority','100'),('6cfedbb7-a441-4900-9d5b-c60171df2f74','0098e192-5eea-4102-bbf0-f69798acea5d','host-sending-registration-request-must-match','true'),('6e66dfb8-7b66-4ba7-acc3-6a73888ff9c8','5cb5d720-649b-4cd4-b899-42ec2d4f9587','secret','e-pFgm0GMFSraoK9FxrVE8Kay3op0qFrXZdpMaKRdOBz2H3Ziwza8VMrwft5QdlGsYh4k3BZolfdEDWppCkb9g'),('70dd65fb-59f1-4c9e-a89b-b5bd1ebeeff2','ba5ec0d1-3d4e-45f6-8dce-97dd6eaa0946','allowed-protocol-mapper-types','saml-user-property-mapper'),('76f90c9a-783d-463b-bea7-fbd9ccc8cb50','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('855bb31c-73ed-41fd-b713-d0c06a4eaffe','765cd604-3dd6-49b4-af5e-7363f1d7883e','allow-default-scopes','true'),('95cd9209-2fb8-40cb-99fa-cdd78ed64038','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-full-name-mapper'),('96352423-6fa6-4cfd-a461-153181e5f613','ba5ec0d1-3d4e-45f6-8dce-97dd6eaa0946','allowed-protocol-mapper-types','saml-role-list-mapper'),('9711f20b-c112-4afd-90df-9ee62b45416f','811288b9-8e90-487b-969b-82d36b785c27','certificate','MIICnTCCAYUCBgGMOY/CUzANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdzaWdsbzIxMB4XDTIzMTIwNTEwMzc1MVoXDTMzMTIwNTEwMzkzMVowEjEQMA4GA1UEAwwHc2lnbG8yMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIbOULnLUeTF1Dle/F6HLbtaRBXggJWc4AlkGjZvDnpUJahHfmRqO9jMfPaAvA/ebQnoS37XwhGielmd5sMlWjE/47VLGJLie/yKemw1uSkU/grb9vPB8ja8M5iUESdX0ZZWbwJMcf/01mQr7FgJJ4o3gyKQq3klOFNSNUq5DoUFdMyMdLY52RCpRoVgZNvmnD3NrOlfGNOUWbJLc5XkWI32pY8BNUtJEW6P8HuLhENysJiczR5b1twFh3PyVjfvHrZ1WzHVgjO52AGIO8I3PMV2et0woMdNGphHZv7sSzVNSPVv8AXdfLjOjspDolEcJ9YcrcHEDiGMTmSxfS29YskCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAbRbjaoZEF6YwXxgnCcQ0SygTaeqo1shM5fL3nweAhVOP9c0YYweGFtgJX04pjTdnsvakaHezAZhHV+KwNjlEhuinIDGcquevFwFcDx1pSWRQSh7Mvu87+xDEtU4YAbFw5eBlTN7U96Ea2gcE9cYfvrGnwlJh7i+5IuGucWFIDh/HMa0Yjh6ZV4RQnOjA4Q8r4hkQd5gQxgho+SsXk4AfN1hhNoNxIrxm6tcUyPRvPW87fsmLRFOXVHeLBzrR0C6cI3gxImZDvKoq6mBk0Q7lIKLSXqURoU0queG4K3gZt272jNUnUeV+9lK/jEcvwn8ghP79aWVn+yV2Pyj2rYMmBQ=='),('973d05e5-c84d-4649-b0ad-bc266a0ad240','ba5ec0d1-3d4e-45f6-8dce-97dd6eaa0946','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('97904570-212c-43e8-b330-006d74b1c36d','ad72e957-8032-441d-bf13-85e65199622a','privateKey','MIIEowIBAAKCAQEAn/O0Nm7liQ4TCgLvoLF1qJME989VfoX458POsn5Ku9b/QxhWIV3Dn0umFd+BaeEblh0P/9AaAqq7+QVAPDXMJuP4QckRe0pNpavAQzmiqRt78bYqFWCKYswVVRXN1nzYc9X/8RD5Jsc8vFuDvsY/aqnm6vVIK84b5WmbbqNRT1X/gxIUfS139CTLqNdjSyKsb7pZOmjy+VrSHlLa4VasRLCKotVajeMkgXAL9e7rV1tbA+35QwplqxMcrfJOnyxxo46fkv6n9C/bMRWOTOathQOaNoC87Hv3WPIWpIXRAelFoCwdQVXlVPt9zuVaUYCRjTaLCYvJo6HcyBTc7obbIQIDAQABAoIBAH6qBJnec9J23MjezlgYb64QzqxW+cL54MPYIYTj0daySO4fBYXitJke1OUZW2g3JRtY5GSVrSNThQuMBvQnPgXGHcAqs7dIffil69jQeWklJJ+iu+y1yKC4MGRyodAqiVYhr059PHBi8kvOxKN8ZpfW99A0cPSPgTPIz5drqWYC2Yrq+yt1DC8b7mTQj8+atMMRSvwAkTdz4Ez2wMNDFYkfADPDdGQ0V73q0VIc6HqQ/ndDqfzrDNY9FcU6xK7mCFzCN3vIvvizcotwzBh34IdHtHIYq6/+zAmyYrXeD4Fu0zAg7PO6dFY+8NFUlO9nBvs5Qy0xWOosEriI9Wk4dWkCgYEAzhV60TzW5Bd5Ylv1z9QGXegmiMaSNYoC1Pf9/zMv5qjt52Bj+b6fdtMEzk8DwLsT+OyI53xC/ZLFQV+BF/V+mhwOH9pz7e1ev5h6GuA8RCo5pH7aWR4wwXMjQBfKxUeA9+7cMbadoXIPAdobS2M3QWkF7lxq3J3mvmNri+D7zX8CgYEAxrG/wppcH69d2ebJxwB5rpTOiJNuLelVzMjt9lY4kLpzAbfN/CJCXdku4Ke5+V/TXBeFvOGE6hENqWo9lnfncLyYYdGKOss/MNoWfGLPZvsw5drJDu36ukK/sUlV6GHulG73UpBqRKcIqio2xl6+U29pxVHmUwEmAc9RpulY518CgYBapqArwfNUye6fEYyDKuTSEfhBWfeejWLJg3y68S007UIY8RGJHgzPG+uVRLSF5sTWTlW6XbKqEBGsu/HxNA/IgmbEJDeyhSOUa+HqSJC5+0j3zsUFRn5z2c27t7t+JAHbDbrWM1oLVjy7t9EhzDbWEviE7SokeWCyhtEb6o9YyQKBgQCVi8cWgvN/bZAnpwqLWxI6kgl4xe4RZCONxFVGKNLeK1bQHjVM5cQpuoML13Gj/bmpAJNJ/Dr7qOYtcqb0Dz8EnQ3b4cg2RC9FZ3+xEvWjPsAo4CifsgIaGo8IsneUNdFJqtM/My6oiUd+O9OKLlj1l092khPWuXCPwChmhg7B5QKBgB8JY8i0GmymyjzkgPWxxgKBd597s04LHZ/7NBX17iwXMJvd03qyO4Y7+R5qQQNLw6EZKAnZ0/r/ltX9I7PhUPfZM3RSaBSIAWFABnTGG0PCU7zi0UAwuyz/EGutGINvBq8/zVKEJb6NhCuz3+XeqobvRh15yAyt6Ie16RiZMyT7'),('9ad453ab-7dff-417e-8d8b-1320fd9c4cb0','20217c77-2196-4ae6-9d79-e799d807904c','kid','baadbf38-2802-47d6-9e16-964ddea05b4c'),('9c4c0b06-e789-49cc-bbf7-3b1132a976b6','7420fe2e-e2f7-410d-b246-54f45931e81e','kid','7f77ca2e-16db-42e0-b735-3a99f9d8a1d9'),('9f46a88e-6272-4d69-a8ee-bd344c41674a','b0cf4df0-e86a-4a23-8242-117379948edb','allow-default-scopes','true'),('a2d408db-b452-40b7-969a-d6ede27aac84','937b8c2d-dfb2-4b42-a29b-bd38b36a6b60','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('aa85303d-886a-4ce6-bf8c-1d9daeb74176','ba5ec0d1-3d4e-45f6-8dce-97dd6eaa0946','allowed-protocol-mapper-types','oidc-full-name-mapper'),('ad36b7c3-ffa8-4d7d-afb9-642d472267e3','ad72e957-8032-441d-bf13-85e65199622a','algorithm','RSA-OAEP'),('ad950921-d1cf-402e-9574-777ecac239c1','b75485a4-f673-4081-9238-4b5e7f5eb222','max-clients','200'),('b1c7b83b-2212-486d-945d-3f9999b810f8','f4051ae6-7205-48b9-ba39-2b254e984322','allow-default-scopes','true'),('b2da9d8b-ed41-4839-82bd-9a7cbb6af95d','c7604a3c-d217-410a-841b-2d3cfe05b6b9','priority','100'),('b5d89703-1a0a-4e3f-8254-e9dae830aafe','0a429143-71a0-4593-b37c-6f423095146b','certificate','MIICmzCCAYMCBgGMOYg8fDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjA1MTAyOTM4WhcNMzMxMjA1MTAzMTE4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC35tcFwnQ9siLfml8F8wv1RxyF1DwC1qlKgu0wHJbOrz1YJvm3pRzKkVjdhxYwx7BkHlaDW5ztGsKgvsulYhAtrre0eKrQ/MOWVSjfYb2gGWZvnNFNVaJcIZIwnZk0B5YwIhTwqIvRoQNu5CzWjh8oNI6+MJvLqTy6msYbZV978ZiXGkj8ydcQeJKDrB2rwJwRYA3+b88ua6Vi9/m0yCEV50UC4YO9I0rA2RWHQcVDfmXP42uH7AkzdQhjKbcu4Z46VwY0AdEi8wnIEhdKg6mg0dCajgWH4OpaDF27LkAjP0wgiR0+mIxVtexJgVnQexF3AK5hUvFwoPVm6wSy9lzLAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAColMChmv44wfmaUPfbtHsCkFqJvbCZUssRTky8fS6QwUw0Menmra9aCjox361I+T+z5xu+hcUo6A/WdgUPtdRNISBjYQIKAcGExg6HcdGoTKfhTtrlc4zFZiaLAOiyD8q/8XON5DxDojQ59WLbrZwdsZt9jWTTmocJIhFlJoxoHuDl1sGohGVgSfInn+9rl8sF6bftWL9OqoFYUpaKk940Sm8ox7EkflHWvhZlg1m7dkt727bN2O7WXkXkcTIdHYWPp88DegImjwvzUl+MUZkrFBAko8gqZeARmKuxxXxygjuVWw2TegD5V49S1O518/4Npemc/F/yCJZfEdHXUZno='),('c0793f99-8583-4c93-9d8d-3a46c51fead7','20d0e80e-2d0c-4660-bdee-a48289cacadb','host-sending-registration-request-must-match','true'),('c1324c3e-3543-408c-b1f3-3aee6df480ac','ba5ec0d1-3d4e-45f6-8dce-97dd6eaa0946','allowed-protocol-mapper-types','oidc-address-mapper'),('c2232e72-7b1e-4980-9ea8-0e1bee67f796','937b8c2d-dfb2-4b42-a29b-bd38b36a6b60','allowed-protocol-mapper-types','oidc-full-name-mapper'),('c579d396-5ad4-4d8d-911d-eb6569168fdf','ad72e957-8032-441d-bf13-85e65199622a','certificate','MIICmzCCAYMCBgGMOYg9ZjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjA1MTAyOTM5WhcNMzMxMjA1MTAzMTE5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCf87Q2buWJDhMKAu+gsXWokwT3z1V+hfjnw86yfkq71v9DGFYhXcOfS6YV34Fp4RuWHQ//0BoCqrv5BUA8Ncwm4/hByRF7Sk2lq8BDOaKpG3vxtioVYIpizBVVFc3WfNhz1f/xEPkmxzy8W4O+xj9qqebq9UgrzhvlaZtuo1FPVf+DEhR9LXf0JMuo12NLIqxvulk6aPL5WtIeUtrhVqxEsIqi1VqN4ySBcAv17utXW1sD7flDCmWrExyt8k6fLHGjjp+S/qf0L9sxFY5M5q2FA5o2gLzse/dY8hakhdEB6UWgLB1BVeVU+33O5VpRgJGNNosJi8mjodzIFNzuhtshAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHqq9VaAeVkTUDxnl7VeuuqdxlGRr8cW3icSSmIUpkWQbw3/gMFfGa84zMgGGwBABlZRKGmr095disKYXfIH+E5Q+Hj92NVQiFT8NY5EO2yeswAD7+yshrwev7XEhlFPc+JueND48g8kxtXvIvTilOepxhEyexGPfXGoxWfj2k5YCf3aQiByKr+PytVsIl5uuUD8t3+SGuon6KJWo1vJ/aGOBVr0UD5CCkN3k3CLpYzW6mGX2bm0OO5ZejkxF89iAH4k9+ASu13KPWH3iahtsn5GtWKMm+U9/Dw1pGAbCfetg/lvhSGMRpwf6f8TClhbsfE0GnQPmqawm13MLezCAEg='),('c5bf7c78-e910-4f01-bf8d-0756caed153a','937b8c2d-dfb2-4b42-a29b-bd38b36a6b60','allowed-protocol-mapper-types','saml-user-property-mapper'),('c655938e-6446-479e-a4fa-35e5e807f232','7420fe2e-e2f7-410d-b246-54f45931e81e','secret','eXOyX9BlkRYzJcmbglMRWg'),('cc0f01d2-abc3-417c-97b3-67f2a1a35007','ba5ec0d1-3d4e-45f6-8dce-97dd6eaa0946','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('cd11b4e7-41b9-45b2-afea-f867c3904f9c','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('cd7c7694-2f3c-4284-9bc6-9ccd588dd726','0bfdf09e-d23d-4d49-9814-08741ba051a8','priority','100'),('d39b6cd3-d968-452a-ab18-62aa2607b034','20217c77-2196-4ae6-9d79-e799d807904c','algorithm','HS256'),('d6d6ccb2-6f47-4a9c-89d6-9fa24449bbec','0a429143-71a0-4593-b37c-6f423095146b','priority','100'),('dd96b24b-bcff-4025-a37d-69f5281a4d04','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e0bc99be-5b68-41ec-bda1-cf6fae7bb889','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e6cecf60-c2f3-4eb8-9c66-2cd629d02806','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-address-mapper'),('e9eb8db5-f228-49f6-9cd1-e7b902a2d61a','811288b9-8e90-487b-969b-82d36b785c27','priority','100'),('f3ceea18-d498-4616-9a52-000186563ebd','0098e192-5eea-4102-bbf0-f69798acea5d','client-uris-must-match','true'),('f8c5405b-ef2c-4c26-bdf8-8d0e512148c2','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-user-property-mapper'),('fb8c2b51-577a-42e8-8ed0-5be2ae19ab58','20d0e80e-2d0c-4660-bdee-a48289cacadb','client-uris-must-match','true'),('fddc1691-7478-4c76-b767-f63fbea05b63','20217c77-2196-4ae6-9d79-e799d807904c','priority','100'),('ffcda39c-f721-4fd6-b060-44b4c4a2caea','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('41c84990-b008-44d5-9e26-0d583894a9d9','033a71fd-c5c0-40a0-b47f-4278407844eb'),('41c84990-b008-44d5-9e26-0d583894a9d9','05e39679-fa10-447c-b7d6-b00447a2a34a'),('41c84990-b008-44d5-9e26-0d583894a9d9','0c549f30-f75e-4223-b136-97971aee2c86'),('41c84990-b008-44d5-9e26-0d583894a9d9','0eb4d425-5b71-4dce-bc3f-5e32b961002c'),('41c84990-b008-44d5-9e26-0d583894a9d9','0f47d697-5f60-4af9-a8c8-e068db72ef6b'),('41c84990-b008-44d5-9e26-0d583894a9d9','18c8e8d2-14db-4cb8-ac5a-7fc47017153d'),('41c84990-b008-44d5-9e26-0d583894a9d9','1fe3d096-70ee-4795-b935-91b2cd3c4f2e'),('41c84990-b008-44d5-9e26-0d583894a9d9','265d748d-bb60-433e-a0b3-a42bd5506697'),('41c84990-b008-44d5-9e26-0d583894a9d9','2aff17ec-b10f-4f95-9a01-6e418e810c01'),('41c84990-b008-44d5-9e26-0d583894a9d9','2e538b71-4837-44a6-9b01-c4c3fe356d3b'),('41c84990-b008-44d5-9e26-0d583894a9d9','3cb19a85-496e-4d7c-9d8c-ef4f34ef4c66'),('41c84990-b008-44d5-9e26-0d583894a9d9','47f97e2f-7a6c-4a20-8c1b-63c066ddc3cf'),('41c84990-b008-44d5-9e26-0d583894a9d9','53331e5b-6480-4eb7-9a5d-49204bb57381'),('41c84990-b008-44d5-9e26-0d583894a9d9','53632dd8-c774-48a4-aa77-31f2c2e8e9af'),('41c84990-b008-44d5-9e26-0d583894a9d9','570c1c35-36cb-4e9f-b96c-e8b6132f077e'),('41c84990-b008-44d5-9e26-0d583894a9d9','641bf31f-4ec5-4f6e-a5a8-a296615ccf22'),('41c84990-b008-44d5-9e26-0d583894a9d9','6b5f9116-57c6-4b05-ba08-6e06468cfa5f'),('41c84990-b008-44d5-9e26-0d583894a9d9','79c75a1e-79b7-444a-b262-74482096193c'),('41c84990-b008-44d5-9e26-0d583894a9d9','7bd9c1d3-3725-48f9-88cc-9404410a78ed'),('41c84990-b008-44d5-9e26-0d583894a9d9','89bc6bb3-5ce0-406f-b079-9fa52734ee5b'),('41c84990-b008-44d5-9e26-0d583894a9d9','9234a224-d7b0-4b5e-9016-cb3b4f3af753'),('41c84990-b008-44d5-9e26-0d583894a9d9','a051b37a-98b8-4103-9721-8d3e94af584b'),('41c84990-b008-44d5-9e26-0d583894a9d9','a5fcc62c-8219-4ee6-ad36-78ce2e715b66'),('41c84990-b008-44d5-9e26-0d583894a9d9','ae437453-62e9-4429-8923-93e40a195ab0'),('41c84990-b008-44d5-9e26-0d583894a9d9','b2ec4ad3-eced-43b7-9a26-6a9898890546'),('41c84990-b008-44d5-9e26-0d583894a9d9','b320fec7-c744-4b6d-995c-a9e8a331971f'),('41c84990-b008-44d5-9e26-0d583894a9d9','b60d9191-2e65-401d-be5a-8eb961049181'),('41c84990-b008-44d5-9e26-0d583894a9d9','b65844b4-d85c-4a7e-8a2b-9076ec9b43e0'),('41c84990-b008-44d5-9e26-0d583894a9d9','c65b3e43-9e2a-4b2f-abb8-e32e68b52581'),('41c84990-b008-44d5-9e26-0d583894a9d9','cfd5954f-ffe3-430a-b79b-376cf7de107b'),('41c84990-b008-44d5-9e26-0d583894a9d9','d1751874-d8e4-4f64-bfd8-2224741d196d'),('41c84990-b008-44d5-9e26-0d583894a9d9','dfedfc57-e69e-4ce1-95a5-16024f119289'),('41c84990-b008-44d5-9e26-0d583894a9d9','e10b5fdf-88a5-430a-bb9c-6bea221d9e1c'),('41c84990-b008-44d5-9e26-0d583894a9d9','e5d4b518-07db-402d-adf2-0bf4f004a67b'),('41c84990-b008-44d5-9e26-0d583894a9d9','f187d983-3140-4310-9812-87f832a02158'),('41c84990-b008-44d5-9e26-0d583894a9d9','fac28a38-d4ff-42f7-891a-42f933f48695'),('41c84990-b008-44d5-9e26-0d583894a9d9','fc52cb85-9cba-41ff-b897-89f715f19806'),('54d5c122-1802-4139-b68d-e2cec2facbb8','09c39e33-cc18-4493-b30a-958b5ccb54aa'),('55c43002-4c16-49ef-87a5-30deaa22314b','8748520e-df8c-448c-b03a-f7e53b6bf973'),('55c43002-4c16-49ef-87a5-30deaa22314b','8f22b474-5230-47a1-82d1-922f73a786e9'),('55c43002-4c16-49ef-87a5-30deaa22314b','92e0c80c-ed04-427a-89da-e936808b8d09'),('55c43002-4c16-49ef-87a5-30deaa22314b','f1a73bfd-e4f4-4346-bf47-0e92b3941990'),('70d0fe77-e963-453b-935e-6984d04c3ea2','029be5cf-c565-4b6d-b87a-cfde88ad29b0'),('792abce2-e2c3-4068-bed9-5b3d41c92bc7','5cd6ea48-18ed-4d05-8071-9854fffdd12a'),('7bd9c1d3-3725-48f9-88cc-9404410a78ed','3cb19a85-496e-4d7c-9d8c-ef4f34ef4c66'),('7bd9c1d3-3725-48f9-88cc-9404410a78ed','a5fcc62c-8219-4ee6-ad36-78ce2e715b66'),('92e0c80c-ed04-427a-89da-e936808b8d09','2026770f-d9f4-45c6-ad72-901d39ebf1a4'),('96e59b28-471d-415b-8ee0-38a05bb39cae','00d2408b-16ca-4b23-a089-c7e53d687912'),('96e59b28-471d-415b-8ee0-38a05bb39cae','29c39638-3ea9-4db1-bf4b-2fde704428a0'),('96e59b28-471d-415b-8ee0-38a05bb39cae','544bca16-9562-49bc-a4af-bc4f949519eb'),('96e59b28-471d-415b-8ee0-38a05bb39cae','be2bac59-1270-4548-a537-535159bdbf29'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','26084389-cab9-45fa-93ea-66f47fcdbbd1'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','285bf1b2-c1b4-4581-a161-bd23ac640baa'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','345907e8-7f50-43f5-9c81-624da4d4942b'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','48533797-37fb-479c-b4aa-4f054faed6ac'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','5d43716f-3ca5-48da-9d7d-739f529096dd'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','7460cf09-2886-4829-bcd0-5ccaa42dbd57'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','75b816a1-3b66-4c03-b75a-8b772946c711'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','7d2dda07-06ff-4d4f-89d3-820498596b27'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','a2a6d51e-21d2-43af-8939-bc8358d562b8'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','a633afdc-9331-4419-953e-69c90773f17e'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b4818dfb-4434-41fa-9600-434ca3f5442f'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b54bfb8c-12c5-4d91-8d17-8913208e6765'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b5d2075c-edf2-4415-b121-87b1bd4286f7'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b9839a7b-b519-4c27-bf9f-396e5bb51bb2'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','ca0b5753-e677-420d-bb53-0fc590c08c1e'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d118260b-b1fe-41b8-83e3-48f76748d0fc'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d7263fd7-1aa8-471a-a562-2576e6a886dd'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','f054da5a-1733-4542-b8da-4ba49f1b89ce'),('b4818dfb-4434-41fa-9600-434ca3f5442f','7d2dda07-06ff-4d4f-89d3-820498596b27'),('b4818dfb-4434-41fa-9600-434ca3f5442f','a633afdc-9331-4419-953e-69c90773f17e'),('b65844b4-d85c-4a7e-8a2b-9076ec9b43e0','e5d4b518-07db-402d-adf2-0bf4f004a67b'),('b65844b4-d85c-4a7e-8a2b-9076ec9b43e0','f187d983-3140-4310-9812-87f832a02158'),('be2bac59-1270-4548-a537-535159bdbf29','8ef8afd1-6f01-48d3-9cc3-92983ff5fe8e'),('c65b3e43-9e2a-4b2f-abb8-e32e68b52581','89bc6bb3-5ce0-406f-b079-9fa52734ee5b'),('d118260b-b1fe-41b8-83e3-48f76748d0fc','d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf'),('d1751874-d8e4-4f64-bfd8-2224741d196d','53331e5b-6480-4eb7-9a5d-49204bb57381'),('dea41763-6811-47a0-a1e9-0652e7487c4f','7a33b7d5-afac-418a-ba38-3a4d696d4cbe');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('1eb3c7e4-1d96-41b2-8728-b2919ac3c228',NULL,'password','9b0088f4-1d23-4316-9ea9-d11e5e3ba838',1701772910790,NULL,'{\"value\":\"Sb3whCqeISaxIJ+38hVq0jBXYOaYHPGJheE8OijBbcM86kTsNIO+szeb+dLksiqzHuoh+vGjdx4Sv0s8tIvBbA==\",\"salt\":\"QHLs2uJhraMKui0nfRvcxA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('47de34bb-25e7-4932-b320-5035cf7b718a',NULL,'password','4f129caf-547a-4509-b955-72c721a5eca2',1701772799424,NULL,'{\"value\":\"nni7/nHrDWorjbLqxFtxVTqAtPfPgcKnPQL2eFkS8l/9LmCZJ9B+WyWAAXBeCd4IzCiVu7PGl2AGM/2ZXTHlBQ==\",\"salt\":\"0azB3YCnt6OiIsjLqjRPdQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('4bebc5bd-cba6-4bcb-ba7c-b8eb17652470',NULL,'password','88a7f372-6554-4d89-ad2f-777ab7ffc114',1701772876351,NULL,'{\"value\":\"jHHkhD9wu8A/T7tGemQWoO5+oU/0/J0Waxyr1/fOg83mzwyWq4yl36ta1KsacPXi+4qZnI2+mb7USsa0gDXsaA==\",\"salt\":\"iogZ5x97TAmpnSTB5jPOXg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('5e6e085d-6f6a-4405-b9f6-29dac7db6152',NULL,'password','e126f99d-05d3-49cc-a2cf-849fd870d1f6',1701772279971,NULL,'{\"value\":\"gQT0+Cf+FZFtaaAJ/gmjT271vtRscPFH/v7JaRP5A0ByYi9HXMzpml4AmRz3rjDCKO7mXABf+1TZOh2lLFrHyg==\",\"salt\":\"oKYt00tHI1EFwT/WWqWB5w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-12-05 10:29:50',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-12-05 10:29:50',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-12-05 10:29:53',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-12-05 10:29:53',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-12-05 10:30:00',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-12-05 10:30:00',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-12-05 10:30:05',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-12-05 10:30:05',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-12-05 10:30:05',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-12-05 10:30:11',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-12-05 10:30:13',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-12-05 10:30:13',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-12-05 10:30:13',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-05 10:30:14',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-05 10:30:14',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-05 10:30:14',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-05 10:30:14',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-12-05 10:30:17',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-12-05 10:30:20',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-12-05 10:30:20',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-05 10:30:20',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-05 10:30:20',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-12-05 10:30:20',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-12-05 10:30:21',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-12-05 10:30:21',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1772174972'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-12-05 10:30:21',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-12-05 10:30:26',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-12-05 10:30:26',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1772174972'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-12-05 10:30:29',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-12-05 10:30:30',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-12-05 10:30:31',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-12-05 10:30:31',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'1772174972'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-05 10:30:31',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1772174972'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-05 10:30:31',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-05 10:30:40',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-12-05 10:30:40',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1772174972'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-05 10:30:40',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1772174972'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-12-05 10:30:40',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-12-05 10:30:40',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-05 10:30:40',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-05 10:30:40',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-12-05 10:30:40',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-05 10:30:44',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-12-05 10:30:44',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-05 10:30:44',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-05 10:30:44',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-05 10:30:44',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-05 10:30:50',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-05 10:30:50',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-12-05 10:30:53',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-12-05 10:30:53',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-12-05 10:30:53',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-12-05 10:30:53',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1772174972'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-12-05 10:30:53',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-05 10:30:53',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-05 10:30:53',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-05 10:30:54',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-05 10:31:01',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-12-05 10:31:02',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-12-05 10:31:02',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-05 10:31:03',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-05 10:31:03',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-12-05 10:31:03',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-12-05 10:31:03',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-05 10:31:03',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-12-05 10:31:03',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-05 10:31:03',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-12-05 10:31:03',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-12-05 10:31:04',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-12-05 10:31:05',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1772174972'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-12-05 10:31:05',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'1772174972'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-05 10:31:05',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1772174972'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-05 10:31:05',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1772174972'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-05 10:31:05',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1772174972'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-05 10:31:06',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-05 10:31:06',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'1772174972'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-05 10:31:06',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1772174972'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-05 10:31:06',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-05 10:31:08',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-05 10:31:08',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-05 10:31:08',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1772174972'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-05 10:31:08',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1772174972'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-05 10:31:09',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1772174972'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-05 10:31:09',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1772174972'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-05 10:31:09',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1772174972'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-12-05 10:31:09',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'1772174972'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-05 10:31:09',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-05 10:31:09',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'1772174972'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-05 10:31:09',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'1772174972'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-05 10:31:09',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'1772174972'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-05 10:31:09',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1772174972'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-05 10:31:10',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-05 10:31:10',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'1772174972'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-05 10:31:10',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'1772174972'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-05 10:31:10',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'1772174972'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-05 10:31:10',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'1772174972'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-05 10:31:10',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1772174972'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-05 10:31:10',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1772174972'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-05 10:31:10',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1772174972'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-05 10:31:10',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1772174972'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-05 10:31:10',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1772174972'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-05 10:31:10',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'1772174972'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-05 10:31:10',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'1772174972'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-12-05 10:31:11',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'1772174972');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','154a486c-3b78-400c-b872-3895677f7eca',_binary '\0'),('master','2f0f3a95-4ac0-472b-bab5-057dcb976683',_binary ''),('master','7b2f4aa2-3e7b-4eaa-b502-f036ee2501be',_binary ''),('master','7b628f28-9a74-40f1-ad32-16626715f649',_binary ''),('master','92af6569-08f2-4df9-9f63-dadb8f9fa88f',_binary '\0'),('master','9dd53193-d502-4d19-80d9-87acf9580320',_binary '\0'),('master','b423d019-4240-484b-8b76-b7056094b7fe',_binary ''),('master','c117a9f4-5714-48ee-a5d1-eedad00c1b7e',_binary '\0'),('master','ef9cfc6f-aa14-40b3-9afc-ec113ca9dcf1',_binary ''),('siglo21','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('siglo21','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('siglo21','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('siglo21','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('siglo21','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('siglo21','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('siglo21','b229e7fc-3666-4f8f-b02d-0f24dc04e851',_binary ''),('siglo21','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('siglo21','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_envios`
--

DROP TABLE IF EXISTS `detalles_envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_envios` (
  `id_detalle_envio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `numero_factura` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_envio`),
  KEY `FK316qxh1txvitlpwtp19s13yr3` (`numero_factura`),
  CONSTRAINT `FK316qxh1txvitlpwtp19s13yr3` FOREIGN KEY (`numero_factura`) REFERENCES `envios` (`numero_factura`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_envios`
--

LOCK TABLES `detalles_envios` WRITE;
/*!40000 ALTER TABLE `detalles_envios` DISABLE KEYS */;
INSERT INTO `detalles_envios` VALUES (1,'Herramienta','A-3232-2342334');
/*!40000 ALTER TABLE `detalles_envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `numero_factura` varchar(255) NOT NULL,
  `direccion_envio` varchar(255) DEFAULT NULL,
  `entre_calles` varchar(255) DEFAULT NULL,
  `ultimos_digitos_tarjeta` varchar(255) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `id_zona` int DEFAULT NULL,
  PRIMARY KEY (`numero_factura`),
  KEY `FKe1ag585ivpih4nqoqddp95fsj` (`id_cliente`),
  KEY `FK23hl635dxtn2m4pl9fcveh34f` (`id_estado`),
  KEY `FK9cqc2i803wtcip4voinjpg00w` (`id_zona`),
  CONSTRAINT `FK23hl635dxtn2m4pl9fcveh34f` FOREIGN KEY (`id_estado`) REFERENCES `estados_envio` (`id`),
  CONSTRAINT `FK9cqc2i803wtcip4voinjpg00w` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`),
  CONSTRAINT `FKe1ag585ivpih4nqoqddp95fsj` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES ('A-3232-2342334','algo 3233','una y otra','1234',1,1,4);
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_envio`
--

DROP TABLE IF EXISTS `estados_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_envio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_envio`
--

LOCK TABLES `estados_envio` WRITE;
/*!40000 ALTER TABLE `estados_envio` DISABLE KEYS */;
INSERT INTO `estados_envio` VALUES (1,'Pendiente'),(2,'EnCamino'),(3,'NoEntregado'),(4,'Entregado');
/*!40000 ALTER TABLE `estados_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_hoja`
--

DROP TABLE IF EXISTS `estados_hoja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_hoja` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_hoja`
--

LOCK TABLES `estados_hoja` WRITE;
/*!40000 ALTER TABLE `estados_hoja` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados_hoja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojas_del_dia`
--

DROP TABLE IF EXISTS `hojas_del_dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojas_del_dia` (
  `id_hoja_del_dia` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `patente_camion` varchar(255) DEFAULT NULL,
  `estado_hoja_del_dia_id` int DEFAULT NULL,
  `repartidor_id_repartidor` int DEFAULT NULL,
  PRIMARY KEY (`id_hoja_del_dia`),
  UNIQUE KEY `UK_nhiow9dtnjda15vybgdqn7gpx` (`estado_hoja_del_dia_id`),
  KEY `FKe6eco77tsnvrw7yx0gf0oau4g` (`patente_camion`),
  KEY `FKjeqvbe4vny1oi9b9h32i8j3l6` (`repartidor_id_repartidor`),
  CONSTRAINT `FKe6eco77tsnvrw7yx0gf0oau4g` FOREIGN KEY (`patente_camion`) REFERENCES `camiones` (`patente`),
  CONSTRAINT `FKidvjfl3e6fynbwk8hfmukruu5` FOREIGN KEY (`estado_hoja_del_dia_id`) REFERENCES `estados_hoja` (`id`),
  CONSTRAINT `FKjeqvbe4vny1oi9b9h32i8j3l6` FOREIGN KEY (`repartidor_id_repartidor`) REFERENCES `repartidores` (`id_repartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_del_dia`
--

LOCK TABLES `hojas_del_dia` WRITE;
/*!40000 ALTER TABLE `hojas_del_dia` DISABLE KEYS */;
/*!40000 ALTER TABLE `hojas_del_dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojas_del_dia_envios`
--

DROP TABLE IF EXISTS `hojas_del_dia_envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojas_del_dia_envios` (
  `hoja_del_dia_entity_id_hoja_del_dia` int NOT NULL,
  `envios_numero_factura` varchar(255) NOT NULL,
  UNIQUE KEY `UK_o2c4qydkd90dvr4yo7dfsfl9p` (`envios_numero_factura`),
  KEY `FK88t4rvi7xg589j6bim8qxd8ph` (`hoja_del_dia_entity_id_hoja_del_dia`),
  CONSTRAINT `FK88t4rvi7xg589j6bim8qxd8ph` FOREIGN KEY (`hoja_del_dia_entity_id_hoja_del_dia`) REFERENCES `hojas_del_dia` (`id_hoja_del_dia`),
  CONSTRAINT `FKhsgbd96lp45yutcwhvpx91p0y` FOREIGN KEY (`envios_numero_factura`) REFERENCES `envios` (`numero_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_del_dia_envios`
--

LOCK TABLES `hojas_del_dia_envios` WRITE;
/*!40000 ALTER TABLE `hojas_del_dia_envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `hojas_del_dia_envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('00d2408b-16ca-4b23-a089-c7e53d687912','2fe31644-375d-45d2-afa2-0ace2492070f',_binary '','${role_view-profile}','view-profile','master','2fe31644-375d-45d2-afa2-0ace2492070f',NULL),('029be5cf-c565-4b6d-b87a-cfde88ad29b0','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-consent}','view-consent','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('033a71fd-c5c0-40a0-b47f-4278407844eb','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_view-realm}','view-realm','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('05e39679-fa10-447c-b7d6-b00447a2a34a','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_view-realm}','view-realm','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('09c39e33-cc18-4493-b30a-958b5ccb54aa','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','administrador-cliente-rol','administrador-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('0c549f30-f75e-4223-b136-97971aee2c86','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_manage-events}','manage-events','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('0eb4d425-5b71-4dce-bc3f-5e32b961002c','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_manage-clients}','manage-clients','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('0f47d697-5f60-4af9-a8c8-e068db72ef6b','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_manage-realm}','manage-realm','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('12cc4ee0-9194-49d7-bc7b-1309e107e4ce','0ca2e86b-131e-454d-95a7-c124ad72b7cb',_binary '','${role_read-token}','read-token','siglo21','0ca2e86b-131e-454d-95a7-c124ad72b7cb',NULL),('18c8e8d2-14db-4cb8-ac5a-7fc47017153d','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_view-identity-providers}','view-identity-providers','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('1fe3d096-70ee-4795-b935-91b2cd3c4f2e','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_impersonation}','impersonation','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('2026770f-d9f4-45c6-ad72-901d39ebf1a4','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-account-links}','manage-account-links','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('26084389-cab9-45fa-93ea-66f47fcdbbd1','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','vendedor-cliente-rol','vendedor-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('265d748d-bb60-433e-a0b3-a42bd5506697','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('285bf1b2-c1b4-4581-a161-bd23ac640baa','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-identity-providers}','manage-identity-providers','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('29c39638-3ea9-4db1-bf4b-2fde704428a0','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('2aff17ec-b10f-4f95-9a01-6e418e810c01','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_query-realms}','query-realms','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('2e538b71-4837-44a6-9b01-c4c3fe356d3b','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_view-events}','view-events','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('345907e8-7f50-43f5-9c81-624da4d4942b','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-realm}','manage-realm','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('3cb19a85-496e-4d7c-9d8c-ef4f34ef4c66','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_query-users}','query-users','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('41c84990-b008-44d5-9e26-0d583894a9d9','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('47f97e2f-7a6c-4a20-8c1b-63c066ddc3cf','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_manage-clients}','manage-clients','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('48533797-37fb-479c-b4aa-4f054faed6ac','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-users}','manage-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('53331e5b-6480-4eb7-9a5d-49204bb57381','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_query-clients}','query-clients','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('53632dd8-c774-48a4-aa77-31f2c2e8e9af','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_query-realms}','query-realms','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('544bca16-9562-49bc-a4af-bc4f949519eb','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('54d5c122-1802-4139-b68d-e2cec2facbb8','siglo21',_binary '\0','adminitrador de rol realm','administrador','siglo21',NULL,NULL),('55c43002-4c16-49ef-87a5-30deaa22314b','siglo21',_binary '\0','${role_default-roles}','default-roles-siglo21','siglo21',NULL,NULL),('570c1c35-36cb-4e9f-b96c-e8b6132f077e','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_view-authorization}','view-authorization','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('5cd6ea48-18ed-4d05-8071-9854fffdd12a','2fe31644-375d-45d2-afa2-0ace2492070f',_binary '','${role_view-consent}','view-consent','master','2fe31644-375d-45d2-afa2-0ace2492070f',NULL),('5d43716f-3ca5-48da-9d7d-739f529096dd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-clients}','manage-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('61de6b38-c7ee-4258-b9f4-6deb8c558e17','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-applications}','view-applications','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('641bf31f-4ec5-4f6e-a5a8-a296615ccf22','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('6b5f9116-57c6-4b05-ba08-6e06468cfa5f','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_create-client}','create-client','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('70d0fe77-e963-453b-935e-6984d04c3ea2','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-consent}','manage-consent','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('7460cf09-2886-4829-bcd0-5ccaa42dbd57','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-authorization}','manage-authorization','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('75b816a1-3b66-4c03-b75a-8b772946c711','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-events}','manage-events','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('792abce2-e2c3-4068-bed9-5b3d41c92bc7','2fe31644-375d-45d2-afa2-0ace2492070f',_binary '','${role_manage-consent}','manage-consent','master','2fe31644-375d-45d2-afa2-0ace2492070f',NULL),('79c75a1e-79b7-444a-b262-74482096193c','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_manage-realm}','manage-realm','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('7a33b7d5-afac-418a-ba38-3a4d696d4cbe','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','repartidor-cliente-rol','repartidor-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('7bd9c1d3-3725-48f9-88cc-9404410a78ed','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_view-users}','view-users','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('7d2dda07-06ff-4d4f-89d3-820498596b27','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-groups}','query-groups','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('8748520e-df8c-448c-b03a-f7e53b6bf973','siglo21',_binary '\0','${role_offline-access}','offline_access','siglo21',NULL,NULL),('89bc6bb3-5ce0-406f-b079-9fa52734ee5b','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_query-clients}','query-clients','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('8ef8afd1-6f01-48d3-9cc3-92983ff5fe8e','2fe31644-375d-45d2-afa2-0ace2492070f',_binary '','${role_manage-account-links}','manage-account-links','master','2fe31644-375d-45d2-afa2-0ace2492070f',NULL),('8f22b474-5230-47a1-82d1-922f73a786e9','siglo21',_binary '\0','${role_uma_authorization}','uma_authorization','siglo21',NULL,NULL),('9234a224-d7b0-4b5e-9016-cb3b4f3af753','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_manage-users}','manage-users','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('92e0c80c-ed04-427a-89da-e936808b8d09','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-account}','manage-account','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('96e59b28-471d-415b-8ee0-38a05bb39cae','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','siglo21',_binary '\0','','vendedor','siglo21',NULL,NULL),('a051b37a-98b8-4103-9721-8d3e94af584b','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_manage-events}','manage-events','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('a2a6d51e-21d2-43af-8939-bc8358d562b8','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_impersonation}','impersonation','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a5fcc62c-8219-4ee6-ad36-78ce2e715b66','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_query-groups}','query-groups','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_realm-admin}','realm-admin','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a633afdc-9331-4419-953e-69c90773f17e','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-users}','query-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a9ae251a-717f-4c9d-b913-fc10b893b0e2','2fe31644-375d-45d2-afa2-0ace2492070f',_binary '','${role_view-applications}','view-applications','master','2fe31644-375d-45d2-afa2-0ace2492070f',NULL),('ae437453-62e9-4429-8923-93e40a195ab0','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_create-client}','create-client','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('b2ec4ad3-eced-43b7-9a26-6a9898890546','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_impersonation}','impersonation','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('b320fec7-c744-4b6d-995c-a9e8a331971f','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('b4818dfb-4434-41fa-9600-434ca3f5442f','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-users}','view-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b54bfb8c-12c5-4d91-8d17-8913208e6765','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_create-client}','create-client','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b5d2075c-edf2-4415-b121-87b1bd4286f7','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-events}','view-events','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b60d9191-2e65-401d-be5a-8eb961049181','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_manage-authorization}','manage-authorization','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('b65844b4-d85c-4a7e-8a2b-9076ec9b43e0','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_view-users}','view-users','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('b9839a7b-b519-4c27-bf9f-396e5bb51bb2','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-authorization}','view-authorization','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('bd2b7c5b-7569-42d7-83e8-d17442ba75d7','bbf4dad0-10e5-460e-98dc-e65303d74715',_binary '','${role_read-token}','read-token','master','bbf4dad0-10e5-460e-98dc-e65303d74715',NULL),('be2bac59-1270-4548-a537-535159bdbf29','2fe31644-375d-45d2-afa2-0ace2492070f',_binary '','${role_manage-account}','manage-account','master','2fe31644-375d-45d2-afa2-0ace2492070f',NULL),('c65b3e43-9e2a-4b2f-abb8-e32e68b52581','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_view-clients}','view-clients','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('ca0b5753-e677-420d-bb53-0fc590c08c1e','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-realm}','view-realm','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('cfd5954f-ffe3-430a-b79b-376cf7de107b','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_view-authorization}','view-authorization','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('d118260b-b1fe-41b8-83e3-48f76748d0fc','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-clients}','view-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d1751874-d8e4-4f64-bfd8-2224741d196d','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_view-clients}','view-clients','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL),('d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-clients}','query-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d7263fd7-1aa8-471a-a562-2576e6a886dd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-realms}','query-realms','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d8d693d5-a021-427f-8151-fad696e79b50','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_delete-account}','delete-account','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('dea41763-6811-47a0-a1e9-0652e7487c4f','siglo21',_binary '\0',NULL,'repartidor','siglo21',NULL,NULL),('dfedfc57-e69e-4ce1-95a5-16024f119289','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_view-identity-providers}','view-identity-providers','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('e10b5fdf-88a5-430a-bb9c-6bea221d9e1c','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_manage-authorization}','manage-authorization','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('e41a479d-7436-4391-b96a-87f231dea38c','2fe31644-375d-45d2-afa2-0ace2492070f',_binary '','${role_delete-account}','delete-account','master','2fe31644-375d-45d2-afa2-0ace2492070f',NULL),('e5d4b518-07db-402d-adf2-0bf4f004a67b','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_query-users}','query-users','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('f054da5a-1733-4542-b8da-4ba49f1b89ce','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-identity-providers}','view-identity-providers','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('f187d983-3140-4310-9812-87f832a02158','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_query-groups}','query-groups','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('f1a73bfd-e4f4-4346-bf47-0e92b3941990','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-profile}','view-profile','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('fac28a38-d4ff-42f7-891a-42f933f48695','75e700fd-c7e1-4a29-b8e2-faad68aa112d',_binary '','${role_manage-users}','manage-users','master','75e700fd-c7e1-4a29-b8e2-faad68aa112d',NULL),('fc52cb85-9cba-41ff-b897-89f715f19806','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',_binary '','${role_view-events}','view-events','master','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('cip4y','16.1.1',1701772276);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','openid-connect','oidc-usermodel-property-mapper',NULL,'313cd6d5-afa3-4d09-bec6-8e059c9718c3'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'80a98201-a009-4f95-a8d9-67b46623f54d'),('13d1e141-77af-496a-862f-7f68ceee4460','username','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('17b080be-49b5-4046-918b-431bdf551b67','audience resolve','openid-connect','oidc-audience-resolve-mapper','30cf30bd-693f-4790-bcd9-7d0b90bb8d5a',NULL),('1887e365-10dc-4087-9fa7-42f470bf30d8','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9dd53193-d502-4d19-80d9-87acf9580320'),('1899b95c-44da-4add-abea-6885c7648271','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'28963099-19d3-4521-a02f-976d9671e893'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('24efbc5a-3071-43f3-aeb3-27fe2599fca7','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('29438da0-315c-45aa-9061-7746502f6008','address','openid-connect','oidc-address-mapper',NULL,'da127315-5241-4a8f-a46a-6bea0de8925e'),('2ee9356c-3f53-4444-be9e-281f31273c3b','email','openid-connect','oidc-usermodel-property-mapper',NULL,'2f0f3a95-4ac0-472b-bab5-057dcb976683'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'313cd6d5-afa3-4d09-bec6-8e059c9718c3'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('432acee5-836c-44e0-8f8a-6ab765801d1f','role list','saml','saml-role-list-mapper',NULL,'b229e7fc-3666-4f8f-b02d-0f24dc04e851'),('46ab9845-d5c9-4ed3-a42a-0f32b4fb773b','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('47f32a0b-f926-42ac-9aff-a9683c2e09b9','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'154a486c-3b78-400c-b872-3895677f7eca'),('4cd09cda-17eb-4c38-b0c8-14c73e4679ce','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('734ebc5d-95d1-496e-9952-17066ad99f50','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('753a5cc0-6e93-4b6e-8b9f-ebf45140aa29','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'2f0f3a95-4ac0-472b-bab5-057dcb976683'),('781acee4-4149-463b-8720-a42ceedba3c2','audience resolve','openid-connect','oidc-audience-resolve-mapper','d06663e0-ede9-48b2-a391-551f87ecb510',NULL),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','openid-connect','oidc-usermodel-attribute-mapper','42ce5f39-f315-496d-881f-7de13ac3ae08',NULL),('874cfa64-4ead-4591-b389-5681dc18986c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('87b9cc59-5cb8-45e3-9e2f-e0d3dabbb83a','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('8dd0b5a4-31cf-44af-90c6-346c44501f73','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('918ef45f-cbd6-4bcd-87d0-a4ca9b9440b6','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'7b628f28-9a74-40f1-ad32-16626715f649'),('944ac98f-42ce-4568-8e4e-de1595524b3d','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('a64a88eb-5c7c-41b2-ac38-6fae242c88e8','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'7b628f28-9a74-40f1-ad32-16626715f649'),('a6b911bd-243e-4583-8d18-b092b0c9c008','locale','openid-connect','oidc-usermodel-attribute-mapper','01154859-b752-419b-9c69-ae3107b012d5',NULL),('a75af0f7-508d-486c-ae44-9fd70e18c51b','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('ab9f34a4-929e-4085-b9e4-6527a5474bf7','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'7b2f4aa2-3e7b-4eaa-b502-f036ee2501be'),('acff0741-b0e0-4046-afdc-df295a13dbf6','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('b2874519-0f1d-45dc-944c-75148fb79157','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9dd53193-d502-4d19-80d9-87acf9580320'),('b4961fed-8aeb-4652-af34-73bb61793ea2','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','full name','openid-connect','oidc-full-name-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('bc99959b-7558-4797-b663-39676e5935b1','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'80a98201-a009-4f95-a8d9-67b46623f54d'),('bdeaebe1-ea1d-414e-9870-877e24938269','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'7b628f28-9a74-40f1-ad32-16626715f649'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'28963099-19d3-4521-a02f-976d9671e893'),('c6d78cf6-33d5-44a3-bc50-14ca6aa39605','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('d8951284-ffd8-4f4f-9f1b-94ac177b203d','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'b39fe518-d02f-4eac-942b-eeddf878c80f'),('d89c5eb6-ff5c-43ca-834d-279c4b4a6519','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('d99f887c-5c82-4392-802c-319d22a15d45','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'154a486c-3b78-400c-b872-3895677f7eca'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('e86496ac-49a3-473b-a7f3-170f8cb8725d','role list','saml','saml-role-list-mapper',NULL,'ef9cfc6f-aa14-40b3-9afc-ec113ca9dcf1'),('f2bac758-0b51-4d88-b079-f2410cd36db3','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('f459e5dd-8bbd-4bd1-8b73-8061a6f86121','address','openid-connect','oidc-address-mapper',NULL,'92af6569-08f2-4df9-9f63-dadb8f9fa88f'),('f9432e89-adff-453b-a9b5-e16360820f46','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('fb0cf614-03fd-4105-bfd7-4f9e330658b6','username','openid-connect','oidc-usermodel-property-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe'),('fd91a673-61e7-4fb9-9769-f1db441181c6','full name','openid-connect','oidc-full-name-mapper',NULL,'b423d019-4240-484b-8b76-b7056094b7fe');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','access.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','claim.name'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','id.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','String','jsonType.label'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','user.attribute'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','userinfo.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','access.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middle_name','claim.name'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','id.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','String','jsonType.label'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middleName','user.attribute'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','userinfo.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','access.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','upn','claim.name'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','id.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','String','jsonType.label'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','username','user.attribute'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','userinfo.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','true','access.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','preferred_username','claim.name'),('13d1e141-77af-496a-862f-7f68ceee4460','true','id.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','String','jsonType.label'),('13d1e141-77af-496a-862f-7f68ceee4460','username','user.attribute'),('13d1e141-77af-496a-862f-7f68ceee4460','true','userinfo.token.claim'),('1887e365-10dc-4087-9fa7-42f470bf30d8','true','access.token.claim'),('1887e365-10dc-4087-9fa7-42f470bf30d8','phone_number','claim.name'),('1887e365-10dc-4087-9fa7-42f470bf30d8','true','id.token.claim'),('1887e365-10dc-4087-9fa7-42f470bf30d8','String','jsonType.label'),('1887e365-10dc-4087-9fa7-42f470bf30d8','phoneNumber','user.attribute'),('1887e365-10dc-4087-9fa7-42f470bf30d8','true','userinfo.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','true','access.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','phone_number_verified','claim.name'),('1899b95c-44da-4add-abea-6885c7648271','true','id.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','boolean','jsonType.label'),('1899b95c-44da-4add-abea-6885c7648271','phoneNumberVerified','user.attribute'),('1899b95c-44da-4add-abea-6885c7648271','true','userinfo.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','access.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','claim.name'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','id.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','String','jsonType.label'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','user.attribute'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','userinfo.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','access.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','given_name','claim.name'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','id.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','String','jsonType.label'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','firstName','user.attribute'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','userinfo.token.claim'),('24efbc5a-3071-43f3-aeb3-27fe2599fca7','true','access.token.claim'),('24efbc5a-3071-43f3-aeb3-27fe2599fca7','picture','claim.name'),('24efbc5a-3071-43f3-aeb3-27fe2599fca7','true','id.token.claim'),('24efbc5a-3071-43f3-aeb3-27fe2599fca7','String','jsonType.label'),('24efbc5a-3071-43f3-aeb3-27fe2599fca7','picture','user.attribute'),('24efbc5a-3071-43f3-aeb3-27fe2599fca7','true','userinfo.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','true','access.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','true','id.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','country','user.attribute.country'),('29438da0-315c-45aa-9061-7746502f6008','formatted','user.attribute.formatted'),('29438da0-315c-45aa-9061-7746502f6008','locality','user.attribute.locality'),('29438da0-315c-45aa-9061-7746502f6008','postal_code','user.attribute.postal_code'),('29438da0-315c-45aa-9061-7746502f6008','region','user.attribute.region'),('29438da0-315c-45aa-9061-7746502f6008','street','user.attribute.street'),('29438da0-315c-45aa-9061-7746502f6008','true','userinfo.token.claim'),('2ee9356c-3f53-4444-be9e-281f31273c3b','true','access.token.claim'),('2ee9356c-3f53-4444-be9e-281f31273c3b','email','claim.name'),('2ee9356c-3f53-4444-be9e-281f31273c3b','true','id.token.claim'),('2ee9356c-3f53-4444-be9e-281f31273c3b','String','jsonType.label'),('2ee9356c-3f53-4444-be9e-281f31273c3b','email','user.attribute'),('2ee9356c-3f53-4444-be9e-281f31273c3b','true','userinfo.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','access.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','email_verified','claim.name'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','id.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','boolean','jsonType.label'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','emailVerified','user.attribute'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','userinfo.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','access.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','claim.name'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','id.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','String','jsonType.label'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','user.attribute'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','userinfo.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','access.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','claim.name'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','id.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','String','jsonType.label'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','user.attribute'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','userinfo.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','access.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','claim.name'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','id.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','String','jsonType.label'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','user.attribute'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','userinfo.token.claim'),('432acee5-836c-44e0-8f8a-6ab765801d1f','Role','attribute.name'),('432acee5-836c-44e0-8f8a-6ab765801d1f','Basic','attribute.nameformat'),('432acee5-836c-44e0-8f8a-6ab765801d1f','false','single'),('46ab9845-d5c9-4ed3-a42a-0f32b4fb773b','true','access.token.claim'),('46ab9845-d5c9-4ed3-a42a-0f32b4fb773b','nickname','claim.name'),('46ab9845-d5c9-4ed3-a42a-0f32b4fb773b','true','id.token.claim'),('46ab9845-d5c9-4ed3-a42a-0f32b4fb773b','String','jsonType.label'),('46ab9845-d5c9-4ed3-a42a-0f32b4fb773b','nickname','user.attribute'),('46ab9845-d5c9-4ed3-a42a-0f32b4fb773b','true','userinfo.token.claim'),('47f32a0b-f926-42ac-9aff-a9683c2e09b9','true','access.token.claim'),('47f32a0b-f926-42ac-9aff-a9683c2e09b9','groups','claim.name'),('47f32a0b-f926-42ac-9aff-a9683c2e09b9','true','id.token.claim'),('47f32a0b-f926-42ac-9aff-a9683c2e09b9','String','jsonType.label'),('47f32a0b-f926-42ac-9aff-a9683c2e09b9','true','multivalued'),('47f32a0b-f926-42ac-9aff-a9683c2e09b9','foo','user.attribute'),('4cd09cda-17eb-4c38-b0c8-14c73e4679ce','true','access.token.claim'),('4cd09cda-17eb-4c38-b0c8-14c73e4679ce','website','claim.name'),('4cd09cda-17eb-4c38-b0c8-14c73e4679ce','true','id.token.claim'),('4cd09cda-17eb-4c38-b0c8-14c73e4679ce','String','jsonType.label'),('4cd09cda-17eb-4c38-b0c8-14c73e4679ce','website','user.attribute'),('4cd09cda-17eb-4c38-b0c8-14c73e4679ce','true','userinfo.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','access.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','claim.name'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','id.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','String','jsonType.label'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','user.attribute'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','userinfo.token.claim'),('734ebc5d-95d1-496e-9952-17066ad99f50','true','access.token.claim'),('734ebc5d-95d1-496e-9952-17066ad99f50','realm_access.roles','claim.name'),('734ebc5d-95d1-496e-9952-17066ad99f50','String','jsonType.label'),('734ebc5d-95d1-496e-9952-17066ad99f50','true','multivalued'),('734ebc5d-95d1-496e-9952-17066ad99f50','foo','user.attribute'),('753a5cc0-6e93-4b6e-8b9f-ebf45140aa29','true','access.token.claim'),('753a5cc0-6e93-4b6e-8b9f-ebf45140aa29','email_verified','claim.name'),('753a5cc0-6e93-4b6e-8b9f-ebf45140aa29','true','id.token.claim'),('753a5cc0-6e93-4b6e-8b9f-ebf45140aa29','boolean','jsonType.label'),('753a5cc0-6e93-4b6e-8b9f-ebf45140aa29','emailVerified','user.attribute'),('753a5cc0-6e93-4b6e-8b9f-ebf45140aa29','true','userinfo.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','access.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','claim.name'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','id.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','String','jsonType.label'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','user.attribute'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','userinfo.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','true','access.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','claim.name'),('874cfa64-4ead-4591-b389-5681dc18986c','true','id.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','String','jsonType.label'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','user.attribute'),('874cfa64-4ead-4591-b389-5681dc18986c','true','userinfo.token.claim'),('87b9cc59-5cb8-45e3-9e2f-e0d3dabbb83a','true','access.token.claim'),('87b9cc59-5cb8-45e3-9e2f-e0d3dabbb83a','middle_name','claim.name'),('87b9cc59-5cb8-45e3-9e2f-e0d3dabbb83a','true','id.token.claim'),('87b9cc59-5cb8-45e3-9e2f-e0d3dabbb83a','String','jsonType.label'),('87b9cc59-5cb8-45e3-9e2f-e0d3dabbb83a','middleName','user.attribute'),('87b9cc59-5cb8-45e3-9e2f-e0d3dabbb83a','true','userinfo.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','access.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','claim.name'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','id.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','String','jsonType.label'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','user.attribute'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','userinfo.token.claim'),('8dd0b5a4-31cf-44af-90c6-346c44501f73','true','access.token.claim'),('8dd0b5a4-31cf-44af-90c6-346c44501f73','gender','claim.name'),('8dd0b5a4-31cf-44af-90c6-346c44501f73','true','id.token.claim'),('8dd0b5a4-31cf-44af-90c6-346c44501f73','String','jsonType.label'),('8dd0b5a4-31cf-44af-90c6-346c44501f73','gender','user.attribute'),('8dd0b5a4-31cf-44af-90c6-346c44501f73','true','userinfo.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','access.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updated_at','claim.name'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','id.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','String','jsonType.label'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updatedAt','user.attribute'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','userinfo.token.claim'),('918ef45f-cbd6-4bcd-87d0-a4ca9b9440b6','true','access.token.claim'),('918ef45f-cbd6-4bcd-87d0-a4ca9b9440b6','resource_access.${client_id}.roles','claim.name'),('918ef45f-cbd6-4bcd-87d0-a4ca9b9440b6','String','jsonType.label'),('918ef45f-cbd6-4bcd-87d0-a4ca9b9440b6','true','multivalued'),('918ef45f-cbd6-4bcd-87d0-a4ca9b9440b6','foo','user.attribute'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','access.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','family_name','claim.name'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','id.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','String','jsonType.label'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','lastName','user.attribute'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','userinfo.token.claim'),('a64a88eb-5c7c-41b2-ac38-6fae242c88e8','true','access.token.claim'),('a64a88eb-5c7c-41b2-ac38-6fae242c88e8','realm_access.roles','claim.name'),('a64a88eb-5c7c-41b2-ac38-6fae242c88e8','String','jsonType.label'),('a64a88eb-5c7c-41b2-ac38-6fae242c88e8','true','multivalued'),('a64a88eb-5c7c-41b2-ac38-6fae242c88e8','foo','user.attribute'),('a6b911bd-243e-4583-8d18-b092b0c9c008','true','access.token.claim'),('a6b911bd-243e-4583-8d18-b092b0c9c008','locale','claim.name'),('a6b911bd-243e-4583-8d18-b092b0c9c008','true','id.token.claim'),('a6b911bd-243e-4583-8d18-b092b0c9c008','String','jsonType.label'),('a6b911bd-243e-4583-8d18-b092b0c9c008','locale','user.attribute'),('a6b911bd-243e-4583-8d18-b092b0c9c008','true','userinfo.token.claim'),('a75af0f7-508d-486c-ae44-9fd70e18c51b','true','access.token.claim'),('a75af0f7-508d-486c-ae44-9fd70e18c51b','profile','claim.name'),('a75af0f7-508d-486c-ae44-9fd70e18c51b','true','id.token.claim'),('a75af0f7-508d-486c-ae44-9fd70e18c51b','String','jsonType.label'),('a75af0f7-508d-486c-ae44-9fd70e18c51b','profile','user.attribute'),('a75af0f7-508d-486c-ae44-9fd70e18c51b','true','userinfo.token.claim'),('acff0741-b0e0-4046-afdc-df295a13dbf6','true','access.token.claim'),('acff0741-b0e0-4046-afdc-df295a13dbf6','family_name','claim.name'),('acff0741-b0e0-4046-afdc-df295a13dbf6','true','id.token.claim'),('acff0741-b0e0-4046-afdc-df295a13dbf6','String','jsonType.label'),('acff0741-b0e0-4046-afdc-df295a13dbf6','lastName','user.attribute'),('acff0741-b0e0-4046-afdc-df295a13dbf6','true','userinfo.token.claim'),('b2874519-0f1d-45dc-944c-75148fb79157','true','access.token.claim'),('b2874519-0f1d-45dc-944c-75148fb79157','phone_number_verified','claim.name'),('b2874519-0f1d-45dc-944c-75148fb79157','true','id.token.claim'),('b2874519-0f1d-45dc-944c-75148fb79157','boolean','jsonType.label'),('b2874519-0f1d-45dc-944c-75148fb79157','phoneNumberVerified','user.attribute'),('b2874519-0f1d-45dc-944c-75148fb79157','true','userinfo.token.claim'),('b4961fed-8aeb-4652-af34-73bb61793ea2','true','access.token.claim'),('b4961fed-8aeb-4652-af34-73bb61793ea2','given_name','claim.name'),('b4961fed-8aeb-4652-af34-73bb61793ea2','true','id.token.claim'),('b4961fed-8aeb-4652-af34-73bb61793ea2','String','jsonType.label'),('b4961fed-8aeb-4652-af34-73bb61793ea2','firstName','user.attribute'),('b4961fed-8aeb-4652-af34-73bb61793ea2','true','userinfo.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','access.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','id.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','userinfo.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','true','access.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','groups','claim.name'),('bc99959b-7558-4797-b663-39676e5935b1','true','id.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','String','jsonType.label'),('bc99959b-7558-4797-b663-39676e5935b1','true','multivalued'),('bc99959b-7558-4797-b663-39676e5935b1','foo','user.attribute'),('bc99959b-7558-4797-b663-39676e5935b1','true','userinfo.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','access.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','claim.name'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','id.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','String','jsonType.label'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','user.attribute'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','userinfo.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','access.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phone_number','claim.name'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','id.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','String','jsonType.label'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phoneNumber','user.attribute'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','userinfo.token.claim'),('c6d78cf6-33d5-44a3-bc50-14ca6aa39605','true','access.token.claim'),('c6d78cf6-33d5-44a3-bc50-14ca6aa39605','locale','claim.name'),('c6d78cf6-33d5-44a3-bc50-14ca6aa39605','true','id.token.claim'),('c6d78cf6-33d5-44a3-bc50-14ca6aa39605','String','jsonType.label'),('c6d78cf6-33d5-44a3-bc50-14ca6aa39605','locale','user.attribute'),('c6d78cf6-33d5-44a3-bc50-14ca6aa39605','true','userinfo.token.claim'),('d89c5eb6-ff5c-43ca-834d-279c4b4a6519','true','access.token.claim'),('d89c5eb6-ff5c-43ca-834d-279c4b4a6519','updated_at','claim.name'),('d89c5eb6-ff5c-43ca-834d-279c4b4a6519','true','id.token.claim'),('d89c5eb6-ff5c-43ca-834d-279c4b4a6519','String','jsonType.label'),('d89c5eb6-ff5c-43ca-834d-279c4b4a6519','updatedAt','user.attribute'),('d89c5eb6-ff5c-43ca-834d-279c4b4a6519','true','userinfo.token.claim'),('d99f887c-5c82-4392-802c-319d22a15d45','true','access.token.claim'),('d99f887c-5c82-4392-802c-319d22a15d45','upn','claim.name'),('d99f887c-5c82-4392-802c-319d22a15d45','true','id.token.claim'),('d99f887c-5c82-4392-802c-319d22a15d45','String','jsonType.label'),('d99f887c-5c82-4392-802c-319d22a15d45','username','user.attribute'),('d99f887c-5c82-4392-802c-319d22a15d45','true','userinfo.token.claim'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','true','access.token.claim'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','resource_access.${client_id}.roles','claim.name'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','String','jsonType.label'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','true','multivalued'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','foo','user.attribute'),('e86496ac-49a3-473b-a7f3-170f8cb8725d','Role','attribute.name'),('e86496ac-49a3-473b-a7f3-170f8cb8725d','Basic','attribute.nameformat'),('e86496ac-49a3-473b-a7f3-170f8cb8725d','false','single'),('f2bac758-0b51-4d88-b079-f2410cd36db3','true','access.token.claim'),('f2bac758-0b51-4d88-b079-f2410cd36db3','birthdate','claim.name'),('f2bac758-0b51-4d88-b079-f2410cd36db3','true','id.token.claim'),('f2bac758-0b51-4d88-b079-f2410cd36db3','String','jsonType.label'),('f2bac758-0b51-4d88-b079-f2410cd36db3','birthdate','user.attribute'),('f2bac758-0b51-4d88-b079-f2410cd36db3','true','userinfo.token.claim'),('f459e5dd-8bbd-4bd1-8b73-8061a6f86121','true','access.token.claim'),('f459e5dd-8bbd-4bd1-8b73-8061a6f86121','true','id.token.claim'),('f459e5dd-8bbd-4bd1-8b73-8061a6f86121','country','user.attribute.country'),('f459e5dd-8bbd-4bd1-8b73-8061a6f86121','formatted','user.attribute.formatted'),('f459e5dd-8bbd-4bd1-8b73-8061a6f86121','locality','user.attribute.locality'),('f459e5dd-8bbd-4bd1-8b73-8061a6f86121','postal_code','user.attribute.postal_code'),('f459e5dd-8bbd-4bd1-8b73-8061a6f86121','region','user.attribute.region'),('f459e5dd-8bbd-4bd1-8b73-8061a6f86121','street','user.attribute.street'),('f459e5dd-8bbd-4bd1-8b73-8061a6f86121','true','userinfo.token.claim'),('f9432e89-adff-453b-a9b5-e16360820f46','true','access.token.claim'),('f9432e89-adff-453b-a9b5-e16360820f46','zoneinfo','claim.name'),('f9432e89-adff-453b-a9b5-e16360820f46','true','id.token.claim'),('f9432e89-adff-453b-a9b5-e16360820f46','String','jsonType.label'),('f9432e89-adff-453b-a9b5-e16360820f46','zoneinfo','user.attribute'),('f9432e89-adff-453b-a9b5-e16360820f46','true','userinfo.token.claim'),('fb0cf614-03fd-4105-bfd7-4f9e330658b6','true','access.token.claim'),('fb0cf614-03fd-4105-bfd7-4f9e330658b6','preferred_username','claim.name'),('fb0cf614-03fd-4105-bfd7-4f9e330658b6','true','id.token.claim'),('fb0cf614-03fd-4105-bfd7-4f9e330658b6','String','jsonType.label'),('fb0cf614-03fd-4105-bfd7-4f9e330658b6','username','user.attribute'),('fb0cf614-03fd-4105-bfd7-4f9e330658b6','true','userinfo.token.claim'),('fd91a673-61e7-4fb9-9769-f1db441181c6','true','access.token.claim'),('fd91a673-61e7-4fb9-9769-f1db441181c6','true','id.token.claim'),('fd91a673-61e7-4fb9-9769-f1db441181c6','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','db58c21c-ba53-4ffd-ba6f-4eb50a68c6ce',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','20b19cfc-a4e9-428e-8563-24beb886afc7','baa8db57-c19d-453a-bac9-17962ee73240','958d276a-c304-4ba1-8750-1eb9e5696134','16130787-effb-49e6-8eff-6aa6ef2eb28b','c6cb4b6c-e47e-42ba-ab68-7edb0728dd17',2592000,_binary '\0',900,_binary '',_binary '\0','404283a2-ed02-4145-8a0f-1e1684463af1',0,_binary '\0',0,0,'96e59b28-471d-415b-8ee0-38a05bb39cae'),('siglo21',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'siglo21',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','75e700fd-c7e1-4a29-b8e2-faad68aa112d',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','35e40b62-dbd0-4617-8b94-8e432affbb89','988b74e5-9234-4fe4-929c-882def12417b','7be6b858-67fb-4545-81ff-b9ed39d6e9ba','716f31c6-5f8e-4d02-82e1-ade77e8bfb4f','e5802a0d-cdca-4e48-ab02-58b6f4510408',2592000,_binary '\0',900,_binary '',_binary '\0','ddec1a11-5f43-4102-95d6-d6e467a1560d',0,_binary '\0',0,0,'55c43002-4c16-49ef-87a5-30deaa22314b');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','siglo21','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.contentSecurityPolicyReportOnly','siglo21',''),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','siglo21','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xContentTypeOptions','siglo21','nosniff'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xFrameOptions','siglo21','SAMEORIGIN'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xRobotsTag','siglo21','none'),('_browser_header.xXSSProtection','master','1; mode=block'),('_browser_header.xXSSProtection','siglo21','1; mode=block'),('actionTokenGeneratedByAdminLifespan','siglo21','43200'),('actionTokenGeneratedByUserLifespan','siglo21','300'),('bruteForceProtected','master','false'),('bruteForceProtected','siglo21','false'),('cibaAuthRequestedUserHint','siglo21','login_hint'),('cibaBackchannelTokenDeliveryMode','siglo21','poll'),('cibaExpiresIn','siglo21','120'),('cibaInterval','siglo21','5'),('client-policies.policies','siglo21','{\"policies\":[]}'),('client-policies.profiles','siglo21','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','siglo21','0'),('clientOfflineSessionMaxLifespan','siglo21','0'),('clientSessionIdleTimeout','siglo21','0'),('clientSessionMaxLifespan','siglo21','0'),('defaultSignatureAlgorithm','master','RS256'),('defaultSignatureAlgorithm','siglo21','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','master','30'),('failureFactor','siglo21','30'),('maxDeltaTimeSeconds','master','43200'),('maxDeltaTimeSeconds','siglo21','43200'),('maxFailureWaitSeconds','master','900'),('maxFailureWaitSeconds','siglo21','900'),('minimumQuickLoginWaitSeconds','master','60'),('minimumQuickLoginWaitSeconds','siglo21','60'),('oauth2DeviceCodeLifespan','siglo21','600'),('oauth2DevicePollingInterval','siglo21','5'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespan','siglo21','5184000'),('offlineSessionMaxLifespanEnabled','master','false'),('offlineSessionMaxLifespanEnabled','siglo21','false'),('parRequestUriLifespan','siglo21','60'),('permanentLockout','master','false'),('permanentLockout','siglo21','false'),('quickLoginCheckMilliSeconds','master','1000'),('quickLoginCheckMilliSeconds','siglo21','1000'),('waitIncrementSeconds','master','60'),('waitIncrementSeconds','siglo21','60'),('webAuthnPolicyAttestationConveyancePreference','siglo21','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','siglo21','not specified'),('webAuthnPolicyAuthenticatorAttachment','siglo21','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','siglo21','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','siglo21','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','siglo21','false'),('webAuthnPolicyCreateTimeout','siglo21','0'),('webAuthnPolicyCreateTimeoutPasswordless','siglo21','0'),('webAuthnPolicyRequireResidentKey','siglo21','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','siglo21','not specified'),('webAuthnPolicyRpEntityName','siglo21','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','siglo21','keycloak'),('webAuthnPolicyRpId','siglo21',''),('webAuthnPolicyRpIdPasswordless','siglo21',''),('webAuthnPolicySignatureAlgorithms','siglo21','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','siglo21','ES256'),('webAuthnPolicyUserVerificationRequirement','siglo21','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','siglo21','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging'),('siglo21','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','master'),('password','password',_binary '',_binary '','siglo21');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('01154859-b752-419b-9c69-ae3107b012d5','/admin/master/console/*'),('2fe31644-375d-45d2-afa2-0ace2492070f','/realms/master/account/*'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','/realms/siglo21/account/*'),('42ce5f39-f315-496d-881f-7de13ac3ae08','/admin/siglo21/console/*'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','http://localhost:3000/*'),('54b4493f-4dc6-46ec-a697-a77e8977899c','/realms/siglo21/account/*'),('d06663e0-ede9-48b2-a391-551f87ecb510','/realms/master/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartidores`
--

DROP TABLE IF EXISTS `repartidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartidores` (
  `id_repartidor` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_repartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
/*!40000 ALTER TABLE `repartidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('132abac6-1933-4738-80bc-4ca8d75e2df9','delete_account','Delete Account','siglo21',_binary '\0',_binary '\0','delete_account',60),('155727c9-afd4-4f87-a567-a758be4a74c2','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('33cbeaf0-3fcb-4317-9e00-4cb25ba4834f','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('568e1632-3e25-4714-bc43-7df8fb2b4c6e','UPDATE_PROFILE','Update Profile','siglo21',_binary '',_binary '\0','UPDATE_PROFILE',40),('75d5065a-a3c5-436a-83e3-87ea2e7b3294','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('772d8155-9b06-4edd-9ea2-4b75d36e11fa','UPDATE_PASSWORD','Update Password','siglo21',_binary '',_binary '\0','UPDATE_PASSWORD',30),('94b31639-c673-4a98-bb30-d847a2c75af5','update_user_locale','Update User Locale','siglo21',_binary '',_binary '\0','update_user_locale',1000),('a43c85ec-a614-48e2-90b7-c0fc8feffd75','CONFIGURE_TOTP','Configure OTP','siglo21',_binary '',_binary '\0','CONFIGURE_TOTP',10),('b69683be-2eb7-401a-90a6-073542c13685','terms_and_conditions','Terms and Conditions','siglo21',_binary '\0',_binary '\0','terms_and_conditions',20),('b971244c-fc72-4707-8aa4-51108f61b9b2','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('de3de5c5-10b4-4a05-8ba8-4171c98e1659','VERIFY_EMAIL','Verify Email','siglo21',_binary '',_binary '\0','VERIFY_EMAIL',50),('dff60f5f-afdc-453e-995e-39b1a9b99d10','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('f9389987-0194-4667-95a3-6c72c6412652','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('fa12901b-18cd-42bf-bd7d-64669d084ff1','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','92e0c80c-ed04-427a-89da-e936808b8d09'),('d06663e0-ede9-48b2-a391-551f87ecb510','be2bac59-1270-4548-a537-535159bdbf29');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_documentos`
--

DROP TABLE IF EXISTS `tipos_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_documentos` (
  `id_tipo_documento` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_documentos`
--

LOCK TABLES `tipos_documentos` WRITE;
/*!40000 ALTER TABLE `tipos_documentos` DISABLE KEYS */;
INSERT INTO `tipos_documentos` VALUES (1,'DNI'),(2,'Cuil'),(3,'Cuit');
/*!40000 ALTER TABLE `tipos_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('4f129caf-547a-4509-b955-72c721a5eca2',NULL,'f162686d-e354-423f-b24e-82ca7dd1ad10',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','alejo.dev',1701772785684,NULL,0),('88a7f372-6554-4d89-ad2f-777ab7ffc114',NULL,'d7cad232-d66d-402a-b36d-4871e97cd9d7',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','vendedor.user',1701772853996,NULL,0),('9b0088f4-1d23-4316-9ea9-d11e5e3ba838',NULL,'8dd50098-35e5-4158-9109-5d52303ea05f',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','repartidor.user',1701772891802,NULL,0),('e126f99d-05d3-49cc-a2cf-849fd870d1f6',NULL,'71f09164-8d34-49fd-9110-3df3be5e7bdc',_binary '\0',_binary '',NULL,NULL,NULL,'master','administrador',1701772279905,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('54d5c122-1802-4139-b68d-e2cec2facbb8','4f129caf-547a-4509-b955-72c721a5eca2'),('55c43002-4c16-49ef-87a5-30deaa22314b','4f129caf-547a-4509-b955-72c721a5eca2'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','4f129caf-547a-4509-b955-72c721a5eca2'),('dea41763-6811-47a0-a1e9-0652e7487c4f','4f129caf-547a-4509-b955-72c721a5eca2'),('55c43002-4c16-49ef-87a5-30deaa22314b','88a7f372-6554-4d89-ad2f-777ab7ffc114'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','88a7f372-6554-4d89-ad2f-777ab7ffc114'),('55c43002-4c16-49ef-87a5-30deaa22314b','9b0088f4-1d23-4316-9ea9-d11e5e3ba838'),('dea41763-6811-47a0-a1e9-0652e7487c4f','9b0088f4-1d23-4316-9ea9-d11e5e3ba838'),('05e39679-fa10-447c-b7d6-b00447a2a34a','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('0c549f30-f75e-4223-b136-97971aee2c86','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('0eb4d425-5b71-4dce-bc3f-5e32b961002c','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('265d748d-bb60-433e-a0b3-a42bd5506697','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('2aff17ec-b10f-4f95-9a01-6e418e810c01','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('2e538b71-4837-44a6-9b01-c4c3fe356d3b','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('41c84990-b008-44d5-9e26-0d583894a9d9','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('6b5f9116-57c6-4b05-ba08-6e06468cfa5f','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('79c75a1e-79b7-444a-b262-74482096193c','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('89bc6bb3-5ce0-406f-b079-9fa52734ee5b','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('96e59b28-471d-415b-8ee0-38a05bb39cae','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('b65844b4-d85c-4a7e-8a2b-9076ec9b43e0','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('c65b3e43-9e2a-4b2f-abb8-e32e68b52581','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('cfd5954f-ffe3-430a-b79b-376cf7de107b','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('dfedfc57-e69e-4ce1-95a5-16024f119289','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('e10b5fdf-88a5-430a-bb9c-6bea221d9e1c','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('e5d4b518-07db-402d-adf2-0bf4f004a67b','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('f187d983-3140-4310-9812-87f832a02158','e126f99d-05d3-49cc-a2cf-849fd870d1f6'),('fac28a38-d4ff-42f7-891a-42f933f48695','e126f99d-05d3-49cc-a2cf-849fd870d1f6');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('01154859-b752-419b-9c69-ae3107b012d5','+'),('42ce5f39-f315-496d-881f-7de13ac3ae08','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonas`
--

DROP TABLE IF EXISTS `zonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonas` (
  `id_zona` int NOT NULL AUTO_INCREMENT,
  `dia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonas`
--

LOCK TABLES `zonas` WRITE;
/*!40000 ALTER TABLE `zonas` DISABLE KEYS */;
INSERT INTO `zonas` VALUES (1,'Lunes'),(2,'Martes'),(3,'Miercoles'),(4,'Jueves');
/*!40000 ALTER TABLE `zonas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 11:06:28
