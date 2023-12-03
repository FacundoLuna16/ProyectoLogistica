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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('01091919-d667-40c3-acf7-285b8ed75dd7',NULL,'auth-cookie','siglo21','157f5b00-075f-4067-8287-8d0344e1217f',2,10,_binary '\0',NULL,NULL),('023910a9-85cd-47d7-a68f-8cac527f03b8',NULL,'http-basic-authenticator','siglo21','340e2e5b-5cbf-4886-a0bc-08547634b53d',0,10,_binary '\0',NULL,NULL),('037f4c3a-1857-4aa6-a9f7-f3134a4e2f16',NULL,'registration-password-action','master','854e2076-71c7-40c8-a075-1c24eb930def',0,50,_binary '\0',NULL,NULL),('03ad3d54-77f7-4fe1-bfae-ce6370340747',NULL,'registration-profile-action','siglo21','f9737291-1ee0-49be-abb1-72103474b099',0,40,_binary '\0',NULL,NULL),('053e9fc5-0c21-48fd-bbbb-0f66de200f97',NULL,'docker-http-basic-authenticator','master','ba8392b9-fafc-4999-8a74-6236d2701089',0,10,_binary '\0',NULL,NULL),('069f8e22-cebe-4a62-96c0-4f59b695e7ed',NULL,'idp-email-verification','siglo21','93e79464-21a2-4785-af26-70a40cb3e1f0',2,10,_binary '\0',NULL,NULL),('0a64ddd2-ad66-4f4c-b3d0-cadb47a35fe7',NULL,'registration-recaptcha-action','siglo21','f9737291-1ee0-49be-abb1-72103474b099',3,60,_binary '\0',NULL,NULL),('0ed48fa5-67d1-4adc-b1d6-8e09536f56a9',NULL,'conditional-user-configured','siglo21','bd96e378-8128-4beb-819f-f7107713ce55',0,10,_binary '\0',NULL,NULL),('11d401dd-59c7-4aee-8cde-41cdb9176e50',NULL,'idp-email-verification','master','44b635b0-76f8-46e3-a965-164cd6c2df74',2,10,_binary '\0',NULL,NULL),('14c76688-d134-48dd-9a63-b980e90ea2bb',NULL,'reset-otp','master','c2f6f17e-9ed5-4bab-b53c-b8db4a5ce580',0,20,_binary '\0',NULL,NULL),('1555b72b-8fa7-4d58-b47c-8d0db7724ea5',NULL,NULL,'siglo21','ea1b51dc-d82a-4b08-8179-5ba20ee2a7e0',1,20,_binary '','bd96e378-8128-4beb-819f-f7107713ce55',NULL),('1744df43-6912-4194-b3ad-79c7ab581965',NULL,NULL,'master','d80b87e0-0b2b-456a-8205-8cb19718d35f',0,20,_binary '','4e29fa73-de0c-4f91-b5f9-c475c8a778fc',NULL),('1af61820-76b0-43c7-85a9-02c4645edbc4',NULL,'reset-credentials-choose-user','master','8a0abc34-be31-42c9-89b0-24cb625b6b95',0,10,_binary '\0',NULL,NULL),('1e4ae488-a065-424e-baa9-b51d3081ae59',NULL,NULL,'master','b816056b-56df-4f53-8039-94d1396951aa',1,20,_binary '','ed76a3fa-7fea-4000-aa4f-66559c09a93d',NULL),('220df269-6dbc-40f8-9877-cd02ca64df9f',NULL,'direct-grant-validate-username','siglo21','3977ab6b-cb7a-4bf8-be05-76284854c4b0',0,10,_binary '\0',NULL,NULL),('24180ec0-e0c9-4bea-9f86-35deb7f458c5',NULL,'idp-create-user-if-unique','master','4e29fa73-de0c-4f91-b5f9-c475c8a778fc',2,10,_binary '\0',NULL,'e8dd02d0-4664-4ef2-b85e-23e217defe77'),('25722682-5ef5-412b-9c2e-79544b167315',NULL,'auth-otp-form','siglo21','8ff06641-1f62-4827-8a46-e2a6a124aba7',0,20,_binary '\0',NULL,NULL),('2a7307e0-d736-4ff0-820e-0fdde80fde97',NULL,NULL,'siglo21','d52b5242-762f-4905-bad0-926e39596c6f',1,40,_binary '','6033c2b7-6311-489d-96f3-7a7e5bc81947',NULL),('2cd408ea-6a72-4342-a332-6ec9c062b0a7',NULL,'idp-review-profile','master','d80b87e0-0b2b-456a-8205-8cb19718d35f',0,10,_binary '\0',NULL,'edca1b86-5f28-4b3d-9263-6b8ff3170369'),('311519a4-6b2d-4b00-828a-29c0b0817aa9',NULL,NULL,'siglo21','80840062-766a-464d-8af4-4da80a369868',0,20,_binary '','c7fb248e-96b7-4847-96e8-a0b0ca867375',NULL),('31fb2620-45b2-42b4-98ed-bc51a0012ac3',NULL,'basic-auth','siglo21','c7fb248e-96b7-4847-96e8-a0b0ca867375',0,10,_binary '\0',NULL,NULL),('3553b210-81aa-499e-a76d-0b91c33157a3',NULL,'idp-username-password-form','master','a63ccca5-d113-4528-be6f-e617bc380c1b',0,10,_binary '\0',NULL,NULL),('37500a95-8bde-400c-b57c-195d99e0c258',NULL,'conditional-user-configured','siglo21','6033c2b7-6311-489d-96f3-7a7e5bc81947',0,10,_binary '\0',NULL,NULL),('39b0157a-ea44-4001-bc82-c27ed0f47bb7',NULL,'direct-grant-validate-password','master','ca05121b-a1fa-4651-a6af-9a6d256fa5d9',0,20,_binary '\0',NULL,NULL),('3daea3b1-0958-43f4-8f0b-75012e41976e',NULL,'auth-username-password-form','siglo21','ea1b51dc-d82a-4b08-8179-5ba20ee2a7e0',0,10,_binary '\0',NULL,NULL),('416423f8-29be-4ca2-9ae0-7e6c50c5f682',NULL,'auth-username-password-form','master','b816056b-56df-4f53-8039-94d1396951aa',0,10,_binary '\0',NULL,NULL),('416c6c6e-b776-43d7-b7a0-afa1f3cf26b9',NULL,'idp-confirm-link','master','53863443-3bc3-4122-8643-f42028dfe22e',0,10,_binary '\0',NULL,NULL),('433fad00-eb9e-467c-8808-cd088863c923',NULL,NULL,'master','53863443-3bc3-4122-8643-f42028dfe22e',0,20,_binary '','44b635b0-76f8-46e3-a965-164cd6c2df74',NULL),('43a8493e-ddda-4de4-9007-f262d1db999e',NULL,'client-secret-jwt','master','7596aae7-42c7-41d3-a816-a7a2d45d5985',2,30,_binary '\0',NULL,NULL),('46358acc-67cb-439a-9664-2406bfbf5e73',NULL,'reset-otp','siglo21','6033c2b7-6311-489d-96f3-7a7e5bc81947',0,20,_binary '\0',NULL,NULL),('47089376-6930-44d1-a4f8-c645b288e8f7',NULL,'conditional-user-configured','siglo21','668cb39b-58cf-433a-a9df-b67da26ceeb0',0,10,_binary '\0',NULL,NULL),('4908a184-9c04-46c2-8958-9f4a2608b0f9',NULL,'idp-create-user-if-unique','siglo21','bf63ef15-2f3c-4a7e-8bdd-17347e13fd08',2,10,_binary '\0',NULL,'8c2696b0-1685-4558-9dab-2e707a1d1fe6'),('4ac30041-d010-45c9-ad49-5d0a6ad2b33d',NULL,'registration-recaptcha-action','master','854e2076-71c7-40c8-a075-1c24eb930def',3,60,_binary '\0',NULL,NULL),('4c69a808-a048-4efa-bf79-e98ed9411d80',NULL,'auth-spnego','siglo21','157f5b00-075f-4067-8287-8d0344e1217f',3,20,_binary '\0',NULL,NULL),('515c6dd6-7a36-41eb-b730-f33005cd0cd0',NULL,'auth-otp-form','master','85d4e00c-4bd6-4df8-9a5e-88a5d4029c5c',0,20,_binary '\0',NULL,NULL),('58b1c87b-2998-45f6-a20e-24a0621f3559',NULL,'registration-page-form','siglo21','cf4d9a54-858c-40da-b730-940473ba542c',0,10,_binary '','f9737291-1ee0-49be-abb1-72103474b099',NULL),('59b65382-c9f7-4095-8f82-b5d5db5b0371',NULL,NULL,'master','2ee637b3-aaf9-4303-a101-9f4da87e2edd',0,20,_binary '','86801e90-f6a1-491a-8831-1858a64ab080',NULL),('5f3462ef-fca6-4aac-9ae0-eeba6e3d8b87',NULL,NULL,'siglo21','bf63ef15-2f3c-4a7e-8bdd-17347e13fd08',2,20,_binary '','960c3063-a836-4e2d-be2e-e61e472ebca0',NULL),('6143b34e-6272-4c58-97a7-b2b33c1bf960',NULL,'auth-otp-form','master','ed76a3fa-7fea-4000-aa4f-66559c09a93d',0,20,_binary '\0',NULL,NULL),('629ae1d2-91a0-4446-ad7e-599fea4ddd10',NULL,NULL,'master','44b635b0-76f8-46e3-a965-164cd6c2df74',2,20,_binary '','a63ccca5-d113-4528-be6f-e617bc380c1b',NULL),('641d5f55-5603-4a3d-9bf4-31d529f0af93',NULL,'auth-spnego','master','86801e90-f6a1-491a-8831-1858a64ab080',3,30,_binary '\0',NULL,NULL),('66cadfa5-614c-4853-bcbf-d86fa25123c2',NULL,'auth-spnego','master','0e953bbe-ec44-4f13-a1c0-fe91a9bbbb01',3,20,_binary '\0',NULL,NULL),('69e29bed-3065-44af-9ed5-7b6d9fc82853',NULL,'idp-username-password-form','siglo21','fd590438-b1a1-4e28-bb3a-544e2ff8aa71',0,10,_binary '\0',NULL,NULL),('734ae0b9-acdb-4472-975b-bc1164fe5c6c',NULL,'basic-auth','master','86801e90-f6a1-491a-8831-1858a64ab080',0,10,_binary '\0',NULL,NULL),('76529d38-476a-49f4-bf80-84c3d26151e5',NULL,'registration-user-creation','siglo21','f9737291-1ee0-49be-abb1-72103474b099',0,20,_binary '\0',NULL,NULL),('77f5bbd0-47b5-48f6-8970-1091ae6c34b8',NULL,'registration-profile-action','master','854e2076-71c7-40c8-a075-1c24eb930def',0,40,_binary '\0',NULL,NULL),('79ef7ff1-d89e-4c3c-bc51-c83775eba89a',NULL,'client-secret-jwt','siglo21','2a9ab733-6f5b-47eb-a654-00021648d2b0',2,30,_binary '\0',NULL,NULL),('7d612155-a284-40ba-8796-4cdb6028dfe6',NULL,'client-secret','master','7596aae7-42c7-41d3-a816-a7a2d45d5985',2,10,_binary '\0',NULL,NULL),('80c5e971-7ee5-4694-8abd-7fe3be61d667',NULL,NULL,'master','ca05121b-a1fa-4651-a6af-9a6d256fa5d9',1,30,_binary '','859d718e-556a-451c-a323-048289c15e78',NULL),('80cb74bc-570b-4d32-8992-f9ae7b070cf1',NULL,NULL,'master','8a0abc34-be31-42c9-89b0-24cb625b6b95',1,40,_binary '','c2f6f17e-9ed5-4bab-b53c-b8db4a5ce580',NULL),('8517f3af-f279-499e-99fb-c8c8d1aae3f0',NULL,'conditional-user-configured','siglo21','8ff06641-1f62-4827-8a46-e2a6a124aba7',0,10,_binary '\0',NULL,NULL),('8987b5f5-92d8-4ed1-830c-768d68197201',NULL,'reset-password','siglo21','d52b5242-762f-4905-bad0-926e39596c6f',0,30,_binary '\0',NULL,NULL),('89eb4ca3-53a8-4004-96b6-122628b5181e',NULL,'client-jwt','siglo21','2a9ab733-6f5b-47eb-a654-00021648d2b0',2,20,_binary '\0',NULL,NULL),('8db4bc83-4946-418a-8496-f281f9b38df9',NULL,'reset-credential-email','siglo21','d52b5242-762f-4905-bad0-926e39596c6f',0,20,_binary '\0',NULL,NULL),('8e005b23-9347-45d6-ba3e-4bb99a935273',NULL,'client-x509','master','7596aae7-42c7-41d3-a816-a7a2d45d5985',2,40,_binary '\0',NULL,NULL),('902f1246-a247-4d5b-85aa-87afece84c3b',NULL,'registration-password-action','siglo21','f9737291-1ee0-49be-abb1-72103474b099',0,50,_binary '\0',NULL,NULL),('92f9ad1d-8fd8-49bf-92b4-1e578ccc18fd',NULL,'conditional-user-configured','master','85d4e00c-4bd6-4df8-9a5e-88a5d4029c5c',0,10,_binary '\0',NULL,NULL),('94620207-38c0-47ea-a244-7c209b9223af',NULL,'identity-provider-redirector','master','0e953bbe-ec44-4f13-a1c0-fe91a9bbbb01',2,25,_binary '\0',NULL,NULL),('9b86da10-a43d-475d-9808-99a90f5450cc',NULL,NULL,'siglo21','3977ab6b-cb7a-4bf8-be05-76284854c4b0',1,30,_binary '','668cb39b-58cf-433a-a9df-b67da26ceeb0',NULL),('9eaf4d73-da0b-4678-b914-5c492fadd17c',NULL,'idp-confirm-link','siglo21','960c3063-a836-4e2d-be2e-e61e472ebca0',0,10,_binary '\0',NULL,NULL),('9f033de4-db50-42e4-bf13-0068931de924',NULL,NULL,'master','0e953bbe-ec44-4f13-a1c0-fe91a9bbbb01',2,30,_binary '','b816056b-56df-4f53-8039-94d1396951aa',NULL),('a25b8d23-4972-45a4-be27-b27740821807',NULL,'direct-grant-validate-password','siglo21','3977ab6b-cb7a-4bf8-be05-76284854c4b0',0,20,_binary '\0',NULL,NULL),('a45583b6-5daa-4cdb-b814-42fb0dda8f14',NULL,'no-cookie-redirect','siglo21','80840062-766a-464d-8af4-4da80a369868',0,10,_binary '\0',NULL,NULL),('a6802481-68b0-4719-8e5e-643a82c92e6a',NULL,'identity-provider-redirector','siglo21','157f5b00-075f-4067-8287-8d0344e1217f',2,25,_binary '\0',NULL,NULL),('a8d144f0-d0c2-47ba-a18b-4161b8c5fe41',NULL,'client-secret','siglo21','2a9ab733-6f5b-47eb-a654-00021648d2b0',2,10,_binary '\0',NULL,NULL),('a95867ab-cee7-4a3d-a22b-e1a7627db5a8',NULL,'http-basic-authenticator','master','ff37f37e-1446-432d-ae3c-a558fb081fd7',0,10,_binary '\0',NULL,NULL),('b4448a81-5fd2-41eb-9c73-3e58967278c9',NULL,'conditional-user-configured','master','ed76a3fa-7fea-4000-aa4f-66559c09a93d',0,10,_binary '\0',NULL,NULL),('b7a25178-4316-4745-b486-895a0a7f1607',NULL,'no-cookie-redirect','master','2ee637b3-aaf9-4303-a101-9f4da87e2edd',0,10,_binary '\0',NULL,NULL),('b8252054-c099-4456-afa7-dcbfdaf171ba',NULL,'reset-credential-email','master','8a0abc34-be31-42c9-89b0-24cb625b6b95',0,20,_binary '\0',NULL,NULL),('b997e1c0-9730-4e79-99f8-6d5d5f57bd0b',NULL,'direct-grant-validate-otp','siglo21','668cb39b-58cf-433a-a9df-b67da26ceeb0',0,20,_binary '\0',NULL,NULL),('c1c11c70-a0bf-43fe-b347-7112cc86a4e5',NULL,NULL,'siglo21','157f5b00-075f-4067-8287-8d0344e1217f',2,30,_binary '','ea1b51dc-d82a-4b08-8179-5ba20ee2a7e0',NULL),('c36bbe6c-1e52-420a-beaa-507aead265a0',NULL,'reset-password','master','8a0abc34-be31-42c9-89b0-24cb625b6b95',0,30,_binary '\0',NULL,NULL),('c6428440-461c-4db2-8bb0-8e7b72fb5227',NULL,'reset-credentials-choose-user','siglo21','d52b5242-762f-4905-bad0-926e39596c6f',0,10,_binary '\0',NULL,NULL),('c64ef4a7-9785-4352-b10f-10f945b9981f',NULL,'registration-user-creation','master','854e2076-71c7-40c8-a075-1c24eb930def',0,20,_binary '\0',NULL,NULL),('c84a2af5-cbe4-4033-b62c-543fdce23750',NULL,'direct-grant-validate-username','master','ca05121b-a1fa-4651-a6af-9a6d256fa5d9',0,10,_binary '\0',NULL,NULL),('c8865809-445f-491f-9410-573776b2abda',NULL,'auth-cookie','master','0e953bbe-ec44-4f13-a1c0-fe91a9bbbb01',2,10,_binary '\0',NULL,NULL),('c8915f13-0de8-4ae5-8d0b-7ee681788ef9',NULL,'idp-review-profile','siglo21','a62cf128-9b02-4300-8b29-700da9c691fc',0,10,_binary '\0',NULL,'3d816b08-b612-43f5-a702-e5d45e5478cf'),('ca53437a-480b-48bf-8ff3-cf34515825c6',NULL,'conditional-user-configured','master','859d718e-556a-451c-a323-048289c15e78',0,10,_binary '\0',NULL,NULL),('cb210c48-7039-4bd2-ab84-7cc36ee67e35',NULL,'auth-otp-form','siglo21','bd96e378-8128-4beb-819f-f7107713ce55',0,20,_binary '\0',NULL,NULL),('ceb77390-c5cd-48df-afc9-24001d01849a',NULL,NULL,'siglo21','93e79464-21a2-4785-af26-70a40cb3e1f0',2,20,_binary '','fd590438-b1a1-4e28-bb3a-544e2ff8aa71',NULL),('cf1d2618-6af4-42ee-a1ac-64b12d31bb69',NULL,'client-jwt','master','7596aae7-42c7-41d3-a816-a7a2d45d5985',2,20,_binary '\0',NULL,NULL),('d08465f6-3989-4e0b-8bba-447b2e8ced5a',NULL,NULL,'siglo21','a62cf128-9b02-4300-8b29-700da9c691fc',0,20,_binary '','bf63ef15-2f3c-4a7e-8bdd-17347e13fd08',NULL),('d162deb1-a407-4839-a76a-00d138c4d45d',NULL,'client-x509','siglo21','2a9ab733-6f5b-47eb-a654-00021648d2b0',2,40,_binary '\0',NULL,NULL),('d3201a01-c5fd-49dc-a7d9-c7e5a17e0516',NULL,NULL,'master','a63ccca5-d113-4528-be6f-e617bc380c1b',1,20,_binary '','85d4e00c-4bd6-4df8-9a5e-88a5d4029c5c',NULL),('d3458fcf-209c-4082-a55e-1e8c728b9d9b',NULL,NULL,'master','4e29fa73-de0c-4f91-b5f9-c475c8a778fc',2,20,_binary '','53863443-3bc3-4122-8643-f42028dfe22e',NULL),('d7596e13-9e03-4660-9b0e-4017d161e4b5',NULL,'basic-auth-otp','master','86801e90-f6a1-491a-8831-1858a64ab080',3,20,_binary '\0',NULL,NULL),('d7fdf2e8-47f1-4995-bf9d-302fab531cce',NULL,'docker-http-basic-authenticator','siglo21','69ccf855-1658-426a-93f8-839e7247e47c',0,10,_binary '\0',NULL,NULL),('d942a724-5901-48dc-b042-cb20a7c1bd73',NULL,'registration-page-form','master','d0544d3d-44e1-4a66-a883-93fc9577e417',0,10,_binary '','854e2076-71c7-40c8-a075-1c24eb930def',NULL),('db570192-4159-4930-801b-02da0948e18a',NULL,'direct-grant-validate-otp','master','859d718e-556a-451c-a323-048289c15e78',0,20,_binary '\0',NULL,NULL),('e33e9276-2ec6-411c-9939-465c1281413a',NULL,NULL,'siglo21','960c3063-a836-4e2d-be2e-e61e472ebca0',0,20,_binary '','93e79464-21a2-4785-af26-70a40cb3e1f0',NULL),('e5de85ec-788a-4a80-abaf-2eb765ac806f',NULL,'auth-spnego','siglo21','c7fb248e-96b7-4847-96e8-a0b0ca867375',3,30,_binary '\0',NULL,NULL),('ec79502e-d342-49e9-a212-e6e2eefdff6e',NULL,'conditional-user-configured','master','c2f6f17e-9ed5-4bab-b53c-b8db4a5ce580',0,10,_binary '\0',NULL,NULL),('ecfdcb30-c249-4210-b165-4730142d64b7',NULL,'basic-auth-otp','siglo21','c7fb248e-96b7-4847-96e8-a0b0ca867375',3,20,_binary '\0',NULL,NULL),('f1179ffe-3994-469f-8b79-443b51e39520',NULL,NULL,'siglo21','fd590438-b1a1-4e28-bb3a-544e2ff8aa71',1,20,_binary '','8ff06641-1f62-4827-8a46-e2a6a124aba7',NULL);
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0e953bbe-ec44-4f13-a1c0-fe91a9bbbb01','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('157f5b00-075f-4067-8287-8d0344e1217f','browser','browser based authentication','siglo21','basic-flow',_binary '',_binary ''),('2a9ab733-6f5b-47eb-a654-00021648d2b0','clients','Base authentication for clients','siglo21','client-flow',_binary '',_binary ''),('2ee637b3-aaf9-4303-a101-9f4da87e2edd','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('340e2e5b-5cbf-4886-a0bc-08547634b53d','saml ecp','SAML ECP Profile Authentication Flow','siglo21','basic-flow',_binary '',_binary ''),('3977ab6b-cb7a-4bf8-be05-76284854c4b0','direct grant','OpenID Connect Resource Owner Grant','siglo21','basic-flow',_binary '',_binary ''),('44b635b0-76f8-46e3-a965-164cd6c2df74','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('4e29fa73-de0c-4f91-b5f9-c475c8a778fc','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('53863443-3bc3-4122-8643-f42028dfe22e','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('6033c2b7-6311-489d-96f3-7a7e5bc81947','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','siglo21','basic-flow',_binary '\0',_binary ''),('668cb39b-58cf-433a-a9df-b67da26ceeb0','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('69ccf855-1658-426a-93f8-839e7247e47c','docker auth','Used by Docker clients to authenticate against the IDP','siglo21','basic-flow',_binary '',_binary ''),('7596aae7-42c7-41d3-a816-a7a2d45d5985','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('80840062-766a-464d-8af4-4da80a369868','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','siglo21','basic-flow',_binary '',_binary ''),('854e2076-71c7-40c8-a075-1c24eb930def','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('859d718e-556a-451c-a323-048289c15e78','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('85d4e00c-4bd6-4df8-9a5e-88a5d4029c5c','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('86801e90-f6a1-491a-8831-1858a64ab080','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('8a0abc34-be31-42c9-89b0-24cb625b6b95','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('8ff06641-1f62-4827-8a46-e2a6a124aba7','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('93e79464-21a2-4785-af26-70a40cb3e1f0','Account verification options','Method with which to verity the existing account','siglo21','basic-flow',_binary '\0',_binary ''),('960c3063-a836-4e2d-be2e-e61e472ebca0','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','siglo21','basic-flow',_binary '\0',_binary ''),('a62cf128-9b02-4300-8b29-700da9c691fc','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','siglo21','basic-flow',_binary '',_binary ''),('a63ccca5-d113-4528-be6f-e617bc380c1b','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('b816056b-56df-4f53-8039-94d1396951aa','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('ba8392b9-fafc-4999-8a74-6236d2701089','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('bd96e378-8128-4beb-819f-f7107713ce55','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('bf63ef15-2f3c-4a7e-8bdd-17347e13fd08','User creation or linking','Flow for the existing/non-existing user alternatives','siglo21','basic-flow',_binary '\0',_binary ''),('c2f6f17e-9ed5-4bab-b53c-b8db4a5ce580','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('c7fb248e-96b7-4847-96e8-a0b0ca867375','Authentication Options','Authentication options.','siglo21','basic-flow',_binary '\0',_binary ''),('ca05121b-a1fa-4651-a6af-9a6d256fa5d9','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('cf4d9a54-858c-40da-b730-940473ba542c','registration','registration flow','siglo21','basic-flow',_binary '',_binary ''),('d0544d3d-44e1-4a66-a883-93fc9577e417','registration','registration flow','master','basic-flow',_binary '',_binary ''),('d52b5242-762f-4905-bad0-926e39596c6f','reset credentials','Reset credentials for a user if they forgot their password or something','siglo21','basic-flow',_binary '',_binary ''),('d80b87e0-0b2b-456a-8205-8cb19718d35f','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('ea1b51dc-d82a-4b08-8179-5ba20ee2a7e0','forms','Username, password, otp and other auth forms.','siglo21','basic-flow',_binary '\0',_binary ''),('ed76a3fa-7fea-4000-aa4f-66559c09a93d','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('f9737291-1ee0-49be-abb1-72103474b099','registration form','registration form','siglo21','form-flow',_binary '\0',_binary ''),('fd590438-b1a1-4e28-bb3a-544e2ff8aa71','Verify Existing Account by Re-authentication','Reauthentication of existing account','siglo21','basic-flow',_binary '\0',_binary ''),('ff37f37e-1446-432d-ae3c-a558fb081fd7','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary '');
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('3d816b08-b612-43f5-a702-e5d45e5478cf','review profile config','siglo21'),('8c2696b0-1685-4558-9dab-2e707a1d1fe6','create unique user config','siglo21'),('e8dd02d0-4664-4ef2-b85e-23e217defe77','create unique user config','master'),('edca1b86-5f28-4b3d-9263-6b8ff3170369','review profile config','master');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('3d816b08-b612-43f5-a702-e5d45e5478cf','missing','update.profile.on.first.login'),('8c2696b0-1685-4558-9dab-2e707a1d1fe6','false','require.password.update.after.registration'),('e8dd02d0-4664-4ef2-b85e-23e217defe77','false','require.password.update.after.registration'),('edca1b86-5f28-4b3d-9263-6b8ff3170369','missing','update.profile.on.first.login');
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
  CONSTRAINT `FKo1m78rq0x6h37ehdhougr9m9t` FOREIGN KEY (`estado_id`) REFERENCES `estados_envio` (`id_estado`)
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
INSERT INTO `camiones` VALUES ('AA 308 FA','BLANCO','Renault Kangoo','Kangoo'),('ABC 123','AZUL','Ford Transit','Transit');
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
INSERT INTO `CLIENT` VALUES ('0ca2e86b-131e-454d-95a7-c124ad72b7cb',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('308e990b-be21-4e96-864e-088044575bdc',_binary '',_binary '\0','siglo21-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','siglo21 Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/siglo21/account/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/siglo21/console/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '',_binary '','siglo21-client-api-rest',0,_binary '\0','DuXMmJE5ClpWLFZvYW0epQydZowD9msw','http://localhost:8080',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/siglo21/account/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8002346b-4b80-4e9f-a4be-61f9cc1d6815',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d7ef7e17-ec1a-4c44-8eb9-a58dde017a19',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0');
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
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','S256','pkce.code.challenge.method'),('42ce5f39-f315-496d-881f-7de13ac3ae08','S256','pkce.code.challenge.method'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','1800','access.token.lifespan'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','backchannel.logout.revoke.offline.tokens'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','true','backchannel.logout.session.required'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','client_credentials.use_refresh_token'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','display.on.consent.screen'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','exclude.session.state.from.auth.response'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','id.token.as.detached.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','keycloak','login_theme'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','oauth2.device.authorization.grant.enabled'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','oidc.ciba.grant.enabled'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','require.pushed.authorization.requests'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml_force_name_id_format'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.artifact.binding'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.assertion.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.authnstatement'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.client.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.encrypt'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.force.post.binding'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.multivalued.roles'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.onetimeuse.condition'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.server.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.server.signature.keyinfo.ext'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','tls.client.certificate.bound.access.tokens'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','true','use.refresh.tokens'),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','S256','pkce.code.challenge.method'),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','S256','pkce.code.challenge.method');
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
INSERT INTO `CLIENT_SCOPE` VALUES ('19b6b82c-b8f7-4634-be79-efede78aab4e','offline_access','siglo21','OpenID Connect built-in scope: offline_access','openid-connect'),('279791da-86fa-4f67-84c7-b8f250adbcf1','profile','siglo21','OpenID Connect built-in scope: profile','openid-connect'),('28963099-19d3-4521-a02f-976d9671e893','phone','siglo21','OpenID Connect built-in scope: phone','openid-connect'),('2f169a50-01d2-44c9-87b1-f32eb59e2ed5','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','email','siglo21','OpenID Connect built-in scope: email','openid-connect'),('58d58d1a-8bbe-48c4-a3d4-53a1dcb50c54','role_list','master','SAML role list','saml'),('5d8e568a-fa41-46f9-89ec-8db1aa8146fb','email','master','OpenID Connect built-in scope: email','openid-connect'),('5f8340b3-418d-46a0-80c2-7aefafcfa431','address','master','OpenID Connect built-in scope: address','openid-connect'),('60d4d674-7a4f-4bf3-bf6e-c273648aa2b7','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('7dd1278d-8b80-4295-98ae-35b442bcdec9','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('80a98201-a009-4f95-a8d9-67b46623f54d','microprofile-jwt','siglo21','Microprofile - JWT built-in scope','openid-connect'),('91220519-7b53-4290-bacd-cb871ad4b263','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('92b4690e-0806-4349-a095-e5ffe2368cb6','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','roles','siglo21','OpenID Connect scope for add user roles to the access token','openid-connect'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','role_list','siglo21','SAML role list','saml'),('b39fe518-d02f-4eac-942b-eeddf878c80f','web-origins','siglo21','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('bbf418d6-2ea4-416f-bff8-7ee42db4e864','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('da127315-5241-4a8f-a46a-6bea0de8925e','address','siglo21','OpenID Connect built-in scope: address','openid-connect');
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
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('19b6b82c-b8f7-4634-be79-efede78aab4e','${offlineAccessScopeConsentText}','consent.screen.text'),('19b6b82c-b8f7-4634-be79-efede78aab4e','true','display.on.consent.screen'),('279791da-86fa-4f67-84c7-b8f250adbcf1','${profileScopeConsentText}','consent.screen.text'),('279791da-86fa-4f67-84c7-b8f250adbcf1','true','display.on.consent.screen'),('279791da-86fa-4f67-84c7-b8f250adbcf1','true','include.in.token.scope'),('28963099-19d3-4521-a02f-976d9671e893','${phoneScopeConsentText}','consent.screen.text'),('28963099-19d3-4521-a02f-976d9671e893','true','display.on.consent.screen'),('28963099-19d3-4521-a02f-976d9671e893','true','include.in.token.scope'),('2f169a50-01d2-44c9-87b1-f32eb59e2ed5','','consent.screen.text'),('2f169a50-01d2-44c9-87b1-f32eb59e2ed5','false','display.on.consent.screen'),('2f169a50-01d2-44c9-87b1-f32eb59e2ed5','false','include.in.token.scope'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','${emailScopeConsentText}','consent.screen.text'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','true','display.on.consent.screen'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','true','include.in.token.scope'),('58d58d1a-8bbe-48c4-a3d4-53a1dcb50c54','${samlRoleListScopeConsentText}','consent.screen.text'),('58d58d1a-8bbe-48c4-a3d4-53a1dcb50c54','true','display.on.consent.screen'),('5d8e568a-fa41-46f9-89ec-8db1aa8146fb','${emailScopeConsentText}','consent.screen.text'),('5d8e568a-fa41-46f9-89ec-8db1aa8146fb','true','display.on.consent.screen'),('5d8e568a-fa41-46f9-89ec-8db1aa8146fb','true','include.in.token.scope'),('5f8340b3-418d-46a0-80c2-7aefafcfa431','${addressScopeConsentText}','consent.screen.text'),('5f8340b3-418d-46a0-80c2-7aefafcfa431','true','display.on.consent.screen'),('5f8340b3-418d-46a0-80c2-7aefafcfa431','true','include.in.token.scope'),('60d4d674-7a4f-4bf3-bf6e-c273648aa2b7','${profileScopeConsentText}','consent.screen.text'),('60d4d674-7a4f-4bf3-bf6e-c273648aa2b7','true','display.on.consent.screen'),('60d4d674-7a4f-4bf3-bf6e-c273648aa2b7','true','include.in.token.scope'),('7dd1278d-8b80-4295-98ae-35b442bcdec9','${rolesScopeConsentText}','consent.screen.text'),('7dd1278d-8b80-4295-98ae-35b442bcdec9','true','display.on.consent.screen'),('7dd1278d-8b80-4295-98ae-35b442bcdec9','false','include.in.token.scope'),('80a98201-a009-4f95-a8d9-67b46623f54d','false','display.on.consent.screen'),('80a98201-a009-4f95-a8d9-67b46623f54d','true','include.in.token.scope'),('91220519-7b53-4290-bacd-cb871ad4b263','${offlineAccessScopeConsentText}','consent.screen.text'),('91220519-7b53-4290-bacd-cb871ad4b263','true','display.on.consent.screen'),('92b4690e-0806-4349-a095-e5ffe2368cb6','${phoneScopeConsentText}','consent.screen.text'),('92b4690e-0806-4349-a095-e5ffe2368cb6','true','display.on.consent.screen'),('92b4690e-0806-4349-a095-e5ffe2368cb6','true','include.in.token.scope'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','${rolesScopeConsentText}','consent.screen.text'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','true','display.on.consent.screen'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','false','include.in.token.scope'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','${samlRoleListScopeConsentText}','consent.screen.text'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','true','display.on.consent.screen'),('b39fe518-d02f-4eac-942b-eeddf878c80f','','consent.screen.text'),('b39fe518-d02f-4eac-942b-eeddf878c80f','false','display.on.consent.screen'),('b39fe518-d02f-4eac-942b-eeddf878c80f','false','include.in.token.scope'),('bbf418d6-2ea4-416f-bff8-7ee42db4e864','false','display.on.consent.screen'),('bbf418d6-2ea4-416f-bff8-7ee42db4e864','true','include.in.token.scope'),('da127315-5241-4a8f-a46a-6bea0de8925e','${addressScopeConsentText}','consent.screen.text'),('da127315-5241-4a8f-a46a-6bea0de8925e','true','display.on.consent.screen'),('da127315-5241-4a8f-a46a-6bea0de8925e','true','include.in.token.scope');
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
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0ca2e86b-131e-454d-95a7-c124ad72b7cb','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('8002346b-4b80-4e9f-a4be-61f9cc1d6815','2f169a50-01d2-44c9-87b1-f32eb59e2ed5',_binary ''),('8002346b-4b80-4e9f-a4be-61f9cc1d6815','5d8e568a-fa41-46f9-89ec-8db1aa8146fb',_binary ''),('8002346b-4b80-4e9f-a4be-61f9cc1d6815','5f8340b3-418d-46a0-80c2-7aefafcfa431',_binary '\0'),('8002346b-4b80-4e9f-a4be-61f9cc1d6815','60d4d674-7a4f-4bf3-bf6e-c273648aa2b7',_binary ''),('8002346b-4b80-4e9f-a4be-61f9cc1d6815','7dd1278d-8b80-4295-98ae-35b442bcdec9',_binary ''),('8002346b-4b80-4e9f-a4be-61f9cc1d6815','91220519-7b53-4290-bacd-cb871ad4b263',_binary '\0'),('8002346b-4b80-4e9f-a4be-61f9cc1d6815','92b4690e-0806-4349-a095-e5ffe2368cb6',_binary '\0'),('8002346b-4b80-4e9f-a4be-61f9cc1d6815','bbf418d6-2ea4-416f-bff8-7ee42db4e864',_binary '\0'),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','2f169a50-01d2-44c9-87b1-f32eb59e2ed5',_binary ''),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','5d8e568a-fa41-46f9-89ec-8db1aa8146fb',_binary ''),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','5f8340b3-418d-46a0-80c2-7aefafcfa431',_binary '\0'),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','60d4d674-7a4f-4bf3-bf6e-c273648aa2b7',_binary ''),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','7dd1278d-8b80-4295-98ae-35b442bcdec9',_binary ''),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','91220519-7b53-4290-bacd-cb871ad4b263',_binary '\0'),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','92b4690e-0806-4349-a095-e5ffe2368cb6',_binary '\0'),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','bbf418d6-2ea4-416f-bff8-7ee42db4e864',_binary '\0'),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','2f169a50-01d2-44c9-87b1-f32eb59e2ed5',_binary ''),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','5d8e568a-fa41-46f9-89ec-8db1aa8146fb',_binary ''),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','5f8340b3-418d-46a0-80c2-7aefafcfa431',_binary '\0'),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','60d4d674-7a4f-4bf3-bf6e-c273648aa2b7',_binary ''),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','7dd1278d-8b80-4295-98ae-35b442bcdec9',_binary ''),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','91220519-7b53-4290-bacd-cb871ad4b263',_binary '\0'),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','92b4690e-0806-4349-a095-e5ffe2368cb6',_binary '\0'),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','bbf418d6-2ea4-416f-bff8-7ee42db4e864',_binary '\0'),('9bf7d39b-328a-4c6d-a0a3-274fbfb543d6','2f169a50-01d2-44c9-87b1-f32eb59e2ed5',_binary ''),('9bf7d39b-328a-4c6d-a0a3-274fbfb543d6','5d8e568a-fa41-46f9-89ec-8db1aa8146fb',_binary ''),('9bf7d39b-328a-4c6d-a0a3-274fbfb543d6','5f8340b3-418d-46a0-80c2-7aefafcfa431',_binary '\0'),('9bf7d39b-328a-4c6d-a0a3-274fbfb543d6','60d4d674-7a4f-4bf3-bf6e-c273648aa2b7',_binary ''),('9bf7d39b-328a-4c6d-a0a3-274fbfb543d6','7dd1278d-8b80-4295-98ae-35b442bcdec9',_binary ''),('9bf7d39b-328a-4c6d-a0a3-274fbfb543d6','91220519-7b53-4290-bacd-cb871ad4b263',_binary '\0'),('9bf7d39b-328a-4c6d-a0a3-274fbfb543d6','92b4690e-0806-4349-a095-e5ffe2368cb6',_binary '\0'),('9bf7d39b-328a-4c6d-a0a3-274fbfb543d6','bbf418d6-2ea4-416f-bff8-7ee42db4e864',_binary '\0'),('9c574c6d-1c6f-47b9-99df-d07ad6ab5504','2f169a50-01d2-44c9-87b1-f32eb59e2ed5',_binary ''),('9c574c6d-1c6f-47b9-99df-d07ad6ab5504','5d8e568a-fa41-46f9-89ec-8db1aa8146fb',_binary ''),('9c574c6d-1c6f-47b9-99df-d07ad6ab5504','5f8340b3-418d-46a0-80c2-7aefafcfa431',_binary '\0'),('9c574c6d-1c6f-47b9-99df-d07ad6ab5504','60d4d674-7a4f-4bf3-bf6e-c273648aa2b7',_binary ''),('9c574c6d-1c6f-47b9-99df-d07ad6ab5504','7dd1278d-8b80-4295-98ae-35b442bcdec9',_binary ''),('9c574c6d-1c6f-47b9-99df-d07ad6ab5504','91220519-7b53-4290-bacd-cb871ad4b263',_binary '\0'),('9c574c6d-1c6f-47b9-99df-d07ad6ab5504','92b4690e-0806-4349-a095-e5ffe2368cb6',_binary '\0'),('9c574c6d-1c6f-47b9-99df-d07ad6ab5504','bbf418d6-2ea4-416f-bff8-7ee42db4e864',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('d7ef7e17-ec1a-4c44-8eb9-a58dde017a19','2f169a50-01d2-44c9-87b1-f32eb59e2ed5',_binary ''),('d7ef7e17-ec1a-4c44-8eb9-a58dde017a19','5d8e568a-fa41-46f9-89ec-8db1aa8146fb',_binary ''),('d7ef7e17-ec1a-4c44-8eb9-a58dde017a19','5f8340b3-418d-46a0-80c2-7aefafcfa431',_binary '\0'),('d7ef7e17-ec1a-4c44-8eb9-a58dde017a19','60d4d674-7a4f-4bf3-bf6e-c273648aa2b7',_binary ''),('d7ef7e17-ec1a-4c44-8eb9-a58dde017a19','7dd1278d-8b80-4295-98ae-35b442bcdec9',_binary ''),('d7ef7e17-ec1a-4c44-8eb9-a58dde017a19','91220519-7b53-4290-bacd-cb871ad4b263',_binary '\0'),('d7ef7e17-ec1a-4c44-8eb9-a58dde017a19','92b4690e-0806-4349-a095-e5ffe2368cb6',_binary '\0'),('d7ef7e17-ec1a-4c44-8eb9-a58dde017a19','bbf418d6-2ea4-416f-bff8-7ee42db4e864',_binary '\0');
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
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('19b6b82c-b8f7-4634-be79-efede78aab4e','8748520e-df8c-448c-b03a-f7e53b6bf973'),('91220519-7b53-4290-bacd-cb871ad4b263','f0da5bc1-b8d4-48e7-aaa7-5f8ec9d17b17');
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
  KEY `FK158uydvsidi86jgv1skdhcms0` (`id_tipo_documento`),
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
INSERT INTO `COMPONENT` VALUES ('0098e192-5eea-4102-bbf0-f69798acea5d','Trusted Hosts','siglo21','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('0bfdf09e-d23d-4d49-9814-08741ba051a8','rsa-generated','siglo21','rsa-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('0ec3cedd-09e8-4560-9015-81fd4b9e3e3e','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('20217c77-2196-4ae6-9d79-e799d807904c','hmac-generated','siglo21','hmac-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('20fc92f5-e195-44c1-b86f-cb1970350ccb','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('2ae478f7-f417-4af7-9b21-351028a12484','Full Scope Disabled','siglo21','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('38e0b40f-7b92-4376-acfe-9d3ac589ccd2','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('500f85c5-937a-41a0-9f46-f85158250c32','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5115273f-4a37-4381-b0be-113b45f809eb','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('52c82a70-e1e9-49fb-a57a-19514d10598c','Allowed Client Scopes','siglo21','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('564c0329-aa9a-482f-88b7-8c240437ee85','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('64660e3b-5738-46da-8dc3-6408301bc246','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('68b80a80-d8bb-4988-a907-5418f4b753ca','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('765cd604-3dd6-49b4-af5e-7363f1d7883e','Allowed Client Scopes','siglo21','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','authenticated'),('80275b15-09eb-4958-9108-7bcf5f538f38','Allowed Protocol Mapper Types','siglo21','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','authenticated'),('811288b9-8e90-487b-969b-82d36b785c27','rsa-enc-generated','siglo21','rsa-enc-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('94ba4e77-128e-4ccb-9aae-87933a7c866a','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('b75485a4-f673-4081-9238-4b5e7f5eb222','Max Clients Limit','siglo21','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('bfa8d370-01ca-4bda-9333-ac7649508be0','Allowed Protocol Mapper Types','siglo21','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('c19fc1c7-0a08-4d98-bb5e-907393e124f3','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('c7604a3c-d217-410a-841b-2d3cfe05b6b9','aes-generated','siglo21','aes-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('d41f007c-2c89-472f-9709-93146722873d','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('e323efce-9ffd-4202-b4ee-3cdcad083c91','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('fe8e79e6-abbf-471b-8c5d-5d5fafd29144','Consent Required','siglo21','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous');
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
INSERT INTO `COMPONENT_CONFIG` VALUES ('00477ed4-be9d-41f1-99f5-3008345b8b92','20217c77-2196-4ae6-9d79-e799d807904c','algorithm','HS256'),('063d366f-b561-4a01-b60e-508b058d993d','52c82a70-e1e9-49fb-a57a-19514d10598c','allow-default-scopes','true'),('0b54303d-aff9-4240-aad5-1f83559c452f','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('0f5f8ae7-daaf-419f-b73a-9be2343123f5','500f85c5-937a-41a0-9f46-f85158250c32','host-sending-registration-request-must-match','true'),('10f37371-1460-4e10-8e97-0a2a19702d38','500f85c5-937a-41a0-9f46-f85158250c32','client-uris-must-match','true'),('14310140-2125-4989-873c-ac285e981a7c','5115273f-4a37-4381-b0be-113b45f809eb','keyUse','SIG'),('17a41a3e-1672-4529-b5b3-9d7fd762a196','c19fc1c7-0a08-4d98-bb5e-907393e124f3','allow-default-scopes','true'),('18d198f3-412f-4314-9f1b-a9ce9208f3dd','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-address-mapper'),('19f681b5-60b9-42e9-ba2e-0f3e85728a9a','d41f007c-2c89-472f-9709-93146722873d','keyUse','ENC'),('1b8b783a-57ec-4c0f-bd6b-286fa6aa71d5','b75485a4-f673-4081-9238-4b5e7f5eb222','max-clients','200'),('2091f5bf-4720-4376-8e71-57c6d9d3c6f4','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('2591dff0-dc58-4948-95b6-8b44c08c2e51','564c0329-aa9a-482f-88b7-8c240437ee85','allowed-protocol-mapper-types','oidc-address-mapper'),('266e1469-0690-4689-ba01-30e81c2e58a7','38e0b40f-7b92-4376-acfe-9d3ac589ccd2','priority','100'),('2a54fea6-ffcb-40d6-8680-3e4ea897035b','94ba4e77-128e-4ccb-9aae-87933a7c866a','priority','100'),('2aed4099-1cc4-45da-8ca7-fca78babcc63','0bfdf09e-d23d-4d49-9814-08741ba051a8','certificate','MIICnTCCAYUCBgGMLPiK/TANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdzaWdsbzIxMB4XDTIzMTIwMjIzNTcxNVoXDTMzMTIwMjIzNTg1NVowEjEQMA4GA1UEAwwHc2lnbG8yMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAK/9gu0KTuj103nPMfzPF7lc77xcqZVqWjXJYZdmuO0SznaoBYEehr+cIC0xqLMd0jbOL4MctFS34oVNVHdMBXdJ6g95OZ6152+Znw8SoFS0YxtBTuOZopTW7M8DvLs0XT/9zRluy8PetiFeHD6hbYRTDGPbDIAPfKgd4DB5qYYhOGl/muPvLefQK3Nq8BcVN6oN2xG7DMeWiPK0LSrKrqhxi2HsYa0JfpAKmqBENBmmPlEh0aPmcfRtqwPyQTVGQzxDw6kDpD81HhxN0ldPLGV+4Frn/i+jK6eU3UGYu0kc6xrsHiv6mEylMMVenKgvbjR3RNk1f5+4+zDDMalJ6rMCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAOz1ZDO+EODwaPZM73eaAtUze0aaCbfTmCa7sIguGp1C8pzuSvQAf93UcprVn/SuECtgS6cvDQaqWhwVqR2gOPJKQ2332oh/Vwqi0LchNIdfBsqqs0FL6s4MzW2HqaFWZNLioo6gpJ+1KZhTXzwRBKh2CkpsJOhmN9hHf7Nh06ynAhhvDls3EODE6fM0kpKiXzY0fA9RtDzzgvGBVH8jOnic9Gfn8foqtn97CplKzdczpazQa9Zi9U+Q7ob2kZFMIvFUNERRw3a34iwkNv+6veBjTE3MFN0mnm1hBaIiVgvVjYsuMhyDSp+dIIsXcPAwRy0LhX4F31pgNHXYEIVYR3g=='),('2b4e0cdb-7b00-4212-aaff-3450e742cec3','564c0329-aa9a-482f-88b7-8c240437ee85','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2e69df69-fd10-4569-ad15-b8f303ed1554','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-address-mapper'),('31a4d638-68d8-4ecf-b253-ad39a1977a13','64660e3b-5738-46da-8dc3-6408301bc246','allowed-protocol-mapper-types','oidc-address-mapper'),('384c2803-33fc-4100-a9a3-f0840d899fad','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('38a845de-3acd-4730-827f-25cbfc81a652','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('39988d67-c5a1-4c2d-a811-413a881129ba','64660e3b-5738-46da-8dc3-6408301bc246','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('4ec2a496-f46f-4981-b2f7-90dc7bb1c7b6','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('4f16fc70-7877-4f7e-b134-1ff084401b62','64660e3b-5738-46da-8dc3-6408301bc246','allowed-protocol-mapper-types','saml-role-list-mapper'),('4f26029d-eaf2-4cf5-8a96-d4221ed4ce75','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-full-name-mapper'),('4fc57a57-bbc3-4386-93ff-df4ccd125546','5115273f-4a37-4381-b0be-113b45f809eb','priority','100'),('5143d1d7-d45c-4021-ae76-873d529d6551','811288b9-8e90-487b-969b-82d36b785c27','certificate','MIICnTCCAYUCBgGMLPiMFDANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdzaWdsbzIxMB4XDTIzMTIwMjIzNTcxNVoXDTMzMTIwMjIzNTg1NVowEjEQMA4GA1UEAwwHc2lnbG8yMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJY+4Rg+xASmSSP6scM50dFsSXzc/mpya4VEd99Emg67nVEsLYY5+luf5Y9M1HclAF6TWLclOb7EKnwP9vfmLlqQy1TLxsS/b49m7ZSWQRPHUlsQGRow4avMkCQ1GZQqb8nrMJ6MVQAJEgkyoubvf5jFlpUFsHZWvBHE6Nd0/kKzMq99tbBuqCpmuh/CWHR7Z/VfvnIoiBGiN1wlLzQtsUDg7XCFoWqZmqhYHfZj6efKgdxt8XN5tmig1pUIglDKbHRd/U/W7w3hDWNAByBePzZVvgRehAk2TxlZREeGKFALBEuNZNjleXai6KhCFLq93pD4emYSTqF07OaFNtAc2/kCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAYhrbYY29de3ael9pmsIC9Dk/3J69XWJOfMTSXrGRU5Uff3JOZ03NgpIsCexcR0Nfmhk51qyWDC0csLuE49Wnml56BweTg4ZQb0OJl1Qly2hilxHdnGORL05adfYoWgpsL7auLfuYqayxhCh0bjcwRkXi+p+wluqZ/lKQqEjcKSbvD2a5KWmBWqPZl4ZMvQr2wEmPyUPz3k7jLDevCEnTYR8wk24/nP3cwLXji9oLBqXu5KSQ53MNACdV4b35OPz6fAO/OQPuaymvmH2OUy7HAZqEYHB3FvCNETXuFy0/tE1p5uZ89IqHJ4HZ8lDmAR55ZH1TSs4CxIfC2IS+7PyZLw=='),('5a6a190b-80b6-4f7e-9150-6c98ea6304a0','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-role-list-mapper'),('5e897ba3-ef28-46d4-8248-8d5f206b3e99','64660e3b-5738-46da-8dc3-6408301bc246','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('5eb55e37-1403-48f4-8dfa-3c773becba31','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-user-property-mapper'),('61b126bd-0bf6-4418-bfc5-6ccf30401ced','564c0329-aa9a-482f-88b7-8c240437ee85','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('65a0b113-c8d6-496c-af7b-b0ab2b2f5efe','564c0329-aa9a-482f-88b7-8c240437ee85','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('661ba1f8-27f7-4c3a-adf1-bf94c8b5810d','0098e192-5eea-4102-bbf0-f69798acea5d','host-sending-registration-request-must-match','true'),('6b893023-7fe9-40df-a448-eeb7d08b9e3e','e323efce-9ffd-4202-b4ee-3cdcad083c91','max-clients','200'),('6f04d850-e87b-4948-8310-cbd2c34becee','20217c77-2196-4ae6-9d79-e799d807904c','kid','930fe349-a053-4ab1-b158-9dd8677636c9'),('6f525b3c-ec74-41eb-8704-71f5cb704808','38e0b40f-7b92-4376-acfe-9d3ac589ccd2','kid','868ba7f5-c061-437b-95ae-41f0ba3d12d9'),('7503f487-68d3-4158-883c-31557a5197b9','564c0329-aa9a-482f-88b7-8c240437ee85','allowed-protocol-mapper-types','saml-role-list-mapper'),('75ec906f-3f35-4920-a461-5eabd63cee1b','64660e3b-5738-46da-8dc3-6408301bc246','allowed-protocol-mapper-types','saml-user-property-mapper'),('7821ee96-1e86-40fa-b4b4-980ab8434e4c','94ba4e77-128e-4ccb-9aae-87933a7c866a','secret','6Aw_tbZRxYoixyNJL-j58ALA0ZLSsq6bAuAG2iAWTqLuKNEHOJaiQqhxshKVJbqIJ4_Alg4WLDUpcmll5kXZHg'),('7911a002-ee7d-4edb-a6a9-d0dc2ec77343','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('7e10b29f-b637-4c4f-afab-194f27083521','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('809268e5-182f-4af1-80b7-5cc111cee48a','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('82dfe7fd-fe7d-4a9e-b348-975a80e6d526','94ba4e77-128e-4ccb-9aae-87933a7c866a','algorithm','HS256'),('8a45de24-3157-4e3e-91f2-77dc4124fe66','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-user-property-mapper'),('8a5e65d4-69ec-4780-9ed3-358534de4316','0ec3cedd-09e8-4560-9015-81fd4b9e3e3e','allow-default-scopes','true'),('8c5676c9-e23d-41f9-a976-0a3de5e55a3e','564c0329-aa9a-482f-88b7-8c240437ee85','allowed-protocol-mapper-types','saml-user-property-mapper'),('8d25db86-c292-484c-9caf-7fc5a8571552','811288b9-8e90-487b-969b-82d36b785c27','algorithm','RSA-OAEP'),('8f94dd47-099b-4764-b5dd-c9d22e7ff074','d41f007c-2c89-472f-9709-93146722873d','privateKey','MIIEowIBAAKCAQEAmeu3V/Muc50cC3Q6zetMAkjc99EftqRAcanIhJSK445frF0aD7ZwVHaDPAcZ18pKR3PVctxiXj05Uzu7rb7SCrrpGcYNl4jn/YlJLGNVvDLBoMvr0Ew1n6LSNZvxsOgMAvHj6fFYsMWBmSsf4oPzzCKfKT5ZbodGyUZr+WfiNtzZK4LR9rECR53FxHqibBmUdqKqSwruaU/0qCMEd/aSUmBIRCqCRbalHfo8dE4VCNc+adXsErP5F3jCZ3CWRUr99oas0l4GGpGdF1DITvzAOBjNFzeYuq7vZFKNUh3yB0MIhTerv7Bh3wl2efcYHgu9BwXH3ukE3MPWAOZ0SX9AaQIDAQABAoIBADE6q/RMSiIeMNcVAK3VwQTGCy6Ty0HePOJdvE1zOQzY/46gZHJ8FmddVFIBr2lOQP2jdbR7+lZL3KbbZwaGDqXx7BYbO0OpPRHhM+8ngkdkMHveXPjNNyVsrTEKRH4haZ4TgaLUV1qKgQ3dNiB7taEnvaIyV+Y7DA/aHzSw3jBPaUEKNPZpG/tXbycBMcCreOkoy3FIF5lhV2ZHKxGuochWlbJvMmno3IEmarTrpcVQyQgifBZf0aPrzAVLRFnH0/d6lMERzgHbPEKP+CBTNwkMYqHq15GMBXYW3G7EZWJPnz/uLzZrbbWeaHZvlYJeavkPzbdTVMksykvqYJRyqdUCgYEA1AfJRy3eEiohBfdcl9Gsm5/OSC/xqHv0VcfRvtDiRs0JgD4wxJCFjeW1UyQBUjCHXZ/NwYbVjIdXA6YI3aVEHNNyHXKLSF/lZNIq1pbC62Nqm8x5Thc5OTPJIbHswVTnDIUcH3E8zlS4KIxSnDDQUrmZv9hbEiBqU4ocffCWWY8CgYEAudcFQF/Wu0BKKyMnobfhjT7p632gwVK6Uvnih/jQObPE2Iwprfa2RSdB2P4mWsCvWzcA68wAU98GAoAyEriSuSKcCas+rhm5iv4HOD88+lvNOuZoDGuBDr7wMzF7YiB/W+pyyO/5kLfuq4HlwHrO0uobeeAFehzHF7AfGBtKmocCgYEAzKTvOgolKncLBI0pC0dOR65IFRhhL/Ljct+3q2pE230OTH655x5uKPSqvCImPEOmg1C38K/I8Se3bkgUioj2YrQakh16HVKhP1wyCIfeff6oaNNDyYFUs8ctu53VGwxtLIJVEGvk+mh+jnRRT3s1toJ4yNdznt02gobs1QketDUCgYA64SFM0BCcqzXUjQLVfgj8U16Rue/g0HEwMPPQ2MhAP/CyG1ZpQ61kI5f9RCiqwDnO0JJ+IthHunWQ/UTgIZJ7DbgaaCMnzga3PtzSuVZ8i/FuI+n7ZWQyY9R+o8LPyDQRzyom98E+VMhNlo5QeZhlwr6J0qxpkAyUOLzhSmRMqQKBgDeqAIQgrV0smTJQE3BAAoFRFqYKkzPGTw98nKjm3oK01mG45++gjWFfuxXaX7poK1y8rTf542ljlItGEcHtv4RIshHMmttl4ROQGBYhKelP6dG5zQmcMOddVlAswR9A/NfimtHEZ2luvP6icrFMHAmACo8K2u6egVB6rpr4GWhi'),('9c3fb632-245f-4cfc-bbeb-0aae6badc520','d41f007c-2c89-472f-9709-93146722873d','algorithm','RSA-OAEP'),('9e0318c5-4fc6-4bf7-9029-497613c5e96e','0bfdf09e-d23d-4d49-9814-08741ba051a8','privateKey','MIIEowIBAAKCAQEAr/2C7QpO6PXTec8x/M8XuVzvvFyplWpaNclhl2a47RLOdqgFgR6Gv5wgLTGosx3SNs4vgxy0VLfihU1Ud0wFd0nqD3k5nrXnb5mfDxKgVLRjG0FO45milNbszwO8uzRdP/3NGW7Lw962IV4cPqFthFMMY9sMgA98qB3gMHmphiE4aX+a4+8t59Arc2rwFxU3qg3bEbsMx5aI8rQtKsquqHGLYexhrQl+kAqaoEQ0GaY+USHRo+Zx9G2rA/JBNUZDPEPDqQOkPzUeHE3SV08sZX7gWuf+L6Mrp5TdQZi7SRzrGuweK/qYTKUwxV6cqC9uNHdE2TV/n7j7MMMxqUnqswIDAQABAoIBAB4h5MnbKvmeJXBEtoVXm/ND41Q39V080WdGLKx0jRMiVjFgwViDNoUWITg7uWu5nmV91gq33nRm66TxQZYPcRwkjqvJkMEI2jB0eBRnlwYJwLJI803q3zhmuDMVq7nN1G2Bch15p+/IcRyzdViP4SV35rYuKiy++hP60YjbO9hYC988qo7GObug7WtxBFiy6SkVF0VqyOTzlY7LjVA7MVByzGJf2SI4tTElhCztV2LdvGGfAtALq/MhSh1zYbhpzxWeIVwquER9ucrxi61SqfbnDT59y+Z4NyVCbipll4G3ElITSdlXX4GGXOQ8we0EdEhOvgCmzVlZguquCRgmZOkCgYEA/sXByNijVjaLQsZ6OaVJdyIR5cih3JkecmHta8/SQG8e3eEk8QBxx70DojFjd3gM2SRK8GJMcZv+bi7QVkTicVp6zkok5yL2uajdxpbHejIGj9bLbeQYqP06HE6Wj+B9sRxeDAq4XYIQVXW5Ch4dksx8OA+dTjkMXTjrpaQPzX0CgYEAsNaVGf2W+0Ns/hzVtI6yIn8JBdB6QZhLROSSMELMaMG0ZT76JRau3H6BtFJ2UtBAdYw3oDA6kaeYTELQCHcqRUpFF4orf8fO0ttwzrQuAZrdQ8Xz8fUSbKOFFmSbUxlCqve+DRis6cHNCfnCOTnqCgV3uS/I1UvHglXoHYa1z+8CgYB4taPSEGqbL26d7cH9TAXZzyehsoSWK2oUkbdWzHl2k++Q+tpw4WAHXdO55iKVeSjFPP/QkxJbBajv9Xg6V5reUBs9YD3J0XQKlSq2q7vJdqhLQF7UKy1P6+K7hLSraJbE8obQt8eQbk5k30kTtR8X7ZCxUxyZ8kecZ5qmuWvPVQKBgQCBsvCqnl7VLM/M1NM82Yf3WxsAA7cXUx6picda1DNeBexMcdM/zpIzsClrWyvjc1BDprLJr3XVjIlcLYitHNGI/n8MU8+xqZec+UuUn3w6ux3b7l0MMkXwHkKneOSfHyDRimD+9AEmdXjv/xofpMVt0jLMRSrUnf7XLjDPLxU8SwKBgF1GLPkoD1BW8b6d0eCmVp3teEHTax2/ARxU5nmOg8539M32S61l9AZCNru9h2SxmXa1sztmGFz9+zqq569g1xvOzRnTXxsjvu/pMph6EgFQ86SdQaJNEtWZgmgikXphURVNSRYMXjEyzXWXWgmLYx1YzT0y1k60ywC2uWIJXGG5'),('a9429b25-3fe8-46a1-8763-5a83114e79b7','94ba4e77-128e-4ccb-9aae-87933a7c866a','kid','bc3e2c21-eadb-4b59-ac08-a278b50f33cd'),('aaf41a97-67af-4e9c-8735-bb48400e4184','811288b9-8e90-487b-969b-82d36b785c27','priority','100'),('aef5f648-53de-4406-a232-41d15a5fbaba','5115273f-4a37-4381-b0be-113b45f809eb','certificate','MIICmzCCAYMCBgGMLOlBKDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjAyMjM0MDMzWhcNMzMxMjAyMjM0MjEzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC0nhEP2XMaXgEN2+ilzdwWhZ5iWohrId/KZQgE6EaRlOdJOWJzKs+LKz2eyTC7DQvI3hS5pMmiLDhHjjRpyuILsol7c8Swr9ssYXEsuU2PWShFct9natWk53s1Brr4RZgdVPI4Odnw5zunc6jxOe3dXEIQ39+R4trP6XHcQQVLIk/qYFVrkAUKDo7bD6ZHy/gsV1GQDCxzrf6m7Hzf+FUldoAtYh7ebymAqOXeT80NFSuq7HgHxlI9qY2pDdgf8xrY6IN7kvfhRHcBF5Z9iHyQ+fbCW+0cTfNB74jYLaqhh9syS2zZVQX7ga6F3xtfep+VwUZ7mHYAATaja8Ee/IYHAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAB6dV+jmYeB8Ho/i+itv8I2HpkQU/RRhs16EC5SqIKrzojf1jVlZrHaTHHrmNJ3ski9S1wZlpa37NI1YezOWw1RQs3Nhk1uObZNpPC111sglpmTdaI/RiMnZyVxISJy8FfqDNy4nlm6GHbmRDitWqn4X6loWKnZ1Ig0ypQtZIPNkVXLYAsiaLkOPY55yKsvxYyIGCB4d8RVKUBWx9bgSt3wUvOgwRHAOauv6EVI1gxshDJ5+RwNIO0NWlLALQMgrtSIaaAfOv6JvqDfiVBZRPnYL7oumjlEtv7fI8W5f4+IDfBI8RSeIctozz5dpPs8tJiLZmtgv5y20DYz8LpXyuQA='),('b4938e4a-e17f-4884-8946-bbb234375e4c','c7604a3c-d217-410a-841b-2d3cfe05b6b9','kid','3c722003-6cfb-4e3a-b467-72a7a1fb7672'),('b81d1b22-21c2-4788-9909-6f1488a18ef2','64660e3b-5738-46da-8dc3-6408301bc246','allowed-protocol-mapper-types','oidc-full-name-mapper'),('be553fa7-3eb0-4920-9773-362ff69b8bff','d41f007c-2c89-472f-9709-93146722873d','certificate','MIICmzCCAYMCBgGMLOlCLDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjAyMjM0MDMzWhcNMzMxMjAyMjM0MjEzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCZ67dX8y5znRwLdDrN60wCSNz30R+2pEBxqciElIrjjl+sXRoPtnBUdoM8BxnXykpHc9Vy3GJePTlTO7utvtIKuukZxg2XiOf9iUksY1W8MsGgy+vQTDWfotI1m/Gw6AwC8ePp8ViwxYGZKx/ig/PMIp8pPlluh0bJRmv5Z+I23NkrgtH2sQJHncXEeqJsGZR2oqpLCu5pT/SoIwR39pJSYEhEKoJFtqUd+jx0ThUI1z5p1ewSs/kXeMJncJZFSv32hqzSXgYakZ0XUMhO/MA4GM0XN5i6ru9kUo1SHfIHQwiFN6u/sGHfCXZ59xgeC70HBcfe6QTcw9YA5nRJf0BpAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIJ4Q/8LyG2l05gFYwzPf0kEOTs6VWAoXdA6zDggGzSum0bEUQwFKnPmsT66IElTu8K/y/pUGqYrXqEu1l7uC7E+Aqs9/jQL/LHVIdjkB0phl9iT3gz/Ml1BYzqMivLdlyYZiatxC0giA9WR79SmpH9Mdtt2VOURyVbxe4OnsjR3z/qhAs370jS1MlIp2kE0EjCUSY+6N2gCXdimPzOM1x9Md3/BV3359UhDaYVGk26hnyhwo+PDDASFvzybpLq7gl12YNfLW2qJlxmiGNC886jMqM+DnxrS5AeopxXjDrV3GRarVPBLDGlvS8uvO2A9pf/0f7jG4LOKPqr8WgBW7Vw='),('c4cad9ba-6133-4c7c-a3fa-7173388050c5','811288b9-8e90-487b-969b-82d36b785c27','privateKey','MIIEogIBAAKCAQEAlj7hGD7EBKZJI/qxwznR0WxJfNz+anJrhUR330SaDrudUSwthjn6W5/lj0zUdyUAXpNYtyU5vsQqfA/29+YuWpDLVMvGxL9vj2btlJZBE8dSWxAZGjDhq8yQJDUZlCpvyeswnoxVAAkSCTKi5u9/mMWWlQWwdla8EcTo13T+QrMyr321sG6oKma6H8JYdHtn9V++ciiIEaI3XCUvNC2xQODtcIWhapmaqFgd9mPp58qB3G3xc3m2aKDWlQiCUMpsdF39T9bvDeENY0AHIF4/NlW+BF6ECTZPGVlER4YoUAsES41k2OV5dqLoqEIUur3ekPh6ZhJOoXTs5oU20Bzb+QIDAQABAoIBAEznvrx0VE20+DdMeXVewUGbVjptvGSsUNEUbO+B5AGqkyobnOnZ/4aq4Axr3U1nSTsf3QdSLK6zJrP+UAIwdoWxHAM5k3LeMrKKkw29o24GVud54/9+CeWwfg+qhn9LAZGvq2Fcn523Bt5iZvQin4OJkDyTfvH0D6xgyHaQ0h09Zn92LySvJlq/6phwniu/UZ+uUxSdZ9AjdCY2wYKUMRXKaQZuOO0W+1WVCZ0W6OSL7zIn683Kr0RoYt2uzC38mZz/m96yscoqJT/XrGasAMKQ+hijmttZYl6eD9k4WLmTMxPrpmYaCPIXueVMyRX5BROiGRGKf8NDrMJ7LcpiJAECgYEA3OZyiGYfuN86hxOgQdz6JwsMdfroZCXSzFoac3Od7ou3T/xtZgS4xwWnhLiwvTWqZxk4G7HhyyFrQynwCWvPVNEqj2JsOyyeSXaQruIWH2tMJH1sRuG1zDeO/KcX/JJ2msLzz0qO5Z5s1MzbSx0sbiQxxcPrnVeC0dH+tNy7wMECgYEArh5q5kRDGSjn70dT3snzptjGEUTdaxwHy8KiUusV5B4gomhNaXNXL2PdtK6nkzv4m1l2WbQsggTN4xqeS8Wr1in15i3lp5ZCwSl/3F6DaJdr2v3QWC1YgpOkaN/ItYwhIO+d+jcEdOQYf6oVMMzhpskPcSErhVWUg+MujArqMTkCgYAruUF6Vhx5T1YaXnweDUtGZx10TNGq4QG0iTErIPtluCn0nxZYVx7r5eaekqAJE5JDDe7ZLIBw4JCGnspwUvKa6zvtXaHmpJJAIEPLGd0fIvHTVzATZ6HAZk7bG4fX6nWndGcl5LAcKxuHk3TkjUW6F1fyuTDt1+CA/3vW+MoBAQKBgAL5E/wwiDDCyQsF3cG9EwLzSpZ65YjxppRtE1Z1Gx+VABulykSVqpRtkRiHrubNrFYCtgmcEPJ7YISTLMbAbkmu17sBZ51v7F3d9oftuTKs+zN3B/qpc4xvNuxvfb7T0LD+RmVCUToptt1fKxN1PBkb776PwW16Y5nI5D+R5CPJAoGAM4sGAcGnoxkBZTM4PKwewdpHvPRqKkM/iFNLKwc+7Fz3Hc0t4jhbHuvOzT6KjrnSqOz0WZy3R9TpCeS4d+OMWARiTYbM2eNG9N3uIF1cP/D5QHUOcKi/dl33oXjb8QVzYZ/Kw/9q17M6kMlcoicbl3GqB32PIL8eDK3i4yjrv2w='),('d40215b1-b45c-469a-9cd6-0e33448bf45d','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d4e82ef1-abfa-478f-b999-cf8e15f23394','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-role-list-mapper'),('dd282967-c3e4-47d8-99ca-a78cf3846908','5115273f-4a37-4381-b0be-113b45f809eb','privateKey','MIIEowIBAAKCAQEAtJ4RD9lzGl4BDdvopc3cFoWeYlqIayHfymUIBOhGkZTnSTlicyrPiys9nskwuw0LyN4UuaTJoiw4R440acriC7KJe3PEsK/bLGFxLLlNj1koRXLfZ2rVpOd7NQa6+EWYHVTyODnZ8Oc7p3Oo8Tnt3VxCEN/fkeLaz+lx3EEFSyJP6mBVa5AFCg6O2w+mR8v4LFdRkAwsc63+pux83/hVJXaALWIe3m8pgKjl3k/NDRUrqux4B8ZSPamNqQ3YH/Ma2OiDe5L34UR3AReWfYh8kPn2wlvtHE3zQe+I2C2qoYfbMkts2VUF+4Guhd8bX3qflcFGe5h2AAE2o2vBHvyGBwIDAQABAoIBAAvad8ovfiNT2gPb08fV28TKnhtcT6mgPnyc5srTp5X0TL18e56NR7OdcdzS3VTZRVW4ZWnNi8IN3t+rUHtE6lLUM7ubXGQwFlUyS+ggfRuUQVVVdZ3m4ACDhI11VJ3oi1QZeBACk/AAbOTPbV3vbFHjtR5AYv7DAZM1gdhvl/ZXPNYV9z9ngaPAwxM7tLSfOqV5o4KLU7YduOpTtrCy+WO5cv0e3/w2g0fYw8leJxgQHz+4/2MLVMrprLH1HVT1feKMeEREvIcwSetMQO0GsW4COIAOUFouB9Yt5TgHlylb2Xg/MdDaOQ48aiBnYXn8U/2wMQsjD+2HBqH3O4CIkWkCgYEA5rytyGl6PmRzgsSFNSB1B4Lk9TRUN+k9+hITabaQsZ1ImloEbQkrHnKLttwKWFmLEjua4KY1b+cjC3jBGvOjpwIua5YIEQSjrrKiU2yeggehcpIz8gutaYxnUqVvbGIg3tTcvj0UkGphvUmlApmsvjvSg9hveqG145b62/4FcTUCgYEAyGSWb+Fc9eQja49hrHoEqoETEYeJKA9DQZZq5n8TWgqZeCdq9ihyUjiMv3VjfIuWhUvUWkAhxJ9Z81wtl5xmI6lZzJ48dxX1LUddYXb0qlHkmT354xus25j6WXBrFLR6wcpgNvhjWBOgXf2zHDP9QqrPllWJ0ZvmuWzfhE1N3csCgYEAwvA7fmumzNm/QYbY5/ahCRSMbaGlWYtkQkdNQW3ttzGj6kwNGzW4yUOLSJWE4/na5i+XfR7PXNiRohqGQ0f+RpYwM9MQw5gA1hKz0/mbvU3HF+3vlxpIizkE/i0pAw+wp7J9QPiHzC8knnB+ycCd0ibmh1+vZ5MCAeNH0988J9UCgYAtd9VCcWn8SNVYlGHfFph0b3D6KzyNoFjsSsranb6wUXNc9eSpEahOy5Hz5xi5q5ptiDUYfTCsQlPQifu2SMBMGyLK8KRbiNnmeijP8oO1GXu64XsPcroX4W/8VyuUuRaZXefS0S0JUPq0GNpI7erq84LCY4ovyyXgsLlOdZPTXQKBgD77RuyvMQxFrEzhXvjNRBKu6Wp7AOWFQnRHTa4CKMkcEvxhXJHJP39WVJOM7FV40Mr8pSCxhF8Hh0jcBqNP33wl5cHXm0UF+OpUk9xKR9UTvqioKgCdTS1kenN4zil1JxTBQpgkmCUxulmHH5GIvNqfX8zC77obLG5Ec1mYbGlj'),('debc0d82-6808-4d21-8c91-81e569948a46','564c0329-aa9a-482f-88b7-8c240437ee85','allowed-protocol-mapper-types','oidc-full-name-mapper'),('e6d1d031-bebf-4960-939d-fb07edc8903d','64660e3b-5738-46da-8dc3-6408301bc246','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e88eda6a-ed59-4cf3-be01-c32c7993c020','564c0329-aa9a-482f-88b7-8c240437ee85','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('e9d40853-6ae2-4ffc-853f-ca0af3fb2c83','20217c77-2196-4ae6-9d79-e799d807904c','secret','MMDkLlicjcJfUYGGld0Zn79Uj7LZjVSZt6uNoBqm0geJmoJ8sj_WdfLluRMnsubsZ0RvKTp3dOb1d8r-VIbSuQ'),('ecd202fc-18c2-442a-8e83-dbf7d8450fd0','64660e3b-5738-46da-8dc3-6408301bc246','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('ecd8434f-12f7-45d6-ba53-29dc8d9ea811','c7604a3c-d217-410a-841b-2d3cfe05b6b9','secret','lFx-rpR_SyCGtHqCtAqwYw'),('ed3802be-58ab-4cc2-a9d9-5fdebdf58ecc','d41f007c-2c89-472f-9709-93146722873d','priority','100'),('edec7eab-d21d-4529-b556-e617e012ef83','c7604a3c-d217-410a-841b-2d3cfe05b6b9','priority','100'),('ee7303c6-d247-4192-a1a8-8167b83b1d28','38e0b40f-7b92-4376-acfe-9d3ac589ccd2','secret','Y2VcDNpbRjOtM7IO3pUgfw'),('f00e31c5-cf16-44b4-8357-7d6d0845695e','20217c77-2196-4ae6-9d79-e799d807904c','priority','100'),('f5e47e14-7a5c-41d4-a492-cfb4a3220978','0098e192-5eea-4102-bbf0-f69798acea5d','client-uris-must-match','true'),('f76ae833-e10e-4d06-b15f-b76f0624f52e','0bfdf09e-d23d-4d49-9814-08741ba051a8','priority','100'),('f83a2599-9776-479c-aa94-2d6281377b7b','765cd604-3dd6-49b4-af5e-7363f1d7883e','allow-default-scopes','true');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('1492c1c3-8db8-4683-b269-adc871f024c0','1c31ed2b-9c9e-4ca4-8d18-e4ffc3cf5a34'),('34301b54-03ba-4e36-9e72-b8ca86062639','3226f9a9-90fe-4fdd-955d-f0cff8ee52b9'),('34301b54-03ba-4e36-9e72-b8ca86062639','efaeaac5-4cb6-4d7a-b3e9-2fd4f47db21c'),('3f4c461f-a9b2-4de1-af8b-570e30823736','0222e003-8eef-4e50-bf50-d0f6d048d852'),('3f4c461f-a9b2-4de1-af8b-570e30823736','0c59995c-5988-451b-8e14-fee924545349'),('3f4c461f-a9b2-4de1-af8b-570e30823736','191ae110-15bc-45d6-9514-bf1aa26b9b29'),('3f4c461f-a9b2-4de1-af8b-570e30823736','1acdf646-5d27-4cc6-8da7-e6a616041cba'),('3f4c461f-a9b2-4de1-af8b-570e30823736','1b399ef3-f574-47db-a64b-0613cca2531a'),('3f4c461f-a9b2-4de1-af8b-570e30823736','21320c25-dacf-4897-8598-d31bee755092'),('3f4c461f-a9b2-4de1-af8b-570e30823736','23dadaa9-3fbf-43a5-874f-10acccd49bc6'),('3f4c461f-a9b2-4de1-af8b-570e30823736','3226f9a9-90fe-4fdd-955d-f0cff8ee52b9'),('3f4c461f-a9b2-4de1-af8b-570e30823736','34301b54-03ba-4e36-9e72-b8ca86062639'),('3f4c461f-a9b2-4de1-af8b-570e30823736','3feb0d18-5349-489f-b6f9-15ef34dc0327'),('3f4c461f-a9b2-4de1-af8b-570e30823736','432d57ff-5f0d-4a20-b205-9b68d2189d62'),('3f4c461f-a9b2-4de1-af8b-570e30823736','4bc2a9d4-0f30-4a4d-80ba-7cc86c669c9f'),('3f4c461f-a9b2-4de1-af8b-570e30823736','4e5515e5-b0ef-42cf-a650-f0a8d7d491d5'),('3f4c461f-a9b2-4de1-af8b-570e30823736','4ecc341f-aba2-48bc-95c1-7e6644007782'),('3f4c461f-a9b2-4de1-af8b-570e30823736','536f714d-13b1-4726-bbca-a8a7f3625d46'),('3f4c461f-a9b2-4de1-af8b-570e30823736','5e31d768-a652-4e9f-b981-7679a5e6622b'),('3f4c461f-a9b2-4de1-af8b-570e30823736','6eb07d1c-58fb-485e-a251-7bf94fb66ee9'),('3f4c461f-a9b2-4de1-af8b-570e30823736','701d115a-f638-4898-9062-e32b6bc10084'),('3f4c461f-a9b2-4de1-af8b-570e30823736','70ad4c8b-f7f4-48dd-ad58-e9ced5017c2f'),('3f4c461f-a9b2-4de1-af8b-570e30823736','7dd3709d-16a0-4316-9207-714bfe70a07a'),('3f4c461f-a9b2-4de1-af8b-570e30823736','81429667-3be9-489b-bf89-903d0548f026'),('3f4c461f-a9b2-4de1-af8b-570e30823736','980fe328-746a-4a23-bbb9-de7a18c701d2'),('3f4c461f-a9b2-4de1-af8b-570e30823736','9e8f14fd-9fd3-4dfd-8099-fae47e027929'),('3f4c461f-a9b2-4de1-af8b-570e30823736','a739369f-bf09-4c4a-a39d-7c3ce89a65a8'),('3f4c461f-a9b2-4de1-af8b-570e30823736','b3f3f717-bdbe-43d0-8244-0f0b66805cee'),('3f4c461f-a9b2-4de1-af8b-570e30823736','b8e0169b-ec0c-4135-a9dc-408c7f055281'),('3f4c461f-a9b2-4de1-af8b-570e30823736','c569ef3c-24dc-4816-ae0b-7f83c3bd6106'),('3f4c461f-a9b2-4de1-af8b-570e30823736','c5f44453-8a33-4cb5-a4c4-91f2db31c7a9'),('3f4c461f-a9b2-4de1-af8b-570e30823736','c8e66eef-6c58-4767-81ef-6457958fdf12'),('3f4c461f-a9b2-4de1-af8b-570e30823736','c9907dfa-8f0d-49a5-aff0-580af4d694e9'),('3f4c461f-a9b2-4de1-af8b-570e30823736','eb592af3-23aa-4d38-a893-5981202f2b2e'),('3f4c461f-a9b2-4de1-af8b-570e30823736','edefc3fe-f546-43e6-8010-0bade857d591'),('3f4c461f-a9b2-4de1-af8b-570e30823736','ee98311c-8c82-4964-b972-7d8580e4fc0f'),('3f4c461f-a9b2-4de1-af8b-570e30823736','ef5037c8-8ac7-4dfb-9f28-a0360bdaa5ee'),('3f4c461f-a9b2-4de1-af8b-570e30823736','efaeaac5-4cb6-4d7a-b3e9-2fd4f47db21c'),('3f4c461f-a9b2-4de1-af8b-570e30823736','fcf2e600-e7dc-4a47-9164-419f485c7f0b'),('3f4c461f-a9b2-4de1-af8b-570e30823736','ff5528f5-a197-4ea9-a1c4-8278bc65fbb7'),('3feb0d18-5349-489f-b6f9-15ef34dc0327','5e31d768-a652-4e9f-b981-7679a5e6622b'),('54d5c122-1802-4139-b68d-e2cec2facbb8','09c39e33-cc18-4493-b30a-958b5ccb54aa'),('55c43002-4c16-49ef-87a5-30deaa22314b','8748520e-df8c-448c-b03a-f7e53b6bf973'),('55c43002-4c16-49ef-87a5-30deaa22314b','8f22b474-5230-47a1-82d1-922f73a786e9'),('55c43002-4c16-49ef-87a5-30deaa22314b','92e0c80c-ed04-427a-89da-e936808b8d09'),('55c43002-4c16-49ef-87a5-30deaa22314b','f1a73bfd-e4f4-4346-bf47-0e92b3941990'),('70ad4c8b-f7f4-48dd-ad58-e9ced5017c2f','23dadaa9-3fbf-43a5-874f-10acccd49bc6'),('70d0fe77-e963-453b-935e-6984d04c3ea2','029be5cf-c565-4b6d-b87a-cfde88ad29b0'),('92e0c80c-ed04-427a-89da-e936808b8d09','2026770f-d9f4-45c6-ad72-901d39ebf1a4'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','26084389-cab9-45fa-93ea-66f47fcdbbd1'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','285bf1b2-c1b4-4581-a161-bd23ac640baa'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','345907e8-7f50-43f5-9c81-624da4d4942b'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','48533797-37fb-479c-b4aa-4f054faed6ac'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','5d43716f-3ca5-48da-9d7d-739f529096dd'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','7460cf09-2886-4829-bcd0-5ccaa42dbd57'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','75b816a1-3b66-4c03-b75a-8b772946c711'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','7d2dda07-06ff-4d4f-89d3-820498596b27'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','a2a6d51e-21d2-43af-8939-bc8358d562b8'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','a633afdc-9331-4419-953e-69c90773f17e'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b4818dfb-4434-41fa-9600-434ca3f5442f'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b54bfb8c-12c5-4d91-8d17-8913208e6765'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b5d2075c-edf2-4415-b121-87b1bd4286f7'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b9839a7b-b519-4c27-bf9f-396e5bb51bb2'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','ca0b5753-e677-420d-bb53-0fc590c08c1e'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d118260b-b1fe-41b8-83e3-48f76748d0fc'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d7263fd7-1aa8-471a-a562-2576e6a886dd'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','f054da5a-1733-4542-b8da-4ba49f1b89ce'),('a74a3d88-75c8-4d61-868e-f98e2cc082bf','1492c1c3-8db8-4683-b269-adc871f024c0'),('a74a3d88-75c8-4d61-868e-f98e2cc082bf','1d4f80b4-d64b-4328-a589-94c57684a04b'),('a74a3d88-75c8-4d61-868e-f98e2cc082bf','d5232365-1399-4e52-b210-d7c7a61e6fe4'),('a74a3d88-75c8-4d61-868e-f98e2cc082bf','f0da5bc1-b8d4-48e7-aaa7-5f8ec9d17b17'),('b4818dfb-4434-41fa-9600-434ca3f5442f','7d2dda07-06ff-4d4f-89d3-820498596b27'),('b4818dfb-4434-41fa-9600-434ca3f5442f','a633afdc-9331-4419-953e-69c90773f17e'),('cc741b1f-79ad-4735-b084-2a4c3c5c66ad','869769a8-c5a8-4c5a-8ef5-0c11817540a9'),('d118260b-b1fe-41b8-83e3-48f76748d0fc','d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf'),('dea41763-6811-47a0-a1e9-0652e7487c4f','7a33b7d5-afac-418a-ba38-3a4d696d4cbe'),('edefc3fe-f546-43e6-8010-0bade857d591','701d115a-f638-4898-9062-e32b6bc10084'),('edefc3fe-f546-43e6-8010-0bade857d591','c5f44453-8a33-4cb5-a4c4-91f2db31c7a9');
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
INSERT INTO `CREDENTIAL` VALUES ('2982b8df-32f1-4a5f-a3dc-0e25d93a039d',NULL,'password','9b5c99bd-e66b-4000-a8c2-56fdecab43ce',1701565588553,NULL,'{\"value\":\"ke9aUB4+JJMgo8AnJG7Hjj8DE/cGl7GV8YhGzSbx+E6KHPhtdk1Z29tzNAqQFiY3QuLKRxyVcbyxNJ4gPX3CGA==\",\"salt\":\"L8vaKexFPPDxPCyJIziGHA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('305ee51a-b2c2-4cb1-92d7-1efc25490626',NULL,'password','2f6650fe-043d-4493-a874-59066469b671',1701565821722,NULL,'{\"value\":\"DWtJ+wUOWS7Jqlle7lSSsCK6xJWGZtcki+N4zZqODOlqUWc1iYAOfisCZjrPACcQ+uSAOmyY8ozcHGCDGxntXQ==\",\"salt\":\"35Cqw4Unqz9fN8hIJEsSOw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('3914654d-c009-481d-987d-55b7aa1fe574',NULL,'password','ec538e8b-e987-4845-b49b-0db3236f1e88',1701562160656,NULL,'{\"value\":\"N5zmJekPho0LXMY6N+0MLxJlExaMMopX6wkUmqeu7Yv/FN7IZaYXTajqDy3fHLgVLZrCjH5MXN5dCurL7mCyIQ==\",\"salt\":\"ZtODW4CREwc2daiBwYOiMQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('977aa548-f772-48f1-bc29-49611566122e',NULL,'password','fc16917b-0eb1-4f18-82d7-d92752b7219f',1701560534294,NULL,'{\"value\":\"rpJz3s7K7IndGsSnDZDsMG+E5Ql4sDV5wmQ6DdRnaPrevhy4/BhgTHN7dP9n3spPipNx+GnXK1GBxXmEQOLRAg==\",\"salt\":\"Lchh/OFSAE9/BwP7dccpSw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-12-02 23:41:03',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-12-02 23:41:03',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-12-02 23:41:05',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-12-02 23:41:05',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-12-02 23:41:10',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-12-02 23:41:10',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-12-02 23:41:14',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-12-02 23:41:14',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-12-02 23:41:14',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-12-02 23:41:19',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-12-02 23:41:21',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-12-02 23:41:21',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-12-02 23:41:21',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-02 23:41:22',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-02 23:41:22',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-02 23:41:22',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-02 23:41:22',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-12-02 23:41:25',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-12-02 23:41:28',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-12-02 23:41:28',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-02 23:41:28',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-02 23:41:28',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-12-02 23:41:28',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-12-02 23:41:28',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-12-02 23:41:28',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1560452342'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-12-02 23:41:29',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-12-02 23:41:33',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-12-02 23:41:33',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1560452342'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-12-02 23:41:36',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-12-02 23:41:36',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-12-02 23:41:37',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-12-02 23:41:37',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'1560452342'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-02 23:41:37',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1560452342'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-02 23:41:37',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-02 23:41:41',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-12-02 23:41:41',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1560452342'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-02 23:41:41',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1560452342'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-12-02 23:41:41',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-12-02 23:41:41',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-02 23:41:41',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-02 23:41:41',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-12-02 23:41:41',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-02 23:41:45',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-12-02 23:41:45',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-02 23:41:45',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-02 23:41:45',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-02 23:41:45',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-02 23:41:48',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-02 23:41:48',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-12-02 23:41:51',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-12-02 23:41:51',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-12-02 23:41:52',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-12-02 23:41:52',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1560452342'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-12-02 23:41:52',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-02 23:41:52',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-02 23:41:52',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-02 23:41:53',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-02 23:41:57',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-12-02 23:41:59',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-12-02 23:41:59',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-02 23:41:59',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-02 23:41:59',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-12-02 23:42:00',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-12-02 23:42:00',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-02 23:42:00',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-12-02 23:42:00',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-02 23:42:00',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-12-02 23:42:00',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-12-02 23:42:00',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-12-02 23:42:01',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1560452342'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-12-02 23:42:01',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'1560452342'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-02 23:42:01',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1560452342'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-02 23:42:01',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1560452342'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-02 23:42:01',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1560452342'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-02 23:42:02',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-02 23:42:02',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'1560452342'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-02 23:42:02',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1560452342'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-02 23:42:02',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-02 23:42:04',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-02 23:42:04',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-02 23:42:04',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1560452342'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-02 23:42:04',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1560452342'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-02 23:42:04',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1560452342'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-02 23:42:04',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1560452342'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-02 23:42:04',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1560452342'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-12-02 23:42:04',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'1560452342'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-02 23:42:05',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-02 23:42:05',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'1560452342'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-02 23:42:05',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'1560452342'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-02 23:42:05',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'1560452342'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-02 23:42:05',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1560452342'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-02 23:42:05',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-02 23:42:05',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'1560452342'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-02 23:42:06',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'1560452342'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-02 23:42:06',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'1560452342'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-02 23:42:06',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'1560452342'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-02 23:42:06',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1560452342'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-02 23:42:06',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1560452342'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-02 23:42:06',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1560452342'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-02 23:42:06',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1560452342'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-02 23:42:06',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1560452342'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-02 23:42:06',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'1560452342'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-02 23:42:06',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'1560452342'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-12-02 23:42:06',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'1560452342');
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
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','2f169a50-01d2-44c9-87b1-f32eb59e2ed5',_binary ''),('master','58d58d1a-8bbe-48c4-a3d4-53a1dcb50c54',_binary ''),('master','5d8e568a-fa41-46f9-89ec-8db1aa8146fb',_binary ''),('master','5f8340b3-418d-46a0-80c2-7aefafcfa431',_binary '\0'),('master','60d4d674-7a4f-4bf3-bf6e-c273648aa2b7',_binary ''),('master','7dd1278d-8b80-4295-98ae-35b442bcdec9',_binary ''),('master','91220519-7b53-4290-bacd-cb871ad4b263',_binary '\0'),('master','92b4690e-0806-4349-a095-e5ffe2368cb6',_binary '\0'),('master','bbf418d6-2ea4-416f-bff8-7ee42db4e864',_binary '\0'),('siglo21','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('siglo21','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('siglo21','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('siglo21','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('siglo21','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('siglo21','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('siglo21','b229e7fc-3666-4f8f-b02d-0f24dc04e851',_binary ''),('siglo21','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('siglo21','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_envios`
--

LOCK TABLES `detalles_envios` WRITE;
/*!40000 ALTER TABLE `detalles_envios` DISABLE KEYS */;
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
  UNIQUE KEY `UK_8uaci42cp3l4dfb06d7v4s7sb` (`id_estado`),
  KEY `FKe1ag585ivpih4nqoqddp95fsj` (`id_cliente`),
  KEY `FK9cqc2i803wtcip4voinjpg00w` (`id_zona`),
  CONSTRAINT `FK23hl635dxtn2m4pl9fcveh34f` FOREIGN KEY (`id_estado`) REFERENCES `estados_envio` (`id_estado`),
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
  `estado_type` varchar(31) NOT NULL,
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_envio`
--

LOCK TABLES `estados_envio` WRITE;
/*!40000 ALTER TABLE `estados_envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_hoja`
--

DROP TABLE IF EXISTS `estados_hoja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_hoja` (
  `estado_type` varchar(31) NOT NULL,
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0222e003-8eef-4e50-bf50-d0f6d048d852','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_view-authorization}','view-authorization','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('029be5cf-c565-4b6d-b87a-cfde88ad29b0','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-consent}','view-consent','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('09c39e33-cc18-4493-b30a-958b5ccb54aa','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','administrador-cliente-rol','administrador-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('0c59995c-5988-451b-8e14-fee924545349','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_manage-users}','manage-users','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('12cc4ee0-9194-49d7-bc7b-1309e107e4ce','0ca2e86b-131e-454d-95a7-c124ad72b7cb',_binary '','${role_read-token}','read-token','siglo21','0ca2e86b-131e-454d-95a7-c124ad72b7cb',NULL),('1492c1c3-8db8-4683-b269-adc871f024c0','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',_binary '','${role_manage-account}','manage-account','master','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',NULL),('191ae110-15bc-45d6-9514-bf1aa26b9b29','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_impersonation}','impersonation','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('193a324c-aa89-462b-ba3d-f71949dff5a6','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',_binary '','${role_view-applications}','view-applications','master','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',NULL),('1acdf646-5d27-4cc6-8da7-e6a616041cba','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_view-events}','view-events','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('1b399ef3-f574-47db-a64b-0613cca2531a','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_manage-events}','manage-events','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('1c31ed2b-9c9e-4ca4-8d18-e4ffc3cf5a34','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',_binary '','${role_manage-account-links}','manage-account-links','master','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',NULL),('1d4f80b4-d64b-4328-a589-94c57684a04b','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',_binary '','${role_view-profile}','view-profile','master','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',NULL),('2026770f-d9f4-45c6-ad72-901d39ebf1a4','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-account-links}','manage-account-links','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('21320c25-dacf-4897-8598-d31bee755092','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_create-client}','create-client','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('23dadaa9-3fbf-43a5-874f-10acccd49bc6','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_query-clients}','query-clients','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('26084389-cab9-45fa-93ea-66f47fcdbbd1','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','vendedor-cliente-rol','vendedor-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('285bf1b2-c1b4-4581-a161-bd23ac640baa','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-identity-providers}','manage-identity-providers','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('3226f9a9-90fe-4fdd-955d-f0cff8ee52b9','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_query-users}','query-users','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('34301b54-03ba-4e36-9e72-b8ca86062639','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_view-users}','view-users','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('345907e8-7f50-43f5-9c81-624da4d4942b','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-realm}','manage-realm','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('3f4c461f-a9b2-4de1-af8b-570e30823736','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('3feb0d18-5349-489f-b6f9-15ef34dc0327','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_view-clients}','view-clients','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('432d57ff-5f0d-4a20-b205-9b68d2189d62','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_query-realms}','query-realms','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('48533797-37fb-479c-b4aa-4f054faed6ac','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-users}','manage-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('4bc2a9d4-0f30-4a4d-80ba-7cc86c669c9f','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_manage-users}','manage-users','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('4e5515e5-b0ef-42cf-a650-f0a8d7d491d5','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_manage-clients}','manage-clients','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('4ecc341f-aba2-48bc-95c1-7e6644007782','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_view-realm}','view-realm','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('536f714d-13b1-4726-bbca-a8a7f3625d46','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('54d5c122-1802-4139-b68d-e2cec2facbb8','siglo21',_binary '\0','adminitrador de rol realm','administrador','siglo21',NULL,NULL),('55c43002-4c16-49ef-87a5-30deaa22314b','siglo21',_binary '\0','${role_default-roles}','default-roles-siglo21','siglo21',NULL,NULL),('5d43716f-3ca5-48da-9d7d-739f529096dd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-clients}','manage-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('5e31d768-a652-4e9f-b981-7679a5e6622b','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_query-clients}','query-clients','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('61de6b38-c7ee-4258-b9f4-6deb8c558e17','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-applications}','view-applications','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('6eb07d1c-58fb-485e-a251-7bf94fb66ee9','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('701d115a-f638-4898-9062-e32b6bc10084','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_query-users}','query-users','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('70ad4c8b-f7f4-48dd-ad58-e9ced5017c2f','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_view-clients}','view-clients','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('70d0fe77-e963-453b-935e-6984d04c3ea2','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-consent}','manage-consent','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('7460cf09-2886-4829-bcd0-5ccaa42dbd57','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-authorization}','manage-authorization','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('75b816a1-3b66-4c03-b75a-8b772946c711','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-events}','manage-events','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('763a4481-3240-49dc-87a2-91b8297796dd','8002346b-4b80-4e9f-a4be-61f9cc1d6815',_binary '','${role_read-token}','read-token','master','8002346b-4b80-4e9f-a4be-61f9cc1d6815',NULL),('7a33b7d5-afac-418a-ba38-3a4d696d4cbe','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','repartidor-cliente-rol','repartidor-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('7d2dda07-06ff-4d4f-89d3-820498596b27','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-groups}','query-groups','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('7dd3709d-16a0-4316-9207-714bfe70a07a','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_manage-realm}','manage-realm','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('81429667-3be9-489b-bf89-903d0548f026','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_create-client}','create-client','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('85df54d2-d7db-4345-b372-43341916a37b','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',_binary '','${role_delete-account}','delete-account','master','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',NULL),('869769a8-c5a8-4c5a-8ef5-0c11817540a9','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',_binary '','${role_view-consent}','view-consent','master','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',NULL),('8748520e-df8c-448c-b03a-f7e53b6bf973','siglo21',_binary '\0','${role_offline-access}','offline_access','siglo21',NULL,NULL),('8f22b474-5230-47a1-82d1-922f73a786e9','siglo21',_binary '\0','${role_uma_authorization}','uma_authorization','siglo21',NULL,NULL),('92e0c80c-ed04-427a-89da-e936808b8d09','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-account}','manage-account','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('980fe328-746a-4a23-bbb9-de7a18c701d2','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_view-events}','view-events','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('9e8f14fd-9fd3-4dfd-8099-fae47e027929','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_view-authorization}','view-authorization','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','siglo21',_binary '\0','','vendedor','siglo21',NULL,NULL),('a2a6d51e-21d2-43af-8939-bc8358d562b8','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_impersonation}','impersonation','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_realm-admin}','realm-admin','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a633afdc-9331-4419-953e-69c90773f17e','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-users}','query-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a739369f-bf09-4c4a-a39d-7c3ce89a65a8','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_view-identity-providers}','view-identity-providers','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('a74a3d88-75c8-4d61-868e-f98e2cc082bf','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('b3f3f717-bdbe-43d0-8244-0f0b66805cee','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('b4818dfb-4434-41fa-9600-434ca3f5442f','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-users}','view-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b54bfb8c-12c5-4d91-8d17-8913208e6765','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_create-client}','create-client','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b5d2075c-edf2-4415-b121-87b1bd4286f7','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-events}','view-events','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b8e0169b-ec0c-4135-a9dc-408c7f055281','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_manage-authorization}','manage-authorization','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('b9839a7b-b519-4c27-bf9f-396e5bb51bb2','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-authorization}','view-authorization','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('c569ef3c-24dc-4816-ae0b-7f83c3bd6106','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_view-identity-providers}','view-identity-providers','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('c5f44453-8a33-4cb5-a4c4-91f2db31c7a9','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_query-groups}','query-groups','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('c8e66eef-6c58-4767-81ef-6457958fdf12','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_view-realm}','view-realm','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('c9907dfa-8f0d-49a5-aff0-580af4d694e9','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_impersonation}','impersonation','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('ca0b5753-e677-420d-bb53-0fc590c08c1e','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-realm}','view-realm','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('cc741b1f-79ad-4735-b084-2a4c3c5c66ad','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',_binary '','${role_manage-consent}','manage-consent','master','9bf7d39b-328a-4c6d-a0a3-274fbfb543d6',NULL),('d118260b-b1fe-41b8-83e3-48f76748d0fc','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-clients}','view-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d5232365-1399-4e52-b210-d7c7a61e6fe4','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-clients}','query-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d7263fd7-1aa8-471a-a562-2576e6a886dd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-realms}','query-realms','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d8d693d5-a021-427f-8151-fad696e79b50','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_delete-account}','delete-account','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('dea41763-6811-47a0-a1e9-0652e7487c4f','siglo21',_binary '\0',NULL,'repartidor','siglo21',NULL,NULL),('eb592af3-23aa-4d38-a893-5981202f2b2e','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_query-realms}','query-realms','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('edefc3fe-f546-43e6-8010-0bade857d591','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_view-users}','view-users','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('ee98311c-8c82-4964-b972-7d8580e4fc0f','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_manage-realm}','manage-realm','master','308e990b-be21-4e96-864e-088044575bdc',NULL),('ef5037c8-8ac7-4dfb-9f28-a0360bdaa5ee','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_manage-events}','manage-events','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('efaeaac5-4cb6-4d7a-b3e9-2fd4f47db21c','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_query-groups}','query-groups','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('f054da5a-1733-4542-b8da-4ba49f1b89ce','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-identity-providers}','view-identity-providers','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('f0da5bc1-b8d4-48e7-aaa7-5f8ec9d17b17','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('f1a73bfd-e4f4-4346-bf47-0e92b3941990','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-profile}','view-profile','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('fcf2e600-e7dc-4a47-9164-419f485c7f0b','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',_binary '','${role_manage-authorization}','manage-authorization','master','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',NULL),('ff5528f5-a197-4ea9-a1c4-8278bc65fbb7','308e990b-be21-4e96-864e-088044575bdc',_binary '','${role_manage-clients}','manage-clients','master','308e990b-be21-4e96-864e-088044575bdc',NULL);
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
INSERT INTO `MIGRATION_MODEL` VALUES ('ncvfr','16.1.1',1701560531);
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('03e41fb0-fc09-446a-bcf2-bc7e6eb73981','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('04fe1e77-faa5-474c-9fef-cdc03bb5588a','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'92b4690e-0806-4349-a095-e5ffe2368cb6'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','openid-connect','oidc-usermodel-property-mapper',NULL,'313cd6d5-afa3-4d09-bec6-8e059c9718c3'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('07d35bb9-b877-412d-802d-49fadf95d9d4','role list','saml','saml-role-list-mapper',NULL,'58d58d1a-8bbe-48c4-a3d4-53a1dcb50c54'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'80a98201-a009-4f95-a8d9-67b46623f54d'),('13d1e141-77af-496a-862f-7f68ceee4460','username','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('16b3e11e-507a-4a5a-aee2-90f37bfdc338','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'7dd1278d-8b80-4295-98ae-35b442bcdec9'),('17b080be-49b5-4046-918b-431bdf551b67','audience resolve','openid-connect','oidc-audience-resolve-mapper','30cf30bd-693f-4790-bcd9-7d0b90bb8d5a',NULL),('1899b95c-44da-4add-abea-6885c7648271','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'28963099-19d3-4521-a02f-976d9671e893'),('1ab940e0-f0a5-4896-a52f-65a83e8fc4aa','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('23e8c805-0e11-489d-bcee-386353b2b2e9','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('28e13bc2-69d8-4720-aa76-72eaa4713c02','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'7dd1278d-8b80-4295-98ae-35b442bcdec9'),('29438da0-315c-45aa-9061-7746502f6008','address','openid-connect','oidc-address-mapper',NULL,'da127315-5241-4a8f-a46a-6bea0de8925e'),('2bee5e5b-b0c1-4ab4-a41d-ca83198590b7','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('2f3b533e-9e4e-43af-bfc5-1159b0b9a02f','address','openid-connect','oidc-address-mapper',NULL,'5f8340b3-418d-46a0-80c2-7aefafcfa431'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'313cd6d5-afa3-4d09-bec6-8e059c9718c3'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('432acee5-836c-44e0-8f8a-6ab765801d1f','role list','saml','saml-role-list-mapper',NULL,'b229e7fc-3666-4f8f-b02d-0f24dc04e851'),('4b2f4b42-15d3-4b8b-80c8-03fa23a06bc1','full name','openid-connect','oidc-full-name-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('5826ef90-9654-4fc7-943d-07d545076bba','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'2f169a50-01d2-44c9-87b1-f32eb59e2ed5'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('679042d0-bc46-4892-9c0f-946694f2eb2b','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('697375d4-4ae8-429b-8174-86ce600fd0fd','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('69b0b060-4911-460c-99d8-a24a68b61732','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('6fac24d0-b12f-45a8-a2dc-bc9d860bbbed','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('734ebc5d-95d1-496e-9952-17066ad99f50','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('7b7860fc-3725-40ac-9db3-a252940161bf','locale','openid-connect','oidc-usermodel-attribute-mapper','8ac5ae37-3d7a-41f8-85e6-47f2011ad832',NULL),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','openid-connect','oidc-usermodel-attribute-mapper','42ce5f39-f315-496d-881f-7de13ac3ae08',NULL),('7f09c44e-d61f-4f30-b88d-e772a52c5565','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('84230998-ffc8-480f-a75e-1d86071d3a35','username','openid-connect','oidc-usermodel-property-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('8824e274-f058-4c7f-9c95-a1cf126c4caf','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('944ac98f-42ce-4568-8e4e-de1595524b3d','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('a6c2b67b-1673-4907-b4dd-d2d5c97b0ec3','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'bbf418d6-2ea4-416f-bff8-7ee42db4e864'),('aa8e7b22-a896-4501-9caa-e378dc641304','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('acce6041-31c8-4b8d-b883-82fca573e051','audience resolve','openid-connect','oidc-audience-resolve-mapper','8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34',NULL),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','full name','openid-connect','oidc-full-name-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('bc99959b-7558-4797-b663-39676e5935b1','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'80a98201-a009-4f95-a8d9-67b46623f54d'),('bcf0722a-14e6-42b8-8c1e-fe1a3667f642','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'92b4690e-0806-4349-a095-e5ffe2368cb6'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'28963099-19d3-4521-a02f-976d9671e893'),('c8759b4e-562b-4658-94bc-8131ce4fa68b','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'bbf418d6-2ea4-416f-bff8-7ee42db4e864'),('cb7bff06-b5a0-46d1-b4eb-c28468fba8f3','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('cdb35946-d561-4f44-9a87-5cd4c23fd44e','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('d16a7355-71fe-49b3-b36a-506d29c6c606','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('d8951284-ffd8-4f4f-9f1b-94ac177b203d','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'b39fe518-d02f-4eac-942b-eeddf878c80f'),('de3e3426-b77f-4d4e-a174-66a011e52c18','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'7dd1278d-8b80-4295-98ae-35b442bcdec9'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('e22f7bc4-f44b-43a5-8fb6-01da20987f4b','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'60d4d674-7a4f-4bf3-bf6e-c273648aa2b7'),('e2699f39-4911-414b-948c-53c9f437925d','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'5d8e568a-fa41-46f9-89ec-8db1aa8146fb'),('fd408c93-7539-49c0-940a-1e968aaeec97','email','openid-connect','oidc-usermodel-property-mapper',NULL,'5d8e568a-fa41-46f9-89ec-8db1aa8146fb');
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('03e41fb0-fc09-446a-bcf2-bc7e6eb73981','true','access.token.claim'),('03e41fb0-fc09-446a-bcf2-bc7e6eb73981','clientAddress','claim.name'),('03e41fb0-fc09-446a-bcf2-bc7e6eb73981','true','id.token.claim'),('03e41fb0-fc09-446a-bcf2-bc7e6eb73981','String','jsonType.label'),('03e41fb0-fc09-446a-bcf2-bc7e6eb73981','clientAddress','user.session.note'),('04fe1e77-faa5-474c-9fef-cdc03bb5588a','true','access.token.claim'),('04fe1e77-faa5-474c-9fef-cdc03bb5588a','phone_number','claim.name'),('04fe1e77-faa5-474c-9fef-cdc03bb5588a','true','id.token.claim'),('04fe1e77-faa5-474c-9fef-cdc03bb5588a','String','jsonType.label'),('04fe1e77-faa5-474c-9fef-cdc03bb5588a','phoneNumber','user.attribute'),('04fe1e77-faa5-474c-9fef-cdc03bb5588a','true','userinfo.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','access.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','claim.name'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','id.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','String','jsonType.label'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','user.attribute'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','userinfo.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','access.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middle_name','claim.name'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','id.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','String','jsonType.label'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middleName','user.attribute'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','userinfo.token.claim'),('07d35bb9-b877-412d-802d-49fadf95d9d4','Role','attribute.name'),('07d35bb9-b877-412d-802d-49fadf95d9d4','Basic','attribute.nameformat'),('07d35bb9-b877-412d-802d-49fadf95d9d4','false','single'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','access.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','upn','claim.name'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','id.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','String','jsonType.label'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','username','user.attribute'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','userinfo.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','true','access.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','preferred_username','claim.name'),('13d1e141-77af-496a-862f-7f68ceee4460','true','id.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','String','jsonType.label'),('13d1e141-77af-496a-862f-7f68ceee4460','username','user.attribute'),('13d1e141-77af-496a-862f-7f68ceee4460','true','userinfo.token.claim'),('16b3e11e-507a-4a5a-aee2-90f37bfdc338','true','access.token.claim'),('16b3e11e-507a-4a5a-aee2-90f37bfdc338','resource_access.${client_id}.roles','claim.name'),('16b3e11e-507a-4a5a-aee2-90f37bfdc338','String','jsonType.label'),('16b3e11e-507a-4a5a-aee2-90f37bfdc338','true','multivalued'),('16b3e11e-507a-4a5a-aee2-90f37bfdc338','foo','user.attribute'),('1899b95c-44da-4add-abea-6885c7648271','true','access.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','phone_number_verified','claim.name'),('1899b95c-44da-4add-abea-6885c7648271','true','id.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','boolean','jsonType.label'),('1899b95c-44da-4add-abea-6885c7648271','phoneNumberVerified','user.attribute'),('1899b95c-44da-4add-abea-6885c7648271','true','userinfo.token.claim'),('1ab940e0-f0a5-4896-a52f-65a83e8fc4aa','true','access.token.claim'),('1ab940e0-f0a5-4896-a52f-65a83e8fc4aa','clientId','claim.name'),('1ab940e0-f0a5-4896-a52f-65a83e8fc4aa','true','id.token.claim'),('1ab940e0-f0a5-4896-a52f-65a83e8fc4aa','String','jsonType.label'),('1ab940e0-f0a5-4896-a52f-65a83e8fc4aa','clientId','user.session.note'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','access.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','claim.name'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','id.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','String','jsonType.label'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','user.attribute'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','userinfo.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','access.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','given_name','claim.name'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','id.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','String','jsonType.label'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','firstName','user.attribute'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','userinfo.token.claim'),('23e8c805-0e11-489d-bcee-386353b2b2e9','true','access.token.claim'),('23e8c805-0e11-489d-bcee-386353b2b2e9','website','claim.name'),('23e8c805-0e11-489d-bcee-386353b2b2e9','true','id.token.claim'),('23e8c805-0e11-489d-bcee-386353b2b2e9','String','jsonType.label'),('23e8c805-0e11-489d-bcee-386353b2b2e9','website','user.attribute'),('23e8c805-0e11-489d-bcee-386353b2b2e9','true','userinfo.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','true','access.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','true','id.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','country','user.attribute.country'),('29438da0-315c-45aa-9061-7746502f6008','formatted','user.attribute.formatted'),('29438da0-315c-45aa-9061-7746502f6008','locality','user.attribute.locality'),('29438da0-315c-45aa-9061-7746502f6008','postal_code','user.attribute.postal_code'),('29438da0-315c-45aa-9061-7746502f6008','region','user.attribute.region'),('29438da0-315c-45aa-9061-7746502f6008','street','user.attribute.street'),('29438da0-315c-45aa-9061-7746502f6008','true','userinfo.token.claim'),('2bee5e5b-b0c1-4ab4-a41d-ca83198590b7','true','access.token.claim'),('2bee5e5b-b0c1-4ab4-a41d-ca83198590b7','profile','claim.name'),('2bee5e5b-b0c1-4ab4-a41d-ca83198590b7','true','id.token.claim'),('2bee5e5b-b0c1-4ab4-a41d-ca83198590b7','String','jsonType.label'),('2bee5e5b-b0c1-4ab4-a41d-ca83198590b7','profile','user.attribute'),('2bee5e5b-b0c1-4ab4-a41d-ca83198590b7','true','userinfo.token.claim'),('2f3b533e-9e4e-43af-bfc5-1159b0b9a02f','true','access.token.claim'),('2f3b533e-9e4e-43af-bfc5-1159b0b9a02f','true','id.token.claim'),('2f3b533e-9e4e-43af-bfc5-1159b0b9a02f','country','user.attribute.country'),('2f3b533e-9e4e-43af-bfc5-1159b0b9a02f','formatted','user.attribute.formatted'),('2f3b533e-9e4e-43af-bfc5-1159b0b9a02f','locality','user.attribute.locality'),('2f3b533e-9e4e-43af-bfc5-1159b0b9a02f','postal_code','user.attribute.postal_code'),('2f3b533e-9e4e-43af-bfc5-1159b0b9a02f','region','user.attribute.region'),('2f3b533e-9e4e-43af-bfc5-1159b0b9a02f','street','user.attribute.street'),('2f3b533e-9e4e-43af-bfc5-1159b0b9a02f','true','userinfo.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','access.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','email_verified','claim.name'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','id.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','boolean','jsonType.label'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','emailVerified','user.attribute'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','userinfo.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','access.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','claim.name'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','id.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','String','jsonType.label'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','user.attribute'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','userinfo.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','access.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','claim.name'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','id.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','String','jsonType.label'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','user.attribute'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','userinfo.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','access.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','claim.name'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','id.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','String','jsonType.label'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','user.attribute'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','userinfo.token.claim'),('432acee5-836c-44e0-8f8a-6ab765801d1f','Role','attribute.name'),('432acee5-836c-44e0-8f8a-6ab765801d1f','Basic','attribute.nameformat'),('432acee5-836c-44e0-8f8a-6ab765801d1f','false','single'),('4b2f4b42-15d3-4b8b-80c8-03fa23a06bc1','true','access.token.claim'),('4b2f4b42-15d3-4b8b-80c8-03fa23a06bc1','true','id.token.claim'),('4b2f4b42-15d3-4b8b-80c8-03fa23a06bc1','true','userinfo.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','access.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','claim.name'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','id.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','String','jsonType.label'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','user.attribute'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','userinfo.token.claim'),('679042d0-bc46-4892-9c0f-946694f2eb2b','true','access.token.claim'),('679042d0-bc46-4892-9c0f-946694f2eb2b','zoneinfo','claim.name'),('679042d0-bc46-4892-9c0f-946694f2eb2b','true','id.token.claim'),('679042d0-bc46-4892-9c0f-946694f2eb2b','String','jsonType.label'),('679042d0-bc46-4892-9c0f-946694f2eb2b','zoneinfo','user.attribute'),('679042d0-bc46-4892-9c0f-946694f2eb2b','true','userinfo.token.claim'),('697375d4-4ae8-429b-8174-86ce600fd0fd','true','access.token.claim'),('697375d4-4ae8-429b-8174-86ce600fd0fd','nickname','claim.name'),('697375d4-4ae8-429b-8174-86ce600fd0fd','true','id.token.claim'),('697375d4-4ae8-429b-8174-86ce600fd0fd','String','jsonType.label'),('697375d4-4ae8-429b-8174-86ce600fd0fd','nickname','user.attribute'),('697375d4-4ae8-429b-8174-86ce600fd0fd','true','userinfo.token.claim'),('69b0b060-4911-460c-99d8-a24a68b61732','true','access.token.claim'),('69b0b060-4911-460c-99d8-a24a68b61732','locale','claim.name'),('69b0b060-4911-460c-99d8-a24a68b61732','true','id.token.claim'),('69b0b060-4911-460c-99d8-a24a68b61732','String','jsonType.label'),('69b0b060-4911-460c-99d8-a24a68b61732','locale','user.attribute'),('69b0b060-4911-460c-99d8-a24a68b61732','true','userinfo.token.claim'),('6fac24d0-b12f-45a8-a2dc-bc9d860bbbed','true','access.token.claim'),('6fac24d0-b12f-45a8-a2dc-bc9d860bbbed','picture','claim.name'),('6fac24d0-b12f-45a8-a2dc-bc9d860bbbed','true','id.token.claim'),('6fac24d0-b12f-45a8-a2dc-bc9d860bbbed','String','jsonType.label'),('6fac24d0-b12f-45a8-a2dc-bc9d860bbbed','picture','user.attribute'),('6fac24d0-b12f-45a8-a2dc-bc9d860bbbed','true','userinfo.token.claim'),('734ebc5d-95d1-496e-9952-17066ad99f50','true','access.token.claim'),('734ebc5d-95d1-496e-9952-17066ad99f50','realm_access.roles','claim.name'),('734ebc5d-95d1-496e-9952-17066ad99f50','String','jsonType.label'),('734ebc5d-95d1-496e-9952-17066ad99f50','true','multivalued'),('734ebc5d-95d1-496e-9952-17066ad99f50','foo','user.attribute'),('7b7860fc-3725-40ac-9db3-a252940161bf','true','access.token.claim'),('7b7860fc-3725-40ac-9db3-a252940161bf','locale','claim.name'),('7b7860fc-3725-40ac-9db3-a252940161bf','true','id.token.claim'),('7b7860fc-3725-40ac-9db3-a252940161bf','String','jsonType.label'),('7b7860fc-3725-40ac-9db3-a252940161bf','locale','user.attribute'),('7b7860fc-3725-40ac-9db3-a252940161bf','true','userinfo.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','access.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','claim.name'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','id.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','String','jsonType.label'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','user.attribute'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','userinfo.token.claim'),('7f09c44e-d61f-4f30-b88d-e772a52c5565','true','access.token.claim'),('7f09c44e-d61f-4f30-b88d-e772a52c5565','given_name','claim.name'),('7f09c44e-d61f-4f30-b88d-e772a52c5565','true','id.token.claim'),('7f09c44e-d61f-4f30-b88d-e772a52c5565','String','jsonType.label'),('7f09c44e-d61f-4f30-b88d-e772a52c5565','firstName','user.attribute'),('7f09c44e-d61f-4f30-b88d-e772a52c5565','true','userinfo.token.claim'),('84230998-ffc8-480f-a75e-1d86071d3a35','true','access.token.claim'),('84230998-ffc8-480f-a75e-1d86071d3a35','preferred_username','claim.name'),('84230998-ffc8-480f-a75e-1d86071d3a35','true','id.token.claim'),('84230998-ffc8-480f-a75e-1d86071d3a35','String','jsonType.label'),('84230998-ffc8-480f-a75e-1d86071d3a35','username','user.attribute'),('84230998-ffc8-480f-a75e-1d86071d3a35','true','userinfo.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','true','access.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','claim.name'),('874cfa64-4ead-4591-b389-5681dc18986c','true','id.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','String','jsonType.label'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','user.attribute'),('874cfa64-4ead-4591-b389-5681dc18986c','true','userinfo.token.claim'),('8824e274-f058-4c7f-9c95-a1cf126c4caf','true','access.token.claim'),('8824e274-f058-4c7f-9c95-a1cf126c4caf','birthdate','claim.name'),('8824e274-f058-4c7f-9c95-a1cf126c4caf','true','id.token.claim'),('8824e274-f058-4c7f-9c95-a1cf126c4caf','String','jsonType.label'),('8824e274-f058-4c7f-9c95-a1cf126c4caf','birthdate','user.attribute'),('8824e274-f058-4c7f-9c95-a1cf126c4caf','true','userinfo.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','access.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','claim.name'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','id.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','String','jsonType.label'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','user.attribute'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','userinfo.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','access.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updated_at','claim.name'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','id.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','String','jsonType.label'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updatedAt','user.attribute'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','userinfo.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','access.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','family_name','claim.name'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','id.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','String','jsonType.label'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','lastName','user.attribute'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','userinfo.token.claim'),('a6c2b67b-1673-4907-b4dd-d2d5c97b0ec3','true','access.token.claim'),('a6c2b67b-1673-4907-b4dd-d2d5c97b0ec3','groups','claim.name'),('a6c2b67b-1673-4907-b4dd-d2d5c97b0ec3','true','id.token.claim'),('a6c2b67b-1673-4907-b4dd-d2d5c97b0ec3','String','jsonType.label'),('a6c2b67b-1673-4907-b4dd-d2d5c97b0ec3','true','multivalued'),('a6c2b67b-1673-4907-b4dd-d2d5c97b0ec3','foo','user.attribute'),('aa8e7b22-a896-4501-9caa-e378dc641304','true','access.token.claim'),('aa8e7b22-a896-4501-9caa-e378dc641304','gender','claim.name'),('aa8e7b22-a896-4501-9caa-e378dc641304','true','id.token.claim'),('aa8e7b22-a896-4501-9caa-e378dc641304','String','jsonType.label'),('aa8e7b22-a896-4501-9caa-e378dc641304','gender','user.attribute'),('aa8e7b22-a896-4501-9caa-e378dc641304','true','userinfo.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','access.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','id.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','userinfo.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','true','access.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','groups','claim.name'),('bc99959b-7558-4797-b663-39676e5935b1','true','id.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','String','jsonType.label'),('bc99959b-7558-4797-b663-39676e5935b1','true','multivalued'),('bc99959b-7558-4797-b663-39676e5935b1','foo','user.attribute'),('bc99959b-7558-4797-b663-39676e5935b1','true','userinfo.token.claim'),('bcf0722a-14e6-42b8-8c1e-fe1a3667f642','true','access.token.claim'),('bcf0722a-14e6-42b8-8c1e-fe1a3667f642','phone_number_verified','claim.name'),('bcf0722a-14e6-42b8-8c1e-fe1a3667f642','true','id.token.claim'),('bcf0722a-14e6-42b8-8c1e-fe1a3667f642','boolean','jsonType.label'),('bcf0722a-14e6-42b8-8c1e-fe1a3667f642','phoneNumberVerified','user.attribute'),('bcf0722a-14e6-42b8-8c1e-fe1a3667f642','true','userinfo.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','access.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','claim.name'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','id.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','String','jsonType.label'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','user.attribute'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','userinfo.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','access.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phone_number','claim.name'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','id.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','String','jsonType.label'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phoneNumber','user.attribute'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','userinfo.token.claim'),('c8759b4e-562b-4658-94bc-8131ce4fa68b','true','access.token.claim'),('c8759b4e-562b-4658-94bc-8131ce4fa68b','upn','claim.name'),('c8759b4e-562b-4658-94bc-8131ce4fa68b','true','id.token.claim'),('c8759b4e-562b-4658-94bc-8131ce4fa68b','String','jsonType.label'),('c8759b4e-562b-4658-94bc-8131ce4fa68b','username','user.attribute'),('c8759b4e-562b-4658-94bc-8131ce4fa68b','true','userinfo.token.claim'),('cb7bff06-b5a0-46d1-b4eb-c28468fba8f3','true','access.token.claim'),('cb7bff06-b5a0-46d1-b4eb-c28468fba8f3','clientHost','claim.name'),('cb7bff06-b5a0-46d1-b4eb-c28468fba8f3','true','id.token.claim'),('cb7bff06-b5a0-46d1-b4eb-c28468fba8f3','String','jsonType.label'),('cb7bff06-b5a0-46d1-b4eb-c28468fba8f3','clientHost','user.session.note'),('cdb35946-d561-4f44-9a87-5cd4c23fd44e','true','access.token.claim'),('cdb35946-d561-4f44-9a87-5cd4c23fd44e','middle_name','claim.name'),('cdb35946-d561-4f44-9a87-5cd4c23fd44e','true','id.token.claim'),('cdb35946-d561-4f44-9a87-5cd4c23fd44e','String','jsonType.label'),('cdb35946-d561-4f44-9a87-5cd4c23fd44e','middleName','user.attribute'),('cdb35946-d561-4f44-9a87-5cd4c23fd44e','true','userinfo.token.claim'),('d16a7355-71fe-49b3-b36a-506d29c6c606','true','access.token.claim'),('d16a7355-71fe-49b3-b36a-506d29c6c606','family_name','claim.name'),('d16a7355-71fe-49b3-b36a-506d29c6c606','true','id.token.claim'),('d16a7355-71fe-49b3-b36a-506d29c6c606','String','jsonType.label'),('d16a7355-71fe-49b3-b36a-506d29c6c606','lastName','user.attribute'),('d16a7355-71fe-49b3-b36a-506d29c6c606','true','userinfo.token.claim'),('de3e3426-b77f-4d4e-a174-66a011e52c18','true','access.token.claim'),('de3e3426-b77f-4d4e-a174-66a011e52c18','realm_access.roles','claim.name'),('de3e3426-b77f-4d4e-a174-66a011e52c18','String','jsonType.label'),('de3e3426-b77f-4d4e-a174-66a011e52c18','true','multivalued'),('de3e3426-b77f-4d4e-a174-66a011e52c18','foo','user.attribute'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','true','access.token.claim'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','resource_access.${client_id}.roles','claim.name'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','String','jsonType.label'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','true','multivalued'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','foo','user.attribute'),('e22f7bc4-f44b-43a5-8fb6-01da20987f4b','true','access.token.claim'),('e22f7bc4-f44b-43a5-8fb6-01da20987f4b','updated_at','claim.name'),('e22f7bc4-f44b-43a5-8fb6-01da20987f4b','true','id.token.claim'),('e22f7bc4-f44b-43a5-8fb6-01da20987f4b','String','jsonType.label'),('e22f7bc4-f44b-43a5-8fb6-01da20987f4b','updatedAt','user.attribute'),('e22f7bc4-f44b-43a5-8fb6-01da20987f4b','true','userinfo.token.claim'),('e2699f39-4911-414b-948c-53c9f437925d','true','access.token.claim'),('e2699f39-4911-414b-948c-53c9f437925d','email_verified','claim.name'),('e2699f39-4911-414b-948c-53c9f437925d','true','id.token.claim'),('e2699f39-4911-414b-948c-53c9f437925d','boolean','jsonType.label'),('e2699f39-4911-414b-948c-53c9f437925d','emailVerified','user.attribute'),('e2699f39-4911-414b-948c-53c9f437925d','true','userinfo.token.claim'),('fd408c93-7539-49c0-940a-1e968aaeec97','true','access.token.claim'),('fd408c93-7539-49c0-940a-1e968aaeec97','email','claim.name'),('fd408c93-7539-49c0-940a-1e968aaeec97','true','id.token.claim'),('fd408c93-7539-49c0-940a-1e968aaeec97','String','jsonType.label'),('fd408c93-7539-49c0-940a-1e968aaeec97','email','user.attribute'),('fd408c93-7539-49c0-940a-1e968aaeec97','true','userinfo.token.claim');
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
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','9c574c6d-1c6f-47b9-99df-d07ad6ab5504',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','0e953bbe-ec44-4f13-a1c0-fe91a9bbbb01','d0544d3d-44e1-4a66-a883-93fc9577e417','ca05121b-a1fa-4651-a6af-9a6d256fa5d9','8a0abc34-be31-42c9-89b0-24cb625b6b95','7596aae7-42c7-41d3-a816-a7a2d45d5985',2592000,_binary '\0',900,_binary '',_binary '\0','ba8392b9-fafc-4999-8a74-6236d2701089',0,_binary '\0',0,0,'a74a3d88-75c8-4d61-868e-f98e2cc082bf'),('siglo21',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'siglo21',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','308e990b-be21-4e96-864e-088044575bdc',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','157f5b00-075f-4067-8287-8d0344e1217f','cf4d9a54-858c-40da-b730-940473ba542c','3977ab6b-cb7a-4bf8-be05-76284854c4b0','d52b5242-762f-4905-bad0-926e39596c6f','2a9ab733-6f5b-47eb-a654-00021648d2b0',2592000,_binary '\0',900,_binary '',_binary '\0','69ccf855-1658-426a-93f8-839e7247e47c',0,_binary '\0',0,0,'55c43002-4c16-49ef-87a5-30deaa22314b');
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
INSERT INTO `REDIRECT_URIS` VALUES ('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','/realms/siglo21/account/*'),('42ce5f39-f315-496d-881f-7de13ac3ae08','/admin/siglo21/console/*'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','http://localhost:8080/*'),('54b4493f-4dc6-46ec-a697-a77e8977899c','/realms/siglo21/account/*'),('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','/realms/master/account/*'),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','/admin/master/console/*'),('9bf7d39b-328a-4c6d-a0a3-274fbfb543d6','/realms/master/account/*');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
INSERT INTO `repartidores` VALUES (1,'string','string');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0fd2feba-6c7d-46ea-ae62-293370736a0e','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('37daf1e6-37d2-4918-bffb-f259c4cb813b','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('3bb2f782-389c-4636-bb8a-fcad470880ac','update_user_locale','Update User Locale','siglo21',_binary '',_binary '\0','update_user_locale',1000),('3c40ea22-7a85-4daa-bb58-3cabccf0c369','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('4aa9801f-22b9-4ec2-b8a6-3289c584ed9e','terms_and_conditions','Terms and Conditions','siglo21',_binary '\0',_binary '\0','terms_and_conditions',20),('518ac166-aa63-484d-99df-32864629a7d2','VERIFY_EMAIL','Verify Email','siglo21',_binary '',_binary '\0','VERIFY_EMAIL',50),('69ebd2e1-8a5d-4cc8-b9ef-a4b5344b0ce9','UPDATE_PASSWORD','Update Password','siglo21',_binary '',_binary '\0','UPDATE_PASSWORD',30),('72a4debf-a2ea-4a07-bd76-b5b8927e2fcd','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('a0b56c29-31f3-4834-9340-5e0697ef3a92','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('a799bfdf-c308-4396-963b-d55793b1ab69','delete_account','Delete Account','siglo21',_binary '\0',_binary '\0','delete_account',60),('b9507707-317d-4086-b2a9-2c54a7ddec84','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('ceb36326-9ed7-48dd-a447-cc9698000356','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('fa854237-8361-4f5a-ba99-0d3208e7d0dc','UPDATE_PROFILE','Update Profile','siglo21',_binary '',_binary '\0','UPDATE_PROFILE',40),('fbe0ff68-4f25-4c4e-adb6-ae6c5261e7c3','CONFIGURE_TOTP','Configure OTP','siglo21',_binary '',_binary '\0','CONFIGURE_TOTP',10);
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
INSERT INTO `SCOPE_MAPPING` VALUES ('8ab7a2cb-19c7-4b5e-8a70-f13e5f684a34','1492c1c3-8db8-4683-b269-adc871f024c0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','92e0c80c-ed04-427a-89da-e936808b8d09');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_documentos`
--

LOCK TABLES `tipos_documentos` WRITE;
/*!40000 ALTER TABLE `tipos_documentos` DISABLE KEYS */;
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
INSERT INTO `USER_ENTITY` VALUES ('29034033-74bd-4a83-bee6-df10116888a8',NULL,'49bf410c-321b-41a0-b968-8e574246dd13',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','service-account-siglo21-client-api-rest',1701565486567,'4fa2d49e-051c-428b-968b-8a7110abb0ba',0),('2f6650fe-043d-4493-a874-59066469b671',NULL,'bda62084-a814-44ed-b86f-8b1584bf0504',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','repartidor.siglo21',1701565665854,NULL,0),('9b5c99bd-e66b-4000-a8c2-56fdecab43ce',NULL,'0de721bd-7b33-4510-b143-29f143e14c5e',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','vendedor.siglo21',1701565552850,NULL,0),('ec538e8b-e987-4845-b49b-0db3236f1e88',NULL,'ed769d51-5a48-4e7a-8d1c-f863e0c201f8',_binary '\0',_binary '',NULL,'alejo','herrera','siglo21','alejo.dev',1701561563790,NULL,0),('fc16917b-0eb1-4f18-82d7-d92752b7219f',NULL,'01c3b6a0-8185-40ef-bdd1-8fc30f25186d',_binary '\0',_binary '',NULL,NULL,NULL,'master','administrador',1701560534227,NULL,0);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('55c43002-4c16-49ef-87a5-30deaa22314b','29034033-74bd-4a83-bee6-df10116888a8'),('55c43002-4c16-49ef-87a5-30deaa22314b','2f6650fe-043d-4493-a874-59066469b671'),('dea41763-6811-47a0-a1e9-0652e7487c4f','2f6650fe-043d-4493-a874-59066469b671'),('55c43002-4c16-49ef-87a5-30deaa22314b','9b5c99bd-e66b-4000-a8c2-56fdecab43ce'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','9b5c99bd-e66b-4000-a8c2-56fdecab43ce'),('54d5c122-1802-4139-b68d-e2cec2facbb8','ec538e8b-e987-4845-b49b-0db3236f1e88'),('55c43002-4c16-49ef-87a5-30deaa22314b','ec538e8b-e987-4845-b49b-0db3236f1e88'),('0222e003-8eef-4e50-bf50-d0f6d048d852','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('1b399ef3-f574-47db-a64b-0613cca2531a','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('23dadaa9-3fbf-43a5-874f-10acccd49bc6','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('3f4c461f-a9b2-4de1-af8b-570e30823736','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('4bc2a9d4-0f30-4a4d-80ba-7cc86c669c9f','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('4ecc341f-aba2-48bc-95c1-7e6644007782','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('6eb07d1c-58fb-485e-a251-7bf94fb66ee9','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('701d115a-f638-4898-9062-e32b6bc10084','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('70ad4c8b-f7f4-48dd-ad58-e9ced5017c2f','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('81429667-3be9-489b-bf89-903d0548f026','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('980fe328-746a-4a23-bbb9-de7a18c701d2','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('a74a3d88-75c8-4d61-868e-f98e2cc082bf','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('b8e0169b-ec0c-4135-a9dc-408c7f055281','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('c569ef3c-24dc-4816-ae0b-7f83c3bd6106','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('c5f44453-8a33-4cb5-a4c4-91f2db31c7a9','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('eb592af3-23aa-4d38-a893-5981202f2b2e','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('edefc3fe-f546-43e6-8010-0bade857d591','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('ee98311c-8c82-4964-b972-7d8580e4fc0f','fc16917b-0eb1-4f18-82d7-d92752b7219f'),('ff5528f5-a197-4ea9-a1c4-8278bc65fbb7','fc16917b-0eb1-4f18-82d7-d92752b7219f');
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
INSERT INTO `WEB_ORIGINS` VALUES ('42ce5f39-f315-496d-881f-7de13ac3ae08','+'),('8ac5ae37-3d7a-41f8-85e6-47f2011ad832','+');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonas`
--

LOCK TABLES `zonas` WRITE;
/*!40000 ALTER TABLE `zonas` DISABLE KEYS */;
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

-- Dump completed on 2023-12-03  1:13:02
