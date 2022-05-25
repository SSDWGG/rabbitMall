/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : finallyproject

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 25/05/2022 09:46:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminactive
-- ----------------------------
DROP TABLE IF EXISTS `adminactive`;
CREATE TABLE `adminactive` (
  `activetableid` bigint NOT NULL COMMENT '主键',
  `adminname` varchar(255) NOT NULL COMMENT '管理员姓名',
  `adminactive` varchar(255) NOT NULL COMMENT '管理员操作记录',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作修改时间',
  `version` int DEFAULT '1' COMMENT '乐观锁，异步锁',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`activetableid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of adminactive
-- ----------------------------
BEGIN;
INSERT INTO `adminactive` VALUES (1469219278766071810, 'rywtest', '修改了用户id为：1467070420535476226的个人信息', '2021-12-10 16:15:47', '2021-12-10 16:15:47', 1, 0);
INSERT INTO `adminactive` VALUES (1469219290497540098, 'rywtest', '初始化了用户id为：1467070066506858497的账号信息', '2021-12-10 16:15:50', '2021-12-10 16:15:50', 1, 0);
INSERT INTO `adminactive` VALUES (1469219342641127425, 'rywtest', '修改了用户id为：1467070066506858497的个人信息', '2021-12-10 16:16:03', '2021-12-10 16:16:03', 1, 0);
INSERT INTO `adminactive` VALUES (1469220832726343681, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为1', '2021-12-10 16:21:58', '2021-12-10 16:21:58', 1, 0);
INSERT INTO `adminactive` VALUES (1469220842926891010, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为0', '2021-12-10 16:22:00', '2021-12-10 16:22:00', 1, 0);
INSERT INTO `adminactive` VALUES (1469235632751632385, 'rywtest', '对订单编号为：1469205231425331201的货物进行了发货', '2021-12-08 17:20:47', '2021-12-10 18:01:00', 1, 0);
INSERT INTO `adminactive` VALUES (1469565376902848513, 'username', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-11 15:11:04', '2021-12-11 15:11:04', 1, 0);
INSERT INTO `adminactive` VALUES (1469565378920308737, 'username', '切换用户id为：1467068952348721153的deleted状态成0', '2021-12-11 15:11:04', '2021-12-11 15:11:04', 1, 0);
INSERT INTO `adminactive` VALUES (1473092872843653122, 'username', '切换用户id为：1467069240845533185的deleted状态成1', '2021-12-21 08:48:04', '2021-12-21 08:48:04', 1, 0);
INSERT INTO `adminactive` VALUES (1473092875423150081, 'username', '切换用户id为：1467069240845533185的deleted状态成0', '2021-12-21 08:48:05', '2021-12-21 08:48:05', 1, 0);
INSERT INTO `adminactive` VALUES (1473092900958072833, 'username', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-21 08:48:11', '2021-12-21 08:48:11', 1, 0);
INSERT INTO `adminactive` VALUES (1473577357603323905, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-22 16:53:14', '2021-12-22 16:53:14', 1, 0);
INSERT INTO `adminactive` VALUES (1473577358437990402, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成0', '2021-12-22 16:53:15', '2021-12-22 16:53:15', 1, 0);
INSERT INTO `adminactive` VALUES (1473577359322988545, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-22 16:53:15', '2021-12-22 16:53:15', 1, 0);
INSERT INTO `adminactive` VALUES (1473577360073768962, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成0', '2021-12-22 16:53:15', '2021-12-22 16:53:15', 1, 0);
INSERT INTO `adminactive` VALUES (1473577360933601282, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-22 16:53:15', '2021-12-22 16:53:15', 1, 0);
INSERT INTO `adminactive` VALUES (1473577361852153858, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成0', '2021-12-22 16:53:15', '2021-12-22 16:53:15', 1, 0);
INSERT INTO `adminactive` VALUES (1473577362586157058, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-22 16:53:16', '2021-12-22 16:53:16', 1, 0);
INSERT INTO `adminactive` VALUES (1473577363408240641, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成0', '2021-12-22 16:53:16', '2021-12-22 16:53:16', 1, 0);
INSERT INTO `adminactive` VALUES (1473577364330987522, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-22 16:53:16', '2021-12-22 16:53:16', 1, 0);
INSERT INTO `adminactive` VALUES (1473577365035630593, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成0', '2021-12-22 16:53:16', '2021-12-22 16:53:16', 1, 0);
INSERT INTO `adminactive` VALUES (1473577366012903426, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-22 16:53:16', '2021-12-22 16:53:16', 1, 0);
INSERT INTO `adminactive` VALUES (1473577366579134465, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成0', '2021-12-22 16:53:17', '2021-12-22 16:53:17', 1, 0);
INSERT INTO `adminactive` VALUES (1473577367376052226, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-22 16:53:17', '2021-12-22 16:53:17', 1, 0);
INSERT INTO `adminactive` VALUES (1473577368177164289, 'rywtest', '切换用户id为：1467068952348721153的deleted状态成0', '2021-12-22 16:53:17', '2021-12-22 16:53:17', 1, 0);
INSERT INTO `adminactive` VALUES (1474033090832715777, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为1', '2021-12-23 23:04:10', '2021-12-23 23:04:10', 1, 0);
INSERT INTO `adminactive` VALUES (1474033095945572354, 'rywtest', '对货物编号为：2的货物进行了上下架切换，切换状态为1', '2021-12-23 23:04:11', '2021-12-23 23:04:11', 1, 0);
INSERT INTO `adminactive` VALUES (1474033108012584962, 'rywtest', '对货物编号为：2的货物进行了上下架切换，切换状态为0', '2021-12-23 23:04:14', '2021-12-23 23:04:14', 1, 0);
INSERT INTO `adminactive` VALUES (1474033112001368065, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为0', '2021-12-23 23:04:15', '2021-12-23 23:04:15', 1, 0);
INSERT INTO `adminactive` VALUES (1474290120042565634, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为1', '2021-12-24 16:05:30', '2021-12-24 16:05:30', 1, 0);
INSERT INTO `adminactive` VALUES (1474290122403958786, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为0', '2021-12-24 16:05:31', '2021-12-24 16:05:31', 1, 0);
INSERT INTO `adminactive` VALUES (1474290557357477889, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为1', '2021-12-24 16:07:15', '2021-12-24 16:07:15', 1, 0);
INSERT INTO `adminactive` VALUES (1474290559928586241, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为0', '2021-12-24 16:07:15', '2021-12-24 16:07:15', 1, 0);
INSERT INTO `adminactive` VALUES (1474308314836848642, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为1', '2021-12-24 17:17:48', '2021-12-24 17:17:48', 1, 0);
INSERT INTO `adminactive` VALUES (1474308320713068545, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为0', '2021-12-24 17:17:50', '2021-12-24 17:17:50', 1, 0);
INSERT INTO `adminactive` VALUES (1474308327969214465, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为1', '2021-12-24 17:17:51', '2021-12-24 17:17:51', 1, 0);
INSERT INTO `adminactive` VALUES (1474308330557100033, 'rywtest', '对货物编号为：2的货物进行了上下架切换，切换状态为1', '2021-12-24 17:17:52', '2021-12-24 17:17:52', 1, 0);
INSERT INTO `adminactive` VALUES (1474308367840268290, 'rywtest', '对货物编号为：1的货物进行了上下架切换，切换状态为0', '2021-12-24 17:18:01', '2021-12-24 17:18:01', 1, 0);
INSERT INTO `adminactive` VALUES (1474308373229948930, 'rywtest', '对货物编号为：2的货物进行了上下架切换，切换状态为0', '2021-12-24 17:18:02', '2021-12-24 17:18:02', 1, 0);
INSERT INTO `adminactive` VALUES (1474695492129607682, 'rywtest', '对订单编号为：1469205175599144961的货物进行了发货', '2021-12-25 18:56:19', '2021-12-25 18:56:19', 1, 0);
INSERT INTO `adminactive` VALUES (1474695512832692225, 'rywtest', '对订单编号为：1469205453555671042的货物进行了发货', '2021-12-25 18:56:23', '2021-12-25 18:56:23', 1, 0);
INSERT INTO `adminactive` VALUES (1474695517438038017, 'rywtest', '对订单编号为：1469205453555671042的货物进行了发货', '2021-12-25 18:56:25', '2021-12-25 18:56:25', 1, 0);
INSERT INTO `adminactive` VALUES (1474695522899021825, 'rywtest', '对订单编号为：1469205453555671042的货物进行了发货', '2021-12-25 18:56:26', '2021-12-25 18:56:26', 1, 0);
INSERT INTO `adminactive` VALUES (1474981927931965442, 'rywtest', '添加了用户，用户名称为:rootroot', '2021-12-26 13:54:30', '2021-12-26 13:54:30', 1, 0);
INSERT INTO `adminactive` VALUES (1474982107238461441, 'rywtest', '切换用户id为：1474981927269265409的admin状态成1', '2021-12-26 13:55:13', '2021-12-26 13:55:13', 1, 0);
INSERT INTO `adminactive` VALUES (1474982942508937217, 'root123', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-26 13:58:32', '2021-12-26 13:58:32', 1, 0);
INSERT INTO `adminactive` VALUES (1474982944924856322, 'root123', '切换用户id为：1467068952348721153的deleted状态成0', '2021-12-26 13:58:33', '2021-12-26 13:58:33', 1, 0);
INSERT INTO `adminactive` VALUES (1475071616055603202, 'root123', '修改了用户id为：1467069920360529921的账号信息', '2021-12-26 19:50:53', '2021-12-26 19:50:53', 1, 0);
INSERT INTO `adminactive` VALUES (1475073304774668289, 'root123', '对订单编号为：1469205175599144961的货物进行了发货', '2021-12-26 19:57:36', '2021-12-26 19:57:36', 1, 0);
INSERT INTO `adminactive` VALUES (1475073352581345282, 'root123', '对订单编号为：1469205525152440322的货物进行了发货', '2021-12-26 19:57:47', '2021-12-26 19:57:47', 1, 0);
INSERT INTO `adminactive` VALUES (1475073357572567042, 'root123', '对订单编号为：1469340743041671170的货物进行了发货', '2021-12-26 19:57:49', '2021-12-26 19:57:49', 1, 0);
INSERT INTO `adminactive` VALUES (1475073530235285505, 'root123', '对订单编号为：1469205175599144961的货物进行了发货', '2021-12-26 19:58:30', '2021-12-26 19:58:30', 1, 0);
INSERT INTO `adminactive` VALUES (1475432847559979010, 'root123', '切换用户id为：1467068952348721153的admin状态成1', '2021-12-27 19:46:18', '2021-12-27 19:46:18', 1, 0);
INSERT INTO `adminactive` VALUES (1475432853733994497, 'root123', '切换用户id为：1467068952348721153的admin状态成0', '2021-12-27 19:46:19', '2021-12-27 19:46:19', 1, 0);
INSERT INTO `adminactive` VALUES (1475432863863238658, 'root123', '切换用户id为：1467068952348721153的deleted状态成1', '2021-12-27 19:46:22', '2021-12-27 19:46:22', 1, 0);
INSERT INTO `adminactive` VALUES (1475432898835345410, 'root123', '切换用户id为：1467068952348721153的deleted状态成0', '2021-12-27 19:46:30', '2021-12-27 19:46:30', 1, 0);
INSERT INTO `adminactive` VALUES (1475432962093838338, 'root123', '修改了用户id为：1467069518311325697的账号信息', '2021-12-27 19:46:45', '2021-12-27 19:46:45', 1, 0);
INSERT INTO `adminactive` VALUES (1475433460515565569, 'root123', '对订单编号为：1469472503121436673的货物进行了发货', '2021-12-27 19:48:44', '2021-12-27 19:48:44', 1, 0);
INSERT INTO `adminactive` VALUES (1475433602941546497, 'root123', '对货物编号为：1的货物进行了上下架切换，切换状态为1', '2021-12-27 19:49:18', '2021-12-27 19:49:18', 1, 0);
INSERT INTO `adminactive` VALUES (1475433636621807618, 'root123', '对货物编号为：1的货物进行了上下架切换，切换状态为0', '2021-12-27 19:49:26', '2021-12-27 19:49:26', 1, 0);
INSERT INTO `adminactive` VALUES (1475433737452875777, 'root123', '对货物编号为：2的货物进行了上下架切换，切换状态为1', '2021-12-27 19:49:50', '2021-12-27 19:49:50', 1, 0);
INSERT INTO `adminactive` VALUES (1475433739864600577, 'root123', '对货物编号为：1的货物进行了上下架切换，切换状态为1', '2021-12-27 19:49:50', '2021-12-27 19:49:50', 1, 0);
INSERT INTO `adminactive` VALUES (1475433767547006978, 'root123', '对货物编号为：1的货物进行了上下架切换，切换状态为0', '2021-12-27 19:49:57', '2021-12-27 19:49:57', 1, 0);
INSERT INTO `adminactive` VALUES (1475433770915033089, 'root123', '对货物编号为：2的货物进行了上下架切换，切换状态为0', '2021-12-27 19:49:58', '2021-12-27 19:49:58', 1, 0);
INSERT INTO `adminactive` VALUES (1481155139850010625, 'root123', '修改了用户id为：1468122511050346498的账号信息', '2022-01-12 14:44:39', '2022-01-12 14:44:39', 1, 0);
INSERT INTO `adminactive` VALUES (1481155635222478849, 'root123', '修改了用户id为：1468122511050346498的账号信息', '2022-01-12 14:46:37', '2022-01-12 14:46:37', 1, 0);
INSERT INTO `adminactive` VALUES (1481172058305003521, 'rywtest', '切换用户id为：1467069240845533185的admin状态成1', '2022-01-12 15:51:52', '2022-01-12 15:51:52', 1, 0);
INSERT INTO `adminactive` VALUES (1481172062709022721, 'rywtest', '切换用户id为：1467069240845533185的admin状态成0', '2022-01-12 15:51:53', '2022-01-12 15:51:53', 1, 0);
INSERT INTO `adminactive` VALUES (1481172066886549506, 'rywtest', '切换用户id为：1467069240845533185的admin状态成1', '2022-01-12 15:51:54', '2022-01-12 15:51:54', 1, 0);
INSERT INTO `adminactive` VALUES (1481172072494333954, 'rywtest', '切换用户id为：1467069240845533185的admin状态成0', '2022-01-12 15:51:56', '2022-01-12 15:51:56', 1, 0);
INSERT INTO `adminactive` VALUES (1481172076407619586, 'rywtest', '切换用户id为：1467069240845533185的admin状态成1', '2022-01-12 15:51:57', '2022-01-12 15:51:57', 1, 0);
INSERT INTO `adminactive` VALUES (1481172080966828034, 'rywtest', '切换用户id为：1467069240845533185的admin状态成0', '2022-01-12 15:51:58', '2022-01-12 15:51:58', 1, 0);
INSERT INTO `adminactive` VALUES (1481172083118505985, 'rywtest', '切换用户id为：1467069240845533185的admin状态成1', '2022-01-12 15:51:58', '2022-01-12 15:51:58', 1, 0);
INSERT INTO `adminactive` VALUES (1481901516381028354, 'rywtest', '切换用户id为：1467069240845533185的admin状态成0', '2022-01-14 16:10:29', '2022-01-14 16:10:29', 1, 0);
INSERT INTO `adminactive` VALUES (1485448057360285697, 'root123', '对货物编号为：3的货物进行了上下架切换，切换状态为1', '2022-01-24 11:03:10', '2022-01-24 11:03:10', 1, 0);
INSERT INTO `adminactive` VALUES (1485448069754454018, 'root123', '对货物编号为：2的货物进行了上下架切换，切换状态为1', '2022-01-24 11:03:13', '2022-01-24 11:03:13', 1, 0);
INSERT INTO `adminactive` VALUES (1485448076666667009, 'root123', '对货物编号为：4的货物进行了上下架切换，切换状态为1', '2022-01-24 11:03:14', '2022-01-24 11:03:14', 1, 0);
INSERT INTO `adminactive` VALUES (1485474770198790145, 'root123', '对货物编号为：2的货物进行了上下架切换，切换状态为0', '2022-01-24 12:49:19', '2022-01-24 12:49:19', 1, 0);
INSERT INTO `adminactive` VALUES (1485474775672356866, 'root123', '对货物编号为：3的货物进行了上下架切换，切换状态为0', '2022-01-24 12:49:20', '2022-01-24 12:49:20', 1, 0);
INSERT INTO `adminactive` VALUES (1485474793158410242, 'root123', '对货物编号为：4的货物进行了上下架切换，切换状态为0', '2022-01-24 12:49:24', '2022-01-24 12:49:24', 1, 0);
INSERT INTO `adminactive` VALUES (1485475732539899905, 'root123', '对货物编号为：1481135310220886018的货物进行了上下架切换，切换状态为1', '2022-01-24 12:53:08', '2022-01-24 12:53:08', 1, 0);
INSERT INTO `adminactive` VALUES (1485475738072186881, 'root123', '对货物编号为：1481135310220886018的货物进行了上下架切换，切换状态为0', '2022-01-24 12:53:09', '2022-01-24 12:53:09', 1, 0);
INSERT INTO `adminactive` VALUES (1485475743017271297, 'root123', '对货物编号为：1481151563996135425的货物进行了上下架切换，切换状态为1', '2022-01-24 12:53:11', '2022-01-24 12:53:11', 1, 0);
INSERT INTO `adminactive` VALUES (1485475745605156866, 'root123', '对货物编号为：1481151563996135425的货物进行了上下架切换，切换状态为0', '2022-01-24 12:53:11', '2022-01-24 12:53:11', 1, 0);
INSERT INTO `adminactive` VALUES (1485475753456893953, 'root123', '对货物编号为：1481152022760718337的货物进行了上下架切换，切换状态为1', '2022-01-24 12:53:13', '2022-01-24 12:53:13', 1, 0);
INSERT INTO `adminactive` VALUES (1485475755130421250, 'root123', '对货物编号为：1481152022760718337的货物进行了上下架切换，切换状态为0', '2022-01-24 12:53:13', '2022-01-24 12:53:13', 1, 0);
INSERT INTO `adminactive` VALUES (1485475763573555201, 'root123', '对货物编号为：1481153375436341249的货物进行了上下架切换，切换状态为1', '2022-01-24 12:53:16', '2022-01-24 12:53:16', 1, 0);
INSERT INTO `adminactive` VALUES (1485475765599404033, 'root123', '对货物编号为：1481153375436341249的货物进行了上下架切换，切换状态为0', '2022-01-24 12:53:16', '2022-01-24 12:53:16', 1, 0);
INSERT INTO `adminactive` VALUES (1485475774436802562, 'root123', '对货物编号为：1481154170449887234的货物进行了上下架切换，切换状态为1', '2022-01-24 12:53:18', '2022-01-24 12:53:18', 1, 0);
INSERT INTO `adminactive` VALUES (1485475777062436866, 'root123', '对货物编号为：1481154170449887234的货物进行了上下架切换，切换状态为0', '2022-01-24 12:53:19', '2022-01-24 12:53:19', 1, 0);
INSERT INTO `adminactive` VALUES (1485475800504401922, 'root123', '对货物编号为：1481135310220886018的货物进行了上下架切换，切换状态为1', '2022-01-24 12:53:24', '2022-01-24 12:53:24', 1, 0);
INSERT INTO `adminactive` VALUES (1485475802874183682, 'root123', '对货物编号为：1481135310220886018的货物进行了上下架切换，切换状态为0', '2022-01-24 12:53:25', '2022-01-24 12:53:25', 1, 0);
INSERT INTO `adminactive` VALUES (1485794328864423938, 'root123', '切换用户id为：1467068952348721153的admin状态成1', '2022-01-25 09:59:07', '2022-01-25 09:59:07', 1, 0);
INSERT INTO `adminactive` VALUES (1485794332547022850, 'root123', '切换用户id为：1467068952348721153的admin状态成0', '2022-01-25 09:59:08', '2022-01-25 09:59:08', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsid` bigint NOT NULL,
  `goodsname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `category` varchar(255) DEFAULT NULL COMMENT '分类',
  `price` double(10,2) DEFAULT NULL COMMENT '价格',
  `nowprice` double(10,2) DEFAULT NULL COMMENT '折扣价格',
  `sellcount` int DEFAULT '0' COMMENT '销量',
  `goodstitle` varchar(255) DEFAULT NULL COMMENT '标题',
  `goodsdescribe` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '账户创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '账户修改时间',
  `deleted` int DEFAULT '0' COMMENT '删除货物',
  PRIMARY KEY (`goodsid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES (1, '混金丝豹纹连衣裙包臀抹胸裙', 'summer', 999.90, 1000.00, 110, '獨家定制混金丝豹纹连衣裙设计感小众性感修身包臀抹胸裙', '胸杯领口设计#\n前胸手工立体收褶,自然包裹胸型\n小熊的姐妹都能A变C\n上胸围含防滑条,蹦迪都不会下滑\n#后中撞色隐形拉链\n时髦精们哪怕拉链\n都要选骚里骚气的颜色\njue不放过一个时髦细节', '2021-12-27 19:49:57', '2021-12-30 19:07:17', 0);
INSERT INTO `goods` VALUES (2, '黑色礼服女冬季长裙子高级感御姐修身气质显身材性感一字肩连衣裙', 'winter', 776.00, 577.00, 127, '黑色礼服女冬季长裙子高级感御姐修身气质显身材性感一字肩连衣裙', '收腰的廓形,舒适的面料,包裹出婀娜的身姿,菱煞旁人\n设计感满满,舒适的版型,流畅的线条\n艺感满满,满满的女人味整体效果优雅,时尚简约,穿着有档次\n触感柔糯,穿着舒适不紧绷,时尚衣领,方便穿脱\n精致优雅,对这款连衣裙的喜欢可以有\n诸多理由,实用、气质、有型\n过时上升效果好\n用品味自然而生的魅力', '2022-01-24 12:49:18', '2022-01-24 12:49:18', 0);
INSERT INTO `goods` VALUES (3, '可爱COS大码女仆制服猫咪女佣女装大佬Lolita裙', 'spring', 238.00, 238.00, 124, '可爱COS大码女仆制服性感私房写真睡衣猫咪女佣女装大佬Lolita裙', '可爱COS大码女仆制服性感私房写真睡衣猫咪女佣女装大佬Lolita裙小女仆小女仆小女仆小女仆小女仆小女仆小女仆小女仆小女仆小女仆可爱COS大码女仆制服性感私房写真睡衣猫咪女佣女装大佬Lolita裙', '2022-01-24 12:49:19', '2022-01-24 12:49:19', 0);
INSERT INTO `goods` VALUES (4, '原创电月珍珠挂饰酒红性感露背女团小众吊带连衣裙', 'autumn', 999.00, 997.00, 7780, '原创电月珍珠挂饰酒红性感露背女团小众吊带连衣裙', '秋天bi备的一款舒服到心窝里的套头衫\n\n整一件是很简约干净的设计，穿上身不是一般的好看\n\n我chao喜欢它上身的效果，好看又bai搭\n\nZui重要的是能穿出慵懒感，舒舒服服的感觉谁不爱~\n\n随手一套就可以美美出街，你们没有理由不入手哦\n\n尤其是不会搭配的女生，bi须要蹲这一件~', '2022-01-24 12:49:23', '2022-01-24 12:49:23', 0);
INSERT INTO `goods` VALUES (5, '值哭了速抢！琎口羊绒！百搭软糯山羊绒针织衫吊带女', 'summer', 677.00, 399.00, 777, '值哭了速抢！琎口羊绒！百搭软糯山羊绒针织衫吊带女', '吊带好穿又百搭\n\n有些衣服不能搭配背心，苾须搭配吊带\n\n如果你露出背心的痕迹就会显得壮实，就苾要搭配吊带才有纤细温柔的感觉\n\n任何外套，下装都能穿搭出好身材，好气质', '2021-11-28 15:36:33', '2021-12-10 15:20:35', 0);
INSERT INTO `goods` VALUES (6, '篙萣重磅白鹅绒！轻盈巨暖篙级感！水貂毛羽绒服外套女', 'winter', 3009.00, 2019.00, 8, '篙萣重磅白鹅绒！轻盈巨暖篙级感！水貂毛羽绒服外套女', '篙萣重磅！轻盈蓬松篙级感！！！\n\n这是一个P簰的外D尾\n\n全年做羽绒代工单\n\n \n\n色泽正，穿搭抬气，保暖，一级棒\n\n一如既往的大气，上档次\n\n懂货的一看就知道，这是一批好东西！！！', '2021-11-28 15:40:45', '2021-11-28 15:40:47', 0);
INSERT INTO `goods` VALUES (7, '鼎尖口碑羊绒！这个价真的太太太值 ！刺绣羊绒针织衫女', 'winter', 1001.00, 998.00, 202, '鼎尖口碑羊绒！这个价真的太太太值 ！刺绣羊绒针织衫女', '意大利羊绒！是一种难忘的纱线\n\n质感难忘，贴服难忘\n\nP簰都在用\n\n手感平滑，柔软，Q弹，\n\n懂货的亲们闭眼收\n\n由于外D工厂来货，所以每批数量都不多，先抢先得', '2021-11-28 16:13:23', '2021-12-10 15:19:47', 0);
INSERT INTO `goods` VALUES (8, '巴黎~白鹅绒~篙品质~一秒爱上~水貂毛拼接白鹅绒羽绒外套女', 'winter', 199.00, 99.00, 43, '巴黎~白鹅绒~篙品质~一秒爱上~水貂毛拼接白鹅绒羽绒外套女', '温暖颜值双重在线，让人看一眼就再也忘不掉的款。\n羽绒整体蓬松柔软，充绒量GAO达90%，\n选用蕞ding级优质的白鹅绒，\n一看这质感就让人觉得价值不菲！\n品P客供JIN口羽绒面料，优于一般功能服面料，\n防水防风防钻毛，绒触感轻柔，篙保暖！\n宽松款式采用水貂毛的装饰，毛绒柔软细短，触感chao舒服\n还有两个大大的口袋，方便又实用，篙腰抽绳收减龄显瘦优势紧，\n很有特色的一款轻便羽绒服，墙裂推荐！', '2021-11-28 16:13:24', '2021-11-28 16:13:24', 0);
INSERT INTO `goods` VALUES (9, '怒吼推荐！重磅篙级感！拼接呢面羊毛外套女', 'spring', 201.00, 199.00, 25, '怒吼推荐！重磅篙级感！拼接呢面羊毛外套女', '熟悉咱家的很多老客都知道，咱家很多面料，\n纱线都是进K的，跟定织，\n定纺，面料到货周期普遍比较长，\n如果这批货卖完可能要等好久，\n所以看好咱家美衣的亲尽量早下单，\n这样可以在这批早发货哈！', '2021-12-10 00:38:26', '2021-12-11 00:18:27', 0);
INSERT INTO `goods` VALUES (10, '早秋冬季新款大码女装毛衣开衫半身裙子气质感两件套装胖mm连衣裙', 'spring', 1009.00, 998.00, 2, '早秋冬季新款大码女装毛衣开衫半身裙子气质感两件套装胖mm连衣裙', '早秋冬季新款大码女装毛衣开衫半身裙子气质感两件套装胖mm连衣裙纱线都是进K的，跟定织，\n定纺，面料到货周期普遍比较长，\n如果这批货卖完可能要等好久，\n所以看好咱家美衣的亲尽量早下单，\n这样可以在这批早发货哈！', '2021-12-10 00:38:25', '2021-12-10 00:38:25', 0);
INSERT INTO `goods` VALUES (11, '睡衣女夏季纯棉薄款吊带性感蕾丝公主家居服带胸垫2021年新款睡裙', 'autumn', 999.00, 991.00, 99, '睡衣女夏季纯棉薄款吊带性感蕾丝公主家居服带胸垫2021年新款睡裙', '睡衣女夏季纯棉薄款吊带性感蕾丝公主家居服带胸垫2021年新款睡裙', '2021-12-10 00:38:24', '2021-12-10 15:20:51', 0);
INSERT INTO `goods` VALUES (1481135310220886018, '欢迎上传你喜欢的图片和介绍', 'spring', 999.00, 999.00, 0, '欢迎上传你喜欢的图片和介绍', '作者wgg会在之后的版本迭代中增加便捷上传功能。如果您想要立即上传，可以联系作者WGG获取上传权限，Thanks♪(･ω･)ﾉ', '2022-01-24 12:53:24', '2022-01-24 12:53:24', 0);
INSERT INTO `goods` VALUES (1481151563996135425, 'SOMESOWE 官方授权 水果系列针织短袖女春季韩版宽松T恤洋气上衣', 'spring', 280.00, 280.00, 0, 'SOMESOWE 官方授权 水果系列针织短袖女春季韩版宽松T恤洋气上衣', 'SOMESOWE 官方授权 水果系列针织短袖女春季韩版宽松T恤洋气上衣', '2022-01-24 12:53:11', '2022-01-24 12:53:11', 0);
INSERT INTO `goods` VALUES (1481152022760718337, '格子领口毛线花朵休闲毛呢外套女冬复古气质大衣', 'spring', 680.00, 680.00, 0, '格子领口毛线花朵休闲毛呢外套女冬复古气质大衣', '格子领口毛线花朵休闲毛呢外套女冬复古气质大衣', '2022-01-24 12:53:13', '2022-01-24 12:53:13', 0);
INSERT INTO `goods` VALUES (1481153375436341249, '明星同款 Kroche 爱心翻领假两件呢子拼接针织开衫女冬季毛衣外套', 'autumn', 690.00, 690.00, 0, '明星同款 Kroche 爱心翻领假两件呢子拼接针织开衫女冬季毛衣外套', '明星同款 Kroche 爱心翻领假两件呢子拼接针织开衫女冬季毛衣外套', '2022-01-24 12:53:15', '2022-01-24 12:53:15', 0);
INSERT INTO `goods` VALUES (1481154170449887234, '豆豆本豆白鹿同款 SOMESOWE 克莱因蓝绑带小花毛衣女冬慵懒针织衫', 'autumn', 690.00, 690.00, 0, '豆豆本豆白鹿同款 SOMESOWE 克莱因蓝绑带小花毛衣女冬慵懒针织衫', '豆豆本豆白鹿同款 SOMESOWE 克莱因蓝绑带小花毛衣女冬慵懒针织衫', '2022-01-24 12:53:18', '2022-01-24 12:53:18', 0);
COMMIT;

-- ----------------------------
-- Table structure for goodsimg
-- ----------------------------
DROP TABLE IF EXISTS `goodsimg`;
CREATE TABLE `goodsimg` (
  `goodsid` bigint DEFAULT NULL COMMENT '货物id',
  `goodsimg` varchar(255) DEFAULT NULL COMMENT '货物图片',
  `imgtableid` bigint NOT NULL COMMENT '表主键',
  PRIMARY KEY (`imgtableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of goodsimg
-- ----------------------------
BEGIN;
INSERT INTO `goodsimg` VALUES (1, ' /goodsimg/goodsimg1(1).jpg', 1);
INSERT INTO `goodsimg` VALUES (1, ' /goodsimg/goodsimg1(2).jpg', 2);
INSERT INTO `goodsimg` VALUES (1, ' /goodsimg/goodsimg1(3).jpg', 3);
INSERT INTO `goodsimg` VALUES (1, ' /goodsimg/goodsimg1(4).jpg', 4);
INSERT INTO `goodsimg` VALUES (1, ' /goodsimg/goodsimg1(5).jpg', 5);
INSERT INTO `goodsimg` VALUES (2, ' /goodsimg/goodsimg2(1).jpg', 11);
INSERT INTO `goodsimg` VALUES (3, ' /goodsimg/goodsimg3(1).jpg', 15);
INSERT INTO `goodsimg` VALUES (4, ' /goodsimg/goodsimg4(1).jpg', 19);
INSERT INTO `goodsimg` VALUES (5, ' /goodsimg/goodsimg5(1).jpg', 20);
INSERT INTO `goodsimg` VALUES (6, ' /goodsimg/goodsimg6(1).jpg', 26);
INSERT INTO `goodsimg` VALUES (7, ' /goodsimg/goodsimg7(1).jpg', 30);
INSERT INTO `goodsimg` VALUES (8, ' /goodsimg/goodsimg8(1).jpg', 36);
INSERT INTO `goodsimg` VALUES (9, ' /goodsimg/goodsimg9(1).jpg', 37);
INSERT INTO `goodsimg` VALUES (10, ' /goodsimg/goodsimg10(1).jpg', 40);
INSERT INTO `goodsimg` VALUES (11, ' /goodsimg/goodsimg11(1).jpg', 42);
INSERT INTO `goodsimg` VALUES (1481135310220886018, '/goodsimg/goodsimg1481135310220886018(1481135420124233729).jpg', 1481135420124233729);
INSERT INTO `goodsimg` VALUES (1481135310220886018, '/goodsimg/goodsimg1481135310220886018(1481135502986903554).jpg', 1481135502986903554);
INSERT INTO `goodsimg` VALUES (1481151563996135425, '/goodsimg/goodsimg1481151563996135425(1481151736621105153).jpg', 1481151736621105153);
INSERT INTO `goodsimg` VALUES (1481151563996135425, '/goodsimg/goodsimg1481151563996135425(1481151807924273154).jpg', 1481151807924273154);
INSERT INTO `goodsimg` VALUES (1481151563996135425, '/goodsimg/goodsimg1481151563996135425(1481151865537232898).jpg', 1481151865537232898);
INSERT INTO `goodsimg` VALUES (1481152022760718337, '/goodsimg/goodsimg1481152022760718337(1481152172493176834).jpg', 1481152172493176834);
INSERT INTO `goodsimg` VALUES (1481152022760718337, '/goodsimg/goodsimg1481152022760718337(1481152262062538753).jpg', 1481152262062538753);
INSERT INTO `goodsimg` VALUES (1481153375436341249, '/goodsimg/goodsimg1481153375436341249(1481153705276407809).jpg', 1481153705276407809);
INSERT INTO `goodsimg` VALUES (1481153375436341249, '/goodsimg/goodsimg1481153375436341249(1481153883819540482).jpg', 1481153883819540482);
INSERT INTO `goodsimg` VALUES (1481153375436341249, '/goodsimg/goodsimg1481153375436341249(1481153931223564290).jpg', 1481153931223564290);
INSERT INTO `goodsimg` VALUES (1481154170449887234, '/goodsimg/goodsimg1481154170449887234(1481154851609051138).jpg', 1481154851609051138);
INSERT INTO `goodsimg` VALUES (1481154170449887234, '/goodsimg/goodsimg1481154170449887234(1481154897452793857).jpg', 1481154897452793857);
INSERT INTO `goodsimg` VALUES (1481154170449887234, '/goodsimg/goodsimg1481154170449887234(1481154947532783617).jpg', 1481154947532783617);
COMMIT;

-- ----------------------------
-- Table structure for sizerestcount
-- ----------------------------
DROP TABLE IF EXISTS `sizerestcount`;
CREATE TABLE `sizerestcount` (
  `goodsid` bigint DEFAULT NULL COMMENT '货物id',
  `size` varchar(10) DEFAULT NULL COMMENT '尺码',
  `restcount` int DEFAULT NULL COMMENT '每个尺码的余量',
  `sizetableid` bigint NOT NULL COMMENT '表id',
  PRIMARY KEY (`sizetableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sizerestcount
-- ----------------------------
BEGIN;
INSERT INTO `sizerestcount` VALUES (1, 's', 994, 27);
INSERT INTO `sizerestcount` VALUES (2, 's', 999, 28);
INSERT INTO `sizerestcount` VALUES (3, 's', 0, 29);
INSERT INTO `sizerestcount` VALUES (4, 's', 998, 30);
INSERT INTO `sizerestcount` VALUES (1, 'm', 9998, 31);
INSERT INTO `sizerestcount` VALUES (2, 'm', 9999, 32);
INSERT INTO `sizerestcount` VALUES (3, 'm', 999, 33);
INSERT INTO `sizerestcount` VALUES (4, 'm', 0, 34);
INSERT INTO `sizerestcount` VALUES (1, 'x', 75, 35);
INSERT INTO `sizerestcount` VALUES (2, 'x', 88, 36);
INSERT INTO `sizerestcount` VALUES (3, 'x', 24, 37);
INSERT INTO `sizerestcount` VALUES (4, 'x', 0, 38);
INSERT INTO `sizerestcount` VALUES (1, 'xl', 59, 39);
INSERT INTO `sizerestcount` VALUES (2, 'xl', 76, 40);
INSERT INTO `sizerestcount` VALUES (3, 'xl', 33, 41);
INSERT INTO `sizerestcount` VALUES (4, 'xl', 21, 42);
INSERT INTO `sizerestcount` VALUES (5, 's', 1007, 43);
INSERT INTO `sizerestcount` VALUES (5, 'm', 107, 44);
INSERT INTO `sizerestcount` VALUES (5, 'x', 18, 45);
INSERT INTO `sizerestcount` VALUES (5, 'xl', 100, 46);
INSERT INTO `sizerestcount` VALUES (5, 'xxl', 97, 47);
INSERT INTO `sizerestcount` VALUES (5, 'xxxl', 96, 48);
INSERT INTO `sizerestcount` VALUES (6, 's', 99, 49);
INSERT INTO `sizerestcount` VALUES (6, 'm', 100, 50);
INSERT INTO `sizerestcount` VALUES (6, 'sm', 12, 51);
INSERT INTO `sizerestcount` VALUES (7, 's', 98, 52);
INSERT INTO `sizerestcount` VALUES (7, 'sm', 98, 53);
INSERT INTO `sizerestcount` VALUES (7, 'x', 16, 54);
INSERT INTO `sizerestcount` VALUES (7, 'xl', 19, 55);
INSERT INTO `sizerestcount` VALUES (8, 'x', 18, 56);
INSERT INTO `sizerestcount` VALUES (8, 'xl', 0, 57);
INSERT INTO `sizerestcount` VALUES (8, 'xxl', 10, 58);
INSERT INTO `sizerestcount` VALUES (9, 's', 9, 59);
INSERT INTO `sizerestcount` VALUES (9, 'm', 8, 60);
INSERT INTO `sizerestcount` VALUES (10, 'm', 99, 61);
INSERT INTO `sizerestcount` VALUES (10, 's', 86, 62);
INSERT INTO `sizerestcount` VALUES (11, 's', 19, 63);
INSERT INTO `sizerestcount` VALUES (11, 'xl', 97, 64);
INSERT INTO `sizerestcount` VALUES (11, 'xxl', 20, 65);
INSERT INTO `sizerestcount` VALUES (11, 'm', 10, 66);
INSERT INTO `sizerestcount` VALUES (1481135310220886018, 's', 98, 1481135374347599873);
INSERT INTO `sizerestcount` VALUES (1481135310220886018, 'x', 99, 1481135806709039105);
INSERT INTO `sizerestcount` VALUES (1481135310220886018, 'xl', 99, 1481135818004299777);
INSERT INTO `sizerestcount` VALUES (1481135310220886018, 'xxl', 99, 1481135833070239745);
INSERT INTO `sizerestcount` VALUES (1481151563996135425, 's', 99, 1481151621651038210);
INSERT INTO `sizerestcount` VALUES (1481151563996135425, 'x', 99, 1481151632812081153);
INSERT INTO `sizerestcount` VALUES (1481151563996135425, 'xl', 99, 1481151641636896770);
INSERT INTO `sizerestcount` VALUES (1481151563996135425, 'xxl', 99, 1481151651392847873);
INSERT INTO `sizerestcount` VALUES (1481152022760718337, 's', 99, 1481152098795061250);
INSERT INTO `sizerestcount` VALUES (1481152022760718337, 'x', 99, 1481152112493658114);
INSERT INTO `sizerestcount` VALUES (1481152022760718337, 'xl', 99, 1481152120118902785);
INSERT INTO `sizerestcount` VALUES (1481152022760718337, 'xxl', 99, 1481152130436890626);
INSERT INTO `sizerestcount` VALUES (1481153375436341249, 's', 99, 1481153832665808897);
INSERT INTO `sizerestcount` VALUES (1481153375436341249, 'x', 99, 1481153846976774145);
INSERT INTO `sizerestcount` VALUES (1481153375436341249, 'xl', 99, 1481153855038226434);
INSERT INTO `sizerestcount` VALUES (1481154170449887234, 's', 99, 1481154247381811202);
INSERT INTO `sizerestcount` VALUES (1481154170449887234, 'x', 99, 1481154257230036993);
INSERT INTO `sizerestcount` VALUES (1481154170449887234, 'xl', 99, 1481154264708481025);
INSERT INTO `sizerestcount` VALUES (1481154170449887234, 'xxl', 99, 1481154273986281473);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL COMMENT '主键',
  `username` varchar(20) NOT NULL COMMENT '账户名',
  `password` varchar(20) NOT NULL COMMENT '账户密码',
  `email` varchar(20) NOT NULL COMMENT '账户关联邮箱',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '账户创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '账户修改时间',
  `version` int DEFAULT '1' COMMENT '乐观锁，异步锁',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除',
  `admin` int DEFAULT '0' COMMENT '管理员标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'rywtest', 'qwe12345', 'sdgsdg@qq.com', '2021-12-26 18:33:24', '2021-12-26 18:33:24', 7, 0, 1);
INSERT INTO `user` VALUES (1467068952348721153, 'username', 'password1', '2@qq.com', '2021-12-27 19:46:29', '2022-01-25 09:59:08', 5, 0, 0);
INSERT INTO `user` VALUES (1467069240845533185, 'noshz', 'qwe12345', 'nosh-z@163.com', '2021-12-26 18:35:48', '2022-01-14 16:10:29', 12, 0, 0);
INSERT INTO `user` VALUES (1467069335376756737, 'ryhn', '123456asd', '598240406@qq.com', '2021-12-04 18:35:11', '2021-12-04 18:35:11', 1, 0, 0);
INSERT INTO `user` VALUES (1467069405375496193, 'test4', 'qwe12345', '5@qq.com', '2021-12-04 17:52:58', '2021-12-04 17:52:58', 1, 0, 0);
INSERT INTO `user` VALUES (1467069518311325697, 'test5', 'qwe1234', '6@qq.com', '2021-12-04 17:53:25', '2021-12-27 19:46:45', 2, 0, 0);
INSERT INTO `user` VALUES (1467069796624367617, 'ryw7test', 'ryw111', '712341@qq.com', '2021-12-04 17:54:31', '2021-12-10 16:11:38', 2, 0, 0);
INSERT INTO `user` VALUES (1467069920360529921, 'r', 'ryw12345', '8@qq.com', '2021-12-04 17:55:01', '2021-12-26 19:50:53', 2, 0, 0);
INSERT INTO `user` VALUES (1467070066506858497, 'ryw9test', 'ryw12345', '9@qq.com', '2021-12-04 17:55:35', '2021-12-04 17:55:35', 1, 0, 0);
INSERT INTO `user` VALUES (1467070287106277378, 'test10ww', 'ryw12345', '10@qq.com', '2021-12-04 17:56:28', '2021-12-04 17:56:28', 1, 0, 0);
INSERT INTO `user` VALUES (1467070420535476226, 'test11ww', 'ryw12345', '11@qq.com', '2021-12-04 17:57:00', '2021-12-04 17:57:00', 1, 0, 0);
INSERT INTO `user` VALUES (1467080359765200898, 'rywDtest123', '1234567', '123@qq.com', '2021-12-04 18:36:29', '2021-12-10 15:53:37', 3, 0, 0);
INSERT INTO `user` VALUES (1467875845680410626, 'rywDtest1', '123435', '123@qq.com', '2021-12-21 12:46:10', '2021-12-21 12:46:10', 1, 0, 0);
INSERT INTO `user` VALUES (1468122511050346498, 'ryst1', 'rywtest123', '1987@qq.com', '2021-12-27 19:18:46', '2022-01-12 14:46:37', 8, 0, 0);
INSERT INTO `user` VALUES (1474981927269265409, 'root123', 'root123', '54254978@qq.com', '2021-12-26 13:56:53', '2021-12-26 13:56:53', 2, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userinfoid` bigint NOT NULL COMMENT '主键',
  `id` bigint NOT NULL COMMENT 'user表的id',
  `tximg` varchar(255) DEFAULT NULL COMMENT '头像',
  `adress` varchar(255) DEFAULT NULL COMMENT '地址',
  `age` int DEFAULT NULL COMMENT '年龄',
  `vipmoney` double(255,0) DEFAULT '0' COMMENT '充值金额',
  `rate` varchar(255) DEFAULT '0' COMMENT '评分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除',
  `version` int DEFAULT '1' COMMENT '乐观锁',
  PRIMARY KEY (`userinfoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
BEGIN;
INSERT INTO `userinfo` VALUES (1, 1, '/tximg/inittximg.jpg', '浙江省杭州市江干区', 21, 99999999, '5', '2021-10-29 20:14:20', '2021-10-31 19:07:37', 0, 1);
INSERT INTO `userinfo` VALUES (1467068953053364226, 1467068952348721153, '/tximg/1467068952348721153tximg.jpg', 'testadress', 18, 0, '0', '2021-12-04 17:51:10', '2022-01-12 13:15:29', 0, 28);
INSERT INTO `userinfo` VALUES (1467069240975556609, 1467069240845533185, '/tximg/1467069240845533185tximg.jpg', 'insert your adress', 18, 0, '0', '2021-12-04 17:52:19', '2022-01-27 17:19:51', 0, 12);
INSERT INTO `userinfo` VALUES (1467069335448059906, 1467069335376756737, '/tximg/inittximg.jpg', 'insert your adress', 18, 0, '0', '2021-12-04 17:52:41', '2021-12-04 17:52:41', 0, 1);
INSERT INTO `userinfo` VALUES (1467069405505519618, 1467069405375496193, '/tximg/inittximg.jpg', 'insert your adress', 18, 0, '0', '2021-12-04 17:52:58', '2021-12-04 17:52:58', 0, 1);
INSERT INTO `userinfo` VALUES (1467069518411988994, 1467069518311325697, '/tximg/inittximg.jpg', 'testhahah', 18, 0, '0', '2021-12-04 17:53:25', '2021-12-05 20:46:16', 0, 4);
INSERT INTO `userinfo` VALUES (1467069796725030913, 1467069796624367617, '/tximg/inittximg.jpg', 'insert your adress', 18, 0, '0', '2021-12-04 17:54:31', '2021-12-04 17:54:31', 0, 1);
INSERT INTO `userinfo` VALUES (1467069920469581826, 1467069920360529921, '/tximg/inittximg.jpg', 'insert your adress', 18, 0, '0', '2021-12-04 17:55:01', '2021-12-04 17:55:01', 0, 1);
INSERT INTO `userinfo` VALUES (1467070066674630657, 1467070066506858497, '/tximg/inittximg.jpg', 'adress', 18, 0, '0', '2021-12-04 17:55:35', '2021-12-10 16:16:03', 0, 4);
INSERT INTO `userinfo` VALUES (1467070287177580545, 1467070287106277378, '/tximg/inittximg.jpg', 'insert your adress', 18, 0, '0', '2021-12-04 17:56:28', '2021-12-10 16:12:44', 0, 4);
INSERT INTO `userinfo` VALUES (1467070420757774338, 1467070420535476226, '/tximg/inittximg.jpg', 'adress', 18, 0, '0', '2021-12-04 17:57:00', '2021-12-10 16:15:47', 0, 7);
INSERT INTO `userinfo` VALUES (1469198684408885249, 1469198683523887106, '/tximg/inittximg.jpg', 'insert your adress', 18, 0, '0', '2021-12-10 14:53:57', '2021-12-10 14:53:57', 0, 1);
INSERT INTO `userinfo` VALUES (1469213487757647874, 1468122511050346498, '/tximg/inittximg.jpg', 'insert your adress', 18, 0, '0', '2021-12-10 15:52:47', '2021-12-10 15:52:47', 1, 1);
INSERT INTO `userinfo` VALUES (1469213499157766145, 1467875845680410626, '/tximg/inittximg.jpg', 'insert your adress', 18, 0, '0', '2021-12-10 15:52:50', '2021-12-10 15:52:50', 1, 1);
INSERT INTO `userinfo` VALUES (1474981927458009090, 1474981927269265409, '/tximg/inittximg.jpg', 'insert your adress', 18, 0, '0', '2021-12-26 13:54:30', '2021-12-26 13:54:30', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for userorder
-- ----------------------------
DROP TABLE IF EXISTS `userorder`;
CREATE TABLE `userorder` (
  `orderid` bigint NOT NULL,
  `id` bigint DEFAULT NULL COMMENT 'user表的id',
  `goodstitle` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goodsimg` varchar(255) DEFAULT NULL COMMENT '头像',
  `adress` varchar(255) DEFAULT NULL COMMENT '地址',
  `username` varchar(20) NOT NULL COMMENT '账户名',
  `email` varchar(20) NOT NULL COMMENT '账户关联邮箱',
  `goodsprice` double(10,2) DEFAULT NULL COMMENT '价格',
  `size` varchar(10) DEFAULT NULL COMMENT '尺码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除',
  `version` int DEFAULT '1' COMMENT '乐观锁',
  `issend` int DEFAULT '0' COMMENT '是否发货',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of userorder
-- ----------------------------
BEGIN;
INSERT INTO `userorder` VALUES (1469205159195222018, 1, '鼎尖口碑羊绒！这个价真的太太太值 ！刺绣羊绒针织衫女', ' /goodsimg/goodsimg7(1).jpg', '浙江省杭州市江干区', 'rywtest', '24736743@qq.com', 1001.00, 'sm', '2021-12-10 15:19:41', '2021-12-10 15:21:43', 1, 2, 1);
INSERT INTO `userorder` VALUES (1469205169672593410, 1, '鼎尖口碑羊绒！这个价真的太太太值 ！刺绣羊绒针织衫女', ' /goodsimg/goodsimg7(1).jpg', '浙江省杭州市江干区', 'rywtest', '24736743@qq.com', 1001.00, 'xl', '2021-12-10 15:19:44', '2021-12-10 15:21:44', 1, 2, 1);
INSERT INTO `userorder` VALUES (1469205175599144961, 1, '鼎尖口碑羊绒！这个价真的太太太值 ！刺绣羊绒针织衫女', ' /goodsimg/goodsimg7(1).jpg', '浙江省杭州市江干区', 'rywtest', '24736743@qq.com', 1001.00, 's', '2021-12-10 15:19:45', '2021-12-26 19:58:30', 0, 4, 1);
INSERT INTO `userorder` VALUES (1469205181995458562, 1, '鼎尖口碑羊绒！这个价真的太太太值 ！刺绣羊绒针织衫女', ' /goodsimg/goodsimg7(1).jpg', '浙江省杭州市江干区', 'rywtest', '24736743@qq.com', 1001.00, 'x', '2021-12-10 15:19:47', '2021-12-10 15:21:45', 0, 2, 1);
INSERT INTO `userorder` VALUES (1469205231425331201, 1467068952348721153, '獨家定制混金丝豹纹连衣裙设计感小众性感修身包臀抹胸裙', ' /goodsimg/goodsimg1(1).jpg', 'insert your adress', 'username', '2@qq.com', 1998.00, 's', '2021-12-10 15:19:58', '2021-12-10 17:20:47', 0, 2, 1);
INSERT INTO `userorder` VALUES (1469205255295115266, 1467068952348721153, '獨家定制混金丝豹纹连衣裙设计感小众性感修身包臀抹胸裙', ' /goodsimg/goodsimg1(1).jpg', 'insert your adress', 'username', '2@qq.com', 1998.00, 'm', '2021-12-10 15:20:04', '2021-12-10 15:21:47', 0, 2, 1);
INSERT INTO `userorder` VALUES (1469205343081897985, 1467068952348721153, '獨家定制混金丝豹纹连衣裙设计感小众性感修身包臀抹胸裙', ' /goodsimg/goodsimg1(1).jpg', 'insert your adress', 'username', '2@qq.com', 1998.00, 'x', '2021-12-10 15:20:25', '2021-12-10 15:20:25', 1, 1, 0);
INSERT INTO `userorder` VALUES (1469205384815222785, 1467068952348721153, '值哭了速抢！琎口羊绒！百搭软糯山羊绒针织衫吊带女', ' /goodsimg/goodsimg5(1).jpg', 'insert your adress', 'username', '2@qq.com', 677.00, 'm', '2021-12-10 15:20:35', '2021-12-10 15:21:49', 0, 2, 1);
INSERT INTO `userorder` VALUES (1469205453555671042, 1467068952348721153, '睡衣女夏季纯棉薄款吊带性感蕾丝公主家居服带胸垫2021年新款睡裙', ' /goodsimg/goodsimg11(1).jpg', 'insert your adress', 'username', '2@qq.com', 999.00, 'xl', '2021-12-10 15:20:51', '2021-12-25 18:56:26', 0, 5, 1);
INSERT INTO `userorder` VALUES (1469205506189991937, 1467068952348721153, '原创电月珍珠挂饰酒红性感露背女团小众吊带连衣裙', ' /goodsimg/goodsimg4(1).jpg', 'insert your adress', 'username', '2@qq.com', 999.00, 'xl', '2021-12-10 15:21:04', '2021-12-10 15:21:51', 1, 2, 1);
INSERT INTO `userorder` VALUES (1469205514620542978, 1467068952348721153, '原创电月珍珠挂饰酒红性感露背女团小众吊带连衣裙', ' /goodsimg/goodsimg4(1).jpg', 'insert your adress', 'username', '2@qq.com', 999.00, 's', '2021-12-10 15:21:06', '2021-12-10 15:21:54', 0, 2, 1);
INSERT INTO `userorder` VALUES (1469205525152440322, 1467068952348721153, '原创电月珍珠挂饰酒红性感露背女团小众吊带连衣裙', ' /goodsimg/goodsimg4(1).jpg', 'insert your adress', 'username', '2@qq.com', 999.00, 's', '2021-12-10 15:21:08', '2021-12-26 19:57:47', 0, 2, 1);
INSERT INTO `userorder` VALUES (1469340743041671170, 1467068952348721153, '怒吼推荐！重磅篙级感！拼接呢面羊毛外套女', ' /goodsimg/goodsimg9(1).jpg', 'insert your adress', 'username', '2@qq.com', 201.00, 'm', '2021-12-11 00:18:27', '2021-12-26 19:57:49', 0, 2, 1);
INSERT INTO `userorder` VALUES (1469472503121436673, 1467068952348721153, '黑色礼服女冬季长裙子高级感御姐修身气质显身材性感一字肩连衣裙', ' /goodsimg/goodsimg2(1).jpg', 'insert your adress', 'username', '2@qq.com', 776.00, 'm', '2021-12-11 09:02:01', '2021-12-27 19:48:44', 0, 2, 1);
INSERT INTO `userorder` VALUES (1473571622035210242, 1467068952348721153, '獨家定制混金丝豹纹连衣裙设计感小众性感修身包臀抹胸裙', ' /goodsimg/goodsimg1(1).jpg', 'insert your adress', 'username', '2@qq.com', 1998.00, 'xl', '2021-12-22 16:30:27', '2021-12-22 16:30:27', 0, 1, 0);
INSERT INTO `userorder` VALUES (1473571630281211905, 1467068952348721153, '獨家定制混金丝豹纹连衣裙设计感小众性感修身包臀抹胸裙', ' /goodsimg/goodsimg1(1).jpg', 'insert your adress', 'username', '2@qq.com', 1998.00, 'xl', '2021-12-22 16:30:29', '2021-12-22 16:30:29', 0, 1, 0);
INSERT INTO `userorder` VALUES (1473571635649921025, 1467068952348721153, '獨家定制混金丝豹纹连衣裙设计感小众性感修身包臀抹胸裙', ' /goodsimg/goodsimg1(1).jpg', 'insert your adress', 'username', '2@qq.com', 1998.00, 'xl', '2021-12-22 16:30:30', '2021-12-22 16:30:30', 0, 1, 0);
INSERT INTO `userorder` VALUES (1473571640246878209, 1467068952348721153, '獨家定制混金丝豹纹连衣裙设计感小众性感修身包臀抹胸裙', ' /goodsimg/goodsimg1(1).jpg', 'insert your adress', 'username', '2@qq.com', 1998.00, 'xl', '2021-12-22 16:30:31', '2021-12-22 16:30:31', 0, 1, 0);
INSERT INTO `userorder` VALUES (1473571644432793602, 1467068952348721153, '獨家定制混金丝豹纹连衣裙设计感小众性感修身包臀抹胸裙', ' /goodsimg/goodsimg1(1).jpg', 'insert your adress', 'username', '2@qq.com', 1998.00, 'xl', '2021-12-22 16:30:32', '2021-12-22 16:30:32', 0, 1, 0);
INSERT INTO `userorder` VALUES (1480121671988871170, 1467068952348721153, '黑色礼服女冬季长裙子高级感御姐修身气质显身材性感一字肩连衣裙', ' /goodsimg/goodsimg2(1).jpg', 'testadress', 'username', '2@qq.com', 776.00, 's', '2022-01-09 18:18:01', '2022-01-09 18:18:01', 0, 1, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
