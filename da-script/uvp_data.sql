/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.20 : Database - uvp
********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`uvp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `uvp`;

/*Data for the table `analysis_algorithm` */

insert  into `analysis_algorithm`(`ID`,`COMPANY_ID`,`ALGORITHM_NAME`,`ALGORITHM_CODE`,`ALGORITHM_TYPE`,`ALGORITHM_VERSION`,`ALGORITHM_DESCRIPTION`,`FILE_NAME`,`FILE_SIZE`,`FILE_PATH`,`FILE_MD5`,`DEL_FLAG`,`CREATE_TIME`,`UPDATE_TIME`,`hard_ware`,`frame`,`isUsed`,`classified`) values (1,'05c52360ed4141ecb5fd3c7f34c5ee5b','未佩戴安全帽','anquanmao',5,'v1','','',0,'','',0,'2020-11-02 15:37:18','2020-11-02 15:37:25','1',NULL,1,'1'),(2,'05c52360ed4141ecb5fd3c7f34c5ee5b','电动车入梯','diandongche',3,'v1','','',0,'','',0,'2020-08-12 08:47:03','2020-11-02 15:37:58','2',NULL,1,'1'),(3,'05c52360ed4141ecb5fd3c7f34c5ee5b','防震锤','fangzhenchui',2,'v1','','',0,'','',0,'2020-08-12 08:47:03','2020-11-02 15:38:19','3',NULL,1,'1'),(4,'05c52360ed4141ecb5fd3c7f34c5ee5b','附属设施','fushusheshi',2,'v1','','',0,'','',0,'2020-08-12 08:47:03','2020-11-02 15:38:37','0',NULL,1,'1'),(5,'05c52360ed4141ecb5fd3c7f34c5ee5b','未着工装','vest',5,'v1','','',0,'','',0,'2020-08-12 08:47:03','2020-11-02 15:40:31','0',NULL,1,'1'),(6,'05c52360ed4141ecb5fd3c7f34c5ee5b','绝缘子污损','jueyuanzi',2,'v1','','',0,'','',0,'2020-08-12 08:47:03','2020-11-02 15:40:48','0',NULL,1,'1'),(7,'05c52360ed4141ecb5fd3c7f34c5ee5b','开关状态','kaiguan',0,'v1','','',0,'','',0,'2020-08-12 08:47:03','2020-09-23 05:42:23','1',NULL,1,'1'),(8,'05c52360ed4141ecb5fd3c7f34c5ee5b','外破吊车','waipodiaoche',2,'v1','','',0,'','',0,'2020-08-12 08:47:03','2020-11-02 15:41:20','2',NULL,1,'1'),(9,'05c52360ed4141ecb5fd3c7f34c5ee5b','小动物（边端）','xiaodongwu',2,'v1','','',0,'','',0,'2020-08-12 08:47:03','2020-11-02 15:41:33','3',NULL,0,'1'),(10,'05c52360ed4141ecb5fd3c7f34c5ee5b','动作识别','jump_action',5,'v1',NULL,NULL,0,NULL,NULL,0,'2020-11-13 13:50:21',NULL,'0',NULL,1,'1'),(11,'05c52360ed4141ecb5fd3c7f34c5ee5b','人员进入','people',5,'v1',NULL,NULL,0,NULL,NULL,0,'2020-11-13 14:15:12',NULL,'0',NULL,1,'1'),(12,'05c52360ed4141ecb5fd3c7f34c5ee5b','人脸识别','face',5,'v1',NULL,NULL,0,NULL,NULL,0,'2020-11-18 10:42:36',NULL,'0',NULL,1,'3'),(13,'05c52360ed4141ecb5fd3c7f34c5ee5b','雪','snow',5,'v1',NULL,NULL,0,NULL,NULL,0,'2021-01-06 13:54:32',NULL,'0',NULL,1,'1'),(14,'05c52360ed4141ecb5fd3c7f34c5ee5b','大型机械','dxjx',5,'v1',NULL,NULL,0,NULL,NULL,0,'2021-01-06 13:54:32',NULL,'0',NULL,1,'1'),(15,'05c52360ed4141ecb5fd3c7f34c5ee5b','雾','fog',5,'v1',NULL,NULL,0,NULL,NULL,0,'2021-01-13 14:22:43',NULL,'0',NULL,1,'1'),(16,'05c52360ed4141ecb5fd3c7f34c5ee5b','逆行','topsy',5,'v1',NULL,NULL,0,NULL,NULL,0,'2021-01-13 14:22:32',NULL,'0','256',1,'1'),(17,'05c52360ed4141ecb5fd3c7f34c5ee5b','事故','accident',5,'v1',NULL,NULL,0,NULL,NULL,0,'2021-01-13 14:22:16',NULL,'0',NULL,1,'1'),(18,'05c52360ed4141ecb5fd3c7f34c5ee5b','停车','stop',5,'v1',NULL,NULL,0,NULL,NULL,0,'2021-01-13 14:22:20',NULL,'0','128',1,'1'),(20,'05c52360ed4141ecb5fd3c7f34c5ee5b','雨','rain',5,'v1',NULL,NULL,0,NULL,NULL,0,'2021-01-13 14:22:43',NULL,'0',NULL,1,'1');

/*Data for the table `analysis_algorithm_issue_del` */

/*Data for the table `analysis_algorithm_label` */

insert  into `analysis_algorithm_label`(`id`,`algorithm_id`,`label_id`) values (1,1,1000),(2,1,1001),(3,1,1002);

/*Data for the table `analysis_algorithm_param` */

insert  into `analysis_algorithm_param`(`id`,`algorithm_id`,`param_name`,`param_value_del`,`param_type`,`param_description`,`param_unit`,`dsp_order`,`min`,`max`,`required`) values (8,12,'reportType','0.1','2','上报类型','',1,NULL,NULL,NULL),(9,12,'path','0.1','4','人脸库/人名选择','',1,NULL,NULL,1);

/*Data for the table `analysis_algorithm_param_values` */

insert  into `analysis_algorithm_param_values`(`param_id`,`value`,`option`) values (8,'0','识别到'),(8,'1','未识别到'),(9,'face/white/','face/white/');

/*Data for the table `analysis_device_location` */

insert  into `analysis_device_location`(`id`,`parentId`,`type`,`name`) values (1,NULL,'city','南京市'),(2,1,'area','玄武区'),(3,1,'area','秦淮区'),(4,1,'area','建邺区'),(5,1,'area','鼓楼区'),(6,1,'area','浦口区'),(7,1,'area','栖霞区'),(8,1,'area','雨花台区'),(9,1,'area','江宁区'),(10,1,'area','六合区'),(11,1,'area','溧水区'),(12,1,'area','高淳区'),(13,NULL,'city','上海市'),(14,13,'area','奉贤区'),(15,13,'area','黄浦区'),(16,2,'station','变电站1'),(17,2,'station','变电站2'),(18,2,'station','变电站3'),(19,2,'station','变电站4'),(20,3,'station','变电站1'),(21,3,'station','变电站2'),(22,3,'station','变电站3'),(23,3,'station','变电站4'),(24,4,'station','变电站1'),(25,4,'station','变电站2'),(26,5,'station','变电站3'),(27,5,'station','变电站4'),(28,6,'station','变电站1'),(29,6,'station','变电站2'),(30,7,'station','变电站3'),(31,7,'station','变电站4'),(32,8,'station','变电站1'),(33,8,'station','变电站2'),(34,9,'station','变电站3'),(35,9,'station','变电站4'),(36,14,'station','变电站1'),(37,14,'station','变电站2'),(38,14,'station','变电站3'),(39,15,'station','变电站4'),(40,15,'station','变电站1'),(41,15,'station','变电站2'),(42,11,'station','变电站3'),(43,12,'station','变电站4'),(44,10,'station','变电站2'),(45,10,'station','变电站3'),(46,10,'station','变电站4'),(47,NULL,'city','成都市'),(48,47,'area','武侯区'),(49,48,'station','变电站1（1000）'),(50,47,'area','温江区'),(51,50,'station','变电站1（2000）'),(52,47,'area','成华区'),(53,52,'station','变电站1（3000）'),(54,47,'area','双流区'),(55,54,'station','变电站1（4000）'),(56,47,'area','龙泉驿区'),(57,56,'station','变电站1（5000）'),(58,47,'area','锦江区'),(59,58,'station','变电站1（6000）'),(60,47,'area','新都区'),(61,60,'station','变电站1（7000）'),(62,47,'area','郫都区'),(63,62,'station','变电站1（8000）'),(64,47,'area','青白江区'),(65,64,'station','变电站1（9000）'),(66,47,'area','青羊区'),(67,66,'station','变电站1（10000）'),(68,13,'area','嘉定区'),(69,13,'area','长宁区'),(70,13,'area','浦东新区'),(71,13,'area','青浦区');

/*Data for the table `analysis_dict` */

insert  into `analysis_dict`(`id`,`type`,`name`,`value`,`dsp_order`,`description`,`del_flag`,`create_time`) values (1,'task_status','未开始','0',0,'',0,'2021-01-04 16:38:31'),(2,'task_status','等待中','1',1,'',0,'2020-11-24 11:04:59'),(3,'task_status','分析中','2',2,'',0,'2020-11-24 11:05:08'),(4,'task_status','排队中','3',3,'',0,'2020-11-24 11:05:18'),(5,'task_status','分析异常','4',4,'',0,'2020-11-24 11:05:41'),(6,'analysis_status','排队中','0',0,'',0,'2020-10-30 13:40:56'),(7,'analysis_status','运行中','1',1,'',0,'2020-11-30 22:11:38'),(8,'analysis_status','处理异常','2',2,'',0,'2020-10-30 13:40:56'),(9,'analysis_status','重试','3',3,'',0,'2020-10-30 13:40:56'),(10,'analysis_status','已完成','4',4,'',1,'2020-11-30 22:13:57'),(11,'task_type','实时视频分析','0',0,'',0,'2020-11-25 04:28:58'),(12,'task_type','历史录像分析','1',1,'',0,'2020-10-30 13:40:56'),(13,'task_type','实时图片分析','2',2,'',0,'2020-10-30 13:40:56'),(14,'sample_source','用户上传','10',0,'',0,'2020-11-11 15:32:58'),(15,'sample_source','分析任务','11',1,'',0,'2020-11-11 15:33:00'),(16,'analysis_device_type','边端设备11189898989898989898989898989','0',0,'边端边端边',0,'2021-02-02 15:05:23'),(17,'algorithm_type','通用算法1','0',0,'',0,'2020-11-02 14:18:21'),(18,'param_type','string','0',0,'字符串 如input标签type=text',0,'2020-11-18 10:21:55'),(19,'param_type','int','1',1,'数值 如input标签type=number',0,'2020-11-18 10:22:10'),(20,'analysis_device_type','云端设备12222','1',0,'',0,'2021-01-13 15:30:51'),(34,'company_type','算法厂商','0',0,'',0,'2020-10-30 13:40:56'),(35,'company_type','设备厂商','1',1,'',0,'2020-10-30 13:40:56'),(36,'algorithm_type','其它算法','1',1,'',0,'2020-10-30 13:40:56'),(37,'algorithm_type','电力输电','2',3,'',0,'2020-10-30 13:40:56'),(38,'algorithm_type','智慧园区12','3',2,'',0,'2020-11-02 15:42:14'),(39,'algorithm_type','输电','4',1,'',0,'2020-10-30 13:40:56'),(40,'algorithm_type','现场作业安全','5',1,'',0,'2020-10-30 13:40:56'),(41,'algorithm_type','变电','6',1,'',0,'2020-10-30 13:40:56'),(42,'task_type','离线图片分析','3',NULL,'',0,'2020-10-30 13:40:56'),(68,'algorithm_classified','组织者组织','1',0,'',0,'2020-11-05 18:48:38'),(69,'algorithm_classified','重中之重','2',0,'',0,'2020-11-05 18:48:41'),(71,'algorithm_classified','qqq','3',0,'',0,'2020-11-05 18:48:42'),(72,'algorithm_classified','sdasd','4',0,'',0,'2020-11-05 18:48:45'),(73,'algorithm_classified','xxx','5',0,'',0,'2020-11-05 18:48:48'),(84,'sample_scene','三大','0',0,'对 ',1,'2020-12-01 01:11:27'),(86,'sample_scene','c\'c\'cccc','2',0,'1231111',1,'2020-12-01 01:12:39'),(87,'sample_scene','11','3',0,'QQ',1,'2020-12-01 00:30:18'),(88,'sample_scene','22+7889钱钱钱','4',0,'手术+55钱钱钱',1,'2020-12-01 00:30:10'),(89,'sample_scene','我问问','5',0,'呃呃呃',1,'2020-12-01 00:30:18'),(92,'sample_scene','吱吱吱吱333','6',0,'11222',1,'2020-12-01 01:12:51'),(93,'sample_scene','输电场景','7',0,'输电输电输电',0,'2021-02-03 16:48:39'),(94,'sample_scene','222','8',0,'',1,'2020-12-01 01:12:51'),(95,'sample_scene','333','9',0,'',1,'2020-12-01 01:12:55'),(96,'ipc_type','枪机','0',NULL,'ipc设备类型',0,'2021-01-22 17:28:26'),(97,'ipc_type','半球','1',NULL,'ipc设备类型',0,'2021-01-22 17:28:09'),(102,'analysis_device_type','xx','2',0,'',0,'2020-11-30 05:04:53'),(103,'sample_scene','1','1',0,'',1,'2021-01-08 14:24:26'),(104,'algorithm_hard_ware','GPU','0',NULL,NULL,0,'2020-11-05 18:49:06'),(105,'algorithm_hard_ware','CPU','1',NULL,NULL,0,'2020-11-05 18:49:08'),(106,'algorithm_hard_ware','NPU','2',NULL,NULL,0,'2020-11-05 18:49:09'),(107,'algorithm_hard_ware','GPU/CPU','3',NULL,NULL,0,'2020-11-05 18:49:12'),(109,'analysis_device_type','','3',0,'',0,'2021-02-02 15:11:51'),(123,'param_type','select','2',NULL,'单选 如select标签',0,'2020-11-18 10:22:21'),(124,'param_type','multiple-select','3',NULL,'多选 如select标签并带有multiple属性',0,'2020-11-18 10:22:45'),(125,'ipc_source','边端','1',0,NULL,0,'2020-12-13 21:41:28'),(126,'ipc_source','统一视频','2',0,NULL,0,'2020-12-13 21:25:30'),(127,'ipc_source','海康集团','3',NULL,NULL,0,'2020-11-20 15:25:31'),(128,'ipc_source','南瑞集团','4',NULL,'',0,'2020-11-19 17:04:36'),(133,'ipc_source','电网','5',0,'',1,'2020-11-20 16:19:24'),(134,'ipc_source','just_test_8989','6',0,'ooo',0,'2020-11-23 19:58:01'),(135,'sample_scene','人员进入场景','10',0,'',0,'2020-11-24 10:22:25'),(136,'task_status','已完成','5',5,'',0,'2020-11-24 11:14:09'),(137,'task_status','暂停','6',6,'',0,'2021-01-18 13:34:05'),(139,'sample_scene','图片场景','11',0,'',0,'2020-12-01 00:25:55'),(151,'ipc_source','111111','7',0,'1112',0,'2020-12-23 21:38:39'),(153,'sample_scene','dwa','12',0,'',1,'2020-12-01 01:13:38'),(155,'sample_scene','2','13',0,'',1,'2021-01-08 14:27:11'),(156,'sample_scene','3','14',0,'',1,'2021-01-08 14:27:09'),(157,'sample_scene','24','15',0,'',1,'2020-12-01 01:14:54'),(158,'sample_source','采集任务','01',2,NULL,0,'2020-12-01 01:38:53'),(159,'param_type','cascader','4',NULL,'多选 级联选择cascader',0,'2020-12-04 05:20:51'),(160,'sample_scene','哇哇哇哇哇哇哇哇','16',0,'',1,'2020-12-24 00:55:43'),(161,'analysis_device_type','测一测','8',0,'544141496847',0,'2021-01-22 16:49:44'),(162,'sample_scene','试试水','17',0,'',0,'2020-12-04 03:03:15'),(164,'sample_scene','误报','99',0,'误报专用',0,'2020-12-10 09:44:02'),(165,'sample_scene','小动物','100',0,'小动物',0,'2020-12-14 00:58:16'),(166,'ipc_source','sdfh','8',0,'',0,'2020-12-16 05:03:22'),(190,'alarm_level','正常','0',NULL,NULL,NULL,'2020-12-17 20:59:45'),(191,'alarm_level','一级告警','1',NULL,NULL,NULL,'2020-12-17 21:00:18'),(192,'alarm_level','二级告警','2',NULL,NULL,NULL,'2020-12-17 21:00:54'),(193,'alarm_level','三级告警','3',NULL,NULL,NULL,'2020-12-17 21:00:58'),(194,'ipc_source','eyrtu','9',0,'',0,'2020-12-22 01:14:41'),(195,'ipc_source','777777','10',0,'',0,'2020-12-22 04:45:09'),(197,'sample_scene','4','102',0,'',1,'2021-01-08 14:24:33'),(198,'sample_scene','5','103',0,'',1,'2021-01-08 14:27:14'),(199,'sample_scene','6','104',0,'',1,'2021-01-08 14:25:39'),(200,'sample_scene','冲冲冲','105',0,'',1,'2021-01-11 18:45:56'),(201,'sample_scene','别逼逼','106',0,'',1,'2021-01-11 18:45:58'),(202,'sample_scene','来来来','107',0,'',1,'2021-01-11 18:45:54'),(205,'ipc_type','球机','2',NULL,'ipc设备类型',0,'2021-01-22 17:34:03'),(206,'ipc_type','抓拍机','3',NULL,'ipc设备类型',0,'2021-01-22 17:34:05'),(207,'analysis_device_type','xxx','9',0,'1111',0,'2021-01-25 16:15:48'),(208,'analysis_device_type','视频质量诊断设备','4',0,'1111',0,'2021-01-25 16:15:48'),(222,'analysis_device_type','1212121','10',0,'1212121212121212121212121213232323232323',0,'2021-02-02 13:25:32'),(223,'analysis_device_type','12121','11',0,'12212',0,'2021-02-02 13:39:15'),(229,'analysis_device_type','2323211113','15',0,'232323',0,'2021-02-03 16:47:00'),(236,'analysis_device_type','xxxx','16',0,'111',0,'2021-02-03 16:46:55'),(237,'analysis_device_type','1111','17',0,'1111',0,'2021-02-03 18:02:31'),(241,'analysis_device_type','OtherType','19',0,'第三方分析设备类型，误删',0,'2021-02-25 13:33:24'),(243,'analysis_device_type','从v变成v从v吧','20',0,'阿市场调查调查',0,'2021-05-14 13:44:04');

/*Data for the table `oauth_client_details` */

insert  into `oauth_client_details`(`client_id`,`resource_ids`,`client_secret`,`scope`,`authorized_grant_types`,`web_server_redirect_uri`,`authorities`,`access_token_validity`,`refresh_token_validity`,`additional_information`,`autoapprove`) values ('client-app',NULL,'$2a$10$GgB4wRGFC4ErQj5H9Bntf.gqvWe2XjjWwsyLq3VfpWWII.GxvcA9i','all','password,refresh_token',NULL,NULL,NULL,NULL,NULL,NULL);

/*Data for the table `t_config` */

INSERT INTO `t_config` VALUES (1,'platform.initialize.date', to_base64((SELECT DATE_FORMAT((SELECT now()),"%Y-%m-%d %H:%i:%s"))), null,'平台初始化日期时间');

/*Data for the table `t_asset_domain_assort` */

insert  into `t_asset_domain_assort`(`id`,`assrot_name`,`assrot_img`,`create_time`,`update_time`,`status`,`extra1`,`range`,`parent_id`,`is_move`,`is_share`) values (1,'全部','0',NULL,NULL,'1',NULL,NULL,0,0,0);
INSERT INTO `t_asset_domain_assort`(`id`, `assrot_name`, `assrot_img`, `create_time`, `update_time`, `status`, `extra1`, `range`, `parent_id`,`is_move`,`is_share`) VALUES (2, '分享给我的', '', NULL, NULL, '1', NULL, NULL, 1,1,1);

/*Data for the table `t_system_permission` */


INSERT INTO `t_system_permission` VALUES (1, NULL, '数据集成', 'integr', 1);
INSERT INTO `t_system_permission` VALUES (2, NULL, '数据分析', '', 1);
INSERT INTO `t_system_permission` VALUES (3, NULL, 'BI报表', '', 1);
INSERT INTO `t_system_permission` VALUES (4, NULL, '数据服务', '', 1);
INSERT INTO `t_system_permission` VALUES (5, NULL, '数据资产', '', 1);
INSERT INTO `t_system_permission` VALUES (6, NULL, '视频诊断', '', 1);
INSERT INTO `t_system_permission` VALUES (7, NULL, '资源管理', '', 1);
INSERT INTO `t_system_permission` VALUES (8, NULL, '智能感知', '', 1);
INSERT INTO `t_system_permission` VALUES (9, NULL, '物联管理', 'iot', 1);
INSERT INTO `t_system_permission` VALUES (10, NULL, '系统管理', '', 1);
INSERT INTO `t_system_permission` VALUES (11, NULL, '表单填报', NULL, 1);
INSERT INTO `t_system_permission` VALUES (20, 1, '数据源管理', 'integration_Origin', 2);
INSERT INTO `t_system_permission` VALUES (21, 1, '数据采集任务', 'integration_Gather', 2);
INSERT INTO `t_system_permission` VALUES (60, 5, '数据总览', 'assets_echartsMap', 2);
INSERT INTO `t_system_permission` VALUES (61, 5, '数据地图', 'assets_dataMapTable', 2);
INSERT INTO `t_system_permission` VALUES (70, 6, '任务管理', 'videoTaskManger', 2);
INSERT INTO `t_system_permission` VALUES (71, 6, '告警管理', 'videoTaskManger_ReportManger', 2);
INSERT INTO `t_system_permission` VALUES (72, 6, '状态管理', 'videoTaskManger_statemanager', 2);
-- INSERT INTO `t_system_permission` VALUES (73, 6, '报表管理', '', 2);
INSERT INTO `t_system_permission` VALUES (80, 7, '存储管理', 'store_manager', 2);
INSERT INTO `t_system_permission` VALUES (81, 7, '视频平台管理', 'store_manager_videoPlatformManager', 2);
INSERT INTO `t_system_permission` VALUES (82, 7, 'IPC设备管理', 'store_manager_IPCDeviceManager', 2);
INSERT INTO `t_system_permission` VALUES (83, 7, 'IPC分组管理', 'store_manager_IPCGroupsManager', 2);
INSERT INTO `t_system_permission` VALUES (84, 7, 'IPC来源管理', 'store_manager_IPCFromConfig', 2);
INSERT INTO `t_system_permission` VALUES (90, 8, '任务管理', 'TaskManagement', 2);
INSERT INTO `t_system_permission` VALUES (91, 8, '样本管理', 'example', 2);
INSERT INTO `t_system_permission` VALUES (92, 8, '图片管理', 'PictureMs', 2);
INSERT INTO `t_system_permission` VALUES (93, 8, '分析设备管理', 'analyticalEquipment', 2);
INSERT INTO `t_system_permission` VALUES (94, 8, '算法管理', 'algorithmManagement', 2);
INSERT INTO `t_system_permission` VALUES (95, 8, '统计报告', 'accountionReport', 2);
INSERT INTO `t_system_permission` VALUES (96, 8, '应用配置', 'AppConfig', 2);
INSERT INTO `t_system_permission` VALUES (110, 10, '用户管理', 'system_usermanager', 2);
INSERT INTO `t_system_permission` VALUES (111, 10, '角色管理', 'system_managementRoles', 2);
INSERT INTO `t_system_permission` VALUES (112, 10, '版本信息', 'system_versionInformation', 2);
INSERT INTO `t_system_permission` VALUES (113, 10, '用户手册', 'system_userManual', 2);
INSERT INTO `t_system_permission` VALUES (62, 5, '数据标签', 'assets_dataLabel', 2);
INSERT INTO `t_system_permission` VALUES (40, 3, '模板管理', 'template', 2);
INSERT INTO `t_system_permission` VALUES (41, 3, '报告管理', 'manage', 2);
INSERT INTO `t_system_permission` VALUES (42, 3, '卡片管理', 'bi_card', 2);
INSERT INTO `t_system_permission` VALUES (63, 5, '专业词库', 'assets_terminologyBank', 2);
INSERT INTO `t_system_permission` VALUES (30, 2, '模型标签', 'analyse_modelTags', 2);
INSERT INTO `t_system_permission` VALUES (31, 2, '模型管理', 'analyse_main', 2);
INSERT INTO `t_system_permission` VALUES (32, 2, '任务管理', 'module_task_manager', 2);
INSERT INTO `t_system_permission` VALUES (120, 11, '模版管理', 'formTemplate', 2);
INSERT INTO `t_system_permission` VALUES (121, 11, '表单管理', 'formManage', 2);
INSERT INTO `t_system_permission` VALUES (122, 11, '填报管理', 'fillingManage', 2);
INSERT INTO `t_system_permission` VALUES (114, 10, 'License授权', 'system_license', 2);
INSERT INTO `t_system_permission` VALUES (51, 4, 'API管理', 'service_api_management', 2);
INSERT INTO `t_system_permission` VALUES (52, 4, 'API应用管理', 'service_api_application', 2);
INSERT INTO `t_system_permission` VALUES (53, 4, 'API策略管理', 'service_api_policy', 2);
INSERT INTO `t_system_permission` VALUES (700, 110, '用户管理api', '/system/userManagement', 3);
INSERT INTO `t_system_permission` VALUES (710, 111, '角色管理api', '/system/roleManagement', 3);
INSERT INTO `t_system_permission` VALUES (400, 71, '告警管理api', '/video/alarmManager', 3);
INSERT INTO `t_system_permission` VALUES (380, 70, '算法管理api', '/video/algo', 3);
INSERT INTO `t_system_permission` VALUES (420, 72, 'ipc状态管理api', '/video/ipcStatus', 3);
-- INSERT INTO `t_system_permission` VALUES (440, 73, '故障统计api', '/video/malfunctionStatistics', 3);
INSERT INTO `t_system_permission` VALUES (381, 70, '任务管理api', '/video/task', 3);
-- INSERT INTO `t_system_permission` VALUES (441, 73, '任务统计api', '/video/taskStatistics', 3);
INSERT INTO `t_system_permission` VALUES (640, 94, '算法管理api', '/video/algorithm', 3);
INSERT INTO `t_system_permission` VALUES (680, 96, '厂商管理api', '/video/analysisCompany', 3);
INSERT INTO `t_system_permission` VALUES (620, 93, '分析设备管理api', '/video/analysisDevice', 3);
INSERT INTO `t_system_permission` VALUES (660, 95, '分析设备统计api', '/video/analysisDeviceStatistics', 3);
INSERT INTO `t_system_permission` VALUES (560, 90, '图片分析api', '/video/analysisPicture', 3);
INSERT INTO `t_system_permission` VALUES (661, 95, '分析结果统计api', '/video/analysisResultStatistics', 3);
INSERT INTO `t_system_permission` VALUES (561, 90, '分析任务api', '/video/analysisTask', 3);
INSERT INTO `t_system_permission` VALUES (562, 90, '分析任务结果api', '/video/analysisTaskResult', 3);
INSERT INTO `t_system_permission` VALUES (662, 95, '分析任务统计api', '/video/analysisTaskStatistics', 3);
INSERT INTO `t_system_permission` VALUES (600, 92, '人脸库管理api', '/video/faceDataManage', 3);
INSERT INTO `t_system_permission` VALUES (601, 92, '图片管理api', '/video/fileupload', 3);
INSERT INTO `t_system_permission` VALUES (563, 90, '新增任务选择摄像头api', '/video/resource', 3);
INSERT INTO `t_system_permission` VALUES (580, 91, '样本图片管理api', '/video/sampleFileManage', 3);
INSERT INTO `t_system_permission` VALUES (663, 95, '样本统计api', '/video/sampleStatistics', 3);
INSERT INTO `t_system_permission` VALUES (500, 82, 'IPC设备管理api', '/resource/IPCDevice', 3);
INSERT INTO `t_system_permission` VALUES (520, 83, 'IPC分组管理api', '/resource/IPCGroup', 3);
INSERT INTO `t_system_permission` VALUES (540, 84, 'IPC来源配置', '/resource/IPCSource', 3);
INSERT INTO `t_system_permission` VALUES (460, 80, '存储管理api', '/resource/storageManage', 3);
INSERT INTO `t_system_permission` VALUES (480, 81, '视频平台管理api', '/resource/videoManage', 3);
INSERT INTO `t_system_permission` VALUES (140, 20, '数据源管理api', '/dataIntegration/showDatasource', 3);
INSERT INTO `t_system_permission` VALUES (160, 21, '平台管理api', '/dataIntegration/Platform', 3);
INSERT INTO `t_system_permission` VALUES (641, 94, '算法管理api', '/smart/algorithm', 3);
INSERT INTO `t_system_permission` VALUES (681, 96, '厂商管理api', '/smart/analysisCompany', 3);
INSERT INTO `t_system_permission` VALUES (621, 93, '分析设备管理api', '/smart/analysisDevice', 3);
INSERT INTO `t_system_permission` VALUES (664, 95, '分析设备统计api', '/smart/analysisDeviceStatistics', 3);
INSERT INTO `t_system_permission` VALUES (602, 92, '图片分析api', '/smart/analysisPicture', 3);
INSERT INTO `t_system_permission` VALUES (665, 95, '分析结果统计api', '/smart/analysisResultStatistics', 3);
INSERT INTO `t_system_permission` VALUES (564, 90, '分析任务api', '/smart/analysisTask', 3);
INSERT INTO `t_system_permission` VALUES (565, 90, '分析任务结果api', '/smart/analysisTaskResult', 3);
INSERT INTO `t_system_permission` VALUES (666, 95, '分析任务统计api', '/smart/analysisTaskStatistics', 3);
INSERT INTO `t_system_permission` VALUES (603, 92, '人脸库管理api', '/smart/faceDataManage', 3);
INSERT INTO `t_system_permission` VALUES (604, 92, '图片管理api', '/smart/fileupload', 3);
INSERT INTO `t_system_permission` VALUES (581, 91, '样本图片管理api', '/smart/sampleFileManage', 3);
INSERT INTO `t_system_permission` VALUES (667, 95, '样本统计api', '/smart/sampleStatistics', 3);
INSERT INTO `t_system_permission` VALUES (161, 21, '数据采集任务api', '/dataIntegration/acquisition', 3);
INSERT INTO `t_system_permission` VALUES (320, 61, '数据实体api', '/dataAssets/domain', 3);
INSERT INTO `t_system_permission` VALUES (300, 60, '数据总览api', '/dataAssets/showDatasource', 3);
INSERT INTO `t_system_permission` VALUES (162, 21, 'json控制api', '/dataIntegration/json', 3);
INSERT INTO `t_system_permission` VALUES (321, 61, '模型管理api', '/dataAssets/model', 3);
INSERT INTO `t_system_permission` VALUES (322, 61, '资源管理模型与实体api', '/dataAssets/entityandmodel', 3);
INSERT INTO `t_system_permission` VALUES (141, 20, 'csv重名校验api', '/dataIntegration/model', 3);
INSERT INTO `t_system_permission` VALUES (301, 60, '数据总览主页api', '/dataAssets/homePage', 3);
INSERT INTO `t_system_permission` VALUES (720, 112, '版本信息api', '/system/versionManagement', 3);
INSERT INTO `t_system_permission` VALUES (323, 61, 'json控制api', '/dataAssets/json', 3);
INSERT INTO `t_system_permission` VALUES (340, 62, '数据标签api', '/dataAssets/label', 3);
INSERT INTO `t_system_permission` VALUES (240, 41, '报告管理api', '/biReport/reportManage', 3);
INSERT INTO `t_system_permission` VALUES (180, 31, '数据源展示api', '/dataAnalysis/showDatasource', 3);
INSERT INTO `t_system_permission` VALUES (181, 31, 'NLPapi', '/dataAnalysis/nlp', 3);
INSERT INTO `t_system_permission` VALUES (182, 31, '模型与实体管理', '/dataAnalysis/entityandmodel', 3);
INSERT INTO `t_system_permission` VALUES (200, 32, '任务执行调度管理', '/dataAnalysis/interface', 3);
INSERT INTO `t_system_permission` VALUES (183, 31, '模型设计', '/dataAnalysis/modelDesign', 3);
INSERT INTO `t_system_permission` VALUES (184, 31, '模型管理(模型数据详情)', '/dataAnalysis/model', 3);
INSERT INTO `t_system_permission` VALUES (185, 31, '平台管理', '/dataAnalysis/Platform', 3);
INSERT INTO `t_system_permission` VALUES (360, 63, '专业词库api', '/dataAssets/lexicon', 3);
INSERT INTO `t_system_permission` VALUES (241, 41, '报告设计api', '/biReport/reportView', 3);
INSERT INTO `t_system_permission` VALUES (220, 40, '模板管理api', '/biReport/reportModel', 3);
INSERT INTO `t_system_permission` VALUES (260, 42, '卡片管理api', '/biReport/reportCard', 3);
INSERT INTO `t_system_permission` VALUES (186, 31, '模型分享api', '/dataAnalysis/modelManage', 3);
INSERT INTO `t_system_permission` VALUES (324, 61, '实体分享', '/dataAssets/domainManage', 3);
INSERT INTO `t_system_permission` VALUES (242, 41, '组件联动配置', '/biReport/linkageConfig', 3);
INSERT INTO `t_system_permission` VALUES (187, 31, '超管验证', '/dataAnalysis/modelManager', 3);
INSERT INTO `t_system_permission` VALUES (130, 3, '上传图片api', '/biReport/picture', 3);
INSERT INTO `t_system_permission` VALUES (730, 114, 'License授权api', '/system/licenseManagement', 3);
INSERT INTO `t_system_permission` VALUES (243, 41, '关联配置', '/biReport/globalRelation', 3);
INSERT INTO `t_system_permission` VALUES (280, 51, 'API管理控制', '/dataService/dataApi', 3);
INSERT INTO `t_system_permission` VALUES (281, 52, 'API应用管理', '/dataService/dataApp', 3);
INSERT INTO `t_system_permission` VALUES (282, 53, '策略管理api', '/dataService/policy', 3);
INSERT INTO `t_system_permission` VALUES (800, 120, '模版管理api', '/formFilling/templateManager', 3);
INSERT INTO `t_system_permission` VALUES (801, 121, '表单管理api', '/formFilling/formManage', 3);
INSERT INTO `t_system_permission` VALUES (802, 122, '填报管理api', '/formFilling/taskManage', 3);
INSERT INTO `t_system_permission` VALUES (803, 122, '填报任务api', '/formFilling/taskFilling', 3);

#t_analysis_model_assort初始化数据
INSERT INTO `t_analysis_model_assort` (`id`, `assrot_name`, `assrot_img`, `create_time`, `update_time`, `status`, `extra1`, `range`, `parent_id`, `levels`) VALUES (1, '全部', NULL, now(), now(), '1', NULL, NULL, 0, NULL);
INSERT INTO `t_analysis_model_assort`(`id`, `assrot_name`, `assrot_img`, `create_time`, `update_time`, `status`, `extra1`, `range`, `parent_id`, `levels`) VALUES (101, '分享给我的', 'student.png', '2018-04-10 17:25:59', '2021-08-09 10:43:40', '0', NULL, '3000', 1, NULL);

#t_system_user初始化数据
INSERT INTO `t_system_user` VALUES (1, 'admin', '超级管理员', '$2a$10$3Q9f4QDP4RcNcwt2IS8HneScz6FUM4gdei.5lLsRd70FUsLZm85I.', '1', NULL, '0', NULL, NULL, NULL);

#t_system_role初始化数据
INSERT INTO `t_system_role` VALUES (1, '87570cedd9ae4227a4b51f7216ca7e34', '超级管理员', NULL, DATE_FORMAT(NOW(),"%Y-%m-%d %T"), DATE_FORMAT(NOW(),"%Y-%m-%d %T"), '1');

#t_system_user_role初始化数据
INSERT INTO `t_system_user_role` VALUES (1, 1, 1);

#t_system_role_permission初始化数据
INSERT INTO `t_system_role_permission` VALUES (1, 1, 1);
INSERT INTO `t_system_role_permission` VALUES (2, 1, 2);
INSERT INTO `t_system_role_permission` VALUES (3, 1, 3);
INSERT INTO `t_system_role_permission` VALUES (4, 1, 4);
INSERT INTO `t_system_role_permission` VALUES (5, 1, 5);
INSERT INTO `t_system_role_permission` VALUES (6, 1, 6);
INSERT INTO `t_system_role_permission` VALUES (7, 1, 7);
INSERT INTO `t_system_role_permission` VALUES (8, 1, 8);
-- INSERT INTO `t_system_role_permission` VALUES (9, 1, 9);
INSERT INTO `t_system_role_permission` VALUES (10, 1, 10);
INSERT INTO `t_system_role_permission` VALUES (11, 1, 11);
INSERT INTO `t_system_role_permission` VALUES (12, 1, 20);
INSERT INTO `t_system_role_permission` VALUES (13, 1, 21);
INSERT INTO `t_system_role_permission` VALUES (14, 1, 30);
INSERT INTO `t_system_role_permission` VALUES (15, 1, 31);
INSERT INTO `t_system_role_permission` VALUES (16, 1, 32);
INSERT INTO `t_system_role_permission` VALUES (17, 1, 40);
INSERT INTO `t_system_role_permission` VALUES (18, 1, 41);
INSERT INTO `t_system_role_permission` VALUES (19, 1, 42);
INSERT INTO `t_system_role_permission` VALUES (21, 1, 51);
INSERT INTO `t_system_role_permission` VALUES (22, 1, 52);
INSERT INTO `t_system_role_permission` VALUES (23, 1, 53);
INSERT INTO `t_system_role_permission` VALUES (25, 1, 60);
INSERT INTO `t_system_role_permission` VALUES (26, 1, 61);
INSERT INTO `t_system_role_permission` VALUES (27, 1, 62);
INSERT INTO `t_system_role_permission` VALUES (28, 1, 63);
INSERT INTO `t_system_role_permission` VALUES (29, 1, 70);
INSERT INTO `t_system_role_permission` VALUES (30, 1, 71);
INSERT INTO `t_system_role_permission` VALUES (31, 1, 72);
-- INSERT INTO `t_system_role_permission` VALUES (32, 1, 73);
INSERT INTO `t_system_role_permission` VALUES (33, 1, 80);
INSERT INTO `t_system_role_permission` VALUES (34, 1, 81);
INSERT INTO `t_system_role_permission` VALUES (35, 1, 82);
INSERT INTO `t_system_role_permission` VALUES (36, 1, 83);
INSERT INTO `t_system_role_permission` VALUES (37, 1, 84);
INSERT INTO `t_system_role_permission` VALUES (38, 1, 90);
INSERT INTO `t_system_role_permission` VALUES (39, 1, 91);
INSERT INTO `t_system_role_permission` VALUES (40, 1, 92);
INSERT INTO `t_system_role_permission` VALUES (41, 1, 93);
INSERT INTO `t_system_role_permission` VALUES (42, 1, 94);
INSERT INTO `t_system_role_permission` VALUES (43, 1, 95);
INSERT INTO `t_system_role_permission` VALUES (44, 1, 96);
INSERT INTO `t_system_role_permission` VALUES (45, 1, 110);
INSERT INTO `t_system_role_permission` VALUES (46, 1, 111);
INSERT INTO `t_system_role_permission` VALUES (47, 1, 112);
INSERT INTO `t_system_role_permission` VALUES (48, 1, 113);
INSERT INTO `t_system_role_permission` VALUES (49, 1, 114);
INSERT INTO `t_system_role_permission` VALUES (50, 1, 120);
INSERT INTO `t_system_role_permission` VALUES (51, 1, 121);
INSERT INTO `t_system_role_permission` VALUES (52, 1, 122);

#t_bi_report_assort初始化数据
INSERT INTO `t_bi_report_assort` VALUES (1, '全部', NULL, NULL, 0);

#t_bi_card_assort初始化数据
INSERT INTO `t_bi_card_assort` VALUES (1, '全部', NULL, NULL, 0);

#t_analysis_formula_assort初始化数据
INSERT INTO `t_analysis_formula_assort` VALUES (1, '常用');
INSERT INTO `t_analysis_formula_assort` VALUES (2, '聚合运算');
INSERT INTO `t_analysis_formula_assort` VALUES (3, '高级');
INSERT INTO `t_analysis_formula_assort` VALUES (4, '类型强转');

#t_analysis_formula_manage初始化数据
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (1, 1, 'unix_timestamp(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>字段</a>, &quot;<div id=\"timeFormat\" style=\"display:inline-block;border:0;border-bottom:1px dashed #0099ff;cursor:pointer;\">yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'</div>&quot;)', '转换时间戳', NULL);
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (2, 2, '<a contenteditable=\'false\' value=\'count\'>计数</a>(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>栏位</a>)', '计数', '<p>计数</p><p>字段：选择要计数的字段</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (3, 2, '<a contenteditable=\'false\' value=\'sum\'>求和</a>(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>栏位</a>)', '求和', '<p>求和</p><p>字段：选择要求和的字段</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (4, 2, '<a contenteditable=\'false\' value=\'avg\'>平均值</a>(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>栏位</a>)', '平均值', '<p>平均值</p><p>字段：选择要获取平均值的字段</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (5, 2, '<a contenteditable=\'false\' value=\'abs\'>绝对值</a>(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>栏位</a>)', '绝对值', '<p>绝对值</p><p>字段：选择要获取绝对值的字段</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (6, 1, '<a contenteditable=\'false\' value=\'substring\'>截取</a>(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>被截取字段(栏位)</a>,<a class=\'param\' contenteditable=\'false\' value=\'string1\'>起始位置</a>,<a class=\'param\' contenteditable=\'false\' value=\'string1\'>截取长度</a>)', '截取', '<p>截取字段</p><p>被截取字段：选择要被截取的字段</p><p>起始位置：填写要截取的起始点位置编号(编号从1开始)</p><p>终止位置：填写要截取的长度</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (7, 1, '<a contenteditable=\'false\' value=\'length\'>获取长度</a>(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>栏位</a>)', '获取长度', '<p>获取长度</p><p>字段：选择要获取字符长度的字段</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (8, 1, '<a contenteditable=\'false\' value=\'concat_ws\'>合并</a>(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>分隔符</a>,<a class=\'param\' contenteditable=\'false\' value=\'string1\'>栏位1</a>,<a class=\'param\' contenteditable=\'false\' value=\'string1\'>栏位2</a>)', '合并字符串', '<p>合并字符串</p><p>分隔符：填写连接两个字符串的符号，例如：逗号(,)，(-)，空(\"\")等</p><p>栏位1：选择想要拼接在左边的栏位或填写字符串</p><p>栏位2：选择想要拼接在右边的栏位或填写字符串</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (10, 3, '<a contenteditable=\'false\' value=\'case when \'>case when</a><a class=\'param\' contenteditable=\'false\' value=\'\'> 字段</a>=<a class=\'param\' contenteditable=\'false\' value=\'\'> 条件 </a><a contenteditable=\'false\' value=\'then \'> then </a><a class=\'param\' contenteditable=\'false\' value=\'\'> 结果1</a><a contenteditable=\'false\' value=\' else \'> else </a><a class=\'param\' contenteditable=\'false\' value=\'\'> 默认结果 </a><a contenteditable=\'false\' value=\' end\'> end </a>', 'case when（高级）', ' <p>case when</p><p>条件1:填写第一个判断条件</p><p>结果1:如果条件1成立那么则结果1为当前表达式的值</p><p>条件2:填写第二个判断条件</p><p>结果2:如果条件1成立那么则结果2为当前表达式的值</p><p>默认值:如果条件1和条件2都不成立,那么默认值为当前表达式的值</p><p>例: 将表中的sex字段中的数据\'1\',\'2\'分别显示成\'男\',\'女\',则可:点击条件1,选择相应的sex字段,输入 = 1,点击结果1,手动输入 男,点击条件2,选择相应的sex字段,输入 = 2,点击结果2,手动输入 女,点击默认值,手动输入 无</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (11, 1, '<a contenteditable=\'false\' value=\'coalesce\'>判空</a>(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>字段1</a> ,<a class=\'param\' contenteditable=\'false\' value=\'string1\'>参数1</a>)', '判空', '<p>判空</p><p>字段1：选择想要判空的字符串</p><p>参数1：填写或选择如果字段1为空时想要显示的值(如：0等)或字段</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (12, 4, '<a contenteditable=\'false\' value=\'cast\'>cast</a>(<a class=\'param\' contenteditable=\'false\' value=\'\'>字段1</a> as double))', '强转成double类型', '将输入的字段类型强转成double类型 ');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (13, 4, '<a contenteditable=\'false\' value=\'cast\'>cast</a>(<a class=\'param\' contenteditable=\'false\' value=\'\'>字段1</a> as bigint))', '强转成bigint类型', '将输入的字段类型强转成bigint类型 ');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (14, 4, '<a contenteditable=\'false\' value=\'cast\'>cast</a>(<a class=\'param\' contenteditable=\'false\' value=\'\'>字段1</a> as int)', '强转成int类型', '将输入的字段类型强转成int类型 ');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (15, 4, '<a contenteditable=\'false\' value=\'cast\'>cast</a>(<a class=\'param\' contenteditable=\'false\' value=\'\'>字段1</a> as string)', '强转成string类型', '将输入的字段类型强转成string类型');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (16, 1, '<a contenteditable=\'false\' value=\'regexp_replace\'>字符串替换</a>(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>被替换栏位</a>,<a class=\'param\' contenteditable=\'false\' value=\'string1\'>被替换字符串</a>,<a class=\'param\' contenteditable=\'false\' value=\'string1\'>替换字符串</a>)', '替换字符串', '<p>替换字符串</p><p>被替换栏位：选择需要被替换掉的栏位</p><p>被替换字符串：填写被替换栏位中需要被替换的内容</p><p>替换字符串：想要替换成的内容</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (17, 3, '<a contenteditable=\'false\' value=\'explode(split(\'>列转行(</a><a class=\'param\' contenteditable=\'false\' value=\'string1\'>字段</a>,\',\'<a contenteditable=\'false\' value=\'))\'>)</a>', '列转行', '<p>列转行</p><p>栏位：选择要转化的栏位</p><p>分隔符：输入分隔符</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (18, 3, '<a contenteditable=\"false\" value=\"datediff(from_unixtime(to_unix_timestamp\">日期差</a>(<a class=\"param\" contenteditable=\"false\" value=\"string1\">栏位1</a><a contenteditable=\"false\" value=\",\'yyyymmdd\'),\'yyyy-mm-dd\'),from_unixtime(to_unix_timestamp(\">,</a><a class=\"param\" contenteditable=\"false\" value=\"string1\">栏位2</a><a style=\"display: none;\" contenteditable=\"false\" value=\",\'yyyymmdd\'),\'yyyy-mm-dd\')\"></a>)', '日期差', '日期差');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (19, 1, '<a contenteditable=\'false\' value=\'instr\'>INSTR</a>(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>字段</a> ,<a class=\'param\' contenteditable=\'false\' value=\'string1\'>字符串</a>)', '获取位置', '<p>查找字符串str中子字符串substr出现的位置,如果查找失败将返回0，如果任一参数为Null将返回null，注意位置为从1开始的</p><p>字段：选择想要被字符串集合</p><p>字符串:需要查找位置的字符串</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (20, 1, 'date_format(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>字段</a>,<a class=\'param\' contenteditable=\'false\' value=\'string1\'>格式</a>) <b>=</b> date_format(add_months(current_date,<b>0</b>),<a class=\'param\' contenteditable=\'false\' value=\'string1\'>格式</a>)', '当前月份', '\r\n<p>动态筛选当前月</p><p><b>字段：</b>选择想要被筛选的时间字段，字段格式为yyyy-MM、yyyy-MM-dd或者yyyy-MM-dd HH:mm:ss 等</p><p><b>格式：</b>想要转换的时间格式，这里选择手动输入<b>yyyy-MM</b></p><p><b>动态筛选：</b>默认为0，表示当前月。-1表示上个月，以此类推</p><p><b>运算符：</b>默认为=</p>');
INSERT INTO `t_analysis_formula_manage` (`id`, `formulaassort`, `formula`, `formulashow`, `formulatitle`) VALUES (21, 1, 'date_format(<a class=\'param\' contenteditable=\'false\' value=\'string1\'>字段</a>,<a class=\'param\' contenteditable=\'false\' value=\'string1\'>格式</a>)<b>=</b>(year(current_date)-<b>0</b>) ', '当前年份', '<p>动态筛选当前年</p><p><b>字段：</b>选择想要被筛选的时间字段，字段格式为yyyy-MM、yyyy-MM-dd或者yyyy-MM-dd HH:mm:ss 等</p><p><b>格式：</b>想要转换的时间格式，这里选择手动输入<b>yyyy</b></p><p><b>动态筛选：</b>默认为0，表示当前年。1表示去年，以此类推</p><p><b>运算符：</b>默认为=</p>');



#t_asset_natures初始化数据
INSERT INTO `t_asset_natures` VALUES (1, 'Ag', '形语素', '形容词性语素。形容词代码为 a，语素代码ｇ前面置以A。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (2, 'a', '形容词', '取英语形容词 adjective的第1个字母。', '1', 1);
INSERT INTO `t_asset_natures` VALUES (3, 'ad', '副形词', '直接作状语的形容词。形容词代码?a和副词代码d并在一起。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (4, 'an', '名形词', '具有名词功能的形容词。形容词代码 a和名词代码n并在一起。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (5, 'b', '区别词', '取汉字“别”的声母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (6, 'c', '连词', '取英语连词 conjunction的第1个字母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (7, 'dg', '副语素', '副词性语素。副词代码为 d，语素代码ｇ前面置以D。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (8, 'd', '副词', '取 adverb的第2个字母，因其第1个字母已用于形容词。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (9, 'e', '叹词', '取英语叹词 exclamation的第1个字母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (10, 'f', '方位词', '取汉字“方”', '1', 2);
INSERT INTO `t_asset_natures` VALUES (11, 'g', '语素', '绝大多数语素都能作为合成词的“词根”，取汉字“根”的声母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (12, 'h', '前接成分', '取英语 head的第1个字母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (13, 'i', '成语', '取英语成语 idiom的第1个字母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (14, 'j', '简称略语', '取汉字“简”的声母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (15, 'k', '后接成分', '', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (16, 'l', '习用语', '习用语尚未成为成语，有点“临时性”，取“临”的声母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (17, 'm', '数词', '取英语 numeral的第3个字母，n，u已有他用。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (18, 'Ng', '名语素', '名词性语素。名词代码为 n，语素代码ｇ前面置以N。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (19, 'n', '名词', '取英语名词 noun的第1个字母。', '1', 10);
INSERT INTO `t_asset_natures` VALUES (20, 'nr', '人名', '名词代码 n和“人(ren)”的声母并在一起。', '1', 6);
INSERT INTO `t_asset_natures` VALUES (21, 'ns', '地名', '名词代码 n和处所词代码s并在一起。', '1', 5);
INSERT INTO `t_asset_natures` VALUES (22, 'nt', '机构团体', '“团”的声母为 t，名词代码n和t并在一起。', '1', 4);
INSERT INTO `t_asset_natures` VALUES (23, 'nz', '其他专名', '“专”的声母的第 1个字母为z，名词代码n和z并在一起。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (24, 'o', '拟声词', '取英语拟声词 onomatopoeia的第1个字母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (25, 'p', '介词', '取英语介词 prepositional的第1个字母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (26, 'q', '量词', '取英语 quantity的第1个字母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (27, 'r', '代词', '取英语代词 pronoun的第2个字母,因p已用于介词。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (28, 's', '处所词', '取英语 space的第1个字母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (29, 'tg', '时语素', '时间词性语素。时间词代码为 t,在语素的代码g前面置以T。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (30, 't', '时间词', '取英语 time的第1个字母。', '1', 3);
INSERT INTO `t_asset_natures` VALUES (31, 'u', '助词', '取英语助词 auxiliary', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (32, 'vg', '动语素', '动词性语素。动词代码为 v。在语素的代码g前面置以V。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (33, 'v', '动词', '取英语动词 verb的第一个字母。', '1', 7);
INSERT INTO `t_asset_natures` VALUES (34, 'vd', '副动词', '直接作状语的动词。动词和副词的代码并在一起。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (35, 'vn', '名动词', '指具有名词功能的动词。动词和名词的代码并在一起。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (36, 'w', '标点符号', '', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (37, 'x', '非语素字', '非语素字只是一个符号，字母 x通常用于代表未知数、符号。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (38, 'y', '语气词', '取汉字“语”的声母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (39, 'z', '状态词', '取汉字“状”的声母的前一个字母。', '1', NULL);
INSERT INTO `t_asset_natures` VALUES (40, 'un', '未知词', '不可识别词及用户自定义词组。取英文Unkonwn首两个字母。(非北大标准，CSW分词中定义)', '1', NULL);

INSERT INTO `t_ds_assort` VALUES(1, '全部', '2022-09-07 09:32:05', '2022-09-07 09:32:08', '1', NULL, 0, NULL);
INSERT INTO `t_ds_assort` VALUES(2, '授权给我的', '2022-09-07 09:32:05', '2022-09-07 09:32:08', '1', 1, 1, NULL);

INSERT INTO `t_form_assort` (id, assort_name) VALUES (1, '全部');
INSERT INTO `t_form_task_assort` (id, assort_name) VALUES (1, '全部');
INSERT INTO `t_form_task_assort` (id, assort_name, parent_id) VALUES (2, '需我协作的', 1);
INSERT INTO `t_form_template_assort` (id, `name`) VALUES (1, '全部');

INSERT INTO `t_vd_algorithm` VALUES ('colorCast', '画面偏色', 12, 'colorCast.png', 70);
INSERT INTO `t_vd_algorithm` VALUES ('freeze', '画面冻结', 12, 'freeze.png', 30);
INSERT INTO `t_vd_algorithm` VALUES ('heightLight', '亮度过高', 12, 'heightLight.png', 20);
INSERT INTO `t_vd_algorithm` VALUES ('los', '信号丢失', 12, 'los.png', 10);
INSERT INTO `t_vd_algorithm` VALUES ('lowLight', '亮度过低', 12, 'lowLight.png', 40);
INSERT INTO `t_vd_algorithm` VALUES ('move', '相机移动', 12, 'move.png', 50);
INSERT INTO `t_vd_algorithm` VALUES ('noise', '画面噪声', 12, 'noise.png', 60);
INSERT INTO `t_vd_algorithm` VALUES ('offline', '离线', 12, '', 0);
INSERT INTO `t_vd_algorithm` VALUES ('shake', '相机抖动', 12, 'shake.png', 80);
INSERT INTO `t_vd_algorithm` VALUES ('sharpness', '清晰度异常', 12, 'sharpness.png', 90);
INSERT INTO `t_vd_algorithm` VALUES ('snowFlake', '雪花干扰', 12, 'snowFlake.png', 100);






/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

SET FOREIGN_KEY_CHECKS=1;