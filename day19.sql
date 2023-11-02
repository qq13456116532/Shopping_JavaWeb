/*
 Navicat Premium Data Transfer

 Source Server         : 本地MySQL
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : day19

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 02/11/2023 16:27:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` float(8, 2) NULL DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `categoryId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categoryId_fk`(`categoryId` ASC) USING BTREE,
  CONSTRAINT `categoryId_fk` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1XB1YCL7EXLM5AZ8SENMEC7N81PNVJCR', '户外移动电源太阳能充电板折叠便携式USB手机快充电宝光伏发电板', ' 广东深圳', 95.00, 'D18OB0MNUL0727ZAV8TJA23LLWXGRYYM.webp', '', 'JXAKIVQRJJL9ZZQV8X2HOHOWGGXVOE1T');
INSERT INTO `book` VALUES ('30CPFNH8XUO4TWQDC17C8A5M5GXUUQQ6', '太阳能光伏板单晶硅组件电池板发电板200W', '江苏省徐州市', 14.00, 'JTGQUBGYCO6F8HRW7USFN01TV23PQNOY.webp', '', '42FL3YD8SBIKVF0P4UWGVRSIKSJW015M');
INSERT INTO `book` VALUES ('4GZ805OE80KVBUSK3IJS6LIENQMRE26N', '工商业厂房定制方案大型光伏电站设计地面电站工商业并网自投', ' 安徽合肥', 1500.00, 'DT5R3XNWWNA4YQBIBBZ0LCBFEEV8BYL7.webp', '', 'HX1P58BNS8PS8JUH926JWC1ENTI7O4OG');
INSERT INTO `book` VALUES ('6HS7XKWQU27AQFSMC60WQLFDVF4RINY8', '假如给我三天光明', '爱说啥', 211.00, 'AIZMYG3RN4D4RWF6SEVDIYX32AUXLOO.png', '请问', '1');
INSERT INTO `book` VALUES ('74NQW98GEA3RILWB4S4VVYGY12QMR1PC', '单晶硅太阳能电池板手机户外便携光伏发电板折叠USB充电器5v9v12', ' 广东深圳', 398.00, '83HPA0WTZU6KBURS9MHXVC8UGNU0XZRO.webp', '', 'C94JUSYMHNKNGKFLOLE59HRULTJMKARZ');
INSERT INTO `book` VALUES ('BHBYRRGA1ET60X8FMI9W5Q1THX02RV1F', '成都太阳能家用220v并网机发电板别墅屋顶雨棚光伏阳光房全套定制', ' 四川成都', 1000.00, 'L4G8TLWVLQKIL7Z5K3OMPZBGPYFCLAT8.webp', '晶科A级单晶光伏组件', '65YXDYWKPAMBG0T16N0TEC8CS2J6SSG0');
INSERT INTO `book` VALUES ('H945R9E2S6UEDWFJA43F6E3B4U0ILPYQ', '500W太阳能发电板光伏充电板户外渔船房车家用24V电站12V隆基天合', ' 江苏苏州', 1200.00, 'AEWTT45XNH6AF8AEGAAPTTLOPNHGMIVZ.webp', '', 'HFP2UCQUXK7PEDWFQ92QRKSN2LM74HLU');
INSERT INTO `book` VALUES ('K9WUUKPNUU4QKV49JBVT6JPRDSSEOPXV', '太阳能发电板家用全套发电板 100W薄膜光伏电池阳光房发电玻璃', ' 河北保定 ', 100.00, 'OITKK078VE2FW8522OALSR90CZ9YL5JP.webp', '', 'NVIKK8I4Z8BOOAK8O685U7DIJH887X7D');
INSERT INTO `book` VALUES ('P8XA4LOTDHRAF5FKK91FVYZJVA5NS3PI', '铂阳同款太阳能发电板薄膜50W发电玻璃太阳能光伏充电组件', '河北保定', 75.00, 'KV06V7QRGS783NSJRGFFFMGHRX6N16UR.webp', '', 'C3STWB8O28BI1I0968J09U57QRPQZPCW');
INSERT INTO `book` VALUES ('PAU1EMONY6BV5CL59RTJFTJZO2IUL0IW', '180W单晶170W多晶硅太阳能板节能环保电池光伏发电18V家用小电器', ' 江苏徐州', 240.00, '6GBEUG0WB7G07VOJ8G6IT3OFNOHGP6U2.webp', '', 'C3FKQQUDMJ6LW2LQZP9ZWFKO9WXB1LIU');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '其他', '钱钱钱');
INSERT INTO `category` VALUES ('42FL3YD8SBIKVF0P4UWGVRSIKSJW015M', '晶体硅技术', '');
INSERT INTO `category` VALUES ('65YXDYWKPAMBG0T16N0TEC8CS2J6SSG0', '屋顶光伏产品', '');
INSERT INTO `category` VALUES ('C3FKQQUDMJ6LW2LQZP9ZWFKO9WXB1LIU', '多晶硅电池', '');
INSERT INTO `category` VALUES ('C3STWB8O28BI1I0968J09U57QRPQZPCW', '薄膜太阳能技术', '');
INSERT INTO `category` VALUES ('C94JUSYMHNKNGKFLOLE59HRULTJMKARZ', '单晶硅电池', '');
INSERT INTO `category` VALUES ('HFP2UCQUXK7PEDWFQ92QRKSN2LM74HLU', '第三代太阳能技术', '');
INSERT INTO `category` VALUES ('HX1P58BNS8PS8JUH926JWC1ENTI7O4OG', '大型光伏产品', '');
INSERT INTO `category` VALUES ('JXAKIVQRJJL9ZZQV8X2HOHOWGGXVOE1T', '便携式光伏产品', '');
INSERT INTO `category` VALUES ('NVIKK8I4Z8BOOAK8O685U7DIJH887X7D', '薄膜电池', '');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nick` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'root', 'root', 'root');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '添加分类', 'manager/addCategory.jsp', NULL);
INSERT INTO `menu` VALUES ('2', '查询分类', '${pageContext.request.contextPath}/manager/showAllCategories', NULL);
INSERT INTO `menu` VALUES ('3', '添加商品', '${pageContext.request.contextPath}/manager/addBook.jsp', NULL);
INSERT INTO `menu` VALUES ('4', '查看商品', '${pageContext.request.contextPath}/manager/showBooks', NULL);
INSERT INTO `menu` VALUES ('5', '订单查询', '${pageContext.request.contextPath}showPayedOrders', NULL);

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `m_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `r_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`m_id`, `r_id`) USING BTREE,
  INDEX `r_id_fk1`(`r_id` ASC) USING BTREE,
  CONSTRAINT `m_id_fk` FOREIGN KEY (`m_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `r_id_fk1` FOREIGN KEY (`r_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('1', '1');
INSERT INTO `menu_role` VALUES ('2', '1');
INSERT INTO `menu_role` VALUES ('3', '1');
INSERT INTO `menu_role` VALUES ('4', '1');
INSERT INTO `menu_role` VALUES ('5', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ordersnum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `num` int NULL DEFAULT NULL,
  `money` float(8, 2) NULL DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `userId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ordersnum`(`ordersnum` ASC) USING BTREE,
  INDEX `userId_fk`(`userId` ASC) USING BTREE,
  CONSTRAINT `userId_fk` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('ETJNN2CRUC0BESEP3T2JOA3OD46Z770', '202311011698828866200', 1, 223.00, NULL, 0, '1');
INSERT INTO `orders` VALUES ('KRJJO5M1NB48LQWT2JES3QBVJ8ID3K4G', '202311011698828880625', 1, 223.00, NULL, 0, '1');
INSERT INTO `orders` VALUES ('NBKDWL2RTH3PX3U3DAAOG2EK4MQAGEU6', '202311011698828506436', 1, 223.00, NULL, 0, '1');

-- ----------------------------
-- Table structure for orders_item
-- ----------------------------
DROP TABLE IF EXISTS `orders_item`;
CREATE TABLE `orders_item`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `num` int NULL DEFAULT NULL,
  `price` float(8, 2) NULL DEFAULT NULL,
  `bookId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ordersId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bookId_fk`(`bookId` ASC) USING BTREE,
  INDEX `ordersId_fk`(`ordersId` ASC) USING BTREE,
  CONSTRAINT `bookId_fk` FOREIGN KEY (`bookId`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordersId_fk` FOREIGN KEY (`ordersId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_item
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'anything', 'can visit anything');

-- ----------------------------
-- Table structure for role_manager
-- ----------------------------
DROP TABLE IF EXISTS `role_manager`;
CREATE TABLE `role_manager`  (
  `r_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `manager_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`r_id`, `manager_id`) USING BTREE,
  INDEX `manager_id_fk`(`manager_id` ASC) USING BTREE,
  CONSTRAINT `manager_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `r_id_fk2` FOREIGN KEY (`r_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_manager
-- ----------------------------
INSERT INTO `role_manager` VALUES ('1', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nick` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phonenum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `actived` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', 'root', 'root', '1234', 'asasd', '122', '22', b'1');

SET FOREIGN_KEY_CHECKS = 1;
