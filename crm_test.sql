/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : crm_n

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-09-29 16:49:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `inputUser_id` bigint(20) DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `positiveTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '王五', '22', '0', '1370000000', '10086', '54', '5', '3', '1', '2018-07-01 15:41:42', '0', null);
INSERT INTO `customer` VALUES ('2', '张三', '18', '0', '1570000000', '10087', '3', '33', '4', '1', '2018-08-03 15:17:57', '1', null);
INSERT INTO `customer` VALUES ('3', '周粥', '25', '0', '1770000000', '10088', '2', '34', '5', '1', '2018-08-03 15:56:30', '3', null);
INSERT INTO `customer` VALUES ('4', '李四', '17', '1', '1880000000', '10089', '2', '34', '6', '1', '2018-08-03 16:24:09', '4', null);
INSERT INTO `customer` VALUES ('5', '大飞', '1', '1', '1600000000', '11008', '2', '5', '5', '1', '2018-09-28 10:53:52', '0', null);
INSERT INTO `customer` VALUES ('6', '逍遥', '10', '1', '1340000000', '11009', '1', '33', '1', '1', '2018-09-28 10:53:48', '2', null);

-- ----------------------------
-- Table structure for customertracehistory
-- ----------------------------
DROP TABLE IF EXISTS `customertracehistory`;
CREATE TABLE `customertracehistory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `traceTime` date DEFAULT NULL,
  `traceDetails` varchar(255) DEFAULT NULL,
  `traceType_id` bigint(20) DEFAULT NULL,
  `traceResult` int(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `inputUser_id` bigint(20) DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `type` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customertracehistory
-- ----------------------------
INSERT INTO `customertracehistory` VALUES ('1', '2018-08-02', '无人接听电话，联系不上', '67', '2', '无人接听电话，联系不上', '1', '1', '2018-08-03 17:27:20', '0');
INSERT INTO `customertracehistory` VALUES ('2', '2018-08-04', '考虑中', '68', '2', '考虑中', '4', '1', '2018-08-04 15:49:18', '0');
INSERT INTO `customertracehistory` VALUES ('3', '2018-08-04', '了解使用感受', '65', '3', '了解使用感受                ', '4', '1', '2018-08-04 18:40:00', '1');
INSERT INTO `customertracehistory` VALUES ('4', '2018-08-04', '建来玩的', '65', '3', '建来玩的', '3', '2', '2018-08-04 18:55:08', '0');
INSERT INTO `customertracehistory` VALUES ('5', '2018-09-27', '他妈喊他回家吃饭', '65', '3', '他妈喊他回家吃饭', '6', '1', '2018-09-25 13:21:12', '0');
INSERT INTO `customertracehistory` VALUES ('6', '2018-09-19', '你大爷好么', '65', '2', '你大爷好么', '6', '1', '2018-09-28 13:21:00', '0');

-- ----------------------------
-- Table structure for customertransfer
-- ----------------------------
DROP TABLE IF EXISTS `customertransfer`;
CREATE TABLE `customertransfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL,
  `operator_id` bigint(20) DEFAULT NULL,
  `operateTime` datetime DEFAULT NULL,
  `oldSeller_id` bigint(20) DEFAULT NULL,
  `newSeller_id` bigint(20) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customertransfer
-- ----------------------------
INSERT INTO `customertransfer` VALUES ('1', '1', '1', '2018-08-04 16:44:11', '2', '1', '离职资源移交');
INSERT INTO `customertransfer` VALUES ('2', '1', '1', '2018-08-04 17:13:38', '2', '1', '奶奶结婚请假');
INSERT INTO `customertransfer` VALUES ('3', '1', '1', '2018-08-04 17:19:54', '2', '1', '就移交玩的，就那么任性');
INSERT INTO `customertransfer` VALUES ('4', '1', '1', '2018-08-04 17:45:38', '1', '1', '谁干的，刚分手，又移给我');
INSERT INTO `customertransfer` VALUES ('5', '1', '1', '2018-08-04 17:53:03', '1', '1', '嘿嘿，谁来接盘');
INSERT INTO `customertransfer` VALUES ('6', '1', '1', '2018-08-04 17:54:58', '1', '1', '离职资源移交');
INSERT INTO `customertransfer` VALUES ('7', '2', '1', '2018-08-04 18:41:51', '1', '1', '二大爷说开家庭会议请假');
INSERT INTO `customertransfer` VALUES ('8', '6', '1', '2018-09-28 14:36:46', '5', '3', '离职资源移交');
INSERT INTO `customertransfer` VALUES ('9', '5', '1', '2018-09-28 14:37:08', '3', '5', '测试一下，功能实现了没有');
INSERT INTO `customertransfer` VALUES ('10', '5', '1', '2018-09-28 14:41:39', '5', '3', '看我多好，移交给你啦');
INSERT INTO `customertransfer` VALUES ('16', '6', '1', '2018-09-28 16:21:30', '3', '1', '别说话，吻我');
INSERT INTO `customertransfer` VALUES ('17', '5', '1', '2018-09-29 09:47:15', '3', '1', '离职资源移交');
INSERT INTO `customertransfer` VALUES ('18', '5', '1', '2018-09-29 09:47:30', '1', '5', '我要吴彦祖');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '总经办', 'General Deparment');
INSERT INTO `department` VALUES ('2', '人力资源部', 'Human Resources Department');
INSERT INTO `department` VALUES ('3', '采购部', 'Order Department');
INSERT INTO `department` VALUES ('4', '仓储部', 'Warehousing Department');
INSERT INTO `department` VALUES ('5', '财务部', 'Finance Department');
INSERT INTO `department` VALUES ('6', '技术部', 'Technolog Department ');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `admin` bit(1) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', 'admin@abc.com', '20', '', '7');
INSERT INTO `employee` VALUES ('2', '赵总', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '35', '\0', '1');
INSERT INTO `employee` VALUES ('3', '赵一明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '1');
INSERT INTO `employee` VALUES ('4', '钱总', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '35', '\0', '2');
INSERT INTO `employee` VALUES ('5', '钱二明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '2');
INSERT INTO `employee` VALUES ('6', '孙总', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '35', '\0', '3');
INSERT INTO `employee` VALUES ('7', '孙三明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '3');
INSERT INTO `employee` VALUES ('8', '李总', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '35', '\0', '4');
INSERT INTO `employee` VALUES ('9', '李四明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '4');
INSERT INTO `employee` VALUES ('10', '周总', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '35', '\0', '5');
INSERT INTO `employee` VALUES ('11', '周五明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '5');
INSERT INTO `employee` VALUES ('12', '吴总', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '35', '\0', '6');
INSERT INTO `employee` VALUES ('13', '吴六明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '6');
INSERT INTO `employee` VALUES ('14', '郑总', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '35', '\0', '7');
INSERT INTO `employee` VALUES ('15', '郑七明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '7');
INSERT INTO `employee` VALUES ('16', '孙四明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '3');
INSERT INTO `employee` VALUES ('17', '孙五明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '3');
INSERT INTO `employee` VALUES ('18', '李五明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '4');
INSERT INTO `employee` VALUES ('19', '李六明', 'c4ca4238a0b923820dcc509a6f75849b', 'xx@xx.com', '25', '\0', '4');

-- ----------------------------
-- Table structure for employee_role
-- ----------------------------
DROP TABLE IF EXISTS `employee_role`;
CREATE TABLE `employee_role` (
  `employee_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_role
-- ----------------------------
INSERT INTO `employee_role` VALUES ('2', '1');
INSERT INTO `employee_role` VALUES ('3', '12');
INSERT INTO `employee_role` VALUES ('5', '11');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `expression` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('31', '部门列表', 'cn.wolfcode.crm.web.controller.DepartmentController:list');
INSERT INTO `permission` VALUES ('32', '部门删除', 'cn.wolfcode.crm.web.controller.DepartmentController:input');
INSERT INTO `permission` VALUES ('33', '编辑', 'cn.wolfcode.crm.web.controller.DepartmentController:input');
INSERT INTO `permission` VALUES ('34', '部门添加/更新', 'cn.wolfcode.crm.web.controller.DepartmentController:saveOrUpdate');
INSERT INTO `permission` VALUES ('35', '员工删除', 'cn.wolfcode.crm.web.controller.EmployeeController:delete');
INSERT INTO `permission` VALUES ('36', '员工列表', 'cn.wolfcode.crm.web.controller.EmployeeController:list');
INSERT INTO `permission` VALUES ('37', '员工编辑', 'cn.wolfcode.crm.web.controller.EmployeeController:input');
INSERT INTO `permission` VALUES ('38', '员工批量删除', 'cn.wolfcode.crm.web.controller.EmployeeController:batchDelete');
INSERT INTO `permission` VALUES ('39', '员工添加/更新', 'cn.wolfcode.crm.web.controller.EmployeeController:saveOrUpdate');
INSERT INTO `permission` VALUES ('40', '角色列表', 'cn.wolfcode.crm.web.controller.RoleController:list');
INSERT INTO `permission` VALUES ('41', '角色删除', 'cn.wolfcode.crm.web.controller.RoleController:input');
INSERT INTO `permission` VALUES ('42', '编辑', 'cn.wolfcode.crm.web.controller.RoleController:input');
INSERT INTO `permission` VALUES ('44', '角色添加/更新', 'cn.wolfcode.crm.web.controller.RoleController:saveOrUpdate');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '人事管理', 'HR_MGR');
INSERT INTO `role` VALUES ('2', '采购管理', 'ORDER_MGR');
INSERT INTO `role` VALUES ('3', '仓储管理', 'WAREHOUSING_MGR');
INSERT INTO `role` VALUES ('4', '行政部管理', 'Admin_MGR');
INSERT INTO `role` VALUES ('11', '市场经理', 'Market_Manager');
INSERT INTO `role` VALUES ('12', '市场专员', 'Market');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '5');
INSERT INTO `role_permission` VALUES ('1', '6');
INSERT INTO `role_permission` VALUES ('1', '7');
INSERT INTO `role_permission` VALUES ('1', '8');
INSERT INTO `role_permission` VALUES ('1', '11');

-- ----------------------------
-- Table structure for systemdictionary
-- ----------------------------
DROP TABLE IF EXISTS `systemdictionary`;
CREATE TABLE `systemdictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemdictionary
-- ----------------------------
INSERT INTO `systemdictionary` VALUES ('1', 'job', '职业', '做什么的');
INSERT INTO `systemdictionary` VALUES ('2', 'source', '来源', '客户来源渠道');
INSERT INTO `systemdictionary` VALUES ('3', 'intentionDegree', '意向程度', '有多么想入坑');
INSERT INTO `systemdictionary` VALUES ('4', 'subject', '学科', '学科分类');
INSERT INTO `systemdictionary` VALUES ('5', 'size', '收款类型', '学费收款方式');
INSERT INTO `systemdictionary` VALUES ('6', 'property', '办学性质', '学校是公有还是私有');
INSERT INTO `systemdictionary` VALUES ('7', 'importance', '客户重要程度', '');
INSERT INTO `systemdictionary` VALUES ('14', 'foreignLangLevel', '外语水平', '');
INSERT INTO `systemdictionary` VALUES ('15', 'clientType', '客户类型', '');
INSERT INTO `systemdictionary` VALUES ('16', 'source', '客户来源', '');
INSERT INTO `systemdictionary` VALUES ('19', 'education', '学历', '学校的办学层次');
INSERT INTO `systemdictionary` VALUES ('26', 'communicationMethod', '交流方式', '跟踪潜在学员的方式');
INSERT INTO `systemdictionary` VALUES ('27', 'tracePurpose', '跟进目的', '无事献殷勤，非奸即盗');
INSERT INTO `systemdictionary` VALUES ('28', 'wantedLevel', '意向程度', '');
INSERT INTO `systemdictionary` VALUES ('31', 'score', '评分', '客户跟踪评审分数');
INSERT INTO `systemdictionary` VALUES ('32', '12', '12', '12');

-- ----------------------------
-- Table structure for systemdictionaryitem
-- ----------------------------
DROP TABLE IF EXISTS `systemdictionaryitem`;
CREATE TABLE `systemdictionaryitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sequence` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemdictionaryitem
-- ----------------------------
INSERT INTO `systemdictionaryitem` VALUES ('1', '1', '老师', '2');
INSERT INTO `systemdictionaryitem` VALUES ('2', '1', '司机', '1');
INSERT INTO `systemdictionaryitem` VALUES ('3', '1', '老板', '1');
INSERT INTO `systemdictionaryitem` VALUES ('4', '2', '自投罗网', '1');
INSERT INTO `systemdictionaryitem` VALUES ('5', '2', '街头小广告', '1');
INSERT INTO `systemdictionaryitem` VALUES ('6', '2', '老学员推荐', '1');
INSERT INTO `systemdictionaryitem` VALUES ('7', '3', '★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('9', '3', '★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('13', '4', 'java', '1');
INSERT INTO `systemdictionaryitem` VALUES ('14', '4', 'ios', '1');
INSERT INTO `systemdictionaryitem` VALUES ('15', '4', 'c#', '1');
INSERT INTO `systemdictionaryitem` VALUES ('16', '5', '信用卡', '1');
INSERT INTO `systemdictionaryitem` VALUES ('17', '5', '贷款', '1');
INSERT INTO `systemdictionaryitem` VALUES ('18', '5', '银行卡', '1');
INSERT INTO `systemdictionaryitem` VALUES ('19', '5', '支付宝', '1');
INSERT INTO `systemdictionaryitem` VALUES ('20', '6', '公办', '1');
INSERT INTO `systemdictionaryitem` VALUES ('21', '6', '民办', '1');
INSERT INTO `systemdictionaryitem` VALUES ('22', '6', '独立院校', '1');
INSERT INTO `systemdictionaryitem` VALUES ('23', '6', '其他', '1');
INSERT INTO `systemdictionaryitem` VALUES ('28', '14', 'CET4', '1');
INSERT INTO `systemdictionaryitem` VALUES ('29', '14', 'CET6', '1');
INSERT INTO `systemdictionaryitem` VALUES ('30', '14', '专八', '1');
INSERT INTO `systemdictionaryitem` VALUES ('31', '15', '线上', '1');
INSERT INTO `systemdictionaryitem` VALUES ('32', '15', '线下', '1');
INSERT INTO `systemdictionaryitem` VALUES ('33', '16', 'QQ', '1');
INSERT INTO `systemdictionaryitem` VALUES ('34', '16', '微信', '1');
INSERT INTO `systemdictionaryitem` VALUES ('35', '17', '广州校区', '1');
INSERT INTO `systemdictionaryitem` VALUES ('36', '17', '西安校区', '1');
INSERT INTO `systemdictionaryitem` VALUES ('37', '17', '上海校区', '1');
INSERT INTO `systemdictionaryitem` VALUES ('38', '17', '北京校区', '1');
INSERT INTO `systemdictionaryitem` VALUES ('39', '17', '深圳校区', '1');
INSERT INTO `systemdictionaryitem` VALUES ('40', '7', '★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('41', '7', '★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('42', '7', '★★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('43', '7', '★★★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('44', '7', '★★★★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('45', '7', '★★★★★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('46', '7', '★★★★★★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('47', '3', '★★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('48', '3', '★★★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('49', '3', '★★★★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('50', '19', '高中', '1');
INSERT INTO `systemdictionaryitem` VALUES ('51', '19', '大专', '1');
INSERT INTO `systemdictionaryitem` VALUES ('52', '19', '本科', '1');
INSERT INTO `systemdictionaryitem` VALUES ('53', '19', '研究生', '1');
INSERT INTO `systemdictionaryitem` VALUES ('54', '1', '学生', '1');
INSERT INTO `systemdictionaryitem` VALUES ('55', '20', '高中', '1');
INSERT INTO `systemdictionaryitem` VALUES ('56', '20', '大专', '1');
INSERT INTO `systemdictionaryitem` VALUES ('57', '20', '本科', '1');
INSERT INTO `systemdictionaryitem` VALUES ('58', '20', '研究生', '1');
INSERT INTO `systemdictionaryitem` VALUES ('59', '24', '正常', '1');
INSERT INTO `systemdictionaryitem` VALUES ('60', '24', '正式学员', '1');
INSERT INTO `systemdictionaryitem` VALUES ('61', '25', 'java学院', '1');
INSERT INTO `systemdictionaryitem` VALUES ('62', '25', 'IOS学院', '1');
INSERT INTO `systemdictionaryitem` VALUES ('63', '25', 'UI学院', '1');
INSERT INTO `systemdictionaryitem` VALUES ('64', '25', 'LOL学院', '1');
INSERT INTO `systemdictionaryitem` VALUES ('65', '26', '营销QQ', '1');
INSERT INTO `systemdictionaryitem` VALUES ('66', '26', '来电咨询', '1');
INSERT INTO `systemdictionaryitem` VALUES ('67', '26', '去电跟踪', '1');
INSERT INTO `systemdictionaryitem` VALUES ('68', '26', '短信', '1');
INSERT INTO `systemdictionaryitem` VALUES ('69', '27', '潜在客户跟进', '1');
INSERT INTO `systemdictionaryitem` VALUES ('70', '27', '撩拨一下', '1');
INSERT INTO `systemdictionaryitem` VALUES ('71', '27', '是时候跟进一波了', '1');
INSERT INTO `systemdictionaryitem` VALUES ('72', '27', '领导让我跟进', '1');
INSERT INTO `systemdictionaryitem` VALUES ('73', '28', '★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('74', '28', '★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('75', '28', '★★★', '1');
INSERT INTO `systemdictionaryitem` VALUES ('76', '29', '高中', '1');
INSERT INTO `systemdictionaryitem` VALUES ('77', '29', '大专', '1');
INSERT INTO `systemdictionaryitem` VALUES ('78', '29', '本科', '1');
INSERT INTO `systemdictionaryitem` VALUES ('79', '31', '还需努力', '1');
INSERT INTO `systemdictionaryitem` VALUES ('80', '31', '非常棒', '1');
INSERT INTO `systemdictionaryitem` VALUES ('81', '31', '还不错，再接再厉', '1');
INSERT INTO `systemdictionaryitem` VALUES ('82', '1', '秘书', '0');
INSERT INTO `systemdictionaryitem` VALUES ('83', '33', '222', '222');
INSERT INTO `systemdictionaryitem` VALUES ('84', '33', '333', '333');
INSERT INTO `systemdictionaryitem` VALUES ('86', '33', '111', '111');
