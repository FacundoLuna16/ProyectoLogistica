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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('03e22aa5-70d8-4ec0-8db1-bb8e8cac0379',NULL,NULL,'master','b3f6ab3a-eabb-4d91-80d0-650c4587b740',1,40,_binary '','ac07ec53-614c-457e-867f-4fc5d2db55c5',NULL),('06a05e47-050b-44bf-a994-1b7e7f037bc9',NULL,'registration-user-creation','master','7a1c3d21-6528-4c24-a796-69e3f4352c77',0,20,_binary '\0',NULL,NULL),('087d9cb7-9295-4c88-b3c3-775c8cd0f685',NULL,'basic-auth-otp','master','41cd4e42-8a63-49bb-bb34-d0aa7840d981',3,20,_binary '\0',NULL,NULL),('0c98d3b2-7312-4681-a71b-8f23ac01da92',NULL,'idp-review-profile','master','44de923f-699d-44de-b7da-b781cb90ee15',0,10,_binary '\0',NULL,'65d7e617-4e12-4aaa-ba1a-1cc196723ba6'),('0ca595d4-b081-49bb-934d-568b6b7f02c8',NULL,NULL,'siglo21','c7f10555-3a61-47a2-aa19-78fcb0a05a58',0,20,_binary '','f9d1405b-128e-43db-91f8-a1fb318ba05e',NULL),('0d8e5577-3d6e-40b5-a7cc-500c9527eec7',NULL,'conditional-user-configured','siglo21','a7f67c65-3929-430c-ae9f-086895b51036',0,10,_binary '\0',NULL,NULL),('13c104de-2972-4a7e-a48d-7b64b29ad34e',NULL,'no-cookie-redirect','master','bf0cca8f-6f99-4d98-87a8-ad5488353eee',0,10,_binary '\0',NULL,NULL),('149d5350-07e9-4051-b79b-9782af708c3a',NULL,NULL,'master','661e3ba2-bf5d-4878-827f-fae95b4f91c4',0,20,_binary '','f47cd059-76f3-465f-8535-b2a5ec0bd7be',NULL),('16771ea6-af51-4080-9479-2c214e9cbb34',NULL,'identity-provider-redirector','siglo21','e36699d9-3724-46ee-a478-7fb63ee69069',2,25,_binary '\0',NULL,NULL),('17bc5cfe-327b-4294-add2-d1f0811e6a03',NULL,NULL,'siglo21','809bd1cd-51f8-4517-81da-36e1cd8aa918',0,20,_binary '','55f8b4ce-e528-4785-a95a-e9eca6179a4d',NULL),('1a49f0d4-6e84-41e0-8b78-3db43ac40bf0',NULL,'idp-create-user-if-unique','siglo21','0be69600-9914-478d-b9c7-6a01a337e1dc',2,10,_binary '\0',NULL,'66f516db-512b-4821-9851-6a797172e9fb'),('1c633a8e-5c25-476d-9372-f5b73147c3ba',NULL,'direct-grant-validate-username','master','1bb41bea-73b2-462e-b884-c42774575afe',0,10,_binary '\0',NULL,NULL),('1deed571-25b9-43d1-8bca-9ec83cb79013',NULL,'identity-provider-redirector','master','a3af3d85-cc18-451b-8f1a-bb5fb775602d',2,25,_binary '\0',NULL,NULL),('29086c7c-fbce-4454-bd9d-c0bed91e6f45',NULL,NULL,'siglo21','dd695a4e-5932-47ed-98d2-6724a72f05c8',0,20,_binary '','0be69600-9914-478d-b9c7-6a01a337e1dc',NULL),('2a56c0e2-9eb9-4873-bcdc-1f09cd9bbc26',NULL,'http-basic-authenticator','master','c89a7303-a439-435a-95c1-c41d4211164b',0,10,_binary '\0',NULL,NULL),('2edc9031-a48b-41c6-960f-db11ab89e697',NULL,'conditional-user-configured','master','be5b2f9b-bf91-4145-a49c-805eb781364e',0,10,_binary '\0',NULL,NULL),('3160f889-78b8-4fec-81e3-4166b459cbe9',NULL,'registration-profile-action','master','7a1c3d21-6528-4c24-a796-69e3f4352c77',0,40,_binary '\0',NULL,NULL),('365618f5-4b8e-48a8-8e84-51cbffb51559',NULL,'idp-email-verification','siglo21','55f8b4ce-e528-4785-a95a-e9eca6179a4d',2,10,_binary '\0',NULL,NULL),('3b26ccf8-aeff-42c9-8520-b158092da020',NULL,'idp-username-password-form','siglo21','b027b320-77da-4448-b2e7-df86cf44707b',0,10,_binary '\0',NULL,NULL),('3bb26b89-d2dc-40af-83b5-66a185bb44e6',NULL,'registration-recaptcha-action','master','7a1c3d21-6528-4c24-a796-69e3f4352c77',3,60,_binary '\0',NULL,NULL),('3e95d05d-72ca-4048-b653-d86bb2333e61',NULL,'direct-grant-validate-username','siglo21','4dcb4538-fa4b-436d-b5cd-d52306141f0c',0,10,_binary '\0',NULL,NULL),('4241b0e8-4dea-485c-a043-3db87b38fdbc',NULL,'client-x509','siglo21','ec97cca7-4b23-4057-99e0-ec947085ed7a',2,40,_binary '\0',NULL,NULL),('42ee0719-7d09-499b-8510-e1ecff45834b',NULL,'idp-confirm-link','master','661e3ba2-bf5d-4878-827f-fae95b4f91c4',0,10,_binary '\0',NULL,NULL),('42feca81-9d0b-43c6-8b70-156c5bceca2e',NULL,'http-basic-authenticator','siglo21','919c6db3-4a0c-4a92-8690-680bd867ed40',0,10,_binary '\0',NULL,NULL),('4d00fe45-f8a9-4b63-9026-f17ef1b22bcf',NULL,'auth-otp-form','master','3c823770-9590-4954-9228-fcc60b167c79',0,20,_binary '\0',NULL,NULL),('4e17f376-6e35-4801-b308-f22e2bfc18b0',NULL,'client-secret','siglo21','ec97cca7-4b23-4057-99e0-ec947085ed7a',2,10,_binary '\0',NULL,NULL),('4e9e7d52-d81e-472f-97f7-6f801ca9ef40',NULL,'docker-http-basic-authenticator','siglo21','60b26f41-ddfd-424e-b436-2f5739def648',0,10,_binary '\0',NULL,NULL),('505a4853-a9e9-400f-83d9-df153f3450b6',NULL,'conditional-user-configured','master','3c823770-9590-4954-9228-fcc60b167c79',0,10,_binary '\0',NULL,NULL),('5365ed76-ca18-49f1-aaaa-b559cdf866cb',NULL,'reset-credentials-choose-user','siglo21','dd2dacbf-fbe5-4653-8a04-0493f0b9ad2f',0,10,_binary '\0',NULL,NULL),('565d7ffe-d3d5-49a0-a8ca-254d1a8cedc5',NULL,'docker-http-basic-authenticator','master','f7906595-3a8a-48a3-89a8-f1360c2f0b5a',0,10,_binary '\0',NULL,NULL),('573ebd73-2cce-4044-ab01-2ad8c2096069',NULL,'client-secret','master','d85bc3ca-ad40-4a1b-90e8-aeab4a1ff6cd',2,10,_binary '\0',NULL,NULL),('57425e57-5b25-4a81-a288-2f48aaeaa147',NULL,'auth-otp-form','siglo21','3f389b5f-6c4c-4290-915e-f0bd8851b8b5',0,20,_binary '\0',NULL,NULL),('598cf04a-4781-4b9b-bf3b-b5b3e373569d',NULL,'direct-grant-validate-password','master','1bb41bea-73b2-462e-b884-c42774575afe',0,20,_binary '\0',NULL,NULL),('59cdbc1a-58c3-4e05-896d-95a73ecc45a0',NULL,'registration-profile-action','siglo21','5a986d3a-896e-4bdf-b5e7-b1696c985b06',0,40,_binary '\0',NULL,NULL),('5a739a0c-b4b9-489c-8350-4d9f8060d628',NULL,'idp-email-verification','master','f47cd059-76f3-465f-8535-b2a5ec0bd7be',2,10,_binary '\0',NULL,NULL),('5be3e11c-2c75-469d-94f6-cce4acbf9d42',NULL,'conditional-user-configured','siglo21','06ea987a-951b-4348-987a-7401f3d2eeb8',0,10,_binary '\0',NULL,NULL),('5dbccc42-281e-4a07-a850-e13307f07bf3',NULL,'reset-credentials-choose-user','master','b3f6ab3a-eabb-4d91-80d0-650c4587b740',0,10,_binary '\0',NULL,NULL),('5e469e5c-7c73-489f-a3a3-713cf2c2af6c',NULL,'auth-otp-form','master','29e916f5-07e5-4e5b-a620-183b5ea4817e',0,20,_binary '\0',NULL,NULL),('60160649-623b-4ed4-94d3-664b7c51bf6b',NULL,NULL,'master','8ba02de9-8a27-4210-bf44-633c5c9a5afc',2,20,_binary '','661e3ba2-bf5d-4878-827f-fae95b4f91c4',NULL),('63748c35-8c34-444b-85ea-7ff041df6d57',NULL,'direct-grant-validate-otp','master','be5b2f9b-bf91-4145-a49c-805eb781364e',0,20,_binary '\0',NULL,NULL),('69aa3edd-2687-4618-ae68-cdab29147fb6',NULL,NULL,'siglo21','e36699d9-3724-46ee-a478-7fb63ee69069',2,30,_binary '','f599c2aa-6b47-4c90-92c6-c27a887e0cfb',NULL),('6ceb14b2-ef64-4e60-9cfa-2f2e85a764f3',NULL,'basic-auth','master','41cd4e42-8a63-49bb-bb34-d0aa7840d981',0,10,_binary '\0',NULL,NULL),('6e0a5e2a-8d9e-40b5-999d-38c070a213fe',NULL,NULL,'master','f47cd059-76f3-465f-8535-b2a5ec0bd7be',2,20,_binary '','b092c215-a0f6-4411-a30c-254f74f4f8a7',NULL),('700b9b81-ec81-4d21-aebc-5d350e0a4f33',NULL,NULL,'siglo21','dd2dacbf-fbe5-4653-8a04-0493f0b9ad2f',1,40,_binary '','06ea987a-951b-4348-987a-7401f3d2eeb8',NULL),('70f46135-b954-473f-b1dd-376e7fada09e',NULL,'basic-auth-otp','siglo21','f9d1405b-128e-43db-91f8-a1fb318ba05e',3,20,_binary '\0',NULL,NULL),('7473fb1b-ae1e-463f-a943-d01aa1db0fc0',NULL,'idp-create-user-if-unique','master','8ba02de9-8a27-4210-bf44-633c5c9a5afc',2,10,_binary '\0',NULL,'43734ebc-bf3f-4388-b740-ff652eb3af9a'),('837601e1-b387-4b06-a5a5-bd4a40d62758',NULL,'conditional-user-configured','master','29e916f5-07e5-4e5b-a620-183b5ea4817e',0,10,_binary '\0',NULL,NULL),('84300084-f926-4831-8bc6-028a07007e55',NULL,'idp-review-profile','siglo21','dd695a4e-5932-47ed-98d2-6724a72f05c8',0,10,_binary '\0',NULL,'cae95e8e-b638-4991-99e2-c8decac905f8'),('8791efea-add8-440d-aa95-6b0c7b3f5adc',NULL,'auth-spnego','master','41cd4e42-8a63-49bb-bb34-d0aa7840d981',3,30,_binary '\0',NULL,NULL),('8853a767-1a11-4b74-8b42-54d5a4875351',NULL,NULL,'master','5539fbec-9428-4a39-b620-a9f8d65f47da',1,20,_binary '','3c823770-9590-4954-9228-fcc60b167c79',NULL),('8908cdc4-7080-45c6-a44a-3a4f14d74d82',NULL,'auth-cookie','siglo21','e36699d9-3724-46ee-a478-7fb63ee69069',2,10,_binary '\0',NULL,NULL),('8aa7253e-739b-418d-91a0-1d449ec3bdb6',NULL,NULL,'master','a3af3d85-cc18-451b-8f1a-bb5fb775602d',2,30,_binary '','5539fbec-9428-4a39-b620-a9f8d65f47da',NULL),('8bebe79a-a69b-450a-b8fb-41109020b88a',NULL,'client-secret-jwt','siglo21','ec97cca7-4b23-4057-99e0-ec947085ed7a',2,30,_binary '\0',NULL,NULL),('96b73b7d-f56f-4abb-a710-3a5538dfe87b',NULL,NULL,'siglo21','f599c2aa-6b47-4c90-92c6-c27a887e0cfb',1,20,_binary '','a008c1dc-1772-4d83-9456-47670657b7c2',NULL),('985c43ec-1bb8-4656-8480-a716321060d0',NULL,'client-secret-jwt','master','d85bc3ca-ad40-4a1b-90e8-aeab4a1ff6cd',2,30,_binary '\0',NULL,NULL),('987c2c58-12ca-460c-b46c-0d3c149f58e3',NULL,'auth-spnego','master','a3af3d85-cc18-451b-8f1a-bb5fb775602d',3,20,_binary '\0',NULL,NULL),('995cc60b-dc9f-4d2a-88ce-9fc59cacf801',NULL,'registration-password-action','master','7a1c3d21-6528-4c24-a796-69e3f4352c77',0,50,_binary '\0',NULL,NULL),('9b434cbe-f2aa-4038-9faa-19b1ca867d82',NULL,NULL,'master','b092c215-a0f6-4411-a30c-254f74f4f8a7',1,20,_binary '','29e916f5-07e5-4e5b-a620-183b5ea4817e',NULL),('9dc20ea3-3d95-451c-a5c3-1161d1963f12',NULL,'client-x509','master','d85bc3ca-ad40-4a1b-90e8-aeab4a1ff6cd',2,40,_binary '\0',NULL,NULL),('9de6342c-4d64-4218-86ae-0fc42bc74775',NULL,'no-cookie-redirect','siglo21','c7f10555-3a61-47a2-aa19-78fcb0a05a58',0,10,_binary '\0',NULL,NULL),('a31adb45-2168-456e-9ed2-b22e0bfa1e0b',NULL,'registration-recaptcha-action','siglo21','5a986d3a-896e-4bdf-b5e7-b1696c985b06',3,60,_binary '\0',NULL,NULL),('a41451f0-78c9-4a5e-ad1d-310bcb9db037',NULL,'idp-confirm-link','siglo21','809bd1cd-51f8-4517-81da-36e1cd8aa918',0,10,_binary '\0',NULL,NULL),('a98ab92b-c914-4f61-8175-ad9cf048f7d9',NULL,'idp-username-password-form','master','b092c215-a0f6-4411-a30c-254f74f4f8a7',0,10,_binary '\0',NULL,NULL),('adb54a18-b165-4211-a5fc-8592144b9d8d',NULL,'reset-password','master','b3f6ab3a-eabb-4d91-80d0-650c4587b740',0,30,_binary '\0',NULL,NULL),('b0b5aec0-f260-4a4f-ac81-e2bdb4d41740',NULL,'auth-username-password-form','master','5539fbec-9428-4a39-b620-a9f8d65f47da',0,10,_binary '\0',NULL,NULL),('b975580c-ac45-47dd-a08b-a361c3f46fe9',NULL,'registration-page-form','siglo21','873214c4-0704-422c-9503-6ca8cc12886a',0,10,_binary '','5a986d3a-896e-4bdf-b5e7-b1696c985b06',NULL),('ba8e6e20-0e1b-48c6-98b0-19ff7816feb6',NULL,'auth-spnego','siglo21','f9d1405b-128e-43db-91f8-a1fb318ba05e',3,30,_binary '\0',NULL,NULL),('bb96854a-937c-4c30-b49a-dbd82c6461bf',NULL,'auth-username-password-form','siglo21','f599c2aa-6b47-4c90-92c6-c27a887e0cfb',0,10,_binary '\0',NULL,NULL),('c0e3c97d-e244-45c1-bec6-efb138617429',NULL,'reset-otp','master','ac07ec53-614c-457e-867f-4fc5d2db55c5',0,20,_binary '\0',NULL,NULL),('c1afcf4a-ea68-4500-b768-0dd1da6648a8',NULL,'registration-page-form','master','96e8d265-1af7-4098-8e60-22b4bb71b4ec',0,10,_binary '','7a1c3d21-6528-4c24-a796-69e3f4352c77',NULL),('c1ca3ee8-e0d0-409f-b3a6-5b6657497ce6',NULL,NULL,'master','44de923f-699d-44de-b7da-b781cb90ee15',0,20,_binary '','8ba02de9-8a27-4210-bf44-633c5c9a5afc',NULL),('c27556e2-fb56-4968-b905-34151362ee22',NULL,'conditional-user-configured','siglo21','3f389b5f-6c4c-4290-915e-f0bd8851b8b5',0,10,_binary '\0',NULL,NULL),('c285a5e9-a254-411c-ae78-ec227430f170',NULL,'reset-credential-email','siglo21','dd2dacbf-fbe5-4653-8a04-0493f0b9ad2f',0,20,_binary '\0',NULL,NULL),('c2fc3724-b6ba-4fe9-824c-65d55a275d30',NULL,NULL,'siglo21','b027b320-77da-4448-b2e7-df86cf44707b',1,20,_binary '','3f389b5f-6c4c-4290-915e-f0bd8851b8b5',NULL),('c3e8e6ca-3d9e-43c4-ac55-15ce1b1e41b2',NULL,'auth-otp-form','siglo21','a008c1dc-1772-4d83-9456-47670657b7c2',0,20,_binary '\0',NULL,NULL),('c59dd980-94f1-4bb6-985b-9de4fa852dfc',NULL,'reset-otp','siglo21','06ea987a-951b-4348-987a-7401f3d2eeb8',0,20,_binary '\0',NULL,NULL),('c88ecbbb-2207-4621-8be7-af88eff35f7d',NULL,NULL,'siglo21','0be69600-9914-478d-b9c7-6a01a337e1dc',2,20,_binary '','809bd1cd-51f8-4517-81da-36e1cd8aa918',NULL),('cd6a80cd-78ea-4ccc-94b0-9240e7e79b24',NULL,'direct-grant-validate-otp','siglo21','a7f67c65-3929-430c-ae9f-086895b51036',0,20,_binary '\0',NULL,NULL),('ce098556-8430-4cb4-a431-24621308b4f8',NULL,NULL,'master','bf0cca8f-6f99-4d98-87a8-ad5488353eee',0,20,_binary '','41cd4e42-8a63-49bb-bb34-d0aa7840d981',NULL),('d06f5cc2-6a7a-4c35-84db-27e786b8880a',NULL,NULL,'master','1bb41bea-73b2-462e-b884-c42774575afe',1,30,_binary '','be5b2f9b-bf91-4145-a49c-805eb781364e',NULL),('d49f99f4-00bf-4cfd-aa90-ae09d41133e6',NULL,'registration-user-creation','siglo21','5a986d3a-896e-4bdf-b5e7-b1696c985b06',0,20,_binary '\0',NULL,NULL),('d70e9bb6-4314-471b-a336-7ef0cbc5b874',NULL,'registration-password-action','siglo21','5a986d3a-896e-4bdf-b5e7-b1696c985b06',0,50,_binary '\0',NULL,NULL),('d792487a-b813-4eed-b754-e1216dcf6cae',NULL,'reset-credential-email','master','b3f6ab3a-eabb-4d91-80d0-650c4587b740',0,20,_binary '\0',NULL,NULL),('e0be660a-2545-4026-b3fa-d9bcabd72211',NULL,'reset-password','siglo21','dd2dacbf-fbe5-4653-8a04-0493f0b9ad2f',0,30,_binary '\0',NULL,NULL),('e26c993d-5bcf-4243-96d8-b0f224bc2eb2',NULL,'auth-cookie','master','a3af3d85-cc18-451b-8f1a-bb5fb775602d',2,10,_binary '\0',NULL,NULL),('e28f2d36-3ec8-45b8-b0fe-9190a3ee5de1',NULL,'client-jwt','siglo21','ec97cca7-4b23-4057-99e0-ec947085ed7a',2,20,_binary '\0',NULL,NULL),('e6585fbf-a97d-4c31-883a-047c82ed3ec0',NULL,'conditional-user-configured','siglo21','a008c1dc-1772-4d83-9456-47670657b7c2',0,10,_binary '\0',NULL,NULL),('e8ec081f-a3e0-4479-976e-cc03f3c4d4c4',NULL,'client-jwt','master','d85bc3ca-ad40-4a1b-90e8-aeab4a1ff6cd',2,20,_binary '\0',NULL,NULL),('e909feb3-b508-41a2-8652-fd512a758f66',NULL,'conditional-user-configured','master','ac07ec53-614c-457e-867f-4fc5d2db55c5',0,10,_binary '\0',NULL,NULL),('ea82d37a-7c58-4e83-a153-4e8d259f6d62',NULL,NULL,'siglo21','55f8b4ce-e528-4785-a95a-e9eca6179a4d',2,20,_binary '','b027b320-77da-4448-b2e7-df86cf44707b',NULL),('ec40e740-34a1-4179-b7ba-b3ad886f67a9',NULL,'direct-grant-validate-password','siglo21','4dcb4538-fa4b-436d-b5cd-d52306141f0c',0,20,_binary '\0',NULL,NULL),('ec81e987-0cb4-4981-91f1-6547a5efde0b',NULL,'basic-auth','siglo21','f9d1405b-128e-43db-91f8-a1fb318ba05e',0,10,_binary '\0',NULL,NULL),('f6c2b901-b1a1-4162-979b-92e871547e26',NULL,'auth-spnego','siglo21','e36699d9-3724-46ee-a478-7fb63ee69069',3,20,_binary '\0',NULL,NULL),('fd7959b9-7881-4ee0-bf5d-77f1c778274b',NULL,NULL,'siglo21','4dcb4538-fa4b-436d-b5cd-d52306141f0c',1,30,_binary '','a7f67c65-3929-430c-ae9f-086895b51036',NULL);
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('06ea987a-951b-4348-987a-7401f3d2eeb8','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','siglo21','basic-flow',_binary '\0',_binary ''),('0be69600-9914-478d-b9c7-6a01a337e1dc','User creation or linking','Flow for the existing/non-existing user alternatives','siglo21','basic-flow',_binary '\0',_binary ''),('1bb41bea-73b2-462e-b884-c42774575afe','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('29e916f5-07e5-4e5b-a620-183b5ea4817e','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('3c823770-9590-4954-9228-fcc60b167c79','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('3f389b5f-6c4c-4290-915e-f0bd8851b8b5','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('41cd4e42-8a63-49bb-bb34-d0aa7840d981','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('44de923f-699d-44de-b7da-b781cb90ee15','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('4dcb4538-fa4b-436d-b5cd-d52306141f0c','direct grant','OpenID Connect Resource Owner Grant','siglo21','basic-flow',_binary '',_binary ''),('5539fbec-9428-4a39-b620-a9f8d65f47da','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('55f8b4ce-e528-4785-a95a-e9eca6179a4d','Account verification options','Method with which to verity the existing account','siglo21','basic-flow',_binary '\0',_binary ''),('5a986d3a-896e-4bdf-b5e7-b1696c985b06','registration form','registration form','siglo21','form-flow',_binary '\0',_binary ''),('60b26f41-ddfd-424e-b436-2f5739def648','docker auth','Used by Docker clients to authenticate against the IDP','siglo21','basic-flow',_binary '',_binary ''),('661e3ba2-bf5d-4878-827f-fae95b4f91c4','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('7a1c3d21-6528-4c24-a796-69e3f4352c77','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('809bd1cd-51f8-4517-81da-36e1cd8aa918','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','siglo21','basic-flow',_binary '\0',_binary ''),('873214c4-0704-422c-9503-6ca8cc12886a','registration','registration flow','siglo21','basic-flow',_binary '',_binary ''),('8ba02de9-8a27-4210-bf44-633c5c9a5afc','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('919c6db3-4a0c-4a92-8690-680bd867ed40','saml ecp','SAML ECP Profile Authentication Flow','siglo21','basic-flow',_binary '',_binary ''),('96e8d265-1af7-4098-8e60-22b4bb71b4ec','registration','registration flow','master','basic-flow',_binary '',_binary ''),('a008c1dc-1772-4d83-9456-47670657b7c2','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('a3af3d85-cc18-451b-8f1a-bb5fb775602d','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('a7f67c65-3929-430c-ae9f-086895b51036','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('ac07ec53-614c-457e-867f-4fc5d2db55c5','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('b027b320-77da-4448-b2e7-df86cf44707b','Verify Existing Account by Re-authentication','Reauthentication of existing account','siglo21','basic-flow',_binary '\0',_binary ''),('b092c215-a0f6-4411-a30c-254f74f4f8a7','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('b3f6ab3a-eabb-4d91-80d0-650c4587b740','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('be5b2f9b-bf91-4145-a49c-805eb781364e','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('bf0cca8f-6f99-4d98-87a8-ad5488353eee','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('c7f10555-3a61-47a2-aa19-78fcb0a05a58','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','siglo21','basic-flow',_binary '',_binary ''),('c89a7303-a439-435a-95c1-c41d4211164b','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('d85bc3ca-ad40-4a1b-90e8-aeab4a1ff6cd','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('dd2dacbf-fbe5-4653-8a04-0493f0b9ad2f','reset credentials','Reset credentials for a user if they forgot their password or something','siglo21','basic-flow',_binary '',_binary ''),('dd695a4e-5932-47ed-98d2-6724a72f05c8','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','siglo21','basic-flow',_binary '',_binary ''),('e36699d9-3724-46ee-a478-7fb63ee69069','browser','browser based authentication','siglo21','basic-flow',_binary '',_binary ''),('ec97cca7-4b23-4057-99e0-ec947085ed7a','clients','Base authentication for clients','siglo21','client-flow',_binary '',_binary ''),('f47cd059-76f3-465f-8535-b2a5ec0bd7be','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('f599c2aa-6b47-4c90-92c6-c27a887e0cfb','forms','Username, password, otp and other auth forms.','siglo21','basic-flow',_binary '\0',_binary ''),('f7906595-3a8a-48a3-89a8-f1360c2f0b5a','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('f9d1405b-128e-43db-91f8-a1fb318ba05e','Authentication Options','Authentication options.','siglo21','basic-flow',_binary '\0',_binary '');
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('43734ebc-bf3f-4388-b740-ff652eb3af9a','create unique user config','master'),('65d7e617-4e12-4aaa-ba1a-1cc196723ba6','review profile config','master'),('66f516db-512b-4821-9851-6a797172e9fb','create unique user config','siglo21'),('cae95e8e-b638-4991-99e2-c8decac905f8','review profile config','siglo21');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('43734ebc-bf3f-4388-b740-ff652eb3af9a','false','require.password.update.after.registration'),('65d7e617-4e12-4aaa-ba1a-1cc196723ba6','missing','update.profile.on.first.login'),('66f516db-512b-4821-9851-6a797172e9fb','false','require.password.update.after.registration'),('cae95e8e-b638-4991-99e2-c8decac905f8','missing','update.profile.on.first.login');
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
INSERT INTO `CLIENT` VALUES ('020a93a9-334b-44a8-947e-ab49181011b8',_binary '',_binary '\0','siglo21-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','siglo21 Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('0b95e7b8-076d-49c8-919f-a9e8c94ae199',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/siglo21/account/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/siglo21/console/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '',_binary '','siglo21-client-api-rest',0,_binary '',NULL,'http://siglo21logistica.com.ar:3000',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/siglo21/account/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6b45b148-78b1-4772-baf5-8552e4416f27',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('934e910b-94f9-40a5-a52f-b3906200e17d',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('b9ff790a-1104-4307-bb5b-a3d69c112dcb',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f3267da5-5420-44ae-b664-1e628901472a',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
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
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('0b95e7b8-076d-49c8-919f-a9e8c94ae199','S256','pkce.code.challenge.method'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','S256','pkce.code.challenge.method'),('42ce5f39-f315-496d-881f-7de13ac3ae08','S256','pkce.code.challenge.method'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','1800','access.token.lifespan'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','backchannel.logout.revoke.offline.tokens'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','true','backchannel.logout.session.required'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','client_credentials.use_refresh_token'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','display.on.consent.screen'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','exclude.session.state.from.auth.response'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','id.token.as.detached.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','oauth2.device.authorization.grant.enabled'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','oidc.ciba.grant.enabled'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','require.pushed.authorization.requests'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml_force_name_id_format'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.artifact.binding'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.assertion.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.authnstatement'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.client.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.encrypt'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.force.post.binding'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.multivalued.roles'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.onetimeuse.condition'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.server.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.server.signature.keyinfo.ext'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','tls.client.certificate.bound.access.tokens'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','true','use.refresh.tokens'),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','S256','pkce.code.challenge.method');
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
INSERT INTO `CLIENT_SCOPE` VALUES ('0459b0c0-8556-49fc-be22-4259d3982980','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('12c40e00-02f3-4059-a146-7f3257f69707','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('199dd783-27bd-4f01-a62f-6cc3be89eede','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('19b6b82c-b8f7-4634-be79-efede78aab4e','offline_access','siglo21','OpenID Connect built-in scope: offline_access','openid-connect'),('279791da-86fa-4f67-84c7-b8f250adbcf1','profile','siglo21','OpenID Connect built-in scope: profile','openid-connect'),('28963099-19d3-4521-a02f-976d9671e893','phone','siglo21','OpenID Connect built-in scope: phone','openid-connect'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','email','siglo21','OpenID Connect built-in scope: email','openid-connect'),('50e23a8a-f7f2-4a62-a033-a2d4a452fa4c','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('7ec6698b-2ab6-4698-9ac9-5719ec269a9b','address','master','OpenID Connect built-in scope: address','openid-connect'),('80a98201-a009-4f95-a8d9-67b46623f54d','microprofile-jwt','siglo21','Microprofile - JWT built-in scope','openid-connect'),('8510f411-9388-4823-9963-b4d5a71aaaf7','email','master','OpenID Connect built-in scope: email','openid-connect'),('949f5a06-e4fb-4f9d-8236-e1b1b615fb3d','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','roles','siglo21','OpenID Connect scope for add user roles to the access token','openid-connect'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','role_list','siglo21','SAML role list','saml'),('b39fe518-d02f-4eac-942b-eeddf878c80f','web-origins','siglo21','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('d0863bd0-e30a-43f7-baf6-63063e2b1fe2','role_list','master','SAML role list','saml'),('da127315-5241-4a8f-a46a-6bea0de8925e','address','siglo21','OpenID Connect built-in scope: address','openid-connect'),('f056ea25-a0f8-46a6-abe2-80dc57eb835a','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect');
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
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0459b0c0-8556-49fc-be22-4259d3982980','${phoneScopeConsentText}','consent.screen.text'),('0459b0c0-8556-49fc-be22-4259d3982980','true','display.on.consent.screen'),('0459b0c0-8556-49fc-be22-4259d3982980','true','include.in.token.scope'),('12c40e00-02f3-4059-a146-7f3257f69707','${profileScopeConsentText}','consent.screen.text'),('12c40e00-02f3-4059-a146-7f3257f69707','true','display.on.consent.screen'),('12c40e00-02f3-4059-a146-7f3257f69707','true','include.in.token.scope'),('199dd783-27bd-4f01-a62f-6cc3be89eede','','consent.screen.text'),('199dd783-27bd-4f01-a62f-6cc3be89eede','false','display.on.consent.screen'),('199dd783-27bd-4f01-a62f-6cc3be89eede','false','include.in.token.scope'),('19b6b82c-b8f7-4634-be79-efede78aab4e','${offlineAccessScopeConsentText}','consent.screen.text'),('19b6b82c-b8f7-4634-be79-efede78aab4e','true','display.on.consent.screen'),('279791da-86fa-4f67-84c7-b8f250adbcf1','${profileScopeConsentText}','consent.screen.text'),('279791da-86fa-4f67-84c7-b8f250adbcf1','true','display.on.consent.screen'),('279791da-86fa-4f67-84c7-b8f250adbcf1','true','include.in.token.scope'),('28963099-19d3-4521-a02f-976d9671e893','${phoneScopeConsentText}','consent.screen.text'),('28963099-19d3-4521-a02f-976d9671e893','true','display.on.consent.screen'),('28963099-19d3-4521-a02f-976d9671e893','true','include.in.token.scope'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','${emailScopeConsentText}','consent.screen.text'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','true','display.on.consent.screen'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','true','include.in.token.scope'),('50e23a8a-f7f2-4a62-a033-a2d4a452fa4c','${offlineAccessScopeConsentText}','consent.screen.text'),('50e23a8a-f7f2-4a62-a033-a2d4a452fa4c','true','display.on.consent.screen'),('7ec6698b-2ab6-4698-9ac9-5719ec269a9b','${addressScopeConsentText}','consent.screen.text'),('7ec6698b-2ab6-4698-9ac9-5719ec269a9b','true','display.on.consent.screen'),('7ec6698b-2ab6-4698-9ac9-5719ec269a9b','true','include.in.token.scope'),('80a98201-a009-4f95-a8d9-67b46623f54d','false','display.on.consent.screen'),('80a98201-a009-4f95-a8d9-67b46623f54d','true','include.in.token.scope'),('8510f411-9388-4823-9963-b4d5a71aaaf7','${emailScopeConsentText}','consent.screen.text'),('8510f411-9388-4823-9963-b4d5a71aaaf7','true','display.on.consent.screen'),('8510f411-9388-4823-9963-b4d5a71aaaf7','true','include.in.token.scope'),('949f5a06-e4fb-4f9d-8236-e1b1b615fb3d','${rolesScopeConsentText}','consent.screen.text'),('949f5a06-e4fb-4f9d-8236-e1b1b615fb3d','true','display.on.consent.screen'),('949f5a06-e4fb-4f9d-8236-e1b1b615fb3d','false','include.in.token.scope'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','${rolesScopeConsentText}','consent.screen.text'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','true','display.on.consent.screen'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','false','include.in.token.scope'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','${samlRoleListScopeConsentText}','consent.screen.text'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','true','display.on.consent.screen'),('b39fe518-d02f-4eac-942b-eeddf878c80f','','consent.screen.text'),('b39fe518-d02f-4eac-942b-eeddf878c80f','false','display.on.consent.screen'),('b39fe518-d02f-4eac-942b-eeddf878c80f','false','include.in.token.scope'),('d0863bd0-e30a-43f7-baf6-63063e2b1fe2','${samlRoleListScopeConsentText}','consent.screen.text'),('d0863bd0-e30a-43f7-baf6-63063e2b1fe2','true','display.on.consent.screen'),('da127315-5241-4a8f-a46a-6bea0de8925e','${addressScopeConsentText}','consent.screen.text'),('da127315-5241-4a8f-a46a-6bea0de8925e','true','display.on.consent.screen'),('da127315-5241-4a8f-a46a-6bea0de8925e','true','include.in.token.scope'),('f056ea25-a0f8-46a6-abe2-80dc57eb835a','false','display.on.consent.screen'),('f056ea25-a0f8-46a6-abe2-80dc57eb835a','true','include.in.token.scope');
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
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0b95e7b8-076d-49c8-919f-a9e8c94ae199','0459b0c0-8556-49fc-be22-4259d3982980',_binary '\0'),('0b95e7b8-076d-49c8-919f-a9e8c94ae199','12c40e00-02f3-4059-a146-7f3257f69707',_binary ''),('0b95e7b8-076d-49c8-919f-a9e8c94ae199','199dd783-27bd-4f01-a62f-6cc3be89eede',_binary ''),('0b95e7b8-076d-49c8-919f-a9e8c94ae199','50e23a8a-f7f2-4a62-a033-a2d4a452fa4c',_binary '\0'),('0b95e7b8-076d-49c8-919f-a9e8c94ae199','7ec6698b-2ab6-4698-9ac9-5719ec269a9b',_binary '\0'),('0b95e7b8-076d-49c8-919f-a9e8c94ae199','8510f411-9388-4823-9963-b4d5a71aaaf7',_binary ''),('0b95e7b8-076d-49c8-919f-a9e8c94ae199','949f5a06-e4fb-4f9d-8236-e1b1b615fb3d',_binary ''),('0b95e7b8-076d-49c8-919f-a9e8c94ae199','f056ea25-a0f8-46a6-abe2-80dc57eb835a',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('6b45b148-78b1-4772-baf5-8552e4416f27','0459b0c0-8556-49fc-be22-4259d3982980',_binary '\0'),('6b45b148-78b1-4772-baf5-8552e4416f27','12c40e00-02f3-4059-a146-7f3257f69707',_binary ''),('6b45b148-78b1-4772-baf5-8552e4416f27','199dd783-27bd-4f01-a62f-6cc3be89eede',_binary ''),('6b45b148-78b1-4772-baf5-8552e4416f27','50e23a8a-f7f2-4a62-a033-a2d4a452fa4c',_binary '\0'),('6b45b148-78b1-4772-baf5-8552e4416f27','7ec6698b-2ab6-4698-9ac9-5719ec269a9b',_binary '\0'),('6b45b148-78b1-4772-baf5-8552e4416f27','8510f411-9388-4823-9963-b4d5a71aaaf7',_binary ''),('6b45b148-78b1-4772-baf5-8552e4416f27','949f5a06-e4fb-4f9d-8236-e1b1b615fb3d',_binary ''),('6b45b148-78b1-4772-baf5-8552e4416f27','f056ea25-a0f8-46a6-abe2-80dc57eb835a',_binary '\0'),('934e910b-94f9-40a5-a52f-b3906200e17d','0459b0c0-8556-49fc-be22-4259d3982980',_binary '\0'),('934e910b-94f9-40a5-a52f-b3906200e17d','12c40e00-02f3-4059-a146-7f3257f69707',_binary ''),('934e910b-94f9-40a5-a52f-b3906200e17d','199dd783-27bd-4f01-a62f-6cc3be89eede',_binary ''),('934e910b-94f9-40a5-a52f-b3906200e17d','50e23a8a-f7f2-4a62-a033-a2d4a452fa4c',_binary '\0'),('934e910b-94f9-40a5-a52f-b3906200e17d','7ec6698b-2ab6-4698-9ac9-5719ec269a9b',_binary '\0'),('934e910b-94f9-40a5-a52f-b3906200e17d','8510f411-9388-4823-9963-b4d5a71aaaf7',_binary ''),('934e910b-94f9-40a5-a52f-b3906200e17d','949f5a06-e4fb-4f9d-8236-e1b1b615fb3d',_binary ''),('934e910b-94f9-40a5-a52f-b3906200e17d','f056ea25-a0f8-46a6-abe2-80dc57eb835a',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('b9ff790a-1104-4307-bb5b-a3d69c112dcb','0459b0c0-8556-49fc-be22-4259d3982980',_binary '\0'),('b9ff790a-1104-4307-bb5b-a3d69c112dcb','12c40e00-02f3-4059-a146-7f3257f69707',_binary ''),('b9ff790a-1104-4307-bb5b-a3d69c112dcb','199dd783-27bd-4f01-a62f-6cc3be89eede',_binary ''),('b9ff790a-1104-4307-bb5b-a3d69c112dcb','50e23a8a-f7f2-4a62-a033-a2d4a452fa4c',_binary '\0'),('b9ff790a-1104-4307-bb5b-a3d69c112dcb','7ec6698b-2ab6-4698-9ac9-5719ec269a9b',_binary '\0'),('b9ff790a-1104-4307-bb5b-a3d69c112dcb','8510f411-9388-4823-9963-b4d5a71aaaf7',_binary ''),('b9ff790a-1104-4307-bb5b-a3d69c112dcb','949f5a06-e4fb-4f9d-8236-e1b1b615fb3d',_binary ''),('b9ff790a-1104-4307-bb5b-a3d69c112dcb','f056ea25-a0f8-46a6-abe2-80dc57eb835a',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','0459b0c0-8556-49fc-be22-4259d3982980',_binary '\0'),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','12c40e00-02f3-4059-a146-7f3257f69707',_binary ''),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','199dd783-27bd-4f01-a62f-6cc3be89eede',_binary ''),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','50e23a8a-f7f2-4a62-a033-a2d4a452fa4c',_binary '\0'),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','7ec6698b-2ab6-4698-9ac9-5719ec269a9b',_binary '\0'),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','8510f411-9388-4823-9963-b4d5a71aaaf7',_binary ''),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','949f5a06-e4fb-4f9d-8236-e1b1b615fb3d',_binary ''),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','f056ea25-a0f8-46a6-abe2-80dc57eb835a',_binary '\0'),('f3267da5-5420-44ae-b664-1e628901472a','0459b0c0-8556-49fc-be22-4259d3982980',_binary '\0'),('f3267da5-5420-44ae-b664-1e628901472a','12c40e00-02f3-4059-a146-7f3257f69707',_binary ''),('f3267da5-5420-44ae-b664-1e628901472a','199dd783-27bd-4f01-a62f-6cc3be89eede',_binary ''),('f3267da5-5420-44ae-b664-1e628901472a','50e23a8a-f7f2-4a62-a033-a2d4a452fa4c',_binary '\0'),('f3267da5-5420-44ae-b664-1e628901472a','7ec6698b-2ab6-4698-9ac9-5719ec269a9b',_binary '\0'),('f3267da5-5420-44ae-b664-1e628901472a','8510f411-9388-4823-9963-b4d5a71aaaf7',_binary ''),('f3267da5-5420-44ae-b664-1e628901472a','949f5a06-e4fb-4f9d-8236-e1b1b615fb3d',_binary ''),('f3267da5-5420-44ae-b664-1e628901472a','f056ea25-a0f8-46a6-abe2-80dc57eb835a',_binary '\0');
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
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('19b6b82c-b8f7-4634-be79-efede78aab4e','8748520e-df8c-448c-b03a-f7e53b6bf973'),('50e23a8a-f7f2-4a62-a033-a2d4a452fa4c','121fc580-da26-4a10-8ec0-df4ce616d9ee');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
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
INSERT INTO `COMPONENT` VALUES ('0098e192-5eea-4102-bbf0-f69798acea5d','Trusted Hosts','siglo21','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('019677fc-f149-40b0-890f-011834ede402','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('0bfdf09e-d23d-4d49-9814-08741ba051a8','rsa-generated','siglo21','rsa-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('20217c77-2196-4ae6-9d79-e799d807904c','hmac-generated','siglo21','hmac-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('2342704f-aee1-4281-a261-d2066d2ba29f','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('2ae478f7-f417-4af7-9b21-351028a12484','Full Scope Disabled','siglo21','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('2d50517a-69a5-491c-90f2-b4f1fcd226c4','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('34ff266e-cc4d-496a-bd5f-c4c51fd34646',NULL,'siglo21','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','siglo21',NULL),('3c201461-66c5-4470-a3d0-8721c39d6cd3','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('4aecb60b-5e65-4054-9bed-7b89d16edc35','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('50eecdfd-8c73-4b64-a340-7032715f1da0','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('52c82a70-e1e9-49fb-a57a-19514d10598c','Allowed Client Scopes','siglo21','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('5c53cb00-f9ce-4284-8238-bc04d6e21c87','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('67b6f675-aea9-43d7-bcde-c079cd9f6340','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('765cd604-3dd6-49b4-af5e-7363f1d7883e','Allowed Client Scopes','siglo21','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','authenticated'),('7af8d873-8ae3-49f3-b8fb-36ab38162eb6','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('80275b15-09eb-4958-9108-7bcf5f538f38','Allowed Protocol Mapper Types','siglo21','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','authenticated'),('80677139-3a69-4e87-b7e9-98c00e67a6f4','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('811288b9-8e90-487b-969b-82d36b785c27','rsa-enc-generated','siglo21','rsa-enc-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('b75485a4-f673-4081-9238-4b5e7f5eb222','Max Clients Limit','siglo21','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('ba7e6085-3d35-4711-94e1-491bd0aa4823','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('bfa8d370-01ca-4bda-9333-ac7649508be0','Allowed Protocol Mapper Types','siglo21','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('c7604a3c-d217-410a-841b-2d3cfe05b6b9','aes-generated','siglo21','aes-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('ca4df3c2-3d4d-4d86-b8f4-985e7adb0847','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('fe8e79e6-abbf-471b-8c5d-5d5fafd29144','Consent Required','siglo21','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous');
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
INSERT INTO `COMPONENT_CONFIG` VALUES ('0062696c-caab-4c81-80c4-ccd73e45ea4d','019677fc-f149-40b0-890f-011834ede402','secret','d3CBCtyZeO-XnJa1C6r6_1AKyI5W-pmG9Pq64MTXFaIw1v1hX9_ZDwH1_M6-VxETazrCeZgO_S1XIVgXVChCkw'),('065dbd67-393b-416e-ae60-561e6ca23f2b','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-role-list-mapper'),('0c01d942-f9d9-48b6-b88f-ea0dc0d8b62e','811288b9-8e90-487b-969b-82d36b785c27','privateKey','MIIEogIBAAKCAQEAhnS21ojAZtl6q9L4beKaQ+ExC9nw3KNI/e6oVIIpjU/fAvG2iHEof7lgioY2/5dBzA5caV+REwT/cOi79KzllVoBNL1czxoIvPGQ3CGJt3YHNdogaDtBrq0MK+Kyjlkft6oLAcx+5IXq6b/20A+4SsAr/YoRzcRC2pqlnI3ryMYBE8pVbowhF76N+bUBhIS5LiRuYm0Rz8GbWpe0VhGzlz4Za4UzB+tBwOSE450uqLPA8tJlUPhs6A9ti6V+sLzhnxlTmbGg060w+4SHtYFf4SrkJaUeWQMg5AZIOA9TUDaokx5S1vmoprBIpHOs8TuS2xS7Taa7tjGAMFs9iNQyGwIDAQABAoIBABEyUEg0CVeeLSBYxUlYmB5iaOF5KGMvxyAjLAhS9XmLY5x+ybe9sU5UqVJORC6Aa/vrQkp/3JAwLXOFcLSkgGCPuGPEbGBYlhGEW+CrsW9zewyaL1blbUsn+syKHAg0wee9qda7DuevcRIgaTLHL+zvkzDEPe6xUVOgP9o8FJIDAUJ2ZJR0PmRuLQy1huSXpVBOX5Ekg5ZSVLVOj0GbznoDeBYuAcrcKWHqRZwMXioEEqmPVJzt9I8WoXVOrUo0hqUF5HKQb4yW8EMHvxRqJ4XpU9AOh8mLoXGqHxsUix2Um9bxRToABb7FpWglwOazDQJD4DkNOENHKFQv+GddZwECgYEA0eSxE1NSp4hj+GEnHgEbpLYFInf+VnsKvZo5FbsgBxHc45QcAdCQq6v9G8I5cSTqUmFcC8A0Iwy2XZRqBTyFq0Lws38wF0jMmopMaEPwWf4CyUswSKFkA2tBQzBh1grSNa7l23I+fD4i3kU4vw732R3AX/oc/okQGARP4LJAn0ECgYEAo/3QqNKSQ5pU28DppeBsgOS85TA/jZ13jXAg6ILIn5OsxGuoOyV1Ng5wjqAy/UYlhldACqNRlvkexbC88+YkQCWn8GoCa2WppdYRRT/OmMpkV2faixI5zw/2x2vdbwjtqNd7OakbNEON9bWRBk2mgZBYX5Ll/uL+PCao8H8sFlsCgYAa/52/bKJfJm4ljumnNGFH6Jn0exbeLOmOxf29y9oszqFpLK4FlbxmOLNQFMWqxiLWAewDHvAV6hazJtoUXlqbUvr/O8cF17lpz4xQhRyvlrrpBaDqVsg0oGE+sUSEcdPkT+EFP0bGWH/Hs4O/H7/Fz8vlDJkaLKtDS5qyvnsNgQKBgCThiVLegJyJkfoWKbXvghd+2eilcDWWK3P4ur3v49TXrmxCVgRvSSwOFUxORQlnBDtxVerOjiPpBP2q4OPtZ0ux7FIKVV737y5ntVygnAMKyYRKzACo6a1ixrpUzOkS1fg59fGi0YZwhvWyjtofDopm/ykHbYhkXo8Cls33m9+vAoGAd63M7BP7Pi4PEtTcW8xGto8yi956xGnrESM4fx5kzIX0sm9pkaBvr2e/s6rWFYUsD3WhOMv8Bwdj+TouN+/5jYAyYk29JaenJpYEzTp9+nEiivf7zgV1wna3GlPBQGeXYd5tAM9Ogk80wQTSOjZB+7SfulX0U5AqUw1GXc8g3W0='),('10e6f3ec-c02e-482a-9e24-47532227c6e6','019677fc-f149-40b0-890f-011834ede402','algorithm','HS256'),('115b804a-2775-4ab8-92f7-3086e3b6f7e6','50eecdfd-8c73-4b64-a340-7032715f1da0','priority','100'),('19e7e0f9-06ee-4e3e-8a8b-f44e75fbc2cf','5c53cb00-f9ce-4284-8238-bc04d6e21c87','priority','100'),('1a557e8a-7676-4ac8-9de3-dfd53f4fd818','20217c77-2196-4ae6-9d79-e799d807904c','secret','Uv6eNo4gcRb4jwLAin52xFlvdIoPtnBDHRWLaIUtNQ0cgS7r6IXDY5hdNZhCLT6ztGo5fnV3lsZpJsscMpbB1Q'),('201412b3-0302-4ee1-8a6d-27ced60a30e9','20217c77-2196-4ae6-9d79-e799d807904c','algorithm','HS256'),('2353724d-3710-46a3-9b43-477b010d879a','2342704f-aee1-4281-a261-d2066d2ba29f','kid','a3caa48b-ffb5-4739-8146-2f6c375618a6'),('2a077171-1209-4d63-98ad-baac16c29cb0','ca4df3c2-3d4d-4d86-b8f4-985e7adb0847','allowed-protocol-mapper-types','saml-user-property-mapper'),('3034b6f3-66ef-4cee-b75e-84b8d881176b','5c53cb00-f9ce-4284-8238-bc04d6e21c87','privateKey','MIIEpQIBAAKCAQEAj5UCwVC1VfdHkmeg1OCDwtlffXkangK41+nS9jlyEJyh7WJ5F7bA8wMxDN+XcCPIljspoHGve9jybcqfliuYz+9nFZsemLp2OQt9FosckTnISKhRqMSW/8QPv29cL1W2d9DtSgtFw7MMgl30ESvcdRqYhMYFsXdjv2r/tjUVjOiKLWH2d+JsEsG7K/9OUEFw/LLDdOpT2Mr6z9L3dGy4uKhjL7ejQy2893eMGYtdqOfCtWbR9qcwfPGDIHA5iCVvL379DrC3IsZ9dKZ40I5ClVww+d31Acln7uvrkrSsxbU1J2LAkjaNWFMpiRXEDfQdxupK5gN0gTAXHDl0xvvJPQIDAQABAoIBAQCJCSoRAQuhGZo4tCj/I6z9yeNmaLArwONURzlugRNJoYS2gPab2HO9O/2TkM8DW1O1do/bLsXSiROQEARSGhgF1TLonx0LnWL6POnNG0ZPoPtzxRny3nZTc3eoOQudrcux/TiMI8gY6Il2317zCI6nQZPxnOGQKCeOaPvXlkCUM2hz1R38MRncin8XZ5CwMvdpaYDgxjte3IW297NStmwzW48wZfMFuft3BBBGe79Ed+0Uv25TbbXHHsgAM4f0/hwDvc508Fb3MpRK03z32BiSmA+wScP4o3+dRaXVyuPoKFjS8H/nbobYs8EHL5tIUxXtNlEpBk9cQyiphhjHl5XNAoGBANZpEPBsnNB8kbLM8N5phXC1Ogdz5I3IgrQToa/IZVaaNfJV3+LKGPS9EaQT+ANZPX2TTm7AIn5moH8Gx52Kd3Srfoi39GjsquXGc1rMwst3QqPMcr6lEsWFk1Yl0dMZm/cHfXCGs2WnPxkV8oHAYVtFqTkvNJ4bqbIcADXbcEzbAoGBAKtu1hKj789ztV+NYUhzrNbBmt35GChs3rE1A5t5ax3km9MsGFSNLkzG+qyMFLwwfVId6hf745Lqy6fwVvhDziK3NA0sQNOOb6kX+HfoU+rRZfeBt1ZTQMgNyP3kXCQxkEDAQQuILEKF6tz8vBo0y0SWxehLLH7O+ktkwX5Z+JHHAoGBAMuJH5hsMozDw/fNDtbDqvXsQ7LxdESX1GOnwzRActq8N3vdw1Ph78DcfpOYlTZwj6vWm30NDXGacL9FK1dFK9LoPY0Bu5WjHTRUqArJGB3YD724hjCuOVyiSdRcwIu54tGlHZIlfMWB96cTq4s6mfDv9w2e3z88GWJHrHdz4W5DAoGBAIC6Il8u4HT7IrdUVzdrPN6p1BtX3y8DyRhxgXruamOw9N1V4BMlTB30z+he63cARioyMkS+LP1192TskLGtYI0q2hgGIct5yhjD2hxXxSOvBw0aR0u4Cg3uY/1Zy2KWIQauFmmNYAa3vksgMDLRb8zaFlO+lvPFgaa5Sp4Q+xijAoGANgMcRamkO2a84v9pNd0unhxmaG7s+EOT52F1xu8nsnH1V0Goe2RUN1sDAuJ41VqR/EG3FvIjhvGXQfvZtJ2TYoZpXWm0Vq2Bao5H88WMxhXtbxmfLcEfA8WNrJqsfjQSN9CPwjQC5r3NGAM0JFwiEg4YljhpQfGjcyzTfFwD36U='),('33115beb-c203-424e-9215-37d030a578fe','20217c77-2196-4ae6-9d79-e799d807904c','priority','100'),('3547fb04-36e5-43dd-8942-630f1dad2e42','7af8d873-8ae3-49f3-b8fb-36ab38162eb6','allowed-protocol-mapper-types','oidc-address-mapper'),('3558ad30-b8a4-4499-b841-5a28927cd203','ca4df3c2-3d4d-4d86-b8f4-985e7adb0847','allowed-protocol-mapper-types','oidc-address-mapper'),('35bbcb80-56f4-4c81-a4b3-d7f5869f6e69','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('35dc9749-d3f3-4860-9df9-b715b9b574af','811288b9-8e90-487b-969b-82d36b785c27','certificate','MIICnTCCAYUCBgGM4H0y+zANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdzaWdsbzIxMB4XDTI0MDEwNjIwMzQxMFoXDTM0MDEwNjIwMzU1MFowEjEQMA4GA1UEAwwHc2lnbG8yMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIZ0ttaIwGbZeqvS+G3imkPhMQvZ8NyjSP3uqFSCKY1P3wLxtohxKH+5YIqGNv+XQcwOXGlfkRME/3Dou/Ss5ZVaATS9XM8aCLzxkNwhibd2BzXaIGg7Qa6tDCviso5ZH7eqCwHMfuSF6um/9tAPuErAK/2KEc3EQtqapZyN68jGARPKVW6MIRe+jfm1AYSEuS4kbmJtEc/Bm1qXtFYRs5c+GWuFMwfrQcDkhOOdLqizwPLSZVD4bOgPbYulfrC84Z8ZU5mxoNOtMPuEh7WBX+Eq5CWlHlkDIOQGSDgPU1A2qJMeUtb5qKawSKRzrPE7ktsUu02mu7YxgDBbPYjUMhsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAOERTo+uViI0fuuyd738NQpmssAIURM8KKE15WPbExv2mYck9kPSWCJzDEdYOhofxrBR6knXePCsJ8j9kfCb5LfFQgXoa7HT0Bt1W0uDujjvexczAg79wl2TVEUiaoRLZYtUK0mRZ4KMrQnIJGSrx2jyiqoANtlWzjWMADFjla45tQdyIpqk6R75YsEHZU9+JgW/26B5d0CkTud0aHfARPQ7Zg85GqCRfu2Az+22AArfADlvi7GqPd6FFNvzfJ0kYEAhUhWvhHizisWKjRv7sri6z4K2TplIxZ3qikGZfb/vjC0tH8A9vGdYqEmfTGUdRmbC34YtGtP7rh4s3+1exkg=='),('38c72375-b5bf-4327-a840-05eee4d40eaa','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-address-mapper'),('3ce60989-92d0-4ead-8b50-4282d668026f','019677fc-f149-40b0-890f-011834ede402','kid','2e9f47c7-5ca7-4402-9a20-3f83be6e91a9'),('3cfa260c-b1c5-4afe-ba42-a288e54caa3b','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-full-name-mapper'),('43e4c044-f665-4544-9845-06913d514ac2','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('461a2669-3839-46aa-81bc-04deefda00d8','80677139-3a69-4e87-b7e9-98c00e67a6f4','allow-default-scopes','true'),('4ccf3716-a3de-47a4-8a21-8fd924acde60','765cd604-3dd6-49b4-af5e-7363f1d7883e','allow-default-scopes','true'),('5009cbf3-bcf2-4b18-8563-82fd0df5e7f8','811288b9-8e90-487b-969b-82d36b785c27','algorithm','RSA-OAEP'),('52020e6b-6715-44e6-840d-fe7a961ea9a7','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('57308cca-2315-42f0-a432-5db4d134fa9d','5c53cb00-f9ce-4284-8238-bc04d6e21c87','certificate','MIICmzCCAYMCBgGM4HzSTTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMTA2MjAzMzQ1WhcNMzQwMTA2MjAzNTI1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCPlQLBULVV90eSZ6DU4IPC2V99eRqeArjX6dL2OXIQnKHtYnkXtsDzAzEM35dwI8iWOymgca972PJtyp+WK5jP72cVmx6YunY5C30WixyROchIqFGoxJb/xA+/b1wvVbZ30O1KC0XDswyCXfQRK9x1GpiExgWxd2O/av+2NRWM6IotYfZ34mwSwbsr/05QQXD8ssN06lPYyvrP0vd0bLi4qGMvt6NDLbz3d4wZi12o58K1ZtH2pzB88YMgcDmIJW8vfv0OsLcixn10pnjQjkKVXDD53fUByWfu6+uStKzFtTUnYsCSNo1YUymJFcQN9B3G6krmA3SBMBccOXTG+8k9AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAH8pgNpGEHhA79qV+aHDMle35Y2Yzka53Po75bbudlo8cJh1UX8L3fLdfa6OuOSbvw0YrI5vgBgqTsvSrU4tKrAr9rp8bJnbdUrJnpsPnxNSxlf+CVmvibvMbf1dXXGmD9W0+CfJEjdYag2qcqr5DLM5ot/aUeXhLEw9OVOi2ey7Qm4OFl8Hfn2CeS/hOukWPpQqlsLtIKDyItDbqjOaVl8LtcCtZ7QyV3zLEDytKaxyXydVTLupLHiHtcG2YaSMfBibwmMr2wSJGR4vU91rVRRCMoRvQl5BATBIZYo8YWsR25vvQZUpkVzoiM7W+43XDNRgjhxi6SrKcxR3lhsllEM='),('601a6a7a-131a-4884-ba07-fd7bc47d8dfb','7af8d873-8ae3-49f3-b8fb-36ab38162eb6','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('6579d555-3628-437a-82d7-3999ecac39a9','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('67bd5958-000f-4432-8b29-a90dfc6357fb','2342704f-aee1-4281-a261-d2066d2ba29f','secret','3a22inuuEKQCbwoc1LUN3Q'),('6954aeee-73d3-488e-8216-2f7acb3c1062','ba7e6085-3d35-4711-94e1-491bd0aa4823','client-uris-must-match','true'),('6b41e388-e276-4251-a792-98671db8cbd8','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-user-property-mapper'),('6bef5fc5-09bf-4ddb-8084-971a87c08c49','c7604a3c-d217-410a-841b-2d3cfe05b6b9','priority','100'),('6fdc50c2-34fe-4a68-a9e3-fbf934166867','20217c77-2196-4ae6-9d79-e799d807904c','kid','9a8a9980-b387-45ad-868f-f50149404822'),('71521e43-aa1e-42b0-8dfd-d58f24f5c216','c7604a3c-d217-410a-841b-2d3cfe05b6b9','secret','OBuFnao78GAoP6xK2LAxRA'),('7202c3df-adf9-4771-b101-9264ba6cdbde','3c201461-66c5-4470-a3d0-8721c39d6cd3','allow-default-scopes','true'),('79f61596-36ae-425a-be3d-4c47e1bbc2cd','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('7df288b6-d926-46bc-9397-9a11e2967fef','0bfdf09e-d23d-4d49-9814-08741ba051a8','privateKey','MIIEowIBAAKCAQEAudeZCXHtlB3KL8z90oimGaUf+vt2zBAE6NEqEmnf0pqV35Pt3/swQH2U+W/H6V9VVR44yb1Jc4W612N2eYZ021o40yBeVqWmpS9bW3YCAY1VVcczkQ25QVCZAlOS1bv4aPjj1bVj1YcAQIcVlRBtXYqgdVd7S5ua1p1ghUT27k0Qb/AYBOg7+j+7laMHOhLU0ih+oy6Qgn+vyClZCXPC92AHTPWW2aXGYE81n0utweu9x3mVhkIZBhUJE+dYjJFyQI7KYf3RVBW5xt6GubU+u+2xAb5H8SfNJ5VTjdW5URgUI6WDY6ZH2quIHzFslBuFjJugcaJaGGHrXk1LsWXeWwIDAQABAoIBAFR7x418plV8SWr7lLP9/QyRfX1ajcHs0l6In8ipKuAR+GogVLZK+b+Hl47hmw7jkOZWC9jiXR7QP4UlKTnLvxns5QJNp7VaLuzPH4fvmK/d8VpCaZXamEox+q0NEyZpAl+uLdz8TftHGP08q7oNMrqgh5twfpN7lKNV/gf3tw3TYixWPYmbb8irpG4XvoYhHlsdmI96PX3olZWEbAo+ohp457q4C+yh6OoVULF+jIUPJBYFjYLYqhfFHK4pGRApnLpaG/jEbqevb3+JpBm4uAi409OpvTRqiNJS/bQQ4itOp4wuW0ltreKg86nbCdQv2yWSDtPvdewVVn9p8haflJECgYEA5yYcD/cElIqjMNhEdeXKJV7OM4WX7Dnl2COPyrDa0Ol8VJdVmuQGCndLWoqtf1UqX5KWBnE6RUHpZvV7V+HHtY0pOLnET9OBhGQ+RO6P44riyMEfbWrKoHjb8j2iPAvLzJTNXBm0mg9yrjZC5ap5PnEIfr7jO8wspgnQIFdKyoMCgYEAzdKEITb6uwAeWY7N8tSvwh7PcH4r1fBn1nBqshghOukChKFmW0e6Vzac8aEUVGy9twKMPqSnnbtuE38DchZnotZYJzISlhShCSaSKxAcowWo3oneJeOw0CZX+VMrTG24HA4RSlcKHRU0uWfY61UqKJvcXylL5q56zB21CMU3NUkCgYEArNOQvdsa4Jl8BORe46vpZeGp2Vn0yppLoTyNoaZ0JSm+XV09k28UmTSy8cKokIE0CnuGktCMGgZ7JhE7pOzaroMaJCC5iFoDB+MPr+iTSzWn9SR4hA4J7MwQ3+F3cN/9BDzqAwfxQhN00o8dm6zHtIk9Kc8+BZLWe1rw841xDVMCgYBwg247ggSaiTwOFSS8ZEwYQCOCCVcJQrxg219YMByqSYpY2qpLp/BTkMVGyZmFdVRYYQotjHEcpsNL4RkPGvRYbfgOpS7H4EsP54fsBojBDWz9CjzoVYnon61j3HVE+I22uHH3Q5GByH/kAsLwEsRTIrDbTIXzetoiDvNR8g12EQKBgH9dwckMFDfDEi5XEjnEi46pjFE7Nkj9agLDAfwA+++wQQaZa2CLcNoYDROoiONviQDlicTgDNQNUSpxKr6IR8qbqztS4qD64fB4DAdEIDpIiyHoP0IlQ467OTCfa7GDmbFQ+FO3qolDkk3kHyN971oq7F9GAR3TNASq89DRXjoD'),('822cce3a-5362-4219-963d-20ee65caf21c','019677fc-f149-40b0-890f-011834ede402','priority','100'),('87ea3377-558a-4938-83df-f199e65c8758','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-address-mapper'),('8cc8452c-1870-4f52-8ec8-a387b405ed10','ca4df3c2-3d4d-4d86-b8f4-985e7adb0847','allowed-protocol-mapper-types','oidc-full-name-mapper'),('909ae260-5e11-49db-a5d4-4d8655513529','ca4df3c2-3d4d-4d86-b8f4-985e7adb0847','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('947a1cee-f344-4aa8-8b82-151e798a7a68','ca4df3c2-3d4d-4d86-b8f4-985e7adb0847','allowed-protocol-mapper-types','saml-role-list-mapper'),('99905d85-4f06-4954-885c-4d47e0471001','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('9a912fe8-3779-4a08-b04c-99cc63377a34','811288b9-8e90-487b-969b-82d36b785c27','priority','100'),('a14de8d4-465b-442f-a838-0b9e3724b5fc','0098e192-5eea-4102-bbf0-f69798acea5d','client-uris-must-match','true'),('a284de09-a5f6-4c80-b236-ecf4567a3050','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('a628642c-776a-4aaa-861d-a4eace44c35e','7af8d873-8ae3-49f3-b8fb-36ab38162eb6','allowed-protocol-mapper-types','saml-role-list-mapper'),('a82f91c9-0f72-4d4d-ac1b-2799cff97f6b','7af8d873-8ae3-49f3-b8fb-36ab38162eb6','allowed-protocol-mapper-types','oidc-full-name-mapper'),('a84c4ea8-62e7-4b61-9965-9157b777df0e','5c53cb00-f9ce-4284-8238-bc04d6e21c87','algorithm','RSA-OAEP'),('a8afa4cc-ad17-461c-8f2c-11c009a4258c','0bfdf09e-d23d-4d49-9814-08741ba051a8','certificate','MIICnTCCAYUCBgGM4H0yrTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdzaWdsbzIxMB4XDTI0MDEwNjIwMzQxMFoXDTM0MDEwNjIwMzU1MFowEjEQMA4GA1UEAwwHc2lnbG8yMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALnXmQlx7ZQdyi/M/dKIphmlH/r7dswQBOjRKhJp39Kald+T7d/7MEB9lPlvx+lfVVUeOMm9SXOFutdjdnmGdNtaONMgXlalpqUvW1t2AgGNVVXHM5ENuUFQmQJTktW7+Gj449W1Y9WHAECHFZUQbV2KoHVXe0ubmtadYIVE9u5NEG/wGAToO/o/u5WjBzoS1NIofqMukIJ/r8gpWQlzwvdgB0z1ltmlxmBPNZ9LrcHrvcd5lYZCGQYVCRPnWIyRckCOymH90VQVucbehrm1PrvtsQG+R/EnzSeVU43VuVEYFCOlg2OmR9qriB8xbJQbhYyboHGiWhhh615NS7Fl3lsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEADfGK9WTyvf0gpqIjehaGXuVbXoL+3Ki2PmsyjHl+pdWNB3NnFIrwZTh0uBr4QrqcoPGqR9SbGubIKdtUHQXBBKgQerxw8LELOfstB7nLGkvQCGnPJrEEGBZzFQEvWJNuJcMsRBmrlzXCZ4eGDx9D/VArpkcG/EkO3W1lRY7VtAVkt9PiXztHzjr6fARYg6TxyUBE0ZSRpEbd+ElnT1qEoa/WRY7QeJHyYWQnoxQHvf9hRHmk/ULef+QGDe6Ez2rOSbEmeQ3+6B/jydmN0Hf/p4QEnWMzcg40ELfO8YAw0cxe4duc0ZWKF6+2kdc0qwVJMv4s6ZLCU1hmptgq0X3cmw=='),('ae9b185e-c199-4e1d-99f6-104389d48273','50eecdfd-8c73-4b64-a340-7032715f1da0','certificate','MIICmzCCAYMCBgGM4HzRfDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMTA2MjAzMzQ1WhcNMzQwMTA2MjAzNTI1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCUAcQMpTftVjqrupbkqQPQHV1zGUHf8PbHC67+Hfgvh6d5WppooaQwyV+VsGVLCdhLb+RXFt39BADPNIzADRNacDYFZ4LqJpL6G1aEcwM7cMtNX8lRp+zYQ1+BSUpx5Nt5aMF5cYuIn/KrE2XGPoVgZqvDwT7EDFmH8Otm0xMI0CbNxax1PfecMTFbalnhNJRnf6LiGROgPA3F5bKEqO/AdR9iWrDx3wXz0Co/2Y6rUHZfQaOwIvrJxAg1Og2vonf1leGeLmWgnK4y9snyyMxb9XK8s5tXP5D5X0pKjsAlpy20fmpD7tr0n3RehZ1u3OZJMt+L6rEj5HwOy3EJ7n4lAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGGHYIqrd4pZHUawCcwS6Jst4+PO759cuBIAIxagQrh5quT0Jsn7/ZMShvqCwqDEKnOovqMfbW3j8DaYf20vJQXzKvhcHgopEA5wxhJlEmn+BLweuVgywhFdSVfh/l+jDAU5bDvUd4+17WjnAwR2E5EvamXaGReTwEYXyyu76vYzDRuft5AD9Nn6o+J0dApcrI974xJS1lZRnot92n6vB3IXQXrQmPN6JOnd86FdS8Wtbzc+bkmknk8jbc2M4IZDB2QtQnHE0jUWt2upkJ4HnpzvdhzsBwqopk4pUwmuXg3uwBwYfMXvt69FUFZdLPvNexgpsEE2RZ3/B0pMqI8HV7Q='),('b916e40d-c307-4b5b-8e1b-cb946b13d4bd','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('b95be480-c789-4fd2-8ac6-c452f5e419dd','ba7e6085-3d35-4711-94e1-491bd0aa4823','host-sending-registration-request-must-match','true'),('be0af70c-baa7-4c97-9ba4-8afcba956e82','0098e192-5eea-4102-bbf0-f69798acea5d','host-sending-registration-request-must-match','true'),('c20fa505-85df-49f2-92e4-cf8200676574','7af8d873-8ae3-49f3-b8fb-36ab38162eb6','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('c50204d9-7b97-4c22-ad9f-64412d225ef4','50eecdfd-8c73-4b64-a340-7032715f1da0','keyUse','SIG'),('cc62abe4-7e9b-466c-8947-357c29bff041','7af8d873-8ae3-49f3-b8fb-36ab38162eb6','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('ccfe0de6-e8c9-4840-a278-99c8ef642b6e','50eecdfd-8c73-4b64-a340-7032715f1da0','privateKey','MIIEpAIBAAKCAQEAlAHEDKU37VY6q7qW5KkD0B1dcxlB3/D2xwuu/h34L4eneVqaaKGkMMlflbBlSwnYS2/kVxbd/QQAzzSMwA0TWnA2BWeC6iaS+htWhHMDO3DLTV/JUafs2ENfgUlKceTbeWjBeXGLiJ/yqxNlxj6FYGarw8E+xAxZh/DrZtMTCNAmzcWsdT33nDExW2pZ4TSUZ3+i4hkToDwNxeWyhKjvwHUfYlqw8d8F89AqP9mOq1B2X0GjsCL6ycQINToNr6J39ZXhni5loJyuMvbJ8sjMW/VyvLObVz+Q+V9KSo7AJacttH5qQ+7a9J90XoWdbtzmSTLfi+qxI+R8DstxCe5+JQIDAQABAoIBAQCK16k5D5iKbXS2emBo+uBXz+RFP/FbCaoGiUBMpIKY29HQdp0ZAGGNXqrrOkGbhg3AnqN+yzXNz36O4kYTN3DrSw5yPWtDCpKgSxr7PwVOMn6VBAFQN45oRbOHDeDnPQBiQVIWAd0aeqljsNutgCMQjuAcz+B4evlWHDxIBkP55AjKKr8/DjdTUTJXJrE1B1NtP64SKlIHWfc4gno08+Taof2rrkakKZPsjfmK5bR0r1AEnIW2JyxegalLZBZenNWzFTXPOlY9y0u8lfM0605nIhbUkpO8xbsVppwNjoWYqyjiOnzHRz534F3wNxrHHPLdHiVN5bUOemnqbCnx5TC1AoGBAPvlHav+Z3WKc+TynLZBw7h3s21Vj79+sGQ9PsGVqH/d10LURp5NxmqgAziy0Vdr+bD48JCzcQNORawQYSyMowbtqTGDT4ZXysVpVJERaljEfdlTmtl3HfseCmUg8/dNPszrZw0E3BKHSRySOGPeeLmyRq+iqiF4QjP/+lUazo4TAoGBAJZrPOBdVNOJQ/w4qbGddwL8ChsmUx7dwEjn2NxS9Wt7Tb+mU2O96pPIFeN127ezpkBEkKYtqAAC+4KvmFNZSqrfrf2brPw5T5b/lYXVAPr4d0/lZ1KlCI5X4PuDqWdfgq8fJcjDL2yTmeaeEo7WkZhu7VfOdOc2z24q7pbAb+nnAoGAUjavfolkHxr3RIxi1aGVTcnTyCWa6zdgPvc2WlyMSF+ReIBsJBLiZb6gDotehBf7wOUfLztB8YBEgSo/bRjhxMsg48Yl2IUi61e7gDWc7igDo0EEU2HraSCe5+7fcaHGk39pfPhPE8UP+cFHomDkKkejhoOi35WuleZAQDKlo/0CgYBT79WRsiMyw+dfKNNw3Njbnn+ZNOKvV7kENfRqxhRTfQQezRa9ku4Ct2WXf14zfZlpRZmeUd3s270z6P7MjAhBn/48hhGa0fRa45axjvI0GlCiEfZ9RMCohdtzHr56g+6uAGiaRmkBYsA/07exY4TtlgD1vay4lXpdFLH9B7erwwKBgQDRgoSwMYW3of54mdFW5TNYIMJsSzAWhm51N1WIm5fHhw8YbY5kw35OsWh4nGri0ECKm+J3aR78VfTvTpUwtJ1k5eMlLlWXy1A1UrkncQqnOeg1J37a7jZaA9FvyOdIlSaTB+06UF1oF/dhqwhg6WS9V+xa2o06MdRMjGu6XHVljQ=='),('cfa737d0-0d45-4bba-a323-494703dee5e3','7af8d873-8ae3-49f3-b8fb-36ab38162eb6','allowed-protocol-mapper-types','saml-user-property-mapper'),('d1202b6c-2f96-47db-b4fb-92fd13af905c','ca4df3c2-3d4d-4d86-b8f4-985e7adb0847','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d57b9ac8-55f4-4c74-b303-d14ed9534f96','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-role-list-mapper'),('d8908b18-bcf9-410b-8a44-f38e67ad99d1','2342704f-aee1-4281-a261-d2066d2ba29f','priority','100'),('da566059-e5d0-46d0-9021-ccd97fdb1031','52c82a70-e1e9-49fb-a57a-19514d10598c','allow-default-scopes','true'),('e029c398-8416-48bc-b05c-9655833d1fd7','c7604a3c-d217-410a-841b-2d3cfe05b6b9','kid','f388d90c-3ed7-497e-9777-b81495c5aa2e'),('e165a097-b37e-4830-b3f0-aade623659f6','b75485a4-f673-4081-9238-4b5e7f5eb222','max-clients','200'),('e4399ff5-cf1b-4ddf-bf84-05b1e236f962','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('eaced2d5-9a38-4c9c-b4a2-652d67d53c18','5c53cb00-f9ce-4284-8238-bc04d6e21c87','keyUse','ENC'),('ef74c6ea-3d2e-4466-9df1-e01fb063aba7','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-user-property-mapper'),('f1467fed-f575-4e12-b308-013d27979eef','ca4df3c2-3d4d-4d86-b8f4-985e7adb0847','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('f3da9c1c-c649-4b40-8117-41c883646205','0bfdf09e-d23d-4d49-9814-08741ba051a8','priority','100'),('f8ab6825-dca5-40ac-8153-47ef2f9bb093','7af8d873-8ae3-49f3-b8fb-36ab38162eb6','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('fb7fa886-d730-4cf3-b278-02cfe76a5d98','2d50517a-69a5-491c-90f2-b4f1fcd226c4','max-clients','200'),('fbf3a768-52ed-4a43-bfed-598d66ada653','ca4df3c2-3d4d-4d86-b8f4-985e7adb0847','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('0c1c204c-7b22-412b-a0a7-a6628d32496f','230cba7f-e58e-4013-861c-2c3033ec4fe5'),('2cdfe598-1ced-4aa3-99f6-783bf8aeff7e','5cbf69d1-7db6-43a5-a170-627721a3c862'),('2cdfe598-1ced-4aa3-99f6-783bf8aeff7e','a3a355f8-2729-4b89-b900-7368caa01823'),('54d5c122-1802-4139-b68d-e2cec2facbb8','09c39e33-cc18-4493-b30a-958b5ccb54aa'),('55c43002-4c16-49ef-87a5-30deaa22314b','8748520e-df8c-448c-b03a-f7e53b6bf973'),('55c43002-4c16-49ef-87a5-30deaa22314b','8f22b474-5230-47a1-82d1-922f73a786e9'),('55c43002-4c16-49ef-87a5-30deaa22314b','92e0c80c-ed04-427a-89da-e936808b8d09'),('55c43002-4c16-49ef-87a5-30deaa22314b','f1a73bfd-e4f4-4346-bf47-0e92b3941990'),('70d0fe77-e963-453b-935e-6984d04c3ea2','029be5cf-c565-4b6d-b87a-cfde88ad29b0'),('82db4c83-e0c7-4a97-aebc-8e1d9989c078','f922daf4-e18f-4a0c-9394-0f566911b38b'),('85206305-901f-4bbf-81f6-ba0b443f0cc0','121fc580-da26-4a10-8ec0-df4ce616d9ee'),('85206305-901f-4bbf-81f6-ba0b443f0cc0','5e1a2a92-35c4-4cca-b820-28894925e5a6'),('85206305-901f-4bbf-81f6-ba0b443f0cc0','82db4c83-e0c7-4a97-aebc-8e1d9989c078'),('85206305-901f-4bbf-81f6-ba0b443f0cc0','d2e2a7fd-97d2-4a87-b694-e9d37c1d4002'),('92e0c80c-ed04-427a-89da-e936808b8d09','2026770f-d9f4-45c6-ad72-901d39ebf1a4'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','26084389-cab9-45fa-93ea-66f47fcdbbd1'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','285bf1b2-c1b4-4581-a161-bd23ac640baa'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','345907e8-7f50-43f5-9c81-624da4d4942b'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','48533797-37fb-479c-b4aa-4f054faed6ac'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','5d43716f-3ca5-48da-9d7d-739f529096dd'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','7460cf09-2886-4829-bcd0-5ccaa42dbd57'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','75b816a1-3b66-4c03-b75a-8b772946c711'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','7d2dda07-06ff-4d4f-89d3-820498596b27'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','a2a6d51e-21d2-43af-8939-bc8358d562b8'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','a633afdc-9331-4419-953e-69c90773f17e'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b4818dfb-4434-41fa-9600-434ca3f5442f'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b54bfb8c-12c5-4d91-8d17-8913208e6765'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b5d2075c-edf2-4415-b121-87b1bd4286f7'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b9839a7b-b519-4c27-bf9f-396e5bb51bb2'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','ca0b5753-e677-420d-bb53-0fc590c08c1e'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d118260b-b1fe-41b8-83e3-48f76748d0fc'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d7263fd7-1aa8-471a-a562-2576e6a886dd'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','f054da5a-1733-4542-b8da-4ba49f1b89ce'),('a700281c-49fd-40ed-a779-ed6ba07e520a','cc54037d-f39e-4fd7-9814-e854a5a507d2'),('b4818dfb-4434-41fa-9600-434ca3f5442f','7d2dda07-06ff-4d4f-89d3-820498596b27'),('b4818dfb-4434-41fa-9600-434ca3f5442f','a633afdc-9331-4419-953e-69c90773f17e'),('d118260b-b1fe-41b8-83e3-48f76748d0fc','d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf'),('d5646728-b756-4e9c-82ec-977bdfba6712','0c1c204c-7b22-412b-a0a7-a6628d32496f'),('d5646728-b756-4e9c-82ec-977bdfba6712','144664f4-d97b-41a7-9d8d-1120a09b38d3'),('d5646728-b756-4e9c-82ec-977bdfba6712','1c1cbd4a-e255-486a-a257-41a9a781201a'),('d5646728-b756-4e9c-82ec-977bdfba6712','230cba7f-e58e-4013-861c-2c3033ec4fe5'),('d5646728-b756-4e9c-82ec-977bdfba6712','2b69980b-ce2d-459c-b572-61f617f1e4bc'),('d5646728-b756-4e9c-82ec-977bdfba6712','2cdfe598-1ced-4aa3-99f6-783bf8aeff7e'),('d5646728-b756-4e9c-82ec-977bdfba6712','3332147e-cd25-4ec7-ac1d-6df0d4f208ce'),('d5646728-b756-4e9c-82ec-977bdfba6712','33368fd9-aa37-48f7-95d5-c32693876db4'),('d5646728-b756-4e9c-82ec-977bdfba6712','367647c9-7887-4dea-8bce-e70cc72b204a'),('d5646728-b756-4e9c-82ec-977bdfba6712','392fcd81-1f26-4b4b-ac2a-05d3cce344bb'),('d5646728-b756-4e9c-82ec-977bdfba6712','3b618f5c-6db5-4ace-9d45-8fd5d763f2c9'),('d5646728-b756-4e9c-82ec-977bdfba6712','411b45bb-9a59-4470-939c-ad5f6c17bb6f'),('d5646728-b756-4e9c-82ec-977bdfba6712','4405a346-26bb-461a-8053-fbba485ff843'),('d5646728-b756-4e9c-82ec-977bdfba6712','44d6fdc1-3f73-4d70-bf23-9635daadd5f3'),('d5646728-b756-4e9c-82ec-977bdfba6712','5cbf69d1-7db6-43a5-a170-627721a3c862'),('d5646728-b756-4e9c-82ec-977bdfba6712','5f1176c9-276f-4398-af11-0e4d263389e0'),('d5646728-b756-4e9c-82ec-977bdfba6712','66bdadab-855b-4bdd-b0ac-26ed643b2f16'),('d5646728-b756-4e9c-82ec-977bdfba6712','67f12d47-68c6-422b-ba20-750566df2326'),('d5646728-b756-4e9c-82ec-977bdfba6712','7bdfff4b-d63b-4cd1-8123-b4b4513efab3'),('d5646728-b756-4e9c-82ec-977bdfba6712','7f398338-2308-417d-a6ae-22f57a44f1a7'),('d5646728-b756-4e9c-82ec-977bdfba6712','822eeda0-53cd-40dd-871a-3925ab66514a'),('d5646728-b756-4e9c-82ec-977bdfba6712','8d2d80f4-c77b-45bf-b8c4-c8108682e622'),('d5646728-b756-4e9c-82ec-977bdfba6712','a35376e3-1b74-4e7e-8b86-8886fbd7eb39'),('d5646728-b756-4e9c-82ec-977bdfba6712','a3a355f8-2729-4b89-b900-7368caa01823'),('d5646728-b756-4e9c-82ec-977bdfba6712','a700281c-49fd-40ed-a779-ed6ba07e520a'),('d5646728-b756-4e9c-82ec-977bdfba6712','ba8def8a-5646-4842-8d7a-829f6a1111df'),('d5646728-b756-4e9c-82ec-977bdfba6712','bdb8bec5-13a4-4e6f-b966-f1ba9948859c'),('d5646728-b756-4e9c-82ec-977bdfba6712','c11f0d98-7b68-455d-bdc3-9b3189f0cb7b'),('d5646728-b756-4e9c-82ec-977bdfba6712','c63b0522-f998-4e5f-9646-bc281a9fc5f4'),('d5646728-b756-4e9c-82ec-977bdfba6712','c803708d-f436-4642-8d00-d19ee91a0796'),('d5646728-b756-4e9c-82ec-977bdfba6712','c8cd5103-a5b5-42d1-adc7-10e7b924e064'),('d5646728-b756-4e9c-82ec-977bdfba6712','cc54037d-f39e-4fd7-9814-e854a5a507d2'),('d5646728-b756-4e9c-82ec-977bdfba6712','dcf65ed8-e847-4329-a532-d95ce8dc0c89'),('d5646728-b756-4e9c-82ec-977bdfba6712','dfb2f437-5d3c-4495-8e9b-d4cc8e1c3791'),('d5646728-b756-4e9c-82ec-977bdfba6712','e463abd8-76c5-4c66-8e64-74ffcc15f138'),('d5646728-b756-4e9c-82ec-977bdfba6712','ed464f43-c5b7-44bc-84c2-a5f22270564e'),('d5646728-b756-4e9c-82ec-977bdfba6712','f93fd46d-a8d5-4356-8f5c-336d30d7e744'),('dea41763-6811-47a0-a1e9-0652e7487c4f','7a33b7d5-afac-418a-ba38-3a4d696d4cbe'),('e463abd8-76c5-4c66-8e64-74ffcc15f138','144664f4-d97b-41a7-9d8d-1120a09b38d3'),('e463abd8-76c5-4c66-8e64-74ffcc15f138','7bdfff4b-d63b-4cd1-8123-b4b4513efab3'),('fe4d170a-d9a2-4cb2-9b27-0eb946917122','f239c50b-b08b-4752-803b-731c19e09184');
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
INSERT INTO `CREDENTIAL` VALUES ('0482f337-e982-4350-89dd-b393dfe95191',NULL,'password','c0486c5d-ea3c-474c-8312-50019412a059',1704574587616,NULL,'{\"value\":\"Qkh4FFcWvPWWlOWjIkhsd1mm7lfMf0U9Bg7/qk2wBqyKnA9kXx4N3xyGWhFSHbyE1LwEFsxswI4D6LmV1od+Ag==\",\"salt\":\"MDfy0K+98jK3TYOSZqEnkQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('d2ab9bf4-0b59-4ab5-b55e-4851bdb9e7b2',NULL,'password','ff034cba-741e-4322-9052-13793d9ea07f',1704574701519,NULL,'{\"value\":\"V0TmOO95P5gE6CZdLFlAO5gdQYLhbXAWikZZVdXZ2HPiX1Qm1A7Ey0h3Hz5aKt8b9ykCdBTUrNjaPWJ4FC9/nA==\",\"salt\":\"E8lVmXW/EQbPpzHOiZ6Y6g==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-01-06 20:34:56',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-01-06 20:34:56',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-01-06 20:34:56',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-01-06 20:34:56',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-01-06 20:34:58',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-01-06 20:34:58',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-01-06 20:35:00',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-01-06 20:35:00',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-01-06 20:35:00',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-01-06 20:35:02',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-01-06 20:35:02',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-01-06 20:35:02',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-01-06 20:35:03',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-01-06 20:35:03',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-01-06 20:35:03',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-01-06 20:35:03',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-01-06 20:35:03',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-01-06 20:35:04',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-01-06 20:35:05',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-01-06 20:35:05',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-01-06 20:35:05',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-01-06 20:35:05',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-01-06 20:35:05',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-01-06 20:35:05',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-01-06 20:35:05',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4573291556'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-01-06 20:35:06',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-01-06 20:35:07',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-01-06 20:35:07',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'4573291556'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-01-06 20:35:08',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-01-06 20:35:08',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-01-06 20:35:09',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-01-06 20:35:09',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'4573291556'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-01-06 20:35:09',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'4573291556'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-01-06 20:35:09',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-01-06 20:35:10',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-01-06 20:35:11',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4573291556'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-01-06 20:35:11',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'4573291556'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-01-06 20:35:11',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-01-06 20:35:11',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-01-06 20:35:11',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-01-06 20:35:11',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-01-06 20:35:11',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-01-06 20:35:12',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-01-06 20:35:12',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-01-06 20:35:12',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-01-06 20:35:12',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-01-06 20:35:12',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-01-06 20:35:13',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-01-06 20:35:14',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-01-06 20:35:15',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-01-06 20:35:15',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-01-06 20:35:15',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-01-06 20:35:15',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4573291556'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-01-06 20:35:15',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-01-06 20:35:15',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-01-06 20:35:15',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-01-06 20:35:15',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-01-06 20:35:17',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-01-06 20:35:18',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-01-06 20:35:18',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-01-06 20:35:18',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-01-06 20:35:18',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-01-06 20:35:18',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-01-06 20:35:18',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-01-06 20:35:18',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-01-06 20:35:19',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-01-06 20:35:19',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-01-06 20:35:19',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-01-06 20:35:19',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-01-06 20:35:19',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4573291556'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-01-06 20:35:19',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'4573291556'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-01-06 20:35:19',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'4573291556'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-01-06 20:35:19',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'4573291556'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-01-06 20:35:19',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'4573291556'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-01-06 20:35:19',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-01-06 20:35:20',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'4573291556'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-01-06 20:35:20',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'4573291556'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-01-06 20:35:20',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-01-06 20:35:21',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-01-06 20:35:21',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-01-06 20:35:21',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'4573291556'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-01-06 20:35:21',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'4573291556'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-01-06 20:35:21',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'4573291556'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-01-06 20:35:21',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'4573291556'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-01-06 20:35:21',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'4573291556'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-01-06 20:35:21',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'4573291556'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-01-06 20:35:21',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-01-06 20:35:21',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'4573291556'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-01-06 20:35:21',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'4573291556'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-01-06 20:35:21',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'4573291556'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-01-06 20:35:21',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'4573291556'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-01-06 20:35:21',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-01-06 20:35:21',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'4573291556'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-01-06 20:35:22',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'4573291556'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-01-06 20:35:22',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'4573291556'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-01-06 20:35:22',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'4573291556'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-01-06 20:35:22',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'4573291556'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-01-06 20:35:22',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'4573291556'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-01-06 20:35:22',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'4573291556'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-01-06 20:35:22',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'4573291556'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-01-06 20:35:22',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'4573291556'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-01-06 20:35:22',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'4573291556'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-01-06 20:35:22',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'4573291556'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-01-06 20:35:22',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'4573291556');
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
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','0459b0c0-8556-49fc-be22-4259d3982980',_binary '\0'),('master','12c40e00-02f3-4059-a146-7f3257f69707',_binary ''),('master','199dd783-27bd-4f01-a62f-6cc3be89eede',_binary ''),('master','50e23a8a-f7f2-4a62-a033-a2d4a452fa4c',_binary '\0'),('master','7ec6698b-2ab6-4698-9ac9-5719ec269a9b',_binary '\0'),('master','8510f411-9388-4823-9963-b4d5a71aaaf7',_binary ''),('master','949f5a06-e4fb-4f9d-8236-e1b1b615fb3d',_binary ''),('master','d0863bd0-e30a-43f7-baf6-63063e2b1fe2',_binary ''),('master','f056ea25-a0f8-46a6-abe2-80dc57eb835a',_binary '\0'),('siglo21','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('siglo21','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('siglo21','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('siglo21','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('siglo21','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('siglo21','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('siglo21','b229e7fc-3666-4f8f-b02d-0f24dc04e851',_binary ''),('siglo21','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('siglo21','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `numero_factura` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion_envio` varchar(255) DEFAULT NULL,
  `entre_calles` varchar(255) DEFAULT NULL,
  `envio_externo` bit(1) DEFAULT NULL,
  `fuera_de_ciclo` bit(1) DEFAULT NULL,
  `intentos` int DEFAULT NULL,
  `tipo_envio` int DEFAULT NULL,
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('029be5cf-c565-4b6d-b87a-cfde88ad29b0','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-consent}','view-consent','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('09c39e33-cc18-4493-b30a-958b5ccb54aa','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','administrador-cliente-rol','administrador-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('0c1c204c-7b22-412b-a0a7-a6628d32496f','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_view-clients}','view-clients','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('121fc580-da26-4a10-8ec0-df4ce616d9ee','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('12cc4ee0-9194-49d7-bc7b-1309e107e4ce','0ca2e86b-131e-454d-95a7-c124ad72b7cb',_binary '','${role_read-token}','read-token','siglo21','0ca2e86b-131e-454d-95a7-c124ad72b7cb',NULL),('144664f4-d97b-41a7-9d8d-1120a09b38d3','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_query-users}','query-users','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('1c1cbd4a-e255-486a-a257-41a9a781201a','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_manage-users}','manage-users','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('2026770f-d9f4-45c6-ad72-901d39ebf1a4','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-account-links}','manage-account-links','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('230cba7f-e58e-4013-861c-2c3033ec4fe5','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_query-clients}','query-clients','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('26084389-cab9-45fa-93ea-66f47fcdbbd1','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','vendedor-cliente-rol','vendedor-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('285bf1b2-c1b4-4581-a161-bd23ac640baa','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-identity-providers}','manage-identity-providers','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('2b69980b-ce2d-459c-b572-61f617f1e4bc','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_manage-events}','manage-events','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('2cdfe598-1ced-4aa3-99f6-783bf8aeff7e','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_view-users}','view-users','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('3332147e-cd25-4ec7-ac1d-6df0d4f208ce','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_view-authorization}','view-authorization','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('33368fd9-aa37-48f7-95d5-c32693876db4','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_manage-clients}','manage-clients','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('345907e8-7f50-43f5-9c81-624da4d4942b','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-realm}','manage-realm','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('367647c9-7887-4dea-8bce-e70cc72b204a','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_manage-events}','manage-events','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('37ea8aa2-aac9-42d9-8405-803940f20d1f','b9ff790a-1104-4307-bb5b-a3d69c112dcb',_binary '','${role_delete-account}','delete-account','master','b9ff790a-1104-4307-bb5b-a3d69c112dcb',NULL),('392fcd81-1f26-4b4b-ac2a-05d3cce344bb','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('3b618f5c-6db5-4ace-9d45-8fd5d763f2c9','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_view-identity-providers}','view-identity-providers','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('411b45bb-9a59-4470-939c-ad5f6c17bb6f','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_impersonation}','impersonation','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('4405a346-26bb-461a-8053-fbba485ff843','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_manage-authorization}','manage-authorization','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('44d6fdc1-3f73-4d70-bf23-9635daadd5f3','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_view-identity-providers}','view-identity-providers','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('48533797-37fb-479c-b4aa-4f054faed6ac','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-users}','manage-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('54d5c122-1802-4139-b68d-e2cec2facbb8','siglo21',_binary '\0','adminitrador de rol realm','administrador','siglo21',NULL,NULL),('55c43002-4c16-49ef-87a5-30deaa22314b','siglo21',_binary '\0','${role_default-roles}','default-roles-siglo21','siglo21',NULL,NULL),('5cbf69d1-7db6-43a5-a170-627721a3c862','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_query-groups}','query-groups','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('5d43716f-3ca5-48da-9d7d-739f529096dd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-clients}','manage-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('5e1a2a92-35c4-4cca-b820-28894925e5a6','b9ff790a-1104-4307-bb5b-a3d69c112dcb',_binary '','${role_view-profile}','view-profile','master','b9ff790a-1104-4307-bb5b-a3d69c112dcb',NULL),('5f1176c9-276f-4398-af11-0e4d263389e0','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_manage-realm}','manage-realm','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('61de6b38-c7ee-4258-b9f4-6deb8c558e17','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-applications}','view-applications','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('66bdadab-855b-4bdd-b0ac-26ed643b2f16','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('67f12d47-68c6-422b-ba20-750566df2326','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_query-realms}','query-realms','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('70d0fe77-e963-453b-935e-6984d04c3ea2','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-consent}','manage-consent','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('7460cf09-2886-4829-bcd0-5ccaa42dbd57','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-authorization}','manage-authorization','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('75b816a1-3b66-4c03-b75a-8b772946c711','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-events}','manage-events','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('7a33b7d5-afac-418a-ba38-3a4d696d4cbe','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','repartidor-cliente-rol','repartidor-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('7bdfff4b-d63b-4cd1-8123-b4b4513efab3','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_query-groups}','query-groups','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('7d2dda07-06ff-4d4f-89d3-820498596b27','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-groups}','query-groups','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('7f398338-2308-417d-a6ae-22f57a44f1a7','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_manage-realm}','manage-realm','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('822eeda0-53cd-40dd-871a-3925ab66514a','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_create-client}','create-client','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('82db4c83-e0c7-4a97-aebc-8e1d9989c078','b9ff790a-1104-4307-bb5b-a3d69c112dcb',_binary '','${role_manage-account}','manage-account','master','b9ff790a-1104-4307-bb5b-a3d69c112dcb',NULL),('85206305-901f-4bbf-81f6-ba0b443f0cc0','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('8748520e-df8c-448c-b03a-f7e53b6bf973','siglo21',_binary '\0','${role_offline-access}','offline_access','siglo21',NULL,NULL),('8d2d80f4-c77b-45bf-b8c4-c8108682e622','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_view-events}','view-events','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('8f22b474-5230-47a1-82d1-922f73a786e9','siglo21',_binary '\0','${role_uma_authorization}','uma_authorization','siglo21',NULL,NULL),('92e0c80c-ed04-427a-89da-e936808b8d09','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-account}','manage-account','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','siglo21',_binary '\0','','vendedor','siglo21',NULL,NULL),('a2985b44-6932-4911-83cc-203610c10505','f3267da5-5420-44ae-b664-1e628901472a',_binary '','${role_read-token}','read-token','master','f3267da5-5420-44ae-b664-1e628901472a',NULL),('a2a6d51e-21d2-43af-8939-bc8358d562b8','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_impersonation}','impersonation','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a35376e3-1b74-4e7e-8b86-8886fbd7eb39','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_impersonation}','impersonation','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('a3a355f8-2729-4b89-b900-7368caa01823','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_query-users}','query-users','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_realm-admin}','realm-admin','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a633afdc-9331-4419-953e-69c90773f17e','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-users}','query-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a700281c-49fd-40ed-a779-ed6ba07e520a','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_view-clients}','view-clients','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('b4818dfb-4434-41fa-9600-434ca3f5442f','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-users}','view-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b54bfb8c-12c5-4d91-8d17-8913208e6765','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_create-client}','create-client','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b5d2075c-edf2-4415-b121-87b1bd4286f7','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-events}','view-events','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b9839a7b-b519-4c27-bf9f-396e5bb51bb2','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-authorization}','view-authorization','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('ba8def8a-5646-4842-8d7a-829f6a1111df','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_query-realms}','query-realms','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('bc14c33f-33cd-4a14-9ce1-e0f9183536ec','b9ff790a-1104-4307-bb5b-a3d69c112dcb',_binary '','${role_view-applications}','view-applications','master','b9ff790a-1104-4307-bb5b-a3d69c112dcb',NULL),('bdb8bec5-13a4-4e6f-b966-f1ba9948859c','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_manage-clients}','manage-clients','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('c11f0d98-7b68-455d-bdc3-9b3189f0cb7b','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_manage-authorization}','manage-authorization','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('c63b0522-f998-4e5f-9646-bc281a9fc5f4','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('c803708d-f436-4642-8d00-d19ee91a0796','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_view-authorization}','view-authorization','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('c8cd5103-a5b5-42d1-adc7-10e7b924e064','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_manage-users}','manage-users','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('ca0b5753-e677-420d-bb53-0fc590c08c1e','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-realm}','view-realm','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('cc54037d-f39e-4fd7-9814-e854a5a507d2','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_query-clients}','query-clients','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('d118260b-b1fe-41b8-83e3-48f76748d0fc','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-clients}','view-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d2e2a7fd-97d2-4a87-b694-e9d37c1d4002','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('d5646728-b756-4e9c-82ec-977bdfba6712','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-clients}','query-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d7263fd7-1aa8-471a-a562-2576e6a886dd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-realms}','query-realms','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d8d693d5-a021-427f-8151-fad696e79b50','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_delete-account}','delete-account','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('dcf65ed8-e847-4329-a532-d95ce8dc0c89','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_view-events}','view-events','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('dea41763-6811-47a0-a1e9-0652e7487c4f','siglo21',_binary '\0',NULL,'repartidor','siglo21',NULL,NULL),('dfb2f437-5d3c-4495-8e9b-d4cc8e1c3791','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_view-realm}','view-realm','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('e463abd8-76c5-4c66-8e64-74ffcc15f138','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_view-users}','view-users','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('ed464f43-c5b7-44bc-84c2-a5f22270564e','020a93a9-334b-44a8-947e-ab49181011b8',_binary '','${role_view-realm}','view-realm','master','020a93a9-334b-44a8-947e-ab49181011b8',NULL),('f054da5a-1733-4542-b8da-4ba49f1b89ce','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-identity-providers}','view-identity-providers','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('f1a73bfd-e4f4-4346-bf47-0e92b3941990','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-profile}','view-profile','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('f239c50b-b08b-4752-803b-731c19e09184','b9ff790a-1104-4307-bb5b-a3d69c112dcb',_binary '','${role_view-consent}','view-consent','master','b9ff790a-1104-4307-bb5b-a3d69c112dcb',NULL),('f922daf4-e18f-4a0c-9394-0f566911b38b','b9ff790a-1104-4307-bb5b-a3d69c112dcb',_binary '','${role_manage-account-links}','manage-account-links','master','b9ff790a-1104-4307-bb5b-a3d69c112dcb',NULL),('f93fd46d-a8d5-4356-8f5c-336d30d7e744','934e910b-94f9-40a5-a52f-b3906200e17d',_binary '','${role_create-client}','create-client','master','934e910b-94f9-40a5-a52f-b3906200e17d',NULL),('fe4d170a-d9a2-4cb2-9b27-0eb946917122','b9ff790a-1104-4307-bb5b-a3d69c112dcb',_binary '','${role_manage-consent}','manage-consent','master','b9ff790a-1104-4307-bb5b-a3d69c112dcb',NULL);
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
INSERT INTO `MIGRATION_MODEL` VALUES ('1lfl0','16.1.1',1704573324);
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('04e63f21-3695-46c3-a4b2-7eb3cf700f51','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'949f5a06-e4fb-4f9d-8236-e1b1b615fb3d'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','openid-connect','oidc-usermodel-property-mapper',NULL,'313cd6d5-afa3-4d09-bec6-8e059c9718c3'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'80a98201-a009-4f95-a8d9-67b46623f54d'),('10f646c5-9948-4905-989e-007ae0284f86','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'f056ea25-a0f8-46a6-abe2-80dc57eb835a'),('13d1e141-77af-496a-862f-7f68ceee4460','username','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('17b080be-49b5-4046-918b-431bdf551b67','audience resolve','openid-connect','oidc-audience-resolve-mapper','30cf30bd-693f-4790-bcd9-7d0b90bb8d5a',NULL),('1899b95c-44da-4add-abea-6885c7648271','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'28963099-19d3-4521-a02f-976d9671e893'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('213b51c3-c847-4755-9f64-5213bc283f52','email','openid-connect','oidc-usermodel-property-mapper',NULL,'8510f411-9388-4823-9963-b4d5a71aaaf7'),('2727d65e-5253-4d00-a5f3-45abc506f73c','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0459b0c0-8556-49fc-be22-4259d3982980'),('29438da0-315c-45aa-9061-7746502f6008','address','openid-connect','oidc-address-mapper',NULL,'da127315-5241-4a8f-a46a-6bea0de8925e'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'313cd6d5-afa3-4d09-bec6-8e059c9718c3'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3868a754-0d1c-499d-b947-df58ac37301e','username','openid-connect','oidc-usermodel-property-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('432acee5-836c-44e0-8f8a-6ab765801d1f','role list','saml','saml-role-list-mapper',NULL,'b229e7fc-3666-4f8f-b02d-0f24dc04e851'),('476cac2c-f98d-4380-a4b8-7a9eb600e63a','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('586c78e8-c953-4c64-96ea-5749101cf4a6','locale','openid-connect','oidc-usermodel-attribute-mapper','d2098f46-e3f9-4c64-88a6-96c4cab5d87d',NULL),('5b4575b9-5bcb-433a-a25d-e2534ec246e6','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'949f5a06-e4fb-4f9d-8236-e1b1b615fb3d'),('5ca9187b-1af8-4afd-96af-efc25fe82f31','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'8510f411-9388-4823-9963-b4d5a71aaaf7'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('6b92663a-c77b-4c5f-a8d2-a7661213b73b','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('6cd13235-e2ed-4369-a76a-2d6a54217301','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'f056ea25-a0f8-46a6-abe2-80dc57eb835a'),('6ff7299d-f336-4115-8ee6-799dcb4d68bc','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('734ebc5d-95d1-496e-9952-17066ad99f50','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('75264056-cc2b-4748-9bbb-a6309b858857','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','openid-connect','oidc-usermodel-attribute-mapper','42ce5f39-f315-496d-881f-7de13ac3ae08',NULL),('874cfa64-4ead-4591-b389-5681dc18986c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('89e04be0-21f1-4308-ab7b-60561525cb93','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('944ac98f-42ce-4568-8e4e-de1595524b3d','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('9a348217-186b-4e76-b042-7609ac2d6d48','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'0459b0c0-8556-49fc-be22-4259d3982980'),('9a57aa55-84d9-4788-9c23-4fe0ea40e9e6','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'199dd783-27bd-4f01-a62f-6cc3be89eede'),('9b1fd3b7-1a35-4a09-941b-21526dac6a7d','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('9f5f58f9-09f8-49a5-80d7-2a7564c1b974','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('acf4f88b-60dc-417b-98db-80c9d2977de2','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('b14261e7-9be7-4878-a12e-fbf0616415f8','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','full name','openid-connect','oidc-full-name-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('bc99959b-7558-4797-b663-39676e5935b1','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'80a98201-a009-4f95-a8d9-67b46623f54d'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'28963099-19d3-4521-a02f-976d9671e893'),('cc7598bb-61ac-452c-9a62-f8a3ede6f805','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('d08c5a38-1264-4e56-a0e6-d6a0190d30cb','role list','saml','saml-role-list-mapper',NULL,'d0863bd0-e30a-43f7-baf6-63063e2b1fe2'),('d8951284-ffd8-4f4f-9f1b-94ac177b203d','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'b39fe518-d02f-4eac-942b-eeddf878c80f'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('e085b8a8-5335-4a66-84e3-6ba29ffe0cc8','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'949f5a06-e4fb-4f9d-8236-e1b1b615fb3d'),('e0f9092a-e130-48ff-94f3-12c0938abda4','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('e741e6f6-010c-4629-b840-b47521b97782','full name','openid-connect','oidc-full-name-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('ed3963dc-91a9-40da-8e08-cfc7f8a76021','address','openid-connect','oidc-address-mapper',NULL,'7ec6698b-2ab6-4698-9ac9-5719ec269a9b'),('f26c6c54-2250-4868-8423-cfa4a611eacf','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'12c40e00-02f3-4059-a146-7f3257f69707'),('f3e86a76-5c1b-4052-8209-84b4f8dcc41d','audience resolve','openid-connect','oidc-audience-resolve-mapper','0b95e7b8-076d-49c8-919f-a9e8c94ae199',NULL);
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('04e63f21-3695-46c3-a4b2-7eb3cf700f51','true','access.token.claim'),('04e63f21-3695-46c3-a4b2-7eb3cf700f51','resource_access.${client_id}.roles','claim.name'),('04e63f21-3695-46c3-a4b2-7eb3cf700f51','String','jsonType.label'),('04e63f21-3695-46c3-a4b2-7eb3cf700f51','true','multivalued'),('04e63f21-3695-46c3-a4b2-7eb3cf700f51','foo','user.attribute'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','access.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','claim.name'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','id.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','String','jsonType.label'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','user.attribute'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','userinfo.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','access.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middle_name','claim.name'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','id.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','String','jsonType.label'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middleName','user.attribute'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','userinfo.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','access.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','upn','claim.name'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','id.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','String','jsonType.label'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','username','user.attribute'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','userinfo.token.claim'),('10f646c5-9948-4905-989e-007ae0284f86','true','access.token.claim'),('10f646c5-9948-4905-989e-007ae0284f86','groups','claim.name'),('10f646c5-9948-4905-989e-007ae0284f86','true','id.token.claim'),('10f646c5-9948-4905-989e-007ae0284f86','String','jsonType.label'),('10f646c5-9948-4905-989e-007ae0284f86','true','multivalued'),('10f646c5-9948-4905-989e-007ae0284f86','foo','user.attribute'),('13d1e141-77af-496a-862f-7f68ceee4460','true','access.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','preferred_username','claim.name'),('13d1e141-77af-496a-862f-7f68ceee4460','true','id.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','String','jsonType.label'),('13d1e141-77af-496a-862f-7f68ceee4460','username','user.attribute'),('13d1e141-77af-496a-862f-7f68ceee4460','true','userinfo.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','true','access.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','phone_number_verified','claim.name'),('1899b95c-44da-4add-abea-6885c7648271','true','id.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','boolean','jsonType.label'),('1899b95c-44da-4add-abea-6885c7648271','phoneNumberVerified','user.attribute'),('1899b95c-44da-4add-abea-6885c7648271','true','userinfo.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','access.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','claim.name'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','id.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','String','jsonType.label'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','user.attribute'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','userinfo.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','access.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','given_name','claim.name'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','id.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','String','jsonType.label'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','firstName','user.attribute'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','userinfo.token.claim'),('213b51c3-c847-4755-9f64-5213bc283f52','true','access.token.claim'),('213b51c3-c847-4755-9f64-5213bc283f52','email','claim.name'),('213b51c3-c847-4755-9f64-5213bc283f52','true','id.token.claim'),('213b51c3-c847-4755-9f64-5213bc283f52','String','jsonType.label'),('213b51c3-c847-4755-9f64-5213bc283f52','email','user.attribute'),('213b51c3-c847-4755-9f64-5213bc283f52','true','userinfo.token.claim'),('2727d65e-5253-4d00-a5f3-45abc506f73c','true','access.token.claim'),('2727d65e-5253-4d00-a5f3-45abc506f73c','phone_number_verified','claim.name'),('2727d65e-5253-4d00-a5f3-45abc506f73c','true','id.token.claim'),('2727d65e-5253-4d00-a5f3-45abc506f73c','boolean','jsonType.label'),('2727d65e-5253-4d00-a5f3-45abc506f73c','phoneNumberVerified','user.attribute'),('2727d65e-5253-4d00-a5f3-45abc506f73c','true','userinfo.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','true','access.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','true','id.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','country','user.attribute.country'),('29438da0-315c-45aa-9061-7746502f6008','formatted','user.attribute.formatted'),('29438da0-315c-45aa-9061-7746502f6008','locality','user.attribute.locality'),('29438da0-315c-45aa-9061-7746502f6008','postal_code','user.attribute.postal_code'),('29438da0-315c-45aa-9061-7746502f6008','region','user.attribute.region'),('29438da0-315c-45aa-9061-7746502f6008','street','user.attribute.street'),('29438da0-315c-45aa-9061-7746502f6008','true','userinfo.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','access.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','email_verified','claim.name'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','id.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','boolean','jsonType.label'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','emailVerified','user.attribute'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','userinfo.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','access.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','claim.name'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','id.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','String','jsonType.label'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','user.attribute'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','userinfo.token.claim'),('3868a754-0d1c-499d-b947-df58ac37301e','true','access.token.claim'),('3868a754-0d1c-499d-b947-df58ac37301e','preferred_username','claim.name'),('3868a754-0d1c-499d-b947-df58ac37301e','true','id.token.claim'),('3868a754-0d1c-499d-b947-df58ac37301e','String','jsonType.label'),('3868a754-0d1c-499d-b947-df58ac37301e','username','user.attribute'),('3868a754-0d1c-499d-b947-df58ac37301e','true','userinfo.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','access.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','claim.name'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','id.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','String','jsonType.label'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','user.attribute'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','userinfo.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','access.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','claim.name'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','id.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','String','jsonType.label'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','user.attribute'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','userinfo.token.claim'),('432acee5-836c-44e0-8f8a-6ab765801d1f','Role','attribute.name'),('432acee5-836c-44e0-8f8a-6ab765801d1f','Basic','attribute.nameformat'),('432acee5-836c-44e0-8f8a-6ab765801d1f','false','single'),('476cac2c-f98d-4380-a4b8-7a9eb600e63a','true','access.token.claim'),('476cac2c-f98d-4380-a4b8-7a9eb600e63a','website','claim.name'),('476cac2c-f98d-4380-a4b8-7a9eb600e63a','true','id.token.claim'),('476cac2c-f98d-4380-a4b8-7a9eb600e63a','String','jsonType.label'),('476cac2c-f98d-4380-a4b8-7a9eb600e63a','website','user.attribute'),('476cac2c-f98d-4380-a4b8-7a9eb600e63a','true','userinfo.token.claim'),('586c78e8-c953-4c64-96ea-5749101cf4a6','true','access.token.claim'),('586c78e8-c953-4c64-96ea-5749101cf4a6','locale','claim.name'),('586c78e8-c953-4c64-96ea-5749101cf4a6','true','id.token.claim'),('586c78e8-c953-4c64-96ea-5749101cf4a6','String','jsonType.label'),('586c78e8-c953-4c64-96ea-5749101cf4a6','locale','user.attribute'),('586c78e8-c953-4c64-96ea-5749101cf4a6','true','userinfo.token.claim'),('5ca9187b-1af8-4afd-96af-efc25fe82f31','true','access.token.claim'),('5ca9187b-1af8-4afd-96af-efc25fe82f31','email_verified','claim.name'),('5ca9187b-1af8-4afd-96af-efc25fe82f31','true','id.token.claim'),('5ca9187b-1af8-4afd-96af-efc25fe82f31','boolean','jsonType.label'),('5ca9187b-1af8-4afd-96af-efc25fe82f31','emailVerified','user.attribute'),('5ca9187b-1af8-4afd-96af-efc25fe82f31','true','userinfo.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','access.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','claim.name'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','id.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','String','jsonType.label'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','user.attribute'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','userinfo.token.claim'),('6b92663a-c77b-4c5f-a8d2-a7661213b73b','true','access.token.claim'),('6b92663a-c77b-4c5f-a8d2-a7661213b73b','locale','claim.name'),('6b92663a-c77b-4c5f-a8d2-a7661213b73b','true','id.token.claim'),('6b92663a-c77b-4c5f-a8d2-a7661213b73b','String','jsonType.label'),('6b92663a-c77b-4c5f-a8d2-a7661213b73b','locale','user.attribute'),('6b92663a-c77b-4c5f-a8d2-a7661213b73b','true','userinfo.token.claim'),('6cd13235-e2ed-4369-a76a-2d6a54217301','true','access.token.claim'),('6cd13235-e2ed-4369-a76a-2d6a54217301','upn','claim.name'),('6cd13235-e2ed-4369-a76a-2d6a54217301','true','id.token.claim'),('6cd13235-e2ed-4369-a76a-2d6a54217301','String','jsonType.label'),('6cd13235-e2ed-4369-a76a-2d6a54217301','username','user.attribute'),('6cd13235-e2ed-4369-a76a-2d6a54217301','true','userinfo.token.claim'),('6ff7299d-f336-4115-8ee6-799dcb4d68bc','true','access.token.claim'),('6ff7299d-f336-4115-8ee6-799dcb4d68bc','given_name','claim.name'),('6ff7299d-f336-4115-8ee6-799dcb4d68bc','true','id.token.claim'),('6ff7299d-f336-4115-8ee6-799dcb4d68bc','String','jsonType.label'),('6ff7299d-f336-4115-8ee6-799dcb4d68bc','firstName','user.attribute'),('6ff7299d-f336-4115-8ee6-799dcb4d68bc','true','userinfo.token.claim'),('734ebc5d-95d1-496e-9952-17066ad99f50','true','access.token.claim'),('734ebc5d-95d1-496e-9952-17066ad99f50','realm_access.roles','claim.name'),('734ebc5d-95d1-496e-9952-17066ad99f50','String','jsonType.label'),('734ebc5d-95d1-496e-9952-17066ad99f50','true','multivalued'),('734ebc5d-95d1-496e-9952-17066ad99f50','foo','user.attribute'),('75264056-cc2b-4748-9bbb-a6309b858857','true','access.token.claim'),('75264056-cc2b-4748-9bbb-a6309b858857','updated_at','claim.name'),('75264056-cc2b-4748-9bbb-a6309b858857','true','id.token.claim'),('75264056-cc2b-4748-9bbb-a6309b858857','String','jsonType.label'),('75264056-cc2b-4748-9bbb-a6309b858857','updatedAt','user.attribute'),('75264056-cc2b-4748-9bbb-a6309b858857','true','userinfo.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','access.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','claim.name'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','id.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','String','jsonType.label'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','user.attribute'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','userinfo.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','true','access.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','claim.name'),('874cfa64-4ead-4591-b389-5681dc18986c','true','id.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','String','jsonType.label'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','user.attribute'),('874cfa64-4ead-4591-b389-5681dc18986c','true','userinfo.token.claim'),('89e04be0-21f1-4308-ab7b-60561525cb93','true','access.token.claim'),('89e04be0-21f1-4308-ab7b-60561525cb93','gender','claim.name'),('89e04be0-21f1-4308-ab7b-60561525cb93','true','id.token.claim'),('89e04be0-21f1-4308-ab7b-60561525cb93','String','jsonType.label'),('89e04be0-21f1-4308-ab7b-60561525cb93','gender','user.attribute'),('89e04be0-21f1-4308-ab7b-60561525cb93','true','userinfo.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','access.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','claim.name'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','id.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','String','jsonType.label'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','user.attribute'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','userinfo.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','access.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updated_at','claim.name'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','id.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','String','jsonType.label'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updatedAt','user.attribute'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','userinfo.token.claim'),('9a348217-186b-4e76-b042-7609ac2d6d48','true','access.token.claim'),('9a348217-186b-4e76-b042-7609ac2d6d48','phone_number','claim.name'),('9a348217-186b-4e76-b042-7609ac2d6d48','true','id.token.claim'),('9a348217-186b-4e76-b042-7609ac2d6d48','String','jsonType.label'),('9a348217-186b-4e76-b042-7609ac2d6d48','phoneNumber','user.attribute'),('9a348217-186b-4e76-b042-7609ac2d6d48','true','userinfo.token.claim'),('9b1fd3b7-1a35-4a09-941b-21526dac6a7d','true','access.token.claim'),('9b1fd3b7-1a35-4a09-941b-21526dac6a7d','middle_name','claim.name'),('9b1fd3b7-1a35-4a09-941b-21526dac6a7d','true','id.token.claim'),('9b1fd3b7-1a35-4a09-941b-21526dac6a7d','String','jsonType.label'),('9b1fd3b7-1a35-4a09-941b-21526dac6a7d','middleName','user.attribute'),('9b1fd3b7-1a35-4a09-941b-21526dac6a7d','true','userinfo.token.claim'),('9f5f58f9-09f8-49a5-80d7-2a7564c1b974','true','access.token.claim'),('9f5f58f9-09f8-49a5-80d7-2a7564c1b974','profile','claim.name'),('9f5f58f9-09f8-49a5-80d7-2a7564c1b974','true','id.token.claim'),('9f5f58f9-09f8-49a5-80d7-2a7564c1b974','String','jsonType.label'),('9f5f58f9-09f8-49a5-80d7-2a7564c1b974','profile','user.attribute'),('9f5f58f9-09f8-49a5-80d7-2a7564c1b974','true','userinfo.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','access.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','family_name','claim.name'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','id.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','String','jsonType.label'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','lastName','user.attribute'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','userinfo.token.claim'),('acf4f88b-60dc-417b-98db-80c9d2977de2','true','access.token.claim'),('acf4f88b-60dc-417b-98db-80c9d2977de2','family_name','claim.name'),('acf4f88b-60dc-417b-98db-80c9d2977de2','true','id.token.claim'),('acf4f88b-60dc-417b-98db-80c9d2977de2','String','jsonType.label'),('acf4f88b-60dc-417b-98db-80c9d2977de2','lastName','user.attribute'),('acf4f88b-60dc-417b-98db-80c9d2977de2','true','userinfo.token.claim'),('b14261e7-9be7-4878-a12e-fbf0616415f8','true','access.token.claim'),('b14261e7-9be7-4878-a12e-fbf0616415f8','zoneinfo','claim.name'),('b14261e7-9be7-4878-a12e-fbf0616415f8','true','id.token.claim'),('b14261e7-9be7-4878-a12e-fbf0616415f8','String','jsonType.label'),('b14261e7-9be7-4878-a12e-fbf0616415f8','zoneinfo','user.attribute'),('b14261e7-9be7-4878-a12e-fbf0616415f8','true','userinfo.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','access.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','id.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','userinfo.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','true','access.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','groups','claim.name'),('bc99959b-7558-4797-b663-39676e5935b1','true','id.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','String','jsonType.label'),('bc99959b-7558-4797-b663-39676e5935b1','true','multivalued'),('bc99959b-7558-4797-b663-39676e5935b1','foo','user.attribute'),('bc99959b-7558-4797-b663-39676e5935b1','true','userinfo.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','access.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','claim.name'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','id.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','String','jsonType.label'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','user.attribute'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','userinfo.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','access.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phone_number','claim.name'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','id.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','String','jsonType.label'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phoneNumber','user.attribute'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','userinfo.token.claim'),('cc7598bb-61ac-452c-9a62-f8a3ede6f805','true','access.token.claim'),('cc7598bb-61ac-452c-9a62-f8a3ede6f805','picture','claim.name'),('cc7598bb-61ac-452c-9a62-f8a3ede6f805','true','id.token.claim'),('cc7598bb-61ac-452c-9a62-f8a3ede6f805','String','jsonType.label'),('cc7598bb-61ac-452c-9a62-f8a3ede6f805','picture','user.attribute'),('cc7598bb-61ac-452c-9a62-f8a3ede6f805','true','userinfo.token.claim'),('d08c5a38-1264-4e56-a0e6-d6a0190d30cb','Role','attribute.name'),('d08c5a38-1264-4e56-a0e6-d6a0190d30cb','Basic','attribute.nameformat'),('d08c5a38-1264-4e56-a0e6-d6a0190d30cb','false','single'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','true','access.token.claim'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','resource_access.${client_id}.roles','claim.name'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','String','jsonType.label'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','true','multivalued'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','foo','user.attribute'),('e085b8a8-5335-4a66-84e3-6ba29ffe0cc8','true','access.token.claim'),('e085b8a8-5335-4a66-84e3-6ba29ffe0cc8','realm_access.roles','claim.name'),('e085b8a8-5335-4a66-84e3-6ba29ffe0cc8','String','jsonType.label'),('e085b8a8-5335-4a66-84e3-6ba29ffe0cc8','true','multivalued'),('e085b8a8-5335-4a66-84e3-6ba29ffe0cc8','foo','user.attribute'),('e0f9092a-e130-48ff-94f3-12c0938abda4','true','access.token.claim'),('e0f9092a-e130-48ff-94f3-12c0938abda4','nickname','claim.name'),('e0f9092a-e130-48ff-94f3-12c0938abda4','true','id.token.claim'),('e0f9092a-e130-48ff-94f3-12c0938abda4','String','jsonType.label'),('e0f9092a-e130-48ff-94f3-12c0938abda4','nickname','user.attribute'),('e0f9092a-e130-48ff-94f3-12c0938abda4','true','userinfo.token.claim'),('e741e6f6-010c-4629-b840-b47521b97782','true','access.token.claim'),('e741e6f6-010c-4629-b840-b47521b97782','true','id.token.claim'),('e741e6f6-010c-4629-b840-b47521b97782','true','userinfo.token.claim'),('ed3963dc-91a9-40da-8e08-cfc7f8a76021','true','access.token.claim'),('ed3963dc-91a9-40da-8e08-cfc7f8a76021','true','id.token.claim'),('ed3963dc-91a9-40da-8e08-cfc7f8a76021','country','user.attribute.country'),('ed3963dc-91a9-40da-8e08-cfc7f8a76021','formatted','user.attribute.formatted'),('ed3963dc-91a9-40da-8e08-cfc7f8a76021','locality','user.attribute.locality'),('ed3963dc-91a9-40da-8e08-cfc7f8a76021','postal_code','user.attribute.postal_code'),('ed3963dc-91a9-40da-8e08-cfc7f8a76021','region','user.attribute.region'),('ed3963dc-91a9-40da-8e08-cfc7f8a76021','street','user.attribute.street'),('ed3963dc-91a9-40da-8e08-cfc7f8a76021','true','userinfo.token.claim'),('f26c6c54-2250-4868-8423-cfa4a611eacf','true','access.token.claim'),('f26c6c54-2250-4868-8423-cfa4a611eacf','birthdate','claim.name'),('f26c6c54-2250-4868-8423-cfa4a611eacf','true','id.token.claim'),('f26c6c54-2250-4868-8423-cfa4a611eacf','String','jsonType.label'),('f26c6c54-2250-4868-8423-cfa4a611eacf','birthdate','user.attribute'),('f26c6c54-2250-4868-8423-cfa4a611eacf','true','userinfo.token.claim');
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
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','934e910b-94f9-40a5-a52f-b3906200e17d',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','a3af3d85-cc18-451b-8f1a-bb5fb775602d','96e8d265-1af7-4098-8e60-22b4bb71b4ec','1bb41bea-73b2-462e-b884-c42774575afe','b3f6ab3a-eabb-4d91-80d0-650c4587b740','d85bc3ca-ad40-4a1b-90e8-aeab4a1ff6cd',2592000,_binary '\0',900,_binary '',_binary '\0','f7906595-3a8a-48a3-89a8-f1360c2f0b5a',0,_binary '\0',0,0,'85206305-901f-4bbf-81f6-ba0b443f0cc0'),('siglo21',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,'keywind','siglo21',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','NONE',1800,36000,_binary '\0',_binary '\0','020a93a9-334b-44a8-947e-ab49181011b8',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','e36699d9-3724-46ee-a478-7fb63ee69069','873214c4-0704-422c-9503-6ca8cc12886a','4dcb4538-fa4b-436d-b5cd-d52306141f0c','dd2dacbf-fbe5-4653-8a04-0493f0b9ad2f','ec97cca7-4b23-4057-99e0-ec947085ed7a',2592000,_binary '\0',900,_binary '',_binary '\0','60b26f41-ddfd-424e-b436-2f5739def648',0,_binary '\0',0,0,'55c43002-4c16-49ef-87a5-30deaa22314b');
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
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','siglo21','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.contentSecurityPolicyReportOnly','siglo21',''),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','siglo21','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xContentTypeOptions','siglo21','nosniff'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xFrameOptions','siglo21','SAMEORIGIN'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xRobotsTag','siglo21','none'),('_browser_header.xXSSProtection','master','1; mode=block'),('_browser_header.xXSSProtection','siglo21','1; mode=block'),('actionTokenGeneratedByAdminLifespan','siglo21','43200'),('actionTokenGeneratedByUserLifespan','siglo21','300'),('bruteForceProtected','master','false'),('bruteForceProtected','siglo21','true'),('cibaAuthRequestedUserHint','siglo21','login_hint'),('cibaBackchannelTokenDeliveryMode','siglo21','poll'),('cibaExpiresIn','siglo21','120'),('cibaInterval','siglo21','5'),('client-policies.policies','siglo21','{\"policies\":[]}'),('client-policies.profiles','siglo21','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','siglo21','0'),('clientOfflineSessionMaxLifespan','siglo21','0'),('clientSessionIdleTimeout','siglo21','0'),('clientSessionMaxLifespan','siglo21','0'),('defaultSignatureAlgorithm','master','RS256'),('defaultSignatureAlgorithm','siglo21','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','master','30'),('failureFactor','siglo21','5'),('maxDeltaTimeSeconds','master','43200'),('maxDeltaTimeSeconds','siglo21','43200'),('maxFailureWaitSeconds','master','900'),('maxFailureWaitSeconds','siglo21','900'),('minimumQuickLoginWaitSeconds','master','60'),('minimumQuickLoginWaitSeconds','siglo21','60'),('oauth2DeviceCodeLifespan','siglo21','600'),('oauth2DevicePollingInterval','siglo21','5'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespan','siglo21','5184000'),('offlineSessionMaxLifespanEnabled','master','false'),('offlineSessionMaxLifespanEnabled','siglo21','false'),('parRequestUriLifespan','siglo21','60'),('permanentLockout','master','false'),('permanentLockout','siglo21','false'),('quickLoginCheckMilliSeconds','master','1000'),('quickLoginCheckMilliSeconds','siglo21','1000'),('waitIncrementSeconds','master','60'),('waitIncrementSeconds','siglo21','120'),('webAuthnPolicyAttestationConveyancePreference','siglo21','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','siglo21','not specified'),('webAuthnPolicyAuthenticatorAttachment','siglo21','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','siglo21','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','siglo21','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','siglo21','false'),('webAuthnPolicyCreateTimeout','siglo21','0'),('webAuthnPolicyCreateTimeoutPasswordless','siglo21','0'),('webAuthnPolicyRequireResidentKey','siglo21','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','siglo21','not specified'),('webAuthnPolicyRpEntityName','siglo21','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','siglo21','keycloak'),('webAuthnPolicyRpId','siglo21',''),('webAuthnPolicyRpIdPasswordless','siglo21',''),('webAuthnPolicySignatureAlgorithms','siglo21','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','siglo21','ES256'),('webAuthnPolicyUserVerificationRequirement','siglo21','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','siglo21','not specified');
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
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES ('siglo21','');
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
INSERT INTO `REDIRECT_URIS` VALUES ('0b95e7b8-076d-49c8-919f-a9e8c94ae199','/realms/master/account/*'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','/realms/siglo21/account/*'),('42ce5f39-f315-496d-881f-7de13ac3ae08','/admin/siglo21/console/*'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','http://siglo21logistica.com.ar:3000/*'),('54b4493f-4dc6-46ec-a697-a77e8977899c','/realms/siglo21/account/*'),('b9ff790a-1104-4307-bb5b-a3d69c112dcb','/realms/master/account/*'),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','/admin/master/console/*');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('2a370ae1-ceda-433e-863c-656d942732dc','delete_account','Delete Account','siglo21',_binary '\0',_binary '\0','delete_account',60),('2a7ee44c-abd9-44d0-b24d-d7648125ad8c','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('3d7e30e0-0c47-48b3-aea5-f14d6998db7c','UPDATE_PROFILE','Update Profile','siglo21',_binary '',_binary '\0','UPDATE_PROFILE',40),('4d0de1af-95f2-45ac-b8cc-63553b82616f','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('58535609-063e-4332-9298-4024bce3c41d','update_user_locale','Update User Locale','siglo21',_binary '',_binary '\0','update_user_locale',1000),('881ccd5e-3a61-4f90-b5ba-7b8b3d9e21a1','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('ad7d06d2-b0eb-466f-a0c2-bc20c9964e5b','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('bb6be711-8822-4a81-8d9f-83e43dc3ad4d','terms_and_conditions','Terms and Conditions','siglo21',_binary '\0',_binary '\0','terms_and_conditions',20),('bc06a1a8-a020-43ef-84f8-2c6ccca38f63','VERIFY_EMAIL','Verify Email','siglo21',_binary '',_binary '\0','VERIFY_EMAIL',50),('cadf0677-4be3-4c15-b87c-b9c75f355e14','CONFIGURE_TOTP','Configure OTP','siglo21',_binary '',_binary '\0','CONFIGURE_TOTP',10),('db1ad287-ca80-492a-b52e-d550ce13671e','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('e19d72c2-53a6-4421-8215-cf3ae3f9915e','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('e9a5623f-f194-4b57-99cb-d6dab407bae6','UPDATE_PASSWORD','Update Password','siglo21',_binary '',_binary '\0','UPDATE_PASSWORD',30),('eb9e584e-5eb7-4035-bd77-34baeb5b1dca','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10);
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
INSERT INTO `SCOPE_MAPPING` VALUES ('0b95e7b8-076d-49c8-919f-a9e8c94ae199','82db4c83-e0c7-4a97-aebc-8e1d9989c078'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','92e0c80c-ed04-427a-89da-e936808b8d09');
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
INSERT INTO `USER_ENTITY` VALUES ('c0486c5d-ea3c-474c-8312-50019412a059',NULL,'63f1d5ee-6b18-499a-a430-8b8c444ed29c',_binary '\0',_binary '',NULL,NULL,NULL,'master','administrador',1704573326281,NULL,0),('ff034cba-741e-4322-9052-13793d9ea07f',NULL,'791a700b-d904-4b4b-ac5b-3c581e76020e',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','administracion.siglo21',1704574406751,NULL,0);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('0c1c204c-7b22-412b-a0a7-a6628d32496f','c0486c5d-ea3c-474c-8312-50019412a059'),('144664f4-d97b-41a7-9d8d-1120a09b38d3','c0486c5d-ea3c-474c-8312-50019412a059'),('1c1cbd4a-e255-486a-a257-41a9a781201a','c0486c5d-ea3c-474c-8312-50019412a059'),('230cba7f-e58e-4013-861c-2c3033ec4fe5','c0486c5d-ea3c-474c-8312-50019412a059'),('3332147e-cd25-4ec7-ac1d-6df0d4f208ce','c0486c5d-ea3c-474c-8312-50019412a059'),('367647c9-7887-4dea-8bce-e70cc72b204a','c0486c5d-ea3c-474c-8312-50019412a059'),('44d6fdc1-3f73-4d70-bf23-9635daadd5f3','c0486c5d-ea3c-474c-8312-50019412a059'),('5f1176c9-276f-4398-af11-0e4d263389e0','c0486c5d-ea3c-474c-8312-50019412a059'),('66bdadab-855b-4bdd-b0ac-26ed643b2f16','c0486c5d-ea3c-474c-8312-50019412a059'),('67f12d47-68c6-422b-ba20-750566df2326','c0486c5d-ea3c-474c-8312-50019412a059'),('7bdfff4b-d63b-4cd1-8123-b4b4513efab3','c0486c5d-ea3c-474c-8312-50019412a059'),('822eeda0-53cd-40dd-871a-3925ab66514a','c0486c5d-ea3c-474c-8312-50019412a059'),('85206305-901f-4bbf-81f6-ba0b443f0cc0','c0486c5d-ea3c-474c-8312-50019412a059'),('8d2d80f4-c77b-45bf-b8c4-c8108682e622','c0486c5d-ea3c-474c-8312-50019412a059'),('bdb8bec5-13a4-4e6f-b966-f1ba9948859c','c0486c5d-ea3c-474c-8312-50019412a059'),('c11f0d98-7b68-455d-bdc3-9b3189f0cb7b','c0486c5d-ea3c-474c-8312-50019412a059'),('d5646728-b756-4e9c-82ec-977bdfba6712','c0486c5d-ea3c-474c-8312-50019412a059'),('e463abd8-76c5-4c66-8e64-74ffcc15f138','c0486c5d-ea3c-474c-8312-50019412a059'),('ed464f43-c5b7-44bc-84c2-a5f22270564e','c0486c5d-ea3c-474c-8312-50019412a059'),('09c39e33-cc18-4493-b30a-958b5ccb54aa','ff034cba-741e-4322-9052-13793d9ea07f'),('26084389-cab9-45fa-93ea-66f47fcdbbd1','ff034cba-741e-4322-9052-13793d9ea07f'),('54d5c122-1802-4139-b68d-e2cec2facbb8','ff034cba-741e-4322-9052-13793d9ea07f'),('55c43002-4c16-49ef-87a5-30deaa22314b','ff034cba-741e-4322-9052-13793d9ea07f'),('7a33b7d5-afac-418a-ba38-3a4d696d4cbe','ff034cba-741e-4322-9052-13793d9ea07f'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','ff034cba-741e-4322-9052-13793d9ea07f'),('dea41763-6811-47a0-a1e9-0652e7487c4f','ff034cba-741e-4322-9052-13793d9ea07f');
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
INSERT INTO `WEB_ORIGINS` VALUES ('42ce5f39-f315-496d-881f-7de13ac3ae08','+'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','http://siglo21logistica.com.ar:3000'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','http://siglo21logistica.com.ar:8080'),('d2098f46-e3f9-4c64-88a6-96c4cab5d87d','+');
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

-- Dump completed on 2024-01-06 21:00:03
