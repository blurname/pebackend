/*
Navicat MySQL Data Transfer

Source Server         : mq
Source Server Version : 80027
Source Host           : localhost:3306
Source Database       : pe

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-01-02 20:25:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for canvas
-- ----------------------------
DROP TABLE IF EXISTS `canvas`;
CREATE TABLE `canvas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `created_at` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=839 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of canvas
-- ----------------------------
INSERT INTO `canvas` VALUES ('831', '24', '1635425826860');
INSERT INTO `canvas` VALUES ('832', '24', '1635507969026');
INSERT INTO `canvas` VALUES ('833', '24', '1635507990911');
INSERT INTO `canvas` VALUES ('834', '24', '1636885570635');
INSERT INTO `canvas` VALUES ('835', '31', '1637666511134');
INSERT INTO `canvas` VALUES ('836', '31', '1637737536137');
INSERT INTO `canvas` VALUES ('837', '31', '1637825034133');
INSERT INTO `canvas` VALUES ('838', '31', '1639037884704');

-- ----------------------------
-- Table structure for collaboration
-- ----------------------------
DROP TABLE IF EXISTS `collaboration`;
CREATE TABLE `collaboration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canvas_id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `collaborator_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of collaboration
-- ----------------------------
INSERT INTO `collaboration` VALUES ('1', '831', '24', '31');
INSERT INTO `collaboration` VALUES ('2', '832', '24', '31');
INSERT INTO `collaboration` VALUES ('3', '836', '31', '24');

-- ----------------------------
-- Table structure for element
-- ----------------------------
DROP TABLE IF EXISTS `element`;
CREATE TABLE `element` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `owner` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of element
-- ----------------------------
INSERT INTO `element` VALUES ('1', 't1.jpeg', '1', '0');
INSERT INTO `element` VALUES ('2', 't2.jpg', '1', '0');
INSERT INTO `element` VALUES ('3', 't3.jpeg', '1', '0');
INSERT INTO `element` VALUES ('4', 't4.jpeg', '1', '0');
INSERT INTO `element` VALUES ('5', 't5.jpeg', '1', '0');
INSERT INTO `element` VALUES ('6', 't6.jpeg', '1', '0');
INSERT INTO `element` VALUES ('7', 'test.jpg', '1', '0');
INSERT INTO `element` VALUES ('8', 'line', '2', '0');
INSERT INTO `element` VALUES ('9', 'hollowRect', '2', '0');
INSERT INTO `element` VALUES ('10', 'circle', '2', '0');

-- ----------------------------
-- Table structure for spirit
-- ----------------------------
DROP TABLE IF EXISTS `spirit`;
CREATE TABLE `spirit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canvas_spirit_id` int DEFAULT NULL,
  `canvas_id` int DEFAULT NULL,
  `spirit_type` int NOT NULL,
  `model` varchar(255) NOT NULL,
  `element` varchar(255) DEFAULT NULL,
  `unique_props` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of spirit
-- ----------------------------
INSERT INTO `spirit` VALUES ('238', '0', '831', '4', '{\"id\":0,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.8}', 'pure', '{\"uColor\":[0.1803921568627451,0.26666666666666666,0.2,1],\"id\":0}');
INSERT INTO `spirit` VALUES ('240', '1', '831', '2', '{\"id\":1,\"scale\":1.8,\"rotate\":0,\"trans\":{\"left\":-6,\"top\":288},\"layer\":0.7}', 'hollowRect', null);
INSERT INTO `spirit` VALUES ('241', '2', '831', '2', '{\"id\":2,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-356,\"top\":207},\"layer\":0.4}', 'circle', null);
INSERT INTO `spirit` VALUES ('242', '3', '831', '3', '{\"id\":3,\"scale\":0.7,\"rotate\":0,\"trans\":{\"left\":-193,\"top\":243},\"layer\":0.30000000000000004}', 'multi', null);
INSERT INTO `spirit` VALUES ('243', '4', '831', '1', '{\"id\":4,\"scale\":1.5,\"rotate\":0,\"trans\":{\"left\":449,\"top\":-159},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t4.jpeg', '{\"id\":4,\"brightness\":-0.04,\"contrast\":0.03,\"hue\":-0.735,\"saturation\":0,\"vignette\":0}');
INSERT INTO `spirit` VALUES ('244', '5', '831', '1', '{\"id\":5,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":195,\"top\":-110},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t5.jpeg', '{\"id\":5,\"brightness\":0.07,\"contrast\":0,\"hue\":0,\"saturation\":0,\"vignette\":0}');
INSERT INTO `spirit` VALUES ('245', '6', '831', '1', '{\"id\":6,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-328,\"top\":-313},\"layer\":0.9}', 'http://localhost:30001/image/get_single/t3.jpg', null);
INSERT INTO `spirit` VALUES ('246', '7', '831', '1', '{\"id\":7,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-195,\"top\":-112},\"layer\":0.7}', 'http://localhost:30001/image/get_single/test.jpg', '{\"id\":7,\"brightness\":0.02,\"contrast\":0,\"hue\":0,\"saturation\":0,\"vignette\":0}');
INSERT INTO `spirit` VALUES ('247', '8', '831', '1', '{\"id\":8,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-272,\"top\":-295},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t2.jpg', null);
INSERT INTO `spirit` VALUES ('248', '9', '831', '1', '{\"id\":9,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-228,\"top\":132},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t3.jpg', null);
INSERT INTO `spirit` VALUES ('249', '10', '831', '2', '{\"id\":10,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-58,\"top\":-112},\"layer\":0.7}', 'line', null);
INSERT INTO `spirit` VALUES ('274', '0', '832', '4', '{\"id\":0,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.8}', 'cell', null);
INSERT INTO `spirit` VALUES ('275', '1', '832', '2', '{\"id\":1,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":217,\"top\":-122},\"layer\":0.6}', 'hollowRect', '{\"id\":1,\"uColor\":[0.9137254901960784,0.47058823529411764,1,1]}');
INSERT INTO `spirit` VALUES ('279', '2', '832', '1', '{\"id\":2,\"scale\":1.8,\"rotate\":112,\"trans\":{\"left\":-188,\"top\":-28},\"layer\":0.30000000000000004}', 'http://localhost:30001/image/get_single/t1.jpeg', '{\"id\":2,\"brightness\":-0.38,\"contrast\":0.24,\"hue\":-0.93,\"saturation\":0.205,\"vignette\":0.00001}');
INSERT INTO `spirit` VALUES ('284', '0', '834', '4', '{\"id\":0,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.8}', 'cell', null);
INSERT INTO `spirit` VALUES ('299', '1', '834', '3', '{\"id\":1,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-10,\"top\":-260},\"layer\":0.5}', 'multi', null);
INSERT INTO `spirit` VALUES ('300', '2', '834', '3', '{\"id\":2,\"scale\":0.6,\"rotate\":120,\"trans\":{\"left\":-379,\"top\":114},\"layer\":0.6}', 'frac', null);
INSERT INTO `spirit` VALUES ('301', '3', '834', '3', '{\"id\":3,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":326,\"top\":-164},\"layer\":0.30000000000000004}', 'snow', null);
INSERT INTO `spirit` VALUES ('302', '4', '834', '1', '{\"id\":4,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":31,\"top\":201},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t1.jpeg', null);
INSERT INTO `spirit` VALUES ('303', '0', '835', '4', '{\"id\":0,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.8}', 'pure', null);
INSERT INTO `spirit` VALUES ('304', '1', '835', '1', '{\"id\":1,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":323,\"top\":-322},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t1.jpeg', '{\"id\":1,\"brightness\":0.38,\"contrast\":0,\"hue\":0,\"saturation\":0,\"vignette\":0}');
INSERT INTO `spirit` VALUES ('305', '2', '835', '1', '{\"id\":2,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":397,\"top\":-124},\"layer\":0.4}', 'http://localhost:30001/image/get_single/t3.jpg', '{\"id\":2,\"brightness\":0.37,\"contrast\":0.3,\"hue\":-0.62,\"saturation\":0,\"vignette\":0}');
INSERT INTO `spirit` VALUES ('306', '3', '835', '3', '{\"id\":3,\"scale\":1.2,\"rotate\":0,\"trans\":{\"left\":-374,\"top\":172},\"layer\":0.7}', 'frac', null);
INSERT INTO `spirit` VALUES ('307', '4', '835', '3', '{\"id\":4,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":490,\"top\":292},\"layer\":0.4}', 'snow', null);
INSERT INTO `spirit` VALUES ('308', '5', '835', '3', '{\"id\":5,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-433,\"top\":-250},\"layer\":0.7}', 'multi', null);
INSERT INTO `spirit` VALUES ('309', '6', '835', '2', '{\"id\":6,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-165,\"top\":-330},\"layer\":0.7}', 'hollowRect', '{\"id\":6,\"uColor\":[0.7568627450980392,0.047058823529411764,0.4549019607843137,1]}');
INSERT INTO `spirit` VALUES ('310', '7', '835', '2', '{\"id\":7,\"scale\":0.8,\"rotate\":4,\"trans\":{\"left\":-402,\"top\":70},\"layer\":0.30000000000000004}', 'line', null);
INSERT INTO `spirit` VALUES ('311', '8', '835', '2', '{\"id\":8,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-4,\"top\":-157},\"layer\":0.7}', 'circle', null);
INSERT INTO `spirit` VALUES ('312', '9', '835', '2', '{\"id\":9,\"scale\":2,\"rotate\":65,\"trans\":{\"left\":152,\"top\":319},\"layer\":0.7}', 'hollowRect', null);
INSERT INTO `spirit` VALUES ('313', '10', '835', '2', '{\"id\":10,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":255,\"top\":42},\"layer\":0.7}', 'line', '{\"id\":10,\"uColor\":[1,1,1,1]}');
INSERT INTO `spirit` VALUES ('314', '0', '836', '4', '{\"id\":0,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.8}', 'pure', '{\"uColor\":[0.10980392156862745,0.011764705882352941,0.16862745098039217,1],\"id\":0}');
INSERT INTO `spirit` VALUES ('317', '0', '837', '4', '{\"id\":0,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.8}', 'pure', null);
INSERT INTO `spirit` VALUES ('318', '1', '837', '1', '{\"id\":1,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-507,\"top\":208},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t4.jpeg', null);
INSERT INTO `spirit` VALUES ('324', '2', '837', '1', '{\"id\":2,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":403,\"top\":59},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t1.jpeg', null);
INSERT INTO `spirit` VALUES ('325', '3', '837', '1', '{\"id\":3,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-387,\"top\":-244},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t5.jpeg', null);
INSERT INTO `spirit` VALUES ('326', '4', '837', '1', '{\"id\":4,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":162,\"top\":-131},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t3.jpg', null);
INSERT INTO `spirit` VALUES ('327', '5', '837', '1', '{\"id\":5,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-17,\"top\":224},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t2.jpg', null);
INSERT INTO `spirit` VALUES ('341', '1', '836', '1', '{\"id\":1,\"scale\":2,\"rotate\":125,\"trans\":{\"left\":460,\"top\":119},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t3.jpg', '{\"id\":1,\"brightness\":0.02,\"contrast\":-0.13,\"hue\":0.425,\"saturation\":-0.015,\"vignette\":0}');
INSERT INTO `spirit` VALUES ('342', '2', '836', '2', '{\"id\":2,\"scale\":1.1,\"rotate\":51,\"trans\":{\"left\":172,\"top\":-327},\"layer\":0.7}', 'hollowRect', '{\"id\":2,\"uColor\":[0.2980392156862745,1,1,1]}');
INSERT INTO `spirit` VALUES ('343', '3', '836', '2', '{\"id\":3,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-89,\"top\":-394},\"layer\":0.7}', 'line', '{\"id\":3,\"uColor\":[0.38823529411764707,0.5215686274509804,1,1]}');
INSERT INTO `spirit` VALUES ('344', '4', '836', '3', '{\"id\":4,\"scale\":0.6,\"rotate\":-76,\"trans\":{\"left\":-428,\"top\":73},\"layer\":0.7}', 'multi', null);
INSERT INTO `spirit` VALUES ('345', '5', '836', '2', '{\"id\":5,\"scale\":1.6,\"rotate\":71,\"trans\":{\"left\":-9,\"top\":-198},\"layer\":0.5}', 'hollowRect', '{\"id\":5,\"uColor\":[0.5333333333333333,0.6627450980392157,0.7294117647058823,1]}');
INSERT INTO `spirit` VALUES ('346', '6', '836', '2', '{\"id\":6,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-288,\"top\":172},\"layer\":0.7}', 'circle', null);
INSERT INTO `spirit` VALUES ('347', '7', '836', '3', '{\"id\":7,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-403,\"top\":-204},\"layer\":0.7}', 'frac', null);
INSERT INTO `spirit` VALUES ('348', '0', '838', '4', '{\"id\":0,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.8}', 'cell', '{\"rows\":7,\"uColor\":[0.23137254901960785,0.9,0.2,0.5],\"id\":0}');
INSERT INTO `spirit` VALUES ('349', '1', '838', '1', '{\"id\":1,\"scale\":2,\"rotate\":-1,\"trans\":{\"left\":127,\"top\":-46},\"layer\":0.7}', 'http://localhost:30001/image/get_single/t1.jpeg', null);
INSERT INTO `spirit` VALUES ('350', '2', '838', '2', '{\"id\":2,\"scale\":0.7,\"rotate\":0,\"trans\":{\"left\":55,\"top\":98},\"layer\":0.4}', 'hollowRect', null);
INSERT INTO `spirit` VALUES ('351', '3', '838', '3', '{\"id\":3,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-290,\"top\":-207},\"layer\":0.7}', 'snow', null);
INSERT INTO `spirit` VALUES ('352', '4', '838', '3', '{\"id\":4,\"scale\":0.5,\"rotate\":0,\"trans\":{\"left\":148,\"top\":-15},\"layer\":0.6}', 'multi', null);
INSERT INTO `spirit` VALUES ('353', '8', '836', '1', '{\"id\":8,\"scale\":1.4,\"rotate\":80,\"trans\":{\"left\":65,\"top\":86},\"layer\":0.5}', 'http://localhost:30001/image/get_single/t1.jpeg', '{\"id\":8,\"brightness\":0.22,\"contrast\":0.15,\"hue\":0.815,\"saturation\":0.24,\"vignette\":0}');
INSERT INTO `spirit` VALUES ('354', '9', '836', '2', '{\"id\":9,\"scale\":1.1,\"rotate\":86,\"trans\":{\"left\":-114,\"top\":38},\"layer\":0.7}', 'hollowRect', null);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'image');
INSERT INTO `type` VALUES ('2', 'mark');
INSERT INTO `type` VALUES ('3', 'mosaic');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('24', '2021-10-08 19:21:37', 'b', '21', 'b');
INSERT INTO `user` VALUES ('25', '2021-11-18 23:23:34', 'asdf', null, 'sadf');
INSERT INTO `user` VALUES ('30', '2021-11-18 23:38:01', 'bls', null, 'a');
INSERT INTO `user` VALUES ('31', '2021-11-23 18:58:05', 'a', '24', 'a');
