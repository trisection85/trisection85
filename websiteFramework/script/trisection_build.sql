/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50613
Source Host           : localhost:3306
Source Database       : trisection_test_20130828

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2013-09-09 11:31:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for client_info
-- ----------------------------
DROP TABLE IF EXISTS `client_info`;
CREATE TABLE `client_info` (
  `id` int(11) NOT NULL,
  `clientcode` varchar(255) NOT NULL,
  `clientname` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `inputdate` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `menuname` varchar(255) NOT NULL,
  `displayname` varchar(255) NOT NULL,
  `href` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for menu_item
-- ----------------------------
DROP TABLE IF EXISTS `menu_item`;
CREATE TABLE `menu_item` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `menuitemcode` varchar(255) NOT NULL,
  `displayname` varchar(255) NOT NULL,
  `href` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `usercode` varchar(255) CHARACTER SET utf8 NOT NULL,
  `username` varchar(255) NOT NULL,
  `usertype` tinyint(1) NOT NULL,
  `loginname` varchar(255) NOT NULL,
  `password` text,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for xxx_content
-- ----------------------------
DROP TABLE IF EXISTS `xxx_content`;
CREATE TABLE `xxx_content` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `menuitemid` int(11) NOT NULL,
  `contentname` varchar(255) NOT NULL,
  `displayname` varchar(255) NOT NULL,
  `href` text NOT NULL,
  `abstract` text NOT NULL,
  `comment` text NOT NULL,
  `attach` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
