/*
 Navicat Premium Data Transfer

 Source Server         : 172.16.32.90
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : 172.16.32.90:3306
 Source Schema         : uvp

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 18/08/2022 11:06:20
*/

CREATE
DATABASE `uvp_build2`;

USE
`uvp_build2`;

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ---------------------------
-- Table structure for algorithm_send_device
-- ----------------------------
DROP TABLE IF EXISTS `algorithm_send_device`;
CREATE TABLE `algorithm_send_device`
(
    `algorithm_id` int(5) NOT NULL COMMENT '算法id',
    `device_id`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分析设备id',
    `create_date`  datetime(0) DEFAULT NULL COMMENT '下发时间',
    `status`       varchar(2) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL COMMENT '下发状态',
    PRIMARY KEY (`algorithm_id`, `device_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci COMMENT = '算法下发设备表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for algorithm_send_device_copy1
-- ----------------------------
DROP TABLE IF EXISTS `algorithm_send_device_copy1`;
CREATE TABLE `algorithm_send_device_copy1`
(
    `algorithm_id` int(5) NOT NULL COMMENT '算法id',
    `device_id`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分析设备id',
    `create_date`  datetime(0) DEFAULT NULL COMMENT '下发时间',
    `status`       varchar(2) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL COMMENT '下发状态',
    PRIMARY KEY (`algorithm_id`, `device_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci COMMENT = '算法下发设备表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_algorithm
-- ----------------------------
DROP TABLE IF EXISTS `analysis_algorithm`;
CREATE TABLE `analysis_algorithm`
(
    `ID`                    int(5) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `COMPANY_ID`            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '厂商ID',
    `ALGORITHM_NAME`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '算法名称',
    `ALGORITHM_CODE`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '算法编码',
    `ALGORITHM_TYPE`        int(3) NOT NULL COMMENT '算法类型',
    `ALGORITHM_VERSION`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '算法版本号',
    `ALGORITHM_DESCRIPTION` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '算法描述',
    `FILE_NAME`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名',
    `FILE_SIZE`             int(11) DEFAULT 0 COMMENT '文件大小',
    `FILE_PATH`             varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件路径',
    `FILE_MD5`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '文件MD5值',
    `DEL_FLAG`              tinyint(1) DEFAULT 0 COMMENT '是否删除;0:否;1:是;',
    `CREATE_TIME`           datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `UPDATE_TIME`           datetime(0) DEFAULT NULL,
    `hard_ware`             varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '硬件支持 GPU/CPU、GPU、CPU、NPU',
    `frame`                 varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '算法框架',
    `isUsed`                tinyint(3) DEFAULT 1 COMMENT '是否使用 1表示使用 0表示不使用',
    `classified`            varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '算法分类、分组',
    PRIMARY KEY (`ID`) USING BTREE,
    INDEX                   `IDX_ANALYSISALGORITHM_ALGORITHMCODE`(`ALGORITHM_CODE`) USING BTREE,
    INDEX                   `IDX_ANALYSIS_ALGORITHM_TYPE`(`ALGORITHM_TYPE`) USING BTREE,
    INDEX                   `IDX_ANALYSIS_ALGORITHM_CLASSIFIED`(`classified`) USING BTREE,
    INDEX                   `IDX_ANALYSIS_ALGORITHM_HARD_WARE`(`hard_ware`) USING BTREE,
    INDEX                   `IDX_ANALYSIS_ALGORITHM_DELFLAG`(`DEL_FLAG`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '算法表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_algorithm_label
-- ----------------------------
DROP TABLE IF EXISTS `analysis_algorithm_label`;
CREATE TABLE `analysis_algorithm_label`
(
    `id`           int(6) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `algorithm_id` int(6) DEFAULT NULL COMMENT '算法ID',
    `label_id`     int(6) DEFAULT NULL COMMENT '算法标签ID',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `idx_analysisalgorithmlabel_algorithmid`(`algorithm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '算法和算法标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_algorithm_param
-- ----------------------------
DROP TABLE IF EXISTS `analysis_algorithm_param`;
CREATE TABLE `analysis_algorithm_param`
(
    `id`                int(6) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `algorithm_id`      int(32) NOT NULL COMMENT '算法ID',
    `param_name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数名称',
    `param_value_del`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数值',
    `param_type`        varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '参数类型',
    `param_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数描述',
    `param_unit`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '单位',
    `dsp_order`         int(3) DEFAULT NULL COMMENT '展示顺序',
    `min`               double(10, 5
) DEFAULT NULL COMMENT '最小值',
  `max` double(10, 5) DEFAULT NULL COMMENT '最大值',
  `required` smallint(1) DEFAULT 0 COMMENT '是否必填',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_analysisalgorithmparam_algorithmid`(`algorithm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '算法和算法参数关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_algorithm_param_values
-- ----------------------------
DROP TABLE IF EXISTS `analysis_algorithm_param_values`;
CREATE TABLE `analysis_algorithm_param_values`
(
    `param_id` int(11) NOT NULL COMMENT '参数id',
    `value`    varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL COMMENT '参数值',
    `option`   varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL COMMENT '参数说明',
    PRIMARY KEY (`value`, `param_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci COMMENT = '算法参数  可选值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_device
-- ----------------------------
DROP TABLE IF EXISTS `analysis_device`;
CREATE TABLE `analysis_device`
(
    `id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
    `device_name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备名称',
    `device_ip`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备IP地址',
    `device_port`     int(11) DEFAULT NULL COMMENT '设备端口号',
    `device_type`     tinyint(2) DEFAULT NULL COMMENT '分析设备类型;',
    `device_code`     varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备编码',
    `company_id`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '设备厂商ID',
    `deploy_location` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部署位置',
    `cpu`             int(11) DEFAULT NULL COMMENT 'cpu物理核心数',
    `cpu_used`        float(20, 16
) DEFAULT 0.0000000000000000 COMMENT 'cpu使用率',
  `memory` float(11, 2) DEFAULT NULL COMMENT '内存',
  `memory_used` float(20, 16) DEFAULT 0.0000000000000000 COMMENT '内存使用率',
  `npu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'npu',
  `npu_used` float(20, 16) DEFAULT 0.0000000000000000 COMMENT 'npu使用率',
  `gpu_used` float(20, 16) DEFAULT 0.0000000000000000 COMMENT 'gpu使用率',
  `video_memory_used` float(20, 16) DEFAULT NULL COMMENT '显存使用率',
  `gpu` float(11, 0) DEFAULT NULL COMMENT '显存大小',
  `disk_size` float(20, 0) DEFAULT NULL COMMENT '磁盘容量',
  `algorithm_names` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '运行的算法',
  `device_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分析设备描述',
  `device_status` tinyint(1) DEFAULT 0 COMMENT '设备状态;0:离线，1:在线',
  `del_flag` tinyint(1) DEFAULT 0 COMMENT '是否删除;0:否，1:是',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `report_time` datetime(0) DEFAULT NULL COMMENT '上报时间，默认超过10分钟未变化时设备变为离线状态',
  `used_app` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标志这个分析设备是在哪个系统里可以使用的。\r\n1表示智能感知\r\n2表示视频诊断\r\n其它表示任何系统都可以使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分析设备表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_device_location
-- ----------------------------
DROP TABLE IF EXISTS `analysis_device_location`;
CREATE TABLE `analysis_device_location`
(
    `id`       int(100) NOT NULL AUTO_INCREMENT,
    `parentId` int(100) DEFAULT NULL,
    `type`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域类型',
    `name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_dict
-- ----------------------------
DROP TABLE IF EXISTS `analysis_dict`;
CREATE TABLE `analysis_dict`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `type`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '类型',
    `name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性名称',
    `value`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '属性值',
    `dsp_order`   int(3) DEFAULT NULL COMMENT '显示顺序',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '属性描述',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '是否删除;0:否、1:是',
    `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX         `IDX_ANALYSIS_DICT_TYPE`(`type`) USING BTREE,
    INDEX         `IDX_ANALYSIS_DICT_VALUE`(`value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 244 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '智能分析字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_service_system
-- ----------------------------
DROP TABLE IF EXISTS `analysis_service_system`;
CREATE TABLE `analysis_service_system`
(
    `id`          int(11) NOT NULL COMMENT '主键ID',
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务系统名称',
    `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务系统表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_task
-- ----------------------------
DROP TABLE IF EXISTS `analysis_task`;
CREATE TABLE `analysis_task`
(
    `id`                       varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '主键ID',
    `task_name`                varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
    `device_code`              varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '设备ID（摄像头）',
    `analysis_device_id`       varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '分析设备ID',
    `start_time`               varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '任务有效时间段开始时间',
    `end_time`                 varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '任务有效时间段结束时间',
    `time_id`                  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '时间模板ID',
    `exec_start_time`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '任务处理时段开始时间(每天)',
    `exec_end_time`            varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '任务处理时段结束时间(每天)',
    `exec_time`                int(11) DEFAULT NULL COMMENT '历史分析任务处理时长',
    `interval_time`            int(11) DEFAULT NULL COMMENT '处理时间间隔(分)',
    `record_start_time`        datetime(0) DEFAULT NULL COMMENT '历史视频开始时间',
    `record_end_time`          datetime(0) DEFAULT NULL COMMENT '历史视频结束时间',
    `link_video_record_status` tinyint(1) DEFAULT NULL COMMENT '联动视频录制状态; 0:未启用1:启用',
    `presetting_id`            varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '预置位ID',
    `presetting_name`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预置位名称',
    `algorithm_code`           varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '算法ID',
    `task_status`              tinyint(1) DEFAULT 0 COMMENT '任务状态:0未开始 1等待中 2分析中 3排队中 4分析异常 5已完成6暂停',
    `analysis_status`          tinyint(1) DEFAULT NULL COMMENT '分析状态;0 排队中\n1 运行中\n2 已完成\n3 停止\n4 失败\r\n\r\n（以前 目前不用0:排队中;1:运行中;2:处理异常;3:重试;4:已完成,5暂停 ）',
    `analysis_device_type`     tinyint(1) DEFAULT NULL COMMENT '分析设备类型;0:云端、1:边端',
    `type`                     tinyint(1) DEFAULT NULL COMMENT '任务类型;0:实时视频分析1:历史视频分析2:实时图片分析 3离线图片 4obj图片增量分析',
    `camera_name`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '摄像头名称',
    `decode_tag`               int(9) DEFAULT NULL COMMENT '解码标签',
    `sence_id`                 varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '设备场景ID',
    `sence_name`               varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备场景名称',
    `device_path`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '摄像头父级菜单路径',
    `del_flag`                 tinyint(1) DEFAULT 0 COMMENT '是否删除;0:否;1:是;',
    `create_time`              datetime(0) NOT NULL COMMENT '创建时间',
    `create_user`              varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建者',
    `update_time`              datetime(0) DEFAULT NULL COMMENT '最近更新时间',
    `incremental_cycle`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '增量图片分析取样频率(Cron表达式)',
    `update_user`              varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '更新者',
    `description`              text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '任务描述',
    `issue_code`               tinyint(1) DEFAULT 0 COMMENT '是否已下发;0:否;1:是;',
    `txt_url`                  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '下发图片任务的txt文件',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX                      `IDX_ANALYSISTASK_CREATETIME`(`create_time`) USING BTREE,
    INDEX                      `IDX_ANALYSISTASK_STARTTIME`(`start_time`) USING BTREE,
    INDEX                      `IDX_ANALYSISTASK_ENDTIME`(`end_time`) USING BTREE,
    INDEX                      `IDX_ANALYSISTASK_SENCEID`(`sence_id`) USING BTREE,
    INDEX                      `IDX_ANALYSISTASK_DEVICEID`(`analysis_device_id`) USING BTREE,
    INDEX                      `IDX_ANALYSIS_TASK_DELFLAG`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '智能分析任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_task_algorithm
-- ----------------------------
DROP TABLE IF EXISTS `analysis_task_algorithm`;
CREATE TABLE `analysis_task_algorithm`
(
    `task_id`        varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '智能分析任务ID;关联analysis_task.id',
    `algorithm_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法Code;关联analysis_algorithm.algorithm_code',
    `params`         varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '算法参数',
    `version`        varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法版本',
    INDEX            `idx_analysistaskalgorithm_taskid`(`task_id`) USING BTREE,
    INDEX            `IDX_ANALYSIS_TASK_ALGORITHM_CODE`(`algorithm_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '智能分析任务和算法参数关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analysis_task_push
-- ----------------------------
DROP TABLE IF EXISTS `analysis_task_push`;
CREATE TABLE `analysis_task_push`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `task_id`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '智能分析任务ID;关联analysis_task.id',
    `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务系统ID',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX        `idx_analysistaskpush_taskid`(`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '智能分析任务和结果推送到业务系统关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_card_share
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_card_share`;
CREATE TABLE `t_bi_card_share`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT COMMENT '卡片分享表主键',
    `viewId`     int(11) NOT NULL COMMENT '卡片id',
    `sharedUser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被分享人',
    `shareTime`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分享时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_card_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_card_assort`;
CREATE TABLE `t_bi_card_assort`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT COMMENT '卡片分组主键',
    `assortName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
    `createUser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
    `parentId`   int(11) DEFAULT NULL COMMENT '父级目录id',
    `status`     int(11) NOT NULL COMMENT '0 非分享目录，1分享目录',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_data_drilldown
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_data_drilldown`;
CREATE TABLE `t_bi_data_drilldown`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `viewId`   int(11) NOT NULL COMMENT '组件id',
    `reportId` int(11) NOT NULL COMMENT '下钻报表id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_default_style
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_default_style`;
CREATE TABLE `t_bi_default_style`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT COMMENT '预设样式id',
    `createUser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '创建人',
    `styleJson`  varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '样式信息',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_global_param
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_global_param`;
CREATE TABLE `t_bi_global_param`
(
    `id`              int(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `param_name`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '参数名称',
    `purpose`         int(1) DEFAULT NULL COMMENT '用途 0：指定参数值，1：数据脱敏，2：数据格式',
    `operation`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '操作符',
    `param_value`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数值（多个用逗号隔开）',
    `desensitization` int(1) DEFAULT NULL COMMENT '脱敏算法（0：掩码，1：正则替换）',
    `algorithm_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '算法参数',
    `expression`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '正则表达式',
    `str`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '替换字符',
    `format`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '时间格式',
    `time_format`     int(1) DEFAULT NULL COMMENT '指定参数（时间格式）',
    `created_user`    varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '用户名;若为空代表默认共享全局参数',
    `created_time`    datetime(0) DEFAULT NULL COMMENT '创建时间',
    `updated_time`    datetime(0) DEFAULT NULL COMMENT '更新时间',
    `is_time`         int(1) DEFAULT NULL,
    `time_value`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '时间筛选值',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX             `idx_created_user`(`created_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全局参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_global_param_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_global_param_relation`;
CREATE TABLE `t_bi_global_param_relation`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT,
    `domain_id`     int(32) DEFAULT NULL,
    `param_id`      int(11) DEFAULT NULL,
    `domain_name`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `related_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `field_type`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `field_name`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 587 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_report_share
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_report_share`;
CREATE TABLE `t_bi_report_share`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT COMMENT '分享信息主键',
    `reportId`   int(11) NOT NULL COMMENT '报表id',
    `sharedUser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被分享的用户',
    `shareTime`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX        `key_shareUser_user`(`sharedUser`) USING BTREE,
    CONSTRAINT `key_shareUser_user` FOREIGN KEY (`sharedUser`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_report_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_report_assort`;
CREATE TABLE `t_bi_report_assort`
(
    `id`         int(10) NOT NULL AUTO_INCREMENT COMMENT '报表分组id',
    `assortName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
    `createUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
    `parentId`   int(10) DEFAULT NULL COMMENT '父级分组id',
    `status`     int(10) NOT NULL DEFAULT 0 COMMENT '0 非分享目录，1 分享目录',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX        `key_reportassort_user`(`createUser`) USING BTREE,
    CONSTRAINT `key_reportassort_user` FOREIGN KEY (`createUser`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_reportinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_reportinfo`;
CREATE TABLE `t_bi_reportinfo`
(
    `id`               int(11) NOT NULL AUTO_INCREMENT COMMENT 'bi报表主键',
    `name`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表名称',
    `assortId`         int(11) NOT NULL COMMENT '报表分组id',
    `createUser`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建用户',
    `createTime`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
    `updateTime`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '最后更新时间',
    `description`      varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
    `globalStyle`      mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '全局样式',
    `status`           varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '报表状态（1为启用，2为禁用）',
    `type`             varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '类型（1：普通报表，2：模板）',
    `imgbase64`        text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '缩略图',
    `global_parameter` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全局参数',
    `domains`          mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX              `key_report_user`(`createUser`) USING BTREE,
    INDEX              `key_report_assort`(`assortId`) USING BTREE,
    CONSTRAINT `key_report_assort` FOREIGN KEY (`assortId`) REFERENCES `t_bi_report_assort` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `key_report_user` FOREIGN KEY (`createUser`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10000000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_view
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_view`;
CREATE TABLE `t_bi_view`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT '视图id',
    `name`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '视图名称',
    `assort`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '类别',
    `type`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '子类别',
    `description`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
    `sqlView`      text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '组件绘图sql',
    `isCard`       varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci    DEFAULT NULL COMMENT '是否为卡片（1：普通组件，2：复制卡片，3：关联卡片）',
    `cardAssortId` int(11) DEFAULT NULL COMMENT '卡片分组id（仅当组件为卡片时才有值）',
    `createTime`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建时间',
    `updateTime`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '最后修改时间',
    `createUser`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
    `globalStyle`  text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '全局样式',
    `domains`      text CHARACTER SET utf8 COLLATE utf8_general_ci,
    `imgbase64`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '图片地址',
    `iconUrl`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '组件icon',
    `viewStyle`    varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10000000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_view_global_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_view_global_relation`;
CREATE TABLE `t_bi_view_global_relation`
(
    `id`           int(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `report_id`    int(11) DEFAULT NULL COMMENT '报表id',
    `view_id`      int(11) DEFAULT NULL COMMENT '源组件id',
    `field_name`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关联字段名',
    `param_id`     int(11) DEFAULT NULL COMMENT '全局参数id',
    `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `idx_param_id`(`param_id`) USING BTREE,
    INDEX          `idx_view_id`(`view_id`) USING BTREE,
    INDEX          `idx_report_id`(`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组件全局关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_view_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_view_relation`;
CREATE TABLE `t_bi_view_relation`
(
    `id`                int(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `report_id`         int(11) DEFAULT NULL COMMENT '报表id',
    `source_view_id`    int(11) DEFAULT NULL COMMENT '源组件id',
    `target_view_id`    int(11) DEFAULT NULL COMMENT '目标组件id',
    `sign`              varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '运算符',
    `source_field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '源字段名',
    `target_field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '目标字段名',
    `created_time`      datetime(0) DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX               `idx_source_view_id`(`source_view_id`) USING BTREE,
    INDEX               `idx_target_view_id`(`target_view_id`) USING BTREE,
    INDEX               `idx_report_id`(`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组件关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_view_location
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_view_location`;
CREATE TABLE `t_bi_view_location`
(
    `id`        int(11) NOT NULL AUTO_INCREMENT,
    `reportId`  int(11) DEFAULT NULL COMMENT '报表ID',
    `viewId`    int(11) DEFAULT NULL COMMENT '视图ID',
    `location`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组件视图的位置信息',
    `viewStyle` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '组件样式',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX       `key_view_location`(`viewId`) USING BTREE,
    CONSTRAINT `key_view_location` FOREIGN KEY (`viewId`) REFERENCES `t_bi_view` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1871 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件夹名称或图片名称',
    `aliaName`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '别名',
    `type`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '类型，1：文件夹 2：图片',
    `parentId`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `path`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相对路径',
    `httpPath`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '绝对路径',
    `delCode`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '1' COMMENT '1：未删除 2：已删除',
    `picture`     mediumblob COMMENT '图片缩略图',
    `size`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '原图大小',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
    `source`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片来源',
    `uploadTime`  datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP (3) ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '上传时间',
    `modifyTime`  datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP (3) ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_import_table_log
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_import_table_log`;
CREATE TABLE `t_asset_import_table_log`
(
    `db`             varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '数据源名称',
    `table_name`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '表名称',
    `counts`         int(11) DEFAULT NULL COMMENT '导入数量',
    `partition_date` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '分区日期',
    `imp_type`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '导入类型（ALL:全量导入, INC:增量导入）',
    `msg`            varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '返回消息信息',
    `start_time`     datetime(0) DEFAULT NULL COMMENT '开始时间',
    `end_time`       datetime(0) DEFAULT NULL COMMENT '结束时间',
    `config_id`      int(11) DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipc_group
-- ----------------------------
DROP TABLE IF EXISTS `ipc_group`;
CREATE TABLE `ipc_group`
(
    `id`           varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `ipcGroupName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分组名称',
    `description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
    `delCode`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '是否删除，0：未删除，1：已删除',
    `createTime`   datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `createUser`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipc_group_info
-- ----------------------------
DROP TABLE IF EXISTS `ipc_group_info`;
CREATE TABLE `ipc_group_info`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
    `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ipc分组id',
    `dev_id`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ipc设备id',
    `dev_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ipc设备code',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 300000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipc_source
-- ----------------------------
DROP TABLE IF EXISTS `ipc_source`;
CREATE TABLE `ipc_source`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
    `name`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台来源不能为空，名字不能重复',
    `create_time` datetime(0) NOT NULL COMMENT '创建时间',
    `desc`        varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台来源描述',
    `logo`        mediumblob COMMENT '图片头像',
    `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
    `createUser`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_model
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_model`;
CREATE TABLE `t_analysis_model`
(
    `id`                int(32) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `model_name`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '模型名称',
    `icon_url`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '对用图标名称',
    `exe_sql`           varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模型对应的sql',
    `model_type`        int(2) DEFAULT NULL COMMENT '模型类型，基础类型==1、自定义类型==2',
    `datasourceid`      int(32) DEFAULT NULL COMMENT '数据源主键id',
    `isdelete`          int(2) DEFAULT NULL COMMENT '记录软删除',
    `create_user`       char(20) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL COMMENT '创建人',
    `create_time`       timestamp NOT NULL                                       DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       datetime(0) DEFAULT NULL COMMENT '更新时间',
    `relationship_json` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模型关联关系信息',
    `description`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '描述信息',
    `extra1`            mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模型信息',
    `extra2`            varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '连线信息',
    `extra3`            int(20) NOT NULL DEFAULT 100 COMMENT '模型分类外键',
    `status`            int(10) DEFAULT 1 COMMENT '自定义实体标识: 2表示自定义实体',
    `statu`             char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       DEFAULT '1' COMMENT '显示状态(1 为启用 0 弃用 默认为1)',
    `modeltip`          varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模型描述',
    `modelscene`        varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应用场景',
    `modelthinking`     varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设计思路',
    `modelresult`       varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '已有成果或预期结果',
    `modeldiff`         varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模型存在的问题和难点',
    `shared_state`      varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci    DEFAULT NULL COMMENT '分享状态;1:已分享 0:未分享',
    `contained_entity`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci    DEFAULT NULL COMMENT '实体类型;01:不包含分享实体 02：包含分享实体',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX               `t_modelnfo_user`(`create_user`) USING BTREE,
    CONSTRAINT `t_modelnfo_user` FOREIGN KEY (`create_user`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10000000 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_model_label
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_model_label`;
CREATE TABLE `t_analysis_model_label`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `model_id`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型id',
    `label_id`    int(32) NOT NULL COMMENT '标签id',
    `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者id',
    `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
    `remark`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用字段',
    `extra`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用字段',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX         `key_modelLabel_user`(`create_user`) USING BTREE,
    CONSTRAINT `key_modelLabel_user` FOREIGN KEY (`create_user`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 300 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_model_domain_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_model_domain_relation`;
CREATE TABLE `t_analysis_model_domain_relation`
(
    `id`           int(32) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `model_id`     int(11) DEFAULT NULL COMMENT '模型ID',
    `domain_id`    int(11) DEFAULT NULL COMMENT '实体ID',
    `create_user`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
    `created_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
    `quote_type`   varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '引用类型;1：模型引用的实体 2：任务生成的实体',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `idx_user_model`(`create_user`, `model_id`) USING BTREE,
    INDEX          `idx_user_domain`(`create_user`, `domain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1962 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型引用实体关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`
(
    `client_id`               varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `resource_ids`            varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `client_secret`           varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `scope`                   varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `authorized_grant_types`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `authorities`             varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `access_token_validity`   int(11) DEFAULT NULL,
    `refresh_token_validity`  int(11) DEFAULT NULL,
    `additional_information`  varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `autoapprove`             varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for obs_bucket_info
-- ----------------------------
DROP TABLE IF EXISTS `obs_bucket_info`;
CREATE TABLE `obs_bucket_info`
(
    `id`               int(255) NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `bucket_name`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '桶名',
    `account_name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '华为云账号名称',
    `del_code`         tinyint(1) DEFAULT 0 COMMENT '是否删除，0：未删除 1：已删除',
    `access_key`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '华为云AK',
    `secret_accessKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '华为云SK',
    `end_point`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '华为云endpoint',
    `createTime`       datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `sys_time`         datetime(0) DEFAULT NULL COMMENT '最近同步时间',
    `account_id`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应storage_manage中的id字段',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`
(
    `sched_name`    varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `blob_data`     blob,
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`
(
    `sched_name`    varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `calendar`      blob                                                    NOT NULL,
    PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`
(
    `sched_name`      varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_name`    varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_group`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `time_zone_id`    varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`
(
    `sched_name`        varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `entry_id`          varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `trigger_name`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_group`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `instance_name`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `fired_time`        bigint(13) NOT NULL,
    `sched_time`        bigint(13) NOT NULL,
    `priority`          int(11) NOT NULL,
    `state`             varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `job_name`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `job_group`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `is_nonconcurrent`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL,
    `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL,
    PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`
(
    `sched_name`        varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `job_name`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `job_group`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `description`       varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `job_class_name`    varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `is_durable`        varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `is_nonconcurrent`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `is_update_data`    varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `job_data`          blob,
    PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`
(
    `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `lock_name`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`
(
    `sched_name`    varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`
(
    `sched_name`        varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `instance_name`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `last_checkin_time` bigint(13) NOT NULL,
    `checkin_interval`  bigint(13) NOT NULL,
    PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`
(
    `sched_name`      varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_name`    varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_group`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `repeat_count`    bigint(7) NOT NULL,
    `repeat_interval` bigint(12) NOT NULL,
    `times_triggered` bigint(10) NOT NULL,
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`
(
    `sched_name`    varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `str_prop_1`    varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `str_prop_2`    varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `str_prop_3`    varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `int_prop_1`    int(11) DEFAULT NULL,
    `int_prop_2`    int(11) DEFAULT NULL,
    `long_prop_1`   bigint(20) DEFAULT NULL,
    `long_prop_2`   bigint(20) DEFAULT NULL,
    `dec_prop_1`    decimal(13, 4)                                          DEFAULT NULL,
    `dec_prop_2`    decimal(13, 4)                                          DEFAULT NULL,
    `bool_prop_1`   varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL,
    `bool_prop_2`   varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL,
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`
(
    `sched_name`     varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_name`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `trigger_group`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `job_name`       varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `job_group`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `description`    varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `next_fire_time` bigint(13) DEFAULT NULL,
    `prev_fire_time` bigint(13) DEFAULT NULL,
    `priority`       int(11) DEFAULT NULL,
    `trigger_state`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `trigger_type`   varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `start_time`     bigint(13) NOT NULL,
    `end_time`       bigint(13) DEFAULT NULL,
    `calendar_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `misfire_instr`  smallint(2) DEFAULT NULL,
    `job_data`       blob,
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    INDEX            `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
    CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rpt_assort
-- ----------------------------
DROP TABLE IF EXISTS `rpt_assort`;
CREATE TABLE `rpt_assort`
(
    `ID`          bigint(32) NOT NULL AUTO_INCREMENT,
    `NAME`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类名称',
    `STATUS`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT '1' COMMENT '共享状态 0关闭 1启用',
    `CREATE_USER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类创建者',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rpt_baseinfo
-- ----------------------------
DROP TABLE IF EXISTS `rpt_baseinfo`;
CREATE TABLE `rpt_baseinfo`
(
    `ID`           varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `NAME`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '名称',
    `ASSORT_ID`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '报表分类ID',
    `TYPE`         varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '类型',
    `CREATE_USER`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建者',
    `CREATE_DATE`  datetime(0) DEFAULT NULL COMMENT '创建时间',
    `DESCRIBTION`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
    `USESTATUS`    varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci    DEFAULT NULL,
    `HOMEUSE_TIME` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (0),
    `HOMEUSE`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT '0' COMMENT '大屏使用',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rpt_component
-- ----------------------------
DROP TABLE IF EXISTS `rpt_component`;
CREATE TABLE `rpt_component`
(
    `ID`            varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `IMAGE_NAME`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '图片名称',
    `URL`           varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接',
    `TYPEChild`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '子类型',
    `TYPE`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       DEFAULT NULL COMMENT '类型 (0文本，1链接，2图片)',
    `JSON_STYLE`    varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '样式JSON',
    `TEXT`          text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文本',
    `etc`           varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `JSON`          varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联动组件的json',
    `REALTION`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '联动字段',
    `TABLE_NAME_EN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '表名',
    `TABLE_NAME_CN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '表描述',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rpt_homeuse
-- ----------------------------
DROP TABLE IF EXISTS `rpt_homeuse`;
CREATE TABLE `rpt_homeuse`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT,
    `rpt_name`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `createuser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `shareuser`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `homeuse`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rpt_t_analysis_model
-- ----------------------------
DROP TABLE IF EXISTS `rpt_t_analysis_model`;
CREATE TABLE `rpt_t_analysis_model`
(
    `ID`            varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `NAME`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '名称',
    `ASSORT_ID`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '报表分类ID',
    `TYPE`          varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '类型',
    `CREATE_USER`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建者',
    `CREATE_DATE`   datetime(0) DEFAULT NULL COMMENT '创建时间',
    `DESCRIBTION`   varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
    `USESTATUS`     varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci    DEFAULT NULL,
    `modelinfoJson` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模板json',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rpt_shareinfo
-- ----------------------------
DROP TABLE IF EXISTS `rpt_shareinfo`;
CREATE TABLE `rpt_shareinfo`
(
    `ID`          bigint(32) NOT NULL AUTO_INCREMENT,
    `REPORT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '报表名称',
    `SHARE_USER`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分享者',
    `SOURCE_FROM` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL COMMENT '0代表用户  1代表角色',
    `CREATE_USER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '报表创建者',
    `SHARE_ID`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rpt_theme
-- ----------------------------
DROP TABLE IF EXISTS `rpt_theme`;
CREATE TABLE `rpt_theme`
(
    `id`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
    `style`       varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '样式',
    `create_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建者',
    `create_date` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rpt_view
-- ----------------------------
DROP TABLE IF EXISTS `rpt_view`;
CREATE TABLE `rpt_view`
(
    `ID`           varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
    `NAME`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL,
    `BGIMAGE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '背景图片名称',
    `BGCOLOR`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '背景色',
    `ASSORT`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '类别',
    `TYPE`         varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '子类别',
    `SHOW_TOOLBOX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       DEFAULT '0' COMMENT '是否展示图形工具(0不展示 1展示)',
    `DESCRIBTION`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
    `ETC`          mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '备注',
    `sqlview`      varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组件绘图sql',
    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rpt_view_column
-- ----------------------------
DROP TABLE IF EXISTS `rpt_view_column`;
CREATE TABLE `rpt_view_column`
(
    `id`               int(11) NOT NULL AUTO_INCREMENT,
    `rpt_view_id`      varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT '' COMMENT '试图ID',
    `column_name`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT '' COMMENT '字段名',
    `column_alias`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字段中文',
    `column_status`    char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL COMMENT '字段划分类型（0维度 1值）',
    `status`           char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT '' COMMENT '状态信息（0新增 1转换）',
    `column_alias_now` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字段中文字典（备用字段）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for storage_manage
-- ----------------------------
DROP TABLE IF EXISTS `storage_manage`;
CREATE TABLE `storage_manage`
(
    `id`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '外部存储id',
    `externalStorage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外部存储名称',
    `ip`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ip地址',
    `port`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '端口',
    `accountName`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号名称',
    `account`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录账号',
    `password`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
    `sysTime`         datetime(0) DEFAULT NULL COMMENT '最近同步时间',
    `accessKey`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '华为云AK',
    `secretAccessKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '华为云SK',
    `bucketName`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '桶名',
    `endPoint`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '华为云endpoint',
    `delCode`         tinyint(1) DEFAULT 0 COMMENT '是否删除，0：未删除 1：已删除',
    `createTime`      datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `status`          tinyint(1) DEFAULT 0 COMMENT '绑定状态，0：绑定 1：解绑',
    `createUser`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_algorithm_label
-- ----------------------------
DROP TABLE IF EXISTS `t_algorithm_label`;
CREATE TABLE `t_algorithm_label`
(
    `id`        int(8) NOT NULL,
    `name`      varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
    `parent_id` smallint(8) DEFAULT NULL COMMENT '父标签',
    `del_code`  smallint(1) DEFAULT 0 COMMENT '1表示删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci COMMENT = '算法标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_algorithm_result_label
-- ----------------------------
DROP TABLE IF EXISTS `t_algorithm_result_label`;
CREATE TABLE `t_algorithm_result_label`
(
    `id`         varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT 'video_algorithm_result_info的id',
    `label_code` varchar(30) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL COMMENT '标签code 关联t_alogrithm_code',
    `count`      varchar(20) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`, `label_code`) USING BTREE,
    INDEX        `count`(`count`) USING BTREE,
    INDEX        `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci COMMENT = '任务结果 算法标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_authority`;
CREATE TABLE `t_authority`
(
    `id`     int(100) NOT NULL AUTO_INCREMENT,
    `roleid` int(100) DEFAULT NULL COMMENT '角色ID',
    `menuid` int(100) DEFAULT NULL COMMENT '菜单ID',
    `state`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT '1' COMMENT '启用状态 默认启用 0为弃用',
    `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '权限备注: 1 菜单  2 数据实体  3 模型',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_area
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_area`;
CREATE TABLE `t_bi_area`
(
    `adcode`       int(10) NOT NULL COMMENT '行政区划代码',
    `name`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '城市名称',
    `center`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '中心点经纬度',
    `centroid`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `children_num` int(2) DEFAULT NULL COMMENT '下级数量',
    `level`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '等级',
    `parent`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上级行政区划代码',
    `acroutes`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `geojson`      longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'geojson',
    PRIMARY KEY (`adcode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bi_picture_status
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_picture_status`;
CREATE TABLE `t_bi_picture_status`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT,
    `picture_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片名称',
    `relative_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '相对路径',
    `upload_time`   datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP (3) ON UPDATE CURRENT_TIMESTAMP (3) COMMENT '上传时间',
    `create_user`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 343 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'BI图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_column_label
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_column_label`;
CREATE TABLE `t_asset_column_label`
(
    `id`        int(11) NOT NULL AUTO_INCREMENT,
    `column_id` int(11) DEFAULT NULL,
    `label_id`  int(11) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `key_column_id`(`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
    `value`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '值',
    `unit`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位',
    `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_integration_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_integration_collect`;
CREATE TABLE `t_integration_collect`
(
    `task_name`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务名称',
    `loader_id`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务id',
    `f_sourceid`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '源端数据源id',
    `f_warehouse`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '源端数据库名',
    `f_table`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '源端表名',
    `to_sourceid`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '目的端数据源名',
    `to_d_name`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '目的端实体名',
    `to_table`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '目的端表名',
    `starttime`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开始时间',
    `stoptime`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '结束时间',
    `create_user`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
    `create_time`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建时间',
    `strategy`            longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '策略',
    `platform`            varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '数据采集任务所在平台',
    `cycle_interval_no`   int(10) DEFAULT NULL COMMENT '循环周期',
    `cycle_interval_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '循环周期单位',
    `status`              int(2) DEFAULT '1' COMMENT '1:启用  0:停用',
    INDEX                 `key_acquisition_user`(`create_user`) USING BTREE,
    CONSTRAINT `key_acquisition_user` FOREIGN KEY (`create_user`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_integration_datasource
-- ----------------------------
DROP TABLE IF EXISTS `t_integration_datasource`;
CREATE TABLE `t_integration_datasource`
(
    `id`              varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源id',
    `create_user`     varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL,
    `d_type`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '数据源类型',
    `d_createtime`    datetime(0) DEFAULT NULL COMMENT '创建时间',
    `d_updatetime`    datetime(0) DEFAULT NULL COMMENT '修改时间',
    `d_database_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '数据库名称',
    `d_alias`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '数据源名称',
    `d_driver`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '驱动名称',
    `d_url`           varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '数据源URL',
    `d_port`          int(8) DEFAULT NULL COMMENT '端口号',
    `d_auth`          varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '认证方式',
    `d_username`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '用户名',
    `d_password`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '密码',
    `d_description`   varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
    `d_encode`        varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '数据库编码格式',
    `extra1`          varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT 'sql' COMMENT '数据源对应的group的值 默认sql',
    `d_ftppath`       varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT 'FTP文件路径',
    `d_sidname`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT 'SID名称',
    `d_table`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '表名',
    `d_tableUrl`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '表路径',
    `platform`        varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '数据源所在平台',
    `d_zkUrl`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT 'zookeeperIP',
    `failure_times`   int(2) DEFAULT '0' COMMENT '创库失败次数',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX             `key_datasource_user`(`create_user`) USING BTREE,
    CONSTRAINT `key_datasource_user` FOREIGN KEY (`create_user`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionaries`;
CREATE TABLE `t_dictionaries`
(
    `char_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字符编码',
    `char_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字符名称',
    `state`     char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT '1' COMMENT '启用状态(1 启用 0 弃用) 默认启用',
    `remark`    varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用字段',
    PRIMARY KEY (`char_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_dictionvalue
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionvalue`;
CREATE TABLE `t_dictionvalue`
(
    `char_id`       int(100) NOT NULL AUTO_INCREMENT,
    `char_code`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字符编码',
    `char_value`    varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字符对应值',
    `value_name`    varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci          DEFAULT NULL COMMENT '字符值中文注释',
    `char_parentid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '对应的父类Id',
    `state`         char(1) CHARACTER SET utf8 COLLATE utf8_general_ci               DEFAULT '1' COMMENT '启用状态(1 启用 0 弃用) 默认启用',
    `remark`        varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci         DEFAULT NULL COMMENT '备用字段',
    PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_domain
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_domain`;
CREATE TABLE `t_asset_domain`
(
    `id`                     int(32) NOT NULL AUTO_INCREMENT COMMENT '实体表ID',
    `domain_assort_id`       int(32) DEFAULT NULL COMMENT '分类ID',
    `datasource_id`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT '100' COMMENT '数据源ID(100为自定义数据源)',
    `domain_name`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表英文名',
    `domain_alias`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原中文名',
    `domain_img`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'people.png' COMMENT '实体图标',
    `create_time`            datetime(0) DEFAULT NULL COMMENT '创建时间',
    `update_time`            datetime(0) DEFAULT NULL COMMENT '修改时间',
    `status`                 char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL COMMENT '显示状态 1显示 0关闭 -1 删除',
    `extra1`                 varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '自定义实体的外键 与对应的t_analysis_model的id一致',
    `create_user`            varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建人',
    `hive_name`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'hive唯一化名称',
    `hive_db_name`           varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'hive数据库名称',
    `reusltId`               varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `auto_match`             char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT '1' COMMENT '是否自动匹配(1 自动 0 手动)',
    `domain_count`           varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `is_count`               char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT '1' COMMENT '1代表已经计算,0和null代表未统计',
    `dataentity_description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `synchro_type`           char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据同步类型‘1’实时，‘2’定期但是数据采集任务已被删除，其他为 loaderId',
    `import_type`            char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体导入方式，1连接资源 2平台资源 3手工导入 4模型结果集',
    `is_generate`            char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '该实体是否正在生成:0表示正在生成,1表示生成完毕',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX                    `key_domain_datasource`(`datasource_id`) USING BTREE,
    INDEX                    `key_domain_user`(`create_user`) USING BTREE,
    CONSTRAINT `key_domain_user` FOREIGN KEY (`create_user`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10000000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_domain_alter_log
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_domain_alter_log`;
CREATE TABLE `t_asset_domain_alter_log`
(
    `domainid`     bigint(20) DEFAULT NULL,
    `domain_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `domain_alias` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `a_describe`   varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `a_type`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `operator`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `create_time`  datetime(0) DEFAULT NULL,
    INDEX          `key_domainLog_user`(`operator`) USING BTREE,
    CONSTRAINT `key_domainLog_user` FOREIGN KEY (`operator`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_domain_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_domain_assort`;
CREATE TABLE `t_asset_domain_assort`
(
    `id`          int(32) NOT NULL AUTO_INCREMENT,
    `assrot_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类中文名',
    `assrot_img`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '分类图片',
    `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT NULL COMMENT '显示状态(1 为启用 0 弃用 默认为1 删除 为2)',
    `extra1`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '保留字段',
    `range`       varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '排序用的',
    `parent_id`   int(32) DEFAULT NULL COMMENT '上一级菜单id',
    `is_move`     int(255) DEFAULT NULL COMMENT '为1该目录不能操作（分享给我的），为0该目录可以进行操作',
    `is_share`    int(255) DEFAULT NULL COMMENT '是否为分享给我的的子目录',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX         `key_domainAssort_user`(`extra1`) USING BTREE,
    CONSTRAINT `key_domainAssort_user` FOREIGN KEY (`extra1`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 268 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_domain_column
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_domain_column`;
CREATE TABLE `t_asset_domain_column`
(
    `id`                    int(32) NOT NULL AUTO_INCREMENT COMMENT '字段ID',
    `domain_id`             int(32) DEFAULT NULL COMMENT '实体id',
    `colunm_name`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '列名',
    `colunm_name_alias`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '原中文名',
    `colunm_name_alias_now` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '现中文名',
    `column_type`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '列类型',
    `column_length`         int(11) DEFAULT NULL COMMENT '列长度',
    `column_dot_length`     int(11) DEFAULT NULL COMMENT '列小数点位数',
    `status`                char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT '1' COMMENT '显示状态(1 启用 0关闭)',
    `colunm_hint_details`   text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '字段提示信息',
    `column_dist`           varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '对应的字典表字段信息',
    `column_index`          int(32) DEFAULT NULL,
    `ident`                 int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '逻辑删除：1为新  0为旧',
    `column_push`           int(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推送: 0 不推送  1 推送',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX                   `key_column_domain`(`domain_id`) USING BTREE,
    CONSTRAINT `key_column_domain` FOREIGN KEY (`domain_id`) REFERENCES `t_asset_domain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 108411 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_domain_relationship
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_domain_relationship`;
CREATE TABLE `t_asset_domain_relationship`
(
    `parent_id`   bigint(20) NOT NULL,
    `child_id`    bigint(20) NOT NULL,
    `model_id`    varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `task_id`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `task_name`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `create_time` date                                                    DEFAULT NULL,
    `is_generate` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否生成:0正在生成 1生成完毕',
    PRIMARY KEY (`parent_id`, `child_id`) USING BTREE,
    INDEX         `key_domainShip_user`(`create_user`) USING BTREE,
    CONSTRAINT `key_domainShip_user` FOREIGN KEY (`create_user`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_domainshare_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_domainshare_subscribe`;
CREATE TABLE `t_asset_domainshare_subscribe`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `domain_id`      int(11) DEFAULT NULL COMMENT '实体ID',
    `dimension_id`   int(20) DEFAULT NULL COMMENT '维度id',
    `create_time`    datetime(0) DEFAULT NULL COMMENT '创建时间',
    `dimension_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '维度类型;1：角色维度 2：用户维度',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX            `idx_domain_id`(`domain_id`) USING BTREE,
    INDEX            `idx_dimension_id`(`dimension_id`) USING BTREE,
    INDEX            `idx_dimension_type`(`dimension_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '实体分享关联明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_domainshare_ownerassort
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_domainshare_ownerassort`;
CREATE TABLE `t_asset_domainshare_ownerassort`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `domain_id`   int(11) DEFAULT NULL COMMENT '实体ID',
    `assort_id`   int(11) DEFAULT NULL COMMENT '目录ID',
    `user_id`     int(11) DEFAULT NULL COMMENT '被分享的用户ID',
    `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX         `idx_domain_id`(`domain_id`) USING BTREE,
    INDEX         `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '实体分享用户配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ds_api
-- ----------------------------
DROP TABLE IF EXISTS `t_ds_api`;
CREATE TABLE `t_ds_api`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
    `user`        varchar(10)  NOT NULL COMMENT '创建人',
    `api_name`    varchar(100) NOT NULL COMMENT 'api名称',
    `assort_id`   int(11) NOT NULL COMMENT '目录ID',
    `protocol`    varchar(10)  NOT NULL COMMENT '传输协议（http\\https）',
    `method`      varchar(10)  NOT NULL COMMENT '请求方式（get\\post）',
    `path`        varchar(255) NOT NULL COMMENT '请求path',
    `content`     varchar(500) DEFAULT NULL COMMENT '文本描述',
    `create_mode` int(11) NOT NULL COMMENT 'api创建模式（1:表单向导模式   2:SQL脚本模式）',
    `param_id`    varchar(100) NOT NULL COMMENT '配置参数信息',
    `sql_script`  text         DEFAULT NULL COMMENT 'sql脚本（仅SQL脚本模式该字段有值）',
    `state`       varchar(2)   NOT NULL COMMENT '状态（1：待调试  2：待发布  3：已发布  4：已下线）',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime     DEFAULT NULL COMMENT '最后更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10000000 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `t_ds_app`
(
    `app_name`        varchar(100) DEFAULT NULL COMMENT '应用名称',
    `app_id`          varchar(20) NOT NULL COMMENT 'app id',
    `desc`            varchar(200) DEFAULT NULL COMMENT '描述',
    `create_time`     datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime     DEFAULT NULL COMMENT '更新时间',
    `state`           int(11) DEFAULT NULL COMMENT '0启用 1禁用',
    `app_code`        varchar(100) DEFAULT NULL COMMENT '简单认证码',
    `app_secret_key`  varchar(100) DEFAULT NULL COMMENT '加密签名身份认证key',
    `app_secret_code` varchar(100) DEFAULT NULL COMMENT '加密签名密码',
    `app_user`        varchar(32)  DEFAULT NULL COMMENT '创建者',
    PRIMARY KEY (`app_id`),
    KEY               `t_ds_app_app_id_IDX` (`app_id`) USING BTREE,
    KEY               `t_ds_app_app_name_IDX` (`app_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='api应用管理';

CREATE TABLE `t_ds_app_api`
(
    `app_id`      varchar(100) NOT NULL,
    `api_id`      int(32) NOT NULL,
    `end_time`    datetime DEFAULT NULL COMMENT '授权结束时间',
    `create_time` datetime DEFAULT NULL COMMENT '授权时间',
    `assort_id`   bigint(20) DEFAULT NULL COMMENT 'api授权给别人的应用，挂载的目录id',
    PRIMARY KEY (`app_id`, `api_id`),
    KEY           `t_ds_app_api_app_id_IDX` (`app_id`) USING BTREE,
    KEY           `t_ds_app_api_api_id_IDX` (`api_id`) USING BTREE,
    KEY           `t_ds_app_api_create_time_IDX` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ds_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_ds_assort`;
CREATE TABLE `t_ds_assort`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '目录id',
    `name`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
    `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
    `status`      varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
    `parent_id`   int(11) DEFAULT NULL COMMENT '父目录id',
    `is_share`    int(11) DEFAULT NULL COMMENT '0-非分享，1-分享',
    `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据服务目录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ds_parameter
-- ----------------------------
DROP TABLE IF EXISTS `t_ds_parameter`;
CREATE TABLE `t_ds_parameter`
(
    `id`           int(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
    `domain_id`    int(20) NOT NULL COMMENT '实体id',
    `input_param`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '入参',
    `output_param` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '出参',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_face_data
-- ----------------------------
DROP TABLE IF EXISTS `t_face_data`;
CREATE TABLE `t_face_data`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `aliaName`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `type`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '1:人脸库 2:人名 3:图片',
    `parentId`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '父节点id',
    `path`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
    `httpPath`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '链接路径',
    `uploadTime`  datetime(3) NOT NULL,
    `modifyTime`  datetime(3) NOT NULL,
    `picture`     mediumblob COMMENT '图片',
    `size`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '样本管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_form_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_form_assort`;
CREATE TABLE `t_form_assort`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `assort_name` varchar(255) DEFAULT NULL COMMENT '目录名称',
    `parent_id`   int(11) DEFAULT NULL COMMENT '父目录ID',
    `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_form_field
-- ----------------------------
DROP TABLE IF EXISTS `t_form_field`;
CREATE TABLE `t_form_field`
(
    `id`                   int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `field_name`           varchar(255) DEFAULT NULL COMMENT '变量名',
    `alias_name`           varchar(255) DEFAULT NULL COMMENT '中文名称',
    `cell_type`            int(1) DEFAULT NULL COMMENT '属性（0：静态变量，1：动态变量） ',
    `input_type`           int(1) DEFAULT NULL COMMENT '输入类型',
    `field_type`           int(1) DEFAULT NULL COMMENT '字段类型',
    `form_id`              int(10) DEFAULT NULL COMMENT '表单ID',
    `group_json`           varchar(255) DEFAULT NULL COMMENT '分组名称',
    `sort`                 int(10) DEFAULT NULL COMMENT '排序字段',
    `tip`                  varchar(255) DEFAULT NULL COMMENT '提示',
    `maximum_words`        int(11) DEFAULT NULL COMMENT '最大字数',
    `default_content_type` int(11) DEFAULT NULL COMMENT '默认值类型，0自定义',
    `default_content`      varchar(255) DEFAULT NULL COMMENT '默认值',
    `is_required`          int(11) DEFAULT NULL COMMENT '是否必填，0必填，1非必填',
    `is_repeatable`        int(11) DEFAULT NULL COMMENT '是否可重复，0可重复，1不可重复',
    `user_ids`             varchar(255) DEFAULT NULL COMMENT '用户ID',
    `role_ids`             varchar(255) DEFAULT NULL COMMENT '角色ID',
    `limit_content`        int(11) DEFAULT NULL COMMENT '限制内容，0限制，1不限制',
    `inputable_type`       varchar(255) DEFAULT NULL COMMENT '可输入内容',
    `allowable_negative_number` int(11) DEFAULT NULL COMMENT '允许负数，0允许，1不允许',
    `allowable_decimal`    int(11) DEFAULT NULL COMMENT '允许小数，0允许，1不允许',
    `decimal_places`       int(11) DEFAULT NULL COMMENT '小数位数',
    `display_format`       int(11) DEFAULT NULL COMMENT '显示格式，0无，1千分位，2百分号',
    `limit_value_range`    int(11) DEFAULT NULL COMMENT '限制数值范围，0限制，1不限制',
    `value_range`          varchar(255) DEFAULT NULL COMMENT '数值范围',
    `option_content_type`  int(11) DEFAULT NULL COMMENT '选项内容类型，0自定义，1关联已有数据',
    `option_content`       varchar(255) DEFAULT NULL COMMENT '选项内容',
    `selection_mode`       int(11) DEFAULT NULL COMMENT '选择方式，0单选，1多选',
    `limit_option_number`  int(11) DEFAULT NULL COMMENT '限制选项数',
    `limit_number`         varchar(255) DEFAULT NULL COMMENT '限制数量',
    `limit_option_share`   int(11) DEFAULT NULL COMMENT '限制选项份额',
    `arrangement_mode`     int(11) DEFAULT NULL COMMENT '排布方式，0横向排布，1竖向排布',
    `fill_type`            int(11) DEFAULT NULL COMMENT '填充方向  1:竖向  2：横向',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_form_info
-- ----------------------------
DROP TABLE IF EXISTS `t_form_info`;
CREATE TABLE `t_form_info`
(
    `id`               int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `form_name`        varchar(255) DEFAULT NULL COMMENT '表单名称',
    `form_assort_id`   int(11) DEFAULT NULL COMMENT '表单目录ID',
    `description`      varchar(500) DEFAULT NULL COMMENT '描述',
    `form_template_id` int(11) DEFAULT NULL COMMENT '模版ID',
    `create_user`      varchar(255) DEFAULT NULL COMMENT '创建者',
    `status`           int(11) DEFAULT NULL COMMENT '是否启用，0启用，1停用 ',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_form_task_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_form_task_assort`;
CREATE TABLE `t_form_task_assort`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `assort_name` varchar(255) DEFAULT NULL COMMENT '目录名称',
    `parent_id`   int(11) DEFAULT NULL COMMENT '父目录ID',
    `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_form_task_data
-- ----------------------------
DROP TABLE IF EXISTS `t_form_task_data`;
CREATE TABLE `t_form_task_data`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `static_json`  text COMMENT '静态数据json',
    `dynamic_json` text COMMENT '动态数据json',
    `type`         int(2) DEFAULT NULL COMMENT '0：静态  1：动态',
    `create_user`  varchar(50) DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime    DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_form_task_info
-- ----------------------------
DROP TABLE IF EXISTS `t_form_task_info`;
CREATE TABLE `t_form_task_info`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `task_name`      varchar(255) DEFAULT NULL COMMENT '任务名称',
    `task_assort_id` int(11) DEFAULT NULL COMMENT '任务目录ID',
    `visual_task_assort_id` int(11) DEFAULT NULL COMMENT '虚拟任务目录ID',
    `form_id`        int(11) DEFAULT NULL COMMENT '表单ID',
    `log_id`         int(11) DEFAULT NULL COMMENT '日志id',
    `description`    varchar(500) DEFAULT NULL COMMENT '描述',
    `create_user`    varchar(255) DEFAULT NULL COMMENT '创建者',
    `status`         int(11) DEFAULT NULL COMMENT '填报状态，0填报，1填报中 ',
    `operator`       varchar(255) DEFAULT NULL COMMENT '操作人',
    `user_ids`       varchar(255) DEFAULT NULL COMMENT '用户列表',
    `role_ids`       varchar(255) DEFAULT NULL COMMENT '角色列表',
    `create_time`    datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_form_task_log
-- ----------------------------
DROP TABLE IF EXISTS `t_form_task_log`;
CREATE TABLE `t_form_task_log`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `task_id`     int(11) NOT NULL COMMENT '任务id',
    `data_ids`    text COMMENT '填报数据id列表',
    `operate`     varchar(255) DEFAULT NULL COMMENT '操作方式',
    `create_user` varchar(50)  DEFAULT NULL COMMENT '创建人',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    KEY           `task_id` (`task_id`) USING BTREE COMMENT '单列索引'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_form_template
-- ----------------------------
DROP TABLE IF EXISTS `t_form_template`;
CREATE TABLE `t_form_template`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`         varchar(255) NOT NULL COMMENT '模板名称',
    `assort_id`    int(11) DEFAULT NULL COMMENT '目录Id',
    `description`  varchar(500) DEFAULT NULL COMMENT '模板描述',
    `create_type`  int(1) DEFAULT NULL COMMENT '模板类型(1：在线设计，2：word文件导入，3：excel文件导入)',
    `create_user`  varchar(255) NOT NULL COMMENT '创建人',
    `state`        int(1) DEFAULT NULL COMMENT '模板状态(0：停用；1：启用)',
    `path`         varchar(255) DEFAULT NULL COMMENT '含变量文件',
    `preview_path` varchar(255) DEFAULT NULL COMMENT '无变量文件、在线上传Excel文件',
    `create_time`  datetime     NOT NULL COMMENT '创建时间',
    `update_time`  datetime     NOT NULL COMMENT '更新时间',
    `file_name`    varchar(255) DEFAULT NULL COMMENT '文件名',
    `fore_Expand`  mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全局样式',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10063 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for t_form_template_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_form_template_assort`;
CREATE TABLE `t_form_template_assort`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) DEFAULT NULL,
    `parent_id`   int(11) DEFAULT NULL,
    `create_time` datetime     DEFAULT NULL,
    `create_user` varchar(255) DEFAULT NULL,
    `update_time` datetime     DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_form_template_field
-- ----------------------------
DROP TABLE IF EXISTS `t_form_template_field`;
CREATE TABLE `t_form_template_field`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `field_name`  varchar(255) DEFAULT NULL COMMENT '字段名',
    `alias_name`  varchar(255) DEFAULT NULL COMMENT '中文名称',
    `cell_type`   int(1) NOT NULL COMMENT '单元格类型 0：静态变量；1：动态变量',
    `input_type`  int(1) DEFAULT NULL COMMENT '输入类型 1：输入框 2：文本框',
    `field_type`  int(1) DEFAULT NULL COMMENT '字段类型 1：int类型  2：String类型',
    `template_id` int(11) DEFAULT NULL COMMENT '模板Id',
    `group_json`  varchar(255) DEFAULT NULL COMMENT '动态组属性',
    `sort`        int(11) DEFAULT NULL COMMENT '排序',
    `fill_type` tinyint(2) DEFAULT '1' COMMENT '填充方向  1:竖向  2：横向',
    `location` varchar(16) DEFAULT NULL COMMENT '模板在线设计单元格坐标',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for t_analysis_formula_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_formula_assort`;
CREATE TABLE `t_analysis_formula_assort`
(
    `id`         int(20) NOT NULL AUTO_INCREMENT COMMENT '公式分类id',
    `assortname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公式分类名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_formula_manage
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_formula_manage`;
CREATE TABLE `t_analysis_formula_manage`
(
    `id`            int(20) NOT NULL AUTO_INCREMENT COMMENT '公式id',
    `formulaassort` int(20) DEFAULT NULL COMMENT '公式分类',
    `formula`       varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实际公式',
    `formulashow`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '用户所见公式',
    `formulatitle`  varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公式提示信息',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_images
-- ----------------------------
DROP TABLE IF EXISTS `t_images`;
CREATE TABLE `t_images`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT,
    `imgname`       varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片名称',
    `user`          varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '登录的用户,0 表示通用',
    `img_assort_id` int(11) DEFAULT NULL,
    `status`        char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     DEFAULT '1' COMMENT '1 为通用图片，2 为个人图片',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_img_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_img_assort`;
CREATE TABLE `t_img_assort`
(
    `id`       int(10) NOT NULL AUTO_INCREMENT,
    `img_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片类型',
    `status`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT '1' COMMENT '1 为启用状态，0 为停用状态',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_job
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_job`;
CREATE TABLE `t_analysis_job`
(
    `job_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作流ID-由后端提供',
    `createtime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '工作流创建时间',
    `starttime`  datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '工作流开始时间',
    `endtime`    datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '工作流结束时间',
    `task_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的任务名称',
    `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'running' COMMENT '执行状态',
    `status`     char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL DEFAULT '1' COMMENT '1 启用 0 弃用'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_label
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_label`;
CREATE TABLE `t_asset_label`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT COMMENT '标签主键',
    `LName`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签名称',
    `LDescription`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
    `createTime`    datetime(0) DEFAULT NULL COMMENT '创建时间',
    `updateTime`    datetime(0) DEFAULT NULL COMMENT '修改时间',
    `status`        varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '是否启用（1：启用，2：未启用，3：该条数据为标签）',
    `createUser`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户',
    `labelSetID`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签分类ID（id为空则为标签组）',
    `coordinateWay` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '并列方式（1：规则且，2：规则或）',
    `ruleSql`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签规则组合条件SQL',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX           `key_label_user`(`createUser`) USING BTREE,
    CONSTRAINT `key_label_user` FOREIGN KEY (`createUser`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 335 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_label_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_label_rule`;
CREATE TABLE `t_asset_label_rule`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT COMMENT '标签规则ID',
    `ruleCondition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则条件',
    `fieldValue`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段值',
    `RDescription`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
    `createUser`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户',
    `labelID`       int(11) DEFAULT NULL COMMENT '所属标签ID',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX           `label_key_labelRule`(`labelID`) USING BTREE,
    INDEX           `key_labelRule_user`(`createUser`) USING BTREE,
    CONSTRAINT `key_labelRule_user` FOREIGN KEY (`createUser`) REFERENCES `t_system_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `label_key_labelRule` FOREIGN KEY (`labelID`) REFERENCES `t_asset_label` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_label
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_label`;
CREATE TABLE `t_analysis_label`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `label_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
    `label_img`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
    `status`      varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT '1' COMMENT '1表示启用 其它不用',
    `create_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建者id',
    `create_date` datetime(0) DEFAULT NULL,
    `update_date` datetime(0) DEFAULT NULL,
    `level`       int(11) DEFAULT 100 COMMENT '排序',
    `remark`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用列',
    `extra`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用列',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_lexicon
-- ----------------------------
DROP TABLE IF EXISTS `t_lexicon`;
CREATE TABLE `t_lexicon`
(
    `id`          int(10) NOT NULL AUTO_INCREMENT COMMENT '词库主键',
    `name`        varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '词库名称',
    `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '词库描述',
    `createTime`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建时间',
    `createUser`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_library_word
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_library_word`;
CREATE TABLE `t_asset_library_word`
(
    `id`        int(10) NOT NULL AUTO_INCREMENT COMMENT '词库单词主键',
    `lexiconId` int(10) NOT NULL COMMENT '词库id',
    `name`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '词名',
    `character` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '词性',
    `frequency` int(50) DEFAULT NULL COMMENT '词频',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 338 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_log
-- ----------------------------
DROP TABLE IF EXISTS `t_system_log`;
CREATE TABLE `t_system_log`
(
    `id`        int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `userid`    int(100) DEFAULT NULL COMMENT '用户ID',
    `username`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '用户姓名',
    `ip`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '登录的IP',
    `module`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '执行的模块',
    `operation` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '执行的操作描述',
    `opr_date`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '执行时间',
    `commit`    varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '执行描述',
    `used_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '能耗秒数',
    `tag`       varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '唯一标识',
    `czid`      varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作ID',
    `credit`    double(4, 2
) DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_log_username`(`username`) USING BTREE,
  INDEX `index_log_opr_date`(`opr_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `content`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
    `status`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息状态,1:已读、0:未读',
    `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息创建时间',
    `userName`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息所属用户',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `content`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
    `status`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息状态,1:已读、0:未读',
    `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息创建时间',
    `userName`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息所属用户',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ml_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ml_info`;
CREATE TABLE `t_ml_info`
(
    `id`         int(100) NOT NULL AUTO_INCREMENT,
    `ml_id`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT '' COMMENT '机器学习模型Id',
    `ml_name`    varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT '' COMMENT '机器学习模型名称',
    `ml_assort`  int(100) UNSIGNED NOT NULL DEFAULT 1 COMMENT '分类id',
    `model_id`   int(100) UNSIGNED NOT NULL DEFAULT 1 COMMENT '对应的模型id',
    `state`      char(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci       NOT NULL DEFAULT '1' COMMENT '启用状态: 0 关闭 1启用',
    `ml_json`    mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的JOSN信息',
    `createtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
    `updatetime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `createuser` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT '' COMMENT '创建用户',
    `describes`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci           DEFAULT NULL COMMENT '机器学习文件的备注信息',
    `taskname`   varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '文件对应的任务名称',
    `catalogue`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci           DEFAULT NULL COMMENT '所属目录',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_model_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_model_assort`;
CREATE TABLE `t_analysis_model_assort`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `assrot_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模型分类中文名',
    `assrot_img`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '模型分类图片',
    `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT '1' COMMENT '显示状态(0:分享所属目录;1:非分享所属目录)',
    `extra1`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用字段',
    `range`       varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '排序使用',
    `parent_id`   int(11) DEFAULT NULL COMMENT '父类id 为null或0或负数时时表示顶层分类 没有父类',
    `levels`      int(11) DEFAULT 1 COMMENT '所在层级 为null或1或0或负数时表示顶层 默认1',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX         `t_analysis_model_assort_parent_id_IDX`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_modelshare
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_modelshare`;
CREATE TABLE `t_analysis_modelshare`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT,
    `model_id`       int(11) DEFAULT NULL COMMENT '模型id',
    `model_scene`    varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应用场景',
    `model_thinking` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设计思路',
    `model_diff`     varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模型存在的问题和难点',
    `creater`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT ' 创建人、分享人',
    `create_time`    datetime(0) DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime(0) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX            `index_model_id`(`model_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型分享记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_modelshare_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_modelshare_subscribe`;
CREATE TABLE `t_analysis_modelshare_subscribe`
(
    `id`             int(32) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `model_id`       int(11) DEFAULT NULL COMMENT '模型ID',
    `dimension_id`   int(20) DEFAULT NULL COMMENT '维度ID',
    `dimension_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '维度类型;1：角色维度 2：用户维度',
    `create_time`    datetime(0) DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX            `idx_dimension_id`(`dimension_id`) USING BTREE,
    INDEX            `idx_model_id`(`model_id`) USING BTREE,
    INDEX            `idx_dimension_type`(`dimension_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型分享关联明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_modelshare_ownerassort
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_modelshare_ownerassort`;
CREATE TABLE `t_analysis_modelshare_ownerassort`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `model_id`    int(11) DEFAULT NULL COMMENT '模型ID',
    `assort_id`   int(11) DEFAULT NULL COMMENT '所属目录ID',
    `user_id`     int(11) DEFAULT NULL COMMENT '被分享的用户ID',
    `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX         `idx_model_id`(`model_id`) USING BTREE,
    INDEX         `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型分享用户配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_natures
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_natures`;
CREATE TABLE `t_asset_natures`
(
    `id`    int(11) NOT NULL AUTO_INCREMENT,
    `code`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '词性编码',
    `name`  varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci   DEFAULT NULL COMMENT '词性名称',
    `desc`  varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci   DEFAULT NULL COMMENT '词性名称',
    `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '1表示使用 0表示不使用',
    `seq`   int(255) DEFAULT NULL COMMENT '排序  数值越大越靠前',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_node_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_node_detail`;
CREATE TABLE `t_node_detail`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `type`         varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '节点类型',
    `nodeid`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '节点id',
    `nodename`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '节点英文名称',
    `nodenamecn`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '节点中文名称',
    `datasource`   varchar(9999) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '数据源',
    `pic`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '图片路径',
    `conditions`   mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '条件\r\nentity类型 过滤条件\r\nintersect/except/union 排序后的右表字段顺序\r\njoin 关联信息\r\ngroup 分组信息',
    `viscol`       mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '可见字段\r\ngroup/entity 可见字段\r\nintersect/except/union 左表可见字段 顺序\r\njoin 全部左表字段\r\n\r\n',
    `allcol`       mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '全部字段\r\ngroup/entity全部字段\r\nintersect/except/union 右表可见字段 顺序\r\njoin 全部右表字段\r\n',
    `style`        varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '样式信息',
    `lid`          varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '左表id',
    `rid`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '右表id',
    `modelid`      int(10) DEFAULT NULL,
    `joinInfo`     mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
    `tipInfo`      varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '注释信息',
    `owner`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建人',
    `ident`        int(10) NOT NULL DEFAULT 1 COMMENT '逻辑删除：1为新  0为旧',
    `quickjson`    mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
    `modelfile`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '父节点模型文件ID',
    `multiplejson` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '快速报表保存的多维度JSON',
    `templateid`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '父节点模板结果集ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_node_detail_history
-- ----------------------------
DROP TABLE IF EXISTS `t_node_detail_history`;
CREATE TABLE `t_node_detail_history`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `type`         varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '节点类型',
    `nodeid`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '节点id',
    `nodename`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '节点英文名称',
    `nodenamecn`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '节点中文名称',
    `datasource`   varchar(9999) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '数据源',
    `pic`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '图片路径',
    `conditions`   mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '条件\r\nentity类型 过滤条件\r\nintersect/except/union 排序后的右表字段顺序\r\njoin 关联信息\r\ngroup 分组信息',
    `viscol`       mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '可见字段\r\ngroup/entity 可见字段\r\nintersect/except/union 左表可见字段 顺序\r\njoin 全部左表字段\r\n\r\n',
    `allcol`       mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '全部字段\r\ngroup/entity全部字段\r\nintersect/except/union 右表可见字段 顺序\r\njoin 全部右表字段\r\n',
    `style`        varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '样式信息',
    `lid`          varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '左表id',
    `rid`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '右表id',
    `modelid`      int(10) DEFAULT NULL,
    `joinInfo`     mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
    `tipInfo`      varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '注释信息',
    `owner`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建人',
    `ident`        int(10) NOT NULL DEFAULT 1 COMMENT '逻辑删除：1为新  0为旧',
    `quickjson`    mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '快速报表保存的JSON',
    `createtime`   varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建时间',
    `modelname`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '当前版本的模型名称',
    `modelfile`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '父节点模型文件ID',
    `multiplejson` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '快速报表保存的多维度JSON',
    `templateid`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '父节点模板结果集ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_operator_assort
-- ----------------------------
DROP TABLE IF EXISTS `t_operator_assort`;
CREATE TABLE `t_operator_assort`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT COMMENT '算子分类id',
    `assortname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类名称',
    `assortimg`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类图片',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_operator_manage
-- ----------------------------
DROP TABLE IF EXISTS `t_operator_manage`;
CREATE TABLE `t_operator_manage`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT COMMENT '算子id',
    `operatorassort` int(11) DEFAULT NULL COMMENT '算子分类',
    `operatorname`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '算子名称',
    `operatorimg`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '算子图片',
    `operatortype`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '算子对应的英文标识',
    `operatortips`   varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '算子提示信息',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_system_permission`;
CREATE TABLE `t_system_permission`
(
    `id`        bigint(20) NOT NULL AUTO_INCREMENT,
    `parent_id` bigint(20) DEFAULT NULL,
    `name`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `url`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `type`      int(11) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ps_bit
-- ----------------------------
DROP TABLE IF EXISTS `t_ps_bit`;
CREATE TABLE `t_ps_bit`
(
    `id`               int(5) NOT NULL AUTO_INCREMENT,
    `ipc_code`         varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'ipc code',
    `presetting_index` tinyint(4) DEFAULT NULL COMMENT '预置位，取整数',
    `name`             varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci     DEFAULT NULL COMMENT '预置位名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_role
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role`;
CREATE TABLE `t_system_role`
(
    `id`             bigint(20) NOT NULL AUTO_INCREMENT,
    `uid`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `name`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `description`    varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `creationtime`   datetime(0) DEFAULT NULL,
    `updatetime`     datetime(0) DEFAULT NULL,
    `see_all_models` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT '0' COMMENT '是否可以查看所有模型，1可以，0不可以',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role_permission`;
CREATE TABLE `t_system_role_permission`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT,
    `role_id`       int(11) DEFAULT NULL,
    `permission_id` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1880 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sample_file
-- ----------------------------
DROP TABLE IF EXISTS `t_sample_file`;
CREATE TABLE `t_sample_file`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `aliaName`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `type`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '1:目录 2:图片 3:标注文件',
    `parentId`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '父节点id',
    `path`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
    `httpPath`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '链接路径',
    `scene`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '场景value',
    `label`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样本标签',
    `labelType`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签类别',
    `source`      varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '样本来源1:用户上传 2:分析人物 3:采集任务',
    `uploadTime`  datetime(3) NOT NULL,
    `modifyTime`  datetime(3) NOT NULL,
    `labelString` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '标签文本',
    `picture`     mediumblob COMMENT '图片',
    `size`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `marked`      varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '是否标注 1:是 0:否',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX         `IDX_SAMPLE_FILE_TYPE`(`type`) USING BTREE,
    INDEX         `IDX_SAMPLE_FILE_MARKED`(`marked`) USING BTREE,
    INDEX         `IDX_SAMPLE_FILE_SOURCE`(`source`) USING BTREE,
    INDEX         `IDX_SAMPLE_FILE_UPLOADTIME`(`uploadTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '样本管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_scene
-- ----------------------------
DROP TABLE IF EXISTS `t_scene`;
CREATE TABLE `t_scene`
(
    `id`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `text`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ipc设备名称',
    `status`            int(1) DEFAULT NULL COMMENT '状态 0离线 1在线 2黑屏',
    `dev_code`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'ipc设备编码',
    `dev_type`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'ipc设备类型',
    `del_code`          smallint(1) DEFAULT 0 COMMENT '1表示删除 0为正常 默认为0',
    `nvr_code`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `city`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '部署城市',
    `area`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部署区域',
    `analysis_dev_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分析设备编码',
    `ipc_source`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ipc来源',
    `videoManageId`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '视频平台Id',
    `ipcGroupName`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ipc分组名称',
    `createTime`        datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `longitudes`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci       DEFAULT NULL COMMENT '经度',
    `latitudes`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci       DEFAULT NULL COMMENT '纬度',
    `station`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '变电站',
    `createUser`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX               `DEVCODE`(`dev_code`) USING BTREE,
    INDEX               `IDX_SCENE_ipcSource`(`ipc_source`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_subscribe_time
-- ----------------------------
DROP TABLE IF EXISTS `t_subscribe_time`;
CREATE TABLE `t_subscribe_time`
(
    `id`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `start_time` time(0)                                                DEFAULT NULL,
    `end_time`   time(0)                                                DEFAULT NULL,
    `time_order` int(1) DEFAULT NULL,
    `time_plat`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `week_type`  int(1) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_license
-- ----------------------------
DROP TABLE IF EXISTS `t_system_license`;
CREATE TABLE `t_system_license`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT 'id编号',
    `start_time`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '有效期开始时间',
    `end_time`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '有效期结束时间',
    `machine_code` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '机器码',
    `auth_time`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '授权时间',
    `status`       int(11) DEFAULT NULL COMMENT '证书状态 0-试用 1-商用',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'license管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_task_control
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_task_control`;
CREATE TABLE `t_analysis_task_control`
(
    `TASK_ID`         int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    `TASK_EXECID`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务唯一标示',
    `TASK_NAME`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务名称',
    `TASK_STATUS`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '执行状态',
    `START_TIME`      datetime(0) DEFAULT NULL COMMENT '开始时间',
    `SUBMIT_TIME`     datetime(0) DEFAULT NULL COMMENT '提交时间',
    `UPDATE_TIME`     datetime(0) DEFAULT NULL COMMENT '更新时间',
    `END_TIME`        datetime(0) DEFAULT NULL COMMENT '结束时间',
    `EXECUTE_RATE`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '调度信息',
    `SET_TIME_ID`     int(11) DEFAULT NULL COMMENT '定时设置表的ID',
    `RESULT_TABLE`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `RESULT_NAME`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `STATE`           int(3) DEFAULT 1 COMMENT '1为任务 2是临时任务 默认为1',
    `PREVIEW_COLUMNS` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '预览字段信息',
    `SAVE_JSON`       mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '手动任务信息、临时任务任务名称',
    `status`          char(3) CHARACTER SET utf8 COLLATE utf8_general_ci      DEFAULT '1' COMMENT '1 启用 0 弃用',
    `MODEL_ID`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务对应的模型id',
    `OWNER`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
    PRIMARY KEY (`TASK_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5357 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_time_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_time_plan`;
CREATE TABLE `t_time_plan`
(
    `id`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `status`      int(1) DEFAULT NULL,
    `time_name`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `create_time` datetime(0) DEFAULT NULL,
    `update_time` datetime(0) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_user
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user`;
CREATE TABLE `t_system_user`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `username`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `nickname`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `password`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `sex`          varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL,
    `phone`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `state`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `creationtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `updatetime`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `imgUrl`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user_role`;
CREATE TABLE `t_system_user_role`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) DEFAULT NULL,
    `role_id` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_vd_algorithm
-- ----------------------------
DROP TABLE IF EXISTS `t_vd_algorithm`;
CREATE TABLE `t_vd_algorithm`
(
    `code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法code  唯一',
    `name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '算法名称',
    `param` tinyint(1) DEFAULT NULL COMMENT '告警阀值',
    `img`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '样例图片',
    `order` int(3) DEFAULT NULL COMMENT '排序',
    PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_vd_result
-- ----------------------------
DROP TABLE IF EXISTS `t_vd_result`;
CREATE TABLE `t_vd_result`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID 自增',
    `task_id`     int(11) NOT NULL COMMENT '任务ID 关联t_vd_task.id',
    `status`      tinyint(1) NOT NULL COMMENT '(当前分组任务)是否完成 0没有完成 1完成',
    `report_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '最近报表生成时间',
    `report_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '报表路径\r\n本轮任务结束后(status==1) 创建报表。',
    `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频诊断 任务结果总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_vd_result_alarm
-- ----------------------------
DROP TABLE IF EXISTS `t_vd_result_alarm`;
CREATE TABLE `t_vd_result_alarm`
(
    `id`             int(11) UNSIGNED NOT NULL COMMENT '是表t_vd_result_desc.id',
    `task_id`        int(11) NOT NULL COMMENT '任务ID 关联t_vd_task.id',
    `ipc_code`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IPC编码 关联t_scene.dev_code',
    `confirm_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '处理状态 0未确认 1已确认',
    `confirm_time`   datetime(0) DEFAULT NULL COMMENT '确认时间',
    `duration`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci           DEFAULT NULL COMMENT '告警时长 ：20小时45分17秒',
    `offline`        tinyint(1) UNSIGNED DEFAULT NULL COMMENT '是否离线 是否告警：0 否 1是',
    `los`            tinyint(1) DEFAULT NULL COMMENT '是否告警：\r\n 0 否 1是',
    `sharpness`      tinyint(1) DEFAULT NULL COMMENT '清晰度异常 是否告警：0 否 1是',
    `height_light`   tinyint(1) DEFAULT NULL COMMENT '亮度过高 是否告警： 0 否 1是',
    `low_light`      tinyint(1) DEFAULT NULL COMMENT '亮度过低 是否告警：0 否 1是',
    `color_cast`     tinyint(1) DEFAULT NULL COMMENT '画面偏色 是否告警：0 否 1是',
    `noise`          tinyint(1) DEFAULT NULL COMMENT '画面噪声 是否告警：0 否 1是',
    `freeze`         tinyint(1) DEFAULT NULL COMMENT '画面冻结 是否告警：0 否 1是',
    `shake`          tinyint(1) DEFAULT NULL COMMENT '相机抖动 是否告警：0 否 1是',
    `move`           tinyint(1) DEFAULT NULL COMMENT '相机移动 是否告警：0 否 1是',
    `snow_flake`     tinyint(1) DEFAULT NULL COMMENT '雪花干扰是否告警： 0 否 1是',
    `level`          varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL DEFAULT '' COMMENT '是否告警：\r\n 告警等级一级告警、二级告警、三级告警',
    `type`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '告警类型',
    `desc`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci          DEFAULT NULL COMMENT '告警原因/告警描述',
    `alarm_time`     datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '告警时间',
    `img_path`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci          DEFAULT NULL COMMENT '告警图片路径',
    `changes`        tinyint(1) DEFAULT NULL COMMENT '场景聚变（1）',
    `contrast`       tinyint(1) DEFAULT NULL COMMENT '对比度异常（1）',
    `stream`         tinyint(1) DEFAULT NULL COMMENT '视频流异常(1)',
    `mask`           tinyint(1) DEFAULT NULL COMMENT '遮挡(1)',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX            `IPCCODE`(`ipc_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频诊断 告警表(判断:结果详情表中如果有告警，则生成一条记录)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_vd_result_desc
-- ----------------------------
DROP TABLE IF EXISTS `t_vd_result_desc`;
CREATE TABLE `t_vd_result_desc`
(
    `id`           int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID 自增',
    `result_id`    int(11) DEFAULT NULL COMMENT '任务结果表ID 关联t_vd_result.id',
    `task_id`      int(11) DEFAULT NULL COMMENT '任务ID 关联t_vd_task.id',
    `ipc_code`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IPC编码 关联t_scene.dev_code',
    `img_path`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片路径',
    `offline`      tinyint(1) DEFAULT NULL COMMENT '是否离线 0否 1是',
    `los`          tinyint(1) DEFAULT NULL COMMENT '信号丢失(是否黑屏) 0否  1是',
    `sharpness`    tinyint(1) DEFAULT NULL COMMENT '清晰度异常',
    `height_light` tinyint(1) DEFAULT NULL COMMENT '亮度过高',
    `low_light`    tinyint(1) DEFAULT NULL COMMENT '亮度过低',
    `color_cast`   tinyint(1) DEFAULT NULL COMMENT '画面偏色',
    `noise`        tinyint(1) DEFAULT NULL COMMENT '画面噪声',
    `freeze`       tinyint(1) DEFAULT NULL COMMENT '画面冻结',
    `shake`        tinyint(1) DEFAULT NULL COMMENT '相机抖动',
    `move`         tinyint(1) DEFAULT NULL COMMENT '相机移动',
    `snow_flake`   tinyint(1) DEFAULT NULL COMMENT '雪花干扰',
    `quality`      float(4, 1
) DEFAULT NULL COMMENT '质量综合值',
  `is_sure` tinyint(1) DEFAULT NULL COMMENT '该记录是否做过告警判断\r\n0否  1是',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `changes` tinyint(1) DEFAULT NULL COMMENT '场景聚变',
  `contrast` tinyint(1) DEFAULT NULL COMMENT '对比度异常',
  `stream` tinyint(1) DEFAULT NULL COMMENT '视频流异常',
  `mask` tinyint(1) DEFAULT NULL COMMENT '遮挡',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频诊断 任务结果详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_vd_task
-- ----------------------------
DROP TABLE IF EXISTS `t_vd_task`;
CREATE TABLE `t_vd_task`
(
    `id`                   int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID 自增',
    `name`                 varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称(不可重复)',
    `create_user`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
    `group_id`             varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通道分组ID 关联表ipc_group.id',
    `exe_type`             tinyint(1) NOT NULL COMMENT '执行方式 0立即 1定时2循环',
    `status`               int(2) NOT NULL DEFAULT 0 COMMENT '任务状态 (关联analysis_dict中type为\r\nvd_task_status)\r\n0未开启\r\n1等待中\r\n2 运行中\r\n3停止\r\n4已完成 \r\n5异常\r\n6异常且任务结束\r\n等待中、运行中、已完成、异常、异常结束状态由视频诊断(asc)更新，其它为前端更新。\r\na,用户点击保存，则状态为 未开始/未开启b,用户点击停止，状态为  停止\r\n(以上均为请求asc接口完成得情况下)',
    `desc`                 varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务描述',
    `analysis_device_id`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分析设备ID 关联analysis_device.id',
    `effective_start_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '循环任务有效开始时间 到年月日',
    `effective_end_time`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '循环任务有效结束时间 到年月日',
    `interval_id`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '循环任务循环周期(模板) 关联t_time_plan.id',
    `timer_start`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '定时任务开始时间 年月日时分秒',
    `timer_end`            varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '定时任务结束时间 年月日时分秒',
    `create_time`          datetime(0) DEFAULT NULL COMMENT '创建时间',
    `update_time`          datetime(0) DEFAULT NULL COMMENT '更新时间',
    `err_msg`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '下发任务错误信息',
    `is_send_fail`         tinyint(1) DEFAULT NULL COMMENT '下发任务失败 1表示失败 其它表示成功',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频诊断--任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_vd_task_algorithm
-- ----------------------------
DROP TABLE IF EXISTS `t_vd_task_algorithm`;
CREATE TABLE `t_vd_task_algorithm`
(
    `alog_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '算法ID 关联表t_vd_algorithm.code',
    `task_id`   int(10) NOT NULL COMMENT '任务ID 关联t_vd_task.id',
    PRIMARY KEY (`alog_code`, `task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_viewsbymodel
-- ----------------------------
DROP TABLE IF EXISTS `t_viewsbymodel`;
CREATE TABLE `t_viewsbymodel`
(
    `id`           int(11) DEFAULT NULL,
    `modelid`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `viewJSON`     mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
    `createuser`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `viewType`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `title`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `tablename_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
    `tablename_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_analysis_wildcard
-- ----------------------------
DROP TABLE IF EXISTS `t_analysis_wildcard`;
CREATE TABLE `t_analysis_wildcard`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
    `model_id`      int(11) DEFAULT NULL COMMENT '对应的模型ID',
    `wildcard_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '通配符名称',
    `default_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '默认值',
    `actual_value`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实际值',
    `data_type`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'String' COMMENT '字段类型',
    `status`        int(5) DEFAULT 1 COMMENT '启用状态(1 启用 0 废置)',
    `wildcard_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '通配符注释',
    `ident`         int(10) NOT NULL DEFAULT 1 COMMENT '逻辑删除：1为新  0为旧',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_asset_nlp_library
-- ----------------------------
DROP TABLE IF EXISTS `t_asset_nlp_library`;
CREATE TABLE `t_asset_nlp_library`
(
    `id`            int(32) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `name`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '词库名',
    `description`   text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
    `domain_name`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表英文名',
    `datasource_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据源id',
    `create_time`   varchar(100)                                            DEFAULT NULL COMMENT '创建时间',
    `create_user`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自定义词库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_analysis_decision_result
-- ----------------------------
DROP TABLE IF EXISTS `video_analysis_decision_result`;
CREATE TABLE `video_analysis_decision_result`
(
    `ID`                   varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci        NOT NULL COMMENT 'ID',
    `ANALYSIS_RESULT_ID`   varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '智能分析任务主键',
    `ANALYSIS_TIME`        varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci           DEFAULT NULL COMMENT '分析时间',
    `RESULT_PARAM`         varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分析结果值',
    `IMAGE_NAME`           varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '结果图',
    `LEVEL_CODE`           varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '预警等级',
    `ALARM_PIC_SIZE`       int(4) NOT NULL DEFAULT 0 COMMENT '预警截图大小',
    `ALARM_PIC_WIDTH`      int(4) NOT NULL DEFAULT 0 COMMENT '预警截图宽度',
    `ALARM_PIC_HEIGHT`     int(4) NOT NULL DEFAULT 0 COMMENT '预警截图高度',
    `ALARM_FRAME_LOCATION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '预警框位置',
    `PIC_SIZE`             int(4) DEFAULT NULL COMMENT '原图大小',
    `PIC_WIDTH`            int(4) DEFAULT NULL COMMENT '原图宽度',
    `PIC_HEIGHT`           int(4) DEFAULT NULL COMMENT '原图高度',
    `PRIMARY_IMAGE`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '原图',
    `ORI_THUMB_IMG`        longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '原图缩略图',
    `RESULT_THUMB_IMG`     longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '结果图缩略图',
    `ALGORITHM_CODE`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '算法Code',
    `LINKED_VIDEO`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '联动视频',
    PRIMARY KEY (`ID`) USING BTREE,
    INDEX                  `FK_VIDEO_ANALYSIS_DECISION_RESULT`(`ANALYSIS_RESULT_ID`) USING BTREE,
    INDEX                  `ANALYSIS_TIME`(`ANALYSIS_TIME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_analysis_result_info
-- ----------------------------
DROP TABLE IF EXISTS `video_analysis_result_info`;
CREATE TABLE `video_analysis_result_info`
(
    `ID`                     varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
    `VIDEO_TASK_ID`          varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '智能分析任务主键',
    `CREATE_TIME`            varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '预警发生时间',
    `RELIEVE_DATE`           varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '预警解除时间',
    `LABEL_CODE`             varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签编码',
    `ALARM_ID`               varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `ANALYSIS_RESULT_CONFIR` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '0' COMMENT '分析结果确认;0:未确认,1:确认,2:误报',
    PRIMARY KEY (`ID`) USING BTREE,
    INDEX                    `FK_VIDEO_ANALYSIS_RESULT_INFO`(`VIDEO_TASK_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_platform_manage
-- ----------------------------
DROP TABLE IF EXISTS `video_platform_manage`;
CREATE TABLE `video_platform_manage`
(
    `id`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频平台id',
    `videoManageName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '视频平台名称',
    `ip`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci       DEFAULT NULL COMMENT 'ip',
    `port`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '端口',
    `accessKey`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ak',
    `secretKey`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sk',
    `ipcSource`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '厂商',
    `sysStatus`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '同步状态',
    `sysTime`         datetime(0) DEFAULT NULL COMMENT '同步时间',
    `account`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号',
    `password`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
    `delCode`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '是否删除 0：未删除 1：已删除',
    `updateTime`      datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `createUser`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX             `IDX_video_platform_manage_ipcSource`(`ipcSource`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `t_ds_policy`;
CREATE TABLE `t_ds_policy`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT COMMENT '策略id',
    `policy_name`    varchar(100) DEFAULT NULL COMMENT '策略名称',
    `user`           varchar(100) DEFAULT NULL COMMENT '用户',
    `create_time`    varchar(32)  DEFAULT NULL COMMENT '创建时间',
    `update_time`    varchar(32)  DEFAULT NULL COMMENT '更新时间',
    `desc`           varchar(200) DEFAULT NULL COMMENT '描述',
    `enabled`        int(11) DEFAULT NULL COMMENT '0-启用，1-禁用',
    `policy_type`    int(11) DEFAULT NULL COMMENT '策略类型（1-流量，2-ip）',
    `all_times`      int(11) DEFAULT NULL COMMENT '总次数',
    `fre_times`      int(11) DEFAULT NULL COMMENT '频次限制',
    `fre_interval`   int(11) DEFAULT NULL COMMENT '间隔时长',
    `unit`           varchar(10)  DEFAULT NULL COMMENT '间隔时长单位',
    `ip_details`     text COMMENT 'ip列表',
    `bw_list`        int(11) DEFAULT NULL,
    `flow_num`       int(11) DEFAULT NULL COMMENT '流量数',
    `flow_unit`      varchar(255) DEFAULT NULL COMMENT '流量单位',
    `flow_time_num`  int(11) DEFAULT NULL COMMENT '流量时间数',
    `flow_time_unit` varchar(255) DEFAULT NULL COMMENT '流量时间单位',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问限制策略表';

DROP TABLE IF EXISTS `t_ds_policy_bind`;
CREATE TABLE `t_ds_policy_bind`
(
    `id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `api_id`    bigint(20) DEFAULT NULL COMMENT 'api id',
    `app_id`    varchar(32) DEFAULT NULL COMMENT 'app id',
    `policy_id` int(11) DEFAULT NULL COMMENT '策略id',
    UNIQUE KEY `t_ds_policy_bind_un` (`api_id`,`app_id`,`policy_id`),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='策略绑定表';

DROP TABLE IF EXISTS `t_ds_visit_count`;
CREATE TABLE `t_ds_visit_count`
(
    `policy_bind_id` int(11) DEFAULT NULL COMMENT '策略绑定ID',
    `count`          int(11) DEFAULT NULL COMMENT '访问总数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_ds_visit_details`;
CREATE TABLE `t_ds_visit_details`
(
    `policy_bind_id` bigint(20) DEFAULT NULL COMMENT '策略id',
    `query_time`     datetime DEFAULT NULL COMMENT '查询时间',
    `size`           bigint(20) DEFAULT NULL COMMENT '消息体大小，单位（字节）',
    KEY              `t_ds_visit_details_policy_id_IDX` (`policy_bind_id`,`query_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='api访问明细表';

/*Table structure for table `analysis_company` */

DROP TABLE IF EXISTS `analysis_company`;

CREATE TABLE `analysis_company`
(
    `ID`                  varchar(32) NOT NULL COMMENT '主键ID',
    `COMPANY_NAME`        varchar(255) DEFAULT NULL COMMENT '厂商名称',
    `COMPANY_DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '备注',
    `COMPANY_PHONE`       varchar(50)  DEFAULT NULL COMMENT '联系电话',
    `COMPANY_TYPE`        tinyint(1) DEFAULT NULL COMMENT '厂商类型',
    `DEL_FLAG`            tinyint(1) DEFAULT '0' COMMENT '是否删除;0:否,1:是',
    `CREATE_TIME`         datetime     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `UPDATE_TIME`         datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='厂商表';

-- ----------------------------
-- Function structure for fristPinyin
-- ----------------------------
DROP FUNCTION IF EXISTS `fristPinyin`;
delimiter;;
CREATE
DEFINER=`root`@`%` FUNCTION `fristPinyin`(P_NAME VARCHAR(255)) RETURNS varchar(255) CHARSET utf8
BEGIN

    DECLARE
V_RETURN VARCHAR(255);

    DECLARE
V_FRIST_CHAR VARCHAR(2);



		SET
V_FRIST_CHAR  =	UPPER(left(P_NAME,1));

		SET
V_RETURN= V_FRIST_CHAR;



		IF
LENGTH(V_FRIST_CHAR) <>  CHARACTER_LENGTH(V_FRIST_CHAR) THEN

				SET V_RETURN = ELT(INTERVAL(CONV(HEX(left(CONVERT(V_FRIST_CHAR USING gbk),1)),16,10),

						0xB0A1,0xB0C5,0xB2C1,0xB4EE,0xB6EA,0xB7A2,0xB8C1,0xB9FE,0xBBF7,

						0xBFA6,0xC0AC,0xC2E8,0xC4C3,0xC5B6,0xC5BE,0xC6DA,0xC8BB,

						0xC8F6,0xCBFA,0xCDDA,0xCEF4,0xD1B9,0xD4D1),

				'A','B','C','D','E','F','G','H','J','K','L','M','N','O','P','Q','R','S','T','W','X','Y','Z');

END IF ;

RETURN V_RETURN;

END
;;
delimiter ;
