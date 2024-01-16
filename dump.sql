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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('026703b2-1350-4883-8137-49e41649f619',NULL,NULL,'siglo21','afd5c3b4-849a-41b2-9913-8dffde39e198',2,30,_binary '','dcfe02ae-446c-4572-b5b5-6a62e47ecfc5',NULL),('02772b2a-d7ac-419e-b55e-d46586b285d5',NULL,'registration-profile-action','siglo21','602e6471-0e8c-40d0-a58b-3820a2ebf1a7',0,40,_binary '\0',NULL,NULL),('027d4dd2-8f98-46ce-bdd7-bc5438323962',NULL,'auth-spnego','siglo21','afd5c3b4-849a-41b2-9913-8dffde39e198',3,20,_binary '\0',NULL,NULL),('0377ecbb-ce8d-45f1-9236-a7548977a8b8',NULL,'conditional-user-configured','master','bad80506-0dff-4aa5-9128-9eeb5ebc482b',0,10,_binary '\0',NULL,NULL),('03b9c8f2-80aa-4cf6-ab21-949ed75d2889',NULL,'conditional-user-configured','siglo21','7cf1423e-328e-464a-9134-4a1e2e9b5e6a',0,10,_binary '\0',NULL,NULL),('08c99f08-2c91-46ae-a621-bed03fdcce1a',NULL,'auth-username-password-form','master','6ee5e3ac-4427-458b-898f-f1a37bf7c865',0,10,_binary '\0',NULL,NULL),('0974abae-34f4-4694-b00e-76a2639a9316',NULL,NULL,'master','9ce1021d-a5e3-461c-9444-9be5f2bb68bf',0,20,_binary '','fd36a86f-624d-44f5-9e13-173213b5b063',NULL),('0f23f133-6f56-4acd-b5ff-8789edfd122d',NULL,'auth-spnego','siglo21','bb3b1d7b-93e6-4439-a015-091f63e84bd0',3,30,_binary '\0',NULL,NULL),('0fcdbff7-22a5-4684-b021-7b541aac4ac0',NULL,'reset-password','siglo21','5f370d0b-c94d-4c17-81e7-0ba6b78fb457',0,30,_binary '\0',NULL,NULL),('11129bf7-cd21-43a8-a7c6-03baf182a126',NULL,NULL,'siglo21','92272466-ede4-40f1-8e30-7503a8c91756',0,20,_binary '','bb3b1d7b-93e6-4439-a015-091f63e84bd0',NULL),('17f7400a-d801-4c57-805d-7642150f65a1',NULL,NULL,'master','59b1338f-3dfd-4b35-b28c-7c93226cb60d',0,20,_binary '','50177323-6401-41b6-a9eb-373a7bbebad0',NULL),('190bfed7-9e4a-4221-9b23-c52941d5a432',NULL,'no-cookie-redirect','siglo21','92272466-ede4-40f1-8e30-7503a8c91756',0,10,_binary '\0',NULL,NULL),('1bbe94a4-847c-4d98-87c8-96981ce0dd58',NULL,NULL,'siglo21','58058938-f472-4c9d-a8ff-6c0df6683175',0,20,_binary '','236bd458-7e5d-4f7c-8184-83d6d167ebff',NULL),('1c318385-cd7e-493c-b283-c50dfc3ca906',NULL,'conditional-user-configured','master','cf45f656-3a09-45ec-b065-45211a18c2da',0,10,_binary '\0',NULL,NULL),('1d1e954f-7132-43b8-ae4d-04ad536b77e2',NULL,NULL,'master','2fd4683b-e9e6-407f-a642-f58f7f74dc37',2,30,_binary '','6ee5e3ac-4427-458b-898f-f1a37bf7c865',NULL),('217a84bd-88f3-4711-bfb0-f5b558b6b526',NULL,'direct-grant-validate-password','master','1e1e22be-93eb-4799-afcf-fb2d4b2ac2a2',0,20,_binary '\0',NULL,NULL),('2480c96d-49eb-4333-a945-a37187aea4e3',NULL,'registration-password-action','master','3353f507-eaab-40b9-857b-8de787f20080',0,50,_binary '\0',NULL,NULL),('25756028-df5e-4310-9472-2154874268cb',NULL,'conditional-user-configured','master','3e8cf941-58f8-4f37-9024-f82bcc3c00e7',0,10,_binary '\0',NULL,NULL),('282caf07-baaa-4bf9-a43f-7c4f92d37032',NULL,'identity-provider-redirector','master','2fd4683b-e9e6-407f-a642-f58f7f74dc37',2,25,_binary '\0',NULL,NULL),('29056200-7a62-4a41-aa1e-179ab99bb648',NULL,'idp-confirm-link','master','59b1338f-3dfd-4b35-b28c-7c93226cb60d',0,10,_binary '\0',NULL,NULL),('2e7845d6-de70-4791-9021-83d48fea6e03',NULL,'client-jwt','siglo21','9e710bd0-c1c9-41b6-8859-820a71f06a3a',2,20,_binary '\0',NULL,NULL),('2f2aaa02-c008-4d90-a379-a88026e6a5d7',NULL,'conditional-user-configured','siglo21','6f2dd36a-8819-4c75-aa0d-9e2dad8a55fc',0,10,_binary '\0',NULL,NULL),('3373bf8d-b405-45a0-a1a6-691c6f300624',NULL,'reset-password','master','5996a903-160c-45ee-a5f0-74f692bde153',0,30,_binary '\0',NULL,NULL),('35502af2-8b73-4bc2-8750-e3c1e592990d',NULL,NULL,'siglo21','dcfe02ae-446c-4572-b5b5-6a62e47ecfc5',1,20,_binary '','a7194703-c3dc-4cdf-a747-2990876b29aa',NULL),('3782d40b-cdd9-4e4a-9b15-8c67c4a965ac',NULL,'auth-spnego','master','fd36a86f-624d-44f5-9e13-173213b5b063',3,30,_binary '\0',NULL,NULL),('3c21b216-38bd-4d12-b044-97bf72dbae30',NULL,'auth-otp-form','siglo21','a7194703-c3dc-4cdf-a747-2990876b29aa',0,20,_binary '\0',NULL,NULL),('3df39380-58d2-4b47-88a9-b3bd2b28d335',NULL,'reset-otp','master','cf45f656-3a09-45ec-b065-45211a18c2da',0,20,_binary '\0',NULL,NULL),('3f0a5e53-992e-4749-b90b-413ca7dd0299',NULL,'auth-cookie','siglo21','afd5c3b4-849a-41b2-9913-8dffde39e198',2,10,_binary '\0',NULL,NULL),('3fa953c2-db75-48ff-bbec-aad42ae4fd43',NULL,'idp-create-user-if-unique','siglo21','236bd458-7e5d-4f7c-8184-83d6d167ebff',2,10,_binary '\0',NULL,'be95487c-c29f-4bc2-9f1f-84a2bac605f9'),('413b10be-17ad-41f0-8cdb-1a46cf57ed88',NULL,'reset-otp','siglo21','6f2dd36a-8819-4c75-aa0d-9e2dad8a55fc',0,20,_binary '\0',NULL,NULL),('41c16568-78b1-4411-a519-c36120c54d49',NULL,'basic-auth-otp','siglo21','bb3b1d7b-93e6-4439-a015-091f63e84bd0',3,20,_binary '\0',NULL,NULL),('42d3e4c4-e6d9-4503-bb0f-716be54cbe58',NULL,'reset-credentials-choose-user','siglo21','5f370d0b-c94d-4c17-81e7-0ba6b78fb457',0,10,_binary '\0',NULL,NULL),('4509dbd3-5034-49d0-8b29-9b9efcd3bc40',NULL,'basic-auth','siglo21','bb3b1d7b-93e6-4439-a015-091f63e84bd0',0,10,_binary '\0',NULL,NULL),('47248cdf-a9dd-488b-93b8-fa407dca2117',NULL,'conditional-user-configured','master','06294cd7-c125-42cd-bb3c-da4a2e9cc0f7',0,10,_binary '\0',NULL,NULL),('4bd2f6c7-4c75-4e7c-b7df-715a50e7e29c',NULL,'auth-otp-form','master','bad80506-0dff-4aa5-9128-9eeb5ebc482b',0,20,_binary '\0',NULL,NULL),('4de37531-3b96-46f5-a452-f5f92d63c558',NULL,'client-jwt','master','bb4d27b7-46a7-413a-8fbe-6244f9745d6a',2,20,_binary '\0',NULL,NULL),('4e657ed1-0126-4faf-a32d-de980e482248',NULL,'registration-recaptcha-action','siglo21','602e6471-0e8c-40d0-a58b-3820a2ebf1a7',3,60,_binary '\0',NULL,NULL),('5349a010-7c8f-4851-b276-3ef2c97dcb98',NULL,'idp-confirm-link','siglo21','6935adf5-52c6-4421-a0e3-780519e4c822',0,10,_binary '\0',NULL,NULL),('547905d1-0d71-4997-8645-ac5ce5cf60aa',NULL,'registration-profile-action','master','3353f507-eaab-40b9-857b-8de787f20080',0,40,_binary '\0',NULL,NULL),('56303a8f-b40c-4fcd-9921-87d65d65ac3c',NULL,'identity-provider-redirector','siglo21','afd5c3b4-849a-41b2-9913-8dffde39e198',2,25,_binary '\0',NULL,NULL),('5aaad852-77b9-4681-a9a1-38ae5ab55221',NULL,'direct-grant-validate-username','master','1e1e22be-93eb-4799-afcf-fb2d4b2ac2a2',0,10,_binary '\0',NULL,NULL),('5dd59bb0-bdf7-4790-9454-39cb05f17c1a',NULL,'basic-auth','master','fd36a86f-624d-44f5-9e13-173213b5b063',0,10,_binary '\0',NULL,NULL),('618caac7-a7a4-4470-87c1-87bef20e9563',NULL,'registration-page-form','master','2146bf5e-2a05-46c1-a614-d129e5d0a6ac',0,10,_binary '','3353f507-eaab-40b9-857b-8de787f20080',NULL),('62855e51-0113-4de9-a4cb-545774260ff3',NULL,'idp-review-profile','siglo21','58058938-f472-4c9d-a8ff-6c0df6683175',0,10,_binary '\0',NULL,'32c7d74b-4d5f-4333-b10e-bc9333c484c5'),('647285c4-fd0c-4a5b-95a0-27e2c7d4ec03',NULL,NULL,'siglo21','236bd458-7e5d-4f7c-8184-83d6d167ebff',2,20,_binary '','6935adf5-52c6-4421-a0e3-780519e4c822',NULL),('6763e983-20bf-4ce4-b972-9e4637923870',NULL,'idp-username-password-form','siglo21','84d750b6-8f03-4556-b8c1-89bb8bb0f3af',0,10,_binary '\0',NULL,NULL),('689ab1fb-3aac-4ac8-b545-4a541459ea4a',NULL,'client-secret-jwt','master','bb4d27b7-46a7-413a-8fbe-6244f9745d6a',2,30,_binary '\0',NULL,NULL),('6e5046f0-d206-4b8c-8e49-3bc51b563798',NULL,'registration-user-creation','master','3353f507-eaab-40b9-857b-8de787f20080',0,20,_binary '\0',NULL,NULL),('6ffc43ca-bd5a-4895-a54a-208aebacaf01',NULL,NULL,'siglo21','84d750b6-8f03-4556-b8c1-89bb8bb0f3af',1,20,_binary '','98d6a001-3574-4897-93d2-6e165d3ece17',NULL),('725bdbf8-c8e4-4209-a2da-6aeb65282ecb',NULL,'conditional-user-configured','siglo21','98d6a001-3574-4897-93d2-6e165d3ece17',0,10,_binary '\0',NULL,NULL),('729e7838-4317-4356-a1bc-25c97d7d34f9',NULL,NULL,'master','4f2b86d3-61da-418f-89fc-317bbaae7a94',1,20,_binary '','3e8cf941-58f8-4f37-9024-f82bcc3c00e7',NULL),('7faea455-8a95-4f70-a2ed-e1dfb56d488c',NULL,'auth-cookie','master','2fd4683b-e9e6-407f-a642-f58f7f74dc37',2,10,_binary '\0',NULL,NULL),('807b6c64-9c39-4637-b6db-b9e77e904e86',NULL,NULL,'master','50177323-6401-41b6-a9eb-373a7bbebad0',2,20,_binary '','4f2b86d3-61da-418f-89fc-317bbaae7a94',NULL),('81996d7e-5595-41dc-b101-7eb616b659bc',NULL,'docker-http-basic-authenticator','siglo21','14b3b150-3247-42cc-80e0-7a61722a1e0b',0,10,_binary '\0',NULL,NULL),('84b25295-c4d0-4194-946b-a045526fdea7',NULL,'direct-grant-validate-password','siglo21','59c28aee-b1ff-4487-b001-a083eeb6b33a',0,20,_binary '\0',NULL,NULL),('878775fa-9523-4343-bd5c-2bdb3805cff3',NULL,'registration-user-creation','siglo21','602e6471-0e8c-40d0-a58b-3820a2ebf1a7',0,20,_binary '\0',NULL,NULL),('89d757ff-17ad-40fd-bab4-9ba66160fec1',NULL,NULL,'siglo21','5f370d0b-c94d-4c17-81e7-0ba6b78fb457',1,40,_binary '','6f2dd36a-8819-4c75-aa0d-9e2dad8a55fc',NULL),('8a48f200-82b3-4984-9558-729b7d1ac58c',NULL,NULL,'master','6ee5e3ac-4427-458b-898f-f1a37bf7c865',1,20,_binary '','bad80506-0dff-4aa5-9128-9eeb5ebc482b',NULL),('8bddd3a0-f429-44a7-b2f7-993add29e759',NULL,'direct-grant-validate-otp','siglo21','7cf1423e-328e-464a-9134-4a1e2e9b5e6a',0,20,_binary '\0',NULL,NULL),('8f461493-7594-4844-80cd-7a8493d3e773',NULL,'reset-credentials-choose-user','master','5996a903-160c-45ee-a5f0-74f692bde153',0,10,_binary '\0',NULL,NULL),('8fe799a1-0122-4882-81d9-67199580c32c',NULL,'auth-otp-form','siglo21','98d6a001-3574-4897-93d2-6e165d3ece17',0,20,_binary '\0',NULL,NULL),('9793318c-e6d8-4a82-ba38-7eb4e8831cd7',NULL,'client-secret-jwt','siglo21','9e710bd0-c1c9-41b6-8859-820a71f06a3a',2,30,_binary '\0',NULL,NULL),('9a3bd2ee-2ea3-41cb-bc51-740375ed5c95',NULL,'auth-username-password-form','siglo21','dcfe02ae-446c-4572-b5b5-6a62e47ecfc5',0,10,_binary '\0',NULL,NULL),('9c13face-3f35-476f-886e-e1f67007c267',NULL,'docker-http-basic-authenticator','master','2b31b185-6e41-40e1-865c-d64247aafdfd',0,10,_binary '\0',NULL,NULL),('9dc44c9d-085c-42cf-90d5-182f3f86f314',NULL,'direct-grant-validate-otp','master','06294cd7-c125-42cd-bb3c-da4a2e9cc0f7',0,20,_binary '\0',NULL,NULL),('b2a7755d-4d8e-440e-a2c5-46dc5fe8573e',NULL,NULL,'master','5996a903-160c-45ee-a5f0-74f692bde153',1,40,_binary '','cf45f656-3a09-45ec-b065-45211a18c2da',NULL),('b3e744df-dacf-4c62-8d42-41356d7987c8',NULL,'conditional-user-configured','siglo21','a7194703-c3dc-4cdf-a747-2990876b29aa',0,10,_binary '\0',NULL,NULL),('b54c119d-77a2-4d90-bded-81bd992ee100',NULL,'reset-credential-email','master','5996a903-160c-45ee-a5f0-74f692bde153',0,20,_binary '\0',NULL,NULL),('b70c494a-0d6b-4911-9af1-b528cf254b83',NULL,'direct-grant-validate-username','siglo21','59c28aee-b1ff-4487-b001-a083eeb6b33a',0,10,_binary '\0',NULL,NULL),('b72eea29-90d7-4c23-88d4-1bf15cfa886c',NULL,'registration-recaptcha-action','master','3353f507-eaab-40b9-857b-8de787f20080',3,60,_binary '\0',NULL,NULL),('b97cdef1-89a5-4fcd-b1a1-a9ed9ac04cac',NULL,NULL,'siglo21','050abaab-7807-4aab-8bcc-bc4d45809fe2',2,20,_binary '','84d750b6-8f03-4556-b8c1-89bb8bb0f3af',NULL),('bb0f876a-c8f9-4406-8ec7-db8bae149650',NULL,'client-secret','siglo21','9e710bd0-c1c9-41b6-8859-820a71f06a3a',2,10,_binary '\0',NULL,NULL),('bc3b23e4-374c-4e70-8418-828b137a7a9d',NULL,'basic-auth-otp','master','fd36a86f-624d-44f5-9e13-173213b5b063',3,20,_binary '\0',NULL,NULL),('bd1b1f2d-7f7d-4ddc-aab6-383916a633a5',NULL,'registration-password-action','siglo21','602e6471-0e8c-40d0-a58b-3820a2ebf1a7',0,50,_binary '\0',NULL,NULL),('bea5b654-c1df-4570-97db-e78924d30e5b',NULL,NULL,'siglo21','6935adf5-52c6-4421-a0e3-780519e4c822',0,20,_binary '','050abaab-7807-4aab-8bcc-bc4d45809fe2',NULL),('c0b48095-0ee0-4347-a095-ac8edb8aa00f',NULL,'http-basic-authenticator','siglo21','dd0b91aa-e023-4359-a431-8326a7064cad',0,10,_binary '\0',NULL,NULL),('c0d6df57-e54d-4e13-84e7-951740904696',NULL,'auth-otp-form','master','3e8cf941-58f8-4f37-9024-f82bcc3c00e7',0,20,_binary '\0',NULL,NULL),('c5189f7b-ed08-4ec5-88bc-027aef746556',NULL,'no-cookie-redirect','master','9ce1021d-a5e3-461c-9444-9be5f2bb68bf',0,10,_binary '\0',NULL,NULL),('cca44286-57fa-483f-8beb-231a01be5f74',NULL,'reset-credential-email','siglo21','5f370d0b-c94d-4c17-81e7-0ba6b78fb457',0,20,_binary '\0',NULL,NULL),('ce137650-da68-4512-94ea-1bbbe0fc160f',NULL,'client-x509','master','bb4d27b7-46a7-413a-8fbe-6244f9745d6a',2,40,_binary '\0',NULL,NULL),('d75c5f1f-2477-4257-8fb3-6a3ff22bc8ee',NULL,'idp-review-profile','master','60eca293-eabc-4eba-9047-b29162bc7fcb',0,10,_binary '\0',NULL,'4674afa1-22e6-4887-a1f2-e829fdbbaea9'),('dbf17306-a587-415c-8d43-5b8e36309e2c',NULL,'idp-create-user-if-unique','master','707bf2c6-23bb-474e-bfba-f904f16d5f99',2,10,_binary '\0',NULL,'2c9caed9-5bf2-48f1-8b24-770e9de4bb6d'),('ddd5729b-32da-44ba-990c-a8b3e329f41c',NULL,'http-basic-authenticator','master','60bf2b1c-905f-4127-8711-c659332290e8',0,10,_binary '\0',NULL,NULL),('df20c23c-70bc-4b4e-9de4-59eb112e118c',NULL,NULL,'master','60eca293-eabc-4eba-9047-b29162bc7fcb',0,20,_binary '','707bf2c6-23bb-474e-bfba-f904f16d5f99',NULL),('e2a96642-af82-46c1-9ce3-a646eef64514',NULL,'idp-email-verification','master','50177323-6401-41b6-a9eb-373a7bbebad0',2,10,_binary '\0',NULL,NULL),('e3bbc82a-2da3-4e44-bb5b-e22a7852eb46',NULL,'auth-spnego','master','2fd4683b-e9e6-407f-a642-f58f7f74dc37',3,20,_binary '\0',NULL,NULL),('e97dc5bf-244c-40f5-bac4-94080a108e41',NULL,'idp-username-password-form','master','4f2b86d3-61da-418f-89fc-317bbaae7a94',0,10,_binary '\0',NULL,NULL),('ea42bc15-98b5-410a-bc7d-80438cf1697b',NULL,'registration-page-form','siglo21','e07b9d2b-6a9c-4149-9a11-7b967e032495',0,10,_binary '','602e6471-0e8c-40d0-a58b-3820a2ebf1a7',NULL),('eefed989-2326-4393-978d-ab4fced72ddd',NULL,'client-x509','siglo21','9e710bd0-c1c9-41b6-8859-820a71f06a3a',2,40,_binary '\0',NULL,NULL),('f2c5acc5-47db-4eeb-91ec-0fa38e97d1e8',NULL,NULL,'master','707bf2c6-23bb-474e-bfba-f904f16d5f99',2,20,_binary '','59b1338f-3dfd-4b35-b28c-7c93226cb60d',NULL),('f86fb031-3737-444e-8896-6ec8f5f38dc0',NULL,'client-secret','master','bb4d27b7-46a7-413a-8fbe-6244f9745d6a',2,10,_binary '\0',NULL,NULL),('f8ee7ee4-e425-4597-aa56-c9681d8dd5e7',NULL,NULL,'siglo21','59c28aee-b1ff-4487-b001-a083eeb6b33a',1,30,_binary '','7cf1423e-328e-464a-9134-4a1e2e9b5e6a',NULL),('fa82306b-0d75-46a4-862a-72f42eaf8445',NULL,'idp-email-verification','siglo21','050abaab-7807-4aab-8bcc-bc4d45809fe2',2,10,_binary '\0',NULL,NULL),('fe189f30-532b-47ef-b887-960c3ff6847b',NULL,NULL,'master','1e1e22be-93eb-4799-afcf-fb2d4b2ac2a2',1,30,_binary '','06294cd7-c125-42cd-bb3c-da4a2e9cc0f7',NULL);
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('050abaab-7807-4aab-8bcc-bc4d45809fe2','Account verification options','Method with which to verity the existing account','siglo21','basic-flow',_binary '\0',_binary ''),('06294cd7-c125-42cd-bb3c-da4a2e9cc0f7','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('14b3b150-3247-42cc-80e0-7a61722a1e0b','docker auth','Used by Docker clients to authenticate against the IDP','siglo21','basic-flow',_binary '',_binary ''),('1e1e22be-93eb-4799-afcf-fb2d4b2ac2a2','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('2146bf5e-2a05-46c1-a614-d129e5d0a6ac','registration','registration flow','master','basic-flow',_binary '',_binary ''),('236bd458-7e5d-4f7c-8184-83d6d167ebff','User creation or linking','Flow for the existing/non-existing user alternatives','siglo21','basic-flow',_binary '\0',_binary ''),('2b31b185-6e41-40e1-865c-d64247aafdfd','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('2fd4683b-e9e6-407f-a642-f58f7f74dc37','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('3353f507-eaab-40b9-857b-8de787f20080','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('3e8cf941-58f8-4f37-9024-f82bcc3c00e7','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('4f2b86d3-61da-418f-89fc-317bbaae7a94','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('50177323-6401-41b6-a9eb-373a7bbebad0','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('58058938-f472-4c9d-a8ff-6c0df6683175','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','siglo21','basic-flow',_binary '',_binary ''),('5996a903-160c-45ee-a5f0-74f692bde153','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('59b1338f-3dfd-4b35-b28c-7c93226cb60d','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('59c28aee-b1ff-4487-b001-a083eeb6b33a','direct grant','OpenID Connect Resource Owner Grant','siglo21','basic-flow',_binary '',_binary ''),('5f370d0b-c94d-4c17-81e7-0ba6b78fb457','reset credentials','Reset credentials for a user if they forgot their password or something','siglo21','basic-flow',_binary '',_binary ''),('602e6471-0e8c-40d0-a58b-3820a2ebf1a7','registration form','registration form','siglo21','form-flow',_binary '\0',_binary ''),('60bf2b1c-905f-4127-8711-c659332290e8','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('60eca293-eabc-4eba-9047-b29162bc7fcb','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('6935adf5-52c6-4421-a0e3-780519e4c822','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','siglo21','basic-flow',_binary '\0',_binary ''),('6ee5e3ac-4427-458b-898f-f1a37bf7c865','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('6f2dd36a-8819-4c75-aa0d-9e2dad8a55fc','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','siglo21','basic-flow',_binary '\0',_binary ''),('707bf2c6-23bb-474e-bfba-f904f16d5f99','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('7cf1423e-328e-464a-9134-4a1e2e9b5e6a','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('84d750b6-8f03-4556-b8c1-89bb8bb0f3af','Verify Existing Account by Re-authentication','Reauthentication of existing account','siglo21','basic-flow',_binary '\0',_binary ''),('92272466-ede4-40f1-8e30-7503a8c91756','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','siglo21','basic-flow',_binary '',_binary ''),('98d6a001-3574-4897-93d2-6e165d3ece17','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('9ce1021d-a5e3-461c-9444-9be5f2bb68bf','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('9e710bd0-c1c9-41b6-8859-820a71f06a3a','clients','Base authentication for clients','siglo21','client-flow',_binary '',_binary ''),('a7194703-c3dc-4cdf-a747-2990876b29aa','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','siglo21','basic-flow',_binary '\0',_binary ''),('afd5c3b4-849a-41b2-9913-8dffde39e198','browser','browser based authentication','siglo21','basic-flow',_binary '',_binary ''),('bad80506-0dff-4aa5-9128-9eeb5ebc482b','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('bb3b1d7b-93e6-4439-a015-091f63e84bd0','Authentication Options','Authentication options.','siglo21','basic-flow',_binary '\0',_binary ''),('bb4d27b7-46a7-413a-8fbe-6244f9745d6a','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('cf45f656-3a09-45ec-b065-45211a18c2da','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('dcfe02ae-446c-4572-b5b5-6a62e47ecfc5','forms','Username, password, otp and other auth forms.','siglo21','basic-flow',_binary '\0',_binary ''),('dd0b91aa-e023-4359-a431-8326a7064cad','saml ecp','SAML ECP Profile Authentication Flow','siglo21','basic-flow',_binary '',_binary ''),('e07b9d2b-6a9c-4149-9a11-7b967e032495','registration','registration flow','siglo21','basic-flow',_binary '',_binary ''),('fd36a86f-624d-44f5-9e13-173213b5b063','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary '');
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('2c9caed9-5bf2-48f1-8b24-770e9de4bb6d','create unique user config','master'),('32c7d74b-4d5f-4333-b10e-bc9333c484c5','review profile config','siglo21'),('4674afa1-22e6-4887-a1f2-e829fdbbaea9','review profile config','master'),('be95487c-c29f-4bc2-9f1f-84a2bac605f9','create unique user config','siglo21');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('2c9caed9-5bf2-48f1-8b24-770e9de4bb6d','false','require.password.update.after.registration'),('32c7d74b-4d5f-4333-b10e-bc9333c484c5','missing','update.profile.on.first.login'),('4674afa1-22e6-4887-a1f2-e829fdbbaea9','missing','update.profile.on.first.login'),('be95487c-c29f-4bc2-9f1f-84a2bac605f9','false','require.password.update.after.registration');
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambios_estado`
--

LOCK TABLES `cambios_estado` WRITE;
/*!40000 ALTER TABLE `cambios_estado` DISABLE KEYS */;
INSERT INTO `cambios_estado` VALUES (1,'2024-01-05 21:04:45.043763','2023-12-04 10:08:50.130152',1,'A-2321-21312312'),(2,'2024-01-04 21:31:40.365544','2023-12-06 16:00:23.683040',1,'HOY'),(3,'2024-01-05 21:04:45.043763','2023-12-08 11:42:25.756484',1,'FAC123'),(4,'2024-01-05 21:04:45.043763','2023-12-08 11:42:32.964051',1,'FAC456'),(5,'2024-01-05 21:04:45.043763','2023-12-08 11:43:12.678711',1,'FAC789'),(6,NULL,'2023-12-08 11:44:17.930616',1,NULL),(7,NULL,'2023-12-08 11:45:35.981018',1,'FAC987'),(8,NULL,'2023-12-08 11:46:10.827096',1,NULL),(9,NULL,'2023-12-08 11:46:29.524061',1,NULL),(10,NULL,'2023-12-08 11:46:32.093274',1,NULL),(11,NULL,'2023-12-08 11:46:34.923147',1,NULL),(12,NULL,'2023-12-08 11:47:04.557998',1,NULL),(13,NULL,'2023-12-08 11:47:14.041132',1,NULL),(14,NULL,'2023-12-08 11:47:21.005400',1,'FAC321'),(15,NULL,'2023-12-08 11:50:20.618614',1,'FAC111'),(16,NULL,'2023-12-08 11:50:26.291225',1,'FAC222'),(17,NULL,'2023-12-08 11:50:41.721242',1,'FAC333'),(18,'2024-01-04 21:31:38.615017','2023-12-08 11:51:14.284150',1,'FAC444'),(19,'2024-01-04 21:31:38.980584','2023-12-08 11:51:22.326333',1,'FAC555'),(20,'2024-01-04 21:31:39.497580','2023-12-08 11:51:31.907768',1,'FAC666'),(21,'2024-01-04 21:31:39.934115','2023-12-08 11:51:40.406291',1,'FAC777'),(22,'2024-01-04 21:31:28.397226','2024-01-04 21:04:18.346555',1,'A-1234-12345678'),(23,'2024-01-04 21:31:35.153786','2024-01-04 21:07:16.090903',1,'A-1235-12345678'),(24,'2024-01-04 21:31:36.262279','2024-01-04 21:07:25.553566',1,'A-1236-12345678'),(25,'2024-01-04 21:31:37.265692','2024-01-04 21:07:32.155360',1,'A-1237-12345678'),(26,'2024-01-04 21:31:37.929467','2024-01-04 21:09:20.350964',1,'A-2237-12345678'),(27,'2024-01-05 21:33:29.576505','2024-01-04 21:31:28.397226',2,'A-1234-12345678'),(28,'2024-01-05 21:33:29.576505','2024-01-04 21:31:35.153786',2,'A-1235-12345678'),(29,'2024-01-05 21:33:29.576505','2024-01-04 21:31:36.262279',2,'A-1236-12345678'),(30,'2024-01-05 21:33:29.576505','2024-01-04 21:31:37.265692',2,'A-1237-12345678'),(31,'2024-01-05 21:33:29.576505','2024-01-04 21:31:37.929467',2,'A-2237-12345678'),(32,'2024-01-05 21:33:29.576505','2024-01-04 21:31:38.615017',2,'FAC444'),(33,'2024-01-05 21:33:29.576505','2024-01-04 21:31:38.980584',2,'FAC555'),(34,'2024-01-05 21:33:29.576505','2024-01-04 21:31:39.497580',2,'FAC666'),(35,'2024-01-05 21:33:29.576505','2024-01-04 21:31:39.934115',2,'FAC777'),(36,'2024-01-05 21:33:29.576505','2024-01-04 21:31:40.366554',2,'HOY'),(37,'2024-01-05 21:04:45.043763','2024-01-05 13:47:42.422831',1,'A-2133-23214421'),(38,'2024-01-05 21:04:45.043763','2024-01-05 14:07:12.579261',1,'A-1233-21322313'),(51,'2024-01-05 21:09:27.638629','2024-01-05 21:04:45.043763',2,'A-1233-21322313'),(52,'2024-01-05 21:09:27.638629','2024-01-05 21:04:45.043763',2,'A-2133-23214421'),(53,'2024-01-05 21:09:27.638629','2024-01-05 21:04:45.043763',2,'A-2321-21312312'),(54,'2024-01-05 21:09:27.638629','2024-01-05 21:04:45.043763',2,'FAC123'),(55,'2024-01-05 21:09:27.638629','2024-01-05 21:04:45.043763',2,'FAC456'),(56,'2024-01-05 21:09:27.638629','2024-01-05 21:04:45.043763',2,'FAC789'),(57,NULL,'2024-01-05 21:09:27.638629',4,'A-1233-21322313'),(58,NULL,'2024-01-05 21:09:27.638629',4,'A-2133-23214421'),(59,NULL,'2024-01-05 21:09:27.638629',4,'A-2321-21312312'),(60,NULL,'2024-01-05 21:09:27.638629',4,'FAC123'),(61,NULL,'2024-01-05 21:09:27.638629',4,'FAC456'),(62,NULL,'2024-01-05 21:09:27.638629',4,'FAC789'),(63,'2024-01-09 20:06:01.487510','2024-01-05 21:26:29.385882',1,'A-1234-54432324'),(64,'2024-01-09 20:06:01.488052','2024-01-05 21:27:40.108219',1,NULL),(65,'2024-01-09 20:06:01.488052','2024-01-05 21:28:47.145189',1,'A-4321-21321333'),(66,'2024-01-07 16:36:28.619165','2024-01-05 21:29:24.369391',1,'A-1231-23123123'),(67,NULL,'2024-01-05 21:33:29.576505',4,'A-1234-12345678'),(68,NULL,'2024-01-05 21:33:29.576505',4,'A-1235-12345678'),(69,NULL,'2024-01-05 21:33:29.576505',4,'A-1236-12345678'),(70,NULL,'2024-01-05 21:33:29.576505',4,'A-1237-12345678'),(71,NULL,'2024-01-05 21:33:29.576505',4,'A-2237-12345678'),(72,NULL,'2024-01-05 21:33:29.576505',4,'FAC444'),(73,NULL,'2024-01-05 21:33:29.576505',4,'FAC555'),(74,NULL,'2024-01-05 21:33:29.576505',4,'FAC666'),(75,NULL,'2024-01-05 21:33:29.576505',4,'FAC777'),(76,NULL,'2024-01-05 21:33:29.576505',4,'HOY'),(77,'2024-01-07 16:36:28.633885','2024-01-07 16:36:28.619165',2,'A-1231-23123123'),(78,NULL,'2024-01-07 16:36:28.633885',4,'A-1231-23123123'),(79,NULL,'2024-01-09 20:06:01.487510',2,'A-1234-54432324'),(80,NULL,'2024-01-09 20:06:01.488052',2,NULL),(81,NULL,'2024-01-09 20:06:01.488052',2,'A-4321-21321333'),(82,'2024-01-16 09:17:49.907742','2024-01-09 20:07:35.928672',1,'A-1234-43242345'),(83,NULL,'2024-01-16 09:17:49.907742',5,'A-1234-43242345');
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
INSERT INTO `camiones` VALUES ('LOG123','string','string','string'),('LOG222','COLOR','DESCRIPCION','MODELO'),('LOG456','Rojo','Camión de gran capacidad para transporte de mercancías pesadas.','Camión'),('LOG789','Azul','Furgoneta versátil para entregas rápidas y eficientes.','Furgoneta'),('LOGABC','Gris','Remolque adicional para aumentar la capacidad de carga.','Remolque'),('LOGXYZ','Verde','Minivan para transporte de paquetes pequeños y medianos.','Minivan');
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
INSERT INTO `CLIENT` VALUES ('07a0fe8d-fcfa-40d3-9b3c-78757106c27c',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2fc1d5fa-b23c-4c4e-b2aa-89f64b665fbe',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/siglo21/account/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/siglo21/console/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '',_binary '','siglo21-client-api-rest',0,_binary '',NULL,'http://localhost:3000',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/siglo21/account/',_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('54cff855-78e3-4b1a-8fa0-81596b6804d4',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('77fa5bd2-177e-4117-8334-fcfd5b25705c',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('c5b43390-a534-4260-91e2-52c6c8446492',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','siglo21','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '',_binary '\0','siglo21-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','siglo21 Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
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
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','S256','pkce.code.challenge.method'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','S256','pkce.code.challenge.method'),('42ce5f39-f315-496d-881f-7de13ac3ae08','S256','pkce.code.challenge.method'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','1800','access.token.lifespan'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','backchannel.logout.revoke.offline.tokens'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','true','backchannel.logout.session.required'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','client_credentials.use_refresh_token'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','display.on.consent.screen'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','exclude.session.state.from.auth.response'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','id.token.as.detached.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','oauth2.device.authorization.grant.enabled'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','oidc.ciba.grant.enabled'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','require.pushed.authorization.requests'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml_force_name_id_format'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.artifact.binding'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.assertion.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.authnstatement'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.client.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.encrypt'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.force.post.binding'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.multivalued.roles'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.onetimeuse.condition'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.server.signature'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','saml.server.signature.keyinfo.ext'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','false','tls.client.certificate.bound.access.tokens'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','true','use.refresh.tokens'),('54cff855-78e3-4b1a-8fa0-81596b6804d4','S256','pkce.code.challenge.method');
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
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `FK_NUILTS7KLWQW2H8M2B5JOYTKY` (`CLIENT_ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_IDENTITY_PROV_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_IDENTITY_PROV_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_IDENTITY_PROV_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `RETRIEVE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  UNIQUE KEY `UK_7CAELWNIBJI49AVXSRTUF6XJ12` (`IDENTITY_PROVIDER_ID`,`CLIENT_ID`),
  KEY `FK_56ELWNIBJI49AVXSRTUF6XJ23` (`CLIENT_ID`),
  CONSTRAINT `FK_56ELWNIBJI49AVXSRTUF6XJ23` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_7CELWNIBJI49AVXSRTUF6XJ12` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_IDENTITY_PROV_MAPPING`
--

LOCK TABLES `CLIENT_IDENTITY_PROV_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_IDENTITY_PROV_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_IDENTITY_PROV_MAPPING` ENABLE KEYS */;
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
INSERT INTO `CLIENT_SCOPE` VALUES ('19b6b82c-b8f7-4634-be79-efede78aab4e','offline_access','siglo21','OpenID Connect built-in scope: offline_access','openid-connect'),('1bb67913-9995-497e-89af-945150f89f52','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('279791da-86fa-4f67-84c7-b8f250adbcf1','profile','siglo21','OpenID Connect built-in scope: profile','openid-connect'),('28963099-19d3-4521-a02f-976d9671e893','phone','siglo21','OpenID Connect built-in scope: phone','openid-connect'),('2adf4563-1add-4971-8bd6-56bad82c7c29','email','master','OpenID Connect built-in scope: email','openid-connect'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','email','siglo21','OpenID Connect built-in scope: email','openid-connect'),('5ab15083-b474-411a-8c86-92cf6857dd42','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('67593354-2d39-40af-aafc-d56bb75171db','role_list','master','SAML role list','saml'),('7063f6d9-553e-47e3-a709-6dbf3cc3db10','address','master','OpenID Connect built-in scope: address','openid-connect'),('80a98201-a009-4f95-a8d9-67b46623f54d','microprofile-jwt','siglo21','Microprofile - JWT built-in scope','openid-connect'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','roles','siglo21','OpenID Connect scope for add user roles to the access token','openid-connect'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','role_list','siglo21','SAML role list','saml'),('b39fe518-d02f-4eac-942b-eeddf878c80f','web-origins','siglo21','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('d44015ab-b4cf-4b2e-944b-340f51e1ea96','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('d4fe8411-0238-43d9-8e9a-e59fcc652557','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('da127315-5241-4a8f-a46a-6bea0de8925e','address','siglo21','OpenID Connect built-in scope: address','openid-connect'),('e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('e4e97c99-0888-4df6-adbf-13b51f3be080','phone','master','OpenID Connect built-in scope: phone','openid-connect');
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
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('19b6b82c-b8f7-4634-be79-efede78aab4e','${offlineAccessScopeConsentText}','consent.screen.text'),('19b6b82c-b8f7-4634-be79-efede78aab4e','true','display.on.consent.screen'),('1bb67913-9995-497e-89af-945150f89f52','${profileScopeConsentText}','consent.screen.text'),('1bb67913-9995-497e-89af-945150f89f52','true','display.on.consent.screen'),('1bb67913-9995-497e-89af-945150f89f52','true','include.in.token.scope'),('279791da-86fa-4f67-84c7-b8f250adbcf1','${profileScopeConsentText}','consent.screen.text'),('279791da-86fa-4f67-84c7-b8f250adbcf1','true','display.on.consent.screen'),('279791da-86fa-4f67-84c7-b8f250adbcf1','true','include.in.token.scope'),('28963099-19d3-4521-a02f-976d9671e893','${phoneScopeConsentText}','consent.screen.text'),('28963099-19d3-4521-a02f-976d9671e893','true','display.on.consent.screen'),('28963099-19d3-4521-a02f-976d9671e893','true','include.in.token.scope'),('2adf4563-1add-4971-8bd6-56bad82c7c29','${emailScopeConsentText}','consent.screen.text'),('2adf4563-1add-4971-8bd6-56bad82c7c29','true','display.on.consent.screen'),('2adf4563-1add-4971-8bd6-56bad82c7c29','true','include.in.token.scope'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','${emailScopeConsentText}','consent.screen.text'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','true','display.on.consent.screen'),('313cd6d5-afa3-4d09-bec6-8e059c9718c3','true','include.in.token.scope'),('5ab15083-b474-411a-8c86-92cf6857dd42','false','display.on.consent.screen'),('5ab15083-b474-411a-8c86-92cf6857dd42','true','include.in.token.scope'),('67593354-2d39-40af-aafc-d56bb75171db','${samlRoleListScopeConsentText}','consent.screen.text'),('67593354-2d39-40af-aafc-d56bb75171db','true','display.on.consent.screen'),('7063f6d9-553e-47e3-a709-6dbf3cc3db10','${addressScopeConsentText}','consent.screen.text'),('7063f6d9-553e-47e3-a709-6dbf3cc3db10','true','display.on.consent.screen'),('7063f6d9-553e-47e3-a709-6dbf3cc3db10','true','include.in.token.scope'),('80a98201-a009-4f95-a8d9-67b46623f54d','false','display.on.consent.screen'),('80a98201-a009-4f95-a8d9-67b46623f54d','true','include.in.token.scope'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','${rolesScopeConsentText}','consent.screen.text'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','true','display.on.consent.screen'),('ab34af5f-b1a2-42b9-90dc-89a50790890e','false','include.in.token.scope'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','${samlRoleListScopeConsentText}','consent.screen.text'),('b229e7fc-3666-4f8f-b02d-0f24dc04e851','true','display.on.consent.screen'),('b39fe518-d02f-4eac-942b-eeddf878c80f','','consent.screen.text'),('b39fe518-d02f-4eac-942b-eeddf878c80f','false','display.on.consent.screen'),('b39fe518-d02f-4eac-942b-eeddf878c80f','false','include.in.token.scope'),('d44015ab-b4cf-4b2e-944b-340f51e1ea96','${offlineAccessScopeConsentText}','consent.screen.text'),('d44015ab-b4cf-4b2e-944b-340f51e1ea96','true','display.on.consent.screen'),('d4fe8411-0238-43d9-8e9a-e59fcc652557','${rolesScopeConsentText}','consent.screen.text'),('d4fe8411-0238-43d9-8e9a-e59fcc652557','true','display.on.consent.screen'),('d4fe8411-0238-43d9-8e9a-e59fcc652557','false','include.in.token.scope'),('da127315-5241-4a8f-a46a-6bea0de8925e','${addressScopeConsentText}','consent.screen.text'),('da127315-5241-4a8f-a46a-6bea0de8925e','true','display.on.consent.screen'),('da127315-5241-4a8f-a46a-6bea0de8925e','true','include.in.token.scope'),('e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034','','consent.screen.text'),('e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034','false','display.on.consent.screen'),('e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034','false','include.in.token.scope'),('e4e97c99-0888-4df6-adbf-13b51f3be080','${phoneScopeConsentText}','consent.screen.text'),('e4e97c99-0888-4df6-adbf-13b51f3be080','true','display.on.consent.screen'),('e4e97c99-0888-4df6-adbf-13b51f3be080','true','include.in.token.scope');
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
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','1bb67913-9995-497e-89af-945150f89f52',_binary ''),('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','2adf4563-1add-4971-8bd6-56bad82c7c29',_binary ''),('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','5ab15083-b474-411a-8c86-92cf6857dd42',_binary '\0'),('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','7063f6d9-553e-47e3-a709-6dbf3cc3db10',_binary '\0'),('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','d44015ab-b4cf-4b2e-944b-340f51e1ea96',_binary '\0'),('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','d4fe8411-0238-43d9-8e9a-e59fcc652557',_binary ''),('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034',_binary ''),('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','e4e97c99-0888-4df6-adbf-13b51f3be080',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('0ca2e86b-131e-454d-95a7-c124ad72b7cb','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('2fc1d5fa-b23c-4c4e-b2aa-89f64b665fbe','1bb67913-9995-497e-89af-945150f89f52',_binary ''),('2fc1d5fa-b23c-4c4e-b2aa-89f64b665fbe','2adf4563-1add-4971-8bd6-56bad82c7c29',_binary ''),('2fc1d5fa-b23c-4c4e-b2aa-89f64b665fbe','5ab15083-b474-411a-8c86-92cf6857dd42',_binary '\0'),('2fc1d5fa-b23c-4c4e-b2aa-89f64b665fbe','7063f6d9-553e-47e3-a709-6dbf3cc3db10',_binary '\0'),('2fc1d5fa-b23c-4c4e-b2aa-89f64b665fbe','d44015ab-b4cf-4b2e-944b-340f51e1ea96',_binary '\0'),('2fc1d5fa-b23c-4c4e-b2aa-89f64b665fbe','d4fe8411-0238-43d9-8e9a-e59fcc652557',_binary ''),('2fc1d5fa-b23c-4c4e-b2aa-89f64b665fbe','e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034',_binary ''),('2fc1d5fa-b23c-4c4e-b2aa-89f64b665fbe','e4e97c99-0888-4df6-adbf-13b51f3be080',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('3e7a542c-ed96-424e-b47e-d95da1a3cb1c','1bb67913-9995-497e-89af-945150f89f52',_binary ''),('3e7a542c-ed96-424e-b47e-d95da1a3cb1c','2adf4563-1add-4971-8bd6-56bad82c7c29',_binary ''),('3e7a542c-ed96-424e-b47e-d95da1a3cb1c','5ab15083-b474-411a-8c86-92cf6857dd42',_binary '\0'),('3e7a542c-ed96-424e-b47e-d95da1a3cb1c','7063f6d9-553e-47e3-a709-6dbf3cc3db10',_binary '\0'),('3e7a542c-ed96-424e-b47e-d95da1a3cb1c','d44015ab-b4cf-4b2e-944b-340f51e1ea96',_binary '\0'),('3e7a542c-ed96-424e-b47e-d95da1a3cb1c','d4fe8411-0238-43d9-8e9a-e59fcc652557',_binary ''),('3e7a542c-ed96-424e-b47e-d95da1a3cb1c','e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034',_binary ''),('3e7a542c-ed96-424e-b47e-d95da1a3cb1c','e4e97c99-0888-4df6-adbf-13b51f3be080',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('42ce5f39-f315-496d-881f-7de13ac3ae08','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('42ce5f39-f315-496d-881f-7de13ac3ae08','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('4fa2d49e-051c-428b-968b-8a7110abb0ba','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('54b4493f-4dc6-46ec-a697-a77e8977899c','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('54b4493f-4dc6-46ec-a697-a77e8977899c','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('54cff855-78e3-4b1a-8fa0-81596b6804d4','1bb67913-9995-497e-89af-945150f89f52',_binary ''),('54cff855-78e3-4b1a-8fa0-81596b6804d4','2adf4563-1add-4971-8bd6-56bad82c7c29',_binary ''),('54cff855-78e3-4b1a-8fa0-81596b6804d4','5ab15083-b474-411a-8c86-92cf6857dd42',_binary '\0'),('54cff855-78e3-4b1a-8fa0-81596b6804d4','7063f6d9-553e-47e3-a709-6dbf3cc3db10',_binary '\0'),('54cff855-78e3-4b1a-8fa0-81596b6804d4','d44015ab-b4cf-4b2e-944b-340f51e1ea96',_binary '\0'),('54cff855-78e3-4b1a-8fa0-81596b6804d4','d4fe8411-0238-43d9-8e9a-e59fcc652557',_binary ''),('54cff855-78e3-4b1a-8fa0-81596b6804d4','e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034',_binary ''),('54cff855-78e3-4b1a-8fa0-81596b6804d4','e4e97c99-0888-4df6-adbf-13b51f3be080',_binary '\0'),('77fa5bd2-177e-4117-8334-fcfd5b25705c','1bb67913-9995-497e-89af-945150f89f52',_binary ''),('77fa5bd2-177e-4117-8334-fcfd5b25705c','2adf4563-1add-4971-8bd6-56bad82c7c29',_binary ''),('77fa5bd2-177e-4117-8334-fcfd5b25705c','5ab15083-b474-411a-8c86-92cf6857dd42',_binary '\0'),('77fa5bd2-177e-4117-8334-fcfd5b25705c','7063f6d9-553e-47e3-a709-6dbf3cc3db10',_binary '\0'),('77fa5bd2-177e-4117-8334-fcfd5b25705c','d44015ab-b4cf-4b2e-944b-340f51e1ea96',_binary '\0'),('77fa5bd2-177e-4117-8334-fcfd5b25705c','d4fe8411-0238-43d9-8e9a-e59fcc652557',_binary ''),('77fa5bd2-177e-4117-8334-fcfd5b25705c','e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034',_binary ''),('77fa5bd2-177e-4117-8334-fcfd5b25705c','e4e97c99-0888-4df6-adbf-13b51f3be080',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('b6aafbec-9c6e-4ee7-a204-39e6f2484c85','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0'),('c5b43390-a534-4260-91e2-52c6c8446492','1bb67913-9995-497e-89af-945150f89f52',_binary ''),('c5b43390-a534-4260-91e2-52c6c8446492','2adf4563-1add-4971-8bd6-56bad82c7c29',_binary ''),('c5b43390-a534-4260-91e2-52c6c8446492','5ab15083-b474-411a-8c86-92cf6857dd42',_binary '\0'),('c5b43390-a534-4260-91e2-52c6c8446492','7063f6d9-553e-47e3-a709-6dbf3cc3db10',_binary '\0'),('c5b43390-a534-4260-91e2-52c6c8446492','d44015ab-b4cf-4b2e-944b-340f51e1ea96',_binary '\0'),('c5b43390-a534-4260-91e2-52c6c8446492','d4fe8411-0238-43d9-8e9a-e59fcc652557',_binary ''),('c5b43390-a534-4260-91e2-52c6c8446492','e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034',_binary ''),('c5b43390-a534-4260-91e2-52c6c8446492','e4e97c99-0888-4df6-adbf-13b51f3be080',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('c6b540d9-5fd3-40ea-a2a9-0050ddb65206','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0');
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
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('19b6b82c-b8f7-4634-be79-efede78aab4e','8748520e-df8c-448c-b03a-f7e53b6bf973'),('d44015ab-b4cf-4b2e-944b-340f51e1ea96','156f4f68-944c-4c82-8f66-243f865a2738');
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
-- Table structure for table `CLIENT_TEMPLATE`
--

DROP TABLE IF EXISTS `CLIENT_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_TEMPLATE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_TEMPLATE` (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_REALM_CLI_TMPLT` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_TEMPLATE`
--

LOCK TABLES `CLIENT_TEMPLATE` WRITE;
/*!40000 ALTER TABLE `CLIENT_TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_TEMPLATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_TEMPLATE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_TEMPLATE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_TEMPLATE_ATTRIBUTES` (
  `TEMPLATE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_TEMPLATE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_TEMPLATE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_TEMPLATE_ATTRIBUTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_TEMPLATE_ATTRIBUTES` ENABLE KEYS */;
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
  KEY `FK158uydvsidi86jgv1skdhcms0` (`id_tipo_documento`),
  CONSTRAINT `FK158uydvsidi86jgv1skdhcms0` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipos_documentos` (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'cueva','dire 2112','string@gmail.com','jorge','31245332','+54 2132321','+11 213213213',1),(2,'cuenca','dire 2232','string@gmail.com','alberto','20-32133123-3','+54 12355444','',2),(3,'Perez','Calle Principal 456','juan.perez@example.com','Juan','DOC123','123456789','987654321',3),(4,'Gomez','Avenida Central 789','maria.gomez@example.com','Maria','DOC456','987654321','123456789',3),(6,'Lopez','Plaza Principal 012','carlos.lopez@example.com','Carlos','DOC789','555555555','444444444',3),(7,'Martinez','Calle A 567','ana.martinez@example.com','Ana','DOC012','777777777','888888888',3),(8,'Rodriguez','Avenida X 890','luis.rodriguez@example.com','Luis','DOC345','333333333','222222222',3),(9,'Herrera','string','alejo.herrera@example.com','Alejo','42142422','+54 9 299 516-4700',NULL,3),(10,'Fuentes','string','matias.fuentes@example.com','Matias','42122422','+54 9 299 455-7764',NULL,3),(11,'zalaya','string','nino.zalaya@example.com','nino','42132422','+54 9 351 370-2609',NULL,3),(12,'noMeAcuerdo','string','lauti.noMeAcuerdo@example.com','lauti','42232522','+54 9 383 461-6765',NULL,3),(13,'luna','string','facundo.luna@example.com','facundo','41232522','+54 9 351 759-3479',NULL,3),(14,'Luna','unaEnCordoba','facu@gmail.com','Facundo','41125222','+54 9 351 759-3479','string',1);
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
INSERT INTO `COMPONENT` VALUES ('0098e192-5eea-4102-bbf0-f69798acea5d','Trusted Hosts','siglo21','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('08f1867b-4124-42d3-8c01-204f25ab7be2','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('0bfdf09e-d23d-4d49-9814-08741ba051a8','rsa-generated','siglo21','rsa-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('20217c77-2196-4ae6-9d79-e799d807904c','hmac-generated','siglo21','hmac-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('2586234e-52f5-4c37-a2d4-433c59a2acb5','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('2ae478f7-f417-4af7-9b21-351028a12484','Full Scope Disabled','siglo21','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('2d61ef21-608c-4499-96c7-fd147e65b6e4','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('2f76e63c-eabd-41b4-8855-e3841fb04184','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('39675bb9-e14e-4ae6-9444-8cf725a3416e','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5296d97c-836c-4518-94c3-30e4aa734fb3','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('52c82a70-e1e9-49fb-a57a-19514d10598c','Allowed Client Scopes','siglo21','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('565df5f1-1a66-46d6-aabf-aefe7aabd36b','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('7243267f-5c72-48a6-b9ef-0eb8d67b3201','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('765cd604-3dd6-49b4-af5e-7363f1d7883e','Allowed Client Scopes','siglo21','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','authenticated'),('7cf45a20-5ba2-47ae-85a1-b6e4dd962252','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('80275b15-09eb-4958-9108-7bcf5f538f38','Allowed Protocol Mapper Types','siglo21','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','authenticated'),('811288b9-8e90-487b-969b-82d36b785c27','rsa-enc-generated','siglo21','rsa-enc-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('a117c56b-09b7-443d-b853-9becd0690bee','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('b75485a4-f673-4081-9238-4b5e7f5eb222','Max Clients Limit','siglo21','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('bfa8d370-01ca-4bda-9333-ac7649508be0','Allowed Protocol Mapper Types','siglo21','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous'),('c4c425ae-1ba1-4aeb-9fd0-06769828185a','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('c7604a3c-d217-410a-841b-2d3cfe05b6b9','aes-generated','siglo21','aes-generated','org.keycloak.keys.KeyProvider','siglo21',NULL),('fbed651a-78dd-4eb2-968b-45dc4ede7fd5','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('fe8e79e6-abbf-471b-8c5d-5d5fafd29144','Consent Required','siglo21','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','siglo21','anonymous');
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
INSERT INTO `COMPONENT_CONFIG` VALUES ('01963901-a311-406d-9b3c-83df86807e28','811288b9-8e90-487b-969b-82d36b785c27','priority','100'),('053ffd02-bfe9-4b17-bd00-e8bf0018f409','5296d97c-836c-4518-94c3-30e4aa734fb3','kid','a001b027-9b30-4a42-b75d-38b21557044e'),('0758316e-5249-4415-b33a-540c9f7c4baf','c4c425ae-1ba1-4aeb-9fd0-06769828185a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('0a7af02a-927b-4d02-940e-b570044740fd','c4c425ae-1ba1-4aeb-9fd0-06769828185a','allowed-protocol-mapper-types','oidc-address-mapper'),('0e67dd03-ecfe-472d-9f15-b21068593624','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('106192a1-d9ff-4b20-b407-f602291a19b2','811288b9-8e90-487b-969b-82d36b785c27','privateKey','MIIEowIBAAKCAQEAxS0qYbQFmGy63PWnlvZLufGyM+lIktGVvn1kRw32Yp+2dK4Rug69JnBFuAwQhR5pNaMEO7iFYi1iPUCOSP2oHAFHextc06o+DkihTW+xe50h53ukkv84zxufWJxlOvAhcCXoxCModlujhi2IELMfaDNloJHPeQlanAJzQ7ffH3sX1VAPUob3gGXW19fuJGc8xCmzd9txaYSv66X4ntwIyDdVjI4EbrxPpgAN94AbEgJWw9c5NOZhbF5S9/cSUy1lZyIg0KFWG+/9BaXniPSF7k13NAssvFqmdkxbbCSivmea1W+T+9ZL7OEc61yHVayKzU4KiljHlAODXn09Gi5ZjQIDAQABAoIBAQCFMehyTbiF6dUlFDDcso4fEt1NYeYrf7bHEk9eDFmG79rB4SCKbhBqWedO15+FPTDXEcL3UMORuZSmSeiT9/3KxTZzO92uAk+fOIL2G2BqX5AanhRjVFMc3Mz8f9GGSdZcus8NR666nVbOeg1zMn0h165sFHNxkNcLkkAo25m22jGJ0ukWu9QD1QjwLyR01zRy89YBZ2sSuezzkFVUGM4igcQ/bZlc/uzBbQj2Q3hu/qz77WZDkzDwyPyYVXPLvn+48f4QL5Ow0E2kxpPp/hKOC8hqcLYDEH+jZ1XvEkIWBrAFNTuaYJiJNU+0pPspT69ZhKITz1OSq18tOPMqcLglAoGBAOEaXY9MgfIqqvjGUS+XggFofzh3D3/93fRdXJFA7Eg9Gg7UAY9dldsCaX9ZPLR6t2r4Maj253L1i/FyveL7ChU+5LGwhULhXXKlPZ/45/JkzoQ1H3LACEc8fPdE7ZaZgbzSUgkmke8ogQAQXahjIUWGSxz89/dorUidAoVLShk/AoGBAOA9hVNj0yu4tbjojm/uQirn38pK0pcaDbLp8FLvRN1H7WLu0yCTEMLIV+OhvHF0KDtI8mseRSD+CrB6wDl2b9e6FW+fJ5yvFdwnN2ssmcKiqlszvmrgKdrxw+kvPvOIKarlF0H8jvU+MR5ItEnZGgPmBUK6Fi5fg2RqbYmLni4zAoGAXGNH1xKdmtjsRyKOG6xhTVaoMHKdR/jX6f2PioZM8/EwCrn00fSlFrhMuFnV0nUzZpHrP9/maoZhI33mdYx3PPUNQ+ihKSv6AJ3VRx0PhareH+D1wVETlLk8yPffU5o5Z1gjF2JfLvs+xtnwtrXI6BIQLhudYkvyIwVeDXszNF0CgYA0fZIxFAQBjwpSz3VQNDie7IpRQzSKlFmykNplv4aiOc0SxI79aA+bWORh76E5+ZPVVN0SQBK0h2MfLozCprvFhtSvvVS7c6ytTSzG1Ljle8he8vzW7cQ+cSuH8TxOK4h9bYUFOEaKl9VNnn09cCmL0hNXLFI25rrODa+4a8tKSwKBgEMr6XnCMOI0b+3tiUo8Tm181ZcgwAAY/3cKrvTJlGTaJsyd4XFbZS7APJT3MzN2xLcpPcCrnon5Z//8QhkLC9nh82DhoDKzwGjnNYWw5q5wYfGeYSvK021dpAUvx0WC+HHDvPHAdQif2KyLOwNb0M9I7CEzHeuURfyNtgCbQWb8'),('113198da-8a22-4e69-b06a-926757f9596b','2f76e63c-eabd-41b4-8855-e3841fb04184','priority','100'),('14f53f8d-95dc-479a-b7af-0bd1314c7e9b','565df5f1-1a66-46d6-aabf-aefe7aabd36b','allow-default-scopes','true'),('1684e43b-0e25-4c88-9bf6-5897cd7fdfd1','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-user-property-mapper'),('1c295532-246a-40bc-adff-e4382fc434a8','a117c56b-09b7-443d-b853-9becd0690bee','host-sending-registration-request-must-match','true'),('2029e5d9-6caf-476b-89e3-b633f5c800aa','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2112d645-6efe-435e-b5b5-c6c3474367c4','2586234e-52f5-4c37-a2d4-433c59a2acb5','kid','9edd5ad8-0ec4-4a58-af43-990dba0d7cab'),('23413803-1c3e-4123-bc8d-84eba525b778','2f76e63c-eabd-41b4-8855-e3841fb04184','privateKey','MIIEogIBAAKCAQEAgdEDg3+XWT/eR/E0p6vCE6AZQBYwXGHSiFLbTsyrjMczldtO1BLYm0kcyHWjCzowwyISWkIvYHu9ehi5yH22E72RKufREsHP0Vice9FzvBQlV9t3+Mg3stZO1IpD7W+kccEObm1dTPu4A4lOQHyw1yEN4Ik9dJqr5X0HaTjQNiKlkkbFHzLZ9Zijj4KiPT6DIsG0HadC42fxS/ocbaAIRYlqHME4eX6XtlOO0gpO9wU8cymAKj0Y2jOQF9VIDgcFKH9+xrRb1AH6h1UKOIaSxTSTRjvXi4we9H3lZxik+KKwCw8fyL2Eu9iT2464RwTpg9lCedtO1wnzUnO3WjIWEwIDAQABAoIBACdg59fz1E1Wem8IVBiomW6qmf4+vNzJL7v6plv46fECXDuRExBxxxMT0o9cX+D//dqzcy299fEmmAt5hKG0wI6samTBfUJbWFcAsjc9CgZ7dfh4sqPc2Eh/idofNwvHWfLHxUDqG+tGUEOCWyJksKARfswl1WaRpKMwkhbxDPfei/iYm8XU67Oy/aLb9FC6f2qhcYtWyqK/Ybbyu5HWMTdUosVmXMnwNJd1I7deYiYQMcMPvQ2K2cM3IEyWtEtRV8jta/wf1iZ6ydok7mOu4lEViqF07Q3OACR/1ueTvLKfuKTrij6lt2YddLzZlbLwGMcBodMHIzo3bJjjB9X0LQECgYEAviXskenIePioyslblwMAGhEAeIdOI1oRx1xHp+qApfms4pWxkGlJJ5VOJoc+xFqr+mwPSXEKHdHtjfw525gyG+kzL4gH9m5NuhfJA9RRUb+mxKzd703bH7NwZfFCblMXf4SBi0qCkL98XIZn4esxGdCz1mdMP9smAeYPQ4J41GMCgYEArsY6agjMvcyjY+BMczcrJOiJV9sOkGyr66HCFNpA01bPHCgQWXTlaW/pI7ohcGMKWSo2VhNxukJC31fIVATZ60dENfxH0jTCJ6XaajVEUgUkyKMOZXnQjAw0ZRhdhjKfIgsVXmFivkOWE1mABKiasQMOpPtDq/dSzkpMVkOILpECgYBbRlMX+7Pateo4ZY3MoIkU+iJSuQh+Gcc8/oP7C6szgPVHUvoISzHtiVMZVYSAttGlBOgVpehoRhQVOwT+70DmevuyDkdcOLig4rgAWZOrfSbtc9mY/LN5tSX4GWZ9FO/Lq2yP03V3TCPDOlV1cfOA49jfy3gjkuvcr3WWP3QG5wKBgB6Jnk1GqleDeQ0LdPAwtIYnZ1AFg37yrftm8R1poSgMI/X8fhbTWP5aQncun4celwFLYeEaVqW/zCVwFh2wF0+HzUBNi1MMStxYm1gxZHWcVngEHZDXfvvpagI8BqNbFvkAzMQH6hPqhT9uRPMLbrP9H8Lt8D4M4dgPnVT5ScMxAoGALhujLU2zUq2+ZU5K05T6Ca3VKfo+swjhv0ftk7drERp9GeG2qoaa3D4LNcgqxlUcEv6odUWw17tyov3jDB396aW5iPlAG+GDsbfNeA2ybK2cr481HCQs/qmFWzwkgcEwLS/nNz/0icsrUQ1AailYrfNWN+6p5Ga3xNmCGOrvdeg='),('249f1b57-6f2d-4c4f-a585-b1e34827be2c','7cf45a20-5ba2-47ae-85a1-b6e4dd962252','allowed-protocol-mapper-types','oidc-full-name-mapper'),('2c9e57f9-50b6-49ea-855b-b95bbf026276','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-address-mapper'),('3741e6be-dbbb-4500-8454-cb2b5a38f84a','0098e192-5eea-4102-bbf0-f69798acea5d','client-uris-must-match','true'),('3a17ab4b-e124-4769-8b3d-3fe74c9a5983','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3b34c7eb-d4bb-4dec-a4c9-5c21db97f248','0bfdf09e-d23d-4d49-9814-08741ba051a8','priority','100'),('41297f4a-c4d4-4602-a55f-2dcc705d90fa','0bfdf09e-d23d-4d49-9814-08741ba051a8','privateKey','MIIEogIBAAKCAQEAk6M6DvP5gFcmX/pGI+fZEjGWSnHlufHhHi00GH2okfeqs1JnXDcsI1DS6zUsG8aX8s18YT6soOcvLyqLwDhY3wmWie/Gzuhkq4p9ACTiy6eNp3M87g0JnolJ7V1v22MpG/AdYH1RREudLEEbzw1aK0LRBQ+YJxF9Ii9aA649vT2FqOKxszsi4MB1+RAIs4upzMkMsEek5XwXqUHfE3ylbU6hudIT1a0cHHREGnwOD1iHn9SRp8MlwTttiGLTcds8zhMpxVkEgXiads1r4k0gbt1aGPOK4o8ab7FAwS17nSbKPjI+glzurkOGGJRtfiCP7Tocbg95y2yHaSMxLg+6KwIDAQABAoIBABDrBX4tKwwv8G/TKDJ5IQDaudQyFRcnxppEp9GepLCFZwRBjyKcF+y8GE9nunQ8X7EtJvGl0vZlR5zqDTWrv1Nfr+aCmY+gRdj6d7SKhYq82piztem5iL6oENaofGbxiAZxj4w9EBD5cTtfAqbJaunGMFmaHd9sO6CtOG1vjBehRT+AXkzP4OWSbz9iCYOPyjox6vzD9dq3SJodBVsDJqRFjCT2jxr9MuQQu4sg2sWN6kXfk7Nr5yJF/5nCS2nEERN2McnITwLVDCKuLnVImk13Q60WjQz2M3OjTNN4cgmBGc5Q0a2xiaUCuUJMu4Ax/M4ijZgZFORhQRoLR31QiLECgYEA+RElv13wjiNeFCJBfNZMp3lNXCEeMhJ09lb3JZgsXv0044vT1mvOzx32Gwc9XaDwVGzkTEGsSfgTHW9ZzPZk/CqQ8iLe57zxSlUT2EeUceVCBSgl20nuyEehqaTvqlU09WtAMBSMb2NgicG2PVrivGGNxN4zZxCKvJ3Gv0BPiA0CgYEAl79LCBvzDaJXYMEmvDbrxg8qhS0XxRbkYj7OdU4HEPCJiXZfLvnG66oJLyXGbjf6tzHI4Uhgz3CgcWA23h7Ct42mK+jDTlxan/mO/v/bq4kTfJtfGaBJllZ2hRXtC8cNvR5lEa8V2sQFvwOxm56FTwH648b9pmrFPoM32b17RRcCgYAnjQCIhftYJueenN33W/RqN8oAEkZAP0wRfjfa4XJSVzUZ2S93gkEiBKj7G8gz4QWo8m3Caj9Ys6sdZnxFHu9kV8ISoVTySb+rRR1Un/FDsNsuBHUWgIQJi85xKP7h9ovlWPWlbO3sFkTTO06cKZ2NupQPqhVRjX/qeceAwU6f1QKBgBrBRJZqbyExRVyu0YiP2mQyWlneyHkcfyn/TuGJ318SOf29nCypJ3R3p2TjsSfPwOm54mQuIbuRbQhwYVwqakR4uhq10HGpgOUB2D+HlxCYe5IVxt+6zh6uofj3E7Nm5jo4+LL0ftLyitzR5ue8PF7gx36PoDtOSfaqphdC/FADAoGAaLptrmY0o2KslJ7g6CQAP6pVDyqDCogQNLxvIVILRhPeXM7MHOsfpLLNZ50i6BKJ1I+JNHUcHIaCzOT9T9OYbt8tEiHaKuyBqQo0j0ZnyW3oWzddhvgpGQMHQH+ZxxD5qbjfIRWpI4A7CSWuiyGDOsZ/hT2T8SfvvnOk6s4VIqo='),('4b17fd79-f464-4a4f-9a54-7e2cb985b32d','2f76e63c-eabd-41b4-8855-e3841fb04184','keyUse','SIG'),('4b77e5a8-89db-427c-9b29-52fbc7d11b80','2586234e-52f5-4c37-a2d4-433c59a2acb5','secret','NVEonEjCeEFRM593SMz8i3j7lpuSJSAG0adQeB8q8lr9DpqSl1oTmITo0CYeCWgSmxLStvm_wcHpdXYXR3JQQA'),('4db0fb8b-1e1a-410a-90db-831afc7178fc','7243267f-5c72-48a6-b9ef-0eb8d67b3201','certificate','MIICmzCCAYMCBgGMNPN3hjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjA0MTMwODQwWhcNMzMxMjA0MTMxMDIwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDFxwk+Zd3wrqm0NP0dLNsbSXziQZm+bvOQgE0O3lErRrXAk/2NtKQIVTMLyh3p8Kbu889gg2PQJlPhNJqK3Wbm7DIzyVyvreG7vlh5BeKOc/fC9d7c0IulMt2bov5DBU1w0g0Sas+jl+QDyuIJYWpyXcWceM/raIy0a7P8Ylr7XKC/dmgt95QlP2OuiX2YZWjt/3ldYZ33xxgf6sAxdKcWnTjJcGKvuXTLCWOeEMJrjLDlCKdaRgugnteTJI6JnYIAfme3rMr2N6hpR8L3UXHKac4G0AbZPuMy4Isrm+61pqFVTOoHVgfq1NkPM3OYTf5Wn/lKuUm76uGHisZTZnUBAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFvOrgp4gjtmsirTnJ3CNv2d7j1eVaiNCMdDEtf1GNqrSXkTyPK8RsZ5s0yACNAttCkByRBWeXIuKqw5dK8TPv9qkHJ2ZThy8Gx2qK1fmjeAmcT0CkMcRD8Rc2lbiLDcUv8I+/LrGDCmm+x5sFBU3DA05bP+nJVxMyp4GJjUgUrTwY8ZYT8p7SpK3iKtwK03G9zd8Bwke7AhB4Au++pePWiRJtWLjhfjrKlvhhEdY3kEOGQUKK1dyAeY0LLr3GTaOmSmlAR3OHCInUREG+4SMeeScNinopc0kQMUZd+MCbbtkMummdvOWqtzdPvTKKWcWeZgZrAV0GBMSIVK/gDINLI='),('4ed9966e-32e8-4543-bfb4-8224221adb79','2586234e-52f5-4c37-a2d4-433c59a2acb5','priority','100'),('52a8df71-6574-477f-8e75-d6d080d80f52','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-address-mapper'),('5c26a8f4-f375-4eb1-a7d7-2dd68c50432c','7cf45a20-5ba2-47ae-85a1-b6e4dd962252','allowed-protocol-mapper-types','oidc-address-mapper'),('5d153bca-a5fd-4f1b-bce0-7898e756b677','0098e192-5eea-4102-bbf0-f69798acea5d','host-sending-registration-request-must-match','true'),('5e6007d1-d57e-4a81-941c-14dfa7f10247','5296d97c-836c-4518-94c3-30e4aa734fb3','secret','e5gU_18gczWlFm92NpJmog'),('5f178875-ad03-4dc5-8f9b-f903f9c8ed4e','7cf45a20-5ba2-47ae-85a1-b6e4dd962252','allowed-protocol-mapper-types','saml-role-list-mapper'),('5f3a5d2b-b95e-4e45-b6f4-f891c8199bc4','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('63f7b12c-8cc9-4433-8540-494f59cc2ce9','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('6b2931cc-2f4b-4ea4-b867-c44464a8001a','c4c425ae-1ba1-4aeb-9fd0-06769828185a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('6b55ebfb-06a5-457a-92ad-f6c0eb8c1379','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('6dc54926-4389-440a-9a85-ddcc8cd0d8fe','c4c425ae-1ba1-4aeb-9fd0-06769828185a','allowed-protocol-mapper-types','saml-user-property-mapper'),('6dd61849-245a-42d6-b97b-89a01e7a9a2d','c4c425ae-1ba1-4aeb-9fd0-06769828185a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('6f72b8a1-d1d7-47ca-8035-e91841d4503b','2f76e63c-eabd-41b4-8855-e3841fb04184','certificate','MIICmzCCAYMCBgGMNPN3DjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjA0MTMwODQwWhcNMzMxMjA0MTMxMDIwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCB0QODf5dZP95H8TSnq8IToBlAFjBcYdKIUttOzKuMxzOV207UEtibSRzIdaMLOjDDIhJaQi9ge716GLnIfbYTvZEq59ESwc/RWJx70XO8FCVX23f4yDey1k7UikPtb6RxwQ5ubV1M+7gDiU5AfLDXIQ3giT10mqvlfQdpONA2IqWSRsUfMtn1mKOPgqI9PoMiwbQdp0LjZ/FL+hxtoAhFiWocwTh5fpe2U47SCk73BTxzKYAqPRjaM5AX1UgOBwUof37GtFvUAfqHVQo4hpLFNJNGO9eLjB70feVnGKT4orALDx/IvYS72JPbjrhHBOmD2UJ5207XCfNSc7daMhYTAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIG4vkeFhu4A02mvWZ3H84oVRX/gzDf9/kBXMgqyC9rMh88i5e4BOSUOEFaeFDLzdoVoxAx8JbgDdosyu7BnrKgmKgrzOCafFtCvC6RoAzW70Yt7+ag03Wh9o1aiU+2sB2FkAmIVbvElKzG4fzF2onx/8QETbbCOK7PqomYGKRXog/BKmAyL/ACiZ29m9+cAdfvLAuE2m7GIl7H8BaMw8Zz1im5XD3g2y6SaD1gwO8np4zu/c9p4nLEJz5AaRnSECHgh8kRAbsm3oofPnKVy7mig+IuEabo/2DP9MUKXasA3AdmYCIC6dnhIvB1ci2J6UUBjvHGpesoQog+aELpuFqk='),('6fbf739a-2e9a-43fc-b454-e7973879733a','20217c77-2196-4ae6-9d79-e799d807904c','kid','a28c1c50-b02e-40a9-9cc3-8c933e8408bd'),('703cea11-420f-4444-8116-0ba8b954645c','c4c425ae-1ba1-4aeb-9fd0-06769828185a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('712b1dcb-bda3-4237-a5c4-4c018a550a69','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','saml-role-list-mapper'),('7306b3eb-389c-4351-aeb8-0dad13a9575a','7243267f-5c72-48a6-b9ef-0eb8d67b3201','privateKey','MIIEpAIBAAKCAQEAxccJPmXd8K6ptDT9HSzbG0l84kGZvm7zkIBNDt5RK0a1wJP9jbSkCFUzC8od6fCm7vPPYINj0CZT4TSait1m5uwyM8lcr63hu75YeQXijnP3wvXe3NCLpTLdm6L+QwVNcNINEmrPo5fkA8riCWFqcl3FnHjP62iMtGuz/GJa+1ygv3ZoLfeUJT9jrol9mGVo7f95XWGd98cYH+rAMXSnFp04yXBir7l0ywljnhDCa4yw5QinWkYLoJ7XkySOiZ2CAH5nt6zK9jeoaUfC91FxymnOBtAG2T7jMuCLK5vutaahVUzqB1YH6tTZDzNzmE3+Vp/5SrlJu+rhh4rGU2Z1AQIDAQABAoIBADpy3+B46mY+uBhxsHv2zan6xdV33Z/R2llSEXPbb9GCTCRlmAFQ6UktJLDPQpfobu0fUKINMmpJaXCcwy9Wzxpfo1Z6o9GnaZa6YhsiChpfW1FaqEpJt3tS1Psx6EKWRpSY/xP6TPLj6JbWVoa/K14xKD1d1tSTSUHosoBb8NdnuzdNrLScmWp72EVbTOqSMT5oz2jolvM5wjAtX8gQc54JRuoDlldWsaEdbPcnXnWV30AYpCky24fMtVUn8OYnz6hnvVQZkTvInpXb8kyf54Q4csUd3yuB6lsNYiuvvvdEOQzY9e/2UsuDOQBGRB6+fUYC2HUkPuhvMEtG2wTn2KECgYEA75o/hWa4ZWYaoK+zYEIUph+o52OQ1NviCz7tt2BJlL4oew0DCpwSi9R0X/7i2jH7h0Z2Xf6j3m/nXENnnFGqTzoMWrJDFUoI3mHynbz9UQXQIhCOuX2e6KmegdL0RYLNDn35q0ELcGIxcfoZMPBAXKI28OkhJBdTbUYpRWLCk3cCgYEA01AHJLsRvWdqF3eLv5KZkP5sYbwrFzOSSfjJOMB1QORJiIEtyevushX/8bDi988iSBmM1mSHXIb/op9lvDW4VErXfKIi5ez6T2OBcvC0FiOpi9lGAP6O4HVGudCKVeMvOE/zFuXaC+5IMaMEa2gLkci2CGGjTVcAqD9iDg4aqUcCgYEAriJ+c+d5sEgKpinLxfOAqlNsH+7evbSojd/ISHO0RmQFa5jDUxym5fUcNwA5wrZ8xY3STPHaCrltfkKGtLctfbMEc44G7xwFYgnxl+5YdGAzKe66q9i+ev17c4LrgPFVMmkf4PS+6YiTwvAvCsAxJqHGKERmj6JcQZiyOflSzHUCgYAu6SQ81j6w8oVN4l8mz0/CLYk4BUL3qp4+R7m8HJWrK0Lbx/m3SuY5qMKiECfC5bvxj6KBcd3O/7U+j+5Q4wghxl+iLohazMog17FEKAWCqLYZ8skkrV5gnAhwdchQGtg/wxfvLGXEokhqpIr1oSp4Wbt3jt1m7PqbXz7QafcnPwKBgQCPccr72WzzAAQNJpdU02QJouThRR2YyMUXgkM8c/aZZKXjbIHJ/FGZGvyDk+QIuaRxHx+c6UFP5HqNgwSRVQHBd6X9ajaEpG4vuZmFhTAI1KdS8CneSmhLtRpGPQstFOJsIzCUWY8WzRHIrNrscudk9G4WrsOnQURrJU5MVU9r7Q=='),('7360dfd5-2225-4693-a911-d13ccbc02de9','2586234e-52f5-4c37-a2d4-433c59a2acb5','algorithm','HS256'),('7511c335-b869-4760-be9c-82f92537f9bf','b75485a4-f673-4081-9238-4b5e7f5eb222','max-clients','200'),('79a15c15-ca10-4c8d-ab2a-08b397862b50','a117c56b-09b7-443d-b853-9becd0690bee','client-uris-must-match','true'),('7d9e7aec-2904-4ee2-98e0-078251e2c930','7243267f-5c72-48a6-b9ef-0eb8d67b3201','keyUse','ENC'),('945b982e-dd03-4300-85d7-77109d309f03','7cf45a20-5ba2-47ae-85a1-b6e4dd962252','allowed-protocol-mapper-types','saml-user-property-mapper'),('9745be2a-d0c1-4075-be95-c5c2e6b0ac68','20217c77-2196-4ae6-9d79-e799d807904c','priority','100'),('9b34bc49-ee95-4ca8-ae4c-d9a2c236e31b','7243267f-5c72-48a6-b9ef-0eb8d67b3201','algorithm','RSA-OAEP'),('9df622b6-903d-428f-8eb9-abaeaca0bede','fbed651a-78dd-4eb2-968b-45dc4ede7fd5','allow-default-scopes','true'),('a3db3cab-4660-4422-aa54-0ac5629f10a3','765cd604-3dd6-49b4-af5e-7363f1d7883e','allow-default-scopes','true'),('a528bc1e-7313-479a-bdef-7fb327378ceb','52c82a70-e1e9-49fb-a57a-19514d10598c','allow-default-scopes','true'),('a5fff152-1135-4fe6-9f20-7813ca80446c','811288b9-8e90-487b-969b-82d36b785c27','certificate','MIICnTCCAYUCBgGMNPPwUTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdzaWdsbzIxMB4XDTIzMTIwNDEzMDkxMVoXDTMzMTIwNDEzMTA1MVowEjEQMA4GA1UEAwwHc2lnbG8yMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMUtKmG0BZhsutz1p5b2S7nxsjPpSJLRlb59ZEcN9mKftnSuEboOvSZwRbgMEIUeaTWjBDu4hWItYj1Ajkj9qBwBR3sbXNOqPg5IoU1vsXudIed7pJL/OM8bn1icZTrwIXAl6MQjKHZbo4YtiBCzH2gzZaCRz3kJWpwCc0O33x97F9VQD1KG94Bl1tfX7iRnPMQps3fbcWmEr+ul+J7cCMg3VYyOBG68T6YADfeAGxICVsPXOTTmYWxeUvf3ElMtZWciINChVhvv/QWl54j0he5NdzQLLLxapnZMW2wkor5nmtVvk/vWS+zhHOtch1Wsis1OCopYx5QDg159PRouWY0CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAr6iXN9vD89eUV3jXEvCVh4aFKsa23PNQUjg05M5WMdT8iXljDTjsW/7yAZOgvH6/hdViQfF3Sg73zxz+Bc3JJQdGn6Q1aSTcgGAxWPSAGBU7G4eLR39aU6wSZms6GLEAT6VB4XENk/NFQbfk6e6yohpGjaY9APpubXFc8bzEnEISwg5oaDRA+Gp3g9dBNYYKkBEmyj9v89jcw4Xmw4OBAGeShCwx8OQwCyZ1cmQvBCyVgLvUkefR4R4Y2CdJjdn/jU3+ED6O0ELdNPG8gPSprdgBOU7Skm4TBTzd0Ogk+cDQoh7pdW0iMHmyb8keqqY8aOOPhOgSN0Hy800+LSgEsQ=='),('ad5b9384-7a3d-4aed-aea8-dab6223f1adc','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('b05e15e0-1c88-42ba-aed8-d06e6bdfce6f','7cf45a20-5ba2-47ae-85a1-b6e4dd962252','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('b57f7e6c-f139-489f-a7b7-14e9b73df0a8','7cf45a20-5ba2-47ae-85a1-b6e4dd962252','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('b5a409c2-93e4-42b8-ae55-b27bf0a97503','c7604a3c-d217-410a-841b-2d3cfe05b6b9','priority','100'),('b910c5e7-02ce-4bba-8b35-00c1c9313759','20217c77-2196-4ae6-9d79-e799d807904c','algorithm','HS256'),('bb22ba66-e7cf-4ece-a063-ea3c071a1e0a','5296d97c-836c-4518-94c3-30e4aa734fb3','priority','100'),('be275e0e-df35-4770-b4da-417b9e869ffa','811288b9-8e90-487b-969b-82d36b785c27','algorithm','RSA-OAEP'),('c821ef4f-6fa3-4da8-ba88-61d506872b67','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('caf8ee92-6ba5-4d20-a59e-778a84260ed6','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-user-property-mapper'),('d10fff73-2190-438d-88c5-b81cd2bc7d0f','0bfdf09e-d23d-4d49-9814-08741ba051a8','certificate','MIICnTCCAYUCBgGMNPPwLTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdzaWdsbzIxMB4XDTIzMTIwNDEzMDkxMVoXDTMzMTIwNDEzMTA1MVowEjEQMA4GA1UEAwwHc2lnbG8yMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJOjOg7z+YBXJl/6RiPn2RIxlkpx5bnx4R4tNBh9qJH3qrNSZ1w3LCNQ0us1LBvGl/LNfGE+rKDnLy8qi8A4WN8Jlonvxs7oZKuKfQAk4sunjadzPO4NCZ6JSe1db9tjKRvwHWB9UURLnSxBG88NWitC0QUPmCcRfSIvWgOuPb09hajisbM7IuDAdfkQCLOLqczJDLBHpOV8F6lB3xN8pW1OobnSE9WtHBx0RBp8Dg9Yh5/UkafDJcE7bYhi03HbPM4TKcVZBIF4mnbNa+JNIG7dWhjziuKPGm+xQMEte50myj4yPoJc7q5DhhiUbX4gj+06HG4Pectsh2kjMS4PuisCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEANe7ClzOhHIh53yFC+B/Z3LNH48bR8LIw4oI2/mhogikgwov+QVXh4Kw3Btvf+InPe2t9ZoVkCRqjkCHH3yUwrQot/ISw0UiTHdtuu29iQ6uZD5pmR1Wrf4y1QBV4Xcno4S27i1IwGZARzemB2CBTBGeLbPH+i2+qiH76C/ghcvcKplRPykK+Vk00I13f3IhCA4mNWdxugnsa6V0VtDijg31D0lXl/ejgf8SYd1VfPTsQzCXHVoa28PrCFX58ZHNPhPf1H5HWiJGPy0Jlg7h+SRrXziVYosRuiB9f+wad1HcsIV4PoqoMhV+VsyvqE6sG86UlAjFu5JI67XeQ2k6I1A=='),('d26ad58e-84ba-4eba-aad3-9719d3bcc2ac','c4c425ae-1ba1-4aeb-9fd0-06769828185a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('d6cbd30e-f094-4529-9374-2bb223d2662d','c7604a3c-d217-410a-841b-2d3cfe05b6b9','kid','634883bf-2727-47b4-a73b-07d71c394bbd'),('d8db2f6a-22c8-4baa-a78b-3e9fe62c15d3','7243267f-5c72-48a6-b9ef-0eb8d67b3201','priority','100'),('dc03f2f5-bb2b-4aed-aee5-f9b8e0b3b505','20217c77-2196-4ae6-9d79-e799d807904c','secret','dccXuvfOtgelEIl-zcigE7uA-OJVregqPXyadTtwKXGVFtPZe7Ff6sh_YdbPt0bWMa9FvlAGLdh1onNe3dHGdg'),('dd1d3ef4-ccc0-4067-ac40-ad1656bed625','7cf45a20-5ba2-47ae-85a1-b6e4dd962252','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('e0cb0573-1e62-4d62-a12f-c377eca0701b','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','saml-role-list-mapper'),('e16fbe18-0c0f-491d-b2d6-3d91923f8cb1','7cf45a20-5ba2-47ae-85a1-b6e4dd962252','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('e2f08876-2b6d-40ae-a31e-f39a22840114','2d61ef21-608c-4499-96c7-fd147e65b6e4','max-clients','200'),('e7c8e2c6-f10b-485c-afa8-1a8dd4135ad0','80275b15-09eb-4958-9108-7bcf5f538f38','allowed-protocol-mapper-types','oidc-full-name-mapper'),('f2d54837-9450-4439-9441-dbafc7cc2c6b','bfa8d370-01ca-4bda-9333-ac7649508be0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('f575f3df-3de1-49d9-be21-5639fd3417c6','c4c425ae-1ba1-4aeb-9fd0-06769828185a','allowed-protocol-mapper-types','saml-role-list-mapper'),('f6b1d88a-a9b8-406c-a33b-1a45cd40addb','c7604a3c-d217-410a-841b-2d3cfe05b6b9','secret','ZLM60UJBoPy0J1fzCrEKHw');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('03480627-ab09-4c49-963c-2282eda92f8f','cc3c52d9-4afa-4b3e-8761-7b023c64d466'),('1e712aab-f487-48ba-b8e2-bd6126db7ac4','03480627-ab09-4c49-963c-2282eda92f8f'),('1e712aab-f487-48ba-b8e2-bd6126db7ac4','156f4f68-944c-4c82-8f66-243f865a2738'),('1e712aab-f487-48ba-b8e2-bd6126db7ac4','54c74d8d-3d55-42aa-a7ae-6c3f5a46f436'),('1e712aab-f487-48ba-b8e2-bd6126db7ac4','e35f75cd-17bd-44ee-be4a-bf292b27f9b0'),('54d5c122-1802-4139-b68d-e2cec2facbb8','09c39e33-cc18-4493-b30a-958b5ccb54aa'),('55c43002-4c16-49ef-87a5-30deaa22314b','8748520e-df8c-448c-b03a-f7e53b6bf973'),('55c43002-4c16-49ef-87a5-30deaa22314b','8f22b474-5230-47a1-82d1-922f73a786e9'),('55c43002-4c16-49ef-87a5-30deaa22314b','92e0c80c-ed04-427a-89da-e936808b8d09'),('55c43002-4c16-49ef-87a5-30deaa22314b','f1a73bfd-e4f4-4346-bf47-0e92b3941990'),('70d0fe77-e963-453b-935e-6984d04c3ea2','029be5cf-c565-4b6d-b87a-cfde88ad29b0'),('9165a689-5246-4823-9841-fff70cd46524','1389ab87-600e-4879-9881-bf577e250fc4'),('9165a689-5246-4823-9841-fff70cd46524','5dd78b39-9d2f-4619-b849-811cf7e93cc3'),('92e0c80c-ed04-427a-89da-e936808b8d09','2026770f-d9f4-45c6-ad72-901d39ebf1a4'),('95592080-b3d6-4da3-ac55-6b941b6b9f0d','4c22c3b7-e006-4413-a884-e7811787019b'),('95592080-b3d6-4da3-ac55-6b941b6b9f0d','d3778b1e-9b1d-48bb-b9e1-4e3b87c69881'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','09a06412-2870-42a8-8865-dd1e314661af'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','0fcc6f83-5b8b-422f-b14d-97ab8de35d15'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','10feb00e-b211-4f77-9fb8-4d95c0be84a5'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','1389ab87-600e-4879-9881-bf577e250fc4'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','1510f3b8-c1f3-4ab0-84da-757aedae9d68'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','1aa177ad-f764-458b-9c8b-e9b8375815a2'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','20aa9e10-e4d1-49db-8581-439b2e31fcb6'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','3252836a-b7c7-4d77-ac46-ac0892eef0d8'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','3776bb90-3e91-40a0-9693-6a6146147291'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','4c22c3b7-e006-4413-a884-e7811787019b'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','4c9d4449-f7b2-44b6-ae9f-d3441dc786df'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','5dd78b39-9d2f-4619-b849-811cf7e93cc3'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','5f659f96-133d-4975-9b25-d997895543bb'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','66f580be-b401-4dbf-933c-dd88d9b62f34'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','6d60b537-0bf2-4ce8-8407-4474e74dc433'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','6fbe980e-1f31-4b9c-b4ef-78ab3e44fb34'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','70f24e40-1b8a-48cd-bc86-ef8b51f7a77a'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','769dfbaf-5b5b-4098-8535-28c3a5b64a53'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','7a242c93-e0be-4cf0-a915-17bfa1b52aef'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','7ecb743e-7590-4dff-b976-8be9d4616840'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','852ec621-9897-49dc-894a-9f8b6bb8c865'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','9165a689-5246-4823-9841-fff70cd46524'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','95592080-b3d6-4da3-ac55-6b941b6b9f0d'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','998e7528-d5d8-4391-bd44-317a7f28b31b'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','9a40d8bc-6633-4523-a01e-09a8d6a0c29f'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','a2965ee9-ee62-43d8-b08f-4bc0394e2d1b'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','b156cf0c-8fa3-48c9-a5aa-897507c0deed'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','b2e6023e-908e-4769-979c-1f13be4a48b7'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','b41db9d2-074c-488f-9b53-4f32e82dff3c'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','b746b15e-a146-4fa1-a2dd-f10d7a0ff491'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','c969738a-7acb-4fd1-a8b3-0edac7d3ccdc'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','d3778b1e-9b1d-48bb-b9e1-4e3b87c69881'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','de6fd89e-5ecd-400d-a56a-15353e307627'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','e3ceeaa0-e231-4bbc-97f4-2cd81ea1c6c3'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','e9f3eac4-721e-4746-8e53-8f9e8b855b79'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','ea206ccd-5185-4846-8e4d-a63219b70a4a'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','fd0ec05f-d27d-4172-a18a-b1c78559c755'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','26084389-cab9-45fa-93ea-66f47fcdbbd1'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','285bf1b2-c1b4-4581-a161-bd23ac640baa'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','345907e8-7f50-43f5-9c81-624da4d4942b'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','48533797-37fb-479c-b4aa-4f054faed6ac'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','5d43716f-3ca5-48da-9d7d-739f529096dd'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','7460cf09-2886-4829-bcd0-5ccaa42dbd57'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','75b816a1-3b66-4c03-b75a-8b772946c711'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','7d2dda07-06ff-4d4f-89d3-820498596b27'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','a2a6d51e-21d2-43af-8939-bc8358d562b8'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','a633afdc-9331-4419-953e-69c90773f17e'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b4818dfb-4434-41fa-9600-434ca3f5442f'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b54bfb8c-12c5-4d91-8d17-8913208e6765'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b5d2075c-edf2-4415-b121-87b1bd4286f7'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','b9839a7b-b519-4c27-bf9f-396e5bb51bb2'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','ca0b5753-e677-420d-bb53-0fc590c08c1e'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d118260b-b1fe-41b8-83e3-48f76748d0fc'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','d7263fd7-1aa8-471a-a562-2576e6a886dd'),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','f054da5a-1733-4542-b8da-4ba49f1b89ce'),('a8cad8d4-5666-40c4-b7ae-a200dd2a6f23','cfecd3e0-ddda-43ec-bdea-38e38a426e49'),('b156cf0c-8fa3-48c9-a5aa-897507c0deed','4c9d4449-f7b2-44b6-ae9f-d3441dc786df'),('b4818dfb-4434-41fa-9600-434ca3f5442f','7d2dda07-06ff-4d4f-89d3-820498596b27'),('b4818dfb-4434-41fa-9600-434ca3f5442f','a633afdc-9331-4419-953e-69c90773f17e'),('d118260b-b1fe-41b8-83e3-48f76748d0fc','d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf'),('dea41763-6811-47a0-a1e9-0652e7487c4f','7a33b7d5-afac-418a-ba38-3a4d696d4cbe'),('e9f3eac4-721e-4746-8e53-8f9e8b855b79','7ecb743e-7590-4dff-b976-8be9d4616840');
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
INSERT INTO `CREDENTIAL` VALUES ('0d51f6da-851d-45f5-ae62-d7e24cb10aa7',NULL,'password','027d26cd-4700-4ff0-afaa-427843c320bf',1701695586338,NULL,'{\"value\":\"xRrujJR5qUTMG6JloJMPt+SBpxKUCYP3QbDi2PkUiai4RU8TFlYBhQ3gszSXJKBqBl3/RFCV4AfCKCJ5eW06FQ==\",\"salt\":\"Jxe5b7zMn3381M17gyY+QA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('4986fe81-f90e-413c-80e1-b5247e35f105',NULL,'password','ccee54a4-7637-4cdf-bc95-890eed621451',1701695420889,NULL,'{\"value\":\"Ze4hwyfC/ufLlk6omIc5OxRasgd+so81jUR/0mSMUHc67HD8W0GRc7QUdCqMJyZ0DO4d3WOiUjZte0B0+1sF4Q==\",\"salt\":\"HFSOS9qkjp8o9REFkpZkYw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('b78736a3-a46a-4bed-8317-dc1ab4b8af57',NULL,'password','05f3c932-f234-4cda-ad08-df17c0ba7fe4',1701695646546,NULL,'{\"value\":\"ceJ9NhPI/z9Z036RI7RBWf0qZl2nejPqKR9EUbIQDQV8GNS5HywazvqwR2+RN/I+9UEqCj2WHRU9MSoPH1vzJg==\",\"salt\":\"Y/B2s0HaicNGYDmiI3EgRg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('f4b3c2c4-20bc-444a-948d-f7013647f8f1',NULL,'password','1c2581ff-6d24-4462-bd9a-c5aa79a402ce',1701695605357,NULL,'{\"value\":\"6H1NXN4ZAcatHyXFxJNYIgPcU8m9Z2yLV1Xh8KNkoDBQPL7NzU0NBsmQEeh0kWUL2g7T8xyW/7Cjxxs9Pw0Kjg==\",\"salt\":\"QTFo4XsAUWsheA3zYdceiA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-12-04 13:09:47',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-12-04 13:09:47',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-12-04 13:09:47',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-12-04 13:09:47',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-12-04 13:09:49',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-12-04 13:09:49',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-12-04 13:09:51',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-12-04 13:09:51',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-12-04 13:09:51',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-12-04 13:09:53',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-12-04 13:09:54',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-12-04 13:09:54',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-12-04 13:09:54',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-04 13:09:54',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-04 13:09:54',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-04 13:09:54',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-04 13:09:54',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-12-04 13:09:56',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-12-04 13:09:57',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-12-04 13:09:57',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-04 13:09:57',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-04 13:09:57',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-12-04 13:09:57',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-12-04 13:09:57',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-12-04 13:09:57',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1695382034'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-12-04 13:09:57',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-12-04 13:09:59',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-12-04 13:09:59',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1695382034'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-12-04 13:10:01',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-12-04 13:10:01',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-12-04 13:10:01',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-12-04 13:10:01',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'1695382034'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-04 13:10:01',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1695382034'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-04 13:10:01',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-04 13:10:03',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-12-04 13:10:03',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1695382034'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-04 13:10:03',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1695382034'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-12-04 13:10:03',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-12-04 13:10:03',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-04 13:10:03',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-04 13:10:03',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-12-04 13:10:03',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-04 13:10:05',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-12-04 13:10:05',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-04 13:10:05',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-04 13:10:05',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-04 13:10:05',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-04 13:10:06',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-04 13:10:06',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-12-04 13:10:07',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-12-04 13:10:08',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-12-04 13:10:08',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-12-04 13:10:08',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1695382034'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-12-04 13:10:08',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-04 13:10:08',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-04 13:10:08',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-04 13:10:08',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-04 13:10:10',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-12-04 13:10:11',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-12-04 13:10:11',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-04 13:10:11',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-04 13:10:11',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-12-04 13:10:11',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-12-04 13:10:11',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-04 13:10:11',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-12-04 13:10:11',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-04 13:10:11',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-12-04 13:10:12',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-12-04 13:10:12',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-12-04 13:10:12',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1695382034'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-12-04 13:10:12',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'1695382034'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-04 13:10:12',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1695382034'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-04 13:10:12',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1695382034'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-04 13:10:12',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1695382034'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-04 13:10:13',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-04 13:10:13',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'1695382034'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-04 13:10:13',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1695382034'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-04 13:10:13',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-04 13:10:14',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-04 13:10:14',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-04 13:10:14',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1695382034'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-04 13:10:14',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1695382034'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-04 13:10:14',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1695382034'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-04 13:10:14',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1695382034'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-04 13:10:14',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1695382034'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-12-04 13:10:14',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'1695382034'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-04 13:10:14',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-04 13:10:14',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'1695382034'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-04 13:10:14',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'1695382034'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-04 13:10:14',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'1695382034'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-04 13:10:14',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1695382034'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-04 13:10:14',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-04 13:10:14',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'1695382034'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-04 13:10:15',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'1695382034'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-04 13:10:15',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'1695382034'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-04 13:10:15',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'1695382034'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-04 13:10:15',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1695382034'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-04 13:10:15',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1695382034'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-04 13:10:15',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1695382034'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-04 13:10:15',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1695382034'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-04 13:10:15',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1695382034'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-04 13:10:15',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'1695382034'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-04 13:10:15',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'1695382034'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-12-04 13:10:15',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'1695382034');
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
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','1bb67913-9995-497e-89af-945150f89f52',_binary ''),('master','2adf4563-1add-4971-8bd6-56bad82c7c29',_binary ''),('master','5ab15083-b474-411a-8c86-92cf6857dd42',_binary '\0'),('master','67593354-2d39-40af-aafc-d56bb75171db',_binary ''),('master','7063f6d9-553e-47e3-a709-6dbf3cc3db10',_binary '\0'),('master','d44015ab-b4cf-4b2e-944b-340f51e1ea96',_binary '\0'),('master','d4fe8411-0238-43d9-8e9a-e59fcc652557',_binary ''),('master','e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034',_binary ''),('master','e4e97c99-0888-4df6-adbf-13b51f3be080',_binary '\0'),('siglo21','19b6b82c-b8f7-4634-be79-efede78aab4e',_binary '\0'),('siglo21','279791da-86fa-4f67-84c7-b8f250adbcf1',_binary ''),('siglo21','28963099-19d3-4521-a02f-976d9671e893',_binary '\0'),('siglo21','313cd6d5-afa3-4d09-bec6-8e059c9718c3',_binary ''),('siglo21','80a98201-a009-4f95-a8d9-67b46623f54d',_binary '\0'),('siglo21','ab34af5f-b1a2-42b9-90dc-89a50790890e',_binary ''),('siglo21','b229e7fc-3666-4f8f-b02d-0f24dc04e851',_binary ''),('siglo21','b39fe518-d02f-4eac-942b-eeddf878c80f',_binary ''),('siglo21','da127315-5241-4a8f-a46a-6bea0de8925e',_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_envios`
--

LOCK TABLES `detalles_envios` WRITE;
/*!40000 ALTER TABLE `detalles_envios` DISABLE KEYS */;
INSERT INTO `detalles_envios` VALUES (1,'unaHerramienta','A-2321-21312312'),(2,'otra','A-2321-21312312'),(3,'otra x2','A-2321-21312312'),(4,'string','HOY'),(5,'Producto A','FAC123'),(6,'Producto B','FAC456'),(7,'Producto C','FAC789'),(9,'Producto F','FAC987'),(16,'Producto D','FAC321'),(17,'Producto G','FAC111'),(18,'Producto H','FAC222'),(19,'Producto I','FAC333'),(20,'Producto J','FAC444'),(21,'Producto K','FAC555'),(22,'Producto L','FAC666'),(23,'Producto M','FAC777'),(24,'string','A-1234-12345678'),(25,'string','A-1235-12345678'),(26,'string','A-1236-12345678'),(27,'string','A-1237-12345678'),(28,'string','A-2237-12345678');
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
  `descripcion` varchar(255) DEFAULT NULL,
  `envio_externo` bit(1) DEFAULT NULL,
  `fuera_de_ciclo` bit(1) DEFAULT NULL,
  `intentos` int DEFAULT NULL,
  `tipo_envio` int DEFAULT NULL,
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
INSERT INTO `envios` VALUES ('A-1231-23123123','sdfe','sdfdsf','1233',14,4,2,'entregado en local por juancito',_binary '',_binary '\0',0,1),('A-1233-21322313','string','string','',13,4,1,'',_binary '\0',_binary '\0',3,2),('A-1234-12345678','string','string','1233',9,4,4,NULL,NULL,NULL,NULL,NULL),('A-1234-43242345','string','string','string',1,5,4,'entregado en local por -------',_binary '',_binary '\0',0,2),('A-1234-54432324','string','string','string',1,2,4,'',_binary '',_binary '\0',3,3),('A-1235-12345678','string','string','1233',10,4,4,NULL,NULL,NULL,NULL,NULL),('A-1236-12345678','string','string','1233',11,4,4,NULL,NULL,NULL,NULL,NULL),('A-1237-12345678','string','string','1233',12,4,4,NULL,NULL,NULL,NULL,NULL),('A-2133-23214421','string','string','',14,4,1,NULL,_binary '\0',_binary '\0',3,2),('A-2237-12345678','string','string','1233',13,4,4,NULL,NULL,NULL,NULL,NULL),('A-2321-21312312','direccion de envio','una calle y otra','2333',1,4,1,NULL,NULL,NULL,NULL,NULL),('A-4321-21321333','edsfew','fewfew','1233',14,2,2,'',_binary '',_binary '\0',1,1),('FAC111','Avenida Terciaria 111','Avenida U y Avenida V','5678',7,1,3,NULL,NULL,NULL,NULL,NULL),('FAC123','Calle Principal 123','Calle A y Calle B','1234',1,4,1,NULL,NULL,NULL,NULL,NULL),('FAC222','Calle Terciaria 222','Calle W y Calle X','9012',8,1,3,NULL,NULL,NULL,NULL,NULL),('FAC321','Avenida Secundaria 321','Avenida M y Avenida N','3456',4,1,2,NULL,NULL,NULL,NULL,NULL),('FAC333','Plaza Terciaria 333','Plaza E y Plaza F','2345',2,1,3,NULL,NULL,NULL,NULL,NULL),('FAC444','Avenida Cuarta 444','Avenida Y y Avenida Z','3456',1,4,4,NULL,NULL,NULL,NULL,NULL),('FAC456','Avenida Central 456','Avenida X y Avenida Y','5678',2,4,1,NULL,NULL,NULL,NULL,NULL),('FAC555','Calle Cuarta 555','Calle A y Calle B','7890',2,4,4,NULL,NULL,NULL,NULL,NULL),('FAC666','Plaza Cuarta 666','Plaza M y Plaza N','1234',3,4,4,NULL,NULL,NULL,NULL,NULL),('FAC777','Avenida Cuarta 777','Avenida C y Avenida D','5678',4,4,4,NULL,NULL,NULL,NULL,NULL),('FAC789','Plaza Principal 789','Plaza A y Plaza B','9012',3,4,1,NULL,NULL,NULL,NULL,NULL),('FAC987','Plaza Secundaria 987','Plaza C y Plaza D','1234',6,1,2,NULL,NULL,NULL,NULL,NULL),('HOY','string','string','stri',1,4,4,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_envio`
--

LOCK TABLES `estados_envio` WRITE;
/*!40000 ALTER TABLE `estados_envio` DISABLE KEYS */;
INSERT INTO `estados_envio` VALUES (1,'Pendiente'),(2,'EnCamino'),(3,'NoEntregado'),(4,'Entregado'),(5,'Cancelado');
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
-- Table structure for table `FED_PROVIDERS`
--

DROP TABLE IF EXISTS `FED_PROVIDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_PROVIDERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERFEDERATIONPROVIDERS_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_DCCIRJLIPU1478VQC89DID88C` (`USERFEDERATIONPROVIDERS_ID`),
  KEY `FK_213LYQ09FKXQ8K8NY8DY3737T` (`REALM_ID`),
  CONSTRAINT `FK_213LYQ09FKXQ8K8NY8DY3737T` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_DCCIRJLIPU1478VQC89DID88C` FOREIGN KEY (`USERFEDERATIONPROVIDERS_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_PROVIDERS`
--

LOCK TABLES `FED_PROVIDERS` WRITE;
/*!40000 ALTER TABLE `FED_PROVIDERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_PROVIDERS` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_del_dia`
--

LOCK TABLES `hojas_del_dia` WRITE;
/*!40000 ALTER TABLE `hojas_del_dia` DISABLE KEYS */;
INSERT INTO `hojas_del_dia` VALUES (1,'2023-12-06 20:23:30.084204','2023-12-07',NULL,1,NULL),(22,'2024-01-04 21:12:30.879569','2024-01-05',NULL,3,NULL),(23,'2024-01-05 20:43:14.843576','2024-01-06',NULL,3,NULL),(26,'2024-01-09 20:05:18.791964','2024-01-10','LOG123',2,1);
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
INSERT INTO `hojas_del_dia_envios` VALUES (23,'A-1233-21322313'),(23,'A-2133-23214421'),(23,'A-2321-21312312'),(23,'FAC123'),(23,'FAC456'),(23,'FAC789'),(22,'A-1234-12345678'),(22,'A-1235-12345678'),(22,'A-1236-12345678'),(22,'A-1237-12345678'),(22,'A-2237-12345678'),(22,'FAC444'),(22,'FAC555'),(22,'FAC666'),(22,'FAC777'),(22,'HOY'),(26,'A-1234-54432324'),(26,'A-1234-43242345'),(26,'A-4321-21321333');
/*!40000 ALTER TABLE `hojas_del_dia_envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojas_del_dia_exepcionales`
--

DROP TABLE IF EXISTS `hojas_del_dia_exepcionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojas_del_dia_exepcionales` (
  `id_hoja_del_dia` int NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_reparto` date DEFAULT NULL,
  `patente_camion` varchar(255) DEFAULT NULL,
  `estado_hoja_del_dia_id` int DEFAULT NULL,
  `repartidor_id_repartidor` int DEFAULT NULL,
  PRIMARY KEY (`id_hoja_del_dia`),
  UNIQUE KEY `UK_ote7b25nkgrsqgnsuhb38d6jo` (`fecha_reparto`),
  KEY `FKlh8aahqc38e4ypnbbtg5d7c6x` (`patente_camion`),
  KEY `FKn00svguhc7pmpyfoi3smauokg` (`estado_hoja_del_dia_id`),
  KEY `FKfl6qjlcj15v9a03a66gc50msv` (`repartidor_id_repartidor`),
  CONSTRAINT `FKfl6qjlcj15v9a03a66gc50msv` FOREIGN KEY (`repartidor_id_repartidor`) REFERENCES `repartidores` (`id_repartidor`),
  CONSTRAINT `FKlh8aahqc38e4ypnbbtg5d7c6x` FOREIGN KEY (`patente_camion`) REFERENCES `camiones` (`patente`),
  CONSTRAINT `FKn00svguhc7pmpyfoi3smauokg` FOREIGN KEY (`estado_hoja_del_dia_id`) REFERENCES `estados_hoja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_del_dia_exepcionales`
--

LOCK TABLES `hojas_del_dia_exepcionales` WRITE;
/*!40000 ALTER TABLE `hojas_del_dia_exepcionales` DISABLE KEYS */;
INSERT INTO `hojas_del_dia_exepcionales` VALUES (1,NULL,'2024-01-16','log123',1,1),(3,NULL,'2024-01-17','log123',1,1);
/*!40000 ALTER TABLE `hojas_del_dia_exepcionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojas_del_dia_exepcionales_envios`
--

DROP TABLE IF EXISTS `hojas_del_dia_exepcionales_envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojas_del_dia_exepcionales_envios` (
  `hoja_del_dia_exepcional_entity_id_hoja_del_dia` int NOT NULL,
  `envios_numero_factura` varchar(255) NOT NULL,
  KEY `FK386uppesir8stj05x7tffrgt` (`envios_numero_factura`),
  KEY `FKoc4snkgo3vxcm9pxxlw5rps56` (`hoja_del_dia_exepcional_entity_id_hoja_del_dia`),
  CONSTRAINT `FK386uppesir8stj05x7tffrgt` FOREIGN KEY (`envios_numero_factura`) REFERENCES `envios` (`numero_factura`),
  CONSTRAINT `FKoc4snkgo3vxcm9pxxlw5rps56` FOREIGN KEY (`hoja_del_dia_exepcional_entity_id_hoja_del_dia`) REFERENCES `hojas_del_dia_exepcionales` (`id_hoja_del_dia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_del_dia_exepcionales_envios`
--

LOCK TABLES `hojas_del_dia_exepcionales_envios` WRITE;
/*!40000 ALTER TABLE `hojas_del_dia_exepcionales_envios` DISABLE KEYS */;
INSERT INTO `hojas_del_dia_exepcionales_envios` VALUES (1,'FAC111'),(1,'FAC222');
/*!40000 ALTER TABLE `hojas_del_dia_exepcionales_envios` ENABLE KEYS */;
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
INSERT INTO `KEYCLOAK_ROLE` VALUES ('029be5cf-c565-4b6d-b87a-cfde88ad29b0','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-consent}','view-consent','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('03480627-ab09-4c49-963c-2282eda92f8f','77fa5bd2-177e-4117-8334-fcfd5b25705c',_binary '','${role_manage-account}','manage-account','master','77fa5bd2-177e-4117-8334-fcfd5b25705c',NULL),('09a06412-2870-42a8-8865-dd1e314661af','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('09c39e33-cc18-4493-b30a-958b5ccb54aa','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','administrador-cliente-rol','administrador-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('0fcc6f83-5b8b-422f-b14d-97ab8de35d15','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_manage-authorization}','manage-authorization','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('10feb00e-b211-4f77-9fb8-4d95c0be84a5','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_manage-realm}','manage-realm','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('12cc4ee0-9194-49d7-bc7b-1309e107e4ce','0ca2e86b-131e-454d-95a7-c124ad72b7cb',_binary '','${role_read-token}','read-token','siglo21','0ca2e86b-131e-454d-95a7-c124ad72b7cb',NULL),('1389ab87-600e-4879-9881-bf577e250fc4','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_query-groups}','query-groups','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('1510f3b8-c1f3-4ab0-84da-757aedae9d68','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_impersonation}','impersonation','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('156f4f68-944c-4c82-8f66-243f865a2738','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('1aa177ad-f764-458b-9c8b-e9b8375815a2','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_impersonation}','impersonation','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('1e712aab-f487-48ba-b8e2-bd6126db7ac4','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('2026770f-d9f4-45c6-ad72-901d39ebf1a4','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-account-links}','manage-account-links','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('20aa9e10-e4d1-49db-8581-439b2e31fcb6','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_manage-users}','manage-users','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('26084389-cab9-45fa-93ea-66f47fcdbbd1','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','vendedor-cliente-rol','vendedor-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('285bf1b2-c1b4-4581-a161-bd23ac640baa','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-identity-providers}','manage-identity-providers','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('3252836a-b7c7-4d77-ac46-ac0892eef0d8','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_view-identity-providers}','view-identity-providers','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('345907e8-7f50-43f5-9c81-624da4d4942b','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-realm}','manage-realm','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('3776bb90-3e91-40a0-9693-6a6146147291','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_create-client}','create-client','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('3f8639de-b691-4cad-b98a-b663ed83ed70','77fa5bd2-177e-4117-8334-fcfd5b25705c',_binary '','${role_view-applications}','view-applications','master','77fa5bd2-177e-4117-8334-fcfd5b25705c',NULL),('48533797-37fb-479c-b4aa-4f054faed6ac','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-users}','manage-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('4c22c3b7-e006-4413-a884-e7811787019b','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_query-groups}','query-groups','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('4c9d4449-f7b2-44b6-ae9f-d3441dc786df','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_query-clients}','query-clients','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('4f7a138b-bac3-4bf0-b673-e89ff3de600d','77fa5bd2-177e-4117-8334-fcfd5b25705c',_binary '','${role_delete-account}','delete-account','master','77fa5bd2-177e-4117-8334-fcfd5b25705c',NULL),('54c74d8d-3d55-42aa-a7ae-6c3f5a46f436','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('54d5c122-1802-4139-b68d-e2cec2facbb8','siglo21',_binary '\0','adminitrador de rol realm','administrador','siglo21',NULL,NULL),('55c43002-4c16-49ef-87a5-30deaa22314b','siglo21',_binary '\0','${role_default-roles}','default-roles-siglo21','siglo21',NULL,NULL),('5d43716f-3ca5-48da-9d7d-739f529096dd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-clients}','manage-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('5dd78b39-9d2f-4619-b849-811cf7e93cc3','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_query-users}','query-users','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('5f659f96-133d-4975-9b25-d997895543bb','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('61de6b38-c7ee-4258-b9f4-6deb8c558e17','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-applications}','view-applications','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('66f580be-b401-4dbf-933c-dd88d9b62f34','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_manage-clients}','manage-clients','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('6d60b537-0bf2-4ce8-8407-4474e74dc433','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_view-authorization}','view-authorization','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('6fbe980e-1f31-4b9c-b4ef-78ab3e44fb34','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_view-events}','view-events','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('70d0fe77-e963-453b-935e-6984d04c3ea2','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-consent}','manage-consent','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('70f24e40-1b8a-48cd-bc86-ef8b51f7a77a','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_manage-authorization}','manage-authorization','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('7460cf09-2886-4829-bcd0-5ccaa42dbd57','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-authorization}','manage-authorization','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('75b816a1-3b66-4c03-b75a-8b772946c711','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_manage-events}','manage-events','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('769dfbaf-5b5b-4098-8535-28c3a5b64a53','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_view-realm}','view-realm','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('7a242c93-e0be-4cf0-a915-17bfa1b52aef','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_view-realm}','view-realm','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('7a33b7d5-afac-418a-ba38-3a4d696d4cbe','4fa2d49e-051c-428b-968b-8a7110abb0ba',_binary '','repartidor-cliente-rol','repartidor-cliente-rol','siglo21','4fa2d49e-051c-428b-968b-8a7110abb0ba',NULL),('7d2dda07-06ff-4d4f-89d3-820498596b27','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-groups}','query-groups','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('7ecb743e-7590-4dff-b976-8be9d4616840','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_query-clients}','query-clients','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('852ec621-9897-49dc-894a-9f8b6bb8c865','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_manage-events}','manage-events','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('8748520e-df8c-448c-b03a-f7e53b6bf973','siglo21',_binary '\0','${role_offline-access}','offline_access','siglo21',NULL,NULL),('8d4c7712-2656-417f-9d4e-1dac53d10b8e','c5b43390-a534-4260-91e2-52c6c8446492',_binary '','${role_read-token}','read-token','master','c5b43390-a534-4260-91e2-52c6c8446492',NULL),('8f22b474-5230-47a1-82d1-922f73a786e9','siglo21',_binary '\0','${role_uma_authorization}','uma_authorization','siglo21',NULL,NULL),('9165a689-5246-4823-9841-fff70cd46524','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_view-users}','view-users','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('92e0c80c-ed04-427a-89da-e936808b8d09','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_manage-account}','manage-account','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('95592080-b3d6-4da3-ac55-6b941b6b9f0d','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_view-users}','view-users','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('998e7528-d5d8-4391-bd44-317a7f28b31b','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_manage-clients}','manage-clients','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('9a40d8bc-6633-4523-a01e-09a8d6a0c29f','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_create-client}','create-client','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('9fc33558-5ee9-4cf1-9cbd-159def53570f','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','siglo21',_binary '\0','','vendedor','siglo21',NULL,NULL),('a2965ee9-ee62-43d8-b08f-4bc0394e2d1b','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('a2a6d51e-21d2-43af-8939-bc8358d562b8','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_impersonation}','impersonation','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a61c72b4-ce66-4b3c-b2a5-92b1cdb41afd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_realm-admin}','realm-admin','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a633afdc-9331-4419-953e-69c90773f17e','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-users}','query-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('a8cad8d4-5666-40c4-b7ae-a200dd2a6f23','77fa5bd2-177e-4117-8334-fcfd5b25705c',_binary '','${role_manage-consent}','manage-consent','master','77fa5bd2-177e-4117-8334-fcfd5b25705c',NULL),('b156cf0c-8fa3-48c9-a5aa-897507c0deed','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_view-clients}','view-clients','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('b2e6023e-908e-4769-979c-1f13be4a48b7','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_query-realms}','query-realms','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('b41db9d2-074c-488f-9b53-4f32e82dff3c','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_manage-events}','manage-events','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('b4818dfb-4434-41fa-9600-434ca3f5442f','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-users}','view-users','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b54bfb8c-12c5-4d91-8d17-8913208e6765','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_create-client}','create-client','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b5d2075c-edf2-4415-b121-87b1bd4286f7','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-events}','view-events','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('b746b15e-a146-4fa1-a2dd-f10d7a0ff491','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_manage-users}','manage-users','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('b9839a7b-b519-4c27-bf9f-396e5bb51bb2','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-authorization}','view-authorization','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('c969738a-7acb-4fd1-a8b3-0edac7d3ccdc','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_view-events}','view-events','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('ca0b5753-e677-420d-bb53-0fc590c08c1e','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-realm}','view-realm','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('cc3c52d9-4afa-4b3e-8761-7b023c64d466','77fa5bd2-177e-4117-8334-fcfd5b25705c',_binary '','${role_manage-account-links}','manage-account-links','master','77fa5bd2-177e-4117-8334-fcfd5b25705c',NULL),('cfecd3e0-ddda-43ec-bdea-38e38a426e49','77fa5bd2-177e-4117-8334-fcfd5b25705c',_binary '','${role_view-consent}','view-consent','master','77fa5bd2-177e-4117-8334-fcfd5b25705c',NULL),('d118260b-b1fe-41b8-83e3-48f76748d0fc','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-clients}','view-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d3778b1e-9b1d-48bb-b9e1-4e3b87c69881','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_query-users}','query-users','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('d5db4cce-2fa2-413f-9cbe-37d9ff2af6cf','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-clients}','query-clients','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d7263fd7-1aa8-471a-a562-2576e6a886dd','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_query-realms}','query-realms','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('d8d693d5-a021-427f-8151-fad696e79b50','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_delete-account}','delete-account','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('de6fd89e-5ecd-400d-a56a-15353e307627','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_view-identity-providers}','view-identity-providers','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('dea41763-6811-47a0-a1e9-0652e7487c4f','siglo21',_binary '\0',NULL,'repartidor','siglo21',NULL,NULL),('e35f75cd-17bd-44ee-be4a-bf292b27f9b0','77fa5bd2-177e-4117-8334-fcfd5b25705c',_binary '','${role_view-profile}','view-profile','master','77fa5bd2-177e-4117-8334-fcfd5b25705c',NULL),('e3ceeaa0-e231-4bbc-97f4-2cd81ea1c6c3','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_query-realms}','query-realms','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL),('e9f3eac4-721e-4746-8e53-8f9e8b855b79','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_view-clients}','view-clients','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('ea206ccd-5185-4846-8e4d-a63219b70a4a','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',_binary '','${role_view-authorization}','view-authorization','master','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',NULL),('f054da5a-1733-4542-b8da-4ba49f1b89ce','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',_binary '','${role_view-identity-providers}','view-identity-providers','siglo21','c6b540d9-5fd3-40ea-a2a9-0050ddb65206',NULL),('f1a73bfd-e4f4-4346-bf47-0e92b3941990','54b4493f-4dc6-46ec-a697-a77e8977899c',_binary '','${role_view-profile}','view-profile','siglo21','54b4493f-4dc6-46ec-a697-a77e8977899c',NULL),('fd0ec05f-d27d-4172-a18a-b1c78559c755','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',_binary '','${role_manage-realm}','manage-realm','master','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',NULL);
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
INSERT INTO `MIGRATION_MODEL` VALUES ('jvodf','16.1.1',1701695418);
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','openid-connect','oidc-usermodel-property-mapper',NULL,'313cd6d5-afa3-4d09-bec6-8e059c9718c3'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'80a98201-a009-4f95-a8d9-67b46623f54d'),('13d1e141-77af-496a-862f-7f68ceee4460','username','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('140d2891-6528-470a-a3c8-452e7e83f693','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'d4fe8411-0238-43d9-8e9a-e59fcc652557'),('17b080be-49b5-4046-918b-431bdf551b67','audience resolve','openid-connect','oidc-audience-resolve-mapper','30cf30bd-693f-4790-bcd9-7d0b90bb8d5a',NULL),('1899b95c-44da-4add-abea-6885c7648271','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'28963099-19d3-4521-a02f-976d9671e893'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('1eae7d54-eb61-4195-bd76-14f21b02bbfd','role list','saml','saml-role-list-mapper',NULL,'67593354-2d39-40af-aafc-d56bb75171db'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('22cf6251-f107-457a-96d4-d80fff041fbd','username','openid-connect','oidc-usermodel-property-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('282882c2-b3c3-440b-9ce0-545c2372a332','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('29438da0-315c-45aa-9061-7746502f6008','address','openid-connect','oidc-address-mapper',NULL,'da127315-5241-4a8f-a46a-6bea0de8925e'),('2f2ee5a4-d0ce-424e-ad87-3b66d0127930','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'d4fe8411-0238-43d9-8e9a-e59fcc652557'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'313cd6d5-afa3-4d09-bec6-8e059c9718c3'),('315f2373-fc65-47c5-b8a9-a58b4d22fa77','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('3db0c4ab-def4-4de6-928a-7314c7676005','locale','openid-connect','oidc-usermodel-attribute-mapper','54cff855-78e3-4b1a-8fa0-81596b6804d4',NULL),('408ff676-2168-47b8-9899-ef53064efc73','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e4e97c99-0888-4df6-adbf-13b51f3be080'),('421eb319-5c09-4ff7-9692-7c2b420532cd','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'2adf4563-1add-4971-8bd6-56bad82c7c29'),('432acee5-836c-44e0-8f8a-6ab765801d1f','role list','saml','saml-role-list-mapper',NULL,'b229e7fc-3666-4f8f-b02d-0f24dc04e851'),('44b34dfd-defa-4a95-aa49-8afce7480262','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('4ecf8b64-a240-48bc-82b8-c6ffe238b309','address','openid-connect','oidc-address-mapper',NULL,'7063f6d9-553e-47e3-a709-6dbf3cc3db10'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('60595c63-8d9a-4eaa-a0e1-d10f25c1c7a1','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('6fcdea24-b0d3-42e0-bcc8-e3b72bb8eca1','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('734ebc5d-95d1-496e-9952-17066ad99f50','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('797b7d5f-f25c-406d-9fe5-44626cbdf90a','audience resolve','openid-connect','oidc-audience-resolve-mapper','07a0fe8d-fcfa-40d3-9b3c-78757106c27c',NULL),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','openid-connect','oidc-usermodel-attribute-mapper','42ce5f39-f315-496d-881f-7de13ac3ae08',NULL),('874cfa64-4ead-4591-b389-5681dc18986c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('8880efab-264e-4a9f-8c11-cc4db09625a1','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('8c094a13-b741-432a-871a-348bf33dd25b','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'5ab15083-b474-411a-8c86-92cf6857dd42'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('9300b015-b40a-4d5f-97c4-69f725b7e8f3','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('944ac98f-42ce-4568-8e4e-de1595524b3d','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('9820a608-341e-49e1-b94c-3126201f7dc0','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('a51cd5c4-c532-4f28-9821-df862d2bf713','full name','openid-connect','oidc-full-name-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('a79df7ff-2df8-46f0-a62e-a16c1379432c','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('a87cb8be-1a8c-4b2a-9f5c-e53782684b4e','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'d4fe8411-0238-43d9-8e9a-e59fcc652557'),('aafc3d9a-ada5-4365-bff7-7c1b5702fa68','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('ae4f309c-9d4b-49a3-94f4-2dd5e7e11e17','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'5ab15083-b474-411a-8c86-92cf6857dd42'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','full name','openid-connect','oidc-full-name-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('bc99959b-7558-4797-b663-39676e5935b1','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'80a98201-a009-4f95-a8d9-67b46623f54d'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'279791da-86fa-4f67-84c7-b8f250adbcf1'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'28963099-19d3-4521-a02f-976d9671e893'),('d8951284-ffd8-4f4f-9f1b-94ac177b203d','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'b39fe518-d02f-4eac-942b-eeddf878c80f'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'ab34af5f-b1a2-42b9-90dc-89a50790890e'),('e614f547-faf0-4a7a-875a-5a8b3e6280a5','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'e3a0c811-fbe6-44dd-bfd8-a1ac8d0e3034'),('f2ed8788-f58b-4aa1-9b67-1e2b5d99d073','email','openid-connect','oidc-usermodel-property-mapper',NULL,'2adf4563-1add-4971-8bd6-56bad82c7c29'),('f33b6626-8b5a-4298-902b-411e8c834f40','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e4e97c99-0888-4df6-adbf-13b51f3be080'),('f927a7ca-8f39-4b62-affb-3be9e91cc86f','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52'),('fa57fb31-9f15-4bd1-b1d3-8e3217b7467b','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1bb67913-9995-497e-89af-945150f89f52');
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','access.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','claim.name'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','id.token.claim'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','String','jsonType.label'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','email','user.attribute'),('0642da1a-15e5-4b99-ae52-952bfcb5930d','true','userinfo.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','access.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middle_name','claim.name'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','id.token.claim'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','String','jsonType.label'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','middleName','user.attribute'),('073baf49-ea3f-4e9e-8230-9e55aee69a4c','true','userinfo.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','access.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','upn','claim.name'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','id.token.claim'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','String','jsonType.label'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','username','user.attribute'),('0b7232a1-2a18-4e09-86c2-dce7fb1f1e8a','true','userinfo.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','true','access.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','preferred_username','claim.name'),('13d1e141-77af-496a-862f-7f68ceee4460','true','id.token.claim'),('13d1e141-77af-496a-862f-7f68ceee4460','String','jsonType.label'),('13d1e141-77af-496a-862f-7f68ceee4460','username','user.attribute'),('13d1e141-77af-496a-862f-7f68ceee4460','true','userinfo.token.claim'),('140d2891-6528-470a-a3c8-452e7e83f693','true','access.token.claim'),('140d2891-6528-470a-a3c8-452e7e83f693','resource_access.${client_id}.roles','claim.name'),('140d2891-6528-470a-a3c8-452e7e83f693','String','jsonType.label'),('140d2891-6528-470a-a3c8-452e7e83f693','true','multivalued'),('140d2891-6528-470a-a3c8-452e7e83f693','foo','user.attribute'),('1899b95c-44da-4add-abea-6885c7648271','true','access.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','phone_number_verified','claim.name'),('1899b95c-44da-4add-abea-6885c7648271','true','id.token.claim'),('1899b95c-44da-4add-abea-6885c7648271','boolean','jsonType.label'),('1899b95c-44da-4add-abea-6885c7648271','phoneNumberVerified','user.attribute'),('1899b95c-44da-4add-abea-6885c7648271','true','userinfo.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','access.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','claim.name'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','id.token.claim'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','String','jsonType.label'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','gender','user.attribute'),('1dbeb72b-d22e-4ce7-80e8-cadd90d56110','true','userinfo.token.claim'),('1eae7d54-eb61-4195-bd76-14f21b02bbfd','Role','attribute.name'),('1eae7d54-eb61-4195-bd76-14f21b02bbfd','Basic','attribute.nameformat'),('1eae7d54-eb61-4195-bd76-14f21b02bbfd','false','single'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','access.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','given_name','claim.name'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','id.token.claim'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','String','jsonType.label'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','firstName','user.attribute'),('20605baa-7af4-461b-bc1f-ae6f1b5d59fc','true','userinfo.token.claim'),('22cf6251-f107-457a-96d4-d80fff041fbd','true','access.token.claim'),('22cf6251-f107-457a-96d4-d80fff041fbd','preferred_username','claim.name'),('22cf6251-f107-457a-96d4-d80fff041fbd','true','id.token.claim'),('22cf6251-f107-457a-96d4-d80fff041fbd','String','jsonType.label'),('22cf6251-f107-457a-96d4-d80fff041fbd','username','user.attribute'),('22cf6251-f107-457a-96d4-d80fff041fbd','true','userinfo.token.claim'),('282882c2-b3c3-440b-9ce0-545c2372a332','true','access.token.claim'),('282882c2-b3c3-440b-9ce0-545c2372a332','birthdate','claim.name'),('282882c2-b3c3-440b-9ce0-545c2372a332','true','id.token.claim'),('282882c2-b3c3-440b-9ce0-545c2372a332','String','jsonType.label'),('282882c2-b3c3-440b-9ce0-545c2372a332','birthdate','user.attribute'),('282882c2-b3c3-440b-9ce0-545c2372a332','true','userinfo.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','true','access.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','true','id.token.claim'),('29438da0-315c-45aa-9061-7746502f6008','country','user.attribute.country'),('29438da0-315c-45aa-9061-7746502f6008','formatted','user.attribute.formatted'),('29438da0-315c-45aa-9061-7746502f6008','locality','user.attribute.locality'),('29438da0-315c-45aa-9061-7746502f6008','postal_code','user.attribute.postal_code'),('29438da0-315c-45aa-9061-7746502f6008','region','user.attribute.region'),('29438da0-315c-45aa-9061-7746502f6008','street','user.attribute.street'),('29438da0-315c-45aa-9061-7746502f6008','true','userinfo.token.claim'),('2f2ee5a4-d0ce-424e-ad87-3b66d0127930','true','access.token.claim'),('2f2ee5a4-d0ce-424e-ad87-3b66d0127930','realm_access.roles','claim.name'),('2f2ee5a4-d0ce-424e-ad87-3b66d0127930','String','jsonType.label'),('2f2ee5a4-d0ce-424e-ad87-3b66d0127930','true','multivalued'),('2f2ee5a4-d0ce-424e-ad87-3b66d0127930','foo','user.attribute'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','access.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','email_verified','claim.name'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','id.token.claim'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','boolean','jsonType.label'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','emailVerified','user.attribute'),('3069f87c-3142-4e56-b26c-f75f7fbcf45c','true','userinfo.token.claim'),('315f2373-fc65-47c5-b8a9-a58b4d22fa77','true','access.token.claim'),('315f2373-fc65-47c5-b8a9-a58b4d22fa77','middle_name','claim.name'),('315f2373-fc65-47c5-b8a9-a58b4d22fa77','true','id.token.claim'),('315f2373-fc65-47c5-b8a9-a58b4d22fa77','String','jsonType.label'),('315f2373-fc65-47c5-b8a9-a58b4d22fa77','middleName','user.attribute'),('315f2373-fc65-47c5-b8a9-a58b4d22fa77','true','userinfo.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','access.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','claim.name'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','id.token.claim'),('323a1bb3-292e-4f77-b82a-a330d61f664c','String','jsonType.label'),('323a1bb3-292e-4f77-b82a-a330d61f664c','profile','user.attribute'),('323a1bb3-292e-4f77-b82a-a330d61f664c','true','userinfo.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','access.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','claim.name'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','id.token.claim'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','String','jsonType.label'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','picture','user.attribute'),('3c024ae8-47d4-4bbd-a4ec-c34dafa62259','true','userinfo.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','access.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','claim.name'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','id.token.claim'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','String','jsonType.label'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','birthdate','user.attribute'),('3d5db4a7-cbc0-40b5-9a31-9c123c155a0f','true','userinfo.token.claim'),('3db0c4ab-def4-4de6-928a-7314c7676005','true','access.token.claim'),('3db0c4ab-def4-4de6-928a-7314c7676005','locale','claim.name'),('3db0c4ab-def4-4de6-928a-7314c7676005','true','id.token.claim'),('3db0c4ab-def4-4de6-928a-7314c7676005','String','jsonType.label'),('3db0c4ab-def4-4de6-928a-7314c7676005','locale','user.attribute'),('3db0c4ab-def4-4de6-928a-7314c7676005','true','userinfo.token.claim'),('408ff676-2168-47b8-9899-ef53064efc73','true','access.token.claim'),('408ff676-2168-47b8-9899-ef53064efc73','phone_number','claim.name'),('408ff676-2168-47b8-9899-ef53064efc73','true','id.token.claim'),('408ff676-2168-47b8-9899-ef53064efc73','String','jsonType.label'),('408ff676-2168-47b8-9899-ef53064efc73','phoneNumber','user.attribute'),('408ff676-2168-47b8-9899-ef53064efc73','true','userinfo.token.claim'),('421eb319-5c09-4ff7-9692-7c2b420532cd','true','access.token.claim'),('421eb319-5c09-4ff7-9692-7c2b420532cd','email_verified','claim.name'),('421eb319-5c09-4ff7-9692-7c2b420532cd','true','id.token.claim'),('421eb319-5c09-4ff7-9692-7c2b420532cd','boolean','jsonType.label'),('421eb319-5c09-4ff7-9692-7c2b420532cd','emailVerified','user.attribute'),('421eb319-5c09-4ff7-9692-7c2b420532cd','true','userinfo.token.claim'),('432acee5-836c-44e0-8f8a-6ab765801d1f','Role','attribute.name'),('432acee5-836c-44e0-8f8a-6ab765801d1f','Basic','attribute.nameformat'),('432acee5-836c-44e0-8f8a-6ab765801d1f','false','single'),('44b34dfd-defa-4a95-aa49-8afce7480262','true','access.token.claim'),('44b34dfd-defa-4a95-aa49-8afce7480262','locale','claim.name'),('44b34dfd-defa-4a95-aa49-8afce7480262','true','id.token.claim'),('44b34dfd-defa-4a95-aa49-8afce7480262','String','jsonType.label'),('44b34dfd-defa-4a95-aa49-8afce7480262','locale','user.attribute'),('44b34dfd-defa-4a95-aa49-8afce7480262','true','userinfo.token.claim'),('4ecf8b64-a240-48bc-82b8-c6ffe238b309','true','access.token.claim'),('4ecf8b64-a240-48bc-82b8-c6ffe238b309','true','id.token.claim'),('4ecf8b64-a240-48bc-82b8-c6ffe238b309','country','user.attribute.country'),('4ecf8b64-a240-48bc-82b8-c6ffe238b309','formatted','user.attribute.formatted'),('4ecf8b64-a240-48bc-82b8-c6ffe238b309','locality','user.attribute.locality'),('4ecf8b64-a240-48bc-82b8-c6ffe238b309','postal_code','user.attribute.postal_code'),('4ecf8b64-a240-48bc-82b8-c6ffe238b309','region','user.attribute.region'),('4ecf8b64-a240-48bc-82b8-c6ffe238b309','street','user.attribute.street'),('4ecf8b64-a240-48bc-82b8-c6ffe238b309','true','userinfo.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','access.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','claim.name'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','id.token.claim'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','String','jsonType.label'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','website','user.attribute'),('5efa02e5-9556-46ef-85fc-3da5b9f54dc8','true','userinfo.token.claim'),('60595c63-8d9a-4eaa-a0e1-d10f25c1c7a1','true','access.token.claim'),('60595c63-8d9a-4eaa-a0e1-d10f25c1c7a1','zoneinfo','claim.name'),('60595c63-8d9a-4eaa-a0e1-d10f25c1c7a1','true','id.token.claim'),('60595c63-8d9a-4eaa-a0e1-d10f25c1c7a1','String','jsonType.label'),('60595c63-8d9a-4eaa-a0e1-d10f25c1c7a1','zoneinfo','user.attribute'),('60595c63-8d9a-4eaa-a0e1-d10f25c1c7a1','true','userinfo.token.claim'),('6fcdea24-b0d3-42e0-bcc8-e3b72bb8eca1','true','access.token.claim'),('6fcdea24-b0d3-42e0-bcc8-e3b72bb8eca1','profile','claim.name'),('6fcdea24-b0d3-42e0-bcc8-e3b72bb8eca1','true','id.token.claim'),('6fcdea24-b0d3-42e0-bcc8-e3b72bb8eca1','String','jsonType.label'),('6fcdea24-b0d3-42e0-bcc8-e3b72bb8eca1','profile','user.attribute'),('6fcdea24-b0d3-42e0-bcc8-e3b72bb8eca1','true','userinfo.token.claim'),('734ebc5d-95d1-496e-9952-17066ad99f50','true','access.token.claim'),('734ebc5d-95d1-496e-9952-17066ad99f50','realm_access.roles','claim.name'),('734ebc5d-95d1-496e-9952-17066ad99f50','String','jsonType.label'),('734ebc5d-95d1-496e-9952-17066ad99f50','true','multivalued'),('734ebc5d-95d1-496e-9952-17066ad99f50','foo','user.attribute'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','access.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','claim.name'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','id.token.claim'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','String','jsonType.label'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','locale','user.attribute'),('7b87fdef-6045-425d-8ee0-b3bab8892b84','true','userinfo.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','true','access.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','claim.name'),('874cfa64-4ead-4591-b389-5681dc18986c','true','id.token.claim'),('874cfa64-4ead-4591-b389-5681dc18986c','String','jsonType.label'),('874cfa64-4ead-4591-b389-5681dc18986c','locale','user.attribute'),('874cfa64-4ead-4591-b389-5681dc18986c','true','userinfo.token.claim'),('8880efab-264e-4a9f-8c11-cc4db09625a1','true','access.token.claim'),('8880efab-264e-4a9f-8c11-cc4db09625a1','updated_at','claim.name'),('8880efab-264e-4a9f-8c11-cc4db09625a1','true','id.token.claim'),('8880efab-264e-4a9f-8c11-cc4db09625a1','String','jsonType.label'),('8880efab-264e-4a9f-8c11-cc4db09625a1','updatedAt','user.attribute'),('8880efab-264e-4a9f-8c11-cc4db09625a1','true','userinfo.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','access.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','claim.name'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','id.token.claim'),('8c075926-d0c0-4414-ad11-9587f0caf590','String','jsonType.label'),('8c075926-d0c0-4414-ad11-9587f0caf590','nickname','user.attribute'),('8c075926-d0c0-4414-ad11-9587f0caf590','true','userinfo.token.claim'),('8c094a13-b741-432a-871a-348bf33dd25b','true','access.token.claim'),('8c094a13-b741-432a-871a-348bf33dd25b','groups','claim.name'),('8c094a13-b741-432a-871a-348bf33dd25b','true','id.token.claim'),('8c094a13-b741-432a-871a-348bf33dd25b','String','jsonType.label'),('8c094a13-b741-432a-871a-348bf33dd25b','true','multivalued'),('8c094a13-b741-432a-871a-348bf33dd25b','foo','user.attribute'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','access.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updated_at','claim.name'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','id.token.claim'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','String','jsonType.label'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','updatedAt','user.attribute'),('9154ae06-64f7-48c6-87f2-8be060e6f4b9','true','userinfo.token.claim'),('9300b015-b40a-4d5f-97c4-69f725b7e8f3','true','access.token.claim'),('9300b015-b40a-4d5f-97c4-69f725b7e8f3','given_name','claim.name'),('9300b015-b40a-4d5f-97c4-69f725b7e8f3','true','id.token.claim'),('9300b015-b40a-4d5f-97c4-69f725b7e8f3','String','jsonType.label'),('9300b015-b40a-4d5f-97c4-69f725b7e8f3','firstName','user.attribute'),('9300b015-b40a-4d5f-97c4-69f725b7e8f3','true','userinfo.token.claim'),('9820a608-341e-49e1-b94c-3126201f7dc0','true','access.token.claim'),('9820a608-341e-49e1-b94c-3126201f7dc0','picture','claim.name'),('9820a608-341e-49e1-b94c-3126201f7dc0','true','id.token.claim'),('9820a608-341e-49e1-b94c-3126201f7dc0','String','jsonType.label'),('9820a608-341e-49e1-b94c-3126201f7dc0','picture','user.attribute'),('9820a608-341e-49e1-b94c-3126201f7dc0','true','userinfo.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','access.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','family_name','claim.name'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','id.token.claim'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','String','jsonType.label'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','lastName','user.attribute'),('a2e7e0b4-c534-41bf-bedd-6a919d0ce564','true','userinfo.token.claim'),('a51cd5c4-c532-4f28-9821-df862d2bf713','true','access.token.claim'),('a51cd5c4-c532-4f28-9821-df862d2bf713','true','id.token.claim'),('a51cd5c4-c532-4f28-9821-df862d2bf713','true','userinfo.token.claim'),('a79df7ff-2df8-46f0-a62e-a16c1379432c','true','access.token.claim'),('a79df7ff-2df8-46f0-a62e-a16c1379432c','nickname','claim.name'),('a79df7ff-2df8-46f0-a62e-a16c1379432c','true','id.token.claim'),('a79df7ff-2df8-46f0-a62e-a16c1379432c','String','jsonType.label'),('a79df7ff-2df8-46f0-a62e-a16c1379432c','nickname','user.attribute'),('a79df7ff-2df8-46f0-a62e-a16c1379432c','true','userinfo.token.claim'),('aafc3d9a-ada5-4365-bff7-7c1b5702fa68','true','access.token.claim'),('aafc3d9a-ada5-4365-bff7-7c1b5702fa68','family_name','claim.name'),('aafc3d9a-ada5-4365-bff7-7c1b5702fa68','true','id.token.claim'),('aafc3d9a-ada5-4365-bff7-7c1b5702fa68','String','jsonType.label'),('aafc3d9a-ada5-4365-bff7-7c1b5702fa68','lastName','user.attribute'),('aafc3d9a-ada5-4365-bff7-7c1b5702fa68','true','userinfo.token.claim'),('ae4f309c-9d4b-49a3-94f4-2dd5e7e11e17','true','access.token.claim'),('ae4f309c-9d4b-49a3-94f4-2dd5e7e11e17','upn','claim.name'),('ae4f309c-9d4b-49a3-94f4-2dd5e7e11e17','true','id.token.claim'),('ae4f309c-9d4b-49a3-94f4-2dd5e7e11e17','String','jsonType.label'),('ae4f309c-9d4b-49a3-94f4-2dd5e7e11e17','username','user.attribute'),('ae4f309c-9d4b-49a3-94f4-2dd5e7e11e17','true','userinfo.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','access.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','id.token.claim'),('b597fc9b-086c-42d2-8442-bf8a5cfabe56','true','userinfo.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','true','access.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','groups','claim.name'),('bc99959b-7558-4797-b663-39676e5935b1','true','id.token.claim'),('bc99959b-7558-4797-b663-39676e5935b1','String','jsonType.label'),('bc99959b-7558-4797-b663-39676e5935b1','true','multivalued'),('bc99959b-7558-4797-b663-39676e5935b1','foo','user.attribute'),('bc99959b-7558-4797-b663-39676e5935b1','true','userinfo.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','access.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','claim.name'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','id.token.claim'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','String','jsonType.label'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','zoneinfo','user.attribute'),('bf8e88ca-ce1d-4d13-859f-31bd016d90c4','true','userinfo.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','access.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phone_number','claim.name'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','id.token.claim'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','String','jsonType.label'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','phoneNumber','user.attribute'),('c5a4e3e3-3c03-4920-90f4-c462b79d6505','true','userinfo.token.claim'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','true','access.token.claim'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','resource_access.${client_id}.roles','claim.name'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','String','jsonType.label'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','true','multivalued'),('dffcb07e-dd78-4dac-9ea4-980e04eb0bcd','foo','user.attribute'),('f2ed8788-f58b-4aa1-9b67-1e2b5d99d073','true','access.token.claim'),('f2ed8788-f58b-4aa1-9b67-1e2b5d99d073','email','claim.name'),('f2ed8788-f58b-4aa1-9b67-1e2b5d99d073','true','id.token.claim'),('f2ed8788-f58b-4aa1-9b67-1e2b5d99d073','String','jsonType.label'),('f2ed8788-f58b-4aa1-9b67-1e2b5d99d073','email','user.attribute'),('f2ed8788-f58b-4aa1-9b67-1e2b5d99d073','true','userinfo.token.claim'),('f33b6626-8b5a-4298-902b-411e8c834f40','true','access.token.claim'),('f33b6626-8b5a-4298-902b-411e8c834f40','phone_number_verified','claim.name'),('f33b6626-8b5a-4298-902b-411e8c834f40','true','id.token.claim'),('f33b6626-8b5a-4298-902b-411e8c834f40','boolean','jsonType.label'),('f33b6626-8b5a-4298-902b-411e8c834f40','phoneNumberVerified','user.attribute'),('f33b6626-8b5a-4298-902b-411e8c834f40','true','userinfo.token.claim'),('f927a7ca-8f39-4b62-affb-3be9e91cc86f','true','access.token.claim'),('f927a7ca-8f39-4b62-affb-3be9e91cc86f','gender','claim.name'),('f927a7ca-8f39-4b62-affb-3be9e91cc86f','true','id.token.claim'),('f927a7ca-8f39-4b62-affb-3be9e91cc86f','String','jsonType.label'),('f927a7ca-8f39-4b62-affb-3be9e91cc86f','gender','user.attribute'),('f927a7ca-8f39-4b62-affb-3be9e91cc86f','true','userinfo.token.claim'),('fa57fb31-9f15-4bd1-b1d3-8e3217b7467b','true','access.token.claim'),('fa57fb31-9f15-4bd1-b1d3-8e3217b7467b','website','claim.name'),('fa57fb31-9f15-4bd1-b1d3-8e3217b7467b','true','id.token.claim'),('fa57fb31-9f15-4bd1-b1d3-8e3217b7467b','String','jsonType.label'),('fa57fb31-9f15-4bd1-b1d3-8e3217b7467b','website','user.attribute'),('fa57fb31-9f15-4bd1-b1d3-8e3217b7467b','true','userinfo.token.claim');
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
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','3e7a542c-ed96-424e-b47e-d95da1a3cb1c',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','2fd4683b-e9e6-407f-a642-f58f7f74dc37','2146bf5e-2a05-46c1-a614-d129e5d0a6ac','1e1e22be-93eb-4799-afcf-fb2d4b2ac2a2','5996a903-160c-45ee-a5f0-74f692bde153','bb4d27b7-46a7-413a-8fbe-6244f9745d6a',2592000,_binary '\0',900,_binary '',_binary '\0','2b31b185-6e41-40e1-865c-d64247aafdfd',0,_binary '\0',0,0,'1e712aab-f487-48ba-b8e2-bd6126db7ac4'),('siglo21',60,300,300,'keycloak','keycloak','keycloak',_binary '',_binary '\0',0,'keywind','siglo21',0,NULL,_binary '\0',_binary '',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','e0b0caaf-494f-4f17-ba6a-084fdb8fc8e2',1800,_binary '','es',_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','afd5c3b4-849a-41b2-9913-8dffde39e198','e07b9d2b-6a9c-4149-9a11-7b967e032495','59c28aee-b1ff-4487-b001-a083eeb6b33a','5f370d0b-c94d-4c17-81e7-0ba6b78fb457','9e710bd0-c1c9-41b6-8859-820a71f06a3a',2592000,_binary '\0',900,_binary '',_binary '\0','14b3b150-3247-42cc-80e0-7a61722a1e0b',0,_binary '\0',0,0,'55c43002-4c16-49ef-87a5-30deaa22314b');
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
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','siglo21','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.contentSecurityPolicyReportOnly','siglo21',''),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','siglo21','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xContentTypeOptions','siglo21','nosniff'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xFrameOptions','siglo21','SAMEORIGIN'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xRobotsTag','siglo21','none'),('_browser_header.xXSSProtection','master','1; mode=block'),('_browser_header.xXSSProtection','siglo21','1; mode=block'),('actionTokenGeneratedByAdminLifespan','siglo21','43200'),('actionTokenGeneratedByUserLifespan','siglo21','300'),('bruteForceProtected','master','false'),('bruteForceProtected','siglo21','true'),('cibaAuthRequestedUserHint','siglo21','login_hint'),('cibaBackchannelTokenDeliveryMode','siglo21','poll'),('cibaExpiresIn','siglo21','120'),('cibaInterval','siglo21','5'),('client-policies.policies','siglo21','{\"policies\":[]}'),('client-policies.profiles','siglo21','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','siglo21','0'),('clientOfflineSessionMaxLifespan','siglo21','0'),('clientSessionIdleTimeout','siglo21','0'),('clientSessionMaxLifespan','siglo21','0'),('defaultSignatureAlgorithm','master','RS256'),('defaultSignatureAlgorithm','siglo21','RS256'),('displayName','master','Keycloak'),('displayName','siglo21','Siglo21 Logistica'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','master','30'),('failureFactor','siglo21','3'),('maxDeltaTimeSeconds','master','43200'),('maxDeltaTimeSeconds','siglo21','43200'),('maxFailureWaitSeconds','master','900'),('maxFailureWaitSeconds','siglo21','900'),('minimumQuickLoginWaitSeconds','master','60'),('minimumQuickLoginWaitSeconds','siglo21','60'),('oauth2DeviceCodeLifespan','siglo21','600'),('oauth2DevicePollingInterval','siglo21','5'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespan','siglo21','5184000'),('offlineSessionMaxLifespanEnabled','master','false'),('offlineSessionMaxLifespanEnabled','siglo21','false'),('parRequestUriLifespan','siglo21','60'),('permanentLockout','master','false'),('permanentLockout','siglo21','true'),('quickLoginCheckMilliSeconds','master','1000'),('quickLoginCheckMilliSeconds','siglo21','1000'),('userProfileEnabled','siglo21','false'),('waitIncrementSeconds','master','60'),('waitIncrementSeconds','siglo21','120'),('webAuthnPolicyAttestationConveyancePreference','siglo21','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','siglo21','not specified'),('webAuthnPolicyAuthenticatorAttachment','siglo21','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','siglo21','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','siglo21','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','siglo21','false'),('webAuthnPolicyCreateTimeout','siglo21','0'),('webAuthnPolicyCreateTimeoutPasswordless','siglo21','0'),('webAuthnPolicyRequireResidentKey','siglo21','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','siglo21','not specified'),('webAuthnPolicyRpEntityName','siglo21','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','siglo21','keycloak'),('webAuthnPolicyRpId','siglo21',''),('webAuthnPolicyRpIdPasswordless','siglo21',''),('webAuthnPolicySignatureAlgorithms','siglo21','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','siglo21','ES256'),('webAuthnPolicyUserVerificationRequirement','siglo21','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','siglo21','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_CLIENT`
--

DROP TABLE IF EXISTS `REALM_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_CLIENT` (
  `REALM_ID` varchar(36) DEFAULT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  UNIQUE KEY `UK_M6QGA3RFME47335JY8JXYXH3I` (`CLIENT_ID`),
  KEY `FK_M6QGA3RFME47335JY8JXYXH3I` (`REALM_ID`),
  CONSTRAINT `FK_93S3P0DIUXAWWQQSA528UBY2Q` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_M6QGA3RFME47335JY8JXYXH3I` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_CLIENT`
--

LOCK TABLES `REALM_CLIENT` WRITE;
/*!40000 ALTER TABLE `REALM_CLIENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_CLIENT_TEMPLATE`
--

DROP TABLE IF EXISTS `REALM_CLIENT_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_CLIENT_TEMPLATE` (
  `CLIENT_TEMPLATE_ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_CLIENT_TEMPLATE`
--

LOCK TABLES `REALM_CLIENT_TEMPLATE` WRITE;
/*!40000 ALTER TABLE `REALM_CLIENT_TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_CLIENT_TEMPLATE` ENABLE KEYS */;
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
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `FK_EVUDB1PPW84OXFAX2DRS03ICC` (`REALM_ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
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
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES ('siglo21','ca'),('siglo21','cs'),('siglo21','da'),('siglo21','de'),('siglo21','en'),('siglo21','es'),('siglo21','fr'),('siglo21','hu'),('siglo21','it'),('siglo21','ja'),('siglo21','lt'),('siglo21','nl'),('siglo21','no'),('siglo21','pl'),('siglo21','pt-BR'),('siglo21','ru'),('siglo21','sk'),('siglo21','sv'),('siglo21','tr'),('siglo21','zh-CN');
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
INSERT INTO `REDIRECT_URIS` VALUES ('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','/realms/master/account/*'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','/realms/siglo21/account/*'),('42ce5f39-f315-496d-881f-7de13ac3ae08','/admin/siglo21/console/*'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','http://localhost:3000/*'),('54b4493f-4dc6-46ec-a697-a77e8977899c','/realms/siglo21/account/*'),('54cff855-78e3-4b1a-8fa0-81596b6804d4','/admin/master/console/*'),('77fa5bd2-177e-4117-8334-fcfd5b25705c','/realms/master/account/*');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
INSERT INTO `repartidores` VALUES (1,'García','Juancito'),(2,'Rodríguez','María'),(3,'López','Carlos'),(4,'Martínez','Ana'),(5,'lujan','alberto'),(6,'luna','Facundo'),(7,'herrera','alejo'),(8,'Fuentes','matias'),(9,'perez','jose'),(10,'APELLIDO','PRUEBA'),(11,'apellido','nombrePiola'),(12,'Alonso','Claudio'),(13,'NUEVO','NUEVO'),(14,'APELLIDO','NOMBRE'),(15,'nuevo','nuevo');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('27b4e77a-54e1-4b4a-8838-1b2375ae660a','UPDATE_PASSWORD','Update Password','siglo21',_binary '',_binary '\0','UPDATE_PASSWORD',30),('30e97525-60a7-4bf0-ab53-8f19b43a8f9d','CONFIGURE_TOTP','Configure OTP','siglo21',_binary '',_binary '\0','CONFIGURE_TOTP',10),('4425882f-1945-41db-9fd3-227db3eec939','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('5b961768-df10-4e61-af84-a81144ede934','update_user_locale','Update User Locale','siglo21',_binary '',_binary '\0','update_user_locale',1000),('6cac84b3-3fb3-4887-961b-592db89960c2','VERIFY_EMAIL','Verify Email','siglo21',_binary '',_binary '\0','VERIFY_EMAIL',50),('80235902-232a-4aa5-b49e-27c2177cd742','delete_account','Delete Account','siglo21',_binary '\0',_binary '\0','delete_account',60),('8f8d0b59-1943-4d0d-a4d0-66176af848f6','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('926fe448-0544-4602-8f65-c78191110e08','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('9a38bba0-fe9a-4e9a-9262-1584519e2138','terms_and_conditions','Terms and Conditions','siglo21',_binary '\0',_binary '\0','terms_and_conditions',20),('c019ac8b-9e89-4930-a26f-80ba9ee9326a','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('c71459b6-b511-4b07-9c55-773146fa6f53','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('d18e90e0-b672-44a2-95c6-daf9254755d2','UPDATE_PROFILE','Update Profile','siglo21',_binary '',_binary '\0','UPDATE_PROFILE',40),('da4e3aea-019c-424a-b9f8-65997834a7de','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('ed01754f-b858-4949-92c7-66c4cc79949f','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50);
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
INSERT INTO `SCOPE_MAPPING` VALUES ('07a0fe8d-fcfa-40d3-9b3c-78757106c27c','03480627-ab09-4c49-963c-2282eda92f8f'),('30cf30bd-693f-4790-bcd9-7d0b90bb8d5a','92e0c80c-ed04-427a-89da-e936808b8d09');
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
-- Table structure for table `TEMPLATE_SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `TEMPLATE_SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEMPLATE_SCOPE_MAPPING` (
  `TEMPLATE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEMPLATE_SCOPE_MAPPING`
--

LOCK TABLES `TEMPLATE_SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `TEMPLATE_SCOPE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEMPLATE_SCOPE_MAPPING` ENABLE KEYS */;
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
-- Table structure for table `USER_CONSENT_PROT_MAPPER`
--

DROP TABLE IF EXISTS `USER_CONSENT_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_PROT_MAPPER` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_GRNTCSNT_PRM_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_PROT_MAPPER`
--

LOCK TABLES `USER_CONSENT_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_ROLE`
--

DROP TABLE IF EXISTS `USER_CONSENT_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_ROLE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`ROLE_ID`),
  CONSTRAINT `FK_GRNTCSNT_ROLE_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_ROLE`
--

LOCK TABLES `USER_CONSENT_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_ROLE` ENABLE KEYS */;
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
INSERT INTO `USER_ENTITY` VALUES ('027d26cd-4700-4ff0-afaa-427843c320bf',NULL,'c03103aa-e650-4efe-95c1-e25fdb5a4190',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','alejo.dev',1701695468790,NULL,0),('05f3c932-f234-4cda-ad08-df17c0ba7fe4',NULL,'9d516236-9ba7-4666-baf6-f3770baaaa06',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','vendedor.user',1701695498133,NULL,0),('1c2581ff-6d24-4462-bd9a-c5aa79a402ce',NULL,'ef2f02db-17bf-4fae-8153-6a996accbe06',_binary '\0',_binary '',NULL,NULL,NULL,'siglo21','repartidor.user',1701695514902,NULL,0),('ccee54a4-7637-4cdf-bc95-890eed621451',NULL,'8a2705f7-9763-4b1b-b29c-7f4af70a98a9',_binary '\0',_binary '',NULL,NULL,NULL,'master','administrador',1701695420849,NULL,0);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('54d5c122-1802-4139-b68d-e2cec2facbb8','027d26cd-4700-4ff0-afaa-427843c320bf'),('55c43002-4c16-49ef-87a5-30deaa22314b','027d26cd-4700-4ff0-afaa-427843c320bf'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','027d26cd-4700-4ff0-afaa-427843c320bf'),('dea41763-6811-47a0-a1e9-0652e7487c4f','027d26cd-4700-4ff0-afaa-427843c320bf'),('55c43002-4c16-49ef-87a5-30deaa22314b','05f3c932-f234-4cda-ad08-df17c0ba7fe4'),('9fc4d2d5-abbf-4217-b29e-166882d9ce87','05f3c932-f234-4cda-ad08-df17c0ba7fe4'),('55c43002-4c16-49ef-87a5-30deaa22314b','1c2581ff-6d24-4462-bd9a-c5aa79a402ce'),('dea41763-6811-47a0-a1e9-0652e7487c4f','1c2581ff-6d24-4462-bd9a-c5aa79a402ce'),('0fcc6f83-5b8b-422f-b14d-97ab8de35d15','ccee54a4-7637-4cdf-bc95-890eed621451'),('10feb00e-b211-4f77-9fb8-4d95c0be84a5','ccee54a4-7637-4cdf-bc95-890eed621451'),('1e712aab-f487-48ba-b8e2-bd6126db7ac4','ccee54a4-7637-4cdf-bc95-890eed621451'),('20aa9e10-e4d1-49db-8581-439b2e31fcb6','ccee54a4-7637-4cdf-bc95-890eed621451'),('3252836a-b7c7-4d77-ac46-ac0892eef0d8','ccee54a4-7637-4cdf-bc95-890eed621451'),('3776bb90-3e91-40a0-9693-6a6146147291','ccee54a4-7637-4cdf-bc95-890eed621451'),('4c22c3b7-e006-4413-a884-e7811787019b','ccee54a4-7637-4cdf-bc95-890eed621451'),('66f580be-b401-4dbf-933c-dd88d9b62f34','ccee54a4-7637-4cdf-bc95-890eed621451'),('6fbe980e-1f31-4b9c-b4ef-78ab3e44fb34','ccee54a4-7637-4cdf-bc95-890eed621451'),('769dfbaf-5b5b-4098-8535-28c3a5b64a53','ccee54a4-7637-4cdf-bc95-890eed621451'),('7ecb743e-7590-4dff-b976-8be9d4616840','ccee54a4-7637-4cdf-bc95-890eed621451'),('852ec621-9897-49dc-894a-9f8b6bb8c865','ccee54a4-7637-4cdf-bc95-890eed621451'),('95592080-b3d6-4da3-ac55-6b941b6b9f0d','ccee54a4-7637-4cdf-bc95-890eed621451'),('9fc33558-5ee9-4cf1-9cbd-159def53570f','ccee54a4-7637-4cdf-bc95-890eed621451'),('a2965ee9-ee62-43d8-b08f-4bc0394e2d1b','ccee54a4-7637-4cdf-bc95-890eed621451'),('b2e6023e-908e-4769-979c-1f13be4a48b7','ccee54a4-7637-4cdf-bc95-890eed621451'),('d3778b1e-9b1d-48bb-b9e1-4e3b87c69881','ccee54a4-7637-4cdf-bc95-890eed621451'),('e9f3eac4-721e-4746-8e53-8f9e8b855b79','ccee54a4-7637-4cdf-bc95-890eed621451'),('ea206ccd-5185-4846-8e4d-a63219b70a4a','ccee54a4-7637-4cdf-bc95-890eed621451');
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
INSERT INTO `WEB_ORIGINS` VALUES ('42ce5f39-f315-496d-881f-7de13ac3ae08','+'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','http://localhost:3000'),('4fa2d49e-051c-428b-968b-8a7110abb0ba','http://localhost:8080'),('54cff855-78e3-4b1a-8fa0-81596b6804d4','+');
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

-- Dump completed on 2024-01-16 13:48:54
