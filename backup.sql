--
-- 由SQLiteStudio v3.2.1 产生的文件 Sun Jun 27 08:35:08 2021
--
-- 文本编码：UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- 表：adm_asset
CREATE TABLE "adm_asset" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "assetNum" varchar(128) NOT NULL, "brand" varchar(20) NULL, "model" varchar(30) NOT NULL, "warehouse" varchar(20) NOT NULL, "price" integer NULL, "buyDate" date NOT NULL, "warrantyDate" date NOT NULL, "status" varchar(20) NOT NULL, "operator" varchar(20) NOT NULL, "add_time" datetime NOT NULL, "desc" text NULL, "assetType_id" integer NULL REFERENCES "adm_assettype" ("id") DEFERRABLE INITIALLY DEFERRED, "owner_id" integer NULL REFERENCES "users_userprofile" ("id") DEFERRABLE INITIALLY DEFERRED, "customer" varchar(80) NULL);
INSERT INTO adm_asset (id, assetNum, brand, model, warehouse, price, buyDate, warrantyDate, status, operator, add_time, "desc", assetType_id, owner_id, customer) VALUES (1, 'SN012122681453', '微软', 'surface Pro', '0', 8200, '2018-05-10', '2020-05-10', '0', '陈晨', '2018-06-21 12:31:45.538000', '', 1, 32, NULL);
INSERT INTO adm_asset (id, assetNum, brand, model, warehouse, price, buyDate, warrantyDate, status, operator, add_time, "desc", assetType_id, owner_id, customer) VALUES (2, 'NT008912831', '网御星云', 'FW2100', '0', 100000, '2017-03-20', '2020-03-20', '1', '陈晨', '2018-06-21 12:38:25.944000', '公司测试用设备', 2, NULL, '林城市技侦支队：荣誉：1862532332');
INSERT INTO adm_asset (id, assetNum, brand, model, warehouse, price, buyDate, warrantyDate, status, operator, add_time, "desc", assetType_id, owner_id, customer) VALUES (3, 'NT00229406', 'Apple', 'EL232030', '0', 2993, '2021-06-16', '2021-06-17', '1', 'myadmin', '2021-06-15 21:18:34.003862', 'Casuarina', 1, 32, 'Casuarina');
INSERT INTO adm_asset (id, assetNum, brand, model, warehouse, price, buyDate, warrantyDate, status, operator, add_time, "desc", assetType_id, owner_id, customer) VALUES (6, '234234234', '12123123', '12312334234', '0', 123, '2021-06-09', '2021-06-24', '0', 'myadmin', '2021-06-18 15:50:22.286292', '123123', 1, 34, 'xinxinxni');

-- 表：adm_assetfile
CREATE TABLE "adm_assetfile" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "upload_user" varchar(20) NOT NULL, "file_content" varchar(100) NULL, "add_time" datetime NOT NULL, "asset_id" integer NULL REFERENCES "adm_asset" ("id"));
INSERT INTO adm_assetfile (id, upload_user, file_content, add_time, asset_id) VALUES (1, '陈晨', 'asset_file/2018/06/surface.jpg', '2018-06-21 12:33:15.831000', 1);
INSERT INTO adm_assetfile (id, upload_user, file_content, add_time, asset_id) VALUES (2, '陈晨', 'asset_file/2018/06/surface01.jpg', '2018-06-21 12:35:06.422000', 1);
INSERT INTO adm_assetfile (id, upload_user, file_content, add_time, asset_id) VALUES (3, '陈晨', 'asset_file/2018/06/fw01.jpg', '2018-06-21 12:38:42.592000', 2);

-- 表：adm_assetlog
CREATE TABLE "adm_assetlog" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "operator" varchar(20) NOT NULL, "desc" text NOT NULL, "add_time" datetime NOT NULL, "asset_id" integer NOT NULL REFERENCES "adm_asset" ("id"));
INSERT INTO adm_assetlog (id, operator, "desc", add_time, asset_id) VALUES (1, '陈晨', '
            用户信息：None  || 责任人：张晓明  || 资产状态：在用', '2018-06-21 16:20:59', 1);
INSERT INTO adm_assetlog (id, operator, "desc", add_time, asset_id) VALUES (2, '陈晨', '
            用户信息：京州市检察院：吕梁贤： 18632598521  || 责任人：张晓明  || 资产状态：在用', '2018-05-03 16:39:18', 2);
INSERT INTO adm_assetlog (id, operator, "desc", add_time, asset_id) VALUES (3, '陈晨', '
            用户信息：京州市中级人民法院：宋荣辉：16832356323  || 责任人：孙宏宇  || 资产状态：在用', '2018-06-02 08:40:14', 2);
INSERT INTO adm_assetlog (id, operator, "desc", add_time, asset_id) VALUES (4, '陈晨', '
            用户信息：林城市技侦支队：荣誉：1862532332  || 责任人：孙宏宇  || 资产状态：在用', '2018-06-21 12:41:18.084000', 2);
INSERT INTO adm_assetlog (id, operator, "desc", add_time, asset_id) VALUES (5, 'myadmin', '
            用户信息：None  || 责任人：张晓明  || 资产状态：闲置', '2021-06-15 21:49:53.709855', 1);
INSERT INTO adm_assetlog (id, operator, "desc", add_time, asset_id) VALUES (6, '陈晨', '
            用户信息：Casuarina  || 责任人：张晓明  || 资产状态：在用', '2021-06-16 18:09:55.688834', 3);

-- 表：adm_assettype
CREATE TABLE "adm_assettype" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(30) NOT NULL, "desc" text NULL);
INSERT INTO adm_assettype (id, name, "desc") VALUES (1, '办公电脑', '');
INSERT INTO adm_assettype (id, name, "desc") VALUES (2, '防火墙', '');

-- 表：adm_customer
CREATE TABLE "adm_customer" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "unit" varchar(50) NOT NULL, "address" varchar(100) NOT NULL, "name" varchar(20) NOT NULL, "phone" varchar(30) NOT NULL, "desc" text NULL, "add_time" datetime NOT NULL, "belongs_to_id" integer NULL REFERENCES "users_userprofile" ("id") DEFERRABLE INITIALLY DEFERRED, "status" bool NOT NULL);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (1, '林城市出入境检验检疫局', '林城市润扬中路128号', '黄亮', '136259852562', '', '2018-06-21 12:03:31.869000', 32, 1);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (2, '林城汇丰银行', '林城区开放路113号', '万山', '16985623651', '', '2018-06-21 12:07:04.131000', 32, 1);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (3, '林城华瑞机电有限公司', '林城八桥北路68号', '邢学文', '16896539851', '', '2018-06-21 12:08:31.683000', 32, 1);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (4, '晨光集团（京州）有限公司', '京州市环城北路12号', '林海', '185269865211', '', '2018-06-21 12:10:26.453000', NULL, 1);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (5, '京州市政府信息中心', '京州市永嘉路市政府大厦', '陆路', '15636985656', '', '2018-06-21 12:11:47.480000', NULL, 1);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (6, '吕州市公安局', '吕州市平安路9号', '聂永辉', '15638956235', '', '2018-06-21 12:13:38.713000', 34, 1);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (7, '吕州市地税局', '吕州市楚桥北路126号', '赵云', '15369865322', '', '2018-06-21 12:15:12.941000', 34, 1);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (8, '京州市嘉禾政通文化传媒有限公司', '京州市丰台路290号', '吕鑫鑫', '1563589892', '', '2018-06-21 12:22:03', NULL, 1);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (9, '京州市金融服务中心', '京州市虎踞南路240号', '王旭', '16853565235', '', '2018-06-21 12:24:31.697000', NULL, 1);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (10, 'Larrakia', 'Darwin Harbour', 'Larrakia''s leader', '04000404', '', '2021-06-17 18:31:41.495120', 11, 1);
INSERT INTO adm_customer (id, unit, address, name, phone, "desc", add_time, belongs_to_id, status) VALUES (11, 'Arrernte', 'Alice Springs', 'Arrernte''s Leader', '04829933', '', '2021-06-17 18:32:42.455806', 11, 1);

-- 表：adm_equipment
CREATE TABLE "adm_equipment" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "number" varchar(30) NOT NULL, "equipment_model" varchar(50) NOT NULL, "buy_date" date NOT NULL, "warranty_date" date NOT NULL, "accounting" bool NOT NULL, "config_desc" text NULL, "customer_id" integer NULL REFERENCES "adm_customer" ("id"), "equipment_type_id" integer NULL REFERENCES "adm_equipmenttype" ("id"), "supplier_id" integer NULL REFERENCES "adm_supplier" ("id"));
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (1, 'NT00126767', 'Power V-1424', '2012-03-16', '2015-04-10', 0, 'None', 1, 1, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (2, 'NT00121686', 'N120', '2012-01-04', '2015-04-10', 0, 'None', 9, 3, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (3, 'NT00126222', 'Power V-320IPS', '2012-02-29', '2015-04-10', 0, 'None', 9, 4, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (4, 'NT00175974', 'Power V6000-F53EC-N', '2014-04-21', '2017-04-21', 1, 'None', 1, 1, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (5, 'NT00179830', 'SIS-3000-Z1101-H', '2014-06-09', '2017-06-09', 1, NULL, 1, 2, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (6, 'NT00133081', 'SAG-1100', '2012-11-22', '2015-11-22', 0, 'None', 9, 9, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (7, 'NT00133079', 'SAG-1100', '2012-07-20', '2015-07-20', 0, 'None', 8, 9, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (8, 'NT00229406', 'Power V6000-F832C-N', '2015-11-25', '2018-11-25', 0, 'None', 7, 1, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (9, 'NT00140770', 'Leadsec-C5000', '2015-11-13', '2018-11-13', 0, 'None', 7, 5, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (10, 'NT00923425', 'power v6000-F8350', '2008-11-17', '2011-11-17', 0, 'None', 6, 1, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (11, 'NT00141619', 'Leadsec-100WAF', '2012-11-20', '2015-11-20', 0, 'None', 5, 10, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (12, 'NT00142146', 'Power V-8400C', '2012-10-12', '2015-10-12', 0, 'None', 5, 1, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (13, 'NT00091658', 'Power V-322A-H', '2010-12-30', '2013-12-30', 0, 'None', 4, 1, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (14, 'NT00245965', 'Power V6000-F23DS-DC', '2016-07-21', '2019-07-21', 0, 'None', 3, 1, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (15, 'NT00251297', 'TS-SC1040', '2016-09-23', '2019-09-23', 1, 'None', 2, 14, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (16, 'NT00252794', 'power v6000-F8350', '2016-09-28', '2019-09-28', 1, NULL, 2, 1, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (17, 'NT00245819', 'leadsecACM-C2580', '2016-09-23', '2019-09-23', 0, 'None', 1, 5, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (18, 'NT00307434', 'ISM—TX-CONPR', '2016-10-07', '2019-10-07', 0, 'None', 1, 8, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (19, 'NT00232734', 'power v6000-F3330', '2015-12-22', '2018-12-22', 0, 'None', 3, 1, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (20, 'Cesssss123123', 'sdasdasd', '2021-06-08', '2021-07-01', 0, 'sfsgdg', 11, 1, 1);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (21, 'kjashdakjh', '34234', '2021-06-14', '2021-06-16', 0, 'sfsfd', 3, 3, NULL);
INSERT INTO adm_equipment (id, number, equipment_model, buy_date, warranty_date, accounting, config_desc, customer_id, equipment_type_id, supplier_id) VALUES (22, 'asdasfasd', 'dsfsdf', '2021-06-15', '2021-06-09', 0, 'sdfsdf', 4, 2, NULL);

-- 表：adm_equipment_service_info
CREATE TABLE "adm_equipment_service_info" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "equipment_id" integer NOT NULL REFERENCES "adm_equipment" ("id"), "serviceinfo_id" integer NOT NULL REFERENCES "adm_serviceinfo" ("id"));
INSERT INTO adm_equipment_service_info (id, equipment_id, serviceinfo_id) VALUES (1, 19, 1);
INSERT INTO adm_equipment_service_info (id, equipment_id, serviceinfo_id) VALUES (2, 19, 2);
INSERT INTO adm_equipment_service_info (id, equipment_id, serviceinfo_id) VALUES (3, 19, 3);
INSERT INTO adm_equipment_service_info (id, equipment_id, serviceinfo_id) VALUES (4, 19, 4);
INSERT INTO adm_equipment_service_info (id, equipment_id, serviceinfo_id) VALUES (5, 8, 5);
INSERT INTO adm_equipment_service_info (id, equipment_id, serviceinfo_id) VALUES (6, 20, 6);

-- 表：adm_equipmenttype
CREATE TABLE "adm_equipmenttype" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(30) NOT NULL, "desc" text NULL);
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (1, '防火墙', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (2, '入侵检测', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (3, '上网行为管理', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (4, '堡垒机', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (5, 'Web应用安全防护', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (6, '安全网关', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (7, 'VPN网关SAG', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (8, '漏洞扫描', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (9, '入侵检测', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (10, '入侵防御', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (11, '网闸', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (12, '日志审计RS', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (13, '内网安全管理', '');
INSERT INTO adm_equipmenttype (id, name, "desc") VALUES (14, '安全管理系统BSM', '');

-- 表：adm_serviceinfo
CREATE TABLE "adm_serviceinfo" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" text NOT NULL, "is_reminding" bool NOT NULL, "add_time" datetime NOT NULL, "writer_id" integer NULL REFERENCES "users_userprofile" ("id"));
INSERT INTO adm_serviceinfo (id, content, is_reminding, add_time, writer_id) VALUES (1, '远程协助用户更新策略，新增加地址映射规则', 0, '2018-05-16 10:58:07', 11);
INSERT INTO adm_serviceinfo (id, content, is_reminding, add_time, writer_id) VALUES (2, '完成年中设备巡检工作，设备运行状态良好，设备还有半年质保就要到期，和用户介绍了下目前续保优惠政策', 0, '2018-06-08 13:00:01', 11);
INSERT INTO adm_serviceinfo (id, content, is_reminding, add_time, writer_id) VALUES (3, '整理巡检报告和配置备份资料，已经邮件发送给用户', 0, '2018-06-08 14:00:26', 11);
INSERT INTO adm_serviceinfo (id, content, is_reminding, add_time, writer_id) VALUES (4, '今天用户打电话咨询服务续保详情，已经转交给销售人员', 0, '2018-06-14 16:01:06', 11);
INSERT INTO adm_serviceinfo (id, content, is_reminding, add_time, writer_id) VALUES (5, 'ok', 0, '2021-06-16 17:47:55.688226', 11);
INSERT INTO adm_serviceinfo (id, content, is_reminding, add_time, writer_id) VALUES (6, 'okoko', 0, '2021-06-26 07:40:44.807115', 11);

-- 表：adm_supplier
CREATE TABLE "adm_supplier" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "company" varchar(30) NOT NULL, "address" varchar(100) NOT NULL, "linkname" varchar(20) NOT NULL, "phone" varchar(20) NOT NULL, "status" bool NOT NULL, "desc" text NULL, "add_time" datetime NOT NULL, "belongs_to_id" integer NULL REFERENCES "users_userprofile" ("id"));
INSERT INTO adm_supplier (id, company, address, linkname, phone, status, "desc", add_time, belongs_to_id) VALUES (1, 'ceshi1', '6 dripston casuarina NT', 'Andy', '04234243433', 1, 'ok', '2021-06-15 21:12:11.011110', 34);

-- 表：auth_group
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);

-- 表：auth_group_permissions
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));

-- 表：auth_permission
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (1, 1, 'add_permission', 'Can add permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (2, 1, 'change_permission', 'Can change permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (3, 1, 'delete_permission', 'Can delete permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (4, 2, 'add_group', 'Can add group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (5, 2, 'change_group', 'Can change group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (6, 2, 'delete_group', 'Can delete group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (7, 1, 'view_permission', 'Can view permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (8, 2, 'view_group', 'Can view group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (9, 3, 'add_contenttype', 'Can add content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (10, 3, 'change_contenttype', 'Can change content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (11, 3, 'delete_contenttype', 'Can delete content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (12, 3, 'view_contenttype', 'Can view content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (13, 4, 'add_session', 'Can add session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (14, 4, 'change_session', 'Can change session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (15, 4, 'delete_session', 'Can delete session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (16, 4, 'view_session', 'Can view session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (17, 5, 'add_userprofile', 'Can add 用户信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (18, 5, 'change_userprofile', 'Can change 用户信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (19, 5, 'delete_userprofile', 'Can delete 用户信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (20, 6, 'add_structure', 'Can add 组织架构');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (21, 6, 'change_structure', 'Can change 组织架构');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (22, 6, 'delete_structure', 'Can delete 组织架构');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (23, 5, 'view_userprofile', 'Can view 用户信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (24, 6, 'view_structure', 'Can view 组织架构');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (25, 7, 'add_menu', 'Can add 菜单');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (26, 7, 'change_menu', 'Can change 菜单');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (27, 7, 'delete_menu', 'Can delete 菜单');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (28, 8, 'add_role', 'Can add 角色');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (29, 8, 'change_role', 'Can change 角色');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (30, 8, 'delete_role', 'Can delete 角色');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (31, 7, 'view_menu', 'Can view 菜单');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (32, 8, 'view_role', 'Can view 角色');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (33, 9, 'add_emailsetup', 'Can add 发件邮箱设置');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (34, 9, 'change_emailsetup', 'Can change 发件邮箱设置');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (35, 9, 'delete_emailsetup', 'Can delete 发件邮箱设置');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (36, 10, 'add_systemsetup', 'Can add 系统设置');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (37, 10, 'change_systemsetup', 'Can change 系统设置');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (38, 10, 'delete_systemsetup', 'Can delete 系统设置');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (39, 9, 'view_emailsetup', 'Can view 发件邮箱设置');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (40, 10, 'view_systemsetup', 'Can view 系统设置');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (41, 11, 'add_asset', 'Can add 资产管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (42, 11, 'change_asset', 'Can change 资产管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (43, 11, 'delete_asset', 'Can delete 资产管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (44, 12, 'add_assetfile', 'Can add asset file');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (45, 12, 'change_assetfile', 'Can change asset file');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (46, 12, 'delete_assetfile', 'Can delete asset file');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (47, 13, 'add_assetlog', 'Can add asset log');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (48, 13, 'change_assetlog', 'Can change asset log');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (49, 13, 'delete_assetlog', 'Can delete asset log');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (50, 14, 'add_assettype', 'Can add 资产类型');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (51, 14, 'change_assettype', 'Can change 资产类型');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (52, 14, 'delete_assettype', 'Can delete 资产类型');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (53, 15, 'add_customer', 'Can add 客户管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (54, 15, 'change_customer', 'Can change 客户管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (55, 15, 'delete_customer', 'Can delete 客户管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (56, 16, 'add_equipment', 'Can add 设备管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (57, 16, 'change_equipment', 'Can change 设备管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (58, 16, 'delete_equipment', 'Can delete 设备管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (59, 17, 'add_equipmenttype', 'Can add 设备类型');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (60, 17, 'change_equipmenttype', 'Can change 设备类型');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (61, 17, 'delete_equipmenttype', 'Can delete 设备类型');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (62, 18, 'add_serviceinfo', 'Can add service info');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (63, 18, 'change_serviceinfo', 'Can change service info');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (64, 18, 'delete_serviceinfo', 'Can delete service info');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (65, 19, 'add_supplier', 'Can add 分销商管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (66, 19, 'change_supplier', 'Can change 分销商管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (67, 19, 'delete_supplier', 'Can delete 分销商管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (68, 11, 'view_asset', 'Can view 资产管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (69, 12, 'view_assetfile', 'Can view asset file');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (70, 13, 'view_assetlog', 'Can view asset log');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (71, 14, 'view_assettype', 'Can view 资产类型');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (72, 15, 'view_customer', 'Can view 客户管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (73, 16, 'view_equipment', 'Can view 设备管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (74, 17, 'view_equipmenttype', 'Can view 设备类型');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (75, 18, 'view_serviceinfo', 'Can view service info');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (76, 19, 'view_supplier', 'Can view 分销商管理');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (77, 20, 'add_workorder', 'Can add 工单信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (78, 20, 'change_workorder', 'Can change 工单信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (79, 20, 'delete_workorder', 'Can delete 工单信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (80, 21, 'add_workorderrecord', 'Can add 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (81, 21, 'change_workorderrecord', 'Can change 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (82, 21, 'delete_workorderrecord', 'Can delete 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (83, 20, 'view_workorder', 'Can view 工单信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (84, 21, 'view_workorderrecord', 'Can view 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (85, 22, 'add_bookmark', 'Can add Bookmark');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (86, 22, 'change_bookmark', 'Can change Bookmark');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (87, 22, 'delete_bookmark', 'Can delete Bookmark');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (88, 23, 'add_log', 'Can add log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (89, 23, 'change_log', 'Can change log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (90, 23, 'delete_log', 'Can delete log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (91, 24, 'add_usersettings', 'Can add User Setting');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (92, 24, 'change_usersettings', 'Can change User Setting');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (93, 24, 'delete_usersettings', 'Can delete User Setting');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (94, 25, 'add_userwidget', 'Can add User Widget');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (95, 25, 'change_userwidget', 'Can change User Widget');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (96, 25, 'delete_userwidget', 'Can delete User Widget');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (97, 22, 'view_bookmark', 'Can view Bookmark');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (98, 23, 'view_log', 'Can view log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (99, 24, 'view_usersettings', 'Can view User Setting');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (100, 25, 'view_userwidget', 'Can view User Widget');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (101, 26, 'add_explorationapplication', 'Can add 工单信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (102, 26, 'change_explorationapplication', 'Can change 工单信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (103, 26, 'delete_explorationapplication', 'Can delete 工单信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (104, 26, 'view_explorationapplication', 'Can view 工单信息');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (105, 27, 'add_applicationrecord', 'Can add 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (106, 27, 'change_applicationrecord', 'Can change 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (107, 27, 'delete_applicationrecord', 'Can delete 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (108, 27, 'view_applicationrecord', 'Can view 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (109, 28, 'add_explorationapplicationrecord', 'Can add 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (110, 28, 'change_explorationapplicationrecord', 'Can change 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (111, 28, 'delete_explorationapplicationrecord', 'Can delete 执行记录');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (112, 28, 'view_explorationapplicationrecord', 'Can view 执行记录');

-- 表：django_content_type
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'users', 'userprofile');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'users', 'structure');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'rbac', 'menu');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'rbac', 'role');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'system', 'emailsetup');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'system', 'systemsetup');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'adm', 'asset');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'adm', 'assetfile');
INSERT INTO django_content_type (id, app_label, model) VALUES (13, 'adm', 'assetlog');
INSERT INTO django_content_type (id, app_label, model) VALUES (14, 'adm', 'assettype');
INSERT INTO django_content_type (id, app_label, model) VALUES (15, 'adm', 'customer');
INSERT INTO django_content_type (id, app_label, model) VALUES (16, 'adm', 'equipment');
INSERT INTO django_content_type (id, app_label, model) VALUES (17, 'adm', 'equipmenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (18, 'adm', 'serviceinfo');
INSERT INTO django_content_type (id, app_label, model) VALUES (19, 'adm', 'supplier');
INSERT INTO django_content_type (id, app_label, model) VALUES (20, 'personal', 'workorder');
INSERT INTO django_content_type (id, app_label, model) VALUES (21, 'personal', 'workorderrecord');
INSERT INTO django_content_type (id, app_label, model) VALUES (22, 'xadmin', 'bookmark');
INSERT INTO django_content_type (id, app_label, model) VALUES (23, 'xadmin', 'log');
INSERT INTO django_content_type (id, app_label, model) VALUES (24, 'xadmin', 'usersettings');
INSERT INTO django_content_type (id, app_label, model) VALUES (25, 'xadmin', 'userwidget');
INSERT INTO django_content_type (id, app_label, model) VALUES (26, 'personal', 'explorationapplication');
INSERT INTO django_content_type (id, app_label, model) VALUES (27, 'personal', 'applicationrecord');
INSERT INTO django_content_type (id, app_label, model) VALUES (28, 'personal', 'explorationapplicationrecord');

-- 表：django_migrations
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'rbac', '0001_initial', '2018-08-24 08:43:21.798869');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0001_initial', '2018-08-24 08:43:22.037238');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'contenttypes', '0002_remove_content_type_name', '2018-08-24 08:43:22.290248');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'auth', '0001_initial', '2018-08-24 08:43:22.561218');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'auth', '0002_alter_permission_name_max_length', '2018-08-24 08:43:22.751730');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0003_alter_user_email_max_length', '2018-08-24 08:43:22.855518');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0004_alter_user_username_opts', '2018-08-24 08:43:22.976508');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0005_alter_user_last_login_null', '2018-08-24 08:43:23.072534');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0006_require_contenttypes_0002', '2018-08-24 08:43:23.174551');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0007_alter_validators_add_error_messages', '2018-08-24 08:43:23.286280');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0008_alter_user_username_max_length', '2018-08-24 08:43:23.397066');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'users', '0001_initial', '2018-08-24 08:43:23.719576');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'adm', '0001_initial', '2018-08-24 08:43:24.035699');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'adm', '0002_auto_20180607_1211', '2018-08-24 08:43:24.430707');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'personal', '0001_initial', '2018-08-24 08:43:24.653404');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'personal', '0002_auto_20180607_1211', '2018-08-24 08:43:25.038412');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'sessions', '0001_initial', '2018-08-24 08:43:25.263012');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'system', '0001_initial', '2018-08-24 08:43:25.519009');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'xadmin', '0001_initial', '2018-08-24 08:43:25.861013');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'auth', '0009_alter_user_last_name_max_length', '2021-06-14 00:11:09.590812');
INSERT INTO django_migrations (id, app, name, applied) VALUES (21, 'auth', '0010_alter_group_name_max_length', '2021-06-14 00:11:09.622819');
INSERT INTO django_migrations (id, app, name, applied) VALUES (22, 'auth', '0011_update_proxy_permissions', '2021-06-14 00:11:09.677396');
INSERT INTO django_migrations (id, app, name, applied) VALUES (23, 'users', '0002_auto_20210614_0010', '2021-06-14 00:11:09.718073');
INSERT INTO django_migrations (id, app, name, applied) VALUES (24, 'adm', '0003_auto_20210617_1658', '2021-06-17 17:12:01.074589');
INSERT INTO django_migrations (id, app, name, applied) VALUES (25, 'users', '0003_auto_20210617_1658', '2021-06-17 17:12:01.325569');
INSERT INTO django_migrations (id, app, name, applied) VALUES (26, 'users', '0004_structure_address', '2021-06-18 21:03:08.006324');
INSERT INTO django_migrations (id, app, name, applied) VALUES (27, 'users', '0005_auto_20210618_2123', '2021-06-18 21:23:19.411808');
INSERT INTO django_migrations (id, app, name, applied) VALUES (28, 'users', '0006_auto_20210618_2211', '2021-06-18 22:11:24.787986');
INSERT INTO django_migrations (id, app, name, applied) VALUES (29, 'users', '0007_auto_20210618_2211', '2021-06-18 22:11:57.594246');
INSERT INTO django_migrations (id, app, name, applied) VALUES (30, 'personal', '0003_explorationapplication_land', '2021-06-19 18:55:37.899051');
INSERT INTO django_migrations (id, app, name, applied) VALUES (31, 'personal', '0004_auto_20210619_1855', '2021-06-19 18:55:58.003742');
INSERT INTO django_migrations (id, app, name, applied) VALUES (32, 'personal', '0005_auto_20210619_2054', '2021-06-19 20:54:42.991345');
INSERT INTO django_migrations (id, app, name, applied) VALUES (33, 'personal', '0006_auto_20210619_2224', '2021-06-19 22:24:45.389629');
INSERT INTO django_migrations (id, app, name, applied) VALUES (34, 'personal', '0007_explorationapplicationrecord_invoice', '2021-06-22 18:48:38.133192');
INSERT INTO django_migrations (id, app, name, applied) VALUES (35, 'personal', '0008_auto_20210622_2059', '2021-06-22 20:59:20.382145');
INSERT INTO django_migrations (id, app, name, applied) VALUES (36, 'personal', '0009_auto_20210622_2059', '2021-06-22 20:59:44.471677');
INSERT INTO django_migrations (id, app, name, applied) VALUES (37, 'personal', '0010_auto_20210622_2109', '2021-06-22 21:09:57.171221');
INSERT INTO django_migrations (id, app, name, applied) VALUES (38, 'personal', '0011_auto_20210623_2058', '2021-06-23 20:59:03.453994');
INSERT INTO django_migrations (id, app, name, applied) VALUES (39, 'personal', '0012_auto_20210623_2104', '2021-06-23 21:04:44.572451');

-- 表：django_session
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('qeqn0xmg54rid1jjsgkkz3utyek0geqj', 'MjA4OWI5MTZhOWI4YmFiOTU5MmVmOWFjOGRkYTAwMGQzZmE2ZjAxZDp7Il9hdXRoX3VzZXJfaWQiOiIzNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwODBmNmYwMjE1Yjc1MmZkNjAxNDY4ZTQ5NDg3ZmIwNWQ0NTBkZjM3In0=', '2018-08-24 09:12:34.151470');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('i95ichoa0y4tzw0own4qwqbd23akk6kd', 'MWEyNDdmODM1YjM5NmNlNjVkY2RiNzVmZTQ1MTc2YmZmNTcxYjQ2MTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTRmNjM5MGM1MWE0ZWE2YjFiYTUzMzZiYzhlYzIwZjE5NTgwNmMwIn0=', '2018-11-05 12:17:12.851325');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('s2lepuwtbqfowti7gqp0ag5wkbyusbv9', 'NWFjNGNmNTA2OWVmZTk5NGYyNmE5N2UyNjNmYTRhNDUxZTk3YzRiMDp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNWU1YjczMjY1MzhlZTQ5OThiODBhMjZiMDRiZGJjNGQ4ZTk1ZTI5In0=', '2021-06-14 08:17:42.224165');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('nb20cafnap6fq1ht2vf6v3zgxsi2zf9w', 'MWQxZTgxMmMzYTViZjRiYzNkMTg5ZTQ5ZmNlNDMzNjFiNmQ5MGQ4NDp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMmI3YjE5NTgzZTVlMWNmNmM0MjUwNGVlOWZkNmQ5ZmIwZjc5Nzk1In0=', '2021-06-14 08:18:33.625291');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('559zewmt09rm0fgamkkab7ti8ab40e9s', 'NWFjNGNmNTA2OWVmZTk5NGYyNmE5N2UyNjNmYTRhNDUxZTk3YzRiMDp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNWU1YjczMjY1MzhlZTQ5OThiODBhMjZiMDRiZGJjNGQ4ZTk1ZTI5In0=', '2021-06-14 09:18:43.358273');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('89bpdt51shef43pm6wp1zqf3eaz3vork', 'NGFmZGM4NGNhOTUyYjZiYWNkYTg1MjNiNGY4N2Y5YjQwODVhZGE2Yzp7Il9hdXRoX3VzZXJfaWQiOiIzNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzM2IwNmI4YjU0Y2NiOGIxMmYxZTdlOGNhNDBjYjVhY2Q2ZWNkZDYzIn0=', '2021-06-14 10:17:15.330886');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('3gvdpx1ouqt6krmm7y4dhsdehlbqw3l7', 'NWFjNGNmNTA2OWVmZTk5NGYyNmE5N2UyNjNmYTRhNDUxZTk3YzRiMDp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNWU1YjczMjY1MzhlZTQ5OThiODBhMjZiMDRiZGJjNGQ4ZTk1ZTI5In0=', '2021-06-14 10:13:14.308474');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('0mqdi5zqrp1ksp7m3kwjtzfhkkuv0ty7', 'NWFjNGNmNTA2OWVmZTk5NGYyNmE5N2UyNjNmYTRhNDUxZTk3YzRiMDp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNWU1YjczMjY1MzhlZTQ5OThiODBhMjZiMDRiZGJjNGQ4ZTk1ZTI5In0=', '2021-06-14 10:39:34.007790');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('q43jx3h396eqei5pf7ib9e9wiaa5ojr3', 'ZjQ1OThiY2Q1NTYxMDJlYTMwZjNlMzVjMzA5ZGQzMDNhMThmNTUwMDp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NjA3OWMzM2RkYjUxMmJkYmVmZWU4NGY2NGU2OWVmZDA4OGI5NGU5In0=', '2021-06-14 21:18:42.689617');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('27cebf7pir4jj4qkfvkn07n5fx5qfhqt', 'ZjQ1OThiY2Q1NTYxMDJlYTMwZjNlMzVjMzA5ZGQzMDNhMThmNTUwMDp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NjA3OWMzM2RkYjUxMmJkYmVmZWU4NGY2NGU2OWVmZDA4OGI5NGU5In0=', '2021-06-14 22:43:43.581017');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('30ilg6fxbmqme4awupcbrmq3l7z3thbc', 'ZjQ1OThiY2Q1NTYxMDJlYTMwZjNlMzVjMzA5ZGQzMDNhMThmNTUwMDp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NjA3OWMzM2RkYjUxMmJkYmVmZWU4NGY2NGU2OWVmZDA4OGI5NGU5In0=', '2021-06-15 07:23:40.012385');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('b87r0c7nbauzrevym8qvyc6hdkvflbpi', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-15 19:31:32.092078');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('v9u3fxd742c2esdnevbj301prm4m5vr3', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-15 20:28:59.037949');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ylef97s1kzh059ymink2m7uq9kq61xer', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-15 20:55:34.866906');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('xhupgwiil0r7d49k8j7e8i4x66bdhbfc', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-15 21:43:09.920437');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('x15krf8hyyw88sn6f8mn562v16afkfcj', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-15 22:27:18.259273');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('kjzx2rcc7u8m9aj6ogw996yhrdk0awuz', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-15 22:40:52.818834');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('h2r6coedgogujlwqpxsb0d2l5ytg77vu', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 07:41:56.114221');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('zfnlzmtn7zva3ggzgu2nfvjkhv0xdbsp', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 08:02:17.250078');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('5c208ayw0s8qc6cvyrvan2y9ytyl3n3e', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 13:26:25.861763');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('2od4yk2mfddqny0vmg36kgchwqezyp57', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 15:03:15.010583');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('2iw5bffdchrw9t74jsapcufjgmv3if51', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 15:49:26.513203');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('aa3yavuw3tsnwt6zsi6sbl4ls8i9exvk', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 16:57:16.302946');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('szmxadmgtvianqs2vax8fo7un99psoxi', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 19:29:37.132365');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('iyz1ryq5kn7lgbq2wa7ztkmocsvebn7l', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 20:05:00.704880');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('n7kchp1h44py0p6v6wcsi24mrba10xhz', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 20:06:02.469058');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('7ccopzmhts1nnwudcpih8h3yxpd16foz', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 21:26:48.791891');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('2tp2afwre2qg1u5y1lyqw7q143np4gyv', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 21:53:00.943486');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('j0urnlops5e0oc367k3wtzmkeu4azj5m', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-16 22:23:36.059028');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('4w227z298fcm9mqy28kqrvoo463psxri', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 07:47:25.798023');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('s7qrpiu9wplrj1kgq9gok6mrn9tltyyp', 'N2ExMDJlMjIyZGM4ZDUyMTM1OWUzZGZhYjZhMGJlNWRmOTNlYzNjOTp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YmQ5ZTdmZmM4NjdlODk1M2M0M2ZmZDhkODE4YjQ3MmQzOTNjMGFmIn0=', '2021-06-17 07:50:54.447637');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('h4tvlbex6vvrplwtbmtvweuddiagn0wy', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 10:33:02.260948');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('3oinwk98kax6z8z16chgruwid6770q50', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 11:26:12.372792');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('dlaid4kxnrbgrdonk32ilje43otc75qg', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 11:12:41.077617');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('f9ycob4nsisu3uv3eleimgec27pj9nph', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 12:21:11.917264');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('uwyq1bsi5h8s8s50t1wigiugqjuuhbkl', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 15:09:25.858567');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('r9wfpx9wxpflsvdr8gmbzjzj4i0xi4ug', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 15:36:55.335292');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('shrnu9d7c72gwlf8f1v9lcc0kxuqih2s', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 15:39:19.786427');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('e31ckowus4u4czuc67zli0pe6fg0zeff', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 16:09:54.736981');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('6f0oo1il4yx2nlcmhjbfyy0zjaqhu5yx', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 16:52:21.288806');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('cq9zvod2lbjtw10wtimbyf61ye0y629v', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 19:00:25.813436');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('gcwmngilhuk4fbep1fjwixuicf07efay', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 21:21:25.396166');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('jy0b1ess9y5oihr4xcelauz24z7z2x5n', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 22:01:40.670418');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('m6sqasjtn98jk4nxmzibabkvhg0ccc5m', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 22:42:56.397384');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('p5qanvvakgsyj5ipygr0hqvaa1md3ybe', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-17 23:02:51.244988');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('1kqzxaxq2sxgs3n9yn25njw6qg64a8tn', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-18 07:03:37.616075');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('9jmdh1h5g5ku9vm2uuko0805q1dm8tp4', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-18 16:21:10.448850');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('nkhw03yrj2crbmha948jfl9efmvy3f9c', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-18 17:47:58.971146');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('u2xw1ibfxfkz3xt3ort0rut2gr4ddaj0', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-18 18:42:22.961217');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('nh3qc479jm5au3pun4gvojkpuh9qltpx', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-18 20:23:41.186697');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('2rznnscxgj5cbiun8jnj8n83fgmdfku6', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-18 21:54:50.720873');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('3p92kmk010q0o25qsy4scnwrp5px68cd', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-18 23:25:47.212835');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('aye27ve7lkz0l94jghc77mcufj8lwy0i', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-19 17:28:12.550584');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ioabt9olor2pth11jtoaa5dchmnuwqpz', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-19 19:28:06.640746');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('7g6e1020kfgkis65veeqp5vnq2xkpmje', 'NjMwMzY0MjYyMjJkMWNkNzJmMTJmMzY1NzBlYTI4YjhhZTEzY2MwYTp7Il9hdXRoX3VzZXJfaWQiOiIzMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1OWJmNTAwMDE5NmYxZDViMDc0ZGM5ZjkxYTZiYTZiNjAwZGVhN2Q4In0=', '2021-06-19 21:26:49.083410');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('5bo2oqxlzplj3bdcei4sqjgq09jsgt9i', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-19 21:55:29.191184');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('5e4ib3l64ec2wmmme24ezggr2niq9k8a', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-19 23:35:26.752018');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('rknhbd15wnmmdmjay0rszbo1nl1z4e7y', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-20 00:23:50.605314');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('fgyqpluc9ekp4wwc9f2f1hcnihyjs492', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-20 07:30:30.772689');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('xf5wduae75pbsherre3pdw7rvvamnche', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-20 09:18:38.818420');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('k43cdbp2nfzg0wabtig0yhrvhpa8muxv', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-20 09:04:35.114460');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('7mm0e5yfgw8w3xlya954aos07yq83h5l', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-20 09:26:50.171717');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('k6n9ndymopoifpn4m45h5tkqa85p59og', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-20 09:53:46.140366');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('08jmhfs1tnym706w7xpd4uvkfu20lu9t', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-20 10:35:49.754864');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('5roi5ix81cvgdyh0al03129nsrm46hpo', 'YTFkNDM3NzZmYmJjODM1ZjdhYTBjZTVjMTEwYzM3NWU4ZDRjYzE3MTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Mzc0OWVlODQ4OGRiNmU4MTI5OGY2YWE1NzU4OGU4NDUzMWIxN2U3In0=', '2021-06-20 13:41:47.275715');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('wjwq9xu7ay8ukpev7xro1dwazu71s2ic', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-20 14:20:37.185481');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('s17n7fwgzyx7t196my40f8s5p4u3t5jt', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-20 17:19:37.381826');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('at2krisv49ptt2ofo5oipdf6ik0th83r', 'YTFkNDM3NzZmYmJjODM1ZjdhYTBjZTVjMTEwYzM3NWU4ZDRjYzE3MTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Mzc0OWVlODQ4OGRiNmU4MTI5OGY2YWE1NzU4OGU4NDUzMWIxN2U3In0=', '2021-06-20 19:05:11.811483');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('mwx2n01eyid65jxzjjnla3s1cjccz1uo', 'YTFkNDM3NzZmYmJjODM1ZjdhYTBjZTVjMTEwYzM3NWU4ZDRjYzE3MTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Mzc0OWVlODQ4OGRiNmU4MTI5OGY2YWE1NzU4OGU4NDUzMWIxN2U3In0=', '2021-06-20 21:20:55.785612');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('mg9bgop2mgj8g3sh3sj0gn571e08ua2u', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-20 21:48:45.912169');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('wfsf8x5db9k4w5d36s6b979sm3raxkrm', 'OTVmOTc2OGJkM2Q1ZTI4Njc2MGJkNmNmZDkzNWE0ODRhZTZlNGFmYjp7Il9hdXRoX3VzZXJfaWQiOiI0MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NDA3ZGU4NGE5MmY0ZmY5NmE2YjNlYTM2Y2Y1YjkxOWM3NzMwMDkzIn0=', '2021-06-20 22:14:57.979206');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('4rjekl04w2qasarr51fte1qb06rk51di', 'YTFkNDM3NzZmYmJjODM1ZjdhYTBjZTVjMTEwYzM3NWU4ZDRjYzE3MTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Mzc0OWVlODQ4OGRiNmU4MTI5OGY2YWE1NzU4OGU4NDUzMWIxN2U3In0=', '2021-06-20 22:21:21.088282');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('hk2dq4a1smjeyftm28wxeg9ktvbe6vra', 'YTFkNDM3NzZmYmJjODM1ZjdhYTBjZTVjMTEwYzM3NWU4ZDRjYzE3MTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Mzc0OWVlODQ4OGRiNmU4MTI5OGY2YWE1NzU4OGU4NDUzMWIxN2U3In0=', '2021-06-21 07:00:23.014076');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ywaf0ihaoop1ps5kl29jx5f6b7u3tq3v', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-21 18:07:47.176416');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('t9k3a4wyfqqutpzrfuyv69hy04oyl5fv', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-21 18:30:45.997449');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('8vjgssjcg4rpvy11ryt39adwt07wzkju', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-21 23:19:39.147804');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('cun4ihl3p15zzwovylksiu1tmsqg61v8', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-22 00:58:01.139905');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('9h0vks5xjmms9tdgzfoj708k4tl14ol6', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-22 06:57:37.262212');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('dr6uuz0kobmuvfn7toy7fvby19v0yzuj', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-22 15:50:31.951048');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('296qb54u8381elrxmsad2xfx0ca556kq', 'YTFkNDM3NzZmYmJjODM1ZjdhYTBjZTVjMTEwYzM3NWU4ZDRjYzE3MTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Mzc0OWVlODQ4OGRiNmU4MTI5OGY2YWE1NzU4OGU4NDUzMWIxN2U3In0=', '2021-06-22 17:18:03.913775');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('cc2dv619kng1azgp1zx7zo2unjzyb834', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-22 17:49:44.919879');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('vpfd06l9njorpe7v6bh2r6553ziz23re', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-22 19:22:54.640546');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('5cofdyyor9wv20c2xs1782hmtd83xein', 'YTFkNDM3NzZmYmJjODM1ZjdhYTBjZTVjMTEwYzM3NWU4ZDRjYzE3MTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Mzc0OWVlODQ4OGRiNmU4MTI5OGY2YWE1NzU4OGU4NDUzMWIxN2U3In0=', '2021-06-22 21:34:52.942835');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('p9z7sd4nigpb8gpvnnxxc93dhveciykl', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-22 22:15:53.382657');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('8asktsdzo4jfv2v7c95vd0kjdskfqz5w', 'YTFkNDM3NzZmYmJjODM1ZjdhYTBjZTVjMTEwYzM3NWU4ZDRjYzE3MTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Mzc0OWVlODQ4OGRiNmU4MTI5OGY2YWE1NzU4OGU4NDUzMWIxN2U3In0=', '2021-06-23 06:55:26.573139');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('3ztso2ph7qjkdtzpyfi9sqryfmv1yj0c', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-23 18:23:02.374613');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('o3jq8c1tu0n9k8r5giwtksbq5qovxuey', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-23 18:58:30.350106');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('awdml6lppe4ybrrfrwxerrc7q52ndmgs', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-23 19:29:15.446133');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('ntroh04ch2fh50hstr74mdohs3w0tcuv', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-23 19:38:31.788750');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('vy2q0q1088yuhp564pnspdvlr6ob0ady', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-23 19:54:14.137093');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('6wzwv9nc19ll45ol2qhfyrzy4uglovua', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-23 21:05:45.471398');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('uo6cbvg4smb87mmyzbqu4v4ivweukb63', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-23 21:28:25.582365');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('lqf7vdxquazhfyiwownqyu25nrkng6og', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-23 22:43:38.327535');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('wt5y3jhdcneha0fhe1zo6qxptf29sjtt', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-23 22:41:03.213078');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('t86valwpctkmi0990roy8hm72vml0r02', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-25 18:52:25.665285');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('jz7zme7czdvqsohbjz1v7rpjr2cvgynj', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-25 19:06:29.262419');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('9xjbgbgbpgioxyjg10hr2l63fhrpe82y', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-25 20:30:11.508949');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('7yob0i46qvvu6olffq7ifepyci0lfbgp', 'ZGU4ZTg1ZWVhNzM3YmI2YmY3ZDBmMmJlYTg1MjQ0ZTA3Mjc3ZmMwNjp7Il9hdXRoX3VzZXJfaWQiOiIzNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMTAyYmZkMjdmZWYwYjlhMjAzMGE4MjVhZDU4ZjdkMmM1NTU1MDhjIn0=', '2021-06-26 08:22:28.368180');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('plc3tari3neqdv34ea70tss8sxwepknl', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-26 15:04:34.894284');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('9gjx73594i8s9j3xblusiunyyqoeloeo', 'NzE4ZTExZGY4NzE0OTc1MDBmZTA5OTUwMGU5NjM1NDhkNTgzN2EzNjp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2IiwiTElTVF9RVUVSWSI6W1sicmJhYyIsIm1lbnUiXSwiIl19', '2021-06-26 16:30:11.692400');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('t7aj0ou1lfoay5kla3a0412w3wwof5te', 'MmFmMDA0NWY0YmM3ZDY2YzE5NGExNjJiNzFiM2MxMDRlNTY2Yjg1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzX3VzZXIuVXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzJjOGJlZGJjOWY5NjM5YmY4ZDc2ODAyMWM3NGNkZWRlZjk4MzE2In0=', '2021-06-27 07:14:52.917834');

-- 表：personal_explorationapplication
CREATE TABLE "personal_explorationapplication" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "number" varchar(10) NOT NULL, "title" varchar(50) NOT NULL, "status" varchar(10) NOT NULL, "do_time" datetime NOT NULL, "add_time" datetime NOT NULL, "content" varchar(300) NOT NULL, "file_content" varchar(100) NULL, "approver_id" integer NULL REFERENCES "users_userprofile" ("id") DEFERRABLE INITIALLY DEFERRED, "customer_id" integer NOT NULL REFERENCES "adm_customer" ("id") DEFERRABLE INITIALLY DEFERRED, "proposer_id" integer NULL REFERENCES "users_userprofile" ("id") DEFERRABLE INITIALLY DEFERRED, "receiver_id" integer NULL REFERENCES "users_userprofile" ("id") DEFERRABLE INITIALLY DEFERRED, "land_id" integer NOT NULL REFERENCES "adm_equipment" ("id") DEFERRABLE INITIALLY DEFERRED, "accommodation" varchar(50) NULL, "catering" varchar(50) NULL, "travel" varchar(50) NULL, "venue" varchar(50) NULL, "type" varchar(10) NOT NULL);
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (1, 'SX0000001', '林城市出入境设备安装', '5', '2018-05-09 10:05:00', '2018-05-08 13:13:57', '运维审计设备已到货，麻烦安排工程师上门安装', '', NULL, 1, 32, 38, 1, '1', '1', '1', '1', '0');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (2, 'SX0000002', '林城汇丰银行设备授权更新', '5', '2018-05-10 09:05:00', '2018-05-09 13:16:18', '设备授权更新-请支持', '', NULL, 2, 32, 37, 1, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (3, 'SX0000003', '测试工单数据', '1', '2018-05-17 09:30:00', '2018-05-16 13:18:07', '工单测数据', '', NULL, 2, 32, NULL, 1, '1', '1', '1', '1', '2');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (4, 'SX0000004', '工单测数据', '5', '2018-06-05 09:06:00', '2018-06-04 13:18:58', '工单测数据', '', NULL, 3, 32, 38, 1, '1', '1', '1', '1', '2');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (5, 'SX0000005', '工单测数据', '5', '2018-06-08 02:06:00', '2018-06-04 13:20:53', '工单测数据', '', NULL, 2, 32, 37, 1, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (6, 'SX0000006', '工单测数据', '5', '2018-06-11 02:06:00', '2018-06-09 13:20:53', '工单测数据', '', NULL, 2, 32, 37, 1, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (7, 'SX0000007', '工单测数据', '5', '2018-06-09 02:06:00', '2018-06-14 13:20:53', '工单测数据', '', NULL, 2, 32, 37, 1, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (8, 'SX0000008', '工单测数据', '0', '2018-06-20 14:06:00', '2018-06-19 13:20:53', '工单测数据', '', NULL, 2, 32, NULL, 1, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (9, 'SX0000009', '工单测数据', '5', '2018-06-19 12:06:00', '2018-06-18 13:20:53', '工单测数据', '', NULL, 2, 32, 38, 1, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (10, 'SX0000010', '晨光集团新设备安装', '3', '2018-05-31 21:05:00', '2018-05-29 13:42:19', '用户新设备安装，设备在网络出口，需要晚上才能停业务进行安装', '', NULL, 4, NULL, 37, 1, '1', '1', '1', '1', '0');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (11, 'SX0000011', '京州市政府信息安全建设交流', '2', '2018-05-31 09:00:00', '2018-05-23 13:43:22', '信息安全建设交流', '', NULL, 5, NULL, NULL, 1, '1', '1', '1', '1', '3');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (12, 'SX0000012', '晨光集团远程协助', '3', '2018-06-05 09:06:00', '2018-06-02 13:44:00', '远程协助用户修改配置', '', NULL, 4, NULL, 38, 1, '1', '1', '1', '1', '2');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (13, 'SX0000013', '吕州市公安局安现场保障服务', '4', '2018-05-31 09:05:00', '2018-05-30 14:09:22', '重要时期现场保障工作', '', NULL, 6, 34, 37, 1, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (14, 'SX0000014', '吕州地税局新设备安装', '4', '2018-06-21 15:06:00', '2018-06-21 14:10:20.203000', '新设备安装-记得等级新设备信息', '', NULL, 7, 34, 37, 1, '1', '1', '1', '1', '0');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (15, 'SX0000015', '吕州市公安局防火墙安装', '3', '2018-06-26 13:06:00', '2018-06-21 14:11:47.630000', '用户新购设备6月25日到货，请安排工程师上门安装', '', NULL, 6, 34, 37, 1, '1', '1', '1', '1', '0');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (16, 'SX0000016', '嘉禾政通产品售前交流', '2', '2018-06-22 10:00:00', '2018-06-21 14:15:20.939000', '用户新建机房，目前还没有相应的安全设备，请安排工程师去和用户交流安全建设方案', '', NULL, 8, NULL, NULL, 1, '1', '1', '1', '1', '3');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (17, 'SX0000017', '金融服务中心技术支持', '2', '2018-06-25 13:00:00', '2018-06-21 14:16:56.701000', '请协助用户进行网络调整', '', NULL, 9, NULL, NULL, 1, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (18, 'SX0000018', 'ceshi', '5', '2021-06-14 10:06:00', '2021-06-14 08:31:02.925863', 'ok', '', NULL, 1, NULL, NULL, 1, '1', '1', '1', '1', '0');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (21, 'SX0000021', 'Ceshi17/06/2021', '2', '2021-06-17 19:20:00', '2021-06-17 17:55:47.281120', 'Please Let me Know', '', NULL, 2, NULL, NULL, 1, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (22, 'SX0000022', 'ceshi', '3', '2021-06-16 08:06:00', '2021-06-19 22:50:55.813427', 'cecece', '', 41, 11, 11, 38, 3, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (23, 'SX0000023', 'ceshi', '3', '2021-06-14 07:06:00', '2021-06-20 09:55:53.653108', 'kokomo', '', 41, 4, 11, 11, 4, '1', '1', '1', '1', '2');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (24, 'SX0000024', 'ceshi', '4', '2021-06-09 09:06:00', '2021-06-20 12:44:41.612707', 'haloed', '', 41, 11, 11, 11, 20, '1', '1', '1', '1', '0');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (25, 'SX0000025', 'Jackceshi', '4', '2021-06-08 08:06:00', '2021-06-20 21:25:05.747657', 'Jackceshi', '', 41, 2, 42, 38, 17, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (26, 'SX0000026', 'ceshi222', '5', '2021-06-14 10:06:00', '2021-06-20 21:57:40.004979', 'hjjhjhj', 'file/2021/06/Chemestry.pdf', 41, 3, 41, 38, 4, '1', '1', '1', '1', '2');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (27, 'SX0000027', 'HumanResource', '0', '2021-06-14 10:06:00', '2021-06-20 22:00:05.772636', 'hjkhkh', '', 41, 5, 41, NULL, 4, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (28, 'SX0000028', 'asdasd', '0', '2021-06-21 21:06:00', '2021-06-21 20:01:22.846990', 'sdasd', '', 41, 3, 41, NULL, 3, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (29, 'SX0000029', 'ceshi5', '3', '2021-06-22 08:06:00', '2021-06-21 21:47:43.540037', 'adasdasd', '', 41, 3, 11, 11, 3, '1', '1', '1', '1', '2');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (30, 'SX0000030', 'HumanResource', '5', '2021-06-21 21:06:00', '2021-06-21 22:01:46.545445', 'sdasd', 'file/2021/06/Chemestry_Xakr2RF.pdf', 41, 3, 41, 41, 3, '1', '1', '1', '1', '0');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (31, 'SX0000031', 'cesb', '5', '2021-06-09 21:06:00', '2021-06-21 22:34:20.993373', 'asdasd', 'file/2021/06/PMP.pdf', 41, 3, 11, 11, 3, '1', '1', '1', '1', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (32, 'SX0000032', 'ceshi2er', '5', '2021-06-02 03:06:00', '2021-06-21 22:38:26.341164', 'wewer', 'file/2021/06/Chemestry_6ZQoyxo.pdf', 41, 4, 11, 11, 3, '1', '1', '1', '1', '2');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (33, 'SX0000033', 'ice', '4', '2021-06-09 09:06:00', '2021-06-22 21:10:27.971029', 'ccece', '', 41, 4, 11, 11, 3, NULL, NULL, NULL, NULL, '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (34, 'SX0000034', 'sdasdasd', '4', '2021-06-22 08:06:00', '2021-06-22 21:33:00.630392', 'asdasdasd', '', 41, 4, 11, 11, 3, 'asdasd', 'asdasd', 'asdasd', 'asasdas', '1');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (35, 'SX0000035', 'ceshishsihice', '4', '2021-06-10 09:06:00', '2021-06-22 22:00:08.327779', 'hjahsdjkhajsdhjk', '', 41, 4, 11, 11, 3, 'Accommodation', 'Catering', 'Travel', 'Venue', '2');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (36, 'SX0000036', 'cenksnk', '5', '2021-06-16 09:06:00', '2021-06-22 22:02:45.806616', 'cebhaoishdashd', '', 41, 5, 11, 11, 3, 'sdfsdfsg', 'Nonesdfsdfsdf', 'Nonedfgdfgdfg', 'asdasd', '2');
INSERT INTO personal_explorationapplication (id, number, title, status, do_time, add_time, content, file_content, approver_id, customer_id, proposer_id, receiver_id, land_id, accommodation, catering, travel, venue, type) VALUES (37, 'SX0000037', 'ceceeee', '4', '2021-06-25 14:45:00', '2021-06-23 18:00:10.217454', 'qweqweqweqwe', '', 41, 4, 11, 11, 5, 'fdsdfsdf', 'SDSF', 'sdfsdfsdg', 'SDSD', '1');

-- 表：personal_explorationapplicationrecord
CREATE TABLE "personal_explorationapplicationrecord" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "record_type" varchar(10) NOT NULL, "content" varchar(500) NOT NULL, "file_content" varchar(100) NULL, "add_time" datetime NOT NULL, "name_id" integer NOT NULL REFERENCES "users_userprofile" ("id") DEFERRABLE INITIALLY DEFERRED, "work_order_id" integer NOT NULL REFERENCES "personal_explorationapplication" ("id") DEFERRABLE INITIALLY DEFERRED, "invoice" varchar(100) NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (9, '2', '已完成', '', '2018-06-21 14:22:36.128000', 38, 9, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (10, '2', '已完成', '', '2018-06-21 14:22:56.744000', 38, 4, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (11, '2', '已完成', '', '2018-06-21 14:23:31.016000', 38, 1, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (12, '2', '已完成', '', '2018-06-21 14:24:36.123000', 37, 2, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (13, '2', '已完成', '', '2018-06-21 14:24:55.894000', 37, 5, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (14, '2', '已完成', '', '2018-06-21 14:25:08.511000', 37, 6, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (15, '2', '已完成', '', '2018-06-21 14:25:25.748000', 37, 7, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (19, '2', '已完成现场保障工作，配置文件已上传', 'file/2018/06/吕州公安局配置备份.zip', '2018-05-31 19:34:26', 37, 13, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (20, '3', '已确认', '', '2018-06-21 14:36:33.970000', 32, 9, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (21, '3', '已确认', '', '2018-06-21 14:36:50.082000', 32, 7, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (22, '3', '确认完成', '', '2018-06-21 14:38:01.390000', 32, 6, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (23, '3', '确认完成', '', '2018-06-21 14:38:11.012000', 32, 5, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (24, '3', '确认完成', '', '2018-06-21 14:38:23.248000', 32, 4, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (25, '3', '确认完成', '', '2018-06-21 14:38:35.212000', 32, 2, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (26, '3', '确认完成', '', '2018-06-21 14:38:48.108000', 32, 1, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (27, '2', '设备已经安装部署完成，网络和业务测试都没有问题', 'file/2018/06/吕州市地税局设备安装报告.zip', '2018-06-21 18:42:02', 37, 14, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (28, '0', '用户暂时不需要上门服务', '', '2018-06-21 14:43:32.136000', 37, 8, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (29, '1', 'ok please do it', '', '2021-06-20 21:26:13.059225', 41, 25, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (30, '2', 'meiwenti', '', '2021-06-20 21:27:58.227989', 38, 25, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (31, '1', 'jjj', '', '2021-06-20 21:57:58.037061', 41, 26, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (32, '2', 'okoko', '', '2021-06-20 21:58:42.479559', 38, 26, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (33, '3', 'njj', 'file/2021/06/Chemestry_lH6ALOO.pdf', '2021-06-20 21:59:19.825414', 41, 26, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (34, '1', 'jkhkj', '', '2021-06-20 22:00:42.953590', 41, 27, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (35, '0', 'kjhkjh', '', '2021-06-20 22:00:48.852498', 41, 27, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (36, '1', 'hgfdg', '', '2021-06-21 06:37:56.961714', 41, 22, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (37, '1', 'rghdfg', '', '2021-06-21 20:01:46.793302', 41, 28, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (38, '0', 'df', '', '2021-06-21 20:03:50.994288', 41, 28, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (39, '1', 'yjg', '', '2021-06-21 21:12:49.647782', 41, 23, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (40, '1', 'ghfghf', '', '2021-06-21 21:14:23.165768', 41, 24, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (41, '1', 'uhkj', '', '2021-06-21 21:15:55.643434', 41, 23, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (42, '1', 'hjgjhg', '', '2021-06-21 21:17:33.298821', 41, 24, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (43, '1', 'asdasd', '', '2021-06-21 21:22:47.288671', 41, 24, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (44, '1', 'asdasd', '', '2021-06-21 21:25:31.680242', 41, 24, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (45, '2', 'okokok wo zhixing', '', '2021-06-21 21:31:57.669914', 11, 24, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (46, '1', 'asdasdasd', '', '2021-06-21 21:48:39.620720', 41, 29, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (47, '1', 'okokok', '', '2021-06-21 21:57:56.200095', 41, 29, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (48, '1', 'asdasd', '', '2021-06-21 21:59:13.476630', 41, 29, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (49, '1', 'sdsd', '', '2021-06-21 22:00:38.132938', 41, 29, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (50, '1', 'sdasd', '', '2021-06-21 22:02:11.640222', 41, 30, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (51, '1', 'sdsd', '', '2021-06-21 22:13:47.415874', 41, 30, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (52, '1', 'sadd', 'file/2021/06/formula_isomers_and_physical_properties.ppt.pdf', '2021-06-21 22:17:46.279878', 41, 30, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (53, '2', 'wewe', '', '2021-06-21 22:33:16.769799', 41, 30, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (54, '3', 'wewe', '', '2021-06-21 22:33:23.535550', 41, 30, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (55, '1', 'asdasd', '', '2021-06-21 22:34:35.817245', 11, 31, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (56, '2', 'asdasdasd', 'file/2021/06/Year_4_Integers_Worksheet.pdf', '2021-06-21 22:34:51.638035', 11, 31, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (57, '1', '2sdasd', '', '2021-06-21 22:39:04.723112', 41, 32, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (58, '2', 'sdasdasdasd', 'file/2021/06/Ma_Yajun_OC.pdf', '2021-06-21 22:40:00.782427', 11, 32, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (59, '3', 'dfsd', 'file/2021/06/Recommendation3.pdf', '2021-06-21 22:43:13.535683', 41, 32, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (60, '3', 'ds', 'file/2021/06/222526_9GgBHH2.pdf', '2021-06-22 00:00:24.718750', 41, 31, NULL);
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (61, '1', 'sdfsdfdf', '', '2021-06-22 21:11:20.299183', 41, 33, '');
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (62, '1', 'asdasd', '', '2021-06-22 21:33:39.569812', 41, 34, '');
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (63, '2', 'ok finished', 'file/2021/06/Recommendation3_KLPWodY.pdf', '2021-06-22 21:43:59.666507', 11, 33, '');
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (64, '2', 'effwerwer', '', '2021-06-22 21:54:32.872000', 11, 34, '');
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (65, '1', 'asndjaksdjka', '', '2021-06-22 22:01:03.106416', 41, 35, '');
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (66, '2', 'haloed meiwinti', 'file/2021/06/pf-166-authority-to-release-criminal-history-ntpfes-contractors_aoJg5ug.pdf', '2021-06-22 22:01:48.102749', 11, 35, '');
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (67, '1', 'asdafsdsdf', '', '2021-06-22 22:03:15.434830', 41, 36, '');
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (68, '2', 'jkdjkshdjfkhsdjkf', 'file/2021/06/pf-166-authority-to-release-criminal-history-ntpfes-contractors_mjae4ja.pdf', '2021-06-22 22:04:03.968254', 11, 36, '');
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (69, '3', 'hhkasd', '', '2021-06-22 22:05:39.740950', 41, 36, '');
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (70, '1', 'asdasdasd', '', '2021-06-23 18:01:09.375664', 41, 37, '');
INSERT INTO personal_explorationapplicationrecord (id, record_type, content, file_content, add_time, name_id, work_order_id, invoice) VALUES (71, '2', 'asdasdasd', '', '2021-06-23 18:01:47.158540', 11, 37, '');

-- 表：rbac_menu
CREATE TABLE "rbac_menu" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(32) NOT NULL UNIQUE, "is_top" bool NOT NULL, "icon" varchar(50) NULL, "code" varchar(50) NULL, "url" varchar(128) NULL UNIQUE, "parent_id" integer NULL REFERENCES "rbac_menu" ("id"));
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (1, 'System', 1, NULL, 'SYSTEM', '/system/', NULL);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (2, 'Administration', 1, NULL, 'ADM', '/adm/', NULL);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (3, 'HumanResource', 0, NULL, 'PERSONNEL', '/personnel/', NULL);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (4, 'Flow', 1, NULL, 'FLOW', '/flow/', NULL);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (5, 'My WorkBench', 0, NULL, 'PERSONAL', '/personal/', NULL);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (6, 'System Basic', 0, 'fa fa-gg', 'SYSTEM-BASIC', NULL, 1);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (7, 'Authority Manage', 0, 'fa fa-user-plus', 'SYSTEM-RBAC', NULL, 1);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (8, 'System Tools', 0, 'fa fa-wrench', 'SYSTEM-TOOLS', NULL, 1);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (9, 'Org Structure', 0, NULL, 'SYSTEM-BASIC-STRUCTURE', '/system/basic/structure/', 6);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (10, 'User Manage', 0, NULL, 'SYSTEM-BASIC-USER', '/system/basic/user/', 6);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (11, 'Menu Manage', 0, NULL, 'SYSTEM-RBAC-MENU', '/system/rbac/menu/', 7);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (12, 'Role Manage', 0, NULL, 'SYSTEM-RBAC-ROLE', '/system/rbac/role/', 7);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (15, 'Structure: List', 0, NULL, 'SYSTEM-BASIC-STRUCTURE-LIST', '/system/basic/structure/list', 9);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (16, 'Structure: Detail', 0, NULL, 'SYSTEM-BASIC-STRUCTURE-DETAIL', '/system/basic/structure/detail', 9);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (17, 'Structure: Delete', 0, NULL, 'SYSTEM-BASIC-STRUCTURE-DELETE', '/system/basic/structure/delete', 9);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (18, 'Structure：Add user', 0, NULL, 'SYSTEM-BASIC-STRUCTURE-ADD_USER', '/system/basic/structure/add_user', 9);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (19, 'User Manage：List', 0, NULL, 'SYSTEM-BASIC-USER-LIST', '/system/basic/user/list', 10);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (20, 'User Manage：Detail', 0, NULL, 'SYSTEM-BASIC-USER', '/system/basic/user/detail', 10);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (21, 'User Manage：Update', 0, NULL, 'SYSTEM-BASIC-USER-UPDATE', '/system/basic/user/update', 10);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (22, 'User Manage：Create', 0, NULL, 'SYSTEM-BASIC-USER-CREATE', '/system/basic/user/create', 10);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (23, 'User Manage：Delete', 0, NULL, 'SYSTEM-BASIC-USER-DELETE', '/system/basic/user/delete', 10);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (24, 'User Manage：Enable', 0, NULL, 'SYSTEM-BASIC-USER-ENABLE', '/system/basic/user/enable', 10);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (25, 'User Manage：Disable', 0, NULL, 'SYSTEM-BASIC-USER-DISABLE', '/system/basic/user/disable', 10);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (26, 'User Manage：Adminpasswdchange', 0, NULL, 'SYSTEM-BASIC-USER-AdminPasswdChange', '/system/basic/user/adminpasswdchange', 10);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (27, 'Role Manage：List', 0, NULL, 'SYSTEM-RBAC-ROLE-LIST', '/system/rbac/role/list', 12);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (28, 'Role Manage：Detail-Edit', 0, NULL, 'SYSTEM-RBAC-ROLE-DETAIL', '/system/rbac/role/detail', 12);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (29, 'Role Manage：Delete', 0, NULL, 'SYSTEM-RBAC-ROLE-DELETE', '/system/rbac/role/delete', 12);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (30, 'Role Manage: Menu', 0, NULL, 'SYSTEM-RBAC-ROLE-ROLE_MENU', '/system/rbac/role/role_menu', 12);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (31, 'Role Manage：Menu List', 0, NULL, 'SYSTEM-RBAC-ROLE-ROLE_MENU_LIST', '/system/rbac/role/role_menu_list', 12);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (32, 'Role Manage: User', 0, NULL, 'SYSTEM-RBAC-ROLE-ROLE_LIST', '/system/rbac/role/role_user', 12);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (33, 'Menu Manage：List', 0, NULL, 'SYSTEM-RBAC-MENU-LIST', '/system/rbac/menu/list', 11);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (34, 'System Setup', 0, NULL, 'SYSTEM-TOOLS-SYSTEM_SETUP', '/system/tools/system_setup/', 8);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (35, 'Email Setup', 0, NULL, 'SYSTEM-TOOLS-EMAIL_SETUP', '/system/tools/email_setup/', 8);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (36, 'Basic Manage', 0, 'fa fa-gg', 'ADM-BSM', NULL, 2);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (37, '分销商管理', 0, NULL, 'ADM-BSM-SUPPLIER', '/adm/bsm/supplier/', 36);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (38, '供应商管理：列表', 0, NULL, 'ADM-BSM-SUPPLIER-LIST', '/adm/bsm/supplier/list', 37);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (39, '基础管理：详情-修改', 0, NULL, 'ADM-BSM-SUPPLIER-DETAIL', '/adm/bsm/supplier/detail', 37);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (40, '供应商管理：删除', 0, NULL, 'ADM-BSM-SUPPLIER-DELETE', '/adm/bsm/supplier/delete', 37);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (41, '资产类型', 0, NULL, 'ADM-BSM-ASSETTYPE', '/adm/bsm/assettype/', 36);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (42, '资产类型：列表', 0, NULL, 'ADM-BSM-ASSETTYPE-LIST', '/adm/bsm/assettype/list', 41);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (43, '资产类型：编辑-详情', 0, NULL, 'ADM-BSM-ASSETYPE-DETAIL', '/adm/bsm/assettype/detail', 41);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (44, '资产类型：删除', 0, NULL, 'ADM-BSM-ASSETTYPE-DELETE', '/adm/bsm/assettype/delete', 41);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (45, 'Traditional Owner', 0, NULL, 'ADM-BSM-CUSTOMER', '/adm/bsm/customer/', 36);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (46, 'Traditional Owner: List', 0, NULL, 'ADM-BSM-CUSTOMER-LIST', '/adm/bsm/customer/list', 45);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (47, 'Traditional Owner: Detail', 0, NULL, 'ADM-BSM-CUSTOMER-DETAIL', '/adm/bsm/customer/detail', 45);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (48, 'Traditional Owner: Delete', 0, NULL, 'ADM-BSM-CUSTOMER-DELETE', '/adm/bsm/customer/delete', 45);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (49, '设备类型', 0, NULL, 'ADM-BSM-EQUIPMENTTYPE', '/adm/bsm/equipmenttype/', 36);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (50, '资产管理', 0, 'fa fa-desktop', 'ADM-ASSET', '/adm/asset/', 2);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (51, '设备管理', 0, 'fa fa-keyboard-o', 'ADM-EQUIPMENT', '/adm/equipment/', 2);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (52, 'User Manage：Change Password', 0, NULL, 'SYSTEM-BASIC-USER-PASSWDCHANGE', '/system/basic/user/passwdchange', 10);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (53, '设备类型：列表', 0, NULL, 'ADM-BSM-EQUIPMENTTYPE-LIST', '/adm/bsm/equipmenttype/list', 49);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (54, '设备类型：编辑-详情', 0, NULL, 'ADM-BSM-EQUIPMENTTYPE-DETAIL', '/adm/bsm/equipmenttype/detail', 49);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (55, '设备类型：删除', 0, NULL, 'ADM-BSM-EQUIPMENTTYPE-DELETE', '/adm/bsm/equipmenttype/delete', 49);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (56, '设备管理：列表', 0, NULL, 'ADM-EQUIPMENT-LIST', '/adm/equipment/list', 51);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (57, '设备管理：新建-修改', 0, NULL, 'ADM-EQUIPMENT-CREATE', '/adm/equipment/create', 51);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (58, '设备管理：删除', 0, NULL, 'ADM-EQUIPMENT-DELETE', '/adm/equipment/delete', 51);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (59, '设备管理：详情', 0, NULL, 'ADM-EQUIPMENT-DETAIL', '/adm/equipment/detail', 51);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (60, '设备管理：维保更新', 0, NULL, 'ADM-EQUIPMENT-SERVICEINFO', '/adm/equipment/serviceinfoupdate', 51);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (61, 'UserInfo', 0, 'fa fa-user-plus', 'PERSONAL-USERINFO', '/personal/userinfo', 5);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (62, 'Upload Image', 0, NULL, 'PERSONAL-USERINFO-UPLOADIMAGE', '/personal/uploadimage', 61);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (63, 'Change Password', 0, NULL, 'PERSONAL-USERINFO-PASSWORDCHANGE', '/personal/passwordchange', 61);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (64, 'Internal Contact', 0, 'fa fa-book', 'PERSONAL-PHONEBOOK', '/personal/phonebook', 5);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (65, '菜单管理：详情-修改', 0, NULL, 'SYSTEM-RBAC-MENU-DETAIL', '/system/rbac/menu/detail', 11);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (66, 'Application management', 1, 'fa fa-list-alt', 'PERSONAL-APPLICATION', NULL, 5);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (67, 'My application', 1, 'fa fa-caret-right', 'PERSONAL-APPLICATION_ICRT', '/personal/application_Icrt/', 66);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (68, 'My application：Create', 1, NULL, 'PERSONAL-APPLICATION_ICRT-CREATE', '/personal/application_Icrt/create', 67);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (69, 'My application：List', 1, NULL, 'PERSONAL-APPLICATION_ICRT-LIST', '/personal/application_Icrt/list', 67);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (70, 'My application：Detail', 1, NULL, 'PERSONAL-APPLICATION-DETAIL', '/personal/application_Icrt/detail', 67);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (71, 'My application：Delete', 1, NULL, 'PERSONAL-APPLICATION_ICRT-DELETE', '/personal/application_Icrt/delete', 67);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (72, 'My application：Update', 1, NULL, 'PERSONAL-APPLICATION-UPDATE', '/personal/application_Icrt/update', 67);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (73, 'Assess Application', 1, 'fa fa-caret-right', 'PERSONAL-WORKORDER_APP', '/personal/application_app/', 66);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (74, 'Application Received', 1, 'fa fa-caret-right', 'PERSONAL-WORKORDER_REC', '/personal/application_rec/', 66);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (75, 'My approved application: Assign', 1, NULL, 'PERSONAL-WORKORDER_APP-SEND', '/personal/application_app/send', 73);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (76, 'My received application: Execute', 1, NULL, 'PERSONAL-WORKORDER-EXECUTE', '/personal/application_rec/execute', 74);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (77, 'My received application: Confirm', 1, NULL, 'PERSONAL-WORKORDER_REC-FINISH', '/personal/application_rec/finish', 74);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (78, '资产管理：列表', 1, NULL, 'ADM-ASSET-LIST', '/adm/asset/list', 50);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (79, '资产管理：创建', 1, NULL, 'ADM-ASSET-CREATE', '/adm/asset/create', 50);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (80, '资产管理：修改', 1, NULL, 'ADM-ASSET-UPDATE', '/adm/asset/update', 50);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (81, '资产管理：详情', 1, NULL, 'ADM-ASSET-DETAIL', '/adm/asset/detail', 50);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (82, '资产管理：删除', 1, NULL, 'ADM-ASSET-DELETE', '/adm/asset/delete', 50);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (83, '我创建的工单：上传项目资料', 1, NULL, 'PERSONAL-WORKORDER-PROJECT_UPLOAD', '/personal/application_Icrt/upload', 67);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (84, '我收到的工单：上传配置资料', 1, NULL, 'PERSONAL-WORKORDER-UPLOAD', '/personal/application_rec/upload', 74);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (85, 'All Application', 1, NULL, 'PERSONAL-WORKORDER-ALL', '/personal/application_all/', 66);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (86, '资产管理：上传', 1, NULL, 'ADM-ASSET-UPLOAD', '/adm/asset/upload', 50);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (87, '我收到的工单：退回', 1, NULL, 'PERSONAL-WORKORDER-RETURN', '/personal/application_rec/return', 74);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (88, 'Meeting', 1, 'fa  fa-folder', 'PERSONAL-DOCUMENT', '/personal/document/', 5);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (89, 'Ducument: List', 1, NULL, 'PERSONAL-DOCUMENT-LIST', '/personal/document/list', 88);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (90, 'Meeting-error', 1, 'fa fa-user-plus', 'PERSONAL-MEETING', '/personal/meeting_app/', 5);
INSERT INTO rbac_menu (id, title, is_top, icon, code, url, parent_id) VALUES (91, '我创建的工单：上传发票', 1, NULL, 'PERSONAL-WORKORDER-INVOICE', '/personal/application_rec/invoice', 74);

-- 表：rbac_role
CREATE TABLE "rbac_role" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(32) NOT NULL);
INSERT INTO rbac_role (id, title) VALUES (1, '系统');
INSERT INTO rbac_role (id, title) VALUES (6, '行政');
INSERT INTO rbac_role (id, title) VALUES (7, '人力');
INSERT INTO rbac_role (id, title) VALUES (8, '技术');
INSERT INTO rbac_role (id, title) VALUES (9, '销售');
INSERT INTO rbac_role (id, title) VALUES (10, '管理');
INSERT INTO rbac_role (id, title) VALUES (11, '核算');
INSERT INTO rbac_role (id, title) VALUES (12, '审批');

-- 表：rbac_role_permissions
CREATE TABLE "rbac_role_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "role_id" integer NOT NULL REFERENCES "rbac_role" ("id"), "menu_id" integer NOT NULL REFERENCES "rbac_menu" ("id"));
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (1, 1, 1);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (2, 1, 2);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (3, 1, 3);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (4, 1, 4);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (5, 1, 5);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (6, 1, 6);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (7, 1, 7);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (8, 1, 8);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (9, 1, 9);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (10, 1, 10);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (11, 1, 11);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (12, 1, 12);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (13, 1, 15);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (14, 1, 16);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (15, 1, 17);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (16, 1, 18);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (17, 1, 19);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (18, 1, 20);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (19, 1, 21);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (20, 1, 22);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (21, 1, 23);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (22, 1, 24);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (23, 1, 25);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (24, 1, 26);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (25, 1, 27);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (26, 1, 28);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (27, 1, 29);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (28, 1, 30);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (29, 1, 31);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (30, 1, 32);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (31, 1, 33);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (32, 1, 34);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (33, 1, 35);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (34, 1, 36);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (35, 1, 37);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (36, 1, 38);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (37, 1, 39);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (38, 1, 40);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (39, 1, 41);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (40, 1, 42);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (41, 1, 43);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (42, 1, 44);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (43, 1, 45);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (44, 1, 46);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (45, 1, 47);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (46, 1, 48);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (47, 1, 52);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (48, 6, 2);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (49, 6, 5);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (50, 6, 36);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (51, 6, 37);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (52, 6, 38);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (53, 6, 41);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (54, 6, 42);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (55, 6, 43);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (56, 6, 45);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (57, 6, 46);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (58, 6, 49);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (59, 6, 50);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (60, 6, 51);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (61, 6, 53);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (62, 6, 56);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (63, 6, 59);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (64, 6, 61);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (65, 6, 62);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (66, 6, 63);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (67, 6, 64);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (68, 6, 66);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (69, 6, 67);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (70, 6, 68);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (71, 6, 69);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (72, 6, 70);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (73, 6, 71);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (74, 6, 72);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (75, 6, 74);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (76, 6, 76);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (77, 6, 77);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (78, 6, 78);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (79, 6, 79);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (80, 6, 80);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (81, 6, 81);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (82, 6, 83);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (83, 6, 84);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (84, 6, 86);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (85, 7, 2);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (86, 7, 5);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (87, 7, 36);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (88, 7, 37);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (89, 7, 38);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (90, 7, 39);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (91, 7, 41);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (92, 7, 42);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (93, 7, 43);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (94, 7, 45);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (95, 7, 46);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (96, 7, 47);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (97, 7, 49);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (98, 7, 50);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (99, 7, 51);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (100, 7, 53);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (101, 7, 54);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (102, 7, 56);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (103, 7, 57);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (104, 7, 59);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (105, 7, 60);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (106, 7, 61);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (107, 7, 62);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (108, 7, 63);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (109, 7, 64);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (110, 7, 66);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (111, 7, 67);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (112, 7, 68);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (113, 7, 69);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (114, 7, 70);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (115, 7, 71);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (116, 7, 72);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (117, 7, 74);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (118, 7, 76);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (119, 7, 77);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (120, 8, 2);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (121, 8, 5);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (122, 8, 36);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (123, 8, 37);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (124, 8, 38);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (125, 8, 39);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (126, 8, 41);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (127, 8, 42);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (128, 8, 43);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (129, 8, 45);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (130, 8, 46);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (131, 8, 47);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (132, 8, 49);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (133, 8, 50);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (134, 8, 51);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (135, 8, 53);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (136, 8, 54);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (137, 8, 56);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (138, 8, 57);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (139, 8, 59);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (140, 8, 60);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (141, 8, 61);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (142, 8, 62);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (143, 8, 63);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (144, 8, 64);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (145, 8, 66);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (146, 8, 67);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (147, 8, 68);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (148, 8, 69);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (149, 8, 70);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (150, 8, 71);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (151, 8, 72);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (152, 8, 74);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (153, 8, 76);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (154, 8, 77);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (155, 8, 78);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (156, 8, 81);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (157, 8, 83);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (158, 8, 84);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (159, 8, 87);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (160, 8, 88);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (161, 8, 89);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (204, 10, 1);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (205, 10, 2);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (206, 10, 5);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (207, 10, 6);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (208, 10, 7);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (209, 10, 8);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (210, 10, 9);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (211, 10, 10);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (212, 10, 11);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (213, 10, 12);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (214, 10, 15);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (215, 10, 16);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (216, 10, 17);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (217, 10, 18);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (218, 10, 19);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (219, 10, 20);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (220, 10, 21);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (221, 10, 22);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (222, 10, 23);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (223, 10, 24);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (224, 10, 25);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (225, 10, 26);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (226, 10, 27);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (227, 10, 28);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (228, 10, 29);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (229, 10, 30);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (230, 10, 31);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (231, 10, 32);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (232, 10, 33);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (233, 10, 34);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (234, 10, 35);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (235, 10, 36);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (236, 10, 37);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (237, 10, 38);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (238, 10, 39);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (239, 10, 40);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (240, 10, 41);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (241, 10, 42);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (242, 10, 43);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (243, 10, 44);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (244, 10, 45);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (245, 10, 46);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (246, 10, 47);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (247, 10, 48);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (248, 10, 49);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (249, 10, 50);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (250, 10, 51);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (251, 10, 52);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (252, 10, 53);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (253, 10, 54);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (254, 10, 55);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (255, 10, 56);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (256, 10, 57);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (257, 10, 58);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (258, 10, 59);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (259, 10, 60);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (260, 10, 61);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (261, 10, 62);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (262, 10, 63);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (263, 10, 64);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (264, 10, 65);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (265, 10, 66);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (266, 10, 67);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (267, 10, 68);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (268, 10, 69);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (269, 10, 70);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (270, 10, 71);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (271, 10, 72);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (272, 10, 73);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (273, 10, 74);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (274, 10, 75);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (275, 10, 76);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (276, 10, 77);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (277, 10, 78);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (278, 10, 79);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (279, 10, 80);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (280, 10, 81);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (281, 10, 82);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (282, 10, 83);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (283, 10, 84);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (284, 10, 85);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (285, 10, 86);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (286, 10, 87);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (287, 10, 88);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (288, 10, 89);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (289, 12, 73);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (290, 12, 66);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (291, 12, 75);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (292, 12, 5);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (293, 9, 5);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (294, 9, 61);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (295, 9, 62);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (296, 9, 63);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (297, 9, 64);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (298, 9, 66);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (299, 9, 67);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (300, 9, 68);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (301, 9, 69);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (302, 9, 70);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (303, 9, 71);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (304, 9, 72);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (305, 9, 83);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (306, 9, 88);
INSERT INTO rbac_role_permissions (id, role_id, menu_id) VALUES (307, 9, 89);

-- 表：system_emailsetup
CREATE TABLE "system_emailsetup" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "emailHost" varchar(30) NOT NULL, "emailPort" integer NOT NULL, "emailUser" varchar(100) NOT NULL, "emailPassword" varchar(30) NOT NULL);

-- 表：system_systemsetup
CREATE TABLE "system_systemsetup" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "loginTitle" varchar(20) NULL, "mainTitle" varchar(20) NULL, "headTitle" varchar(20) NULL, "copyright" varchar(100) NULL, "url" varchar(50) NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (2, '江苏沙河', 'SandBox', 'SandBox', '江苏沙盒', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (3, '江苏沙盒科技', 'SandBox', 'SandBox', '江苏沙盒科技', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (4, '江苏沙盒科技', 'SandBox', 'SandBox', 'Copyright © 2016-2017 江苏沙盒科技.Version1.0.1', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (5, '江苏沙盒科技', 'SandBox', 'SandBox', 'Copyright © 2016-2017 江苏沙盒科技.Version1.0.1', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (6, '江苏沙盒协同办公平台', 'SandBox', 'SandBox', 'Copyright © 2016-2017 江苏沙盒科技.Version1.0.1', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (7, '江苏沙盒协同办公平台', 'SandBox', 'SandBox', 'Copyright © 2016-2017 江苏沙盒科技.Version2.0.2', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (8, '沙盒协同办公平台', 'SandBox', 'SandBox', 'Copyright © 2016-2017 江苏沙盒科技.Version2.0.2', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (9, '沙盒协同办公平台', 'SandBox', 'SandBox', 'Copyright © 2016-2017 江苏沙盒科技.Version2.0.3', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (10, '沙盒协同办公平台', 'SandBox', 'SandBox', 'Copyright © 2016-2017 江苏沙盒科技.Version2.0.6', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (11, '沙盒协同办公平台', 'SandBox', 'SandBox', 'Copyright © 2017-2018 江苏沙盒科技.Version2.0.6', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (12, 'LUMAR Enterprise', 'LUMAR Enterprise', 'LUMAR Enterprise', 'Copyright © 2017-2018 江苏沙盒科技.Version2.0.6', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (13, 'LUMAR Enterprise', 'LUMAR Enterprise', 'LUMAR Enterprise', 'Copyright © 2017-2018 江沙盒科技.Version2.0.6', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (14, 'LUMAR Enterprise', 'LUMAR Enterprise', 'LUMAR Enterprise', 'Copyright © 2017-2018 江沙盒科技.Version2.0.6', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (15, 'LUMAR Enterprise', 'LUMAR', 'LUMAR', 'Copyright © 2017-2018 江沙盒科技.Version2.0.6', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (16, 'LUMAR Enterprise', 'LUMAR', 'LUMAR', 'Copyright © LUMAR.Version2.0.6', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (17, 'LUMAR Enterprise', 'LUMAR', 'LUMAR', 'Copyright © LUMAR.Version2.0.6', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (18, 'LUMAR Enterprise', 'LUMAR', 'LUMAR', 'Copyright © LUMAR.Version2.0.6', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (19, 'LUMAR Enterprise', 'LUMAR', 'LUMAR', 'Copyright © LUMAR.Version2.0.6', NULL);
INSERT INTO system_systemsetup (id, loginTitle, mainTitle, headTitle, copyright, url) VALUES (20, 'LUMAR Enterprise', 'LUMAR', 'LUMAR', 'Copyright © LUMAR.Version2.0.6', NULL);

-- 表：users_structure
CREATE TABLE "users_structure" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(60) NOT NULL, "type" varchar(20) NOT NULL, "address" varchar(60) NOT NULL, "abn" varchar(60) NOT NULL, "telephone" varchar(60) NOT NULL, "parent_id" integer NULL REFERENCES "users_structure" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (5, '汉东沙盒科技', 'firm', 'LUMAR', '434-432', '088880000', NULL);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (9, '销售部', 'department', 'LUMAR', '434-432', '088880000', 5);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (10, '技术部', 'department', 'LUMAR', '434-432', '088880000', 5);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (11, '商务中心', 'department', 'LUMAR', '434-432', '088880000', 5);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (12, '行政中心', 'department', 'LUMAR', '434-432', '088880000', 5);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (13, '财务', 'department', 'LUMAR', '434-432', '088880000', 9);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (14, '车队', 'department', 'LUMAR', '434-432', '088880000', 10);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (15, '销售部-内', 'department', 'LUMAR', '434-432', '088880000', 5);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (18, 'Uniol', 'firm', 'LUMAR', '434-432', '088880000', NULL);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (19, 'Takuma', 'firm', 'LUMAR', '434-432', '088880000', NULL);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (20, 'Mirrd', 'firm', 'LUMAR', '434-432', '088880000', NULL);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (21, 'Uni', 'firm', '', '434-432', '088880000', NULL);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (22, 'aafd', 'firm', '', '', '', NULL);
INSERT INTO users_structure (id, title, type, address, abn, telephone, parent_id) VALUES (23, 'jhgkj', 'firm', '', '', '', NULL);

-- 表：users_userprofile
CREATE TABLE "users_userprofile" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "last_name" varchar(150) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "name" varchar(20) NOT NULL, "birthday" date NULL, "gender" varchar(10) NOT NULL, "mobile" varchar(11) NOT NULL, "email" varchar(100) NOT NULL, "image" varchar(100) NULL, "post" varchar(50) NULL, "joined_date" date NULL, "department_id" integer NULL REFERENCES "users_structure" ("id") DEFERRABLE INITIALLY DEFERRED, "superior_id" integer NULL REFERENCES "users_userprofile" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO users_userprofile (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, name, birthday, gender, mobile, email, image, post, joined_date, department_id, superior_id) VALUES (11, 'pbkdf2_sha256$150000$fQcPwz78Qnr6$cR3CAC3zbWs3BdcacH+bWP1MNIqlc9Bj3KqmCCSVtaM=', '2021-06-27 06:12:01.363323', 1, 'admin', '', '', 1, 1, '2017-12-12 16:51:00', 'myadmin', NULL, 'male', '13813836955', 'admin@sandbox.com', 'image/2018/06/timg01.jpg', NULL, NULL, NULL, NULL);
INSERT INTO users_userprofile (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, name, birthday, gender, mobile, email, image, post, joined_date, department_id, superior_id) VALUES (32, 'pbkdf2_sha256$150000$2B1UeqCBtXCn$NCxEG6a+cRbcAID+UBJbp+fr3X2v8nZSZQ8jS2UexhI=', '2021-06-19 20:56:40.327189', 0, 'zhangxiaoming', '', '', 0, 1, '2018-06-21 11:36:27.445000', '张晓明', '2021-06-16', 'male', '13656987451', 'zhangxm@sandbox.com', 'image/2018/06/01.jpg', '销售', NULL, 9, NULL);
INSERT INTO users_userprofile (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, name, birthday, gender, mobile, email, image, post, joined_date, department_id, superior_id) VALUES (34, 'pbkdf2_sha256$150000$ViQzP0Ri80ZO$HOcp8LysfjX0XIfpX3GhgzgZxwdsJEaQawSXwFJj2t8=', '2021-06-26 08:01:52.558769', 0, 'wanghonglin', '', '', 0, 1, '2018-06-21 11:41:40.227000', 'Hongli', NULL, 'male', '13656869870', 'wanghl@sandbox.com', 'image/default.jpg', 'CEO', NULL, 9, NULL);
INSERT INTO users_userprofile (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, name, birthday, gender, mobile, email, image, post, joined_date, department_id, superior_id) VALUES (37, 'pbkdf2_sha256$150000$iObnsbP5O35I$/kbHOrarKHK5CMm3lQ0xkadL+WZ5HVjRnL1/cnZ7Xc4=', '2021-06-17 09:57:11.069314', 0, 'qiuhongyu', '', '', 0, 1, '2018-06-21 11:45:55.417000', '邱宏宇', NULL, 'male', '13150645789', 'qiuhy@sandbox.com', 'image/2018/06/04.jpg', '工程师', NULL, 10, NULL);
INSERT INTO users_userprofile (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, name, birthday, gender, mobile, email, image, post, joined_date, department_id, superior_id) VALUES (38, 'pbkdf2_sha256$150000$xD7wmrbr62Vf$QCYbgx41SYKcbFR4P73eYwnmhusq1UDYUrIk60JY7vg=', '2021-06-21 19:06:15.135490', 0, 'hanfeng', '', '', 0, 1, '2018-06-21 11:48:20.291000', '韩峰', NULL, 'male', '13602568911', 'hanfeng@sandbox.com', 'image/2018/06/06.jpg', '工程师', NULL, 10, NULL);
INSERT INTO users_userprofile (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, name, birthday, gender, mobile, email, image, post, joined_date, department_id, superior_id) VALUES (39, 'pbkdf2_sha256$150000$PM1ZPne4saje$Oc7Ce7G33B8Id9E77R0gHuBAZelWn5VnXhXAxSw+Y0Y=', '2021-06-17 07:16:50.789728', 0, 'chenchen', '', '', 0, 1, '2018-06-21 12:27:40.311000', '陈晨', NULL, 'male', '13689656865', 'chenchen@sandbox.com', 'image/default.jpg', '商务', NULL, 12, NULL);
INSERT INTO users_userprofile (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, name, birthday, gender, mobile, email, image, post, joined_date, department_id, superior_id) VALUES (41, 'pbkdf2_sha256$150000$ite5eGTAyk5m$9nANetTHJT4xogFElXh906aMw5n+c0ke5qK2sGte8qk=', '2021-06-23 18:00:37.366491', 0, 'Reviewer', '', '', 0, 1, '2021-06-19 19:58:49.910561', 'NLC Reviewer', '2021-06-18', 'male', '0423424008', '234234234@ga.com', 'image/default.jpg', 'ok', '2021-06-18', 12, NULL);
INSERT INTO users_userprofile (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, name, birthday, gender, mobile, email, image, post, joined_date, department_id, superior_id) VALUES (42, 'pbkdf2_sha256$150000$IHj2BiIdrBP1$uY8l93BE5QCvWE7HAmfdLeek+TxEu6akleRTPJizVo8=', '2021-06-20 21:55:19.113525', 0, 'jack', '', '', 0, 1, '2021-06-20 21:24:15.088338', 'Jack', '2021-06-15', 'male', '0423424009', 'sad@mgil.com', 'image/default.jpg', 'ok', '2021-06-08', 22, NULL);

-- 表：users_userprofile_groups
CREATE TABLE "users_userprofile_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "userprofile_id" integer NOT NULL REFERENCES "users_userprofile" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"));

-- 表：users_userprofile_roles
CREATE TABLE "users_userprofile_roles" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "userprofile_id" integer NOT NULL REFERENCES "users_userprofile" ("id") DEFERRABLE INITIALLY DEFERRED, "role_id" integer NOT NULL REFERENCES "rbac_role" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO users_userprofile_roles (id, userprofile_id, role_id) VALUES (1, 11, 10);
INSERT INTO users_userprofile_roles (id, userprofile_id, role_id) VALUES (2, 32, 9);
INSERT INTO users_userprofile_roles (id, userprofile_id, role_id) VALUES (4, 34, 9);
INSERT INTO users_userprofile_roles (id, userprofile_id, role_id) VALUES (9, 37, 8);
INSERT INTO users_userprofile_roles (id, userprofile_id, role_id) VALUES (10, 38, 8);
INSERT INTO users_userprofile_roles (id, userprofile_id, role_id) VALUES (11, 39, 6);
INSERT INTO users_userprofile_roles (id, userprofile_id, role_id) VALUES (13, 41, 12);
INSERT INTO users_userprofile_roles (id, userprofile_id, role_id) VALUES (14, 41, 10);
INSERT INTO users_userprofile_roles (id, userprofile_id, role_id) VALUES (15, 41, 11);
INSERT INTO users_userprofile_roles (id, userprofile_id, role_id) VALUES (16, 42, 9);

-- 表：users_userprofile_user_permissions
CREATE TABLE "users_userprofile_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "userprofile_id" integer NOT NULL REFERENCES "users_userprofile" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));

-- 表：xadmin_bookmark
CREATE TABLE "xadmin_bookmark" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(128) NOT NULL, "url_name" varchar(64) NOT NULL, "query" varchar(1000) NOT NULL, "is_share" bool NOT NULL, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "user_id" integer NULL REFERENCES "users_userprofile" ("id"));

-- 表：xadmin_log
CREATE TABLE "xadmin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "ip_addr" char(39) NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" varchar(32) NOT NULL, "message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "users_userprofile" ("id"));

-- 表：xadmin_usersettings
CREATE TABLE "xadmin_usersettings" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "key" varchar(256) NOT NULL, "value" text NOT NULL, "user_id" integer NOT NULL REFERENCES "users_userprofile" ("id"));
INSERT INTO xadmin_usersettings (id, "key", value, user_id) VALUES (1, 'dashboard:home:pos', '', 11);

-- 表：xadmin_userwidget
CREATE TABLE "xadmin_userwidget" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "page_id" varchar(256) NOT NULL, "widget_type" varchar(50) NOT NULL, "value" text NOT NULL, "user_id" integer NOT NULL REFERENCES "users_userprofile" ("id"));

-- 索引：adm_asset_assetType_id_8ff054dc
CREATE INDEX "adm_asset_assetType_id_8ff054dc" ON "adm_asset" ("assetType_id");

-- 索引：adm_asset_owner_id_7dbcc0e1
CREATE INDEX "adm_asset_owner_id_7dbcc0e1" ON "adm_asset" ("owner_id");

-- 索引：adm_assetfile_asset_id_60c8e487
CREATE INDEX "adm_assetfile_asset_id_60c8e487" ON "adm_assetfile" ("asset_id");

-- 索引：adm_assetlog_asset_id_66a32c81
CREATE INDEX "adm_assetlog_asset_id_66a32c81" ON "adm_assetlog" ("asset_id");

-- 索引：adm_customer_belongs_to_id_e4e83cb1
CREATE INDEX "adm_customer_belongs_to_id_e4e83cb1" ON "adm_customer" ("belongs_to_id");

-- 索引：adm_equipment_customer_id_b2df97df
CREATE INDEX "adm_equipment_customer_id_b2df97df" ON "adm_equipment" ("customer_id");

-- 索引：adm_equipment_equipment_type_id_51991b84
CREATE INDEX "adm_equipment_equipment_type_id_51991b84" ON "adm_equipment" ("equipment_type_id");

-- 索引：adm_equipment_supplier_id_1681cded
CREATE INDEX "adm_equipment_supplier_id_1681cded" ON "adm_equipment" ("supplier_id");

-- 索引：adm_serviceinfo_writer_id_911d31a1
CREATE INDEX "adm_serviceinfo_writer_id_911d31a1" ON "adm_serviceinfo" ("writer_id");

-- 索引：adm_supplier_belongs_to_id_f72b527a
CREATE INDEX "adm_supplier_belongs_to_id_f72b527a" ON "adm_supplier" ("belongs_to_id");

-- 索引：auth_group_permissions_group_id_b120cbf9
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");

-- 索引：auth_group_permissions_group_id_permission_id_0cd325b0_uniq
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");

-- 索引：auth_group_permissions_permission_id_84c5c92e
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");

-- 索引：auth_permission_content_type_id_2f476e4b
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");

-- 索引：auth_permission_content_type_id_codename_01ab375a_uniq
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");

-- 索引：django_content_type_app_label_model_76bd3d3b_uniq
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");

-- 索引：django_session_expire_date_a5c62663
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");

-- 索引：personal_explorationapplication_approver_id_3d0bb35e
CREATE INDEX "personal_explorationapplication_approver_id_3d0bb35e" ON "personal_explorationapplication" ("approver_id");

-- 索引：personal_explorationapplication_customer_id_acb1ded1
CREATE INDEX "personal_explorationapplication_customer_id_acb1ded1" ON "personal_explorationapplication" ("customer_id");

-- 索引：personal_explorationapplication_land_id_ee27b051
CREATE INDEX "personal_explorationapplication_land_id_ee27b051" ON "personal_explorationapplication" ("land_id");

-- 索引：personal_explorationapplication_proposer_id_f46b5419
CREATE INDEX "personal_explorationapplication_proposer_id_f46b5419" ON "personal_explorationapplication" ("proposer_id");

-- 索引：personal_explorationapplication_receiver_id_d6543821
CREATE INDEX "personal_explorationapplication_receiver_id_d6543821" ON "personal_explorationapplication" ("receiver_id");

-- 索引：rbac_menu_parent_id_60a5b178
CREATE INDEX "rbac_menu_parent_id_60a5b178" ON "rbac_menu" ("parent_id");

-- 索引：rbac_role_permissions_menu_id_bb73fb9a
CREATE INDEX "rbac_role_permissions_menu_id_bb73fb9a" ON "rbac_role_permissions" ("menu_id");

-- 索引：rbac_role_permissions_role_id_d10416cb
CREATE INDEX "rbac_role_permissions_role_id_d10416cb" ON "rbac_role_permissions" ("role_id");

-- 索引：rbac_role_permissions_role_id_menu_id_8ba9f835_uniq
CREATE UNIQUE INDEX "rbac_role_permissions_role_id_menu_id_8ba9f835_uniq" ON "rbac_role_permissions" ("role_id", "menu_id");

-- 索引：users_structure_parent_id_e73fd647
CREATE INDEX "users_structure_parent_id_e73fd647" ON "users_structure" ("parent_id");

-- 索引：users_userprofile_department_id_b060d851
CREATE INDEX "users_userprofile_department_id_b060d851" ON "users_userprofile" ("department_id");

-- 索引：users_userprofile_roles_role_id_740e5521
CREATE INDEX "users_userprofile_roles_role_id_740e5521" ON "users_userprofile_roles" ("role_id");

-- 索引：users_userprofile_roles_userprofile_id_ae49de2a
CREATE INDEX "users_userprofile_roles_userprofile_id_ae49de2a" ON "users_userprofile_roles" ("userprofile_id");

-- 索引：users_userprofile_roles_userprofile_id_role_id_81c255df_uniq
CREATE UNIQUE INDEX "users_userprofile_roles_userprofile_id_role_id_81c255df_uniq" ON "users_userprofile_roles" ("userprofile_id", "role_id");

-- 索引：users_userprofile_superior_id_3869391f
CREATE INDEX "users_userprofile_superior_id_3869391f" ON "users_userprofile" ("superior_id");

-- 索引：users_userprofile_user_permissions_permission_id_393136b6
CREATE INDEX "users_userprofile_user_permissions_permission_id_393136b6" ON "users_userprofile_user_permissions" ("permission_id");

-- 索引：users_userprofile_user_permissions_userprofile_id_34544737
CREATE INDEX "users_userprofile_user_permissions_userprofile_id_34544737" ON "users_userprofile_user_permissions" ("userprofile_id");

-- 索引：users_userprofile_user_permissions_userprofile_id_permission_id_d0215190_uniq
CREATE UNIQUE INDEX "users_userprofile_user_permissions_userprofile_id_permission_id_d0215190_uniq" ON "users_userprofile_user_permissions" ("userprofile_id", "permission_id");

-- 索引：xadmin_bookmark_content_type_id_60941679
CREATE INDEX "xadmin_bookmark_content_type_id_60941679" ON "xadmin_bookmark" ("content_type_id");

-- 索引：xadmin_bookmark_user_id_42d307fc
CREATE INDEX "xadmin_bookmark_user_id_42d307fc" ON "xadmin_bookmark" ("user_id");

-- 索引：xadmin_log_content_type_id_2a6cb852
CREATE INDEX "xadmin_log_content_type_id_2a6cb852" ON "xadmin_log" ("content_type_id");

-- 索引：xadmin_log_user_id_bb16a176
CREATE INDEX "xadmin_log_user_id_bb16a176" ON "xadmin_log" ("user_id");

-- 索引：xadmin_usersettings_user_id_edeabe4a
CREATE INDEX "xadmin_usersettings_user_id_edeabe4a" ON "xadmin_usersettings" ("user_id");

-- 索引：xadmin_userwidget_user_id_c159233a
CREATE INDEX "xadmin_userwidget_user_id_c159233a" ON "xadmin_userwidget" ("user_id");

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
