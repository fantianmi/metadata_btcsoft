/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mamp-pro
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 127.0.0.1:8889
 Source Schema         : nftcn

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 24/06/2022 10:42:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ocenter_action
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_action`;
CREATE TABLE `ocenter_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `module` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11008 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of ocenter_action
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_action` VALUES (1, 'reg', '用户注册', '用户注册', '', '', 1, 1, 1426070545, '');
INSERT INTO `ocenter_action` VALUES (2, 'input_password', '输入密码', '记录输入密码的次数。', '', '', 1, 1, 1426122119, '');
INSERT INTO `ocenter_action` VALUES (3, 'user_login', '用户登录', '积分+10，每天一次', 'a:1:{i:0;a:5:{s:5:\"table\";s:6:\"member\";s:5:\"field\";s:1:\"1\";s:4:\"rule\";s:2:\"10\";s:5:\"cycle\";s:2:\"24\";s:3:\"max\";s:1:\"1\";}}', '[user|get_nickname]在[time|time_format]登录了账号', 1, 1, 1428397656, '');
INSERT INTO `ocenter_action` VALUES (4, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988, '');
INSERT INTO `ocenter_action` VALUES (7, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301, '');
INSERT INTO `ocenter_action` VALUES (8, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392, '');
INSERT INTO `ocenter_action` VALUES (11000, 'forum_lzl_del_reply', '论坛楼中楼删除回复', '论坛删除楼中楼回复记录', '', '', 2, 1, 1433469820, 'Forum');
INSERT INTO `ocenter_action` VALUES (11001, 'forum_lzl_reply', '论坛楼中楼回复', '楼中楼回复记录', '', '[user|get_nickname]在[time|time_formate]时进行了论坛楼中楼回复', 2, 1, 1433469762, 'Forum');
INSERT INTO `ocenter_action` VALUES (11002, 'forum_post_reply', '论坛帖子回复', '用户回复贴子', '', '用户回复贴子', 2, 1, 1433386806, 'Forum');
INSERT INTO `ocenter_action` VALUES (11003, 'forum_edit_post', '编辑帖子', '论坛编辑帖子', '', '论坛编辑帖子', 2, 1, 1433385562, 'Forum');
INSERT INTO `ocenter_action` VALUES (11004, 'forum_add_post', '添加贴子', '论坛添加贴子', '', '论坛添加贴子', 2, 1, 1433385630, 'Forum');
INSERT INTO `ocenter_action` VALUES (11005, 'forum_follow', '论坛板块关注', '用户关注或取消关注论坛板块', '', '用户关注或取消关注论坛板块', 2, 1, 1433382253, 'Forum');
INSERT INTO `ocenter_action` VALUES (11006, 'forum_del_post', '论坛删除贴子', '论坛删除贴子记录', '', '', 2, 1, 1433484800, 'Forum');
INSERT INTO `ocenter_action` VALUES (11007, 'add_news', '资讯投稿', '用户发布资讯', 'N;', '', 2, 1, 1428479582, 'News');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_action_limit
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_action_limit`;
CREATE TABLE `ocenter_action_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `frequency` int(11) NOT NULL,
  `time_number` int(11) NOT NULL,
  `time_unit` varchar(50) NOT NULL,
  `punish` text NOT NULL,
  `if_message` tinyint(4) NOT NULL,
  `message_content` text NOT NULL,
  `action_list` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `module` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_action_limit
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_action_limit` VALUES (1, 'reg', '注册限制', 1, 1, 'minute', 'warning', 0, '', '[reg]', 1, 0, '');
INSERT INTO `ocenter_action_limit` VALUES (2, 'input_password', '输密码', 3, 1, 'minute', 'warning', 0, '', '[input_password]', 1, 0, '');
INSERT INTO `ocenter_action_limit` VALUES (5, 'forum_lzl_del_reply', '论坛删除楼中楼回复', 1, 10, 'second', 'warning', 1, '操作太频繁！10秒后再试~', '[forum_lzl_del_reply]', 1, 0, 'Forum');
INSERT INTO `ocenter_action_limit` VALUES (6, 'forum_lzl_reply', '论坛楼中楼回复', 1, 1, 'minute', 'warning', 1, '操作太频繁！1分钟后再试~', '[forum_lzl_reply]', 1, 0, 'Forum');
INSERT INTO `ocenter_action_limit` VALUES (7, 'forum_del_post', '论坛删除贴子', 1, 1, 'minute', 'warning', 1, '操作太频繁！1分钟后再试~', '[forum_del_post]', 1, 0, 'Forum');
INSERT INTO `ocenter_action_limit` VALUES (8, 'forum_post_reply', '论坛评论贴子', 1, 1, 'minute', 'warning', 1, '操作太频繁！1分钟后再试~', '[forum_post_reply]', 1, 0, 'Forum');
INSERT INTO `ocenter_action_limit` VALUES (9, 'forum_edit_post', '编辑帖子', 1, 1, 'minute', 'warning', 1, '论坛编辑帖子', '[forum_edit_post]', 1, 0, 'Forum');
INSERT INTO `ocenter_action_limit` VALUES (10, 'forum_add_post', '论坛添加贴子', 1, 1, 'minute', 'warning', 1, '操作太频繁！1分钟后再试~', '[forum_add_post]', 1, 0, 'Forum');
INSERT INTO `ocenter_action_limit` VALUES (11, 'forum_follow', '论坛板块关注', 1, 2, 'second', 'warning', 1, '操作太频繁！2秒后再试~', '[forum_follow]', 1, 0, 'Forum');
INSERT INTO `ocenter_action_limit` VALUES (12, 'add_news', '资讯投稿', 1, 1, 'minute', 'warning', 1, '操作太频繁！', '[add_news]', 1, 0, 'News');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_action_log
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_action_log`;
CREATE TABLE `ocenter_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4109 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of ocenter_action_log
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_action_log` VALUES (4095, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:49登录了账号【积分：+10分】', 1, 1655455776);
INSERT INTO `ocenter_action_log` VALUES (4096, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:49登录了账号', 1, 1655455779);
INSERT INTO `ocenter_action_log` VALUES (4097, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:51登录了账号', 1, 1655455876);
INSERT INTO `ocenter_action_log` VALUES (4098, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:51登录了账号', 1, 1655455888);
INSERT INTO `ocenter_action_log` VALUES (4099, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:51登录了账号', 1, 1655455902);
INSERT INTO `ocenter_action_log` VALUES (4100, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:52登录了账号', 1, 1655455976);
INSERT INTO `ocenter_action_log` VALUES (4101, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:53登录了账号', 1, 1655455990);
INSERT INTO `ocenter_action_log` VALUES (4102, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:53登录了账号', 1, 1655455997);
INSERT INTO `ocenter_action_log` VALUES (4103, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:54登录了账号', 1, 1655456065);
INSERT INTO `ocenter_action_log` VALUES (4104, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:55登录了账号', 1, 1655456104);
INSERT INTO `ocenter_action_log` VALUES (4105, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:55登录了账号', 1, 1655456108);
INSERT INTO `ocenter_action_log` VALUES (4106, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:55登录了账号', 1, 1655456146);
INSERT INTO `ocenter_action_log` VALUES (4107, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:56登录了账号', 1, 1655456183);
INSERT INTO `ocenter_action_log` VALUES (4108, 3, 1, 2130706433, 'member', 1, 'god在2022-06-17 16:56登录了账号', 1, 1655456185);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_addons
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_addons`;
CREATE TABLE `ocenter_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of ocenter_addons
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_addons` VALUES (7, 'CheckIn', '签到', '签到插件', 1, '{\"random\":\"1\"}', 'xjw129xjt(肖骏涛)', '0.1', 1432791968, 0);
INSERT INTO `ocenter_addons` VALUES (8, 'Support', '赞', '赞的功能', 1, 'null', '嘉兴想天信息科技有限公司', '0.1', 1432792013, 0);
INSERT INTO `ocenter_addons` VALUES (9, 'SuperLinks', '合作单位', '合作单位', 1, '{\"random\":\"1\"}', '苏南 newsn.net', '0.1', 1432792019, 1);
INSERT INTO `ocenter_addons` VALUES (10, 'Report', '举报后台', '可举报不法数据', 1, '{\"meta\":\"\"}', '想天科技xuminwei', '0.1', 1432792026, 1);
INSERT INTO `ocenter_addons` VALUES (11, 'LocalComment', '本地评论', '本地评论插件，不依赖社会化评论平台', 1, '{\"can_guest_comment\":\"0\"}', 'caipeichao', '0.1', 1432792035, 0);
INSERT INTO `ocenter_addons` VALUES (12, 'ChinaCity', '中国省市区三级联动', '每个系统都需要的一个中国省市区三级联动插件。想天-駿濤修改，将镇级地区移除', 1, 'null', 'i友街', '2.0', 1432792040, 0);
INSERT INTO `ocenter_addons` VALUES (13, 'Recommend', '推荐关注', '可选择多种方法推荐用户', 1, '{\"howToRecommend\":\"1\",\"howManyRecommend\":\"1\",\"recommendUser\":\"1\"}', '嘉兴想天信息科技有限公司', '0.1', 1432792055, 1);
INSERT INTO `ocenter_addons` VALUES (14, 'SyncLogin', '同步登陆', '同步登陆', 1, '{\"type\":null,\"meta\":\"\",\"bind\":\"0\",\"QqKEY\":\"\",\"QqSecret\":\"\",\"SinaKEY\":\"\",\"SinaSecret\":\"\",\"WeixinKEY\":\"\",\"WeixinSecret\":\"\"}', 'xjw129xjt', '0.1', 1432792112, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_adv
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_adv`;
CREATE TABLE `ocenter_adv` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告名称',
  `pos_id` int(11) NOT NULL COMMENT '广告位置',
  `data` text NOT NULL COMMENT '图片地址',
  `click_count` int(11) NOT NULL COMMENT '点击量',
  `url` varchar(500) NOT NULL COMMENT '链接地址',
  `sort` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) unsigned DEFAULT '0' COMMENT '结束时间',
  `target` varchar(20) DEFAULT '_blank',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10026 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告表';

-- ----------------------------
-- Records of ocenter_adv
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_adv` VALUES (10000, 't1', 10000, '{\"pic\":2,\"target\":\"_blank\"}', 0, '', 0, -1, 1628658940, 1628658903, 1629263703, '_blank');
INSERT INTO `ocenter_adv` VALUES (10001, '', 10000, '{\"pic\":3,\"target\":\"_blank\"}', 0, '', 1, -1, 1628658940, 1628658903, 1629263703, '_blank');
INSERT INTO `ocenter_adv` VALUES (10002, '', 10000, '{\"pic\":4,\"target\":\"_blank\"}', 0, '', 2, -1, 1628658940, 1628658903, 1629263703, '_blank');
INSERT INTO `ocenter_adv` VALUES (10003, '', 10000, '{\"pic\":5,\"target\":\"_blank\"}', 0, '', 3, -1, 1628658940, 1628658903, 1629263703, '_blank');
INSERT INTO `ocenter_adv` VALUES (10023, '', 10001, '{\"pic\":42,\"target\":\"_blank\"}', 0, '', 0, 1, 1636094487, 1636094123, 1636698923, '_blank');
INSERT INTO `ocenter_adv` VALUES (10006, '', 5, '{\"pic\":9,\"target\":\"_blank\"}', 0, '', 0, -1, 1629085338, 1629085289, 1629690089, '_blank');
INSERT INTO `ocenter_adv` VALUES (10024, '', 10001, '{\"pic\":10,\"target\":\"_blank\"}', 0, '', 1, 1, 1636094487, 1636094123, 1636698923, '_blank');
INSERT INTO `ocenter_adv` VALUES (10025, '', 10001, '{\"pic\":43,\"target\":\"_blank\"}', 0, '', 2, 1, 1636094487, 1636094123, 1636698923, '_blank');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_adv_pos
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_adv_pos`;
CREATE TABLE `ocenter_adv_pos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL,
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `path` varchar(100) NOT NULL COMMENT '所在路径 模块/控制器/方法',
  `type` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '广告位类型 \r\n1.单图\r\n2.多图\r\n3.文字链接\r\n4.代码',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `data` varchar(500) NOT NULL COMMENT '额外的数据',
  `width` char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
  `height` char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
  `margin` varchar(50) NOT NULL COMMENT '边缘',
  `padding` varchar(50) NOT NULL COMMENT '留白',
  `theme` varchar(50) NOT NULL DEFAULT 'all' COMMENT '适用主题，默认为all，通用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10003 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告位置表';

-- ----------------------------
-- Records of ocenter_adv_pos
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_adv_pos` VALUES (1, 'right_below_all', '右侧底部广告', 'Weibo/Index/index', 1, 1, '0', '280px', '100px', '', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (2, 'below_checkrank', '签到下方广告', 'Weibo/Index/index', 1, 1, '0', '280px', '100px', '0 0 10px 0', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (3, 'filter_right', '过滤右方', 'Weibo/Index/index', 3, 1, '0', '300px', '30px', '', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (10, 'below_post_content', '帖子主题下方广告1', 'Forum/Index/index', 1, 1, '0', '680px', '100px', '', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (11, 'below_post_content', '论坛帖子主题下方广告', 'Forum/Index/detail', 1, 1, '', '680px', '100px', '', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (4, 'below_self_info', '个人资料下方', 'Weibo/Index/index', 1, 1, '', '280px', '100px', '0 0 10px 0', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (5, 'index_top', '资讯首页顶部广告', 'News/Index/index', 2, -1, '', '738px', '240px', '', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (6, 'index_bottom_top', '资讯首页右侧最底部广告', 'News/Index/index', 1, -1, '', '360px', '120px', '10px 0 0 0', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (9, 'slider', '首页轮播图', 'Home/Index/index', 2, 1, '{\"style\":1}', '1120px', '300px', '0 0 15px 0', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (7, 'index_right_top', '资讯首页右侧最顶部广告', 'News/Index/index', 1, -1, '[]', '360px', '120px', '0 0 10px 0', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (8, 'below_article_content', '资讯文章内容下方广告', 'News/Index/detail', 1, 1, '', '690px', '100px', '', '', 'all');
INSERT INTO `ocenter_adv_pos` VALUES (10000, 'app_news_banner', 'app资讯页顶部广告', 'App/News/Banner', 2, 1, '{\"style\":1}', '', '', '', '', '');
INSERT INTO `ocenter_adv_pos` VALUES (10001, 'app_defi_banner', 'app DeFi学堂顶部广告', 'App/Defi/banner', 2, 1, '{\"style\":1}', '', '', '', '', '');
INSERT INTO `ocenter_adv_pos` VALUES (10002, '', '2', '', 2, 1, '{\"style\":1}', '900', '383', '', '', 'all');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_attachment`;
CREATE TABLE `ocenter_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of ocenter_attachment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_attest
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_attest`;
CREATE TABLE `ocenter_attest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `attest_type_id` int(11) NOT NULL COMMENT '认证类型id',
  `child_type` varchar(25) NOT NULL COMMENT '认证称号',
  `company_name` varchar(250) NOT NULL COMMENT '公司名',
  `name` varchar(50) NOT NULL COMMENT '真实姓名',
  `id_num` varchar(25) NOT NULL COMMENT '身份证号码',
  `phone` varchar(25) NOT NULL COMMENT '联系方式',
  `image_type` varchar(50) NOT NULL COMMENT '证件类型',
  `prove_image` varchar(100) NOT NULL COMMENT '企业证明、组织证明材料图片ids',
  `image` varchar(100) NOT NULL COMMENT '身份证正反面照ids',
  `other_image` varchar(100) NOT NULL COMMENT '手持身份证或其他证明材料',
  `info` text NOT NULL COMMENT '认证补充',
  `reason` varchar(200) NOT NULL COMMENT '认证失败原因',
  `status` tinyint(4) NOT NULL COMMENT '认证状态',
  `create_time` int(11) NOT NULL COMMENT '发起认证时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='认证表';

-- ----------------------------
-- Records of ocenter_attest
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_attest_type
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_attest_type`;
CREATE TABLE `ocenter_attest_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL COMMENT '认证类型标识',
  `title` varchar(25) NOT NULL COMMENT '标题',
  `logo` int(11) NOT NULL COMMENT '图标',
  `privilege` varchar(25) NOT NULL COMMENT '特权标识，1：专属认证图标；2：优先推荐；3：各类特权',
  `conditions` varchar(200) NOT NULL COMMENT '条件，avatar：1；phone：1；follow：30；fans：30；friends：2',
  `fields` text NOT NULL COMMENT '字段配置',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `description` text NOT NULL COMMENT '认证说明',
  `tips` varchar(200) NOT NULL COMMENT '认证小提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='认证类型';

-- ----------------------------
-- Records of ocenter_attest_type
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_attest_type` VALUES (1, 'personal', '个人认证', 0, '1,2,3', 'avatar:1|phone:0|follow:0|fans:0|friends:0', 'child_type:1|child_type_option:优秀二次开发者,网红，优秀站长，主播|company_name:0|name:1|id_num:1|phone:1|image_type:1|image_type_option:身份证，驾驶证|prove_image:0|image:1|other_image:2|other_image_tip:请上传手持身份证高清正面照|info:2', 1, '<p><span style=\"color: rgb(255, 0, 0);line-height:30px;\">请详细阅读本说明</span></p><p>1.信息必须真实</p><p>2.证件必须清晰可见</p><p>3.信息必须真实</p><p>4.信息必须真实</p><p>5.信息必须真实</p>', '真实身份，易于被辨识 更加权威，提高可信度');
INSERT INTO `ocenter_attest_type` VALUES (2, 'organization', '组织机构认证', 0, '1,2,3', 'avatar:1|phone:1|follow:30|fans:30|friends:2', 'child_type:1|child_type_option:盈利机构，公益机构|company_name:1|name:2|id_num:2|phone:1|image_type:1|image_type_option:组织机构代码证|prove_image:1|image:0|other_image:2|other_image_tip:请上传代表人的个人身份证、手持身份证高清正面照和其他证明材料|info:2', 1, '<p style=\"white-space: normal;\"><span style=\"color: rgb(255, 0, 0); line-height: 30px;\">请详细阅读本说明</span></p><p style=\"white-space: normal;\">1.信息必须真实</p><p style=\"white-space: normal;\">2.证件必须清晰可见</p><p style=\"white-space: normal;\">3.信息必须真实</p><p style=\"white-space: normal;\">4.信息必须真实</p><p style=\"white-space: normal;\">5.信息必须真实</p><p><br/></p>', '真实身份，易于被辨识 更加权威，提高可信度');
INSERT INTO `ocenter_attest_type` VALUES (3, 'company', '企业认证', 0, '1,2,3', 'avatar:1|phone:1|follow:50|fans:30|friends:5', 'child_type:1|child_type_option:大型企业，中型企业，小型企业，微型企业|company_name:1|name:2|id_num:2|phone:1|image_type:1|image_type_option:组织机构代码证|prove_image:1|image:0|other_image:2|other_image_tip:请上传其他证明材料|info:2', 1, '<p style=\"white-space: normal;\"><span style=\"color: rgb(255, 0, 0); line-height: 30px;\">请详细阅读本说明</span></p><p style=\"white-space: normal;\">1.信息必须真实</p><p style=\"white-space: normal;\">2.证件必须清晰可见</p><p style=\"white-space: normal;\">3.信息必须真实</p><p style=\"white-space: normal;\">4.信息必须真实</p><p style=\"white-space: normal;\">5.信息必须真实</p><p><br/></p>', '真实身份，易于被辨识 更加权威，提高可信度');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_auth_extend`;
CREATE TABLE `ocenter_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组与分类的对应关系表';

-- ----------------------------
-- Records of ocenter_auth_extend
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_auth_extend` VALUES (1, 1, 1);
INSERT INTO `ocenter_auth_extend` VALUES (1, 1, 2);
INSERT INTO `ocenter_auth_extend` VALUES (1, 2, 1);
INSERT INTO `ocenter_auth_extend` VALUES (1, 2, 2);
INSERT INTO `ocenter_auth_extend` VALUES (1, 3, 1);
INSERT INTO `ocenter_auth_extend` VALUES (1, 3, 2);
INSERT INTO `ocenter_auth_extend` VALUES (1, 4, 1);
INSERT INTO `ocenter_auth_extend` VALUES (1, 37, 1);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_auth_group`;
CREATE TABLE `ocenter_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '权限组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '权限组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限组状态：为1正常，为0禁用,-1为删除',
  `rules` text NOT NULL COMMENT '权限组拥有的规则id，多个规则 , 隔开',
  `end_time` int(11) NOT NULL DEFAULT '2000000000' COMMENT '有效期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_auth_group
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_auth_group` VALUES (3, 'admin', 1, '超级管理员', '具有后台所有权限\r\n', 1, ',10117,1,3,5,26,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,61,62,63,64,66,80,81,82,83,84,86,87,94,95,100,102,103,108,109,207,212,213,224,225,226,230,261,262,263,264,313,315,316,317,318,319,320,346,348,350,351,352,355,356,357,358,364,365,366,367,368,369,370,371,391,392,393,395,396,397,399,400,401,408,425,429,431,10001,10015,10016,10017,10018,10019,10020,10031,10032,10033,10034,10035,10036,10037,10038,10041,10042,10043,10055,10066,10067,10068,10070,10074,10076,10078,10079,10080,10082,10087,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137', 2000000000);
INSERT INTO `ocenter_auth_group` VALUES (4, 'admin', 1, '普通管理员', '具有后台部分权限', 1, ',10117,10121,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137', 2000000000);
INSERT INTO `ocenter_auth_group` VALUES (5, 'admin', 1, '特攻队用户', '能查看空投公示', 1, ',10126,10133,10138', 2000000000);
INSERT INTO `ocenter_auth_group` VALUES (6, 'admin', 1, '发放审批人', '负责发放审批', 1, ',10121,10122,10126,10128,10129,10133,10137,10138,10139', 2000000000);
INSERT INTO `ocenter_auth_group` VALUES (7, 'admin', 1, '发放申请人', '负责发放申请', 1, ',10121,10123,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138', 2000000000);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_auth_group_access`;
CREATE TABLE `ocenter_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '权限组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_auth_group_access
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_auth_group_access` VALUES (1, 3);
INSERT INTO `ocenter_auth_group_access` VALUES (105, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1560, 3);
INSERT INTO `ocenter_auth_group_access` VALUES (1568, 4);
INSERT INTO `ocenter_auth_group_access` VALUES (1569, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1570, 6);
INSERT INTO `ocenter_auth_group_access` VALUES (1571, 4);
INSERT INTO `ocenter_auth_group_access` VALUES (1572, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1573, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1574, 4);
INSERT INTO `ocenter_auth_group_access` VALUES (1575, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1576, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1577, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1578, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1579, 4);
INSERT INTO `ocenter_auth_group_access` VALUES (1580, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1581, 4);
INSERT INTO `ocenter_auth_group_access` VALUES (1582, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1583, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1584, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1585, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1586, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1587, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1588, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1589, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1590, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1591, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1592, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1593, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1594, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1595, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1596, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1597, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1598, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1599, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1600, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1601, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1602, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1603, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1604, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1605, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1606, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1607, 3);
INSERT INTO `ocenter_auth_group_access` VALUES (1608, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1609, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1610, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1611, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1612, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1613, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1614, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1615, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1616, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1617, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1618, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1619, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1620, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1621, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1622, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1623, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1624, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1625, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1626, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1627, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1628, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1629, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1630, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1631, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1632, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1633, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1634, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1635, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1636, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1637, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1638, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1639, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1640, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1641, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1642, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1643, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1644, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1645, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1646, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1647, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1648, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1649, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1650, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1651, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1652, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1653, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1654, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1655, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1656, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1657, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1658, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1659, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1660, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1661, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1662, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1663, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1664, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1665, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1666, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1667, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1668, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1669, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1670, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1671, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1672, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1673, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1674, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1675, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1676, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1677, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1678, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1679, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1680, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1681, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1682, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1683, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1684, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1685, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1686, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1687, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1688, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1689, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1690, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1691, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1692, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1693, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1694, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1695, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1696, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1697, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1698, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1699, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1700, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1701, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1702, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1703, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1704, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1705, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1706, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1707, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1708, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1709, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1710, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1711, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1712, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1713, 7);
INSERT INTO `ocenter_auth_group_access` VALUES (1714, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1715, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1716, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1717, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1718, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1719, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1720, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1721, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1722, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1723, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1724, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1725, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1726, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1727, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1728, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1729, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1730, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1731, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1732, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1733, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1734, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1735, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1736, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1737, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1738, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1739, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1740, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1741, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1742, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1743, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1744, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1745, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1746, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1747, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1748, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1749, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1750, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1751, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1752, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1753, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1754, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1755, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1756, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1757, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1758, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1759, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1760, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1761, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1762, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1763, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1764, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1765, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1766, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1767, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1768, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1769, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1770, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1771, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1772, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1773, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1774, 6);
INSERT INTO `ocenter_auth_group_access` VALUES (1775, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1776, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1777, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1778, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1779, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1780, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1781, 4);
INSERT INTO `ocenter_auth_group_access` VALUES (1782, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1783, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1784, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1785, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1786, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1787, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1788, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1789, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1790, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1791, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1792, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1793, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1794, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1795, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1796, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1797, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1798, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1799, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1800, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1801, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1802, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1803, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1804, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1805, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1806, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1807, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1808, 5);
INSERT INTO `ocenter_auth_group_access` VALUES (1809, 5);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_auth_rule`;
CREATE TABLE `ocenter_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=10140 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_auth_rule
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_auth_rule` VALUES (1, 'admin', 2, 'Admin/Index/index', '首页', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (2, 'admin', 2, 'Admin/Article/mydocument', '资讯', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (3, 'admin', 2, 'Admin/User/index', '用户与身份', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (4, 'admin', 2, 'Admin/Addons/index', '插件', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (5, 'admin', 2, 'Admin/Config/group', '系统', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (7, 'admin', 1, 'Admin/article/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (8, 'admin', 1, 'Admin/article/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (9, 'admin', 1, 'Admin/article/setStatus', '改变状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10, 'admin', 1, 'Admin/article/update', '保存', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (12, 'admin', 1, 'Admin/article/move', '移动', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (13, 'admin', 1, 'Admin/article/copy', '复制', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (14, 'admin', 1, 'Admin/article/paste', '粘贴', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (15, 'admin', 1, 'Admin/article/permit', '还原', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (16, 'admin', 1, 'Admin/article/clear', '清空', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (17, 'admin', 1, 'Admin/article/index', '文档列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (18, 'admin', 1, 'Admin/article/recycle', '回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (26, 'admin', 1, 'Admin/User/index', '用户信息', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (27, 'admin', 1, 'Admin/User/action', '积分规则', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存权限组', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (41, 'admin', 1, 'Admin/AuthManager/index', '权限组管理', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (42, 'admin', 1, 'Admin/Addons/create', '创建', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (46, 'admin', 1, 'Admin/Addons/config', '设置', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (49, 'admin', 1, 'Admin/Addons/install', '安装', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (56, 'admin', 1, 'Admin/model/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (57, 'admin', 1, 'Admin/model/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (58, 'admin', 1, 'Admin/model/setStatus', '改变状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (59, 'admin', 1, 'Admin/model/update', '保存数据', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (60, 'admin', 1, 'Admin/Model/index', '模型管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (62, 'admin', 1, 'Admin/Config/del', '删除', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (63, 'admin', 1, 'Admin/Config/add', '新增', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (64, 'admin', 1, 'Admin/Config/save', '保存', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (65, 'admin', 1, 'Admin/Config/group', '网站设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (67, 'admin', 1, 'Admin/Channel/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (68, 'admin', 1, 'Admin/Channel/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (69, 'admin', 1, 'Admin/Channel/del', '删除', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (70, 'admin', 1, 'Admin/Channel/index', '顶部导航', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (71, 'admin', 1, 'Admin/Category/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (72, 'admin', 1, 'Admin/Category/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (73, 'admin', 1, 'Admin/Category/remove', '删除', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (74, 'admin', 1, 'Admin/Category/index', '分类管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (77, 'admin', 1, 'Admin/file/download', '下载', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (79, 'admin', 1, 'Admin/article/batchOperate', '导入', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (82, 'admin', 1, 'Admin/Database/export', '备份', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (86, 'admin', 1, 'Admin/Database/import', '恢复', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (87, 'admin', 1, 'Admin/Database/del', '删除', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (88, 'admin', 1, 'Admin/User/add', '新增用户', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (89, 'admin', 1, 'Admin/Attribute/index', '属性管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (90, 'admin', 1, 'Admin/Attribute/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (91, 'admin', 1, 'Admin/Attribute/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (93, 'admin', 1, 'Admin/Attribute/update', '保存数据', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (96, 'admin', 1, 'Admin/Category/move', '移动', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (97, 'admin', 1, 'Admin/Category/merge', '合并', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (100, 'admin', 1, 'Admin/Menu/index', '后台菜单管理', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (101, 'admin', 1, 'Admin/other', '其他', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (102, 'admin', 1, 'Admin/Menu/add', '新增', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (110, 'admin', 1, 'Admin/action/edit', '查看行为日志', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (205, 'admin', 1, 'Admin/think/add', '新增数据', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (111, 'admin', 2, 'Admin/article/index', '文档列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (112, 'admin', 2, 'Admin/article/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (113, 'admin', 2, 'Admin/article/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (115, 'admin', 2, 'Admin/article/update', '保存', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (117, 'admin', 2, 'Admin/article/move', '移动', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (118, 'admin', 2, 'Admin/article/copy', '复制', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (122, 'admin', 2, 'Admin/article/permit', '还原', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (123, 'admin', 2, 'Admin/article/clear', '清空', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (124, 'admin', 2, 'Admin/User/add', '新增用户', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (125, 'admin', 2, 'Admin/User/action', '用户行为', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存权限组', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (149, 'admin', 2, 'Admin/Addons/create', '创建', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (153, 'admin', 2, 'Admin/Addons/config', '设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (156, 'admin', 2, 'Admin/Addons/install', '安装', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (163, 'admin', 2, 'Admin/model/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (164, 'admin', 2, 'Admin/model/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (166, 'admin', 2, 'Admin/model/update', '保存数据', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (174, 'admin', 2, 'Admin/Config/del', '删除', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (175, 'admin', 2, 'Admin/Config/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (176, 'admin', 2, 'Admin/Config/save', '保存', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (179, 'admin', 2, 'Admin/Channel/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (181, 'admin', 2, 'Admin/Channel/del', '删除', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (184, 'admin', 2, 'Admin/Category/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (185, 'admin', 2, 'Admin/Category/remove', '删除', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (186, 'admin', 2, 'Admin/Category/move', '移动', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (187, 'admin', 2, 'Admin/Category/merge', '合并', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (189, 'admin', 2, 'Admin/Database/export', '备份', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (193, 'admin', 2, 'Admin/Database/import', '恢复', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (194, 'admin', 2, 'Admin/Database/del', '删除', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (195, 'admin', 2, 'Admin/other', '其他', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (196, 'admin', 2, 'Admin/Menu/add', '新增', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (206, 'admin', 1, 'Admin/think/edit', '编辑数据', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (207, 'admin', 1, 'Admin/Menu/import', '导入', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (208, 'admin', 1, 'Admin/Model/generate', '生成', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (211, 'admin', 1, 'Admin/Article/sort', '文档排序', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (212, 'admin', 1, 'Admin/Config/sort', '排序', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (217, 'admin', 1, 'Admin/Forum/forum', '板块管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (218, 'admin', 1, 'Admin/Forum/post', '帖子管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (219, 'admin', 1, 'Admin/Forum/editForum', '编辑／创建板块', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (220, 'admin', 1, 'Admin/Forum/editPost', '编辑帖子', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (221, 'admin', 2, 'Admin//Admin/Forum/index', '讨论区', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (222, 'admin', 2, 'Admin//Admin/Weibo/index', '微博', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (223, 'admin', 1, 'Admin/Forum/sortForum', '排序', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (224, 'admin', 1, 'Admin/SEO/editRule', '新增、编辑', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (225, 'admin', 1, 'Admin/SEO/sortRule', '排序', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (226, 'admin', 1, 'Admin/SEO/index', 'SEO规则管理', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (227, 'admin', 1, 'Admin/Forum/editReply', '新增/编辑回复', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (228, 'admin', 1, 'Admin/Weibo/editComment', '编辑回复', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (229, 'admin', 1, 'Admin/Weibo/editWeibo', '编辑微博', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (230, 'admin', 1, 'Admin/SEO/ruleTrash', 'SEO规则回收站', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (231, 'admin', 1, 'Admin/Rank/userList', '查看用户', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (232, 'admin', 1, 'Admin/Rank/userRankList', '用户头衔列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (233, 'admin', 1, 'Admin/Rank/userAddRank', '关联新头衔', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (234, 'admin', 1, 'Admin/Rank/userChangeRank', '编辑头衔关联', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (235, 'admin', 1, 'Admin/Issue/add', '编辑专辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (236, 'admin', 1, 'Admin/Issue/issue', '专辑管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (237, 'admin', 1, 'Admin/Issue/operate', '专辑操作', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (238, 'admin', 1, 'Admin/Weibo/weibo', '微博管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (239, 'admin', 1, 'Admin/Rank/index', '头衔列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (240, 'admin', 1, 'Admin/Forum/forumTrash', '板块回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (241, 'admin', 1, 'Admin/Weibo/weiboTrash', '微博回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (242, 'admin', 1, 'Admin/Rank/editRank', '添加头衔', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (243, 'admin', 1, 'Admin/Weibo/comment', '回复管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (244, 'admin', 1, 'Admin/Forum/postTrash', '帖子回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (245, 'admin', 1, 'Admin/Weibo/commentTrash', '回复回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (246, 'admin', 1, 'Admin/Issue/issueTrash', '专辑回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (247, 'admin', 1, 'Admin//Admin/Forum/reply', '回复管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (248, 'admin', 1, 'Admin/Forum/replyTrash', '回复回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (249, 'admin', 2, 'Admin/Forum/index', '论坛', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (250, 'admin', 2, 'Admin/Weibo/weibo', '微博', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (251, 'admin', 2, 'Admin/SEO/index', 'SEO', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (252, 'admin', 2, 'Admin/Rank/index', '头衔', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (253, 'admin', 2, 'Admin/Issue/issue', '专辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (254, 'admin', 1, 'Admin/Issue/contents', '内容管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (255, 'admin', 1, 'Admin/User/profile', '扩展资料', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (256, 'admin', 1, 'Admin/User/editProfile', '添加、编辑分组', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (257, 'admin', 1, 'Admin/User/sortProfile', '分组排序', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (258, 'admin', 1, 'Admin/User/field', '字段列表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (259, 'admin', 1, 'Admin/User/editFieldSetting', '添加、编辑字段', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (260, 'admin', 1, 'Admin/User/sortField', '字段排序', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (261, 'admin', 1, 'Admin/Update/quick', '全部补丁', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (262, 'admin', 1, 'Admin/Update/addpack', '新增补丁', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (263, 'admin', 1, 'Admin/User/expandinfo_select', '用户扩展资料列表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (264, 'admin', 1, 'Admin/User/expandinfo_details', '扩展资料详情', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (265, 'admin', 1, 'Admin/Shop/shopLog', '商城信息记录', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (266, 'admin', 1, 'Admin/Shop/setStatus', '商品分类状态设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (267, 'admin', 1, 'Admin/Shop/setGoodsStatus', '商品状态设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (268, 'admin', 1, 'Admin/Shop/operate', '商品分类操作', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (269, 'admin', 1, 'Admin/Shop/add', '商品分类添加', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (270, 'admin', 1, 'Admin/Shop/goodsEdit', '添加、编辑商品', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (271, 'admin', 1, 'Admin/Shop/hotSellConfig', '热销商品阀值配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (272, 'admin', 1, 'Admin/Shop/setNew', '设置新品', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (273, 'admin', 1, 'Admin/EventType/index', '活动分类管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (274, 'admin', 1, 'Admin/Event/event', '内容管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (275, 'admin', 1, 'Admin/EventType/eventTypeTrash', '活动分类回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (276, 'admin', 1, 'Admin/Event/verify', '内容审核', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (277, 'admin', 1, 'Admin/Event/contentTrash', '内容回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (278, 'admin', 1, 'Admin/Rank/rankVerify', '待审核用户头衔', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (279, 'admin', 1, 'Admin/Rank/rankVerifyFailure', '被驳回的头衔申请', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (280, 'admin', 1, 'Admin/Weibo/config', '微博设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (281, 'admin', 1, 'Admin/Issue/verify', '内容审核', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (282, 'admin', 1, 'Admin/Shop/goodsList', '商品列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (283, 'admin', 1, 'Admin/Shop/shopCategory', '商品分类配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (284, 'admin', 1, 'Admin/Shop/categoryTrash', '商品分类回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (285, 'admin', 1, 'Admin/Shop/verify', '待发货交易', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (286, 'admin', 1, 'Admin/Issue/contentTrash', '内容回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (287, 'admin', 1, 'Admin/Shop/goodsBuySuccess', '交易成功记录', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (288, 'admin', 1, 'Admin/Shop/goodsTrash', '商品回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (289, 'admin', 1, 'Admin/Shop/toxMoneyConfig', '货币配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (290, 'admin', 2, 'Admin/Shop/shopCategory', '商城', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (291, 'admin', 2, 'Admin/EventType/index', '活动', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (306, 'Issue', 1, 'addIssueContent', '专辑投稿权限', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (307, 'Issue', 1, 'editIssueContent', '编辑专辑内容（管理）', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (313, 'admin', 1, 'Admin/module/install', '模块安装', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (315, 'admin', 1, 'Admin/module/lists', '模块管理', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (316, 'admin', 1, 'Admin/module/uninstall', '卸载模块', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (317, 'admin', 1, 'Admin/AuthManager/addNode', '新增权限节点', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (318, 'admin', 1, 'Admin/AuthManager/accessUser', '前台权限管理', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (319, 'admin', 1, 'Admin/User/changeGroup', '转移权限组', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (320, 'admin', 1, 'Admin/AuthManager/deleteNode', '删除权限节点', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (321, 'admin', 1, 'Admin/Issue/config', '专辑设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (322, 'admin', 2, 'Admin/module/lists', '云平台', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (346, 'admin', 1, 'Admin/UserConfig/index', '基础配置', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (347, 'admin', 1, 'Admin/User/scoreList', '积分类型', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (348, 'admin', 1, 'Admin/User/editScoreType', '新增/编辑类型', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (349, 'admin', 1, 'Admin/User/recharge', '充值积分', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (350, 'admin', 1, 'Admin/Authorize/ssoSetting', '单点登录配置', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (351, 'admin', 1, 'Admin/Authorize/ssolist', '应用列表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (352, 'admin', 1, 'Admin/authorize/editssoapp', '新增/编辑应用', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (353, 'admin', 1, 'Admin/ActionLimit/limitList', '用户行为', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (354, 'admin', 1, 'Admin/ActionLimit/editLimit', '新增/编辑行为限制', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (355, 'admin', 1, 'Admin/Role/index', '身份列表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (356, 'admin', 1, 'Admin/Role/editRole', '编辑身份', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (357, 'admin', 1, 'Admin/Role/setStatus', '启用、禁用、删除身份', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (358, 'admin', 1, 'Admin/Role/sort', '身份排序', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (359, 'admin', 1, 'Admin/Role/configScore', '默认积分配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (360, 'admin', 1, 'Admin/Role/configAuth', '默认权限配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (361, 'admin', 1, 'Admin/Role/configAvatar', '默认头像配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (362, 'admin', 1, 'Admin/Role/configRank', '默认头衔配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (363, 'admin', 1, 'Admin/Role/configField', '默认字段管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (364, 'admin', 1, 'Admin/Role/group', '身份分组', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (365, 'admin', 1, 'Admin/Role/editGroup', '编辑分组', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (366, 'admin', 1, 'Admin/Role/deleteGroup', '删除分组', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (367, 'admin', 1, 'Admin/Role/config', '身份基本信息配置', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (368, 'admin', 1, 'Admin/Role/userList', '用户身份归属列表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (369, 'admin', 1, 'Admin/Role/setUserStatus', '设置用户状态', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (370, 'admin', 1, 'Admin/Role/setUserAudit', '审核用户', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (371, 'admin', 1, 'Admin/Role/changeRole', '迁移用户', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (372, 'admin', 1, 'Admin/Role/uploadPicture', '上传默认头像', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (373, 'admin', 1, 'Admin/Invite/index', '邀请码类型', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (374, 'admin', 1, 'Admin/Invite/invite', '邀请码管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (375, 'admin', 1, 'Admin/Invite/config', '基础配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (376, 'admin', 1, 'Admin/Invite/buyLog', '兑换记录', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (377, 'admin', 1, 'Admin/Invite/inviteLog', '用户邀请记录', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (378, 'admin', 1, 'Admin/Invite/userInfo', '邀请码列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (379, 'admin', 1, 'Admin/Invite/edit', '编辑邀请注册类型', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (380, 'admin', 1, 'Admin/Invite/setStatus', '删除邀请', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (381, 'admin', 1, 'Admin/Invite/delete', '删除邀请码', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (382, 'admin', 1, 'Admin/Invite/createCode', '生成邀请码', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (383, 'admin', 1, 'Admin/Invite/deleteTrue', '删除无用邀请码', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (384, 'admin', 1, 'Admin/Invite/cvs', '导出cvs', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (385, 'admin', 1, 'Admin/Invite/editUserInfo', '用户信息编辑', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (386, 'admin', 1, 'Admin/Action/remove', '删除日志', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (387, 'admin', 1, 'Admin/Action/clear', '清空日志', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (388, 'admin', 1, 'Admin/User/setTypeStatus', '设置积分状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (389, 'admin', 1, 'Admin/User/delType', '删除积分类型', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (390, 'admin', 1, 'Admin/User/getNickname', '充值积分-获取用户昵称', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (391, 'admin', 1, 'Admin/Menu/del', '删除菜单', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (392, 'admin', 1, 'Admin/Menu/toogleDev', '设置开发者模式可见', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (393, 'admin', 1, 'Admin/Menu/toogleHide', '设置显示隐藏', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (394, 'admin', 1, 'Admin/ActionLimit/setLimitStatus', '行为限制启用、禁用、删除', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (395, 'admin', 1, 'Admin/SEO/setRuleStatus', '启用、禁用、删除、回收站还原', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (396, 'admin', 1, 'Admin/SEO/doClear', '回收站彻底删除', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (397, 'admin', 1, 'Admin/Role/initUnhaveUser', '初始化无角色用户', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (398, 'admin', 1, 'Admin/Addons/delHook', '删除钩子', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (399, 'admin', 1, 'Admin/Update/usePack', '使用补丁', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (400, 'admin', 1, 'Admin/Update/view', '查看补丁', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (401, 'admin', 1, 'Admin/Update/delPack', '删除补丁', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (402, 'admin', 1, 'Admin/UserTag/userTag', '用户标签列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (403, 'admin', 1, 'Admin/UserTag/add', '添加分类、标签', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (404, 'admin', 1, 'Admin/UserTag/setStatus', '设置分类、标签状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (405, 'admin', 1, 'Admin/UserTag/tagTrash', '分类、标签回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (406, 'admin', 1, 'Admin/UserTag/userTagClear', '测底删除回收站内容', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (407, 'admin', 1, 'Admin/role/configusertag', '可拥有标签配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (408, 'admin', 1, 'Admin/Module/edit', '编辑模块', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (409, 'admin', 1, 'Admin/Config/website', '网站信息', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (410, 'admin', 1, 'Admin/Theme/setTheme', '使用主题', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (411, 'admin', 1, 'Admin/Theme/lookTheme', '查看主题', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (412, 'admin', 1, 'Admin/Theme/packageDownload', '主题打包下载', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (413, 'admin', 1, 'Admin/Theme/delete', '卸载删除主题', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (414, 'admin', 1, 'Admin/Theme/add', '上传安装主题', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (415, 'admin', 2, 'Admin/Home/config', '网站主页', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (416, 'admin', 1, 'Admin/Home/config', '基本设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (417, 'admin', 1, 'Admin/Weibo/topic', '话题管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (418, 'admin', 1, 'Admin/Weibo/setWeiboTop', '置顶微博', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (419, 'admin', 1, 'Admin/Weibo/setWeiboStatus', '设置微博状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (420, 'admin', 1, 'Admin/Weibo/setCommentStatus', '设置微博评论状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (421, 'admin', 1, 'Admin/Weibo/setTopicTop', '设置置顶话题', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (422, 'admin', 1, 'Admin/Weibo/delTopic', '删除话题', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (423, 'admin', 1, 'Admin/People/config', '基本设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (424, 'admin', 1, 'Admin/Cloud/index', '云市场', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (425, 'admin', 2, 'Admin/authorize/ssoSetting', '授权', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (426, 'admin', 2, 'Admin/Role/index', '角色', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (427, 'admin', 1, 'Admin/Theme/tpls', '主题管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (428, 'admin', 2, 'Admin/ActionLimit/limitList', '安全', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (429, 'admin', 2, 'Admin/Cloud/index', '扩展', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (430, 'admin', 2, 'Admin/People/config', '会员展示', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (431, 'admin', 1, 'Admin/Index/index', '仪表盘', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (432, 'Ucenter', 1, 'Ucenter/Attest/apply', '申请认证', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10000, 'admin', 1, 'Admin/Cloud/install', '在线安装', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10001, 'admin', 1, 'Admin/User/initpass', '重置用户密码', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10002, 'admin', 1, 'Admin/Cloud/version', '获取版本信息', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10003, 'admin', 1, 'Admin/Cloud/getFileList', '获取文件列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10004, 'admin', 1, 'Admin/Cloud/compare', '比较本地文件', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10005, 'admin', 1, 'Admin/Cloud/cover', '覆盖文件', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10006, 'admin', 1, 'Admin/Cloud/updb', '更新数据库', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10007, 'admin', 1, 'Admin/Cloud/finish', '更新完成', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10008, 'admin', 1, 'Admin/Cloud/getVersionList', '获取扩展升级列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10009, 'admin', 1, 'Admin/Cloud/updateGoods', '自动升级', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10010, 'admin', 1, 'Admin/Cloud/Updating1', '自动升级1-获取文件列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10011, 'admin', 1, 'Admin/Cloud/Updating2', '自动升级2-比较文件', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10012, 'admin', 1, 'Admin/Cloud/updating3', '自动升级3-升级代码', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10013, 'admin', 1, 'Admin/Cloud/updating4', '自动升级4-导入数据库', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10014, 'admin', 1, 'Admin/Cloud/updating5', '自动升级5-重置版本号', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10015, 'admin', 1, 'Admin/Adv/pos', '广告位', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10016, 'admin', 1, 'Admin/Adv/adv', '广告管理', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10017, 'admin', 1, 'Admin/Adv/editAdv', '新增广告', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10018, 'admin', 1, 'Admin/Adv/editPos', '编辑广告位', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10019, 'admin', 1, 'Admin/Adv/setPosStatus', '设置广告位状态', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10020, 'admin', 1, 'Admin/Adv/schedule', '广告排期', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10021, 'admin', 1, 'Admin/Channel/user', '用户导航', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10022, 'admin', 1, 'Admin/Action/scoreLog', '积分日志', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10023, 'admin', 1, 'Admin/Announce/announceList', '公告列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10024, 'admin', 1, 'Admin/Announce/add', '发布公告', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10025, 'admin', 1, 'Admin/Announce/setStatus', '设置公告状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10026, 'admin', 1, 'Admin/Announce/arrive', '公告送达情况', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10027, 'admin', 1, 'Admin/Message/messageSessionList', '会话列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10028, 'admin', 1, 'Admin/Message/messageTplList', '会话模板', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10029, 'admin', 1, 'Admin/Message/sessionRefresh', '刷新会话列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10030, 'admin', 1, 'Admin/Message/tplRefresh', '刷新会话模板列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10031, 'admin', 1, 'Admin/Schedule/editSchedule', '新增/编辑计划任务', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10032, 'admin', 1, 'admin/schedule/run', '运行/停止计划任务', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10033, 'admin', 1, 'Admin/Schedule/showLog', '查看日志', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10034, 'admin', 1, 'admin/schedule/clearLog', '清空日志', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10035, 'admin', 1, 'Admin/Schedule/reRun', '重启计划任务', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10036, 'admin', 1, 'Admin/Schedule/setScheduleStatus', '设置计划任务状态', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10037, 'admin', 1, 'Admin/Count/setActiveAction', '设置活跃度绑定的行为', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10038, 'admin', 1, 'Admin/Count/downUser', '下线在线用户', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10039, 'admin', 1, 'Admin/Message/config', '会话设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10040, 'admin', 1, 'Admin/Channel/customEdit', '频道编辑', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10041, 'admin', 1, 'Admin/Index/addTo', '添加', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10042, 'admin', 1, 'Admin/Index/delTile', '删除', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10043, 'admin', 1, 'Admin/Index/setTile', '修改', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10044, 'admin', 1, 'Admin/SuperLinks/index', '友情链接', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10045, 'admin', 1, 'Admin/Picture/config', '图片水印设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10046, 'admin', 1, 'Admin/Picture/uploadWater', '上传水印图片', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10047, 'admin', 1, 'Admin/Picture/pictureList', '图片列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10048, 'admin', 1, 'Admin/Picture/setStatus', '设置图片状态、删除图片', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10049, 'admin', 1, 'Admin/Sensitive/index', '敏感词列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10050, 'admin', 1, 'Admin/Sensitive/config', '敏感词设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10051, 'admin', 1, 'Admin/Sensitive/addMore', '批量添加', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10052, 'admin', 1, 'Admin/Sensitive/edit', '新增、编辑敏感词', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10053, 'admin', 1, 'Admin/Sensitive/setStatus', '设置敏感词状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10054, 'admin', 1, 'Admin/Expression/iexpressionList', '自定义表情列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10055, 'admin', 1, 'Admin/Role/moduleRole', '允许身份访问', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10056, 'admin', 1, 'Admin/Attest/attestTypes', '认证类型', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10057, 'admin', 1, 'Admin/Attest/setCondition', '认证条件设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10058, 'admin', 1, 'Admin/Attest/setFields', '认证字段管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10059, 'admin', 1, 'Admin/Attest/editType', '编辑认证类型', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10060, 'admin', 1, 'Admin/Attest/attestList', '认证用户列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10061, 'admin', 1, 'Admin/Attest/setAttestStatus', '设置认证状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10062, 'admin', 1, 'Admin/User/bindwechat', '微信绑定', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10063, 'admin', 1, 'Admin/Message/listMessageEvent', '消息模板', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10064, 'admin', 1, 'Admin/Cloud/update', '自动升级', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10065, 'admin', 1, 'Admin/Rank/setVerifyStatus', '用户头衔审核', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10066, 'admin', 1, 'Admin/Index/stats', '数据概览', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10067, 'admin', 1, 'Admin/Count/index', '网站统计', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10068, 'admin', 2, 'Admin/Super_links/index', '运营', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10069, 'admin', 1, 'Admin/Expression/index', '表情设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10070, 'admin', 1, 'Admin/Count/lost', '流失率统计', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10071, 'admin', 1, 'Admin/Action/smslog', '短信日志', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10072, 'admin', 1, 'Admin/message/sendMessage', '群发消息', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10073, 'admin', 1, 'Admin/Expression/add', '添加表情包', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10074, 'admin', 1, 'Admin/Count/remain', '留存率统计', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10075, 'admin', 1, 'Admin/Expression/package', '表情包列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10076, 'admin', 1, 'Admin/Count/consumption', '充值用户统计', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10077, 'admin', 1, 'Admin/Expression/expressionList', '表情列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10078, 'admin', 1, 'Admin/Count/active', '活跃用户统计', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10079, 'admin', 1, 'Admin/EditorTool/config', '编辑器配置', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10080, 'admin', 1, 'Admin/MarkDown/config', 'MarkDown配置', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10081, 'admin', 1, 'Admin/Expression/delPackage', '删除表情包', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10082, 'admin', 1, 'Admin/Count/nowUserList', '在线用户列表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10083, 'admin', 1, 'Admin/Expression/editPackage', '编辑表情包', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10084, 'admin', 1, 'Admin/Expression/delExpression', '删除表情', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10085, 'admin', 1, 'Admin/Expression/upload', '上传表情包', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10086, 'admin', 1, 'Admin/message/userList', '群发消息用户列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10087, 'admin', 1, 'admin/schedule/scheduleList', '计划任务列表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10088, 'Forum', 1, 'Forum/Index/doReplyEdit', '论坛编辑评论（管理）', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10089, 'Forum', 1, 'Forum/Lzl/doSendLZLReply', '论坛回复评论权限', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10090, 'Forum', 1, 'Forum/Lzl/delLZLReply', '论坛删除楼中楼回复（管理）', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10091, 'Forum', 1, 'Forum/Index/doReply', '论坛帖子评论', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10092, 'Forum', 1, 'Forum/Index/addPost', '论坛添加贴子', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10093, 'Forum', 1, 'Forum/Index/editPost', '论坛编辑帖子（编辑）', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10094, 'Forum', 1, 'Forum/Index/delPostReply', '论坛删除评论（管理）', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10095, 'Forum', 1, 'Forum/Index/delPost', '论坛删除贴子（编辑）', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10096, 'News', 1, 'News/Index/add', '资讯投稿', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10097, 'News', 1, 'News/Index/edit', '编辑资讯（管理）', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10098, 'admin', 1, 'Admin/News/config', '基础配置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10099, 'admin', 1, 'Admin/News/newsTrash', '资讯回收站', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10100, 'admin', 1, 'Admin/News/index', '资讯列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10101, 'admin', 1, 'Admin/News/editNews', '编辑、添加资讯', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10102, 'admin', 1, 'Admin/News/setDead', '设为到期', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10103, 'admin', 1, 'Admin/News/newsCategory', '分类管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10104, 'admin', 1, 'Admin/News/add', '编辑、添加分类', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10105, 'admin', 1, 'Admin/Forum/type', '分类管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10106, 'admin', 1, 'Admin/Forum/addType', '新增/编辑分类', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10107, 'admin', 1, 'Admin/Forum/setTypeStatus', '设置分类状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10108, 'admin', 1, 'Admin/Forum/setReplyStatus', '设置回复状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10109, 'admin', 1, 'Admin/Forum/setPostStatus', '设置帖子状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10110, 'admin', 1, 'Admin/Forum/doSortForum', '设置版块排序', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10111, 'admin', 1, 'Admin/Forum/setForumStatus', '设置版块状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10112, 'admin', 1, 'Admin/News/setStatus', '设置分类状态', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10113, 'admin', 1, 'Admin/News/audit', '审核列表', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10114, 'admin', 1, 'Admin/News/doAudit', '资讯审核失败操作', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10115, 'admin', 1, 'Admin/News/setNewsStatus', '审核通过', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10116, 'admin', 2, 'Admin/Dman/index', 'aWSB', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10117, 'admin', 1, 'Admin/Dman/index', '空投公示', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10118, 'admin', 1, 'Admin/Forum/replyManager', '回复管理', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10119, 'admin', 1, 'Admin/Forum/config', '论坛设置', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10120, 'admin', 2, 'Admin/News/index', '资讯', -1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10121, 'admin', 2, 'Admin/Nftunit/index', 'NFTUNIT', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10122, 'admin', 1, 'Admin/Nftunit/startAirdrop', '空投发放状态监控', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10123, 'admin', 1, 'Admin/Nftunit/deleteAirdropDetails', '删除空投详情', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10124, 'admin', 1, 'Admin/Nftunit/editUser', '用户录入', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10125, 'admin', 1, 'Admin/Nftunit/deleteUser', '用户删除', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10126, 'admin', 1, 'Admin/Nftunit/index', '用户列表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10127, 'admin', 1, 'Admin/Nftunit/batchAddAirdropDetails', '批量添加空投目标', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10128, 'admin', 1, 'Admin/Nftunit/airdropDetails', '空投详情', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10129, 'admin', 1, 'Admin/Nftunit/airdrops', '空投发放', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10130, 'admin', 1, 'Admin/Nftunit/editAirdrop', '编辑空投发放', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10131, 'admin', 1, 'Admin/Nftunit/deleteAirdrop', '删除空投', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10132, 'admin', 1, 'Admin/Nftunit/editAirdropDetails', '编辑空投详情', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10133, 'admin', 1, 'Admin/Nftunit/airdropLog', '空投公示', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10134, 'admin', 1, 'Admin/Nftunit/batchAddAirdropRedirect', '批量添加空投', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10135, 'admin', 1, 'Admin/Nftunit/jsAddAirdropDetailAjax', 'js方法添加空投', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10136, 'admin', 1, 'Admin/Nftunit/jsAddAirdropDetail', 'js方法添加空投页面', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10137, 'admin', 1, 'Admin/Nftunit/jsUserData', 'js查询用户数据', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10138, 'admin', 1, 'Admin/Nftunit/userAirdropDetails', '用户空投列表', 1, '');
INSERT INTO `ocenter_auth_rule` VALUES (10139, 'admin', 1, 'Admin/Nftunit/restartAirdrop', '重新发起空投', 1, '');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_avatar
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_avatar`;
CREATE TABLE `ocenter_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `path` varchar(200) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_temp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_avatar
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_avatar` VALUES (1, 100, '/100/5a685d6e27279.jpg', 'local', 1516789109, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (2, 105, '/Uploads/Download/2021-08-24/6124bcb6a5b7c.jpg', 'local', 1629798481, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (3, 105, '/Uploads/Download/2021-08-24/6124c09c1a348.jpg', 'local', 1629798567, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (4, 105, '/Uploads/Download/2021-08-24/6124c09c1a348.jpg', 'local', 1629798988, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (5, 105, '/Uploads/Download/2021-08-24/6124c2a1ac675.jpg', 'local', 1629799077, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (6, 105, '/Uploads/Download/2021-08-24/6124bcb6a5b7c.jpg', 'local', 1629799321, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (7, 115, '/Uploads/Download/2021-09-02/6130e6483a0c0.jpg', 'local', 1630594633, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (8, 105, '/Uploads/Download/2021-09-03/6131c0e49d277.jpg', 'local', 1630650599, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (9, 105, '/Uploads/Download/2021-09-03/6131c0fcdc632.jpg', 'local', 1630650622, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (10, 105, '/Uploads/Download/2021-09-03/6131c11b601df.jpg', 'local', 1630650652, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (11, 106, '/Uploads/Download/2021-09-03/6131c11b601df.jpg', 'local', 1630651365, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (12, 109, '/Uploads/Download/2021-09-03/6132129ee8305.jpg', 'local', 1630671520, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (13, 111, '/Uploads/Download/2021-09-03/613212b65cb3a.jpg', 'local', 1630671544, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (14, 114, '/Uploads/Download/2021-09-03/6132149c19beb.jpg', 'local', 1630672030, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (15, 118, '/Uploads/Download/2021-09-03/6132321eac5b5.jpg', 'local', 1630679585, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (16, 119, '/Uploads/Download/2021-09-04/6132aadd98183.jpg', 'local', 1630710497, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (17, 105, '/Uploads/Download/2021-09-05/6134827eae413.jpg', 'local', 1630831231, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (18, 105, '/Uploads/Download/2021-09-05/6134827eae413.jpg', 'local', 1630832954, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (19, 105, '/Uploads/Download/2021-09-05/6134827eae413.jpg', 'local', 1630832973, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (20, 105, '/Uploads/Download/2021-09-05/6134827eae413.jpg', 'local', 1630832987, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (21, 105, '/Uploads/Download/2021-09-05/6134930337e8b.jpg', 'local', 1630835460, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (22, 105, '/Uploads/Download/2021-09-10/613af757e6aa9.jpg', 'local', 1631254360, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (23, 109, '/Uploads/Download/2021-09-10/613b59b1babba.jpg', 'local', 1631279539, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (24, 109, '/Uploads/Download/2021-09-10/613b59b1babba.jpg', 'local', 1631279539, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (25, 105, '/Uploads/Download/2021-09-13/613ee9af6a0d9.jpg', 'local', 1631513008, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (26, 164, '/Uploads/Download/2021-09-15/6141d33c738b2.jpg', 'local', 1631703874, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (27, 273, '/Uploads/Download/2021-09-17/6144b98d4697f.jpg', 'local', 1631894135, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (28, 402, '/Uploads/Download/2021-09-03/6131c0e49d277.jpg', 'local', 1632323752, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (29, 444, '/Uploads/Download/2021-09-24/614d45b7649f6.jpg', 'local', 1632454073, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (30, 149, '/Uploads/Download/2021-09-27/61516d989a6b3.jpg', 'local', 1632726425, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (31, 507, '/Uploads/Download/2021-09-27/61518e5fc8c86.jpg', 'local', 1632734817, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (32, 595, '/Uploads/Download/2021-10-05/615c4d26ceb0c.jpg', 'local', 1633439020, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (33, 632, '/Uploads/Download/2021-10-08/615ffef514879.jpg', 'local', 1633681141, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (34, 649, '/Uploads/Download/2021-10-09/6160e5f6bc830.jpg', 'local', 1633740280, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (35, 650, '/Uploads/Download/2021-10-09/6160e855a3e89.jpg', 'local', 1633740888, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (36, 569, '/Uploads/Download/2021-10-10/61622cea5ea88.jpg', 'local', 1633823981, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (37, 676, '/Uploads/Download/2021-10-12/616468fabebff.jpg', 'local', 1633970429, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (38, 722, '/Uploads/Download/2021-10-12/6165045c4b713.jpg', 'local', 1634010207, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (39, 732, '/Uploads/Download/2021-10-12/61651f44de5fc.jpg', 'local', 1634017097, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (40, 734, '/Uploads/Download/2021-10-12/61651f633c8cb.jpg', 'local', 1634017124, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (41, 732, '/Uploads/Download/2021-10-12/61651fe84180f.jpg', 'local', 1634017260, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (42, 732, '/Uploads/Download/2021-10-12/61652027e9bc6.jpg', 'local', 1634017322, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (43, 751, '/Uploads/Download/2021-10-12/61652625b7b15.jpg', 'local', 1634018856, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (44, 751, '/Uploads/Download/2021-10-12/6165264becf4c.jpg', 'local', 1634018893, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (45, 763, '/Uploads/Download/2021-10-12/6165484a96b5b.jpg', 'local', 1634027596, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (46, 802, '/Uploads/Download/2021-10-13/61667c2c1e3de.jpg', 'local', 1634106414, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (47, 823, '/Uploads/Download/2021-10-13/6166b2b7edd99.jpg', 'local', 1634120381, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (48, 694, '/Uploads/Download/2021-10-14/6167815c4b673.jpg', 'local', 1634173291, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (49, 111, '/Uploads/Download/2021-10-14/6168449a37686.jpg', 'local', 1634223260, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (50, 705, '/Uploads/Download/2021-10-15/616970271a1f2.jpg', 'local', 1634299945, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (51, 964, '/Uploads/Download/2021-10-18/616d2776cb276.jpg', 'local', 1634543494, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (52, 971, '/Uploads/Download/2021-10-18/616d2ae0e86d2.jpg', 'local', 1634544354, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (53, 971, '/Uploads/Download/2021-10-18/616d2ae0e86d2.jpg', 'local', 1634544355, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (54, 1002, '/Uploads/Download/2021-10-19/616e4c66a7b9f.jpg', 'local', 1634618473, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (55, 796, '/Uploads/Download/2021-10-19/616e732b4f20a.jpg', 'local', 1634628397, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (56, 1018, '/Uploads/Download/2021-10-19/616ed8647cd85.jpg', 'local', 1634654310, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (57, 1016, '/Uploads/Download/2021-10-19/616ed8a26cb8e.jpg', 'local', 1634654371, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (58, 1065, '/Uploads/Download/2021-10-22/6172cf3205fe6.jpg', 'local', 1634914125, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (59, 1065, '/Uploads/Download/2021-10-22/6172cf3205fe6.jpg', 'local', 1634914127, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (60, 1065, '/Uploads/Download/2021-10-22/6172cf3205fe6.jpg', 'local', 1634914131, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (61, 870, '/Uploads/Download/2021-10-23/6173f5144b969.jpg', 'local', 1634989337, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (62, 1092, '/Uploads/Download/2021-10-23/6173fd182ea9c.jpg', 'local', 1634991385, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (63, 441, '/Uploads/Download/2021-10-24/6175252e022ce.jpg', 'local', 1635067183, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (64, 1101, '/Uploads/Download/2021-10-24/6175261c0f483.jpg', 'local', 1635067421, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (65, 1106, '/Uploads/Download/2021-10-24/61752f4cc72ca.jpg', 'local', 1635069773, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (66, 1110, '/Uploads/Download/2021-10-24/617534131ce22.jpg', 'local', 1635070998, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (67, 1182, '/Uploads/Download/2021-10-25/6176425e897f8.jpg', 'local', 1635140191, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (68, 1188, '/Uploads/Download/2021-10-25/61766657000ae.jpg', 'local', 1635149403, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (69, 1195, '/Uploads/Download/2021-10-25/61766c33da0e0.jpg', 'local', 1635150902, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (70, 1207, '/Uploads/Download/2021-10-25/617677cb121b7.jpg', 'local', 1635153868, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (71, 1216, '/Uploads/Download/2021-10-25/617678f0391a1.jpg', 'local', 1635154162, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (72, 1241, '/Uploads/Download/2021-10-25/6176a2273a8e1.jpg', 'local', 1635164711, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (73, 1201, '/Uploads/Download/2021-10-25/6176a6d03a52d.jpg', 'local', 1635165907, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (74, 1033, '/Uploads/Download/2021-10-25/6176c8d00582d.jpg', 'local', 1635174611, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (75, 818, '/Uploads/Download/2021-10-25/6176ce6bca24f.jpg', 'local', 1635176078, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (76, 1254, '/Uploads/Download/2021-10-26/617722e3bb456.jpg', 'local', 1635197669, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (77, 1264, '/Uploads/Download/2021-10-26/61777f38e4fac.jpg', 'local', 1635221307, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (78, 1269, '/Uploads/Download/2021-10-27/6178f2c30e983.jpg', 'local', 1635316423, 0, 0);
INSERT INTO `ocenter_avatar` VALUES (79, 1293, '/Uploads/Download/2021-10-27/6178ff8e532f9.jpg', 'local', 1635319694, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (80, 1320, '/Uploads/Download/2021-10-28/617977ede3f29.jpg', 'local', 1635350512, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (81, 1344, '/Uploads/Download/2021-10-28/617a6cb524c32.jpg', 'local', 1635413175, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (82, 1436, '/Uploads/Download/2021-10-31/617e5610ec6ad.jpg', 'local', 1635669522, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (83, 1269, '/Uploads/Download/2021-11-03/6181e495ec44f.jpg', 'local', 1635902618, 1, 0);
INSERT INTO `ocenter_avatar` VALUES (84, 1487, '/Uploads/Download/2021-11-11/618c744b2c481.jpg', 'local', 1636594810, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_checkin
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_checkin`;
CREATE TABLE `ocenter_checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_checkin
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_config
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_config`;
CREATE TABLE `ocenter_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(500) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=11164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_config
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_config` VALUES (100, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 11);
INSERT INTO `ocenter_config` VALUES (101, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n8:多选框', 8);
INSERT INTO `ocenter_config` VALUES (102, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:邮件', 15);
INSERT INTO `ocenter_config` VALUES (103, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 17);
INSERT INTO `ocenter_config` VALUES (104, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 20);
INSERT INTO `ocenter_config` VALUES (105, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 24);
INSERT INTO `ocenter_config` VALUES (107, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 13);
INSERT INTO `ocenter_config` VALUES (108, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/Backup', 16);
INSERT INTO `ocenter_config` VALUES (109, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 18);
INSERT INTO `ocenter_config` VALUES (110, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 22);
INSERT INTO `ocenter_config` VALUES (111, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 25);
INSERT INTO `ocenter_config` VALUES (112, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式，部分后台功能必须在开发者模式下才生效，重新设置后清空缓存生效', 1383105995, 1383291877, 1, '0', 26);
INSERT INTO `ocenter_config` VALUES (113, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 2);
INSERT INTO `ocenter_config` VALUES (114, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 3);
INSERT INTO `ocenter_config` VALUES (115, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 27);
INSERT INTO `ocenter_config` VALUES (116, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 7);
INSERT INTO `ocenter_config` VALUES (117, 'MAIL_TYPE', 4, '邮件类型', 5, '1:SMTP 模块发送\r\n2:mail() 函数发送', '如果您选择了采用服务器内置的 Mail 服务，您不需要填写下面的内容', 1388332882, 1388931416, 1, '1', 0);
INSERT INTO `ocenter_config` VALUES (118, 'MAIL_SMTP_HOST', 1, 'SMTP 服务器', 5, '', 'SMTP服务器', 1388332932, 1388332932, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (119, 'MAIL_SMTP_PORT', 0, 'SMTP服务器端口', 5, '', '默认25', 1388332975, 1388332975, 1, '25', 0);
INSERT INTO `ocenter_config` VALUES (120, 'MAIL_SMTP_USER', 1, 'SMTP服务器用户名', 5, '', '填写完整用户名', 1388333010, 1388333010, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (121, 'MAIL_SMTP_PASS', 6, 'SMTP服务器密码', 5, '', '填写您的密码', 1388333057, 1389187088, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (122, 'MAIL_USER_PASS', 5, '密码找回模板', 0, '', '支持HTML代码', 1388583989, 1388672614, 1, '密码找回111223333555111', 0);
INSERT INTO `ocenter_config` VALUES (123, 'PIC_FILE_PATH', 1, '图片文件保存根目录', 4, '', '图片文件保存根目录./目录/', 1388673255, 1388673255, 1, './Uploads/', 0);
INSERT INTO `ocenter_config` VALUES (124, 'COUNT_DAY', 0, '后台首页统计用户增长天数', 0, '', '默认统计最近半个月的用户数增长情况', 1420791945, 1420876261, 1, '7', 0);
INSERT INTO `ocenter_config` VALUES (125, 'MAIL_USER_REG', 5, '注册邮件模板', 3, '', '支持HTML代码', 1388337307, 1389532335, 1, '<a href=\"http://www.opensns.cn\" target=\"_blank\">点击进入</a><span style=\"color:#E53333;\">当您收到这封邮件，表明您已注册成功，以上为您的用户名和密码。。。。祝您生活愉快····</span>', 55);
INSERT INTO `ocenter_config` VALUES (126, 'USER_NAME_BAOLIU', 1, '保留用户名和昵称', 3, '', '禁止注册用户名和昵称，包含这些即无法注册,用\" , \"号隔开，用户只能是英文，下划线_，数字等', 1388845937, 1388845937, 1, '管理员,测试,admin,垃圾', 0);
INSERT INTO `ocenter_config` VALUES (128, 'VERIFY_OPEN', 8, '验证码配置', 4, 'reg:注册显示\r\nlogin:登陆显示\r\nreset:密码重置', '验证码配置', 1388500332, 1405561711, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (129, 'VERIFY_TYPE', 4, '验证码类型', 4, '1:中文\r\n2:英文\r\n3:数字\r\n4:英文+数字', '验证码类型', 1388500873, 1405561731, 1, '4', 0);
INSERT INTO `ocenter_config` VALUES (130, 'NO_BODY_TLE', 2, '空白说明', 2, '', '空白说明', 1392216444, 1392981305, 1, '呵呵，暂时没有内容哦！！', 0);
INSERT INTO `ocenter_config` VALUES (131, 'USER_RESPASS', 5, '密码找回模板', 3, '', '密码找回文本', 1396191234, 1396191234, 1, '<span style=\"color:#009900;\">请点击以下链接找回密码，如无反应，请将链接地址复制到浏览器中打开(下次登录前有效)</span>', 0);
INSERT INTO `ocenter_config` VALUES (132, 'COUNT_CODE', 2, '统计代码', 1, '', '用于统计网站访问量的第三方代码，推荐CNZZ统计', 1403058890, 1403058890, 1, '', 12);
INSERT INTO `ocenter_config` VALUES (134, 'URL_MODEL', 4, 'URL模式', 4, '2:REWRITE模式(开启伪静态)\r\n3:兼容模式', '选择Rewrite模式则开启伪静态，在开启伪静态之前需要先<a href=\"http://v2.opensns.cn/index.php?s=/news/index/detail/id/128.html\" target=\"_blank\">设置伪静态</a>或者阅读/Rewrite/readme.txt中的说明，默认建议开启兼容模式', 1421027546, 1421027676, 1, '3', 0);
INSERT INTO `ocenter_config` VALUES (135, 'DEFUALT_HOME_URL', 1, '登录前首页Url', 1, '', '支持形如weibo/index/index的ThinkPhp路由写法，支持普通的url写法，不填则显示默认聚合首页', 1417509438, 1427340006, 1, '', 1);
INSERT INTO `ocenter_config` VALUES (136, 'AUTO_UPDATE', 4, '自动更新提示', 1, '0:关闭,1:开启', '关闭后，后台将不显示更新提示', 1433731153, 1433731348, 1, '1', 2);
INSERT INTO `ocenter_config` VALUES (137, 'WEB_SITE_CLOSE_HINT', 2, '关站提示文字', 1, '', '站点关闭后的提示文字。', 1433731248, 1433731287, 1, '网站正在更新维护，请稍候再试。', 4);
INSERT INTO `ocenter_config` VALUES (138, 'SESSION_PREFIX', 1, '网站前台session前缀', 1, '', '当多个网站在同一个根域名下请保证每个网站的前缀不同', 1436923664, 1436923664, 1, 'opensns', 20);
INSERT INTO `ocenter_config` VALUES (139, 'COOKIE_PREFIX', 1, '网站前台cookie前缀', 1, '', '当多个网站在同一个根域名下请保证每个网站的前缀不同', 1436923664, 1436923664, 1, 'opensns_', 21);
INSERT INTO `ocenter_config` VALUES (140, 'MAIL_SMTP_CE', 1, '邮件发送测试', 5, '', '填写测试邮件地址', 1388334529, 1388584028, 1, '', 11);
INSERT INTO `ocenter_config` VALUES (141, 'LOST_LONG', 0, '用户流失标准（天）', 0, '', '', 1469414315, 1469414315, 1, '30', 0);
INSERT INTO `ocenter_config` VALUES (142, 'MAIL_VERIFY_TYPE', 4, 'SMTP验证方式', 5, '1:无\r\n2:ssl\r\n3:tls', 'SMTP验证方式', 1388332882, 1388931416, 1, '1', 0);
INSERT INTO `ocenter_config` VALUES (1000, '_USERCONFIG_REG_SWITCH', 0, '', 0, '', '', 1427094903, 1427094903, 1, 'email', 0);
INSERT INTO `ocenter_config` VALUES (1001, '_CONFIG_WEB_SITE_NAME', 0, '', 0, '', '', 1427339647, 1427339647, 1, 'OpenSNS v5开源社群系统', 0);
INSERT INTO `ocenter_config` VALUES (1002, '_CONFIG_ICP', 0, '', 0, '', '', 1427339647, 1427339647, 1, '浙ICP备12042711号-5', 0);
INSERT INTO `ocenter_config` VALUES (1003, '_CONFIG_LOGO', 0, '', 0, '', '', 1427339647, 1427339647, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1004, '_CONFIG_QRCODE', 0, '', 0, '', '', 1427339647, 1427339647, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1005, '_CONFIG_ABOUT_US', 0, '', 0, '', '', 1427339647, 1427339647, 1, '<p>&nbsp; 嘉兴想天信息科技有限公司专注于为客户提供专业的社群方案。公司秉持简洁、高效、创新，不断为客户创造奇迹。旗下产品有OpenSNS开源社群系统和OpenCenter开源用户和后台管理系统。</p>', 0);
INSERT INTO `ocenter_config` VALUES (1006, '_CONFIG_SUBSCRIB_US', 0, '', 0, '', '', 1427339647, 1427339647, 1, '<p>业务QQ：276905621</p><p>联系地址：浙江省桐乡市环城南路1号电子商务中心</p><p>联系电话：0573-88037510</p>', 0);
INSERT INTO `ocenter_config` VALUES (1007, '_CONFIG_COPY_RIGHT', 0, '', 0, '', '', 1427339647, 1427339647, 1, '<p>Copyright ©2014-2017 <a href=\"http://www.ourstu.com\" target=\"_blank\">嘉兴想天信息科技有限公司</a></p>', 0);
INSERT INTO `ocenter_config` VALUES (1008, '_HOME_LOGO', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1009, '_HOME_ENTER_URL', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1010, '_HOME_BLOCK', 0, '', 0, '', '', 1432791820, 1432791820, 1, '[{\"data-id\":\"disable\",\"title\":\"禁用\",\"items\":[]},{\"data-id\":\"enable\",\"title\":\"启用\",\"items\":[{\"data-id\":\"slider\",\"title\":\"轮播\"},{\"data-id\":\"Weibo\",\"title\":\"微博\"},{\"data-id\":\"People\",\"title\":\"会员展示\"}]}]', 0);
INSERT INTO `ocenter_config` VALUES (1011, '_HOME_PIC1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1012, '_HOME_URL1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1013, '_HOME_TITLE1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1014, '_HOME_PIC2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1015, '_HOME_URL2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1016, '_HOME_TITLE2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1017, '_HOME_PIC3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1018, '_HOME_URL3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1019, '_HOME_TITLE3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1020, '_CONFIG_COMPANY', 0, '', 0, '', '', 1427339647, 1427339647, 1, '<a href=\"http://www.ourstu.com/joinus.html\" target=\"_blank\"><p><i class=\"icon icon-user\"></i>加入我们</p></a><p><i class=\"icon icon-phone-sign\"></i>400-0573-080</p><p><i class=\"icon icon-envelope-alt\"></i>co@ourstu.com</p>', 0);
INSERT INTO `ocenter_config` VALUES (1021, '_CONFIG_QRCODE_BOTTOM', 0, '', 0, '', '', 1484102844, 1484102844, 1, '', 0);
INSERT INTO `ocenter_config` VALUES (1022, '_USERCONFIG_UCENTER_KANBAN', 0, '', 0, '', '', 1501048026, 1501048026, 1, '[{\"data-id\":\"disable\",\"title\":\"\\u7981\\u7528\",\"items\":[{\"data-id\":\"Weibo\",\"title\":\"\\u5fae\\u535a\"}]},{\"data-id\":\"enable\",\"title\":\"\\u542f\\u7528\",\"items\":[{\"data-id\":\"follow\",\"title\":\"TA\\u7684\\u5173\\u6ce8\\/\\u7c89\\u4e1d\"},{\"data-id\":\"info\",\"title\":\"\\u8d44\\u6599\"},{\"data-id\":\"rank_title\",\"title\":\"\\u5934\\u8854\"},{\"data-id\":\"topic_list\",\"title\":\"\\u5173\\u6ce8\\u7684\\u8bdd\\u9898\"}]}]', 0);
INSERT INTO `ocenter_config` VALUES (11163, '_CONFIG_FIRST_USER_RUN', 0, '', 0, '', '', 1655396002, 1655396002, 1, '2022-06-17', 0);
INSERT INTO `ocenter_config` VALUES (11077, '_MARKDOWN_NEWS_ADMIN_ADD', 0, 'NEWS_ADMIN_ADD的MarkDown配置信息', 0, '', '', 1628531142, 1628531142, 1, 'width: \"100%\",\n            height: 600,\n            path : \"./Public/static/editor.md/lib/\", // Autoload modules mode, codemirror, marked... dependents libs path\n            codeFold : true,\n            saveHTMLToTextarea : true,\n            searchReplace : true,\n            htmlDecode : \"style,script,iframe|on*\",\n            emoji : true,\n            taskList : true,\n            tocm            : true,         // Using [TOCM]\n            tex : true,                   // 开启科学公式TeX语言支持，默认关闭\n            flowChart : true,             // 开启流程图支持，默认关闭\n            sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,\n            imageUpload : true,\n            imageFormats : [\"jpg\", \"jpeg\", \"gif\", \"png\", \"bmp\", \"webp\"],\n            imageUploadURL : U(\'Core/File/markDownUpload\')\n		', 0);
INSERT INTO `ocenter_config` VALUES (11078, '_EDITORTOOL_NEWS_ADMIN_ADD', 0, 'NEWS_ADMIN_ADD的编辑器配置信息', 0, '', '', 1628531142, 1628531142, 1, 'toolbars:[[all]]', 0);
INSERT INTO `ocenter_config` VALUES (11103, '_EDITORTOOL_FORUM_ADMIN_ADD', 0, 'FORUM_ADMIN_ADD的编辑器配置信息', 0, '', '', 1630630516, 1630630516, 1, 'toolbars:[[\'source\',\'|\',\'bold\',\'italic\',\'underline\',\'fontsize\',\'forecolor\',\'justifyleft\',\'fontfamily\',\'|\',\'map\',\'emotion\',\'insertimage\',\'insertcode\']]', 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_count_active
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_count_active`;
CREATE TABLE `ocenter_count_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL COMMENT '类型:''day'',''week'',''month''',
  `date` int(11) NOT NULL,
  `num` int(11) NOT NULL COMMENT '活跃人数',
  `total` int(11) NOT NULL COMMENT '总人数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=333 DEFAULT CHARSET=utf8 COMMENT='活跃统计表';

-- ----------------------------
-- Records of ocenter_count_active
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_count_active` VALUES (1, 'day', 1516636800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (2, 'day', 1516723200, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (3, 'day', 1516809600, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (4, 'day', 1516896000, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (5, 'day', 1516982400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (6, 'week', 1516464007, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (7, 'day', 1517414400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (8, 'day', 1517500800, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (9, 'day', 1517587200, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (10, 'week', 1517068807, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (11, 'day', 1517673600, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (12, 'day', 1517846400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (13, 'day', 1517932800, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (14, 'day', 1518105600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (15, 'day', 1518192000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (16, 'week', 1517673607, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (17, 'day', 1518278400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (18, 'day', 1518364800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (19, 'day', 1518624000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (20, 'day', 1518710400, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (21, 'day', 1518796800, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (22, 'week', 1518278407, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (23, 'day', 1518883200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (24, 'day', 1518969600, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (25, 'day', 1519142400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (26, 'day', 1519228800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (27, 'day', 1519315200, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (28, 'day', 1519401600, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (29, 'week', 1518883207, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (30, 'day', 1521475200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (31, 'day', 1539532800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (32, 'day', 1613318400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (33, 'day', 1613404800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (34, 'day', 1613491200, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (35, 'day', 1613577600, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (36, 'day', 1613664000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (37, 'day', 1613750400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (38, 'week', 1613232007, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (39, 'day', 1613836800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (40, 'day', 1613923200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (41, 'day', 1614009600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (42, 'day', 1614096000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (43, 'day', 1614182400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (44, 'day', 1614268800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (45, 'day', 1614355200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (46, 'week', 1613836807, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (47, 'day', 1614441600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (48, 'month', 1612108830, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (49, 'day', 1614528000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (50, 'day', 1614614400, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (51, 'day', 1614700800, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (52, 'day', 1614787200, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (53, 'day', 1614873600, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (54, 'day', 1614960000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (55, 'week', 1614441607, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (56, 'day', 1615046400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (57, 'day', 1615132800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (58, 'day', 1615219200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (59, 'day', 1615305600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (60, 'day', 1615392000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (61, 'day', 1615478400, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (62, 'day', 1615564800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (63, 'week', 1615046407, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (64, 'day', 1615651200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (65, 'day', 1615737600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (66, 'day', 1615824000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (67, 'day', 1615910400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (68, 'day', 1615996800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (69, 'day', 1616083200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (70, 'day', 1616169600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (71, 'week', 1615651207, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (72, 'day', 1616256000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (73, 'day', 1616342400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (74, 'day', 1616428800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (75, 'day', 1616515200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (76, 'day', 1616601600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (77, 'day', 1616688000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (78, 'day', 1616774400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (79, 'week', 1616256007, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (80, 'day', 1616860800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (81, 'day', 1616947200, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (82, 'day', 1617033600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (83, 'day', 1617120000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (84, 'month', 1614528030, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (85, 'day', 1617206400, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (86, 'day', 1617292800, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (87, 'day', 1617379200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (88, 'week', 1616860807, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (89, 'day', 1617465600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (90, 'day', 1617552000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (91, 'day', 1617638400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (92, 'day', 1617724800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (93, 'day', 1617811200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (94, 'day', 1617897600, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (95, 'day', 1617984000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (96, 'week', 1617465607, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (97, 'day', 1618070400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (98, 'day', 1618156800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (99, 'day', 1618243200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (100, 'day', 1618329600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (101, 'day', 1618416000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (102, 'day', 1618502400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (103, 'day', 1618588800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (104, 'week', 1618070407, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (105, 'day', 1618675200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (106, 'day', 1618761600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (107, 'day', 1618848000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (108, 'day', 1618934400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (109, 'day', 1619020800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (110, 'day', 1619107200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (111, 'day', 1619193600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (112, 'week', 1618675207, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (113, 'day', 1619280000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (114, 'day', 1619366400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (115, 'day', 1619452800, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (116, 'day', 1619539200, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (117, 'day', 1619625600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (118, 'day', 1619712000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (119, 'month', 1617206430, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (120, 'day', 1619798400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (121, 'week', 1619280007, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (122, 'day', 1619884800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (123, 'day', 1619971200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (124, 'day', 1620057600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (125, 'day', 1620144000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (126, 'day', 1620230400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (127, 'day', 1620316800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (128, 'day', 1620403200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (129, 'week', 1619884807, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (130, 'day', 1620489600, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (131, 'day', 1620576000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (132, 'day', 1620662400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (133, 'day', 1620748800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (134, 'day', 1620835200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (135, 'day', 1620921600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (136, 'day', 1621008000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (137, 'week', 1620489607, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (138, 'day', 1621094400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (139, 'day', 1621180800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (140, 'day', 1621267200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (141, 'day', 1621353600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (142, 'day', 1621440000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (143, 'day', 1621526400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (144, 'day', 1621612800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (145, 'week', 1621094407, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (146, 'day', 1621699200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (147, 'day', 1621785600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (148, 'day', 1621872000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (149, 'day', 1621958400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (150, 'day', 1622044800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (151, 'day', 1622131200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (152, 'day', 1622217600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (153, 'week', 1621699207, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (154, 'day', 1622304000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (155, 'day', 1622390400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (156, 'month', 1619798430, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (157, 'day', 1622476800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (158, 'day', 1622563200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (159, 'day', 1622649600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (160, 'day', 1622736000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (161, 'day', 1622822400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (162, 'week', 1622304007, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (163, 'day', 1622908800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (164, 'day', 1622995200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (165, 'day', 1623081600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (166, 'day', 1623168000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (167, 'day', 1623254400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (168, 'day', 1623340800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (169, 'day', 1623427200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (170, 'week', 1622908807, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (171, 'day', 1623513600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (172, 'day', 1623600000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (173, 'day', 1623686400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (174, 'day', 1623772800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (175, 'day', 1623859200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (176, 'day', 1623945600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (177, 'day', 1624032000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (178, 'week', 1623513607, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (179, 'day', 1624118400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (180, 'day', 1624204800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (181, 'day', 1624291200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (182, 'day', 1624377600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (183, 'day', 1624464000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (184, 'day', 1624550400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (185, 'day', 1624636800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (186, 'week', 1624118407, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (187, 'day', 1624723200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (188, 'day', 1624809600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (189, 'day', 1624896000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (190, 'day', 1624982400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (191, 'month', 1622476830, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (192, 'day', 1625068800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (193, 'day', 1625155200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (194, 'day', 1625241600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (195, 'week', 1624723207, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (196, 'day', 1625328000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (197, 'day', 1625414400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (198, 'day', 1625500800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (199, 'day', 1625587200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (200, 'day', 1625673600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (201, 'day', 1625760000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (202, 'day', 1625846400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (203, 'week', 1625328007, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (204, 'day', 1625932800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (205, 'day', 1626019200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (206, 'day', 1626105600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (207, 'day', 1626192000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (208, 'day', 1626278400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (209, 'day', 1626364800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (210, 'day', 1626451200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (211, 'week', 1625932807, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (212, 'day', 1626537600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (213, 'day', 1626624000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (214, 'day', 1626710400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (215, 'day', 1626883200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (216, 'day', 1626969600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (217, 'day', 1627056000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (218, 'week', 1626537607, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (219, 'day', 1627315200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (220, 'day', 1627401600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (221, 'day', 1627488000, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (222, 'day', 1627574400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (223, 'day', 1627660800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (224, 'week', 1627142407, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (225, 'month', 1625068830, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (226, 'day', 1627747200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (227, 'day', 1627833600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (228, 'day', 1627920000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (229, 'day', 1628006400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (230, 'day', 1628092800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (231, 'day', 1628179200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (232, 'day', 1628265600, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (233, 'week', 1627747207, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (234, 'day', 1628352000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (235, 'day', 1628438400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (236, 'day', 1628524800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (237, 'day', 1628611200, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (238, 'day', 1628697600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (239, 'day', 1628784000, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (240, 'day', 1628870400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (241, 'week', 1628352007, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (242, 'day', 1628956800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (243, 'day', 1629043200, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (244, 'day', 1629129600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (245, 'day', 1629216000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (246, 'day', 1629302400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (247, 'day', 1629388800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (248, 'day', 1629475200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (249, 'week', 1628956807, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (250, 'day', 1629561600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (251, 'day', 1629648000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (252, 'day', 1629734400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (253, 'day', 1629820800, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (254, 'day', 1629907200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (255, 'day', 1629993600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (256, 'day', 1630080000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (257, 'week', 1629561607, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (258, 'day', 1630166400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (259, 'day', 1630252800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (260, 'day', 1630339200, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (261, 'month', 1627747230, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (262, 'day', 1630425600, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (263, 'day', 1630512000, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (264, 'day', 1630598400, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (265, 'day', 1630684800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (266, 'week', 1630166407, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (267, 'day', 1630771200, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (268, 'day', 1630857600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (269, 'day', 1630944000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (270, 'day', 1631030400, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (271, 'day', 1631116800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (272, 'day', 1631203200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (273, 'day', 1631289600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (274, 'week', 1630771207, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (275, 'day', 1631376000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (276, 'day', 1631462400, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (277, 'day', 1631548800, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (278, 'day', 1631635200, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (279, 'day', 1631721600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (280, 'day', 1631808000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (281, 'day', 1631894400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (282, 'week', 1631376007, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (283, 'day', 1631980800, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (284, 'day', 1632067200, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (285, 'day', 1632153600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (286, 'day', 1632240000, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (287, 'day', 1632326400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (288, 'day', 1632412800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (289, 'day', 1632499200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (290, 'week', 1631980807, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (291, 'day', 1632585600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (292, 'day', 1632672000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (293, 'day', 1632758400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (294, 'day', 1632844800, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (295, 'day', 1649865600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (296, 'day', 1650124800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (297, 'day', 1650211200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (298, 'day', 1650297600, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (299, 'day', 1650470400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (300, 'day', 1650556800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (301, 'day', 1652457600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (302, 'week', 1651939207, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (303, 'day', 1652630400, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (304, 'day', 1652716800, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (305, 'day', 1652803200, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (306, 'day', 1652889600, 3, 0);
INSERT INTO `ocenter_count_active` VALUES (307, 'day', 1652976000, 3, 0);
INSERT INTO `ocenter_count_active` VALUES (308, 'day', 1653062400, 4, 0);
INSERT INTO `ocenter_count_active` VALUES (309, 'week', 1652544007, 6, 0);
INSERT INTO `ocenter_count_active` VALUES (310, 'day', 1653148800, 1, 0);
INSERT INTO `ocenter_count_active` VALUES (311, 'day', 1653321600, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (312, 'day', 1653840000, 0, 0);
INSERT INTO `ocenter_count_active` VALUES (313, 'day', 1653926400, 4, 0);
INSERT INTO `ocenter_count_active` VALUES (314, 'month', 1651334430, 8, 0);
INSERT INTO `ocenter_count_active` VALUES (315, 'day', 1654012800, 20, 0);
INSERT INTO `ocenter_count_active` VALUES (316, 'day', 1654099200, 19, 0);
INSERT INTO `ocenter_count_active` VALUES (317, 'day', 1654185600, 8, 0);
INSERT INTO `ocenter_count_active` VALUES (318, 'day', 1654272000, 6, 0);
INSERT INTO `ocenter_count_active` VALUES (319, 'week', 1653753607, 10, 0);
INSERT INTO `ocenter_count_active` VALUES (320, 'day', 1654358400, 4, 0);
INSERT INTO `ocenter_count_active` VALUES (321, 'day', 1654444800, 7, 0);
INSERT INTO `ocenter_count_active` VALUES (322, 'day', 1654531200, 5, 0);
INSERT INTO `ocenter_count_active` VALUES (323, 'day', 1654617600, 12, 0);
INSERT INTO `ocenter_count_active` VALUES (324, 'day', 1654704000, 10, 0);
INSERT INTO `ocenter_count_active` VALUES (325, 'day', 1654790400, 3, 0);
INSERT INTO `ocenter_count_active` VALUES (326, 'day', 1654876800, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (327, 'week', 1654358407, 5, 0);
INSERT INTO `ocenter_count_active` VALUES (328, 'day', 1654963200, 2, 0);
INSERT INTO `ocenter_count_active` VALUES (329, 'day', 1655049600, 5, 0);
INSERT INTO `ocenter_count_active` VALUES (330, 'day', 1655136000, 3, 0);
INSERT INTO `ocenter_count_active` VALUES (331, 'day', 1655222400, 3, 0);
INSERT INTO `ocenter_count_active` VALUES (332, 'day', 1655308800, 4, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_count_lost
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_count_lost`;
CREATE TABLE `ocenter_count_lost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_num` int(11) NOT NULL COMMENT '用户总数',
  `new_lost` int(11) NOT NULL COMMENT '新增流失用户数',
  `date` int(11) NOT NULL COMMENT '日期，时间戳形式',
  `lost_num` int(11) NOT NULL COMMENT '流失用户数',
  `rate` decimal(6,4) NOT NULL COMMENT '比率0~1之间，小数点四位的小数',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=284 DEFAULT CHARSET=utf8 COMMENT='用户流失率统计';

-- ----------------------------
-- Records of ocenter_count_lost
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_count_lost` VALUES (1, 1, 0, 1516636800, 0, 0.0000, 1516788146);
INSERT INTO `ocenter_count_lost` VALUES (2, 2, 0, 1516723200, 0, 0.0000, 1516844471);
INSERT INTO `ocenter_count_lost` VALUES (3, 2, 0, 1516809600, 0, 0.0000, 1516930326);
INSERT INTO `ocenter_count_lost` VALUES (4, 2, 0, 1516896000, 0, 0.0000, 1517017197);
INSERT INTO `ocenter_count_lost` VALUES (5, 2, 0, 1516982400, 0, 0.0000, 1517069220);
INSERT INTO `ocenter_count_lost` VALUES (6, 2, 0, 1517414400, 0, 0.0000, 1517546448);
INSERT INTO `ocenter_count_lost` VALUES (7, 2, 0, 1517500800, 0, 0.0000, 1517587206);
INSERT INTO `ocenter_count_lost` VALUES (8, 2, 0, 1517587200, 0, 0.0000, 1517713506);
INSERT INTO `ocenter_count_lost` VALUES (9, 2, 0, 1517673600, 0, 0.0000, 1517825695);
INSERT INTO `ocenter_count_lost` VALUES (10, 2, 0, 1517846400, 0, 0.0000, 1517963208);
INSERT INTO `ocenter_count_lost` VALUES (11, 2, 0, 1517932800, 0, 0.0000, 1518051997);
INSERT INTO `ocenter_count_lost` VALUES (12, 2, 0, 1518105600, 0, 0.0000, 1518266764);
INSERT INTO `ocenter_count_lost` VALUES (13, 2, 0, 1518192000, 0, 0.0000, 1518305672);
INSERT INTO `ocenter_count_lost` VALUES (14, 2, 0, 1518278400, 0, 0.0000, 1518423459);
INSERT INTO `ocenter_count_lost` VALUES (15, 2, 0, 1518364800, 0, 0.0000, 1518495851);
INSERT INTO `ocenter_count_lost` VALUES (16, 2, 0, 1518624000, 0, 0.0000, 1518789469);
INSERT INTO `ocenter_count_lost` VALUES (17, 2, 0, 1518710400, 0, 0.0000, 1518796806);
INSERT INTO `ocenter_count_lost` VALUES (18, 2, 0, 1518796800, 0, 0.0000, 1518905958);
INSERT INTO `ocenter_count_lost` VALUES (19, 2, 0, 1518883200, 0, 0.0000, 1518969606);
INSERT INTO `ocenter_count_lost` VALUES (20, 2, 0, 1518969600, 0, 0.0000, 1519056009);
INSERT INTO `ocenter_count_lost` VALUES (21, 2, 0, 1519142400, 0, 0.0000, 1519284271);
INSERT INTO `ocenter_count_lost` VALUES (22, 2, 0, 1519228800, 0, 0.0000, 1519347810);
INSERT INTO `ocenter_count_lost` VALUES (23, 2, 0, 1519315200, 0, 0.0000, 1519439642);
INSERT INTO `ocenter_count_lost` VALUES (24, 2, 0, 1519401600, 0, 0.0000, 1519488000);
INSERT INTO `ocenter_count_lost` VALUES (25, 2, 0, 1521475200, 0, 0.0000, 1521620814);
INSERT INTO `ocenter_count_lost` VALUES (26, 2, 0, 1539532800, 2, 1.0000, 1539674975);
INSERT INTO `ocenter_count_lost` VALUES (27, 2, 0, 1613318400, 2, 1.0000, 1613411506);
INSERT INTO `ocenter_count_lost` VALUES (28, 2, 0, 1613404800, 2, 1.0000, 1613554652);
INSERT INTO `ocenter_count_lost` VALUES (29, 2, -1, 1613491200, 1, 0.5000, 1613577603);
INSERT INTO `ocenter_count_lost` VALUES (30, 2, 0, 1613577600, 1, 0.5000, 1613664002);
INSERT INTO `ocenter_count_lost` VALUES (31, 2, 0, 1613664000, 1, 0.5000, 1613750403);
INSERT INTO `ocenter_count_lost` VALUES (32, 2, 0, 1613750400, 1, 0.5000, 1613836803);
INSERT INTO `ocenter_count_lost` VALUES (33, 2, 0, 1613836800, 1, 0.5000, 1613923204);
INSERT INTO `ocenter_count_lost` VALUES (34, 2, 0, 1613923200, 1, 0.5000, 1614009603);
INSERT INTO `ocenter_count_lost` VALUES (35, 2, 0, 1614009600, 1, 0.5000, 1614096003);
INSERT INTO `ocenter_count_lost` VALUES (36, 2, 0, 1614096000, 1, 0.5000, 1614182403);
INSERT INTO `ocenter_count_lost` VALUES (37, 2, 0, 1614182400, 1, 0.5000, 1614268802);
INSERT INTO `ocenter_count_lost` VALUES (38, 2, 0, 1614268800, 1, 0.5000, 1614355204);
INSERT INTO `ocenter_count_lost` VALUES (39, 2, 0, 1614355200, 1, 0.5000, 1614441604);
INSERT INTO `ocenter_count_lost` VALUES (40, 2, 0, 1614441600, 1, 0.5000, 1614528005);
INSERT INTO `ocenter_count_lost` VALUES (41, 2, 0, 1614528000, 1, 0.5000, 1614614413);
INSERT INTO `ocenter_count_lost` VALUES (42, 2, 0, 1614614400, 1, 0.5000, 1614700803);
INSERT INTO `ocenter_count_lost` VALUES (43, 2, 0, 1614700800, 1, 0.5000, 1614787203);
INSERT INTO `ocenter_count_lost` VALUES (44, 2, 0, 1614787200, 1, 0.5000, 1614873604);
INSERT INTO `ocenter_count_lost` VALUES (45, 2, 0, 1614873600, 1, 0.5000, 1614960003);
INSERT INTO `ocenter_count_lost` VALUES (46, 2, 0, 1614960000, 1, 0.5000, 1615046404);
INSERT INTO `ocenter_count_lost` VALUES (47, 2, 0, 1615046400, 1, 0.5000, 1615132804);
INSERT INTO `ocenter_count_lost` VALUES (48, 2, 0, 1615132800, 1, 0.5000, 1615219204);
INSERT INTO `ocenter_count_lost` VALUES (49, 2, 0, 1615219200, 1, 0.5000, 1615305603);
INSERT INTO `ocenter_count_lost` VALUES (50, 2, 0, 1615305600, 1, 0.5000, 1615392064);
INSERT INTO `ocenter_count_lost` VALUES (51, 2, 0, 1615392000, 1, 0.5000, 1615478403);
INSERT INTO `ocenter_count_lost` VALUES (52, 2, 0, 1615478400, 1, 0.5000, 1615564804);
INSERT INTO `ocenter_count_lost` VALUES (53, 2, 0, 1615564800, 1, 0.5000, 1615651203);
INSERT INTO `ocenter_count_lost` VALUES (54, 2, 0, 1615651200, 1, 0.5000, 1615737603);
INSERT INTO `ocenter_count_lost` VALUES (55, 2, 0, 1615737600, 1, 0.5000, 1615824004);
INSERT INTO `ocenter_count_lost` VALUES (56, 2, 0, 1615824000, 1, 0.5000, 1615910403);
INSERT INTO `ocenter_count_lost` VALUES (57, 2, 0, 1615910400, 1, 0.5000, 1615996803);
INSERT INTO `ocenter_count_lost` VALUES (58, 2, 0, 1615996800, 1, 0.5000, 1616083203);
INSERT INTO `ocenter_count_lost` VALUES (59, 2, 0, 1616083200, 1, 0.5000, 1616169603);
INSERT INTO `ocenter_count_lost` VALUES (60, 2, 0, 1616169600, 1, 0.5000, 1616256004);
INSERT INTO `ocenter_count_lost` VALUES (61, 2, 0, 1616256000, 1, 0.5000, 1616342403);
INSERT INTO `ocenter_count_lost` VALUES (62, 2, 0, 1616342400, 1, 0.5000, 1616428804);
INSERT INTO `ocenter_count_lost` VALUES (63, 2, 0, 1616428800, 1, 0.5000, 1616515203);
INSERT INTO `ocenter_count_lost` VALUES (64, 2, 0, 1616515200, 1, 0.5000, 1616601603);
INSERT INTO `ocenter_count_lost` VALUES (65, 2, 0, 1616601600, 1, 0.5000, 1616688003);
INSERT INTO `ocenter_count_lost` VALUES (66, 2, 0, 1616688000, 1, 0.5000, 1616774403);
INSERT INTO `ocenter_count_lost` VALUES (67, 2, 0, 1616774400, 1, 0.5000, 1616860803);
INSERT INTO `ocenter_count_lost` VALUES (68, 2, 0, 1616860800, 1, 0.5000, 1616947203);
INSERT INTO `ocenter_count_lost` VALUES (69, 2, 0, 1616947200, 1, 0.5000, 1617033603);
INSERT INTO `ocenter_count_lost` VALUES (70, 2, 0, 1617033600, 1, 0.5000, 1617120003);
INSERT INTO `ocenter_count_lost` VALUES (71, 2, 0, 1617120000, 1, 0.5000, 1617206403);
INSERT INTO `ocenter_count_lost` VALUES (72, 2, 0, 1617206400, 1, 0.5000, 1617292803);
INSERT INTO `ocenter_count_lost` VALUES (73, 2, 0, 1617292800, 1, 0.5000, 1617379201);
INSERT INTO `ocenter_count_lost` VALUES (74, 2, 0, 1617379200, 1, 0.5000, 1617465602);
INSERT INTO `ocenter_count_lost` VALUES (75, 2, 0, 1617465600, 1, 0.5000, 1617552001);
INSERT INTO `ocenter_count_lost` VALUES (76, 2, 0, 1617552000, 1, 0.5000, 1617638401);
INSERT INTO `ocenter_count_lost` VALUES (77, 2, 0, 1617638400, 1, 0.5000, 1617724801);
INSERT INTO `ocenter_count_lost` VALUES (78, 2, 0, 1617724800, 1, 0.5000, 1617811201);
INSERT INTO `ocenter_count_lost` VALUES (79, 2, 0, 1617811200, 1, 0.5000, 1617897601);
INSERT INTO `ocenter_count_lost` VALUES (80, 2, 0, 1617897600, 1, 0.5000, 1617984002);
INSERT INTO `ocenter_count_lost` VALUES (81, 2, 0, 1617984000, 1, 0.5000, 1618070401);
INSERT INTO `ocenter_count_lost` VALUES (82, 2, 0, 1618070400, 1, 0.5000, 1618156801);
INSERT INTO `ocenter_count_lost` VALUES (83, 2, 0, 1618156800, 1, 0.5000, 1618243201);
INSERT INTO `ocenter_count_lost` VALUES (84, 2, 0, 1618243200, 1, 0.5000, 1618329601);
INSERT INTO `ocenter_count_lost` VALUES (85, 2, 0, 1618329600, 1, 0.5000, 1618416001);
INSERT INTO `ocenter_count_lost` VALUES (86, 2, 0, 1618416000, 1, 0.5000, 1618502401);
INSERT INTO `ocenter_count_lost` VALUES (87, 2, 0, 1618502400, 1, 0.5000, 1618588801);
INSERT INTO `ocenter_count_lost` VALUES (88, 2, 0, 1618588800, 1, 0.5000, 1618675201);
INSERT INTO `ocenter_count_lost` VALUES (89, 2, 0, 1618675200, 1, 0.5000, 1618761602);
INSERT INTO `ocenter_count_lost` VALUES (90, 2, 0, 1618761600, 1, 0.5000, 1618848002);
INSERT INTO `ocenter_count_lost` VALUES (91, 2, 0, 1618848000, 1, 0.5000, 1618934401);
INSERT INTO `ocenter_count_lost` VALUES (92, 2, 0, 1618934400, 1, 0.5000, 1619020801);
INSERT INTO `ocenter_count_lost` VALUES (93, 2, 0, 1619020800, 1, 0.5000, 1619107201);
INSERT INTO `ocenter_count_lost` VALUES (94, 2, 0, 1619107200, 1, 0.5000, 1619193602);
INSERT INTO `ocenter_count_lost` VALUES (95, 2, 0, 1619193600, 1, 0.5000, 1619280002);
INSERT INTO `ocenter_count_lost` VALUES (96, 2, 0, 1619280000, 1, 0.5000, 1619366401);
INSERT INTO `ocenter_count_lost` VALUES (97, 2, 0, 1619366400, 1, 0.5000, 1619452801);
INSERT INTO `ocenter_count_lost` VALUES (98, 7, 4, 1619452800, 5, 0.7143, 1619539201);
INSERT INTO `ocenter_count_lost` VALUES (99, 7, 0, 1619539200, 5, 0.7143, 1619625601);
INSERT INTO `ocenter_count_lost` VALUES (100, 7, 0, 1619625600, 5, 0.7143, 1619712001);
INSERT INTO `ocenter_count_lost` VALUES (101, 7, 0, 1619712000, 5, 0.7143, 1619798402);
INSERT INTO `ocenter_count_lost` VALUES (102, 7, 0, 1619798400, 5, 0.7143, 1619884801);
INSERT INTO `ocenter_count_lost` VALUES (103, 7, 0, 1619884800, 5, 0.7143, 1619971201);
INSERT INTO `ocenter_count_lost` VALUES (104, 7, 0, 1619971200, 5, 0.7143, 1620057601);
INSERT INTO `ocenter_count_lost` VALUES (105, 7, 0, 1620057600, 5, 0.7143, 1620144002);
INSERT INTO `ocenter_count_lost` VALUES (106, 7, 0, 1620144000, 5, 0.7143, 1620230402);
INSERT INTO `ocenter_count_lost` VALUES (107, 7, 0, 1620230400, 5, 0.7143, 1620316801);
INSERT INTO `ocenter_count_lost` VALUES (108, 7, 0, 1620316800, 5, 0.7143, 1620403201);
INSERT INTO `ocenter_count_lost` VALUES (109, 7, 0, 1620403200, 5, 0.7143, 1620547322);
INSERT INTO `ocenter_count_lost` VALUES (110, 7, 0, 1620489600, 5, 0.7143, 1620576002);
INSERT INTO `ocenter_count_lost` VALUES (111, 7, 0, 1620576000, 5, 0.7143, 1620662401);
INSERT INTO `ocenter_count_lost` VALUES (112, 7, 0, 1620662400, 5, 0.7143, 1620748801);
INSERT INTO `ocenter_count_lost` VALUES (113, 7, 0, 1620748800, 5, 0.7143, 1620835201);
INSERT INTO `ocenter_count_lost` VALUES (114, 7, 0, 1620835200, 5, 0.7143, 1620921601);
INSERT INTO `ocenter_count_lost` VALUES (115, 7, 0, 1620921600, 5, 0.7143, 1621008001);
INSERT INTO `ocenter_count_lost` VALUES (116, 7, 0, 1621008000, 5, 0.7143, 1621094402);
INSERT INTO `ocenter_count_lost` VALUES (117, 7, 0, 1621094400, 5, 0.7143, 1621180801);
INSERT INTO `ocenter_count_lost` VALUES (118, 7, 0, 1621180800, 5, 0.7143, 1621267201);
INSERT INTO `ocenter_count_lost` VALUES (119, 7, 0, 1621267200, 5, 0.7143, 1621353602);
INSERT INTO `ocenter_count_lost` VALUES (120, 7, 0, 1621353600, 5, 0.7143, 1621440001);
INSERT INTO `ocenter_count_lost` VALUES (121, 7, 0, 1621440000, 5, 0.7143, 1621526402);
INSERT INTO `ocenter_count_lost` VALUES (122, 7, 0, 1621526400, 5, 0.7143, 1621612801);
INSERT INTO `ocenter_count_lost` VALUES (123, 7, 0, 1621612800, 5, 0.7143, 1621699201);
INSERT INTO `ocenter_count_lost` VALUES (124, 7, 0, 1621699200, 5, 0.7143, 1621785601);
INSERT INTO `ocenter_count_lost` VALUES (125, 7, 0, 1621785600, 5, 0.7143, 1621872002);
INSERT INTO `ocenter_count_lost` VALUES (126, 7, 0, 1621872000, 5, 0.7143, 1621958401);
INSERT INTO `ocenter_count_lost` VALUES (127, 7, 0, 1621958400, 5, 0.7143, 1622044801);
INSERT INTO `ocenter_count_lost` VALUES (128, 7, 0, 1622044800, 5, 0.7143, 1622131202);
INSERT INTO `ocenter_count_lost` VALUES (129, 7, 1, 1622131200, 6, 0.8571, 1622217601);
INSERT INTO `ocenter_count_lost` VALUES (130, 7, 0, 1622217600, 6, 0.8571, 1622304002);
INSERT INTO `ocenter_count_lost` VALUES (131, 7, 0, 1622304000, 6, 0.8571, 1622390402);
INSERT INTO `ocenter_count_lost` VALUES (132, 7, 0, 1622390400, 6, 0.8571, 1622476802);
INSERT INTO `ocenter_count_lost` VALUES (133, 7, 0, 1622476800, 6, 0.8571, 1622563201);
INSERT INTO `ocenter_count_lost` VALUES (134, 7, 0, 1622563200, 6, 0.8571, 1622649601);
INSERT INTO `ocenter_count_lost` VALUES (135, 7, 0, 1622649600, 6, 0.8571, 1622736002);
INSERT INTO `ocenter_count_lost` VALUES (136, 7, 0, 1622736000, 6, 0.8571, 1622822401);
INSERT INTO `ocenter_count_lost` VALUES (137, 7, 0, 1622822400, 6, 0.8571, 1622908801);
INSERT INTO `ocenter_count_lost` VALUES (138, 8, 1, 1622908800, 7, 0.8750, 1622995201);
INSERT INTO `ocenter_count_lost` VALUES (139, 8, 0, 1622995200, 7, 0.8750, 1623081601);
INSERT INTO `ocenter_count_lost` VALUES (140, 9, 2, 1623081600, 9, 1.0000, 1623168002);
INSERT INTO `ocenter_count_lost` VALUES (141, 10, 1, 1623168000, 10, 1.0000, 1623254402);
INSERT INTO `ocenter_count_lost` VALUES (142, 11, 1, 1623254400, 11, 1.0000, 1623340801);
INSERT INTO `ocenter_count_lost` VALUES (143, 11, 0, 1623340800, 11, 1.0000, 1623427201);
INSERT INTO `ocenter_count_lost` VALUES (144, 11, 0, 1623427200, 11, 1.0000, 1623513602);
INSERT INTO `ocenter_count_lost` VALUES (145, 11, 0, 1623513600, 11, 1.0000, 1623600001);
INSERT INTO `ocenter_count_lost` VALUES (146, 11, 0, 1623600000, 11, 1.0000, 1623686401);
INSERT INTO `ocenter_count_lost` VALUES (147, 11, 0, 1623686400, 11, 1.0000, 1623772801);
INSERT INTO `ocenter_count_lost` VALUES (148, 11, 0, 1623772800, 11, 1.0000, 1623859201);
INSERT INTO `ocenter_count_lost` VALUES (149, 12, 1, 1623859200, 12, 1.0000, 1623945602);
INSERT INTO `ocenter_count_lost` VALUES (150, 12, 0, 1623945600, 12, 1.0000, 1624032002);
INSERT INTO `ocenter_count_lost` VALUES (151, 12, 0, 1624032000, 12, 1.0000, 1624118402);
INSERT INTO `ocenter_count_lost` VALUES (152, 12, 0, 1624118400, 12, 1.0000, 1624204802);
INSERT INTO `ocenter_count_lost` VALUES (153, 12, 0, 1624204800, 12, 1.0000, 1624291202);
INSERT INTO `ocenter_count_lost` VALUES (154, 12, 0, 1624291200, 12, 1.0000, 1624377603);
INSERT INTO `ocenter_count_lost` VALUES (155, 12, 0, 1624377600, 12, 1.0000, 1624464002);
INSERT INTO `ocenter_count_lost` VALUES (156, 12, 0, 1624464000, 12, 1.0000, 1624550401);
INSERT INTO `ocenter_count_lost` VALUES (157, 12, 0, 1624550400, 12, 1.0000, 1624636802);
INSERT INTO `ocenter_count_lost` VALUES (158, 12, 0, 1624636800, 12, 1.0000, 1624723202);
INSERT INTO `ocenter_count_lost` VALUES (159, 12, 0, 1624723200, 12, 1.0000, 1624809601);
INSERT INTO `ocenter_count_lost` VALUES (160, 12, 0, 1624809600, 12, 1.0000, 1624896001);
INSERT INTO `ocenter_count_lost` VALUES (161, 12, 0, 1624896000, 12, 1.0000, 1624982401);
INSERT INTO `ocenter_count_lost` VALUES (162, 12, 0, 1624982400, 12, 1.0000, 1625068802);
INSERT INTO `ocenter_count_lost` VALUES (163, 12, 0, 1625068800, 12, 1.0000, 1625155201);
INSERT INTO `ocenter_count_lost` VALUES (164, 12, 0, 1625155200, 12, 1.0000, 1625241602);
INSERT INTO `ocenter_count_lost` VALUES (165, 12, 0, 1625241600, 12, 1.0000, 1625328002);
INSERT INTO `ocenter_count_lost` VALUES (166, 12, 0, 1625328000, 12, 1.0000, 1625414401);
INSERT INTO `ocenter_count_lost` VALUES (167, 12, 0, 1625414400, 12, 1.0000, 1625500802);
INSERT INTO `ocenter_count_lost` VALUES (168, 12, 0, 1625500800, 12, 1.0000, 1625587201);
INSERT INTO `ocenter_count_lost` VALUES (169, 12, 0, 1625587200, 12, 1.0000, 1625673602);
INSERT INTO `ocenter_count_lost` VALUES (170, 12, 0, 1625673600, 12, 1.0000, 1625760001);
INSERT INTO `ocenter_count_lost` VALUES (171, 12, 0, 1625760000, 12, 1.0000, 1625846402);
INSERT INTO `ocenter_count_lost` VALUES (172, 12, 0, 1625846400, 12, 1.0000, 1625932801);
INSERT INTO `ocenter_count_lost` VALUES (173, 12, 0, 1625932800, 12, 1.0000, 1626019202);
INSERT INTO `ocenter_count_lost` VALUES (174, 12, 0, 1626019200, 12, 1.0000, 1626105601);
INSERT INTO `ocenter_count_lost` VALUES (175, 12, 0, 1626105600, 12, 1.0000, 1626192002);
INSERT INTO `ocenter_count_lost` VALUES (176, 12, 0, 1626192000, 12, 1.0000, 1626278401);
INSERT INTO `ocenter_count_lost` VALUES (177, 12, 0, 1626278400, 12, 1.0000, 1626364801);
INSERT INTO `ocenter_count_lost` VALUES (178, 12, 0, 1626364800, 12, 1.0000, 1626451201);
INSERT INTO `ocenter_count_lost` VALUES (179, 12, 0, 1626451200, 12, 1.0000, 1626537602);
INSERT INTO `ocenter_count_lost` VALUES (180, 12, 0, 1626537600, 12, 1.0000, 1626624001);
INSERT INTO `ocenter_count_lost` VALUES (181, 12, 0, 1626624000, 12, 1.0000, 1626710401);
INSERT INTO `ocenter_count_lost` VALUES (182, 12, 0, 1626710400, 12, 1.0000, 1626855567);
INSERT INTO `ocenter_count_lost` VALUES (183, 12, 0, 1626883200, 12, 1.0000, 1627052266);
INSERT INTO `ocenter_count_lost` VALUES (184, 12, 0, 1626969600, 12, 1.0000, 1627094779);
INSERT INTO `ocenter_count_lost` VALUES (185, 12, 0, 1627056000, 12, 1.0000, 1627179935);
INSERT INTO `ocenter_count_lost` VALUES (186, 12, 0, 1627315200, 12, 1.0000, 1627418462);
INSERT INTO `ocenter_count_lost` VALUES (187, 12, 0, 1627401600, 12, 1.0000, 1627499371);
INSERT INTO `ocenter_count_lost` VALUES (188, 12, -1, 1627488000, 11, 0.9167, 1627580379);
INSERT INTO `ocenter_count_lost` VALUES (189, 12, 0, 1627574400, 11, 0.9167, 1627708921);
INSERT INTO `ocenter_count_lost` VALUES (190, 12, 0, 1627660800, 11, 0.9167, 1627750010);
INSERT INTO `ocenter_count_lost` VALUES (191, 12, 0, 1627747200, 11, 0.9167, 1627863833);
INSERT INTO `ocenter_count_lost` VALUES (192, 12, 0, 1627833600, 11, 0.9167, 1627950605);
INSERT INTO `ocenter_count_lost` VALUES (193, 12, 0, 1627920000, 11, 0.9167, 1628045948);
INSERT INTO `ocenter_count_lost` VALUES (194, 12, 0, 1628006400, 11, 0.9167, 1628133657);
INSERT INTO `ocenter_count_lost` VALUES (195, 12, 0, 1628092800, 11, 0.9167, 1628213365);
INSERT INTO `ocenter_count_lost` VALUES (196, 12, 0, 1628179200, 11, 0.9167, 1628300715);
INSERT INTO `ocenter_count_lost` VALUES (197, 12, 0, 1628265600, 11, 0.9167, 1628393246);
INSERT INTO `ocenter_count_lost` VALUES (198, 12, 0, 1628352000, 11, 0.9167, 1628475162);
INSERT INTO `ocenter_count_lost` VALUES (199, 13, 1, 1628438400, 12, 0.9231, 1628528432);
INSERT INTO `ocenter_count_lost` VALUES (200, 13, 0, 1628524800, 12, 0.9231, 1628648363);
INSERT INTO `ocenter_count_lost` VALUES (201, 13, 0, 1628611200, 12, 0.9231, 1628697600);
INSERT INTO `ocenter_count_lost` VALUES (202, 13, 0, 1628697600, 12, 0.9231, 1628788609);
INSERT INTO `ocenter_count_lost` VALUES (203, 13, 0, 1628784000, 12, 0.9231, 1628891092);
INSERT INTO `ocenter_count_lost` VALUES (204, 13, 0, 1628870400, 12, 0.9231, 1628956802);
INSERT INTO `ocenter_count_lost` VALUES (205, 13, 0, 1628956800, 12, 0.9231, 1629043201);
INSERT INTO `ocenter_count_lost` VALUES (206, 13, 0, 1629043200, 12, 0.9231, 1629129601);
INSERT INTO `ocenter_count_lost` VALUES (207, 13, 0, 1629129600, 12, 0.9231, 1629216002);
INSERT INTO `ocenter_count_lost` VALUES (208, 13, 0, 1629216000, 12, 0.9231, 1629302401);
INSERT INTO `ocenter_count_lost` VALUES (209, 13, 0, 1629302400, 12, 0.9231, 1629388802);
INSERT INTO `ocenter_count_lost` VALUES (210, 13, 0, 1629388800, 12, 0.9231, 1629475201);
INSERT INTO `ocenter_count_lost` VALUES (211, 13, 0, 1629475200, 12, 0.9231, 1629561601);
INSERT INTO `ocenter_count_lost` VALUES (212, 13, 0, 1629561600, 12, 0.9231, 1629648001);
INSERT INTO `ocenter_count_lost` VALUES (213, 13, 0, 1629648000, 12, 0.9231, 1629734402);
INSERT INTO `ocenter_count_lost` VALUES (214, 13, 0, 1629734400, 12, 0.9231, 1629820801);
INSERT INTO `ocenter_count_lost` VALUES (215, 13, 0, 1629820800, 12, 0.9231, 1629907202);
INSERT INTO `ocenter_count_lost` VALUES (216, 13, 0, 1629907200, 12, 0.9231, 1629993601);
INSERT INTO `ocenter_count_lost` VALUES (217, 13, 0, 1629993600, 12, 0.9231, 1630080002);
INSERT INTO `ocenter_count_lost` VALUES (218, 13, 0, 1630080000, 12, 0.9231, 1630166401);
INSERT INTO `ocenter_count_lost` VALUES (219, 13, 0, 1630166400, 12, 0.9231, 1630252801);
INSERT INTO `ocenter_count_lost` VALUES (220, 13, 0, 1630252800, 12, 0.9231, 1630339201);
INSERT INTO `ocenter_count_lost` VALUES (221, 13, 0, 1630339200, 12, 0.9231, 1630425602);
INSERT INTO `ocenter_count_lost` VALUES (222, 13, 0, 1630425600, 12, 0.9231, 1630512001);
INSERT INTO `ocenter_count_lost` VALUES (223, 17, 4, 1630512000, 16, 0.9412, 1630598402);
INSERT INTO `ocenter_count_lost` VALUES (224, 20, 3, 1630598400, 19, 0.9500, 1630684801);
INSERT INTO `ocenter_count_lost` VALUES (225, 23, 3, 1630684800, 22, 0.9565, 1630771202);
INSERT INTO `ocenter_count_lost` VALUES (226, 23, 0, 1630771200, 22, 0.9565, 1630857602);
INSERT INTO `ocenter_count_lost` VALUES (227, 23, 0, 1630857600, 22, 0.9565, 1630944002);
INSERT INTO `ocenter_count_lost` VALUES (228, 23, 0, 1630944000, 22, 0.9565, 1631030402);
INSERT INTO `ocenter_count_lost` VALUES (229, 24, 1, 1631030400, 23, 0.9583, 1631116801);
INSERT INTO `ocenter_count_lost` VALUES (230, 24, 0, 1631116800, 23, 0.9583, 1631203202);
INSERT INTO `ocenter_count_lost` VALUES (231, 25, 1, 1631203200, 24, 0.9600, 1631289602);
INSERT INTO `ocenter_count_lost` VALUES (232, 25, 0, 1631289600, 24, 0.9600, 1631376001);
INSERT INTO `ocenter_count_lost` VALUES (233, 25, 0, 1631376000, 24, 0.9600, 1631462402);
INSERT INTO `ocenter_count_lost` VALUES (234, 25, 0, 1631462400, 24, 0.9600, 1631548802);
INSERT INTO `ocenter_count_lost` VALUES (235, 53, 28, 1631548800, 52, 0.9811, 1631635201);
INSERT INTO `ocenter_count_lost` VALUES (236, 71, 18, 1631635200, 70, 0.9859, 1631721601);
INSERT INTO `ocenter_count_lost` VALUES (237, 121, 50, 1631721600, 120, 0.9917, 1631808001);
INSERT INTO `ocenter_count_lost` VALUES (238, 175, 54, 1631808000, 174, 0.9943, 1631894401);
INSERT INTO `ocenter_count_lost` VALUES (239, 231, 56, 1631894400, 230, 0.9957, 1631980802);
INSERT INTO `ocenter_count_lost` VALUES (240, 275, 44, 1631980800, 274, 0.9964, 1632067201);
INSERT INTO `ocenter_count_lost` VALUES (241, 289, 14, 1632067200, 288, 0.9965, 1632153601);
INSERT INTO `ocenter_count_lost` VALUES (242, 297, 8, 1632153600, 296, 0.9966, 1632240002);
INSERT INTO `ocenter_count_lost` VALUES (243, 311, 14, 1632240000, 310, 0.9968, 1632326401);
INSERT INTO `ocenter_count_lost` VALUES (244, 323, 12, 1632326400, 322, 0.9969, 1632412801);
INSERT INTO `ocenter_count_lost` VALUES (245, 345, 22, 1632412800, 344, 0.9971, 1632499201);
INSERT INTO `ocenter_count_lost` VALUES (246, 352, 7, 1632499200, 351, 0.9972, 1632585602);
INSERT INTO `ocenter_count_lost` VALUES (247, 367, 15, 1632585600, 366, 0.9973, 1632672001);
INSERT INTO `ocenter_count_lost` VALUES (248, 382, 15, 1632672000, 381, 0.9974, 1632758401);
INSERT INTO `ocenter_count_lost` VALUES (249, 395, 13, 1632758400, 394, 0.9975, 1632844801);
INSERT INTO `ocenter_count_lost` VALUES (250, 412, 17, 1632844800, 411, 0.9976, 1632931201);
INSERT INTO `ocenter_count_lost` VALUES (251, 1348, 0, 1649865600, 1348, 1.0000, 1649953801);
INSERT INTO `ocenter_count_lost` VALUES (252, 1348, 0, 1650124800, 1348, 1.0000, 1650255418);
INSERT INTO `ocenter_count_lost` VALUES (253, 1348, 0, 1650211200, 1348, 1.0000, 1650335840);
INSERT INTO `ocenter_count_lost` VALUES (254, 3, -1347, 1650297600, 1, 0.3333, 1650433824);
INSERT INTO `ocenter_count_lost` VALUES (255, 3, 0, 1650470400, 1, 0.3333, 1650580562);
INSERT INTO `ocenter_count_lost` VALUES (256, 3, 0, 1650556800, 1, 0.3333, 1650713266);
INSERT INTO `ocenter_count_lost` VALUES (257, 3, 0, 1652457600, 1, 0.3333, 1652610106);
INSERT INTO `ocenter_count_lost` VALUES (258, 3, 0, 1652630400, 1, 0.3333, 1652775428);
INSERT INTO `ocenter_count_lost` VALUES (259, 3, 0, 1652716800, 1, 0.3333, 1652840997);
INSERT INTO `ocenter_count_lost` VALUES (260, 4, 1, 1652803200, 2, 0.5000, 1652936207);
INSERT INTO `ocenter_count_lost` VALUES (261, 5, 0, 1652889600, 2, 0.4000, 1652980976);
INSERT INTO `ocenter_count_lost` VALUES (262, 6, 0, 1652976000, 2, 0.3333, 1653073600);
INSERT INTO `ocenter_count_lost` VALUES (263, 8, 1, 1653062400, 3, 0.3750, 1653150985);
INSERT INTO `ocenter_count_lost` VALUES (264, 8, 0, 1653148800, 3, 0.3750, 1653244822);
INSERT INTO `ocenter_count_lost` VALUES (265, 8, 0, 1653321600, 3, 0.3750, 1653435095);
INSERT INTO `ocenter_count_lost` VALUES (266, 8, 0, 1653840000, 3, 0.3750, 1653985803);
INSERT INTO `ocenter_count_lost` VALUES (267, 3, -2, 1653926400, 1, 0.3333, 1654013775);
INSERT INTO `ocenter_count_lost` VALUES (268, 211, 190, 1654012800, 191, 0.9052, 1654099779);
INSERT INTO `ocenter_count_lost` VALUES (269, 211, -11, 1654099200, 180, 0.8531, 1654185615);
INSERT INTO `ocenter_count_lost` VALUES (270, 217, 4, 1654185600, 184, 0.8479, 1654272517);
INSERT INTO `ocenter_count_lost` VALUES (271, 222, 4, 1654272000, 188, 0.8468, 1654361310);
INSERT INTO `ocenter_count_lost` VALUES (272, 222, -1, 1654358400, 187, 0.8423, 1654446772);
INSERT INTO `ocenter_count_lost` VALUES (273, 229, 5, 1654444800, 192, 0.8384, 1654547656);
INSERT INTO `ocenter_count_lost` VALUES (274, 229, 0, 1654531200, 192, 0.8384, 1654665164);
INSERT INTO `ocenter_count_lost` VALUES (275, 236, 5, 1654617600, 197, 0.8347, 1654704000);
INSERT INTO `ocenter_count_lost` VALUES (276, 239, 0, 1654704000, 197, 0.8243, 1654798509);
INSERT INTO `ocenter_count_lost` VALUES (277, 239, 0, 1654790400, 197, 0.8243, 1654934003);
INSERT INTO `ocenter_count_lost` VALUES (278, 240, 1, 1654876800, 198, 0.8250, 1654963208);
INSERT INTO `ocenter_count_lost` VALUES (279, 241, 1, 1654963200, 199, 0.8257, 1655058981);
INSERT INTO `ocenter_count_lost` VALUES (280, 241, 0, 1655049600, 199, 0.8257, 1655136087);
INSERT INTO `ocenter_count_lost` VALUES (281, 244, 3, 1655136000, 202, 0.8279, 1655223765);
INSERT INTO `ocenter_count_lost` VALUES (282, 245, 1, 1655222400, 203, 0.8286, 1655312334);
INSERT INTO `ocenter_count_lost` VALUES (283, 245, -2, 1655308800, 201, 0.8204, 1655396002);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_count_remain
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_count_remain`;
CREATE TABLE `ocenter_count_remain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL COMMENT '日期',
  `day1_num` int(11) NOT NULL COMMENT '第一天登录人数',
  `day2_num` int(11) NOT NULL COMMENT '第二天登录人数',
  `day3_num` int(11) NOT NULL,
  `day4_num` int(11) NOT NULL,
  `day5_num` int(11) NOT NULL,
  `day6_num` int(11) NOT NULL,
  `day7_num` int(11) NOT NULL,
  `day8_num` int(11) NOT NULL,
  `reg_num` int(11) NOT NULL COMMENT '当天注册人数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=348 DEFAULT CHARSET=utf8 COMMENT='留存率统计表';

-- ----------------------------
-- Records of ocenter_count_remain
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_count_remain` VALUES (1, 1516550400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (2, 1516464000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (3, 1516377600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (4, 1516291200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (5, 1516204800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (6, 1516118400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (7, 1516032000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (8, 1515945600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (9, 1516636800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (10, 1516723200, 2, 1, 0, 0, 0, 0, 0, 0, 2);
INSERT INTO `ocenter_count_remain` VALUES (11, 1516809600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (12, 1516896000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (13, 1517328000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (14, 1517241600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (15, 1517155200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (16, 1517068800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (17, 1516982400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (18, 1517414400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (19, 1517500800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (20, 1517587200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (21, 1517760000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (22, 1517673600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (23, 1517846400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (24, 1518019200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (25, 1517932800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (26, 1518105600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (27, 1518192000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (28, 1518278400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (29, 1518537600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (30, 1518451200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (31, 1518364800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (32, 1518624000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (33, 1518710400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (34, 1518796800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (35, 1518883200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (36, 1519056000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (37, 1518969600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (38, 1519142400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (39, 1519228800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (40, 1519315200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (41, 1521388800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (42, 1521302400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (43, 1521216000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (44, 1521129600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (45, 1521043200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (46, 1520956800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (47, 1520870400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (48, 1520784000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (49, 1539446400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (50, 1539360000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (51, 1539273600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (52, 1539187200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (53, 1539100800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (54, 1539014400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (55, 1538928000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (56, 1538841600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (57, 1613232000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (58, 1613145600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (59, 1613059200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (60, 1612972800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (61, 1612886400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (62, 1612800000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (63, 1612713600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (64, 1612627200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (65, 1613318400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (66, 1613404800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (67, 1613491200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (68, 1613577600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (69, 1613664000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (70, 1613750400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (71, 1613836800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (72, 1613923200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (73, 1614009600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (74, 1614096000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (75, 1614182400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (76, 1614268800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (77, 1614355200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (78, 1614441600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (79, 1614528000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (80, 1614614400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (81, 1614700800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (82, 1614787200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (83, 1614873600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (84, 1614960000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (85, 1615046400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (86, 1615132800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (87, 1615219200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (88, 1615305600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (89, 1615392000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (90, 1615478400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (91, 1615564800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (92, 1615651200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (93, 1615737600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (94, 1615824000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (95, 1615910400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (96, 1615996800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (97, 1616083200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (98, 1616169600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (99, 1616256000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (100, 1616342400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (101, 1616428800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (102, 1616515200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (103, 1616601600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (104, 1616688000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (105, 1616774400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (106, 1616860800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (107, 1616947200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (108, 1617033600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (109, 1617120000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (110, 1617206400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (111, 1617292800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (112, 1617379200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (113, 1617465600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (114, 1617552000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (115, 1617638400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (116, 1617724800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (117, 1617811200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (118, 1617897600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (119, 1617984000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (120, 1618070400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (121, 1618156800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (122, 1618243200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (123, 1618329600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (124, 1618416000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (125, 1618502400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (126, 1618588800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (127, 1618675200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (128, 1618761600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (129, 1618848000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (130, 1618934400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (131, 1619020800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (132, 1619107200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (133, 1619193600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (134, 1619280000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (135, 1619366400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (136, 1619452800, 1, 0, 0, 0, 0, 0, 0, 0, 5);
INSERT INTO `ocenter_count_remain` VALUES (137, 1619539200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (138, 1619625600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (139, 1619712000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (140, 1619798400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (141, 1619884800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (142, 1619971200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (143, 1620057600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (144, 1620144000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (145, 1620230400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (146, 1620316800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (147, 1620403200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (148, 1620489600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (149, 1620576000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (150, 1620662400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (151, 1620748800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (152, 1620835200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (153, 1620921600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (154, 1621008000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (155, 1621094400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (156, 1621180800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (157, 1621267200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (158, 1621353600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (159, 1621440000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (160, 1621526400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (161, 1621612800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (162, 1621699200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (163, 1621785600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (164, 1621872000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (165, 1621958400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (166, 1622044800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (167, 1622131200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (168, 1622217600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (169, 1622304000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (170, 1622390400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (171, 1622476800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (172, 1622563200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (173, 1622649600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (174, 1622736000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (175, 1622822400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (176, 1622908800, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (177, 1622995200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (178, 1623081600, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (179, 1623168000, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (180, 1623254400, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (181, 1623340800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (182, 1623427200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (183, 1623513600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (184, 1623600000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (185, 1623686400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (186, 1623772800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (187, 1623859200, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (188, 1623945600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (189, 1624032000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (190, 1624118400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (191, 1624204800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (192, 1624291200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (193, 1624377600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (194, 1624464000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (195, 1624550400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (196, 1624636800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (197, 1624723200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (198, 1624809600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (199, 1624896000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (200, 1624982400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (201, 1625068800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (202, 1625155200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (203, 1625241600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (204, 1625328000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (205, 1625414400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (206, 1625500800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (207, 1625587200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (208, 1625673600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (209, 1625760000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (210, 1625846400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (211, 1625932800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (212, 1626019200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (213, 1626105600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (214, 1626192000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (215, 1626278400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (216, 1626364800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (217, 1626451200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (218, 1626537600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (219, 1626624000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (220, 1626796800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (221, 1626710400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (222, 1626883200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (223, 1626969600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (224, 1627228800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (225, 1627142400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (226, 1627056000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (227, 1627315200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (228, 1627401600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (229, 1627488000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (230, 1627574400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (231, 1627660800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (232, 1627747200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (233, 1627833600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (234, 1627920000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (235, 1628006400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (236, 1628092800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (237, 1628179200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (238, 1628265600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (239, 1628352000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (240, 1628438400, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (241, 1628524800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (242, 1628611200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (243, 1628697600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (244, 1628784000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (245, 1628870400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (246, 1628956800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (247, 1629043200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (248, 1629129600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (249, 1629216000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (250, 1629302400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (251, 1629388800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (252, 1629475200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (253, 1629561600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (254, 1629648000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (255, 1629734400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (256, 1629820800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (257, 1629907200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (258, 1629993600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (259, 1630080000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (260, 1630166400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (261, 1630252800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (262, 1630339200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (263, 1630425600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (264, 1630512000, 0, 0, 0, 0, 0, 0, 0, 0, 4);
INSERT INTO `ocenter_count_remain` VALUES (265, 1630598400, 0, 0, 0, 0, 0, 0, 0, 0, 3);
INSERT INTO `ocenter_count_remain` VALUES (266, 1630684800, 0, 0, 0, 0, 0, 0, 0, 0, 3);
INSERT INTO `ocenter_count_remain` VALUES (267, 1630771200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (268, 1630857600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (269, 1630944000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (270, 1631030400, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (271, 1631116800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (272, 1631203200, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (273, 1631289600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (274, 1631376000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (275, 1631462400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (276, 1631548800, 0, 0, 0, 0, 0, 0, 0, 0, 28);
INSERT INTO `ocenter_count_remain` VALUES (277, 1631635200, 0, 0, 0, 0, 0, 0, 0, 0, 18);
INSERT INTO `ocenter_count_remain` VALUES (278, 1631721600, 0, 0, 0, 0, 0, 0, 0, 0, 50);
INSERT INTO `ocenter_count_remain` VALUES (279, 1631808000, 0, 0, 0, 0, 0, 0, 0, 0, 54);
INSERT INTO `ocenter_count_remain` VALUES (280, 1631894400, 0, 0, 0, 0, 0, 0, 0, 0, 56);
INSERT INTO `ocenter_count_remain` VALUES (281, 1631980800, 0, 0, 0, 0, 0, 0, 0, 0, 47);
INSERT INTO `ocenter_count_remain` VALUES (282, 1632067200, 0, 0, 0, 0, 0, 0, 0, 0, 17);
INSERT INTO `ocenter_count_remain` VALUES (283, 1632153600, 0, 0, 0, 0, 0, 0, 0, 0, 8);
INSERT INTO `ocenter_count_remain` VALUES (284, 1632240000, 0, 0, 0, 0, 0, 0, 0, 0, 14);
INSERT INTO `ocenter_count_remain` VALUES (285, 1632326400, 0, 0, 0, 0, 0, 0, 0, 0, 12);
INSERT INTO `ocenter_count_remain` VALUES (286, 1632412800, 0, 0, 0, 0, 0, 0, 0, 0, 23);
INSERT INTO `ocenter_count_remain` VALUES (287, 1632499200, 0, 0, 0, 0, 0, 0, 0, 0, 7);
INSERT INTO `ocenter_count_remain` VALUES (288, 1632585600, 0, 0, 0, 0, 0, 0, 0, 0, 15);
INSERT INTO `ocenter_count_remain` VALUES (289, 1632672000, 0, 0, 0, 0, 0, 0, 0, 0, 15);
INSERT INTO `ocenter_count_remain` VALUES (290, 1632758400, 0, 0, 0, 0, 0, 0, 0, 0, 13);
INSERT INTO `ocenter_count_remain` VALUES (291, 1649779200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (292, 1649692800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (293, 1649606400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (294, 1649520000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (295, 1649433600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (296, 1649347200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (297, 1649260800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (298, 1649174400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (299, 1650038400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (300, 1649952000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (301, 1649865600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (302, 1650124800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (303, 1650211200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (304, 1650384000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (305, 1650297600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (306, 1650470400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (307, 1652371200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (308, 1652284800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (309, 1652198400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (310, 1652112000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (311, 1652025600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (312, 1651939200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (313, 1651852800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (314, 1651766400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (315, 1652544000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (316, 1652457600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (317, 1652630400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (318, 1652716800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (319, 1652803200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (320, 1652889600, 1, 1, 1, 0, 0, 0, 0, 0, 2);
INSERT INTO `ocenter_count_remain` VALUES (321, 1652976000, 1, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (322, 1653062400, 0, 0, 0, 0, 0, 0, 0, 0, 2);
INSERT INTO `ocenter_count_remain` VALUES (323, 1653235200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (324, 1653148800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (325, 1653753600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (326, 1653667200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (327, 1653580800, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (328, 1653494400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (329, 1653408000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (330, 1653321600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (331, 1653840000, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (332, 1653926400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (333, 1654012800, 16, 5, 4, 3, 5, 5, 12, 9, 208);
INSERT INTO `ocenter_count_remain` VALUES (334, 1654099200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (335, 1654185600, 0, 0, 1, 0, 0, 0, 0, 0, 6);
INSERT INTO `ocenter_count_remain` VALUES (336, 1654272000, 0, 0, 0, 0, 0, 0, 0, 0, 5);
INSERT INTO `ocenter_count_remain` VALUES (337, 1654358400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (338, 1654444800, 0, 0, 0, 0, 0, 0, 0, 0, 7);
INSERT INTO `ocenter_count_remain` VALUES (339, 1654531200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (340, 1654617600, 1, 0, 0, 0, 0, 0, 0, 0, 7);
INSERT INTO `ocenter_count_remain` VALUES (341, 1654704000, 0, 0, 0, 0, 0, 0, 0, 0, 3);
INSERT INTO `ocenter_count_remain` VALUES (342, 1654790400, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (343, 1654876800, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (344, 1654963200, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_count_remain` VALUES (345, 1655049600, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_count_remain` VALUES (346, 1655136000, 0, 0, 0, 0, 0, 0, 0, 0, 3);
INSERT INTO `ocenter_count_remain` VALUES (347, 1655222400, 0, 0, 0, 0, 0, 0, 0, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_district
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_district`;
CREATE TABLE `ocenter_district` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=910007 DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表';

-- ----------------------------
-- Records of ocenter_district
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_district` VALUES (110000, '北京市', 1, 0);
INSERT INTO `ocenter_district` VALUES (120000, '天津市', 1, 0);
INSERT INTO `ocenter_district` VALUES (130000, '河北省', 1, 0);
INSERT INTO `ocenter_district` VALUES (140000, '山西省', 1, 0);
INSERT INTO `ocenter_district` VALUES (150000, '内蒙古', 1, 0);
INSERT INTO `ocenter_district` VALUES (210000, '辽宁省', 1, 0);
INSERT INTO `ocenter_district` VALUES (220000, '吉林省', 1, 0);
INSERT INTO `ocenter_district` VALUES (230000, '黑龙江', 1, 0);
INSERT INTO `ocenter_district` VALUES (310000, '上海市', 1, 0);
INSERT INTO `ocenter_district` VALUES (320000, '江苏省', 1, 0);
INSERT INTO `ocenter_district` VALUES (330000, '浙江省', 1, 0);
INSERT INTO `ocenter_district` VALUES (340000, '安徽省', 1, 0);
INSERT INTO `ocenter_district` VALUES (350000, '福建省', 1, 0);
INSERT INTO `ocenter_district` VALUES (360000, '江西省', 1, 0);
INSERT INTO `ocenter_district` VALUES (370000, '山东省', 1, 0);
INSERT INTO `ocenter_district` VALUES (410000, '河南省', 1, 0);
INSERT INTO `ocenter_district` VALUES (420000, '湖北省', 1, 0);
INSERT INTO `ocenter_district` VALUES (430000, '湖南省', 1, 0);
INSERT INTO `ocenter_district` VALUES (440000, '广东省', 1, 0);
INSERT INTO `ocenter_district` VALUES (450000, '广西省', 1, 0);
INSERT INTO `ocenter_district` VALUES (460000, '海南省', 1, 0);
INSERT INTO `ocenter_district` VALUES (500000, '重庆市', 1, 0);
INSERT INTO `ocenter_district` VALUES (510000, '四川省', 1, 0);
INSERT INTO `ocenter_district` VALUES (520000, '贵州省', 1, 0);
INSERT INTO `ocenter_district` VALUES (530000, '云南省', 1, 0);
INSERT INTO `ocenter_district` VALUES (540000, '西　藏', 1, 0);
INSERT INTO `ocenter_district` VALUES (610000, '陕西省', 1, 0);
INSERT INTO `ocenter_district` VALUES (620000, '甘肃省', 1, 0);
INSERT INTO `ocenter_district` VALUES (630000, '青海省', 1, 0);
INSERT INTO `ocenter_district` VALUES (640000, '宁　夏', 1, 0);
INSERT INTO `ocenter_district` VALUES (650000, '新　疆', 1, 0);
INSERT INTO `ocenter_district` VALUES (710000, '台湾省', 1, 0);
INSERT INTO `ocenter_district` VALUES (810000, '香　港', 1, 0);
INSERT INTO `ocenter_district` VALUES (820000, '澳　门', 1, 0);
INSERT INTO `ocenter_district` VALUES (110100, '北京市', 2, 110000);
INSERT INTO `ocenter_district` VALUES (110200, '县', 2, 110000);
INSERT INTO `ocenter_district` VALUES (120100, '市辖区', 2, 120000);
INSERT INTO `ocenter_district` VALUES (120200, '县', 2, 120000);
INSERT INTO `ocenter_district` VALUES (130100, '石家庄市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (130200, '唐山市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (130300, '秦皇岛市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (130400, '邯郸市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (130500, '邢台市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (130600, '保定市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (130700, '张家口市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (130800, '承德市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (130900, '沧州市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (131000, '廊坊市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (131100, '衡水市', 2, 130000);
INSERT INTO `ocenter_district` VALUES (140100, '太原市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (140200, '大同市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (140300, '阳泉市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (140400, '长治市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (140500, '晋城市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (140600, '朔州市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (140700, '晋中市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (140800, '运城市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (140900, '忻州市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (141000, '临汾市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (141100, '吕梁市', 2, 140000);
INSERT INTO `ocenter_district` VALUES (150100, '呼和浩特市', 2, 150000);
INSERT INTO `ocenter_district` VALUES (150200, '包头市', 2, 150000);
INSERT INTO `ocenter_district` VALUES (150300, '乌海市', 2, 150000);
INSERT INTO `ocenter_district` VALUES (150400, '赤峰市', 2, 150000);
INSERT INTO `ocenter_district` VALUES (150500, '通辽市', 2, 150000);
INSERT INTO `ocenter_district` VALUES (150600, '鄂尔多斯市', 2, 150000);
INSERT INTO `ocenter_district` VALUES (150700, '呼伦贝尔市', 2, 150000);
INSERT INTO `ocenter_district` VALUES (150800, '巴彦淖尔市', 2, 150000);
INSERT INTO `ocenter_district` VALUES (150900, '乌兰察布市', 2, 150000);
INSERT INTO `ocenter_district` VALUES (152200, '兴安盟', 2, 150000);
INSERT INTO `ocenter_district` VALUES (152500, '锡林郭勒盟', 2, 150000);
INSERT INTO `ocenter_district` VALUES (152900, '阿拉善盟', 2, 150000);
INSERT INTO `ocenter_district` VALUES (210100, '沈阳市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (210200, '大连市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (210300, '鞍山市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (210400, '抚顺市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (210500, '本溪市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (210600, '丹东市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (210700, '锦州市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (210800, '营口市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (210900, '阜新市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (211000, '辽阳市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (211100, '盘锦市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (211200, '铁岭市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (211300, '朝阳市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (211400, '葫芦岛市', 2, 210000);
INSERT INTO `ocenter_district` VALUES (220100, '长春市', 2, 220000);
INSERT INTO `ocenter_district` VALUES (220200, '吉林市', 2, 220000);
INSERT INTO `ocenter_district` VALUES (220300, '四平市', 2, 220000);
INSERT INTO `ocenter_district` VALUES (220400, '辽源市', 2, 220000);
INSERT INTO `ocenter_district` VALUES (220500, '通化市', 2, 220000);
INSERT INTO `ocenter_district` VALUES (220600, '白山市', 2, 220000);
INSERT INTO `ocenter_district` VALUES (220700, '松原市', 2, 220000);
INSERT INTO `ocenter_district` VALUES (220800, '白城市', 2, 220000);
INSERT INTO `ocenter_district` VALUES (222400, '延边朝鲜族自治州', 2, 220000);
INSERT INTO `ocenter_district` VALUES (230100, '哈尔滨市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (230200, '齐齐哈尔市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (230300, '鸡西市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (230400, '鹤岗市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (230500, '双鸭山市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (230600, '大庆市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (230700, '伊春市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (230800, '佳木斯市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (230900, '七台河市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (231000, '牡丹江市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (231100, '黑河市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (231200, '绥化市', 2, 230000);
INSERT INTO `ocenter_district` VALUES (232700, '大兴安岭地区', 2, 230000);
INSERT INTO `ocenter_district` VALUES (310100, '市辖区', 2, 310000);
INSERT INTO `ocenter_district` VALUES (310200, '县', 2, 310000);
INSERT INTO `ocenter_district` VALUES (320100, '南京市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (320200, '无锡市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (320300, '徐州市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (320400, '常州市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (320500, '苏州市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (320600, '南通市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (320700, '连云港市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (320800, '淮安市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (320900, '盐城市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (321000, '扬州市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (321100, '镇江市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (321200, '泰州市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (321300, '宿迁市', 2, 320000);
INSERT INTO `ocenter_district` VALUES (330100, '杭州市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (330200, '宁波市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (330300, '温州市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (330400, '嘉兴市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (330500, '湖州市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (330600, '绍兴市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (330700, '金华市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (330800, '衢州市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (330900, '舟山市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (331000, '台州市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (331100, '丽水市', 2, 330000);
INSERT INTO `ocenter_district` VALUES (340100, '合肥市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (340200, '芜湖市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (340300, '蚌埠市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (340400, '淮南市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (340500, '马鞍山市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (340600, '淮北市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (340700, '铜陵市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (340800, '安庆市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (341000, '黄山市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (341100, '滁州市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (341200, '阜阳市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (341300, '宿州市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (341500, '六安市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (341600, '亳州市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (341700, '池州市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (341800, '宣城市', 2, 340000);
INSERT INTO `ocenter_district` VALUES (350100, '福州市', 2, 350000);
INSERT INTO `ocenter_district` VALUES (350200, '厦门市', 2, 350000);
INSERT INTO `ocenter_district` VALUES (350300, '莆田市', 2, 350000);
INSERT INTO `ocenter_district` VALUES (350400, '三明市', 2, 350000);
INSERT INTO `ocenter_district` VALUES (350500, '泉州市', 2, 350000);
INSERT INTO `ocenter_district` VALUES (350600, '漳州市', 2, 350000);
INSERT INTO `ocenter_district` VALUES (350700, '南平市', 2, 350000);
INSERT INTO `ocenter_district` VALUES (350800, '龙岩市', 2, 350000);
INSERT INTO `ocenter_district` VALUES (350900, '宁德市', 2, 350000);
INSERT INTO `ocenter_district` VALUES (360100, '南昌市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (360200, '景德镇市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (360300, '萍乡市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (360400, '九江市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (360500, '新余市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (360600, '鹰潭市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (360700, '赣州市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (360800, '吉安市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (360900, '宜春市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (361000, '抚州市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (361100, '上饶市', 2, 360000);
INSERT INTO `ocenter_district` VALUES (370100, '济南市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (370200, '青岛市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (370300, '淄博市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (370400, '枣庄市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (370500, '东营市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (370600, '烟台市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (370700, '潍坊市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (370800, '济宁市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (370900, '泰安市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (371000, '威海市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (371100, '日照市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (371200, '莱芜市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (371300, '临沂市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (371400, '德州市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (371500, '聊城市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (371600, '滨州市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (371700, '菏泽市', 2, 370000);
INSERT INTO `ocenter_district` VALUES (410100, '郑州市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (410200, '开封市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (410300, '洛阳市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (410400, '平顶山市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (410500, '安阳市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (410600, '鹤壁市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (410700, '新乡市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (410800, '焦作市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (410900, '濮阳市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (411000, '许昌市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (411100, '漯河市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (411200, '三门峡市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (411300, '南阳市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (411400, '商丘市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (411500, '信阳市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (411600, '周口市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (411700, '驻马店市', 2, 410000);
INSERT INTO `ocenter_district` VALUES (420100, '武汉市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (420200, '黄石市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (420300, '十堰市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (420500, '宜昌市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (420600, '襄樊市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (420700, '鄂州市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (420800, '荆门市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (420900, '孝感市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (421000, '荆州市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (421100, '黄冈市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (421200, '咸宁市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (421300, '随州市', 2, 420000);
INSERT INTO `ocenter_district` VALUES (422800, '恩施土家族苗族自治州', 2, 420000);
INSERT INTO `ocenter_district` VALUES (429000, '省直辖行政单位', 2, 420000);
INSERT INTO `ocenter_district` VALUES (430100, '长沙市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (430200, '株洲市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (430300, '湘潭市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (430400, '衡阳市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (430500, '邵阳市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (430600, '岳阳市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (430700, '常德市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (430800, '张家界市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (430900, '益阳市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (431000, '郴州市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (431100, '永州市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (431200, '怀化市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (431300, '娄底市', 2, 430000);
INSERT INTO `ocenter_district` VALUES (433100, '湘西土家族苗族自治州', 2, 430000);
INSERT INTO `ocenter_district` VALUES (440100, '广州市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (440200, '韶关市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (440300, '深圳市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (440400, '珠海市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (440500, '汕头市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (440600, '佛山市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (440700, '江门市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (440800, '湛江市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (440900, '茂名市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (441200, '肇庆市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (441300, '惠州市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (441400, '梅州市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (441500, '汕尾市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (441600, '河源市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (441700, '阳江市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (441800, '清远市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (441900, '东莞市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (442000, '中山市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (445100, '潮州市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (445200, '揭阳市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (445300, '云浮市', 2, 440000);
INSERT INTO `ocenter_district` VALUES (450100, '南宁市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (450200, '柳州市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (450300, '桂林市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (450400, '梧州市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (450500, '北海市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (450600, '防城港市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (450700, '钦州市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (450800, '贵港市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (450900, '玉林市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (451000, '百色市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (451100, '贺州市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (451200, '河池市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (451300, '来宾市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (451400, '崇左市', 2, 450000);
INSERT INTO `ocenter_district` VALUES (460100, '海口市', 2, 460000);
INSERT INTO `ocenter_district` VALUES (460200, '三亚市', 2, 460000);
INSERT INTO `ocenter_district` VALUES (469000, '省直辖县级行政单位', 2, 460000);
INSERT INTO `ocenter_district` VALUES (500100, '市辖区', 2, 500000);
INSERT INTO `ocenter_district` VALUES (500200, '县', 2, 500000);
INSERT INTO `ocenter_district` VALUES (500300, '市', 2, 500000);
INSERT INTO `ocenter_district` VALUES (510100, '成都市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (510300, '自贡市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (510400, '攀枝花市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (510500, '泸州市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (510600, '德阳市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (510700, '绵阳市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (510800, '广元市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (510900, '遂宁市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (511000, '内江市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (511100, '乐山市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (511300, '南充市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (511400, '眉山市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (511500, '宜宾市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (511600, '广安市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (511700, '达州市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (511800, '雅安市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (511900, '巴中市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (512000, '资阳市', 2, 510000);
INSERT INTO `ocenter_district` VALUES (513200, '阿坝藏族羌族自治州', 2, 510000);
INSERT INTO `ocenter_district` VALUES (513300, '甘孜藏族自治州', 2, 510000);
INSERT INTO `ocenter_district` VALUES (513400, '凉山彝族自治州', 2, 510000);
INSERT INTO `ocenter_district` VALUES (520100, '贵阳市', 2, 520000);
INSERT INTO `ocenter_district` VALUES (520200, '六盘水市', 2, 520000);
INSERT INTO `ocenter_district` VALUES (520300, '遵义市', 2, 520000);
INSERT INTO `ocenter_district` VALUES (520400, '安顺市', 2, 520000);
INSERT INTO `ocenter_district` VALUES (522200, '铜仁地区', 2, 520000);
INSERT INTO `ocenter_district` VALUES (522300, '黔西南布依族苗族自治州', 2, 520000);
INSERT INTO `ocenter_district` VALUES (522400, '毕节地区', 2, 520000);
INSERT INTO `ocenter_district` VALUES (522600, '黔东南苗族侗族自治州', 2, 520000);
INSERT INTO `ocenter_district` VALUES (522700, '黔南布依族苗族自治州', 2, 520000);
INSERT INTO `ocenter_district` VALUES (530100, '昆明市', 2, 530000);
INSERT INTO `ocenter_district` VALUES (530300, '曲靖市', 2, 530000);
INSERT INTO `ocenter_district` VALUES (530400, '玉溪市', 2, 530000);
INSERT INTO `ocenter_district` VALUES (530500, '保山市', 2, 530000);
INSERT INTO `ocenter_district` VALUES (530600, '昭通市', 2, 530000);
INSERT INTO `ocenter_district` VALUES (530700, '丽江市', 2, 530000);
INSERT INTO `ocenter_district` VALUES (530800, '思茅市', 2, 530000);
INSERT INTO `ocenter_district` VALUES (530900, '临沧市', 2, 530000);
INSERT INTO `ocenter_district` VALUES (532300, '楚雄彝族自治州', 2, 530000);
INSERT INTO `ocenter_district` VALUES (532500, '红河哈尼族彝族自治州', 2, 530000);
INSERT INTO `ocenter_district` VALUES (532600, '文山壮族苗族自治州', 2, 530000);
INSERT INTO `ocenter_district` VALUES (532800, '西双版纳傣族自治州', 2, 530000);
INSERT INTO `ocenter_district` VALUES (532900, '大理白族自治州', 2, 530000);
INSERT INTO `ocenter_district` VALUES (533100, '德宏傣族景颇族自治州', 2, 530000);
INSERT INTO `ocenter_district` VALUES (533300, '怒江傈僳族自治州', 2, 530000);
INSERT INTO `ocenter_district` VALUES (533400, '迪庆藏族自治州', 2, 530000);
INSERT INTO `ocenter_district` VALUES (540100, '拉萨市', 2, 540000);
INSERT INTO `ocenter_district` VALUES (542100, '昌都地区', 2, 540000);
INSERT INTO `ocenter_district` VALUES (542200, '山南地区', 2, 540000);
INSERT INTO `ocenter_district` VALUES (542300, '日喀则地区', 2, 540000);
INSERT INTO `ocenter_district` VALUES (542400, '那曲地区', 2, 540000);
INSERT INTO `ocenter_district` VALUES (542500, '阿里地区', 2, 540000);
INSERT INTO `ocenter_district` VALUES (542600, '林芝地区', 2, 540000);
INSERT INTO `ocenter_district` VALUES (610100, '西安市', 2, 610000);
INSERT INTO `ocenter_district` VALUES (610200, '铜川市', 2, 610000);
INSERT INTO `ocenter_district` VALUES (610300, '宝鸡市', 2, 610000);
INSERT INTO `ocenter_district` VALUES (610400, '咸阳市', 2, 610000);
INSERT INTO `ocenter_district` VALUES (610500, '渭南市', 2, 610000);
INSERT INTO `ocenter_district` VALUES (610600, '延安市', 2, 610000);
INSERT INTO `ocenter_district` VALUES (610700, '汉中市', 2, 610000);
INSERT INTO `ocenter_district` VALUES (610800, '榆林市', 2, 610000);
INSERT INTO `ocenter_district` VALUES (610900, '安康市', 2, 610000);
INSERT INTO `ocenter_district` VALUES (611000, '商洛市', 2, 610000);
INSERT INTO `ocenter_district` VALUES (620100, '兰州市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (620200, '嘉峪关市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (620300, '金昌市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (620400, '白银市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (620500, '天水市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (620600, '武威市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (620700, '张掖市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (620800, '平凉市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (620900, '酒泉市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (621000, '庆阳市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (621100, '定西市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (621200, '陇南市', 2, 620000);
INSERT INTO `ocenter_district` VALUES (622900, '临夏回族自治州', 2, 620000);
INSERT INTO `ocenter_district` VALUES (623000, '甘南藏族自治州', 2, 620000);
INSERT INTO `ocenter_district` VALUES (630100, '西宁市', 2, 630000);
INSERT INTO `ocenter_district` VALUES (632100, '海东地区', 2, 630000);
INSERT INTO `ocenter_district` VALUES (632200, '海北藏族自治州', 2, 630000);
INSERT INTO `ocenter_district` VALUES (632300, '黄南藏族自治州', 2, 630000);
INSERT INTO `ocenter_district` VALUES (632500, '海南藏族自治州', 2, 630000);
INSERT INTO `ocenter_district` VALUES (632600, '果洛藏族自治州', 2, 630000);
INSERT INTO `ocenter_district` VALUES (632700, '玉树藏族自治州', 2, 630000);
INSERT INTO `ocenter_district` VALUES (632800, '海西蒙古族藏族自治州', 2, 630000);
INSERT INTO `ocenter_district` VALUES (640100, '银川市', 2, 640000);
INSERT INTO `ocenter_district` VALUES (640200, '石嘴山市', 2, 640000);
INSERT INTO `ocenter_district` VALUES (640300, '吴忠市', 2, 640000);
INSERT INTO `ocenter_district` VALUES (640400, '固原市', 2, 640000);
INSERT INTO `ocenter_district` VALUES (640500, '中卫市', 2, 640000);
INSERT INTO `ocenter_district` VALUES (650100, '乌鲁木齐市', 2, 650000);
INSERT INTO `ocenter_district` VALUES (650200, '克拉玛依市', 2, 650000);
INSERT INTO `ocenter_district` VALUES (652100, '吐鲁番地区', 2, 650000);
INSERT INTO `ocenter_district` VALUES (652200, '哈密地区', 2, 650000);
INSERT INTO `ocenter_district` VALUES (652300, '昌吉回族自治州', 2, 650000);
INSERT INTO `ocenter_district` VALUES (652700, '博尔塔拉蒙古自治州', 2, 650000);
INSERT INTO `ocenter_district` VALUES (652800, '巴音郭楞蒙古自治州', 2, 650000);
INSERT INTO `ocenter_district` VALUES (652900, '阿克苏地区', 2, 650000);
INSERT INTO `ocenter_district` VALUES (653000, '克孜勒苏柯尔克孜自治州', 2, 650000);
INSERT INTO `ocenter_district` VALUES (653100, '喀什地区', 2, 650000);
INSERT INTO `ocenter_district` VALUES (653200, '和田地区', 2, 650000);
INSERT INTO `ocenter_district` VALUES (654000, '伊犁哈萨克自治州', 2, 650000);
INSERT INTO `ocenter_district` VALUES (654200, '塔城地区', 2, 650000);
INSERT INTO `ocenter_district` VALUES (654300, '阿勒泰地区', 2, 650000);
INSERT INTO `ocenter_district` VALUES (659000, '省直辖行政单位', 2, 650000);
INSERT INTO `ocenter_district` VALUES (110101, '东城区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110102, '西城区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110103, '崇文区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110104, '宣武区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110105, '朝阳区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110106, '丰台区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110107, '石景山区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110108, '海淀区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110109, '门头沟区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110111, '房山区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110112, '通州区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110113, '顺义区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110114, '昌平区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110115, '大兴区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110116, '怀柔区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110117, '平谷区', 3, 110100);
INSERT INTO `ocenter_district` VALUES (110228, '密云县', 3, 110200);
INSERT INTO `ocenter_district` VALUES (110229, '延庆县', 3, 110200);
INSERT INTO `ocenter_district` VALUES (120101, '和平区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120102, '河东区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120103, '河西区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120104, '南开区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120105, '河北区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120106, '红桥区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120107, '塘沽区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120108, '汉沽区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120109, '大港区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120110, '东丽区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120111, '西青区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120112, '津南区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120113, '北辰区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120114, '武清区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120115, '宝坻区', 3, 120100);
INSERT INTO `ocenter_district` VALUES (120221, '宁河县', 3, 120200);
INSERT INTO `ocenter_district` VALUES (120223, '静海县', 3, 120200);
INSERT INTO `ocenter_district` VALUES (120225, '蓟　县', 3, 120200);
INSERT INTO `ocenter_district` VALUES (130101, '市辖区', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130102, '长安区', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130103, '桥东区', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130104, '桥西区', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130105, '新华区', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130107, '井陉矿区', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130108, '裕华区', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130121, '井陉县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130123, '正定县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130124, '栾城县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130125, '行唐县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130126, '灵寿县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130127, '高邑县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130128, '深泽县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130129, '赞皇县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130130, '无极县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130131, '平山县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130132, '元氏县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130133, '赵　县', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130181, '辛集市', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130182, '藁城市', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130183, '晋州市', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130184, '新乐市', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130185, '鹿泉市', 3, 130100);
INSERT INTO `ocenter_district` VALUES (130201, '市辖区', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130202, '路南区', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130203, '路北区', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130204, '古冶区', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130205, '开平区', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130207, '丰南区', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130208, '丰润区', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130223, '滦　县', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130224, '滦南县', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130225, '乐亭县', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130227, '迁西县', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130229, '玉田县', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130230, '唐海县', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130281, '遵化市', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130283, '迁安市', 3, 130200);
INSERT INTO `ocenter_district` VALUES (130301, '市辖区', 3, 130300);
INSERT INTO `ocenter_district` VALUES (130302, '海港区', 3, 130300);
INSERT INTO `ocenter_district` VALUES (130303, '山海关区', 3, 130300);
INSERT INTO `ocenter_district` VALUES (130304, '北戴河区', 3, 130300);
INSERT INTO `ocenter_district` VALUES (130321, '青龙满族自治县', 3, 130300);
INSERT INTO `ocenter_district` VALUES (130322, '昌黎县', 3, 130300);
INSERT INTO `ocenter_district` VALUES (130323, '抚宁县', 3, 130300);
INSERT INTO `ocenter_district` VALUES (130324, '卢龙县', 3, 130300);
INSERT INTO `ocenter_district` VALUES (130401, '市辖区', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130402, '邯山区', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130403, '丛台区', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130404, '复兴区', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130406, '峰峰矿区', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130421, '邯郸县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130423, '临漳县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130424, '成安县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130425, '大名县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130426, '涉　县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130427, '磁　县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130428, '肥乡县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130429, '永年县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130430, '邱　县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130431, '鸡泽县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130432, '广平县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130433, '馆陶县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130434, '魏　县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130435, '曲周县', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130481, '武安市', 3, 130400);
INSERT INTO `ocenter_district` VALUES (130501, '市辖区', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130502, '桥东区', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130503, '桥西区', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130521, '邢台县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130522, '临城县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130523, '内丘县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130524, '柏乡县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130525, '隆尧县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130526, '任　县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130527, '南和县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130528, '宁晋县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130529, '巨鹿县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130530, '新河县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130531, '广宗县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130532, '平乡县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130533, '威　县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130534, '清河县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130535, '临西县', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130581, '南宫市', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130582, '沙河市', 3, 130500);
INSERT INTO `ocenter_district` VALUES (130601, '市辖区', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130602, '新市区', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130603, '北市区', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130604, '南市区', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130621, '满城县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130622, '清苑县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130623, '涞水县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130624, '阜平县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130625, '徐水县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130626, '定兴县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130627, '唐　县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130628, '高阳县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130629, '容城县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130630, '涞源县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130631, '望都县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130632, '安新县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130633, '易　县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130634, '曲阳县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130635, '蠡　县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130636, '顺平县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130637, '博野县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130638, '雄　县', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130681, '涿州市', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130682, '定州市', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130683, '安国市', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130684, '高碑店市', 3, 130600);
INSERT INTO `ocenter_district` VALUES (130701, '市辖区', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130702, '桥东区', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130703, '桥西区', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130705, '宣化区', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130706, '下花园区', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130721, '宣化县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130722, '张北县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130723, '康保县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130724, '沽源县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130725, '尚义县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130726, '蔚　县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130727, '阳原县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130728, '怀安县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130729, '万全县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130730, '怀来县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130731, '涿鹿县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130732, '赤城县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130733, '崇礼县', 3, 130700);
INSERT INTO `ocenter_district` VALUES (130801, '市辖区', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130802, '双桥区', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130803, '双滦区', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130804, '鹰手营子矿区', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130821, '承德县', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130822, '兴隆县', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130823, '平泉县', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130824, '滦平县', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130825, '隆化县', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130826, '丰宁满族自治县', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130827, '宽城满族自治县', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130828, '围场满族蒙古族自治县', 3, 130800);
INSERT INTO `ocenter_district` VALUES (130901, '市辖区', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130902, '新华区', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130903, '运河区', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130921, '沧　县', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130922, '青　县', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130923, '东光县', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130924, '海兴县', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130925, '盐山县', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130926, '肃宁县', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130927, '南皮县', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130928, '吴桥县', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130929, '献　县', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130930, '孟村回族自治县', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130981, '泊头市', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130982, '任丘市', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130983, '黄骅市', 3, 130900);
INSERT INTO `ocenter_district` VALUES (130984, '河间市', 3, 130900);
INSERT INTO `ocenter_district` VALUES (131001, '市辖区', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131002, '安次区', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131003, '广阳区', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131022, '固安县', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131023, '永清县', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131024, '香河县', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131025, '大城县', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131026, '文安县', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131028, '大厂回族自治县', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131081, '霸州市', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131082, '三河市', 3, 131000);
INSERT INTO `ocenter_district` VALUES (131101, '市辖区', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131102, '桃城区', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131121, '枣强县', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131122, '武邑县', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131123, '武强县', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131124, '饶阳县', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131125, '安平县', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131126, '故城县', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131127, '景　县', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131128, '阜城县', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131181, '冀州市', 3, 131100);
INSERT INTO `ocenter_district` VALUES (131182, '深州市', 3, 131100);
INSERT INTO `ocenter_district` VALUES (140101, '市辖区', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140105, '小店区', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140106, '迎泽区', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140107, '杏花岭区', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140108, '尖草坪区', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140109, '万柏林区', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140110, '晋源区', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140121, '清徐县', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140122, '阳曲县', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140123, '娄烦县', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140181, '古交市', 3, 140100);
INSERT INTO `ocenter_district` VALUES (140201, '市辖区', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140202, '城　区', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140203, '矿　区', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140211, '南郊区', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140212, '新荣区', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140221, '阳高县', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140222, '天镇县', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140223, '广灵县', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140224, '灵丘县', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140225, '浑源县', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140226, '左云县', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140227, '大同县', 3, 140200);
INSERT INTO `ocenter_district` VALUES (140301, '市辖区', 3, 140300);
INSERT INTO `ocenter_district` VALUES (140302, '城　区', 3, 140300);
INSERT INTO `ocenter_district` VALUES (140303, '矿　区', 3, 140300);
INSERT INTO `ocenter_district` VALUES (140311, '郊　区', 3, 140300);
INSERT INTO `ocenter_district` VALUES (140321, '平定县', 3, 140300);
INSERT INTO `ocenter_district` VALUES (140322, '盂　县', 3, 140300);
INSERT INTO `ocenter_district` VALUES (140401, '市辖区', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140402, '城　区', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140411, '郊　区', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140421, '长治县', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140423, '襄垣县', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140424, '屯留县', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140425, '平顺县', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140426, '黎城县', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140427, '壶关县', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140428, '长子县', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140429, '武乡县', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140430, '沁　县', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140431, '沁源县', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140481, '潞城市', 3, 140400);
INSERT INTO `ocenter_district` VALUES (140501, '市辖区', 3, 140500);
INSERT INTO `ocenter_district` VALUES (140502, '城　区', 3, 140500);
INSERT INTO `ocenter_district` VALUES (140521, '沁水县', 3, 140500);
INSERT INTO `ocenter_district` VALUES (140522, '阳城县', 3, 140500);
INSERT INTO `ocenter_district` VALUES (140524, '陵川县', 3, 140500);
INSERT INTO `ocenter_district` VALUES (140525, '泽州县', 3, 140500);
INSERT INTO `ocenter_district` VALUES (140581, '高平市', 3, 140500);
INSERT INTO `ocenter_district` VALUES (140601, '市辖区', 3, 140600);
INSERT INTO `ocenter_district` VALUES (140602, '朔城区', 3, 140600);
INSERT INTO `ocenter_district` VALUES (140603, '平鲁区', 3, 140600);
INSERT INTO `ocenter_district` VALUES (140621, '山阴县', 3, 140600);
INSERT INTO `ocenter_district` VALUES (140622, '应　县', 3, 140600);
INSERT INTO `ocenter_district` VALUES (140623, '右玉县', 3, 140600);
INSERT INTO `ocenter_district` VALUES (140624, '怀仁县', 3, 140600);
INSERT INTO `ocenter_district` VALUES (140701, '市辖区', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140702, '榆次区', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140721, '榆社县', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140722, '左权县', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140723, '和顺县', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140724, '昔阳县', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140725, '寿阳县', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140726, '太谷县', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140727, '祁　县', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140728, '平遥县', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140729, '灵石县', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140781, '介休市', 3, 140700);
INSERT INTO `ocenter_district` VALUES (140801, '市辖区', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140802, '盐湖区', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140821, '临猗县', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140822, '万荣县', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140823, '闻喜县', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140824, '稷山县', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140825, '新绛县', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140826, '绛　县', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140827, '垣曲县', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140828, '夏　县', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140829, '平陆县', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140830, '芮城县', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140881, '永济市', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140882, '河津市', 3, 140800);
INSERT INTO `ocenter_district` VALUES (140901, '市辖区', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140902, '忻府区', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140921, '定襄县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140922, '五台县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140923, '代　县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140924, '繁峙县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140925, '宁武县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140926, '静乐县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140927, '神池县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140928, '五寨县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140929, '岢岚县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140930, '河曲县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140931, '保德县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140932, '偏关县', 3, 140900);
INSERT INTO `ocenter_district` VALUES (140981, '原平市', 3, 140900);
INSERT INTO `ocenter_district` VALUES (141001, '市辖区', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141002, '尧都区', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141021, '曲沃县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141022, '翼城县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141023, '襄汾县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141024, '洪洞县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141025, '古　县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141026, '安泽县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141027, '浮山县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141028, '吉　县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141029, '乡宁县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141030, '大宁县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141031, '隰　县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141032, '永和县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141033, '蒲　县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141034, '汾西县', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141081, '侯马市', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141082, '霍州市', 3, 141000);
INSERT INTO `ocenter_district` VALUES (141101, '市辖区', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141102, '离石区', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141121, '文水县', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141122, '交城县', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141123, '兴　县', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141124, '临　县', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141125, '柳林县', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141126, '石楼县', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141127, '岚　县', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141128, '方山县', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141129, '中阳县', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141130, '交口县', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141181, '孝义市', 3, 141100);
INSERT INTO `ocenter_district` VALUES (141182, '汾阳市', 3, 141100);
INSERT INTO `ocenter_district` VALUES (150101, '市辖区', 3, 150100);
INSERT INTO `ocenter_district` VALUES (150102, '新城区', 3, 150100);
INSERT INTO `ocenter_district` VALUES (150103, '回民区', 3, 150100);
INSERT INTO `ocenter_district` VALUES (150104, '玉泉区', 3, 150100);
INSERT INTO `ocenter_district` VALUES (150105, '赛罕区', 3, 150100);
INSERT INTO `ocenter_district` VALUES (150121, '土默特左旗', 3, 150100);
INSERT INTO `ocenter_district` VALUES (150122, '托克托县', 3, 150100);
INSERT INTO `ocenter_district` VALUES (150123, '和林格尔县', 3, 150100);
INSERT INTO `ocenter_district` VALUES (150124, '清水河县', 3, 150100);
INSERT INTO `ocenter_district` VALUES (150125, '武川县', 3, 150100);
INSERT INTO `ocenter_district` VALUES (150201, '市辖区', 3, 150200);
INSERT INTO `ocenter_district` VALUES (150202, '东河区', 3, 150200);
INSERT INTO `ocenter_district` VALUES (150203, '昆都仑区', 3, 150200);
INSERT INTO `ocenter_district` VALUES (150204, '青山区', 3, 150200);
INSERT INTO `ocenter_district` VALUES (150205, '石拐区', 3, 150200);
INSERT INTO `ocenter_district` VALUES (150206, '白云矿区', 3, 150200);
INSERT INTO `ocenter_district` VALUES (150207, '九原区', 3, 150200);
INSERT INTO `ocenter_district` VALUES (150221, '土默特右旗', 3, 150200);
INSERT INTO `ocenter_district` VALUES (150222, '固阳县', 3, 150200);
INSERT INTO `ocenter_district` VALUES (150223, '达尔罕茂明安联合旗', 3, 150200);
INSERT INTO `ocenter_district` VALUES (150301, '市辖区', 3, 150300);
INSERT INTO `ocenter_district` VALUES (150302, '海勃湾区', 3, 150300);
INSERT INTO `ocenter_district` VALUES (150303, '海南区', 3, 150300);
INSERT INTO `ocenter_district` VALUES (150304, '乌达区', 3, 150300);
INSERT INTO `ocenter_district` VALUES (150401, '市辖区', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150402, '红山区', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150403, '元宝山区', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150404, '松山区', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150421, '阿鲁科尔沁旗', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150422, '巴林左旗', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150423, '巴林右旗', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150424, '林西县', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150425, '克什克腾旗', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150426, '翁牛特旗', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150428, '喀喇沁旗', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150429, '宁城县', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150430, '敖汉旗', 3, 150400);
INSERT INTO `ocenter_district` VALUES (150501, '市辖区', 3, 150500);
INSERT INTO `ocenter_district` VALUES (150502, '科尔沁区', 3, 150500);
INSERT INTO `ocenter_district` VALUES (150521, '科尔沁左翼中旗', 3, 150500);
INSERT INTO `ocenter_district` VALUES (150522, '科尔沁左翼后旗', 3, 150500);
INSERT INTO `ocenter_district` VALUES (150523, '开鲁县', 3, 150500);
INSERT INTO `ocenter_district` VALUES (150524, '库伦旗', 3, 150500);
INSERT INTO `ocenter_district` VALUES (150525, '奈曼旗', 3, 150500);
INSERT INTO `ocenter_district` VALUES (150526, '扎鲁特旗', 3, 150500);
INSERT INTO `ocenter_district` VALUES (150581, '霍林郭勒市', 3, 150500);
INSERT INTO `ocenter_district` VALUES (150602, '东胜区', 3, 150600);
INSERT INTO `ocenter_district` VALUES (150621, '达拉特旗', 3, 150600);
INSERT INTO `ocenter_district` VALUES (150622, '准格尔旗', 3, 150600);
INSERT INTO `ocenter_district` VALUES (150623, '鄂托克前旗', 3, 150600);
INSERT INTO `ocenter_district` VALUES (150624, '鄂托克旗', 3, 150600);
INSERT INTO `ocenter_district` VALUES (150625, '杭锦旗', 3, 150600);
INSERT INTO `ocenter_district` VALUES (150626, '乌审旗', 3, 150600);
INSERT INTO `ocenter_district` VALUES (150627, '伊金霍洛旗', 3, 150600);
INSERT INTO `ocenter_district` VALUES (150701, '市辖区', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150702, '海拉尔区', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150721, '阿荣旗', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150722, '莫力达瓦达斡尔族自治旗', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150723, '鄂伦春自治旗', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150724, '鄂温克族自治旗', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150725, '陈巴尔虎旗', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150726, '新巴尔虎左旗', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150727, '新巴尔虎右旗', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150781, '满洲里市', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150782, '牙克石市', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150783, '扎兰屯市', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150784, '额尔古纳市', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150785, '根河市', 3, 150700);
INSERT INTO `ocenter_district` VALUES (150801, '市辖区', 3, 150800);
INSERT INTO `ocenter_district` VALUES (150802, '临河区', 3, 150800);
INSERT INTO `ocenter_district` VALUES (150821, '五原县', 3, 150800);
INSERT INTO `ocenter_district` VALUES (150822, '磴口县', 3, 150800);
INSERT INTO `ocenter_district` VALUES (150823, '乌拉特前旗', 3, 150800);
INSERT INTO `ocenter_district` VALUES (150824, '乌拉特中旗', 3, 150800);
INSERT INTO `ocenter_district` VALUES (150825, '乌拉特后旗', 3, 150800);
INSERT INTO `ocenter_district` VALUES (150826, '杭锦后旗', 3, 150800);
INSERT INTO `ocenter_district` VALUES (150901, '市辖区', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150902, '集宁区', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150921, '卓资县', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150922, '化德县', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150923, '商都县', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150924, '兴和县', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150925, '凉城县', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150926, '察哈尔右翼前旗', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150927, '察哈尔右翼中旗', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150928, '察哈尔右翼后旗', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150929, '四子王旗', 3, 150900);
INSERT INTO `ocenter_district` VALUES (150981, '丰镇市', 3, 150900);
INSERT INTO `ocenter_district` VALUES (152201, '乌兰浩特市', 3, 152200);
INSERT INTO `ocenter_district` VALUES (152202, '阿尔山市', 3, 152200);
INSERT INTO `ocenter_district` VALUES (152221, '科尔沁右翼前旗', 3, 152200);
INSERT INTO `ocenter_district` VALUES (152222, '科尔沁右翼中旗', 3, 152200);
INSERT INTO `ocenter_district` VALUES (152223, '扎赉特旗', 3, 152200);
INSERT INTO `ocenter_district` VALUES (152224, '突泉县', 3, 152200);
INSERT INTO `ocenter_district` VALUES (152501, '二连浩特市', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152502, '锡林浩特市', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152522, '阿巴嘎旗', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152523, '苏尼特左旗', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152524, '苏尼特右旗', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152525, '东乌珠穆沁旗', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152526, '西乌珠穆沁旗', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152527, '太仆寺旗', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152528, '镶黄旗', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152529, '正镶白旗', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152530, '正蓝旗', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152531, '多伦县', 3, 152500);
INSERT INTO `ocenter_district` VALUES (152921, '阿拉善左旗', 3, 152900);
INSERT INTO `ocenter_district` VALUES (152922, '阿拉善右旗', 3, 152900);
INSERT INTO `ocenter_district` VALUES (152923, '额济纳旗', 3, 152900);
INSERT INTO `ocenter_district` VALUES (210101, '市辖区', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210102, '和平区', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210103, '沈河区', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210104, '大东区', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210105, '皇姑区', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210106, '铁西区', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210111, '苏家屯区', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210112, '东陵区', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210113, '新城子区', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210114, '于洪区', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210122, '辽中县', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210123, '康平县', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210124, '法库县', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210181, '新民市', 3, 210100);
INSERT INTO `ocenter_district` VALUES (210201, '市辖区', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210202, '中山区', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210203, '西岗区', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210204, '沙河口区', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210211, '甘井子区', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210212, '旅顺口区', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210213, '金州区', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210224, '长海县', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210281, '瓦房店市', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210282, '普兰店市', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210283, '庄河市', 3, 210200);
INSERT INTO `ocenter_district` VALUES (210301, '市辖区', 3, 210300);
INSERT INTO `ocenter_district` VALUES (210302, '铁东区', 3, 210300);
INSERT INTO `ocenter_district` VALUES (210303, '铁西区', 3, 210300);
INSERT INTO `ocenter_district` VALUES (210304, '立山区', 3, 210300);
INSERT INTO `ocenter_district` VALUES (210311, '千山区', 3, 210300);
INSERT INTO `ocenter_district` VALUES (210321, '台安县', 3, 210300);
INSERT INTO `ocenter_district` VALUES (210323, '岫岩满族自治县', 3, 210300);
INSERT INTO `ocenter_district` VALUES (210381, '海城市', 3, 210300);
INSERT INTO `ocenter_district` VALUES (210401, '市辖区', 3, 210400);
INSERT INTO `ocenter_district` VALUES (210402, '新抚区', 3, 210400);
INSERT INTO `ocenter_district` VALUES (210403, '东洲区', 3, 210400);
INSERT INTO `ocenter_district` VALUES (210404, '望花区', 3, 210400);
INSERT INTO `ocenter_district` VALUES (210411, '顺城区', 3, 210400);
INSERT INTO `ocenter_district` VALUES (210421, '抚顺县', 3, 210400);
INSERT INTO `ocenter_district` VALUES (210422, '新宾满族自治县', 3, 210400);
INSERT INTO `ocenter_district` VALUES (210423, '清原满族自治县', 3, 210400);
INSERT INTO `ocenter_district` VALUES (210501, '市辖区', 3, 210500);
INSERT INTO `ocenter_district` VALUES (210502, '平山区', 3, 210500);
INSERT INTO `ocenter_district` VALUES (210503, '溪湖区', 3, 210500);
INSERT INTO `ocenter_district` VALUES (210504, '明山区', 3, 210500);
INSERT INTO `ocenter_district` VALUES (210505, '南芬区', 3, 210500);
INSERT INTO `ocenter_district` VALUES (210521, '本溪满族自治县', 3, 210500);
INSERT INTO `ocenter_district` VALUES (210522, '桓仁满族自治县', 3, 210500);
INSERT INTO `ocenter_district` VALUES (210601, '市辖区', 3, 210600);
INSERT INTO `ocenter_district` VALUES (210602, '元宝区', 3, 210600);
INSERT INTO `ocenter_district` VALUES (210603, '振兴区', 3, 210600);
INSERT INTO `ocenter_district` VALUES (210604, '振安区', 3, 210600);
INSERT INTO `ocenter_district` VALUES (210624, '宽甸满族自治县', 3, 210600);
INSERT INTO `ocenter_district` VALUES (210681, '东港市', 3, 210600);
INSERT INTO `ocenter_district` VALUES (210682, '凤城市', 3, 210600);
INSERT INTO `ocenter_district` VALUES (210701, '市辖区', 3, 210700);
INSERT INTO `ocenter_district` VALUES (210702, '古塔区', 3, 210700);
INSERT INTO `ocenter_district` VALUES (210703, '凌河区', 3, 210700);
INSERT INTO `ocenter_district` VALUES (210711, '太和区', 3, 210700);
INSERT INTO `ocenter_district` VALUES (210726, '黑山县', 3, 210700);
INSERT INTO `ocenter_district` VALUES (210727, '义　县', 3, 210700);
INSERT INTO `ocenter_district` VALUES (210781, '凌海市', 3, 210700);
INSERT INTO `ocenter_district` VALUES (210782, '北宁市', 3, 210700);
INSERT INTO `ocenter_district` VALUES (210801, '市辖区', 3, 210800);
INSERT INTO `ocenter_district` VALUES (210802, '站前区', 3, 210800);
INSERT INTO `ocenter_district` VALUES (210803, '西市区', 3, 210800);
INSERT INTO `ocenter_district` VALUES (210804, '鲅鱼圈区', 3, 210800);
INSERT INTO `ocenter_district` VALUES (210811, '老边区', 3, 210800);
INSERT INTO `ocenter_district` VALUES (210881, '盖州市', 3, 210800);
INSERT INTO `ocenter_district` VALUES (210882, '大石桥市', 3, 210800);
INSERT INTO `ocenter_district` VALUES (210901, '市辖区', 3, 210900);
INSERT INTO `ocenter_district` VALUES (210902, '海州区', 3, 210900);
INSERT INTO `ocenter_district` VALUES (210903, '新邱区', 3, 210900);
INSERT INTO `ocenter_district` VALUES (210904, '太平区', 3, 210900);
INSERT INTO `ocenter_district` VALUES (210905, '清河门区', 3, 210900);
INSERT INTO `ocenter_district` VALUES (210911, '细河区', 3, 210900);
INSERT INTO `ocenter_district` VALUES (210921, '阜新蒙古族自治县', 3, 210900);
INSERT INTO `ocenter_district` VALUES (210922, '彰武县', 3, 210900);
INSERT INTO `ocenter_district` VALUES (211001, '市辖区', 3, 211000);
INSERT INTO `ocenter_district` VALUES (211002, '白塔区', 3, 211000);
INSERT INTO `ocenter_district` VALUES (211003, '文圣区', 3, 211000);
INSERT INTO `ocenter_district` VALUES (211004, '宏伟区', 3, 211000);
INSERT INTO `ocenter_district` VALUES (211005, '弓长岭区', 3, 211000);
INSERT INTO `ocenter_district` VALUES (211011, '太子河区', 3, 211000);
INSERT INTO `ocenter_district` VALUES (211021, '辽阳县', 3, 211000);
INSERT INTO `ocenter_district` VALUES (211081, '灯塔市', 3, 211000);
INSERT INTO `ocenter_district` VALUES (211101, '市辖区', 3, 211100);
INSERT INTO `ocenter_district` VALUES (211102, '双台子区', 3, 211100);
INSERT INTO `ocenter_district` VALUES (211103, '兴隆台区', 3, 211100);
INSERT INTO `ocenter_district` VALUES (211121, '大洼县', 3, 211100);
INSERT INTO `ocenter_district` VALUES (211122, '盘山县', 3, 211100);
INSERT INTO `ocenter_district` VALUES (211201, '市辖区', 3, 211200);
INSERT INTO `ocenter_district` VALUES (211202, '银州区', 3, 211200);
INSERT INTO `ocenter_district` VALUES (211204, '清河区', 3, 211200);
INSERT INTO `ocenter_district` VALUES (211221, '铁岭县', 3, 211200);
INSERT INTO `ocenter_district` VALUES (211223, '西丰县', 3, 211200);
INSERT INTO `ocenter_district` VALUES (211224, '昌图县', 3, 211200);
INSERT INTO `ocenter_district` VALUES (211281, '调兵山市', 3, 211200);
INSERT INTO `ocenter_district` VALUES (211282, '开原市', 3, 211200);
INSERT INTO `ocenter_district` VALUES (211301, '市辖区', 3, 211300);
INSERT INTO `ocenter_district` VALUES (211302, '双塔区', 3, 211300);
INSERT INTO `ocenter_district` VALUES (211303, '龙城区', 3, 211300);
INSERT INTO `ocenter_district` VALUES (211321, '朝阳县', 3, 211300);
INSERT INTO `ocenter_district` VALUES (211322, '建平县', 3, 211300);
INSERT INTO `ocenter_district` VALUES (211324, '喀喇沁左翼蒙古族自治县', 3, 211300);
INSERT INTO `ocenter_district` VALUES (211381, '北票市', 3, 211300);
INSERT INTO `ocenter_district` VALUES (211382, '凌源市', 3, 211300);
INSERT INTO `ocenter_district` VALUES (211401, '市辖区', 3, 211400);
INSERT INTO `ocenter_district` VALUES (211402, '连山区', 3, 211400);
INSERT INTO `ocenter_district` VALUES (211403, '龙港区', 3, 211400);
INSERT INTO `ocenter_district` VALUES (211404, '南票区', 3, 211400);
INSERT INTO `ocenter_district` VALUES (211421, '绥中县', 3, 211400);
INSERT INTO `ocenter_district` VALUES (211422, '建昌县', 3, 211400);
INSERT INTO `ocenter_district` VALUES (211481, '兴城市', 3, 211400);
INSERT INTO `ocenter_district` VALUES (220101, '市辖区', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220102, '南关区', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220103, '宽城区', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220104, '朝阳区', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220105, '二道区', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220106, '绿园区', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220112, '双阳区', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220122, '农安县', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220181, '九台市', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220182, '榆树市', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220183, '德惠市', 3, 220100);
INSERT INTO `ocenter_district` VALUES (220201, '市辖区', 3, 220200);
INSERT INTO `ocenter_district` VALUES (220202, '昌邑区', 3, 220200);
INSERT INTO `ocenter_district` VALUES (220203, '龙潭区', 3, 220200);
INSERT INTO `ocenter_district` VALUES (220204, '船营区', 3, 220200);
INSERT INTO `ocenter_district` VALUES (220211, '丰满区', 3, 220200);
INSERT INTO `ocenter_district` VALUES (220221, '永吉县', 3, 220200);
INSERT INTO `ocenter_district` VALUES (220281, '蛟河市', 3, 220200);
INSERT INTO `ocenter_district` VALUES (220282, '桦甸市', 3, 220200);
INSERT INTO `ocenter_district` VALUES (220283, '舒兰市', 3, 220200);
INSERT INTO `ocenter_district` VALUES (220284, '磐石市', 3, 220200);
INSERT INTO `ocenter_district` VALUES (220301, '市辖区', 3, 220300);
INSERT INTO `ocenter_district` VALUES (220302, '铁西区', 3, 220300);
INSERT INTO `ocenter_district` VALUES (220303, '铁东区', 3, 220300);
INSERT INTO `ocenter_district` VALUES (220322, '梨树县', 3, 220300);
INSERT INTO `ocenter_district` VALUES (220323, '伊通满族自治县', 3, 220300);
INSERT INTO `ocenter_district` VALUES (220381, '公主岭市', 3, 220300);
INSERT INTO `ocenter_district` VALUES (220382, '双辽市', 3, 220300);
INSERT INTO `ocenter_district` VALUES (220401, '市辖区', 3, 220400);
INSERT INTO `ocenter_district` VALUES (220402, '龙山区', 3, 220400);
INSERT INTO `ocenter_district` VALUES (220403, '西安区', 3, 220400);
INSERT INTO `ocenter_district` VALUES (220421, '东丰县', 3, 220400);
INSERT INTO `ocenter_district` VALUES (220422, '东辽县', 3, 220400);
INSERT INTO `ocenter_district` VALUES (220501, '市辖区', 3, 220500);
INSERT INTO `ocenter_district` VALUES (220502, '东昌区', 3, 220500);
INSERT INTO `ocenter_district` VALUES (220503, '二道江区', 3, 220500);
INSERT INTO `ocenter_district` VALUES (220521, '通化县', 3, 220500);
INSERT INTO `ocenter_district` VALUES (220523, '辉南县', 3, 220500);
INSERT INTO `ocenter_district` VALUES (220524, '柳河县', 3, 220500);
INSERT INTO `ocenter_district` VALUES (220581, '梅河口市', 3, 220500);
INSERT INTO `ocenter_district` VALUES (220582, '集安市', 3, 220500);
INSERT INTO `ocenter_district` VALUES (220601, '市辖区', 3, 220600);
INSERT INTO `ocenter_district` VALUES (220602, '八道江区', 3, 220600);
INSERT INTO `ocenter_district` VALUES (220621, '抚松县', 3, 220600);
INSERT INTO `ocenter_district` VALUES (220622, '靖宇县', 3, 220600);
INSERT INTO `ocenter_district` VALUES (220623, '长白朝鲜族自治县', 3, 220600);
INSERT INTO `ocenter_district` VALUES (220625, '江源县', 3, 220600);
INSERT INTO `ocenter_district` VALUES (220681, '临江市', 3, 220600);
INSERT INTO `ocenter_district` VALUES (220701, '市辖区', 3, 220700);
INSERT INTO `ocenter_district` VALUES (220702, '宁江区', 3, 220700);
INSERT INTO `ocenter_district` VALUES (220721, '前郭尔罗斯蒙古族自治县', 3, 220700);
INSERT INTO `ocenter_district` VALUES (220722, '长岭县', 3, 220700);
INSERT INTO `ocenter_district` VALUES (220723, '乾安县', 3, 220700);
INSERT INTO `ocenter_district` VALUES (220724, '扶余县', 3, 220700);
INSERT INTO `ocenter_district` VALUES (220801, '市辖区', 3, 220800);
INSERT INTO `ocenter_district` VALUES (220802, '洮北区', 3, 220800);
INSERT INTO `ocenter_district` VALUES (220821, '镇赉县', 3, 220800);
INSERT INTO `ocenter_district` VALUES (220822, '通榆县', 3, 220800);
INSERT INTO `ocenter_district` VALUES (220881, '洮南市', 3, 220800);
INSERT INTO `ocenter_district` VALUES (220882, '大安市', 3, 220800);
INSERT INTO `ocenter_district` VALUES (222401, '延吉市', 3, 222400);
INSERT INTO `ocenter_district` VALUES (222402, '图们市', 3, 222400);
INSERT INTO `ocenter_district` VALUES (222403, '敦化市', 3, 222400);
INSERT INTO `ocenter_district` VALUES (222404, '珲春市', 3, 222400);
INSERT INTO `ocenter_district` VALUES (222405, '龙井市', 3, 222400);
INSERT INTO `ocenter_district` VALUES (222406, '和龙市', 3, 222400);
INSERT INTO `ocenter_district` VALUES (222424, '汪清县', 3, 222400);
INSERT INTO `ocenter_district` VALUES (222426, '安图县', 3, 222400);
INSERT INTO `ocenter_district` VALUES (230101, '市辖区', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230102, '道里区', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230103, '南岗区', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230104, '道外区', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230106, '香坊区', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230107, '动力区', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230108, '平房区', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230109, '松北区', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230111, '呼兰区', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230123, '依兰县', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230124, '方正县', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230125, '宾　县', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230126, '巴彦县', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230127, '木兰县', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230128, '通河县', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230129, '延寿县', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230181, '阿城市', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230182, '双城市', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230183, '尚志市', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230184, '五常市', 3, 230100);
INSERT INTO `ocenter_district` VALUES (230201, '市辖区', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230202, '龙沙区', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230203, '建华区', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230204, '铁锋区', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230205, '昂昂溪区', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230206, '富拉尔基区', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230207, '碾子山区', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230208, '梅里斯达斡尔族区', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230221, '龙江县', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230223, '依安县', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230224, '泰来县', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230225, '甘南县', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230227, '富裕县', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230229, '克山县', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230230, '克东县', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230231, '拜泉县', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230281, '讷河市', 3, 230200);
INSERT INTO `ocenter_district` VALUES (230301, '市辖区', 3, 230300);
INSERT INTO `ocenter_district` VALUES (230302, '鸡冠区', 3, 230300);
INSERT INTO `ocenter_district` VALUES (230303, '恒山区', 3, 230300);
INSERT INTO `ocenter_district` VALUES (230304, '滴道区', 3, 230300);
INSERT INTO `ocenter_district` VALUES (230305, '梨树区', 3, 230300);
INSERT INTO `ocenter_district` VALUES (230306, '城子河区', 3, 230300);
INSERT INTO `ocenter_district` VALUES (230307, '麻山区', 3, 230300);
INSERT INTO `ocenter_district` VALUES (230321, '鸡东县', 3, 230300);
INSERT INTO `ocenter_district` VALUES (230381, '虎林市', 3, 230300);
INSERT INTO `ocenter_district` VALUES (230382, '密山市', 3, 230300);
INSERT INTO `ocenter_district` VALUES (230401, '市辖区', 3, 230400);
INSERT INTO `ocenter_district` VALUES (230402, '向阳区', 3, 230400);
INSERT INTO `ocenter_district` VALUES (230403, '工农区', 3, 230400);
INSERT INTO `ocenter_district` VALUES (230404, '南山区', 3, 230400);
INSERT INTO `ocenter_district` VALUES (230405, '兴安区', 3, 230400);
INSERT INTO `ocenter_district` VALUES (230406, '东山区', 3, 230400);
INSERT INTO `ocenter_district` VALUES (230407, '兴山区', 3, 230400);
INSERT INTO `ocenter_district` VALUES (230421, '萝北县', 3, 230400);
INSERT INTO `ocenter_district` VALUES (230422, '绥滨县', 3, 230400);
INSERT INTO `ocenter_district` VALUES (230501, '市辖区', 3, 230500);
INSERT INTO `ocenter_district` VALUES (230502, '尖山区', 3, 230500);
INSERT INTO `ocenter_district` VALUES (230503, '岭东区', 3, 230500);
INSERT INTO `ocenter_district` VALUES (230505, '四方台区', 3, 230500);
INSERT INTO `ocenter_district` VALUES (230506, '宝山区', 3, 230500);
INSERT INTO `ocenter_district` VALUES (230521, '集贤县', 3, 230500);
INSERT INTO `ocenter_district` VALUES (230522, '友谊县', 3, 230500);
INSERT INTO `ocenter_district` VALUES (230523, '宝清县', 3, 230500);
INSERT INTO `ocenter_district` VALUES (230524, '饶河县', 3, 230500);
INSERT INTO `ocenter_district` VALUES (230601, '市辖区', 3, 230600);
INSERT INTO `ocenter_district` VALUES (230602, '萨尔图区', 3, 230600);
INSERT INTO `ocenter_district` VALUES (230603, '龙凤区', 3, 230600);
INSERT INTO `ocenter_district` VALUES (230604, '让胡路区', 3, 230600);
INSERT INTO `ocenter_district` VALUES (230605, '红岗区', 3, 230600);
INSERT INTO `ocenter_district` VALUES (230606, '大同区', 3, 230600);
INSERT INTO `ocenter_district` VALUES (230621, '肇州县', 3, 230600);
INSERT INTO `ocenter_district` VALUES (230622, '肇源县', 3, 230600);
INSERT INTO `ocenter_district` VALUES (230623, '林甸县', 3, 230600);
INSERT INTO `ocenter_district` VALUES (230624, '杜尔伯特蒙古族自治县', 3, 230600);
INSERT INTO `ocenter_district` VALUES (230701, '市辖区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230702, '伊春区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230703, '南岔区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230704, '友好区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230705, '西林区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230706, '翠峦区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230707, '新青区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230708, '美溪区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230709, '金山屯区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230710, '五营区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230711, '乌马河区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230712, '汤旺河区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230713, '带岭区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230714, '乌伊岭区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230715, '红星区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230716, '上甘岭区', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230722, '嘉荫县', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230781, '铁力市', 3, 230700);
INSERT INTO `ocenter_district` VALUES (230801, '市辖区', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230802, '永红区', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230803, '向阳区', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230804, '前进区', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230805, '东风区', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230811, '郊　区', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230822, '桦南县', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230826, '桦川县', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230828, '汤原县', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230833, '抚远县', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230881, '同江市', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230882, '富锦市', 3, 230800);
INSERT INTO `ocenter_district` VALUES (230901, '市辖区', 3, 230900);
INSERT INTO `ocenter_district` VALUES (230902, '新兴区', 3, 230900);
INSERT INTO `ocenter_district` VALUES (230903, '桃山区', 3, 230900);
INSERT INTO `ocenter_district` VALUES (230904, '茄子河区', 3, 230900);
INSERT INTO `ocenter_district` VALUES (230921, '勃利县', 3, 230900);
INSERT INTO `ocenter_district` VALUES (231001, '市辖区', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231002, '东安区', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231003, '阳明区', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231004, '爱民区', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231005, '西安区', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231024, '东宁县', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231025, '林口县', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231081, '绥芬河市', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231083, '海林市', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231084, '宁安市', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231085, '穆棱市', 3, 231000);
INSERT INTO `ocenter_district` VALUES (231101, '市辖区', 3, 231100);
INSERT INTO `ocenter_district` VALUES (231102, '爱辉区', 3, 231100);
INSERT INTO `ocenter_district` VALUES (231121, '嫩江县', 3, 231100);
INSERT INTO `ocenter_district` VALUES (231123, '逊克县', 3, 231100);
INSERT INTO `ocenter_district` VALUES (231124, '孙吴县', 3, 231100);
INSERT INTO `ocenter_district` VALUES (231181, '北安市', 3, 231100);
INSERT INTO `ocenter_district` VALUES (231182, '五大连池市', 3, 231100);
INSERT INTO `ocenter_district` VALUES (231201, '市辖区', 3, 231200);
INSERT INTO `ocenter_district` VALUES (231202, '北林区', 3, 231200);
INSERT INTO `ocenter_district` VALUES (231221, '望奎县', 3, 231200);
INSERT INTO `ocenter_district` VALUES (231222, '兰西县', 3, 231200);
INSERT INTO `ocenter_district` VALUES (231223, '青冈县', 3, 231200);
INSERT INTO `ocenter_district` VALUES (231224, '庆安县', 3, 231200);
INSERT INTO `ocenter_district` VALUES (231225, '明水县', 3, 231200);
INSERT INTO `ocenter_district` VALUES (231226, '绥棱县', 3, 231200);
INSERT INTO `ocenter_district` VALUES (231281, '安达市', 3, 231200);
INSERT INTO `ocenter_district` VALUES (231282, '肇东市', 3, 231200);
INSERT INTO `ocenter_district` VALUES (231283, '海伦市', 3, 231200);
INSERT INTO `ocenter_district` VALUES (232721, '呼玛县', 3, 232700);
INSERT INTO `ocenter_district` VALUES (232722, '塔河县', 3, 232700);
INSERT INTO `ocenter_district` VALUES (232723, '漠河县', 3, 232700);
INSERT INTO `ocenter_district` VALUES (310101, '黄浦区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310103, '卢湾区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310104, '徐汇区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310105, '长宁区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310106, '静安区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310107, '普陀区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310108, '闸北区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310109, '虹口区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310110, '杨浦区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310112, '闵行区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310113, '宝山区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310114, '嘉定区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310115, '浦东新区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310116, '金山区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310117, '松江区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310118, '青浦区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310119, '南汇区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310120, '奉贤区', 3, 310100);
INSERT INTO `ocenter_district` VALUES (310230, '崇明县', 3, 310200);
INSERT INTO `ocenter_district` VALUES (320101, '市辖区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320102, '玄武区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320103, '白下区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320104, '秦淮区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320105, '建邺区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320106, '鼓楼区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320107, '下关区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320111, '浦口区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320113, '栖霞区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320114, '雨花台区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320115, '江宁区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320116, '六合区', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320124, '溧水县', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320125, '高淳县', 3, 320100);
INSERT INTO `ocenter_district` VALUES (320201, '市辖区', 3, 320200);
INSERT INTO `ocenter_district` VALUES (320202, '崇安区', 3, 320200);
INSERT INTO `ocenter_district` VALUES (320203, '南长区', 3, 320200);
INSERT INTO `ocenter_district` VALUES (320204, '北塘区', 3, 320200);
INSERT INTO `ocenter_district` VALUES (320205, '锡山区', 3, 320200);
INSERT INTO `ocenter_district` VALUES (320206, '惠山区', 3, 320200);
INSERT INTO `ocenter_district` VALUES (320211, '滨湖区', 3, 320200);
INSERT INTO `ocenter_district` VALUES (320281, '江阴市', 3, 320200);
INSERT INTO `ocenter_district` VALUES (320282, '宜兴市', 3, 320200);
INSERT INTO `ocenter_district` VALUES (320301, '市辖区', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320302, '鼓楼区', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320303, '云龙区', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320304, '九里区', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320305, '贾汪区', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320311, '泉山区', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320321, '丰　县', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320322, '沛　县', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320323, '铜山县', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320324, '睢宁县', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320381, '新沂市', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320382, '邳州市', 3, 320300);
INSERT INTO `ocenter_district` VALUES (320401, '市辖区', 3, 320400);
INSERT INTO `ocenter_district` VALUES (320402, '天宁区', 3, 320400);
INSERT INTO `ocenter_district` VALUES (320404, '钟楼区', 3, 320400);
INSERT INTO `ocenter_district` VALUES (320405, '戚墅堰区', 3, 320400);
INSERT INTO `ocenter_district` VALUES (320411, '新北区', 3, 320400);
INSERT INTO `ocenter_district` VALUES (320412, '武进区', 3, 320400);
INSERT INTO `ocenter_district` VALUES (320481, '溧阳市', 3, 320400);
INSERT INTO `ocenter_district` VALUES (320482, '金坛市', 3, 320400);
INSERT INTO `ocenter_district` VALUES (320501, '市辖区', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320502, '沧浪区', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320503, '平江区', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320504, '金阊区', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320505, '虎丘区', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320506, '吴中区', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320507, '相城区', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320581, '常熟市', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320582, '张家港市', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320583, '昆山市', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320584, '吴江市', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320585, '太仓市', 3, 320500);
INSERT INTO `ocenter_district` VALUES (320601, '市辖区', 3, 320600);
INSERT INTO `ocenter_district` VALUES (320602, '崇川区', 3, 320600);
INSERT INTO `ocenter_district` VALUES (320611, '港闸区', 3, 320600);
INSERT INTO `ocenter_district` VALUES (320621, '海安县', 3, 320600);
INSERT INTO `ocenter_district` VALUES (320623, '如东县', 3, 320600);
INSERT INTO `ocenter_district` VALUES (320681, '启东市', 3, 320600);
INSERT INTO `ocenter_district` VALUES (320682, '如皋市', 3, 320600);
INSERT INTO `ocenter_district` VALUES (320683, '通州市', 3, 320600);
INSERT INTO `ocenter_district` VALUES (320684, '海门市', 3, 320600);
INSERT INTO `ocenter_district` VALUES (320701, '市辖区', 3, 320700);
INSERT INTO `ocenter_district` VALUES (320703, '连云区', 3, 320700);
INSERT INTO `ocenter_district` VALUES (320705, '新浦区', 3, 320700);
INSERT INTO `ocenter_district` VALUES (320706, '海州区', 3, 320700);
INSERT INTO `ocenter_district` VALUES (320721, '赣榆县', 3, 320700);
INSERT INTO `ocenter_district` VALUES (320722, '东海县', 3, 320700);
INSERT INTO `ocenter_district` VALUES (320723, '灌云县', 3, 320700);
INSERT INTO `ocenter_district` VALUES (320724, '灌南县', 3, 320700);
INSERT INTO `ocenter_district` VALUES (320801, '市辖区', 3, 320800);
INSERT INTO `ocenter_district` VALUES (320802, '清河区', 3, 320800);
INSERT INTO `ocenter_district` VALUES (320803, '楚州区', 3, 320800);
INSERT INTO `ocenter_district` VALUES (320804, '淮阴区', 3, 320800);
INSERT INTO `ocenter_district` VALUES (320811, '清浦区', 3, 320800);
INSERT INTO `ocenter_district` VALUES (320826, '涟水县', 3, 320800);
INSERT INTO `ocenter_district` VALUES (320829, '洪泽县', 3, 320800);
INSERT INTO `ocenter_district` VALUES (320830, '盱眙县', 3, 320800);
INSERT INTO `ocenter_district` VALUES (320831, '金湖县', 3, 320800);
INSERT INTO `ocenter_district` VALUES (320901, '市辖区', 3, 320900);
INSERT INTO `ocenter_district` VALUES (320902, '亭湖区', 3, 320900);
INSERT INTO `ocenter_district` VALUES (320903, '盐都区', 3, 320900);
INSERT INTO `ocenter_district` VALUES (320921, '响水县', 3, 320900);
INSERT INTO `ocenter_district` VALUES (320922, '滨海县', 3, 320900);
INSERT INTO `ocenter_district` VALUES (320923, '阜宁县', 3, 320900);
INSERT INTO `ocenter_district` VALUES (320924, '射阳县', 3, 320900);
INSERT INTO `ocenter_district` VALUES (320925, '建湖县', 3, 320900);
INSERT INTO `ocenter_district` VALUES (320981, '东台市', 3, 320900);
INSERT INTO `ocenter_district` VALUES (320982, '大丰市', 3, 320900);
INSERT INTO `ocenter_district` VALUES (321001, '市辖区', 3, 321000);
INSERT INTO `ocenter_district` VALUES (321002, '广陵区', 3, 321000);
INSERT INTO `ocenter_district` VALUES (321003, '邗江区', 3, 321000);
INSERT INTO `ocenter_district` VALUES (321011, '郊　区', 3, 321000);
INSERT INTO `ocenter_district` VALUES (321023, '宝应县', 3, 321000);
INSERT INTO `ocenter_district` VALUES (321081, '仪征市', 3, 321000);
INSERT INTO `ocenter_district` VALUES (321084, '高邮市', 3, 321000);
INSERT INTO `ocenter_district` VALUES (321088, '江都市', 3, 321000);
INSERT INTO `ocenter_district` VALUES (321101, '市辖区', 3, 321100);
INSERT INTO `ocenter_district` VALUES (321102, '京口区', 3, 321100);
INSERT INTO `ocenter_district` VALUES (321111, '润州区', 3, 321100);
INSERT INTO `ocenter_district` VALUES (321112, '丹徒区', 3, 321100);
INSERT INTO `ocenter_district` VALUES (321181, '丹阳市', 3, 321100);
INSERT INTO `ocenter_district` VALUES (321182, '扬中市', 3, 321100);
INSERT INTO `ocenter_district` VALUES (321183, '句容市', 3, 321100);
INSERT INTO `ocenter_district` VALUES (321201, '市辖区', 3, 321200);
INSERT INTO `ocenter_district` VALUES (321202, '海陵区', 3, 321200);
INSERT INTO `ocenter_district` VALUES (321203, '高港区', 3, 321200);
INSERT INTO `ocenter_district` VALUES (321281, '兴化市', 3, 321200);
INSERT INTO `ocenter_district` VALUES (321282, '靖江市', 3, 321200);
INSERT INTO `ocenter_district` VALUES (321283, '泰兴市', 3, 321200);
INSERT INTO `ocenter_district` VALUES (321284, '姜堰市', 3, 321200);
INSERT INTO `ocenter_district` VALUES (321301, '市辖区', 3, 321300);
INSERT INTO `ocenter_district` VALUES (321302, '宿城区', 3, 321300);
INSERT INTO `ocenter_district` VALUES (321311, '宿豫区', 3, 321300);
INSERT INTO `ocenter_district` VALUES (321322, '沭阳县', 3, 321300);
INSERT INTO `ocenter_district` VALUES (321323, '泗阳县', 3, 321300);
INSERT INTO `ocenter_district` VALUES (321324, '泗洪县', 3, 321300);
INSERT INTO `ocenter_district` VALUES (330101, '市辖区', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330102, '上城区', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330103, '下城区', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330104, '江干区', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330105, '拱墅区', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330106, '西湖区', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330108, '滨江区', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330109, '萧山区', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330110, '余杭区', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330122, '桐庐县', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330127, '淳安县', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330182, '建德市', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330183, '富阳市', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330185, '临安市', 3, 330100);
INSERT INTO `ocenter_district` VALUES (330201, '市辖区', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330203, '海曙区', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330204, '江东区', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330205, '江北区', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330206, '北仑区', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330211, '镇海区', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330212, '鄞州区', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330225, '象山县', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330226, '宁海县', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330281, '余姚市', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330282, '慈溪市', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330283, '奉化市', 3, 330200);
INSERT INTO `ocenter_district` VALUES (330301, '市辖区', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330302, '鹿城区', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330303, '龙湾区', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330304, '瓯海区', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330322, '洞头县', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330324, '永嘉县', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330326, '平阳县', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330327, '苍南县', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330328, '文成县', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330329, '泰顺县', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330381, '瑞安市', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330382, '乐清市', 3, 330300);
INSERT INTO `ocenter_district` VALUES (330401, '市辖区', 3, 330400);
INSERT INTO `ocenter_district` VALUES (330402, '秀城区', 3, 330400);
INSERT INTO `ocenter_district` VALUES (330411, '秀洲区', 3, 330400);
INSERT INTO `ocenter_district` VALUES (330421, '嘉善县', 3, 330400);
INSERT INTO `ocenter_district` VALUES (330424, '海盐县', 3, 330400);
INSERT INTO `ocenter_district` VALUES (330481, '海宁市', 3, 330400);
INSERT INTO `ocenter_district` VALUES (330482, '平湖市', 3, 330400);
INSERT INTO `ocenter_district` VALUES (330483, '桐乡市', 3, 330400);
INSERT INTO `ocenter_district` VALUES (330501, '市辖区', 3, 330500);
INSERT INTO `ocenter_district` VALUES (330502, '吴兴区', 3, 330500);
INSERT INTO `ocenter_district` VALUES (330503, '南浔区', 3, 330500);
INSERT INTO `ocenter_district` VALUES (330521, '德清县', 3, 330500);
INSERT INTO `ocenter_district` VALUES (330522, '长兴县', 3, 330500);
INSERT INTO `ocenter_district` VALUES (330523, '安吉县', 3, 330500);
INSERT INTO `ocenter_district` VALUES (330601, '市辖区', 3, 330600);
INSERT INTO `ocenter_district` VALUES (330602, '越城区', 3, 330600);
INSERT INTO `ocenter_district` VALUES (330621, '绍兴县', 3, 330600);
INSERT INTO `ocenter_district` VALUES (330624, '新昌县', 3, 330600);
INSERT INTO `ocenter_district` VALUES (330681, '诸暨市', 3, 330600);
INSERT INTO `ocenter_district` VALUES (330682, '上虞市', 3, 330600);
INSERT INTO `ocenter_district` VALUES (330683, '嵊州市', 3, 330600);
INSERT INTO `ocenter_district` VALUES (330701, '市辖区', 3, 330700);
INSERT INTO `ocenter_district` VALUES (330702, '婺城区', 3, 330700);
INSERT INTO `ocenter_district` VALUES (330703, '金东区', 3, 330700);
INSERT INTO `ocenter_district` VALUES (330723, '武义县', 3, 330700);
INSERT INTO `ocenter_district` VALUES (330726, '浦江县', 3, 330700);
INSERT INTO `ocenter_district` VALUES (330727, '磐安县', 3, 330700);
INSERT INTO `ocenter_district` VALUES (330781, '兰溪市', 3, 330700);
INSERT INTO `ocenter_district` VALUES (330782, '义乌市', 3, 330700);
INSERT INTO `ocenter_district` VALUES (330783, '东阳市', 3, 330700);
INSERT INTO `ocenter_district` VALUES (330784, '永康市', 3, 330700);
INSERT INTO `ocenter_district` VALUES (330801, '市辖区', 3, 330800);
INSERT INTO `ocenter_district` VALUES (330802, '柯城区', 3, 330800);
INSERT INTO `ocenter_district` VALUES (330803, '衢江区', 3, 330800);
INSERT INTO `ocenter_district` VALUES (330822, '常山县', 3, 330800);
INSERT INTO `ocenter_district` VALUES (330824, '开化县', 3, 330800);
INSERT INTO `ocenter_district` VALUES (330825, '龙游县', 3, 330800);
INSERT INTO `ocenter_district` VALUES (330881, '江山市', 3, 330800);
INSERT INTO `ocenter_district` VALUES (330901, '市辖区', 3, 330900);
INSERT INTO `ocenter_district` VALUES (330902, '定海区', 3, 330900);
INSERT INTO `ocenter_district` VALUES (330903, '普陀区', 3, 330900);
INSERT INTO `ocenter_district` VALUES (330921, '岱山县', 3, 330900);
INSERT INTO `ocenter_district` VALUES (330922, '嵊泗县', 3, 330900);
INSERT INTO `ocenter_district` VALUES (331001, '市辖区', 3, 331000);
INSERT INTO `ocenter_district` VALUES (331002, '椒江区', 3, 331000);
INSERT INTO `ocenter_district` VALUES (331003, '黄岩区', 3, 331000);
INSERT INTO `ocenter_district` VALUES (331004, '路桥区', 3, 331000);
INSERT INTO `ocenter_district` VALUES (331021, '玉环县', 3, 331000);
INSERT INTO `ocenter_district` VALUES (331022, '三门县', 3, 331000);
INSERT INTO `ocenter_district` VALUES (331023, '天台县', 3, 331000);
INSERT INTO `ocenter_district` VALUES (331024, '仙居县', 3, 331000);
INSERT INTO `ocenter_district` VALUES (331081, '温岭市', 3, 331000);
INSERT INTO `ocenter_district` VALUES (331082, '临海市', 3, 331000);
INSERT INTO `ocenter_district` VALUES (331101, '市辖区', 3, 331100);
INSERT INTO `ocenter_district` VALUES (331102, '莲都区', 3, 331100);
INSERT INTO `ocenter_district` VALUES (331121, '青田县', 3, 331100);
INSERT INTO `ocenter_district` VALUES (331122, '缙云县', 3, 331100);
INSERT INTO `ocenter_district` VALUES (331123, '遂昌县', 3, 331100);
INSERT INTO `ocenter_district` VALUES (331124, '松阳县', 3, 331100);
INSERT INTO `ocenter_district` VALUES (331125, '云和县', 3, 331100);
INSERT INTO `ocenter_district` VALUES (331126, '庆元县', 3, 331100);
INSERT INTO `ocenter_district` VALUES (331127, '景宁畲族自治县', 3, 331100);
INSERT INTO `ocenter_district` VALUES (331181, '龙泉市', 3, 331100);
INSERT INTO `ocenter_district` VALUES (340101, '市辖区', 3, 340100);
INSERT INTO `ocenter_district` VALUES (340102, '瑶海区', 3, 340100);
INSERT INTO `ocenter_district` VALUES (340103, '庐阳区', 3, 340100);
INSERT INTO `ocenter_district` VALUES (340104, '蜀山区', 3, 340100);
INSERT INTO `ocenter_district` VALUES (340111, '包河区', 3, 340100);
INSERT INTO `ocenter_district` VALUES (340121, '长丰县', 3, 340100);
INSERT INTO `ocenter_district` VALUES (340122, '肥东县', 3, 340100);
INSERT INTO `ocenter_district` VALUES (340123, '肥西县', 3, 340100);
INSERT INTO `ocenter_district` VALUES (340201, '市辖区', 3, 340200);
INSERT INTO `ocenter_district` VALUES (340202, '镜湖区', 3, 340200);
INSERT INTO `ocenter_district` VALUES (340203, '马塘区', 3, 340200);
INSERT INTO `ocenter_district` VALUES (340204, '新芜区', 3, 340200);
INSERT INTO `ocenter_district` VALUES (340207, '鸠江区', 3, 340200);
INSERT INTO `ocenter_district` VALUES (340221, '芜湖县', 3, 340200);
INSERT INTO `ocenter_district` VALUES (340222, '繁昌县', 3, 340200);
INSERT INTO `ocenter_district` VALUES (340223, '南陵县', 3, 340200);
INSERT INTO `ocenter_district` VALUES (340301, '市辖区', 3, 340300);
INSERT INTO `ocenter_district` VALUES (340302, '龙子湖区', 3, 340300);
INSERT INTO `ocenter_district` VALUES (340303, '蚌山区', 3, 340300);
INSERT INTO `ocenter_district` VALUES (340304, '禹会区', 3, 340300);
INSERT INTO `ocenter_district` VALUES (340311, '淮上区', 3, 340300);
INSERT INTO `ocenter_district` VALUES (340321, '怀远县', 3, 340300);
INSERT INTO `ocenter_district` VALUES (340322, '五河县', 3, 340300);
INSERT INTO `ocenter_district` VALUES (340323, '固镇县', 3, 340300);
INSERT INTO `ocenter_district` VALUES (340401, '市辖区', 3, 340400);
INSERT INTO `ocenter_district` VALUES (340402, '大通区', 3, 340400);
INSERT INTO `ocenter_district` VALUES (340403, '田家庵区', 3, 340400);
INSERT INTO `ocenter_district` VALUES (340404, '谢家集区', 3, 340400);
INSERT INTO `ocenter_district` VALUES (340405, '八公山区', 3, 340400);
INSERT INTO `ocenter_district` VALUES (340406, '潘集区', 3, 340400);
INSERT INTO `ocenter_district` VALUES (340421, '凤台县', 3, 340400);
INSERT INTO `ocenter_district` VALUES (340501, '市辖区', 3, 340500);
INSERT INTO `ocenter_district` VALUES (340502, '金家庄区', 3, 340500);
INSERT INTO `ocenter_district` VALUES (340503, '花山区', 3, 340500);
INSERT INTO `ocenter_district` VALUES (340504, '雨山区', 3, 340500);
INSERT INTO `ocenter_district` VALUES (340521, '当涂县', 3, 340500);
INSERT INTO `ocenter_district` VALUES (340601, '市辖区', 3, 340600);
INSERT INTO `ocenter_district` VALUES (340602, '杜集区', 3, 340600);
INSERT INTO `ocenter_district` VALUES (340603, '相山区', 3, 340600);
INSERT INTO `ocenter_district` VALUES (340604, '烈山区', 3, 340600);
INSERT INTO `ocenter_district` VALUES (340621, '濉溪县', 3, 340600);
INSERT INTO `ocenter_district` VALUES (340701, '市辖区', 3, 340700);
INSERT INTO `ocenter_district` VALUES (340702, '铜官山区', 3, 340700);
INSERT INTO `ocenter_district` VALUES (340703, '狮子山区', 3, 340700);
INSERT INTO `ocenter_district` VALUES (340711, '郊　区', 3, 340700);
INSERT INTO `ocenter_district` VALUES (340721, '铜陵县', 3, 340700);
INSERT INTO `ocenter_district` VALUES (340801, '市辖区', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340802, '迎江区', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340803, '大观区', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340811, '郊　区', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340822, '怀宁县', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340823, '枞阳县', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340824, '潜山县', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340825, '太湖县', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340826, '宿松县', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340827, '望江县', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340828, '岳西县', 3, 340800);
INSERT INTO `ocenter_district` VALUES (340881, '桐城市', 3, 340800);
INSERT INTO `ocenter_district` VALUES (341001, '市辖区', 3, 341000);
INSERT INTO `ocenter_district` VALUES (341002, '屯溪区', 3, 341000);
INSERT INTO `ocenter_district` VALUES (341003, '黄山区', 3, 341000);
INSERT INTO `ocenter_district` VALUES (341004, '徽州区', 3, 341000);
INSERT INTO `ocenter_district` VALUES (341021, '歙　县', 3, 341000);
INSERT INTO `ocenter_district` VALUES (341022, '休宁县', 3, 341000);
INSERT INTO `ocenter_district` VALUES (341023, '黟　县', 3, 341000);
INSERT INTO `ocenter_district` VALUES (341024, '祁门县', 3, 341000);
INSERT INTO `ocenter_district` VALUES (341101, '市辖区', 3, 341100);
INSERT INTO `ocenter_district` VALUES (341102, '琅琊区', 3, 341100);
INSERT INTO `ocenter_district` VALUES (341103, '南谯区', 3, 341100);
INSERT INTO `ocenter_district` VALUES (341122, '来安县', 3, 341100);
INSERT INTO `ocenter_district` VALUES (341124, '全椒县', 3, 341100);
INSERT INTO `ocenter_district` VALUES (341125, '定远县', 3, 341100);
INSERT INTO `ocenter_district` VALUES (341126, '凤阳县', 3, 341100);
INSERT INTO `ocenter_district` VALUES (341181, '天长市', 3, 341100);
INSERT INTO `ocenter_district` VALUES (341182, '明光市', 3, 341100);
INSERT INTO `ocenter_district` VALUES (341201, '市辖区', 3, 341200);
INSERT INTO `ocenter_district` VALUES (341202, '颍州区', 3, 341200);
INSERT INTO `ocenter_district` VALUES (341203, '颍东区', 3, 341200);
INSERT INTO `ocenter_district` VALUES (341204, '颍泉区', 3, 341200);
INSERT INTO `ocenter_district` VALUES (341221, '临泉县', 3, 341200);
INSERT INTO `ocenter_district` VALUES (341222, '太和县', 3, 341200);
INSERT INTO `ocenter_district` VALUES (341225, '阜南县', 3, 341200);
INSERT INTO `ocenter_district` VALUES (341226, '颍上县', 3, 341200);
INSERT INTO `ocenter_district` VALUES (341282, '界首市', 3, 341200);
INSERT INTO `ocenter_district` VALUES (341301, '市辖区', 3, 341300);
INSERT INTO `ocenter_district` VALUES (341302, '墉桥区', 3, 341300);
INSERT INTO `ocenter_district` VALUES (341321, '砀山县', 3, 341300);
INSERT INTO `ocenter_district` VALUES (341322, '萧　县', 3, 341300);
INSERT INTO `ocenter_district` VALUES (341323, '灵璧县', 3, 341300);
INSERT INTO `ocenter_district` VALUES (341324, '泗　县', 3, 341300);
INSERT INTO `ocenter_district` VALUES (341401, '庐江县', 3, 340100);
INSERT INTO `ocenter_district` VALUES (341402, '巢湖市', 3, 340100);
INSERT INTO `ocenter_district` VALUES (341422, '无为县', 3, 340200);
INSERT INTO `ocenter_district` VALUES (341423, '含山县', 3, 340500);
INSERT INTO `ocenter_district` VALUES (341424, '和　县', 3, 340500);
INSERT INTO `ocenter_district` VALUES (341501, '市辖区', 3, 341500);
INSERT INTO `ocenter_district` VALUES (341502, '金安区', 3, 341500);
INSERT INTO `ocenter_district` VALUES (341503, '裕安区', 3, 341500);
INSERT INTO `ocenter_district` VALUES (341521, '寿　县', 3, 341500);
INSERT INTO `ocenter_district` VALUES (341522, '霍邱县', 3, 341500);
INSERT INTO `ocenter_district` VALUES (341523, '舒城县', 3, 341500);
INSERT INTO `ocenter_district` VALUES (341524, '金寨县', 3, 341500);
INSERT INTO `ocenter_district` VALUES (341525, '霍山县', 3, 341500);
INSERT INTO `ocenter_district` VALUES (341601, '市辖区', 3, 341600);
INSERT INTO `ocenter_district` VALUES (341602, '谯城区', 3, 341600);
INSERT INTO `ocenter_district` VALUES (341621, '涡阳县', 3, 341600);
INSERT INTO `ocenter_district` VALUES (341622, '蒙城县', 3, 341600);
INSERT INTO `ocenter_district` VALUES (341623, '利辛县', 3, 341600);
INSERT INTO `ocenter_district` VALUES (341701, '市辖区', 3, 341700);
INSERT INTO `ocenter_district` VALUES (341702, '贵池区', 3, 341700);
INSERT INTO `ocenter_district` VALUES (341721, '东至县', 3, 341700);
INSERT INTO `ocenter_district` VALUES (341722, '石台县', 3, 341700);
INSERT INTO `ocenter_district` VALUES (341723, '青阳县', 3, 341700);
INSERT INTO `ocenter_district` VALUES (341801, '市辖区', 3, 341800);
INSERT INTO `ocenter_district` VALUES (341802, '宣州区', 3, 341800);
INSERT INTO `ocenter_district` VALUES (341821, '郎溪县', 3, 341800);
INSERT INTO `ocenter_district` VALUES (341822, '广德县', 3, 341800);
INSERT INTO `ocenter_district` VALUES (341823, '泾　县', 3, 341800);
INSERT INTO `ocenter_district` VALUES (341824, '绩溪县', 3, 341800);
INSERT INTO `ocenter_district` VALUES (341825, '旌德县', 3, 341800);
INSERT INTO `ocenter_district` VALUES (341881, '宁国市', 3, 341800);
INSERT INTO `ocenter_district` VALUES (350101, '市辖区', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350102, '鼓楼区', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350103, '台江区', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350104, '仓山区', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350105, '马尾区', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350111, '晋安区', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350121, '闽侯县', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350122, '连江县', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350123, '罗源县', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350124, '闽清县', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350125, '永泰县', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350128, '平潭县', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350181, '福清市', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350182, '长乐市', 3, 350100);
INSERT INTO `ocenter_district` VALUES (350201, '市辖区', 3, 350200);
INSERT INTO `ocenter_district` VALUES (350203, '思明区', 3, 350200);
INSERT INTO `ocenter_district` VALUES (350205, '海沧区', 3, 350200);
INSERT INTO `ocenter_district` VALUES (350206, '湖里区', 3, 350200);
INSERT INTO `ocenter_district` VALUES (350211, '集美区', 3, 350200);
INSERT INTO `ocenter_district` VALUES (350212, '同安区', 3, 350200);
INSERT INTO `ocenter_district` VALUES (350213, '翔安区', 3, 350200);
INSERT INTO `ocenter_district` VALUES (350301, '市辖区', 3, 350300);
INSERT INTO `ocenter_district` VALUES (350302, '城厢区', 3, 350300);
INSERT INTO `ocenter_district` VALUES (350303, '涵江区', 3, 350300);
INSERT INTO `ocenter_district` VALUES (350304, '荔城区', 3, 350300);
INSERT INTO `ocenter_district` VALUES (350305, '秀屿区', 3, 350300);
INSERT INTO `ocenter_district` VALUES (350322, '仙游县', 3, 350300);
INSERT INTO `ocenter_district` VALUES (350401, '市辖区', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350402, '梅列区', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350403, '三元区', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350421, '明溪县', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350423, '清流县', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350424, '宁化县', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350425, '大田县', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350426, '尤溪县', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350427, '沙　县', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350428, '将乐县', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350429, '泰宁县', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350430, '建宁县', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350481, '永安市', 3, 350400);
INSERT INTO `ocenter_district` VALUES (350501, '市辖区', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350502, '鲤城区', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350503, '丰泽区', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350504, '洛江区', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350505, '泉港区', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350521, '惠安县', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350524, '安溪县', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350525, '永春县', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350526, '德化县', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350527, '金门县', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350581, '石狮市', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350582, '晋江市', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350583, '南安市', 3, 350500);
INSERT INTO `ocenter_district` VALUES (350601, '市辖区', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350602, '芗城区', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350603, '龙文区', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350622, '云霄县', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350623, '漳浦县', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350624, '诏安县', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350625, '长泰县', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350626, '东山县', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350627, '南靖县', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350628, '平和县', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350629, '华安县', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350681, '龙海市', 3, 350600);
INSERT INTO `ocenter_district` VALUES (350701, '市辖区', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350702, '延平区', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350721, '顺昌县', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350722, '浦城县', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350723, '光泽县', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350724, '松溪县', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350725, '政和县', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350781, '邵武市', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350782, '武夷山市', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350783, '建瓯市', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350784, '建阳市', 3, 350700);
INSERT INTO `ocenter_district` VALUES (350801, '市辖区', 3, 350800);
INSERT INTO `ocenter_district` VALUES (350802, '新罗区', 3, 350800);
INSERT INTO `ocenter_district` VALUES (350821, '长汀县', 3, 350800);
INSERT INTO `ocenter_district` VALUES (350822, '永定县', 3, 350800);
INSERT INTO `ocenter_district` VALUES (350823, '上杭县', 3, 350800);
INSERT INTO `ocenter_district` VALUES (350824, '武平县', 3, 350800);
INSERT INTO `ocenter_district` VALUES (350825, '连城县', 3, 350800);
INSERT INTO `ocenter_district` VALUES (350881, '漳平市', 3, 350800);
INSERT INTO `ocenter_district` VALUES (350901, '市辖区', 3, 350900);
INSERT INTO `ocenter_district` VALUES (350902, '蕉城区', 3, 350900);
INSERT INTO `ocenter_district` VALUES (350921, '霞浦县', 3, 350900);
INSERT INTO `ocenter_district` VALUES (350922, '古田县', 3, 350900);
INSERT INTO `ocenter_district` VALUES (350923, '屏南县', 3, 350900);
INSERT INTO `ocenter_district` VALUES (350924, '寿宁县', 3, 350900);
INSERT INTO `ocenter_district` VALUES (350925, '周宁县', 3, 350900);
INSERT INTO `ocenter_district` VALUES (350926, '柘荣县', 3, 350900);
INSERT INTO `ocenter_district` VALUES (350981, '福安市', 3, 350900);
INSERT INTO `ocenter_district` VALUES (350982, '福鼎市', 3, 350900);
INSERT INTO `ocenter_district` VALUES (360101, '市辖区', 3, 360100);
INSERT INTO `ocenter_district` VALUES (360102, '东湖区', 3, 360100);
INSERT INTO `ocenter_district` VALUES (360103, '西湖区', 3, 360100);
INSERT INTO `ocenter_district` VALUES (360104, '青云谱区', 3, 360100);
INSERT INTO `ocenter_district` VALUES (360105, '湾里区', 3, 360100);
INSERT INTO `ocenter_district` VALUES (360111, '青山湖区', 3, 360100);
INSERT INTO `ocenter_district` VALUES (360121, '南昌县', 3, 360100);
INSERT INTO `ocenter_district` VALUES (360122, '新建县', 3, 360100);
INSERT INTO `ocenter_district` VALUES (360123, '安义县', 3, 360100);
INSERT INTO `ocenter_district` VALUES (360124, '进贤县', 3, 360100);
INSERT INTO `ocenter_district` VALUES (360201, '市辖区', 3, 360200);
INSERT INTO `ocenter_district` VALUES (360202, '昌江区', 3, 360200);
INSERT INTO `ocenter_district` VALUES (360203, '珠山区', 3, 360200);
INSERT INTO `ocenter_district` VALUES (360222, '浮梁县', 3, 360200);
INSERT INTO `ocenter_district` VALUES (360281, '乐平市', 3, 360200);
INSERT INTO `ocenter_district` VALUES (360301, '市辖区', 3, 360300);
INSERT INTO `ocenter_district` VALUES (360302, '安源区', 3, 360300);
INSERT INTO `ocenter_district` VALUES (360313, '湘东区', 3, 360300);
INSERT INTO `ocenter_district` VALUES (360321, '莲花县', 3, 360300);
INSERT INTO `ocenter_district` VALUES (360322, '上栗县', 3, 360300);
INSERT INTO `ocenter_district` VALUES (360323, '芦溪县', 3, 360300);
INSERT INTO `ocenter_district` VALUES (360401, '市辖区', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360402, '庐山区', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360403, '浔阳区', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360421, '九江县', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360423, '武宁县', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360424, '修水县', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360425, '永修县', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360426, '德安县', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360427, '星子县', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360428, '都昌县', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360429, '湖口县', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360430, '彭泽县', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360481, '瑞昌市', 3, 360400);
INSERT INTO `ocenter_district` VALUES (360501, '市辖区', 3, 360500);
INSERT INTO `ocenter_district` VALUES (360502, '渝水区', 3, 360500);
INSERT INTO `ocenter_district` VALUES (360521, '分宜县', 3, 360500);
INSERT INTO `ocenter_district` VALUES (360601, '市辖区', 3, 360600);
INSERT INTO `ocenter_district` VALUES (360602, '月湖区', 3, 360600);
INSERT INTO `ocenter_district` VALUES (360622, '余江县', 3, 360600);
INSERT INTO `ocenter_district` VALUES (360681, '贵溪市', 3, 360600);
INSERT INTO `ocenter_district` VALUES (360701, '市辖区', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360702, '章贡区', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360721, '赣　县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360722, '信丰县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360723, '大余县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360724, '上犹县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360725, '崇义县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360726, '安远县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360727, '龙南县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360728, '定南县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360729, '全南县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360730, '宁都县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360731, '于都县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360732, '兴国县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360733, '会昌县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360734, '寻乌县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360735, '石城县', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360781, '瑞金市', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360782, '南康市', 3, 360700);
INSERT INTO `ocenter_district` VALUES (360801, '市辖区', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360802, '吉州区', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360803, '青原区', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360821, '吉安县', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360822, '吉水县', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360823, '峡江县', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360824, '新干县', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360825, '永丰县', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360826, '泰和县', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360827, '遂川县', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360828, '万安县', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360829, '安福县', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360830, '永新县', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360881, '井冈山市', 3, 360800);
INSERT INTO `ocenter_district` VALUES (360901, '市辖区', 3, 360900);
INSERT INTO `ocenter_district` VALUES (360902, '袁州区', 3, 360900);
INSERT INTO `ocenter_district` VALUES (360921, '奉新县', 3, 360900);
INSERT INTO `ocenter_district` VALUES (360922, '万载县', 3, 360900);
INSERT INTO `ocenter_district` VALUES (360923, '上高县', 3, 360900);
INSERT INTO `ocenter_district` VALUES (360924, '宜丰县', 3, 360900);
INSERT INTO `ocenter_district` VALUES (360925, '靖安县', 3, 360900);
INSERT INTO `ocenter_district` VALUES (360926, '铜鼓县', 3, 360900);
INSERT INTO `ocenter_district` VALUES (360981, '丰城市', 3, 360900);
INSERT INTO `ocenter_district` VALUES (360982, '樟树市', 3, 360900);
INSERT INTO `ocenter_district` VALUES (360983, '高安市', 3, 360900);
INSERT INTO `ocenter_district` VALUES (361001, '市辖区', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361002, '临川区', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361021, '南城县', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361022, '黎川县', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361023, '南丰县', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361024, '崇仁县', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361025, '乐安县', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361026, '宜黄县', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361027, '金溪县', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361028, '资溪县', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361029, '东乡县', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361030, '广昌县', 3, 361000);
INSERT INTO `ocenter_district` VALUES (361101, '市辖区', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361102, '信州区', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361121, '上饶县', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361122, '广丰县', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361123, '玉山县', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361124, '铅山县', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361125, '横峰县', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361126, '弋阳县', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361127, '余干县', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361128, '鄱阳县', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361129, '万年县', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361130, '婺源县', 3, 361100);
INSERT INTO `ocenter_district` VALUES (361181, '德兴市', 3, 361100);
INSERT INTO `ocenter_district` VALUES (370101, '市辖区', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370102, '历下区', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370103, '市中区', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370104, '槐荫区', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370105, '天桥区', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370112, '历城区', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370113, '长清区', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370124, '平阴县', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370125, '济阳县', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370126, '商河县', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370181, '章丘市', 3, 370100);
INSERT INTO `ocenter_district` VALUES (370201, '市辖区', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370202, '市南区', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370203, '市北区', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370205, '四方区', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370211, '黄岛区', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370212, '崂山区', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370213, '李沧区', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370214, '城阳区', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370281, '胶州市', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370282, '即墨市', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370283, '平度市', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370284, '胶南市', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370285, '莱西市', 3, 370200);
INSERT INTO `ocenter_district` VALUES (370301, '市辖区', 3, 370300);
INSERT INTO `ocenter_district` VALUES (370302, '淄川区', 3, 370300);
INSERT INTO `ocenter_district` VALUES (370303, '张店区', 3, 370300);
INSERT INTO `ocenter_district` VALUES (370304, '博山区', 3, 370300);
INSERT INTO `ocenter_district` VALUES (370305, '临淄区', 3, 370300);
INSERT INTO `ocenter_district` VALUES (370306, '周村区', 3, 370300);
INSERT INTO `ocenter_district` VALUES (370321, '桓台县', 3, 370300);
INSERT INTO `ocenter_district` VALUES (370322, '高青县', 3, 370300);
INSERT INTO `ocenter_district` VALUES (370323, '沂源县', 3, 370300);
INSERT INTO `ocenter_district` VALUES (370401, '市辖区', 3, 370400);
INSERT INTO `ocenter_district` VALUES (370402, '市中区', 3, 370400);
INSERT INTO `ocenter_district` VALUES (370403, '薛城区', 3, 370400);
INSERT INTO `ocenter_district` VALUES (370404, '峄城区', 3, 370400);
INSERT INTO `ocenter_district` VALUES (370405, '台儿庄区', 3, 370400);
INSERT INTO `ocenter_district` VALUES (370406, '山亭区', 3, 370400);
INSERT INTO `ocenter_district` VALUES (370481, '滕州市', 3, 370400);
INSERT INTO `ocenter_district` VALUES (370501, '市辖区', 3, 370500);
INSERT INTO `ocenter_district` VALUES (370502, '东营区', 3, 370500);
INSERT INTO `ocenter_district` VALUES (370503, '河口区', 3, 370500);
INSERT INTO `ocenter_district` VALUES (370521, '垦利县', 3, 370500);
INSERT INTO `ocenter_district` VALUES (370522, '利津县', 3, 370500);
INSERT INTO `ocenter_district` VALUES (370523, '广饶县', 3, 370500);
INSERT INTO `ocenter_district` VALUES (370601, '市辖区', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370602, '芝罘区', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370611, '福山区', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370612, '牟平区', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370613, '莱山区', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370634, '长岛县', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370681, '龙口市', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370682, '莱阳市', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370683, '莱州市', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370684, '蓬莱市', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370685, '招远市', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370686, '栖霞市', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370687, '海阳市', 3, 370600);
INSERT INTO `ocenter_district` VALUES (370701, '市辖区', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370702, '潍城区', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370703, '寒亭区', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370704, '坊子区', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370705, '奎文区', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370724, '临朐县', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370725, '昌乐县', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370781, '青州市', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370782, '诸城市', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370783, '寿光市', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370784, '安丘市', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370785, '高密市', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370786, '昌邑市', 3, 370700);
INSERT INTO `ocenter_district` VALUES (370801, '市辖区', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370802, '市中区', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370811, '任城区', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370826, '微山县', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370827, '鱼台县', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370828, '金乡县', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370829, '嘉祥县', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370830, '汶上县', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370831, '泗水县', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370832, '梁山县', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370881, '曲阜市', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370882, '兖州市', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370883, '邹城市', 3, 370800);
INSERT INTO `ocenter_district` VALUES (370901, '市辖区', 3, 370900);
INSERT INTO `ocenter_district` VALUES (370902, '泰山区', 3, 370900);
INSERT INTO `ocenter_district` VALUES (370903, '岱岳区', 3, 370900);
INSERT INTO `ocenter_district` VALUES (370921, '宁阳县', 3, 370900);
INSERT INTO `ocenter_district` VALUES (370923, '东平县', 3, 370900);
INSERT INTO `ocenter_district` VALUES (370982, '新泰市', 3, 370900);
INSERT INTO `ocenter_district` VALUES (370983, '肥城市', 3, 370900);
INSERT INTO `ocenter_district` VALUES (371001, '市辖区', 3, 371000);
INSERT INTO `ocenter_district` VALUES (371002, '环翠区', 3, 371000);
INSERT INTO `ocenter_district` VALUES (371081, '文登市', 3, 371000);
INSERT INTO `ocenter_district` VALUES (371082, '荣成市', 3, 371000);
INSERT INTO `ocenter_district` VALUES (371083, '乳山市', 3, 371000);
INSERT INTO `ocenter_district` VALUES (371101, '市辖区', 3, 371100);
INSERT INTO `ocenter_district` VALUES (371102, '东港区', 3, 371100);
INSERT INTO `ocenter_district` VALUES (371103, '岚山区', 3, 371100);
INSERT INTO `ocenter_district` VALUES (371121, '五莲县', 3, 371100);
INSERT INTO `ocenter_district` VALUES (371122, '莒　县', 3, 371100);
INSERT INTO `ocenter_district` VALUES (371201, '市辖区', 3, 371200);
INSERT INTO `ocenter_district` VALUES (371202, '莱城区', 3, 371200);
INSERT INTO `ocenter_district` VALUES (371203, '钢城区', 3, 371200);
INSERT INTO `ocenter_district` VALUES (371301, '市辖区', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371302, '兰山区', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371311, '罗庄区', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371312, '河东区', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371321, '沂南县', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371322, '郯城县', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371323, '沂水县', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371324, '苍山县', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371325, '费　县', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371326, '平邑县', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371327, '莒南县', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371328, '蒙阴县', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371329, '临沭县', 3, 371300);
INSERT INTO `ocenter_district` VALUES (371401, '市辖区', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371402, '德城区', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371421, '陵　县', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371422, '宁津县', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371423, '庆云县', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371424, '临邑县', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371425, '齐河县', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371426, '平原县', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371427, '夏津县', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371428, '武城县', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371481, '乐陵市', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371482, '禹城市', 3, 371400);
INSERT INTO `ocenter_district` VALUES (371501, '市辖区', 3, 371500);
INSERT INTO `ocenter_district` VALUES (371502, '东昌府区', 3, 371500);
INSERT INTO `ocenter_district` VALUES (371521, '阳谷县', 3, 371500);
INSERT INTO `ocenter_district` VALUES (371522, '莘　县', 3, 371500);
INSERT INTO `ocenter_district` VALUES (371523, '茌平县', 3, 371500);
INSERT INTO `ocenter_district` VALUES (371524, '东阿县', 3, 371500);
INSERT INTO `ocenter_district` VALUES (371525, '冠　县', 3, 371500);
INSERT INTO `ocenter_district` VALUES (371526, '高唐县', 3, 371500);
INSERT INTO `ocenter_district` VALUES (371581, '临清市', 3, 371500);
INSERT INTO `ocenter_district` VALUES (371601, '市辖区', 3, 371600);
INSERT INTO `ocenter_district` VALUES (371602, '滨城区', 3, 371600);
INSERT INTO `ocenter_district` VALUES (371621, '惠民县', 3, 371600);
INSERT INTO `ocenter_district` VALUES (371622, '阳信县', 3, 371600);
INSERT INTO `ocenter_district` VALUES (371623, '无棣县', 3, 371600);
INSERT INTO `ocenter_district` VALUES (371624, '沾化县', 3, 371600);
INSERT INTO `ocenter_district` VALUES (371625, '博兴县', 3, 371600);
INSERT INTO `ocenter_district` VALUES (371626, '邹平县', 3, 371600);
INSERT INTO `ocenter_district` VALUES (371701, '市辖区', 3, 371700);
INSERT INTO `ocenter_district` VALUES (371702, '牡丹区', 3, 371700);
INSERT INTO `ocenter_district` VALUES (371721, '曹　县', 3, 371700);
INSERT INTO `ocenter_district` VALUES (371722, '单　县', 3, 371700);
INSERT INTO `ocenter_district` VALUES (371723, '成武县', 3, 371700);
INSERT INTO `ocenter_district` VALUES (371724, '巨野县', 3, 371700);
INSERT INTO `ocenter_district` VALUES (371725, '郓城县', 3, 371700);
INSERT INTO `ocenter_district` VALUES (371726, '鄄城县', 3, 371700);
INSERT INTO `ocenter_district` VALUES (371727, '定陶县', 3, 371700);
INSERT INTO `ocenter_district` VALUES (371728, '东明县', 3, 371700);
INSERT INTO `ocenter_district` VALUES (410101, '市辖区', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410102, '中原区', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410103, '二七区', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410104, '管城回族区', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410105, '金水区', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410106, '上街区', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410108, '邙山区', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410122, '中牟县', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410181, '巩义市', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410182, '荥阳市', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410183, '新密市', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410184, '新郑市', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410185, '登封市', 3, 410100);
INSERT INTO `ocenter_district` VALUES (410201, '市辖区', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410202, '龙亭区', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410203, '顺河回族区', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410204, '鼓楼区', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410205, '南关区', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410211, '郊　区', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410221, '杞　县', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410222, '通许县', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410223, '尉氏县', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410224, '开封县', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410225, '兰考县', 3, 410200);
INSERT INTO `ocenter_district` VALUES (410301, '市辖区', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410302, '老城区', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410303, '西工区', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410304, '廛河回族区', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410305, '涧西区', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410306, '吉利区', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410307, '洛龙区', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410322, '孟津县', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410323, '新安县', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410324, '栾川县', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410325, '嵩　县', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410326, '汝阳县', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410327, '宜阳县', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410328, '洛宁县', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410329, '伊川县', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410381, '偃师市', 3, 410300);
INSERT INTO `ocenter_district` VALUES (410401, '市辖区', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410402, '新华区', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410403, '卫东区', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410404, '石龙区', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410411, '湛河区', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410421, '宝丰县', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410422, '叶　县', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410423, '鲁山县', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410425, '郏　县', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410481, '舞钢市', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410482, '汝州市', 3, 410400);
INSERT INTO `ocenter_district` VALUES (410501, '市辖区', 3, 410500);
INSERT INTO `ocenter_district` VALUES (410502, '文峰区', 3, 410500);
INSERT INTO `ocenter_district` VALUES (410503, '北关区', 3, 410500);
INSERT INTO `ocenter_district` VALUES (410505, '殷都区', 3, 410500);
INSERT INTO `ocenter_district` VALUES (410506, '龙安区', 3, 410500);
INSERT INTO `ocenter_district` VALUES (410522, '安阳县', 3, 410500);
INSERT INTO `ocenter_district` VALUES (410523, '汤阴县', 3, 410500);
INSERT INTO `ocenter_district` VALUES (410526, '滑　县', 3, 410500);
INSERT INTO `ocenter_district` VALUES (410527, '内黄县', 3, 410500);
INSERT INTO `ocenter_district` VALUES (410581, '林州市', 3, 410500);
INSERT INTO `ocenter_district` VALUES (410601, '市辖区', 3, 410600);
INSERT INTO `ocenter_district` VALUES (410602, '鹤山区', 3, 410600);
INSERT INTO `ocenter_district` VALUES (410603, '山城区', 3, 410600);
INSERT INTO `ocenter_district` VALUES (410611, '淇滨区', 3, 410600);
INSERT INTO `ocenter_district` VALUES (410621, '浚　县', 3, 410600);
INSERT INTO `ocenter_district` VALUES (410622, '淇　县', 3, 410600);
INSERT INTO `ocenter_district` VALUES (410701, '市辖区', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410702, '红旗区', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410703, '卫滨区', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410704, '凤泉区', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410711, '牧野区', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410721, '新乡县', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410724, '获嘉县', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410725, '原阳县', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410726, '延津县', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410727, '封丘县', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410728, '长垣县', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410781, '卫辉市', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410782, '辉县市', 3, 410700);
INSERT INTO `ocenter_district` VALUES (410801, '市辖区', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410802, '解放区', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410803, '中站区', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410804, '马村区', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410811, '山阳区', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410821, '修武县', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410822, '博爱县', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410823, '武陟县', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410825, '温　县', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410881, '济源市', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410882, '沁阳市', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410883, '孟州市', 3, 410800);
INSERT INTO `ocenter_district` VALUES (410901, '市辖区', 3, 410900);
INSERT INTO `ocenter_district` VALUES (410902, '华龙区', 3, 410900);
INSERT INTO `ocenter_district` VALUES (410922, '清丰县', 3, 410900);
INSERT INTO `ocenter_district` VALUES (410923, '南乐县', 3, 410900);
INSERT INTO `ocenter_district` VALUES (410926, '范　县', 3, 410900);
INSERT INTO `ocenter_district` VALUES (410927, '台前县', 3, 410900);
INSERT INTO `ocenter_district` VALUES (410928, '濮阳县', 3, 410900);
INSERT INTO `ocenter_district` VALUES (411001, '市辖区', 3, 411000);
INSERT INTO `ocenter_district` VALUES (411002, '魏都区', 3, 411000);
INSERT INTO `ocenter_district` VALUES (411023, '许昌县', 3, 411000);
INSERT INTO `ocenter_district` VALUES (411024, '鄢陵县', 3, 411000);
INSERT INTO `ocenter_district` VALUES (411025, '襄城县', 3, 411000);
INSERT INTO `ocenter_district` VALUES (411081, '禹州市', 3, 411000);
INSERT INTO `ocenter_district` VALUES (411082, '长葛市', 3, 411000);
INSERT INTO `ocenter_district` VALUES (411101, '市辖区', 3, 411100);
INSERT INTO `ocenter_district` VALUES (411102, '源汇区', 3, 411100);
INSERT INTO `ocenter_district` VALUES (411103, '郾城区', 3, 411100);
INSERT INTO `ocenter_district` VALUES (411104, '召陵区', 3, 411100);
INSERT INTO `ocenter_district` VALUES (411121, '舞阳县', 3, 411100);
INSERT INTO `ocenter_district` VALUES (411122, '临颍县', 3, 411100);
INSERT INTO `ocenter_district` VALUES (411201, '市辖区', 3, 411200);
INSERT INTO `ocenter_district` VALUES (411202, '湖滨区', 3, 411200);
INSERT INTO `ocenter_district` VALUES (411221, '渑池县', 3, 411200);
INSERT INTO `ocenter_district` VALUES (411222, '陕　县', 3, 411200);
INSERT INTO `ocenter_district` VALUES (411224, '卢氏县', 3, 411200);
INSERT INTO `ocenter_district` VALUES (411281, '义马市', 3, 411200);
INSERT INTO `ocenter_district` VALUES (411282, '灵宝市', 3, 411200);
INSERT INTO `ocenter_district` VALUES (411301, '市辖区', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411302, '宛城区', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411303, '卧龙区', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411321, '南召县', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411322, '方城县', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411323, '西峡县', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411324, '镇平县', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411325, '内乡县', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411326, '淅川县', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411327, '社旗县', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411328, '唐河县', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411329, '新野县', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411330, '桐柏县', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411381, '邓州市', 3, 411300);
INSERT INTO `ocenter_district` VALUES (411401, '市辖区', 3, 411400);
INSERT INTO `ocenter_district` VALUES (411402, '梁园区', 3, 411400);
INSERT INTO `ocenter_district` VALUES (411403, '睢阳区', 3, 411400);
INSERT INTO `ocenter_district` VALUES (411421, '民权县', 3, 411400);
INSERT INTO `ocenter_district` VALUES (411422, '睢　县', 3, 411400);
INSERT INTO `ocenter_district` VALUES (411423, '宁陵县', 3, 411400);
INSERT INTO `ocenter_district` VALUES (411424, '柘城县', 3, 411400);
INSERT INTO `ocenter_district` VALUES (411425, '虞城县', 3, 411400);
INSERT INTO `ocenter_district` VALUES (411426, '夏邑县', 3, 411400);
INSERT INTO `ocenter_district` VALUES (411481, '永城市', 3, 411400);
INSERT INTO `ocenter_district` VALUES (411501, '市辖区', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411502, '师河区', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411503, '平桥区', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411521, '罗山县', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411522, '光山县', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411523, '新　县', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411524, '商城县', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411525, '固始县', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411526, '潢川县', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411527, '淮滨县', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411528, '息　县', 3, 411500);
INSERT INTO `ocenter_district` VALUES (411601, '市辖区', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411602, '川汇区', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411621, '扶沟县', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411622, '西华县', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411623, '商水县', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411624, '沈丘县', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411625, '郸城县', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411626, '淮阳县', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411627, '太康县', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411628, '鹿邑县', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411681, '项城市', 3, 411600);
INSERT INTO `ocenter_district` VALUES (411701, '市辖区', 3, 411700);
INSERT INTO `ocenter_district` VALUES (411702, '驿城区', 3, 411700);
INSERT INTO `ocenter_district` VALUES (411721, '西平县', 3, 411700);
INSERT INTO `ocenter_district` VALUES (411722, '上蔡县', 3, 411700);
INSERT INTO `ocenter_district` VALUES (411723, '平舆县', 3, 411700);
INSERT INTO `ocenter_district` VALUES (411724, '正阳县', 3, 411700);
INSERT INTO `ocenter_district` VALUES (411725, '确山县', 3, 411700);
INSERT INTO `ocenter_district` VALUES (411726, '泌阳县', 3, 411700);
INSERT INTO `ocenter_district` VALUES (411727, '汝南县', 3, 411700);
INSERT INTO `ocenter_district` VALUES (411728, '遂平县', 3, 411700);
INSERT INTO `ocenter_district` VALUES (411729, '新蔡县', 3, 411700);
INSERT INTO `ocenter_district` VALUES (420101, '市辖区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420102, '江岸区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420103, '江汉区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420104, '乔口区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420105, '汉阳区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420106, '武昌区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420107, '青山区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420111, '洪山区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420112, '东西湖区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420113, '汉南区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420114, '蔡甸区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420115, '江夏区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420116, '黄陂区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420117, '新洲区', 3, 420100);
INSERT INTO `ocenter_district` VALUES (420201, '市辖区', 3, 420200);
INSERT INTO `ocenter_district` VALUES (420202, '黄石港区', 3, 420200);
INSERT INTO `ocenter_district` VALUES (420203, '西塞山区', 3, 420200);
INSERT INTO `ocenter_district` VALUES (420204, '下陆区', 3, 420200);
INSERT INTO `ocenter_district` VALUES (420205, '铁山区', 3, 420200);
INSERT INTO `ocenter_district` VALUES (420222, '阳新县', 3, 420200);
INSERT INTO `ocenter_district` VALUES (420281, '大冶市', 3, 420200);
INSERT INTO `ocenter_district` VALUES (420301, '市辖区', 3, 420300);
INSERT INTO `ocenter_district` VALUES (420302, '茅箭区', 3, 420300);
INSERT INTO `ocenter_district` VALUES (420303, '张湾区', 3, 420300);
INSERT INTO `ocenter_district` VALUES (420321, '郧　县', 3, 420300);
INSERT INTO `ocenter_district` VALUES (420322, '郧西县', 3, 420300);
INSERT INTO `ocenter_district` VALUES (420323, '竹山县', 3, 420300);
INSERT INTO `ocenter_district` VALUES (420324, '竹溪县', 3, 420300);
INSERT INTO `ocenter_district` VALUES (420325, '房　县', 3, 420300);
INSERT INTO `ocenter_district` VALUES (420381, '丹江口市', 3, 420300);
INSERT INTO `ocenter_district` VALUES (420501, '市辖区', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420502, '西陵区', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420503, '伍家岗区', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420504, '点军区', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420505, '猇亭区', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420506, '夷陵区', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420525, '远安县', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420526, '兴山县', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420527, '秭归县', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420528, '长阳土家族自治县', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420529, '五峰土家族自治县', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420581, '宜都市', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420582, '当阳市', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420583, '枝江市', 3, 420500);
INSERT INTO `ocenter_district` VALUES (420601, '市辖区', 3, 420600);
INSERT INTO `ocenter_district` VALUES (420602, '襄城区', 3, 420600);
INSERT INTO `ocenter_district` VALUES (420606, '樊城区', 3, 420600);
INSERT INTO `ocenter_district` VALUES (420607, '襄阳区', 3, 420600);
INSERT INTO `ocenter_district` VALUES (420624, '南漳县', 3, 420600);
INSERT INTO `ocenter_district` VALUES (420625, '谷城县', 3, 420600);
INSERT INTO `ocenter_district` VALUES (420626, '保康县', 3, 420600);
INSERT INTO `ocenter_district` VALUES (420682, '老河口市', 3, 420600);
INSERT INTO `ocenter_district` VALUES (420683, '枣阳市', 3, 420600);
INSERT INTO `ocenter_district` VALUES (420684, '宜城市', 3, 420600);
INSERT INTO `ocenter_district` VALUES (420701, '市辖区', 3, 420700);
INSERT INTO `ocenter_district` VALUES (420702, '梁子湖区', 3, 420700);
INSERT INTO `ocenter_district` VALUES (420703, '华容区', 3, 420700);
INSERT INTO `ocenter_district` VALUES (420704, '鄂城区', 3, 420700);
INSERT INTO `ocenter_district` VALUES (420801, '市辖区', 3, 420800);
INSERT INTO `ocenter_district` VALUES (420802, '东宝区', 3, 420800);
INSERT INTO `ocenter_district` VALUES (420804, '掇刀区', 3, 420800);
INSERT INTO `ocenter_district` VALUES (420821, '京山县', 3, 420800);
INSERT INTO `ocenter_district` VALUES (420822, '沙洋县', 3, 420800);
INSERT INTO `ocenter_district` VALUES (420881, '钟祥市', 3, 420800);
INSERT INTO `ocenter_district` VALUES (420901, '市辖区', 3, 420900);
INSERT INTO `ocenter_district` VALUES (420902, '孝南区', 3, 420900);
INSERT INTO `ocenter_district` VALUES (420921, '孝昌县', 3, 420900);
INSERT INTO `ocenter_district` VALUES (420922, '大悟县', 3, 420900);
INSERT INTO `ocenter_district` VALUES (420923, '云梦县', 3, 420900);
INSERT INTO `ocenter_district` VALUES (420981, '应城市', 3, 420900);
INSERT INTO `ocenter_district` VALUES (420982, '安陆市', 3, 420900);
INSERT INTO `ocenter_district` VALUES (420984, '汉川市', 3, 420900);
INSERT INTO `ocenter_district` VALUES (421001, '市辖区', 3, 421000);
INSERT INTO `ocenter_district` VALUES (421002, '沙市区', 3, 421000);
INSERT INTO `ocenter_district` VALUES (421003, '荆州区', 3, 421000);
INSERT INTO `ocenter_district` VALUES (421022, '公安县', 3, 421000);
INSERT INTO `ocenter_district` VALUES (421023, '监利县', 3, 421000);
INSERT INTO `ocenter_district` VALUES (421024, '江陵县', 3, 421000);
INSERT INTO `ocenter_district` VALUES (421081, '石首市', 3, 421000);
INSERT INTO `ocenter_district` VALUES (421083, '洪湖市', 3, 421000);
INSERT INTO `ocenter_district` VALUES (421087, '松滋市', 3, 421000);
INSERT INTO `ocenter_district` VALUES (421101, '市辖区', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421102, '黄州区', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421121, '团风县', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421122, '红安县', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421123, '罗田县', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421124, '英山县', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421125, '浠水县', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421126, '蕲春县', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421127, '黄梅县', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421181, '麻城市', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421182, '武穴市', 3, 421100);
INSERT INTO `ocenter_district` VALUES (421201, '市辖区', 3, 421200);
INSERT INTO `ocenter_district` VALUES (421202, '咸安区', 3, 421200);
INSERT INTO `ocenter_district` VALUES (421221, '嘉鱼县', 3, 421200);
INSERT INTO `ocenter_district` VALUES (421222, '通城县', 3, 421200);
INSERT INTO `ocenter_district` VALUES (421223, '崇阳县', 3, 421200);
INSERT INTO `ocenter_district` VALUES (421224, '通山县', 3, 421200);
INSERT INTO `ocenter_district` VALUES (421281, '赤壁市', 3, 421200);
INSERT INTO `ocenter_district` VALUES (421301, '市辖区', 3, 421300);
INSERT INTO `ocenter_district` VALUES (421302, '曾都区', 3, 421300);
INSERT INTO `ocenter_district` VALUES (421381, '广水市', 3, 421300);
INSERT INTO `ocenter_district` VALUES (422801, '恩施市', 3, 422800);
INSERT INTO `ocenter_district` VALUES (422802, '利川市', 3, 422800);
INSERT INTO `ocenter_district` VALUES (422822, '建始县', 3, 422800);
INSERT INTO `ocenter_district` VALUES (422823, '巴东县', 3, 422800);
INSERT INTO `ocenter_district` VALUES (422825, '宣恩县', 3, 422800);
INSERT INTO `ocenter_district` VALUES (422826, '咸丰县', 3, 422800);
INSERT INTO `ocenter_district` VALUES (422827, '来凤县', 3, 422800);
INSERT INTO `ocenter_district` VALUES (422828, '鹤峰县', 3, 422800);
INSERT INTO `ocenter_district` VALUES (429004, '仙桃市', 3, 429000);
INSERT INTO `ocenter_district` VALUES (429005, '潜江市', 3, 429000);
INSERT INTO `ocenter_district` VALUES (429006, '天门市', 3, 429000);
INSERT INTO `ocenter_district` VALUES (429021, '神农架林区', 3, 429000);
INSERT INTO `ocenter_district` VALUES (430101, '市辖区', 3, 430100);
INSERT INTO `ocenter_district` VALUES (430102, '芙蓉区', 3, 430100);
INSERT INTO `ocenter_district` VALUES (430103, '天心区', 3, 430100);
INSERT INTO `ocenter_district` VALUES (430104, '岳麓区', 3, 430100);
INSERT INTO `ocenter_district` VALUES (430105, '开福区', 3, 430100);
INSERT INTO `ocenter_district` VALUES (430111, '雨花区', 3, 430100);
INSERT INTO `ocenter_district` VALUES (430121, '长沙县', 3, 430100);
INSERT INTO `ocenter_district` VALUES (430122, '望城县', 3, 430100);
INSERT INTO `ocenter_district` VALUES (430124, '宁乡县', 3, 430100);
INSERT INTO `ocenter_district` VALUES (430181, '浏阳市', 3, 430100);
INSERT INTO `ocenter_district` VALUES (430201, '市辖区', 3, 430200);
INSERT INTO `ocenter_district` VALUES (430202, '荷塘区', 3, 430200);
INSERT INTO `ocenter_district` VALUES (430203, '芦淞区', 3, 430200);
INSERT INTO `ocenter_district` VALUES (430204, '石峰区', 3, 430200);
INSERT INTO `ocenter_district` VALUES (430211, '天元区', 3, 430200);
INSERT INTO `ocenter_district` VALUES (430221, '株洲县', 3, 430200);
INSERT INTO `ocenter_district` VALUES (430223, '攸　县', 3, 430200);
INSERT INTO `ocenter_district` VALUES (430224, '茶陵县', 3, 430200);
INSERT INTO `ocenter_district` VALUES (430225, '炎陵县', 3, 430200);
INSERT INTO `ocenter_district` VALUES (430281, '醴陵市', 3, 430200);
INSERT INTO `ocenter_district` VALUES (430301, '市辖区', 3, 430300);
INSERT INTO `ocenter_district` VALUES (430302, '雨湖区', 3, 430300);
INSERT INTO `ocenter_district` VALUES (430304, '岳塘区', 3, 430300);
INSERT INTO `ocenter_district` VALUES (430321, '湘潭县', 3, 430300);
INSERT INTO `ocenter_district` VALUES (430381, '湘乡市', 3, 430300);
INSERT INTO `ocenter_district` VALUES (430382, '韶山市', 3, 430300);
INSERT INTO `ocenter_district` VALUES (430401, '市辖区', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430405, '珠晖区', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430406, '雁峰区', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430407, '石鼓区', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430408, '蒸湘区', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430412, '南岳区', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430421, '衡阳县', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430422, '衡南县', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430423, '衡山县', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430424, '衡东县', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430426, '祁东县', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430481, '耒阳市', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430482, '常宁市', 3, 430400);
INSERT INTO `ocenter_district` VALUES (430501, '市辖区', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430502, '双清区', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430503, '大祥区', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430511, '北塔区', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430521, '邵东县', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430522, '新邵县', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430523, '邵阳县', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430524, '隆回县', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430525, '洞口县', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430527, '绥宁县', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430528, '新宁县', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430529, '城步苗族自治县', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430581, '武冈市', 3, 430500);
INSERT INTO `ocenter_district` VALUES (430601, '市辖区', 3, 430600);
INSERT INTO `ocenter_district` VALUES (430602, '岳阳楼区', 3, 430600);
INSERT INTO `ocenter_district` VALUES (430603, '云溪区', 3, 430600);
INSERT INTO `ocenter_district` VALUES (430611, '君山区', 3, 430600);
INSERT INTO `ocenter_district` VALUES (430621, '岳阳县', 3, 430600);
INSERT INTO `ocenter_district` VALUES (430623, '华容县', 3, 430600);
INSERT INTO `ocenter_district` VALUES (430624, '湘阴县', 3, 430600);
INSERT INTO `ocenter_district` VALUES (430626, '平江县', 3, 430600);
INSERT INTO `ocenter_district` VALUES (430681, '汨罗市', 3, 430600);
INSERT INTO `ocenter_district` VALUES (430682, '临湘市', 3, 430600);
INSERT INTO `ocenter_district` VALUES (430701, '市辖区', 3, 430700);
INSERT INTO `ocenter_district` VALUES (430702, '武陵区', 3, 430700);
INSERT INTO `ocenter_district` VALUES (430703, '鼎城区', 3, 430700);
INSERT INTO `ocenter_district` VALUES (430721, '安乡县', 3, 430700);
INSERT INTO `ocenter_district` VALUES (430722, '汉寿县', 3, 430700);
INSERT INTO `ocenter_district` VALUES (430723, '澧　县', 3, 430700);
INSERT INTO `ocenter_district` VALUES (430724, '临澧县', 3, 430700);
INSERT INTO `ocenter_district` VALUES (430725, '桃源县', 3, 430700);
INSERT INTO `ocenter_district` VALUES (430726, '石门县', 3, 430700);
INSERT INTO `ocenter_district` VALUES (430781, '津市市', 3, 430700);
INSERT INTO `ocenter_district` VALUES (430801, '市辖区', 3, 430800);
INSERT INTO `ocenter_district` VALUES (430802, '永定区', 3, 430800);
INSERT INTO `ocenter_district` VALUES (430811, '武陵源区', 3, 430800);
INSERT INTO `ocenter_district` VALUES (430821, '慈利县', 3, 430800);
INSERT INTO `ocenter_district` VALUES (430822, '桑植县', 3, 430800);
INSERT INTO `ocenter_district` VALUES (430901, '市辖区', 3, 430900);
INSERT INTO `ocenter_district` VALUES (430902, '资阳区', 3, 430900);
INSERT INTO `ocenter_district` VALUES (430903, '赫山区', 3, 430900);
INSERT INTO `ocenter_district` VALUES (430921, '南　县', 3, 430900);
INSERT INTO `ocenter_district` VALUES (430922, '桃江县', 3, 430900);
INSERT INTO `ocenter_district` VALUES (430923, '安化县', 3, 430900);
INSERT INTO `ocenter_district` VALUES (430981, '沅江市', 3, 430900);
INSERT INTO `ocenter_district` VALUES (431001, '市辖区', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431002, '北湖区', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431003, '苏仙区', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431021, '桂阳县', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431022, '宜章县', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431023, '永兴县', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431024, '嘉禾县', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431025, '临武县', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431026, '汝城县', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431027, '桂东县', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431028, '安仁县', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431081, '资兴市', 3, 431000);
INSERT INTO `ocenter_district` VALUES (431101, '市辖区', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431102, '芝山区', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431103, '冷水滩区', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431121, '祁阳县', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431122, '东安县', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431123, '双牌县', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431124, '道　县', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431125, '江永县', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431126, '宁远县', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431127, '蓝山县', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431128, '新田县', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431129, '江华瑶族自治县', 3, 431100);
INSERT INTO `ocenter_district` VALUES (431201, '市辖区', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431202, '鹤城区', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431221, '中方县', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431222, '沅陵县', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431223, '辰溪县', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431224, '溆浦县', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431225, '会同县', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431226, '麻阳苗族自治县', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431227, '新晃侗族自治县', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431228, '芷江侗族自治县', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431229, '靖州苗族侗族自治县', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431230, '通道侗族自治县', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431281, '洪江市', 3, 431200);
INSERT INTO `ocenter_district` VALUES (431301, '市辖区', 3, 431300);
INSERT INTO `ocenter_district` VALUES (431302, '娄星区', 3, 431300);
INSERT INTO `ocenter_district` VALUES (431321, '双峰县', 3, 431300);
INSERT INTO `ocenter_district` VALUES (431322, '新化县', 3, 431300);
INSERT INTO `ocenter_district` VALUES (431381, '冷水江市', 3, 431300);
INSERT INTO `ocenter_district` VALUES (431382, '涟源市', 3, 431300);
INSERT INTO `ocenter_district` VALUES (433101, '吉首市', 3, 433100);
INSERT INTO `ocenter_district` VALUES (433122, '泸溪县', 3, 433100);
INSERT INTO `ocenter_district` VALUES (433123, '凤凰县', 3, 433100);
INSERT INTO `ocenter_district` VALUES (433124, '花垣县', 3, 433100);
INSERT INTO `ocenter_district` VALUES (433125, '保靖县', 3, 433100);
INSERT INTO `ocenter_district` VALUES (433126, '古丈县', 3, 433100);
INSERT INTO `ocenter_district` VALUES (433127, '永顺县', 3, 433100);
INSERT INTO `ocenter_district` VALUES (433130, '龙山县', 3, 433100);
INSERT INTO `ocenter_district` VALUES (440101, '市辖区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440102, '东山区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440103, '荔湾区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440104, '越秀区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440105, '海珠区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440106, '天河区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440107, '芳村区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440111, '白云区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440112, '黄埔区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440113, '番禺区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440114, '花都区', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440183, '增城市', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440184, '从化市', 3, 440100);
INSERT INTO `ocenter_district` VALUES (440201, '市辖区', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440203, '武江区', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440204, '浈江区', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440205, '曲江区', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440222, '始兴县', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440224, '仁化县', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440229, '翁源县', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440232, '乳源瑶族自治县', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440233, '新丰县', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440281, '乐昌市', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440282, '南雄市', 3, 440200);
INSERT INTO `ocenter_district` VALUES (440301, '市辖区', 3, 440300);
INSERT INTO `ocenter_district` VALUES (440303, '罗湖区', 3, 440300);
INSERT INTO `ocenter_district` VALUES (440304, '福田区', 3, 440300);
INSERT INTO `ocenter_district` VALUES (440305, '南山区', 3, 440300);
INSERT INTO `ocenter_district` VALUES (440306, '宝安区', 3, 440300);
INSERT INTO `ocenter_district` VALUES (440307, '龙岗区', 3, 440300);
INSERT INTO `ocenter_district` VALUES (440308, '盐田区', 3, 440300);
INSERT INTO `ocenter_district` VALUES (440401, '市辖区', 3, 440400);
INSERT INTO `ocenter_district` VALUES (440402, '香洲区', 3, 440400);
INSERT INTO `ocenter_district` VALUES (440403, '斗门区', 3, 440400);
INSERT INTO `ocenter_district` VALUES (440404, '金湾区', 3, 440400);
INSERT INTO `ocenter_district` VALUES (440501, '市辖区', 3, 440500);
INSERT INTO `ocenter_district` VALUES (440507, '龙湖区', 3, 440500);
INSERT INTO `ocenter_district` VALUES (440511, '金平区', 3, 440500);
INSERT INTO `ocenter_district` VALUES (440512, '濠江区', 3, 440500);
INSERT INTO `ocenter_district` VALUES (440513, '潮阳区', 3, 440500);
INSERT INTO `ocenter_district` VALUES (440514, '潮南区', 3, 440500);
INSERT INTO `ocenter_district` VALUES (440515, '澄海区', 3, 440500);
INSERT INTO `ocenter_district` VALUES (440523, '南澳县', 3, 440500);
INSERT INTO `ocenter_district` VALUES (440601, '市辖区', 3, 440600);
INSERT INTO `ocenter_district` VALUES (440604, '禅城区', 3, 440600);
INSERT INTO `ocenter_district` VALUES (440605, '南海区', 3, 440600);
INSERT INTO `ocenter_district` VALUES (440606, '顺德区', 3, 440600);
INSERT INTO `ocenter_district` VALUES (440607, '三水区', 3, 440600);
INSERT INTO `ocenter_district` VALUES (440608, '高明区', 3, 440600);
INSERT INTO `ocenter_district` VALUES (440701, '市辖区', 3, 440700);
INSERT INTO `ocenter_district` VALUES (440703, '蓬江区', 3, 440700);
INSERT INTO `ocenter_district` VALUES (440704, '江海区', 3, 440700);
INSERT INTO `ocenter_district` VALUES (440705, '新会区', 3, 440700);
INSERT INTO `ocenter_district` VALUES (440781, '台山市', 3, 440700);
INSERT INTO `ocenter_district` VALUES (440783, '开平市', 3, 440700);
INSERT INTO `ocenter_district` VALUES (440784, '鹤山市', 3, 440700);
INSERT INTO `ocenter_district` VALUES (440785, '恩平市', 3, 440700);
INSERT INTO `ocenter_district` VALUES (440801, '市辖区', 3, 440800);
INSERT INTO `ocenter_district` VALUES (440802, '赤坎区', 3, 440800);
INSERT INTO `ocenter_district` VALUES (440803, '霞山区', 3, 440800);
INSERT INTO `ocenter_district` VALUES (440804, '坡头区', 3, 440800);
INSERT INTO `ocenter_district` VALUES (440811, '麻章区', 3, 440800);
INSERT INTO `ocenter_district` VALUES (440823, '遂溪县', 3, 440800);
INSERT INTO `ocenter_district` VALUES (440825, '徐闻县', 3, 440800);
INSERT INTO `ocenter_district` VALUES (440881, '廉江市', 3, 440800);
INSERT INTO `ocenter_district` VALUES (440882, '雷州市', 3, 440800);
INSERT INTO `ocenter_district` VALUES (440883, '吴川市', 3, 440800);
INSERT INTO `ocenter_district` VALUES (440901, '市辖区', 3, 440900);
INSERT INTO `ocenter_district` VALUES (440902, '茂南区', 3, 440900);
INSERT INTO `ocenter_district` VALUES (440903, '茂港区', 3, 440900);
INSERT INTO `ocenter_district` VALUES (440923, '电白县', 3, 440900);
INSERT INTO `ocenter_district` VALUES (440981, '高州市', 3, 440900);
INSERT INTO `ocenter_district` VALUES (440982, '化州市', 3, 440900);
INSERT INTO `ocenter_district` VALUES (440983, '信宜市', 3, 440900);
INSERT INTO `ocenter_district` VALUES (441201, '市辖区', 3, 441200);
INSERT INTO `ocenter_district` VALUES (441202, '端州区', 3, 441200);
INSERT INTO `ocenter_district` VALUES (441203, '鼎湖区', 3, 441200);
INSERT INTO `ocenter_district` VALUES (441223, '广宁县', 3, 441200);
INSERT INTO `ocenter_district` VALUES (441224, '怀集县', 3, 441200);
INSERT INTO `ocenter_district` VALUES (441225, '封开县', 3, 441200);
INSERT INTO `ocenter_district` VALUES (441226, '德庆县', 3, 441200);
INSERT INTO `ocenter_district` VALUES (441283, '高要市', 3, 441200);
INSERT INTO `ocenter_district` VALUES (441284, '四会市', 3, 441200);
INSERT INTO `ocenter_district` VALUES (441301, '市辖区', 3, 441300);
INSERT INTO `ocenter_district` VALUES (441302, '惠城区', 3, 441300);
INSERT INTO `ocenter_district` VALUES (441303, '惠阳区', 3, 441300);
INSERT INTO `ocenter_district` VALUES (441322, '博罗县', 3, 441300);
INSERT INTO `ocenter_district` VALUES (441323, '惠东县', 3, 441300);
INSERT INTO `ocenter_district` VALUES (441324, '龙门县', 3, 441300);
INSERT INTO `ocenter_district` VALUES (441401, '市辖区', 3, 441400);
INSERT INTO `ocenter_district` VALUES (441402, '梅江区', 3, 441400);
INSERT INTO `ocenter_district` VALUES (441421, '梅　县', 3, 441400);
INSERT INTO `ocenter_district` VALUES (441422, '大埔县', 3, 441400);
INSERT INTO `ocenter_district` VALUES (441423, '丰顺县', 3, 441400);
INSERT INTO `ocenter_district` VALUES (441424, '五华县', 3, 441400);
INSERT INTO `ocenter_district` VALUES (441426, '平远县', 3, 441400);
INSERT INTO `ocenter_district` VALUES (441427, '蕉岭县', 3, 441400);
INSERT INTO `ocenter_district` VALUES (441481, '兴宁市', 3, 441400);
INSERT INTO `ocenter_district` VALUES (441501, '市辖区', 3, 441500);
INSERT INTO `ocenter_district` VALUES (441502, '城　区', 3, 441500);
INSERT INTO `ocenter_district` VALUES (441521, '海丰县', 3, 441500);
INSERT INTO `ocenter_district` VALUES (441523, '陆河县', 3, 441500);
INSERT INTO `ocenter_district` VALUES (441581, '陆丰市', 3, 441500);
INSERT INTO `ocenter_district` VALUES (441601, '市辖区', 3, 441600);
INSERT INTO `ocenter_district` VALUES (441602, '源城区', 3, 441600);
INSERT INTO `ocenter_district` VALUES (441621, '紫金县', 3, 441600);
INSERT INTO `ocenter_district` VALUES (441622, '龙川县', 3, 441600);
INSERT INTO `ocenter_district` VALUES (441623, '连平县', 3, 441600);
INSERT INTO `ocenter_district` VALUES (441624, '和平县', 3, 441600);
INSERT INTO `ocenter_district` VALUES (441625, '东源县', 3, 441600);
INSERT INTO `ocenter_district` VALUES (441701, '市辖区', 3, 441700);
INSERT INTO `ocenter_district` VALUES (441702, '江城区', 3, 441700);
INSERT INTO `ocenter_district` VALUES (441721, '阳西县', 3, 441700);
INSERT INTO `ocenter_district` VALUES (441723, '阳东县', 3, 441700);
INSERT INTO `ocenter_district` VALUES (441781, '阳春市', 3, 441700);
INSERT INTO `ocenter_district` VALUES (441801, '市辖区', 3, 441800);
INSERT INTO `ocenter_district` VALUES (441802, '清城区', 3, 441800);
INSERT INTO `ocenter_district` VALUES (441821, '佛冈县', 3, 441800);
INSERT INTO `ocenter_district` VALUES (441823, '阳山县', 3, 441800);
INSERT INTO `ocenter_district` VALUES (441825, '连山壮族瑶族自治县', 3, 441800);
INSERT INTO `ocenter_district` VALUES (441826, '连南瑶族自治县', 3, 441800);
INSERT INTO `ocenter_district` VALUES (441827, '清新县', 3, 441800);
INSERT INTO `ocenter_district` VALUES (441881, '英德市', 3, 441800);
INSERT INTO `ocenter_district` VALUES (441882, '连州市', 3, 441800);
INSERT INTO `ocenter_district` VALUES (445101, '市辖区', 3, 445100);
INSERT INTO `ocenter_district` VALUES (445102, '湘桥区', 3, 445100);
INSERT INTO `ocenter_district` VALUES (445121, '潮安县', 3, 445100);
INSERT INTO `ocenter_district` VALUES (445122, '饶平县', 3, 445100);
INSERT INTO `ocenter_district` VALUES (445201, '市辖区', 3, 445200);
INSERT INTO `ocenter_district` VALUES (445202, '榕城区', 3, 445200);
INSERT INTO `ocenter_district` VALUES (445221, '揭东县', 3, 445200);
INSERT INTO `ocenter_district` VALUES (445222, '揭西县', 3, 445200);
INSERT INTO `ocenter_district` VALUES (445224, '惠来县', 3, 445200);
INSERT INTO `ocenter_district` VALUES (445281, '普宁市', 3, 445200);
INSERT INTO `ocenter_district` VALUES (445301, '市辖区', 3, 445300);
INSERT INTO `ocenter_district` VALUES (445302, '云城区', 3, 445300);
INSERT INTO `ocenter_district` VALUES (445321, '新兴县', 3, 445300);
INSERT INTO `ocenter_district` VALUES (445322, '郁南县', 3, 445300);
INSERT INTO `ocenter_district` VALUES (445323, '云安县', 3, 445300);
INSERT INTO `ocenter_district` VALUES (445381, '罗定市', 3, 445300);
INSERT INTO `ocenter_district` VALUES (450101, '市辖区', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450102, '兴宁区', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450103, '青秀区', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450105, '江南区', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450107, '西乡塘区', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450108, '良庆区', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450109, '邕宁区', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450122, '武鸣县', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450123, '隆安县', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450124, '马山县', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450125, '上林县', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450126, '宾阳县', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450127, '横　县', 3, 450100);
INSERT INTO `ocenter_district` VALUES (450201, '市辖区', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450202, '城中区', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450203, '鱼峰区', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450204, '柳南区', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450205, '柳北区', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450221, '柳江县', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450222, '柳城县', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450223, '鹿寨县', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450224, '融安县', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450225, '融水苗族自治县', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450226, '三江侗族自治县', 3, 450200);
INSERT INTO `ocenter_district` VALUES (450301, '市辖区', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450302, '秀峰区', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450303, '叠彩区', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450304, '象山区', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450305, '七星区', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450311, '雁山区', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450321, '阳朔县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450322, '临桂县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450323, '灵川县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450324, '全州县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450325, '兴安县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450326, '永福县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450327, '灌阳县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450328, '龙胜各族自治县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450329, '资源县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450330, '平乐县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450331, '荔蒲县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450332, '恭城瑶族自治县', 3, 450300);
INSERT INTO `ocenter_district` VALUES (450401, '市辖区', 3, 450400);
INSERT INTO `ocenter_district` VALUES (450403, '万秀区', 3, 450400);
INSERT INTO `ocenter_district` VALUES (450404, '蝶山区', 3, 450400);
INSERT INTO `ocenter_district` VALUES (450405, '长洲区', 3, 450400);
INSERT INTO `ocenter_district` VALUES (450421, '苍梧县', 3, 450400);
INSERT INTO `ocenter_district` VALUES (450422, '藤　县', 3, 450400);
INSERT INTO `ocenter_district` VALUES (450423, '蒙山县', 3, 450400);
INSERT INTO `ocenter_district` VALUES (450481, '岑溪市', 3, 450400);
INSERT INTO `ocenter_district` VALUES (450501, '市辖区', 3, 450500);
INSERT INTO `ocenter_district` VALUES (450502, '海城区', 3, 450500);
INSERT INTO `ocenter_district` VALUES (450503, '银海区', 3, 450500);
INSERT INTO `ocenter_district` VALUES (450512, '铁山港区', 3, 450500);
INSERT INTO `ocenter_district` VALUES (450521, '合浦县', 3, 450500);
INSERT INTO `ocenter_district` VALUES (450601, '市辖区', 3, 450600);
INSERT INTO `ocenter_district` VALUES (450602, '港口区', 3, 450600);
INSERT INTO `ocenter_district` VALUES (450603, '防城区', 3, 450600);
INSERT INTO `ocenter_district` VALUES (450621, '上思县', 3, 450600);
INSERT INTO `ocenter_district` VALUES (450681, '东兴市', 3, 450600);
INSERT INTO `ocenter_district` VALUES (450701, '市辖区', 3, 450700);
INSERT INTO `ocenter_district` VALUES (450702, '钦南区', 3, 450700);
INSERT INTO `ocenter_district` VALUES (450703, '钦北区', 3, 450700);
INSERT INTO `ocenter_district` VALUES (450721, '灵山县', 3, 450700);
INSERT INTO `ocenter_district` VALUES (450722, '浦北县', 3, 450700);
INSERT INTO `ocenter_district` VALUES (450801, '市辖区', 3, 450800);
INSERT INTO `ocenter_district` VALUES (450802, '港北区', 3, 450800);
INSERT INTO `ocenter_district` VALUES (450803, '港南区', 3, 450800);
INSERT INTO `ocenter_district` VALUES (450804, '覃塘区', 3, 450800);
INSERT INTO `ocenter_district` VALUES (450821, '平南县', 3, 450800);
INSERT INTO `ocenter_district` VALUES (450881, '桂平市', 3, 450800);
INSERT INTO `ocenter_district` VALUES (450901, '市辖区', 3, 450900);
INSERT INTO `ocenter_district` VALUES (450902, '玉州区', 3, 450900);
INSERT INTO `ocenter_district` VALUES (450921, '容　县', 3, 450900);
INSERT INTO `ocenter_district` VALUES (450922, '陆川县', 3, 450900);
INSERT INTO `ocenter_district` VALUES (450923, '博白县', 3, 450900);
INSERT INTO `ocenter_district` VALUES (450924, '兴业县', 3, 450900);
INSERT INTO `ocenter_district` VALUES (450981, '北流市', 3, 450900);
INSERT INTO `ocenter_district` VALUES (451001, '市辖区', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451002, '右江区', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451021, '田阳县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451022, '田东县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451023, '平果县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451024, '德保县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451025, '靖西县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451026, '那坡县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451027, '凌云县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451028, '乐业县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451029, '田林县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451030, '西林县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451031, '隆林各族自治县', 3, 451000);
INSERT INTO `ocenter_district` VALUES (451101, '市辖区', 3, 451100);
INSERT INTO `ocenter_district` VALUES (451102, '八步区', 3, 451100);
INSERT INTO `ocenter_district` VALUES (451121, '昭平县', 3, 451100);
INSERT INTO `ocenter_district` VALUES (451122, '钟山县', 3, 451100);
INSERT INTO `ocenter_district` VALUES (451123, '富川瑶族自治县', 3, 451100);
INSERT INTO `ocenter_district` VALUES (451201, '市辖区', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451202, '金城江区', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451221, '南丹县', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451222, '天峨县', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451223, '凤山县', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451224, '东兰县', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451225, '罗城仫佬族自治县', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451226, '环江毛南族自治县', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451227, '巴马瑶族自治县', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451228, '都安瑶族自治县', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451229, '大化瑶族自治县', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451281, '宜州市', 3, 451200);
INSERT INTO `ocenter_district` VALUES (451301, '市辖区', 3, 451300);
INSERT INTO `ocenter_district` VALUES (451302, '兴宾区', 3, 451300);
INSERT INTO `ocenter_district` VALUES (451321, '忻城县', 3, 451300);
INSERT INTO `ocenter_district` VALUES (451322, '象州县', 3, 451300);
INSERT INTO `ocenter_district` VALUES (451323, '武宣县', 3, 451300);
INSERT INTO `ocenter_district` VALUES (451324, '金秀瑶族自治县', 3, 451300);
INSERT INTO `ocenter_district` VALUES (451381, '合山市', 3, 451300);
INSERT INTO `ocenter_district` VALUES (451401, '市辖区', 3, 451400);
INSERT INTO `ocenter_district` VALUES (451402, '江洲区', 3, 451400);
INSERT INTO `ocenter_district` VALUES (451421, '扶绥县', 3, 451400);
INSERT INTO `ocenter_district` VALUES (451422, '宁明县', 3, 451400);
INSERT INTO `ocenter_district` VALUES (451423, '龙州县', 3, 451400);
INSERT INTO `ocenter_district` VALUES (451424, '大新县', 3, 451400);
INSERT INTO `ocenter_district` VALUES (451425, '天等县', 3, 451400);
INSERT INTO `ocenter_district` VALUES (451481, '凭祥市', 3, 451400);
INSERT INTO `ocenter_district` VALUES (460101, '市辖区', 3, 460100);
INSERT INTO `ocenter_district` VALUES (460105, '秀英区', 3, 460100);
INSERT INTO `ocenter_district` VALUES (460106, '龙华区', 3, 460100);
INSERT INTO `ocenter_district` VALUES (460107, '琼山区', 3, 460100);
INSERT INTO `ocenter_district` VALUES (460108, '美兰区', 3, 460100);
INSERT INTO `ocenter_district` VALUES (460201, '市辖区', 3, 460200);
INSERT INTO `ocenter_district` VALUES (469001, '五指山市', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469002, '琼海市', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469003, '儋州市', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469005, '文昌市', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469006, '万宁市', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469007, '东方市', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469025, '定安县', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469026, '屯昌县', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469027, '澄迈县', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469028, '临高县', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469030, '白沙黎族自治县', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469031, '昌江黎族自治县', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469033, '乐东黎族自治县', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469034, '陵水黎族自治县', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469035, '保亭黎族苗族自治县', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469036, '琼中黎族苗族自治县', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469037, '西沙群岛', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469038, '南沙群岛', 3, 469000);
INSERT INTO `ocenter_district` VALUES (469039, '中沙群岛的岛礁及其海域', 3, 469000);
INSERT INTO `ocenter_district` VALUES (500101, '万州区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500102, '涪陵区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500103, '渝中区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500104, '大渡口区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500105, '江北区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500106, '沙坪坝区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500107, '九龙坡区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500108, '南岸区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500109, '北碚区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500110, '万盛区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500111, '双桥区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500112, '渝北区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500113, '巴南区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500114, '黔江区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500115, '长寿区', 3, 500100);
INSERT INTO `ocenter_district` VALUES (500222, '綦江县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500223, '潼南县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500224, '铜梁县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500225, '大足县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500226, '荣昌县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500227, '璧山县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500228, '梁平县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500229, '城口县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500230, '丰都县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500231, '垫江县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500232, '武隆县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500233, '忠　县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500234, '开　县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500235, '云阳县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500236, '奉节县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500237, '巫山县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500238, '巫溪县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500240, '石柱土家族自治县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500241, '秀山土家族苗族自治县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500242, '酉阳土家族苗族自治县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500243, '彭水苗族土家族自治县', 3, 500200);
INSERT INTO `ocenter_district` VALUES (500381, '江津市', 3, 500300);
INSERT INTO `ocenter_district` VALUES (500382, '合川市', 3, 500300);
INSERT INTO `ocenter_district` VALUES (500383, '永川市', 3, 500300);
INSERT INTO `ocenter_district` VALUES (500384, '南川市', 3, 500300);
INSERT INTO `ocenter_district` VALUES (510101, '市辖区', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510104, '锦江区', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510105, '青羊区', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510106, '金牛区', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510107, '武侯区', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510108, '成华区', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510112, '龙泉驿区', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510113, '青白江区', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510114, '新都区', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510115, '温江区', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510121, '金堂县', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510122, '双流县', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510124, '郫　县', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510129, '大邑县', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510131, '蒲江县', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510132, '新津县', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510181, '都江堰市', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510182, '彭州市', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510183, '邛崃市', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510184, '崇州市', 3, 510100);
INSERT INTO `ocenter_district` VALUES (510301, '市辖区', 3, 510300);
INSERT INTO `ocenter_district` VALUES (510302, '自流井区', 3, 510300);
INSERT INTO `ocenter_district` VALUES (510303, '贡井区', 3, 510300);
INSERT INTO `ocenter_district` VALUES (510304, '大安区', 3, 510300);
INSERT INTO `ocenter_district` VALUES (510311, '沿滩区', 3, 510300);
INSERT INTO `ocenter_district` VALUES (510321, '荣　县', 3, 510300);
INSERT INTO `ocenter_district` VALUES (510322, '富顺县', 3, 510300);
INSERT INTO `ocenter_district` VALUES (510401, '市辖区', 3, 510400);
INSERT INTO `ocenter_district` VALUES (510402, '东　区', 3, 510400);
INSERT INTO `ocenter_district` VALUES (510403, '西　区', 3, 510400);
INSERT INTO `ocenter_district` VALUES (510411, '仁和区', 3, 510400);
INSERT INTO `ocenter_district` VALUES (510421, '米易县', 3, 510400);
INSERT INTO `ocenter_district` VALUES (510422, '盐边县', 3, 510400);
INSERT INTO `ocenter_district` VALUES (510501, '市辖区', 3, 510500);
INSERT INTO `ocenter_district` VALUES (510502, '江阳区', 3, 510500);
INSERT INTO `ocenter_district` VALUES (510503, '纳溪区', 3, 510500);
INSERT INTO `ocenter_district` VALUES (510504, '龙马潭区', 3, 510500);
INSERT INTO `ocenter_district` VALUES (510521, '泸　县', 3, 510500);
INSERT INTO `ocenter_district` VALUES (510522, '合江县', 3, 510500);
INSERT INTO `ocenter_district` VALUES (510524, '叙永县', 3, 510500);
INSERT INTO `ocenter_district` VALUES (510525, '古蔺县', 3, 510500);
INSERT INTO `ocenter_district` VALUES (510601, '市辖区', 3, 510600);
INSERT INTO `ocenter_district` VALUES (510603, '旌阳区', 3, 510600);
INSERT INTO `ocenter_district` VALUES (510623, '中江县', 3, 510600);
INSERT INTO `ocenter_district` VALUES (510626, '罗江县', 3, 510600);
INSERT INTO `ocenter_district` VALUES (510681, '广汉市', 3, 510600);
INSERT INTO `ocenter_district` VALUES (510682, '什邡市', 3, 510600);
INSERT INTO `ocenter_district` VALUES (510683, '绵竹市', 3, 510600);
INSERT INTO `ocenter_district` VALUES (510701, '市辖区', 3, 510700);
INSERT INTO `ocenter_district` VALUES (510703, '涪城区', 3, 510700);
INSERT INTO `ocenter_district` VALUES (510704, '游仙区', 3, 510700);
INSERT INTO `ocenter_district` VALUES (510722, '三台县', 3, 510700);
INSERT INTO `ocenter_district` VALUES (510723, '盐亭县', 3, 510700);
INSERT INTO `ocenter_district` VALUES (510724, '安　县', 3, 510700);
INSERT INTO `ocenter_district` VALUES (510725, '梓潼县', 3, 510700);
INSERT INTO `ocenter_district` VALUES (510726, '北川羌族自治县', 3, 510700);
INSERT INTO `ocenter_district` VALUES (510727, '平武县', 3, 510700);
INSERT INTO `ocenter_district` VALUES (510781, '江油市', 3, 510700);
INSERT INTO `ocenter_district` VALUES (510801, '市辖区', 3, 510800);
INSERT INTO `ocenter_district` VALUES (510802, '市中区', 3, 510800);
INSERT INTO `ocenter_district` VALUES (510811, '元坝区', 3, 510800);
INSERT INTO `ocenter_district` VALUES (510812, '朝天区', 3, 510800);
INSERT INTO `ocenter_district` VALUES (510821, '旺苍县', 3, 510800);
INSERT INTO `ocenter_district` VALUES (510822, '青川县', 3, 510800);
INSERT INTO `ocenter_district` VALUES (510823, '剑阁县', 3, 510800);
INSERT INTO `ocenter_district` VALUES (510824, '苍溪县', 3, 510800);
INSERT INTO `ocenter_district` VALUES (510901, '市辖区', 3, 510900);
INSERT INTO `ocenter_district` VALUES (510903, '船山区', 3, 510900);
INSERT INTO `ocenter_district` VALUES (510904, '安居区', 3, 510900);
INSERT INTO `ocenter_district` VALUES (510921, '蓬溪县', 3, 510900);
INSERT INTO `ocenter_district` VALUES (510922, '射洪县', 3, 510900);
INSERT INTO `ocenter_district` VALUES (510923, '大英县', 3, 510900);
INSERT INTO `ocenter_district` VALUES (511001, '市辖区', 3, 511000);
INSERT INTO `ocenter_district` VALUES (511002, '市中区', 3, 511000);
INSERT INTO `ocenter_district` VALUES (511011, '东兴区', 3, 511000);
INSERT INTO `ocenter_district` VALUES (511024, '威远县', 3, 511000);
INSERT INTO `ocenter_district` VALUES (511025, '资中县', 3, 511000);
INSERT INTO `ocenter_district` VALUES (511028, '隆昌县', 3, 511000);
INSERT INTO `ocenter_district` VALUES (511101, '市辖区', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511102, '市中区', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511111, '沙湾区', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511112, '五通桥区', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511113, '金口河区', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511123, '犍为县', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511124, '井研县', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511126, '夹江县', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511129, '沐川县', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511132, '峨边彝族自治县', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511133, '马边彝族自治县', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511181, '峨眉山市', 3, 511100);
INSERT INTO `ocenter_district` VALUES (511301, '市辖区', 3, 511300);
INSERT INTO `ocenter_district` VALUES (511302, '顺庆区', 3, 511300);
INSERT INTO `ocenter_district` VALUES (511303, '高坪区', 3, 511300);
INSERT INTO `ocenter_district` VALUES (511304, '嘉陵区', 3, 511300);
INSERT INTO `ocenter_district` VALUES (511321, '南部县', 3, 511300);
INSERT INTO `ocenter_district` VALUES (511322, '营山县', 3, 511300);
INSERT INTO `ocenter_district` VALUES (511323, '蓬安县', 3, 511300);
INSERT INTO `ocenter_district` VALUES (511324, '仪陇县', 3, 511300);
INSERT INTO `ocenter_district` VALUES (511325, '西充县', 3, 511300);
INSERT INTO `ocenter_district` VALUES (511381, '阆中市', 3, 511300);
INSERT INTO `ocenter_district` VALUES (511401, '市辖区', 3, 511400);
INSERT INTO `ocenter_district` VALUES (511402, '东坡区', 3, 511400);
INSERT INTO `ocenter_district` VALUES (511421, '仁寿县', 3, 511400);
INSERT INTO `ocenter_district` VALUES (511422, '彭山县', 3, 511400);
INSERT INTO `ocenter_district` VALUES (511423, '洪雅县', 3, 511400);
INSERT INTO `ocenter_district` VALUES (511424, '丹棱县', 3, 511400);
INSERT INTO `ocenter_district` VALUES (511425, '青神县', 3, 511400);
INSERT INTO `ocenter_district` VALUES (511501, '市辖区', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511502, '翠屏区', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511521, '宜宾县', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511522, '南溪县', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511523, '江安县', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511524, '长宁县', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511525, '高　县', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511526, '珙　县', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511527, '筠连县', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511528, '兴文县', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511529, '屏山县', 3, 511500);
INSERT INTO `ocenter_district` VALUES (511601, '市辖区', 3, 511600);
INSERT INTO `ocenter_district` VALUES (511602, '广安区', 3, 511600);
INSERT INTO `ocenter_district` VALUES (511621, '岳池县', 3, 511600);
INSERT INTO `ocenter_district` VALUES (511622, '武胜县', 3, 511600);
INSERT INTO `ocenter_district` VALUES (511623, '邻水县', 3, 511600);
INSERT INTO `ocenter_district` VALUES (511681, '华莹市', 3, 511600);
INSERT INTO `ocenter_district` VALUES (511701, '市辖区', 3, 511700);
INSERT INTO `ocenter_district` VALUES (511702, '通川区', 3, 511700);
INSERT INTO `ocenter_district` VALUES (511721, '达　县', 3, 511700);
INSERT INTO `ocenter_district` VALUES (511722, '宣汉县', 3, 511700);
INSERT INTO `ocenter_district` VALUES (511723, '开江县', 3, 511700);
INSERT INTO `ocenter_district` VALUES (511724, '大竹县', 3, 511700);
INSERT INTO `ocenter_district` VALUES (511725, '渠　县', 3, 511700);
INSERT INTO `ocenter_district` VALUES (511781, '万源市', 3, 511700);
INSERT INTO `ocenter_district` VALUES (511801, '市辖区', 3, 511800);
INSERT INTO `ocenter_district` VALUES (511802, '雨城区', 3, 511800);
INSERT INTO `ocenter_district` VALUES (511821, '名山县', 3, 511800);
INSERT INTO `ocenter_district` VALUES (511822, '荥经县', 3, 511800);
INSERT INTO `ocenter_district` VALUES (511823, '汉源县', 3, 511800);
INSERT INTO `ocenter_district` VALUES (511824, '石棉县', 3, 511800);
INSERT INTO `ocenter_district` VALUES (511825, '天全县', 3, 511800);
INSERT INTO `ocenter_district` VALUES (511826, '芦山县', 3, 511800);
INSERT INTO `ocenter_district` VALUES (511827, '宝兴县', 3, 511800);
INSERT INTO `ocenter_district` VALUES (511901, '市辖区', 3, 511900);
INSERT INTO `ocenter_district` VALUES (511902, '巴州区', 3, 511900);
INSERT INTO `ocenter_district` VALUES (511921, '通江县', 3, 511900);
INSERT INTO `ocenter_district` VALUES (511922, '南江县', 3, 511900);
INSERT INTO `ocenter_district` VALUES (511923, '平昌县', 3, 511900);
INSERT INTO `ocenter_district` VALUES (512001, '市辖区', 3, 512000);
INSERT INTO `ocenter_district` VALUES (512002, '雁江区', 3, 512000);
INSERT INTO `ocenter_district` VALUES (512021, '安岳县', 3, 512000);
INSERT INTO `ocenter_district` VALUES (512022, '乐至县', 3, 512000);
INSERT INTO `ocenter_district` VALUES (512081, '简阳市', 3, 512000);
INSERT INTO `ocenter_district` VALUES (513221, '汶川县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513222, '理　县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513223, '茂　县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513224, '松潘县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513225, '九寨沟县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513226, '金川县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513227, '小金县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513228, '黑水县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513229, '马尔康县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513230, '壤塘县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513231, '阿坝县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513232, '若尔盖县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513233, '红原县', 3, 513200);
INSERT INTO `ocenter_district` VALUES (513321, '康定县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513322, '泸定县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513323, '丹巴县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513324, '九龙县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513325, '雅江县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513326, '道孚县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513327, '炉霍县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513328, '甘孜县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513329, '新龙县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513330, '德格县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513331, '白玉县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513332, '石渠县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513333, '色达县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513334, '理塘县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513335, '巴塘县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513336, '乡城县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513337, '稻城县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513338, '得荣县', 3, 513300);
INSERT INTO `ocenter_district` VALUES (513401, '西昌市', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513422, '木里藏族自治县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513423, '盐源县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513424, '德昌县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513425, '会理县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513426, '会东县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513427, '宁南县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513428, '普格县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513429, '布拖县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513430, '金阳县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513431, '昭觉县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513432, '喜德县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513433, '冕宁县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513434, '越西县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513435, '甘洛县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513436, '美姑县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (513437, '雷波县', 3, 513400);
INSERT INTO `ocenter_district` VALUES (520101, '市辖区', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520102, '南明区', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520103, '云岩区', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520111, '花溪区', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520112, '乌当区', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520113, '白云区', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520114, '小河区', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520121, '开阳县', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520122, '息烽县', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520123, '修文县', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520181, '清镇市', 3, 520100);
INSERT INTO `ocenter_district` VALUES (520201, '钟山区', 3, 520200);
INSERT INTO `ocenter_district` VALUES (520203, '六枝特区', 3, 520200);
INSERT INTO `ocenter_district` VALUES (520221, '水城县', 3, 520200);
INSERT INTO `ocenter_district` VALUES (520222, '盘　县', 3, 520200);
INSERT INTO `ocenter_district` VALUES (520301, '市辖区', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520302, '红花岗区', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520303, '汇川区', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520321, '遵义县', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520322, '桐梓县', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520323, '绥阳县', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520324, '正安县', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520325, '道真仡佬族苗族自治县', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520326, '务川仡佬族苗族自治县', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520327, '凤冈县', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520328, '湄潭县', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520329, '余庆县', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520330, '习水县', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520381, '赤水市', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520382, '仁怀市', 3, 520300);
INSERT INTO `ocenter_district` VALUES (520401, '市辖区', 3, 520400);
INSERT INTO `ocenter_district` VALUES (520402, '西秀区', 3, 520400);
INSERT INTO `ocenter_district` VALUES (520421, '平坝县', 3, 520400);
INSERT INTO `ocenter_district` VALUES (520422, '普定县', 3, 520400);
INSERT INTO `ocenter_district` VALUES (520423, '镇宁布依族苗族自治县', 3, 520400);
INSERT INTO `ocenter_district` VALUES (520424, '关岭布依族苗族自治县', 3, 520400);
INSERT INTO `ocenter_district` VALUES (520425, '紫云苗族布依族自治县', 3, 520400);
INSERT INTO `ocenter_district` VALUES (522201, '铜仁市', 3, 522200);
INSERT INTO `ocenter_district` VALUES (522222, '江口县', 3, 522200);
INSERT INTO `ocenter_district` VALUES (522223, '玉屏侗族自治县', 3, 522200);
INSERT INTO `ocenter_district` VALUES (522224, '石阡县', 3, 522200);
INSERT INTO `ocenter_district` VALUES (522225, '思南县', 3, 522200);
INSERT INTO `ocenter_district` VALUES (522226, '印江土家族苗族自治县', 3, 522200);
INSERT INTO `ocenter_district` VALUES (522227, '德江县', 3, 522200);
INSERT INTO `ocenter_district` VALUES (522228, '沿河土家族自治县', 3, 522200);
INSERT INTO `ocenter_district` VALUES (522229, '松桃苗族自治县', 3, 522200);
INSERT INTO `ocenter_district` VALUES (522230, '万山特区', 3, 522200);
INSERT INTO `ocenter_district` VALUES (522301, '兴义市', 3, 522300);
INSERT INTO `ocenter_district` VALUES (522322, '兴仁县', 3, 522300);
INSERT INTO `ocenter_district` VALUES (522323, '普安县', 3, 522300);
INSERT INTO `ocenter_district` VALUES (522324, '晴隆县', 3, 522300);
INSERT INTO `ocenter_district` VALUES (522325, '贞丰县', 3, 522300);
INSERT INTO `ocenter_district` VALUES (522326, '望谟县', 3, 522300);
INSERT INTO `ocenter_district` VALUES (522327, '册亨县', 3, 522300);
INSERT INTO `ocenter_district` VALUES (522328, '安龙县', 3, 522300);
INSERT INTO `ocenter_district` VALUES (522401, '毕节市', 3, 522400);
INSERT INTO `ocenter_district` VALUES (522422, '大方县', 3, 522400);
INSERT INTO `ocenter_district` VALUES (522423, '黔西县', 3, 522400);
INSERT INTO `ocenter_district` VALUES (522424, '金沙县', 3, 522400);
INSERT INTO `ocenter_district` VALUES (522425, '织金县', 3, 522400);
INSERT INTO `ocenter_district` VALUES (522426, '纳雍县', 3, 522400);
INSERT INTO `ocenter_district` VALUES (522427, '威宁彝族回族苗族自治县', 3, 522400);
INSERT INTO `ocenter_district` VALUES (522428, '赫章县', 3, 522400);
INSERT INTO `ocenter_district` VALUES (522601, '凯里市', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522622, '黄平县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522623, '施秉县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522624, '三穗县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522625, '镇远县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522626, '岑巩县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522627, '天柱县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522628, '锦屏县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522629, '剑河县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522630, '台江县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522631, '黎平县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522632, '榕江县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522633, '从江县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522634, '雷山县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522635, '麻江县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522636, '丹寨县', 3, 522600);
INSERT INTO `ocenter_district` VALUES (522701, '都匀市', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522702, '福泉市', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522722, '荔波县', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522723, '贵定县', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522725, '瓮安县', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522726, '独山县', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522727, '平塘县', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522728, '罗甸县', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522729, '长顺县', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522730, '龙里县', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522731, '惠水县', 3, 522700);
INSERT INTO `ocenter_district` VALUES (522732, '三都水族自治县', 3, 522700);
INSERT INTO `ocenter_district` VALUES (530101, '市辖区', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530102, '五华区', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530103, '盘龙区', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530111, '官渡区', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530112, '西山区', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530113, '东川区', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530121, '呈贡县', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530122, '晋宁县', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530124, '富民县', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530125, '宜良县', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530126, '石林彝族自治县', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530127, '嵩明县', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530128, '禄劝彝族苗族自治县', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530129, '寻甸回族彝族自治县', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530181, '安宁市', 3, 530100);
INSERT INTO `ocenter_district` VALUES (530301, '市辖区', 3, 530300);
INSERT INTO `ocenter_district` VALUES (530302, '麒麟区', 3, 530300);
INSERT INTO `ocenter_district` VALUES (530321, '马龙县', 3, 530300);
INSERT INTO `ocenter_district` VALUES (530322, '陆良县', 3, 530300);
INSERT INTO `ocenter_district` VALUES (530323, '师宗县', 3, 530300);
INSERT INTO `ocenter_district` VALUES (530324, '罗平县', 3, 530300);
INSERT INTO `ocenter_district` VALUES (530325, '富源县', 3, 530300);
INSERT INTO `ocenter_district` VALUES (530326, '会泽县', 3, 530300);
INSERT INTO `ocenter_district` VALUES (530328, '沾益县', 3, 530300);
INSERT INTO `ocenter_district` VALUES (530381, '宣威市', 3, 530300);
INSERT INTO `ocenter_district` VALUES (530401, '市辖区', 3, 530400);
INSERT INTO `ocenter_district` VALUES (530402, '红塔区', 3, 530400);
INSERT INTO `ocenter_district` VALUES (530421, '江川县', 3, 530400);
INSERT INTO `ocenter_district` VALUES (530422, '澄江县', 3, 530400);
INSERT INTO `ocenter_district` VALUES (530423, '通海县', 3, 530400);
INSERT INTO `ocenter_district` VALUES (530424, '华宁县', 3, 530400);
INSERT INTO `ocenter_district` VALUES (530425, '易门县', 3, 530400);
INSERT INTO `ocenter_district` VALUES (530426, '峨山彝族自治县', 3, 530400);
INSERT INTO `ocenter_district` VALUES (530427, '新平彝族傣族自治县', 3, 530400);
INSERT INTO `ocenter_district` VALUES (530428, '元江哈尼族彝族傣族自治县', 3, 530400);
INSERT INTO `ocenter_district` VALUES (530501, '市辖区', 3, 530500);
INSERT INTO `ocenter_district` VALUES (530502, '隆阳区', 3, 530500);
INSERT INTO `ocenter_district` VALUES (530521, '施甸县', 3, 530500);
INSERT INTO `ocenter_district` VALUES (530522, '腾冲县', 3, 530500);
INSERT INTO `ocenter_district` VALUES (530523, '龙陵县', 3, 530500);
INSERT INTO `ocenter_district` VALUES (530524, '昌宁县', 3, 530500);
INSERT INTO `ocenter_district` VALUES (530601, '市辖区', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530602, '昭阳区', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530621, '鲁甸县', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530622, '巧家县', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530623, '盐津县', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530624, '大关县', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530625, '永善县', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530626, '绥江县', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530627, '镇雄县', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530628, '彝良县', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530629, '威信县', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530630, '水富县', 3, 530600);
INSERT INTO `ocenter_district` VALUES (530701, '市辖区', 3, 530700);
INSERT INTO `ocenter_district` VALUES (530702, '古城区', 3, 530700);
INSERT INTO `ocenter_district` VALUES (530721, '玉龙纳西族自治县', 3, 530700);
INSERT INTO `ocenter_district` VALUES (530722, '永胜县', 3, 530700);
INSERT INTO `ocenter_district` VALUES (530723, '华坪县', 3, 530700);
INSERT INTO `ocenter_district` VALUES (530724, '宁蒗彝族自治县', 3, 530700);
INSERT INTO `ocenter_district` VALUES (530801, '市辖区', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530802, '翠云区', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530821, '普洱哈尼族彝族自治县', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530822, '墨江哈尼族自治县', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530823, '景东彝族自治县', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530824, '景谷傣族彝族自治县', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530825, '镇沅彝族哈尼族拉祜族自治县', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530826, '江城哈尼族彝族自治县', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530827, '孟连傣族拉祜族佤族自治县', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530828, '澜沧拉祜族自治县', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530829, '西盟佤族自治县', 3, 530800);
INSERT INTO `ocenter_district` VALUES (530901, '市辖区', 3, 530900);
INSERT INTO `ocenter_district` VALUES (530902, '临翔区', 3, 530900);
INSERT INTO `ocenter_district` VALUES (530921, '凤庆县', 3, 530900);
INSERT INTO `ocenter_district` VALUES (530922, '云　县', 3, 530900);
INSERT INTO `ocenter_district` VALUES (530923, '永德县', 3, 530900);
INSERT INTO `ocenter_district` VALUES (530924, '镇康县', 3, 530900);
INSERT INTO `ocenter_district` VALUES (530925, '双江拉祜族佤族布朗族傣族自治县', 3, 530900);
INSERT INTO `ocenter_district` VALUES (530926, '耿马傣族佤族自治县', 3, 530900);
INSERT INTO `ocenter_district` VALUES (530927, '沧源佤族自治县', 3, 530900);
INSERT INTO `ocenter_district` VALUES (532301, '楚雄市', 3, 532300);
INSERT INTO `ocenter_district` VALUES (532322, '双柏县', 3, 532300);
INSERT INTO `ocenter_district` VALUES (532323, '牟定县', 3, 532300);
INSERT INTO `ocenter_district` VALUES (532324, '南华县', 3, 532300);
INSERT INTO `ocenter_district` VALUES (532325, '姚安县', 3, 532300);
INSERT INTO `ocenter_district` VALUES (532326, '大姚县', 3, 532300);
INSERT INTO `ocenter_district` VALUES (532327, '永仁县', 3, 532300);
INSERT INTO `ocenter_district` VALUES (532328, '元谋县', 3, 532300);
INSERT INTO `ocenter_district` VALUES (532329, '武定县', 3, 532300);
INSERT INTO `ocenter_district` VALUES (532331, '禄丰县', 3, 532300);
INSERT INTO `ocenter_district` VALUES (532501, '个旧市', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532502, '开远市', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532522, '蒙自县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532523, '屏边苗族自治县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532524, '建水县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532525, '石屏县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532526, '弥勒县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532527, '泸西县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532528, '元阳县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532529, '红河县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532530, '金平苗族瑶族傣族自治县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532531, '绿春县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532532, '河口瑶族自治县', 3, 532500);
INSERT INTO `ocenter_district` VALUES (532621, '文山县', 3, 532600);
INSERT INTO `ocenter_district` VALUES (532622, '砚山县', 3, 532600);
INSERT INTO `ocenter_district` VALUES (532623, '西畴县', 3, 532600);
INSERT INTO `ocenter_district` VALUES (532624, '麻栗坡县', 3, 532600);
INSERT INTO `ocenter_district` VALUES (532625, '马关县', 3, 532600);
INSERT INTO `ocenter_district` VALUES (532626, '丘北县', 3, 532600);
INSERT INTO `ocenter_district` VALUES (532627, '广南县', 3, 532600);
INSERT INTO `ocenter_district` VALUES (532628, '富宁县', 3, 532600);
INSERT INTO `ocenter_district` VALUES (532801, '景洪市', 3, 532800);
INSERT INTO `ocenter_district` VALUES (532822, '勐海县', 3, 532800);
INSERT INTO `ocenter_district` VALUES (532823, '勐腊县', 3, 532800);
INSERT INTO `ocenter_district` VALUES (532901, '大理市', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532922, '漾濞彝族自治县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532923, '祥云县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532924, '宾川县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532925, '弥渡县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532926, '南涧彝族自治县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532927, '巍山彝族回族自治县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532928, '永平县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532929, '云龙县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532930, '洱源县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532931, '剑川县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (532932, '鹤庆县', 3, 532900);
INSERT INTO `ocenter_district` VALUES (533102, '瑞丽市', 3, 533100);
INSERT INTO `ocenter_district` VALUES (533103, '潞西市', 3, 533100);
INSERT INTO `ocenter_district` VALUES (533122, '梁河县', 3, 533100);
INSERT INTO `ocenter_district` VALUES (533123, '盈江县', 3, 533100);
INSERT INTO `ocenter_district` VALUES (533124, '陇川县', 3, 533100);
INSERT INTO `ocenter_district` VALUES (533321, '泸水县', 3, 533300);
INSERT INTO `ocenter_district` VALUES (533323, '福贡县', 3, 533300);
INSERT INTO `ocenter_district` VALUES (533324, '贡山独龙族怒族自治县', 3, 533300);
INSERT INTO `ocenter_district` VALUES (533325, '兰坪白族普米族自治县', 3, 533300);
INSERT INTO `ocenter_district` VALUES (533421, '香格里拉县', 3, 533400);
INSERT INTO `ocenter_district` VALUES (533422, '德钦县', 3, 533400);
INSERT INTO `ocenter_district` VALUES (533423, '维西傈僳族自治县', 3, 533400);
INSERT INTO `ocenter_district` VALUES (540101, '市辖区', 3, 540100);
INSERT INTO `ocenter_district` VALUES (540102, '城关区', 3, 540100);
INSERT INTO `ocenter_district` VALUES (540121, '林周县', 3, 540100);
INSERT INTO `ocenter_district` VALUES (540122, '当雄县', 3, 540100);
INSERT INTO `ocenter_district` VALUES (540123, '尼木县', 3, 540100);
INSERT INTO `ocenter_district` VALUES (540124, '曲水县', 3, 540100);
INSERT INTO `ocenter_district` VALUES (540125, '堆龙德庆县', 3, 540100);
INSERT INTO `ocenter_district` VALUES (540126, '达孜县', 3, 540100);
INSERT INTO `ocenter_district` VALUES (540127, '墨竹工卡县', 3, 540100);
INSERT INTO `ocenter_district` VALUES (542121, '昌都县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542122, '江达县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542123, '贡觉县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542124, '类乌齐县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542125, '丁青县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542126, '察雅县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542127, '八宿县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542128, '左贡县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542129, '芒康县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542132, '洛隆县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542133, '边坝县', 3, 542100);
INSERT INTO `ocenter_district` VALUES (542221, '乃东县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542222, '扎囊县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542223, '贡嘎县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542224, '桑日县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542225, '琼结县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542226, '曲松县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542227, '措美县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542228, '洛扎县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542229, '加查县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542231, '隆子县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542232, '错那县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542233, '浪卡子县', 3, 542200);
INSERT INTO `ocenter_district` VALUES (542301, '日喀则市', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542322, '南木林县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542323, '江孜县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542324, '定日县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542325, '萨迦县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542326, '拉孜县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542327, '昂仁县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542328, '谢通门县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542329, '白朗县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542330, '仁布县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542331, '康马县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542332, '定结县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542333, '仲巴县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542334, '亚东县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542335, '吉隆县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542336, '聂拉木县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542337, '萨嘎县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542338, '岗巴县', 3, 542300);
INSERT INTO `ocenter_district` VALUES (542421, '那曲县', 3, 542400);
INSERT INTO `ocenter_district` VALUES (542422, '嘉黎县', 3, 542400);
INSERT INTO `ocenter_district` VALUES (542423, '比如县', 3, 542400);
INSERT INTO `ocenter_district` VALUES (542424, '聂荣县', 3, 542400);
INSERT INTO `ocenter_district` VALUES (542425, '安多县', 3, 542400);
INSERT INTO `ocenter_district` VALUES (542426, '申扎县', 3, 542400);
INSERT INTO `ocenter_district` VALUES (542427, '索　县', 3, 542400);
INSERT INTO `ocenter_district` VALUES (542428, '班戈县', 3, 542400);
INSERT INTO `ocenter_district` VALUES (542429, '巴青县', 3, 542400);
INSERT INTO `ocenter_district` VALUES (542430, '尼玛县', 3, 542400);
INSERT INTO `ocenter_district` VALUES (542521, '普兰县', 3, 542500);
INSERT INTO `ocenter_district` VALUES (542522, '札达县', 3, 542500);
INSERT INTO `ocenter_district` VALUES (542523, '噶尔县', 3, 542500);
INSERT INTO `ocenter_district` VALUES (542524, '日土县', 3, 542500);
INSERT INTO `ocenter_district` VALUES (542525, '革吉县', 3, 542500);
INSERT INTO `ocenter_district` VALUES (542526, '改则县', 3, 542500);
INSERT INTO `ocenter_district` VALUES (542527, '措勤县', 3, 542500);
INSERT INTO `ocenter_district` VALUES (542621, '林芝县', 3, 542600);
INSERT INTO `ocenter_district` VALUES (542622, '工布江达县', 3, 542600);
INSERT INTO `ocenter_district` VALUES (542623, '米林县', 3, 542600);
INSERT INTO `ocenter_district` VALUES (542624, '墨脱县', 3, 542600);
INSERT INTO `ocenter_district` VALUES (542625, '波密县', 3, 542600);
INSERT INTO `ocenter_district` VALUES (542626, '察隅县', 3, 542600);
INSERT INTO `ocenter_district` VALUES (542627, '朗　县', 3, 542600);
INSERT INTO `ocenter_district` VALUES (610101, '市辖区', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610102, '新城区', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610103, '碑林区', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610104, '莲湖区', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610111, '灞桥区', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610112, '未央区', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610113, '雁塔区', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610114, '阎良区', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610115, '临潼区', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610116, '长安区', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610122, '蓝田县', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610124, '周至县', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610125, '户　县', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610126, '高陵县', 3, 610100);
INSERT INTO `ocenter_district` VALUES (610201, '市辖区', 3, 610200);
INSERT INTO `ocenter_district` VALUES (610202, '王益区', 3, 610200);
INSERT INTO `ocenter_district` VALUES (610203, '印台区', 3, 610200);
INSERT INTO `ocenter_district` VALUES (610204, '耀州区', 3, 610200);
INSERT INTO `ocenter_district` VALUES (610222, '宜君县', 3, 610200);
INSERT INTO `ocenter_district` VALUES (610301, '市辖区', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610302, '渭滨区', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610303, '金台区', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610304, '陈仓区', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610322, '凤翔县', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610323, '岐山县', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610324, '扶风县', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610326, '眉　县', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610327, '陇　县', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610328, '千阳县', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610329, '麟游县', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610330, '凤　县', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610331, '太白县', 3, 610300);
INSERT INTO `ocenter_district` VALUES (610401, '市辖区', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610402, '秦都区', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610403, '杨凌区', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610404, '渭城区', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610422, '三原县', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610423, '泾阳县', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610424, '乾　县', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610425, '礼泉县', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610426, '永寿县', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610427, '彬　县', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610428, '长武县', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610429, '旬邑县', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610430, '淳化县', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610431, '武功县', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610481, '兴平市', 3, 610400);
INSERT INTO `ocenter_district` VALUES (610501, '市辖区', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610502, '临渭区', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610521, '华　县', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610522, '潼关县', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610523, '大荔县', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610524, '合阳县', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610525, '澄城县', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610526, '蒲城县', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610527, '白水县', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610528, '富平县', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610581, '韩城市', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610582, '华阴市', 3, 610500);
INSERT INTO `ocenter_district` VALUES (610601, '市辖区', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610602, '宝塔区', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610621, '延长县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610622, '延川县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610623, '子长县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610624, '安塞县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610625, '志丹县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610626, '吴旗县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610627, '甘泉县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610628, '富　县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610629, '洛川县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610630, '宜川县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610631, '黄龙县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610632, '黄陵县', 3, 610600);
INSERT INTO `ocenter_district` VALUES (610701, '市辖区', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610702, '汉台区', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610721, '南郑县', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610722, '城固县', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610723, '洋　县', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610724, '西乡县', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610725, '勉　县', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610726, '宁强县', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610727, '略阳县', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610728, '镇巴县', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610729, '留坝县', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610730, '佛坪县', 3, 610700);
INSERT INTO `ocenter_district` VALUES (610801, '市辖区', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610802, '榆阳区', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610821, '神木县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610822, '府谷县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610823, '横山县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610824, '靖边县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610825, '定边县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610826, '绥德县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610827, '米脂县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610828, '佳　县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610829, '吴堡县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610830, '清涧县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610831, '子洲县', 3, 610800);
INSERT INTO `ocenter_district` VALUES (610901, '市辖区', 3, 610900);
INSERT INTO `ocenter_district` VALUES (610902, '汉滨区', 3, 610900);
INSERT INTO `ocenter_district` VALUES (610921, '汉阴县', 3, 610900);
INSERT INTO `ocenter_district` VALUES (610922, '石泉县', 3, 610900);
INSERT INTO `ocenter_district` VALUES (610923, '宁陕县', 3, 610900);
INSERT INTO `ocenter_district` VALUES (610924, '紫阳县', 3, 610900);
INSERT INTO `ocenter_district` VALUES (610925, '岚皋县', 3, 610900);
INSERT INTO `ocenter_district` VALUES (610926, '平利县', 3, 610900);
INSERT INTO `ocenter_district` VALUES (610927, '镇坪县', 3, 610900);
INSERT INTO `ocenter_district` VALUES (610928, '旬阳县', 3, 610900);
INSERT INTO `ocenter_district` VALUES (610929, '白河县', 3, 610900);
INSERT INTO `ocenter_district` VALUES (611001, '市辖区', 3, 611000);
INSERT INTO `ocenter_district` VALUES (611002, '商州区', 3, 611000);
INSERT INTO `ocenter_district` VALUES (611021, '洛南县', 3, 611000);
INSERT INTO `ocenter_district` VALUES (611022, '丹凤县', 3, 611000);
INSERT INTO `ocenter_district` VALUES (611023, '商南县', 3, 611000);
INSERT INTO `ocenter_district` VALUES (611024, '山阳县', 3, 611000);
INSERT INTO `ocenter_district` VALUES (611025, '镇安县', 3, 611000);
INSERT INTO `ocenter_district` VALUES (611026, '柞水县', 3, 611000);
INSERT INTO `ocenter_district` VALUES (620101, '市辖区', 3, 620100);
INSERT INTO `ocenter_district` VALUES (620102, '城关区', 3, 620100);
INSERT INTO `ocenter_district` VALUES (620103, '七里河区', 3, 620100);
INSERT INTO `ocenter_district` VALUES (620104, '西固区', 3, 620100);
INSERT INTO `ocenter_district` VALUES (620105, '安宁区', 3, 620100);
INSERT INTO `ocenter_district` VALUES (620111, '红古区', 3, 620100);
INSERT INTO `ocenter_district` VALUES (620121, '永登县', 3, 620100);
INSERT INTO `ocenter_district` VALUES (620122, '皋兰县', 3, 620100);
INSERT INTO `ocenter_district` VALUES (620123, '榆中县', 3, 620100);
INSERT INTO `ocenter_district` VALUES (620201, '市辖区', 3, 620200);
INSERT INTO `ocenter_district` VALUES (620301, '市辖区', 3, 620300);
INSERT INTO `ocenter_district` VALUES (620302, '金川区', 3, 620300);
INSERT INTO `ocenter_district` VALUES (620321, '永昌县', 3, 620300);
INSERT INTO `ocenter_district` VALUES (620401, '市辖区', 3, 620400);
INSERT INTO `ocenter_district` VALUES (620402, '白银区', 3, 620400);
INSERT INTO `ocenter_district` VALUES (620403, '平川区', 3, 620400);
INSERT INTO `ocenter_district` VALUES (620421, '靖远县', 3, 620400);
INSERT INTO `ocenter_district` VALUES (620422, '会宁县', 3, 620400);
INSERT INTO `ocenter_district` VALUES (620423, '景泰县', 3, 620400);
INSERT INTO `ocenter_district` VALUES (620501, '市辖区', 3, 620500);
INSERT INTO `ocenter_district` VALUES (620502, '秦城区', 3, 620500);
INSERT INTO `ocenter_district` VALUES (620503, '北道区', 3, 620500);
INSERT INTO `ocenter_district` VALUES (620521, '清水县', 3, 620500);
INSERT INTO `ocenter_district` VALUES (620522, '秦安县', 3, 620500);
INSERT INTO `ocenter_district` VALUES (620523, '甘谷县', 3, 620500);
INSERT INTO `ocenter_district` VALUES (620524, '武山县', 3, 620500);
INSERT INTO `ocenter_district` VALUES (620525, '张家川回族自治县', 3, 620500);
INSERT INTO `ocenter_district` VALUES (620601, '市辖区', 3, 620600);
INSERT INTO `ocenter_district` VALUES (620602, '凉州区', 3, 620600);
INSERT INTO `ocenter_district` VALUES (620621, '民勤县', 3, 620600);
INSERT INTO `ocenter_district` VALUES (620622, '古浪县', 3, 620600);
INSERT INTO `ocenter_district` VALUES (620623, '天祝藏族自治县', 3, 620600);
INSERT INTO `ocenter_district` VALUES (620701, '市辖区', 3, 620700);
INSERT INTO `ocenter_district` VALUES (620702, '甘州区', 3, 620700);
INSERT INTO `ocenter_district` VALUES (620721, '肃南裕固族自治县', 3, 620700);
INSERT INTO `ocenter_district` VALUES (620722, '民乐县', 3, 620700);
INSERT INTO `ocenter_district` VALUES (620723, '临泽县', 3, 620700);
INSERT INTO `ocenter_district` VALUES (620724, '高台县', 3, 620700);
INSERT INTO `ocenter_district` VALUES (620725, '山丹县', 3, 620700);
INSERT INTO `ocenter_district` VALUES (620801, '市辖区', 3, 620800);
INSERT INTO `ocenter_district` VALUES (620802, '崆峒区', 3, 620800);
INSERT INTO `ocenter_district` VALUES (620821, '泾川县', 3, 620800);
INSERT INTO `ocenter_district` VALUES (620822, '灵台县', 3, 620800);
INSERT INTO `ocenter_district` VALUES (620823, '崇信县', 3, 620800);
INSERT INTO `ocenter_district` VALUES (620824, '华亭县', 3, 620800);
INSERT INTO `ocenter_district` VALUES (620825, '庄浪县', 3, 620800);
INSERT INTO `ocenter_district` VALUES (620826, '静宁县', 3, 620800);
INSERT INTO `ocenter_district` VALUES (620901, '市辖区', 3, 620900);
INSERT INTO `ocenter_district` VALUES (620902, '肃州区', 3, 620900);
INSERT INTO `ocenter_district` VALUES (620921, '金塔县', 3, 620900);
INSERT INTO `ocenter_district` VALUES (620922, '安西县', 3, 620900);
INSERT INTO `ocenter_district` VALUES (620923, '肃北蒙古族自治县', 3, 620900);
INSERT INTO `ocenter_district` VALUES (620924, '阿克塞哈萨克族自治县', 3, 620900);
INSERT INTO `ocenter_district` VALUES (620981, '玉门市', 3, 620900);
INSERT INTO `ocenter_district` VALUES (620982, '敦煌市', 3, 620900);
INSERT INTO `ocenter_district` VALUES (621001, '市辖区', 3, 621000);
INSERT INTO `ocenter_district` VALUES (621002, '西峰区', 3, 621000);
INSERT INTO `ocenter_district` VALUES (621021, '庆城县', 3, 621000);
INSERT INTO `ocenter_district` VALUES (621022, '环　县', 3, 621000);
INSERT INTO `ocenter_district` VALUES (621023, '华池县', 3, 621000);
INSERT INTO `ocenter_district` VALUES (621024, '合水县', 3, 621000);
INSERT INTO `ocenter_district` VALUES (621025, '正宁县', 3, 621000);
INSERT INTO `ocenter_district` VALUES (621026, '宁　县', 3, 621000);
INSERT INTO `ocenter_district` VALUES (621027, '镇原县', 3, 621000);
INSERT INTO `ocenter_district` VALUES (621101, '市辖区', 3, 621100);
INSERT INTO `ocenter_district` VALUES (621102, '安定区', 3, 621100);
INSERT INTO `ocenter_district` VALUES (621121, '通渭县', 3, 621100);
INSERT INTO `ocenter_district` VALUES (621122, '陇西县', 3, 621100);
INSERT INTO `ocenter_district` VALUES (621123, '渭源县', 3, 621100);
INSERT INTO `ocenter_district` VALUES (621124, '临洮县', 3, 621100);
INSERT INTO `ocenter_district` VALUES (621125, '漳　县', 3, 621100);
INSERT INTO `ocenter_district` VALUES (621126, '岷　县', 3, 621100);
INSERT INTO `ocenter_district` VALUES (621201, '市辖区', 3, 621200);
INSERT INTO `ocenter_district` VALUES (621202, '武都区', 3, 621200);
INSERT INTO `ocenter_district` VALUES (621221, '成　县', 3, 621200);
INSERT INTO `ocenter_district` VALUES (621222, '文　县', 3, 621200);
INSERT INTO `ocenter_district` VALUES (621223, '宕昌县', 3, 621200);
INSERT INTO `ocenter_district` VALUES (621224, '康　县', 3, 621200);
INSERT INTO `ocenter_district` VALUES (621225, '西和县', 3, 621200);
INSERT INTO `ocenter_district` VALUES (621226, '礼　县', 3, 621200);
INSERT INTO `ocenter_district` VALUES (621227, '徽　县', 3, 621200);
INSERT INTO `ocenter_district` VALUES (621228, '两当县', 3, 621200);
INSERT INTO `ocenter_district` VALUES (622901, '临夏市', 3, 622900);
INSERT INTO `ocenter_district` VALUES (622921, '临夏县', 3, 622900);
INSERT INTO `ocenter_district` VALUES (622922, '康乐县', 3, 622900);
INSERT INTO `ocenter_district` VALUES (622923, '永靖县', 3, 622900);
INSERT INTO `ocenter_district` VALUES (622924, '广河县', 3, 622900);
INSERT INTO `ocenter_district` VALUES (622925, '和政县', 3, 622900);
INSERT INTO `ocenter_district` VALUES (622926, '东乡族自治县', 3, 622900);
INSERT INTO `ocenter_district` VALUES (622927, '积石山保安族东乡族撒拉族自治县', 3, 622900);
INSERT INTO `ocenter_district` VALUES (623001, '合作市', 3, 623000);
INSERT INTO `ocenter_district` VALUES (623021, '临潭县', 3, 623000);
INSERT INTO `ocenter_district` VALUES (623022, '卓尼县', 3, 623000);
INSERT INTO `ocenter_district` VALUES (623023, '舟曲县', 3, 623000);
INSERT INTO `ocenter_district` VALUES (623024, '迭部县', 3, 623000);
INSERT INTO `ocenter_district` VALUES (623025, '玛曲县', 3, 623000);
INSERT INTO `ocenter_district` VALUES (623026, '碌曲县', 3, 623000);
INSERT INTO `ocenter_district` VALUES (623027, '夏河县', 3, 623000);
INSERT INTO `ocenter_district` VALUES (630101, '市辖区', 3, 630100);
INSERT INTO `ocenter_district` VALUES (630102, '城东区', 3, 630100);
INSERT INTO `ocenter_district` VALUES (630103, '城中区', 3, 630100);
INSERT INTO `ocenter_district` VALUES (630104, '城西区', 3, 630100);
INSERT INTO `ocenter_district` VALUES (630105, '城北区', 3, 630100);
INSERT INTO `ocenter_district` VALUES (630121, '大通回族土族自治县', 3, 630100);
INSERT INTO `ocenter_district` VALUES (630122, '湟中县', 3, 630100);
INSERT INTO `ocenter_district` VALUES (630123, '湟源县', 3, 630100);
INSERT INTO `ocenter_district` VALUES (632121, '平安县', 3, 632100);
INSERT INTO `ocenter_district` VALUES (632122, '民和回族土族自治县', 3, 632100);
INSERT INTO `ocenter_district` VALUES (632123, '乐都县', 3, 632100);
INSERT INTO `ocenter_district` VALUES (632126, '互助土族自治县', 3, 632100);
INSERT INTO `ocenter_district` VALUES (632127, '化隆回族自治县', 3, 632100);
INSERT INTO `ocenter_district` VALUES (632128, '循化撒拉族自治县', 3, 632100);
INSERT INTO `ocenter_district` VALUES (632221, '门源回族自治县', 3, 632200);
INSERT INTO `ocenter_district` VALUES (632222, '祁连县', 3, 632200);
INSERT INTO `ocenter_district` VALUES (632223, '海晏县', 3, 632200);
INSERT INTO `ocenter_district` VALUES (632224, '刚察县', 3, 632200);
INSERT INTO `ocenter_district` VALUES (632321, '同仁县', 3, 632300);
INSERT INTO `ocenter_district` VALUES (632322, '尖扎县', 3, 632300);
INSERT INTO `ocenter_district` VALUES (632323, '泽库县', 3, 632300);
INSERT INTO `ocenter_district` VALUES (632324, '河南蒙古族自治县', 3, 632300);
INSERT INTO `ocenter_district` VALUES (632521, '共和县', 3, 632500);
INSERT INTO `ocenter_district` VALUES (632522, '同德县', 3, 632500);
INSERT INTO `ocenter_district` VALUES (632523, '贵德县', 3, 632500);
INSERT INTO `ocenter_district` VALUES (632524, '兴海县', 3, 632500);
INSERT INTO `ocenter_district` VALUES (632525, '贵南县', 3, 632500);
INSERT INTO `ocenter_district` VALUES (632621, '玛沁县', 3, 632600);
INSERT INTO `ocenter_district` VALUES (632622, '班玛县', 3, 632600);
INSERT INTO `ocenter_district` VALUES (632623, '甘德县', 3, 632600);
INSERT INTO `ocenter_district` VALUES (632624, '达日县', 3, 632600);
INSERT INTO `ocenter_district` VALUES (632625, '久治县', 3, 632600);
INSERT INTO `ocenter_district` VALUES (632626, '玛多县', 3, 632600);
INSERT INTO `ocenter_district` VALUES (632721, '玉树县', 3, 632700);
INSERT INTO `ocenter_district` VALUES (632722, '杂多县', 3, 632700);
INSERT INTO `ocenter_district` VALUES (632723, '称多县', 3, 632700);
INSERT INTO `ocenter_district` VALUES (632724, '治多县', 3, 632700);
INSERT INTO `ocenter_district` VALUES (632725, '囊谦县', 3, 632700);
INSERT INTO `ocenter_district` VALUES (632726, '曲麻莱县', 3, 632700);
INSERT INTO `ocenter_district` VALUES (632801, '格尔木市', 3, 632800);
INSERT INTO `ocenter_district` VALUES (632802, '德令哈市', 3, 632800);
INSERT INTO `ocenter_district` VALUES (632821, '乌兰县', 3, 632800);
INSERT INTO `ocenter_district` VALUES (632822, '都兰县', 3, 632800);
INSERT INTO `ocenter_district` VALUES (632823, '天峻县', 3, 632800);
INSERT INTO `ocenter_district` VALUES (640101, '市辖区', 3, 640100);
INSERT INTO `ocenter_district` VALUES (640104, '兴庆区', 3, 640100);
INSERT INTO `ocenter_district` VALUES (640105, '西夏区', 3, 640100);
INSERT INTO `ocenter_district` VALUES (640106, '金凤区', 3, 640100);
INSERT INTO `ocenter_district` VALUES (640121, '永宁县', 3, 640100);
INSERT INTO `ocenter_district` VALUES (640122, '贺兰县', 3, 640100);
INSERT INTO `ocenter_district` VALUES (640181, '灵武市', 3, 640100);
INSERT INTO `ocenter_district` VALUES (640201, '市辖区', 3, 640200);
INSERT INTO `ocenter_district` VALUES (640202, '大武口区', 3, 640200);
INSERT INTO `ocenter_district` VALUES (640205, '惠农区', 3, 640200);
INSERT INTO `ocenter_district` VALUES (640221, '平罗县', 3, 640200);
INSERT INTO `ocenter_district` VALUES (640301, '市辖区', 3, 640300);
INSERT INTO `ocenter_district` VALUES (640302, '利通区', 3, 640300);
INSERT INTO `ocenter_district` VALUES (640323, '盐池县', 3, 640300);
INSERT INTO `ocenter_district` VALUES (640324, '同心县', 3, 640300);
INSERT INTO `ocenter_district` VALUES (640381, '青铜峡市', 3, 640300);
INSERT INTO `ocenter_district` VALUES (640401, '市辖区', 3, 640400);
INSERT INTO `ocenter_district` VALUES (640402, '原州区', 3, 640400);
INSERT INTO `ocenter_district` VALUES (640422, '西吉县', 3, 640400);
INSERT INTO `ocenter_district` VALUES (640423, '隆德县', 3, 640400);
INSERT INTO `ocenter_district` VALUES (640424, '泾源县', 3, 640400);
INSERT INTO `ocenter_district` VALUES (640425, '彭阳县', 3, 640400);
INSERT INTO `ocenter_district` VALUES (640501, '市辖区', 3, 640500);
INSERT INTO `ocenter_district` VALUES (640502, '沙坡头区', 3, 640500);
INSERT INTO `ocenter_district` VALUES (640521, '中宁县', 3, 640500);
INSERT INTO `ocenter_district` VALUES (640522, '海原县', 3, 640500);
INSERT INTO `ocenter_district` VALUES (650101, '市辖区', 3, 650100);
INSERT INTO `ocenter_district` VALUES (650102, '天山区', 3, 650100);
INSERT INTO `ocenter_district` VALUES (650103, '沙依巴克区', 3, 650100);
INSERT INTO `ocenter_district` VALUES (650104, '新市区', 3, 650100);
INSERT INTO `ocenter_district` VALUES (650105, '水磨沟区', 3, 650100);
INSERT INTO `ocenter_district` VALUES (650106, '头屯河区', 3, 650100);
INSERT INTO `ocenter_district` VALUES (650107, '达坂城区', 3, 650100);
INSERT INTO `ocenter_district` VALUES (650108, '东山区', 3, 650100);
INSERT INTO `ocenter_district` VALUES (650121, '乌鲁木齐县', 3, 650100);
INSERT INTO `ocenter_district` VALUES (650201, '市辖区', 3, 650200);
INSERT INTO `ocenter_district` VALUES (650202, '独山子区', 3, 650200);
INSERT INTO `ocenter_district` VALUES (650203, '克拉玛依区', 3, 650200);
INSERT INTO `ocenter_district` VALUES (650204, '白碱滩区', 3, 650200);
INSERT INTO `ocenter_district` VALUES (650205, '乌尔禾区', 3, 650200);
INSERT INTO `ocenter_district` VALUES (652101, '吐鲁番市', 3, 652100);
INSERT INTO `ocenter_district` VALUES (652122, '鄯善县', 3, 652100);
INSERT INTO `ocenter_district` VALUES (652123, '托克逊县', 3, 652100);
INSERT INTO `ocenter_district` VALUES (652201, '哈密市', 3, 652200);
INSERT INTO `ocenter_district` VALUES (652222, '巴里坤哈萨克自治县', 3, 652200);
INSERT INTO `ocenter_district` VALUES (652223, '伊吾县', 3, 652200);
INSERT INTO `ocenter_district` VALUES (652301, '昌吉市', 3, 652300);
INSERT INTO `ocenter_district` VALUES (652302, '阜康市', 3, 652300);
INSERT INTO `ocenter_district` VALUES (652303, '米泉市', 3, 652300);
INSERT INTO `ocenter_district` VALUES (652323, '呼图壁县', 3, 652300);
INSERT INTO `ocenter_district` VALUES (652324, '玛纳斯县', 3, 652300);
INSERT INTO `ocenter_district` VALUES (652325, '奇台县', 3, 652300);
INSERT INTO `ocenter_district` VALUES (652327, '吉木萨尔县', 3, 652300);
INSERT INTO `ocenter_district` VALUES (652328, '木垒哈萨克自治县', 3, 652300);
INSERT INTO `ocenter_district` VALUES (652701, '博乐市', 3, 652700);
INSERT INTO `ocenter_district` VALUES (652722, '精河县', 3, 652700);
INSERT INTO `ocenter_district` VALUES (652723, '温泉县', 3, 652700);
INSERT INTO `ocenter_district` VALUES (652801, '库尔勒市', 3, 652800);
INSERT INTO `ocenter_district` VALUES (652822, '轮台县', 3, 652800);
INSERT INTO `ocenter_district` VALUES (652823, '尉犁县', 3, 652800);
INSERT INTO `ocenter_district` VALUES (652824, '若羌县', 3, 652800);
INSERT INTO `ocenter_district` VALUES (652825, '且末县', 3, 652800);
INSERT INTO `ocenter_district` VALUES (652826, '焉耆回族自治县', 3, 652800);
INSERT INTO `ocenter_district` VALUES (652827, '和静县', 3, 652800);
INSERT INTO `ocenter_district` VALUES (652828, '和硕县', 3, 652800);
INSERT INTO `ocenter_district` VALUES (652829, '博湖县', 3, 652800);
INSERT INTO `ocenter_district` VALUES (652901, '阿克苏市', 3, 652900);
INSERT INTO `ocenter_district` VALUES (652922, '温宿县', 3, 652900);
INSERT INTO `ocenter_district` VALUES (652923, '库车县', 3, 652900);
INSERT INTO `ocenter_district` VALUES (652924, '沙雅县', 3, 652900);
INSERT INTO `ocenter_district` VALUES (652925, '新和县', 3, 652900);
INSERT INTO `ocenter_district` VALUES (652926, '拜城县', 3, 652900);
INSERT INTO `ocenter_district` VALUES (652927, '乌什县', 3, 652900);
INSERT INTO `ocenter_district` VALUES (652928, '阿瓦提县', 3, 652900);
INSERT INTO `ocenter_district` VALUES (652929, '柯坪县', 3, 652900);
INSERT INTO `ocenter_district` VALUES (653001, '阿图什市', 3, 653000);
INSERT INTO `ocenter_district` VALUES (653022, '阿克陶县', 3, 653000);
INSERT INTO `ocenter_district` VALUES (653023, '阿合奇县', 3, 653000);
INSERT INTO `ocenter_district` VALUES (653024, '乌恰县', 3, 653000);
INSERT INTO `ocenter_district` VALUES (653101, '喀什市', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653121, '疏附县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653122, '疏勒县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653123, '英吉沙县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653124, '泽普县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653125, '莎车县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653126, '叶城县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653127, '麦盖提县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653128, '岳普湖县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653129, '伽师县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653130, '巴楚县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653131, '塔什库尔干塔吉克自治县', 3, 653100);
INSERT INTO `ocenter_district` VALUES (653201, '和田市', 3, 653200);
INSERT INTO `ocenter_district` VALUES (653221, '和田县', 3, 653200);
INSERT INTO `ocenter_district` VALUES (653222, '墨玉县', 3, 653200);
INSERT INTO `ocenter_district` VALUES (653223, '皮山县', 3, 653200);
INSERT INTO `ocenter_district` VALUES (653224, '洛浦县', 3, 653200);
INSERT INTO `ocenter_district` VALUES (653225, '策勒县', 3, 653200);
INSERT INTO `ocenter_district` VALUES (653226, '于田县', 3, 653200);
INSERT INTO `ocenter_district` VALUES (653227, '民丰县', 3, 653200);
INSERT INTO `ocenter_district` VALUES (654002, '伊宁市', 3, 654000);
INSERT INTO `ocenter_district` VALUES (654003, '奎屯市', 3, 654000);
INSERT INTO `ocenter_district` VALUES (654021, '伊宁县', 3, 654000);
INSERT INTO `ocenter_district` VALUES (654022, '察布查尔锡伯自治县', 3, 654000);
INSERT INTO `ocenter_district` VALUES (654023, '霍城县', 3, 654000);
INSERT INTO `ocenter_district` VALUES (654024, '巩留县', 3, 654000);
INSERT INTO `ocenter_district` VALUES (654025, '新源县', 3, 654000);
INSERT INTO `ocenter_district` VALUES (654026, '昭苏县', 3, 654000);
INSERT INTO `ocenter_district` VALUES (654027, '特克斯县', 3, 654000);
INSERT INTO `ocenter_district` VALUES (654028, '尼勒克县', 3, 654000);
INSERT INTO `ocenter_district` VALUES (654201, '塔城市', 3, 654200);
INSERT INTO `ocenter_district` VALUES (654202, '乌苏市', 3, 654200);
INSERT INTO `ocenter_district` VALUES (654221, '额敏县', 3, 654200);
INSERT INTO `ocenter_district` VALUES (654223, '沙湾县', 3, 654200);
INSERT INTO `ocenter_district` VALUES (654224, '托里县', 3, 654200);
INSERT INTO `ocenter_district` VALUES (654225, '裕民县', 3, 654200);
INSERT INTO `ocenter_district` VALUES (654226, '和布克赛尔蒙古自治县', 3, 654200);
INSERT INTO `ocenter_district` VALUES (654301, '阿勒泰市', 3, 654300);
INSERT INTO `ocenter_district` VALUES (654321, '布尔津县', 3, 654300);
INSERT INTO `ocenter_district` VALUES (654322, '富蕴县', 3, 654300);
INSERT INTO `ocenter_district` VALUES (654323, '福海县', 3, 654300);
INSERT INTO `ocenter_district` VALUES (654324, '哈巴河县', 3, 654300);
INSERT INTO `ocenter_district` VALUES (654325, '青河县', 3, 654300);
INSERT INTO `ocenter_district` VALUES (654326, '吉木乃县', 3, 654300);
INSERT INTO `ocenter_district` VALUES (659001, '石河子市', 3, 659000);
INSERT INTO `ocenter_district` VALUES (659002, '阿拉尔市', 3, 659000);
INSERT INTO `ocenter_district` VALUES (659003, '图木舒克市', 3, 659000);
INSERT INTO `ocenter_district` VALUES (659004, '五家渠市', 3, 659000);
INSERT INTO `ocenter_district` VALUES (810001, '香港', 2, 810000);
INSERT INTO `ocenter_district` VALUES (810002, '中西区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810003, '九龙城区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810004, '南区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810005, '黄大仙区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810006, '油尖旺区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810007, '葵青区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810008, '西贡区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810009, '屯门区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810010, '荃湾区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810011, '东区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810012, '观塘区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810013, '深水步区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810014, '湾仔区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810015, '离岛区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810016, '北区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810017, '沙田区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810018, '大埔区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (810019, '元朗区', 3, 810001);
INSERT INTO `ocenter_district` VALUES (820001, '澳门', 2, 820000);
INSERT INTO `ocenter_district` VALUES (820002, '澳门', 3, 820001);
INSERT INTO `ocenter_district` VALUES (710001, '台北市', 2, 710000);
INSERT INTO `ocenter_district` VALUES (710002, '台北县', 3, 710001);
INSERT INTO `ocenter_district` VALUES (710003, '基隆市', 2, 710000);
INSERT INTO `ocenter_district` VALUES (910005, '中山市', 3, 442000);
INSERT INTO `ocenter_district` VALUES (710004, '花莲县', 3, 710003);
INSERT INTO `ocenter_district` VALUES (910006, '东莞市', 3, 441900);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_dman_tokeninfo
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_dman_tokeninfo`;
CREATE TABLE `ocenter_dman_tokeninfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `website` varchar(2000) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `whitelist` int(10) NOT NULL,
  `idotime` int(10) NOT NULL,
  `idoinfo` varchar(1000) NOT NULL,
  `saleinfo` varchar(1000) DEFAULT NULL,
  `uniswap` int(10) DEFAULT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `ctime` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `sort` int(10) NOT NULL,
  `remind_time` int(10) NOT NULL,
  `remind_content` varchar(255) NOT NULL,
  `is_remind` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_dman_tokeninfo
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_dman_tokeninfo` VALUES (1, 'SuperFarm', '官网：\r\nhttps://superfarm.io/\r\n项目介绍：\r\nhttps://medium.com/superfarm/superfarm-polkastarter-ido-whitelist-now-open-cfe2183c05d', '聊天讨论\r\nhttps://t.me/SuperFarmDAO\r\n官方公告\r\nhttps://t.me/SuperFarmANN', 'https://twitter.com/SuperFarmDAO', 1613491200, 1613923200, 'SuperFarm Polkastarter IDO TLDR\r\nMonday 22nd February 2021 — Exact Time TBA\r\n10 000 000 SUPER tokens for sale in total\r\nToken price — $0.025 per token\r\nTotal Raise — $250 000\r\nNon-POLS Pool — ETH only\r\nPOLS Pool — Hold 3000 POLS for a minimum of 7 days or provide POLS/ETH Liquidity on Uniswap', '', 1614441600, '', 1613557790, 1, 0, 1613557309, '开始了。。。', 1);
INSERT INTO `ocenter_dman_tokeninfo` VALUES (4, 'polkpets 卡片', 'https://polkapetworld.medium.com/introducing-kylin-mantradao-and-bondswap-to-the-world-of-polkapets-d6fb876790b3', 'https://t.me/polkapetworld', 'https://twitter.com/PolkaPets', 1613566957, 1613566957, '感谢我们令人惊叹的社区支持《世界世界》的前两个版本\r\n@PolkaPets\r\n！\r\n\r\n为之兴奋\r\n@PhalaNetwork\r\n，\r\n@DarwiniaNetwork\r\n的进化之地\r\n@BridgeMutual\r\n和\r\n@BondlyFinance\r\n的BondDex将于本周发售！', '感谢我们令人惊叹的社区支持《世界世界》的前两个版本\r\n@PolkaPets\r\n！\r\n\r\n为之兴奋\r\n@PhalaNetwork\r\n，\r\n@DarwiniaNetwork\r\n的进化之地\r\n@BridgeMutual\r\n和\r\n@BondlyFinance\r\n的BondDex将于本周发售！', 1613566957, '0xba8cDaa1C4C294aD634ab3c6Ee0FA82D0A019727\r\n---- polkapets\r\n0x71620b123ae1A84602555A955B099f7d0795b2E6\r\n---- bondly', 1613567313, 1, 0, 1613569800, '中国北京市的星期四上午5:00 2月18日', 1);
INSERT INTO `ocenter_dman_tokeninfo` VALUES (5, 'The singer 金卡', 'https://opensea.io/assets/0x401b3474a0a2fbcb00d516c1ffc01854b9d9dafe/12', '', '', 1613659068, 1613659068, '', '', 1613659068, '', 1613659238, 1, 0, 1614297600, '准备抢NFT', 1);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_dman_useraddcoin
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_dman_useraddcoin`;
CREATE TABLE `ocenter_dman_useraddcoin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(255) NOT NULL,
  `contract` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logoURI` varchar(255) DEFAULT NULL,
  `network` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_dman_useraddcoin
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_dman_useraddcoin` VALUES (1, 'GTC', '0xde30da39c46104798bb5aa3fe8b9e0e1f348163f', 106, 'Gitcoin', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (2, 'DIRTY', '0x4fab740779c73aa3945a5cf6025bf1b0e7f6349c', 108, 'dirty.finance', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (3, 'CHOW', '0x2c33f2501f83dbf43c9ef6378a5c902e724a4a6a', 106, 'Chow Chow', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (4, 'IMX', '0x7b35ce522cb72e4077baeb96cb923a5529764a00', 113, 'Impermax', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (5, 'IMX', '0x7b35ce522cb72e4077baeb96cb923a5529764a00', 113, 'Impermax', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (6, 'ADA', '0x3ee2200efb3400fabb9aacf31297cbdd1d435d47', 425, 'Cardano Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (7, 'ADAPAD', '0xdb0170e2d0c1cc1b2e7a90313d9b9afa4f250289', 105, 'ADAPAD.io', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (8, 'ADAPAD', '0xdb0170e2d0c1cc1b2e7a90313d9b9afa4f250289', 402, 'ADAPAD.io', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (9, 'BT', '0x8d32605b25921b548eefccdabc11e46543597aa7', 111, 'Bwitter Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (10, 'SGRv2', '0x56231d55391bd6382bc2a0761a644ea188b007cc', 113, 'Sagittarius', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (11, 'HOE', '0xa56ed2632e443db5f93e73c89df399a081408cc4', 310, 'Gold Hoe One', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (12, 'HIP', '0xe6ffa2e574a8bbeb5243d2109b6b11d4a459f88b', 233, 'Hippo Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (13, 'HIP', '0xe6ffa2e574a8bbeb5243d2109b6b11d4a459f88b', 233, 'Hippo Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (14, 'PSC', '0x5a2fcf149dae75f5326aa01e17473f8b9a82991c', 109, 'Paul Sports Coin', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (15, 'PSC', '0x5a2fcf149dae75f5326aa01e17473f8b9a82991c', 109, 'Paul Sports Coin', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (16, 'BZZ', '0x19062190b1925b5b6689d7073fdfc8c2976ef8cb', 109, 'BZZ', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (17, 'PSC', '0x5a2fcf149dae75f5326aa01e17473f8b9a82991c', 304, 'Paul Sports Coin', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (18, 'PSC', '0x5a2fcf149dae75f5326aa01e17473f8b9a82991c', 304, 'Paul Sports Coin', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (19, 'DFW', '0x618fe88e887f9fe3d7ca10e68db079e2024bd9bc', 105, 'DaFuweng Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (20, 'CRE', '0xe632101fb808de2a37c07c214f036f586acfb366', 310, 'CRuisE', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (21, 'HIP', '0xe6ffa2e574a8bbeb5243d2109b6b11d4a459f88b', 233, 'Hippo Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (22, 'HIP', '0xe6ffa2e574a8bbeb5243d2109b6b11d4a459f88b', 233, 'Hippo Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (23, 'BEAN', '0x49d8322f51aa6312c0968517fb11f93127b038fc', 233, 'MagicBean Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (24, 'CRE', '0xe632101fb808de2a37c07c214f036f586acfb366', 583, 'CRuisE', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (25, 'CRE', '0xe632101fb808de2a37c07c214f036f586acfb366', 583, 'CRuisE', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (26, 'CRE', '0xe632101fb808de2a37c07c214f036f586acfb366', 583, 'CRuisE', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (27, 'CRE', '0xe632101fb808de2a37c07c214f036f586acfb366', 583, 'CRuisE', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (28, 'SGRv2', '0x56231d55391bd6382bc2a0761a644ea188b007cc', 636, 'Sagittarius', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (29, 'SGRv2', '0x56231d55391bd6382bc2a0761a644ea188b007cc', 636, 'Sagittarius', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (30, 'SGRv2', '0x56231d55391bd6382bc2a0761a644ea188b007cc', 642, 'Sagittarius', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (31, 'SGRv2', '0x56231d55391bd6382bc2a0761a644ea188b007cc', 642, 'Sagittarius', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (32, 'SGRv2', '0x56231d55391bd6382bc2a0761a644ea188b007cc', 642, 'Sagittarius', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (33, 'LEASH', '0x27c70cd1946795b66be9d954418546998b546634', 111, 'DOGE KILLER', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (34, 'RACA', '0x12bb890508c125661e03b09ec06e404bc9289040', 233, 'Radio Caca', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (35, 'BIT', '0xc864019047b864b6ab609a968ae2725dfaee808a', 718, 'Biconomy Exchange T', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (36, 'FEG', '0xacfc95585d80ab62f67a14c566c1b7a49fe91167', 114, 'FEG Token BSC', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (37, 'FEG', '0xacfc95585d80ab62f67a14c566c1b7a49fe91167', 109, 'FEG Token BSC', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (38, 'FEG', '0xacfc95585d80ab62f67a14c566c1b7a49fe91167', 109, 'FEG Token BSC', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (39, 'FEG', '0xacfc95585d80ab62f67a14c566c1b7a49fe91167', 109, 'FEG Token BSC', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (40, 'FEG', '0xacfc95585d80ab62f67a14c566c1b7a49fe91167', 109, 'FEG Token BSC', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (41, 'FEG', '0xacfc95585d80ab62f67a14c566c1b7a49fe91167', 111, 'FEG Token BSC', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (42, 'FEG', '0xacfc95585d80ab62f67a14c566c1b7a49fe91167', 676, 'FEG Token BSC', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (43, 'BIT', '0xc864019047b864b6ab609a968ae2725dfaee808a', 717, 'Biconomy Exchange T', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (44, 'BIT', '0xc864019047b864b6ab609a968ae2725dfaee808a', 717, 'Biconomy Exchange T', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (45, 'HE', '0x20d39a5130f799b95b55a930e5b7ebc589ea9ed8', 105, 'Heroes&Empires', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (46, '$867', '0x9cefd9588f076c5f805341864adc8a6f077a5b99', 678, '867', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (47, 'PB', '0x6010a2ea4bf9b4b94aa4c44e4c4c451f9a46f5d7', 158, 'PIB', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (48, 'THG', '0x9fd87aefe02441b123c3c32466cd9db4c578618f', 636, 'Thetan Arena', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (49, 'THG', '0x9fd87aefe02441b123c3c32466cd9db4c578618f', 636, 'Thetan Arena', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (50, 'THG', '0x9fd87aefe02441b123c3c32466cd9db4c578618f', 636, 'Thetan Arena', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (51, 'THG', '0x9fd87aefe02441b123c3c32466cd9db4c578618f', 636, 'Thetan Arena', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (52, 'THG', '0x9fd87aefe02441b123c3c32466cd9db4c578618f', 636, 'Thetan Arena', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (53, 'THG', '0x9fd87aefe02441b123c3c32466cd9db4c578618f', 653, 'Thetan Arena', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (54, 'SGRv2', '0x56231d55391bd6382bc2a0761a644ea188b007cc', 653, 'Sagittarius', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (55, 'BIT', '0xc864019047b864b6ab609a968ae2725dfaee808a', 717, 'Biconomy Exchange T', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (56, 'BNBCH', '0x840bcd536d647c3433bf830dbcb8debfa5b71c79', 676, 'BNB Cash', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (57, 'CONE', '0x9628735017f1a985ebaac0b203efb9e8d3ed0fef', 717, 'CoinOne Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (58, 'THG', '0x9fd87aefe02441b123c3c32466cd9db4c578618f', 645, 'Thetan Arena', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (59, 'SGRv2', '0x56231d55391bd6382bc2a0761a644ea188b007cc', 645, 'Sagittarius', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (60, 'CBC', '0x793cea0f1003411396b3a81a77d92fe37015e7a9', 717, 'Carbon Coin', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (61, 'DOX', '0x30ea7c369b87fe261de28a1eefafe806696a738b', 676, 'DOXXED', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (62, 'PIRATECOIN', '0x041640ea980e3fe61e9c4ca26d9007bc70094c15', 717, 'PirateCoin', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (63, 'Brave', '0xadb5ab463c060632df20fac209e703799b146f50', 717, 'BraveToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (64, 'THG', '0x9fd87aefe02441b123c3c32466cd9db4c578618f', 642, 'Thetan Arena', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (65, 'BSCM', '0x63133de69e94f225726426fa729a7c515a51d75a', 717, 'BSC MemePad', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (66, 'NMBTC', '0x5ddb331c3ba48a1d68cbf50dd3bc7aac407dc115', 951, 'NMBTC Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (67, 'NMBTC', '0x5ddb331c3ba48a1d68cbf50dd3bc7aac407dc115', 951, 'NMBTC Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (68, 'IDE', '0xbebe4d5b1ee3654a70fd4c7c44037fe604b9f786', 492, 'IDEToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (69, 'THG', '0x9fd87aefe02441b123c3c32466cd9db4c578618f', 643, 'Thetan Arena', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (70, 'NFT', 'TFczxzPhnThNSqr5by8tvxsdCFRRz6cPNq', 105, 'APENFT', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (71, 'NFT', 'TFczxzPhnThNSqr5by8tvxsdCFRRz6cPNq', 105, 'APENFT', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (72, 'DINA', '0xa75e17a061ed826c65f138b7a85b44c5d3156aff', 111, 'Dina', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (73, 'MAYI', 'TXxoKWsyw5x3wdeWnsqedjSk5nuLUGXcfT', 957, 'MAYILEN', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (74, 'MAYI', 'TXxoKWsyw5x3wdeWnsqedjSk5nuLUGXcfT', 957, 'MAYILEN', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (75, 'DERI', '0xe60eaf5a997dfae83739e035b005a33afdcc6df5', 717, 'Deri Protocol', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (76, 'DERI', '0xe60eaf5a997dfae83739e035b005a33afdcc6df5', 717, 'Deri Protocol', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (77, 'DXM', 'TEoPMYFa5zPP1SayeXkAqZSAmf7VkqNv2w', 1045, 'panda', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (78, 'X9C', '0x09c91b0324433372534b76040e38a0dba1a9ee52', 717, 'X9C', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (79, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 717, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (80, 'YRIO', '0x0a0944867ac84472d24deb09501cc78f73466fa0', 233, 'Yrio Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (81, 'YRIO', '0x0a0944867ac84472d24deb09501cc78f73466fa0', 233, 'Yrio Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (82, 'YRIO', '0x0a0944867ac84472d24deb09501cc78f73466fa0', 1069, 'Yrio Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (83, 'ATH', '0x6d3a0fb0070ea61f901ebc0b675c30450acac737', 676, 'AetherV2', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (84, 'ATH', '0x6d3a0fb0070ea61f901ebc0b675c30450acac737', 676, 'AetherV2', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (85, 'ATH', '0x6d3a0fb0070ea61f901ebc0b675c30450acac737', 676, 'AetherV2', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (86, 'BABYDOGE', '0xc748673057861a797275cd8a068abb95a902e8de', 957, 'Baby Doge Coin', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (87, 'Brave', '0xadb5ab463c060632df20fac209e703799b146f50', 717, 'BraveToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (88, 'SGRv2', '0x56231d55391bd6382bc2a0761a644ea188b007cc', 1073, 'Sagittarius', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (89, 'YRIO', '0x0a0944867ac84472d24deb09501cc78f73466fa0', 1077, 'Yrio Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (90, 'VALK', '0x405cff4ce041d3235e8b1f7aaa4e458998a47363', 1077, 'Valkyrio Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (91, 'GOLD', '0xb3a6381070b1a15169dea646166ec0699fdaea79', 297, 'CyberDragon Gold', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (92, 'MUCNFT', '0xff6080c748d813d7f4752f279c1e6325f6bf5c75', 1094, 'MusicianWorldsNFT', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (93, 'MUCNFT', '0xff6080c748d813d7f4752f279c1e6325f6bf5c75', 1094, 'MusicianWorldsNFT', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (94, 'CRE', '0xe632101fb808de2a37c07c214f036f586acfb366', 1094, 'CRuisE', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (95, 'MFI', '0x808f1350dff684c099f4837a01d863fc61a86bc6', 1094, 'MetaFinance', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (96, 'fix', '0x506c02450e4963948d6f156c3cdecb7f8d2eb7f1', 1094, 'flaming Phenix', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (97, 'FPH', '0x6f14a18b4543a4d6779ecc5e23a6198e9faa7fc0', 1094, 'FPH', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (98, 'YRIO', '0x0a0944867ac84472d24deb09501cc78f73466fa0', 297, 'Yrio Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (99, 'BAO', '0xac019ee3863984ea66ab357a491d37fb2c9c6f17', 114, 'BAO', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (100, 'CONE', '0x9628735017f1a985ebaac0b203efb9e8d3ed0fef', 1077, 'CoinOne Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (101, 'fix', '0x506c02450e4963948d6f156c3cdecb7f8d2eb7f1', 114, 'flaming Phenix', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (102, 'fix', '0x506c02450e4963948d6f156c3cdecb7f8d2eb7f1', 114, 'flaming Phenix', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (103, 'pandazilla', '0x1c4c4fab1ce0afecbb339516e1cc555957a25f33', 717, 'pandazilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (104, 'LIZ', '0xfcb520b47f5601031e0eb316f553a3641ff4b13c', 114, 'lizardtoken.finance', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (105, 'LIZ', '0xfcb520b47f5601031e0eb316f553a3641ff4b13c', 114, 'lizardtoken.finance', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (106, 'LIZ', '0xfcb520b47f5601031e0eb316f553a3641ff4b13c', 156, 'lizardtoken.finance', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (107, 'Shiboki', '0xe45575869bfbd425d69e56a1715755d20bc69dfe', 957, 'Shiboki', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (108, 'Shiboki', '0xe45575869bfbd425d69e56a1715755d20bc69dfe', 957, 'Shiboki', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (109, 'Shiboki', '0xe45575869bfbd425d69e56a1715755d20bc69dfe', 1350, 'Shiboki', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (110, 'NEWINU', '0x1997830b5beb723f5089bb8fc38766d419a0444d', 1353, 'New Guinea Singing Dog Inu', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (111, 'NEWINU', '0x1997830b5beb723f5089bb8fc38766d419a0444d', 1353, 'New Guinea Singing Dog Inu', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (112, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 1353, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (113, 'NEWINU', '0x1997830b5beb723f5089bb8fc38766d419a0444d', 1353, 'New Guinea Singing Dog Inu', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (114, 'fix', '0x506c02450e4963948d6f156c3cdecb7f8d2eb7f1', 1094, 'flaming Phenix', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (115, 'fix', '0x506c02450e4963948d6f156c3cdecb7f8d2eb7f1', 1094, 'flaming Phenix', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (116, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 676, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (117, 'DOX', '0x30ea7c369b87fe261de28a1eefafe806696a738b', 1366, 'DOXXED', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (118, 'GHC', '0x683fae4411249ca05243dfb919c20920f3f5bfe0', 1366, 'Galaxy Heroes Coin', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (119, 'MUCNFT', '0xff6080c748d813d7f4752f279c1e6325f6bf5c75', 315, 'MusicianWorldsNFT', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (120, 'MUCNFT', '0xff6080c748d813d7f4752f279c1e6325f6bf5c75', 315, 'MusicianWorldsNFT', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (121, 'MUCNFT', '0xff6080c748d813d7f4752f279c1e6325f6bf5c75', 315, 'MusicianWorldsNFT', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (122, 'FR', 'TGxDeLQq8NGmBN3nSPjcyX4QKiwUpDznyL', 874, 'Free field', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (123, 'Free', 'TGwubDwhsow9Z6h8XRozw3EDJ3WZJvi6eL', 874, 'FreeToken', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (124, 'Free', 'TGwubDwhsow9Z6h8XRozw3EDJ3WZJvi6eL', 874, 'FreeToken', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (125, 'Free', 'TGwubDwhsow9Z6h8XRozw3EDJ3WZJvi6eL', 874, 'FreeToken', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (126, 'Free', 'TGwubDwhsow9Z6h8XRozw3EDJ3WZJvi6eL', 874, 'FreeToken', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (127, 'Free', 'TGwubDwhsow9Z6h8XRozw3EDJ3WZJvi6eL', 874, 'FreeToken', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (128, 'Free', 'TGwubDwhsow9Z6h8XRozw3EDJ3WZJvi6eL', 874, 'FreeToken', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (129, 'Free', 'TGwubDwhsow9Z6h8XRozw3EDJ3WZJvi6eL', 874, 'FreeToken', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (130, 'Free', 'TGwubDwhsow9Z6h8XRozw3EDJ3WZJvi6eL', 874, 'FreeToken', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (131, 'GOLD', '0xb3a6381070b1a15169dea646166ec0699fdaea79', 1069, 'CyberDragon Gold', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (132, 'YRIO', '0x0a0944867ac84472d24deb09501cc78f73466fa0', 297, 'Yrio Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (133, 'FR', 'TGxDeLQq8NGmBN3nSPjcyX4QKiwUpDznyL', 874, 'Free field', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (134, 'FR', 'TGxDeLQq8NGmBN3nSPjcyX4QKiwUpDznyL', 874, 'Free field', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (135, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 1385, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (136, 'ShibaZilla', '0x68810a6f5bb0491cb9ccf8c52735a1acf5f28009', 1353, 'ShibaZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (137, 'ScorpFin', '0x475c8df9860e42605d9917f0a2e522cc861cbf82', 1366, 'Scorpion Finance', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (138, 'BABY', '0x53e562b9b7e5e94b81f10e96ee70ad06df3d2657', 297, 'BabySwap', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (139, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 711, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (140, 'YOOSHI', '0x02ff5065692783374947393723dba9599e59f591', 1094, 'YooShi', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (141, 'YOOSHI', '0x02ff5065692783374947393723dba9599e59f591', 1458, 'YooShi', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (142, 'MILIT', '0xeea7c025b1eee9527d631094d45ff9ce5d830b6f', 297, 'MILITIA', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (143, 'IDE', '0xbebe4d5b1ee3654a70fd4c7c44037fe604b9f786', 957, 'IDEToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (144, 'MVS', 'TSik2N1C5pgkehF5DtTAvNeuPFXznkxcx5', 1054, 'MineralVirtualSpace', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (145, 'MVS', 'TSik2N1C5pgkehF5DtTAvNeuPFXznkxcx5', 1054, 'MineralVirtualSpace', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (146, 'MAYI', 'TXxoKWsyw5x3wdeWnsqedjSk5nuLUGXcfT', 1054, 'MAYILEN', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (147, 'REDFEG', '0x25574cad6f03ffacd9d08b288e8d5d88997fb2f3', 1353, 'RedFeg', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (148, 'X9C', '0x09c91b0324433372534b76040e38a0dba1a9ee52', 1350, 'X9C', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (149, 'X9C', '0x09c91b0324433372534b76040e38a0dba1a9ee52', 1350, 'X9C', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (150, 'MILIT', '0xeea7c025b1eee9527d631094d45ff9ce5d830b6f', 1353, 'MILITIA', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (151, 'DMAN', '0x838092375d1f10a9e6e0ad7787a4925f8dc34ea2', 730, 'Doge Man', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (152, 'FEG', '0xacfc95585d80ab62f67a14c566c1b7a49fe91167', 957, 'FEGtoken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (153, 'Panda', '0xc2a5fdfea2a04955df244eb52ffd986fa18cfcc6', 957, 'Panda Chain', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (154, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 1353, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (155, 'DOX', '0x30ea7c369b87fe261de28a1eefafe806696a738b', 1519, 'DOXXED', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (156, 'META', 'TY5WnpU6bLxKrrAaa7JSQht1sPdgU4hkyk', 123, 'META Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (157, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 1519, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (158, 'META', 'TY5WnpU6bLxKrrAaa7JSQht1sPdgU4hkyk', 123, 'META Token', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (159, 'MVS', 'TBTVVkezDX1J5u6EHbx1ihSyi68btHihGy', 957, 'MVS', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (160, 'MVS', 'TBTVVkezDX1J5u6EHbx1ihSyi68btHihGy', 957, 'MVS', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (161, 'LPT', '0xd5cbbf337b9baddc489eb088090f475ca0131a80', 957, 'Leopard', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (162, 'LPT', '0xd5cbbf337b9baddc489eb088090f475ca0131a80', 957, 'Leopard', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (163, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 711, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (164, 'BCK', 'TAqUEmadPVPCw6siP972Jguw6Gtt2XmDyf', 156, 'Blockchain Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (165, 'BCK', 'TAqUEmadPVPCw6siP972Jguw6Gtt2XmDyf', 156, 'Blockchain Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (166, 'BCK', 'TAqUEmadPVPCw6siP972Jguw6Gtt2XmDyf', 156, 'Blockchain Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (167, 'BCK', 'TAqUEmadPVPCw6siP972Jguw6Gtt2XmDyf', 156, 'Blockchain Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (168, 'BCK', 'TAqUEmadPVPCw6siP972Jguw6Gtt2XmDyf', 156, 'Blockchain Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (169, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 1519, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (170, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 111, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (171, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 111, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (172, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 111, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (173, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 304, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (174, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 304, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (175, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 304, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (176, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 114, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (177, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 109, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (178, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 109, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (179, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 237, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (180, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 957, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (181, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 160, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (182, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 160, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (183, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 160, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (184, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 117, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (185, 'WIN', 'TLa2f6VPqDgRE67v1736s7bJ8Ray5wYjU7', 1054, 'WINkLink', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (186, 'WIN', 'TLa2f6VPqDgRE67v1736s7bJ8Ray5wYjU7', 1054, 'WINkLink', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (187, 'DVI', 'TEMpB3ryvGaTofkpQrbCmN7ozSyrPV7UDr', 124, 'Da Vinci', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (188, 'DVI', 'TEMpB3ryvGaTofkpQrbCmN7ozSyrPV7UDr', 124, 'Da Vinci', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (189, 'DVI', 'TEMpB3ryvGaTofkpQrbCmN7ozSyrPV7UDr', 114, 'Da Vinci', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (190, 'DVI', 'TEMpB3ryvGaTofkpQrbCmN7ozSyrPV7UDr', 114, 'Da Vinci', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (191, 'PCE', '0x5b044a447271f2b981db555b49a7847598b0a05c', 1069, 'Precious Clean Energy', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (192, 'PCE', '0x5b044a447271f2b981db555b49a7847598b0a05c', 1069, 'Precious Clean Energy', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (193, 'SD', '0xcda06cd0acb76c4e4386cb27e8f5112ba5912025', 299, 'Good Shield', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (194, 'SD', '0xcda06cd0acb76c4e4386cb27e8f5112ba5912025', 114, 'Good Shield', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (195, 'PROT', '0xd3c9609b6cbc6ef02390f33c230590c38f9e5f9d', 297, 'Protein', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (196, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 676, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (197, 'BabyDoge', '0xc748673057861a797275cd8a068abb95a902e8de', 1529, 'Baby Doge Coin', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (198, 'FLOKI', '0x2b3f34e9d4b127797ce6244ea341a83733ddd6e4', 1529, 'FLOKI', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (199, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 1529, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (200, 'META', 'TY5WnpU6bLxKrrAaa7JSQht1sPdgU4hkyk', 217, 'META Token', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (201, 'META', 'TY5WnpU6bLxKrrAaa7JSQht1sPdgU4hkyk', 217, 'META Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (202, 'WIN', 'TLa2f6VPqDgRE67v1736s7bJ8Ray5wYjU7', 1054, 'WINkLink', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (203, 'WIN', 'TLa2f6VPqDgRE67v1736s7bJ8Ray5wYjU7', 1054, 'WINkLink', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (204, 'MUSK', '0x57c84b307735d19e514b4ada2826f540910ffa48', 957, 'MUSK', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (205, 'MUSK', '0x57c84b307735d19e514b4ada2826f540910ffa48', 957, 'MUSK', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (206, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 676, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (207, 'WIN', 'TLa2f6VPqDgRE67v1736s7bJ8Ray5wYjU7', 957, 'WINkLink', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (208, 'DVI', 'TEMpB3ryvGaTofkpQrbCmN7ozSyrPV7UDr', 1410, 'Da Vinci', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (209, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 805, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (210, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 805, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (211, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 156, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (212, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 156, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (213, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 642, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (214, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 805, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (215, 'META', 'TY5WnpU6bLxKrrAaa7JSQht1sPdgU4hkyk', 117, 'META Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (216, 'XTL', '0xb8225652d5903d51f079d9b191fa41f0ebfa392a', 796, 'X10Legend', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (217, 'XTL', '0xb8225652d5903d51f079d9b191fa41f0ebfa392a', 796, 'X10Legend', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (218, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 1534, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (219, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 1535, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (220, 'SPELL', '0x090185f2135308bad17527004364ebcc2d37e5f6', 1536, 'Spell Token', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (221, 'SPELL', '0x090185f2135308bad17527004364ebcc2d37e5f6', 1536, 'Spell Token', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (222, 'BEE', 'TYz2awuo1Ba75ZWSqQWPJmDmDc1gRUmDGj', 1394, 'BEE', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (223, 'BEE', 'TYz2awuo1Ba75ZWSqQWPJmDmDc1gRUmDGj', 1394, 'BEE', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (224, 'FEG', '0xacfc95585d80ab62f67a14c566c1b7a49fe91167', 1538, 'FEGtoken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (225, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 111, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (226, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 1540, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (227, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 1540, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (228, 'ARENA', '0x2a17dc11a1828725cdb318e0036acf12727d27a2', 1449, 'Arena Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (229, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 297, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (230, 'MDB', '0x033fc4ec65a22d29a87631e5fed9616a0d343f42', 1526, 'MetaDubai Coin', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (231, 'Gold', '0xb3a6381070b1a15169dea646166ec0699fdaea79', 1449, 'CyberDragon Gold', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (232, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 301, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (233, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 364, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (234, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 1538, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (235, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 1538, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (236, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 1538, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (237, 'fix', '0x506c02450e4963948d6f156c3cdecb7f8d2eb7f1', 299, 'flaming Phenix', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (238, 'SQUID', '0x1f878d0bccd3d502ff55f7a4797c556f103d6e4b', 1353, 'Squidanomics', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (239, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 298, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (240, 'MILIT', '0xeea7c025b1eee9527d631094d45ff9ce5d830b6f', 1054, 'MILITIA', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (241, 'FlokiFrunk', '0x53890b5e7eae02f9f375b59626961766974d79f7', 297, 'FlokiFrunkPuppy', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (242, 'THG', '0x9fd87aefe02441b123c3c32466cd9db4c578618f', 297, 'Thetan Arena', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (243, 'YAY', '0x524df384bffb18c0c8f3f43d012011f8f9795579', 111, 'YAY Games', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (244, 'MEPAD', '0x9d70a3ee3079a6fa2bb16591414678b7ad91f0b5', 297, 'MemePad', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (245, 'YAY', '0x524df384bffb18c0c8f3f43d012011f8f9795579', 117, 'YAY Games', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (246, 'YAY', '0x524df384bffb18c0c8f3f43d012011f8f9795579', 117, 'YAY Games', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (247, 'META', 'TY5WnpU6bLxKrrAaa7JSQht1sPdgU4hkyk', 109, 'META Token', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (248, 'META', 'TY5WnpU6bLxKrrAaa7JSQht1sPdgU4hkyk', 109, 'META Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (249, 'META', 'TY5WnpU6bLxKrrAaa7JSQht1sPdgU4hkyk', 109, 'META Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (250, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 114, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (251, 'NFS', '0x6ee002ce31ce4e52211eefb2d3986082663d5f60', 111, 'NFans', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (252, 'DVI', 'TEMpB3ryvGaTofkpQrbCmN7ozSyrPV7UDr', 1321, 'Da Vinci', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (253, 'CCB', 'TXT9SRaj6y5TJGcPd1C1J33EWGHhbsDCMJ', 114, 'Citizens Community Bank', NULL, 'mainnet');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (254, 'CCB', 'TXT9SRaj6y5TJGcPd1C1J33EWGHhbsDCMJ', 114, 'Citizens Community Bank', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (255, 'CCB', 'TXT9SRaj6y5TJGcPd1C1J33EWGHhbsDCMJ', 114, 'Citizens Community Bank', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (256, 'FEG', '0xacfc95585d80ab62f67a14c566c1b7a49fe91167', 1538, 'FEGtoken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (257, 'GFI', '0xdd6c6c114db071efe0bab6051268227ce64c3ffe', 297, 'GameFi', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (258, 'CRE', '0xe632101fb808de2a37c07c214f036f586acfb366', 315, 'CRuisE', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (259, 'CRE', '0xe632101fb808de2a37c07c214f036f586acfb366', 315, 'CRuisE', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (260, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 486, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (261, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 486, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (262, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 486, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (263, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 787, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (264, 'OUP', '0x07340f61633fc21b59edef1d4fb5c36cf1f098e2', 123, 'OnlyUp', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (265, 'OUP', '0x07340f61633fc21b59edef1d4fb5c36cf1f098e2', 123, 'OnlyUp', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (266, 'XTL', '0xb8225652d5903d51f079d9b191fa41f0ebfa392a', 796, 'X10Legend', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (267, 'BAO', '0xac019ee3863984ea66ab357a491d37fb2c9c6f17', 114, 'BAO', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (268, 'MI', '0xbf4c3c64f8c5ea2a6183f9fa22f8356a7ebb5f0c', 114, 'MosterIsland', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (269, 'ART', '0xd2f83cf5c697e892a38f8d1830eb88ebc0809a0c', 500, 'Artificial Reality Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (270, 'ART', '0xd2f83cf5c697e892a38f8d1830eb88ebc0809a0c', 500, 'Artificial Reality Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (271, 'ART', '0xd2f83cf5c697e892a38f8d1830eb88ebc0809a0c', 500, 'Artificial Reality Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (272, 'ART', '0xd2f83cf5c697e892a38f8d1830eb88ebc0809a0c', 500, 'Artificial Reality Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (273, 'ART', '0xd2f83cf5c697e892a38f8d1830eb88ebc0809a0c', 500, 'Artificial Reality Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (274, 'HARE', '0x4afc8c2be6a0783ea16e16066fde140d15979296', 1519, 'Hare Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (275, 'ILY', '0x5fd0a7e64c64d78c80d2117317b8b4120c90570b', 1350, 'I Love You', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (276, 'VALK', '0x405cff4ce041d3235e8b1f7aaa4e458998a47363', 1069, 'Valkyrio Token', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (277, 'ASPO', '0x1a9b49e9f075c37fe5f86c916bac9deb33556d7e', 1353, 'ASPOToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (278, 'IDO', '0x617ba3d39e96c084e60c6db3f7b365a96ee4e555', 1094, 'INTERSTELLAR DOMAIN ORDER', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (279, 'IDE', '0xbebe4d5b1ee3654a70fd4c7c44037fe604b9f786', 123, 'IDEToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (280, 'IDE', '0xbebe4d5b1ee3654a70fd4c7c44037fe604b9f786', 1048, 'IDEToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (281, 'IDE', '0xbebe4d5b1ee3654a70fd4c7c44037fe604b9f786', 1048, 'IDEToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (282, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 200, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (283, 'BNBH', '0xd25631648e3ad4863332319e8e0d6f2a8ec6f267', 805, 'BNBHeroToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (284, 'TZH', '0xd784b9e44c088c8b51ed7b6c9e16d6270a150f35', 676, 'TZHToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (285, 'TZH', '0xd784b9e44c088c8b51ed7b6c9e16d6270a150f35', 676, 'TZHToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (286, 'IDO', '0x617ba3d39e96c084e60c6db3f7b365a96ee4e555', 315, 'INTERSTELLAR DOMAIN ORDER', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (287, 'SQUID', '0x87230146e138d3f296a9a77e497a2a83012e9bc5', 1553, 'Squid Game', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (288, 'GOS', '0x4107b505fc5d162243dfb4969294921f0481f503', 1553, 'GOSToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (289, 'DogeZilla', '0x7a565284572d03ec50c35396f7d6001252eb43b6', 1553, 'DogeZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (290, 'IDO', '0x617ba3d39e96c084e60c6db3f7b365a96ee4e555', 123, 'INTERSTELLAR DOMAIN ORDER', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (291, 'SPACESHIB', '0x08d84c505908d1e14c6594e1c99cf71b6f8b550c', 1350, 'SpaceShib', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (292, 'MILKY', '0xa7002fccc20f10a38c579a8d2d14d34f2a9a02a5', 1350, 'MilkyWayEx', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (293, 'MILKY', '0xa7002fccc20f10a38c579a8d2d14d34f2a9a02a5', 1350, 'MilkyWayEx', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (294, 'IDO', '0x617ba3d39e96c084e60c6db3f7b365a96ee4e555', 1350, 'INTERSTELLAR DOMAIN ORDER', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (295, 'PFW', '0xbdfab42a028770f42a37458dc1bfe9531158826d', 1350, 'Perfect World', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (296, 'PFW', '0xbdfab42a028770f42a37458dc1bfe9531158826d', 1350, 'Perfect World', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (297, 'IDO', '0x617ba3d39e96c084e60c6db3f7b365a96ee4e555', 315, 'INTERSTELLAR DOMAIN ORDER', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (298, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 796, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (299, 'DM', '0xe34dd97283799ea1fd385db721c97d77640456fc', 796, 'DMToken', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (300, 'LY', '0x2f3c6d2fea752942856f8e34af26ae76f4bbf53c', 805, 'LY', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (301, 'PDT', 'TFpqLdyzdSnfEGMrZR4d3R3gb5Nt2jDgmz', 958, 'Parallel Universe Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (302, 'PDT', 'TFpqLdyzdSnfEGMrZR4d3R3gb5Nt2jDgmz', 958, 'Parallel Universe Token', NULL, 'trx');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (303, 'SCORPFIN', '0x475c8df9860e42605d9917f0a2e522cc861cbf82', 1519, 'Scorpion Finance', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (304, 'SCORPFIN', '0x475c8df9860e42605d9917f0a2e522cc861cbf82', 1519, 'Scorpion Finance', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (305, '$META', '0xbe5e820ed156a345191dcc976ad3752075ebcb79', 1350, 'MetaZuckZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (306, '$META', '0xbe5e820ed156a345191dcc976ad3752075ebcb79', 1350, 'MetaZuckZilla', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (307, 'DOD', '0xc709878167ed069aea15fd0bd4e9758ceb4da193', 676, 'Day Of Defeat', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (308, 'DOD', '0xc709878167ed069aea15fd0bd4e9758ceb4da193', 676, 'Day Of Defeat', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (309, 'DOD', '0xc709878167ed069aea15fd0bd4e9758ceb4da193', 676, 'Day Of Defeat', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (310, 'DOD', '0xc709878167ed069aea15fd0bd4e9758ceb4da193', 1519, 'Day Of Defeat', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (311, 'DOD', '0xc709878167ed069aea15fd0bd4e9758ceb4da193', 1519, 'Day Of Defeat', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (312, 'ZOON', '0x9d173e6c594f479b4d47001f8e6a95a7adda42bc', 1519, 'CryptoZoon', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (313, 'FCC', '0x7303db6d69c30da844ef9fd84af1b82b5009fd8c', 1094, 'FCC', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (314, 'GoofyDoge', '0xea7de2a4973f3b3fc1591972a30781899a0961cf', 676, 'GoofyDoge', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (315, 'FCC', '0x7303db6d69c30da844ef9fd84af1b82b5009fd8c', 676, 'FCC', NULL, 'bsc');
INSERT INTO `ocenter_dman_useraddcoin` VALUES (316, 'CTH', 'TJmki9vmWXP6QxHJ9JVCd5iyAs8xwS5HL4', 874, 'Payment chain', NULL, 'trx');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_dman_walletaddress
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_dman_walletaddress`;
CREATE TABLE `ocenter_dman_walletaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `wallet_file` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `gas` varchar(255) DEFAULT NULL,
  `balance_weth` decimal(18,8) DEFAULT NULL,
  `balance_eth` decimal(18,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_dman_walletaddress
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_dman_walletaddress` VALUES (8, 'account1', '0x31fc7ad4f3c89dddf1967805013fb3aaaf66ff32', 'UTC--2021-03-03T16-17-03.387000000Z--31fc7ad4f3c89dddf1967805013fb3aaaf66ff32.json', '0', '0', 0.00000000, 0.02115100);
INSERT INTO `ocenter_dman_walletaddress` VALUES (9, 'account2', '0x079d6a56ac0aca6c2afdb57f6f486d51d92a59a9', 'UTC--2021-03-03T16-17-25.918000000Z--079d6a56ac0aca6c2afdb57f6f486d51d92a59a9.json', '0', '0', 0.00000000, 0.02115100);
INSERT INTO `ocenter_dman_walletaddress` VALUES (10, 'account3', '0xf2fc468a713e7d57fa9b7b05f616b65d41d7370a', 'UTC--2021-03-03T16-17-44.109000000Z--f2fc468a713e7d57fa9b7b05f616b65d41d7370a.json', '0', '0', 0.00000000, 0.02115100);
INSERT INTO `ocenter_dman_walletaddress` VALUES (11, 'account4', '0xc9eaf0fc264b1f75ac8a4fcdf9ff1f81f3c63a37', 'UTC--2021-03-03T18-24-08.824000000Z--c9eaf0fc264b1f75ac8a4fcdf9ff1f81f3c63a37.json', '0', '0', 0.00000000, 0.02115100);
INSERT INTO `ocenter_dman_walletaddress` VALUES (12, 'account5', '0x3603286cf93878772612caaaeb1d2a88a110757a', 'UTC--2021-03-03T18-24-14.56000000Z--3603286cf93878772612caaaeb1d2a88a110757a.json', '0', '0', 0.00000000, 0.02115100);
INSERT INTO `ocenter_dman_walletaddress` VALUES (13, 'account6', '0x395a8ad6081f8e941a64a5e1e4034018111c8760', 'UTC--2021-03-03T18-24-24.671000000Z--395a8ad6081f8e941a64a5e1e4034018111c8760.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (15, 'account7', '0xfe3dd7d8475955bda59520a5f65021836905ed0d', 'UTC--2021-03-03T19-27-12.279000000Z--fe3dd7d8475955bda59520a5f65021836905ed0d.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (16, 'account8', '0x0b5ab0c2396a68022f944c3c7e23101d0bba0275', 'UTC--2021-03-03T19-27-21.387000000Z--0b5ab0c2396a68022f944c3c7e23101d0bba0275.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (17, 'account9', '0xe7c0624580f6898487bcf7a588fbb5405cfc0279', 'UTC--2021-03-03T19-27-30.559000000Z--e7c0624580f6898487bcf7a588fbb5405cfc0279.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (18, 'account10', '0xb00ca1e404f552c121aadced518c10fa23c368a7', 'UTC--2021-03-03T19-27-39.516000000Z--b00ca1e404f552c121aadced518c10fa23c368a7.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (19, 'account11', '0x2e0c39aa9ec0fc4267695a45c03f51b9a08d7811', 'UTC--2021-03-03T19-27-48.943000000Z--2e0c39aa9ec0fc4267695a45c03f51b9a08d7811.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (20, 'account12', '0x3271324fe1470199d31943b32e10f2e520f0138c', 'UTC--2021-03-03T19-27-58.304000000Z--3271324fe1470199d31943b32e10f2e520f0138c.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (21, 'account13', '0xb0fc4bac249218f72f29a3d915e216aea872d008', 'UTC--2021-03-03T19-28-08.194000000Z--b0fc4bac249218f72f29a3d915e216aea872d008.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (22, 'account14', '0x5d18cbaefabb12ad9d960e2e3b9b2d972ab0db4d', 'UTC--2021-03-03T19-28-17.252000000Z--5d18cbaefabb12ad9d960e2e3b9b2d972ab0db4d.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (23, 'account15', '0x80f83c41cb637ca3fa096f8f3747290543d747be', 'UTC--2021-03-03T19-28-28.50000000Z--80f83c41cb637ca3fa096f8f3747290543d747be.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (24, 'account16', '0x0efa671f7c827533108f4833a51470fedd96f6a1', 'UTC--2021-03-03T19-28-38.744000000Z--0efa671f7c827533108f4833a51470fedd96f6a1.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (25, 'account17', '0x57178fe2b79c57a86b24e00e63db5f29b2f7860c', 'UTC--2021-03-03T19-28-48.846000000Z--57178fe2b79c57a86b24e00e63db5f29b2f7860c.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (26, 'account18', '0xcf8e6c7fe9971b03a6a725e03c5acf678bce8b47', 'UTC--2021-03-03T19-28-58.887000000Z--cf8e6c7fe9971b03a6a725e03c5acf678bce8b47.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (27, 'account19', '0x9e3818a478c08c4cfb15048d4ac9310bba03e404', 'UTC--2021-03-03T19-29-10.335000000Z--9e3818a478c08c4cfb15048d4ac9310bba03e404.json', '0', '0', 0.00000000, 0.00000000);
INSERT INTO `ocenter_dman_walletaddress` VALUES (28, 'account20', '0x49ba7704c28fe72a1e28fb3edccb0de5bf9bd285', 'UTC--2021-03-03T19-29-20.999000000Z--49ba7704c28fe72a1e28fb3edccb0de5bf9bd285.json', '0', '0', 0.00000000, 0.00000000);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_email
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_email`;
CREATE TABLE `ocenter_email` (
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(255) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(255) DEFAULT NULL,
  `smtp_email` varchar(255) DEFAULT NULL,
  `smtp_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_email
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_email` VALUES ('smtpout.secureserver.net', 'service@dman.app', 'PZwg68Q2mY9l3Ab', '465', 'service@dman.app', 'DMANSWAP');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_expression
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_expression`;
CREATE TABLE `ocenter_expression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `path` varchar(200) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `expression_pkg_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_expression
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_expression_pkg
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_expression_pkg`;
CREATE TABLE `ocenter_expression_pkg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pkg_title` varchar(50) NOT NULL,
  `pkg_name` varchar(50) NOT NULL,
  `path` varchar(200) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_expression_pkg
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_field
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_field`;
CREATE TABLE `ocenter_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_data` varchar(1000) NOT NULL,
  `createTime` int(11) NOT NULL,
  `changeTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_field
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_field_group
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_field_group`;
CREATE TABLE `ocenter_field_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_field_group
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_field_group` VALUES (1, '个人资料', 1, 1403847366, 0, 1);
INSERT INTO `ocenter_field_group` VALUES (2, '开发者资料', 1, 1423537648, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_field_setting
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_field_setting`;
CREATE TABLE `ocenter_field_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(25) NOT NULL,
  `profile_group_id` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  `form_type` varchar(25) NOT NULL,
  `form_default_value` varchar(200) NOT NULL,
  `validation` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `child_form_type` varchar(25) NOT NULL,
  `input_tips` varchar(100) NOT NULL COMMENT '输入提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_field_setting
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_field_setting` VALUES (1, 'qq', 1, 1, 1, 0, 'input', '', '', 1, 1409045825, 'string', '');
INSERT INTO `ocenter_field_setting` VALUES (2, '生日', 1, 1, 1, 0, 'time', '', '', 1, 1423537409, '', '');
INSERT INTO `ocenter_field_setting` VALUES (3, '擅长语言', 2, 1, 1, 0, 'select', 'Java|C++|Python|php|object c|ruby', '', 1, 1423537693, '', '');
INSERT INTO `ocenter_field_setting` VALUES (4, '承接项目', 2, 1, 1, 0, 'radio', '是|否', '', 1, 1423537733, '', '');
INSERT INTO `ocenter_field_setting` VALUES (5, '简介', 2, 1, 1, 0, 'textarea', '', '', 1, 1423537770, '', '简单介绍入行以来的工作经验，项目经验');
INSERT INTO `ocenter_field_setting` VALUES (6, '其他技能', 2, 1, 1, 0, 'checkbox', 'PhotoShop|Flash', '', 1, 1423537834, '', '');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_file
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_file`;
CREATE TABLE `ocenter_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(255) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  `driver` varchar(50) NOT NULL,
  `download_num` int(11) NOT NULL DEFAULT '0' COMMENT '下载数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM AUTO_INCREMENT=262 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of ocenter_file
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_file` VALUES (1, '1534813726-IMG_4292.JPG', '6107b91973f5e.JPG', '/Uploads/Download/2021-08-02/', 'JPG', 'image/jpeg', 97219, '96fada52a5f317eaff7929319d13d37f', '852db64759cfd7f05f2446243b8540fbcff7a6c3', 0, 1627896089, 'local', 0);
INSERT INTO `ocenter_file` VALUES (2, '1627896261831_1534993188-IMG_4299.JPG', '6107b9c79c693.JPG', '/Uploads/Download/2021-08-02/', 'JPG', 'image/jpeg', 629776, '2f7358844768005155dc0dc873e45213', 'd2f07efc2b8451f7c23358cf3660a94c2f5b0af7', 0, 1627896263, 'local', 0);
INSERT INTO `ocenter_file` VALUES (3, '1536028905-IMG_4323.JPG', '6107bf355b47d.JPG', '/Uploads/Download/2021-08-02/', 'JPG', 'image/jpeg', 495213, '12aa7373558e691c5c677b7804745cdc', '4b57b5b602fd33caba63d7c47e0cdb013ef9c6a5', 0, 1627897653, 'local', 0);
INSERT INTO `ocenter_file` VALUES (4, '1627897650943_1534993210-IMG_4300.JPG', '6107bf364fc97.JPG', '/Uploads/Download/2021-08-02/', 'JPG', 'image/jpeg', 602110, '8bc4f909c9ba51819f9bdedc8ca4007b', 'eb4668b99d194dd9143553891ec3689668b72a69', 0, 1627897654, 'local', 0);
INSERT INTO `ocenter_file` VALUES (5, '1531729956-IMG_4118.JPG', '6107c0edddfcc.JPG', '/Uploads/Download/2021-08-02/', 'JPG', 'image/jpeg', 136863, '3c5cc2a827f5b81f1aa3dbd7913f27c6', 'c88d5b5da729233b04426d14b9493a9c7d6750d2', 0, 1627898093, 'local', 0);
INSERT INTO `ocenter_file` VALUES (6, '1627898093007_1527652405-IMG_3887.JPG', '6107c0ee613ec.JPG', '/Uploads/Download/2021-08-02/', 'JPG', 'image/jpeg', 253354, 'fb73dad427f1848cbdccc90f5e465897', '269565114f041241e5670d79140a35bf0e1ccdd7', 0, 1627898094, 'local', 0);
INSERT INTO `ocenter_file` VALUES (7, '1627898611625_1526619265-IMG_3852.JPG', '6107c2f53d349.JPG', '/Uploads/Download/2021-08-02/', 'JPG', 'image/jpeg', 623468, '77da8dbd830585c6a1652134352b513c', '3f516b118a87c1cb332f91ba332a3e865bfd2c9b', 0, 1627898613, 'local', 0);
INSERT INTO `ocenter_file` VALUES (8, 'mmexport1628431825052.jpg', '61113deb3eed3.jpg', '/Uploads/Download/2021-08-09/', 'jpg', 'image/jpeg', 77524, 'ef3d9008b56fa4df8a2f4b78c00aae60', 'e78599db2bde25321a77e5ba0be444f1b359c17b', 0, 1628519915, 'local', 0);
INSERT INTO `ocenter_file` VALUES (9, 'mmexport1628571633598.jpg', '61121000270b1.jpg', '/Uploads/Download/2021-08-10/', 'jpg', 'image/jpeg', 63169, 'abcb36234406f52a19482038844679c3', 'b4cb5524af7e8b30b39bdc83334af41e00b685b2', 0, 1628573696, 'local', 0);
INSERT INTO `ocenter_file` VALUES (10, 'mmexport1626608013059.jpg', '611210bd43e9d.jpg', '/Uploads/Download/2021-08-10/', 'jpg', 'image/jpeg', 38456, '7a5e2cf9345a2b9c628124ad435081e5', 'eed8bd8bf7e7a53886cbccde8bd9a86705e66fb3', 0, 1628573885, 'local', 0);
INSERT INTO `ocenter_file` VALUES (11, '1629115497317_1526619271-IMG_3853.JPG', '611a547258a88.JPG', '/Uploads/Download/2021-08-16/', 'JPG', 'image/jpeg', 622489, '271d0c557bf1802968f257e81a7f509b', '370ced34158c764adb1f1d020bdfb61f6334af96', 0, 1629115506, 'local', 0);
INSERT INTO `ocenter_file` VALUES (12, '1629115497692_1526619287-IMG_3854.JPG', '611a54754e9f6.JPG', '/Uploads/Download/2021-08-16/', 'JPG', 'image/jpeg', 541002, '95552645d6ba859d3763fd1d25149db3', '8b0013a31c184be7529f78e489d416b2f954cd31', 0, 1629115509, 'local', 0);
INSERT INTO `ocenter_file` VALUES (13, '1629115498031_1526619303-IMG_3855.JPG', '611a5478121c6.JPG', '/Uploads/Download/2021-08-16/', 'JPG', 'image/jpeg', 515048, '2af67ed0f4fd44a495aaf87eb8f2894a', 'daf6e0f7e61dcb44aa6438deba7808937cb555b5', 0, 1629115511, 'local', 0);
INSERT INTO `ocenter_file` VALUES (14, '1629115499508_1526619332-IMG_3856.JPG', '611a5481abe2e.JPG', '/Uploads/Download/2021-08-16/', 'JPG', 'image/jpeg', 971372, 'b23636690b758ecc0c3365f25b32469f', '5f5d8419ee8c788448ecc5addb57cb0f57b8e3b6', 0, 1629115521, 'local', 0);
INSERT INTO `ocenter_file` VALUES (15, '16297975579030.jpg', '6124bcb6a5b7c.jpg', '/Uploads/Download/2021-08-24/', 'jpg', 'image/jpeg', 45345, '616c861e2f018baf36b8f6bd3148d205', '6192e9d465c99e8931f1cb30e74182bf28d59f65', 0, 1629797558, 'local', 0);
INSERT INTO `ocenter_file` VALUES (16, '16297984128150.jpg', '6124c00d90dac.jpg', '/Uploads/Download/2021-08-24/', 'jpg', 'image/jpeg', 140969, '99e895abcbdfc385368778448ae66af3', '8b6743ad6ab12421476600b9526426c6e9abc4bc', 0, 1629798413, 'local', 0);
INSERT INTO `ocenter_file` VALUES (17, '16297985554950.jpg', '6124c09c1a348.jpg', '/Uploads/Download/2021-08-24/', 'jpg', 'image/jpeg', 46247, '7ef57b74a7508e0bcc8d0a8d5870d692', '32404c64abd0fc9f645b2b645bfdca8d5a31f9de', 0, 1629798556, 'local', 0);
INSERT INTO `ocenter_file` VALUES (18, '16297990728820.jpg', '6124c2a1ac675.jpg', '/Uploads/Download/2021-08-24/', 'jpg', 'image/jpeg', 161713, '5d19bd3927d5926ec89a1668f4b77a0a', 'a9004ef53b16a468496bb20c51279227a0a91ae7', 0, 1629799073, 'local', 0);
INSERT INTO `ocenter_file` VALUES (19, '1630584452471_Screenshot_20210901_225111_vip.mytokenpocket.jpg', '6130be85809ff.jpg', '/Uploads/Download/2021-09-02/', 'jpg', 'image/jpeg', 365359, '6190c88a5fdcef3f1181d05091d1de3f', '58ce0839507f3b4d3c8fa9e4fbe946ecb811f841', 0, 1630584453, 'local', 0);
INSERT INTO `ocenter_file` VALUES (20, '1630584452493_mmexport0c72ac0404210d00f56f34180027d25f_1629268782563.jpeg', '6130be85c56ab.jpeg', '/Uploads/Download/2021-09-02/', 'jpeg', 'image/jpeg', 37089, '21eb13fc9a426ec2f55a7caee32e5910', '0e17876e4bdb0185605f47b2b68878d1ff1cec95', 0, 1630584453, 'local', 0);
INSERT INTO `ocenter_file` VALUES (21, '1630584452504_mmexport5912040d97f4dc0f6bb15383b9d6ed66_1629271033195.png', '6130be8620d12.png', '/Uploads/Download/2021-09-02/', 'png', 'image/jpeg', 33032, '2fda2fb9a682ea7f8e6221010a164833', '306570dfce92a7cfca2fae4a4d361e090b4ecde4', 0, 1630584454, 'local', 0);
INSERT INTO `ocenter_file` VALUES (22, '1630584452519_mmexport95ccf077fa991b94ea67c6d2b049d001_1629270442337.jpeg', '6130be8678cae.jpeg', '/Uploads/Download/2021-09-02/', 'jpeg', 'image/jpeg', 30243, '0b5bf0601ea6a723b2c62b66dee92ec1', 'd99db71aa78c8dbceb4ea364e0b1a9ab4323d824', 0, 1630584454, 'local', 0);
INSERT INTO `ocenter_file` VALUES (23, '1630584452529_mmexport90016aada86b0d5148aaa16ac4d2e5f9_1629084795478.png', '6130be86c47b4.png', '/Uploads/Download/2021-09-02/', 'png', 'image/jpeg', 22711, '6c3579236ba077cbca9f28b2abd3626d', '02e869d3e8cf88588023181b39ba9809c8b440d4', 0, 1630584454, 'local', 0);
INSERT INTO `ocenter_file` VALUES (24, '1630584502230.jpg', '6130bedbc8899.jpg', '/Uploads/Download/2021-09-02/', 'jpg', 'image/jpeg', 2982316, '96276647d5ff5bdd9dce5ea96587f12d', 'd80b329e46b824e9d1ade1bff2678e2185183232', 0, 1630584539, 'local', 0);
INSERT INTO `ocenter_file` VALUES (25, '16305946330110.jpg', '6130e6483a0c0.jpg', '/Uploads/Download/2021-09-02/', 'jpg', 'image/jpeg', 50342, '778df14286a54d8dcc8df7fa7eccdc07', '6ffec403cae03fc1772a3adef2674b2ee2918550', 0, 1630594632, 'local', 0);
INSERT INTO `ocenter_file` VALUES (26, '16306505960310.jpg', '6131c0e49d277.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 73377, '66f80e8e91786992d81df91cb85bb0bd', '4c3cb6b1dced599188e01c8f5dda7abc2b9939f3', 0, 1630650596, 'local', 0);
INSERT INTO `ocenter_file` VALUES (27, '16306506204240.jpg', '6131c0fcdc632.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 73635, '6fa695b0677d7b6d7864b5c80e4957ae', '9238d2fd988eb0a074718fc3c2589eff8bb02021', 0, 1630650620, 'local', 0);
INSERT INTO `ocenter_file` VALUES (28, '16306506508410.jpg', '6131c11b601df.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 87315, '709fa30761c0e562fc6998b30f5ed826', 'f2c17bf2f8e433fcb792181938b8c394a90221e3', 0, 1630650651, 'local', 0);
INSERT INTO `ocenter_file` VALUES (29, '1630662649354_mmexport1630660835966.png', '6131effb0fa4b.png', '/Uploads/Download/2021-09-03/', 'png', 'image/jpeg', 24463, '1b0e23409b47bede81ce48046b0a87d3', 'e8ddbbde7c2d45d2e5ef3b686ab07545d1b6ad2d', 0, 1630662650, 'local', 0);
INSERT INTO `ocenter_file` VALUES (30, 'nft1.png', '6131f0a662c34.png', '/Uploads/Download/2021-09-03/', 'png', 'image/png', 1270, '0541be14207d2ce88795e7d311faa8e1', 'e8bc3dfcebfc5a2d5f70a1923222ea2cf40c707d', 0, 1630662822, 'local', 0);
INSERT INTO `ocenter_file` VALUES (31, 'defi1.png', '6131f0a6a8fab.png', '/Uploads/Download/2021-09-03/', 'png', 'image/png', 1858, '90afe810f3fe54ef80effe1aef6fbc74', '2ebc03ff3895b6d11039ec8cad2109af8454e6e4', 0, 1630662822, 'local', 0);
INSERT INTO `ocenter_file` VALUES (32, '1630666798374_IMG_20210903_171311.jpg', '613200300ca28.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 45455, 'a5fbcb725ebb1fbfdb570ae71a01fcfb', '8c180144de23c8eb6373c9a66b233bce18d33872', 0, 1630666800, 'local', 0);
INSERT INTO `ocenter_file` VALUES (33, '1630666990668_Screenshot_20210903_190251_com.huobi.jpg', '613200eec8e8b.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 71545, 'af2d9dce794844a15208bdbeabdc988a', '3bb88d14997a87d2f8bd36088e16c4fdc1ac412f', 0, 1630666990, 'local', 0);
INSERT INTO `ocenter_file` VALUES (34, '1630667053093_Screenshot_20210903_190354.jpg', '6132012d60b24.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 128758, '7185df31ce20da420901d75578088094', '62c46343abab9ad1b079acf374f3e0a218cb9f51', 0, 1630667053, 'local', 0);
INSERT INTO `ocenter_file` VALUES (35, '1630667053152_Screenshot_20210903_190338.jpg', '6132012da433f.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 56303, 'ac834f3e5ab70fdbd5ff291ef2a373ca', 'e5952303a418ab4914452e808838e26c272c679c', 0, 1630667053, 'local', 0);
INSERT INTO `ocenter_file` VALUES (36, '549952ed6457bb38c88269f17f2be844.png', '613201b6bc05c.png', '/Uploads/Download/2021-09-03/', 'png', 'image/png', 167896, '1a64e5c1ba2c1e8bf03a6955c05feaa3', 'a4e9e974905dad1313732aa8e028f81c7f75f4a9', 0, 1630667190, 'local', 0);
INSERT INTO `ocenter_file` VALUES (37, '1630667490193_Screenshot_20210903_191116.jpg', '613202e41ff2e.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 119685, '11f9597cb84829a30934573d7ef736ff', '5937eff91d000d70e1eaf7b412a69088e4072fdd', 0, 1630667492, 'local', 0);
INSERT INTO `ocenter_file` VALUES (38, 'mmexport1630130123821.jpg', '613204b4e9cb3.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 290203, 'dba682aa3c917c60cd399236186bf907', 'af5243872aae9e7d409b2c0b372ab385aa76b8dc', 0, 1630667956, 'local', 0);
INSERT INTO `ocenter_file` VALUES (39, 'IMG_20210903_192908_482.jpg', '61320fe904621.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 33578, 'db7434a904cdc3cfb42ede18e825f5ea', 'e513ac9e7867d91fb4b1f882d20e7f44d2620e76', 0, 1630670824, 'local', 0);
INSERT INTO `ocenter_file` VALUES (40, '16306715187000.jpg', '6132129ee8305.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 40113, 'bfa1feb69f38e7bd90935e9fe08ee0ef', 'c579befcb16b76f1144774de681fa67592842ef0', 0, 1630671518, 'local', 0);
INSERT INTO `ocenter_file` VALUES (41, '16306715403480.jpg', '613212b65cb3a.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 66497, '9418d2e0e7decc05bc1f21cc52d5bcf7', '264192d5e5a0a4eb8735252aa069ef60b251f5e3', 0, 1630671542, 'local', 0);
INSERT INTO `ocenter_file` VALUES (42, 'IMG_20210903_202429_502.jpg', '613214647834b.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 33807, '03662a4baef6c0185bcb7434b5c21730', '06827cc12899a36ac6a2ef81949cf5793affbddb', 0, 1630671972, 'local', 0);
INSERT INTO `ocenter_file` VALUES (43, '16306720269760.jpg', '6132149c19beb.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 24040, 'f9dab943f55ec82210d7655bb26611ed', 'e20cfb79374ee52b73515f3c165ce297197ee8a2', 0, 1630672028, 'local', 0);
INSERT INTO `ocenter_file` VALUES (44, 'mmexport1630674568917.jpg', '613220eb0195d.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 11164, '31995f25fac8cf046b3251477f5e64b2', '9b6e4d92c06778eb63ce7019011ff34788f5feba', 0, 1630675178, 'local', 0);
INSERT INTO `ocenter_file` VALUES (45, '16306795374280.jpg', '613231f39db3e.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 48770, 'c3c8b1e7041855938e4ee0201cfa14a8', '7f8088bea2afe741bd6d7f2191c9f2bd9a291e19', 0, 1630679539, 'local', 0);
INSERT INTO `ocenter_file` VALUES (46, '16306795813130.jpg', '6132321eac5b5.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 31961, '3a7af89665a07e544366ce5754192172', '98e328fd424341371dfa7c9d8411a2886b3468e6', 0, 1630679582, 'local', 0);
INSERT INTO `ocenter_file` VALUES (47, 'Screenshot_20210903_212249_com.tencent.mm_edit_148865723538742.jpg', '613232c60c046.jpg', '/Uploads/Download/2021-09-03/', 'jpg', 'image/jpeg', 78562, '58397a9a52912bfa89e79f54ec3fc681', '2e582136a3f890fb9c6e56ef16691c7a905bebb1', 0, 1630679750, 'local', 0);
INSERT INTO `ocenter_file` VALUES (48, '16307104931860.jpg', '6132aadd98183.jpg', '/Uploads/Download/2021-09-04/', 'jpg', 'image/jpeg', 60151, '742510a79b3ea8c7f662464e17143cf2', 'a5a45c239633e4212eadd31cb0a87a328f7f3d24', 0, 1630710493, 'local', 0);
INSERT INTO `ocenter_file` VALUES (49, '1630719816740_mmexport1630719687529.jpg', '6132cf48e7ffe.jpg', '/Uploads/Download/2021-09-04/', 'jpg', 'image/jpeg', 50247, 'ac6ce509b9bf5e86645e36c91ca034f8', 'a28e2649d0613f35a1111c02bd1487345f3fff63', 0, 1630719816, 'local', 0);
INSERT INTO `ocenter_file` VALUES (50, '1630737582656_mmexport1630671504903.png', '613314aedb593.png', '/Uploads/Download/2021-09-04/', 'png', 'image/jpeg', 26981, '61e7b691f21553610ef02bc2c8cd88eb', 'fe6bdb8f923968d418e1b67a885ea09e4784cd09', 0, 1630737582, 'local', 0);
INSERT INTO `ocenter_file` VALUES (51, '1630737582676_1630714986375.jpg', '613314af34f71.jpg', '/Uploads/Download/2021-09-04/', 'jpg', 'image/jpeg', 43041, '617c0e53b0c7fbfcab44c0d07dd52e23', '47d944ecf3e0c331a6f691f99e4d6e230acfd458', 0, 1630737583, 'local', 0);
INSERT INTO `ocenter_file` VALUES (52, 'mmexport1629956502241.jpg', '61341bfdc3ecb.jpg', '/Uploads/Download/2021-09-05/', 'jpg', 'image/jpeg', 319417, 'dbd334920e9427c9c848be0ddee8002a', '585b662377e8e0f084cdbbe7e17e46e3fa21c5bf', 0, 1630804989, 'local', 0);
INSERT INTO `ocenter_file` VALUES (53, '16308312300840.jpg', '6134827eae413.jpg', '/Uploads/Download/2021-09-05/', 'jpg', 'image/jpeg', 50605, '0ce1d27ef718f7183977428b8d89b2ba', '1a2484362895f566fa4e95e60bcee573075f8469', 0, 1630831230, 'local', 0);
INSERT INTO `ocenter_file` VALUES (54, '16308354587290.jpg', '6134930337e8b.jpg', '/Uploads/Download/2021-09-05/', 'jpg', 'image/jpeg', 107724, '2977719919b9def365a9250fd5ff6c02', '7a9afdf4fc1e21cc1467763ece348e47a4c4d6d5', 0, 1630835459, 'local', 0);
INSERT INTO `ocenter_file` VALUES (55, '1630889747068_Screenshot_20210905_232700_vip.mytokenpocket.jpg', '61356714667b9.jpg', '/Uploads/Download/2021-09-06/', 'jpg', 'image/jpeg', 98242, 'f28ce7966675d423c8881f1f58157704', 'b0b513a3279528657f16f66447e5f23644c878b4', 0, 1630889748, 'local', 0);
INSERT INTO `ocenter_file` VALUES (56, '613314aedb593.png', '6135f0dc7f544.png', '/Uploads/Download/2021-09-06/', 'png', 'image/jpeg', 68383, '6e393456fead36906bb49396b2955e82', 'e9d62a5c79fcb157af05f6f48b16893e1f845457', 0, 1630925020, 'local', 0);
INSERT INTO `ocenter_file` VALUES (57, '1631147218903_mmexport1631147152176.jpg', '613954d2c94e8.jpg', '/Uploads/Download/2021-09-09/', 'jpg', 'image/jpeg', 39545, '6cde83e7a2eb78d65ec20f31af6d8240', 'c65ae2b0ce959aa71c574bc1abe654d62ba0e0e5', 0, 1631147218, 'local', 0);
INSERT INTO `ocenter_file` VALUES (58, '1631147218923_mmexport875ca7a31334ef9384d3909919792b9a_1631147164901.png', '613954d31b9ab.png', '/Uploads/Download/2021-09-09/', 'png', 'image/jpeg', 38096, 'c6d839cdea9aba51cf19f9dd2c3ad1a2', '149892a6776788a2ee03a1f3fd28318cbfeff6c4', 0, 1631147219, 'local', 0);
INSERT INTO `ocenter_file` VALUES (59, 'Screenshot_20210909_145127_com.android.browser.jpg', '6139afc8a0eec.jpg', '/Uploads/Download/2021-09-09/', 'jpg', 'image/jpeg', 2179546, '7cd4a57f5002a747a3eb61e4f8abb81d', 'f499a24d1fc1018159c3345dfdcdd6dfde5921e9', 0, 1631170504, 'local', 0);
INSERT INTO `ocenter_file` VALUES (60, '1631254230-origin-IMG_0934.PNG', '613af6eca67d8.PNG', '/Uploads/Download/2021-09-10/', 'PNG', 'image/jpeg', 1100635, '5c84b35cbb75316f7b494759183a03a0', 'df9c068499b6f34c1fd40b9ba21c913c986f378b', 0, 1631254252, 'local', 0);
INSERT INTO `ocenter_file` VALUES (61, '16312543592340.jpg', '613af757e6aa9.jpg', '/Uploads/Download/2021-09-10/', 'jpg', 'image/jpeg', 110921, 'ea92a923151a585e3287bec4723119f7', '5fe224c161e1630bba010d931bd85e0655a5016c', 0, 1631254359, 'local', 0);
INSERT INTO `ocenter_file` VALUES (62, '16312795365370.jpg', '613b59b1babba.jpg', '/Uploads/Download/2021-09-10/', 'jpg', 'image/jpeg', 25883, '8802bdff2ca70fe1beb9e55949225664', 'a0f14f37095530346d5582b734950f8ff1c2a624', 0, 1631279537, 'local', 0);
INSERT INTO `ocenter_file` VALUES (63, '1631348334580_Screenshot_20210911_161819_com.defiman.client.jpg', '613c667045b9b.jpg', '/Uploads/Download/2021-09-11/', 'jpg', 'image/jpeg', 119679, 'da0f7fc61e7be9ab2f090cc077470a53', '5444a944b5dbc38c161ea6a3b7bf0e213260fc0d', 0, 1631348336, 'local', 0);
INSERT INTO `ocenter_file` VALUES (64, '1631348334721_Screenshot_20210911_161827_com.defiman.client.jpg', '613c6670c3b18.jpg', '/Uploads/Download/2021-09-11/', 'jpg', 'image/jpeg', 78396, 'ebe9a18ab0a30e2635bcd1d0f7bbd791', '7ff6bdcb65ddf2cde357bc98694d45fa427cc885', 0, 1631348336, 'local', 0);
INSERT INTO `ocenter_file` VALUES (65, 'Screenshot_20210911_161819_com.defiman.client.jpg', '613c667d0fe3a.jpg', '/Uploads/Download/2021-09-11/', 'jpg', 'image/jpeg', 393435, 'cffec0c22a7d8632a5117a4696baf103', '5410191861fa93fad408842a07227dedc7be0151', 0, 1631348349, 'local', 0);
INSERT INTO `ocenter_file` VALUES (66, 'Screenshot_20210911_161827_com.defiman.client.jpg', '613c667e62101.jpg', '/Uploads/Download/2021-09-11/', 'jpg', 'image/jpeg', 241641, '8da97983bfe9f7c023bcde0237d06a1f', '4d6dea1b88c26a2c124706b8539deff8a5a3f22c', 0, 1631348350, 'local', 0);
INSERT INTO `ocenter_file` VALUES (67, '16315130060550.jpg', '613ee9af6a0d9.jpg', '/Uploads/Download/2021-09-13/', 'jpg', 'image/jpeg', 83912, 'b7f957e86146ed74bd14e2705d090390', '41aec187034f540cf1c90f47b40ea385ca9cc96d', 0, 1631513007, 'local', 0);
INSERT INTO `ocenter_file` VALUES (68, '1631514582016_Screenshot_20210913_133012_pro.huobi.jpg', '613eefd7c7ee4.jpg', '/Uploads/Download/2021-09-13/', 'jpg', 'image/jpeg', 82707, '2a83d378b22db04eaac03a08fcaa1380', 'e80c97ce38c013593aa549d9ab0c58c247094216', 0, 1631514583, 'local', 0);
INSERT INTO `ocenter_file` VALUES (69, '16316811352960.jpg', '61417a71b66ec.jpg', '/Uploads/Download/2021-09-15/', 'jpg', 'image/jpeg', 92254, '941fb14ee0c1d424a4c407e41d527327', '45faaf53ec19f6aed0aa6c6143a2b8b56f10672b', 0, 1631681137, 'local', 0);
INSERT INTO `ocenter_file` VALUES (70, '16317037051280.jpg', '6141d2bc72909.jpg', '/Uploads/Download/2021-09-15/', 'jpg', 'image/jpeg', 86480, '0b7845f3f79d5b21117aa4bdba6e2a8c', 'cba66c90d3d9ff096dd07b626de2dcf36d07b7b3', 0, 1631703740, 'local', 0);
INSERT INTO `ocenter_file` VALUES (71, '16317037667350.jpg', '6141d2d77fb9b.jpg', '/Uploads/Download/2021-09-15/', 'jpg', 'image/jpeg', 86586, '43125eb2552c6e5f5e5e267af61e0ce9', '2b282f8e64ef00b6461525fa46daef1fe0843c53', 0, 1631703767, 'local', 0);
INSERT INTO `ocenter_file` VALUES (72, '16317038675550.jpg', '6141d33c738b2.jpg', '/Uploads/Download/2021-09-15/', 'jpg', 'image/jpeg', 86179, '22dc372ff2668658fbabb77270ac93d2', '22daa1e1c276ad0db16309847180f38c19c1dab2', 0, 1631703868, 'local', 0);
INSERT INTO `ocenter_file` VALUES (73, '1631831580824_Screenshot_20210917_063052_app.dman.release.jpg', '6143c62201b91.jpg', '/Uploads/Download/2021-09-17/', 'jpg', 'image/jpeg', 161653, 'c6bff458fad984f9d62886b7f3f356eb', '221f7f4d93fcf8874b798893483f5da6864a7d04', 0, 1631831585, 'local', 0);
INSERT INTO `ocenter_file` VALUES (74, '1631831580991_Screenshot_20210917_063101_app.dman.release.jpg', '6143c623a227a.jpg', '/Uploads/Download/2021-09-17/', 'jpg', 'image/jpeg', 87927, 'bf934838f1cec5ce0a75389661985189', 'ddd60304155939d1ba7d3cb3d549eaece85363a4', 0, 1631831587, 'local', 0);
INSERT INTO `ocenter_file` VALUES (75, '1631831581152_Screenshot_20210917_063153_app.dman.release.jpg', '6143c625a7f1f.jpg', '/Uploads/Download/2021-09-17/', 'jpg', 'image/jpeg', 107850, '53b0e591d5783cd6a9ea83f650642be0', '3163dcf56ff00dae2de3372e1e71e7f07a8b5c76', 0, 1631831589, 'local', 0);
INSERT INTO `ocenter_file` VALUES (76, '1631831581307_Screenshot_20210917_063158_app.dman.release.jpg', '6143c627b66a9.jpg', '/Uploads/Download/2021-09-17/', 'jpg', 'image/jpeg', 80342, 'bd063ee9846d8bb67aa4a858f0abaee8', '161715b1370e86faca8ef5dde252c6bcbf4e258d', 0, 1631831591, 'local', 0);
INSERT INTO `ocenter_file` VALUES (77, '1631831581460_Screenshot_20210917_063209_app.dman.release.jpg', '6143c629b2595.jpg', '/Uploads/Download/2021-09-17/', 'jpg', 'image/jpeg', 59015, '2a38946582bb06618d27b2f9f66abdbc', 'e2a171086576397141c52c4666be32e2f72b91f5', 0, 1631831593, 'local', 0);
INSERT INTO `ocenter_file` VALUES (78, '1631831581622_Screenshot_20210917_063227_vip.mytokenpocket.jpg', '6143c62b4eda9.jpg', '/Uploads/Download/2021-09-17/', 'jpg', 'image/jpeg', 88740, 'd098ad5dd13dc40dc1568633cd2ffe75', '1244bd903fe39b64f2cd95b013e3284bdb86db33', 0, 1631831595, 'local', 0);
INSERT INTO `ocenter_file` VALUES (79, '1631872928345_IMG_20210911_195127.jpg', '614467a32b32b.jpg', '/Uploads/Download/2021-09-17/', 'jpg', 'image/jpeg', 123395, '1ac160999a08623eb6f2eb20272eed05', '42a681fff4de77bfbfa340f2885f53d8e279c409', 0, 1631872931, 'local', 0);
INSERT INTO `ocenter_file` VALUES (80, '1631875982726_e6fe13b3ea6302afa6d89e4d4b9a5161(1).png', '6144739019ac7.png', '/Uploads/Download/2021-09-17/', 'png', 'image/jpeg', 85640, 'aa099e33824499aa62188f41466ceffc', 'd4fe2275dcad052fbe46d83d77cb346bf8cf30e0', 0, 1631875984, 'local', 0);
INSERT INTO `ocenter_file` VALUES (81, '1631876321590_wx_camera_1630858593965.jpg', '614474e4183af.jpg', '/Uploads/Download/2021-09-17/', 'jpg', 'image/jpeg', 161333, '4be261a9d72a6521e4c83dade69ff7d9', 'd4a893e031743ab7471a1f5e25484c45bc10eafc', 0, 1631876324, 'local', 0);
INSERT INTO `ocenter_file` VALUES (82, '1631890997900_mmexport1631890981341.png', '6144ae3742b11.png', '/Uploads/Download/2021-09-17/', 'png', 'image/jpeg', 32093, '59996ed182f8088b4ccd855e37d784e2', '68be82323d66b2f75d2e33070e6bf4d28852548b', 0, 1631890999, 'local', 0);
INSERT INTO `ocenter_file` VALUES (83, '1631890997922_mmexport1631890976869.png', '6144ae403126b.png', '/Uploads/Download/2021-09-17/', 'png', 'image/jpeg', 40811, 'ae034d75bad73188a134b830cf2601d0', '2e99f14c75e46bbcb2078670f3af72316f07a63f', 0, 1631891008, 'local', 0);
INSERT INTO `ocenter_file` VALUES (84, '16318939006010.jpg', '6144b98d4697f.jpg', '/Uploads/Download/2021-09-17/', 'jpg', 'image/jpeg', 85904, '4ca5026f1ff30dd86eeddb2ceff494e7', 'd0102512b936edc6904284f7626e99f62b02984b', 0, 1631893901, 'local', 0);
INSERT INTO `ocenter_file` VALUES (85, 'mmexport1629940114029.jpg', '61452db0aa720.jpg', '/Uploads/Download/2021-09-18/', 'jpg', 'image/jpeg', 470370, '61dcecb56c2acc5a6e50c031ac8cd4e5', '9666c906c3c2b10fc1ab369107900d2f8f8c5ad0', 0, 1631923632, 'local', 0);
INSERT INTO `ocenter_file` VALUES (86, 'mmexport1629937790622.jpg', '61452db61ade6.jpg', '/Uploads/Download/2021-09-18/', 'jpg', 'image/jpeg', 561360, '55f14b054b446c61930b83997a7765ad', 'bcfbbbb8ca85c42ff12462c6430d99fdb41d8cc8', 0, 1631923638, 'local', 0);
INSERT INTO `ocenter_file` VALUES (87, '16319290901200.jpg', '6145430310128.jpg', '/Uploads/Download/2021-09-18/', 'jpg', 'image/jpeg', 77035, '42c47065d0aeafe810527d1de37d2677', '640bb2c21cb2eeb192bb64f8efdf5e8c89a81ef2', 0, 1631929091, 'local', 0);
INSERT INTO `ocenter_file` VALUES (88, 'c6c9b0151a186a4c1ee200fb9383b3a3(2).png', '6148c72a2f9e6.png', '/Uploads/Download/2021-09-21/', 'png', 'image/png', 168168, '7fdff951bfa51efdf5ccd6951ffc13a5', 'e874f6321b56cda454dca165c48d52b652476d7b', 0, 1632159530, 'local', 0);
INSERT INTO `ocenter_file` VALUES (89, 'Screenshot_20210923_125300.jpg', '614c7fe6a356f.jpg', '/Uploads/Download/2021-09-23/', 'jpg', 'image/jpeg', 235837, '6fb93d31a50febe014b71bad80d94975', 'c904d7ed7027976402e373f2c91bda37053f331c', 0, 1632403430, 'local', 0);
INSERT INTO `ocenter_file` VALUES (90, '16324541541860.jpg', '614d45b7649f6.jpg', '/Uploads/Download/2021-09-24/', 'jpg', 'image/jpeg', 19321, '55f56e8c27488ce68739cf2c462a7170', 'fe963db66a3ee0b05b0118bc10c8bcb3ff73272d', 0, 1632454071, 'local', 0);
INSERT INTO `ocenter_file` VALUES (91, '1632457304278_528f3ba154ce2cc8.jpeg', '614d5257bac64.jpeg', '/Uploads/Download/2021-09-24/', 'jpeg', 'image/jpeg', 25641, 'e6313904f86d8d02afa52fe05dddfeab', 'e835e19e0295c7e81bb555ac6b8f82d56a59de2e', 0, 1632457303, 'local', 0);
INSERT INTO `ocenter_file` VALUES (92, '1632457304334_458bb32d81030eec.jpeg', '614d525aa1225.jpeg', '/Uploads/Download/2021-09-24/', 'jpeg', 'image/jpeg', 80142, 'b6f3d07f789f6d0ce7951d7279e36e74', 'f6047d6a60b78977ccdd9b209a68ce892f1da3cf', 0, 1632457306, 'local', 0);
INSERT INTO `ocenter_file` VALUES (93, '1632457304403_e69b8ac5b8303f0a.jpeg', '614d525db5a54.jpeg', '/Uploads/Download/2021-09-24/', 'jpeg', 'image/jpeg', 83675, 'd6fe501f6f211391edab0007c7b3438e', 'ac592eb6aaba56149b7781fdafe75deb3eb55817', 0, 1632457309, 'local', 0);
INSERT INTO `ocenter_file` VALUES (94, '1632457304576_4fce08fc53d7e291.jpeg', '614d525fb94dc.jpeg', '/Uploads/Download/2021-09-24/', 'jpeg', 'image/jpeg', 48065, 'be12aea10d870d25298e4a5738f62d76', '95d4db0af4e2c6d96307abbc8f51767c99f7cbf6', 0, 1632457311, 'local', 0);
INSERT INTO `ocenter_file` VALUES (95, '1632457924880_Screenshot_20210924_102603_app.dman.release.jpg', '614d54ca0cdd3.jpg', '/Uploads/Download/2021-09-24/', 'jpg', 'image/jpeg', 115464, '08109f15f68b30d756059097cfd6c355', '4ddc89d01e53aac53548b96740700da9d062e2b2', 0, 1632457930, 'local', 0);
INSERT INTO `ocenter_file` VALUES (96, 'Screenshot_20210924_164645_org.telegram.btcchat.jpg', '614d90933d4ff.jpg', '/Uploads/Download/2021-09-24/', 'jpg', 'image/jpeg', 524654, 'b571f4dfa1cea73e3408c739cb5bd41e', '86355d43f7c66b31518beec09a9d52735351338c', 0, 1632473235, 'local', 0);
INSERT INTO `ocenter_file` VALUES (97, 'IMG_20210924_130722_438.jpg', '614d9096546d1.jpg', '/Uploads/Download/2021-09-24/', 'jpg', 'image/jpeg', 87456, '4dc283fb6df41f9d577a419d52a2539b', '5fdd54b45ce489a99228c6b12180670d06736a79', 0, 1632473238, 'local', 0);
INSERT INTO `ocenter_file` VALUES (98, '1632541105318.jpg', '614e99cea7045.jpg', '/Uploads/Download/2021-09-25/', 'jpg', 'image/jpeg', 4216129, 'd9e5717fb2d76a95265dedb38fff9e21', '5ddd6b3bea82ecf18872c6c0647e3dba79bb6650', 0, 1632541134, 'local', 0);
INSERT INTO `ocenter_file` VALUES (99, 'Screenshot_20210925_192144_app.dman.release.jpg', '614f066b00674.jpg', '/Uploads/Download/2021-09-25/', 'jpg', 'image/jpeg', 552728, '041fbeafd23b22bb8cb1d417d473e983', '1f19ebd2df5a95764af469263a8ef8e433723812', 0, 1632568938, 'local', 0);
INSERT INTO `ocenter_file` VALUES (100, 'Screenshot_20210925_192153_app.dman.release.jpg', '614f066dc8f64.jpg', '/Uploads/Download/2021-09-25/', 'jpg', 'image/jpeg', 282742, '06841c5e1f70f6c7e36cb9c9aead3e34', '92c07d025f29b0e470ef229ab612c9732859a2aa', 0, 1632568941, 'local', 0);
INSERT INTO `ocenter_file` VALUES (101, 'IMG_20210926_055710_281.jpg', '614f9b653dab1.jpg', '/Uploads/Download/2021-09-26/', 'jpg', 'image/jpeg', 132789, '3d306e0621f12ad05ff7279077bee21a', 'ebf40ff111ec9134bfe5e6b8e6de0d21c7782596', 0, 1632607077, 'local', 0);
INSERT INTO `ocenter_file` VALUES (102, 'IMG_20210926_055714_903.jpg', '614f9b75d701b.jpg', '/Uploads/Download/2021-09-26/', 'jpg', 'image/jpeg', 77679, '1d1be4208d48b473ecae754c05591f4a', '1d99722b8eb2b2e9df8ab99271c071a18295ea93', 0, 1632607093, 'local', 0);
INSERT INTO `ocenter_file` VALUES (103, '16327002023940.jpg', '61514d87ca93d.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 202975, '1e417aa11a60f15e75dd24dfd4f12fa3', '6ccbda472d38a89d5581d2f8bf5b52faa172ad3f', 0, 1632718215, 'local', 0);
INSERT INTO `ocenter_file` VALUES (104, '1632725831107_mmexport1629856306505.jpg', '61516b4d63cb4.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 190802, '816907b7cb739436dec33adfe660c868', 'aec2cff1edcbf2142e84d5e48cb369b7c1552ad5', 0, 1632725837, 'local', 0);
INSERT INTO `ocenter_file` VALUES (105, '1632725831571_mmexport1629792859776.jpg', '61516b500c2be.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 238972, 'e15a8cc932baebc4c50ac7608608ca4a', '6606fab7856e627a9cf1e23e3cdf30c241fc922a', 0, 1632725840, 'local', 0);
INSERT INTO `ocenter_file` VALUES (106, '1632725831856_mmexport1629792831992.jpg', '61516b51ee736.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 147951, '53e12dbc24ed7424521bdd0b8cfb3497', '83f02a85928e442ff0347364e3cbd8faa80cd135', 0, 1632725841, 'local', 0);
INSERT INTO `ocenter_file` VALUES (107, '1632725832071_mmexport1629792824515.jpg', '61516b5451a15.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 138291, 'fc70c3877d2d946fdac2d385a76f0c39', '3763939531392b562b15592f381692945c27bed0', 0, 1632725844, 'local', 0);
INSERT INTO `ocenter_file` VALUES (108, '1632725832307_mmexport1629792893734.jpg', '61516b56691ec.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 162202, '79aa72d78fbb52b2ce256b06994132fb', 'ca7c59d5f2c820ce6790a0ff5d3c6a726ff536fa', 0, 1632725846, 'local', 0);
INSERT INTO `ocenter_file` VALUES (109, '1632725832777_mmexport1629792940628.jpg', '61516b58bf57b.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 295866, '1f6a8e542773813ffb6b75d0b1a9f0d5', 'f9a7c87a75b7620fd7f13003b2162472172d7f44', 0, 1632725848, 'local', 0);
INSERT INTO `ocenter_file` VALUES (110, '1632725833064_mmexport1629792932554.jpg', '61516b5be9b45.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 206497, 'f06d16e284de8af30870731ef88e8202', 'bf5b292ba228fd288818f79e642f1ee190544001', 0, 1632725851, 'local', 0);
INSERT INTO `ocenter_file` VALUES (111, '1632725833375_mmexport1629792925308.jpg', '61516b5e53812.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 270155, 'b2cc423627af9f8d651da9caa541a000', '04a25acf0cbcab06fc4023d460f1d934751976ea', 0, 1632725854, 'local', 0);
INSERT INTO `ocenter_file` VALUES (112, '1632725833563_mmexport1629792954719.jpg', '61516b6779581.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 188624, '2ec9048a05f4705f65fd91b15ccbcd76', '1a9b95dbf1d40b8875af53d20139f778dfd39db6', 0, 1632725863, 'local', 0);
INSERT INTO `ocenter_file` VALUES (113, '16327264211040.jpg', '61516d989a6b3.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 64091, '1de49daf3738e91e8afc69967d98c80c', '171e8ed1a0ca7fcedcb8ce7314f8067863dbb421', 0, 1632726424, 'local', 0);
INSERT INTO `ocenter_file` VALUES (114, '16327348104300.jpg', '61518e5fc8c86.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 54304, 'd1825037fb3f45c57ad7e9d2c0b1676a', 'ea59835ff560975ce4bead52cb92118ce4fa5f96', 0, 1632734815, 'local', 0);
INSERT INTO `ocenter_file` VALUES (115, '1632753547952_mmexport1632753370891.jpg', '6151d7914f86b.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 149471, '62da2a3f0dd417ed28be398e96b45b97', '70cd195627f5956e4a95bff115cab22b99f3640f', 0, 1632753553, 'local', 0);
INSERT INTO `ocenter_file` VALUES (116, '1632753548461_mmexport1632753376134.jpg', '6151d7995ce71.jpg', '/Uploads/Download/2021-09-27/', 'jpg', 'image/jpeg', 256644, 'f459dd7a5a92ad9550a845f6fb137cb9', 'd7885a2a956e2d72d779388201c2ffb41607659b', 0, 1632753561, 'local', 0);
INSERT INTO `ocenter_file` VALUES (117, 'mmexport1632907167092.jpg', '61542fb19e401.jpg', '/Uploads/Download/2021-09-29/', 'jpg', 'image/png', 119816, '417f20d6bb488095e4327ce796826d11', '063a953ce47a996f2ab1fa0080536a876d6ce47f', 0, 1632907185, 'local', 0);
INSERT INTO `ocenter_file` VALUES (118, 'mmexport1632907195785.jpg', '61542fcdc8e0c.jpg', '/Uploads/Download/2021-09-29/', 'jpg', 'image/jpeg', 14047, '77ce1fd8fa4a97adfa5f8632f9613896', '6ac06ac6e364039a801ca6f5508f20f731b6c0a0', 0, 1632907213, 'local', 0);
INSERT INTO `ocenter_file` VALUES (119, 'Screenshot_20211001_094641_app.dman.release.jpg', '6156699df0e77.jpg', '/Uploads/Download/2021-10-01/', 'jpg', 'image/jpeg', 390969, '0f30c08a9b781a33bc1ad52aa2b18f7b', '93ce5654fbad5b94267b04d10168fdfaa1474565', 0, 1633053085, 'local', 0);
INSERT INTO `ocenter_file` VALUES (120, '16327000016660.jpg', '6157056758eeb.jpg', '/Uploads/Download/2021-10-01/', 'jpg', 'image/jpeg', 334295, '037b413244f0602eb75362a682a80b04', 'f4f00ccf619277b8f3e7cc1c21bb7e7450356293', 0, 1633092967, 'local', 0);
INSERT INTO `ocenter_file` VALUES (121, 'mmqrcode1631019320078.png', '61570569b978f.png', '/Uploads/Download/2021-10-01/', 'png', 'image/jpeg', 66715, 'c2ff906daef5f836905d9ba2369c3e52', '75d6903c631e6f451f67c96cd450cf7ba23050cd', 0, 1633092969, 'local', 0);
INSERT INTO `ocenter_file` VALUES (122, 'Screenshot_20211004_132622_app.dman.release.jpg', '615b0ef1625ed.jpg', '/Uploads/Download/2021-10-04/', 'jpg', 'image/jpeg', 208011, '4e62b18185dc3c220259768d0050f073', '4ce79cff62cbed6885f6df7bb65d7b87041382d2', 0, 1633357553, 'local', 0);
INSERT INTO `ocenter_file` VALUES (123, 'ocr_temp1633325372461.jpg', '615b0ef921900.jpg', '/Uploads/Download/2021-10-04/', 'jpg', 'image/jpeg', 98658, '0de7cd42f6a96fd53b641473f3153fd2', '8d69e5c4988493a5181c1f326bae6c71f05f2fe5', 0, 1633357561, 'local', 0);
INSERT INTO `ocenter_file` VALUES (124, '16334390121690.jpg', '615c4d26ceb0c.jpg', '/Uploads/Download/2021-10-05/', 'jpg', 'image/jpeg', 75348, '6a7460b0a583964c3fa0c9736a0f714d', 'bffd5044d3ad8723e7da07085e5dd12f6cb7ee38', 0, 1633439014, 'local', 0);
INSERT INTO `ocenter_file` VALUES (125, '1633495227122_Screenshot_20211006_124009_pro.huobi.jpg', '615d28bcd3e77.jpg', '/Uploads/Download/2021-10-06/', 'jpg', 'image/jpeg', 89668, '1970d8678a40d192a577dd1513a65c81', '25ca57491070b670ba7034fd711f0f45f572ef02', 0, 1633495228, 'local', 0);
INSERT INTO `ocenter_file` VALUES (126, 'mmexport1633459975435.jpg', '615ea4deecf8b.jpg', '/Uploads/Download/2021-10-07/', 'jpg', 'image/jpeg', 153494, '49179f486551a793059ea8d3130984c0', 'bb49827896172cbaa2bb2db9e5b3b2889a93656a', 0, 1633592542, 'local', 0);
INSERT INTO `ocenter_file` VALUES (127, 'IMG_20211002_230450_853.jpg', '615ea4eac712d.jpg', '/Uploads/Download/2021-10-07/', 'jpg', 'image/jpeg', 102483, 'fa37afdc94d901a64b031c7a82a6dfde', '6b2ca8bee50680a3278d33103dee54e23bc0b1bd', 0, 1633592554, 'local', 0);
INSERT INTO `ocenter_file` VALUES (128, '16336811394340.jpg', '615ffef514879.jpg', '/Uploads/Download/2021-10-08/', 'jpg', 'image/jpeg', 69577, '548767436af8c5b96853179d38c3d677', '5637d302c1f78cb703dd08480e87052562459be6', 0, 1633681141, 'local', 0);
INSERT INTO `ocenter_file` VALUES (129, '16337402765850.jpg', '6160e5f6bc830.jpg', '/Uploads/Download/2021-10-09/', 'jpg', 'image/jpeg', 72145, 'ee6e5ed61c1167c25515cc2f32e05b91', '9914ac3eca00ce69ac912c9929fb29eab6edb17e', 0, 1633740278, 'local', 0);
INSERT INTO `ocenter_file` VALUES (130, '16337408838420.jpg', '6160e855a3e89.jpg', '/Uploads/Download/2021-10-09/', 'jpg', 'image/jpeg', 66531, '6724516999615fa919361dde3f2028f6', 'f31bfb261330bd63b2844a31d2c5e47f53d2ba64', 0, 1633740885, 'local', 0);
INSERT INTO `ocenter_file` VALUES (131, '16337445945780.jpg', '6160f6d478bdd.jpg', '/Uploads/Download/2021-10-09/', 'jpg', 'image/jpeg', 46139, '2b0967efcac3acd7c9eace04c7e1fc83', '3340d3a009d3b3fa9854de3913900f1afcb41b64', 0, 1633744596, 'local', 0);
INSERT INTO `ocenter_file` VALUES (132, '16338239772320.jpg', '61622cea5ea88.jpg', '/Uploads/Download/2021-10-10/', 'jpg', 'image/jpeg', 54928, '05394cfa5fc6836c132c6cc77429cceb', '22c3bb265fb3f13c7b0218af7eaa8582e6d92558', 0, 1633823978, 'local', 0);
INSERT INTO `ocenter_file` VALUES (133, '1633846934451_Screenshot_20211010_135142.jpg', '616286996b775.jpg', '/Uploads/Download/2021-10-10/', 'jpg', 'image/jpeg', 179497, 'e5604efe4f93d1b9e3390d167c300260', 'f02380f6f1a01dd7ce88a0523fc7301780fbe392', 0, 1633846937, 'local', 0);
INSERT INTO `ocenter_file` VALUES (134, '1633846934631_Screenshot_20211010_134403.jpg', '6162869b8fda0.jpg', '/Uploads/Download/2021-10-10/', 'jpg', 'image/jpeg', 187919, '952b087516fb6787f8b59b3b9d92da05', '0fceddbb30093697540fedfff05502ee3e990c13', 0, 1633846939, 'local', 0);
INSERT INTO `ocenter_file` VALUES (135, '1633846934773_mmexport1632311933044.jpg', '6162869e242d1.jpg', '/Uploads/Download/2021-10-10/', 'jpg', 'image/jpeg', 305069, '91ca8ca12e2dc995921c36c05871dba8', '9f4a4043f5d65b51de87d67e4f365f1b1fb30362', 0, 1633846942, 'local', 0);
INSERT INTO `ocenter_file` VALUES (136, '1633846934845_090.jpg', '6162869fc87e9.jpg', '/Uploads/Download/2021-10-10/', 'jpg', 'image/jpeg', 87857, 'd7ee2ab9e9e40ace8e4592b6697ac827', '1f4a7fd5a412ab92624ecf155151fe99493f9da6', 0, 1633846943, 'local', 0);
INSERT INTO `ocenter_file` VALUES (137, '16339704258310.jpg', '616468fabebff.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 64059, '06ea6e82d5c226eccac3dd4a5c3415c2', 'b296d3fc0a99fff3bfe7b07751f2cec4218801f5', 0, 1633970426, 'local', 0);
INSERT INTO `ocenter_file` VALUES (138, '1633998269272_ZSXQ_20211012_081234402.jpg', '6164d5c05f8d2.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 87365, 'dc74fc05d04fb4029ae1d28c32ecb58e', '727beec011a2cd8bca2b14b6d2b5e1dc14a0acfa', 0, 1633998272, 'local', 0);
INSERT INTO `ocenter_file` VALUES (139, '1633998269286_ZSXQ_20211012_081229124.jpg', '6164d5c21c078.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 22061, '1b92eefaa405b94294c84887af8cec56', 'f76cf68d0598899b59ed48734ae7341d232a203e', 0, 1633998274, 'local', 0);
INSERT INTO `ocenter_file` VALUES (140, '1633998269315_ZSXQ_20211012_081224898.jpg', '6164d5c433f53.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 68594, 'beff8af393d9121bf1cd57c769f3495d', '1460968075baf1272ee10153647b38738be78418', 0, 1633998276, 'local', 0);
INSERT INTO `ocenter_file` VALUES (141, '1633998269325_ZSXQ_20211012_081222414.jpg', '6164d5c5dd980.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 22159, '26f5ef4b2afd632234fcad71582fa6f0', 'c1a1298ae86a18f596788ec90946f369cbc1a1dc', 0, 1633998277, 'local', 0);
INSERT INTO `ocenter_file` VALUES (142, '1633998269359_ZSXQ_20211012_081219313.jpg', '6164d5c804ae1.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 51522, 'f9aea1ab33a2312437aa7873b3cfeabe', '507f10806734dee3e9e26c92aa75e80152454978', 0, 1633998279, 'local', 0);
INSERT INTO `ocenter_file` VALUES (143, '16340101996530.jpg', '6165045c4b713.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 56901, '5310770e162708f8ee68d627eefcc8de', '744f714dea28c272ca0efc0c0186a7b25b5dd9fa', 0, 1634010204, 'local', 0);
INSERT INTO `ocenter_file` VALUES (144, '16340170902310.jpg', '61651f44de5fc.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 90832, '6aab1d41c5e81ff3a18d73c162e97e93', 'b60912fc8f5d92865dc09881c2b8b58d256e7b3e', 0, 1634017092, 'local', 0);
INSERT INTO `ocenter_file` VALUES (145, '16340171188800.jpg', '61651f633c8cb.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 81767, '392feb55fad3fbd0c4e6512973290aa9', 'c229010271b6a73649b0571b65652b985f7d5953', 0, 1634017123, 'local', 0);
INSERT INTO `ocenter_file` VALUES (146, '16340172018420.jpg', '61651fb47e0ae.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 62337, '6fb53bc9bc8de1cbd892e9494823f830', '7cbff7446fa6dead506bb402f7af403464eece1f', 0, 1634017204, 'local', 0);
INSERT INTO `ocenter_file` VALUES (147, '16340172534560.jpg', '61651fe84180f.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 88949, 'ebd00c8c9e57efb6ac996fc0a0709e57', 'd84490c894d537ad5281b23f593eb914cb61c912', 0, 1634017256, 'local', 0);
INSERT INTO `ocenter_file` VALUES (148, '16340173170480.jpg', '61652027e9bc6.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 99921, 'e1e0d4a09965d7602775730793e6f067', '56f6ca3578fe1a7716694b1ed322c5b80982a680', 0, 1634017319, 'local', 0);
INSERT INTO `ocenter_file` VALUES (149, '16340188529420.jpg', '61652625b7b15.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 67291, 'd424a6a57f24314c30ccd60142a3eeb2', '30c2cba6abe6fd9970cd1b61c0c42f24dcf61e21', 0, 1634018853, 'local', 0);
INSERT INTO `ocenter_file` VALUES (150, '16340188910950.jpg', '6165264becf4c.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 60504, '22fe2a0affa062df0a13b92e19b5f596', '66f7cd4080cb7b32962c89c398ca0384c25bbf65', 0, 1634018891, 'local', 0);
INSERT INTO `ocenter_file` VALUES (151, '16340275348890.jpg', '61654810c7ce0.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 52871, '77902129cb948519b808066d9e2f7a8f', '83196c9d217385ee29aa7b6ac3b04c398dd2859e', 0, 1634027536, 'local', 0);
INSERT INTO `ocenter_file` VALUES (152, '16340275925600.jpg', '6165484a96b5b.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 68647, '5e32c480f5423e3b18698c63555b0a24', '972ea9db9a3d258624485239a43def43df70387d', 0, 1634027594, 'local', 0);
INSERT INTO `ocenter_file` VALUES (153, '16340373929140.jpg', '61656e94ce4da.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 63154, '16ba370ba52bf5fc29e9080b9ae46d2b', 'b61312eb17249784ddfe514cf590c7c4cdbb9609', 0, 1634037396, 'local', 0);
INSERT INTO `ocenter_file` VALUES (154, '16339940664370.jpg', '6165a0cda348e.jpg', '/Uploads/Download/2021-10-12/', 'jpg', 'image/jpeg', 215803, '3d1f7533bc7774392c0c4ab377088e55', '75931645444f800bc2cb9277838580efb2b3ced5', 0, 1634050253, 'local', 0);
INSERT INTO `ocenter_file` VALUES (155, '16341064104370.jpg', '61667c2c1e3de.jpg', '/Uploads/Download/2021-10-13/', 'jpg', 'image/jpeg', 44470, '9be9e9dddb5c4a469b6f71faba1ab442', 'f00cb5b9f0d5ecc5053d217979d9691d4059df4a', 0, 1634106412, 'local', 0);
INSERT INTO `ocenter_file` VALUES (156, '16341203752450.jpg', '6166b2b7edd99.jpg', '/Uploads/Download/2021-10-13/', 'jpg', 'image/jpeg', 59699, 'd6f380e4c0d7118d09caf0729e5e1e4c', '27c4e563c7046408b4fb2311b81a4e5c077076b4', 0, 1634120375, 'local', 0);
INSERT INTO `ocenter_file` VALUES (157, '16341732745510.jpg', '6167815c4b673.jpg', '/Uploads/Download/2021-10-14/', 'jpg', 'image/jpeg', 32438, '1bdf747cb771ebe13d67e50df4d79065', '109343ebcd6878315b776764d8596cd33e9d59c5', 0, 1634173276, 'local', 0);
INSERT INTO `ocenter_file` VALUES (158, '1634222992273_Screenshot_20211014_224943_pro.huobi.jpg', '61684392cf8dc.jpg', '/Uploads/Download/2021-10-14/', 'jpg', 'image/jpeg', 93337, 'de64e436324d797ea4e26b86f59328ae', '2c095a6cc683a1ef2c19951c69ff31ae723747ce', 0, 1634222994, 'local', 0);
INSERT INTO `ocenter_file` VALUES (159, '16342232555480.jpg', '6168449a37686.jpg', '/Uploads/Download/2021-10-14/', 'jpg', 'image/jpeg', 37502, '912532e39be9f23a635c727e96284626', '7a44c17b88c6decc8cf4a488cafd211193552178', 0, 1634223258, 'local', 0);
INSERT INTO `ocenter_file` VALUES (160, '16342281946650.jpg', '616857e32e175.jpg', '/Uploads/Download/2021-10-15/', 'jpg', 'image/jpeg', 89363, '31dc0bf306037b6c32daf295664cfec8', '365ed13b80ae75e3b60a65653c381233343a198d', 0, 1634228195, 'local', 0);
INSERT INTO `ocenter_file` VALUES (161, '16342999413480.jpg', '616970271a1f2.jpg', '/Uploads/Download/2021-10-15/', 'jpg', 'image/jpeg', 74734, 'dd0fe7fbbe60752a7ba4739daa2d1fed', '57c44c96f1a5def7d4eb053906fbb6b2a8589782', 0, 1634299943, 'local', 0);
INSERT INTO `ocenter_file` VALUES (162, '1634473554769_7bd32e2441e14d72a9960983e74d2781.jpg', '616c1653a437a.jpg', '/Uploads/Download/2021-10-17/', 'jpg', 'image/jpeg', 172390, '24df117e564d3c262c7e82daf559ed78', 'c35b41d74933778959ed697b8226b51f17b90134', 0, 1634473555, 'local', 0);
INSERT INTO `ocenter_file` VALUES (163, '1634488078050_mmexportd6963701ac9a5173ac7e7e59fe3a0388_1634363590465.png', '616c4f0fd656d.png', '/Uploads/Download/2021-10-18/', 'png', 'image/jpeg', 19180, '99e26cc6ad7b0698b863580a655bc444', '3c94e991fc64901bf9974f1870386690e181a6c8', 0, 1634488079, 'local', 0);
INSERT INTO `ocenter_file` VALUES (164, '1634488078097_mmexportc427ae33cd59729a35aac8da88c1b529_1634364110887.png', '616c4f1160b67.png', '/Uploads/Download/2021-10-18/', 'png', 'image/jpeg', 31656, 'db2b28fb7a0cb4e3989eb1ff2f68fcc1', 'd5e61703d24a8e9e45c6d07e721ca8de7a97dd2b', 0, 1634488081, 'local', 0);
INSERT INTO `ocenter_file` VALUES (165, '16345434736980.jpg', '616d2776cb276.jpg', '/Uploads/Download/2021-10-18/', 'jpg', 'image/jpeg', 89385, '9ac835b2bcb001d337c57c67d50753f2', '43503b40fb5ef14372a0d6186d231f9d765076b4', 0, 1634543478, 'local', 0);
INSERT INTO `ocenter_file` VALUES (166, '16345443522080.jpg', '616d2ae0e86d2.jpg', '/Uploads/Download/2021-10-18/', 'jpg', 'image/jpeg', 68631, '5baee8852eb5524e0e52433a6c366612', '5e466a864f2f69124bae6eea13efc08a5e363545', 0, 1634544352, 'local', 0);
INSERT INTO `ocenter_file` VALUES (167, '16346156331480.jpg', '616e4153e4366.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 72838, 'f5800bdc75bebe49d27135595912bc34', 'a5171318b796dda2572f5d263722ba90520dfef6', 0, 1634615635, 'local', 0);
INSERT INTO `ocenter_file` VALUES (168, '16346184666260.jpg', '616e4c66a7b9f.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 59887, 'a61f263f9b5fcb6a229f702a4e302c0d', 'fc5253414807b9fff53eed1cf115e531016041db', 0, 1634618470, 'local', 0);
INSERT INTO `ocenter_file` VALUES (169, '16346283944660.jpg', '616e732b4f20a.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 86555, '945a8ec8f2784fd60af30d86cb05fd30', '978d1a744c4201fc2ecaadfe2bdfe1e9ee8d397b', 0, 1634628395, 'local', 0);
INSERT INTO `ocenter_file` VALUES (170, '16346506621820.jpg', '616eca2777ef3.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 44603, 'd793a489ca36a27ccf327f8aba59ba12', 'f3fea11510488fc84ef1f4e805727d77a262cdc9', 0, 1634650663, 'local', 0);
INSERT INTO `ocenter_file` VALUES (171, '16346508007010.jpg', '616ecab1e8087.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 44437, 'b25702f605b544235da652e9e733919b', '8aa2eb7550585931428cbac3838389335644e4ef', 0, 1634650801, 'local', 0);
INSERT INTO `ocenter_file` VALUES (172, '16346543068230.jpg', '616ed8647cd85.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 69817, '7071d19a3193cd9ef6504f169092e543', 'afd0bb8021123f9fe1431ceaca510a387ebc8ec3', 0, 1634654308, 'local', 0);
INSERT INTO `ocenter_file` VALUES (173, '16346543686330.jpg', '616ed8a26cb8e.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 43729, '2ac47b13df5cae4c7e1f5a872de2f2fc', '31694f4ffee3a65c01743d4fc32c6f8af85c7c8d', 0, 1634654370, 'local', 0);
INSERT INTO `ocenter_file` VALUES (174, '1634658801850_Screenshot_2021-10-17-00-38-23-093_site.yjkj.test.h5shangtuo.jpg', '616ee9f4894ab.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 89992, '248181fd57d0b59fd52bc76d6e28a0fc', 'f78d0de03f8dcf6f0274c759bd037a161c4a7592', 0, 1634658804, 'local', 0);
INSERT INTO `ocenter_file` VALUES (175, '1634658801948_Screenshot_2021-10-17-00-38-38-991_site.yjkj.test.h5shangtuo.jpg', '616ee9f7a27c0.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 222591, 'e1921399adc4fc15f7f736170a5ba372', '951a314c4012dd1e45ec950d4968b96576536da6', 0, 1634658807, 'local', 0);
INSERT INTO `ocenter_file` VALUES (176, '1634658802039_Screenshot_2021-10-17-00-38-52-795_site.yjkj.test.h5shangtuo.jpg', '616ee9faabcfd.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 193164, '703be5662c2ad83b3073cf611378f1d4', '5f4087a6bb1fa7cde22bfef2e8fdf12e0da7796e', 0, 1634658810, 'local', 0);
INSERT INTO `ocenter_file` VALUES (177, '1634658802158_1634402363666.png', '616ee9fd57283.png', '/Uploads/Download/2021-10-19/', 'png', 'image/jpeg', 152100, 'e3843d903a87352596209717707e6d78', '326e5333e19faca6f7b55becaa739354246152d1', 0, 1634658813, 'local', 0);
INSERT INTO `ocenter_file` VALUES (178, '1634658802249_1634402372617.png', '616ee9ff8b4d8.png', '/Uploads/Download/2021-10-19/', 'png', 'image/jpeg', 85868, 'a55419813b1a2476afcf8fca7057f5bc', '84142fa6320ec64605933056858f022b11c1174b', 0, 1634658815, 'local', 0);
INSERT INTO `ocenter_file` VALUES (179, '1634658802339_mmexport1634525890064.jpg', '616eea023c141.jpg', '/Uploads/Download/2021-10-19/', 'jpg', 'image/jpeg', 135978, 'b19ce231a2e53164c4f871195a446132', 'b2e50a0fd2847661630021e2ebf822cf8a90d3f2', 0, 1634658818, 'local', 0);
INSERT INTO `ocenter_file` VALUES (180, 'Screenshot_20211020_070238.jpg', '616f86d5268a3.jpg', '/Uploads/Download/2021-10-20/', 'jpg', 'image/jpeg', 337841, 'ef3fe9c55ccacfbca212e103b76c1b80', '16b91ad33e55795987edd2d3e04b9cfaa1efe05e', 0, 1634698965, 'local', 0);
INSERT INTO `ocenter_file` VALUES (181, 'Screenshot_20211020_070319.jpg', '616f86d80733d.jpg', '/Uploads/Download/2021-10-20/', 'jpg', 'image/jpeg', 205151, '57ed84e9ab52c877b17390396e4accfd', '7675fc002fa1e880d7451b796f8f4dd01ce8b3d6', 0, 1634698968, 'local', 0);
INSERT INTO `ocenter_file` VALUES (182, '1634804846780_Screenshot_20211021_162620_app.dman.release.jpg', '6171247233418.jpg', '/Uploads/Download/2021-10-21/', 'jpg', 'image/jpeg', 93022, '8d60a8af0dd4412047166a15cc782c03', 'b42fefb888d360168b702f886e01cab7ff7354b1', 0, 1634804850, 'local', 0);
INSERT INTO `ocenter_file` VALUES (183, '1634807767424_IMG_20210903_192641.jpg', '61712fdba618d.jpg', '/Uploads/Download/2021-10-21/', 'jpg', 'image/jpeg', 94069, 'f556e1091749ace95b9f62f993c6c7ca', '4db0f872fa32bfa271bccd849a78ac3edae3ec4f', 0, 1634807771, 'local', 0);
INSERT INTO `ocenter_file` VALUES (184, '16349140735220.jpg', '6172cf3205fe6.jpg', '/Uploads/Download/2021-10-22/', 'jpg', 'image/jpeg', 61075, '077343279d1296b96dd2349cb794973f', 'da5880e559240d5bd1b745d401a8847af47175cd', 0, 1634914097, 'local', 0);
INSERT INTO `ocenter_file` VALUES (185, '16349141179870.jpg', '6172cf5bd4341.jpg', '/Uploads/Download/2021-10-22/', 'jpg', 'image/jpeg', 63833, 'b88cc82127ff563d663b3deb01ef1d9f', '4e7fe461bd831ba5376ed2625ba3440d6d82614d', 0, 1634914139, 'local', 0);
INSERT INTO `ocenter_file` VALUES (186, '1634978515072_16341397235450.jpg', '6173cad506129.jpg', '/Uploads/Download/2021-10-23/', 'jpg', 'image/jpeg', 112941, '4c25458e7721061cb7cb3ea0264e37f3', 'e4f83611a0da761eabe21c74d5c139dd148b6524', 0, 1634978516, 'local', 0);
INSERT INTO `ocenter_file` VALUES (187, '16349893300720.jpg', '6173f5144b969.jpg', '/Uploads/Download/2021-10-23/', 'jpg', 'image/jpeg', 62333, 'd8e74833d1105e0f9d0de58eb6fde1e2', '5fe3cb9a0bf8432bd5e46be72bcf1a6e1bd6a984', 0, 1634989332, 'local', 0);
INSERT INTO `ocenter_file` VALUES (188, '16349913826200.jpg', '6173fd182ea9c.jpg', '/Uploads/Download/2021-10-23/', 'jpg', 'image/jpeg', 60611, 'b206540139c29088456979e4d287f94f', 'e000e4ed51387d39f7236a76b8559d87cedbb3cc', 0, 1634991384, 'local', 0);
INSERT INTO `ocenter_file` VALUES (189, '16350671809840.jpg', '6175252e022ce.jpg', '/Uploads/Download/2021-10-24/', 'jpg', 'image/jpeg', 81833, 'cd7be22ef2d0f7982917675e946bbe05', 'a57c96664dfe1b944aa5ca742f879e4eb1bbe269', 0, 1635067181, 'local', 0);
INSERT INTO `ocenter_file` VALUES (190, '16350674003490.jpg', '6175260a6c449.jpg', '/Uploads/Download/2021-10-24/', 'jpg', 'image/jpeg', 39207, 'e9434c5cbfb9bfe4a136ce68f0f04c6d', 'a85d95abf9e22b81a328a67c1e5a9bba0b2b37f5', 0, 1635067402, 'local', 0);
INSERT INTO `ocenter_file` VALUES (191, '16350674183960.jpg', '6175261c0f483.jpg', '/Uploads/Download/2021-10-24/', 'jpg', 'image/jpeg', 38482, '2951a6b9128e92e1f41795581d3bdbb2', 'c5f1f83e252e2262969a0d3459e76e3fb50e694e', 0, 1635067420, 'local', 0);
INSERT INTO `ocenter_file` VALUES (192, '16350697713630.jpg', '61752f4cc72ca.jpg', '/Uploads/Download/2021-10-24/', 'jpg', 'image/jpeg', 47641, '57b1ca8cb897b535a7e86fab0870406a', '682b7ac53d968368fa9103df0d2cc116e26b7b3e', 0, 1635069772, 'local', 0);
INSERT INTO `ocenter_file` VALUES (193, '16350709967570.jpg', '617534131ce22.jpg', '/Uploads/Download/2021-10-24/', 'jpg', 'image/jpeg', 64317, 'fef177848b43c223554d5085dab00eb1', 'e4eaa5cc358fb827a3595fc22e95673149627015', 0, 1635070995, 'local', 0);
INSERT INTO `ocenter_file` VALUES (194, '1635089223071_Screenshot_20211024_232648_pro.huobi.jpg', '61757b49aeda2.jpg', '/Uploads/Download/2021-10-24/', 'jpg', 'image/jpeg', 75633, 'f4886976aad31f4de5cd047135a80443', '232185b622e334c2bff216090c862a48b38b5e22', 0, 1635089225, 'local', 0);
INSERT INTO `ocenter_file` VALUES (195, '16351389794380.jpg', '61763da617458.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 68136, 'ecdee6464d42d0e265268e5ef37de732', '725e7fdb7cace2e43d573d71934de9f5b94740cd', 0, 1635138982, 'local', 0);
INSERT INTO `ocenter_file` VALUES (196, '16351401875490.jpg', '6176425e897f8.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 77737, '004e28a2a382c59beca85b7531b1b5e8', 'afc8b84533ce415e193ffeb1a8de818f267cb98e', 0, 1635140190, 'local', 0);
INSERT INTO `ocenter_file` VALUES (197, '16351497157100.jpg', '61766657000ae.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 60603, 'd30088135840c4ac1535d154da30de8d', '4b29d4427117e7a1870fcc304509c39fa351f33d', 0, 1635149398, 'local', 0);
INSERT INTO `ocenter_file` VALUES (198, '16351508221710.jpg', '61766be905fd6.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 59827, 'fe596ab4c09dd174fe78722f2a594f36', 'c92de2783335fbc87d11285e4a2fb679a04d4f7b', 0, 1635150824, 'local', 0);
INSERT INTO `ocenter_file` VALUES (199, '16351508969130.jpg', '61766c33da0e0.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 59336, '0356a7eebe99cf3f46c65a7ee8aaabbc', '0959c46b84d538ea0563520c8e7d2154c03b1942', 0, 1635150899, 'local', 0);
INSERT INTO `ocenter_file` VALUES (200, '16351538636260.jpg', '617677cb121b7.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 76345, '1c4d31c04fad159e32aec201f3e42508', '0669d441f3da7fab665aa99e22af390a6d0ca1f5', 0, 1635153867, 'local', 0);
INSERT INTO `ocenter_file` VALUES (201, '16351541586120.jpg', '617678f0391a1.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 57261, '2f79da46397dbf77b080e348028cbcc2', 'bdac584bd1d5ccdada862406f0fae73d710c6bc7', 0, 1635154160, 'local', 0);
INSERT INTO `ocenter_file` VALUES (202, '16351647088890.jpg', '6176a2273a8e1.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 87761, '9ec06c11eaf9700018adfb37989aea53', '2683b12a13e4a33bcd1eb46c7fb2b91933037da7', 0, 1635164711, 'local', 0);
INSERT INTO `ocenter_file` VALUES (203, '16351659004270.jpg', '6176a6d03a52d.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 67649, '556c284722a27fa4318424f7e88a9654', 'e3175e33bebadbc30cbe950a9d09e78b9a318b89', 0, 1635165904, 'local', 0);
INSERT INTO `ocenter_file` VALUES (204, '16351746050270.jpg', '6176c8d00582d.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 73185, '0fbc05c2af046d86957c8f7fd10cd77f', '9ccf4254467e4cd0e8d9ed8ec2c253ee8938cefb', 0, 1635174607, 'local', 0);
INSERT INTO `ocenter_file` VALUES (205, '16351760411930.jpg', '6176ce6bca24f.jpg', '/Uploads/Download/2021-10-25/', 'jpg', 'image/jpeg', 61005, '769500e70976afa72e43c6d9cb2c3c55', 'cdf7a0d37f2b91f5a219a51d544c42d6990f84f1', 0, 1635176043, 'local', 0);
INSERT INTO `ocenter_file` VALUES (206, '1635194821891_Screenshot_20211026_044551_com.huawei.ohos.famanager.jpg', '617717c846d72.jpg', '/Uploads/Download/2021-10-26/', 'jpg', 'image/jpeg', 123449, '2fb91b345667a505a1f575801d111ed6', 'f32a11561e9ca5d3a0177ac17506467a7b0e2e58', 0, 1635194824, 'local', 0);
INSERT INTO `ocenter_file` VALUES (207, '1635197456152_mmexport1635197351409.png', '61772215d4770.png', '/Uploads/Download/2021-10-26/', 'png', 'image/png', 345334, '3f60bd52776624e863939b29463fea8e', 'f152e0aca197e68e064f6caef1af9105c16322f6', 0, 1635197461, 'local', 0);
INSERT INTO `ocenter_file` VALUES (208, '1635197456353_mmexport1635197416155.jpg', '6177221a324d3.jpg', '/Uploads/Download/2021-10-26/', 'jpg', 'image/jpeg', 231421, '4dbd8cdeb8b910ede7e4eb77c81c9bc3', 'c7787f3bf920e53c26a1d78a0d3c6585964c537c', 0, 1635197466, 'local', 0);
INSERT INTO `ocenter_file` VALUES (209, '1635197456458_mmexport1635197423825.jpg', '6177221d69277.jpg', '/Uploads/Download/2021-10-26/', 'jpg', 'image/jpeg', 136096, '353afd07089883159f34fdd0a017316c', 'e87c6970be7ea44d478fac721efe1bed718d7f07', 0, 1635197469, 'local', 0);
INSERT INTO `ocenter_file` VALUES (210, '1635197456555_mmexport1635197429348.jpg', '6177221ff3741.jpg', '/Uploads/Download/2021-10-26/', 'jpg', 'image/jpeg', 89408, '46d6d54fa64d25f139b8670ef4fb0a1f', 'd54b83a9de5120cf7dace224f0eb478244cfb031', 0, 1635197471, 'local', 0);
INSERT INTO `ocenter_file` VALUES (211, '1635197480416_Screenshot_2021-10-26-05-31-11-08_ae1f93045b87aacac90efbb155289789.jpg', '6177222b7ae47.jpg', '/Uploads/Download/2021-10-26/', 'jpg', 'image/jpeg', 103243, '352c15d1745dbe93e6a2d27e68fb254c', '9d5fc9324150932f4d13ef51a9d1301c27214b10', 0, 1635197483, 'local', 0);
INSERT INTO `ocenter_file` VALUES (212, '16351976654810.jpg', '617722e3bb456.jpg', '/Uploads/Download/2021-10-26/', 'jpg', 'image/jpeg', 60140, '024f1c11bf0773c678ef116d1d99bc48', '7d446c1fb82d19f9221a6c7a052db2a16762fb27', 0, 1635197667, 'local', 0);
INSERT INTO `ocenter_file` VALUES (213, '1635197858421_mmexport1635197840435.jpg', '617723a8092c6.jpg', '/Uploads/Download/2021-10-26/', 'jpg', 'image/jpeg', 455562, '95811bb88a14adb3162d8e15c47aedd3', 'ab3e3b563c5972bbd2f8f3f4a860584dfd262ad6', 0, 1635197864, 'local', 0);
INSERT INTO `ocenter_file` VALUES (214, '1635197858722_mmexport1635197843597.jpg', '617723abcbeb3.jpg', '/Uploads/Download/2021-10-26/', 'jpg', 'image/jpeg', 162871, '003ef70ef0977513260cebb1dd4874dc', '59b5d2b41b4f50b3d496b68d253d40b46c6dd3e2', 0, 1635197867, 'local', 0);
INSERT INTO `ocenter_file` VALUES (215, '16352213022130.jpg', '61777f38e4fac.jpg', '/Uploads/Download/2021-10-26/', 'jpg', 'image/jpeg', 67655, '18415742ae40c8ac8f7c9d2a8dcb2167', 'a32d508753684465f71880e8ff03ea4752cc7447', 0, 1635221304, 'local', 0);
INSERT INTO `ocenter_file` VALUES (216, '1635277386045_16352767427110.jpg', '61785a4d4178a.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 116314, '002e77b0b2c073105e6188a2e796d596', '31e40fb72bf91374fa3013b7323c32b7fa21bd41', 0, 1635277389, 'local', 0);
INSERT INTO `ocenter_file` VALUES (217, '1635277386298_mmexport1635276803694_mh1635277179186.jpg', '61785a4f28bd4.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 147449, 'a80ceb7ec99b5adf45bb2ddb7db6dfc5', '3671f5ab2e92b86757e458c8286cf0769fc20130', 0, 1635277391, 'local', 0);
INSERT INTO `ocenter_file` VALUES (218, '1635277386541_Screenshot_20211027_034051_com.enft111.nft.jpg', '61785a516ea69.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 237881, 'fb0e41c0fcae1f0e05e212a05255ce96', '1ed786e9722e88c3f618310967ac95ab7b53851c', 0, 1635277393, 'local', 0);
INSERT INTO `ocenter_file` VALUES (219, '1635277386680_Screenshot_20211027_034059_com.huawei.ohos.famanager.jpg', '61785a5394704.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 241708, '6e62d17a7182be7e07f88edd1b64ac82', 'e093fbec7e99e9e1cd8d6c8c6930845f9c64b296', 0, 1635277395, 'local', 0);
INSERT INTO `ocenter_file` VALUES (220, '1635277386812_Screenshot_20211027_034130_com.enft111.nft.jpg', '61785a55a8c70.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 275560, 'ceb880f5e452b5edd89073067bd150ac', '805dd03f679841d7f36c7a1b8f91fe89bef5da0c', 0, 1635277397, 'local', 0);
INSERT INTO `ocenter_file` VALUES (221, '1635281814000_Screenshot_20211027_035839_com.mt.mtxx.mtxx_mh1635280653111.jpg', '61786b997c4c6.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 222364, '494ed9f7012794181bd31818d9c62644', 'eeb65d00b2e4e64cf0ae2735420081e7e6d22f77', 0, 1635281817, 'local', 0);
INSERT INTO `ocenter_file` VALUES (222, '1635281814174_Screenshot_20211022_041343_com.enft111.nft_mh1634852787284.jpg', '61786b9b176cb.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 53692, 'adbe3004277fcac07a95c06900f1825d', '61b8d31aedd9f0cc298319578b04dbc04ed5afa8', 0, 1635281819, 'local', 0);
INSERT INTO `ocenter_file` VALUES (223, '1635281814206_Screenshot_20211022_041343_com.enft111.nft_mh1634853287926.jpg', '61786b9c67a8a.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 30871, '2437962b69000face50de3d590f82e0d', 'cb176f9ddd6b5ec77b3d163f63f1d82a1d9ef380', 0, 1635281820, 'local', 0);
INSERT INTO `ocenter_file` VALUES (224, '1635310845986_Screenshot_20211025_151328.jpg', '6178dcff9efbc.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 74409, 'c5a8bf150b50c9e35727508f6187e449', '5bb923de6ce31c19d6eb4b56c40e50871fea6a7e', 0, 1635310847, 'local', 0);
INSERT INTO `ocenter_file` VALUES (225, '1635314156038__storage_emulated_0_DCIM_Camera_1635259577723.png_edit_975096423158503.jpg', '6178e9ed5f789.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 59570, 'f3c22b42fbff03bb20526f69ae38ac31', '11945cdedf4e6ff4b1b0097805ab1db6ed3f15ab', 0, 1635314157, 'local', 0);
INSERT INTO `ocenter_file` VALUES (226, '1635314156139_Screenshot_20211027_070554_com.tencent.mm.jpg', '6178e9ef7326e.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 104124, 'c74079749aa0db99f46ccb313bad1f5e', 'f219da0146b6cad0f07105fa77be8a20ce70b0ad', 0, 1635314159, 'local', 0);
INSERT INTO `ocenter_file` VALUES (227, '16353164161850.jpg', '6178f2c30e983.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 82453, '78b9f989545e052e931a4efc1f36fa96', '1e94b37844298a6484772545a6f892a514603fd6', 0, 1635316419, 'local', 0);
INSERT INTO `ocenter_file` VALUES (228, '16353196915090.jpg', '6178ff8e532f9.jpg', '/Uploads/Download/2021-10-27/', 'jpg', 'image/jpeg', 72794, '2380a7ee8fd4c9d04a6bb1b65f65208a', '99dd8e6d95b3df14d53ebfd16479562e3ab131ad', 0, 1635319694, 'local', 0);
INSERT INTO `ocenter_file` VALUES (229, '16353505070880.jpg', '617977ede3f29.jpg', '/Uploads/Download/2021-10-28/', 'jpg', 'image/jpeg', 76408, 'eb9807fe7e46d516aa8dd92435a2486b', '00ccc627114a99aa9967f2a0c0e9a2d10c79d993', 0, 1635350509, 'local', 0);
INSERT INTO `ocenter_file` VALUES (230, '16354131711940.jpg', '617a6cb524c32.jpg', '/Uploads/Download/2021-10-28/', 'jpg', 'image/jpeg', 78179, 'a53d71c8613bf54d810011911ccf1289', '0c7530acbacfd4ac253e1210fba09d258699017b', 0, 1635413173, 'local', 0);
INSERT INTO `ocenter_file` VALUES (231, '1635433857156_Screenshot_20211010_155013_uni.UNI970A092.sfsq.jpg', '617abd854ace5.jpg', '/Uploads/Download/2021-10-28/', 'jpg', 'image/jpeg', 116526, 'aaa12505d591fc623e6e36db4d6e2954', '28feaffbdd12fc682debc4bdbae2d21fc0a08954', 0, 1635433861, 'local', 0);
INSERT INTO `ocenter_file` VALUES (232, '1635434313084_mmexport1634064931054.jpg', '617abf4fa80bb.jpg', '/Uploads/Download/2021-10-28/', 'jpg', 'image/jpeg', 67484, '07575c541efb61e6ff2b7c3e9522baf0', '4e1cae592c5a3461da21c9372a1981dea441dead', 0, 1635434319, 'local', 0);
INSERT INTO `ocenter_file` VALUES (233, '1635434313100_Screenshot_20211009_201049_uni.UNI970A092.sfsq.jpg', '617abf52ae64f.jpg', '/Uploads/Download/2021-10-28/', 'jpg', 'image/jpeg', 150439, '748e83e82374b20bbbc2683d431cce7e', 'd0ec121ae1906583710d78f48ac5ab8e3e2ed608', 0, 1635434322, 'local', 0);
INSERT INTO `ocenter_file` VALUES (234, '1635499628234_Screenshot_20211029_172659_cn.virgin.system.jpg', '617bbe6dd66c7.jpg', '/Uploads/Download/2021-10-29/', 'jpg', 'image/jpeg', 160999, '46512a8fbd3ec4f5b98664556db6cbb8', '417bf45e2e5751173e8c4186bc3e2a9272c48887', 0, 1635499629, 'local', 0);
INSERT INTO `ocenter_file` VALUES (235, '1635514554934_1635330210736.jpg', '617bf8bfe56d1.jpg', '/Uploads/Download/2021-10-29/', 'jpg', 'image/jpeg', 457899, 'bfa8a0b81a25ec559f7ac77187572bfb', 'aaa9a22f0fd19f40ae627e28deee1ad4e360499d', 0, 1635514559, 'local', 0);
INSERT INTO `ocenter_file` VALUES (236, '1635574933628_Screenshot_20211029-180129.jpg', '617ce49ccc637.jpg', '/Uploads/Download/2021-10-30/', 'jpg', 'image/jpeg', 239262, '4574f12f155bcf783341e22bb474c0a7', 'f20782df460f2c31a68533583340ae92aae548ca', 0, 1635574940, 'local', 0);
INSERT INTO `ocenter_file` VALUES (237, '1635575598237_Screenshot_20211028_185122_cn.com.mapcrm.xep0eey.jpg', '617ce731c9156.jpg', '/Uploads/Download/2021-10-30/', 'jpg', 'image/jpeg', 170440, '1e14aa555634dc3e25b8d99403122c71', 'faee78a21eb448ebc4dbdfe332d21fe7cf188819', 0, 1635575601, 'local', 0);
INSERT INTO `ocenter_file` VALUES (238, '16356695183070.jpg', '617e5610ec6ad.jpg', '/Uploads/Download/2021-10-31/', 'jpg', 'image/jpeg', 83612, 'afd823f99569655af2e81ad7c81899ee', '4128d8e2cb0243740b01c4a07d1cf7953816d576', 0, 1635669520, 'local', 0);
INSERT INTO `ocenter_file` VALUES (239, '16352658608660.png', '617e92b8db5e2.png', '/Uploads/Download/2021-10-31/', 'png', 'image/png', 743086, 'e1e1800f4a5b8fb324dd4160cc8c870e', 'a339b0275ddd94e5f6c195f4119744ced7cf7537', 0, 1635685048, 'local', 0);
INSERT INTO `ocenter_file` VALUES (240, 'mmexport1635311794312.jpg', '617e92bae8d97.jpg', '/Uploads/Download/2021-10-31/', 'jpg', 'image/jpeg', 247179, '85e974cc4e11e7c29e13a54c1e921771', '8714e60725d5bdc9e4b4799d4c346dd707744907', 0, 1635685050, 'local', 0);
INSERT INTO `ocenter_file` VALUES (241, '16356896193080.jpg', '617ea4978c57e.jpg', '/Uploads/Download/2021-10-31/', 'jpg', 'image/jpeg', 52364, '1579c5c85a231ff2cd92351f127f72c8', '53cefc355252e70eab7ac2211b5133026aec66f4', 0, 1635689623, 'local', 0);
INSERT INTO `ocenter_file` VALUES (242, '1635711648439_Screenshot_20211101_042038_com.andui.bihu.jpg', '617efaa3bf946.jpg', '/Uploads/Download/2021-11-01/', 'jpg', 'image/jpeg', 103098, '02d2731ce722677f8088577488ea8609', 'd9418b0997d13499c7b956ce177903803ff7ab03', 0, 1635711651, 'local', 0);
INSERT INTO `ocenter_file` VALUES (243, '1635754718868_mmexport1635514637975.png', '617fa2e374721.png', '/Uploads/Download/2021-11-01/', 'png', 'image/png', 946821, '3bdde429232a4141bed1b73eeeaf1cd2', 'b0b6ffd9fc74c78ebc98bcc0f0c07ddab72ec072', 0, 1635754723, 'local', 0);
INSERT INTO `ocenter_file` VALUES (244, '1635754719402_Screenshot_20211101_130932_com.tencent.mm.jpg', '617fa2e610f1e.jpg', '/Uploads/Download/2021-11-01/', 'jpg', 'image/jpeg', 162126, '9d2d47ef7696170ed4628be5bded2039', '3f1ad87ea989f375ee40cc2a1ad50ac16ca6fe08', 0, 1635754726, 'local', 0);
INSERT INTO `ocenter_file` VALUES (245, '1635754719494_Screenshot_20211101_135839_com.tencent.mm.jpg', '617fa2e8f37ec.jpg', '/Uploads/Download/2021-11-01/', 'jpg', 'image/jpeg', 214360, 'd250e8a88407bda2fb69f418b67e59e3', 'd83472831631a7cd95e6db306d198775f23ac970', 0, 1635754728, 'local', 0);
INSERT INTO `ocenter_file` VALUES (246, '1635754719583_Screenshot_20211029_215802_com.tencent.mm.jpg', '617fa2ebdf816.jpg', '/Uploads/Download/2021-11-01/', 'jpg', 'image/jpeg', 222098, 'bf0bbc03f596b0232d440628654fd249', '033c94e15095e7f98ac49c842ea239de0e8c14f9', 0, 1635754731, 'local', 0);
INSERT INTO `ocenter_file` VALUES (247, '1635776763565_1635688844176.png', '617ff8fe7b256.png', '/Uploads/Download/2021-11-01/', 'png', 'image/png', 290699, '0f8a4d8b7067fcf6f9c85fd613814b6b', '94ed98cadbae688a226bf985187ce0cd5db9b248', 0, 1635776766, 'local', 0);
INSERT INTO `ocenter_file` VALUES (248, '1635776763878_1635713652148.jpeg', '617ff9006381d.jpeg', '/Uploads/Download/2021-11-01/', 'jpeg', 'image/jpeg', 61299, '69abd433632bc883192a1f3a16f5f2b5', '272e1ccfb5eba15a85ffb959970271c95d1baa87', 0, 1635776768, 'local', 0);
INSERT INTO `ocenter_file` VALUES (249, '16359026070590.jpg', '6181e495ec44f.jpg', '/Uploads/Download/2021-11-03/', 'jpg', 'image/jpeg', 71146, '66fb9200024fcf61730a9ce2e930b3df', 'bee7669c474b66cff5c0aaad00d995d9460302f9', 0, 1635902613, 'local', 0);
INSERT INTO `ocenter_file` VALUES (250, '51miz-E824424-EB9952DB.png', '618234255120f.png', '/Uploads/Download/2021-11-03/', 'png', 'image/png', 70217, '7bfaac754f25db49746ec320719e87c1', 'eb166ab098c7d696e3057739bc5e20e8b73172a1', 0, 1635922981, 'local', 0);
INSERT INTO `ocenter_file` VALUES (251, '16359277841730.jpg', '618246eb2672e.jpg', '/Uploads/Download/2021-11-03/', 'jpg', 'image/jpeg', 82989, '545ed4a7997e2ec664619eef89a34364', 'bf52916844d0ab54efadcf1a934f2f9065523432', 0, 1635927787, 'local', 0);
INSERT INTO `ocenter_file` VALUES (252, '1635950147400_mmexport1635904750157.jpg', '61829e44f0301.jpg', '/Uploads/Download/2021-11-03/', 'jpg', 'image/jpeg', 216352, 'e99dfadcd9fea95c67ff3324d27f81ef', '23b30b9d8ccf59e42a93f365a9fe4994c8a48d19', 0, 1635950148, 'local', 0);
INSERT INTO `ocenter_file` VALUES (253, '1636010863060_Screenshot_2021-11-04-15-22-38-81_99df2ef06fcaa37cee46e8ba48ed61e0.jpg', '61838b71ea74e.jpg', '/Uploads/Download/2021-11-04/', 'jpg', 'image/jpeg', 116516, '24c7706da59e39cffc43f5e8dee47a56', 'c27366a4d1a43c6f79ca29e1fdc62e73acb7cb97', 0, 1636010865, 'local', 0);
INSERT INTO `ocenter_file` VALUES (254, '1636010863222_Screenshot_2021-11-04-15-24-46-89_99df2ef06fcaa37cee46e8ba48ed61e0.jpg', '61838b748fb02.jpg', '/Uploads/Download/2021-11-04/', 'jpg', 'image/jpeg', 210085, '0385bdb57e485b048926b1e2f643e528', '6014c3e5ba5562e6b50c45cd8e743ea14692928e', 0, 1636010868, 'local', 0);
INSERT INTO `ocenter_file` VALUES (255, '1636010863375_Screenshot_2021-11-04-15-19-12-80_99df2ef06fcaa37cee46e8ba48ed61e0.jpg', '61838b768f264.jpg', '/Uploads/Download/2021-11-04/', 'jpg', 'image/jpeg', 115674, '03332510a35a1a48a1e2f8cdfe404f7a', 'da62357a039e8d1b7e9de819b2c8ad47807d2a07', 0, 1636010870, 'local', 0);
INSERT INTO `ocenter_file` VALUES (256, '1636076256815_Screenshot_20211105_084706_app.dman.release.jpg', '61848ae1c8571.jpg', '/Uploads/Download/2021-11-05/', 'jpg', 'image/jpeg', 67814, '65230a3088dd2c451811fc316220535d', '21594875e8b868db817eb2fe84310bf763d6bfbc', 0, 1636076257, 'local', 0);
INSERT INTO `ocenter_file` VALUES (257, '16339961879220.jpg', '6186a35dc26e3.jpg', '/Uploads/Download/2021-11-06/', 'jpg', 'image/jpeg', 444218, '5a8523178f646b7f676a778b96110caf', '80f83de8f293a9c7105dd423aa6fb80cb7e5fa04', 0, 1636213597, 'local', 0);
INSERT INTO `ocenter_file` VALUES (258, '16365947607290.jpg', '618c744b2c481.jpg', '/Uploads/Download/2021-11-11/', 'jpg', 'image/jpeg', 71350, '78a18a0c5395b9051bf3f11408255ea7', '2d4b55d255dd2ecf7fd37095066e9cb1ceadb510', 0, 1636594763, 'local', 0);
INSERT INTO `ocenter_file` VALUES (259, 'mmexport1635861334224.jpg', '618c89962df02.jpg', '/Uploads/Download/2021-11-11/', 'jpg', 'image/jpeg', 109640, 'dd5b5f1a04924206e2ea46ab7d81822d', '480e900a5e2301a160a211ddf6754d717429c5e3', 0, 1636600214, 'local', 0);
INSERT INTO `ocenter_file` VALUES (260, '1636945232460_Screenshot_20211115_105737_app.dman.release.jpg', '6191cd5185418.jpg', '/Uploads/Download/2021-11-15/', 'jpg', 'image/jpeg', 121848, '8d613bf5ac77aaf4b585455ed5ca03ae', '2e8db7cd08163234aa4e67965c545f2e040b4a9f', 0, 1636945233, 'local', 0);
INSERT INTO `ocenter_file` VALUES (261, '1637054145130_bc284dd025e4e4436eee91b4d42825a9(3).png', '619376c2c198c.png', '/Uploads/Download/2021-11-16/', 'png', 'image/png', 130358, '300e68a8cdafceb9f28515df4b1743e9', '35686b1d1b0048629dc7aefc276f42dffe8e0730', 0, 1637054146, 'local', 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_follow
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_follow`;
CREATE TABLE `ocenter_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `follow_who` int(11) NOT NULL COMMENT '关注谁',
  `who_follow` int(11) NOT NULL COMMENT '谁关注',
  `create_time` int(11) NOT NULL,
  `alias` varchar(40) NOT NULL COMMENT '备注',
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=531 DEFAULT CHARSET=utf8 COMMENT='关注表';

-- ----------------------------
-- Records of ocenter_follow
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_follow` VALUES (4, 109, 105, 1629620660, '', 0);
INSERT INTO `ocenter_follow` VALUES (5, 111, 109, 1630662853, '', 0);
INSERT INTO `ocenter_follow` VALUES (6, 111, 114, 1630662936, '', 0);
INSERT INTO `ocenter_follow` VALUES (8, 106, 120, 1630736840, '', 0);
INSERT INTO `ocenter_follow` VALUES (9, 115, 106, 1630826266, '', 0);
INSERT INTO `ocenter_follow` VALUES (10, 105, 106, 1630826526, '', 0);
INSERT INTO `ocenter_follow` VALUES (11, 114, 105, 1630833590, '', 0);
INSERT INTO `ocenter_follow` VALUES (12, 105, 109, 1631278921, '', 0);
INSERT INTO `ocenter_follow` VALUES (13, 118, 112, 1631384068, '', 0);
INSERT INTO `ocenter_follow` VALUES (14, 118, 105, 1631513252, '', 0);
INSERT INTO `ocenter_follow` VALUES (15, 111, 105, 1631522504, '', 0);
INSERT INTO `ocenter_follow` VALUES (16, 114, 149, 1632726456, '', 0);
INSERT INTO `ocenter_follow` VALUES (18, 149, 105, 1632782184, '', 0);
INSERT INTO `ocenter_follow` VALUES (20, 973, 1101, 1635067048, '', 0);
INSERT INTO `ocenter_follow` VALUES (21, 111, 1101, 1635110347, '', 0);
INSERT INTO `ocenter_follow` VALUES (22, 114, 1101, 1635110354, '', 0);
INSERT INTO `ocenter_follow` VALUES (23, 957, 1101, 1635110360, '', 0);
INSERT INTO `ocenter_follow` VALUES (26, 109, 1101, 1635110492, '', 0);
INSERT INTO `ocenter_follow` VALUES (27, 452, 1101, 1635111018, '', 0);
INSERT INTO `ocenter_follow` VALUES (28, 119, 1101, 1635111074, '', 0);
INSERT INTO `ocenter_follow` VALUES (29, 105, 1101, 1635111089, '', 0);
INSERT INTO `ocenter_follow` VALUES (30, 120, 1101, 1635111139, '', 0);
INSERT INTO `ocenter_follow` VALUES (31, 1252, 1101, 1635194919, '', 0);
INSERT INTO `ocenter_follow` VALUES (32, 1197, 1101, 1635194923, '', 0);
INSERT INTO `ocenter_follow` VALUES (33, 1254, 1293, 1635305934, '', 0);
INSERT INTO `ocenter_follow` VALUES (34, 114, 1461, 1635697949, '', 0);
INSERT INTO `ocenter_follow` VALUES (35, 0, 1562, 1653056077, '', 0);
INSERT INTO `ocenter_follow` VALUES (36, 1562, 0, 1653056077, '', 0);
INSERT INTO `ocenter_follow` VALUES (37, 0, 1563, 1653118475, '', 0);
INSERT INTO `ocenter_follow` VALUES (38, 1563, 0, 1653118475, '', 0);
INSERT INTO `ocenter_follow` VALUES (39, 0, 1564, 1653118695, '', 0);
INSERT INTO `ocenter_follow` VALUES (40, 1564, 0, 1653118695, '', 0);
INSERT INTO `ocenter_follow` VALUES (41, 0, 1565, 1653119169, '', 0);
INSERT INTO `ocenter_follow` VALUES (42, 1565, 0, 1653119169, '', 0);
INSERT INTO `ocenter_follow` VALUES (43, 0, 1566, 1654008410, '', 0);
INSERT INTO `ocenter_follow` VALUES (44, 1566, 0, 1654008410, '', 0);
INSERT INTO `ocenter_follow` VALUES (45, 0, 1567, 1654008666, '', 0);
INSERT INTO `ocenter_follow` VALUES (46, 1567, 0, 1654008666, '', 0);
INSERT INTO `ocenter_follow` VALUES (47, 0, 1568, 1654049300, '', 0);
INSERT INTO `ocenter_follow` VALUES (48, 1568, 0, 1654049300, '', 0);
INSERT INTO `ocenter_follow` VALUES (49, 0, 1569, 1654049627, '', 0);
INSERT INTO `ocenter_follow` VALUES (50, 1569, 0, 1654049627, '', 0);
INSERT INTO `ocenter_follow` VALUES (51, 0, 1570, 1654050012, '', 0);
INSERT INTO `ocenter_follow` VALUES (52, 1570, 0, 1654050012, '', 0);
INSERT INTO `ocenter_follow` VALUES (53, 0, 1571, 1654050124, '', 0);
INSERT INTO `ocenter_follow` VALUES (54, 1571, 0, 1654050124, '', 0);
INSERT INTO `ocenter_follow` VALUES (55, 0, 1572, 1654066643, '', 0);
INSERT INTO `ocenter_follow` VALUES (56, 1572, 0, 1654066643, '', 0);
INSERT INTO `ocenter_follow` VALUES (57, 0, 1573, 1654066700, '', 0);
INSERT INTO `ocenter_follow` VALUES (58, 1573, 0, 1654066700, '', 0);
INSERT INTO `ocenter_follow` VALUES (59, 0, 1574, 1654067249, '', 0);
INSERT INTO `ocenter_follow` VALUES (60, 1574, 0, 1654067249, '', 0);
INSERT INTO `ocenter_follow` VALUES (61, 0, 1575, 1654067981, '', 0);
INSERT INTO `ocenter_follow` VALUES (62, 1575, 0, 1654067981, '', 0);
INSERT INTO `ocenter_follow` VALUES (63, 0, 1576, 1654068090, '', 0);
INSERT INTO `ocenter_follow` VALUES (64, 1576, 0, 1654068090, '', 0);
INSERT INTO `ocenter_follow` VALUES (65, 0, 1577, 1654068147, '', 0);
INSERT INTO `ocenter_follow` VALUES (66, 1577, 0, 1654068147, '', 0);
INSERT INTO `ocenter_follow` VALUES (67, 0, 1578, 1654068189, '', 0);
INSERT INTO `ocenter_follow` VALUES (68, 1578, 0, 1654068189, '', 0);
INSERT INTO `ocenter_follow` VALUES (69, 0, 1579, 1654068315, '', 0);
INSERT INTO `ocenter_follow` VALUES (70, 1579, 0, 1654068315, '', 0);
INSERT INTO `ocenter_follow` VALUES (71, 0, 1580, 1654068480, '', 0);
INSERT INTO `ocenter_follow` VALUES (72, 1580, 0, 1654068480, '', 0);
INSERT INTO `ocenter_follow` VALUES (73, 0, 1581, 1654068485, '', 0);
INSERT INTO `ocenter_follow` VALUES (74, 1581, 0, 1654068485, '', 0);
INSERT INTO `ocenter_follow` VALUES (75, 0, 1582, 1654068525, '', 0);
INSERT INTO `ocenter_follow` VALUES (76, 1582, 0, 1654068525, '', 0);
INSERT INTO `ocenter_follow` VALUES (77, 0, 1583, 1654068535, '', 0);
INSERT INTO `ocenter_follow` VALUES (78, 1583, 0, 1654068535, '', 0);
INSERT INTO `ocenter_follow` VALUES (79, 0, 1584, 1654068550, '', 0);
INSERT INTO `ocenter_follow` VALUES (80, 1584, 0, 1654068550, '', 0);
INSERT INTO `ocenter_follow` VALUES (81, 0, 1585, 1654068628, '', 0);
INSERT INTO `ocenter_follow` VALUES (82, 1585, 0, 1654068628, '', 0);
INSERT INTO `ocenter_follow` VALUES (83, 0, 1586, 1654068635, '', 0);
INSERT INTO `ocenter_follow` VALUES (84, 1586, 0, 1654068635, '', 0);
INSERT INTO `ocenter_follow` VALUES (85, 0, 1587, 1654068665, '', 0);
INSERT INTO `ocenter_follow` VALUES (86, 1587, 0, 1654068665, '', 0);
INSERT INTO `ocenter_follow` VALUES (87, 0, 1588, 1654068698, '', 0);
INSERT INTO `ocenter_follow` VALUES (88, 1588, 0, 1654068698, '', 0);
INSERT INTO `ocenter_follow` VALUES (89, 0, 1589, 1654068698, '', 0);
INSERT INTO `ocenter_follow` VALUES (90, 1589, 0, 1654068698, '', 0);
INSERT INTO `ocenter_follow` VALUES (91, 0, 1590, 1654068761, '', 0);
INSERT INTO `ocenter_follow` VALUES (92, 1590, 0, 1654068761, '', 0);
INSERT INTO `ocenter_follow` VALUES (93, 0, 1591, 1654068772, '', 0);
INSERT INTO `ocenter_follow` VALUES (94, 1591, 0, 1654068772, '', 0);
INSERT INTO `ocenter_follow` VALUES (95, 0, 1592, 1654068807, '', 0);
INSERT INTO `ocenter_follow` VALUES (96, 1592, 0, 1654068807, '', 0);
INSERT INTO `ocenter_follow` VALUES (97, 0, 1593, 1654068832, '', 0);
INSERT INTO `ocenter_follow` VALUES (98, 1593, 0, 1654068832, '', 0);
INSERT INTO `ocenter_follow` VALUES (99, 0, 1594, 1654068876, '', 0);
INSERT INTO `ocenter_follow` VALUES (100, 1594, 0, 1654068876, '', 0);
INSERT INTO `ocenter_follow` VALUES (101, 0, 1595, 1654068877, '', 0);
INSERT INTO `ocenter_follow` VALUES (102, 1595, 0, 1654068877, '', 0);
INSERT INTO `ocenter_follow` VALUES (103, 0, 1596, 1654068887, '', 0);
INSERT INTO `ocenter_follow` VALUES (104, 1596, 0, 1654068887, '', 0);
INSERT INTO `ocenter_follow` VALUES (105, 0, 1597, 1654068909, '', 0);
INSERT INTO `ocenter_follow` VALUES (106, 1597, 0, 1654068909, '', 0);
INSERT INTO `ocenter_follow` VALUES (107, 0, 1598, 1654068918, '', 0);
INSERT INTO `ocenter_follow` VALUES (108, 1598, 0, 1654068918, '', 0);
INSERT INTO `ocenter_follow` VALUES (109, 0, 1599, 1654068968, '', 0);
INSERT INTO `ocenter_follow` VALUES (110, 1599, 0, 1654068968, '', 0);
INSERT INTO `ocenter_follow` VALUES (111, 0, 1600, 1654068990, '', 0);
INSERT INTO `ocenter_follow` VALUES (112, 1600, 0, 1654068990, '', 0);
INSERT INTO `ocenter_follow` VALUES (113, 0, 1601, 1654069022, '', 0);
INSERT INTO `ocenter_follow` VALUES (114, 1601, 0, 1654069022, '', 0);
INSERT INTO `ocenter_follow` VALUES (115, 0, 1602, 1654069037, '', 0);
INSERT INTO `ocenter_follow` VALUES (116, 1602, 0, 1654069037, '', 0);
INSERT INTO `ocenter_follow` VALUES (117, 0, 1603, 1654069071, '', 0);
INSERT INTO `ocenter_follow` VALUES (118, 1603, 0, 1654069071, '', 0);
INSERT INTO `ocenter_follow` VALUES (119, 0, 1604, 1654069085, '', 0);
INSERT INTO `ocenter_follow` VALUES (120, 1604, 0, 1654069085, '', 0);
INSERT INTO `ocenter_follow` VALUES (121, 0, 1605, 1654069089, '', 0);
INSERT INTO `ocenter_follow` VALUES (122, 1605, 0, 1654069089, '', 0);
INSERT INTO `ocenter_follow` VALUES (123, 0, 1606, 1654069115, '', 0);
INSERT INTO `ocenter_follow` VALUES (124, 1606, 0, 1654069115, '', 0);
INSERT INTO `ocenter_follow` VALUES (125, 0, 1607, 1654069131, '', 0);
INSERT INTO `ocenter_follow` VALUES (126, 1607, 0, 1654069131, '', 0);
INSERT INTO `ocenter_follow` VALUES (127, 0, 1608, 1654069137, '', 0);
INSERT INTO `ocenter_follow` VALUES (128, 1608, 0, 1654069137, '', 0);
INSERT INTO `ocenter_follow` VALUES (129, 0, 1609, 1654069171, '', 0);
INSERT INTO `ocenter_follow` VALUES (130, 1609, 0, 1654069171, '', 0);
INSERT INTO `ocenter_follow` VALUES (131, 0, 1610, 1654069181, '', 0);
INSERT INTO `ocenter_follow` VALUES (132, 1610, 0, 1654069181, '', 0);
INSERT INTO `ocenter_follow` VALUES (133, 0, 1611, 1654069237, '', 0);
INSERT INTO `ocenter_follow` VALUES (134, 1611, 0, 1654069237, '', 0);
INSERT INTO `ocenter_follow` VALUES (135, 0, 1612, 1654069270, '', 0);
INSERT INTO `ocenter_follow` VALUES (136, 1612, 0, 1654069270, '', 0);
INSERT INTO `ocenter_follow` VALUES (137, 0, 1613, 1654069285, '', 0);
INSERT INTO `ocenter_follow` VALUES (138, 1613, 0, 1654069285, '', 0);
INSERT INTO `ocenter_follow` VALUES (139, 0, 1614, 1654069327, '', 0);
INSERT INTO `ocenter_follow` VALUES (140, 1614, 0, 1654069327, '', 0);
INSERT INTO `ocenter_follow` VALUES (141, 0, 1615, 1654069360, '', 0);
INSERT INTO `ocenter_follow` VALUES (142, 1615, 0, 1654069360, '', 0);
INSERT INTO `ocenter_follow` VALUES (143, 0, 1616, 1654069448, '', 0);
INSERT INTO `ocenter_follow` VALUES (144, 1616, 0, 1654069448, '', 0);
INSERT INTO `ocenter_follow` VALUES (145, 0, 1617, 1654069459, '', 0);
INSERT INTO `ocenter_follow` VALUES (146, 1617, 0, 1654069459, '', 0);
INSERT INTO `ocenter_follow` VALUES (147, 0, 1618, 1654069476, '', 0);
INSERT INTO `ocenter_follow` VALUES (148, 1618, 0, 1654069476, '', 0);
INSERT INTO `ocenter_follow` VALUES (149, 0, 1619, 1654069504, '', 0);
INSERT INTO `ocenter_follow` VALUES (150, 1619, 0, 1654069504, '', 0);
INSERT INTO `ocenter_follow` VALUES (151, 0, 1620, 1654069511, '', 0);
INSERT INTO `ocenter_follow` VALUES (152, 1620, 0, 1654069511, '', 0);
INSERT INTO `ocenter_follow` VALUES (153, 0, 1621, 1654069537, '', 0);
INSERT INTO `ocenter_follow` VALUES (154, 1621, 0, 1654069537, '', 0);
INSERT INTO `ocenter_follow` VALUES (155, 0, 1622, 1654069568, '', 0);
INSERT INTO `ocenter_follow` VALUES (156, 1622, 0, 1654069568, '', 0);
INSERT INTO `ocenter_follow` VALUES (157, 0, 1623, 1654069578, '', 0);
INSERT INTO `ocenter_follow` VALUES (158, 1623, 0, 1654069578, '', 0);
INSERT INTO `ocenter_follow` VALUES (159, 0, 1624, 1654069637, '', 0);
INSERT INTO `ocenter_follow` VALUES (160, 1624, 0, 1654069637, '', 0);
INSERT INTO `ocenter_follow` VALUES (161, 0, 1625, 1654069656, '', 0);
INSERT INTO `ocenter_follow` VALUES (162, 1625, 0, 1654069656, '', 0);
INSERT INTO `ocenter_follow` VALUES (163, 0, 1626, 1654069676, '', 0);
INSERT INTO `ocenter_follow` VALUES (164, 1626, 0, 1654069676, '', 0);
INSERT INTO `ocenter_follow` VALUES (165, 0, 1627, 1654069707, '', 0);
INSERT INTO `ocenter_follow` VALUES (166, 1627, 0, 1654069707, '', 0);
INSERT INTO `ocenter_follow` VALUES (167, 0, 1628, 1654069710, '', 0);
INSERT INTO `ocenter_follow` VALUES (168, 1628, 0, 1654069710, '', 0);
INSERT INTO `ocenter_follow` VALUES (169, 0, 1629, 1654069737, '', 0);
INSERT INTO `ocenter_follow` VALUES (170, 1629, 0, 1654069737, '', 0);
INSERT INTO `ocenter_follow` VALUES (171, 0, 1630, 1654069753, '', 0);
INSERT INTO `ocenter_follow` VALUES (172, 1630, 0, 1654069753, '', 0);
INSERT INTO `ocenter_follow` VALUES (173, 0, 1631, 1654069760, '', 0);
INSERT INTO `ocenter_follow` VALUES (174, 1631, 0, 1654069760, '', 0);
INSERT INTO `ocenter_follow` VALUES (175, 0, 1632, 1654069796, '', 0);
INSERT INTO `ocenter_follow` VALUES (176, 1632, 0, 1654069796, '', 0);
INSERT INTO `ocenter_follow` VALUES (177, 0, 1633, 1654069816, '', 0);
INSERT INTO `ocenter_follow` VALUES (178, 1633, 0, 1654069816, '', 0);
INSERT INTO `ocenter_follow` VALUES (179, 0, 1634, 1654069850, '', 0);
INSERT INTO `ocenter_follow` VALUES (180, 1634, 0, 1654069850, '', 0);
INSERT INTO `ocenter_follow` VALUES (181, 0, 1635, 1654069885, '', 0);
INSERT INTO `ocenter_follow` VALUES (182, 1635, 0, 1654069885, '', 0);
INSERT INTO `ocenter_follow` VALUES (183, 0, 1636, 1654069895, '', 0);
INSERT INTO `ocenter_follow` VALUES (184, 1636, 0, 1654069895, '', 0);
INSERT INTO `ocenter_follow` VALUES (185, 0, 1637, 1654069924, '', 0);
INSERT INTO `ocenter_follow` VALUES (186, 1637, 0, 1654069924, '', 0);
INSERT INTO `ocenter_follow` VALUES (187, 0, 1638, 1654069928, '', 0);
INSERT INTO `ocenter_follow` VALUES (188, 1638, 0, 1654069928, '', 0);
INSERT INTO `ocenter_follow` VALUES (189, 0, 1639, 1654069960, '', 0);
INSERT INTO `ocenter_follow` VALUES (190, 1639, 0, 1654069960, '', 0);
INSERT INTO `ocenter_follow` VALUES (191, 0, 1640, 1654070004, '', 0);
INSERT INTO `ocenter_follow` VALUES (192, 1640, 0, 1654070004, '', 0);
INSERT INTO `ocenter_follow` VALUES (193, 0, 1641, 1654070040, '', 0);
INSERT INTO `ocenter_follow` VALUES (194, 1641, 0, 1654070040, '', 0);
INSERT INTO `ocenter_follow` VALUES (195, 0, 1642, 1654070066, '', 0);
INSERT INTO `ocenter_follow` VALUES (196, 1642, 0, 1654070066, '', 0);
INSERT INTO `ocenter_follow` VALUES (197, 0, 1643, 1654070083, '', 0);
INSERT INTO `ocenter_follow` VALUES (198, 1643, 0, 1654070083, '', 0);
INSERT INTO `ocenter_follow` VALUES (199, 0, 1644, 1654070094, '', 0);
INSERT INTO `ocenter_follow` VALUES (200, 1644, 0, 1654070094, '', 0);
INSERT INTO `ocenter_follow` VALUES (201, 0, 1645, 1654070164, '', 0);
INSERT INTO `ocenter_follow` VALUES (202, 1645, 0, 1654070164, '', 0);
INSERT INTO `ocenter_follow` VALUES (203, 0, 1646, 1654070165, '', 0);
INSERT INTO `ocenter_follow` VALUES (204, 1646, 0, 1654070165, '', 0);
INSERT INTO `ocenter_follow` VALUES (205, 0, 1647, 1654070206, '', 0);
INSERT INTO `ocenter_follow` VALUES (206, 1647, 0, 1654070206, '', 0);
INSERT INTO `ocenter_follow` VALUES (207, 0, 1648, 1654070242, '', 0);
INSERT INTO `ocenter_follow` VALUES (208, 1648, 0, 1654070242, '', 0);
INSERT INTO `ocenter_follow` VALUES (209, 0, 1649, 1654070306, '', 0);
INSERT INTO `ocenter_follow` VALUES (210, 1649, 0, 1654070306, '', 0);
INSERT INTO `ocenter_follow` VALUES (211, 0, 1650, 1654070348, '', 0);
INSERT INTO `ocenter_follow` VALUES (212, 1650, 0, 1654070348, '', 0);
INSERT INTO `ocenter_follow` VALUES (213, 0, 1651, 1654070352, '', 0);
INSERT INTO `ocenter_follow` VALUES (214, 1651, 0, 1654070352, '', 0);
INSERT INTO `ocenter_follow` VALUES (215, 0, 1652, 1654070354, '', 0);
INSERT INTO `ocenter_follow` VALUES (216, 1652, 0, 1654070354, '', 0);
INSERT INTO `ocenter_follow` VALUES (217, 0, 1653, 1654070386, '', 0);
INSERT INTO `ocenter_follow` VALUES (218, 1653, 0, 1654070386, '', 0);
INSERT INTO `ocenter_follow` VALUES (219, 0, 1654, 1654070391, '', 0);
INSERT INTO `ocenter_follow` VALUES (220, 1654, 0, 1654070391, '', 0);
INSERT INTO `ocenter_follow` VALUES (221, 0, 1655, 1654070392, '', 0);
INSERT INTO `ocenter_follow` VALUES (222, 1655, 0, 1654070392, '', 0);
INSERT INTO `ocenter_follow` VALUES (223, 0, 1656, 1654070430, '', 0);
INSERT INTO `ocenter_follow` VALUES (224, 1656, 0, 1654070430, '', 0);
INSERT INTO `ocenter_follow` VALUES (225, 0, 1657, 1654070445, '', 0);
INSERT INTO `ocenter_follow` VALUES (226, 1657, 0, 1654070445, '', 0);
INSERT INTO `ocenter_follow` VALUES (227, 0, 1658, 1654070470, '', 0);
INSERT INTO `ocenter_follow` VALUES (228, 1658, 0, 1654070470, '', 0);
INSERT INTO `ocenter_follow` VALUES (229, 0, 1659, 1654070483, '', 0);
INSERT INTO `ocenter_follow` VALUES (230, 1659, 0, 1654070483, '', 0);
INSERT INTO `ocenter_follow` VALUES (231, 0, 1660, 1654070502, '', 0);
INSERT INTO `ocenter_follow` VALUES (232, 1660, 0, 1654070502, '', 0);
INSERT INTO `ocenter_follow` VALUES (233, 0, 1661, 1654070504, '', 0);
INSERT INTO `ocenter_follow` VALUES (234, 1661, 0, 1654070504, '', 0);
INSERT INTO `ocenter_follow` VALUES (235, 0, 1662, 1654070544, '', 0);
INSERT INTO `ocenter_follow` VALUES (236, 1662, 0, 1654070544, '', 0);
INSERT INTO `ocenter_follow` VALUES (237, 0, 1663, 1654070586, '', 0);
INSERT INTO `ocenter_follow` VALUES (238, 1663, 0, 1654070586, '', 0);
INSERT INTO `ocenter_follow` VALUES (239, 0, 1664, 1654070645, '', 0);
INSERT INTO `ocenter_follow` VALUES (240, 1664, 0, 1654070645, '', 0);
INSERT INTO `ocenter_follow` VALUES (241, 0, 1665, 1654070674, '', 0);
INSERT INTO `ocenter_follow` VALUES (242, 1665, 0, 1654070674, '', 0);
INSERT INTO `ocenter_follow` VALUES (243, 0, 1666, 1654070724, '', 0);
INSERT INTO `ocenter_follow` VALUES (244, 1666, 0, 1654070724, '', 0);
INSERT INTO `ocenter_follow` VALUES (245, 0, 1667, 1654070762, '', 0);
INSERT INTO `ocenter_follow` VALUES (246, 1667, 0, 1654070762, '', 0);
INSERT INTO `ocenter_follow` VALUES (247, 0, 1668, 1654070777, '', 0);
INSERT INTO `ocenter_follow` VALUES (248, 1668, 0, 1654070777, '', 0);
INSERT INTO `ocenter_follow` VALUES (249, 0, 1669, 1654070792, '', 0);
INSERT INTO `ocenter_follow` VALUES (250, 1669, 0, 1654070792, '', 0);
INSERT INTO `ocenter_follow` VALUES (251, 0, 1670, 1654070810, '', 0);
INSERT INTO `ocenter_follow` VALUES (252, 1670, 0, 1654070810, '', 0);
INSERT INTO `ocenter_follow` VALUES (253, 0, 1671, 1654070828, '', 0);
INSERT INTO `ocenter_follow` VALUES (254, 1671, 0, 1654070828, '', 0);
INSERT INTO `ocenter_follow` VALUES (255, 0, 1672, 1654070844, '', 0);
INSERT INTO `ocenter_follow` VALUES (256, 1672, 0, 1654070844, '', 0);
INSERT INTO `ocenter_follow` VALUES (257, 0, 1673, 1654070863, '', 0);
INSERT INTO `ocenter_follow` VALUES (258, 1673, 0, 1654070863, '', 0);
INSERT INTO `ocenter_follow` VALUES (259, 0, 1674, 1654070902, '', 0);
INSERT INTO `ocenter_follow` VALUES (260, 1674, 0, 1654070902, '', 0);
INSERT INTO `ocenter_follow` VALUES (261, 0, 1675, 1654070912, '', 0);
INSERT INTO `ocenter_follow` VALUES (262, 1675, 0, 1654070912, '', 0);
INSERT INTO `ocenter_follow` VALUES (263, 0, 1676, 1654070936, '', 0);
INSERT INTO `ocenter_follow` VALUES (264, 1676, 0, 1654070936, '', 0);
INSERT INTO `ocenter_follow` VALUES (265, 0, 1677, 1654070951, '', 0);
INSERT INTO `ocenter_follow` VALUES (266, 1677, 0, 1654070951, '', 0);
INSERT INTO `ocenter_follow` VALUES (267, 0, 1678, 1654070978, '', 0);
INSERT INTO `ocenter_follow` VALUES (268, 1678, 0, 1654070978, '', 0);
INSERT INTO `ocenter_follow` VALUES (269, 0, 1679, 1654071033, '', 0);
INSERT INTO `ocenter_follow` VALUES (270, 1679, 0, 1654071033, '', 0);
INSERT INTO `ocenter_follow` VALUES (271, 0, 1680, 1654071087, '', 0);
INSERT INTO `ocenter_follow` VALUES (272, 1680, 0, 1654071087, '', 0);
INSERT INTO `ocenter_follow` VALUES (273, 0, 1681, 1654071105, '', 0);
INSERT INTO `ocenter_follow` VALUES (274, 1681, 0, 1654071105, '', 0);
INSERT INTO `ocenter_follow` VALUES (275, 0, 1682, 1654071133, '', 0);
INSERT INTO `ocenter_follow` VALUES (276, 1682, 0, 1654071133, '', 0);
INSERT INTO `ocenter_follow` VALUES (277, 0, 1683, 1654071145, '', 0);
INSERT INTO `ocenter_follow` VALUES (278, 1683, 0, 1654071145, '', 0);
INSERT INTO `ocenter_follow` VALUES (279, 0, 1684, 1654071221, '', 0);
INSERT INTO `ocenter_follow` VALUES (280, 1684, 0, 1654071221, '', 0);
INSERT INTO `ocenter_follow` VALUES (281, 0, 1685, 1654071264, '', 0);
INSERT INTO `ocenter_follow` VALUES (282, 1685, 0, 1654071264, '', 0);
INSERT INTO `ocenter_follow` VALUES (283, 0, 1686, 1654071300, '', 0);
INSERT INTO `ocenter_follow` VALUES (284, 1686, 0, 1654071300, '', 0);
INSERT INTO `ocenter_follow` VALUES (285, 0, 1687, 1654071314, '', 0);
INSERT INTO `ocenter_follow` VALUES (286, 1687, 0, 1654071314, '', 0);
INSERT INTO `ocenter_follow` VALUES (287, 0, 1688, 1654071365, '', 0);
INSERT INTO `ocenter_follow` VALUES (288, 1688, 0, 1654071365, '', 0);
INSERT INTO `ocenter_follow` VALUES (289, 0, 1689, 1654071392, '', 0);
INSERT INTO `ocenter_follow` VALUES (290, 1689, 0, 1654071392, '', 0);
INSERT INTO `ocenter_follow` VALUES (291, 0, 1690, 1654071471, '', 0);
INSERT INTO `ocenter_follow` VALUES (292, 1690, 0, 1654071471, '', 0);
INSERT INTO `ocenter_follow` VALUES (293, 0, 1691, 1654071502, '', 0);
INSERT INTO `ocenter_follow` VALUES (294, 1691, 0, 1654071502, '', 0);
INSERT INTO `ocenter_follow` VALUES (295, 0, 1692, 1654071533, '', 0);
INSERT INTO `ocenter_follow` VALUES (296, 1692, 0, 1654071533, '', 0);
INSERT INTO `ocenter_follow` VALUES (297, 0, 1693, 1654071562, '', 0);
INSERT INTO `ocenter_follow` VALUES (298, 1693, 0, 1654071562, '', 0);
INSERT INTO `ocenter_follow` VALUES (299, 0, 1694, 1654071611, '', 0);
INSERT INTO `ocenter_follow` VALUES (300, 1694, 0, 1654071611, '', 0);
INSERT INTO `ocenter_follow` VALUES (301, 0, 1695, 1654071644, '', 0);
INSERT INTO `ocenter_follow` VALUES (302, 1695, 0, 1654071644, '', 0);
INSERT INTO `ocenter_follow` VALUES (303, 0, 1696, 1654071673, '', 0);
INSERT INTO `ocenter_follow` VALUES (304, 1696, 0, 1654071673, '', 0);
INSERT INTO `ocenter_follow` VALUES (305, 0, 1697, 1654071698, '', 0);
INSERT INTO `ocenter_follow` VALUES (306, 1697, 0, 1654071698, '', 0);
INSERT INTO `ocenter_follow` VALUES (307, 0, 1698, 1654071731, '', 0);
INSERT INTO `ocenter_follow` VALUES (308, 1698, 0, 1654071731, '', 0);
INSERT INTO `ocenter_follow` VALUES (309, 0, 1699, 1654071758, '', 0);
INSERT INTO `ocenter_follow` VALUES (310, 1699, 0, 1654071758, '', 0);
INSERT INTO `ocenter_follow` VALUES (311, 0, 1700, 1654071791, '', 0);
INSERT INTO `ocenter_follow` VALUES (312, 1700, 0, 1654071791, '', 0);
INSERT INTO `ocenter_follow` VALUES (313, 0, 1701, 1654071835, '', 0);
INSERT INTO `ocenter_follow` VALUES (314, 1701, 0, 1654071835, '', 0);
INSERT INTO `ocenter_follow` VALUES (315, 0, 1702, 1654071878, '', 0);
INSERT INTO `ocenter_follow` VALUES (316, 1702, 0, 1654071878, '', 0);
INSERT INTO `ocenter_follow` VALUES (317, 0, 1703, 1654071915, '', 0);
INSERT INTO `ocenter_follow` VALUES (318, 1703, 0, 1654071915, '', 0);
INSERT INTO `ocenter_follow` VALUES (319, 0, 1704, 1654071935, '', 0);
INSERT INTO `ocenter_follow` VALUES (320, 1704, 0, 1654071935, '', 0);
INSERT INTO `ocenter_follow` VALUES (321, 0, 1705, 1654071950, '', 0);
INSERT INTO `ocenter_follow` VALUES (322, 1705, 0, 1654071950, '', 0);
INSERT INTO `ocenter_follow` VALUES (323, 0, 1706, 1654071977, '', 0);
INSERT INTO `ocenter_follow` VALUES (324, 1706, 0, 1654071977, '', 0);
INSERT INTO `ocenter_follow` VALUES (325, 0, 1707, 1654071978, '', 0);
INSERT INTO `ocenter_follow` VALUES (326, 1707, 0, 1654071978, '', 0);
INSERT INTO `ocenter_follow` VALUES (327, 0, 1708, 1654072005, '', 0);
INSERT INTO `ocenter_follow` VALUES (328, 1708, 0, 1654072005, '', 0);
INSERT INTO `ocenter_follow` VALUES (329, 0, 1709, 1654072014, '', 0);
INSERT INTO `ocenter_follow` VALUES (330, 1709, 0, 1654072014, '', 0);
INSERT INTO `ocenter_follow` VALUES (331, 0, 1710, 1654072030, '', 0);
INSERT INTO `ocenter_follow` VALUES (332, 1710, 0, 1654072030, '', 0);
INSERT INTO `ocenter_follow` VALUES (333, 0, 1711, 1654072041, '', 0);
INSERT INTO `ocenter_follow` VALUES (334, 1711, 0, 1654072041, '', 0);
INSERT INTO `ocenter_follow` VALUES (335, 0, 1712, 1654072063, '', 0);
INSERT INTO `ocenter_follow` VALUES (336, 1712, 0, 1654072063, '', 0);
INSERT INTO `ocenter_follow` VALUES (337, 0, 1713, 1654072069, '', 0);
INSERT INTO `ocenter_follow` VALUES (338, 1713, 0, 1654072069, '', 0);
INSERT INTO `ocenter_follow` VALUES (339, 0, 1714, 1654072118, '', 0);
INSERT INTO `ocenter_follow` VALUES (340, 1714, 0, 1654072118, '', 0);
INSERT INTO `ocenter_follow` VALUES (341, 0, 1715, 1654072153, '', 0);
INSERT INTO `ocenter_follow` VALUES (342, 1715, 0, 1654072153, '', 0);
INSERT INTO `ocenter_follow` VALUES (343, 0, 1716, 1654072189, '', 0);
INSERT INTO `ocenter_follow` VALUES (344, 1716, 0, 1654072189, '', 0);
INSERT INTO `ocenter_follow` VALUES (345, 0, 1717, 1654072223, '', 0);
INSERT INTO `ocenter_follow` VALUES (346, 1717, 0, 1654072223, '', 0);
INSERT INTO `ocenter_follow` VALUES (347, 0, 1718, 1654072256, '', 0);
INSERT INTO `ocenter_follow` VALUES (348, 1718, 0, 1654072256, '', 0);
INSERT INTO `ocenter_follow` VALUES (349, 0, 1719, 1654072303, '', 0);
INSERT INTO `ocenter_follow` VALUES (350, 1719, 0, 1654072303, '', 0);
INSERT INTO `ocenter_follow` VALUES (351, 0, 1720, 1654072337, '', 0);
INSERT INTO `ocenter_follow` VALUES (352, 1720, 0, 1654072337, '', 0);
INSERT INTO `ocenter_follow` VALUES (353, 0, 1721, 1654072414, '', 0);
INSERT INTO `ocenter_follow` VALUES (354, 1721, 0, 1654072414, '', 0);
INSERT INTO `ocenter_follow` VALUES (355, 0, 1722, 1654072449, '', 0);
INSERT INTO `ocenter_follow` VALUES (356, 1722, 0, 1654072449, '', 0);
INSERT INTO `ocenter_follow` VALUES (357, 0, 1723, 1654072530, '', 0);
INSERT INTO `ocenter_follow` VALUES (358, 1723, 0, 1654072530, '', 0);
INSERT INTO `ocenter_follow` VALUES (359, 0, 1724, 1654072562, '', 0);
INSERT INTO `ocenter_follow` VALUES (360, 1724, 0, 1654072562, '', 0);
INSERT INTO `ocenter_follow` VALUES (361, 0, 1725, 1654072609, '', 0);
INSERT INTO `ocenter_follow` VALUES (362, 1725, 0, 1654072609, '', 0);
INSERT INTO `ocenter_follow` VALUES (363, 0, 1726, 1654072651, '', 0);
INSERT INTO `ocenter_follow` VALUES (364, 1726, 0, 1654072651, '', 0);
INSERT INTO `ocenter_follow` VALUES (365, 0, 1727, 1654072665, '', 0);
INSERT INTO `ocenter_follow` VALUES (366, 1727, 0, 1654072665, '', 0);
INSERT INTO `ocenter_follow` VALUES (367, 0, 1728, 1654072681, '', 0);
INSERT INTO `ocenter_follow` VALUES (368, 1728, 0, 1654072681, '', 0);
INSERT INTO `ocenter_follow` VALUES (369, 0, 1729, 1654072701, '', 0);
INSERT INTO `ocenter_follow` VALUES (370, 1729, 0, 1654072701, '', 0);
INSERT INTO `ocenter_follow` VALUES (371, 0, 1730, 1654072737, '', 0);
INSERT INTO `ocenter_follow` VALUES (372, 1730, 0, 1654072737, '', 0);
INSERT INTO `ocenter_follow` VALUES (373, 0, 1731, 1654072745, '', 0);
INSERT INTO `ocenter_follow` VALUES (374, 1731, 0, 1654072745, '', 0);
INSERT INTO `ocenter_follow` VALUES (375, 0, 1732, 1654072765, '', 0);
INSERT INTO `ocenter_follow` VALUES (376, 1732, 0, 1654072765, '', 0);
INSERT INTO `ocenter_follow` VALUES (377, 0, 1733, 1654072801, '', 0);
INSERT INTO `ocenter_follow` VALUES (378, 1733, 0, 1654072801, '', 0);
INSERT INTO `ocenter_follow` VALUES (379, 0, 1734, 1654072835, '', 0);
INSERT INTO `ocenter_follow` VALUES (380, 1734, 0, 1654072835, '', 0);
INSERT INTO `ocenter_follow` VALUES (381, 0, 1735, 1654072916, '', 0);
INSERT INTO `ocenter_follow` VALUES (382, 1735, 0, 1654072916, '', 0);
INSERT INTO `ocenter_follow` VALUES (383, 0, 1736, 1654072922, '', 0);
INSERT INTO `ocenter_follow` VALUES (384, 1736, 0, 1654072922, '', 0);
INSERT INTO `ocenter_follow` VALUES (385, 0, 1737, 1654072960, '', 0);
INSERT INTO `ocenter_follow` VALUES (386, 1737, 0, 1654072960, '', 0);
INSERT INTO `ocenter_follow` VALUES (387, 0, 1738, 1654072965, '', 0);
INSERT INTO `ocenter_follow` VALUES (388, 1738, 0, 1654072965, '', 0);
INSERT INTO `ocenter_follow` VALUES (389, 0, 1739, 1654072982, '', 0);
INSERT INTO `ocenter_follow` VALUES (390, 1739, 0, 1654072982, '', 0);
INSERT INTO `ocenter_follow` VALUES (391, 0, 1740, 1654072998, '', 0);
INSERT INTO `ocenter_follow` VALUES (392, 1740, 0, 1654072998, '', 0);
INSERT INTO `ocenter_follow` VALUES (393, 0, 1741, 1654073011, '', 0);
INSERT INTO `ocenter_follow` VALUES (394, 1741, 0, 1654073011, '', 0);
INSERT INTO `ocenter_follow` VALUES (395, 0, 1742, 1654073029, '', 0);
INSERT INTO `ocenter_follow` VALUES (396, 1742, 0, 1654073029, '', 0);
INSERT INTO `ocenter_follow` VALUES (397, 0, 1743, 1654073046, '', 0);
INSERT INTO `ocenter_follow` VALUES (398, 1743, 0, 1654073046, '', 0);
INSERT INTO `ocenter_follow` VALUES (399, 0, 1744, 1654073058, '', 0);
INSERT INTO `ocenter_follow` VALUES (400, 1744, 0, 1654073058, '', 0);
INSERT INTO `ocenter_follow` VALUES (401, 0, 1745, 1654073074, '', 0);
INSERT INTO `ocenter_follow` VALUES (402, 1745, 0, 1654073074, '', 0);
INSERT INTO `ocenter_follow` VALUES (403, 0, 1746, 1654073085, '', 0);
INSERT INTO `ocenter_follow` VALUES (404, 1746, 0, 1654073085, '', 0);
INSERT INTO `ocenter_follow` VALUES (405, 0, 1747, 1654073098, '', 0);
INSERT INTO `ocenter_follow` VALUES (406, 1747, 0, 1654073098, '', 0);
INSERT INTO `ocenter_follow` VALUES (407, 0, 1748, 1654073135, '', 0);
INSERT INTO `ocenter_follow` VALUES (408, 1748, 0, 1654073135, '', 0);
INSERT INTO `ocenter_follow` VALUES (409, 0, 1749, 1654073159, '', 0);
INSERT INTO `ocenter_follow` VALUES (410, 1749, 0, 1654073159, '', 0);
INSERT INTO `ocenter_follow` VALUES (411, 0, 1750, 1654073175, '', 0);
INSERT INTO `ocenter_follow` VALUES (412, 1750, 0, 1654073175, '', 0);
INSERT INTO `ocenter_follow` VALUES (413, 0, 1751, 1654073207, '', 0);
INSERT INTO `ocenter_follow` VALUES (414, 1751, 0, 1654073207, '', 0);
INSERT INTO `ocenter_follow` VALUES (415, 0, 1752, 1654073208, '', 0);
INSERT INTO `ocenter_follow` VALUES (416, 1752, 0, 1654073208, '', 0);
INSERT INTO `ocenter_follow` VALUES (417, 0, 1753, 1654073235, '', 0);
INSERT INTO `ocenter_follow` VALUES (418, 1753, 0, 1654073235, '', 0);
INSERT INTO `ocenter_follow` VALUES (419, 0, 1754, 1654073247, '', 0);
INSERT INTO `ocenter_follow` VALUES (420, 1754, 0, 1654073247, '', 0);
INSERT INTO `ocenter_follow` VALUES (421, 0, 1755, 1654073266, '', 0);
INSERT INTO `ocenter_follow` VALUES (422, 1755, 0, 1654073266, '', 0);
INSERT INTO `ocenter_follow` VALUES (423, 0, 1756, 1654073278, '', 0);
INSERT INTO `ocenter_follow` VALUES (424, 1756, 0, 1654073278, '', 0);
INSERT INTO `ocenter_follow` VALUES (425, 0, 1757, 1654073354, '', 0);
INSERT INTO `ocenter_follow` VALUES (426, 1757, 0, 1654073354, '', 0);
INSERT INTO `ocenter_follow` VALUES (427, 0, 1758, 1654073514, '', 0);
INSERT INTO `ocenter_follow` VALUES (428, 1758, 0, 1654073514, '', 0);
INSERT INTO `ocenter_follow` VALUES (429, 0, 1759, 1654073554, '', 0);
INSERT INTO `ocenter_follow` VALUES (430, 1759, 0, 1654073554, '', 0);
INSERT INTO `ocenter_follow` VALUES (431, 0, 1760, 1654073620, '', 0);
INSERT INTO `ocenter_follow` VALUES (432, 1760, 0, 1654073620, '', 0);
INSERT INTO `ocenter_follow` VALUES (433, 0, 1761, 1654073649, '', 0);
INSERT INTO `ocenter_follow` VALUES (434, 1761, 0, 1654073649, '', 0);
INSERT INTO `ocenter_follow` VALUES (435, 0, 1762, 1654073676, '', 0);
INSERT INTO `ocenter_follow` VALUES (436, 1762, 0, 1654073676, '', 0);
INSERT INTO `ocenter_follow` VALUES (437, 0, 1763, 1654073708, '', 0);
INSERT INTO `ocenter_follow` VALUES (438, 1763, 0, 1654073708, '', 0);
INSERT INTO `ocenter_follow` VALUES (439, 0, 1764, 1654073756, '', 0);
INSERT INTO `ocenter_follow` VALUES (440, 1764, 0, 1654073756, '', 0);
INSERT INTO `ocenter_follow` VALUES (441, 0, 1765, 1654073823, '', 0);
INSERT INTO `ocenter_follow` VALUES (442, 1765, 0, 1654073823, '', 0);
INSERT INTO `ocenter_follow` VALUES (443, 0, 1766, 1654073889, '', 0);
INSERT INTO `ocenter_follow` VALUES (444, 1766, 0, 1654073889, '', 0);
INSERT INTO `ocenter_follow` VALUES (445, 0, 1767, 1654073932, '', 0);
INSERT INTO `ocenter_follow` VALUES (446, 1767, 0, 1654073932, '', 0);
INSERT INTO `ocenter_follow` VALUES (447, 0, 1768, 1654073971, '', 0);
INSERT INTO `ocenter_follow` VALUES (448, 1768, 0, 1654073971, '', 0);
INSERT INTO `ocenter_follow` VALUES (449, 0, 1769, 1654074036, '', 0);
INSERT INTO `ocenter_follow` VALUES (450, 1769, 0, 1654074036, '', 0);
INSERT INTO `ocenter_follow` VALUES (451, 0, 1770, 1654074122, '', 0);
INSERT INTO `ocenter_follow` VALUES (452, 1770, 0, 1654074122, '', 0);
INSERT INTO `ocenter_follow` VALUES (453, 0, 1771, 1654074161, '', 0);
INSERT INTO `ocenter_follow` VALUES (454, 1771, 0, 1654074161, '', 0);
INSERT INTO `ocenter_follow` VALUES (455, 0, 1772, 1654074330, '', 0);
INSERT INTO `ocenter_follow` VALUES (456, 1772, 0, 1654074330, '', 0);
INSERT INTO `ocenter_follow` VALUES (457, 0, 1773, 1654074368, '', 0);
INSERT INTO `ocenter_follow` VALUES (458, 1773, 0, 1654074368, '', 0);
INSERT INTO `ocenter_follow` VALUES (459, 0, 1774, 1654074540, '', 0);
INSERT INTO `ocenter_follow` VALUES (460, 1774, 0, 1654074540, '', 0);
INSERT INTO `ocenter_follow` VALUES (461, 0, 1775, 1654074574, '', 0);
INSERT INTO `ocenter_follow` VALUES (462, 1775, 0, 1654074574, '', 0);
INSERT INTO `ocenter_follow` VALUES (463, 0, 1776, 1654186804, '', 0);
INSERT INTO `ocenter_follow` VALUES (464, 1776, 0, 1654186804, '', 0);
INSERT INTO `ocenter_follow` VALUES (465, 0, 1777, 1654266879, '', 0);
INSERT INTO `ocenter_follow` VALUES (466, 1777, 0, 1654266879, '', 0);
INSERT INTO `ocenter_follow` VALUES (467, 0, 1778, 1654267582, '', 0);
INSERT INTO `ocenter_follow` VALUES (468, 1778, 0, 1654267582, '', 0);
INSERT INTO `ocenter_follow` VALUES (469, 0, 1779, 1654268429, '', 0);
INSERT INTO `ocenter_follow` VALUES (470, 1779, 0, 1654268429, '', 0);
INSERT INTO `ocenter_follow` VALUES (471, 0, 1780, 1654269386, '', 0);
INSERT INTO `ocenter_follow` VALUES (472, 1780, 0, 1654269386, '', 0);
INSERT INTO `ocenter_follow` VALUES (473, 0, 1781, 1654271385, '', 0);
INSERT INTO `ocenter_follow` VALUES (474, 1781, 0, 1654271385, '', 0);
INSERT INTO `ocenter_follow` VALUES (475, 0, 1782, 1654314745, '', 0);
INSERT INTO `ocenter_follow` VALUES (476, 1782, 0, 1654314745, '', 0);
INSERT INTO `ocenter_follow` VALUES (477, 0, 1783, 1654315376, '', 0);
INSERT INTO `ocenter_follow` VALUES (478, 1783, 0, 1654315376, '', 0);
INSERT INTO `ocenter_follow` VALUES (479, 0, 1784, 1654315395, '', 0);
INSERT INTO `ocenter_follow` VALUES (480, 1784, 0, 1654315395, '', 0);
INSERT INTO `ocenter_follow` VALUES (481, 0, 1785, 1654316348, '', 0);
INSERT INTO `ocenter_follow` VALUES (482, 1785, 0, 1654316348, '', 0);
INSERT INTO `ocenter_follow` VALUES (483, 0, 1786, 1654356669, '', 0);
INSERT INTO `ocenter_follow` VALUES (484, 1786, 0, 1654356669, '', 0);
INSERT INTO `ocenter_follow` VALUES (485, 0, 1787, 1654525632, '', 0);
INSERT INTO `ocenter_follow` VALUES (486, 1787, 0, 1654525632, '', 0);
INSERT INTO `ocenter_follow` VALUES (487, 0, 1788, 1654525654, '', 0);
INSERT INTO `ocenter_follow` VALUES (488, 1788, 0, 1654525654, '', 0);
INSERT INTO `ocenter_follow` VALUES (489, 0, 1789, 1654526326, '', 0);
INSERT INTO `ocenter_follow` VALUES (490, 1789, 0, 1654526326, '', 0);
INSERT INTO `ocenter_follow` VALUES (491, 0, 1790, 1654527207, '', 0);
INSERT INTO `ocenter_follow` VALUES (492, 1790, 0, 1654527207, '', 0);
INSERT INTO `ocenter_follow` VALUES (493, 0, 1791, 1654527224, '', 0);
INSERT INTO `ocenter_follow` VALUES (494, 1791, 0, 1654527224, '', 0);
INSERT INTO `ocenter_follow` VALUES (495, 0, 1792, 1654527247, '', 0);
INSERT INTO `ocenter_follow` VALUES (496, 1792, 0, 1654527247, '', 0);
INSERT INTO `ocenter_follow` VALUES (497, 0, 1793, 1654527945, '', 0);
INSERT INTO `ocenter_follow` VALUES (498, 1793, 0, 1654527945, '', 0);
INSERT INTO `ocenter_follow` VALUES (499, 0, 1794, 1654678415, '', 0);
INSERT INTO `ocenter_follow` VALUES (500, 1794, 0, 1654678415, '', 0);
INSERT INTO `ocenter_follow` VALUES (501, 0, 1795, 1654678607, '', 0);
INSERT INTO `ocenter_follow` VALUES (502, 1795, 0, 1654678607, '', 0);
INSERT INTO `ocenter_follow` VALUES (503, 0, 1796, 1654678627, '', 0);
INSERT INTO `ocenter_follow` VALUES (504, 1796, 0, 1654678627, '', 0);
INSERT INTO `ocenter_follow` VALUES (505, 0, 1797, 1654678642, '', 0);
INSERT INTO `ocenter_follow` VALUES (506, 1797, 0, 1654678642, '', 0);
INSERT INTO `ocenter_follow` VALUES (507, 0, 1798, 1654678870, '', 0);
INSERT INTO `ocenter_follow` VALUES (508, 1798, 0, 1654678870, '', 0);
INSERT INTO `ocenter_follow` VALUES (509, 0, 1799, 1654698844, '', 0);
INSERT INTO `ocenter_follow` VALUES (510, 1799, 0, 1654698844, '', 0);
INSERT INTO `ocenter_follow` VALUES (511, 0, 1800, 1654702301, '', 0);
INSERT INTO `ocenter_follow` VALUES (512, 1800, 0, 1654702301, '', 0);
INSERT INTO `ocenter_follow` VALUES (513, 0, 1801, 1654787279, '', 0);
INSERT INTO `ocenter_follow` VALUES (514, 1801, 0, 1654787279, '', 0);
INSERT INTO `ocenter_follow` VALUES (515, 0, 1802, 1654787586, '', 0);
INSERT INTO `ocenter_follow` VALUES (516, 1802, 0, 1654787586, '', 0);
INSERT INTO `ocenter_follow` VALUES (517, 0, 1803, 1654788230, '', 0);
INSERT INTO `ocenter_follow` VALUES (518, 1803, 0, 1654788230, '', 0);
INSERT INTO `ocenter_follow` VALUES (519, 0, 1804, 1654957276, '', 0);
INSERT INTO `ocenter_follow` VALUES (520, 1804, 0, 1654957276, '', 0);
INSERT INTO `ocenter_follow` VALUES (521, 0, 1805, 1654963410, '', 0);
INSERT INTO `ocenter_follow` VALUES (522, 1805, 0, 1654963410, '', 0);
INSERT INTO `ocenter_follow` VALUES (523, 0, 1806, 1655214223, '', 0);
INSERT INTO `ocenter_follow` VALUES (524, 1806, 0, 1655214223, '', 0);
INSERT INTO `ocenter_follow` VALUES (525, 0, 1807, 1655214242, '', 0);
INSERT INTO `ocenter_follow` VALUES (526, 1807, 0, 1655214242, '', 0);
INSERT INTO `ocenter_follow` VALUES (527, 0, 1808, 1655214292, '', 0);
INSERT INTO `ocenter_follow` VALUES (528, 1808, 0, 1655214292, '', 0);
INSERT INTO `ocenter_follow` VALUES (529, 0, 1809, 1655270233, '', 0);
INSERT INTO `ocenter_follow` VALUES (530, 1809, 0, 1655270233, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_forum
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_forum`;
CREATE TABLE `ocenter_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `post_count` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `allow_user_group` text NOT NULL,
  `sort` int(11) NOT NULL,
  `logo` int(11) NOT NULL,
  `background` int(11) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `admin` varchar(100) NOT NULL,
  `type_id` int(11) NOT NULL,
  `last_reply_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_forum
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_forum` VALUES (1, '默认版块', 1407114174, 121, 1, '1', 0, 133, 123, '浑身发抖活动方式  发的撒健康福简单覆盖给艰苦奋斗是就是的撒伐', '[1],[2]', 1, 1636956241);
INSERT INTO `ocenter_forum` VALUES (2, '官方公告', 1630627500, 2, 1, '1', 0, 10, 11, 'DMAN是一站式区块链DeFi数据聚合、DeFi社交 、DeFi学堂平台。为全球区块链用户、社区、项目官方提供服务。DMAN为你提供优质项目组合、上百万社区流量入口。', '10', 2, 1433468728);
INSERT INTO `ocenter_forum` VALUES (4, 'Dman Community', 1630631074, 0, 1, '', 0, 10, 11, 'DMAN是一站式区块链DeFi数据聚合、DeFi社交 、DeFi学堂平台。为全球区块链用户、社区、项目官方提供服务。DMAN为你提供优质项目组合、上百万社区流量入口。', '12', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_forum_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_forum_bookmark`;
CREATE TABLE `ocenter_forum_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_forum_bookmark
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_forum_follow
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_forum_follow`;
CREATE TABLE `ocenter_forum_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='版块关注';

-- ----------------------------
-- Records of ocenter_forum_follow
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_forum_lzl_reply
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_forum_lzl_reply`;
CREATE TABLE `ocenter_forum_lzl_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `to_f_reply_id` int(11) NOT NULL,
  `to_reply_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `is_del` tinyint(4) NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1-显示 0-禁用 -1-删除 2-待审核',
  `reply_count` int(11) NOT NULL,
  `support_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_forum_lzl_reply
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_forum_lzl_reply` VALUES (85, 8, 0, 0, '山高水远要生生世世设计师', 105, 105, 1628475814, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (86, 8, 0, 0, '山高水远要生生世世设计师', 105, 105, 1628475821, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (87, 8, 0, 0, '然后激动激动呢大男大女的', 105, 105, 1628475894, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (88, 8, 0, 0, '好的蝴蝶结设计', 105, 105, 1628475929, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (89, 8, 0, 0, '事实上事实上', 105, 105, 1628483850, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (90, 8, 0, 0, '收到回宿舍就睡觉觉', 105, 105, 1628483890, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (91, 8, 26, 0, '好喜欢大惊失色简简单单激动激动哈哈', 105, 105, 1628484439, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (92, 8, 26, 0, '分公司护手霜睡觉就在睡觉', 105, 105, 1628484460, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (93, 8, 26, 0, '实话实说睡觉睡觉睡觉', 105, 105, 1628490871, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (94, 8, 26, 0, '花枝招展舍不舍得宝贝', 105, 105, 1628490893, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (95, 8, 25, 0, '是睡觉睡觉睡觉睡觉时', 105, 105, 1628490901, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (96, 8, 25, 0, '电话的护手霜护手霜', 105, 105, 1628490916, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (97, 8, 26, 0, '黄海波 v 风格很纠结', 105, 105, 1628494407, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (98, 8, 26, 0, '也还是当年的激动今生今世', 105, 105, 1629091246, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (99, 8, 31, 0, '仿佛个哈哈哈哈', 105, 105, 1629092661, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (100, 8, 31, 0, '哥哥哥哥 vv', 105, 105, 1629092669, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (101, 8, 31, 0, '染发膏 vv 吧', 105, 105, 1629096154, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (102, 8, 31, 0, '法国环境部哥哥哥哥哥哥', 105, 105, 1629099182, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (103, 8, 31, 0, '而非国有哈哈哈哈哈哈', 105, 105, 1629099273, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (104, 8, 31, 0, '虽然柔风甘雨恍恍惚惚哈哈', 105, 105, 1629099319, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (105, 8, 31, 104, '而非国有一个', 105, 105, 1629099329, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (106, 8, 31, 105, '而非发个哈哈', 105, 105, 1629099338, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (107, 8, 31, 104, '仿佛引吭高歌体验', 105, 105, 1629099346, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (108, 10, 35, 0, '的激动激动激动就睡觉', 105, 105, 1629099404, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (109, 10, 35, 108, '武汉市是实话实说', 105, 105, 1629099421, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (110, 10, 35, 109, '说好的激动睡觉', 105, 105, 1629099434, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (111, 10, 35, 0, '说呵呵呵呵呵呵', 105, 105, 1629101010, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (112, 8, 29, 0, '时尚睡觉睡觉睡觉睡觉', 105, 105, 1629101044, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (113, 8, 29, 112, '还是山山水水', 105, 105, 1629101051, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (114, 11, 38, 0, '的结缔组织', 105, 105, 1629115593, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (115, 11, 38, 0, 'G时尚睡觉就', 105, 105, 1629115606, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (116, 11, 38, 115, '胡叔叔事事件件', 105, 105, 1629115612, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (117, 7, 7, 0, '让仿佛 v 吧', 105, 105, 1629616158, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (118, 27, 49, 0, '天热的负担', 106, 115, 1630731129, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (119, 27, 49, 0, '仿佛奋斗', 106, 115, 1630731137, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (120, 27, 49, 119, '护手霜就是就是', 115, 106, 1630731156, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (121, 27, 49, 0, 'shhsjssjsjsj', 105, 115, 1630825742, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (122, 27, 49, 0, 'yshshsbsb', 105, 115, 1630825780, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (123, 29, 56, 0, '干起来kkkk', 106, 106, 1630829936, 0, 0, 0, 0, 2);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (124, 29, 56, 123, '哈哈哈哈哈哈哈哈哈', 106, 106, 1630831055, 0, 0, 0, 0, 2);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (125, 29, 56, 124, '你好，欢迎关注我', 105, 106, 1630835733, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (126, 37, 65, 0, '这就是传说中的接盘侠', 109, 105, 1631522362, 0, 0, 0, 0, 1);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (127, 37, 65, 126, '没热度', 109, 109, 1631522665, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (128, 41, 68, 0, '不是两口子，但愿成为两口子，哈哈', 119, 114, 1631929539, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (129, 71, 79, 0, '0xcBc26652d6A0210e29ed1B6d6FBe552ddCbfa8A0', 540, 612, 1634315157, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (130, 78, 84, 0, '加VX：pinbi8gui', 973, 1101, 1635083319, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (131, 78, 84, 0, 'https://shatuvip.com/pages/login/register?recom_code=4610034', 973, 1101, 1635083371, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (132, 78, 84, 0, '下载地址，VX打开', 973, 1101, 1635083399, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (133, 78, 84, 130, '加不了', 1101, 973, 1635110304, 0, 0, 0, 0, 0);
INSERT INTO `ocenter_forum_lzl_reply` VALUES (134, 78, 84, 133, 'pinbo8gui  加这个', 973, 1101, 1635142511, 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_forum_pay
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_forum_pay`;
CREATE TABLE `ocenter_forum_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `forum_post_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_forum_pay
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_forum_post
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_forum_post`;
CREATE TABLE `ocenter_forum_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `parse` int(11) NOT NULL,
  `image_list` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `last_reply_time` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `is_top` tinyint(4) NOT NULL COMMENT '是否置顶',
  `is_essence` int(1) NOT NULL DEFAULT '0',
  `hide` text NOT NULL COMMENT '是否回复可见',
  `file_id` int(11) NOT NULL DEFAULT '0',
  `pay_type` text NOT NULL COMMENT '付费类型',
  `pay_num` int(11) NOT NULL COMMENT '付费数量',
  `pay_on` text NOT NULL COMMENT '是否开启付费下载',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_forum_post
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_forum_post` VALUES (1, 105, 1, '状态类型帖子', 0, '', 'ttrrrfffrfffff\nsjshsjdndnsjsjs', 1627751934, 1627751934, -1, 1627751934, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (2, 105, 1, '状态类型帖子', 0, '', '姐姐哈哈哈哈哈哈哈哈哈哈哈哈', 1627895865, 1627895865, -1, 1629101069, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (3, 105, 1, '状态类型帖子', 0, '', '姐姐哈哈哈哈哈哈哈哈哈哈哈哈hggghh', 1627896003, 1627896003, -1, 1627896003, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (4, 105, 1, '状态类型帖子', 0, '', '给沟沟壑壑哥哥哥哥哈哈哈哈哈哈', 1627896096, 1627896096, -1, 1627896096, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (5, 105, 1, '状态类型帖子', 0, '', '给沟沟壑壑哥哥哥哥哈哈哈哈哈哈', 1627896265, 1627896265, -1, 1627896265, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (6, 105, 1, '状态类型帖子', 0, '', '点点滴滴的回忆', 1627897654, 1627897654, -1, 1627897654, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (11, 105, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-08-02/6107c2f53d349.JPG\",\"/Uploads/Download/2021-08-16/611a547258a88.JPG\",\"/Uploads/Download/2021-08-16/611a54754e9f6.JPG\",\"/Uploads/Download/2021-08-16/611a5478121c6.JPG\",\"/Uploads/Download/2021-08-16/611a5481abe2e.JPG\"]', '就睡觉睡觉睡觉时', 1629115528, 1629115528, -1, 1629115920, 0, 5, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (12, 109, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-02/6130be85809ff.jpg\",\"/Uploads/Download/2021-09-02/6130be85c56ab.jpeg\",\"/Uploads/Download/2021-09-02/6130be8620d12.png\",\"/Uploads/Download/2021-09-02/6130be8678cae.jpeg\",\"/Uploads/Download/2021-09-02/6130be86c47b4.png\"]', '玩转DeFi', 1630584456, 1630584456, -1, 1630594602, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (7, 105, 1, '状态类型帖子', 0, '', '哈哈官方丰富的反反复复', 1627898095, 1627898095, -1, 1629616158, 0, 4, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (8, 105, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-08-02/6107c2f53d349.JPG\"]', 'vvcccxfddssdddddddddrdd？', 1627898613, 1627898613, -1, 1629616109, 0, 51, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (9, 109, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-08-10/61121000270b1.jpg\"]', 'DmanSwap\n去中心化应用', 1628573744, 1628573744, -1, 1629620231, 0, 2, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (10, 109, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-08-10/611210bd43e9d.jpg\"]', 'DmanSwap', 1628573965, 1628573965, -1, 1629620220, 0, 7, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (13, 111, 1, '状态类型帖子', 0, '[]', '美美的呀，o(∩_∩)o', 1630584520, 1630584520, -1, 1630594651, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (14, 105, 1, '状态类型帖子', 0, '[]', '一段时间睡觉时', 1630648932, 1630648932, 1, 1630648932, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (15, 105, 1, '状态类型帖子', 0, '[]', '和s聚众闹事开始看', 1630648946, 1630648946, 1, 1630648946, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (16, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-03/6131effb0fa4b.png\"]', '大黄牙，咦咦咦咦', 1630662677, 1630662677, 1, 1630663477, 0, 2, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (17, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-03/6131f0a662c34.png\",\"/Uploads/Download/2021-09-03/6131f0a6a8fab.png\"]', 'DM密码赛道', 1630662851, 1630662851, 1, 1630662851, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (18, 109, 1, '状态类型帖子', 0, '[]', 'ASTRO DOGGY\nWWW.ASTRODOGGY.IO\n\nAstro Doggy is the first cartoon series to use governance through blockchain, the concept aims to forever help pave the way series/episodes are created, giving the viewe', 1630666842, 1630666842, 1, 1630666842, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (19, 113, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-03/613200300ca28.jpg\"]', '今天制作了一张NFT,传上去系统自动识别价格300万。等待成交吧', 1630667014, 1630667014, 1, 1630667014, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (20, 109, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-03/6132012d60b24.jpg\",\"/Uploads/Download/2021-09-03/6132012da433f.jpg\"]', '以太坊从小时图来看，布林带缩口，行情位于中轨附近运行，MACD红色量柱放量，KDJ和RSI均开口向下，四小时线来看，布林带张口，行情冲击上轨失利回踩，MACD绿色量柱缩量，KDJ和RSI拐头向下，短期来看行情有回踩下方支撑的需求,跌破中轨将会向下轨3185附近运行，日线方面，布林带平缓运行，MACD红色量柱缩量,KDJ拐头向上\n\n操作建议：3940-3950 区间多单 目标：3980-4000', 1630667054, 1630667054, 1, 1630667054, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (21, 112, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-03/613202e41ff2e.jpg\"]', '现在技术图形已经不好使了[doge]就是涨，就看谁胆子大了，预估是跟五月初那波行情一样，里面其实并没有多少散户参与，全是主力在里面，为什么这么多人看空了依旧跌不下来，那就是里面追多的资金量没有达到某些人的预期，当一个品种被高度控盘的时候，那继续拉升并不用消耗太多资金，所以，有胆识有谋略的人会吃到大肉，普通投资者该干嘛干嘛吧[挖鼻]你把握不住[馋嘴][馋嘴]\n是不是还会继续拉升？我预估是会的！\n能拉', 1630667493, 1630667493, 1, 1630667493, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (22, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-03/613204b4e9cb3.jpg\"]', '让我们一起在DM密码赛道探索秘境', 1630668020, 1630668020, -1, 1630668020, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (23, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-03/61320fe904621.jpg\"]', '探索dm解密赛道', 1630670888, 1630670888, -1, 1630670888, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (24, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-03/613214647834b.jpg\"]', '让我们一起来探索DM', 1630672010, 1630672010, -1, 1630672010, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (25, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-03/613220eb0195d.jpg\"]', '让我们一起去探索DM的未来世界吧！', 1630675213, 1630675213, 1, 1630675213, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (26, 120, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-04/6132cf48e7ffe.jpg\"]', '\nGameFi是全栈区块链游戏生态工具。一方面Gamefi是目前顶级的区块链游戏代币、IGO孵化平台，合作游戏包括Kaby Arena、Snook、。\nhttps://gamefi.org/', 1630719819, 1630719819, 1, 1630719819, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (27, 106, 1, '状态类型帖子', 0, '[]', '妈妈妈妈妈妈呢', 1630730964, 1630730964, 1, 1630826501, 0, 13, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (28, 120, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-04/613314aedb593.png\",\"/Uploads/Download/2021-09-04/613314af34f71.jpg\",\"/Uploads/Download/2021-09-02/6130be8620d12.png\"]', '高价竞拍，$8500一张', 1630737631, 1630737631, 1, 1632257778, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (29, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-05/61341bfdc3ecb.jpg\"]', '等待就最好的战略', 1630805025, 1630805025, 1, 1630835733, 0, 6, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (30, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-06/61356714667b9.jpg\"]', '薅个羊毛，过期羊毛', 1630889775, 1630889775, 1, 1630889863, 0, 2, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (31, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-06/6135f0dc7f544.png\"]', 'https://www.ouyi.run/join/2413760?src=from:android-share', 1630925024, 1630925024, 1, 1630925024, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (32, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-03/613214647834b.jpg\",\"/Uploads/Download/2021-09-03/613232c60c046.jpg\"]', '探索DM、DEFI社交秘境再现至宝', 1631060742, 1631060742, 1, 1631060742, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (33, 109, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-09/613954d2c94e8.jpg\",\"/Uploads/Download/2021-09-09/613954d31b9ab.png\"]', 'Loot，NFT板块的又一全新演绎\n.  Loot代表的不是封闭的体系，而是足够开放、鼓励开放的生态。它是非常棒的游戏新范式，跟以前的链游完全不同，它在未来影响的不仅仅是游戏，还会影响整个社会的组织形式。\n\n\n\n2.  加密行业已经进入深水区，DeFi完成了第一步，目前NFT可以勇敢地说已经开启第二波加密革命。Uniswap的出现让DeFi进入爆炸式增长，Loot的出现代表NFT进入爆炸式增长。\n', 1631147231, 1631147231, 1, 1631147231, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (34, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-09/6139afc8a0eec.jpg\"]', 'DEFI社交DM', 1631170601, 1631170601, 1, 1631348517, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (35, 105, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-10/613af6eca67d8.PNG\"]', 'cardano的launchpad可以关注下', 1631254253, 1631254253, 1, 1631512977, 0, 2, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (36, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-11/613c667d0fe3a.jpg\",\"/Uploads/Download/2021-09-11/613c667e62101.jpg\"]', '为DEFI打造的DM去探索秘境交错', 1631348435, 1631348435, 1, 1631348530, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (37, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-13/613eefd7c7ee4.jpg\"]', '心塞，，，', 1631514605, 1631514605, 1, 1631522665, 0, 3, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (38, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-11/613c667d0fe3a.jpg\"]', 'DM为所有DEFI玩家提供更好更方便的工具，让DEFI玩家都用上DM\n', 1631709879, 1631709879, 1, 1632257617, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (39, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-17/6143c62201b91.jpg\",\"/Uploads/Download/2021-09-17/6143c623a227a.jpg\",\"/Uploads/Download/2021-09-17/6143c625a7f1f.jpg\",\"/Uploads/Download/2021-09-17/6143c627b66a9.jpg\",\"/Uploads/Download/2021-09-17/6143c629b2595.jpg\",\"/Uploads/Download/2021-09-17/6143c62b4eda9.jpg\"]', '让我们一起来读懂DM，他为什么能给币圈市场提供以下服务和帮助。读懂DM才知道我们的方向赛道去向何方。', 1631831887, 1631831887, 1, 1634606531, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (40, 109, 1, '状态类型帖子', 0, '[]', 'Avalanche雪崩协议获得以Polychain和Three Arrows Capital为首的投资机构的2.3亿美元投资，参投机构还包括R/Crypto Fund、Dragonfly、CMS Holdings、Collab+Currency、Lvna Capital及其他天使投资人和家族财富管理办公室。', 1631839914, 1631839914, 1, 1632257591, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (41, 119, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-17/614467a32b32b.jpg\"]', '原木吉他弹奏不出深爱\n阵阵秋风可否带去思慕\n彩虹桥上遥望你的背影\n灰暗世界开出繁花似锦\n\n追逐仰望   \n\n心晴有你', 1631873055, 1631873055, 1, 1632257579, 0, 5, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (42, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-17/6144739019ac7.png\"]', '赶紧注册下载吧', 1631875994, 1631875994, 1, 1631875994, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (43, 247, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-17/614474e4183af.jpg\"]', '酒这东西，就像美女，偶尔尝尝，还是不错的！', 1631876383, 1631876383, 1, 1631876383, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (44, 109, 1, '状态类型帖子', 0, '[]', 'SOLANA链做白名单网址..生态项目https://www.solanium.io/project/matrix-etf/', 1631891006, 1631891006, 1, 1631891006, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (45, 109, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-17/6144ae3742b11.png\",\"/Uploads/Download/2021-09-17/6144ae403126b.png\"]', 'SOLANA链做白名单网址..生态项目https://www.solanium.io/project/matrix-etf/', 1631891042, 1631891042, 1, 1631891042, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (46, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-18/61452db0aa720.jpg\",\"/Uploads/Download/2021-09-18/61452db61ade6.jpg\"]', '成功人踩着什么石头过来你永远不知道', 1631923728, 1631923728, 1, 1631923728, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (47, 114, 1, '状态类型帖子', 0, '[]', '\n關於DEFi：\n①DeFi是未來5－10年，潛力無窮的一條超級賽道！\n②因爲defi去中心化金融，用智能合約把中間人徹底取代，所有資產都在鏈上，而非託管。資產安全有保障。您可以完全掌控自己的每一分資產。\n③在不出售您資產的情況下，通過添加到分佈式流動池，獲得交易手續費、量化收益、幣價升值增漲倍數收益、而且還可以質押挖礦……\n④DeFi去中心化金融 是萬億級的剛需市場，目前用戶滲透率僅爲1%不到，', 1632159530, 1632159530, 1, 1632159530, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (48, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-21/6148c72a2f9e6.png\"]', '\n關於DEFi：\n①DeFi是未來5－10年，潛力無窮的一條超級賽道！\n②因爲defi去中心化金融，用智能合約把中間人徹底取代，所有資產都在鏈上，而非託管。資產安全有保障。您可以完全掌控自己的每一分資產。\n③在不出售您資產的情況下，通過添加到分佈式流動池，獲得交易手續費、量化收益、幣價升值增漲倍數收益、而且還可以質押挖礦……\n④DeFi去中心化金融 是萬億級的剛需市場，目前用戶滲透率僅爲1%不到', 1632159606, 1632159606, 1, 1632159606, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (49, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-23/614c7fe6a356f.jpg\"]', '进入DM每一个功能都可以了解DM他的用途', 1632403508, 1632403508, -1, 1632403508, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (50, 452, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-24/614d5257bac64.jpeg\",\"/Uploads/Download/2021-09-24/614d525aa1225.jpeg\",\"/Uploads/Download/2021-09-24/614d525db5a54.jpeg\"]', '健康生态链实体矿机落地，人人可以上岸', 1632457311, 1632457311, 1, 1632457311, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (51, 452, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-24/614d5257bac64.jpeg\"]', 'HEC健康生态链：于后疫情时代开启全民健康生态\n\n头像\n金色财经2021-04-22 20:50:11\n在全球疫情的持续影响下，整个健康产业生态正面临着前所未有的挑战：于供给端，产业链和供应链的中断与重启，给企业带来了直接损失和重启成本；于需求端，疫情使用户需求发生改变，旧常态或将不复存在，新型产业升级或成为当下产业变革的核心方向。\n\n676b58cc586f46c8b0319ab406f6151', 1632457427, 1632457427, 1, 1632457427, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (52, 163, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-24/614d54ca0cdd3.jpg\"]', '免费撸200个币 价格随时上涨！', 1632458000, 1632458000, 1, 1632458000, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (53, 163, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-24/614d54ca0cdd3.jpg\"]', '免费撸200个币 价格随时上涨！.', 1632458001, 1632458001, 1, 1632458001, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (54, 163, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-24/614d54ca0cdd3.jpg\"]', '免费零撸撸币200枚，币价随时上涨。\n\n请采用邮箱号注册即可！', 1632458612, 1632458612, 1, 1632458612, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (55, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-24/614d90933d4ff.jpg\",\"/Uploads/Download/2021-09-24/614d9096546d1.jpg\"]', '让我们一起去探索DM秘境吧！他为什么能够给到DEFI玩家解决问题和提供服务呢？DM做的就是给DEFI和币圈的一个服务和赋能的我。', 1632473553, 1632473553, 1, 1632473553, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (56, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-25/614e99cea7045.jpg\"]', '美丽心情..', 1632541144, 1632541144, 1, 1632541144, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (57, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-25/614f066b00674.jpg\",\"/Uploads/Download/2021-09-25/614f066dc8f64.jpg\"]', 'DM密码赛道探索', 1632569020, 1632569020, 1, 1632569020, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (58, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-26/614f9b653dab1.jpg\",\"/Uploads/Download/2021-09-26/614f9b75d701b.jpg\"]', 'DMAN官方DeFi社区生态\n创建共同体    发展新未来', 1632607217, 1632607217, 1, 1632607217, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (59, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-27/61514d87ca93d.jpg\"]', 'DMAN专注DeFi社区，及周边服务。这里汇集世界各地的DeFi玩家，有一手DeFi资讯，并支持ETH、BSC、FTM等主流链行情。. \n官网\nhttps://www.dman.app/\n\n下载\nHttps://download.dman.app\n\n注册推广邀请码0962024\nhttps://reg.dman.app/\n#/\n推特：\nhttps://twitter.com/DmanswapDao', 1632718252, 1632718252, 1, 1632718252, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (60, 149, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-27/61516b4d63cb4.jpg\",\"/Uploads/Download/2021-09-27/61516b500c2be.jpg\",\"/Uploads/Download/2021-09-27/61516b51ee736.jpg\",\"/Uploads/Download/2021-09-27/61516b5451a15.jpg\",\"/Uploads/Download/2021-09-27/61516b56691ec.jpg\",\"/Uploads/Download/2021-09-27/61516b58bf57b.jpg\",\"/Uploads/Download/2021-09-27/61516b5be9b45.jpg\",\"/Uploads/Download/2021-09-27/61516b5e53812.jpg\",\"/Uploads/Download/2021-09-27/61516b6779581.jpg\"]', '好消息！好消息！还有几天即将迎来祖国母亲72岁生日。为了庆祝祖国母亲生日，在此国庆佳节。公司拿出“魅力播州”两款主打酒“2021”和“大唐”回馈新老客户，一次性购买50箱送20箱（注：6瓶／箱，500ml／瓶，可以拼单购买，5箱整数起拼，只要在活动时间内拼单50箱成功即可享受买5箱送2箱），此次活动从2021年9月26日即日起开始生效，截止日期2021年10月7日。', 1632725869, 1632725869, 1, 1632727642, 0, 4, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (61, 149, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-27/61516b4d63cb4.jpg\",\"/Uploads/Download/2021-09-27/61516b500c2be.jpg\",\"/Uploads/Download/2021-09-27/61516b51ee736.jpg\",\"/Uploads/Download/2021-09-27/61516b5451a15.jpg\",\"/Uploads/Download/2021-09-27/61516b56691ec.jpg\",\"/Uploads/Download/2021-09-27/61516b58bf57b.jpg\",\"/Uploads/Download/2021-09-27/61516b5be9b45.jpg\",\"/Uploads/Download/2021-09-27/61516b5e53812.jpg\",\"/Uploads/Download/2021-09-27/61516b6779581.jpg\"]', '好消息！好消息！[庆祝][庆祝][庆祝]还有几天即将迎来祖国母亲72岁生日。为了庆祝祖国母亲生日，在此国庆佳节。公司拿出“魅力播州”两款主打酒“2021”和“大唐”回馈新老客户，一次性购买50箱送20箱（注：6瓶／箱，500ml／瓶，可以拼单购买，5箱整数起拼，只要在活动时间内拼单50箱成功即可享受买5箱送2箱），此次活动从2021年9月26日即日起开始生效，截止日期2021年10月7日。', 1632726337, 1632726337, 1, 1632726337, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (62, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-27/6151d7914f86b.jpg\",\"/Uploads/Download/2021-09-27/6151d7995ce71.jpg\"]', 'DM走的路线是长线，也互活国际路线。', 1632753628, 1632753628, 1, 1632907356, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (63, 113, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-09-29/61542fb19e401.jpg\",\"/Uploads/Download/2021-09-29/61542fcdc8e0c.jpg\"]', '发现一个很酷的项目：Lobby Wiki\n你可以把它理解为Web3.0 的维基百科，现在是原型版本，就像十多年前QQ刚发布那样原始，但是这种事物天生就有颠覆所有的能力，因为它的目标是建立一个链上的知识库，最重要的是在2021年11月之前贡献词条或者编辑，可以获得私享空投，这个是网站明文写着的，是一个确定性机会。\n\n小编试了一下，找出了编写的技巧，其实很简单，想博取空投的同学请跟着来：\n', 1632907218, 1632907218, 1, 1632907218, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (64, 109, 1, '状态类型帖子', 0, '[]', 'https://gleam.io/C8YyN-uz3jZbo0BP\n鸭子链游，白漂', 1632925969, 1632925969, 1, 1632925969, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (65, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-01/6156699df0e77.jpg\"]', 'DM社区生态打造赋能提供所有为DeFi玩家服务的一款好产品', 1633053172, 1633053172, 1, 1633053172, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (66, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-01/6157056758eeb.jpg\",\"/Uploads/Download/2021-10-01/61570569b978f.png\"]', '邮箱注册DM验证成功送200DM，分享注册验证成功各得200DM，双赢收入', 1633093094, 1633093094, 1, 1633093094, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (67, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-04/615b0ef1625ed.jpg\",\"/Uploads/Download/2021-10-04/615b0ef921900.jpg\"]', '用心去探索DM，去感受它的未来。做好一个有价值的DMAN社区生态。', 1633357658, 1633357658, 1, 1633357658, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (68, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-06/615d28bcd3e77.jpg\"]', '', 1633495238, 1633495238, 1, 1633496017, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (69, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-06/615d28bcd3e77.jpg\"]', '', 1633495988, 1633495988, 1, 1633495988, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (70, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-07/615ea4deecf8b.jpg\",\"/Uploads/Download/2021-10-07/615ea4eac712d.jpg\"]', '敢于投资的人才能使自己变得更加强大', 1633592689, 1633592689, 1, 1633592689, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (71, 612, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-10/616286996b775.jpg\",\"/Uploads/Download/2021-10-10/6162869b8fda0.jpg\",\"/Uploads/Download/2021-10-10/6162869e242d1.jpg\",\"/Uploads/Download/2021-10-10/6162869fc87e9.jpg\"]', '时间社区持续打造万倍币，年底一美金，一同共商大计，火币生态链合约地址：0x2F462fe879B699897b2ef3c870bFEB24eD7Ba492（MDEX划点6兑换就可以了）', 1633847035, 1633847035, 1, 1634315157, 0, 3, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (72, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-12/6165a0cda348e.jpg\"]', '定位，锁定目标DM', 1634050296, 1634050296, 1, 1634050296, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (73, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-14/61684392cf8dc.jpg\"]', '吃一波，美美的。。。早餐有了。', 1634223019, 1634223019, 1, 1634223019, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (74, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-17/616c1653a437a.jpg\"]', '大圣来了，踏平币圈。。。', 1634473570, 1634473570, 1, 1634473570, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (75, 109, 1, '状态类型帖子', 0, '[]', 'DMAN赋予DEFI社区强大共识和决策，实现DMAN生态共同治理和繁荣发展，限额招募DAO社区领袖。\n\n1、招募名额：20名，\n\n2、参与方式：Telegram或Btok搜索DmanSwap自主报名获得参与资格,要求组建300人社区电报群或其他社交群，统一社区名（DMAN生态）并完成领取空投任务。\n\n3、获得DAO成员资格者将分配社区运营3%加权分红，DM代币上线交易时将公开社区运营分配地址。', 1634488134, 1634488134, 1, 1634488134, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (76, 109, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-18/616c4f1160b67.png\",\"/Uploads/Download/2021-10-18/616c4f0fd656d.png\"]', 'DMAN赋予DEFI社区强大共识和决策，实现DMAN生态共同治理和繁荣发展，限额招募DAO社区领袖。\n\n1、招募名额：20名，\n\n2、参与方式：Telegram或Btok搜索DmanSwap自主报名获得参与资格,要求组建300人社区电报群或其他社交群，统一社区名（DMAN生态）并完成领取空投任务。\n\n3、获得DAO成员资格者将分配社区运营3%加权分红，DM代币上线交易时将公开社区运营分配地址。', 1634488184, 1634488184, 1, 1634488184, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (77, 973, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-19/616ee9f4894ab.jpg\"]', '　　商拓app是一款不投资不推广看看广告赚钱的应用，商拓软件上每天只要花两分钟就能日赚百元，操作简单，商拓app里没有复杂的玩法。\n\n软件介绍\n\n　　商拓app震撼上线，免费注册，0撸玩家的福音，发布广告人员的最爱。\n\n　　在商拓软件上可以免费发布广告＋努力值永久分红十拓豆交易，在商拓app里每天签到打卡得拓豆和努力点，在任务列表中查看每日任务完成情况。每天做任务，商拓软件不投资不推广必得分红。', 1634658807, 1634658807, 1, 1634658807, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (78, 973, 1, '状态类型帖子', 0, '[]', '　　商拓app是一款不投资不推广看看广告赚钱的应用，商拓软件上每天只要花两分钟就能日赚百元，操作简单，商拓app里没有复杂的玩法。\n\n软件介绍\n\n　　商拓app震撼上线，免费注册，0撸玩家的福音，发布广告人员的最爱。\n\n　　在商拓软件上可以免费发布广告＋努力值永久分红十拓豆交易，在商拓app里每天签到打卡得拓豆和努力点，在任务列表中查看每日任务完成情况。每天做任务，商拓软件不投资不推广必得分红。', 1634658906, 1634658906, 1, 1635142511, 0, 6, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (79, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-20/616f86d5268a3.jpg\",\"/Uploads/Download/2021-10-20/616f86d80733d.jpg\"]', 'DEFI社交的天下，DM社区生态系统的到来，改变了我们所有玩家的需求。', 1634699081, 1634699081, 1, 1634699146, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (80, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-21/6171247233418.jpg\"]', '波场链开通咯，方便', 1634804860, 1634804860, 1, 1634804860, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (81, 957, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-21/61712fdba618d.jpg\"]', '你好，明天！', 1634807822, 1634807822, 1, 1634974949, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (82, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-23/6173cad506129.jpg\"]', '定位好未来三年', 1634978546, 1634978546, 1, 1635697989, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (83, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-24/61757b49aeda2.jpg\"]', '惊艳了吧，DM对标的就是他，强大的社区共识。', 1635089291, 1635089291, 1, 1635089291, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (84, 1252, 1, '状态类型帖子', 0, '[]', '大家好，新人，请多关照', 1635175475, 1635175475, 1, 1635181195, 0, 3, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (85, 1197, 1, '状态类型帖子', 0, '[]', 'DYDY空投，DYDY是DYDX的分叉币，项目方很努力也很可靠，上线币价100U左右。填写币安链BSC钱包地址即可参与本次空投活动。参与即可获得1枚 DYDY代币，每邀请一位好友增加1枚DYDY奖励。最多可邀请 20 人，奖励最高可达21枚DYDY。上线预计可达100U一枚。\n空投链接:\nhttps://dydy.io/?dydy=1F954\n币安链合约:\n0x17f4f643146C017dEf', 1635181111, 1635181111, 1, 1635181170, 0, 4, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (86, 1101, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-26/617717c846d72.jpg\"]', '人人皆可eNFT\n', 1635194831, 1635194831, 1, 1635194831, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (87, 1101, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-26/617717c846d72.jpg\"]', '人人皆可NFT', 1635194903, 1635194903, 1, 1635194903, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (88, 1254, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-26/61772215d4770.png\",\"/Uploads/Download/2021-10-26/6177221a324d3.jpg\",\"/Uploads/Download/2021-10-26/6177221d69277.jpg\",\"/Uploads/Download/2021-10-26/6177222b7ae47.jpg\"]', '1：0投资，0风险，1元起提现，提现一分钟左右到账\n2：无需下载，好推广\n3：扫码即锁粉，容易\n4：刚需行业，一日四餐少不了\n5：自用省钱 \n6：分享提成，团队无限代收益\n7：美团饿了么强大背景让你无忧\n8：不限上班时间，不限地点，随时分享，全职都可以\n9：一次投入终身回报，美团饿了么不倒，我们收益到老[耶][耶]', 1635197586, 1635197586, 1, 1635197586, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (89, 1254, 1, '状态类型帖子', 0, '[]', '推荐一个', 1635197864, 1635197864, 1, 1635197864, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (90, 1254, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-26/617723a8092c6.jpg\"]', '推荐一个', 1635197915, 1635197915, 1, 1635197915, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (91, 1101, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-27/61785a4d4178a.jpg\",\"/Uploads/Download/2021-10-27/61785a516ea69.jpg\",\"/Uploads/Download/2021-10-27/61785a5394704.jpg\",\"/Uploads/Download/2021-10-27/61785a55a8c70.jpg\"]', 'eNFT全网首码\n', 1635277401, 1635277401, 1, 1635277401, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (92, 1101, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-27/61785a4f28bd4.jpg\",\"/Uploads/Download/2021-10-27/61785a516ea69.jpg\",\"/Uploads/Download/2021-10-27/61785a5394704.jpg\",\"/Uploads/Download/2021-10-27/61785a55a8c70.jpg\"]', 'eNFT全球首码\n', 1635277566, 1635277566, 1, 1635277566, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (93, 1101, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-27/61785a4f28bd4.jpg\"]', 'eNFT全球首码\n人人暂可NF', 1635278040, 1635278040, 1, 1635278040, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (94, 1101, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-27/61786b997c4c6.jpg\",\"/Uploads/Download/2021-10-27/61786b9b176cb.jpg\",\"/Uploads/Download/2021-10-27/61786b9c67a8a.jpg\"]', 'eNFT首', 1635281848, 1635281848, 1, 1635281848, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (95, 1110, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-27/6178dcff9efbc.jpg\"]', '. 快来注册吧', 1635310871, 1635310871, 1, 1635310871, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (96, 1296, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-27/6178e9ed5f789.jpg\"]', '下载抢红包App，每天抢红包', 1635314159, 1635314159, 1, 1635314159, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (97, 874, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-28/617abd854ace5.jpg\"]', 'Free自由币，扫描注册绑好银行卡及地址送20万竞拍本金，每天几千元可挣几百现金流，今天拍明天本金利润就回来，现在内测期11月11正式上线，每天竞拍三次利润6％，三次18％，两部手机36％，可运行一到两年，币已合约开源在去中心化交易所！', 1635434177, 1635434177, 1, 1635434177, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (98, 874, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-28/617abd854ace5.jpg\"]', 'Free自由币，扫描注册绑好银行卡及地址送20万竞拍本金，每天几千元可挣几百现金流，今天拍明天本金利润就回来，现在内测期11月11正式上线，每天竞拍三次利润6％，三次18％，两部手机36％，可运行一到两年，币已合约开源在去中心化交易所！', 1635434179, 1635434179, 1, 1635499560, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (99, 874, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-28/617abd854ace5.jpg\",\"/Uploads/Download/2021-10-28/617abf4fa80bb.jpg\",\"/Uploads/Download/2021-10-28/617abf52ae64f.jpg\"]', '挣钱又有趣味性！', 1635434339, 1635434339, 1, 1635434339, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (100, 1296, 1, '状态类型帖子', 0, '[]', '首码', 1635499471, 1635499471, 1, 1635499471, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (101, 1296, 1, '状态类型帖子', 0, '[]', '首码', 1635499629, 1635499629, 1, 1635499629, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (102, 1457, 1, '状态类型帖子', 0, '[]', '第一天来此，希望和各位多交流学习', 1635682457, 1635682457, 1, 1635682457, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (103, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-10-31/617e92b8db5e2.png\",\"/Uploads/Download/2021-10-31/617e92bae8d97.jpg\"]', 'DM社交金融，就是下一个奇迹', 1635685087, 1635685087, 1, 1635697935, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (104, 1432, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-01/617efaa3bf946.jpg\"]', '在币乎，随时都可以看到币圈大佬们对币市的各种预测以及最新动向', 1635711767, 1635711767, 1, 1635711767, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (105, 1432, 1, '状态类型帖子', 0, '[]', '谁能拉我进机器猫链游群', 1635712257, 1635712257, 1, 1635712257, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (106, 874, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-01/617fa2e374721.png\",\"/Uploads/Download/2021-11-01/617fa2e610f1e.jpg\",\"/Uploads/Download/2021-11-01/617fa2e8f37ec.jpg\",\"/Uploads/Download/2021-11-01/617fa2ebdf816.jpg\"]', '趣链巨头送币，不用注册就送10万，小程序上链，有哈稀有密钥，有区块高度，邀请码在第一张图的左上角。', 1635754777, 1635754777, 1, 1635754777, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (107, 874, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-01/617fa2e374721.png\",\"/Uploads/Download/2021-11-01/617fa2e610f1e.jpg\",\"/Uploads/Download/2021-11-01/617fa2e8f37ec.jpg\",\"/Uploads/Download/2021-11-01/617fa2ebdf816.jpg\"]', '趣链巨头送币，不用注册就送10万，小程序上链，有哈稀有密钥，有区块高度，邀请码在第一张图的左上角。', 1635754779, 1635754779, 1, 1635754779, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (108, 973, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-01/617ff8fe7b256.png\",\"/Uploads/Download/2021-11-01/617ff9006381d.jpeg\"]', '商拓\n不投资不实名\n拼团板块＋人人分红\n日入1.5-1000元轻轻松松\n每天一分钟，想赚多少取决于你。\n0.5元起就能提现，天天都有钱到账支付宝', 1635776769, 1635776769, 1, 1635776887, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (109, 973, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-01/617ff9006381d.jpeg\"]', '商拓\n不投资不实名\n拼团板块＋人人分红\n日入1.5-1000元轻轻松松\n每天一分钟，想赚多少取决于你。\n0.5元起就能提现，天天都有钱到账支付宝（微信扫码下载注册）', 1635776931, 1635776931, 1, 1635776931, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (110, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-03/618234255120f.png\",\"/Uploads/Download/2021-10-31/617e92b8db5e2.png\"]', 'DM火爆预售中', 1635923014, 1635923014, 1, 1635923014, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (111, 1516, 1, '状态类型帖子', 0, '[]', '新人多关照', 1635927398, 1635927398, 1, 1635927398, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (112, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-03/61829e44f0301.jpg\"]', 'DM私募已经开始，赶紧抢份额，成为DM分红股东', 1635950183, 1635950183, 1, 1635950183, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (113, 500, 1, '状态类型帖子', 0, '[]', '这平台链个客服都没有，遇到问题都不知道找谁，唉', 1635997195, 1635997195, 1, 1635997195, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (114, 304, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-04/61838b71ea74e.jpg\",\"/Uploads/Download/2021-11-04/61838b748fb02.jpg\",\"/Uploads/Download/2021-11-04/61838b768f264.jpg\"]', '你来私募就是老板', 1636010905, 1636010905, 1, 1636010905, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (115, 304, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-04/61838b71ea74e.jpg\",\"/Uploads/Download/2021-11-04/61838b748fb02.jpg\",\"/Uploads/Download/2021-11-04/61838b768f264.jpg\"]', '你来私募就是老板', 1636010906, 1636010906, 1, 1636010906, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (116, 111, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-05/61848ae1c8571.jpg\"]', '上涨不停，赶紧参与抢购了', 1636076279, 1636076279, 1, 1636076279, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (117, 1528, 1, '状态类型帖子', 0, '[]', 'JST可以免费挖，不质押，不锁仓，币价0.52左右一枚，每天疯狂挖上万枚，随时可以交易提现，想玩的币友抓紧时间上车，详情加V:   donghuan2009', 1636102926, 1636102926, 1, 1636956241, 0, 1, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (118, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-06/6186a35dc26e3.jpg\"]', 'DM靠的实力打下来的。绝不是靠吹(干)', 1636213750, 1636213750, 1, 1636213750, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (119, 114, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-11/618c89962df02.jpg\",\"/Uploads/Download/2021-10-31/617e92bae8d97.jpg\"]', 'DM认购期倒计时。你把握好好了吗？', 1636600378, 1636600378, 1, 1636600378, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (120, 874, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-15/6191cd5185418.jpg\"]', '所有人下載DM的資產，都及時轉到Tp錢包幣安鏈上去BCS，私募時間22號到期！沒有私募的上線後也可DApp推廣掙', 1636945446, 1636945446, 1, 1636945446, 0, 0, 0, 0, '', 0, '', 0, '');
INSERT INTO `ocenter_forum_post` VALUES (121, 796, 1, '状态类型帖子', 0, '[\"/Uploads/Download/2021-11-16/619376c2c198c.png\"]', '大家赶紧上车！Dm赛道全新拉开！私慕时间22号结束！', 1637054236, 1637054236, 1, 1637054236, 0, 0, 0, 0, '', 0, '', 0, '');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_forum_post_reply
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_forum_post_reply`;
CREATE TABLE `ocenter_forum_post_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `support_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_forum_post_reply
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_forum_post_reply` VALUES (7, 105, 7, 0, '他给沟沟壑壑', 1628138758, 1628138758, 1, 0, 1);
INSERT INTO `ocenter_forum_post_reply` VALUES (8, 105, 8, 0, 'ehhehshds', 1628138939, 1628138939, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (9, 105, 8, 0, '和好多好多好多好多酒\n', 1628138945, 1628138945, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (10, 105, 8, 0, 'sjsuudjdjdjd', 1628138957, 1628138957, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (11, 105, 8, 0, 'hshshshshshs', 1628138962, 1628138962, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (12, 105, 8, 0, 'y d y d h d h d h d h', 1628138968, 1628138968, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (13, 105, 8, 0, 'bdhdhdhshshs', 1628138976, 1628138976, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (14, 105, 8, 0, 'ydhdhdhdhdb', 1628138981, 1628138981, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (15, 105, 8, 0, 'gdgdhdhdhdh', 1628138986, 1628138986, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (16, 105, 8, 0, 'hdhdhdhdhdh', 1628138991, 1628138991, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (17, 105, 8, 0, 'hdhdhdhdhsh', 1628138997, 1628138997, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (18, 105, 8, 0, 'fdggdgdgdhdh', 1628139003, 1628139003, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (19, 105, 8, 0, 'hdhdhdhshssh', 1628139008, 1628139008, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (20, 105, 8, 0, '严肃的护手霜', 1628139013, 1628139013, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (21, 105, 8, 0, '哈哈哈哈哈哈哈', 1628416859, 1628416859, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (22, 105, 8, 0, '哈迈就激动激动激动激动激动', 1628416972, 1628416972, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (23, 105, 8, 0, '疯疯癫癫的', 1628420154, 1628420154, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (24, 105, 8, 0, '还是傻傻就是看', 1628420229, 1628420229, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (25, 105, 8, 0, '而丰富的发发发', 1628422176, 1628422176, 1, 0, 2);
INSERT INTO `ocenter_forum_post_reply` VALUES (26, 105, 8, 0, '菲德尔的否定的', 1628422229, 1628422229, 1, 0, 6);
INSERT INTO `ocenter_forum_post_reply` VALUES (27, 109, 9, 0, 'DmanSwap布道者', 1628573828, 1628573828, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (28, 105, 8, 0, '仿佛个哈哈哈哈', 1629092218, 1629092218, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (29, 105, 8, 0, '大概哈哈给广告费', 1629092226, 1629092226, 1, 0, 2);
INSERT INTO `ocenter_forum_post_reply` VALUES (30, 105, 8, 0, '电饭锅恢复人体哈哈', 1629092233, 1629092233, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (31, 105, 8, 0, '到底发广告 v 个', 1629092239, 1629092239, 1, 0, 9);
INSERT INTO `ocenter_forum_post_reply` VALUES (32, 105, 7, 0, '法国哥哥哥哥', 1629092775, 1629092775, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (33, 105, 8, 0, '个哈哈姐姐', 1629096082, 1629096082, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (34, 105, 8, 0, '哥哥哥哥和姐姐', 1629096138, 1629096138, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (35, 105, 10, 0, '如速战速决', 1629099393, 1629099393, 1, 0, 4);
INSERT INTO `ocenter_forum_post_reply` VALUES (36, 105, 10, 0, '第四届宿舍睡觉睡觉睡觉', 1629100982, 1629100982, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (37, 105, 2, 0, 'udhdjsjssjsj', 1629101069, 1629101069, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (38, 105, 11, 0, '阿就睡觉睡觉睡觉就', 1629115581, 1629115581, 1, 0, 3);
INSERT INTO `ocenter_forum_post_reply` VALUES (39, 105, 11, 0, 'g h h h h', 1629115920, 1629115920, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (40, 105, 8, 0, '电饭锅个好伙伴', 1629616109, 1629616109, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (41, 105, 7, 0, '的独特风格 v', 1629616114, 1629616114, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (42, 105, 10, 0, '大人的幸福感哥哥', 1629620219, 1629620219, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (43, 105, 9, 0, '第二哥哥 v 回家', 1629620230, 1629620230, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (44, 115, 12, 0, '这图很漂亮', 1630594602, 1630594602, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (45, 115, 13, 0, '厉害了我的哥', 1630594651, 1630594651, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (46, 109, 16, 0, 'NFT? \n', 1630662810, 1630662810, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (47, 113, 16, 0, '多少钱一个', 1630663477, 1630663477, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (48, 115, 27, 0, '就是就是就是睡觉睡觉', 1630731090, 1630731090, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (49, 115, 27, 0, '山东衡水市', 1630731095, 1630731095, 1, 0, 5);
INSERT INTO `ocenter_forum_post_reply` VALUES (50, 105, 27, 0, 'hshshsjsjs', 1630825819, 1630825819, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (51, 105, 27, 0, 'shhsjssjajaj', 1630825842, 1630825842, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (52, 105, 27, 0, 'hshssjsjsj', 1630826049, 1630826049, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (53, 105, 27, 0, 'jsjsjssjsjsj', 1630826338, 1630826338, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (54, 105, 27, 0, 'dhhdjdsjsn', 1630826469, 1630826469, 1, 1, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (55, 105, 27, 0, 'hxhdhsnsnsnwn', 1630826501, 1630826501, 1, 1, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (56, 106, 29, 0, '厉害了，志同道合', 1630829880, 1630829880, 1, 2, 3);
INSERT INTO `ocenter_forum_post_reply` VALUES (57, 105, 29, 0, 'DMAN越做越好！', 1630835294, 1630835294, 1, 1, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (58, 105, 29, 0, '顶起来！！', 1630835492, 1630835492, 1, 1, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (59, 111, 30, 0, '哈哈，哈哈哈', 1630889800, 1630889800, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (60, 114, 30, 0, '标的否666', 1630889863, 1630889863, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (61, 114, 35, 0, '', 1631348491, 1631348491, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (62, 114, 34, 0, '', 1631348517, 1631348517, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (63, 114, 36, 0, '', 1631348530, 1631348530, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (64, 105, 35, 0, 'dman越做越好！', 1631512977, 1631512977, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (65, 105, 37, 0, '泡沫太大了', 1631517220, 1631517220, 1, 1, 2);
INSERT INTO `ocenter_forum_post_reply` VALUES (66, 111, 41, 0, '你家夫人么', 1631876032, 1631876032, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (67, 119, 41, 0, '不是我家夫人，没有那福分啊，哈哈', 1631890217, 1631890217, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (68, 114, 41, 0, '是俩口子吗', 1631894278, 1631894278, 1, 0, 1);
INSERT INTO `ocenter_forum_post_reply` VALUES (69, 426, 41, 0, '\n0x8bBa61E0668D3821413786D2Bd49B4D44AD5d26d', 1632257579, 1632257579, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (70, 426, 40, 0, '\n0x8bBa61E0668D3821413786D2Bd49B4D44AD5d26d', 1632257591, 1632257591, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (71, 426, 38, 0, '\n0x8bBa61E0668D3821413786D2Bd49B4D44AD5d26d', 1632257617, 1632257617, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (72, 426, 28, 0, '\n0x8bBa61E0668D3821413786D2Bd49B4D44AD5d26d这个是babyShib的合约地址，布道布道，技术牛呀，三链合一，币，币安，以太链，', 1632257778, 1632257778, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (73, 149, 60, 0, '感谢点赞关注', 1632727571, 1632727571, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (74, 149, 60, 0, '感谢点赞关注', 1632727572, 1632727572, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (75, 149, 60, 0, '感谢点赞关注', 1632727622, 1632727622, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (76, 149, 60, 0, '感谢点赞关注', 1632727642, 1632727642, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (77, 113, 62, 0, '一个已确定的有空投的类似于百度，搜狗的区块链搜索引擎', 1632907356, 1632907356, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (78, 239, 68, 0, '是的扣扣电话', 1633496017, 1633496017, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (79, 612, 71, 0, '发火币生态链地址，领取空投', 1633852130, 1633852130, 1, 0, 1);
INSERT INTO `ocenter_forum_post_reply` VALUES (80, 540, 71, 0, '0xcBc26652d6A0210e29ed1B6d6FBe552ddCbfa8A0', 1634315136, 1634315136, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (81, 484, 39, 0, '合约地址多少', 1634606531, 1634606531, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (82, 114, 79, 0, '做好社区共享，才是出路之道', 1634699146, 1634699146, 1, 1, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (83, 1086, 81, 0, '贵阳花果园', 1634974949, 1634974949, 1, 1, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (84, 1101, 78, 0, '请怎么下载', 1635067074, 1635067074, 1, 0, 5);
INSERT INTO `ocenter_forum_post_reply` VALUES (85, 1197, 85, 0, '。。。。。', 1635181138, 1635181138, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (86, 1197, 85, 0, '。。。。。', 1635181146, 1635181146, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (87, 1197, 85, 0, '。。。。。', 1635181152, 1635181152, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (88, 1197, 85, 0, '。。。。。', 1635181170, 1635181170, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (89, 1197, 84, 0, '。。。。。', 1635181179, 1635181179, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (90, 1197, 84, 0, '。。。。。', 1635181183, 1635181183, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (91, 1197, 84, 0, '。。。。。', 1635181195, 1635181195, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (92, 1296, 98, 0, '不投资差不多，投资风险', 1635499560, 1635499560, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (93, 1461, 103, 0, '奇迹来临更猛烈', 1635697935, 1635697935, 1, 1, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (94, 1461, 82, 0, '未来路上来了', 1635697989, 1635697989, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (95, 973, 108, 0, '微信扫码下载', 1635776887, 1635776887, 1, 0, 0);
INSERT INTO `ocenter_forum_post_reply` VALUES (96, 717, 117, 0, '微信不对啊，加不上', 1636956241, 1636956241, 1, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_forum_type
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_forum_type`;
CREATE TABLE `ocenter_forum_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='论坛分类表';

-- ----------------------------
-- Records of ocenter_forum_type
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_forum_type` VALUES (1, '默认分类', 1, 0, 0);
INSERT INTO `ocenter_forum_type` VALUES (2, '官方板块', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_hooks
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_hooks`;
CREATE TABLE `ocenter_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_hooks
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_hooks` VALUES (38, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '');
INSERT INTO `ocenter_hooks` VALUES (39, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'SuperLinks');
INSERT INTO `ocenter_hooks` VALUES (40, 'adminEditor', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin');
INSERT INTO `ocenter_hooks` VALUES (41, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SyncLogin,DevTeam,SystemInfo,LocalComment');
INSERT INTO `ocenter_hooks` VALUES (42, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, '');
INSERT INTO `ocenter_hooks` VALUES (43, 'app_begin', '应用开始', 2, 1384481614, 'Iswaf');
INSERT INTO `ocenter_hooks` VALUES (44, 'checkIn', '签到', 1, 1395371353, 'CheckIn');
INSERT INTO `ocenter_hooks` VALUES (46, 'support', '赞', 1, 1398264759, 'Support');
INSERT INTO `ocenter_hooks` VALUES (47, 'localComment', '本地评论插件', 1, 1399440321, 'LocalComment');
INSERT INTO `ocenter_hooks` VALUES (48, 'weiboType', '微博类型', 1, 1409121894, '');
INSERT INTO `ocenter_hooks` VALUES (49, 'repost', '转发钩子', 1, 1403668286, '');
INSERT INTO `ocenter_hooks` VALUES (50, 'syncLogin', '第三方登陆位置', 1, 1403700579, 'SyncLogin');
INSERT INTO `ocenter_hooks` VALUES (51, 'syncMeta', '第三方登陆meta接口', 1, 1403700633, 'SyncLogin');
INSERT INTO `ocenter_hooks` VALUES (52, 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', 1, 1403841931, 'ChinaCity');
INSERT INTO `ocenter_hooks` VALUES (54, 'imageSlider', '图片轮播钩子', 1, 1407144022, '');
INSERT INTO `ocenter_hooks` VALUES (55, 'friendLink', '友情链接插件', 1, 1407156413, 'SuperLinks');
INSERT INTO `ocenter_hooks` VALUES (56, 'beforeSendWeibo', '在发微博之前预处理微博', 2, 1408084504, 'InsertFile');
INSERT INTO `ocenter_hooks` VALUES (57, 'beforeSendRepost', '转发微博前的预处理钩子', 2, 1408085689, '');
INSERT INTO `ocenter_hooks` VALUES (58, 'parseWeiboContent', '解析微博内容钩子', 2, 1409121261, '');
INSERT INTO `ocenter_hooks` VALUES (59, 'userConfig', '用户配置页面钩子', 1, 1417137557, 'SyncLogin');
INSERT INTO `ocenter_hooks` VALUES (60, 'weiboSide', '微博侧边钩子', 1, 1417063425, 'Retopic,Recommend');
INSERT INTO `ocenter_hooks` VALUES (61, 'personalMenus', '顶部导航栏个人下拉菜单', 1, 1417146501, '');
INSERT INTO `ocenter_hooks` VALUES (62, 'dealPicture', '上传图片处理', 2, 1417139975, '');
INSERT INTO `ocenter_hooks` VALUES (63, 'ucenterSideMenu', '用户中心左侧菜单', 1, 1417161205, '');
INSERT INTO `ocenter_hooks` VALUES (64, 'afterTop', '顶部导航之后的钩子，调用公告等', 1, 1429671392, '');
INSERT INTO `ocenter_hooks` VALUES (65, 'report', '举报钩子', 1, 1429511732, 'Report');
INSERT INTO `ocenter_hooks` VALUES (66, 'handleAction', '行为的额外操作', 2, 1433300260, 'CheckIn');
INSERT INTO `ocenter_hooks` VALUES (67, 'uploadDriver', '附件图片上传引擎', 2, 1435306269, '');
INSERT INTO `ocenter_hooks` VALUES (68, 'sms', '短信插件钩子', 2, 1437382105, '');
INSERT INTO `ocenter_hooks` VALUES (69, 'filterHtmlContent', '渲染富文本', 2, 1441951420, '');
INSERT INTO `ocenter_hooks` VALUES (70, 'parseContent', '解析内容', 2, 1445828128, 'Sensitive');
INSERT INTO `ocenter_hooks` VALUES (71, 'tool', '返回顶部，右下角工具栏', 1, 1445828128, '');
INSERT INTO `ocenter_hooks` VALUES (72, 'homeIndex', '网站首页', 2, 1445828128, '');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_iexpression
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_iexpression`;
CREATE TABLE `ocenter_iexpression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(200) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_iexpression
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_iexpression_link
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_iexpression_link`;
CREATE TABLE `ocenter_iexpression_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iexpression_id` int(11) NOT NULL,
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_iexpression_link
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_invite
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_invite`;
CREATE TABLE `ocenter_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `code` varchar(25) NOT NULL COMMENT '邀请码',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `can_num` int(10) NOT NULL COMMENT '可以注册用户（含升级）',
  `already_num` int(10) NOT NULL COMMENT '已经注册用户（含升级）',
  `end_time` int(11) NOT NULL COMMENT '有效期至',
  `status` tinyint(2) NOT NULL COMMENT '0：已用完，1：还可注册，2：用户取消邀请，-1：管理员删除',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3749 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='邀请码表';

-- ----------------------------
-- Records of ocenter_invite
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_invite` VALUES (3208, 1, '9819328', 106, 1000000, 0, 1938708420, 1, 1623175620);
INSERT INTO `ocenter_invite` VALUES (3209, 1, '2690442', 109, 1000000, 5, 1938880464, 1, 1623347664);
INSERT INTO `ocenter_invite` VALUES (3210, 1, '4215055', 105, 1000000, 1, 1939348943, 1, 1623816143);
INSERT INTO `ocenter_invite` VALUES (3211, 1, '8634229', 111, 1000000, 26, 1944056312, 1, 1628523512);
INSERT INTO `ocenter_invite` VALUES (3212, 1, '4480780', 113, 1000000, 16, 1946114057, 1, 1630581257);
INSERT INTO `ocenter_invite` VALUES (3213, 1, '0962024', 114, 1000000, 25, 1946114540, 1, 1630581740);
INSERT INTO `ocenter_invite` VALUES (3214, 1, '6133259', 112, 1000000, 1, 1946115027, 1, 1630582226);
INSERT INTO `ocenter_invite` VALUES (3215, 1, '9910537', 116, 1000000, 1, 1946206886, 1, 1630674086);
INSERT INTO `ocenter_invite` VALUES (3216, 1, '7392788', 119, 1000000, 8, 1946243324, 1, 1630710524);
INSERT INTO `ocenter_invite` VALUES (3217, 1, '2350742', 120, 1000000, 0, 1946252257, 1, 1630719457);
INSERT INTO `ocenter_invite` VALUES (3218, 1, '3543773', 123, 1000000, 6, 1946794134, 1, 1631261334);
INSERT INTO `ocenter_invite` VALUES (3219, 1, '6460797', 124, 1000000, 13, 1947120705, 1, 1631587905);
INSERT INTO `ocenter_invite` VALUES (3220, 1, '5947946', 127, 1000000, 1, 1947126103, 1, 1631593303);
INSERT INTO `ocenter_invite` VALUES (3221, 1, '3228917', 128, 1000000, 171, 1947141451, 1, 1631608651);
INSERT INTO `ocenter_invite` VALUES (3222, 1, '1083049', 133, 1000000, 0, 1947144133, 1, 1631611333);
INSERT INTO `ocenter_invite` VALUES (3223, 1, '8733200', 147, 1000000, 0, 1947160764, 1, 1631627964);
INSERT INTO `ocenter_invite` VALUES (3224, 1, '2406618', 151, 1000000, 14, 1947163703, 1, 1631630903);
INSERT INTO `ocenter_invite` VALUES (3225, 1, '7637182', 152, 1000000, 3, 1947175246, 1, 1631642446);
INSERT INTO `ocenter_invite` VALUES (3226, 1, '2351434', 153, 1000000, 0, 1947199049, 1, 1631666249);
INSERT INTO `ocenter_invite` VALUES (3227, 1, '8754896', 158, 1000000, 3, 1947209399, 1, 1631676599);
INSERT INTO `ocenter_invite` VALUES (3228, 1, '4296266', 156, 1000000, 31, 1947217426, 1, 1631684626);
INSERT INTO `ocenter_invite` VALUES (3229, 1, '8988123', 162, 1000000, 0, 1947228005, 1, 1631695205);
INSERT INTO `ocenter_invite` VALUES (3230, 1, '5253121', 197, 1000000, 1, 1947302322, 1, 1631769522);
INSERT INTO `ocenter_invite` VALUES (3231, 1, '5580914', 160, 1000000, 23, 1947307560, 1, 1631774760);
INSERT INTO `ocenter_invite` VALUES (3232, 1, '0914541', 200, 1000000, 0, 1947308172, 1, 1631775372);
INSERT INTO `ocenter_invite` VALUES (3233, 1, '3958396', 164, 1000000, 11, 1947308842, 1, 1631776042);
INSERT INTO `ocenter_invite` VALUES (3234, 1, '2369749', 203, 1000000, 4, 1947313068, 1, 1631780268);
INSERT INTO `ocenter_invite` VALUES (3235, 1, '2066091', 206, 1000000, 0, 1947314460, 1, 1631781660);
INSERT INTO `ocenter_invite` VALUES (3236, 1, '8195489', 217, 1000000, 4, 1947331309, 1, 1631798509);
INSERT INTO `ocenter_invite` VALUES (3237, 1, '1628994', 219, 1000000, 2, 1947337849, 1, 1631805049);
INSERT INTO `ocenter_invite` VALUES (3238, 1, '8936095', 201, 1000000, 2, 1947382804, 1, 1631850004);
INSERT INTO `ocenter_invite` VALUES (3239, 1, '5548265', 232, 1000000, 1, 1947395132, 1, 1631862332);
INSERT INTO `ocenter_invite` VALUES (3240, 1, '0738021', 148, 1000000, 10, 1947398756, 1, 1631865956);
INSERT INTO `ocenter_invite` VALUES (3241, 1, '4380825', 235, 1000000, 1, 1947399900, 1, 1631867100);
INSERT INTO `ocenter_invite` VALUES (3242, 1, '4396286', 237, 1000000, 3, 1947400692, 1, 1631867892);
INSERT INTO `ocenter_invite` VALUES (3243, 1, '9739513', 239, 1000000, 4, 1947400850, 1, 1631868050);
INSERT INTO `ocenter_invite` VALUES (3244, 1, '1829788', 244, 1000000, 1, 1947402475, 1, 1631869675);
INSERT INTO `ocenter_invite` VALUES (3245, 1, '2127181', 246, 1000000, 0, 1947405197, 1, 1631872397);
INSERT INTO `ocenter_invite` VALUES (3246, 1, '6841454', 241, 1000000, 0, 1947409141, 1, 1631876341);
INSERT INTO `ocenter_invite` VALUES (3247, 1, '9024347', 248, 1000000, 26, 1947411729, 1, 1631878929);
INSERT INTO `ocenter_invite` VALUES (3248, 1, '5733111', 249, 1000000, 8, 1947412684, 1, 1631879884);
INSERT INTO `ocenter_invite` VALUES (3249, 1, '7566858', 157, 1000000, 10, 1947415522, 1, 1631882722);
INSERT INTO `ocenter_invite` VALUES (3250, 1, '9123146', 251, 1000000, 7, 1947417303, 1, 1631884503);
INSERT INTO `ocenter_invite` VALUES (3251, 1, '1478244', 199, 1000000, 47, 1947417497, 1, 1631884696);
INSERT INTO `ocenter_invite` VALUES (3252, 1, '3277993', 264, 1000000, 0, 1947419038, 1, 1631886238);
INSERT INTO `ocenter_invite` VALUES (3253, 1, '7398074', 266, 1000000, 0, 1947420773, 1, 1631887973);
INSERT INTO `ocenter_invite` VALUES (3254, 1, '1172788', 267, 1000000, 1, 1947423233, 1, 1631890432);
INSERT INTO `ocenter_invite` VALUES (3255, 1, '7460726', 273, 1000000, 3, 1947428557, 1, 1631895757);
INSERT INTO `ocenter_invite` VALUES (3256, 1, '0273987', 274, 1000000, 0, 1947428781, 1, 1631895980);
INSERT INTO `ocenter_invite` VALUES (3257, 1, '2499324', 275, 1000000, 1, 1947435948, 1, 1631903148);
INSERT INTO `ocenter_invite` VALUES (3258, 1, '6612230', 293, 1000000, 3, 1947461122, 1, 1631928322);
INSERT INTO `ocenter_invite` VALUES (3259, 1, '6527718', 295, 1000000, 0, 1947464537, 1, 1631931737);
INSERT INTO `ocenter_invite` VALUES (3260, 1, '4571824', 296, 1000000, 0, 1947466193, 1, 1631933393);
INSERT INTO `ocenter_invite` VALUES (3261, 1, '4227425', 297, 1000000, 7, 1947468131, 1, 1631935331);
INSERT INTO `ocenter_invite` VALUES (3262, 1, '6231482', 163, 1000000, 7, 1947469231, 1, 1631936431);
INSERT INTO `ocenter_invite` VALUES (3263, 1, '4604981', 300, 1000000, 1, 1947470684, 1, 1631937884);
INSERT INTO `ocenter_invite` VALUES (3264, 1, '7412547', 252, 1000000, 0, 1947470964, 1, 1631938164);
INSERT INTO `ocenter_invite` VALUES (3265, 1, '0290305', 301, 1000000, 1, 1947471150, 1, 1631938350);
INSERT INTO `ocenter_invite` VALUES (3266, 1, '9336588', 302, 1000000, 0, 1947472883, 1, 1631940083);
INSERT INTO `ocenter_invite` VALUES (3267, 1, '6312878', 304, 1000000, 25, 1947476784, 1, 1631943984);
INSERT INTO `ocenter_invite` VALUES (3268, 1, '2815182', 305, 1000000, 1, 1947478286, 1, 1631945486);
INSERT INTO `ocenter_invite` VALUES (3269, 1, '9189645', 196, 1000000, 1, 1947488233, 1, 1631955433);
INSERT INTO `ocenter_invite` VALUES (3270, 1, '2697565', 310, 1000000, 6, 1947488703, 1, 1631955903);
INSERT INTO `ocenter_invite` VALUES (3271, 1, '9208079', 313, 1000000, 0, 1947489397, 1, 1631956597);
INSERT INTO `ocenter_invite` VALUES (3272, 1, '3958530', 337, 1000000, 4, 1947510196, 1, 1631977396);
INSERT INTO `ocenter_invite` VALUES (3273, 1, '1192340', 338, 1000000, 1, 1947512078, 1, 1631979277);
INSERT INTO `ocenter_invite` VALUES (3274, 1, '9493270', 365, 1000000, 5, 1947557796, 1, 1632024996);
INSERT INTO `ocenter_invite` VALUES (3275, 1, '7184599', 366, 1000000, 1, 1947570547, 1, 1632037747);
INSERT INTO `ocenter_invite` VALUES (3276, 1, '8688750', 370, 1000000, 1, 1947573298, 1, 1632040498);
INSERT INTO `ocenter_invite` VALUES (3277, 1, '8200457', 372, 1000000, 0, 1947577716, 1, 1632044916);
INSERT INTO `ocenter_invite` VALUES (3278, 1, '2491723', 256, 1000000, 0, 1947584966, 1, 1632052166);
INSERT INTO `ocenter_invite` VALUES (3279, 1, '3759648', 399, 1000000, 3, 1947588494, 1, 1632055694);
INSERT INTO `ocenter_invite` VALUES (3280, 1, '7255648', 398, 1000000, 0, 1947592467, 1, 1632059667);
INSERT INTO `ocenter_invite` VALUES (3281, 1, '8932339', 403, 1000000, 2, 1947647848, 1, 1632115048);
INSERT INTO `ocenter_invite` VALUES (3282, 1, '6193903', 406, 1000000, 0, 1947648467, 1, 1632115667);
INSERT INTO `ocenter_invite` VALUES (3283, 1, '4622619', 407, 1000000, 0, 1947653739, 1, 1632120939);
INSERT INTO `ocenter_invite` VALUES (3284, 1, '2031798', 408, 1000000, 0, 1947657040, 1, 1632124240);
INSERT INTO `ocenter_invite` VALUES (3285, 1, '2730625', 412, 1000000, 7, 1947666470, 1, 1632133670);
INSERT INTO `ocenter_invite` VALUES (3286, 1, '8272637', 416, 1000000, 0, 1947681154, 1, 1632148354);
INSERT INTO `ocenter_invite` VALUES (3287, 1, '7042502', 373, 1000000, 2, 1947681520, 1, 1632148720);
INSERT INTO `ocenter_invite` VALUES (3288, 1, '0279103', 421, 1000000, 0, 1947738906, 1, 1632206106);
INSERT INTO `ocenter_invite` VALUES (3289, 1, '4587542', 423, 1000000, 0, 1947761033, 1, 1632228233);
INSERT INTO `ocenter_invite` VALUES (3290, 1, '4222356', 424, 1000000, 0, 1947769520, 1, 1632236720);
INSERT INTO `ocenter_invite` VALUES (3291, 1, '7974885', 437, 1000000, 0, 1947838525, 1, 1632305725);
INSERT INTO `ocenter_invite` VALUES (3292, 1, '1212763', 438, 1000000, 0, 1947839863, 1, 1632307063);
INSERT INTO `ocenter_invite` VALUES (3293, 1, '7414806', 405, 1000000, 0, 1947892756, 1, 1632359956);
INSERT INTO `ocenter_invite` VALUES (3294, 1, '1625581', 441, 1000000, 0, 1947908553, 1, 1632375753);
INSERT INTO `ocenter_invite` VALUES (3295, 1, '8540334', 444, 1000000, 5, 1947916146, 1, 1632383346);
INSERT INTO `ocenter_invite` VALUES (3296, 1, '5101166', 436, 1000000, 0, 1947929170, 1, 1632396370);
INSERT INTO `ocenter_invite` VALUES (3297, 1, '9843819', 261, 1000000, 4, 1947930449, 1, 1632397649);
INSERT INTO `ocenter_invite` VALUES (3298, 1, '4863080', 448, 1000000, 0, 1947936146, 1, 1632403346);
INSERT INTO `ocenter_invite` VALUES (3299, 1, '7954660', 233, 1000000, 6, 1947978784, 1, 1632445983);
INSERT INTO `ocenter_invite` VALUES (3300, 1, '5783145', 457, 1000000, 0, 1947988344, 1, 1632455544);
INSERT INTO `ocenter_invite` VALUES (3301, 1, '5771886', 452, 1000000, 0, 1947988833, 1, 1632456033);
INSERT INTO `ocenter_invite` VALUES (3302, 1, '5780483', 459, 1000000, 0, 1947989816, 1, 1632457016);
INSERT INTO `ocenter_invite` VALUES (3303, 1, '4606195', 458, 1000000, 0, 1947990720, 1, 1632457920);
INSERT INTO `ocenter_invite` VALUES (3304, 1, '5881655', 414, 1000000, 0, 1947996687, 1, 1632463887);
INSERT INTO `ocenter_invite` VALUES (3305, 1, '8292815', 461, 1000000, 1, 1948003365, 1, 1632470565);
INSERT INTO `ocenter_invite` VALUES (3306, 1, '6238026', 453, 1000000, 1, 1948003690, 1, 1632470890);
INSERT INTO `ocenter_invite` VALUES (3307, 1, '2415472', 465, 1000000, 0, 1948007827, 1, 1632475027);
INSERT INTO `ocenter_invite` VALUES (3308, 1, '2856305', 466, 1000000, 1, 1948008336, 1, 1632475536);
INSERT INTO `ocenter_invite` VALUES (3309, 1, '5166021', 446, 1000000, 0, 1948014613, 1, 1632481813);
INSERT INTO `ocenter_invite` VALUES (3310, 1, '9371990', 472, 1000000, 0, 1948027009, 1, 1632494209);
INSERT INTO `ocenter_invite` VALUES (3311, 1, '7399906', 475, 1000000, 6, 1948067082, 1, 1632534282);
INSERT INTO `ocenter_invite` VALUES (3312, 1, '1373819', 477, 1000000, 0, 1948078962, 1, 1632546162);
INSERT INTO `ocenter_invite` VALUES (3313, 1, '7297101', 161, 1000000, 3, 1948085477, 1, 1632552677);
INSERT INTO `ocenter_invite` VALUES (3314, 1, '9628212', 478, 1000000, 3, 1948085898, 1, 1632553098);
INSERT INTO `ocenter_invite` VALUES (3315, 1, '7846376', 294, 1000000, 0, 1948085935, 1, 1632553135);
INSERT INTO `ocenter_invite` VALUES (3316, 1, '5696071', 481, 1000000, 0, 1948110075, 1, 1632577275);
INSERT INTO `ocenter_invite` VALUES (3317, 1, '4569176', 484, 1000000, 1, 1948154524, 1, 1632621723);
INSERT INTO `ocenter_invite` VALUES (3318, 1, '9542684', 476, 1000000, 0, 1948158778, 1, 1632625978);
INSERT INTO `ocenter_invite` VALUES (3319, 1, '0937647', 486, 1000000, 2, 1948168335, 1, 1632635535);
INSERT INTO `ocenter_invite` VALUES (3320, 1, '5387600', 487, 1000000, 0, 1948168668, 1, 1632635868);
INSERT INTO `ocenter_invite` VALUES (3321, 1, '7298434', 488, 1000000, 0, 1948169641, 1, 1632636841);
INSERT INTO `ocenter_invite` VALUES (3322, 1, '9346247', 490, 1000000, 0, 1948175799, 1, 1632642999);
INSERT INTO `ocenter_invite` VALUES (3323, 1, '0767696', 492, 1000000, 13, 1948182349, 1, 1632649549);
INSERT INTO `ocenter_invite` VALUES (3324, 1, '5531980', 485, 1000000, 0, 1948186458, 1, 1632653658);
INSERT INTO `ocenter_invite` VALUES (3325, 1, '1457755', 495, 1000000, 1, 1948197937, 1, 1632665137);
INSERT INTO `ocenter_invite` VALUES (3326, 1, '4699270', 500, 1000000, 14, 1948247799, 1, 1632714999);
INSERT INTO `ocenter_invite` VALUES (3327, 1, '4633481', 149, 1000000, 0, 1948259664, 1, 1632726864);
INSERT INTO `ocenter_invite` VALUES (3328, 1, '4770134', 464, 1000000, 0, 1948262117, 1, 1632729317);
INSERT INTO `ocenter_invite` VALUES (3329, 1, '7833637', 298, 1000000, 1, 1948262937, 1, 1632730137);
INSERT INTO `ocenter_invite` VALUES (3330, 1, '9230137', 507, 1000000, 0, 1948267366, 1, 1632734566);
INSERT INTO `ocenter_invite` VALUES (3331, 1, '8039207', 512, 1000000, 0, 1948294472, 1, 1632761672);
INSERT INTO `ocenter_invite` VALUES (3332, 1, '7037521', 489, 1000000, 1, 1948324380, 1, 1632791580);
INSERT INTO `ocenter_invite` VALUES (3333, 1, '7376186', 517, 1000000, 0, 1948345893, 1, 1632813093);
INSERT INTO `ocenter_invite` VALUES (3334, 1, '3269107', 166, 1000000, 1, 1948346298, 1, 1632813498);
INSERT INTO `ocenter_invite` VALUES (3335, 1, '0244885', 519, 1000000, 15, 1948353171, 1, 1632820371);
INSERT INTO `ocenter_invite` VALUES (3336, 1, '8949233', 521, 1000000, 0, 1948354988, 1, 1632822188);
INSERT INTO `ocenter_invite` VALUES (3337, 1, '2781937', 522, 1000000, 2, 1948357077, 1, 1632824277);
INSERT INTO `ocenter_invite` VALUES (3338, 1, '1397675', 523, 1000000, 0, 1948374789, 1, 1632841989);
INSERT INTO `ocenter_invite` VALUES (3339, 1, '4289975', 525, 1000000, 0, 1948412250, 1, 1632879450);
INSERT INTO `ocenter_invite` VALUES (3340, 1, '9494548', 527, 1000000, 3, 1948432075, 1, 1632899275);
INSERT INTO `ocenter_invite` VALUES (3341, 1, '6464432', 532, 1000000, 1, 1948433710, 1, 1632900910);
INSERT INTO `ocenter_invite` VALUES (3342, 1, '9024406', 531, 1000000, 5, 1948434202, 1, 1632901402);
INSERT INTO `ocenter_invite` VALUES (3343, 1, '3800887', 538, 1000000, 2, 1948442378, 1, 1632909578);
INSERT INTO `ocenter_invite` VALUES (3344, 1, '0490492', 539, 1000000, 0, 1948444809, 1, 1632912009);
INSERT INTO `ocenter_invite` VALUES (3345, 1, '1926844', 316, 1000000, 0, 1948505987, 1, 1632973187);
INSERT INTO `ocenter_invite` VALUES (3346, 1, '0241466', 544, 1000000, 0, 1948520081, 1, 1632987281);
INSERT INTO `ocenter_invite` VALUES (3347, 1, '2712346', 546, 1000000, 1, 1948520572, 1, 1632987772);
INSERT INTO `ocenter_invite` VALUES (3348, 1, '1499707', 552, 1000000, 1, 1948522500, 1, 1632989700);
INSERT INTO `ocenter_invite` VALUES (3349, 1, '2132179', 554, 1000000, 3, 1948541854, 1, 1633009054);
INSERT INTO `ocenter_invite` VALUES (3350, 1, '9796408', 545, 1000000, 0, 1948571429, 1, 1633038629);
INSERT INTO `ocenter_invite` VALUES (3351, 1, '0939936', 560, 1000000, 0, 1948605891, 1, 1633073091);
INSERT INTO `ocenter_invite` VALUES (3352, 1, '7442743', 568, 1000000, 0, 1948687109, 1, 1633154309);
INSERT INTO `ocenter_invite` VALUES (3353, 1, '5210965', 569, 1000000, 4, 1948774027, 1, 1633241227);
INSERT INTO `ocenter_invite` VALUES (3354, 1, '7404146', 499, 1000000, 0, 1948816622, 1, 1633283822);
INSERT INTO `ocenter_invite` VALUES (3355, 1, '5616425', 579, 1000000, 1, 1948869867, 1, 1633337067);
INSERT INTO `ocenter_invite` VALUES (3356, 1, '7877731', 580, 1000000, 1, 1948870826, 1, 1633338026);
INSERT INTO `ocenter_invite` VALUES (3357, 1, '1393658', 550, 1000000, 0, 1948874742, 1, 1633341942);
INSERT INTO `ocenter_invite` VALUES (3358, 1, '7144587', 315, 1000000, 2, 1948890857, 1, 1633358057);
INSERT INTO `ocenter_invite` VALUES (3359, 1, '5627342', 460, 1000000, 4, 1948956773, 1, 1633423973);
INSERT INTO `ocenter_invite` VALUES (3360, 1, '5115660', 587, 1000000, 19, 1948957296, 1, 1633424496);
INSERT INTO `ocenter_invite` VALUES (3361, 1, '4353897', 589, 1000000, 3, 1948964423, 1, 1633431623);
INSERT INTO `ocenter_invite` VALUES (3362, 1, '1298958', 591, 1000000, 0, 1948964844, 1, 1633432044);
INSERT INTO `ocenter_invite` VALUES (3363, 1, '7687417', 592, 1000000, 5, 1948970197, 1, 1633437397);
INSERT INTO `ocenter_invite` VALUES (3364, 1, '3034707', 595, 1000000, 1, 1948971416, 1, 1633438616);
INSERT INTO `ocenter_invite` VALUES (3365, 1, '8371555', 586, 1000000, 0, 1948982062, 1, 1633449262);
INSERT INTO `ocenter_invite` VALUES (3366, 1, '4294912', 601, 1000000, 0, 1949026663, 1, 1633493863);
INSERT INTO `ocenter_invite` VALUES (3367, 1, '2108423', 600, 1000000, 2, 1949027036, 1, 1633494236);
INSERT INTO `ocenter_invite` VALUES (3368, 1, '1649552', 603, 1000000, 0, 1949033871, 1, 1633501071);
INSERT INTO `ocenter_invite` VALUES (3369, 1, '7018951', 576, 1000000, 1, 1949035340, 1, 1633502540);
INSERT INTO `ocenter_invite` VALUES (3370, 1, '0861869', 605, 1000000, 1, 1949053933, 1, 1633521133);
INSERT INTO `ocenter_invite` VALUES (3371, 1, '9202347', 607, 1000000, 0, 1949063183, 1, 1633530383);
INSERT INTO `ocenter_invite` VALUES (3372, 1, '7970378', 588, 1000000, 1, 1949064600, 1, 1633531800);
INSERT INTO `ocenter_invite` VALUES (3373, 1, '4616985', 583, 1000000, 0, 1949153362, 1, 1633620562);
INSERT INTO `ocenter_invite` VALUES (3374, 1, '5507005', 617, 1000000, 0, 1949198880, 1, 1633666080);
INSERT INTO `ocenter_invite` VALUES (3375, 1, '7349713', 618, 1000000, 0, 1949200816, 1, 1633668016);
INSERT INTO `ocenter_invite` VALUES (3376, 1, '0219644', 449, 1000000, 2, 1949210497, 1, 1633677697);
INSERT INTO `ocenter_invite` VALUES (3377, 1, '5649397', 621, 1000000, 13, 1949210771, 1, 1633677971);
INSERT INTO `ocenter_invite` VALUES (3378, 1, '4239593', 622, 1000000, 2, 1949211185, 1, 1633678385);
INSERT INTO `ocenter_invite` VALUES (3379, 1, '9395918', 626, 1000000, 0, 1949211581, 1, 1633678781);
INSERT INTO `ocenter_invite` VALUES (3380, 1, '8915206', 628, 1000000, 0, 1949212067, 1, 1633679267);
INSERT INTO `ocenter_invite` VALUES (3381, 1, '4835189', 631, 1000000, 1, 1949213469, 1, 1633680669);
INSERT INTO `ocenter_invite` VALUES (3382, 1, '7626932', 632, 1000000, 1, 1949213863, 1, 1633681063);
INSERT INTO `ocenter_invite` VALUES (3383, 1, '6535682', 636, 1000000, 1, 1949217605, 1, 1633684804);
INSERT INTO `ocenter_invite` VALUES (3384, 1, '1813287', 639, 1000000, 2, 1949217821, 1, 1633685021);
INSERT INTO `ocenter_invite` VALUES (3385, 1, '5571828', 642, 1000000, 3, 1949218359, 1, 1633685559);
INSERT INTO `ocenter_invite` VALUES (3386, 1, '0826547', 643, 1000000, 1, 1949218559, 1, 1633685759);
INSERT INTO `ocenter_invite` VALUES (3387, 1, '9228399', 648, 1000000, 1, 1949238390, 1, 1633705590);
INSERT INTO `ocenter_invite` VALUES (3388, 1, '3148681', 649, 1000000, 2, 1949273000, 1, 1633740200);
INSERT INTO `ocenter_invite` VALUES (3389, 1, '4554536', 651, 1000000, 0, 1949278704, 1, 1633745904);
INSERT INTO `ocenter_invite` VALUES (3390, 1, '5741085', 655, 1000000, 2, 1949290993, 1, 1633758193);
INSERT INTO `ocenter_invite` VALUES (3391, 1, '4965744', 657, 1000000, 2, 1949296476, 1, 1633763676);
INSERT INTO `ocenter_invite` VALUES (3392, 1, '9531343', 662, 1000000, 1, 1949301820, 1, 1633769020);
INSERT INTO `ocenter_invite` VALUES (3393, 1, '0416524', 669, 1000000, 4, 1949377698, 1, 1633844898);
INSERT INTO `ocenter_invite` VALUES (3394, 1, '7959792', 473, 1000000, 1, 1949397531, 1, 1633864731);
INSERT INTO `ocenter_invite` VALUES (3395, 1, '3981785', 673, 1000000, 0, 1949397971, 1, 1633865171);
INSERT INTO `ocenter_invite` VALUES (3396, 1, '5784820', 675, 1000000, 0, 1949464320, 1, 1633931520);
INSERT INTO `ocenter_invite` VALUES (3397, 1, '9744508', 676, 1000000, 51, 1949469853, 1, 1633937053);
INSERT INTO `ocenter_invite` VALUES (3398, 1, '5149082', 678, 1000000, 3, 1949471879, 1, 1633939079);
INSERT INTO `ocenter_invite` VALUES (3399, 1, '3098834', 679, 1000000, 0, 1949473446, 1, 1633940646);
INSERT INTO `ocenter_invite` VALUES (3400, 1, '2091967', 680, 1000000, 7, 1949474555, 1, 1633941755);
INSERT INTO `ocenter_invite` VALUES (3401, 1, '5971311', 682, 1000000, 0, 1949475504, 1, 1633942704);
INSERT INTO `ocenter_invite` VALUES (3402, 1, '7405634', 684, 1000000, 2, 1949476101, 1, 1633943301);
INSERT INTO `ocenter_invite` VALUES (3403, 1, '8039039', 687, 1000000, 0, 1949477492, 1, 1633944692);
INSERT INTO `ocenter_invite` VALUES (3404, 1, '4352274', 686, 1000000, 0, 1949477572, 1, 1633944772);
INSERT INTO `ocenter_invite` VALUES (3405, 1, '6458665', 670, 1000000, 0, 1949478229, 1, 1633945429);
INSERT INTO `ocenter_invite` VALUES (3406, 1, '4335268', 689, 1000000, 1, 1949479444, 1, 1633946644);
INSERT INTO `ocenter_invite` VALUES (3407, 1, '1450017', 694, 1000000, 11, 1949483203, 1, 1633950403);
INSERT INTO `ocenter_invite` VALUES (3408, 1, '4673820', 697, 1000000, 2, 1949489258, 1, 1633956458);
INSERT INTO `ocenter_invite` VALUES (3409, 1, '5487749', 701, 1000000, 0, 1949497888, 1, 1633965087);
INSERT INTO `ocenter_invite` VALUES (3410, 1, '3039485', 702, 1000000, 0, 1949499512, 1, 1633966712);
INSERT INTO `ocenter_invite` VALUES (3411, 1, '4983132', 703, 1000000, 3, 1949499637, 1, 1633966837);
INSERT INTO `ocenter_invite` VALUES (3412, 1, '2424978', 704, 1000000, 0, 1949501658, 1, 1633968858);
INSERT INTO `ocenter_invite` VALUES (3413, 1, '5784713', 705, 1000000, 2, 1949505488, 1, 1633972688);
INSERT INTO `ocenter_invite` VALUES (3414, 1, '9253257', 706, 1000000, 0, 1949530707, 1, 1633997907);
INSERT INTO `ocenter_invite` VALUES (3415, 1, '0211401', 711, 1000000, 46, 1949537980, 1, 1634005180);
INSERT INTO `ocenter_invite` VALUES (3416, 1, '6003414', 713, 1000000, 0, 1949540320, 1, 1634007520);
INSERT INTO `ocenter_invite` VALUES (3417, 1, '6056653', 714, 1000000, 2, 1949541566, 1, 1634008766);
INSERT INTO `ocenter_invite` VALUES (3418, 1, '7293440', 717, 1000000, 4, 1949542186, 1, 1634009386);
INSERT INTO `ocenter_invite` VALUES (3419, 1, '6852827', 722, 1000000, 1, 1949542901, 1, 1634010101);
INSERT INTO `ocenter_invite` VALUES (3420, 1, '7652632', 730, 1000000, 3, 1949547769, 1, 1634014969);
INSERT INTO `ocenter_invite` VALUES (3421, 1, '6311479', 729, 1000000, 0, 1949548976, 1, 1634016176);
INSERT INTO `ocenter_invite` VALUES (3422, 1, '1446605', 733, 1000000, 0, 1949549763, 1, 1634016963);
INSERT INTO `ocenter_invite` VALUES (3423, 1, '3174849', 741, 1000000, 1, 1949549780, 1, 1634016980);
INSERT INTO `ocenter_invite` VALUES (3424, 1, '5232884', 744, 1000000, 0, 1949550185, 1, 1634017385);
INSERT INTO `ocenter_invite` VALUES (3425, 1, '5071005', 746, 1000000, 0, 1949550226, 1, 1634017426);
INSERT INTO `ocenter_invite` VALUES (3426, 1, '7914270', 737, 1000000, 0, 1949550282, 1, 1634017482);
INSERT INTO `ocenter_invite` VALUES (3427, 1, '1755231', 742, 1000000, 4, 1949551595, 1, 1634018795);
INSERT INTO `ocenter_invite` VALUES (3428, 1, '6773219', 736, 1000000, 0, 1949552238, 1, 1634019438);
INSERT INTO `ocenter_invite` VALUES (3429, 1, '9601181', 755, 1000000, 0, 1949552856, 1, 1634020056);
INSERT INTO `ocenter_invite` VALUES (3430, 1, '3474448', 749, 1000000, 1, 1949553214, 1, 1634020414);
INSERT INTO `ocenter_invite` VALUES (3431, 1, '2486031', 745, 1000000, 0, 1949556113, 1, 1634023313);
INSERT INTO `ocenter_invite` VALUES (3432, 1, '4936141', 653, 1000000, 0, 1949556249, 1, 1634023449);
INSERT INTO `ocenter_invite` VALUES (3433, 1, '0468301', 479, 1000000, 7, 1949561149, 1, 1634028349);
INSERT INTO `ocenter_invite` VALUES (3434, 1, '3149010', 743, 1000000, 0, 1949563057, 1, 1634030257);
INSERT INTO `ocenter_invite` VALUES (3435, 1, '1878342', 769, 1000000, 0, 1949563800, 1, 1634031000);
INSERT INTO `ocenter_invite` VALUES (3436, 1, '9631314', 778, 1000000, 1, 1949569720, 1, 1634036920);
INSERT INTO `ocenter_invite` VALUES (3437, 1, '0793370', 779, 1000000, 2, 1949570093, 1, 1634037293);
INSERT INTO `ocenter_invite` VALUES (3438, 1, '7782353', 777, 1000000, 2, 1949570368, 1, 1634037568);
INSERT INTO `ocenter_invite` VALUES (3439, 1, '8396225', 661, 1000000, 0, 1949590463, 1, 1634057663);
INSERT INTO `ocenter_invite` VALUES (3440, 1, '4630330', 727, 1000000, 0, 1949617844, 1, 1634085044);
INSERT INTO `ocenter_invite` VALUES (3441, 1, '5423602', 707, 1000000, 1, 1949620438, 1, 1634087638);
INSERT INTO `ocenter_invite` VALUES (3442, 1, '8399105', 795, 1000000, 1, 1949632285, 1, 1634099485);
INSERT INTO `ocenter_invite` VALUES (3443, 1, '5673582', 796, 1000000, 4, 1949633239, 1, 1634100439);
INSERT INTO `ocenter_invite` VALUES (3444, 1, '4561298', 798, 1000000, 1, 1949635037, 1, 1634102237);
INSERT INTO `ocenter_invite` VALUES (3445, 1, '5829659', 787, 1000000, 2, 1949640542, 1, 1634107742);
INSERT INTO `ocenter_invite` VALUES (3446, 1, '4318262', 805, 1000000, 8, 1949641296, 1, 1634108496);
INSERT INTO `ocenter_invite` VALUES (3447, 1, '3635069', 809, 1000000, 0, 1949643482, 1, 1634110682);
INSERT INTO `ocenter_invite` VALUES (3448, 1, '1929375', 810, 1000000, 0, 1949643563, 1, 1634110763);
INSERT INTO `ocenter_invite` VALUES (3449, 1, '3914163', 808, 1000000, 0, 1949643770, 1, 1634110970);
INSERT INTO `ocenter_invite` VALUES (3450, 1, '2135440', 814, 1000000, 0, 1949644017, 1, 1634111217);
INSERT INTO `ocenter_invite` VALUES (3451, 1, '8380378', 813, 1000000, 0, 1949644328, 1, 1634111528);
INSERT INTO `ocenter_invite` VALUES (3452, 1, '8135184', 815, 1000000, 0, 1949644662, 1, 1634111862);
INSERT INTO `ocenter_invite` VALUES (3453, 1, '1232605', 817, 1000000, 0, 1949646573, 1, 1634113773);
INSERT INTO `ocenter_invite` VALUES (3454, 1, '8553043', 812, 1000000, 2, 1949646674, 1, 1634113874);
INSERT INTO `ocenter_invite` VALUES (3455, 1, '0670178', 818, 1000000, 8, 1949646692, 1, 1634113891);
INSERT INTO `ocenter_invite` VALUES (3456, 1, '8429085', 799, 1000000, 5, 1949649739, 1, 1634116939);
INSERT INTO `ocenter_invite` VALUES (3457, 1, '1635944', 825, 1000000, 1, 1949658010, 1, 1634125210);
INSERT INTO `ocenter_invite` VALUES (3458, 1, '7653897', 824, 1000000, 1, 1949658765, 1, 1634125965);
INSERT INTO `ocenter_invite` VALUES (3459, 1, '3978985', 826, 1000000, 0, 1949659528, 1, 1634126728);
INSERT INTO `ocenter_invite` VALUES (3460, 1, '1313206', 829, 1000000, 0, 1949663360, 1, 1634130560);
INSERT INTO `ocenter_invite` VALUES (3461, 1, '3913304', 831, 1000000, 0, 1949663496, 1, 1634130696);
INSERT INTO `ocenter_invite` VALUES (3462, 1, '2561146', 833, 1000000, 3, 1949715314, 1, 1634182514);
INSERT INTO `ocenter_invite` VALUES (3463, 1, '5542063', 260, 1000000, 1, 1949718395, 1, 1634185595);
INSERT INTO `ocenter_invite` VALUES (3464, 1, '9618423', 838, 1000000, 0, 1949718791, 1, 1634185991);
INSERT INTO `ocenter_invite` VALUES (3465, 1, '0766422', 836, 1000000, 2, 1949719438, 1, 1634186638);
INSERT INTO `ocenter_invite` VALUES (3466, 1, '8290473', 724, 1000000, 0, 1949724270, 1, 1634191470);
INSERT INTO `ocenter_invite` VALUES (3467, 1, '4658631', 794, 1000000, 2, 1949732933, 1, 1634200133);
INSERT INTO `ocenter_invite` VALUES (3468, 1, '5980372', 855, 1000000, 0, 1949746195, 1, 1634213395);
INSERT INTO `ocenter_invite` VALUES (3469, 1, '6893158', 860, 1000000, 2, 1949783673, 1, 1634250873);
INSERT INTO `ocenter_invite` VALUES (3470, 1, '7456130', 861, 1000000, 2, 1949791222, 1, 1634258422);
INSERT INTO `ocenter_invite` VALUES (3471, 1, '7487217', 865, 1000000, 1, 1949797950, 1, 1634265150);
INSERT INTO `ocenter_invite` VALUES (3472, 1, '1732593', 867, 1000000, 0, 1949799956, 1, 1634267156);
INSERT INTO `ocenter_invite` VALUES (3473, 1, '8098500', 871, 1000000, 0, 1949806629, 1, 1634273829);
INSERT INTO `ocenter_invite` VALUES (3474, 1, '6361793', 870, 1000000, 0, 1949806645, 1, 1634273845);
INSERT INTO `ocenter_invite` VALUES (3475, 1, '4015957', 874, 1000000, 26, 1949821819, 1, 1634289019);
INSERT INTO `ocenter_invite` VALUES (3476, 1, '1300655', 868, 1000000, 4, 1949825236, 1, 1634292436);
INSERT INTO `ocenter_invite` VALUES (3477, 1, '1088232', 880, 1000000, 0, 1949829324, 1, 1634296524);
INSERT INTO `ocenter_invite` VALUES (3478, 1, '3773951', 888, 1000000, 3, 1949843770, 1, 1634310970);
INSERT INTO `ocenter_invite` VALUES (3479, 1, '3944805', 891, 1000000, 3, 1949894333, 1, 1634361533);
INSERT INTO `ocenter_invite` VALUES (3480, 1, '5458116', 895, 1000000, 3, 1949907246, 1, 1634374446);
INSERT INTO `ocenter_invite` VALUES (3481, 1, '9631703', 897, 1000000, 0, 1949909344, 1, 1634376544);
INSERT INTO `ocenter_invite` VALUES (3482, 1, '4093131', 894, 1000000, 2, 1949910344, 1, 1634377544);
INSERT INTO `ocenter_invite` VALUES (3483, 1, '6076301', 899, 1000000, 0, 1949910563, 1, 1634377763);
INSERT INTO `ocenter_invite` VALUES (3484, 1, '0624247', 902, 1000000, 1, 1949921732, 1, 1634388932);
INSERT INTO `ocenter_invite` VALUES (3485, 1, '0663153', 901, 1000000, 0, 1949931368, 1, 1634398568);
INSERT INTO `ocenter_invite` VALUES (3486, 1, '9474006', 915, 1000000, 3, 1949979872, 1, 1634447072);
INSERT INTO `ocenter_invite` VALUES (3487, 1, '9918925', 917, 1000000, 0, 1949981509, 1, 1634448709);
INSERT INTO `ocenter_invite` VALUES (3488, 1, '9057208', 875, 1000000, 3, 1949991890, 1, 1634459090);
INSERT INTO `ocenter_invite` VALUES (3489, 1, '9233322', 920, 1000000, 0, 1949993144, 1, 1634460344);
INSERT INTO `ocenter_invite` VALUES (3490, 1, '9665203', 922, 1000000, 3, 1949995414, 1, 1634462614);
INSERT INTO `ocenter_invite` VALUES (3491, 1, '1924806', 925, 1000000, 2, 1949996232, 1, 1634463432);
INSERT INTO `ocenter_invite` VALUES (3492, 1, '5111440', 863, 1000000, 0, 1950001079, 1, 1634468279);
INSERT INTO `ocenter_invite` VALUES (3493, 1, '2064913', 928, 1000000, 0, 1950006525, 1, 1634473725);
INSERT INTO `ocenter_invite` VALUES (3494, 1, '8519797', 927, 1000000, 0, 1950011693, 1, 1634478893);
INSERT INTO `ocenter_invite` VALUES (3495, 1, '9177382', 947, 1000000, 0, 1950060322, 1, 1634527522);
INSERT INTO `ocenter_invite` VALUES (3496, 1, '7989818', 949, 1000000, 2, 1950060857, 1, 1634528057);
INSERT INTO `ocenter_invite` VALUES (3497, 1, '3064189', 950, 1000000, 0, 1950063067, 1, 1634530267);
INSERT INTO `ocenter_invite` VALUES (3498, 1, '8215600', 948, 1000000, 2, 1950066050, 1, 1634533250);
INSERT INTO `ocenter_invite` VALUES (3499, 1, '2528262', 953, 1000000, 2, 1950068688, 1, 1634535888);
INSERT INTO `ocenter_invite` VALUES (3500, 1, '9751854', 954, 1000000, 0, 1950071423, 1, 1634538623);
INSERT INTO `ocenter_invite` VALUES (3501, 1, '7969168', 956, 1000000, 0, 1950072648, 1, 1634539848);
INSERT INTO `ocenter_invite` VALUES (3502, 1, '7729048', 958, 1000000, 15, 1950073419, 1, 1634540619);
INSERT INTO `ocenter_invite` VALUES (3503, 1, '4891590', 598, 1000000, 4, 1950074065, 1, 1634541265);
INSERT INTO `ocenter_invite` VALUES (3504, 1, '8650997', 965, 1000000, 0, 1950078236, 1, 1634545436);
INSERT INTO `ocenter_invite` VALUES (3505, 1, '5873995', 971, 1000000, 3, 1950079870, 1, 1634547070);
INSERT INTO `ocenter_invite` VALUES (3506, 1, '3522003', 536, 1000000, 0, 1950080720, 1, 1634547920);
INSERT INTO `ocenter_invite` VALUES (3507, 1, '8756888', 962, 1000000, 0, 1950083152, 1, 1634550352);
INSERT INTO `ocenter_invite` VALUES (3508, 1, '4766126', 975, 1000000, 1, 1950084225, 1, 1634551425);
INSERT INTO `ocenter_invite` VALUES (3509, 1, '5866243', 980, 1000000, 1, 1950092650, 1, 1634559850);
INSERT INTO `ocenter_invite` VALUES (3510, 1, '0472303', 976, 1000000, 3, 1950092657, 1, 1634559857);
INSERT INTO `ocenter_invite` VALUES (3511, 1, '3304716', 970, 1000000, 1, 1950094194, 1, 1634561394);
INSERT INTO `ocenter_invite` VALUES (3512, 1, '4601831', 973, 1000000, 5, 1950104339, 1, 1634571539);
INSERT INTO `ocenter_invite` VALUES (3513, 1, '6737910', 693, 1000000, 0, 1950138284, 1, 1634605484);
INSERT INTO `ocenter_invite` VALUES (3514, 1, '4977941', 242, 1000000, 4, 1950140232, 1, 1634607432);
INSERT INTO `ocenter_invite` VALUES (3515, 1, '6129109', 997, 1000000, 0, 1950141895, 1, 1634609095);
INSERT INTO `ocenter_invite` VALUES (3516, 1, '0059075', 996, 1000000, 3, 1950145478, 1, 1634612678);
INSERT INTO `ocenter_invite` VALUES (3517, 1, '2620276', 1003, 1000000, 0, 1950156639, 1, 1634623839);
INSERT INTO `ocenter_invite` VALUES (3518, 1, '4557013', 987, 1000000, 1, 1950167024, 1, 1634634224);
INSERT INTO `ocenter_invite` VALUES (3519, 1, '2431554', 1009, 1000000, 0, 1950179975, 1, 1634647175);
INSERT INTO `ocenter_invite` VALUES (3520, 1, '9039126', 1008, 1000000, 3, 1950181504, 1, 1634648704);
INSERT INTO `ocenter_invite` VALUES (3521, 1, '8560709', 1010, 1000000, 0, 1950181674, 1, 1634648874);
INSERT INTO `ocenter_invite` VALUES (3522, 1, '3881884', 1012, 1000000, 4, 1950183857, 1, 1634651057);
INSERT INTO `ocenter_invite` VALUES (3523, 1, '0477088', 1013, 1000000, 7, 1950184925, 1, 1634652125);
INSERT INTO `ocenter_invite` VALUES (3524, 1, '8125065', 960, 1000000, 0, 1950185646, 1, 1634652846);
INSERT INTO `ocenter_invite` VALUES (3525, 1, '6242756', 1016, 1000000, 3, 1950186057, 1, 1634653257);
INSERT INTO `ocenter_invite` VALUES (3526, 1, '3599467', 117, 1000000, 0, 1950186629, 1, 1634653829);
INSERT INTO `ocenter_invite` VALUES (3527, 1, '1422597', 738, 1000000, 1, 1950189062, 1, 1634656262);
INSERT INTO `ocenter_invite` VALUES (3528, 1, '9701445', 1028, 1000000, 5, 1950230270, 1, 1634697470);
INSERT INTO `ocenter_invite` VALUES (3529, 1, '6546425', 1023, 1000000, 0, 1950232516, 1, 1634699716);
INSERT INTO `ocenter_invite` VALUES (3530, 1, '3724941', 1032, 1000000, 0, 1950234383, 1, 1634701583);
INSERT INTO `ocenter_invite` VALUES (3531, 1, '6374094', 623, 1000000, 4, 1950241468, 1, 1634708668);
INSERT INTO `ocenter_invite` VALUES (3532, 1, '0438628', 994, 1000000, 0, 1950241846, 1, 1634709046);
INSERT INTO `ocenter_invite` VALUES (3533, 1, '8857690', 1035, 1000000, 0, 1950243644, 1, 1634710844);
INSERT INTO `ocenter_invite` VALUES (3534, 1, '8215109', 1033, 1000000, 0, 1950260605, 1, 1634727805);
INSERT INTO `ocenter_invite` VALUES (3535, 1, '1966028', 1046, 1000000, 1, 1950324579, 1, 1634791779);
INSERT INTO `ocenter_invite` VALUES (3536, 1, '9409926', 1048, 1000000, 1, 1950326879, 1, 1634794079);
INSERT INTO `ocenter_invite` VALUES (3537, 1, '6792489', 1050, 1000000, 0, 1950327648, 1, 1634794848);
INSERT INTO `ocenter_invite` VALUES (3538, 1, '8219132', 1051, 1000000, 1, 1950337305, 1, 1634804505);
INSERT INTO `ocenter_invite` VALUES (3539, 1, '3249515', 1052, 1000000, 0, 1950337641, 1, 1634804841);
INSERT INTO `ocenter_invite` VALUES (3540, 1, '1115642', 1053, 1000000, 0, 1950338688, 1, 1634805888);
INSERT INTO `ocenter_invite` VALUES (3541, 1, '5036256', 957, 1000000, 1, 1950339681, 1, 1634806881);
INSERT INTO `ocenter_invite` VALUES (3542, 1, '1901739', 1054, 1000000, 0, 1950340334, 1, 1634807534);
INSERT INTO `ocenter_invite` VALUES (3543, 1, '5327356', 1040, 1000000, 0, 1950346179, 1, 1634813379);
INSERT INTO `ocenter_invite` VALUES (3544, 1, '6475528', 570, 1000000, 0, 1950348736, 1, 1634815936);
INSERT INTO `ocenter_invite` VALUES (3545, 1, '9555887', 308, 1000000, 0, 1950350539, 1, 1634817739);
INSERT INTO `ocenter_invite` VALUES (3546, 1, '2255484', 1057, 1000000, 0, 1950359616, 1, 1634826816);
INSERT INTO `ocenter_invite` VALUES (3547, 1, '8999778', 1059, 1000000, 0, 1950359972, 1, 1634827172);
INSERT INTO `ocenter_invite` VALUES (3548, 1, '0073984', 1045, 1000000, 0, 1950391139, 1, 1634858339);
INSERT INTO `ocenter_invite` VALUES (3549, 1, '2568771', 1062, 1000000, 0, 1950416939, 1, 1634884139);
INSERT INTO `ocenter_invite` VALUES (3550, 1, '3572759', 827, 1000000, 2, 1950422812, 1, 1634890012);
INSERT INTO `ocenter_invite` VALUES (3551, 1, '9706858', 1067, 1000000, 1, 1950424497, 1, 1634891697);
INSERT INTO `ocenter_invite` VALUES (3552, 1, '6091646', 1063, 1000000, 1, 1950424648, 1, 1634891848);
INSERT INTO `ocenter_invite` VALUES (3553, 1, '5067661', 1065, 1000000, 0, 1950425586, 1, 1634892786);
INSERT INTO `ocenter_invite` VALUES (3554, 1, '1542328', 1061, 1000000, 3, 1950503471, 1, 1634970671);
INSERT INTO `ocenter_invite` VALUES (3555, 1, '3556615', 1082, 1000000, 3, 1950503840, 1, 1634971039);
INSERT INTO `ocenter_invite` VALUES (3556, 1, '7480812', 1087, 1000000, 1, 1950505389, 1, 1634972589);
INSERT INTO `ocenter_invite` VALUES (3557, 1, '8058905', 1088, 1000000, 1, 1950505904, 1, 1634973104);
INSERT INTO `ocenter_invite` VALUES (3558, 1, '2509361', 1089, 1000000, 0, 1950511084, 1, 1634978284);
INSERT INTO `ocenter_invite` VALUES (3559, 1, '9730259', 1075, 1000000, 2, 1950517929, 1, 1634985129);
INSERT INTO `ocenter_invite` VALUES (3560, 1, '5980742', 1091, 1000000, 0, 1950519069, 1, 1634986269);
INSERT INTO `ocenter_invite` VALUES (3561, 1, '9215275', 1021, 1000000, 1, 1950565333, 1, 1635032533);
INSERT INTO `ocenter_invite` VALUES (3562, 1, '6967111', 1099, 1000000, 0, 1950596789, 1, 1635063989);
INSERT INTO `ocenter_invite` VALUES (3563, 1, '2191641', 1101, 1000000, 10, 1950600232, 1, 1635067432);
INSERT INTO `ocenter_invite` VALUES (3564, 1, '7546068', 1103, 1000000, 5, 1950601993, 1, 1635069193);
INSERT INTO `ocenter_invite` VALUES (3565, 1, '1771397', 1104, 1000000, 0, 1950602215, 1, 1635069415);
INSERT INTO `ocenter_invite` VALUES (3566, 1, '0801451', 1107, 1000000, 0, 1950602364, 1, 1635069564);
INSERT INTO `ocenter_invite` VALUES (3567, 1, '5457458', 1105, 1000000, 0, 1950602485, 1, 1635069685);
INSERT INTO `ocenter_invite` VALUES (3568, 1, '2474610', 1102, 1000000, 5, 1950602688, 1, 1635069888);
INSERT INTO `ocenter_invite` VALUES (3569, 1, '6194564', 1108, 1000000, 4, 1950602695, 1, 1635069895);
INSERT INTO `ocenter_invite` VALUES (3570, 1, '3813562', 1110, 1000000, 2, 1950603410, 1, 1635070609);
INSERT INTO `ocenter_invite` VALUES (3571, 1, '9568941', 1112, 1000000, 0, 1950603645, 1, 1635070845);
INSERT INTO `ocenter_invite` VALUES (3572, 1, '8955085', 1115, 1000000, 1, 1950603861, 1, 1635071061);
INSERT INTO `ocenter_invite` VALUES (3573, 1, '2109916', 1116, 1000000, 5, 1950603959, 1, 1635071159);
INSERT INTO `ocenter_invite` VALUES (3574, 1, '7959815', 1117, 1000000, 1, 1950603963, 1, 1635071163);
INSERT INTO `ocenter_invite` VALUES (3575, 1, '1305551', 1118, 1000000, 0, 1950604229, 1, 1635071429);
INSERT INTO `ocenter_invite` VALUES (3576, 1, '6366419', 1114, 1000000, 0, 1950605095, 1, 1635072295);
INSERT INTO `ocenter_invite` VALUES (3577, 1, '3074010', 1123, 1000000, 0, 1950607186, 1, 1635074386);
INSERT INTO `ocenter_invite` VALUES (3578, 1, '8071269', 1126, 1000000, 10, 1950608778, 1, 1635075977);
INSERT INTO `ocenter_invite` VALUES (3579, 1, '0431660', 1127, 1000000, 1, 1950609592, 1, 1635076792);
INSERT INTO `ocenter_invite` VALUES (3580, 1, '2043579', 1132, 1000000, 1, 1950614081, 1, 1635081281);
INSERT INTO `ocenter_invite` VALUES (3581, 1, '9904997', 1140, 1000000, 0, 1950616437, 1, 1635083637);
INSERT INTO `ocenter_invite` VALUES (3582, 1, '1607987', 1136, 1000000, 1, 1950616618, 1, 1635083817);
INSERT INTO `ocenter_invite` VALUES (3583, 1, '0596325', 1144, 1000000, 0, 1950618970, 1, 1635086170);
INSERT INTO `ocenter_invite` VALUES (3584, 1, '4461506', 1131, 1000000, 2, 1950620154, 1, 1635087354);
INSERT INTO `ocenter_invite` VALUES (3585, 1, '1983063', 1151, 1000000, 2, 1950628361, 1, 1635095561);
INSERT INTO `ocenter_invite` VALUES (3586, 1, '7172399', 1147, 1000000, 5, 1950650876, 1, 1635118076);
INSERT INTO `ocenter_invite` VALUES (3587, 1, '9984252', 1154, 1000000, 1, 1950652369, 1, 1635119569);
INSERT INTO `ocenter_invite` VALUES (3588, 1, '0378468', 1155, 1000000, 1, 1950653997, 1, 1635121197);
INSERT INTO `ocenter_invite` VALUES (3589, 1, '6951747', 1157, 1000000, 1, 1950657388, 1, 1635124588);
INSERT INTO `ocenter_invite` VALUES (3590, 1, '9331006', 1159, 1000000, 3, 1950661410, 1, 1635128610);
INSERT INTO `ocenter_invite` VALUES (3591, 1, '1788508', 1160, 1000000, 6, 1950663535, 1, 1635130735);
INSERT INTO `ocenter_invite` VALUES (3592, 1, '0416168', 1166, 1000000, 1, 1950665555, 1, 1635132755);
INSERT INTO `ocenter_invite` VALUES (3593, 1, '9275624', 1172, 1000000, 0, 1950666936, 1, 1635134136);
INSERT INTO `ocenter_invite` VALUES (3594, 1, '9701401', 1173, 1000000, 12, 1950667036, 1, 1635134236);
INSERT INTO `ocenter_invite` VALUES (3595, 1, '4099776', 1171, 1000000, 0, 1950668238, 1, 1635135438);
INSERT INTO `ocenter_invite` VALUES (3596, 1, '7771480', 1177, 1000000, 0, 1950670090, 1, 1635137290);
INSERT INTO `ocenter_invite` VALUES (3597, 1, '5404227', 1180, 1000000, 0, 1950672396, 1, 1635139596);
INSERT INTO `ocenter_invite` VALUES (3598, 1, '4287014', 1182, 1000000, 0, 1950674122, 1, 1635141322);
INSERT INTO `ocenter_invite` VALUES (3599, 1, '5484774', 1185, 1000000, 2, 1950674741, 1, 1635141941);
INSERT INTO `ocenter_invite` VALUES (3600, 1, '9119706', 1188, 1000000, 2, 1950676016, 1, 1635143216);
INSERT INTO `ocenter_invite` VALUES (3601, 1, '6428746', 1193, 1000000, 0, 1950676964, 1, 1635144164);
INSERT INTO `ocenter_invite` VALUES (3602, 1, '1738171', 1192, 1000000, 0, 1950677331, 1, 1635144531);
INSERT INTO `ocenter_invite` VALUES (3603, 1, '9795644', 1194, 1000000, 0, 1950679479, 1, 1635146679);
INSERT INTO `ocenter_invite` VALUES (3604, 1, '2019116', 1195, 1000000, 16, 1950681629, 1, 1635148829);
INSERT INTO `ocenter_invite` VALUES (3605, 1, '1665058', 1197, 1000000, 3, 1950682013, 1, 1635149213);
INSERT INTO `ocenter_invite` VALUES (3606, 1, '1468593', 1202, 1000000, 1, 1950683480, 1, 1635150680);
INSERT INTO `ocenter_invite` VALUES (3607, 1, '6724333', 1201, 1000000, 8, 1950683513, 1, 1635150713);
INSERT INTO `ocenter_invite` VALUES (3608, 1, '1340807', 1207, 1000000, 4, 1950684585, 1, 1635151785);
INSERT INTO `ocenter_invite` VALUES (3609, 1, '8910465', 1206, 1000000, 2, 1950684783, 1, 1635151983);
INSERT INTO `ocenter_invite` VALUES (3610, 1, '9760103', 1217, 1000000, 2, 1950686774, 1, 1635153974);
INSERT INTO `ocenter_invite` VALUES (3611, 1, '2932849', 1216, 1000000, 3, 1950686987, 1, 1635154187);
INSERT INTO `ocenter_invite` VALUES (3612, 1, '7763718', 1205, 1000000, 0, 1950687807, 1, 1635155007);
INSERT INTO `ocenter_invite` VALUES (3613, 1, '9546030', 1211, 1000000, 0, 1950688636, 1, 1635155836);
INSERT INTO `ocenter_invite` VALUES (3614, 1, '5929030', 1227, 1000000, 0, 1950688680, 1, 1635155880);
INSERT INTO `ocenter_invite` VALUES (3615, 1, '1103648', 1225, 1000000, 1, 1950688694, 1, 1635155894);
INSERT INTO `ocenter_invite` VALUES (3616, 1, '9089661', 1226, 1000000, 1, 1950688883, 1, 1635156083);
INSERT INTO `ocenter_invite` VALUES (3617, 1, '0752556', 1219, 1000000, 2, 1950689004, 1, 1635156204);
INSERT INTO `ocenter_invite` VALUES (3618, 1, '6256386', 1218, 1000000, 0, 1950689221, 1, 1635156421);
INSERT INTO `ocenter_invite` VALUES (3619, 1, '4489243', 1230, 1000000, 0, 1950693579, 1, 1635160779);
INSERT INTO `ocenter_invite` VALUES (3620, 1, '1748504', 1237, 1000000, 0, 1950695464, 1, 1635162664);
INSERT INTO `ocenter_invite` VALUES (3621, 1, '7150007', 759, 1000000, 0, 1950696290, 1, 1635163490);
INSERT INTO `ocenter_invite` VALUES (3622, 1, '7224484', 1240, 1000000, 0, 1950697419, 1, 1635164619);
INSERT INTO `ocenter_invite` VALUES (3623, 1, '1484095', 1241, 1000000, 1, 1950697713, 1, 1635164913);
INSERT INTO `ocenter_invite` VALUES (3624, 1, '1885290', 1243, 1000000, 1, 1950702409, 1, 1635169609);
INSERT INTO `ocenter_invite` VALUES (3625, 1, '0735197', 1247, 1000000, 2, 1950705229, 1, 1635172429);
INSERT INTO `ocenter_invite` VALUES (3626, 1, '3141777', 1246, 1000000, 3, 1950705244, 1, 1635172444);
INSERT INTO `ocenter_invite` VALUES (3627, 1, '1570579', 1250, 1000000, 0, 1950706250, 1, 1635173450);
INSERT INTO `ocenter_invite` VALUES (3628, 1, '5609312', 1251, 1000000, 1, 1950707125, 1, 1635174325);
INSERT INTO `ocenter_invite` VALUES (3629, 1, '6745380', 1254, 1000000, 0, 1950730826, 1, 1635198026);
INSERT INTO `ocenter_invite` VALUES (3630, 1, '8654573', 1238, 1000000, 0, 1950734632, 1, 1635201832);
INSERT INTO `ocenter_invite` VALUES (3631, 1, '2647876', 1229, 1000000, 0, 1950738085, 1, 1635205284);
INSERT INTO `ocenter_invite` VALUES (3632, 1, '2481155', 1257, 1000000, 1, 1950743319, 1, 1635210519);
INSERT INTO `ocenter_invite` VALUES (3633, 1, '3717180', 1260, 1000000, 0, 1950748404, 1, 1635215604);
INSERT INTO `ocenter_invite` VALUES (3634, 1, '9302799', 1262, 1000000, 1, 1950752260, 1, 1635219459);
INSERT INTO `ocenter_invite` VALUES (3635, 1, '6241692', 1265, 1000000, 2, 1950756261, 1, 1635223461);
INSERT INTO `ocenter_invite` VALUES (3636, 1, '8455287', 1267, 1000000, 1, 1950758283, 1, 1635225483);
INSERT INTO `ocenter_invite` VALUES (3637, 1, '4409905', 1100, 1000000, 0, 1950778190, 1, 1635245390);
INSERT INTO `ocenter_invite` VALUES (3638, 1, '6595687', 498, 1000000, 2, 1950784849, 1, 1635252049);
INSERT INTO `ocenter_invite` VALUES (3639, 1, '3535705', 1280, 1000000, 3, 1950795145, 1, 1635262345);
INSERT INTO `ocenter_invite` VALUES (3640, 1, '7872559', 1281, 1000000, 0, 1950795750, 1, 1635262950);
INSERT INTO `ocenter_invite` VALUES (3641, 1, '7407807', 1282, 1000000, 4, 1950809814, 1, 1635277014);
INSERT INTO `ocenter_invite` VALUES (3642, 1, '2453318', 1285, 1000000, 2, 1950823409, 1, 1635290609);
INSERT INTO `ocenter_invite` VALUES (3643, 1, '8060149', 1288, 1000000, 2, 1950828815, 1, 1635296015);
INSERT INTO `ocenter_invite` VALUES (3644, 1, '9210883', 1290, 1000000, 0, 1950829726, 1, 1635296926);
INSERT INTO `ocenter_invite` VALUES (3645, 1, '9257759', 1286, 1000000, 2, 1950832882, 1, 1635300082);
INSERT INTO `ocenter_invite` VALUES (3646, 1, '4417304', 1291, 1000000, 0, 1950833067, 1, 1635300267);
INSERT INTO `ocenter_invite` VALUES (3647, 1, '6919778', 1042, 1000000, 3, 1950837605, 1, 1635304805);
INSERT INTO `ocenter_invite` VALUES (3648, 1, '5155184', 1294, 1000000, 0, 1950841970, 1, 1635309170);
INSERT INTO `ocenter_invite` VALUES (3649, 1, '1471675', 1298, 1000000, 3, 1950848508, 1, 1635315708);
INSERT INTO `ocenter_invite` VALUES (3650, 1, '5425622', 1300, 1000000, 2, 1950849015, 1, 1635316215);
INSERT INTO `ocenter_invite` VALUES (3651, 1, '3522240', 1301, 1000000, 0, 1950849429, 1, 1635316629);
INSERT INTO `ocenter_invite` VALUES (3652, 1, '6227753', 1299, 1000000, 1, 1950849971, 1, 1635317171);
INSERT INTO `ocenter_invite` VALUES (3653, 1, '8092862', 1303, 1000000, 2, 1950850656, 1, 1635317856);
INSERT INTO `ocenter_invite` VALUES (3654, 1, '2889714', 1305, 1000000, 1, 1950851566, 1, 1635318766);
INSERT INTO `ocenter_invite` VALUES (3655, 1, '5008095', 1309, 1000000, 0, 1950856568, 1, 1635323768);
INSERT INTO `ocenter_invite` VALUES (3656, 1, '1945389', 1296, 1000000, 3, 1950859893, 1, 1635327093);
INSERT INTO `ocenter_invite` VALUES (3657, 1, '4346233', 1315, 1000000, 4, 1950873751, 1, 1635340951);
INSERT INTO `ocenter_invite` VALUES (3658, 1, '3797057', 1319, 1000000, 0, 1950883130, 1, 1635350330);
INSERT INTO `ocenter_invite` VALUES (3659, 1, '2248018', 1320, 1000000, 2, 1950883357, 1, 1635350557);
INSERT INTO `ocenter_invite` VALUES (3660, 1, '5730249', 1324, 1000000, 0, 1950921429, 1, 1635388629);
INSERT INTO `ocenter_invite` VALUES (3661, 1, '2478939', 1325, 1000000, 5, 1950922783, 1, 1635389983);
INSERT INTO `ocenter_invite` VALUES (3662, 1, '7391251', 1328, 1000000, 0, 1950924158, 1, 1635391358);
INSERT INTO `ocenter_invite` VALUES (3663, 1, '0235611', 1321, 1000000, 4, 1950925457, 1, 1635392657);
INSERT INTO `ocenter_invite` VALUES (3664, 1, '8438517', 1332, 1000000, 2, 1950926558, 1, 1635393758);
INSERT INTO `ocenter_invite` VALUES (3665, 1, '5122275', 1340, 1000000, 0, 1950936877, 1, 1635404077);
INSERT INTO `ocenter_invite` VALUES (3666, 1, '0178284', 1341, 1000000, 0, 1950938897, 1, 1635406097);
INSERT INTO `ocenter_invite` VALUES (3667, 1, '0861657', 1344, 1000000, 3, 1950942565, 1, 1635409765);
INSERT INTO `ocenter_invite` VALUES (3668, 1, '9366054', 1346, 1000000, 0, 1950944774, 1, 1635411974);
INSERT INTO `ocenter_invite` VALUES (3669, 1, '1960439', 1347, 1000000, 0, 1950945021, 1, 1635412221);
INSERT INTO `ocenter_invite` VALUES (3670, 1, '9275692', 1322, 1000000, 1, 1950950857, 1, 1635418057);
INSERT INTO `ocenter_invite` VALUES (3671, 1, '9469930', 1041, 1000000, 0, 1950963828, 1, 1635431028);
INSERT INTO `ocenter_invite` VALUES (3672, 1, '9776731', 202, 1000000, 0, 1951005235, 1, 1635472435);
INSERT INTO `ocenter_invite` VALUES (3673, 1, '6324574', 1361, 1000000, 0, 1951012797, 1, 1635479997);
INSERT INTO `ocenter_invite` VALUES (3674, 1, '6527923', 1363, 1000000, 1, 1951013965, 1, 1635481165);
INSERT INTO `ocenter_invite` VALUES (3675, 1, '0067063', 811, 1000000, 0, 1951021814, 1, 1635489014);
INSERT INTO `ocenter_invite` VALUES (3676, 1, '0458428', 1369, 1000000, 0, 1951023716, 1, 1635490916);
INSERT INTO `ocenter_invite` VALUES (3677, 1, '4331896', 1376, 1000000, 0, 1951030431, 1, 1635497631);
INSERT INTO `ocenter_invite` VALUES (3678, 1, '3473779', 1379, 1000000, 2, 1951033737, 1, 1635500937);
INSERT INTO `ocenter_invite` VALUES (3679, 1, '8183234', 1384, 1000000, 0, 1951043105, 1, 1635510305);
INSERT INTO `ocenter_invite` VALUES (3680, 1, '3825689', 786, 1000000, 5, 1951047305, 1, 1635514505);
INSERT INTO `ocenter_invite` VALUES (3681, 1, '9935418', 1387, 1000000, 0, 1951085148, 1, 1635552348);
INSERT INTO `ocenter_invite` VALUES (3682, 1, '0208720', 900, 1000000, 0, 1951094180, 1, 1635561380);
INSERT INTO `ocenter_invite` VALUES (3683, 1, '5550873', 1390, 1000000, 1, 1951103777, 1, 1635570977);
INSERT INTO `ocenter_invite` VALUES (3684, 1, '0408023', 1392, 1000000, 4, 1951107149, 1, 1635574349);
INSERT INTO `ocenter_invite` VALUES (3685, 1, '4554568', 1396, 1000000, 0, 1951110882, 1, 1635578082);
INSERT INTO `ocenter_invite` VALUES (3686, 1, '1297096', 1397, 1000000, 1, 1951117052, 1, 1635584252);
INSERT INTO `ocenter_invite` VALUES (3687, 1, '4646881', 1398, 1000000, 0, 1951117479, 1, 1635584679);
INSERT INTO `ocenter_invite` VALUES (3688, 1, '0811444', 342, 1000000, 0, 1951119910, 1, 1635587110);
INSERT INTO `ocenter_invite` VALUES (3689, 1, '0945686', 906, 1000000, 0, 1951122535, 1, 1635589735);
INSERT INTO `ocenter_invite` VALUES (3690, 1, '6222524', 1402, 1000000, 0, 1951125977, 1, 1635593177);
INSERT INTO `ocenter_invite` VALUES (3691, 1, '0068848', 614, 1000000, 0, 1951127682, 1, 1635594882);
INSERT INTO `ocenter_invite` VALUES (3692, 1, '5968286', 1326, 1000000, 1, 1951130620, 1, 1635597820);
INSERT INTO `ocenter_invite` VALUES (3693, 1, '7923808', 1401, 1000000, 0, 1951131374, 1, 1635598574);
INSERT INTO `ocenter_invite` VALUES (3694, 1, '2669125', 364, 1000000, 0, 1951132748, 1, 1635599948);
INSERT INTO `ocenter_invite` VALUES (3695, 1, '8960149', 1413, 1000000, 0, 1951185267, 1, 1635652467);
INSERT INTO `ocenter_invite` VALUES (3696, 1, '6246453', 1130, 1000000, 0, 1951189046, 1, 1635656246);
INSERT INTO `ocenter_invite` VALUES (3697, 1, '6668305', 240, 1000000, 0, 1951196567, 1, 1635663767);
INSERT INTO `ocenter_invite` VALUES (3698, 1, '6638443', 1424, 1000000, 2, 1951198340, 1, 1635665540);
INSERT INTO `ocenter_invite` VALUES (3699, 1, '4571412', 1426, 1000000, 0, 1951198715, 1, 1635665915);
INSERT INTO `ocenter_invite` VALUES (3700, 1, '4549752', 1400, 1000000, 0, 1951199266, 1, 1635666466);
INSERT INTO `ocenter_invite` VALUES (3701, 1, '8282782', 1432, 1000000, 7, 1951200494, 1, 1635667694);
INSERT INTO `ocenter_invite` VALUES (3702, 1, '0474580', 1433, 1000000, 9, 1951201230, 1, 1635668430);
INSERT INTO `ocenter_invite` VALUES (3703, 1, '9078983', 1438, 1000000, 1, 1951201984, 1, 1635669184);
INSERT INTO `ocenter_invite` VALUES (3704, 1, '6529699', 1436, 1000000, 1, 1951202639, 1, 1635669839);
INSERT INTO `ocenter_invite` VALUES (3705, 1, '1324161', 1449, 1000000, 1, 1951209874, 1, 1635677074);
INSERT INTO `ocenter_invite` VALUES (3706, 1, '7573390', 832, 1000000, 1, 1951210577, 1, 1635677777);
INSERT INTO `ocenter_invite` VALUES (3707, 1, '8385891', 1454, 1000000, 2, 1951211131, 1, 1635678331);
INSERT INTO `ocenter_invite` VALUES (3708, 1, '8940536', 1366, 1000000, 1, 1951213642, 1, 1635680842);
INSERT INTO `ocenter_invite` VALUES (3709, 1, '6015536', 1457, 1000000, 7, 1951215108, 1, 1635682308);
INSERT INTO `ocenter_invite` VALUES (3710, 1, '5289853', 1094, 1000000, 1, 1951216811, 1, 1635684011);
INSERT INTO `ocenter_invite` VALUES (3711, 1, '3206229', 1423, 1000000, 0, 1951222703, 1, 1635689903);
INSERT INTO `ocenter_invite` VALUES (3712, 1, '5592440', 1453, 1000000, 1, 1951223080, 1, 1635690280);
INSERT INTO `ocenter_invite` VALUES (3713, 1, '8070719', 1461, 1000000, 5, 1951227838, 1, 1635695038);
INSERT INTO `ocenter_invite` VALUES (3714, 1, '6723953', 1462, 1000000, 0, 1951228707, 1, 1635695907);
INSERT INTO `ocenter_invite` VALUES (3715, 1, '9995757', 1468, 1000000, 5, 1951268725, 1, 1635735925);
INSERT INTO `ocenter_invite` VALUES (3716, 1, '3008300', 1394, 1000000, 0, 1951278460, 1, 1635745660);
INSERT INTO `ocenter_invite` VALUES (3717, 1, '1481583', 1470, 1000000, 2, 1951279325, 1, 1635746525);
INSERT INTO `ocenter_invite` VALUES (3718, 1, '2881808', 1476, 1000000, 5, 1951288139, 1, 1635755339);
INSERT INTO `ocenter_invite` VALUES (3719, 1, '7707821', 1480, 1000000, 1, 1951291757, 1, 1635758957);
INSERT INTO `ocenter_invite` VALUES (3720, 1, '3100918', 1482, 1000000, 1, 1951292528, 1, 1635759728);
INSERT INTO `ocenter_invite` VALUES (3721, 1, '5781581', 1073, 1000000, 0, 1951294277, 1, 1635761476);
INSERT INTO `ocenter_invite` VALUES (3722, 1, '1787962', 1485, 1000000, 1, 1951294727, 1, 1635761927);
INSERT INTO `ocenter_invite` VALUES (3723, 1, '6267821', 1488, 1000000, 1, 1951295125, 1, 1635762325);
INSERT INTO `ocenter_invite` VALUES (3724, 1, '3873588', 1489, 1000000, 1, 1951295620, 1, 1635762820);
INSERT INTO `ocenter_invite` VALUES (3725, 1, '7496779', 853, 1000000, 1, 1951302400, 1, 1635769600);
INSERT INTO `ocenter_invite` VALUES (3726, 1, '5653154', 1498, 1000000, 0, 1951302998, 1, 1635770198);
INSERT INTO `ocenter_invite` VALUES (3727, 1, '1970399', 1499, 1000000, 1, 1951305145, 1, 1635772345);
INSERT INTO `ocenter_invite` VALUES (3728, 1, '5553201', 1471, 1000000, 0, 1951305583, 1, 1635772783);
INSERT INTO `ocenter_invite` VALUES (3729, 1, '8221230', 1389, 1000000, 0, 1951309355, 1, 1635776555);
INSERT INTO `ocenter_invite` VALUES (3730, 1, '3694849', 1507, 1000000, 0, 1951379038, 1, 1635846238);
INSERT INTO `ocenter_invite` VALUES (3731, 1, '3878976', 413, 1000000, 0, 1951387733, 1, 1635854933);
INSERT INTO `ocenter_invite` VALUES (3732, 1, '7295558', 1442, 1000000, 0, 1951409783, 1, 1635876983);
INSERT INTO `ocenter_invite` VALUES (3733, 1, '0777212', 1517, 1000000, 0, 1951459971, 1, 1635927171);
INSERT INTO `ocenter_invite` VALUES (3734, 1, '3757055', 1520, 1000000, 0, 1951467978, 1, 1635935178);
INSERT INTO `ocenter_invite` VALUES (3735, 1, '8034187', 1522, 1000000, 0, 1951522469, 1, 1635989669);
INSERT INTO `ocenter_invite` VALUES (3736, 1, '1738628', 1421, 1000000, 0, 1951536557, 1, 1636003757);
INSERT INTO `ocenter_invite` VALUES (3737, 1, '3206191', 1391, 1000000, 0, 1951538718, 1, 1636005918);
INSERT INTO `ocenter_invite` VALUES (3738, 1, '6066345', 1525, 1000000, 2, 1951572285, 1, 1636039485);
INSERT INTO `ocenter_invite` VALUES (3739, 1, '2769139', 1269, 1000000, 0, 1951598383, 1, 1636065583);
INSERT INTO `ocenter_invite` VALUES (3740, 1, '2165443', 299, 1000000, 1, 1951636809, 1, 1636104009);
INSERT INTO `ocenter_invite` VALUES (3741, 1, '1211620', 1534, 1000000, 2, 1951732332, 1, 1636199532);
INSERT INTO `ocenter_invite` VALUES (3742, 1, '3849343', 367, 1000000, 1, 1951796607, 1, 1636263807);
INSERT INTO `ocenter_invite` VALUES (3743, 1, '6089470', 1542, 1000000, 0, 1951797301, 1, 1636264501);
INSERT INTO `ocenter_invite` VALUES (3744, 1, '4114768', 1545, 1000000, 0, 1951884199, 1, 1636351399);
INSERT INTO `ocenter_invite` VALUES (3745, 1, '1592634', 934, 1000000, 0, 1952428965, 1, 1636896165);
INSERT INTO `ocenter_invite` VALUES (3746, 1, '4259955', 1551, 1000000, 0, 1952463571, 1, 1636930771);
INSERT INTO `ocenter_invite` VALUES (3747, 1, '8037229', 1550, 1000000, 0, 1952524397, 1, 1636991597);
INSERT INTO `ocenter_invite` VALUES (3748, 1, '7848976', 1459, 1000000, 0, 1952742085, 1, 1637209285);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_invite_award_log
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_invite_award_log`;
CREATE TABLE `ocenter_invite_award_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` varchar(255) NOT NULL COMMENT '奖励类别',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(16) NOT NULL COMMENT '花费usdt 数量',
  `content` varchar(200) NOT NULL COMMENT '记录信息',
  `record_id` int(11) NOT NULL COMMENT '订单号',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户购买邀请名额记录';

-- ----------------------------
-- Records of ocenter_invite_award_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_invite_buy_log
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_invite_buy_log`;
CREATE TABLE `ocenter_invite_buy_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(10) NOT NULL COMMENT '可邀请名额',
  `content` varchar(200) NOT NULL COMMENT '记录信息',
  `create_time` int(11) NOT NULL COMMENT '创建时间（做频率用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户购买邀请名额记录';

-- ----------------------------
-- Records of ocenter_invite_buy_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_invite_log
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_invite_log`;
CREATE TABLE `ocenter_invite_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `inviter_id` int(11) NOT NULL COMMENT '邀请人id',
  `invite_id` int(11) NOT NULL COMMENT '邀请码id',
  `content` varchar(200) NOT NULL COMMENT '记录内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='邀请注册成功记录表';

-- ----------------------------
-- Records of ocenter_invite_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_invite_type
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_invite_type`;
CREATE TABLE `ocenter_invite_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `title` varchar(25) NOT NULL COMMENT '标题',
  `length` int(10) NOT NULL DEFAULT '11' COMMENT '验证码长度',
  `time` varchar(50) NOT NULL COMMENT '有效时长，带单位的时间',
  `cycle_num` int(10) NOT NULL COMMENT '周期内可购买个数',
  `cycle_time` varchar(50) NOT NULL COMMENT '周期时长，带单位的时间',
  `roles` varchar(50) NOT NULL COMMENT '绑定角色ids',
  `auth_groups` varchar(50) NOT NULL COMMENT '允许购买的权限组ids',
  `pay_score` int(10) NOT NULL COMMENT '购买消耗积分',
  `pay_score_type` int(11) NOT NULL COMMENT '购买消耗积分类型',
  `income_score` int(10) NOT NULL COMMENT '每邀请成功一个用户，邀请者增加积分',
  `income_score_type` int(11) NOT NULL COMMENT '邀请成功后增加积分类型id',
  `is_follow` tinyint(2) NOT NULL COMMENT '邀请成功后是否互相关注',
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='邀请注册码类型表';

-- ----------------------------
-- Records of ocenter_invite_type
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_invite_type` VALUES (1, '系统默认邀请码', 7, '10 year', 1, '1 second', '[1]', '[1],[2]', 0, 1, 10, 1, 1, 1, 1466749163, 1471247871);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_invite_user
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_invite_user`;
CREATE TABLE `ocenter_invite_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `invite_uid` int(11) NOT NULL DEFAULT '0',
  `invite_invite_uid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `award_level1_suanli` int(11) NOT NULL DEFAULT '0',
  `award_level2_suanli` int(11) NOT NULL,
  `is_award` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ocenter_invite_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_invite_user_info
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_invite_user_info`;
CREATE TABLE `ocenter_invite_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '可邀请名额',
  `already_num` int(11) NOT NULL COMMENT '已邀请名额',
  `success_num` int(11) NOT NULL COMMENT '成功邀请名额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='邀请注册用户信息';

-- ----------------------------
-- Records of ocenter_invite_user_info
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_invite_user_info` VALUES (98, 0, 123, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_member`;
CREATE TABLE `ocenter_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nftunit_id` char(10) NOT NULL,
  `nickname` char(200) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `last_login_role` int(11) NOT NULL,
  `show_role` int(11) NOT NULL COMMENT '个人主页显示角色',
  `signature` text NOT NULL,
  `pos_province` int(11) NOT NULL,
  `pos_city` int(11) NOT NULL,
  `pos_district` int(11) NOT NULL,
  `pos_community` int(11) NOT NULL,
  `score1` double DEFAULT '0' COMMENT '用户积分',
  `score2` double DEFAULT '0' COMMENT 'score2',
  `score3` double DEFAULT '0' COMMENT 'score3',
  `score4` double DEFAULT '0' COMMENT 'score4',
  `con_check` int(11) NOT NULL DEFAULT '0',
  `total_check` int(11) NOT NULL DEFAULT '0',
  `fans` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `session_id` varchar(225) NOT NULL,
  `alive_line` int(11) NOT NULL DEFAULT '0' COMMENT '用户禁用时间至该值',
  `brain_token` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `wallet_address` varchar(255) NOT NULL,
  `man_check` int(11) NOT NULL DEFAULT '0' COMMENT '真人测试 0假人，1真人',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`),
  KEY `name` (`nickname`)
) ENGINE=MyISAM AUTO_INCREMENT=1810 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of ocenter_member
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_member` VALUES (1, 'F0000000', 'god', 0, '', 413, 0, 1516788032, 2130706433, 1655456185, 1, 1, 1, '', 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, '1e287814f377bf6df56377d7845617c8', 0, 0.00000000, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_menu
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_menu`;
CREATE TABLE `ocenter_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `icon` varchar(20) DEFAULT NULL COMMENT '导航图标',
  `module` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=10184 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_menu
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_menu` VALUES (1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 'home', '');
INSERT INTO `ocenter_menu` VALUES (2, '用户与身份', 0, 2, 'User/index', 0, '', '', 0, 'user', '');
INSERT INTO `ocenter_menu` VALUES (3, '用户信息', 2, 2, 'User/index', 0, '', '用户配置', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (9, '禁用会员', 4, 0, 'User/changeStatus?method=forbidUser', 0, '\"用户->用户信息\"中的禁用', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (10, '启用会员', 4, 0, 'User/changeStatus?method=resumeUser', 0, '\"用户->用户信息\"中的启用', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (11, '删除会员', 4, 0, 'User/changeStatus?method=deleteUser', 0, '\"用户->用户信息\"中的删除', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (12, '权限组管理', 2, 5, 'AuthManager/index', 0, '', '用户配置', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (13, '删除', 12, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除权限组', '', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (14, '禁用', 12, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用权限组', '', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (15, '恢复', 12, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的权限组', '', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (16, '新增', 12, 0, 'AuthManager/createGroup', 0, '创建新的权限组', '', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (17, '编辑', 12, 0, 'AuthManager/editGroup', 0, '编辑权限组名称和描述', '', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (18, '保存权限组', 12, 0, 'AuthManager/writeGroup', 0, '新增和编辑权限组的\"保存\"按钮', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (19, '授权', 12, 0, 'AuthManager/group', 0, '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属权限组', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (20, '访问授权', 12, 0, 'AuthManager/access', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (21, '成员授权', 12, 0, 'AuthManager/user', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (22, '解除授权', 12, 0, 'AuthManager/removeFromGroup', 0, '\"成员授权\"列表页内的解除授权操作按钮', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (23, '保存成员授权', 12, 0, 'AuthManager/addToGroup', 0, '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (24, '分类授权', 12, 0, 'AuthManager/category', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (25, '保存分类授权', 12, 0, 'AuthManager/addToCategory', 0, '\"分类授权\"页面的\"保存\"按钮', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (26, '模型授权', 12, 0, 'AuthManager/modelauth', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (27, '保存模型授权', 12, 0, 'AuthManager/addToModel', 0, '\"分类授权\"页面的\"保存\"按钮', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (28, '新增权限节点', 12, 0, 'AuthManager/addNode', 1, '', '', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (29, '前台权限管理', 12, 0, 'AuthManager/accessUser', 1, '', '权限管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (30, '删除权限节点', 12, 0, 'AuthManager/deleteNode', 1, '', '', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (33, '修改密码', 2, 3, 'User/updatePassword', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (34, '修改昵称', 2, 4, 'User/updateNickname', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (40, '添加、编辑分组', 39, 0, 'Admin/User/editProfile', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (41, '分组排序', 39, 0, 'Admin/User/sortProfile', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (42, '字段列表', 39, 0, 'Admin/User/field', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (43, '添加、编辑字段', 39, 0, 'Admin/User/editFieldSetting', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (44, '字段排序', 39, 0, 'Admin/User/sortField', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (45, '用户扩展资料列表', 2, 7, 'User/expandinfo_select', 0, '', '标签与资料', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (46, '扩展资料详情', 45, 0, 'User/expandinfo_details', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (49, '转移权限组', 2, 7, 'User/changeGroup', 1, '批量转移权限组', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (50, '基础配置', 2, 1, 'UserConfig/index', 0, '', '用户配置', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (52, '新增/编辑类型', 197, 2, 'User/editScoreType', 1, '', '行为与积分', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (57, '插件管理', 105, 4, 'Addons/index', 0, '', '本地', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (58, '钩子管理', 57, 2, 'Addons/hooks', 0, '', '本地', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (59, '创建', 57, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (60, '检测创建', 57, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (61, '预览', 57, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (62, '快速生成插件', 57, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (64, '设置', 57, 0, 'Addons/config', 0, '设置插件配置', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (65, '禁用', 57, 0, 'Addons/disable', 0, '禁用插件', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (66, '启用', 57, 0, 'Addons/enable', 0, '启用插件', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (67, '安装', 57, 0, 'Addons/install', 0, '安装插件', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (68, '卸载', 57, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (69, '更新配置', 57, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (70, '插件后台列表', 57, 0, 'Addons/adminList', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (71, 'URL方式访问插件', 57, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (72, '新增钩子', 58, 0, 'Addons/addHook', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (73, '编辑钩子', 58, 0, 'Addons/edithook', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (74, '系统', 0, 7, 'Config/group', 1, '', '', 0, 'windows', '');
INSERT INTO `ocenter_menu` VALUES (76, '配置管理', 74, 7, 'Config/index', 0, '', '网站设置', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (77, '编辑', 76, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (78, '删除', 76, 0, 'Config/del', 0, '删除配置', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (79, '新增', 76, 0, 'Config/add', 0, '新增配置', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (80, '保存', 76, 0, 'Config/save', 0, '保存配置', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (81, '排序', 76, 0, 'Config/sort', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (82, '后台菜单管理', 74, 6, 'Menu/index', 0, '', '导航管理', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (83, '新增', 82, 0, 'Menu/add', 0, '', '系统设置', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (84, '编辑', 82, 0, 'Menu/edit', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (85, '导入', 82, 0, 'Menu/import', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (86, '排序', 82, 0, 'Menu/sort', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (91, '排序', 87, 0, 'Channel/sort', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (92, '备份数据库', 74, 8, 'Database/index?type=export', 0, '', '网站数据管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (93, '备份', 92, 0, 'Database/export', 0, '备份数据库', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (94, '优化表', 92, 0, 'Database/optimize', 0, '优化数据表', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (95, '修复表', 92, 0, 'Database/repair', 0, '修复数据表', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (96, '还原数据库', 74, 9, 'Database/index?type=import', 0, '', '网站数据管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (97, '恢复', 96, 0, 'Database/import', 0, '数据库恢复', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (98, '删除', 96, 0, 'Database/del', 0, '删除备份文件', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (99, 'SEO规则管理', 197, 8, 'SEO/index', 0, '', 'SEO管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (100, '新增、编辑', 99, 0, 'SEO/editRule', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (101, '排序', 99, 0, 'SEO/sortRule', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (102, 'SEO规则回收站', 197, 9, 'SEO/ruleTrash', 0, '', 'SEO管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (103, '全部补丁', 74, 16, 'Update/quick', 1, '', '升级补丁', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (104, '新增补丁', 74, 15, 'Update/addpack', 1, '', '升级补丁', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (105, '扩展', 0, 11, 'Cloud/index', 1, '', '', 0, 'cloud', '');
INSERT INTO `ocenter_menu` VALUES (106, '模块安装', 105, 3, 'module/install', 1, '', '本地', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (107, '模块管理', 105, 5, 'module/lists', 0, '', '本地', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (108, '卸载模块', 105, 7, 'module/uninstall', 1, '', '本地', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (109, '授权', 0, 6, 'authorize/ssoSetting', 1, '', '', 1, 'lock', '');
INSERT INTO `ocenter_menu` VALUES (110, '单点登录配置', 109, 0, 'Authorize/ssoSetting', 0, '', '单点登录', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (111, '应用列表', 109, 0, 'Authorize/ssolist', 0, '', '单点登录', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (112, '新增/编辑应用', 109, 0, 'authorize/editssoapp', 1, '', '单点登录', 1, '', '');
INSERT INTO `ocenter_menu` VALUES (117, '身份列表', 2, 1, 'Role/index', 0, '', '身份管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (118, '编辑身份', 2, 2, 'Role/editRole', 1, '', '身份管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (119, '启用、禁用、删除身份', 2, 3, 'Role/setStatus', 1, '', '身份管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (120, '身份排序', 2, 4, 'Role/sort', 1, '', '身份管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (126, '身份分组', 2, 5, 'Role/group', 0, '', '身份管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (127, '编辑分组', 126, 0, 'Role/editGroup', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (128, '删除分组', 126, 0, 'Role/deleteGroup', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (129, '身份基本信息配置', 2, 6, 'Role/config', 1, '', '身份管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (130, '用户身份归属列表', 2, 7, 'Role/userList', 0, '', '身份管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (131, '设置用户状态', 130, 0, 'Role/setUserStatus', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (132, '审核用户', 130, 0, 'Role/setUserAudit', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (133, '迁移用户', 130, 0, 'Role/changeRole', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (134, '上传默认头像', 123, 0, 'Role/uploadPicture', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (146, '导出cvs', 136, 0, 'Invite/cvs', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (147, '用户信息编辑', 140, 0, 'Invite/editUserInfo', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (148, '删除日志', 31, 0, 'Action/remove', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (149, '清空日志', 31, 0, 'Action/clear', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (153, '删除菜单', 82, 0, 'Menu/del', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (154, '设置开发者模式可见', 82, 0, 'Menu/toogleDev', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (155, '设置显示隐藏', 82, 0, 'Menu/toogleHide', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (156, '行为限制启用、禁用、删除', 114, 0, 'ActionLimit/setLimitStatus', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (157, '启用、禁用、删除、回收站还原', 99, 0, 'SEO/setRuleStatus', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (158, '回收站彻底删除', 102, 0, 'SEO/doClear', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (159, '初始化无角色用户', 130, 0, 'Role/initUnhaveUser', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (160, '删除钩子', 58, 0, 'Addons/delHook', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (161, '使用补丁', 103, 0, 'Update/usePack', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (162, '查看补丁', 103, 0, 'Update/view', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (163, '删除补丁', 103, 0, 'Update/delPack', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (170, '编辑模块', 107, 0, 'Module/edit', 1, '', '模块管理', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (197, '运营', 0, 4, 'Super_links/index', 1, '', '', 0, 'laptop', '');
INSERT INTO `ocenter_menu` VALUES (201, '重置用户密码', 3, 0, 'User/initpass', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (225, '广告位', 197, 0, 'Adv/pos', 0, '', '广告配置', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (226, '广告管理', 197, 0, 'Adv/adv', 0, '', '广告配置', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (227, '新增广告', 226, 0, 'Adv/editAdv', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (228, '编辑广告位', 225, 0, 'Adv/editPos', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (229, '设置广告位状态', 225, 0, 'Adv/setPosStatus', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (230, '广告排期', 226, 0, 'Adv/schedule', 1, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (233, '仪表盘', 1, 1, 'Index/index', 0, '', '系统首页', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (234, '数据概览', 1, 2, 'Index/stats', 0, '', '系统首页', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (243, '计划任务列表', 74, 99, 'admin/schedule/scheduleList', 0, '', '计划任务', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (244, '新增/编辑计划任务', 243, 0, 'Schedule/editSchedule', 1, '', '计划任务', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (245, '运行/停止计划任务', 243, 0, 'admin/schedule/run', 1, '', '计划任务', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (246, '查看日志', 243, 0, 'Schedule/showLog', 1, '', '计划任务', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (247, '清空日志', 243, 0, 'admin/schedule/clearLog', 1, '', '计划任务', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (248, '重启计划任务', 243, 0, 'Schedule/reRun', 1, '', '计划任务', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (249, '设置计划任务状态', 243, 0, 'Schedule/setScheduleStatus', 1, '', '计划任务', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (250, '网站统计', 1, 3, 'Count/index', 0, '', '数据统计', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (251, '流失率统计', 1, 4, 'Count/lost', 0, '', '数据统计', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (252, '留存率统计', 1, 5, 'Count/remain', 0, '', '数据统计', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (253, '充值用户统计', 1, 6, 'Count/consumption', 0, '', '数据统计', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (254, '活跃用户统计', 1, 7, 'Count/active', 0, '', '数据统计', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (255, '设置活跃度绑定的行为', 1, 0, 'Count/setActiveAction', 1, '', '数据统计', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (256, '在线用户列表', 1, 8, 'Count/nowUserList', 0, '', '数据统计', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (257, '下线在线用户', 1, 0, 'Count/downUser', 1, '', '数据统计', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (260, '添加', 233, 0, 'Index/addTo', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (261, '删除', 233, 0, 'Index/delTile', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (262, '修改', 233, 0, 'Index/setTile', 0, '', '', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (274, '允许身份访问', 1, 0, 'Role/moduleRole', 0, '', '模块权限', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (283, '编辑器配置', 74, 7, 'EditorTool/config', 0, '', '系统设置', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (284, 'MarkDown配置', 74, 7, 'MarkDown/config', 0, '', '系统设置', 0, '', '');
INSERT INTO `ocenter_menu` VALUES (10176, '用户删除', 10142, 2, 'Nftcn/deleteUser', 1, '', '用户管理', 0, NULL, 'Nftcn');
INSERT INTO `ocenter_menu` VALUES (10142, 'Nftcn', 0, 0, 'Nftcn/index', 0, '', '', 0, 'laptop', 'Nftcn');
INSERT INTO `ocenter_menu` VALUES (10160, '用户列表', 10142, 2, 'Nftcn/index', 0, '', '用户管理', 0, NULL, 'Nftcn');
INSERT INTO `ocenter_menu` VALUES (10159, '用户录入', 10142, 1, 'Nftunit/editUser', 1, '', '用户管理', 0, NULL, 'Nftcn');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_message
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_message`;
CREATE TABLE `ocenter_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `content` text NOT NULL,
  `reply_to` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `f_reply_id` int(11) NOT NULL,
  `to_reply_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_read` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_message
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_message` VALUES (1, 115, 106, '就是就是就是睡觉睡觉', '', 'replyPost', 27, 0, 0, 1630731090, 1, 1);
INSERT INTO `ocenter_message` VALUES (2, 115, 106, '山东衡水市', '', 'replyPost', 27, 0, 0, 1630731095, 1, 1);
INSERT INTO `ocenter_message` VALUES (3, 106, 115, '天热的负担', '山东衡水市', 'replyReply', 27, 49, 0, 1630731129, 1, 0);
INSERT INTO `ocenter_message` VALUES (4, 106, 115, '仿佛奋斗', '山东衡水市', 'replyReply', 27, 49, 0, 1630731137, 1, 0);
INSERT INTO `ocenter_message` VALUES (5, 115, 106, '护手霜就是就是', '仿佛奋斗', 'replyReply', 27, 49, 119, 1630731156, 1, 1);
INSERT INTO `ocenter_message` VALUES (6, 105, 115, 'shhsjssjsjsj', '山东衡水市', 'replyReply', 27, 49, 0, 1630825742, 1, 0);
INSERT INTO `ocenter_message` VALUES (7, 105, 115, 'yshshsbsb', '山东衡水市', 'replyReply', 27, 49, 0, 1630825780, 1, 0);
INSERT INTO `ocenter_message` VALUES (8, 105, 106, 'hshshsjsjs', '', 'replyPost', 27, 0, 0, 1630825820, 1, 1);
INSERT INTO `ocenter_message` VALUES (9, 105, 106, 'shhsjssjajaj', '', 'replyPost', 27, 0, 0, 1630825842, 1, 1);
INSERT INTO `ocenter_message` VALUES (10, 105, 106, 'hshssjsjsj', '', 'replyPost', 27, 0, 0, 1630826049, 1, 1);
INSERT INTO `ocenter_message` VALUES (11, 105, 106, 'jsjsjssjsjsj', '', 'replyPost', 27, 0, 0, 1630826338, 1, 1);
INSERT INTO `ocenter_message` VALUES (12, 105, 106, 'dhhdjdsjsn', '', 'replyPost', 27, 0, 0, 1630826469, 1, 1);
INSERT INTO `ocenter_message` VALUES (13, 105, 106, 'hxhdhsnsnsnwn', '', 'replyPost', 27, 0, 0, 1630826501, 1, 1);
INSERT INTO `ocenter_message` VALUES (14, 106, 105, '给您的回复点赞', 'hxhdhsnsnsnwn', 'replyReply', 27, 55, 0, 1630829818, 1, 1);
INSERT INTO `ocenter_message` VALUES (15, 106, 105, '给您的回复点赞', 'dhhdjdsjsn', 'replyReply', 27, 54, 0, 1630829824, 1, 1);
INSERT INTO `ocenter_message` VALUES (16, 106, 114, '厉害了，志同道合', '', 'replyPost', 29, 0, 0, 1630829880, 1, 0);
INSERT INTO `ocenter_message` VALUES (17, 106, 106, '给您的回复点赞', '厉害了，志同道合', 'replyReply', 29, 56, 0, 1630829892, 1, 1);
INSERT INTO `ocenter_message` VALUES (18, 106, 106, '干起来kkkk', '厉害了，志同道合', 'replyReply', 29, 56, 0, 1630829936, 1, 1);
INSERT INTO `ocenter_message` VALUES (19, 106, 106, '给您的回复点赞', '干起来kkkk', 'replyReply', 29, 56, 123, 1630830904, 1, 1);
INSERT INTO `ocenter_message` VALUES (20, 106, 106, '哈哈哈哈哈哈哈哈哈', '干起来kkkk', 'replyReply', 29, 56, 123, 1630831055, 1, 1);
INSERT INTO `ocenter_message` VALUES (21, 106, 106, '给您的回复点赞', '哈哈哈哈哈哈哈哈哈', 'replyReply', 29, 56, 124, 1630831058, 1, 1);
INSERT INTO `ocenter_message` VALUES (22, 105, 114, '给您的帖子点赞', '', 'replyPost', 29, 0, 0, 1630833141, 1, 0);
INSERT INTO `ocenter_message` VALUES (23, 105, 114, 'DMAN越做越好！', '', 'replyPost', 29, 0, 0, 1630835294, 1, 0);
INSERT INTO `ocenter_message` VALUES (24, 105, 114, '给您的帖子点赞', '', 'replyPost', 29, 0, 0, 1630835318, 1, 0);
INSERT INTO `ocenter_message` VALUES (25, 105, 106, '给您的回复点赞', '厉害了，志同道合', 'replyReply', 29, 56, 0, 1630835320, 1, 0);
INSERT INTO `ocenter_message` VALUES (26, 105, 105, '给您的回复点赞', 'DMAN越做越好！', 'replyReply', 29, 57, 0, 1630835321, 1, 1);
INSERT INTO `ocenter_message` VALUES (27, 105, 114, '顶起来！！', '', 'replyPost', 29, 0, 0, 1630835492, 1, 0);
INSERT INTO `ocenter_message` VALUES (28, 105, 105, '给您的回复点赞', '顶起来！！', 'replyReply', 29, 58, 0, 1630835520, 1, 1);
INSERT INTO `ocenter_message` VALUES (29, 105, 106, '你好，欢迎关注我', '哈哈哈哈哈哈哈哈哈', 'replyReply', 29, 56, 124, 1630835733, 1, 0);
INSERT INTO `ocenter_message` VALUES (30, 105, 105, '给您的回复点赞', '你好，欢迎关注我', 'replyReply', 29, 56, 125, 1630835754, 1, 1);
INSERT INTO `ocenter_message` VALUES (31, 105, 106, '给您的回复点赞', '哈哈哈哈哈哈哈哈哈', 'replyReply', 29, 56, 124, 1630835755, 1, 0);
INSERT INTO `ocenter_message` VALUES (32, 105, 106, '给您的回复点赞', '干起来kkkk', 'replyReply', 29, 56, 123, 1630835757, 1, 0);
INSERT INTO `ocenter_message` VALUES (33, 111, 111, '哈哈，哈哈哈', '', 'replyPost', 30, 0, 0, 1630889800, 1, 1);
INSERT INTO `ocenter_message` VALUES (34, 111, 111, '给您的帖子点赞', '', 'replyPost', 30, 0, 0, 1630889844, 1, 1);
INSERT INTO `ocenter_message` VALUES (35, 114, 111, '标的否666', '', 'replyPost', 30, 0, 0, 1630889863, 1, 1);
INSERT INTO `ocenter_message` VALUES (36, 111, 114, '给您的帖子点赞', '', 'replyPost', 31, 0, 0, 1630931565, 1, 0);
INSERT INTO `ocenter_message` VALUES (37, 114, 114, '给您的帖子点赞', '', 'replyPost', 31, 0, 0, 1630940415, 1, 0);
INSERT INTO `ocenter_message` VALUES (38, 114, 114, '给您的帖子点赞', '', 'replyPost', 25, 0, 0, 1630940451, 1, 0);
INSERT INTO `ocenter_message` VALUES (39, 114, 114, '给您的帖子点赞', '', 'replyPost', 17, 0, 0, 1630940453, 1, 0);
INSERT INTO `ocenter_message` VALUES (40, 114, 114, '给您的帖子点赞', '', 'replyPost', 29, 0, 0, 1630940455, 1, 0);
INSERT INTO `ocenter_message` VALUES (41, 109, 114, '给您的帖子点赞', '', 'replyPost', 31, 0, 0, 1630996728, 1, 0);
INSERT INTO `ocenter_message` VALUES (42, 114, 120, '给您的帖子点赞', '', 'replyPost', 26, 0, 0, 1631106125, 1, 0);
INSERT INTO `ocenter_message` VALUES (43, 114, 120, '给您的帖子点赞', '', 'replyPost', 28, 0, 0, 1631106130, 1, 0);
INSERT INTO `ocenter_message` VALUES (44, 114, 111, '给您的帖子点赞', '', 'replyPost', 30, 0, 0, 1631106133, 1, 1);
INSERT INTO `ocenter_message` VALUES (45, 114, 114, '给您的帖子点赞', '', 'replyPost', 32, 0, 0, 1631106154, 1, 0);
INSERT INTO `ocenter_message` VALUES (46, 114, 114, '给您的帖子点赞', '', 'replyPost', 34, 0, 0, 1631170684, 1, 0);
INSERT INTO `ocenter_message` VALUES (47, 109, 111, '给您的帖子点赞', '', 'replyPost', 30, 0, 0, 1631232319, 1, 1);
INSERT INTO `ocenter_message` VALUES (48, 118, 114, '给您的帖子点赞', '', 'replyPost', 34, 0, 0, 1631234787, 1, 0);
INSERT INTO `ocenter_message` VALUES (49, 118, 109, '给您的帖子点赞', '', 'replyPost', 33, 0, 0, 1631234791, 1, 1);
INSERT INTO `ocenter_message` VALUES (50, 118, 114, '给您的帖子点赞', '', 'replyPost', 32, 0, 0, 1631234794, 1, 0);
INSERT INTO `ocenter_message` VALUES (51, 118, 114, '给您的帖子点赞', '', 'replyPost', 31, 0, 0, 1631234798, 1, 0);
INSERT INTO `ocenter_message` VALUES (52, 118, 111, '给您的帖子点赞', '', 'replyPost', 30, 0, 0, 1631234802, 1, 1);
INSERT INTO `ocenter_message` VALUES (53, 118, 114, '给您的帖子点赞', '', 'replyPost', 29, 0, 0, 1631234805, 1, 0);
INSERT INTO `ocenter_message` VALUES (54, 118, 120, '给您的帖子点赞', '', 'replyPost', 28, 0, 0, 1631234807, 1, 0);
INSERT INTO `ocenter_message` VALUES (55, 118, 106, '给您的帖子点赞', '', 'replyPost', 27, 0, 0, 1631234808, 1, 0);
INSERT INTO `ocenter_message` VALUES (56, 118, 120, '给您的帖子点赞', '', 'replyPost', 26, 0, 0, 1631234810, 1, 0);
INSERT INTO `ocenter_message` VALUES (57, 118, 114, '给您的帖子点赞', '', 'replyPost', 25, 0, 0, 1631234814, 1, 0);
INSERT INTO `ocenter_message` VALUES (58, 118, 112, '给您的帖子点赞', '', 'replyPost', 21, 0, 0, 1631234818, 1, 1);
INSERT INTO `ocenter_message` VALUES (59, 118, 109, '给您的帖子点赞', '', 'replyPost', 20, 0, 0, 1631234820, 1, 1);
INSERT INTO `ocenter_message` VALUES (60, 118, 113, '给您的帖子点赞', '', 'replyPost', 19, 0, 0, 1631234822, 1, 1);
INSERT INTO `ocenter_message` VALUES (61, 118, 109, '给您的帖子点赞', '', 'replyPost', 18, 0, 0, 1631234824, 1, 1);
INSERT INTO `ocenter_message` VALUES (62, 118, 114, '给您的帖子点赞', '', 'replyPost', 17, 0, 0, 1631234826, 1, 0);
INSERT INTO `ocenter_message` VALUES (63, 118, 105, '给您的帖子点赞', '', 'replyPost', 15, 0, 0, 1631234829, 1, 1);
INSERT INTO `ocenter_message` VALUES (64, 118, 111, '给您的帖子点赞', '', 'replyPost', 16, 0, 0, 1631234829, 1, 1);
INSERT INTO `ocenter_message` VALUES (65, 118, 105, '给您的帖子点赞', '', 'replyPost', 14, 0, 0, 1631234833, 1, 0);
INSERT INTO `ocenter_message` VALUES (66, 114, 105, '给您的帖子点赞', '', 'replyPost', 35, 0, 0, 1631267499, 1, 0);
INSERT INTO `ocenter_message` VALUES (67, 114, 114, '给您的帖子点赞', '', 'replyPost', 36, 0, 0, 1631348465, 1, 0);
INSERT INTO `ocenter_message` VALUES (68, 114, 105, '', '', 'replyPost', 35, 0, 0, 1631348491, 1, 1);
INSERT INTO `ocenter_message` VALUES (69, 114, 114, '', '', 'replyPost', 34, 0, 0, 1631348517, 1, 0);
INSERT INTO `ocenter_message` VALUES (70, 114, 114, '', '', 'replyPost', 36, 0, 0, 1631348530, 1, 0);
INSERT INTO `ocenter_message` VALUES (71, 105, 105, 'dman越做越好！', '', 'replyPost', 35, 0, 0, 1631512977, 1, 0);
INSERT INTO `ocenter_message` VALUES (72, 105, 105, '给您的帖子点赞', '', 'replyPost', 35, 0, 0, 1631513382, 1, 0);
INSERT INTO `ocenter_message` VALUES (73, 105, 105, '给您的帖子点赞', '', 'replyPost', 15, 0, 0, 1631513384, 1, 0);
INSERT INTO `ocenter_message` VALUES (74, 105, 105, '给您的帖子点赞', '', 'replyPost', 14, 0, 0, 1631513386, 1, 1);
INSERT INTO `ocenter_message` VALUES (75, 105, 114, '给您的帖子点赞', '', 'replyPost', 36, 0, 0, 1631513389, 1, 0);
INSERT INTO `ocenter_message` VALUES (76, 105, 114, '给您的帖子点赞', '', 'replyPost', 34, 0, 0, 1631513391, 1, 0);
INSERT INTO `ocenter_message` VALUES (77, 105, 109, '给您的帖子点赞', '', 'replyPost', 33, 0, 0, 1631513393, 1, 1);
INSERT INTO `ocenter_message` VALUES (78, 105, 114, '给您的帖子点赞', '', 'replyPost', 32, 0, 0, 1631513395, 1, 0);
INSERT INTO `ocenter_message` VALUES (79, 105, 114, '给您的帖子点赞', '', 'replyPost', 31, 0, 0, 1631513397, 1, 0);
INSERT INTO `ocenter_message` VALUES (80, 105, 114, '给您的帖子点赞', '', 'replyPost', 29, 0, 0, 1631513399, 1, 0);
INSERT INTO `ocenter_message` VALUES (81, 105, 114, '给您的帖子点赞', '', 'replyPost', 25, 0, 0, 1631513402, 1, 0);
INSERT INTO `ocenter_message` VALUES (82, 105, 109, '给您的帖子点赞', '', 'replyPost', 20, 0, 0, 1631513409, 1, 1);
INSERT INTO `ocenter_message` VALUES (83, 105, 109, '给您的帖子点赞', '', 'replyPost', 18, 0, 0, 1631513409, 1, 1);
INSERT INTO `ocenter_message` VALUES (84, 105, 114, '给您的帖子点赞', '', 'replyPost', 17, 0, 0, 1631513412, 1, 0);
INSERT INTO `ocenter_message` VALUES (85, 111, 105, '给您的帖子点赞', '', 'replyPost', 35, 0, 0, 1631514561, 1, 1);
INSERT INTO `ocenter_message` VALUES (86, 111, 114, '给您的帖子点赞', '', 'replyPost', 34, 0, 0, 1631514564, 1, 0);
INSERT INTO `ocenter_message` VALUES (87, 114, 111, '给您的帖子点赞', '', 'replyPost', 37, 0, 0, 1631517043, 1, 1);
INSERT INTO `ocenter_message` VALUES (88, 105, 111, '给您的帖子点赞', '', 'replyPost', 37, 0, 0, 1631517197, 1, 1);
INSERT INTO `ocenter_message` VALUES (89, 105, 111, '泡沫太大了', '', 'replyPost', 37, 0, 0, 1631517220, 1, 1);
INSERT INTO `ocenter_message` VALUES (90, 109, 105, '这就是传说中的接盘侠', '泡沫太大了', 'replyReply', 37, 65, 0, 1631522362, 1, 1);
INSERT INTO `ocenter_message` VALUES (91, 105, 105, '给您的回复点赞', '泡沫太大了', 'replyReply', 37, 65, 0, 1631522518, 1, 1);
INSERT INTO `ocenter_message` VALUES (92, 105, 109, '给您的回复点赞', '这就是传说中的接盘侠', 'replyReply', 37, 65, 126, 1631522519, 1, 1);
INSERT INTO `ocenter_message` VALUES (93, 109, 109, '没热度', '这就是传说中的接盘侠', 'replyReply', 37, 65, 126, 1631522665, 1, 1);
INSERT INTO `ocenter_message` VALUES (94, 113, 113, '给您的帖子点赞', '', 'replyPost', 19, 0, 0, 1631624854, 1, 1);
INSERT INTO `ocenter_message` VALUES (95, 114, 114, '给您的帖子点赞', '', 'replyPost', 38, 0, 0, 1631709896, 1, 0);
INSERT INTO `ocenter_message` VALUES (96, 109, 114, '给您的帖子点赞', '', 'replyPost', 38, 0, 0, 1631718434, 1, 0);
INSERT INTO `ocenter_message` VALUES (97, 112, 114, '给您的帖子点赞', '', 'replyPost', 38, 0, 0, 1631764409, 1, 0);
INSERT INTO `ocenter_message` VALUES (98, 112, 111, '给您的帖子点赞', '', 'replyPost', 37, 0, 0, 1631764413, 1, 1);
INSERT INTO `ocenter_message` VALUES (99, 112, 105, '给您的帖子点赞', '', 'replyPost', 35, 0, 0, 1631764417, 1, 0);
INSERT INTO `ocenter_message` VALUES (100, 112, 114, '给您的帖子点赞', '', 'replyPost', 34, 0, 0, 1631764419, 1, 0);
INSERT INTO `ocenter_message` VALUES (101, 112, 109, '给您的帖子点赞', '', 'replyPost', 33, 0, 0, 1631764421, 1, 1);
INSERT INTO `ocenter_message` VALUES (102, 112, 114, '给您的帖子点赞', '', 'replyPost', 32, 0, 0, 1631764424, 1, 0);
INSERT INTO `ocenter_message` VALUES (103, 112, 114, '给您的帖子点赞', '', 'replyPost', 31, 0, 0, 1631764427, 1, 0);
INSERT INTO `ocenter_message` VALUES (104, 112, 111, '给您的帖子点赞', '', 'replyPost', 30, 0, 0, 1631764430, 1, 1);
INSERT INTO `ocenter_message` VALUES (105, 112, 114, '给您的帖子点赞', '', 'replyPost', 29, 0, 0, 1631764435, 1, 0);
INSERT INTO `ocenter_message` VALUES (106, 112, 120, '给您的帖子点赞', '', 'replyPost', 28, 0, 0, 1631764437, 1, 0);
INSERT INTO `ocenter_message` VALUES (107, 112, 106, '给您的帖子点赞', '', 'replyPost', 27, 0, 0, 1631764439, 1, 0);
INSERT INTO `ocenter_message` VALUES (108, 112, 120, '给您的帖子点赞', '', 'replyPost', 26, 0, 0, 1631764441, 1, 0);
INSERT INTO `ocenter_message` VALUES (109, 112, 114, '给您的帖子点赞', '', 'replyPost', 25, 0, 0, 1631764443, 1, 0);
INSERT INTO `ocenter_message` VALUES (110, 112, 112, '给您的帖子点赞', '', 'replyPost', 21, 0, 0, 1631764445, 1, 1);
INSERT INTO `ocenter_message` VALUES (111, 112, 109, '给您的帖子点赞', '', 'replyPost', 20, 0, 0, 1631764446, 1, 1);
INSERT INTO `ocenter_message` VALUES (112, 112, 113, '给您的帖子点赞', '', 'replyPost', 19, 0, 0, 1631764448, 1, 1);
INSERT INTO `ocenter_message` VALUES (113, 112, 114, '给您的帖子点赞', '', 'replyPost', 17, 0, 0, 1631764451, 1, 0);
INSERT INTO `ocenter_message` VALUES (114, 112, 111, '给您的帖子点赞', '', 'replyPost', 16, 0, 0, 1631764474, 1, 1);
INSERT INTO `ocenter_message` VALUES (115, 112, 105, '给您的帖子点赞', '', 'replyPost', 15, 0, 0, 1631764475, 1, 0);
INSERT INTO `ocenter_message` VALUES (116, 112, 105, '给您的帖子点赞', '', 'replyPost', 14, 0, 0, 1631764478, 1, 0);
INSERT INTO `ocenter_message` VALUES (117, 114, 114, '给您的帖子点赞', '', 'replyPost', 39, 0, 0, 1631831907, 1, 0);
INSERT INTO `ocenter_message` VALUES (118, 114, 109, '给您的帖子点赞', '', 'replyPost', 40, 0, 0, 1631846889, 1, 1);
INSERT INTO `ocenter_message` VALUES (119, 109, 109, '给您的帖子点赞', '', 'replyPost', 40, 0, 0, 1631859791, 1, 1);
INSERT INTO `ocenter_message` VALUES (120, 119, 119, '给您的帖子点赞', '', 'replyPost', 41, 0, 0, 1631873081, 1, 1);
INSERT INTO `ocenter_message` VALUES (121, 111, 111, '给您的帖子点赞', '', 'replyPost', 37, 0, 0, 1631875954, 1, 1);
INSERT INTO `ocenter_message` VALUES (122, 111, 119, '给您的帖子点赞', '', 'replyPost', 41, 0, 0, 1631876020, 1, 1);
INSERT INTO `ocenter_message` VALUES (123, 111, 119, '你家夫人么', '', 'replyPost', 41, 0, 0, 1631876032, 1, 1);
INSERT INTO `ocenter_message` VALUES (124, 247, 119, '给您的帖子点赞', '', 'replyPost', 41, 0, 0, 1631876211, 1, 1);
INSERT INTO `ocenter_message` VALUES (125, 119, 119, '不是我家夫人，没有那福分啊，哈哈', '', 'replyPost', 41, 0, 0, 1631890217, 1, 1);
INSERT INTO `ocenter_message` VALUES (126, 119, 111, '给您的帖子点赞', '', 'replyPost', 42, 0, 0, 1631890310, 1, 1);
INSERT INTO `ocenter_message` VALUES (127, 114, 119, '给您的帖子点赞', '', 'replyPost', 41, 0, 0, 1631894235, 1, 1);
INSERT INTO `ocenter_message` VALUES (128, 114, 119, '是俩口子吗', '', 'replyPost', 41, 0, 0, 1631894278, 1, 1);
INSERT INTO `ocenter_message` VALUES (129, 151, 109, '给您的帖子点赞', '', 'replyPost', 45, 0, 0, 1631906769, 1, 1);
INSERT INTO `ocenter_message` VALUES (130, 151, 247, '给您的帖子点赞', '', 'replyPost', 43, 0, 0, 1631906788, 1, 0);
INSERT INTO `ocenter_message` VALUES (131, 114, 114, '给您的帖子点赞', '', 'replyPost', 46, 0, 0, 1631923762, 1, 0);
INSERT INTO `ocenter_message` VALUES (132, 109, 109, '给您的帖子点赞', '', 'replyPost', 45, 0, 0, 1631924686, 1, 1);
INSERT INTO `ocenter_message` VALUES (133, 119, 114, '不是两口子，但愿成为两口子，哈哈', '是俩口子吗', 'replyReply', 41, 68, 0, 1631929539, 1, 0);
INSERT INTO `ocenter_message` VALUES (134, 111, 109, '给您的帖子点赞', '', 'replyPost', 44, 0, 0, 1631951629, 1, 1);
INSERT INTO `ocenter_message` VALUES (135, 109, 105, '给您的帖子点赞', '', 'replyPost', 35, 0, 0, 1632040009, 1, 0);
INSERT INTO `ocenter_message` VALUES (136, 199, 114, '给您的帖子点赞', '', 'replyPost', 38, 0, 0, 1632141300, 1, 0);
INSERT INTO `ocenter_message` VALUES (137, 114, 114, '给您的帖子点赞', '', 'replyPost', 47, 0, 0, 1632159580, 1, 0);
INSERT INTO `ocenter_message` VALUES (138, 114, 114, '给您的帖子点赞', '', 'replyPost', 48, 0, 0, 1632163702, 1, 0);
INSERT INTO `ocenter_message` VALUES (139, 426, 119, '\n0x8bBa61E0668D3821413786D2Bd49B4D44AD5d26d', '', 'replyPost', 41, 0, 0, 1632257579, 1, 1);
INSERT INTO `ocenter_message` VALUES (140, 426, 109, '\n0x8bBa61E0668D3821413786D2Bd49B4D44AD5d26d', '', 'replyPost', 40, 0, 0, 1632257591, 1, 1);
INSERT INTO `ocenter_message` VALUES (141, 426, 114, '\n0x8bBa61E0668D3821413786D2Bd49B4D44AD5d26d', '', 'replyPost', 38, 0, 0, 1632257617, 1, 0);
INSERT INTO `ocenter_message` VALUES (142, 426, 120, '\n0x8bBa61E0668D3821413786D2Bd49B4D44AD5d26d这个是babyShib的合约地址，布道布道，技术牛呀，三链合一，币，币安，以太链，', '', 'replyPost', 28, 0, 0, 1632257778, 1, 0);
INSERT INTO `ocenter_message` VALUES (143, 436, 114, '给您的帖子点赞', '', 'replyPost', 48, 0, 0, 1632398541, 1, 0);
INSERT INTO `ocenter_message` VALUES (144, 114, 114, '给您的帖子点赞', '', 'replyPost', 49, 0, 0, 1632403580, 1, 0);
INSERT INTO `ocenter_message` VALUES (145, 163, 247, '给您的帖子点赞', '', 'replyPost', 43, 0, 0, 1632458450, 1, 0);
INSERT INTO `ocenter_message` VALUES (146, 163, 163, '给您的帖子点赞', '', 'replyPost', 54, 0, 0, 1632458649, 1, 0);
INSERT INTO `ocenter_message` VALUES (147, 163, 163, '给您的帖子点赞', '', 'replyPost', 53, 0, 0, 1632458665, 1, 0);
INSERT INTO `ocenter_message` VALUES (148, 163, 163, '给您的帖子点赞', '', 'replyPost', 52, 0, 0, 1632458678, 1, 0);
INSERT INTO `ocenter_message` VALUES (149, 114, 114, '给您的帖子点赞', '', 'replyPost', 55, 0, 0, 1632473582, 1, 0);
INSERT INTO `ocenter_message` VALUES (150, 114, 163, '给您的帖子点赞', '', 'replyPost', 54, 0, 0, 1632473611, 1, 0);
INSERT INTO `ocenter_message` VALUES (151, 114, 163, '给您的帖子点赞', '', 'replyPost', 53, 0, 0, 1632473616, 1, 0);
INSERT INTO `ocenter_message` VALUES (152, 114, 163, '给您的帖子点赞', '', 'replyPost', 52, 0, 0, 1632473618, 1, 0);
INSERT INTO `ocenter_message` VALUES (153, 114, 452, '给您的帖子点赞', '', 'replyPost', 51, 0, 0, 1632473623, 1, 1);
INSERT INTO `ocenter_message` VALUES (154, 114, 452, '给您的帖子点赞', '', 'replyPost', 50, 0, 0, 1632473632, 1, 1);
INSERT INTO `ocenter_message` VALUES (155, 114, 114, '给您的帖子点赞', '', 'replyPost', 47, 0, 0, 1632473639, 1, 0);
INSERT INTO `ocenter_message` VALUES (156, 114, 114, '给您的帖子点赞', '', 'replyPost', 48, 0, 0, 1632473643, 1, 0);
INSERT INTO `ocenter_message` VALUES (157, 111, 111, '给您的帖子点赞', '', 'replyPost', 56, 0, 0, 1632541157, 1, 1);
INSERT INTO `ocenter_message` VALUES (158, 114, 111, '给您的帖子点赞', '', 'replyPost', 56, 0, 0, 1632568848, 1, 1);
INSERT INTO `ocenter_message` VALUES (159, 114, 114, '给您的帖子点赞', '', 'replyPost', 57, 0, 0, 1632569031, 1, 0);
INSERT INTO `ocenter_message` VALUES (160, 114, 114, '给您的帖子点赞', '', 'replyPost', 58, 0, 0, 1632607245, 1, 0);
INSERT INTO `ocenter_message` VALUES (161, 113, 113, '给您的帖子点赞', '', 'replyPost', 19, 0, 0, 1632708440, 1, 1);
INSERT INTO `ocenter_message` VALUES (162, 113, 114, '给您的帖子点赞', '', 'replyPost', 58, 0, 0, 1632708464, 1, 0);
INSERT INTO `ocenter_message` VALUES (163, 114, 114, '给您的帖子点赞', '', 'replyPost', 59, 0, 0, 1632718280, 1, 0);
INSERT INTO `ocenter_message` VALUES (164, 114, 149, '给您的帖子点赞', '', 'replyPost', 60, 0, 0, 1632726373, 1, 1);
INSERT INTO `ocenter_message` VALUES (165, 149, 149, '给您的帖子点赞', '', 'replyPost', 60, 0, 0, 1632726378, 1, 1);
INSERT INTO `ocenter_message` VALUES (166, 149, 149, '给您的帖子点赞', '', 'replyPost', 61, 0, 0, 1632726986, 1, 1);
INSERT INTO `ocenter_message` VALUES (167, 149, 149, '感谢点赞关注', '', 'replyPost', 60, 0, 0, 1632727571, 1, 1);
INSERT INTO `ocenter_message` VALUES (168, 149, 149, '感谢点赞关注', '', 'replyPost', 60, 0, 0, 1632727572, 1, 1);
INSERT INTO `ocenter_message` VALUES (169, 149, 149, '感谢点赞关注', '', 'replyPost', 60, 0, 0, 1632727622, 1, 1);
INSERT INTO `ocenter_message` VALUES (170, 149, 149, '感谢点赞关注', '', 'replyPost', 60, 0, 0, 1632727642, 1, 1);
INSERT INTO `ocenter_message` VALUES (171, 114, 114, '给您的帖子点赞', '', 'replyPost', 62, 0, 0, 1632758002, 1, 0);
INSERT INTO `ocenter_message` VALUES (172, 273, 149, '给您的帖子点赞', '', 'replyPost', 60, 0, 0, 1632772576, 1, 1);
INSERT INTO `ocenter_message` VALUES (173, 113, 114, '给您的帖子点赞', '', 'replyPost', 62, 0, 0, 1632845083, 1, 0);
INSERT INTO `ocenter_message` VALUES (174, 113, 149, '给您的帖子点赞', '', 'replyPost', 60, 0, 0, 1632845111, 1, 1);
INSERT INTO `ocenter_message` VALUES (175, 113, 114, '给您的帖子点赞', '', 'replyPost', 59, 0, 0, 1632845119, 1, 0);
INSERT INTO `ocenter_message` VALUES (176, 113, 114, '给您的帖子点赞', '', 'replyPost', 57, 0, 0, 1632845147, 1, 0);
INSERT INTO `ocenter_message` VALUES (177, 109, 114, '给您的帖子点赞', '', 'replyPost', 62, 0, 0, 1632906378, 1, 0);
INSERT INTO `ocenter_message` VALUES (178, 113, 114, '一个已确定的有空投的类似于百度，搜狗的区块链搜索引擎', '', 'replyPost', 62, 0, 0, 1632907356, 1, 0);
INSERT INTO `ocenter_message` VALUES (179, 114, 113, '给您的帖子点赞', '', 'replyPost', 63, 0, 0, 1632910631, 1, 1);
INSERT INTO `ocenter_message` VALUES (180, 114, 109, '给您的帖子点赞', '', 'replyPost', 64, 0, 0, 1632926874, 1, 1);
INSERT INTO `ocenter_message` VALUES (181, 114, 114, '给您的帖子点赞', '', 'replyPost', 65, 0, 0, 1633053182, 1, 0);
INSERT INTO `ocenter_message` VALUES (182, 114, 149, '给您的帖子点赞', '', 'replyPost', 61, 0, 0, 1633053204, 1, 1);
INSERT INTO `ocenter_message` VALUES (183, 113, 113, '给您的帖子点赞', '', 'replyPost', 63, 0, 0, 1633054646, 1, 0);
INSERT INTO `ocenter_message` VALUES (184, 113, 119, '给您的帖子点赞', '', 'replyPost', 41, 0, 0, 1633058272, 1, 1);
INSERT INTO `ocenter_message` VALUES (185, 114, 114, '给您的帖子点赞', '', 'replyPost', 66, 0, 0, 1633093129, 1, 0);
INSERT INTO `ocenter_message` VALUES (186, 114, 114, '给您的帖子点赞', '', 'replyPost', 67, 0, 0, 1633357713, 1, 0);
INSERT INTO `ocenter_message` VALUES (187, 593, 114, '给您的帖子点赞', '', 'replyPost', 66, 0, 0, 1633438138, 1, 0);
INSERT INTO `ocenter_message` VALUES (188, 592, 114, '给您的帖子点赞', '', 'replyPost', 38, 0, 0, 1633439352, 1, 0);
INSERT INTO `ocenter_message` VALUES (189, 239, 111, '是的扣扣电话', '', 'replyPost', 68, 0, 0, 1633496017, 1, 1);
INSERT INTO `ocenter_message` VALUES (190, 114, 114, '给您的帖子点赞', '', 'replyPost', 70, 0, 0, 1633592900, 1, 0);
INSERT INTO `ocenter_message` VALUES (191, 478, 114, '给您的帖子点赞', '', 'replyPost', 70, 0, 0, 1633680212, 1, 0);
INSERT INTO `ocenter_message` VALUES (192, 114, 114, '给您的帖子点赞', '', 'replyPost', 70, 0, 0, 1633687808, 1, 0);
INSERT INTO `ocenter_message` VALUES (193, 612, 612, '发火币生态链地址，领取空投', '', 'replyPost', 71, 0, 0, 1633852131, 1, 1);
INSERT INTO `ocenter_message` VALUES (194, 114, 612, '给您的帖子点赞', '', 'replyPost', 71, 0, 0, 1633870617, 1, 1);
INSERT INTO `ocenter_message` VALUES (195, 612, 612, '给您的帖子点赞', '', 'replyPost', 71, 0, 0, 1633916448, 1, 1);
INSERT INTO `ocenter_message` VALUES (196, 113, 114, '给您的帖子点赞', '', 'replyPost', 62, 0, 0, 1633930724, 1, 0);
INSERT INTO `ocenter_message` VALUES (197, 676, 612, '给您的帖子点赞', '', 'replyPost', 71, 0, 0, 1633971880, 1, 0);
INSERT INTO `ocenter_message` VALUES (198, 712, 612, '给您的帖子点赞', '', 'replyPost', 71, 0, 0, 1634008087, 1, 0);
INSERT INTO `ocenter_message` VALUES (199, 712, 111, '给您的帖子点赞', '', 'replyPost', 69, 0, 0, 1634008098, 1, 1);
INSERT INTO `ocenter_message` VALUES (200, 717, 612, '给您的帖子点赞', '', 'replyPost', 71, 0, 0, 1634024419, 1, 0);
INSERT INTO `ocenter_message` VALUES (201, 770, 612, '给您的帖子点赞', '', 'replyPost', 71, 0, 0, 1634031807, 1, 0);
INSERT INTO `ocenter_message` VALUES (202, 114, 114, '给您的帖子点赞', '', 'replyPost', 72, 0, 0, 1634050321, 1, 0);
INSERT INTO `ocenter_message` VALUES (203, 855, 114, '给您的帖子点赞', '', 'replyPost', 72, 0, 0, 1634222118, 1, 0);
INSERT INTO `ocenter_message` VALUES (204, 540, 612, '0xcBc26652d6A0210e29ed1B6d6FBe552ddCbfa8A0', '', 'replyPost', 71, 0, 0, 1634315136, 1, 0);
INSERT INTO `ocenter_message` VALUES (205, 540, 612, '0xcBc26652d6A0210e29ed1B6d6FBe552ddCbfa8A0', '发火币生态链地址，领取空投', 'replyReply', 71, 79, 0, 1634315157, 1, 0);
INSERT INTO `ocenter_message` VALUES (206, 490, 109, '给您的帖子点赞', '', 'replyPost', 76, 0, 0, 1634489783, 1, 1);
INSERT INTO `ocenter_message` VALUES (207, 114, 109, '给您的帖子点赞', '', 'replyPost', 76, 0, 0, 1634507510, 1, 1);
INSERT INTO `ocenter_message` VALUES (208, 484, 114, '合约地址多少', '', 'replyPost', 39, 0, 0, 1634606531, 1, 0);
INSERT INTO `ocenter_message` VALUES (209, 199, 973, '给您的帖子点赞', '', 'replyPost', 78, 0, 0, 1634669279, 1, 1);
INSERT INTO `ocenter_message` VALUES (210, 199, 973, '给您的帖子点赞', '', 'replyPost', 77, 0, 0, 1634669292, 1, 1);
INSERT INTO `ocenter_message` VALUES (211, 199, 109, '给您的帖子点赞', '', 'replyPost', 76, 0, 0, 1634669295, 1, 1);
INSERT INTO `ocenter_message` VALUES (212, 114, 973, '给您的帖子点赞', '', 'replyPost', 78, 0, 0, 1634698930, 1, 1);
INSERT INTO `ocenter_message` VALUES (213, 114, 973, '给您的帖子点赞', '', 'replyPost', 77, 0, 0, 1634698949, 1, 1);
INSERT INTO `ocenter_message` VALUES (214, 114, 114, '给您的帖子点赞', '', 'replyPost', 79, 0, 0, 1634699090, 1, 0);
INSERT INTO `ocenter_message` VALUES (215, 114, 114, '做好社区共享，才是出路之道', '', 'replyPost', 79, 0, 0, 1634699146, 1, 0);
INSERT INTO `ocenter_message` VALUES (216, 114, 114, '给您的回复点赞', '做好社区共享，才是出路之道', 'replyReply', 79, 82, 0, 1634699164, 1, 0);
INSERT INTO `ocenter_message` VALUES (217, 114, 109, '给您的帖子点赞', '', 'replyPost', 76, 0, 0, 1634699177, 1, 1);
INSERT INTO `ocenter_message` VALUES (218, 114, 109, '给您的帖子点赞', '', 'replyPost', 75, 0, 0, 1634699180, 1, 1);
INSERT INTO `ocenter_message` VALUES (219, 114, 111, '给您的帖子点赞', '', 'replyPost', 74, 0, 0, 1634699182, 1, 1);
INSERT INTO `ocenter_message` VALUES (220, 114, 111, '给您的帖子点赞', '', 'replyPost', 73, 0, 0, 1634699185, 1, 1);
INSERT INTO `ocenter_message` VALUES (221, 114, 114, '给您的帖子点赞', '', 'replyPost', 72, 0, 0, 1634699188, 1, 0);
INSERT INTO `ocenter_message` VALUES (222, 114, 612, '给您的帖子点赞', '', 'replyPost', 71, 0, 0, 1634699190, 1, 0);
INSERT INTO `ocenter_message` VALUES (223, 114, 114, '给您的帖子点赞', '', 'replyPost', 70, 0, 0, 1634699193, 1, 0);
INSERT INTO `ocenter_message` VALUES (224, 114, 111, '给您的帖子点赞', '', 'replyPost', 69, 0, 0, 1634699196, 1, 1);
INSERT INTO `ocenter_message` VALUES (225, 114, 111, '给您的帖子点赞', '', 'replyPost', 68, 0, 0, 1634699198, 1, 1);
INSERT INTO `ocenter_message` VALUES (226, 114, 114, '给您的帖子点赞', '', 'replyPost', 67, 0, 0, 1634699201, 1, 0);
INSERT INTO `ocenter_message` VALUES (227, 114, 114, '给您的帖子点赞', '', 'replyPost', 66, 0, 0, 1634699204, 1, 0);
INSERT INTO `ocenter_message` VALUES (228, 114, 114, '给您的帖子点赞', '', 'replyPost', 65, 0, 0, 1634699206, 1, 0);
INSERT INTO `ocenter_message` VALUES (229, 114, 109, '给您的帖子点赞', '', 'replyPost', 64, 0, 0, 1634699210, 1, 1);
INSERT INTO `ocenter_message` VALUES (230, 114, 113, '给您的帖子点赞', '', 'replyPost', 63, 0, 0, 1634699212, 1, 0);
INSERT INTO `ocenter_message` VALUES (231, 114, 114, '给您的帖子点赞', '', 'replyPost', 62, 0, 0, 1634699215, 1, 0);
INSERT INTO `ocenter_message` VALUES (232, 114, 149, '给您的帖子点赞', '', 'replyPost', 61, 0, 0, 1634699219, 1, 0);
INSERT INTO `ocenter_message` VALUES (233, 114, 149, '给您的帖子点赞', '', 'replyPost', 60, 0, 0, 1634699222, 1, 0);
INSERT INTO `ocenter_message` VALUES (234, 114, 114, '给您的帖子点赞', '', 'replyPost', 59, 0, 0, 1634699226, 1, 0);
INSERT INTO `ocenter_message` VALUES (235, 114, 114, '给您的帖子点赞', '', 'replyPost', 58, 0, 0, 1634699229, 1, 0);
INSERT INTO `ocenter_message` VALUES (236, 114, 114, '给您的帖子点赞', '', 'replyPost', 57, 0, 0, 1634699231, 1, 0);
INSERT INTO `ocenter_message` VALUES (237, 114, 111, '给您的帖子点赞', '', 'replyPost', 56, 0, 0, 1634699234, 1, 1);
INSERT INTO `ocenter_message` VALUES (238, 114, 114, '给您的帖子点赞', '', 'replyPost', 55, 0, 0, 1634699236, 1, 0);
INSERT INTO `ocenter_message` VALUES (239, 114, 163, '给您的帖子点赞', '', 'replyPost', 54, 0, 0, 1634699239, 1, 0);
INSERT INTO `ocenter_message` VALUES (240, 109, 973, '给您的帖子点赞', '', 'replyPost', 78, 0, 0, 1634722832, 1, 1);
INSERT INTO `ocenter_message` VALUES (241, 109, 973, '给您的帖子点赞', '', 'replyPost', 77, 0, 0, 1634722834, 1, 1);
INSERT INTO `ocenter_message` VALUES (242, 113, 114, '给您的帖子点赞', '', 'replyPost', 79, 0, 0, 1634781579, 1, 0);
INSERT INTO `ocenter_message` VALUES (243, 113, 109, '给您的帖子点赞', '', 'replyPost', 76, 0, 0, 1634781648, 1, 1);
INSERT INTO `ocenter_message` VALUES (244, 304, 114, '给您的帖子点赞', '', 'replyPost', 79, 0, 0, 1634782725, 1, 0);
INSERT INTO `ocenter_message` VALUES (245, 304, 973, '给您的帖子点赞', '', 'replyPost', 78, 0, 0, 1634782727, 1, 1);
INSERT INTO `ocenter_message` VALUES (246, 304, 973, '给您的帖子点赞', '', 'replyPost', 77, 0, 0, 1634782729, 1, 1);
INSERT INTO `ocenter_message` VALUES (247, 304, 109, '给您的帖子点赞', '', 'replyPost', 76, 0, 0, 1634782735, 1, 1);
INSERT INTO `ocenter_message` VALUES (248, 304, 109, '给您的帖子点赞', '', 'replyPost', 75, 0, 0, 1634782736, 1, 1);
INSERT INTO `ocenter_message` VALUES (249, 304, 111, '给您的帖子点赞', '', 'replyPost', 74, 0, 0, 1634782738, 1, 1);
INSERT INTO `ocenter_message` VALUES (250, 304, 111, '给您的帖子点赞', '', 'replyPost', 73, 0, 0, 1634782741, 1, 1);
INSERT INTO `ocenter_message` VALUES (251, 304, 114, '给您的帖子点赞', '', 'replyPost', 72, 0, 0, 1634782744, 1, 0);
INSERT INTO `ocenter_message` VALUES (252, 304, 612, '给您的帖子点赞', '', 'replyPost', 71, 0, 0, 1634782747, 1, 0);
INSERT INTO `ocenter_message` VALUES (253, 304, 114, '给您的帖子点赞', '', 'replyPost', 70, 0, 0, 1634782749, 1, 0);
INSERT INTO `ocenter_message` VALUES (254, 114, 114, '给您的帖子点赞', '', 'replyPost', 79, 0, 0, 1634806821, 1, 0);
INSERT INTO `ocenter_message` VALUES (255, 114, 973, '给您的帖子点赞', '', 'replyPost', 78, 0, 0, 1634806824, 1, 1);
INSERT INTO `ocenter_message` VALUES (256, 114, 973, '给您的帖子点赞', '', 'replyPost', 77, 0, 0, 1634806831, 1, 1);
INSERT INTO `ocenter_message` VALUES (257, 114, 109, '给您的帖子点赞', '', 'replyPost', 76, 0, 0, 1634806834, 1, 1);
INSERT INTO `ocenter_message` VALUES (258, 1054, 973, '给您的帖子点赞', '', 'replyPost', 77, 0, 0, 1634807765, 1, 1);
INSERT INTO `ocenter_message` VALUES (259, 957, 957, '给您的帖子点赞', '', 'replyPost', 81, 0, 0, 1634807836, 1, 1);
INSERT INTO `ocenter_message` VALUES (260, 114, 957, '给您的帖子点赞', '', 'replyPost', 81, 0, 0, 1634823049, 1, 1);
INSERT INTO `ocenter_message` VALUES (261, 114, 111, '给您的帖子点赞', '', 'replyPost', 80, 0, 0, 1634823064, 1, 1);
INSERT INTO `ocenter_message` VALUES (262, 1086, 957, '贵阳花果园', '', 'replyPost', 81, 0, 0, 1634974949, 1, 1);
INSERT INTO `ocenter_message` VALUES (263, 1054, 957, '给您的帖子点赞', '', 'replyPost', 81, 0, 0, 1635004923, 1, 1);
INSERT INTO `ocenter_message` VALUES (264, 1021, 114, '给您的帖子点赞', '', 'replyPost', 82, 0, 0, 1635032432, 1, 0);
INSERT INTO `ocenter_message` VALUES (265, 1101, 973, '请怎么下载', '', 'replyPost', 78, 0, 0, 1635067074, 1, 1);
INSERT INTO `ocenter_message` VALUES (266, 1101, 973, '给您的帖子点赞', '', 'replyPost', 77, 0, 0, 1635067492, 1, 1);
INSERT INTO `ocenter_message` VALUES (267, 1126, 149, '给您的帖子点赞', '', 'replyPost', 61, 0, 0, 1635079870, 1, 0);
INSERT INTO `ocenter_message` VALUES (268, 973, 1101, '加VX：pinbi8gui', '请怎么下载', 'replyReply', 78, 84, 0, 1635083319, 1, 1);
INSERT INTO `ocenter_message` VALUES (269, 973, 1101, 'https://shatuvip.com/pages/login/register?recom_code=4610034', '请怎么下载', 'replyReply', 78, 84, 0, 1635083371, 1, 0);
INSERT INTO `ocenter_message` VALUES (270, 973, 1101, '下载地址，VX打开', '请怎么下载', 'replyReply', 78, 84, 0, 1635083399, 1, 0);
INSERT INTO `ocenter_message` VALUES (271, 1122, 109, '给您的帖子点赞', '', 'replyPost', 76, 0, 0, 1635086767, 1, 1);
INSERT INTO `ocenter_message` VALUES (272, 1122, 111, '给您的帖子点赞', '', 'replyPost', 74, 0, 0, 1635086803, 1, 1);
INSERT INTO `ocenter_message` VALUES (273, 1101, 973, '加不了', '加VX：pinbi8gui', 'replyReply', 78, 84, 130, 1635110304, 1, 1);
INSERT INTO `ocenter_message` VALUES (274, 1101, 111, '给您的帖子点赞', '', 'replyPost', 83, 0, 0, 1635110334, 1, 1);
INSERT INTO `ocenter_message` VALUES (275, 1101, 114, '给您的帖子点赞', '', 'replyPost', 82, 0, 0, 1635110338, 1, 0);
INSERT INTO `ocenter_message` VALUES (276, 973, 1101, 'pinbo8gui  加这个', '加不了', 'replyReply', 78, 84, 133, 1635142511, 1, 0);
INSERT INTO `ocenter_message` VALUES (277, 1197, 1197, '给您的帖子点赞', '', 'replyPost', 85, 0, 0, 1635181120, 1, 0);
INSERT INTO `ocenter_message` VALUES (278, 1197, 1197, '。。。。。', '', 'replyPost', 85, 0, 0, 1635181138, 1, 0);
INSERT INTO `ocenter_message` VALUES (279, 1197, 1197, '。。。。。', '', 'replyPost', 85, 0, 0, 1635181146, 1, 0);
INSERT INTO `ocenter_message` VALUES (280, 1197, 1197, '。。。。。', '', 'replyPost', 85, 0, 0, 1635181152, 1, 0);
INSERT INTO `ocenter_message` VALUES (281, 1197, 1197, '。。。。。', '', 'replyPost', 85, 0, 0, 1635181170, 1, 0);
INSERT INTO `ocenter_message` VALUES (282, 1197, 1252, '。。。。。', '', 'replyPost', 84, 0, 0, 1635181179, 1, 0);
INSERT INTO `ocenter_message` VALUES (283, 1197, 1252, '。。。。。', '', 'replyPost', 84, 0, 0, 1635181183, 1, 0);
INSERT INTO `ocenter_message` VALUES (284, 1197, 1252, '给您的帖子点赞', '', 'replyPost', 84, 0, 0, 1635181187, 1, 0);
INSERT INTO `ocenter_message` VALUES (285, 1197, 1252, '。。。。。', '', 'replyPost', 84, 0, 0, 1635181195, 1, 0);
INSERT INTO `ocenter_message` VALUES (286, 1101, 1101, '给您的帖子点赞', '', 'replyPost', 87, 0, 0, 1635197034, 1, 0);
INSERT INTO `ocenter_message` VALUES (287, 1101, 1101, '给您的帖子点赞', '', 'replyPost', 86, 0, 0, 1635197037, 1, 0);
INSERT INTO `ocenter_message` VALUES (288, 1254, 1254, '给您的帖子点赞', '', 'replyPost', 89, 0, 0, 1635197893, 1, 1);
INSERT INTO `ocenter_message` VALUES (289, 114, 1254, '给您的帖子点赞', '', 'replyPost', 89, 0, 0, 1635203430, 1, 1);
INSERT INTO `ocenter_message` VALUES (290, 114, 1254, '给您的帖子点赞', '', 'replyPost', 90, 0, 0, 1635203432, 1, 1);
INSERT INTO `ocenter_message` VALUES (291, 114, 1254, '给您的帖子点赞', '', 'replyPost', 88, 0, 0, 1635203436, 1, 1);
INSERT INTO `ocenter_message` VALUES (292, 114, 1101, '给您的帖子点赞', '', 'replyPost', 87, 0, 0, 1635203483, 1, 0);
INSERT INTO `ocenter_message` VALUES (293, 114, 1101, '给您的帖子点赞', '', 'replyPost', 86, 0, 0, 1635203488, 1, 0);
INSERT INTO `ocenter_message` VALUES (294, 114, 1197, '给您的帖子点赞', '', 'replyPost', 85, 0, 0, 1635203493, 1, 0);
INSERT INTO `ocenter_message` VALUES (295, 114, 1252, '给您的帖子点赞', '', 'replyPost', 84, 0, 0, 1635203553, 1, 0);
INSERT INTO `ocenter_message` VALUES (296, 114, 111, '给您的帖子点赞', '', 'replyPost', 83, 0, 0, 1635203558, 1, 1);
INSERT INTO `ocenter_message` VALUES (297, 1215, 1254, '给您的帖子点赞', '', 'replyPost', 90, 0, 0, 1635205198, 1, 1);
INSERT INTO `ocenter_message` VALUES (298, 1110, 1110, '给您的帖子点赞', '', 'replyPost', 95, 0, 0, 1635394812, 1, 1);
INSERT INTO `ocenter_message` VALUES (299, 114, 874, '给您的帖子点赞', '', 'replyPost', 99, 0, 0, 1635475170, 1, 1);
INSERT INTO `ocenter_message` VALUES (300, 114, 874, '给您的帖子点赞', '', 'replyPost', 98, 0, 0, 1635475184, 1, 1);
INSERT INTO `ocenter_message` VALUES (301, 114, 874, '给您的帖子点赞', '', 'replyPost', 97, 0, 0, 1635475190, 1, 1);
INSERT INTO `ocenter_message` VALUES (302, 114, 1296, '给您的帖子点赞', '', 'replyPost', 96, 0, 0, 1635475216, 1, 1);
INSERT INTO `ocenter_message` VALUES (303, 114, 1110, '给您的帖子点赞', '', 'replyPost', 95, 0, 0, 1635475224, 1, 1);
INSERT INTO `ocenter_message` VALUES (304, 114, 1101, '给您的帖子点赞', '', 'replyPost', 94, 0, 0, 1635475230, 1, 0);
INSERT INTO `ocenter_message` VALUES (305, 114, 1101, '给您的帖子点赞', '', 'replyPost', 93, 0, 0, 1635475235, 1, 0);
INSERT INTO `ocenter_message` VALUES (306, 114, 1101, '给您的帖子点赞', '', 'replyPost', 92, 0, 0, 1635475238, 1, 0);
INSERT INTO `ocenter_message` VALUES (307, 114, 1101, '给您的帖子点赞', '', 'replyPost', 91, 0, 0, 1635475240, 1, 0);
INSERT INTO `ocenter_message` VALUES (308, 1296, 1296, '给您的帖子点赞', '', 'replyPost', 96, 0, 0, 1635499189, 1, 1);
INSERT INTO `ocenter_message` VALUES (309, 1296, 874, '不投资差不多，投资风险', '', 'replyPost', 98, 0, 0, 1635499560, 1, 1);
INSERT INTO `ocenter_message` VALUES (310, 114, 1296, '给您的帖子点赞', '', 'replyPost', 101, 0, 0, 1635511089, 1, 1);
INSERT INTO `ocenter_message` VALUES (311, 114, 1296, '给您的帖子点赞', '', 'replyPost', 100, 0, 0, 1635511091, 1, 1);
INSERT INTO `ocenter_message` VALUES (312, 1280, 1296, '给您的帖子点赞', '', 'replyPost', 101, 0, 0, 1635574796, 1, 1);
INSERT INTO `ocenter_message` VALUES (313, 1280, 1296, '给您的帖子点赞', '', 'replyPost', 100, 0, 0, 1635574797, 1, 1);
INSERT INTO `ocenter_message` VALUES (314, 1280, 874, '给您的帖子点赞', '', 'replyPost', 99, 0, 0, 1635574799, 1, 1);
INSERT INTO `ocenter_message` VALUES (315, 786, 109, '给您的帖子点赞', '', 'replyPost', 20, 0, 0, 1635575853, 1, 1);
INSERT INTO `ocenter_message` VALUES (316, 1173, 1254, '给您的帖子点赞', '', 'replyPost', 90, 0, 0, 1635604616, 1, 1);
INSERT INTO `ocenter_message` VALUES (317, 786, 1101, '给您的帖子点赞', '', 'replyPost', 91, 0, 0, 1635668989, 1, 0);
INSERT INTO `ocenter_message` VALUES (318, 786, 973, '给您的帖子点赞', '', 'replyPost', 78, 0, 0, 1635684084, 1, 1);
INSERT INTO `ocenter_message` VALUES (319, 786, 111, '给您的帖子点赞', '', 'replyPost', 80, 0, 0, 1635684088, 1, 1);
INSERT INTO `ocenter_message` VALUES (320, 786, 114, '给您的帖子点赞', '', 'replyPost', 82, 0, 0, 1635684093, 1, 0);
INSERT INTO `ocenter_message` VALUES (321, 786, 1252, '给您的帖子点赞', '', 'replyPost', 84, 0, 0, 1635684102, 1, 0);
INSERT INTO `ocenter_message` VALUES (322, 786, 1197, '给您的帖子点赞', '', 'replyPost', 85, 0, 0, 1635684105, 1, 0);
INSERT INTO `ocenter_message` VALUES (323, 786, 1101, '给您的帖子点赞', '', 'replyPost', 86, 0, 0, 1635684106, 1, 0);
INSERT INTO `ocenter_message` VALUES (324, 786, 1457, '给您的帖子点赞', '', 'replyPost', 102, 0, 0, 1635684113, 1, 1);
INSERT INTO `ocenter_message` VALUES (325, 786, 1296, '给您的帖子点赞', '', 'replyPost', 101, 0, 0, 1635684114, 1, 0);
INSERT INTO `ocenter_message` VALUES (326, 786, 1296, '给您的帖子点赞', '', 'replyPost', 100, 0, 0, 1635684116, 1, 0);
INSERT INTO `ocenter_message` VALUES (327, 114, 114, '给您的帖子点赞', '', 'replyPost', 103, 0, 0, 1635685114, 1, 0);
INSERT INTO `ocenter_message` VALUES (328, 114, 1457, '给您的帖子点赞', '', 'replyPost', 102, 0, 0, 1635685116, 1, 1);
INSERT INTO `ocenter_message` VALUES (329, 1461, 114, '给您的帖子点赞', '', 'replyPost', 103, 0, 0, 1635697905, 1, 0);
INSERT INTO `ocenter_message` VALUES (330, 1461, 114, '奇迹来临更猛烈', '', 'replyPost', 103, 0, 0, 1635697935, 1, 0);
INSERT INTO `ocenter_message` VALUES (331, 1461, 114, '未来路上来了', '', 'replyPost', 82, 0, 0, 1635697989, 1, 0);
INSERT INTO `ocenter_message` VALUES (332, 1461, 114, '给您的帖子点赞', '', 'replyPost', 82, 0, 0, 1635697991, 1, 0);
INSERT INTO `ocenter_message` VALUES (333, 1461, 114, '给您的帖子点赞', '', 'replyPost', 79, 0, 0, 1635697999, 1, 0);
INSERT INTO `ocenter_message` VALUES (334, 1461, 114, '给您的帖子点赞', '', 'replyPost', 70, 0, 0, 1635698014, 1, 0);
INSERT INTO `ocenter_message` VALUES (335, 1461, 114, '给您的帖子点赞', '', 'replyPost', 67, 0, 0, 1635698021, 1, 0);
INSERT INTO `ocenter_message` VALUES (336, 114, 1432, '给您的帖子点赞', '', 'replyPost', 104, 0, 0, 1635753935, 1, 0);
INSERT INTO `ocenter_message` VALUES (337, 874, 1432, '给您的帖子点赞', '', 'replyPost', 104, 0, 0, 1635754807, 1, 0);
INSERT INTO `ocenter_message` VALUES (338, 957, 1086, '给您的回复点赞', '贵阳花果园', 'replyReply', 81, 83, 0, 1635758477, 1, 0);
INSERT INTO `ocenter_message` VALUES (339, 973, 973, '微信扫码下载', '', 'replyPost', 108, 0, 0, 1635776887, 1, 1);
INSERT INTO `ocenter_message` VALUES (340, 1264, 973, '给您的帖子点赞', '', 'replyPost', 109, 0, 0, 1635787937, 1, 1);
INSERT INTO `ocenter_message` VALUES (341, 1207, 973, '给您的帖子点赞', '', 'replyPost', 109, 0, 0, 1635902923, 1, 1);
INSERT INTO `ocenter_message` VALUES (342, 1509, 973, '给您的帖子点赞', '', 'replyPost', 109, 0, 0, 1635921588, 1, 1);
INSERT INTO `ocenter_message` VALUES (343, 114, 1461, '给您的回复点赞', '奇迹来临更猛烈', 'replyReply', 103, 93, 0, 1635923063, 1, 0);
INSERT INTO `ocenter_message` VALUES (344, 114, 114, '给您的帖子点赞', '', 'replyPost', 110, 0, 0, 1635923115, 1, 0);
INSERT INTO `ocenter_message` VALUES (345, 1516, 114, '给您的帖子点赞', '', 'replyPost', 110, 0, 0, 1635927276, 1, 0);
INSERT INTO `ocenter_message` VALUES (346, 1516, 973, '给您的帖子点赞', '', 'replyPost', 108, 0, 0, 1635927284, 1, 1);
INSERT INTO `ocenter_message` VALUES (347, 1516, 874, '给您的帖子点赞', '', 'replyPost', 107, 0, 0, 1635927289, 1, 1);
INSERT INTO `ocenter_message` VALUES (348, 1516, 874, '给您的帖子点赞', '', 'replyPost', 106, 0, 0, 1635927292, 1, 1);
INSERT INTO `ocenter_message` VALUES (349, 1516, 1432, '给您的帖子点赞', '', 'replyPost', 105, 0, 0, 1635927294, 1, 0);
INSERT INTO `ocenter_message` VALUES (350, 1516, 1432, '给您的帖子点赞', '', 'replyPost', 104, 0, 0, 1635927297, 1, 0);
INSERT INTO `ocenter_message` VALUES (351, 1516, 1457, '给您的帖子点赞', '', 'replyPost', 102, 0, 0, 1635927301, 1, 1);
INSERT INTO `ocenter_message` VALUES (352, 1516, 1296, '给您的帖子点赞', '', 'replyPost', 101, 0, 0, 1635927301, 1, 0);
INSERT INTO `ocenter_message` VALUES (353, 1516, 874, '给您的帖子点赞', '', 'replyPost', 99, 0, 0, 1635927308, 1, 1);
INSERT INTO `ocenter_message` VALUES (354, 1516, 1296, '给您的帖子点赞', '', 'replyPost', 96, 0, 0, 1635927314, 1, 0);
INSERT INTO `ocenter_message` VALUES (355, 1516, 1110, '给您的帖子点赞', '', 'replyPost', 95, 0, 0, 1635927318, 1, 1);
INSERT INTO `ocenter_message` VALUES (356, 1516, 1101, '给您的帖子点赞', '', 'replyPost', 93, 0, 0, 1635927323, 1, 0);
INSERT INTO `ocenter_message` VALUES (357, 1516, 1101, '给您的帖子点赞', '', 'replyPost', 92, 0, 0, 1635927325, 1, 0);
INSERT INTO `ocenter_message` VALUES (358, 1516, 1101, '给您的帖子点赞', '', 'replyPost', 91, 0, 0, 1635927327, 1, 0);
INSERT INTO `ocenter_message` VALUES (359, 1516, 1254, '给您的帖子点赞', '', 'replyPost', 90, 0, 0, 1635927332, 1, 1);
INSERT INTO `ocenter_message` VALUES (360, 1516, 1254, '给您的帖子点赞', '', 'replyPost', 89, 0, 0, 1635927334, 1, 1);
INSERT INTO `ocenter_message` VALUES (361, 1516, 1254, '给您的帖子点赞', '', 'replyPost', 88, 0, 0, 1635927338, 1, 1);
INSERT INTO `ocenter_message` VALUES (362, 1516, 1101, '给您的帖子点赞', '', 'replyPost', 87, 0, 0, 1635927343, 1, 0);
INSERT INTO `ocenter_message` VALUES (363, 1516, 1197, '给您的帖子点赞', '', 'replyPost', 85, 0, 0, 1635927351, 1, 0);
INSERT INTO `ocenter_message` VALUES (364, 1516, 1252, '给您的帖子点赞', '', 'replyPost', 84, 0, 0, 1635927355, 1, 0);
INSERT INTO `ocenter_message` VALUES (365, 1516, 111, '给您的帖子点赞', '', 'replyPost', 83, 0, 0, 1635927358, 1, 1);
INSERT INTO `ocenter_message` VALUES (366, 1455, 114, '给您的帖子点赞', '', 'replyPost', 110, 0, 0, 1635949078, 1, 0);
INSERT INTO `ocenter_message` VALUES (367, 1528, 1528, '给您的帖子点赞', '', 'replyPost', 117, 0, 0, 1636164612, 1, 0);
INSERT INTO `ocenter_message` VALUES (368, 114, 1528, '给您的帖子点赞', '', 'replyPost', 117, 0, 0, 1636213451, 1, 0);
INSERT INTO `ocenter_message` VALUES (369, 114, 111, '给您的帖子点赞', '', 'replyPost', 116, 0, 0, 1636213454, 1, 1);
INSERT INTO `ocenter_message` VALUES (370, 114, 304, '给您的帖子点赞', '', 'replyPost', 115, 0, 0, 1636213457, 1, 1);
INSERT INTO `ocenter_message` VALUES (371, 114, 114, '给您的帖子点赞', '', 'replyPost', 118, 0, 0, 1636213779, 1, 0);
INSERT INTO `ocenter_message` VALUES (372, 114, 114, '给您的帖子点赞', '', 'replyPost', 119, 0, 0, 1636600388, 1, 0);
INSERT INTO `ocenter_message` VALUES (373, 114, 111, '给您的帖子点赞', '', 'replyPost', 112, 0, 0, 1636600403, 1, 0);
INSERT INTO `ocenter_message` VALUES (374, 114, 1516, '给您的帖子点赞', '', 'replyPost', 111, 0, 0, 1636600404, 1, 1);
INSERT INTO `ocenter_message` VALUES (375, 113, 114, '给您的帖子点赞', '', 'replyPost', 119, 0, 0, 1636799501, 1, 0);
INSERT INTO `ocenter_message` VALUES (376, 717, 1528, '微信不对啊，加不上', '', 'replyPost', 117, 0, 0, 1636956241, 1, 0);
INSERT INTO `ocenter_message` VALUES (377, 114, 874, '给您的帖子点赞', '', 'replyPost', 120, 0, 0, 1636965407, 1, 1);
INSERT INTO `ocenter_message` VALUES (378, 1552, 304, '给您的帖子点赞', '', 'replyPost', 115, 0, 0, 1637108943, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_module
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_module`;
CREATE TABLE `ocenter_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '模块名',
  `alias` varchar(30) NOT NULL COMMENT '中文名',
  `version` varchar(20) NOT NULL COMMENT '版本号',
  `is_com` tinyint(4) NOT NULL COMMENT '是否商业版',
  `show_nav` tinyint(4) NOT NULL COMMENT '是否显示在导航栏中',
  `summary` varchar(200) NOT NULL COMMENT '简介',
  `developer` varchar(50) NOT NULL COMMENT '开发者',
  `website` varchar(200) NOT NULL COMMENT '网址',
  `entry` varchar(50) NOT NULL COMMENT '前台入口',
  `is_setup` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否已安装',
  `sort` int(11) NOT NULL COMMENT '模块排序',
  `icon` varchar(20) NOT NULL,
  `can_uninstall` tinyint(4) NOT NULL,
  `admin_entry` varchar(50) NOT NULL,
  `menu_hide` tinyint(4) NOT NULL DEFAULT '0' COMMENT '后台入口隐藏',
  `auth_role` varchar(200) NOT NULL COMMENT '允许访问角色，为空表示非登录也能访问',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='模块管理表';

-- ----------------------------
-- Records of ocenter_module
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_module` VALUES (2, 'Ucenter', '用户中心', '2.0.0', 0, 0, '用户中心模块，系统核心模块', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Ucenter/index/index', 1, 0, 'user', 0, 'Admin/User/index', 1, '');
INSERT INTO `ocenter_module` VALUES (12, 'Core', '系统公共模块', '2.1.0', 0, 0, '系统核心模块，必不可少，负责核心的处理。', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', '', 1, 0, 'globe', 0, '', 0, '');
INSERT INTO `ocenter_module` VALUES (15, 'Crontab', 'crontab', '1.0.0', 0, 0, '计划任务模块', 'Dman group', '', '', 1, 0, 'laptop', 0, '', 0, '');
INSERT INTO `ocenter_module` VALUES (16, 'Api', 'api', '1.0.0', 0, 0, '开放API接口，用于社区接口', 'Dman group', '', '', 1, 0, 'laptop', 0, '', 0, '');
INSERT INTO `ocenter_module` VALUES (23, 'Nftcn', 'Nftcn', '1.0.0', 0, 0, '', '', '', '', 1, 0, 'globe', 0, 'Admin/Nftcn/index', 0, '');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_news_category
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_news_category`;
CREATE TABLE `ocenter_news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `pid` int(11) NOT NULL,
  `can_post` tinyint(4) NOT NULL COMMENT '前台可投稿',
  `need_audit` tinyint(4) NOT NULL COMMENT '前台投稿是否需要审核',
  `sort` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资讯分类';

-- ----------------------------
-- Records of ocenter_news_category
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_news_category` VALUES (1, 'DeFi学堂', 0, 1, 1, 1, 1);
INSERT INTO `ocenter_news_category` VALUES (2, '资讯', 0, 1, 1, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_news_reply
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_news_reply`;
CREATE TABLE `ocenter_news_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `to_f_reply_id` int(11) NOT NULL,
  `to_reply_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `is_del` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_news_reply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_news_search
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_news_search`;
CREATE TABLE `ocenter_news_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `historical` varchar(50) NOT NULL COMMENT '历史记录',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资讯';

-- ----------------------------
-- Records of ocenter_news_search
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_picture
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_picture`;
CREATE TABLE `ocenter_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `type` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_picture
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_picture` VALUES (1, 'local', '/Uploads/Picture/2021-08-10/61116a73116e8.jpg', '', '1d5623efe78b57c647ad465c2b12bdac', '7f8040fc9c885069d5b1b5cbdda886ac99455322', 1, 1628531314, 960, 486);
INSERT INTO `ocenter_picture` VALUES (2, 'local', '/Uploads/Picture/2021-08-11/61135cdd674a1.jpg', '', '33aa7fc23a5ef7248568b3f6a8b862d1', 'b73f1da912e4cb08a31404e749081edb08ed05f6', 1, 1628658909, 570, 280);
INSERT INTO `ocenter_picture` VALUES (3, 'local', '/Uploads/Picture/2021-08-11/61135ceb71c6c.jpg', '', '3b08c1c62561fc3d8afe78faaed7e189', 'ebff7f40ce5c8922ee83faeb4939ef6101f5d820', 1, 1628658923, 570, 280);
INSERT INTO `ocenter_picture` VALUES (4, 'local', '/Uploads/Picture/2021-08-11/61135cf40fdc7.jpg', '', '176a8d14764f4ad936bb6e5a741ee9b3', '980196a81033b8ce96272f5eb4ea211bb289dc07', 1, 1628658931, 570, 280);
INSERT INTO `ocenter_picture` VALUES (5, 'local', '/Uploads/Picture/2021-08-11/61135cfa65c35.jpg', '', '7515f8551d1b31c2654f16d9bf3cc781', '3322bd6e7b59370c27aeef8b25f0af66a9c4ae19', 1, 1628658938, 570, 280);
INSERT INTO `ocenter_picture` VALUES (6, 'local', '/Uploads/Picture/2021-08-11/611361a484c1f.jpg', '', '583f176496cfc415f866530795b56e86', '3a73e96928135a42b5acfdeba17ab95ead08692a', 1, 1628660132, 570, 280);
INSERT INTO `ocenter_picture` VALUES (7, 'local', '/Uploads/Picture/2021-08-11/611361a9e432e.jpg', '', 'edca60c9e1e1045356cdcd6ca5ff9b5e', '563db4965ce4f9b42c41df886f1794f008915d79', 1, 1628660137, 570, 280);
INSERT INTO `ocenter_picture` VALUES (8, 'local', '/Uploads/Picture/2021-08-11/611363e68a82e.jpg', '', 'a9f32e48d77c0e101c4d5227466ee50e', '8caa7ddfaff320264460c1448c88482f4d806417', 1, 1628660710, 960, 540);
INSERT INTO `ocenter_picture` VALUES (9, 'local', '/Uploads/Picture/2021-08-16/6119de972c49e.jpg', '', 'c711fee845d1644a63a4b12e76777f59', 'd3fc5fdd4f1619e4803a173287591ab5128b4b87', 1, 1629085335, 900, 383);
INSERT INTO `ocenter_picture` VALUES (10, 'local', '/Uploads/Picture/2021-09-03/613171d2b7f00.png', '', 'ab34e2ace9715281b826060395acc891', '7a5c597d379e1d8e2cc092201169f9148b6cae61', 1, 1630630354, 900, 383);
INSERT INTO `ocenter_picture` VALUES (11, 'local', '/Uploads/Picture/2021-09-03/613171ddb0353.png', '', 'e898586f7c29bfbf2efd72f1ed75d69c', '85f49cafd9e6f513c39a63d1fc69b634d871f812', 1, 1630630365, 900, 383);
INSERT INTO `ocenter_picture` VALUES (12, 'local', '/Uploads/Picture/2021-09-03/613173a24aafb.jpg', '', '63ac004bf9938451e3d6de47a821e685', '3d614b1b218c248086b4d63cbe34efb361f8a9bd', 1, 1630630818, 960, 486);
INSERT INTO `ocenter_picture` VALUES (13, 'local', '/Uploads/Picture/2021-09-03/613176c4b1848.png', '', '04720a9c92fd8079dea7ea32f9ac2f5f', 'c5bccb3d16ccf9cd83b9116e9d4641f5c5eeeb51', 1, 1630631620, 600, 387);
INSERT INTO `ocenter_picture` VALUES (14, 'local', '/Uploads/Picture/2021-09-03/6131770eb85d6.png', '', 'ae1fb24e9b434d25acac71252dffc8ec', '53ce95ed55138a18d640029edc11cdf79f4e3e1a', 1, 1630631694, 829, 462);
INSERT INTO `ocenter_picture` VALUES (15, 'local', '/Uploads/Picture/2021-09-03/6131771f46de1.png', '', 'c47de133d4145987a4b8fc6851e4b70b', '20fb558239f8d1adda4aaf1888bd585782143eb5', 1, 1630631711, 600, 435);
INSERT INTO `ocenter_picture` VALUES (16, 'local', '/Uploads/Picture/2021-09-03/6131a108e0c02.jpg', '', '04a59bc105c93038087dd0f55de4b9ba', '7fff265d76ed7fbbc4a5153b927c29e75c046acf', 1, 1630642440, 1200, 675);
INSERT INTO `ocenter_picture` VALUES (17, 'local', '/Uploads/Picture/2021-09-03/6131a719849a4.png', '', '5b916e93a8abe7f9bb0cf8bde829e9f7', 'cd9030135b3203a55316ab33375d6b863876c9c0', 1, 1630643993, 900, 383);
INSERT INTO `ocenter_picture` VALUES (18, 'local', '/Uploads/Picture/2021-09-03/6131ab93c6d36.png', '', '6736533a12963995475ff7908883071d', 'b72b05e12af838c13a9de09cfb28caa204d69de5', 1, 1630645139, 561, 174);
INSERT INTO `ocenter_picture` VALUES (19, 'local', '/Uploads/Picture/2021-09-03/6131abba72bd1.png', '', '41d537726264557641a8917d06279866', '4542c48753938a69328cab070f10ad67b636d8d3', 1, 1630645178, 1080, 623);
INSERT INTO `ocenter_picture` VALUES (20, 'local', '/Uploads/Picture/2021-09-03/6131b05298da6.jpeg', '', '64531c42aa55483441ae67949aff8cd2', '5a896305004e540904ae70e6551ad18943ad831b', 1, 1630646354, 707, 300);
INSERT INTO `ocenter_picture` VALUES (21, 'local', '/Uploads/Picture/2021-09-03/6131b50f23c54.png', '', '72dae152e0cd30bf26a2a7d7713c7651', 'b678ff1940859238cb9920758ff217d21d6d9d21', 1, 1630647567, 750, 450);
INSERT INTO `ocenter_picture` VALUES (22, 'local', '/Uploads/Picture/2021-09-03/6131bdf1e8f61.jpg', '', 'aa5c47ba4b064099ad8e0ad337a1c484', 'd20d122e15cbafe4a19541e27dda1ebe900bb3ec', 1, 1630649841, 623, 353);
INSERT INTO `ocenter_picture` VALUES (23, 'local', '/Uploads/Picture/2021-09-03/6131c131b6a44.jpg', '', '0792dbbbddeb2cd3efb0636f296d43b3', '75c1f737d7db63d7515adcf904e2e7dbfecd7e72', 1, 1630650673, 900, 383);
INSERT INTO `ocenter_picture` VALUES (24, 'local', '/Uploads/Picture/2021-09-03/613217c7859e7.jpg', '', 'e47899a61857212e8351bde40b627437', '29a3d231937479558e0d19ed5a22be88b7ba02a9', 1, 1630672839, 550, 330);
INSERT INTO `ocenter_picture` VALUES (25, 'local', '/Uploads/Picture/2021-09-03/61321daac105e.jpeg', '', 'b6b0d7309163611f6917c67910732bc5', '17100ff48a596ada050a4e905be48da50d0ff8c2', 1, 1630674346, 500, 293);
INSERT INTO `ocenter_picture` VALUES (26, 'local', '/Uploads/Picture/2021-09-05/6134380241a4a.gif', '', 'decd6ff52b21906b8203b40950496606', '79ccf538130b0a7e1cfc77fa3ddcaaf5388f00e0', 1, 1630812162, 1080, 300);
INSERT INTO `ocenter_picture` VALUES (27, 'local', '/Uploads/Picture/2021-09-07/6136cf1be4e36.jpg', '', 'de5506a7bb4f8747aef59f9714c462d6', 'af6b3736e8eee217e08264beae3bb9138e6d4337', 1, 1630981915, 1000, 500);
INSERT INTO `ocenter_picture` VALUES (28, 'local', '/Uploads/Editor/Picture/2021-09-14/61407e837e8ce.png', '', 'eb29cd993b850350d02be6448b4eb325', '47da76ed1a619674293580aa9f2ebb16e8852e23', 1, 1631616643, 600, 291);
INSERT INTO `ocenter_picture` VALUES (29, 'local', '/Uploads/Picture/2021-09-18/614569dbc9bf3.jpg', '', 'd3afc92f080f7634e848efab4227b8e6', '522b1c06109a21f08f9f82b30bbf68f0abdc2848', 1, 1631939035, 1080, 439);
INSERT INTO `ocenter_picture` VALUES (30, 'local', '/Uploads/Picture/2021-09-18/61456e5f16101.jpg', '', '9296a22dd161e5b3a9c3e82147c2d656', '4af3c47841d4becfd6d8fa212e23a277c48351f5', 1, 1631940191, 1440, 900);
INSERT INTO `ocenter_picture` VALUES (31, 'local', '/Uploads/Picture/2021-09-18/61456ed776d60.jpg', '', '36aaa75e08babc5ddace242d3f94a72b', '12177cf73d2a0b0f769ab31bf11ac9ade5ad9cdc', 1, 1631940311, 492, 531);
INSERT INTO `ocenter_picture` VALUES (32, 'local', '/Uploads/Editor/Picture/2021-09-24/614d607f7e8a7.jpg', '', 'c34b67ce577174d9b0934add3de05c19', 'ee43275e77dfb5b730902577b47d0b1e6485190f', 1, 1632460927, 948, 468);
INSERT INTO `ocenter_picture` VALUES (33, 'local', '/Uploads/Editor/Picture/2021-09-24/614d60fa3ddde.jpg', '', '8e0ea084d0038d8c1c459b2894729d46', '91f290b36e0730d67df32dff8bd5059ba5857529', 1, 1632461050, 592, 309);
INSERT INTO `ocenter_picture` VALUES (34, 'local', '/Uploads/Editor/Picture/2021-09-24/614d61d85c14e.png', '', 'c0911fa42e9125803bb136608e027a2e', '50f1b5a395ee2cba7f3341b8947507f036a11619', 1, 1632461272, 646, 400);
INSERT INTO `ocenter_picture` VALUES (35, 'local', '/Uploads/Picture/2021-09-24/614d671935b7a.png', '', '77822bb541a98fc850200a49a956dbbc', 'd91438d2ac2aedbd30bda368f344e82d1deba28a', 1, 1632462617, 459, 231);
INSERT INTO `ocenter_picture` VALUES (36, 'local', '/Uploads/Editor/Picture/2021-09-24/614de35f6d470.png', '', '22293203785166f3b26df859d6110d16', '48f35921cc6f534119649fa171f007362d1c3866', 1, 1632494431, 800, 800);
INSERT INTO `ocenter_picture` VALUES (37, 'local', '/Uploads/Picture/2021-10-09/616184cc04fec.png', '', 'f85beb4b211913bfabac964a9ec29a08', 'e88856c341748f38b80039b368fba85db96f0856', 1, 1633780939, 500, 250);
INSERT INTO `ocenter_picture` VALUES (38, 'local', '/Uploads/Picture/2021-10-14/616791f9ca299.png', '', '3007199582dec092f5c89aaf0927a9ea', '1891ba64e23cdc47d326aa189ac7e69e08be4551', 1, 1634177529, 900, 383);
INSERT INTO `ocenter_picture` VALUES (39, 'local', '/Uploads/Picture/2021-10-14/616793b69ce47.jpg', '', '64fff15d707aa35afee5d9d6e5f1ecf0', '0cb5a41503fc983b0970daa92f90744f304a054a', 1, 1634177974, 900, 383);
INSERT INTO `ocenter_picture` VALUES (40, 'local', '/Uploads/Picture/2021-10-25/6176b81d66b5d.png', '', 'b68e858e2e31f8bf08848261e3ca8fe9', '44001d18a826d1dd27305236873c6199eb0d2996', 1, 1635170333, 900, 383);
INSERT INTO `ocenter_picture` VALUES (41, 'local', '/Uploads/Editor/Picture/2021-10-25/6176b8ef7f99b.jpg', '', '8b2d58ad6bbbfc3a9c12a028e19a803f', '76790a3d8d7476bb8472de179782a3a042d1e59e', 1, 1635170543, 900, 383);
INSERT INTO `ocenter_picture` VALUES (42, 'local', '/Uploads/Picture/2021-11-05/6184d16bc8a74.png', '', 'aa44a567fbde2a6f8c09b283ad202988', 'd3eb231497dbdc221c47186220cb6c1c4ec6be3d', 1, 1636094315, 900, 383);
INSERT INTO `ocenter_picture` VALUES (43, 'local', '/Uploads/Picture/2021-11-05/6184d1e0aaee6.jpg', '', '8d4764f8a6f81c114e983a0831df538a', '3ca4a8fc4f721f3e65de00dc45eaff30d2d3beb2', 1, 1636094432, 900, 383);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_question
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_question`;
CREATE TABLE `ocenter_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `correct_option` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_question
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_question` VALUES (1, '3 x7=?', '20', '10', '21', '27', 2);
INSERT INTO `ocenter_question` VALUES (3, '当遇到综合频道聊天有人使用色情头像时，你应该', '跟对方搭讪', '点头像举报', '', '', 1);
INSERT INTO `ocenter_question` VALUES (4, '历史上，孔子座下有多少贤人？', '五十四', '七十二', '十八', '三十六', 1);
INSERT INTO `ocenter_question` VALUES (5, '《封神演义》中，太乙真人属于以下哪个阵营？', '人教', '阐教', '佛教', '截教', 1);
INSERT INTO `ocenter_question` VALUES (6, '英国首都是？', '伦敦', '爱丁堡', '利物浦', '格拉斯哥', 0);
INSERT INTO `ocenter_question` VALUES (7, '历史上，兰陵王的真名是？', '李牧', '刘德华', '高隆基', '高长恭', 3);
INSERT INTO `ocenter_question` VALUES (8, '民间流传中，上官婉儿在武则天当政时期被称为什么？', '巾帼英雄', '巾帼宰相', '红颜薄命', '贵人英雄', 1);
INSERT INTO `ocenter_question` VALUES (9, '历史上，”成也萧何，败也萧何“说的是以下哪位人物？', '樊哙', '彭越', '韩信', '张良', 2);
INSERT INTO `ocenter_question` VALUES (10, 'BTC减产周期？', '2年', '4年', '6年', '3年', 1);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_queue
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_queue`;
CREATE TABLE `ocenter_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller_url` varchar(255) NOT NULL,
  `parameter` varchar(255) NOT NULL COMMENT '参数',
  `ctime` int(11) NOT NULL,
  `etime` int(11) NOT NULL COMMENT '执行时间',
  `status` int(255) NOT NULL COMMENT '0待执行 1已执行',
  `exe_result` varchar(255) NOT NULL COMMENT '执行结果',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_queue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_queue_log
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_queue_log`;
CREATE TABLE `ocenter_queue_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ctime` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `etime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_queue_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_rank
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_rank`;
CREATE TABLE `ocenter_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '上传者id',
  `title` varchar(50) NOT NULL,
  `logo` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `types` tinyint(2) NOT NULL DEFAULT '1' COMMENT '前台是否可申请',
  `label_content` varchar(10) NOT NULL COMMENT '文字头衔内容',
  `label_color` varchar(10) NOT NULL COMMENT '文字颜色',
  `label_bg` varchar(10) NOT NULL COMMENT 'label背景色',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_rank
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_rank_user
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_rank_user`;
CREATE TABLE `ocenter_rank_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `is_show` tinyint(4) NOT NULL COMMENT '是否显示在昵称右侧（必须有图片才可）',
  `create_time` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_rank_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_register
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_register`;
CREATE TABLE `ocenter_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `from` char(50) NOT NULL COMMENT '注册终端',
  `type` char(50) NOT NULL COMMENT '注册方式',
  `status` int(4) NOT NULL COMMENT '注册状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1458 DEFAULT CHARSET=utf8 COMMENT='注册终端和方式统计';

-- ----------------------------
-- Records of ocenter_register
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_report
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_report`;
CREATE TABLE `ocenter_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `uid` int(11) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `data` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `updata_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `handle_status` tinyint(4) NOT NULL,
  `handle_result` text NOT NULL,
  `handle_uid` int(11) NOT NULL,
  `handle_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_report
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_role
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_role`;
CREATE TABLE `ocenter_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '角色组id',
  `name` varchar(25) NOT NULL COMMENT '英文标识',
  `title` varchar(25) NOT NULL COMMENT '中文标题',
  `description` varchar(500) NOT NULL COMMENT '描述',
  `user_groups` varchar(200) NOT NULL COMMENT '默认权限组ids',
  `invite` tinyint(4) NOT NULL COMMENT '预留字段(类型：是否需要邀请注册等)',
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  `sort` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ocenter_role
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_role` VALUES (1, 0, 'default', '普通用户', '普通用户', '1', 0, 0, 0, 1, 1516788032, 1516788032);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_role_config
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_role_config`;
CREATE TABLE `ocenter_role_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL COMMENT '标识',
  `category` varchar(25) NOT NULL COMMENT '归类标识',
  `value` text NOT NULL COMMENT '配置值',
  `data` text NOT NULL COMMENT '该配置的其它值',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色配置表';

-- ----------------------------
-- Records of ocenter_role_config
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_role_config` VALUES (1, 1, 'user_tag', '', '2,3', '', 1476755028);
INSERT INTO `ocenter_role_config` VALUES (2, 1, 'expend_field', 'expend_field', '1,2,3,4,5,6,7', '', 1476755034);
INSERT INTO `ocenter_role_config` VALUES (3, 1, 'register_expend_field', 'expend_field', '1,2,3,4,5,6,7', '', 1476755110);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_role_group
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_role_group`;
CREATE TABLE `ocenter_role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色分组';

-- ----------------------------
-- Records of ocenter_role_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_schedule
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_schedule`;
CREATE TABLE `ocenter_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(100) NOT NULL,
  `args` varchar(500) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `type_value` varchar(200) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `intro` varchar(500) NOT NULL,
  `lever` int(11) NOT NULL COMMENT '优先级',
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_schedule
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_schedule` VALUES (1, 'Admin/Count->dayCount', '', 3, 'Daily=01:00', 1469167215, 2147483647, '执行了数据统计', 0, 0, 1469167281);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_sensitive
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_sensitive`;
CREATE TABLE `ocenter_sensitive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_sensitive
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_seo_rule
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_seo_rule`;
CREATE TABLE `ocenter_seo_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `app` varchar(40) NOT NULL,
  `controller` varchar(40) NOT NULL,
  `action` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `seo_keywords` text NOT NULL,
  `seo_description` text NOT NULL,
  `seo_title` text NOT NULL,
  `sort` int(11) NOT NULL,
  `summary` varchar(500) NOT NULL COMMENT 'seo变量介绍',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_seo_rule
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_seo_rule` VALUES (1000, '整站标题', '', '', '', 1, '', '', '', 7, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1001, '用户中心', 'Ucenter', 'index', 'index', 1, '{$user_info.username|text}的个人主页', '{$user_info.username|text}的个人主页', '{$user_info.nickname|op_t}的个人主页', 3, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1002, '网站首页', 'Home', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1003, '积分商城首页', 'Shop', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1004, '商品列表', 'Shop', 'Index', 'goods', 1, '', '', '', 0, 'category_name：当前分类名\nchild_category_name：子分类名');
INSERT INTO `ocenter_seo_rule` VALUES (1005, '商品详情', 'Shop', 'Index', 'goodsdetail', 1, '', '', '', 0, 'content：商品变量集\n   content.goods_name 商品名\n   content.goods_introduct 商品简介\n   content.goods_detail 商品详情');
INSERT INTO `ocenter_seo_rule` VALUES (1006, '活动主页', 'Event', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1007, '活动详情', 'Event', 'Index', 'detail', 1, '', '', '', 0, 'content：活动变量集\n   content.title 活动名称\n   content.type.title 活动分类名\n   content.user.nickname 发起人昵称\n   content.address 活动地点\n   content.limitCount 人数限制');
INSERT INTO `ocenter_seo_rule` VALUES (1008, '活动成员', 'Event', 'Index', 'member', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1009, '专辑首页', 'Issue', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1010, '专辑详情', 'Issue', 'Index', 'issuecontentdetail', 1, '', '', '', 0, 'content：专辑内容变量集\n   content.user.nickname 内容发布者昵称\n   content.user.signature 内容发布者签名\n   content.url 内容的Url\n   content.title 内容标题\n   content.create_time|friendlyDate 发布时间\n   content.update_time|friendlyDate 更新时间');
INSERT INTO `ocenter_seo_rule` VALUES (1011, '论坛主页', 'Forum', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1012, '某个版块的帖子列表', 'Forum', 'Index', 'forum', 1, '', '', '', 0, 'forum：版块变量集\n   forum.description 版块描述\n   forum.title 版块名称\n   forum.topic_count 主题数\n   forum.total_count 帖子数');
INSERT INTO `ocenter_seo_rule` VALUES (1013, '帖子详情', 'Forum', 'Index', 'detail', 1, '', '', '', 0, 'post：帖子变量集\n   post.title 帖子标题\n   post.content 帖子详情\n   post.forum.title 帖子所在版块标题\n   ');
INSERT INTO `ocenter_seo_rule` VALUES (1014, '搜索帖子', 'Forum', 'Index', 'search', 1, '', '', '', 0, 'keywords：搜索的关键词，2.4.0以后版本提供');
INSERT INTO `ocenter_seo_rule` VALUES (1015, '随便看看', 'Forum', 'Index', 'look', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1016, '全部版块', 'Forum', 'Index', 'lists', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1017, '资讯首页/某个分类下的文章列表', 'News', 'Index', 'index', 1, '', '', '', 0, 'now_category.title 当前分类的名称');
INSERT INTO `ocenter_seo_rule` VALUES (1018, '某篇文章的内容页', 'News', 'Index', 'detail', 1, '', '', '', 0, 'now_category.title 当前分类的名称\ninfo：文章变量集\n   info.title 文章标题\n   info.description 文章摘要\n   info.source 文章来源\n   info.detail.content 文章内容\nauthor.nickname 作者昵称\nauthor.signature 作者签名\n   ');
INSERT INTO `ocenter_seo_rule` VALUES (1019, '微博首页', 'Weibo', 'Index', 'index', 1, '{$MODULE_ALIAS}', '{$MODULE_ALIAS}首页', '{$MODULE_ALIAS}-{$website_name}', 0, 'title：我关注的、热门微博、全站关注');
INSERT INTO `ocenter_seo_rule` VALUES (1020, '某条微博的详情页', 'Weibo', 'Index', 'weibodetail', 1, '{$weibo.title|text},{$website_name},{$MODULE_ALIAS}', '{$weibo.content|text}', '{$weibo.content|text}——{$MODULE_ALIAS}', 0, 'weibo:微博变量集\n   weibo.user.nickname 发布者昵称\n   weibo.content 微博内容');
INSERT INTO `ocenter_seo_rule` VALUES (1021, '微博搜索页面', 'Weibo', 'Index', 'search', 1, '', '', '', 0, 'search_keywords：搜索关键词');
INSERT INTO `ocenter_seo_rule` VALUES (1022, '热门话题列表', 'Weibo', 'Topic', 'topic', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1023, '某个话题的话题页', 'Weibo', 'Topic', 'index', 1, '', '', '', 0, 'topic：话题变量集\n   topic.name 话题名称\nhost：话题主持人变量集\n   host.nickname 主持人昵称');
INSERT INTO `ocenter_seo_rule` VALUES (1024, '自动跳转到我的群组', 'Group', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1025, '全部群组', 'Group', 'Index', 'groups', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1026, '我的群组-帖子列表', 'Group', 'Index', 'my', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1027, '我的群组-全部关注的群组列表', 'Group', 'Index', 'mygroup', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1028, '某个群组的帖子列表页面', 'Group', 'Index', 'group', 1, '', '', '', 0, 'search_key：如果查找帖子，则是关键词\ngroup：群组变量集\n   group.title 群组标题\n   group.user.nickname 创始人昵称\n   group.member_count 群组人数');
INSERT INTO `ocenter_seo_rule` VALUES (1029, '某篇帖子的内容页', 'Group', 'Index', 'detail', 1, '', '', '', 0, 'group：群组变量集\n   group.title 群组标题\n   group.user.nickname 创始人昵称\n   group.member_count 群组人数\npost：帖子变量集\n   post.title 帖子标题\n   post.content 帖子内容');
INSERT INTO `ocenter_seo_rule` VALUES (1030, '创建群组', 'Group', 'Index', 'create', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1031, '发现', 'Group', 'Index', 'discover', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1032, '精选', 'Group', 'Index', 'select', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1033, '找人首页', 'People', 'Index', 'index', 1, '{$MODULE_ALIAS}', '{$MODULE_ALIAS}', '{$MODULE_ALIAS}', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1034, '微店首页', 'Store', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1035, '某个分类下的商品列表页', 'Store', 'Index', 'li', 1, '', '', '', 0, 'type：当前分类变量集\n   type.title 分类名称');
INSERT INTO `ocenter_seo_rule` VALUES (1036, '搜索商品列表页', 'Store', 'Index', 'search', 1, '', '', '', 0, 'searchKey：搜索关键词');
INSERT INTO `ocenter_seo_rule` VALUES (1037, '单个商品的详情页', 'Store', 'Index', 'info', 1, '', '', '', 0, 'info：商品变量集\n   info.title 商品标题\n   info.des 商品描述\n   info.shop：店铺变量集\n       info.shop.title 店铺名称\n       info.shop.summary 店铺简介\n       info.shop.position 店铺所在地\n       info.shop.user.nickname 店主昵称');
INSERT INTO `ocenter_seo_rule` VALUES (1038, '店铺街', 'Store', 'Index', 'lists', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1039, '某个店铺的首页', 'Store', 'Shop', 'detail', 1, '', '', '', 0, 'shop：店铺变量集\n   shop.title 店铺名称\n   shop.summary 店铺简介\n   shop.position 店铺所在地\n   shop.user.nickname 店主昵称');
INSERT INTO `ocenter_seo_rule` VALUES (1040, '某个店铺下的商品列表页', 'Store', 'Shop', 'goods', 1, '', '', '', 0, 'shop：店铺变量集\n   shop.title 店铺名称\n   shop.summary 店铺简介\n   shop.position 店铺所在地\n   shop.user.nickname 店主昵称');
INSERT INTO `ocenter_seo_rule` VALUES (1041, '分类信息首页', 'Cat', 'Index', 'index', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1042, '某个模型下的列表页', 'Cat', 'Index', 'li', 1, '', '', '', 0, 'entity：当前模型变量集\n   entity.alias 模型名');
INSERT INTO `ocenter_seo_rule` VALUES (1043, '某条信息的详情页', 'Cat', 'Index', 'info', 1, '', '', '', 0, 'entity：当前模型变量集\n   entity.alias 模型名\ninfo：当前信息\n   info.title 信息名称\nuser.nickname 发布者昵称');
INSERT INTO `ocenter_seo_rule` VALUES (1044, '待回答页面', 'Question', 'Index', 'waitanswer', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1045, '热门问题', 'Question', 'Index', 'goodquestion', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1046, '我的回答', 'Question', 'Index', 'myquestion', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1047, '全部问题', 'Question', 'Index', 'questions', 1, '', '', '', 0, '-');
INSERT INTO `ocenter_seo_rule` VALUES (1048, '详情', 'Question', 'Index', 'detail', 1, '', '', '', 0, 'question：问题变量集\n   question.title 问题标题\n   question.description 问题描述\n   question.answer_num 回答数\nbest_answer：最佳回答\n   best_answer.content 最佳答案内容');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_sso_app
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_sso_app`;
CREATE TABLE `ocenter_sso_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_sso_app
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_super_links
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_super_links`;
CREATE TABLE `ocenter_super_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '类别（1：图片，2：普通）',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '站点名称',
  `cover_id` int(10) NOT NULL COMMENT '图片ID',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='友情连接表';

-- ----------------------------
-- Records of ocenter_super_links
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_support
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_support`;
CREATE TABLE `ocenter_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appname` varchar(20) NOT NULL COMMENT '应用名',
  `row` int(11) NOT NULL COMMENT '应用标识',
  `uid` int(11) NOT NULL COMMENT '用户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `table` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=368 DEFAULT CHARSET=utf8 COMMENT='支持的表';

-- ----------------------------
-- Records of ocenter_support
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_support` VALUES (1, 'app', 8, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (2, 'app', 7, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (3, 'app', 6, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (4, 'app', 9, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (5, 'app', 9, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (6, 'app', 7, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (7, 'app', 10, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (8, 'app', 11, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (9, 'app', 8, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (10, 'app', 9, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (11, 'app', 11, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (12, 'app', 10, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (13, 'app', 11, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (14, 'app', 14, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (15, 'app', 15, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (16, 'app', 15, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (17, 'app', 16, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (18, 'app', 14, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (19, 'app', 16, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (20, 'app', 17, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (21, 'app', 16, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (22, 'app', 16, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (23, 'app', 20, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (24, 'app', 19, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (25, 'app', 22, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (26, 'app', 21, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (27, 'app', 19, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (28, 'app', 18, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (29, 'app', 23, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (30, 'app', 24, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (31, 'app', 25, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (32, 'app', 21, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (33, 'app', 20, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (34, 'app', 19, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (35, 'app', 18, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (36, 'app', 17, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (37, 'app', 16, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (38, 'app', 16, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (39, 'app', 17, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (40, 'app', 18, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (41, 'app', 20, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (42, 'app', 26, 120, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (43, 'app', 21, 120, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (44, 'app', 25, 106, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (45, 'app', 27, 106, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (46, 'app', 28, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (47, 'app', 28, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (48, 'app', 27, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (49, 'app', 26, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (50, 'app', 27, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (51, 'app', 29, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (52, 'app', 27, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (53, 'app', 28, 106, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (54, 'app', 55, 106, 0, 'ForumLzlReply');
INSERT INTO `ocenter_support` VALUES (55, 'app', 54, 106, 0, 'ForumLzlReply');
INSERT INTO `ocenter_support` VALUES (56, 'app', 55, 106, 0, 'ForumPostReply');
INSERT INTO `ocenter_support` VALUES (57, 'app', 54, 106, 0, 'ForumPostReply');
INSERT INTO `ocenter_support` VALUES (58, 'app', 56, 106, 0, 'ForumPostReply');
INSERT INTO `ocenter_support` VALUES (59, 'app', 123, 106, 0, 'ForumLzlReply');
INSERT INTO `ocenter_support` VALUES (60, 'app', 124, 106, 0, 'ForumLzlReply');
INSERT INTO `ocenter_support` VALUES (61, 'app', 29, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (62, 'app', 29, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (63, 'app', 56, 105, 0, 'ForumPostReply');
INSERT INTO `ocenter_support` VALUES (64, 'app', 57, 105, 0, 'ForumPostReply');
INSERT INTO `ocenter_support` VALUES (65, 'app', 58, 105, 0, 'ForumPostReply');
INSERT INTO `ocenter_support` VALUES (66, 'app', 125, 105, 0, 'ForumLzlReply');
INSERT INTO `ocenter_support` VALUES (67, 'app', 124, 105, 0, 'ForumLzlReply');
INSERT INTO `ocenter_support` VALUES (68, 'app', 123, 105, 0, 'ForumLzlReply');
INSERT INTO `ocenter_support` VALUES (69, 'app', 30, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (70, 'app', 31, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (71, 'app', 31, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (72, 'app', 25, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (73, 'app', 17, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (74, 'app', 29, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (75, 'app', 31, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (76, 'app', 26, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (77, 'app', 28, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (78, 'app', 30, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (79, 'app', 32, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (80, 'app', 34, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (81, 'app', 30, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (82, 'app', 34, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (83, 'app', 33, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (84, 'app', 32, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (85, 'app', 31, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (86, 'app', 30, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (87, 'app', 29, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (88, 'app', 28, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (89, 'app', 27, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (90, 'app', 26, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (91, 'app', 25, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (92, 'app', 21, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (93, 'app', 20, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (94, 'app', 19, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (95, 'app', 18, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (96, 'app', 17, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (97, 'app', 15, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (98, 'app', 16, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (99, 'app', 14, 118, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (100, 'app', 35, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (101, 'app', 36, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (102, 'app', 35, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (103, 'app', 15, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (104, 'app', 14, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (105, 'app', 36, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (106, 'app', 34, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (107, 'app', 33, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (108, 'app', 32, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (109, 'app', 31, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (110, 'app', 29, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (111, 'app', 25, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (112, 'app', 20, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (113, 'app', 18, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (114, 'app', 17, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (115, 'app', 35, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (116, 'app', 34, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (117, 'app', 37, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (118, 'app', 37, 105, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (119, 'app', 65, 105, 0, 'ForumPostReply');
INSERT INTO `ocenter_support` VALUES (120, 'app', 126, 105, 0, 'ForumLzlReply');
INSERT INTO `ocenter_support` VALUES (121, 'app', 19, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (122, 'app', 38, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (123, 'app', 38, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (124, 'app', 38, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (125, 'app', 37, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (126, 'app', 35, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (127, 'app', 34, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (128, 'app', 33, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (129, 'app', 32, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (130, 'app', 31, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (131, 'app', 30, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (132, 'app', 29, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (133, 'app', 28, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (134, 'app', 27, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (135, 'app', 26, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (136, 'app', 25, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (137, 'app', 21, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (138, 'app', 20, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (139, 'app', 19, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (140, 'app', 17, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (141, 'app', 16, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (142, 'app', 15, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (143, 'app', 14, 112, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (144, 'app', 39, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (145, 'app', 40, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (146, 'app', 40, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (147, 'app', 41, 119, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (148, 'app', 37, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (149, 'app', 41, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (150, 'app', 41, 247, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (151, 'app', 42, 119, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (152, 'app', 41, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (153, 'app', 45, 151, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (154, 'app', 43, 151, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (155, 'app', 46, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (156, 'app', 45, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (157, 'app', 44, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (158, 'app', 35, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (159, 'app', 38, 199, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (160, 'app', 47, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (161, 'app', 48, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (162, 'app', 48, 436, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (163, 'app', 49, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (164, 'app', 43, 163, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (165, 'app', 54, 163, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (166, 'app', 53, 163, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (167, 'app', 52, 163, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (168, 'app', 55, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (169, 'app', 54, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (170, 'app', 53, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (171, 'app', 52, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (172, 'app', 51, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (173, 'app', 50, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (174, 'app', 47, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (175, 'app', 48, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (176, 'app', 56, 111, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (177, 'app', 56, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (178, 'app', 57, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (179, 'app', 58, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (180, 'app', 19, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (181, 'app', 58, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (182, 'app', 59, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (183, 'app', 60, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (184, 'app', 60, 149, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (185, 'app', 61, 149, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (186, 'app', 62, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (187, 'app', 60, 273, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (188, 'app', 62, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (189, 'app', 60, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (190, 'app', 59, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (191, 'app', 57, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (192, 'app', 62, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (193, 'app', 63, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (194, 'app', 64, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (195, 'app', 65, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (196, 'app', 61, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (197, 'app', 63, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (198, 'app', 41, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (199, 'app', 66, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (200, 'app', 67, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (201, 'app', 66, 593, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (202, 'app', 38, 592, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (203, 'app', 70, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (204, 'app', 70, 478, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (205, 'app', 70, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (206, 'app', 71, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (207, 'app', 71, 612, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (208, 'app', 62, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (209, 'app', 71, 676, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (210, 'app', 71, 712, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (211, 'app', 69, 712, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (212, 'app', 71, 717, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (213, 'app', 71, 770, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (214, 'app', 72, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (215, 'app', 72, 855, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (216, 'app', 76, 490, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (217, 'app', 76, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (218, 'app', 78, 199, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (219, 'app', 77, 199, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (220, 'app', 76, 199, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (221, 'app', 78, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (222, 'app', 77, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (223, 'app', 79, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (224, 'app', 82, 114, 0, 'ForumPostReply');
INSERT INTO `ocenter_support` VALUES (225, 'app', 76, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (226, 'app', 75, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (227, 'app', 74, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (228, 'app', 73, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (229, 'app', 72, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (230, 'app', 71, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (231, 'app', 70, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (232, 'app', 69, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (233, 'app', 68, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (234, 'app', 67, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (235, 'app', 66, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (236, 'app', 65, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (237, 'app', 64, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (238, 'app', 63, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (239, 'app', 62, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (240, 'app', 61, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (241, 'app', 60, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (242, 'app', 59, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (243, 'app', 58, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (244, 'app', 57, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (245, 'app', 56, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (246, 'app', 55, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (247, 'app', 54, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (248, 'app', 78, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (249, 'app', 77, 109, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (250, 'app', 79, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (251, 'app', 76, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (252, 'app', 79, 304, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (253, 'app', 78, 304, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (254, 'app', 77, 304, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (255, 'app', 76, 304, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (256, 'app', 75, 304, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (257, 'app', 74, 304, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (258, 'app', 73, 304, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (259, 'app', 72, 304, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (260, 'app', 71, 304, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (261, 'app', 70, 304, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (262, 'app', 79, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (263, 'app', 78, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (264, 'app', 77, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (265, 'app', 76, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (266, 'app', 77, 1054, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (267, 'app', 81, 957, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (268, 'app', 81, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (269, 'app', 80, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (270, 'app', 81, 1054, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (271, 'app', 82, 1021, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (272, 'app', 77, 1101, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (273, 'app', 61, 1126, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (274, 'app', 76, 1122, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (275, 'app', 74, 1122, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (276, 'app', 83, 1101, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (277, 'app', 82, 1101, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (278, 'app', 85, 1197, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (279, 'app', 84, 1197, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (280, 'app', 87, 1101, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (281, 'app', 86, 1101, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (282, 'app', 89, 1254, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (283, 'app', 89, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (284, 'app', 90, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (285, 'app', 88, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (286, 'app', 87, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (287, 'app', 86, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (288, 'app', 85, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (289, 'app', 84, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (290, 'app', 83, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (291, 'app', 90, 1215, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (292, 'app', 95, 1110, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (293, 'app', 99, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (294, 'app', 98, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (295, 'app', 97, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (296, 'app', 96, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (297, 'app', 95, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (298, 'app', 94, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (299, 'app', 93, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (300, 'app', 92, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (301, 'app', 91, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (302, 'app', 96, 1296, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (303, 'app', 101, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (304, 'app', 100, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (305, 'app', 101, 1280, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (306, 'app', 100, 1280, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (307, 'app', 99, 1280, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (308, 'app', 20, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (309, 'app', 90, 1173, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (310, 'app', 91, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (311, 'app', 78, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (312, 'app', 80, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (313, 'app', 82, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (314, 'app', 84, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (315, 'app', 85, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (316, 'app', 86, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (317, 'app', 102, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (318, 'app', 101, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (319, 'app', 100, 786, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (320, 'app', 103, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (321, 'app', 102, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (322, 'app', 103, 1461, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (323, 'app', 82, 1461, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (324, 'app', 79, 1461, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (325, 'app', 70, 1461, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (326, 'app', 67, 1461, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (327, 'app', 104, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (328, 'app', 104, 874, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (329, 'app', 83, 957, 0, 'ForumPostReply');
INSERT INTO `ocenter_support` VALUES (330, 'app', 109, 1264, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (331, 'app', 109, 1207, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (332, 'app', 109, 1509, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (333, 'app', 93, 114, 0, 'ForumPostReply');
INSERT INTO `ocenter_support` VALUES (334, 'app', 110, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (335, 'app', 110, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (336, 'app', 108, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (337, 'app', 107, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (338, 'app', 106, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (339, 'app', 105, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (340, 'app', 104, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (341, 'app', 102, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (342, 'app', 101, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (343, 'app', 99, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (344, 'app', 96, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (345, 'app', 95, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (346, 'app', 93, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (347, 'app', 92, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (348, 'app', 91, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (349, 'app', 90, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (350, 'app', 89, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (351, 'app', 88, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (352, 'app', 87, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (353, 'app', 85, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (354, 'app', 84, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (355, 'app', 83, 1516, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (356, 'app', 110, 1455, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (357, 'app', 117, 1528, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (358, 'app', 117, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (359, 'app', 116, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (360, 'app', 115, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (361, 'app', 118, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (362, 'app', 119, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (363, 'app', 112, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (364, 'app', 111, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (365, 'app', 119, 113, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (366, 'app', 120, 114, 0, 'ForumPost');
INSERT INTO `ocenter_support` VALUES (367, 'app', 115, 1552, 0, 'ForumPost');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_sync_login
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_sync_login`;
CREATE TABLE `ocenter_sync_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type_uid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `oauth_token` varchar(255) NOT NULL,
  `oauth_token_secret` varchar(255) NOT NULL,
  `is_sync` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_sync_login
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_task_log
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_task_log`;
CREATE TABLE `ocenter_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `imei` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `device` varchar(255) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_task_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_tile
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_tile`;
CREATE TABLE `ocenter_tile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '父页面id',
  `icon` varchar(20) NOT NULL COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(11) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `title_vo` varchar(50) NOT NULL COMMENT '父页面标题',
  `url` varchar(255) NOT NULL COMMENT '路径',
  `url_vo` varchar(255) NOT NULL COMMENT '父页面路径',
  `tile_bg` varchar(10) NOT NULL COMMENT '块颜色(背景)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='常用操作';

-- ----------------------------
-- Records of ocenter_tile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_ucenter_admin`;
CREATE TABLE `ocenter_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of ocenter_ucenter_admin
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_ucenter_member`;
CREATE TABLE `ocenter_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(200) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  `type` tinyint(4) NOT NULL COMMENT '1为用户名注册，2为邮箱注册，3为手机注册',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1810 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ocenter_ucenter_member
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_ucenter_member` VALUES (1, '0xea910149390233684457d6c6b6dbae5795bd455c', '40da34bfb7695027126e7af56e40bf9f', '00000000@qq.com', '', 1516788032, 2130706433, 1655456185, 2130706433, 1516788032, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_ucenter_score_type
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_ucenter_score_type`;
CREATE TABLE `ocenter_ucenter_score_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `type_value` int(11) NOT NULL,
  `type_key` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_ucenter_score_type
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_ucenter_score_type` VALUES (1, '积分', 1, '分', 0, 0);
INSERT INTO `ocenter_ucenter_score_type` VALUES (2, '威望', 1, '点', 0, 0);
INSERT INTO `ocenter_ucenter_score_type` VALUES (3, '贡献', 1, '元', 0, 0);
INSERT INTO `ocenter_ucenter_score_type` VALUES (4, '余额', 1, '点', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_ucenter_setting`;
CREATE TABLE `ocenter_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of ocenter_ucenter_setting
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_ucenter_short
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_ucenter_short`;
CREATE TABLE `ocenter_ucenter_short` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `short` varchar(25) NOT NULL COMMENT '个性域名',
  `can_change_num` int(11) NOT NULL COMMENT '可修改次数，备用字段，用户商业或任务获得',
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户个性域名';

-- ----------------------------
-- Records of ocenter_ucenter_short
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_ucenter_user_link
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_ucenter_user_link`;
CREATE TABLE `ocenter_ucenter_user_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uc_uid` int(11) NOT NULL,
  `uc_username` varchar(50) NOT NULL,
  `uc_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_ucenter_user_link
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_url
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_url`;
CREATE TABLE `ocenter_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of ocenter_url
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_user_config
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_user_config`;
CREATE TABLE `ocenter_user_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `model` varchar(30) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户配置信息表';

-- ----------------------------
-- Records of ocenter_user_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_user_nav
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_user_nav`;
CREATE TABLE `ocenter_user_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `color` varchar(30) NOT NULL,
  `band_color` varchar(30) NOT NULL,
  `band_text` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_user_nav
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_user_nav` VALUES (1, '个人主页', 'ucenter/Index/index', 0, 0, 0, 1, 0, '', '', '', '');
INSERT INTO `ocenter_user_nav` VALUES (2, '消息中心', 'ucenter/message/message', 0, 0, 0, 1, 0, '', '', '', '');
INSERT INTO `ocenter_user_nav` VALUES (3, '我的收藏', 'ucenter/Collection/index', 0, 0, 0, 1, 0, '', '', '', '');
INSERT INTO `ocenter_user_nav` VALUES (4, '我的头衔', 'ucenter/Index/rank', 0, 0, 0, 1, 0, '', '', '', '');
INSERT INTO `ocenter_user_nav` VALUES (5, '申请认证', 'ucenter/attest/process/go_index/1', 0, 0, 0, 1, 0, '', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for ocenter_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_user_role`;
CREATE TABLE `ocenter_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '2：未审核，1:启用，0：禁用，-1：删除',
  `step` varchar(50) NOT NULL COMMENT '记录当前执行步骤',
  `init` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否初始化',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1460 DEFAULT CHARSET=utf8 COMMENT='用户角色关联';

-- ----------------------------
-- Records of ocenter_user_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_user_tag`;
CREATE TABLE `ocenter_user_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` tinyint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='标签分类表';

-- ----------------------------
-- Records of ocenter_user_tag
-- ----------------------------
BEGIN;
INSERT INTO `ocenter_user_tag` VALUES (1, '默认', 1, 0, 0);
INSERT INTO `ocenter_user_tag` VALUES (2, '开发者', 1, 1, 0);
INSERT INTO `ocenter_user_tag` VALUES (3, '站长', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for ocenter_user_tag_link
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_user_tag_link`;
CREATE TABLE `ocenter_user_tag_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tags` varchar(200) NOT NULL COMMENT '标签ids',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户标签关联表';

-- ----------------------------
-- Records of ocenter_user_tag_link
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_user_token
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_user_token`;
CREATE TABLE `ocenter_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_user_token
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_verify
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_verify`;
CREATE TABLE `ocenter_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `verify` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ocenter_verify
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ocenter_version
-- ----------------------------
DROP TABLE IF EXISTS `ocenter_version`;
CREATE TABLE `ocenter_version` (
  `title` varchar(50) NOT NULL COMMENT '版本名',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `update_time` int(11) NOT NULL COMMENT '更新的时间',
  `log` text NOT NULL COMMENT '更新日志',
  `url` varchar(150) NOT NULL COMMENT '链接到的远程文章',
  `number` int(11) NOT NULL COMMENT '序列号，一般用日期数字标示',
  `name` varchar(50) NOT NULL COMMENT '版本号',
  `is_current` tinyint(4) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `id` (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自动更新表';

-- ----------------------------
-- Records of ocenter_version
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
