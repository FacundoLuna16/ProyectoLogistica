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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('000e8a47-2b27-4f3b-b54f-fa0abd963fa7',NULL,NULL,'master','a9600095-07a1-415b-9e35-74c1eca98a2c',0,20,_binary '','9c9adcb8-ac19-43e9-9c9a-a0c866f25f6a',NULL),('0a2d6321-d806-421d-aadf-64298a40ac1d',NULL,NULL,'siglo21','7f091fd5-fce2-4138-b617-9b4ea6a0220a',2,30,_binary '','91cf95d4-4e8a-41b8-a46a-c94881ca5f23',NULL),('11c94129-194d-4b24-a8cf-1de0d5161dff',NULL,NULL,'master','ab694bf6-2561-4b0f-9a14-cb1bad6f67eb',2,30,_binary '','9640a66c-ce3b-49d6-83bb-0a6f96fb1b7a',NULL),('174f5c6f-cd01-49aa-b364-fa38c9236212',NULL,'reset-credentials-choose-user','siglo21','1458d8cd-1f12-4789-8bf3-89830152fa47',0,10,_binary '\0',NULL,NULL),('17697b4e-f3c9-40d2-bf22-b0142b211b9f',NULL,'conditional-user-configured','siglo21','e6c2704a-f2b2-4724-8502-f4534853ed1c',0,10,_binary '\0',NULL,NULL),('1779ee27-06df-42e3-a093-00321138089e',NULL,'conditional-user-configured','siglo21','27ad025a-2527-48f0-b4ca-8430f10bff35',0,10,_binary '\0',NULL,NULL),('1931e0ef-a6e3-4b1d-af2e-96116f34a617',NULL,'idp-review-profile','master','a9600095-07a1-415b-9e35-74c1eca98a2c',0,10,_binary '\0',NULL,'81e31bf3-7faf-4c14-b547-fa6d9aceb143'),('195f69d1-bdb5-47c3-b30e-2564657a3564',NULL,'conditional-user-configured','master','454af279-d16d-4702-9bf8-679585d19d1b',0,10,_binary '\0',NULL,NULL),('1e48988c-703f-4908-a91a-5f4419c62306',NULL,NULL,'master','5854c619-7360-47ee-8414-ffea7747d684',0,20,_binary '','20c3bf31-b590-40c3-b27e-5b5c2d0c0e50',NULL),('21db45eb-e56b-4645-9da5-e19ee2c83a8d',NULL,'idp-create-user-if-unique','siglo21','3665ad0f-62bc-4566-87ff-faf9ebe3c819',2,10,_binary '\0',NULL,'814ba637-4aac-45ff-ab68-def73fe8069b'),('23490e9b-4048-4a40-9942-99c6b5aa0f64',NULL,NULL,'siglo21','1458d8cd-1f12-4789-8bf3-89830152fa47',1,40,_binary '','3717086f-9c3e-4723-bdc0-573dcd4f3f5f',NULL),('2a78be7c-384c-47ea-8f88-78eed51bc4f0',NULL,'reset-credential-email','siglo21','1458d8cd-1f12-4789-8bf3-89830152fa47',0,20,_binary '\0',NULL,NULL),('2c8e934f-3c08-4032-9656-83470e67cb77',NULL,'reset-password','siglo21','1458d8cd-1f12-4789-8bf3-89830152fa47',0,30,_binary '\0',NULL,NULL),('2f787df7-4703-436c-98fa-ef0a52f239fa',NULL,NULL,'master','9640a66c-ce3b-49d6-83bb-0a6f96fb1b7a',1,20,_binary '','26e4e826-aee2-4247-90ff-f1c4e958683c',NULL),('304c996a-b96f-4fa1-b54c-7f1900727c84',NULL,'direct-grant-validate-otp','siglo21','6f7a01a1-4c14-4ebd-b61f-ab51ecff6ed8',0,20,_binary '\0',NULL,NULL),('30805380-ea25-41e4-b46a-80249821cfee',NULL,'client-x509','master','4e07eeb8-7c0e-4734-adcd-927ff89342da',2,40,_binary '\0',NULL,NULL),('33f017ac-8405-4f78-aa8e-4759834bf527',NULL,'registration-page-form','siglo21','eb1bd319-e701-4862-af24-50bdced96b4b',0,10,_binary '','2653d193-ddbf-45e6-8351-6f8eaa9b4a1b',NULL),('38fa5acd-4cbb-4f20-8e43-2791e4c7555e',NULL,'registration-user-creation','siglo21','2653d193-ddbf-45e6-8351-6f8eaa9b4a1b',0,20,_binary '\0',NULL,NULL),('40365775-873c-4a05-86e0-cb62064ea8fd',NULL,'conditional-user-configured','master','3c3a1ae8-7bda-421e-a0f4-37e5f3c96122',0,10,_binary '\0',NULL,NULL),('474e8e7d-0d85-4cf5-8e55-ff0670491802',NULL,NULL,'siglo21','91cf95d4-4e8a-41b8-a46a-c94881ca5f23',1,20,_binary '','e6c2704a-f2b2-4724-8502-f4534853ed1c',NULL),('48f179ba-8e6e-493c-ad6d-c3c71690b5cc',NULL,'auth-spnego','siglo21','7f091fd5-fce2-4138-b617-9b4ea6a0220a',3,20,_binary '\0',NULL,NULL),('4a485698-8f84-45cd-8d61-c66001f89bc8',NULL,'idp-create-user-if-unique','master','9c9adcb8-ac19-43e9-9c9a-a0c866f25f6a',2,10,_binary '\0',NULL,'93d54b6a-018c-4486-a796-63de339b1922'),('4d6f8490-be22-431b-80b1-b1630cb81dd6',NULL,'reset-password','master','3423ef2d-8bed-4d30-b4c7-0dab7a6215aa',0,30,_binary '\0',NULL,NULL),('501d6c94-2ba5-4e2f-82b6-bb6164a417e6',NULL,'conditional-user-configured','siglo21','6f7a01a1-4c14-4ebd-b61f-ab51ecff6ed8',0,10,_binary '\0',NULL,NULL),('5502de53-00e1-421b-bed3-71dc02f8f926',NULL,'direct-grant-validate-otp','master','3c3a1ae8-7bda-421e-a0f4-37e5f3c96122',0,20,_binary '\0',NULL,NULL),('596c620c-3635-4548-92ec-22ff9e068bdf',NULL,'idp-email-verification','siglo21','d61ebc20-6366-466d-8581-bc39fc370ed1',2,10,_binary '\0',NULL,NULL),('5a94beb7-b05a-40c0-8343-7b31794719f5',NULL,'auth-otp-form','master','26e4e826-aee2-4247-90ff-f1c4e958683c',0,20,_binary '\0',NULL,NULL),('5b645640-5679-4524-9047-74c6d3c54c04',NULL,'reset-otp','siglo21','3717086f-9c3e-4723-bdc0-573dcd4f3f5f',0,20,_binary '\0',NULL,NULL),('5e591be1-a54b-4733-bb62-419ba732bb9e',NULL,'registration-page-form','master','178893ad-4f72-4e3f-95e4-d86eaba0f141',0,10,_binary '','82812b3a-ce31-4123-94c7-7c08294d8267',NULL),('5fafe3f4-5cbc-479c-a27e-b79c5736b719',NULL,'reset-otp','master','454af279-d16d-4702-9bf8-679585d19d1b',0,20,_binary '\0',NULL,NULL),('5fcef918-06e8-4618-b67d-2a5ff0a156dd',NULL,'direct-grant-validate-password','master','26c8a7b2-6e62-42f9-89a6-3c43102277f0',0,20,_binary '\0',NULL,NULL),('627e5d48-7f6c-47da-aca1-9d6217b4110b',NULL,'http-basic-authenticator','siglo21','e4433752-ae05-4c03-86fd-588043aefb31',0,10,_binary '\0',NULL,NULL),('64756a97-9de4-400a-b21e-d8a5af92805c',NULL,'client-secret-jwt','master','4e07eeb8-7c0e-4734-adcd-927ff89342da',2,30,_binary '\0',NULL,NULL),('689b5c50-6993-4087-89b2-69857b13a937',NULL,'docker-http-basic-authenticator','master','d8ba16fe-35ea-4888-9ea7-34fffc969fb1',0,10,_binary '\0',NULL,NULL),('69c32b3d-994e-4be9-ae0e-09bfc0e3d5fe',NULL,NULL,'master','20c3bf31-b590-40c3-b27e-5b5c2d0c0e50',2,20,_binary '','558f370a-e089-4fed-9f02-132204e5d890',NULL),('6b999866-9416-4c7e-9989-df98ff39e739',NULL,'registration-password-action','siglo21','2653d193-ddbf-45e6-8351-6f8eaa9b4a1b',0,50,_binary '\0',NULL,NULL),('6f42c3e2-47a3-47bc-9462-87415aab8a7d',NULL,'client-secret','master','4e07eeb8-7c0e-4734-adcd-927ff89342da',2,10,_binary '\0',NULL,NULL),('701bc47f-3a82-4907-8fa1-b5a97a30e3c9',NULL,'conditional-user-configured','master','89817e73-ab78-4c75-9048-e6ded48bf53e',0,10,_binary '\0',NULL,NULL),('72d08d6d-ee1c-4d37-b517-d1900b42dbcb',NULL,'auth-cookie','siglo21','7f091fd5-fce2-4138-b617-9b4ea6a0220a',2,10,_binary '\0',NULL,NULL),('7370d991-aae7-4a31-8b1b-17c8612b3b0f',NULL,'no-cookie-redirect','siglo21','3bf42ab4-20be-45c0-922b-93e771c37d05',0,10,_binary '\0',NULL,NULL),('74a83cc2-60d1-49c4-998c-0063b7bd2af2',NULL,'client-secret-jwt','siglo21','6f730b1b-6bf7-48b2-8522-1e372e509ca3',2,30,_binary '\0',NULL,NULL),('78f82ddd-4034-40e5-af46-1d7784971bca',NULL,'reset-credential-email','master','3423ef2d-8bed-4d30-b4c7-0dab7a6215aa',0,20,_binary '\0',NULL,NULL),('83c2a68f-bf28-49d6-9fda-b5efb58eb664',NULL,'auth-spnego','master','ab694bf6-2561-4b0f-9a14-cb1bad6f67eb',3,20,_binary '\0',NULL,NULL),('83dde4fe-2a73-43f3-8d7f-0876e7110744',NULL,'auth-username-password-form','siglo21','91cf95d4-4e8a-41b8-a46a-c94881ca5f23',0,10,_binary '\0',NULL,NULL),('84b8c2ef-b55f-4115-8c80-280b969dd390',NULL,'auth-username-password-form','master','9640a66c-ce3b-49d6-83bb-0a6f96fb1b7a',0,10,_binary '\0',NULL,NULL),('863e63e6-0036-4c2b-9fa1-0af04f02358d',NULL,'no-cookie-redirect','master','2b296ed4-2ed6-4398-a007-102dc931abbb',0,10,_binary '\0',NULL,NULL),('8c4ddf4a-2ec7-45cf-a24f-7ece96675936',NULL,'client-secret','siglo21','6f730b1b-6bf7-48b2-8522-1e372e509ca3',2,10,_binary '\0',NULL,NULL),('8fedcdf0-665c-48e6-8723-99252afb6165',NULL,NULL,'siglo21','3bf42ab4-20be-45c0-922b-93e771c37d05',0,20,_binary '','c881af79-b26c-4575-b51d-260be78b8adc',NULL),('914dbf3f-b310-4439-8bc4-15e2a175c9fa',NULL,NULL,'master','2b296ed4-2ed6-4398-a007-102dc931abbb',0,20,_binary '','1ff85f3a-60cf-4657-a281-9a0ec52afb86',NULL),('91ef9f5b-0bc9-4460-815c-124c906430fb',NULL,'auth-otp-form','siglo21','27ad025a-2527-48f0-b4ca-8430f10bff35',0,20,_binary '\0',NULL,NULL),('93373839-4150-4929-a002-79b356e21fb8',NULL,'auth-otp-form','siglo21','e6c2704a-f2b2-4724-8502-f4534853ed1c',0,20,_binary '\0',NULL,NULL),('944aadc5-4c3e-431a-9dde-636849b1b4fc',NULL,'basic-auth-otp','master','1ff85f3a-60cf-4657-a281-9a0ec52afb86',3,20,_binary '\0',NULL,NULL),('946a4c5c-e01a-48c9-b618-9f8dc0fde24f',NULL,NULL,'siglo21','fb698ccb-7e5e-427e-9f24-d80252ba010d',0,20,_binary '','d61ebc20-6366-466d-8581-bc39fc370ed1',NULL),('94d68423-06cb-4655-9333-5db96f0851ad',NULL,'idp-confirm-link','master','5854c619-7360-47ee-8414-ffea7747d684',0,10,_binary '\0',NULL,NULL),('962ccdec-6402-489f-8ff3-b550e811b0e2',NULL,'idp-username-password-form','master','558f370a-e089-4fed-9f02-132204e5d890',0,10,_binary '\0',NULL,NULL),('9981624c-897a-44ea-b285-c1af9bc26c86',NULL,NULL,'siglo21','9463b86c-a310-495d-bfa8-4c2de28442fd',0,20,_binary '','3665ad0f-62bc-4566-87ff-faf9ebe3c819',NULL),('9b0fa270-643f-40a6-bdf5-7a595fbf429e',NULL,'idp-confirm-link','siglo21','fb698ccb-7e5e-427e-9f24-d80252ba010d',0,10,_binary '\0',NULL,NULL),('9c3569b1-73da-4117-9d80-313115f211bf',NULL,'direct-grant-validate-password','siglo21','04461393-2b6c-4da9-b6ad-031fff2a5bfd',0,20,_binary '\0',NULL,NULL),('9c7dd415-2f06-4e71-9ab6-c6dd9b8f90bd',NULL,'idp-username-password-form','siglo21','61cb4f96-7abd-4f48-89fe-ed951834ea89',0,10,_binary '\0',NULL,NULL),('9d874650-2261-4119-a33c-5b1f11439f03',NULL,'identity-provider-redirector','master','ab694bf6-2561-4b0f-9a14-cb1bad6f67eb',2,25,_binary '\0',NULL,NULL),('9ee3e71b-faa0-4fb8-ac8a-fff80456dfa3',NULL,NULL,'siglo21','61cb4f96-7abd-4f48-89fe-ed951834ea89',1,20,_binary '','27ad025a-2527-48f0-b4ca-8430f10bff35',NULL),('9feb5797-bdfd-4562-8bff-6aa544f312d9',NULL,'registration-password-action','master','82812b3a-ce31-4123-94c7-7c08294d8267',0,50,_binary '\0',NULL,NULL),('a74612e2-6014-4ac1-9c97-5e586719f6da',NULL,NULL,'siglo21','04461393-2b6c-4da9-b6ad-031fff2a5bfd',1,30,_binary '','6f7a01a1-4c14-4ebd-b61f-ab51ecff6ed8',NULL),('a89aba66-6866-4c0a-ad07-3a2eb55097d1',NULL,'idp-review-profile','siglo21','9463b86c-a310-495d-bfa8-4c2de28442fd',0,10,_binary '\0',NULL,'eafd5d5f-2373-4869-bfe2-4b6012dcf77a'),('a94a9f52-5d7b-43d7-bedb-b377afaba444',NULL,'identity-provider-redirector','siglo21','7f091fd5-fce2-4138-b617-9b4ea6a0220a',2,25,_binary '\0',NULL,NULL),('ac6c29ef-33f0-45af-b532-80107e42abf6',NULL,'docker-http-basic-authenticator','siglo21','c7011230-9539-49d7-8875-4ce796d76152',0,10,_binary '\0',NULL,NULL),('ad28e5e7-dc76-488c-a895-102490d8d6c1',NULL,'registration-recaptcha-action','master','82812b3a-ce31-4123-94c7-7c08294d8267',3,60,_binary '\0',NULL,NULL),('b09d5c60-26ef-4b2d-bf8b-82d7f71162b8',NULL,NULL,'master','26c8a7b2-6e62-42f9-89a6-3c43102277f0',1,30,_binary '','3c3a1ae8-7bda-421e-a0f4-37e5f3c96122',NULL),('b4aaa700-d308-4db6-ab5e-02e269410c0b',NULL,'basic-auth','siglo21','c881af79-b26c-4575-b51d-260be78b8adc',0,10,_binary '\0',NULL,NULL),('b607ccd4-80d4-49df-b8f4-6464cd1c7d80',NULL,'http-basic-authenticator','master','46158fea-631d-44dd-a848-21be7f2dbab7',0,10,_binary '\0',NULL,NULL),('b6219a49-58d3-44ca-bb1b-69865a37ccf6',NULL,'direct-grant-validate-username','siglo21','04461393-2b6c-4da9-b6ad-031fff2a5bfd',0,10,_binary '\0',NULL,NULL),('bc061c3a-a347-425c-a7b6-94247ade974e',NULL,'auth-cookie','master','ab694bf6-2561-4b0f-9a14-cb1bad6f67eb',2,10,_binary '\0',NULL,NULL),('c0e0e022-efe6-44fe-95ba-d374adc0e57b',NULL,NULL,'master','558f370a-e089-4fed-9f02-132204e5d890',1,20,_binary '','89817e73-ab78-4c75-9048-e6ded48bf53e',NULL),('c4dbf78c-b68e-4e97-8d74-01433e8d1f14',NULL,NULL,'master','9c9adcb8-ac19-43e9-9c9a-a0c866f25f6a',2,20,_binary '','5854c619-7360-47ee-8414-ffea7747d684',NULL),('c5317734-aea5-4d93-b8f9-5734028ae275',NULL,'client-jwt','siglo21','6f730b1b-6bf7-48b2-8522-1e372e509ca3',2,20,_binary '\0',NULL,NULL),('c5385773-0dcb-4288-97ba-2b33b848b24e',NULL,'direct-grant-validate-username','master','26c8a7b2-6e62-42f9-89a6-3c43102277f0',0,10,_binary '\0',NULL,NULL),('c6db9965-4a03-4d10-b58a-be57ca9125f4',NULL,NULL,'siglo21','d61ebc20-6366-466d-8581-bc39fc370ed1',2,20,_binary '','61cb4f96-7abd-4f48-89fe-ed951834ea89',NULL),('ca0940da-5443-4485-882b-bbbc0f03c4db',NULL,'registration-profile-action','siglo21','2653d193-ddbf-45e6-8351-6f8eaa9b4a1b',0,40,_binary '\0',NULL,NULL),('cd9b19e3-4021-4a4f-9365-9f35b962a265',NULL,'client-x509','siglo21','6f730b1b-6bf7-48b2-8522-1e372e509ca3',2,40,_binary '\0',NULL,NULL),('d21be06e-49f8-459f-b773-eb9d1efa7aa3',NULL,'reset-credentials-choose-user','master','3423ef2d-8bed-4d30-b4c7-0dab7a6215aa',0,10,_binary '\0',NULL,NULL),('d9be784e-5175-4ae4-b85e-7ead9ecb7a6c',NULL,NULL,'master','3423ef2d-8bed-4d30-b4c7-0dab7a6215aa',1,40,_binary '','454af279-d16d-4702-9bf8-679585d19d1b',NULL),('dba5c160-8021-445e-86bb-1e407d4e15be',NULL,'client-jwt','master','4e07eeb8-7c0e-4734-adcd-927ff89342da',2,20,_binary '\0',NULL,NULL),('e37330ee-ad89-45ee-8be1-9e7094359fb1',NULL,'auth-spnego','siglo21','c881af79-b26c-4575-b51d-260be78b8adc',3,30,_binary '\0',NULL,NULL),('eebe1553-24a2-44b4-90b4-e88221325dfe',NULL,'idp-email-verification','master','20c3bf31-b590-40c3-b27e-5b5c2d0c0e50',2,10,_binary '\0',NULL,NULL),('f06e9247-8087-47f1-a042-1b0a513c41d7',NULL,'basic-auth-otp','siglo21','c881af79-b26c-4575-b51d-260be78b8adc',3,20,_binary '\0',NULL,NULL),('f4fafafc-8715-4d24-a624-76e4eb9dc9bf',NULL,'auth-otp-form','master','89817e73-ab78-4c75-9048-e6ded48bf53e',0,20,_binary '\0',NULL,NULL),('f6864c20-8603-4001-b777-650a11b531ee',NULL,'registration-profile-action','master','82812b3a-ce31-4123-94c7-7c08294d8267',0,40,_binary '\0',NULL,NULL),('f6d7a305-c407-427b-b37d-741012858658',NULL,'registration-user-creation','master','82812b3a-ce31-4123-94c7-7c08294d8267',0,20,_binary '\0',NULL,NULL),('f8b41d52-0897-4e56-9539-40c5406c1552',NULL,NULL,'siglo21','3665ad0f-62bc-4566-87ff-faf9ebe3c819',2,20,_binary '','fb698ccb-7e5e-427e-9f24-d80252ba010d',NULL),('f9f737ca-b60b-4da4-9e78-3b3314d81e34',NULL,'conditional-user-configured','master','26e4e826-aee2-4247-90ff-f1c4e958683c',0,10,_binary '\0',NULL,NULL),('fa708f3c-2ee3-4912-8be0-6f1e1f84a9a4',NULL,'auth-spnego','master','1ff85f3a-60cf-4657-a281-9a0ec52afb86',3,30,_binary '\0',NULL,NULL),('fa7ecbff-834d-4e28-97df-eba91d53c98d',NULL,'basic-auth','master','1ff85f3a-60cf-4657-a281-9a0ec52afb86',0,10,_binary '\0',NULL,NULL),('fab8e3d3-917a-40d7-863f-b83377a343e9',NULL,'conditional-user-configured','siglo21','3717086f-9c3e-4723-bdc0-573dcd4f3f5f',0,10,_binary '\0',NULL,NULL),('fcecb653-be79-40c6-b55d-b2b4da344e13',NULL,'registration-recaptcha-action','siglo21','2653d193-ddbf-45e6-8351-6f8eaa9b4a1b',3,60,_binary '\0',NULL,NULL);
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('04461393-2b6c-4da9-b6ad-031fff2a5bfd','direct grant','OpenID Connect Resource Owner Grant','siglo21','basic-flow',_binary '',_binary ''),('1458d8cd-1f12-4789-8bf3-89830152fa47','reset credentials','Reset credentials for a user if they forgot their password or something','siglo21','basic-flow',_binary '',_binary ''),('178893ad-4f72-4e3f-95e4-d86eaba0f141','registration','registration flow','master','basic-flow',_binary '',_binary ''),('1ff85f3a-60cf-4657-a281-9a0ec52afb86','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('20c3bf31-b590-40c3-b27e-5b5c2d0c0e50','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('2653d193-ddbf-45e6-8351-6f8eaa9b4a1b','registration form','registration form','siglo21','form-flow',_binary '\0',_binary ''),('26c8a7b2-6e62-42f9-89a6-3c43102277f0','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('26e4e826-aee2-4247-90ff-f1c4e958683c','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('27ad025a-2527-48f0-b4ca-8430f10bff35','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('2b296ed4-2ed6-4398-a007-102dc931abbb','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('3423ef2d-8bed-4d30-b4c7-0dab7a6215aa','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('3665ad0f-62bc-4566-87ff-faf9ebe3c819','User creation or linking','Flow for the existing/non-existing user alternatives','siglo21','basic-flow',_binary '\0',_binary ''),('3717086f-9c3e-4723-bdc0-573dcd4f3f5f','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','siglo21','basic-flow',_binary '\0',_binary ''),('3bf42ab4-20be-45c0-922b-93e771c37d05','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','siglo21','basic-flow',_binary '',_binary ''),('3c3a1ae8-7bda-421e-a0f4-37e5f3c96122','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('454af279-d16d-4702-9bf8-679585d19d1b','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('46158fea-631d-44dd-a848-21be7f2dbab7','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('4e07eeb8-7c0e-4734-adcd-927ff89342da','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('558f370a-e089-4fed-9f02-132204e5d890','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('5854c619-7360-47ee-8414-ffea7747d684','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('61cb4f96-7abd-4f48-89fe-ed951834ea89','Verify Existing Account by Re-authentication','Reauthentication of existing account','siglo21','basic-flow',_binary '\0',_binary ''),('6f730b1b-6bf7-48b2-8522-1e372e509ca3','clients','Base authentication for clients','siglo21','client-flow',_binary '',_binary ''),('6f7a01a1-4c14-4ebd-b61f-ab51ecff6ed8','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('7f091fd5-fce2-4138-b617-9b4ea6a0220a','browser','browser based authentication','siglo21','basic-flow',_binary '',_binary ''),('82812b3a-ce31-4123-94c7-7c08294d8267','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('89817e73-ab78-4c75-9048-e6ded48bf53e','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('91cf95d4-4e8a-41b8-a46a-c94881ca5f23','forms','Username, password, otp and other auth forms.','siglo21','basic-flow',_binary '\0',_binary ''),('9463b86c-a310-495d-bfa8-4c2de28442fd','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','siglo21','basic-flow',_binary '',_binary ''),('9640a66c-ce3b-49d6-83bb-0a6f96fb1b7a','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('9c9adcb8-ac19-43e9-9c9a-a0c866f25f6a','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('a9600095-07a1-415b-9e35-74c1eca98a2c','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('ab694bf6-2561-4b0f-9a14-cb1bad6f67eb','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('c7011230-9539-49d7-8875-4ce796d76152','docker auth','Used by Docker clients to authenticate against the IDP','siglo21','basic-flow',_binary '',_binary ''),('c881af79-b26c-4575-b51d-260be78b8adc','Authentication Options','Authentication options.','siglo21','basic-flow',_binary '\0',_binary ''),('d61ebc20-6366-466d-8581-bc39fc370ed1','Account verification options','Method with which to verity the existing account','siglo21','basic-flow',_binary '\0',_binary ''),('d8ba16fe-35ea-4888-9ea7-34fffc969fb1','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('e4433752-ae05-4c03-86fd-588043aefb31','saml ecp','SAML ECP Profile Authentication Flow','siglo21','basic-flow',_binary '',_binary ''),('e6c2704a-f2b2-4724-8502-f4534853ed1c','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('eb1bd319-e701-4862-af24-50bdced96b4b','registration','registration flow','siglo21','basic-flow',_binary '',_binary ''),('fb698ccb-7e5e-427e-9f24-d80252ba010d','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','siglo21','basic-flow',_binary '\0',_binary '');
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('814ba637-4aac-45ff-ab68-def73fe8069b','create unique user config','siglo21'),('81e31bf3-7faf-4c14-b547-fa6d9aceb143','review profile config','master'),('93d54b6a-018c-4486-a796-63de339b1922','create unique user config','master'),('eafd5d5f-2373-4869-bfe2-4b6012dcf77a','review profile config','siglo21');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('814ba637-4aac-45ff-ab68-def73fe8069b','false','require.password.update.after.registration'),('81e31bf3-7faf-4c14-b547-fa6d9aceb143','missing','update.profile.on.first.login'),('93d54b6a-018c-4486-a796-63de339b1922','false','require.password.update.after.registration'),('eafd5d5f-2373-4869-bfe2-4b6012dcf77a','missing','update.profile.on.first.login');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambios_estado`
--

LOCK TABLES `cambios_estado` WRITE;
/*!40000 ALTER TABLE `cambios_estado` DISABLE KEYS */;
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
INSERT INTO `camiones` VALUES ('ABC123','Rojo','Camión de carga Descripcion','Modelo1'),('DEF456','Azul','Camión de reparto Descripcion','Modelo2'),('GHI789','Verde','Camión de transporte Descripcion','Modelo3'),('JKL012','Blanco','Camión de mudanzas Descripcion','Modelo4'),('MNO345','Negro','Camión de logística Descripcion','Modelo5');
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
INSERT INTO `CLIENT` VALUES ('0ca2e86b-131e-454d-95a7-c124ad72b7cb',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('1d1bdb92-2e05-4081-949d-c2bccba13fb7',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('24cde013-9584-4109-bd68-b860e38e0440',_binary '',_binary '\0','siglo21-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','siglo21 Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/siglo21/account/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/siglo21/console/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '',_binary '','siglo21-client-api-rest',0,_binary '',NULL,'http://localhost:8080',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/siglo21/account/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6717d064-1e4d-4d6e-a574-66d465478cb3',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('78d508a8-6ec9-4316-ad3c-fead0d01517b',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b5835826-549a-4bd1-a95b-d9b4226c9102',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d00686de-ac18-418c-a0f5-bc9175a3e29f',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
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
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','S256','pkce.code.challenge.method'),('42ce5f39-f315-496d-881f-7de13ac3ae08','S256','pkce.code.challenge.method'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','1800','access.token.lifespan'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','backchannel.logout.revoke.offline.tokens'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','true','backchannel.logout.session.required'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','client_credentials.use_refresh_token'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','display.on.consent.screen'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','exclude.session.state.from.auth.response'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','id.token.as.detached.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','oauth2.device.authorization.grant.enabled'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','oidc.ciba.grant.enabled'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','require.pushed.authorization.requests'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml_force_name_id_format'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.artifact.binding'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.assertion.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.authnstatement'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.client.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.encrypt'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.force.post.binding'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.multivalued.roles'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.onetimeuse.condition'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.server.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.server.signature.keyinfo.ext'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','tls.client.certificate.bound.access.tokens'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','true','use.refresh.tokens'),('78d508a8-6ec9-4316-ad3c-fead0d01517b','S256','pkce.code.challenge.method'),('d00686de-ac18-418c-a0f5-bc9175a3e29f','S256','pkce.code.challenge.method');
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
INSERT INTO `CLIENT_SCOPE` VALUES ('15c7c734-c1dd-4a7a-9334-e752916a644e','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('19b6b82c-b8f7-4634-be79-efede78aab4e','offline_access','siglo21','OpenID Connect built-in scope: offline_access','openid-connect'),('226c058c-617b-4697-ae55-41df3e9ef711','email','master','OpenID Connect built-in scope: email','openid-connect'),('2556b4a5-e3fd-4245-8ff0-c63710d9ff98','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('279791da-86fa-4f67-84c7-b8f250adbcf1','profile','siglo21','OpenID Connect built-in scope: profile','openid-connect'),('28963099-19d3-4521-a02f-976d9671e893','phone','siglo21','OpenID Connect built-in scope: phone','openid-connect'),('2f31bc60-363a-4acc-8511-fb77c47f1d77','address','master','OpenID Connect built-in scope: address','openid-connect'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','email','siglo21','OpenID Connect built-in scope: email','openid-connect'),('6233aad2-102b-4d66-bb1a-f652071f5949','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('80a98201-a009-4f95-a8d9-67b46623f54d','microprofile-jwt','siglo21','Microprofile - JWT built-in scope','openid-connect'),('9976ea22-9d6e-40c5-8746-e1db89dc3192','role_list','master','SAML role list','saml'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','roles','siglo21','OpenID Connect scope for add user roles to the access token','openid-connect'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','role_list','siglo21','SAML role list','saml'),('b39fe518-d02f-4eac-942b-eeddf878c80f','web-origins','siglo21','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('c3aa359f-ff32-494e-bda6-5155da9ff353','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('c5628e6e-ae2b-4b9c-a2c7-9a698745eff0','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('da127315-5241-4a8f-a46a-6bea0de8925e','address','siglo21','OpenID Connect built-in scope: address','openid-connect'),('e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect');
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
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('15c7c734-c1dd-4a7a-9334-e752916a644e','${profileScopeConsentText}','consent.screen.text'),('15c7c734-c1dd-4a7a-9334-e752916a644e','true','display.on.consent.screen'),('15c7c734-c1dd-4a7a-9334-e752916a644e','true','include.in.token.scope'),('19b6b82c-b8f7-4634-be79-efede78aab4e','${offlineAccessScopeConsentText}','consent.screen.text'),('19b6b82c-b8f7-4634-be79-efede78aab4e','true','display.on.consent.screen'),('226c058c-617b-4697-ae55-41df3e9ef711','${emailScopeConsentText}','consent.screen.text'),('226c058c-617b-4697-ae55-41df3e9ef711','true','display.on.consent.screen'),('226c058c-617b-4697-ae55-41df3e9ef711','true','include.in.token.scope'),('2556b4a5-e3fd-4245-8ff0-c63710d9ff98','','consent.screen.text'),('2556b4a5-e3fd-4245-8ff0-c63710d9ff98','false','display.on.consent.screen'),('2556b4a5-e3fd-4245-8ff0-c63710d9ff98','false','include.in.token.scope'),('279791da-86fa-4f67-84c7-b8f250adbcf1','${profileScopeConsentText}','consent.screen.text'),('279791da-86fa-4f67-84c7-b8f250adbcf1','true','display.on.consent.screen'),('279791da-86fa-4f67-84c7-b8f250adbcf1','true','include.in.token.scope'),('28963099-19d3-4521-a02f-976d9671e893','${phoneScopeConsentText}','consent.screen.text'),('28963099-19d3-4521-a02f-976d9671e893','true','display.on.consent.screen'),('28963099-19d3-4521-a02f-976d9671e893','true','include.in.token.scope'),('2f31bc60-363a-4acc-8511-fb77c47f1d77','${addressScopeConsentText}','consent.screen.text'),('2f31bc60-363a-4acc-8511-fb77c47f1d77','true','display.on.consent.screen'),('2f31bc60-363a-4acc-8511-fb77c47f1d77','true','include.in.token.scope'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','${emailScopeConsentText}','consent.screen.text'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','true','display.on.consent.screen'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','true','include.in.token.scope'),('6233aad2-102b-4d66-bb1a-f652071f5949','${phoneScopeConsentText}','consent.screen.text'),('6233aad2-102b-4d66-bb1a-f652071f5949','true','display.on.consent.screen'),('6233aad2-102b-4d66-bb1a-f652071f5949','true','include.in.token.scope'),('80a98201-a009-4f95-a8d9-67b46623f54d','false','display.on.consent.screen'),('80a98201-a009-4f95-a8d9-67b46623f54d','true','include.in.token.scope'),('9976ea22-9d6e-40c5-8746-e1db89dc3192','${samlRoleListScopeConsentText}','consent.screen.text'),('9976ea22-9d6e-40c5-8746-e1db89dc3192','true','display.on.consent.screen'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','${rolesScopeConsentText}','consent.screen.text'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','true','display.on.consent.screen'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','false','include.in.token.scope'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','${samlRoleListScopeConsentText}','consent.screen.text'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','true','display.on.consent.screen'),('b39fe518-d02f-4eac-942b-eeddf878c80f','','consent.screen.text'),('b39fe518-d02f-4eac-942b-eeddf878c80f','false','display.on.consent.screen'),('b39fe518-d02f-4eac-942b-eeddf878c80f','false','include.in.token.scope'),('c3aa359f-ff32-494e-bda6-5155da9ff353','false','display.on.consent.screen'),('c3aa359f-ff32-494e-bda6-5155da9ff353','true','include.in.token.scope'),('c5628e6e-ae2b-4b9c-a2c7-9a698745eff0','${rolesScopeConsentText}','consent.screen.text'),('c5628e6e-ae2b-4b9c-a2c7-9a698745eff0','true','display.on.consent.screen'),('c5628e6e-ae2b-4b9c-a2c7-9a698745eff0','false','include.in.token.scope'),('da127315-5241-4a8f-a46a-6bea0de8925e','${addressScopeConsentText}','consent.screen.text'),('da127315-5241-4a8f-a46a-6bea0de8925e','true','display.on.consent.screen'),('da127315-5241-4a8f-a46a-6bea0de8925e','true','include.in.token.scope'),('e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0','${offlineAccessScopeConsentText}','consent.screen.text'),('e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0','true','display.on.consent.screen');
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
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0ca2e86b-131e-454d-95a7-c124ad72b7cb','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('1d1bdb92-2e05-4081-949d-c2bccba13fb7','15c7c734-c1dd-4a7a-9334-e752916a644e',_binary ''),('1d1bdb92-2e05-4081-949d-c2bccba13fb7','226c058c-617b-4697-ae55-41df3e9ef711',_binary ''),('1d1bdb92-2e05-4081-949d-c2bccba13fb7','2556b4a5-e3fd-4245-8ff0-c63710d9ff98',_binary ''),('1d1bdb92-2e05-4081-949d-c2bccba13fb7','2f31bc60-363a-4acc-8511-fb77c47f1d77',_binary '\0'),('1d1bdb92-2e05-4081-949d-c2bccba13fb7','6233aad2-102b-4d66-bb1a-f652071f5949',_binary '\0'),('1d1bdb92-2e05-4081-949d-c2bccba13fb7','c3aa359f-ff32-494e-bda6-5155da9ff353',_binary '\0'),('1d1bdb92-2e05-4081-949d-c2bccba13fb7','c5628e6e-ae2b-4b9c-a2c7-9a698745eff0',_binary ''),('1d1bdb92-2e05-4081-949d-c2bccba13fb7','e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('5c0ce054-9026-4e6b-a349-affb1a86380f','15c7c734-c1dd-4a7a-9334-e752916a644e',_binary ''),('5c0ce054-9026-4e6b-a349-affb1a86380f','226c058c-617b-4697-ae55-41df3e9ef711',_binary ''),('5c0ce054-9026-4e6b-a349-affb1a86380f','2556b4a5-e3fd-4245-8ff0-c63710d9ff98',_binary ''),('5c0ce054-9026-4e6b-a349-affb1a86380f','2f31bc60-363a-4acc-8511-fb77c47f1d77',_binary '\0'),('5c0ce054-9026-4e6b-a349-affb1a86380f','6233aad2-102b-4d66-bb1a-f652071f5949',_binary '\0'),('5c0ce054-9026-4e6b-a349-affb1a86380f','c3aa359f-ff32-494e-bda6-5155da9ff353',_binary '\0'),('5c0ce054-9026-4e6b-a349-affb1a86380f','c5628e6e-ae2b-4b9c-a2c7-9a698745eff0',_binary ''),('5c0ce054-9026-4e6b-a349-affb1a86380f','e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0',_binary '\0'),('6717d064-1e4d-4d6e-a574-66d465478cb3','15c7c734-c1dd-4a7a-9334-e752916a644e',_binary ''),('6717d064-1e4d-4d6e-a574-66d465478cb3','226c058c-617b-4697-ae55-41df3e9ef711',_binary ''),('6717d064-1e4d-4d6e-a574-66d465478cb3','2556b4a5-e3fd-4245-8ff0-c63710d9ff98',_binary ''),('6717d064-1e4d-4d6e-a574-66d465478cb3','2f31bc60-363a-4acc-8511-fb77c47f1d77',_binary '\0'),('6717d064-1e4d-4d6e-a574-66d465478cb3','6233aad2-102b-4d66-bb1a-f652071f5949',_binary '\0'),('6717d064-1e4d-4d6e-a574-66d465478cb3','c3aa359f-ff32-494e-bda6-5155da9ff353',_binary '\0'),('6717d064-1e4d-4d6e-a574-66d465478cb3','c5628e6e-ae2b-4b9c-a2c7-9a698745eff0',_binary ''),('6717d064-1e4d-4d6e-a574-66d465478cb3','e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0',_binary '\0'),('78d508a8-6ec9-4316-ad3c-fead0d01517b','15c7c734-c1dd-4a7a-9334-e752916a644e',_binary ''),('78d508a8-6ec9-4316-ad3c-fead0d01517b','226c058c-617b-4697-ae55-41df3e9ef711',_binary ''),('78d508a8-6ec9-4316-ad3c-fead0d01517b','2556b4a5-e3fd-4245-8ff0-c63710d9ff98',_binary ''),('78d508a8-6ec9-4316-ad3c-fead0d01517b','2f31bc60-363a-4acc-8511-fb77c47f1d77',_binary '\0'),('78d508a8-6ec9-4316-ad3c-fead0d01517b','6233aad2-102b-4d66-bb1a-f652071f5949',_binary '\0'),('78d508a8-6ec9-4316-ad3c-fead0d01517b','c3aa359f-ff32-494e-bda6-5155da9ff353',_binary '\0'),('78d508a8-6ec9-4316-ad3c-fead0d01517b','c5628e6e-ae2b-4b9c-a2c7-9a698745eff0',_binary ''),('78d508a8-6ec9-4316-ad3c-fead0d01517b','e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0',_binary '\0'),('b5835826-549a-4bd1-a95b-d9b4226c9102','15c7c734-c1dd-4a7a-9334-e752916a644e',_binary ''),('b5835826-549a-4bd1-a95b-d9b4226c9102','226c058c-617b-4697-ae55-41df3e9ef711',_binary ''),('b5835826-549a-4bd1-a95b-d9b4226c9102','2556b4a5-e3fd-4245-8ff0-c63710d9ff98',_binary ''),('b5835826-549a-4bd1-a95b-d9b4226c9102','2f31bc60-363a-4acc-8511-fb77c47f1d77',_binary '\0'),('b5835826-549a-4bd1-a95b-d9b4226c9102','6233aad2-102b-4d66-bb1a-f652071f5949',_binary '\0'),('b5835826-549a-4bd1-a95b-d9b4226c9102','c3aa359f-ff32-494e-bda6-5155da9ff353',_binary '\0'),('b5835826-549a-4bd1-a95b-d9b4226c9102','c5628e6e-ae2b-4b9c-a2c7-9a698745eff0',_binary ''),('b5835826-549a-4bd1-a95b-d9b4226c9102','e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('d00686de-ac18-418c-a0f5-bc9175a3e29f','15c7c734-c1dd-4a7a-9334-e752916a644e',_binary ''),('d00686de-ac18-418c-a0f5-bc9175a3e29f','226c058c-617b-4697-ae55-41df3e9ef711',_binary ''),('d00686de-ac18-418c-a0f5-bc9175a3e29f','2556b4a5-e3fd-4245-8ff0-c63710d9ff98',_binary ''),('d00686de-ac18-418c-a0f5-bc9175a3e29f','2f31bc60-363a-4acc-8511-fb77c47f1d77',_binary '\0'),('d00686de-ac18-418c-a0f5-bc9175a3e29f','6233aad2-102b-4d66-bb1a-f652071f5949',_binary '\0'),('d00686de-ac18-418c-a0f5-bc9175a3e29f','c3aa359f-ff32-494e-bda6-5155da9ff353',_binary '\0'),('d00686de-ac18-418c-a0f5-bc9175a3e29f','c5628e6e-ae2b-4b9c-a2c7-9a698745eff0',_binary ''),('d00686de-ac18-418c-a0f5-bc9175a3e29f','e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0',_binary '\0');
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
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('19b6b82c-b8f7-4634-be79-efede78aab4e','8748520e-df8c-448c-b03a-f7e53b6bf973'),('e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0','2d5c5870-e0f2-4730-bd97-b189e09702a5');
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'cueva','dire 2112','string@gmail.com','jorge','31245332','+54 2132321','+11 213213213',1),(2,'cuenca','dire 2232','string@gmail.com','alberto','20-32133123-3','+54 12355444','',2),(23,'García','Calle 123, Ciudad A','garcia1@email.com','María','11111111','123-456-7890','987-654-3210',1),(24,'López','Avenida Principal 456, Ciudad B','lopez2@email.com','Juan','22222222','123-456-7891','987-654-3211',2),(25,'Martínez','Calle Flores 789, Ciudad C','martinez3@email.com','Ana','33333333','123-456-7892','987-654-3212',1),(26,'Rodríguez','Avenida Central 101, Ciudad A','rodriguez4@email.com','Carlos','44444444','123-456-7893','987-654-3213',2),(27,'Fernández','Calle Palmeras 203, Ciudad B','fernandez5@email.com','Laura','55555555','123-456-7894','987-654-3214',1),(28,'Gómez','Avenida Primavera 405, Ciudad C','gomez6@email.com','Javier','66666666','123-456-7895','987-654-3215',2),(29,'Díaz','Calle Otoño 607, Ciudad A','diaz7@email.com','Paula','77777777','123-456-7896','987-654-3216',1),(30,'Hernández','Avenida Invierno 809, Ciudad B','hernandez8@email.com','Alejandro','88888888','123-456-7897','987-654-3217',2),(31,'Pérez','Calle Verano 111, Ciudad C','perez9@email.com','Sofía','99999999','123-456-7898','987-654-3218',1),(32,'Suárez','Avenida Playa 222, Ciudad A','suarez10@email.com','Mateo','10101010','123-456-7899','987-654-3219',2),(33,'Moreno','Calle Montaña 333, Ciudad B','moreno11@email.com','Isabella','11112222','123-456-7890','987-654-3210',1),(34,'Álvarez','Avenida Río 444, Ciudad C','alvarez12@email.com','Daniel','22223333','123-456-7891','987-654-3211',2),(35,'Romero','Calle Campo 555, Ciudad A','romero13@email.com','Valentina','33334444','123-456-7892','987-654-3212',1),(36,'Torres','Avenida Ciudad 666, Ciudad B','torres14@email.com','Gabriel','44445555','123-456-7893','987-654-3213',2),(37,'Vargas','Calle Bosque 777, Ciudad C','vargas15@email.com','Mariana','55556666','123-456-7894','987-654-3214',1),(38,'Castro','Avenida Selva 888, Ciudad A','castro16@email.com','Adrián','66667777','123-456-7895','987-654-3215',2),(39,'Ruiz','Calle Desierto 999, Ciudad B','ruiz17@email.com','Elena','77778888','123-456-7896','987-654-3216',1),(40,'Gutiérrez','Avenida Estrella 000, Ciudad C','gutierrez18@email.com','José','88889999','123-456-7897','987-654-3217',2),(41,'Mendoza','Calle Luna 123, Ciudad A','mendoza19@email.com','Camila','99990000','123-456-7898','987-654-3218',1),(42,'Silva','Avenida Sol 234, Ciudad B','silva20@email.com','Diego','00001111','123-456-7899','987-654-3219',2),(43,'string','string','string@algo.com','string','string','string','string',3),(45,'string','string','string@algo.com','string','strin','string','string',3),(46,'string','string','string@algo.com','string','stringg','string','string',3),(48,'string','string','string@algo.com','string','stringgg','string','string',3);
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
INSERT INTO `COMPONENT` VALUES ('0098e192-5eea-4102-bbf0-f69798acea5d','Trusted Hosts','siglo21','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('0bac2d08-a013-4ac3-b431-7c09300caadd','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('0bfdf09e-d23d-4d49-9814-08741ba051a8','rsa-generated','siglo21','rsa-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('18218831-6489-4106-8e5e-e12b24f2e907','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('191d0c7d-eb3e-4142-b8de-86005ccbecfb','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('20217c77-2196-4ae6-9d79-e799d807904c','hmac-generated','siglo21','hmac-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('2ae478f7-f417-4af7-9b21-351028a12484','Full Scope Disabled','siglo21','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('35384117-35dc-4f1f-baaf-90334bb256b6','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('3f1dbb76-7ea9-4bdd-964f-052c99103680','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('52c82a70-e1e9-49fb-a57a-19514d10598c','Allowed Client Scopes','siglo21','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('64d6acce-61af-47ab-90b3-e76fcaec03a1','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('6dd78cc0-b65f-46f1-a2b3-855e32ef70e6','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('74671bf6-162e-4104-895a-f7c99c3f6702','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('765cd604-3dd6-49b4-af5e-7363f1d7883e','Allowed Client Scopes','siglo21','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','authenticated'),('77a9bbdc-d8e3-42ae-8167-14ae27e471ae','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('80275b15-09eb-4958-9108-7bcf5f538f38','Allowed Protocol Mapper Types','siglo21','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','authenticated'),('811288b9-8e90-487b-969b-82d36b785c27','rsa-enc-generated','siglo21','rsa-enc-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('b75485a4-f673-4081-9238-4b5e7f5eb222','Max Clients Limit','siglo21','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('bfa8d370-01ca-4bda-9333-ac7649508be0','Allowed Protocol Mapper Types','siglo21','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('c7604a3c-d217-410a-841b-2d3cfe05b6b9','aes-generated','siglo21','aes-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('c93b110f-92b3-4c08-a29a-4968d31fc596','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('e2338303-271d-441c-8517-affc928eb419','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('edf1f996-4f24-4716-b7d9-7b579e444244','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('fe8e79e6-abbf-471b-8c5d-5d5fafd29144','Consent Required','siglo21','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous');
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
INSERT INTO `COMPONENT_CONFIG` VALUES ('0008168c-391a-489f-a42e-c84c7396f3b6','20217c77-2196-4ae6-9d79-e799d807904c','algorithm','HS256'),('008955cc-3fa6-48cf-bd96-970010c07d34','c7604a3c-d217-410a-841b-2d3cfe05b6b9','priority','100'),('02931beb-3d18-4a0b-862a-a1c413dbf481','c93b110f-92b3-4c08-a29a-4968d31fc596','host-sending-registration-request-must-match','true'),('06f0e3c0-8ed3-4ad0-8131-8d88e3a86a4c','e2338303-271d-441c-8517-affc928eb419','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('07f0f3dd-44e3-46ec-bf2d-ccf33c7a5510','c7604a3c-d217-410a-841b-2d3cfe05b6b9','secret','Rw7AvFmrdajPOM1Y0eg31A'),('0d7e6d80-f0a6-49f7-b7fb-8bd6a5ffef47','18218831-6489-4106-8e5e-e12b24f2e907','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('1ad93c97-00d5-4163-8e67-704c6b0497dd','3f1dbb76-7ea9-4bdd-964f-052c99103680','priority','100'),('1af93c32-8a96-4d85-9c45-7df3c54d6a9e','3f1dbb76-7ea9-4bdd-964f-052c99103680','algorithm','RSA-OAEP'),('1c5db987-8f1b-441c-9b17-12e06b31a68a','6dd78cc0-b65f-46f1-a2b3-855e32ef70e6','algorithm','HS256'),('1df3368d-21a2-427c-bfb1-7a482ba2e953','18218831-6489-4106-8e5e-e12b24f2e907','allowed-protocol-mapper-types','saml-role-list-mapper'),('1e399a65-1670-4379-840d-9db0ac3f6463','c7604a3c-d217-410a-841b-2d3cfe05b6b9','kid','92a612ae-7dd8-49d9-b94f-3e5a0796653c'),('1ebb89df-a8bd-49be-ba2a-bd7377e4271a','18218831-6489-4106-8e5e-e12b24f2e907','allowed-protocol-mapper-types','oidc-address-mapper'),('1f2493ad-1a59-468a-9663-e210bf56f56c','811288b9-8e90-487b-969b-82d36b785c27','privateKey','MIIEpAIBAAKCAQEAvf2fqN26/c3vlzc7PH0UQ7EGZ1Y24N3lKJdb45bbK/z6VzWCuiEXfW6aeDc76Q6K2HOWaVvTCMXGZXV+bDU5MiD2H41m5yknNzL4Heg/NhDyiku+QwLz4OKN9URbHKj5OfVPcXKd43GNmbRLrqngHhGF0bGCBSuHRtKiMCm1uAT3AWLsJUdNUVs69WU33AziIwoNBusoTmI8D4KaolIfoPEWKss40ivW8YnED9uYI0c489S66ZaWAw9SCrg3eZIjtOlK0HgUBRuznWzBXVI98Bik+JkJrm2OauVc08pumoPlYd5hEHKJOhLrx1PyB9Qhf9pVq7dCLu09yjK1mNfAbQIDAQABAoIBAQCDNIKtMKsxGaXrTPY4mLyE3tzoQk7Vzgeyl4yayJSFdUhBL7Ae8Dlzow1EFgjmsudKAdEO454Cwep4KMLs4XilWMQAGDvHSdFOOoHEzZ3RrbSBszsqtgBL/slAZztwuHSdBP8e/qNw7ft2+V8GuUQQH9PFc4uyHFRooY/mKPfYo0xGTzNflBq0eRHlnIUd9KpkdiENordqnZCE5SCims5ZcWWitJPdp7A0lr6wfz36KtMkpAPs5gXM+6w45ov8tFsiYRGr74ihCqRkpEn+S53UoGQjRtB0WhGJqPOSLyhtRiGMG3UBDCx3BT7msEDXU5v74Br1/rJMR+fobTptJ2ohAoGBAOVUvc82z84S6mYSn7sfjQaenL0lCv2+I82EC9CtlP0bPKhAiyIibDXpoi/KQK+DOhVLn7Hj+phYKTpHeUaRWUj5k/wvNKqVgNUqFvKX782lMrg1fxW+Yps7aYolUz90UB84wlbaX/M9nJ6hw1L2QjX/mBkl5/pYGZnYO/fHS0LVAoGBANQVtWwJXZhX7H5xHzzii5Bq3PK8Mzqun8g++EJl2JRjdnmfgaAVTJpFHiN7tVUYKikBXITW7Bj7YsBonxOkKFDzXRzTbZ3A+EOM272MwtyH4iud/wCBTkck27r/Z1CQfLxygwHU0n8paiV2V5dZoQ9nmLvnGzFPY+vNJV+FB+M5AoGAdNjonVvgJa+dnsR+fmllAapvUjA9mWv38g8Fth27e/sUvOWl/o5rdEzGRnNW4haK0a7mf00ZseW5m+gu8rW8OGJx9FxZCVGDgxke+BxSIwW5AgK/7eRDebSb4beC4yHwcPgKjRZXLSiHVIw3aV3v/nNsm+OkfvnEkY6Lf4Qb5MECgYEAiVtJ9Z+XM4x2SWngTmF2/GCJmtgS4cWpDFrkFLS7cVd9qsWIgXJp+1waaea8CVGuNIKCNjKwFHnzeiQIKwNdbRhAzOOOEeaho7Y9tuTMa2HCNHeOaPhWBzOy78hsVDxP3QjZGj2I2vyql3quvgI5kq2IuOGztdryHwztUJDrC9kCgYBRo4my3PE5CkA3Re6NW13CCan638ER9EZXwT7pvJmwEDJI+t9pmMZB4eH6QWtO4q9UsjEldzBz0WnQPHrc3Q6yNERhXHwKKsN0YrKeg81Vpx6wfjT6b8VZedzDVveoBIRadROY8JWJaAB49q97/FqS9nw4zP3QdnSMV2heCZifDw=='),('1f8d9ab4-4116-424a-bcee-2a1297fd9701','811288b9-8e90-487b-969b-82d36b785c27','algorithm','RSA-OAEP'),('1f984f2b-44b3-4cae-9a2c-5a5703f09dbb','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('2156dcd7-198a-4955-b2a2-f30064c46dab','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('21ae69cf-eba2-4374-b717-2b511312cfb4','e2338303-271d-441c-8517-affc928eb419','allowed-protocol-mapper-types','oidc-address-mapper'),('2313fe11-16b0-43e0-8758-da1d3864345e','18218831-6489-4106-8e5e-e12b24f2e907','allowed-protocol-mapper-types','oidc-full-name-mapper'),('2a66170b-0ff9-4d9e-90de-deba3d52a2cc','3f1dbb76-7ea9-4bdd-964f-052c99103680','privateKey','MIIEogIBAAKCAQEAmV98g5cpVDux0KVG30KglM0grA/GbrvfDEKrr0kaqF+BTd4F81uWT3P8BEFAqV8BrK786afHiL6PpirCKFnlavBxbXWCCz6kn5NXLkzXMzopz68zleVuUn71OHSzjOi/+IyUWBLYBBOshH7onigxKVIKVi3eAM+5EFbNXUuMSXgNEVt6fnH91hGZT9LTRHkIocAEjPqoK/2/boi66IlSSfZoh2e0Z/JfIVCgTEHwNAn37WgllhF2AYhH7oO8FhUnBtpuE9IymTJDj6AjEEKotWwciPgBFldUJr+iV3iuPNgbc0yuh9q+uhZb8tqZLorkVQKv2LA28I/6suMEz2EPLQIDAQABAoIBAG2uNmoYaKrfQasW9tbkW9ft1aaWZW59FeY7q3Ff0xuDqQGZfCHrZlONezVDwM0eryDhxuYFYREuTaYkP9MBbqoKJuODPCt0cd/YS2lF9EOjHZFzFm3ks/904UKtWlWzgM1rIw7U8vv/YckixJGN5pJJJDE6/d8QraS8noJQa5OBldZaSF5OTYdMWXcqNQBfm/biG/xhAg2ncibxuOH1vedmOyzpHGOyE7V6Pkti1md2bEURpyXWlBrnZup7rDprNq4lTU5MGecOY1UkSJ08PD8kDwngjQUTr4YHkKEMQ9tP189tYmqw2u/ywqv5Uy6Klh/poeb3CUdk/ylOl3JpCVUCgYEA0kdQaJvmhgX5pYWYDinUno+pMF1pz8Bgt3l4n9qwkvjmxcZuub4qqYcFo5hVcsnckHlSJqT+5KoTa92Zlq2HiFxA6i5MMlFiRQBU2QOu9uk2b3FD1Vb46xjRz2wjlKZ/40QRTsr6wsQKt9KPo7xtEuVhzn8+GHBKzfMRvyvVqB8CgYEAurimlmmlEhBfybCBC+no+CnRHVsLo+WmC30+S6i4Z++edb5z8axiELoGAsjLXMatIpweiaRu15QJI6e4F2ysv6reDwiZkkDUgnF447uLiAD8ApEEekk4uncvtixpEg06HF0bwl0yR98NDW3cyhvfwJDbUnKjWWX3yEqFqikxTzMCgYAihiLlifMnPgPm8TAt4yBNiDi3AB9HRMacWQ088aLb/pGlFxdG17oZa1m5qmEdH5dfAQxD3AMdd+8IXrHA02zVLpBZ4pAQEtyXh55movwu/cs6MNZ6SHVF5CVOcOrGlS+aGKrezOSu5ZD87U04DM+7sn2Ecc+4I3ekqKvZP1Es8QKBgEkP779zXzAOUCzvb89lm89fLYA7G/bp6Wsder7IKkAhNvQDrgKm3UiGQcvdHhYTd7PPOvPI78ZTGrBk9FfWIlJtXa6sQstDquPP2unhfNue5v1qGUJwXE46TOUPw51Yp6Bpnm8TYJVW5hiXIInFFmyXQfqk+N4GVEp/PoYy0CSZAoGAP56B8U52RJvuFPvUq3xsFLU/u86P5mS+PS3vr0kQ59+FbDgU6Eb/iwi1EDB2phC+41CSbtCQ0RLXFVgSczk4WGED4MqWU+vJ0t5vJHAqWpdBXa3AVTazSQxGUph4wZ/aaCvPrLdA8BimgZ7NkhROZgfhtdnSdTxEB6UGpaxHxj4='),('2b28e4e6-e076-41f0-ad48-c66ce1da0221','3f1dbb76-7ea9-4bdd-964f-052c99103680','keyUse','ENC'),('2c578c21-56ee-4c1a-bdc0-0dbbfed207aa','191d0c7d-eb3e-4142-b8de-86005ccbecfb','privateKey','MIIEpAIBAAKCAQEAv4WwYw1jDYkAxBnXW2duJj/MHkPX3DI+kMwVoZeaBnQYvVsxXOr3NuOlhpUxuHilCHPRBuMBMzxj3PqhLvRTH5rDt57+ld5gMT7mBz2pkOc65Aw/9NoQY/VtSm8zZF5CfSyMD3H7eJQYrbv36LtIFRTNTeJgNe8gDPLz6GWUqd2wv0k379QFAHicXDJQOW0OkZhxNCGzM+HXB+NVAL/MzbScMl5XnMmxhSxgV2tZmKwj6+gBGUjmrxbxZL8jjCY2w7yW/WnJEA4fWgbd6+CGLBml6qXRwBiPdKeO5nw9Wu3rXBgt/OCvI3V7BqKl+64+VauH2LzTk7+v6aGidcMupQIDAQABAoIBACcUo5qCt8yiQSrCzyQSpfJeIEuoslp3Ujb/vgY8Riy88fNpsVfxhkKID1W4Ce5Hh/2CjIuoNK18zC/iYJORPYj8bqWAZxizyNMjr5KYrYoo9OZl7YMMID4VbZi7ujPn3A9o0KeyLYs8RRDmgz7VQG800HPtFo7K3bJmvQiV+dDzVcPv57DLkKZW6rQvpoggjFmkpRFlwAggVbae1SKeyF1aanps9X+dgu0Fmt7bSSFE6B5U9JHmoCv+D3L2MxHbKjND2lUGiVnqwCjbR2AavFyIP+4Rcd2eisjH8W/8dpr8ZNpMu2WILNNtyHBHrMKuiSV0Q016a855IYXB0UC6Oj0CgYEA+Xua4ZnUd2Uu6mnbPh0cMbNLwdOBHGLqKbFvkcX4f83Iv2iWp4fv2QXnHq+Pc41XJrxW1u3SIczayQy3j95+AteFz7wG6rNO6uKJna0eqCpJqey8QMInTH2AaBS/RzkahLmIWaVpAwdITXSougbbl5KZvbqTnvrW4W9uRz1EWlcCgYEAxIZ6N8UtGuc8lM8XSqAJpDhs1O9wHFdm8IfZltQFK+EuinnjQVjYzTYw/Gzz7GOeeMTOCp/yFlNYyYI/Ku0wNo5kk4OawlQEBdKaDoreMKR6dqeIISgz1VidjBZeLEKUXa6SjbfIyy/TIbNIchqf7PWx7QBcSvVaNcZ/kIr0WWMCgYEAj3f9gW8tN9wANt3ZLscex5YMItK2lNRtRLy9JF9soFJ+91P2DzGlRHCYkJT1McY+MBBu//qTtMxRpPyjMyEH5ip60ROYBrBG2dyctwgvcRWgdw+k0rjUULB7f18vAI5eKaVoO+VbllpBwgksXo5DCc9MikcZTXuCxvGFwYICJNECgYEAud72eQjkQC2z/opfXRVACTHUvRA42JVRpuzVvvGIcpfnjND7PzLo2i4G5relfE47870vopzkOnlZ4DxvwgnTL8Y9Gce+90y/AULOsjJlM1xc9xw8hB+h5oaJe5UsPHA8It6Zfa/1GTeCWL1YJ5NG7rbyMVXF9J9ZUsMKo4rI0EECgYAiyHZA5tCz823Swls2wYQ8GPB6E0x8W7GZhmX6ux906MNUM0SFW1LrZUXWgmh6hOwK8umYAtLow5h75fk+8d76IZCmEs/T6C26d37tjhhqKXCvJPou2YHn8ZYbERTp802bdeqt8wHq3BuLZIKzYTj/46eSA53mniR2rSjS9BAHug=='),('2e90f3d1-f971-437f-8eae-485e7a71c774','18218831-6489-4106-8e5e-e12b24f2e907','allowed-protocol-mapper-types','saml-user-property-mapper'),('371c2ae1-4ffa-47f5-b78b-ebd9be778759','c93b110f-92b3-4c08-a29a-4968d31fc596','client-uris-must-match','true'),('38e20fe1-4891-4a65-9a5c-f91ce9924c62','e2338303-271d-441c-8517-affc928eb419','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3a42ea40-00d6-4dc2-a6a3-983fb6b8f90f','e2338303-271d-441c-8517-affc928eb419','allowed-protocol-mapper-types','saml-role-list-mapper'),('3b34702f-9d98-4a85-a122-8320eb66c22d','0bfdf09e-d23d-4d49-9814-08741ba051a8','certificate','MIICnTCCAYUCBgGMPJmQZzANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdzaWdsbzIxMB4XDTIzMTIwNjAwNDcyNloXDTMzMTIwNjAwNDkwNlowEjEQMA4GA1UEAwwHc2lnbG8yMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIo1P5UPLTTF4xG43xuKuLKLhSfiElup8QGo/CqxpwBhHfrTVl6Y1ttFUXtgyRjxUWFILtQRUQMJjJsU6d4iYMXn4K+cppkz/+2ydOpK/gbaZ24lZ9/JPR8yQoKLTVG3aez55bj5nrm9PD03wrp6bg9NfUEAjsSJE0p16/sPgTpUd4RqZT0lPCLmFEc6mFltEZByuUcYUtx9UgRTamSi+3vkDSOyF9vLtxpCCHlcWE8fSzUQBx3A8u/F+0QSh7qNGbRjUvNKdX8OPVa4GWiF8vpln4fpxeAAaINBn5gjsW5L+qBFKs+/iBbT4PjX/ELb5h4juuS5d6UAgQtUTWa8/ZMCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAAKEDSS6cQ/p4RsHyXGVGwMvx742Zj+oIstRlpDyyMJ3f8XrQbefmRtuKdYXa0guXbSHDQSQ5uGEFbAbiF/WHuGLB+EZw6oblOvekKet+Tn4eFNTwA4dFm7juxM/E0qWwfVhwo7dUXzcvCzOhEZniG4mS7/cVvukNWaUIqRKhrRXd8PsnsrZychf+4qzmhasKTK6oKagy6zvgtV7DzOUa/vCcpXMYRU+Gj9v5lxRwJy/GTyYZuEUBiLAeqvHEnujsq6fJKKG7y7qoCxAXZuxgZ/Hly6izNt3HzJCqFzDCYRThOoRFymQ/gmC9IMDreofSeeYJcizOXcecgZYClIYiDQ=='),('3dc437e7-4b9b-4e2b-9f1e-725c4e2a1d6e','64d6acce-61af-47ab-90b3-e76fcaec03a1','priority','100'),('3e2c1f99-6a2d-490e-8bfc-0bd515574bb2','811288b9-8e90-487b-969b-82d36b785c27','certificate','MIICnTCCAYUCBgGMPJmRtjANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdzaWdsbzIxMB4XDTIzMTIwNjAwNDcyNloXDTMzMTIwNjAwNDkwNlowEjEQMA4GA1UEAwwHc2lnbG8yMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL39n6jduv3N75c3Ozx9FEOxBmdWNuDd5SiXW+OW2yv8+lc1grohF31umng3O+kOithzlmlb0wjFxmV1fmw1OTIg9h+NZucpJzcy+B3oPzYQ8opLvkMC8+DijfVEWxyo+Tn1T3FyneNxjZm0S66p4B4RhdGxggUrh0bSojAptbgE9wFi7CVHTVFbOvVlN9wM4iMKDQbrKE5iPA+CmqJSH6DxFirLONIr1vGJxA/bmCNHOPPUuumWlgMPUgq4N3mSI7TpStB4FAUbs51swV1SPfAYpPiZCa5tjmrlXNPKbpqD5WHeYRByiToS68dT8gfUIX/aVau3Qi7tPcoytZjXwG0CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAAsfczb47z696lnv3XaK21oDM1H3Q71OeK6cZgJnczBOhrajHcUZproetdYi6ka/wRE6nVKGC4RIe5ruvI4Z3uf6NlyzhUQYlMJKXaz1ipoFdiro0mrp+Z6x4qnvzDzGPJG5felOoLmp3bP7HMDQ5G7V/VaH7UTzMST3HYYGy+RfW1QsSFbR51UzFjzJQCYimKDDTWpguOCHCWNKUiptN3yd5eSrWjtwpRsqcAU/waGVh6Ayss/7R2l4wvY8FpTMITp+f5GrTSFju9OUY8FD0+9ZDHfsvXr5iiOlFEBe+P9m8Q7azYYfoBjCqdCUEt/bo+sCHBlzTg76FyzVIPfg6ug=='),('41680626-24b2-46b3-90c6-2d4be92fc523','0098e192-5eea-4102-bbf0-f69798acea5d','client-uris-must-match','true'),('426ebb4d-709d-4d9c-94ad-da6858486d76','e2338303-271d-441c-8517-affc928eb419','allowed-protocol-mapper-types','oidc-full-name-mapper'),('4483b134-d492-4cce-a56e-8187a8e9e00c','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('4a1bde5e-c520-4489-912f-b40603f76666','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-address-mapper'),('4efd9629-3393-453d-a420-b1b1af326419','77a9bbdc-d8e3-42ae-8167-14ae27e471ae','allow-default-scopes','true'),('5459b784-95b2-494f-a216-17667b443977','64d6acce-61af-47ab-90b3-e76fcaec03a1','secret','KzKELsD_F-iHcKdFC4auAw'),('54e2307b-e9bd-47da-8d6e-4871fd4f3665','18218831-6489-4106-8e5e-e12b24f2e907','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('60569b8b-addd-4ce6-a6b7-3177a81a2ba6','765cd604-3dd6-49b4-af5e-7363f1d7883e','allow-default-scopes','true'),('6091529f-d44b-4588-9c7f-9ecf9a2ee111','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('6228cf27-fc4d-4488-8ddd-d4c51950e6a9','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-role-list-mapper'),('64814dfe-3d64-4588-9d5c-8e0d277cfb95','6dd78cc0-b65f-46f1-a2b3-855e32ef70e6','priority','100'),('6fb86c0e-9605-4aa2-8ca1-568ee88fbc9a','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-user-property-mapper'),('704ba2e6-51ce-45fa-afef-4d9157b3becc','e2338303-271d-441c-8517-affc928eb419','allowed-protocol-mapper-types','saml-user-property-mapper'),('74e3c601-3053-4c8e-bf0e-64e2cdcf5d5b','e2338303-271d-441c-8517-affc928eb419','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('76110d8b-c281-404b-984a-0359b7ca8f9f','6dd78cc0-b65f-46f1-a2b3-855e32ef70e6','secret','aRDDE66Vxu721F5LDlQ8kiSk0SfLRTLw3y_FSKvJt_hLPeVtug0e7jrc2ETA3sZH4hXnGbGaLwfMNL-1dOeYRA'),('7e797fd3-743d-4103-81e9-f0931ae4c119','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-user-property-mapper'),('8ac5312e-3339-4b8f-b4e7-0e83fb2413d6','18218831-6489-4106-8e5e-e12b24f2e907','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('8f2b5dcb-37d8-464c-bc80-041f29dc796f','20217c77-2196-4ae6-9d79-e799d807904c','priority','100'),('9045725d-988a-438c-b20f-784788f8aaf1','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('9276d8cb-0a2a-4af9-ba6d-510ddf350217','0bfdf09e-d23d-4d49-9814-08741ba051a8','privateKey','MIIEogIBAAKCAQEAijU/lQ8tNMXjEbjfG4q4souFJ+ISW6nxAaj8KrGnAGEd+tNWXpjW20VRe2DJGPFRYUgu1BFRAwmMmxTp3iJgxefgr5ymmTP/7bJ06kr+BtpnbiVn38k9HzJCgotNUbdp7PnluPmeub08PTfCunpuD019QQCOxIkTSnXr+w+BOlR3hGplPSU8IuYURzqYWW0RkHK5RxhS3H1SBFNqZKL7e+QNI7IX28u3GkIIeVxYTx9LNRAHHcDy78X7RBKHuo0ZtGNS80p1fw49VrgZaIXy+mWfh+nF4ABog0GfmCOxbkv6oEUqz7+IFtPg+Nf8QtvmHiO65Ll3pQCBC1RNZrz9kwIDAQABAoIBAADUKupw6dt8KE1t52CZ51uivIytrWCBV2GkKsbyw8abzns3kzgEAJ3V/5QW033jzJIhxa4d4Hd9Miun53Mej6gAKPfEn7chebJqNItHIdjWrHIbpVDROx2Zxo5T2YXY7LiwEvGWBZ6lhNv1HqTRoSFUXKDsKO8Cx2vV4zFhOWwpHTlR+NO6hGH9lCX5GExenpILnf7tYvYRj3AO5IHlIBPTRjkUk9LIWvbcGa66DJ3cAsHSO0NguNBdZiAxunnOpfo4ICNLNmeoWS4v/EMUIrtx817Fwro4xl7tis3bxefGVSXwZnb06isMeXncZ9aMEC18N4qJNxiQoWggOmXzofkCgYEA3QCz1TJtDG7SlZUoADZA7wD+TPb8FgZdMs5p2qOYs+57/Iriwhf0dmTWmtdw+HFK19rZ0VVSHacB14P8e5Saj8HJBJp5yu5CMpB6EnzkC/YJnMdXMSy0XvYT092gGfEJrysS+gZgqnzQdHa/Xj94xQTg33qETfFwEA0Ift08snUCgYEAoBgayEHdPlrcCRWUC8iudDQi+KkaWyfcsqznPSonnEQ4ezIEz/5ZspA/bmWDlAm3Yy1Fyee1tfXmWCCWlowi4fkMuEB8Ljuf2jjH1LiQcBWAnALuGj+sDvTO3bTtRbUf0h7ao9oPUEWQb4vxurSh18jhyAioDIgZQPLPDE2NXucCgYArAx786GKG3+7GRBBT8jszCPt1WUB4vOZYpAnADsUCh/DDlvhJFEZ04G1QF4waHlqVpjdsYXGo6b8XBc4W8zYdsnaAGdyIXVSu6KWJgZsUpN78D2Pt4yh7ruLvAhxN0Da1S+nWlXUs2Tvs3suh+TJ1Dd0CQaMMVGgeB5tWrZJJnQKBgCCfCMYJdbWA+hj3xqToDXQsM3wLqQ0uADCAPtYdwth6pi+kL4raPxi9f89U7Ay8NhwFW5Uam9Ip+ve2HDks8OauwsLAkQ0ypQ3oR/+2Y+gS2ZPwnOfIVZzukUBn33k2wPclxlNg2YH3ysiP8X+j0t6PVkJWUTfMe6jaUQomu0m9AoGAHdD46FksKEWBwt3c/AkzjiQ4YJhQ4f+IJfLiY+QYS/JNkUOKag+gtDxqJxUZLeYk3qxe71CPiZ/Xo2IZ4jWVu4BOY2r6/xFWewbqWkAP80bFNozbMQmd6B0cOAaFnVUPzIvt7pMmcykX8Fj4kebq0NmCVraZHMIitoDoeYr7q6U='),('9f34cacf-23cd-43f2-949e-bba99b8a1cac','20217c77-2196-4ae6-9d79-e799d807904c','secret','BCNRpsTJIHh3qmPVGC8Yuoo9t4SKxDOBGn6xLTAyD5A77Mi7nIPuX-O6ytwWwfWl5VSUkUPfD61whI5I0q5jUg'),('a0d5c0a2-f0da-414c-b9db-f07fb69e7810','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-role-list-mapper'),('a274f57d-5f5f-4c78-8643-cd312993d2fd','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-address-mapper'),('a5fe11d6-78ad-4878-ad4e-5fc81ba39528','52c82a70-e1e9-49fb-a57a-19514d10598c','allow-default-scopes','true'),('abc1b8f7-5c83-4d71-b621-32fe5aa76cf1','811288b9-8e90-487b-969b-82d36b785c27','priority','100'),('b4311fb8-a317-4213-b5f2-1338d8638da7','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('b6c725cf-5378-4c50-afc7-49d9d281d889','64d6acce-61af-47ab-90b3-e76fcaec03a1','kid','952cb890-7e18-4e25-b8e8-75dd05d23325'),('c248cf58-4b8f-47a8-baa1-546c103c3cf9','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('c9b58d41-0211-4915-8e16-5283184dae89','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('ce454d56-869e-450b-9a5d-433adfe85929','6dd78cc0-b65f-46f1-a2b3-855e32ef70e6','kid','5296f779-bd54-4a14-adf4-09ef052d38ab'),('d3eab4e1-874e-494a-9087-35967b30f6d5','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d4ee56d5-0ec2-4aba-8ab8-77e881a10836','b75485a4-f673-4081-9238-4b5e7f5eb222','max-clients','200'),('d9ff9061-c051-4a12-8aa8-1214bcd85db5','20217c77-2196-4ae6-9d79-e799d807904c','kid','3cb4e55a-a663-46ba-994f-f6b9a4bf76cb'),('db93a13a-728b-44a7-bbbe-68fc2fc25bce','0098e192-5eea-4102-bbf0-f69798acea5d','host-sending-registration-request-must-match','true'),('dd038dca-763f-41aa-91f9-f3668dea8015','edf1f996-4f24-4716-b7d9-7b579e444244','max-clients','200'),('e2aeba8c-54c9-4826-a1bb-e09f2413b88f','0bac2d08-a013-4ac3-b431-7c09300caadd','allow-default-scopes','true'),('e3c0e8ee-9358-4fbb-bca0-82f17869a6d9','191d0c7d-eb3e-4142-b8de-86005ccbecfb','priority','100'),('e4a1e520-ece5-4c7f-a919-07602f9b3cad','191d0c7d-eb3e-4142-b8de-86005ccbecfb','keyUse','SIG'),('ea149a21-4342-4a82-9da8-d197d57b5bd6','0bfdf09e-d23d-4d49-9814-08741ba051a8','priority','100'),('ec4f72d5-b7f8-48f7-92ad-608522d0ed5e','18218831-6489-4106-8e5e-e12b24f2e907','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('ecfa78f8-d54c-443a-b299-ea4695e401af','3f1dbb76-7ea9-4bdd-964f-052c99103680','certificate','MIICmzCCAYMCBgGMPJi4+jANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjA2MDA0NjMxWhcNMzMxMjA2MDA0ODExWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCZX3yDlylUO7HQpUbfQqCUzSCsD8Zuu98MQquvSRqoX4FN3gXzW5ZPc/wEQUCpXwGsrvzpp8eIvo+mKsIoWeVq8HFtdYILPqSfk1cuTNczOinPrzOV5W5SfvU4dLOM6L/4jJRYEtgEE6yEfuieKDEpUgpWLd4Az7kQVs1dS4xJeA0RW3p+cf3WEZlP0tNEeQihwASM+qgr/b9uiLroiVJJ9miHZ7Rn8l8hUKBMQfA0CfftaCWWEXYBiEfug7wWFScG2m4T0jKZMkOPoCMQQqi1bByI+AEWV1Qmv6JXeK482BtzTK6H2r66Flvy2pkuiuRVAq/YsDbwj/qy4wTPYQ8tAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAA7tfFZ8ao94mrlNXuYi+Kj1vRYNpLRqEjc7sRUnURUVdsE9HLcVnq+PWnYNKf9bjuzxZhyYwFyov2xS/DHDvYragn20L8RD7t2IhW8Pjg9n73zxk/pE5c+pkOxC/qQyvZq0Yky11d1Iwi1jCNMV78dyy64PR2idw9KCZYbCsq4FaezBvkl+So9M00CisagQjyAaRBrlnNdn/omhOaZ0WyK7ECuk+1844i4h+jLqXsZWYFWJ8H4VDPiiT/FE4Yle3N+jTjebUJsYAGR4qDhifQulu5B5FT3DqkBXX59EZndiBKvk1gH6LdJqEFe9UUD3raLWHcHpKYeIsm2iNHTGSL8='),('f1b85449-3d59-4190-8e16-dc6f45b77367','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-full-name-mapper'),('f76233f9-5ff6-4d5b-a9e9-d512de643a62','e2338303-271d-441c-8517-affc928eb419','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('f8949c55-6822-4ed0-aefb-63389e607cd2','191d0c7d-eb3e-4142-b8de-86005ccbecfb','certificate','MIICmzCCAYMCBgGMPJi3/TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjA2MDA0NjMwWhcNMzMxMjA2MDA0ODEwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC/hbBjDWMNiQDEGddbZ24mP8weQ9fcMj6QzBWhl5oGdBi9WzFc6vc246WGlTG4eKUIc9EG4wEzPGPc+qEu9FMfmsO3nv6V3mAxPuYHPamQ5zrkDD/02hBj9W1KbzNkXkJ9LIwPcft4lBitu/fou0gVFM1N4mA17yAM8vPoZZSp3bC/STfv1AUAeJxcMlA5bQ6RmHE0IbMz4dcH41UAv8zNtJwyXlecybGFLGBXa1mYrCPr6AEZSOavFvFkvyOMJjbDvJb9ackQDh9aBt3r4IYsGaXqpdHAGI90p47mfD1a7etcGC384K8jdXsGoqX7rj5Vq4fYvNOTv6/poaJ1wy6lAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAK8lH9zwRs/paaSWhNqB3ksOmm6ijjtEg1K0+L7lUpXQqx/iLYLH7Dp6q5op0QiD3ppPTtlhxMgM5yIGad7la/v8qh1sDbE/L4fnbmm2hfRE/qdoXu0if+V17MArVbnpLQ3fKrqGNJiL/cQbpCLo43PUJl2ijb/WVvKzu95a4+TirPorBw7JcRkNZDR619zpeP2MpJqcIJVSxUJnMlT0xmkvMJ9S48hs43dEt854kj9AP+7TA4FMs9D64+mcL05AjnmerDuPITB3EZu31ySjjcezBFUqzSaRv3k4EwALHSXjz23q+vFTGwjLtwfPylWJfX2R7QEe0Bzmkjrq5/ooNLI=');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('06da7389-c54e-46ca-a817-3112b0aa1028','0b12b935-5eec-4582-9f95-7018c5e375a7'),('06da7389-c54e-46ca-a817-3112b0aa1028','e3267088-6bbc-4dad-91ce-091a751c335f'),('11bdc714-eb1b-422f-a9eb-73401bf879ab','2236e865-6249-4c03-85c1-d3cea8368872'),('11bdc714-eb1b-422f-a9eb-73401bf879ab','598a500f-1e86-4910-8575-520676d6f5ff'),('23441edf-ba90-4e98-97d9-1869fcb77e00','bc3eeadd-303f-44d2-88c2-2117618b1e75'),('3330b946-e893-4f72-8fd8-20c62f849bb0','03fa82e9-92f4-4bdc-b384-a1c21ed0a4db'),('3330b946-e893-4f72-8fd8-20c62f849bb0','06da7389-c54e-46ca-a817-3112b0aa1028'),('3330b946-e893-4f72-8fd8-20c62f849bb0','0718a6ca-35f0-4dd2-9d3c-7d174397d47c'),('3330b946-e893-4f72-8fd8-20c62f849bb0','0b12b935-5eec-4582-9f95-7018c5e375a7'),('3330b946-e893-4f72-8fd8-20c62f849bb0','10bf1941-fc40-4825-a3c2-5e4c33a020c1'),('3330b946-e893-4f72-8fd8-20c62f849bb0','11bdc714-eb1b-422f-a9eb-73401bf879ab'),('3330b946-e893-4f72-8fd8-20c62f849bb0','1238df7c-63e9-4fb2-9b13-82adf172e207'),('3330b946-e893-4f72-8fd8-20c62f849bb0','210ffbd3-3061-4d40-8c21-6abbeb41d7b4'),('3330b946-e893-4f72-8fd8-20c62f849bb0','2236e865-6249-4c03-85c1-d3cea8368872'),('3330b946-e893-4f72-8fd8-20c62f849bb0','23441edf-ba90-4e98-97d9-1869fcb77e00'),('3330b946-e893-4f72-8fd8-20c62f849bb0','2f4b5916-567b-4da1-81d9-859883b65089'),('3330b946-e893-4f72-8fd8-20c62f849bb0','3035d595-ea45-4d0b-9b68-c86a0f9d41bb'),('3330b946-e893-4f72-8fd8-20c62f849bb0','485d1b39-c409-4b4e-8841-f2d008865de1'),('3330b946-e893-4f72-8fd8-20c62f849bb0','55f78d27-d701-44b5-b27e-322e03f11f12'),('3330b946-e893-4f72-8fd8-20c62f849bb0','598a500f-1e86-4910-8575-520676d6f5ff'),('3330b946-e893-4f72-8fd8-20c62f849bb0','5eac8a6d-d7d2-450d-8218-3bf574b5308e'),('3330b946-e893-4f72-8fd8-20c62f849bb0','70a382a2-42fb-43b7-aadc-cd3a31678a5c'),('3330b946-e893-4f72-8fd8-20c62f849bb0','9b095afc-9cc4-455c-bd70-991dffad5932'),('3330b946-e893-4f72-8fd8-20c62f849bb0','9edaf120-08ad-47f3-ad5a-dab8970cd013'),('3330b946-e893-4f72-8fd8-20c62f849bb0','a187a6a7-0387-481e-baae-dbf0e9b36ff4'),('3330b946-e893-4f72-8fd8-20c62f849bb0','a6ce68f8-65bf-4eb9-af07-4daedf7ce80b'),('3330b946-e893-4f72-8fd8-20c62f849bb0','a72943dd-b8d0-482f-a4f5-abb04941c827'),('3330b946-e893-4f72-8fd8-20c62f849bb0','ab8fb2bf-b53e-46e3-93c4-c806572896d9'),('3330b946-e893-4f72-8fd8-20c62f849bb0','b3d1a2b5-fc9c-41a0-b2bd-2efcfcab7104'),('3330b946-e893-4f72-8fd8-20c62f849bb0','b5af4c6a-35ac-4065-b77b-ca81d1c4a9cf'),('3330b946-e893-4f72-8fd8-20c62f849bb0','bb848e2e-3b03-4990-9a8e-66e55c92cbe6'),('3330b946-e893-4f72-8fd8-20c62f849bb0','bc3eeadd-303f-44d2-88c2-2117618b1e75'),('3330b946-e893-4f72-8fd8-20c62f849bb0','c3314d62-3b4e-4119-a09a-b8982fc90a22'),('3330b946-e893-4f72-8fd8-20c62f849bb0','c3d0d532-557b-47a9-9469-33998f246a18'),('3330b946-e893-4f72-8fd8-20c62f849bb0','cdc2c0bc-e947-4d4c-bc5a-ee9efd86fa15'),('3330b946-e893-4f72-8fd8-20c62f849bb0','dffc5142-b4a7-462b-8db1-a0d728e0029d'),('3330b946-e893-4f72-8fd8-20c62f849bb0','e3267088-6bbc-4dad-91ce-091a751c335f'),('3330b946-e893-4f72-8fd8-20c62f849bb0','ef7fd69d-2f6e-4d5d-af6d-d18d8595542d'),('3330b946-e893-4f72-8fd8-20c62f849bb0','f0d90b87-90a6-40aa-89cd-c95a34d94d86'),('3330b946-e893-4f72-8fd8-20c62f849bb0','f154781e-f5f8-4a03-9471-f4257a7a3afb'),('3330b946-e893-4f72-8fd8-20c62f849bb0','f2560252-d3c6-4e83-85ad-3ed671cab9f1'),('3330b946-e893-4f72-8fd8-20c62f849bb0','ff0561cf-f07e-4be0-ab1f-8ce743f77138'),('54d5c122-1802-4139-b68d-e2cec2facbb8','09c39e33-cc18-4493-b30a-958b5ccb54aa'),('55c43002-4c16-49ef-87a5-30deaa22314b','8748520e-df8c-448c-b03a-f7e53b6bf973'),('55c43002-4c16-49ef-87a5-30deaa22314b','8f22b474-5230-47a1-82d1-922f73a786e9'),('55c43002-4c16-49ef-87a5-30deaa22314b','92e0c80c-ed04-427a-89da-e936808b8d09'),('55c43002-4c16-49ef-87a5-30deaa22314b','f1a73bfd-e4f4-4346-bf47-0e92b3941990'),('70d0fe77-e963-453b-935e-6984d04c3ea2','029be5cf-c565-4b6d-b87a-cfde88ad29b0'),('7342c3fb-d425-45c9-990c-485e7fd11146','034bfe8d-3892-457e-8675-2a57c4aff360'),('7342c3fb-d425-45c9-990c-485e7fd11146','2d5c5870-e0f2-4730-bd97-b189e09702a5'),('7342c3fb-d425-45c9-990c-485e7fd11146','ae1324c5-49ec-45ed-871a-ff7d269711ff'),('7342c3fb-d425-45c9-990c-485e7fd11146','cb0354af-2561-4d98-bd6e-e630326583a4'),('92e0c80c-ed04-427a-89da-e936808b8d09','2026770f-d9f4-45c6-ad72-901d39ebf1a4'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','26084389-cab9-45fa-93ea-66f47fcdbbd1'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','285bf1b2-c1b4-4581-a161-bd23ac640baa'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','345907e8-7f50-43f5-9c81-624da4d4942b'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','48533797-37fb-479c-b4aa-4f054faed6ac'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','5d43716f-3ca5-48da-9d7d-739f529096dd'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','7460cf09-2886-4829-bcd0-5ccaa42dbd57'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','75b816a1-3b66-4c03-b75a-8b772946c711'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','7d2dda07-06ff-4d4f-89d3-820498596b27'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','a2a6d51e-21d2-43af-8939-bc8358d562b8'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','a633afdc-9331-4419-953e-69c90773f17e'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b4818dfb-4434-41fa-9600-434ca3f5442f'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b54bfb8c-12c5-4d91-8d17-8913208e6765'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b5d2075c-edf2-4415-b121-87b1bd4286f7'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b9839a7b-b519-4c27-bf9f-396e5bb51bb2'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','ca0b5753-e677-420d-bb53-0fc590c08c1e'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d118260b-b1fe-41b8-83e3-48f76748d0fc'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d7263fd7-1aa8-471a-a562-2576e6a886dd'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','f054da5a-1733-4542-b8da-4ba49f1b89ce'),('ab897db6-9f99-4ac5-ba48-69be3d642d71','243348db-0bcb-4ff7-af7e-ee6b55e26491'),('b4818dfb-4434-41fa-9600-434ca3f5442f','7d2dda07-06ff-4d4f-89d3-820498596b27'),('b4818dfb-4434-41fa-9600-434ca3f5442f','a633afdc-9331-4419-953e-69c90773f17e'),('c3314d62-3b4e-4119-a09a-b8982fc90a22','ef7fd69d-2f6e-4d5d-af6d-d18d8595542d'),('cb0354af-2561-4d98-bd6e-e630326583a4','6c73a76c-c487-4ecb-a54f-240458f53074'),('d118260b-b1fe-41b8-83e3-48f76748d0fc','d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf'),('dea41763-6811-47a0-a1e9-0652e7487c4f','7a33b7d5-afac-418a-ba38-3a4d696d4cbe');
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
INSERT INTO `CREDENTIAL` VALUES ('1a871b51-0e1c-4e28-a9ba-4ab0c2945903',NULL,'password','8ec3edf3-548b-49a9-af1a-503b82290fb1',1701823781349,NULL,'{\"value\":\"Ll0Uo861GuGtBLugSY4mcyuqYa9zYg6OncRvfqmCYhX7r9JwVqocF1s4k3lY5bDyvM+OR8Hac/ePJRlrZoSkFw==\",\"salt\":\"lrpWWfke30qA27D5Up4moA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('20398887-dea4-4192-8bcb-ececb1785586',NULL,'password','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6',1701823691831,NULL,'{\"value\":\"QlDvH8aH1fk9IhvNsKTXIi2mngapPYl6cbnJ3RMrpB35SnQ5p2av4G2H7iLzZLdExsofoCYYWnrEz4oXCiqKZA==\",\"salt\":\"UqdZu6FzFKPCslklb2fG+w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('80bdfd0f-ca86-4f4d-bf22-b3977fcfa2aa',NULL,'password','ce388a86-5241-4fd7-9659-0f5b56be13ec',1701823974970,NULL,'{\"value\":\"mXFy8oJwSQcgnmF9/7NbwweeV371Ckof+tJF3L6f3ra0Zns5S25p796MTkR8kvRXCkD22XU5FsNGUVHUExwfUg==\",\"salt\":\"NVCXeHpniCw2TfRlUfedyg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('88f1d337-c2ec-4a94-ba6c-c4f6d5bfa9e5',NULL,'password','47f00eeb-cbbf-40a9-9406-8925fcd161c1',1701823821275,NULL,'{\"value\":\"/Rt0uJrMLB4EAl4cgw2+i/3qt87Ih07p2+DWxe6wUdk3e2EYJaoHXtQ/ixW7CKIfYENxJ/aAeQpwit1JdTr55A==\",\"salt\":\"/O1VuuYnXecqABi62AdBPQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-12-06 00:47:00',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-12-06 00:47:00',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-12-06 00:47:02',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-12-06 00:47:02',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-12-06 00:47:07',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-12-06 00:47:07',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-12-06 00:47:11',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-12-06 00:47:11',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-12-06 00:47:11',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-12-06 00:47:16',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-12-06 00:47:18',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-12-06 00:47:18',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-12-06 00:47:18',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-06 00:47:19',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-06 00:47:19',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-06 00:47:19',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-06 00:47:19',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-12-06 00:47:22',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-12-06 00:47:24',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-12-06 00:47:24',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-06 00:47:24',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-06 00:47:24',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-12-06 00:47:25',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-12-06 00:47:25',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-12-06 00:47:25',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1823609773'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-12-06 00:47:26',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-12-06 00:47:30',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-12-06 00:47:30',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1823609773'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-12-06 00:47:32',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-12-06 00:47:33',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-12-06 00:47:34',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-12-06 00:47:34',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'1823609773'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-06 00:47:34',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1823609773'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-06 00:47:34',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-06 00:47:38',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-12-06 00:47:38',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1823609773'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-06 00:47:38',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1823609773'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-12-06 00:47:38',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-12-06 00:47:38',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-06 00:47:38',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-06 00:47:38',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-12-06 00:47:38',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-06 00:47:41',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-12-06 00:47:41',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-06 00:47:41',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-06 00:47:41',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-06 00:47:41',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-06 00:47:44',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-06 00:47:44',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-12-06 00:47:47',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-12-06 00:47:48',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-12-06 00:47:48',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-12-06 00:47:48',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1823609773'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-12-06 00:47:48',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-06 00:47:48',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-06 00:47:48',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-06 00:47:49',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-06 00:47:54',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-12-06 00:47:56',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-12-06 00:47:56',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-06 00:47:56',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-06 00:47:57',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-12-06 00:47:57',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-12-06 00:47:57',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-06 00:47:57',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-12-06 00:47:57',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-06 00:47:57',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-12-06 00:47:57',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-12-06 00:47:57',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-12-06 00:47:58',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1823609773'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-12-06 00:47:58',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'1823609773'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-06 00:47:58',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1823609773'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-06 00:47:58',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1823609773'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-06 00:47:58',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1823609773'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-06 00:47:59',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-06 00:47:59',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'1823609773'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-06 00:47:59',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1823609773'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-06 00:47:59',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-06 00:48:01',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-06 00:48:01',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-06 00:48:01',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1823609773'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-06 00:48:01',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1823609773'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-06 00:48:01',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1823609773'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-06 00:48:01',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1823609773'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-06 00:48:02',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1823609773'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-12-06 00:48:02',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'1823609773'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-06 00:48:02',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-06 00:48:02',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'1823609773'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-06 00:48:02',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'1823609773'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-06 00:48:02',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'1823609773'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-06 00:48:02',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1823609773'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-06 00:48:03',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-06 00:48:03',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'1823609773'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-06 00:48:03',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'1823609773'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-06 00:48:03',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'1823609773'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-06 00:48:03',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'1823609773'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-06 00:48:03',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1823609773'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-06 00:48:03',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1823609773'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-06 00:48:03',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1823609773'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-06 00:48:03',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1823609773'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-06 00:48:03',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1823609773'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-06 00:48:03',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'1823609773'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-06 00:48:03',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'1823609773'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-12-06 00:48:04',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'1823609773');
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
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','15c7c734-c1dd-4a7a-9334-e752916a644e',_binary ''),('master','226c058c-617b-4697-ae55-41df3e9ef711',_binary ''),('master','2556b4a5-e3fd-4245-8ff0-c63710d9ff98',_binary ''),('master','2f31bc60-363a-4acc-8511-fb77c47f1d77',_binary '\0'),('master','6233aad2-102b-4d66-bb1a-f652071f5949',_binary '\0'),('master','9976ea22-9d6e-40c5-8746-e1db89dc3192',_binary ''),('master','c3aa359f-ff32-494e-bda6-5155da9ff353',_binary '\0'),('master','c5628e6e-ae2b-4b9c-a2c7-9a698745eff0',_binary ''),('master','e1bf4e02-750a-43ee-9e2e-1f9fb899d4d0',_binary '\0'),('siglo21','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('siglo21','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('siglo21','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('siglo21','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('siglo21','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('siglo21','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('siglo21','b229e7fc-3666-4f8f-b02d-0f24dc04e851',_binary ''),('siglo21','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('siglo21','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_envios`
--

LOCK TABLES `detalles_envios` WRITE;
/*!40000 ALTER TABLE `detalles_envios` DISABLE KEYS */;
INSERT INTO `detalles_envios` VALUES (1,'Producto 1','FACTURA-1'),(2,'Producto 2','FACTURA-2'),(3,'Producto 3','FACTURA-3'),(4,'Producto 4','FACTURA-4'),(5,'Producto 5','FACTURA-5'),(6,'Producto 6','FACTURA-6'),(7,'Producto 7','FACTURA-7'),(8,'Producto 8','FACTURA-8'),(9,'Producto 9','FACTURA-9'),(10,'Producto 10','FACTURA-10');
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
INSERT INTO `envios` VALUES ('FACTURA-1','Calle 123','Entre Calle A y Calle B','1234',1,1,2),('FACTURA-10','Avenida Occidental','Entre Calle J y Calle M','8901',1,1,2),('FACTURA-2','Avenida Principal','Entre Calle X y Calle Y','5678',1,1,2),('FACTURA-3','Calle Principal','Entre Calle M y Calle N','9012',1,1,2),('FACTURA-4','Avenida Central','Entre Calle P y Calle Q','3456',1,1,2),('FACTURA-5','Calle Secundaria','Entre Calle K y Calle L','7890',1,1,2),('FACTURA-6','Avenida Norte','Entre Calle G y Calle H','2345',1,1,2),('FACTURA-7','Calle Este','Entre Calle U y Calle V','6789',1,1,2),('FACTURA-8','Avenida Oeste','Entre Calle D y Calle E','0123',1,1,2),('FACTURA-9','Calle Sur','Entre Calle R y Calle S','4567',1,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_hoja`
--

LOCK TABLES `estados_hoja` WRITE;
/*!40000 ALTER TABLE `estados_hoja` DISABLE KEYS */;
INSERT INTO `estados_hoja` VALUES (1,'EnPreparacion'),(2,'DeCamino'),(3,'Realizado');
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
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_reparto` date DEFAULT NULL,
  `patente_camion` varchar(255) DEFAULT NULL,
  `estado_hoja_del_dia_id` int DEFAULT NULL,
  `repartidor_id_repartidor` int DEFAULT NULL,
  PRIMARY KEY (`id_hoja_del_dia`),
  UNIQUE KEY `UK_c583q4cxg3pysororqabyu0yq` (`fecha_reparto`),
  KEY `FKe6eco77tsnvrw7yx0gf0oau4g` (`patente_camion`),
  KEY `FKidvjfl3e6fynbwk8hfmukruu5` (`estado_hoja_del_dia_id`),
  KEY `FKjeqvbe4vny1oi9b9h32i8j3l6` (`repartidor_id_repartidor`),
  CONSTRAINT `FKe6eco77tsnvrw7yx0gf0oau4g` FOREIGN KEY (`patente_camion`) REFERENCES `camiones` (`patente`),
  CONSTRAINT `FKidvjfl3e6fynbwk8hfmukruu5` FOREIGN KEY (`estado_hoja_del_dia_id`) REFERENCES `estados_hoja` (`id`),
  CONSTRAINT `FKjeqvbe4vny1oi9b9h32i8j3l6` FOREIGN KEY (`repartidor_id_repartidor`) REFERENCES `repartidores` (`id_repartidor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_del_dia`
--

LOCK TABLES `hojas_del_dia` WRITE;
/*!40000 ALTER TABLE `hojas_del_dia` DISABLE KEYS */;
INSERT INTO `hojas_del_dia` VALUES (1,'2023-12-05 22:10:30.370849','2023-12-06',NULL,1,NULL);
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
  KEY `FKhsgbd96lp45yutcwhvpx91p0y` (`envios_numero_factura`),
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
INSERT INTO `hojas_del_dia_envios` VALUES (1,'FACTURA-1'),(1,'FACTURA-10'),(1,'FACTURA-2'),(1,'FACTURA-3'),(1,'FACTURA-4'),(1,'FACTURA-5'),(1,'FACTURA-6'),(1,'FACTURA-7'),(1,'FACTURA-8'),(1,'FACTURA-9');
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('029be5cf-c565-4b6d-b87a-cfde88ad29b0','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-consent}','view-consent','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('034bfe8d-3892-457e-8675-2a57c4aff360','1d1bdb92-2e05-4081-949d-c2bccba13fb7',_binary '','${role_view-profile}','view-profile','master','1d1bdb92-2e05-4081-949d-c2bccba13fb7',NULL),('03fa82e9-92f4-4bdc-b384-a1c21ed0a4db','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_view-authorization}','view-authorization','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('06da7389-c54e-46ca-a817-3112b0aa1028','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_view-users}','view-users','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('0718a6ca-35f0-4dd2-9d3c-7d174397d47c','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_view-realm}','view-realm','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('09c39e33-cc18-4493-b30a-958b5ccb54aa','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','administrador-cliente-rol','administrador-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('0b12b935-5eec-4582-9f95-7018c5e375a7','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_query-groups}','query-groups','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('10bf1941-fc40-4825-a3c2-5e4c33a020c1','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_create-client}','create-client','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('11bdc714-eb1b-422f-a9eb-73401bf879ab','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_view-users}','view-users','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('1238df7c-63e9-4fb2-9b13-82adf172e207','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_impersonation}','impersonation','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('12cc4ee0-9194-49d7-bc7b-1309e107e4ce','0ca2e86b-131e-454d-95a7-c124ad72b7cb',_binary '','${role_read-token}','read-token','siglo21','0ca2e86b-131e-454d-95a7-c124ad72b7cb',NULL),('1d2ec522-27fb-4e11-9c7b-841598b2c88d','1d1bdb92-2e05-4081-949d-c2bccba13fb7',_binary '','${role_delete-account}','delete-account','master','1d1bdb92-2e05-4081-949d-c2bccba13fb7',NULL),('2026770f-d9f4-45c6-ad72-901d39ebf1a4','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-account-links}','manage-account-links','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('210ffbd3-3061-4d40-8c21-6abbeb41d7b4','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_view-identity-providers}','view-identity-providers','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('2236e865-6249-4c03-85c1-d3cea8368872','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_query-users}','query-users','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('23441edf-ba90-4e98-97d9-1869fcb77e00','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_view-clients}','view-clients','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('243348db-0bcb-4ff7-af7e-ee6b55e26491','1d1bdb92-2e05-4081-949d-c2bccba13fb7',_binary '','${role_view-consent}','view-consent','master','1d1bdb92-2e05-4081-949d-c2bccba13fb7',NULL),('26084389-cab9-45fa-93ea-66f47fcdbbd1','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','vendedor-cliente-rol','vendedor-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('285bf1b2-c1b4-4581-a161-bd23ac640baa','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-identity-providers}','manage-identity-providers','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('2d5c5870-e0f2-4730-bd97-b189e09702a5','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('2f4b5916-567b-4da1-81d9-859883b65089','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('3035d595-ea45-4d0b-9b68-c86a0f9d41bb','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_query-realms}','query-realms','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('3330b946-e893-4f72-8fd8-20c62f849bb0','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('345907e8-7f50-43f5-9c81-624da4d4942b','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-realm}','manage-realm','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('43237d65-1d6d-4eed-9b34-9f6eb5c9173d','1d1bdb92-2e05-4081-949d-c2bccba13fb7',_binary '','${role_view-applications}','view-applications','master','1d1bdb92-2e05-4081-949d-c2bccba13fb7',NULL),('48533797-37fb-479c-b4aa-4f054faed6ac','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-users}','manage-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('485d1b39-c409-4b4e-8841-f2d008865de1','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_manage-authorization}','manage-authorization','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('54d5c122-1802-4139-b68d-e2cec2facbb8','siglo21',_binary '\0','adminitrador de rol realm','administrador','siglo21',NULL,NULL),('55c43002-4c16-49ef-87a5-30deaa22314b','siglo21',_binary '\0','${role_default-roles}','default-roles-siglo21','siglo21',NULL,NULL),('55f78d27-d701-44b5-b27e-322e03f11f12','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_manage-authorization}','manage-authorization','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('5604aedf-9a48-4819-9a17-799c598ad5e0','6717d064-1e4d-4d6e-a574-66d465478cb3',_binary '','${role_read-token}','read-token','master','6717d064-1e4d-4d6e-a574-66d465478cb3',NULL),('598a500f-1e86-4910-8575-520676d6f5ff','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_query-groups}','query-groups','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('5d43716f-3ca5-48da-9d7d-739f529096dd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-clients}','manage-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('5eac8a6d-d7d2-450d-8218-3bf574b5308e','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_manage-events}','manage-events','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('61de6b38-c7ee-4258-b9f4-6deb8c558e17','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-applications}','view-applications','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('6c73a76c-c487-4ecb-a54f-240458f53074','1d1bdb92-2e05-4081-949d-c2bccba13fb7',_binary '','${role_manage-account-links}','manage-account-links','master','1d1bdb92-2e05-4081-949d-c2bccba13fb7',NULL),('70a382a2-42fb-43b7-aadc-cd3a31678a5c','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_manage-clients}','manage-clients','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('70d0fe77-e963-453b-935e-6984d04c3ea2','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-consent}','manage-consent','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('7342c3fb-d425-45c9-990c-485e7fd11146','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('7460cf09-2886-4829-bcd0-5ccaa42dbd57','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-authorization}','manage-authorization','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('75b816a1-3b66-4c03-b75a-8b772946c711','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-events}','manage-events','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('7a33b7d5-afac-418a-ba38-3a4d696d4cbe','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','repartidor-cliente-rol','repartidor-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('7d2dda07-06ff-4d4f-89d3-820498596b27','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-groups}','query-groups','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('8748520e-df8c-448c-b03a-f7e53b6bf973','siglo21',_binary '\0','${role_offline-access}','offline_access','siglo21',NULL,NULL),('8f22b474-5230-47a1-82d1-922f73a786e9','siglo21',_binary '\0','${role_uma_authorization}','uma_authorization','siglo21',NULL,NULL),('92e0c80c-ed04-427a-89da-e936808b8d09','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-account}','manage-account','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('9b095afc-9cc4-455c-bd70-991dffad5932','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_create-client}','create-client','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('9edaf120-08ad-47f3-ad5a-dab8970cd013','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_manage-realm}','manage-realm','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','siglo21',_binary '\0','','vendedor','siglo21',NULL,NULL),('a187a6a7-0387-481e-baae-dbf0e9b36ff4','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_view-authorization}','view-authorization','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('a2a6d51e-21d2-43af-8939-bc8358d562b8','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_impersonation}','impersonation','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_realm-admin}','realm-admin','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a633afdc-9331-4419-953e-69c90773f17e','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-users}','query-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a6ce68f8-65bf-4eb9-af07-4daedf7ce80b','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_view-events}','view-events','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('a72943dd-b8d0-482f-a4f5-abb04941c827','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_manage-realm}','manage-realm','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('ab897db6-9f99-4ac5-ba48-69be3d642d71','1d1bdb92-2e05-4081-949d-c2bccba13fb7',_binary '','${role_manage-consent}','manage-consent','master','1d1bdb92-2e05-4081-949d-c2bccba13fb7',NULL),('ab8fb2bf-b53e-46e3-93c4-c806572896d9','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_view-events}','view-events','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('ae1324c5-49ec-45ed-871a-ff7d269711ff','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('b3d1a2b5-fc9c-41a0-b2bd-2efcfcab7104','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_view-identity-providers}','view-identity-providers','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('b4818dfb-4434-41fa-9600-434ca3f5442f','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-users}','view-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b54bfb8c-12c5-4d91-8d17-8913208e6765','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_create-client}','create-client','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b5af4c6a-35ac-4065-b77b-ca81d1c4a9cf','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('b5d2075c-edf2-4415-b121-87b1bd4286f7','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-events}','view-events','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b9839a7b-b519-4c27-bf9f-396e5bb51bb2','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-authorization}','view-authorization','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('bb848e2e-3b03-4990-9a8e-66e55c92cbe6','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_manage-clients}','manage-clients','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('bc3eeadd-303f-44d2-88c2-2117618b1e75','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_query-clients}','query-clients','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('c3314d62-3b4e-4119-a09a-b8982fc90a22','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_view-clients}','view-clients','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('c3d0d532-557b-47a9-9469-33998f246a18','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_query-realms}','query-realms','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('ca0b5753-e677-420d-bb53-0fc590c08c1e','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-realm}','view-realm','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('cb0354af-2561-4d98-bd6e-e630326583a4','1d1bdb92-2e05-4081-949d-c2bccba13fb7',_binary '','${role_manage-account}','manage-account','master','1d1bdb92-2e05-4081-949d-c2bccba13fb7',NULL),('cdc2c0bc-e947-4d4c-bc5a-ee9efd86fa15','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_manage-users}','manage-users','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('d118260b-b1fe-41b8-83e3-48f76748d0fc','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-clients}','view-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-clients}','query-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d7263fd7-1aa8-471a-a562-2576e6a886dd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-realms}','query-realms','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d8d693d5-a021-427f-8151-fad696e79b50','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_delete-account}','delete-account','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('dea41763-6811-47a0-a1e9-0652e7487c4f','siglo21',_binary '\0',NULL,'repartidor','siglo21',NULL,NULL),('dffc5142-b4a7-462b-8db1-a0d728e0029d','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_view-realm}','view-realm','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('e3267088-6bbc-4dad-91ce-091a751c335f','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_query-users}','query-users','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('ef7fd69d-2f6e-4d5d-af6d-d18d8595542d','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_query-clients}','query-clients','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('f054da5a-1733-4542-b8da-4ba49f1b89ce','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-identity-providers}','view-identity-providers','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('f0d90b87-90a6-40aa-89cd-c95a34d94d86','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('f154781e-f5f8-4a03-9471-f4257a7a3afb','24cde013-9584-4109-bd68-b860e38e0440',_binary '','${role_impersonation}','impersonation','master','24cde013-9584-4109-bd68-b860e38e0440',NULL),('f1a73bfd-e4f4-4346-bf47-0e92b3941990','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-profile}','view-profile','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('f2560252-d3c6-4e83-85ad-3ed671cab9f1','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_manage-events}','manage-events','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL),('ff0561cf-f07e-4be0-ab1f-8ce743f77138','5c0ce054-9026-4e6b-a349-affb1a86380f',_binary '','${role_manage-users}','manage-users','master','5c0ce054-9026-4e6b-a349-affb1a86380f',NULL);
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
INSERT INTO `MIGRATION_MODEL` VALUES ('eq8x7','16.1.1',1701823688);
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','openid-connect','oidc-usermodel-property-mapper',NULL,'313cd6d5-afa3-4d09-bec6-8e059c9718c3'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'80a98201-a009-4f95-a8d9-67b46623f54d'),('0b86857c-9385-4ea9-9f00-3ea98898b883','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('0c3baa45-c8c9-401b-9e31-a974826361e5','audience resolve','openid-connect','oidc-audience-resolve-mapper','78d508a8-6ec9-4316-ad3c-fead0d01517b',NULL),('13d1e141-77af-496a-862f-7f68ceee4460','username','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('14574af9-ba1e-48ca-b1f1-f0d5543671bb','locale','openid-connect','oidc-usermodel-attribute-mapper','d00686de-ac18-418c-a0f5-bc9175a3e29f',NULL),('154bfaeb-9790-4b77-8fb8-61dcfd248feb','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'226c058c-617b-4697-ae55-41df3e9ef711'),('17b080be-49b5-4046-918b-431bdf551b67','audience resolve','openid-connect','oidc-audience-resolve-mapper','30cf30bd-693f-4790-bcd9-7d0b90bb8d5a',NULL),('17d78270-632b-47ce-82ce-47d1cbe75131','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'c3aa359f-ff32-494e-bda6-5155da9ff353'),('1899b95c-44da-4add-abea-6885c7648271','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'28963099-19d3-4521-a02f-976d9671e893'),('1904a8af-7df3-4385-8fcc-9e577f93362b','full name','openid-connect','oidc-full-name-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('1aff9f99-72d2-48bc-9c0e-8cc77de00a9e','address','openid-connect','oidc-address-mapper',NULL,'2f31bc60-363a-4acc-8511-fb77c47f1d77'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('2711fa14-e18c-4e50-9797-c4c03d10599f','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('29438da0-315c-45aa-9061-7746502f6008','address','openid-connect','oidc-address-mapper',NULL,'da127315-5241-4a8f-a46a-6bea0de8925e'),('2e1c5de1-1dc1-4ca2-b07c-153eec178b91','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c3aa359f-ff32-494e-bda6-5155da9ff353'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'313cd6d5-afa3-4d09-bec6-8e059c9718c3'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('432acee5-836c-44e0-8f8a-6ab765801d1f','role list','saml','saml-role-list-mapper',NULL,'b229e7fc-3666-4f8f-b02d-0f24dc04e851'),('43762ea6-7e88-4edf-a1d4-faff5cbe39d3','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('4c2a84bc-f171-4a08-b71f-8f4e4b6d7cc6','email','openid-connect','oidc-usermodel-property-mapper',NULL,'226c058c-617b-4697-ae55-41df3e9ef711'),('542d5639-3340-4558-8aff-0b4d5fa49b61','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('734ebc5d-95d1-496e-9952-17066ad99f50','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','openid-connect','oidc-usermodel-attribute-mapper','42ce5f39-f315-496d-881f-7de13ac3ae08',NULL),('7f25053f-3b0c-403d-ba1e-77ad5cd6588a','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('82c2043a-92a3-4489-bb61-e8cd5c6228fe','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('85f334ef-d78d-453d-861c-95fac016f3dc','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('8757c43a-3361-4d1d-92d0-a8518ad66ab9','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('8cf3e8e7-3e44-419a-8cee-366efc6b6485','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6233aad2-102b-4d66-bb1a-f652071f5949'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('9167abed-9034-47b5-aa8f-48ca47ca0adb','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'c5628e6e-ae2b-4b9c-a2c7-9a698745eff0'),('944ac98f-42ce-4568-8e4e-de1595524b3d','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('94882d67-9ba3-4354-b2cb-a021434813b1','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('9da9eeea-0f27-4f15-b7d1-06f20c9c8b55','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6233aad2-102b-4d66-bb1a-f652071f5949'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('ac9790c2-d8f8-4a29-9c06-2c9da5f5da7f','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('b47ee6e2-f698-46da-8409-0b8a1fe776d8','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','full name','openid-connect','oidc-full-name-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('bc99959b-7558-4797-b663-39676e5935b1','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'80a98201-a009-4f95-a8d9-67b46623f54d'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'28963099-19d3-4521-a02f-976d9671e893'),('c5c6ee6b-f9db-4e03-a462-e640c82fe414','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'2556b4a5-e3fd-4245-8ff0-c63710d9ff98'),('c6eb1289-fded-454e-af61-796c821d04ff','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e'),('d7aec728-30d6-40d0-b394-4d34cf6c5ce5','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'c5628e6e-ae2b-4b9c-a2c7-9a698745eff0'),('d8951284-ffd8-4f4f-9f1b-94ac177b203d','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'b39fe518-d02f-4eac-942b-eeddf878c80f'),('df443265-82bc-4ad0-a541-ed40d1eb5b21','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c5628e6e-ae2b-4b9c-a2c7-9a698745eff0'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('edae1e1e-2800-4b67-b930-59edf0a309d8','role list','saml','saml-role-list-mapper',NULL,'9976ea22-9d6e-40c5-8746-e1db89dc3192'),('fbd1b91f-4e76-4da0-94d2-780b7bec83b2','username','openid-connect','oidc-usermodel-property-mapper',NULL,'15c7c734-c1dd-4a7a-9334-e752916a644e');
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','access.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','claim.name'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','id.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','String','jsonType.label'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','user.attribute'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','userinfo.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','access.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middle_name','claim.name'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','id.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','String','jsonType.label'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middleName','user.attribute'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','userinfo.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','access.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','upn','claim.name'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','id.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','String','jsonType.label'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','username','user.attribute'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','userinfo.token.claim'),('0b86857c-9385-4ea9-9f00-3ea98898b883','true','access.token.claim'),('0b86857c-9385-4ea9-9f00-3ea98898b883','nickname','claim.name'),('0b86857c-9385-4ea9-9f00-3ea98898b883','true','id.token.claim'),('0b86857c-9385-4ea9-9f00-3ea98898b883','String','jsonType.label'),('0b86857c-9385-4ea9-9f00-3ea98898b883','nickname','user.attribute'),('0b86857c-9385-4ea9-9f00-3ea98898b883','true','userinfo.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','true','access.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','preferred_username','claim.name'),('13d1e141-77af-496a-862f-7f68ceee4460','true','id.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','String','jsonType.label'),('13d1e141-77af-496a-862f-7f68ceee4460','username','user.attribute'),('13d1e141-77af-496a-862f-7f68ceee4460','true','userinfo.token.claim'),('14574af9-ba1e-48ca-b1f1-f0d5543671bb','true','access.token.claim'),('14574af9-ba1e-48ca-b1f1-f0d5543671bb','locale','claim.name'),('14574af9-ba1e-48ca-b1f1-f0d5543671bb','true','id.token.claim'),('14574af9-ba1e-48ca-b1f1-f0d5543671bb','String','jsonType.label'),('14574af9-ba1e-48ca-b1f1-f0d5543671bb','locale','user.attribute'),('14574af9-ba1e-48ca-b1f1-f0d5543671bb','true','userinfo.token.claim'),('154bfaeb-9790-4b77-8fb8-61dcfd248feb','true','access.token.claim'),('154bfaeb-9790-4b77-8fb8-61dcfd248feb','email_verified','claim.name'),('154bfaeb-9790-4b77-8fb8-61dcfd248feb','true','id.token.claim'),('154bfaeb-9790-4b77-8fb8-61dcfd248feb','boolean','jsonType.label'),('154bfaeb-9790-4b77-8fb8-61dcfd248feb','emailVerified','user.attribute'),('154bfaeb-9790-4b77-8fb8-61dcfd248feb','true','userinfo.token.claim'),('17d78270-632b-47ce-82ce-47d1cbe75131','true','access.token.claim'),('17d78270-632b-47ce-82ce-47d1cbe75131','upn','claim.name'),('17d78270-632b-47ce-82ce-47d1cbe75131','true','id.token.claim'),('17d78270-632b-47ce-82ce-47d1cbe75131','String','jsonType.label'),('17d78270-632b-47ce-82ce-47d1cbe75131','username','user.attribute'),('17d78270-632b-47ce-82ce-47d1cbe75131','true','userinfo.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','true','access.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','phone_number_verified','claim.name'),('1899b95c-44da-4add-abea-6885c7648271','true','id.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','boolean','jsonType.label'),('1899b95c-44da-4add-abea-6885c7648271','phoneNumberVerified','user.attribute'),('1899b95c-44da-4add-abea-6885c7648271','true','userinfo.token.claim'),('1904a8af-7df3-4385-8fcc-9e577f93362b','true','access.token.claim'),('1904a8af-7df3-4385-8fcc-9e577f93362b','true','id.token.claim'),('1904a8af-7df3-4385-8fcc-9e577f93362b','true','userinfo.token.claim'),('1aff9f99-72d2-48bc-9c0e-8cc77de00a9e','true','access.token.claim'),('1aff9f99-72d2-48bc-9c0e-8cc77de00a9e','true','id.token.claim'),('1aff9f99-72d2-48bc-9c0e-8cc77de00a9e','country','user.attribute.country'),('1aff9f99-72d2-48bc-9c0e-8cc77de00a9e','formatted','user.attribute.formatted'),('1aff9f99-72d2-48bc-9c0e-8cc77de00a9e','locality','user.attribute.locality'),('1aff9f99-72d2-48bc-9c0e-8cc77de00a9e','postal_code','user.attribute.postal_code'),('1aff9f99-72d2-48bc-9c0e-8cc77de00a9e','region','user.attribute.region'),('1aff9f99-72d2-48bc-9c0e-8cc77de00a9e','street','user.attribute.street'),('1aff9f99-72d2-48bc-9c0e-8cc77de00a9e','true','userinfo.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','access.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','claim.name'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','id.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','String','jsonType.label'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','user.attribute'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','userinfo.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','access.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','given_name','claim.name'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','id.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','String','jsonType.label'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','firstName','user.attribute'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','userinfo.token.claim'),('2711fa14-e18c-4e50-9797-c4c03d10599f','true','access.token.claim'),('2711fa14-e18c-4e50-9797-c4c03d10599f','updated_at','claim.name'),('2711fa14-e18c-4e50-9797-c4c03d10599f','true','id.token.claim'),('2711fa14-e18c-4e50-9797-c4c03d10599f','String','jsonType.label'),('2711fa14-e18c-4e50-9797-c4c03d10599f','updatedAt','user.attribute'),('2711fa14-e18c-4e50-9797-c4c03d10599f','true','userinfo.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','true','access.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','true','id.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','country','user.attribute.country'),('29438da0-315c-45aa-9061-7746502f6008','formatted','user.attribute.formatted'),('29438da0-315c-45aa-9061-7746502f6008','locality','user.attribute.locality'),('29438da0-315c-45aa-9061-7746502f6008','postal_code','user.attribute.postal_code'),('29438da0-315c-45aa-9061-7746502f6008','region','user.attribute.region'),('29438da0-315c-45aa-9061-7746502f6008','street','user.attribute.street'),('29438da0-315c-45aa-9061-7746502f6008','true','userinfo.token.claim'),('2e1c5de1-1dc1-4ca2-b07c-153eec178b91','true','access.token.claim'),('2e1c5de1-1dc1-4ca2-b07c-153eec178b91','groups','claim.name'),('2e1c5de1-1dc1-4ca2-b07c-153eec178b91','true','id.token.claim'),('2e1c5de1-1dc1-4ca2-b07c-153eec178b91','String','jsonType.label'),('2e1c5de1-1dc1-4ca2-b07c-153eec178b91','true','multivalued'),('2e1c5de1-1dc1-4ca2-b07c-153eec178b91','foo','user.attribute'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','access.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','email_verified','claim.name'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','id.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','boolean','jsonType.label'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','emailVerified','user.attribute'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','userinfo.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','access.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','claim.name'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','id.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','String','jsonType.label'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','user.attribute'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','userinfo.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','access.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','claim.name'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','id.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','String','jsonType.label'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','user.attribute'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','userinfo.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','access.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','claim.name'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','id.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','String','jsonType.label'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','user.attribute'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','userinfo.token.claim'),('432acee5-836c-44e0-8f8a-6ab765801d1f','Role','attribute.name'),('432acee5-836c-44e0-8f8a-6ab765801d1f','Basic','attribute.nameformat'),('432acee5-836c-44e0-8f8a-6ab765801d1f','false','single'),('43762ea6-7e88-4edf-a1d4-faff5cbe39d3','true','access.token.claim'),('43762ea6-7e88-4edf-a1d4-faff5cbe39d3','locale','claim.name'),('43762ea6-7e88-4edf-a1d4-faff5cbe39d3','true','id.token.claim'),('43762ea6-7e88-4edf-a1d4-faff5cbe39d3','String','jsonType.label'),('43762ea6-7e88-4edf-a1d4-faff5cbe39d3','locale','user.attribute'),('43762ea6-7e88-4edf-a1d4-faff5cbe39d3','true','userinfo.token.claim'),('4c2a84bc-f171-4a08-b71f-8f4e4b6d7cc6','true','access.token.claim'),('4c2a84bc-f171-4a08-b71f-8f4e4b6d7cc6','email','claim.name'),('4c2a84bc-f171-4a08-b71f-8f4e4b6d7cc6','true','id.token.claim'),('4c2a84bc-f171-4a08-b71f-8f4e4b6d7cc6','String','jsonType.label'),('4c2a84bc-f171-4a08-b71f-8f4e4b6d7cc6','email','user.attribute'),('4c2a84bc-f171-4a08-b71f-8f4e4b6d7cc6','true','userinfo.token.claim'),('542d5639-3340-4558-8aff-0b4d5fa49b61','true','access.token.claim'),('542d5639-3340-4558-8aff-0b4d5fa49b61','birthdate','claim.name'),('542d5639-3340-4558-8aff-0b4d5fa49b61','true','id.token.claim'),('542d5639-3340-4558-8aff-0b4d5fa49b61','String','jsonType.label'),('542d5639-3340-4558-8aff-0b4d5fa49b61','birthdate','user.attribute'),('542d5639-3340-4558-8aff-0b4d5fa49b61','true','userinfo.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','access.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','claim.name'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','id.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','String','jsonType.label'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','user.attribute'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','userinfo.token.claim'),('734ebc5d-95d1-496e-9952-17066ad99f50','true','access.token.claim'),('734ebc5d-95d1-496e-9952-17066ad99f50','realm_access.roles','claim.name'),('734ebc5d-95d1-496e-9952-17066ad99f50','String','jsonType.label'),('734ebc5d-95d1-496e-9952-17066ad99f50','true','multivalued'),('734ebc5d-95d1-496e-9952-17066ad99f50','foo','user.attribute'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','access.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','claim.name'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','id.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','String','jsonType.label'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','user.attribute'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','userinfo.token.claim'),('7f25053f-3b0c-403d-ba1e-77ad5cd6588a','true','access.token.claim'),('7f25053f-3b0c-403d-ba1e-77ad5cd6588a','gender','claim.name'),('7f25053f-3b0c-403d-ba1e-77ad5cd6588a','true','id.token.claim'),('7f25053f-3b0c-403d-ba1e-77ad5cd6588a','String','jsonType.label'),('7f25053f-3b0c-403d-ba1e-77ad5cd6588a','gender','user.attribute'),('7f25053f-3b0c-403d-ba1e-77ad5cd6588a','true','userinfo.token.claim'),('82c2043a-92a3-4489-bb61-e8cd5c6228fe','true','access.token.claim'),('82c2043a-92a3-4489-bb61-e8cd5c6228fe','middle_name','claim.name'),('82c2043a-92a3-4489-bb61-e8cd5c6228fe','true','id.token.claim'),('82c2043a-92a3-4489-bb61-e8cd5c6228fe','String','jsonType.label'),('82c2043a-92a3-4489-bb61-e8cd5c6228fe','middleName','user.attribute'),('82c2043a-92a3-4489-bb61-e8cd5c6228fe','true','userinfo.token.claim'),('85f334ef-d78d-453d-861c-95fac016f3dc','true','access.token.claim'),('85f334ef-d78d-453d-861c-95fac016f3dc','given_name','claim.name'),('85f334ef-d78d-453d-861c-95fac016f3dc','true','id.token.claim'),('85f334ef-d78d-453d-861c-95fac016f3dc','String','jsonType.label'),('85f334ef-d78d-453d-861c-95fac016f3dc','firstName','user.attribute'),('85f334ef-d78d-453d-861c-95fac016f3dc','true','userinfo.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','true','access.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','claim.name'),('874cfa64-4ead-4591-b389-5681dc18986c','true','id.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','String','jsonType.label'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','user.attribute'),('874cfa64-4ead-4591-b389-5681dc18986c','true','userinfo.token.claim'),('8757c43a-3361-4d1d-92d0-a8518ad66ab9','true','access.token.claim'),('8757c43a-3361-4d1d-92d0-a8518ad66ab9','picture','claim.name'),('8757c43a-3361-4d1d-92d0-a8518ad66ab9','true','id.token.claim'),('8757c43a-3361-4d1d-92d0-a8518ad66ab9','String','jsonType.label'),('8757c43a-3361-4d1d-92d0-a8518ad66ab9','picture','user.attribute'),('8757c43a-3361-4d1d-92d0-a8518ad66ab9','true','userinfo.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','access.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','claim.name'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','id.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','String','jsonType.label'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','user.attribute'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','userinfo.token.claim'),('8cf3e8e7-3e44-419a-8cee-366efc6b6485','true','access.token.claim'),('8cf3e8e7-3e44-419a-8cee-366efc6b6485','phone_number_verified','claim.name'),('8cf3e8e7-3e44-419a-8cee-366efc6b6485','true','id.token.claim'),('8cf3e8e7-3e44-419a-8cee-366efc6b6485','boolean','jsonType.label'),('8cf3e8e7-3e44-419a-8cee-366efc6b6485','phoneNumberVerified','user.attribute'),('8cf3e8e7-3e44-419a-8cee-366efc6b6485','true','userinfo.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','access.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updated_at','claim.name'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','id.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','String','jsonType.label'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updatedAt','user.attribute'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','userinfo.token.claim'),('9167abed-9034-47b5-aa8f-48ca47ca0adb','true','access.token.claim'),('9167abed-9034-47b5-aa8f-48ca47ca0adb','resource_access.${client_id}.roles','claim.name'),('9167abed-9034-47b5-aa8f-48ca47ca0adb','String','jsonType.label'),('9167abed-9034-47b5-aa8f-48ca47ca0adb','true','multivalued'),('9167abed-9034-47b5-aa8f-48ca47ca0adb','foo','user.attribute'),('94882d67-9ba3-4354-b2cb-a021434813b1','true','access.token.claim'),('94882d67-9ba3-4354-b2cb-a021434813b1','zoneinfo','claim.name'),('94882d67-9ba3-4354-b2cb-a021434813b1','true','id.token.claim'),('94882d67-9ba3-4354-b2cb-a021434813b1','String','jsonType.label'),('94882d67-9ba3-4354-b2cb-a021434813b1','zoneinfo','user.attribute'),('94882d67-9ba3-4354-b2cb-a021434813b1','true','userinfo.token.claim'),('9da9eeea-0f27-4f15-b7d1-06f20c9c8b55','true','access.token.claim'),('9da9eeea-0f27-4f15-b7d1-06f20c9c8b55','phone_number','claim.name'),('9da9eeea-0f27-4f15-b7d1-06f20c9c8b55','true','id.token.claim'),('9da9eeea-0f27-4f15-b7d1-06f20c9c8b55','String','jsonType.label'),('9da9eeea-0f27-4f15-b7d1-06f20c9c8b55','phoneNumber','user.attribute'),('9da9eeea-0f27-4f15-b7d1-06f20c9c8b55','true','userinfo.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','access.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','family_name','claim.name'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','id.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','String','jsonType.label'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','lastName','user.attribute'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','userinfo.token.claim'),('ac9790c2-d8f8-4a29-9c06-2c9da5f5da7f','true','access.token.claim'),('ac9790c2-d8f8-4a29-9c06-2c9da5f5da7f','website','claim.name'),('ac9790c2-d8f8-4a29-9c06-2c9da5f5da7f','true','id.token.claim'),('ac9790c2-d8f8-4a29-9c06-2c9da5f5da7f','String','jsonType.label'),('ac9790c2-d8f8-4a29-9c06-2c9da5f5da7f','website','user.attribute'),('ac9790c2-d8f8-4a29-9c06-2c9da5f5da7f','true','userinfo.token.claim'),('b47ee6e2-f698-46da-8409-0b8a1fe776d8','true','access.token.claim'),('b47ee6e2-f698-46da-8409-0b8a1fe776d8','profile','claim.name'),('b47ee6e2-f698-46da-8409-0b8a1fe776d8','true','id.token.claim'),('b47ee6e2-f698-46da-8409-0b8a1fe776d8','String','jsonType.label'),('b47ee6e2-f698-46da-8409-0b8a1fe776d8','profile','user.attribute'),('b47ee6e2-f698-46da-8409-0b8a1fe776d8','true','userinfo.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','access.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','id.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','userinfo.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','true','access.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','groups','claim.name'),('bc99959b-7558-4797-b663-39676e5935b1','true','id.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','String','jsonType.label'),('bc99959b-7558-4797-b663-39676e5935b1','true','multivalued'),('bc99959b-7558-4797-b663-39676e5935b1','foo','user.attribute'),('bc99959b-7558-4797-b663-39676e5935b1','true','userinfo.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','access.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','claim.name'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','id.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','String','jsonType.label'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','user.attribute'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','userinfo.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','access.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phone_number','claim.name'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','id.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','String','jsonType.label'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phoneNumber','user.attribute'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','userinfo.token.claim'),('c6eb1289-fded-454e-af61-796c821d04ff','true','access.token.claim'),('c6eb1289-fded-454e-af61-796c821d04ff','family_name','claim.name'),('c6eb1289-fded-454e-af61-796c821d04ff','true','id.token.claim'),('c6eb1289-fded-454e-af61-796c821d04ff','String','jsonType.label'),('c6eb1289-fded-454e-af61-796c821d04ff','lastName','user.attribute'),('c6eb1289-fded-454e-af61-796c821d04ff','true','userinfo.token.claim'),('df443265-82bc-4ad0-a541-ed40d1eb5b21','true','access.token.claim'),('df443265-82bc-4ad0-a541-ed40d1eb5b21','realm_access.roles','claim.name'),('df443265-82bc-4ad0-a541-ed40d1eb5b21','String','jsonType.label'),('df443265-82bc-4ad0-a541-ed40d1eb5b21','true','multivalued'),('df443265-82bc-4ad0-a541-ed40d1eb5b21','foo','user.attribute'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','true','access.token.claim'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','resource_access.${client_id}.roles','claim.name'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','String','jsonType.label'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','true','multivalued'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','foo','user.attribute'),('edae1e1e-2800-4b67-b930-59edf0a309d8','Role','attribute.name'),('edae1e1e-2800-4b67-b930-59edf0a309d8','Basic','attribute.nameformat'),('edae1e1e-2800-4b67-b930-59edf0a309d8','false','single'),('fbd1b91f-4e76-4da0-94d2-780b7bec83b2','true','access.token.claim'),('fbd1b91f-4e76-4da0-94d2-780b7bec83b2','preferred_username','claim.name'),('fbd1b91f-4e76-4da0-94d2-780b7bec83b2','true','id.token.claim'),('fbd1b91f-4e76-4da0-94d2-780b7bec83b2','String','jsonType.label'),('fbd1b91f-4e76-4da0-94d2-780b7bec83b2','username','user.attribute'),('fbd1b91f-4e76-4da0-94d2-780b7bec83b2','true','userinfo.token.claim');
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
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','5c0ce054-9026-4e6b-a349-affb1a86380f',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','ab694bf6-2561-4b0f-9a14-cb1bad6f67eb','178893ad-4f72-4e3f-95e4-d86eaba0f141','26c8a7b2-6e62-42f9-89a6-3c43102277f0','3423ef2d-8bed-4d30-b4c7-0dab7a6215aa','4e07eeb8-7c0e-4734-adcd-927ff89342da',2592000,_binary '\0',900,_binary '',_binary '\0','d8ba16fe-35ea-4888-9ea7-34fffc969fb1',0,_binary '\0',0,0,'7342c3fb-d425-45c9-990c-485e7fd11146'),('siglo21',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'siglo21',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','24cde013-9584-4109-bd68-b860e38e0440',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','7f091fd5-fce2-4138-b617-9b4ea6a0220a','eb1bd319-e701-4862-af24-50bdced96b4b','04461393-2b6c-4da9-b6ad-031fff2a5bfd','1458d8cd-1f12-4789-8bf3-89830152fa47','6f730b1b-6bf7-48b2-8522-1e372e509ca3',2592000,_binary '\0',900,_binary '',_binary '\0','c7011230-9539-49d7-8875-4ce796d76152',0,_binary '\0',0,0,'55c43002-4c16-49ef-87a5-30deaa22314b');
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
INSERT INTO `REDIRECT_URIS` VALUES ('1d1bdb92-2e05-4081-949d-c2bccba13fb7','/realms/master/account/*'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','/realms/siglo21/account/*'),('42ce5f39-f315-496d-881f-7de13ac3ae08','/admin/siglo21/console/*'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','http://localhost:8080/*'),('54b4493f-4dc6-46ec-a697-a77e8977899c','/realms/siglo21/account/*'),('78d508a8-6ec9-4316-ad3c-fead0d01517b','/realms/master/account/*'),('d00686de-ac18-418c-a0f5-bc9175a3e29f','/admin/master/console/*');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
INSERT INTO `repartidores` VALUES (1,'Apellido1','Nombre1'),(2,'Apellido2','Nombre2'),(3,'Apellido3','Nombre3'),(4,'Apellido4','Nombre4'),(5,'Apellido5','Nombre5'),(6,'Apellido6','Nombre6'),(7,'Apellido7','Nombre7'),(8,'Apellido8','Nombre8'),(9,'Apellido9','Nombre9'),(10,'Apellido10','Nombre10');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('312fbc54-2f55-42e0-bc76-8f0a667ba3e9','terms_and_conditions','Terms and Conditions','siglo21',_binary '\0',_binary '\0','terms_and_conditions',20),('40de7fc7-63b2-43c0-8f72-8a3a155c658a','UPDATE_PROFILE','Update Profile','siglo21',_binary '',_binary '\0','UPDATE_PROFILE',40),('7217973e-f5e4-4d17-a841-a07c2e2660b9','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('7c3e7415-3325-4d91-b51c-ef066866918a','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('8c502efd-18ad-433d-b66f-c96e429ab610','CONFIGURE_TOTP','Configure OTP','siglo21',_binary '',_binary '\0','CONFIGURE_TOTP',10),('ac74efb9-1bec-4b59-9c65-c0fb9991e0a3','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('b311071a-b5a1-455f-95f9-d63abe75ec9d','update_user_locale','Update User Locale','siglo21',_binary '',_binary '\0','update_user_locale',1000),('be4d0b6e-3dd3-42a7-b375-f5be27ed86b0','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('bfa3be31-4bc5-40b3-b515-1fdb673d8ac9','VERIFY_EMAIL','Verify Email','siglo21',_binary '',_binary '\0','VERIFY_EMAIL',50),('c0418415-6bff-4f15-91e7-6bae9e41bda8','UPDATE_PASSWORD','Update Password','siglo21',_binary '',_binary '\0','UPDATE_PASSWORD',30),('cc52fff4-cf97-4106-b39c-b84e54697011','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('d9306ce7-2cfd-42fe-badb-cff82ed20855','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('de2193bc-8df7-447c-93a9-1e890e7be248','delete_account','Delete Account','siglo21',_binary '\0',_binary '\0','delete_account',60),('f4aeba05-328b-4d5a-9425-38247a630a40','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40);
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
INSERT INTO `SCOPE_MAPPING` VALUES ('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','92e0c80c-ed04-427a-89da-e936808b8d09'),('78d508a8-6ec9-4316-ad3c-fead0d01517b','cb0354af-2561-4d98-bd6e-e630326583a4');
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
INSERT INTO `USER_ENTITY` VALUES ('35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6',NULL,'de13d158-4ff3-4af3-863f-eecbc909fbe2',_binary '\0',_binary '',NULL,NULL,NULL,'master','administrador',1701823691767,NULL,0),('47f00eeb-cbbf-40a9-9406-8925fcd161c1',NULL,'9817c4ec-debd-4e79-95e5-dfa16a147992',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','repartidor.user',1701823790554,NULL,0),('8ec3edf3-548b-49a9-af1a-503b82290fb1',NULL,'88581c86-cb40-4594-98aa-2a2794ae112e',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','alejo.dev',1701823760918,NULL,0),('ce388a86-5241-4fd7-9659-0f5b56be13ec',NULL,'b281df73-aa52-40f6-91ad-5f6262168d07',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','vendedor.user',1701823838005,NULL,0);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('03fa82e9-92f4-4bdc-b384-a1c21ed0a4db','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('06da7389-c54e-46ca-a817-3112b0aa1028','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('0b12b935-5eec-4582-9f95-7018c5e375a7','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('10bf1941-fc40-4825-a3c2-5e4c33a020c1','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('23441edf-ba90-4e98-97d9-1869fcb77e00','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('3330b946-e893-4f72-8fd8-20c62f849bb0','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('485d1b39-c409-4b4e-8841-f2d008865de1','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('5eac8a6d-d7d2-450d-8218-3bf574b5308e','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('70a382a2-42fb-43b7-aadc-cd3a31678a5c','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('7342c3fb-d425-45c9-990c-485e7fd11146','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('9edaf120-08ad-47f3-ad5a-dab8970cd013','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('a6ce68f8-65bf-4eb9-af07-4daedf7ce80b','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('b3d1a2b5-fc9c-41a0-b2bd-2efcfcab7104','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('b5af4c6a-35ac-4065-b77b-ca81d1c4a9cf','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('bc3eeadd-303f-44d2-88c2-2117618b1e75','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('c3d0d532-557b-47a9-9469-33998f246a18','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('cdc2c0bc-e947-4d4c-bc5a-ee9efd86fa15','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('dffc5142-b4a7-462b-8db1-a0d728e0029d','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('e3267088-6bbc-4dad-91ce-091a751c335f','35e46c8a-63cc-478a-b0b2-1f6f92b6aaa6'),('55c43002-4c16-49ef-87a5-30deaa22314b','47f00eeb-cbbf-40a9-9406-8925fcd161c1'),('dea41763-6811-47a0-a1e9-0652e7487c4f','47f00eeb-cbbf-40a9-9406-8925fcd161c1'),('54d5c122-1802-4139-b68d-e2cec2facbb8','8ec3edf3-548b-49a9-af1a-503b82290fb1'),('55c43002-4c16-49ef-87a5-30deaa22314b','8ec3edf3-548b-49a9-af1a-503b82290fb1'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','8ec3edf3-548b-49a9-af1a-503b82290fb1'),('dea41763-6811-47a0-a1e9-0652e7487c4f','8ec3edf3-548b-49a9-af1a-503b82290fb1'),('55c43002-4c16-49ef-87a5-30deaa22314b','ce388a86-5241-4fd7-9659-0f5b56be13ec'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','ce388a86-5241-4fd7-9659-0f5b56be13ec');
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
INSERT INTO `WEB_ORIGINS` VALUES ('42ce5f39-f315-496d-881f-7de13ac3ae08','+'),('d00686de-ac18-418c-a0f5-bc9175a3e29f','+');
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
INSERT INTO `zonas` VALUES (1,'Martes'),(2,'Miercoles'),(3,'Jueves'),(4,'Viernes');
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

-- Dump completed on 2023-12-06  1:22:45
