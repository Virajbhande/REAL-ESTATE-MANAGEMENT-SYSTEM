BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "estate_propertytype" (
	"id"	integer NOT NULL,
	"typename"	varchar(100),
	"creationdate"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "estate_state" (
	"id"	integer NOT NULL,
	"statename"	varchar(100),
	"creationdate"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "estate_city" (
	"id"	integer NOT NULL,
	"cityname"	varchar(100),
	"creationdate"	datetime NOT NULL,
	"state_id"	integer,
	FOREIGN KEY("state_id") REFERENCES "estate_state"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "estate_usertype" (
	"id"	integer NOT NULL,
	"type"	varchar(100),
	"postingdate"	datetime NOT NULL,
	"user_id"	integer,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "estate_property" (
	"id"	integer NOT NULL,
	"propertytitle"	varchar(100),
	"propertydescription"	varchar(300),
	"status"	varchar(50),
	"location"	varchar(100),
	"bedrooms"	varchar(100),
	"bathrooms"	varchar(100),
	"floors"	varchar(100),
	"garages"	varchar(100),
	"area"	varchar(100),
	"size"	varchar(100),
	"rentorbuyprice"	varchar(100),
	"beforepricelabel"	varchar(100),
	"afterpricelabel"	varchar(100),
	"propertyid"	varchar(100),
	"centercooling"	varchar(100),
	"balcony"	varchar(100),
	"petfriendly"	varchar(100),
	"barbeque"	varchar(100),
	"firealarm"	varchar(100),
	"modernkitchen"	varchar(100),
	"storage"	varchar(100),
	"dryer"	varchar(100),
	"heating"	varchar(100),
	"pool"	varchar(100),
	"laundry"	varchar(100),
	"sauna"	varchar(100),
	"gym"	varchar(100),
	"elevator"	varchar(100),
	"dishwasher"	varchar(100),
	"emergencyexit"	varchar(100),
	"featuredimage"	varchar(100),
	"galleryimage1"	varchar(100),
	"galleryimage2"	varchar(100),
	"galleryimage3"	varchar(100),
	"galleryimage4"	varchar(100),
	"galleryimage5"	varchar(100),
	"address"	varchar(300),
	"zipcode"	varchar(30),
	"neighborhood"	varchar(200),
	"listingdate"	datetime NOT NULL,
	"city_id"	integer NOT NULL,
	"type_id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	FOREIGN KEY("type_id") REFERENCES "estate_propertytype"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("city_id") REFERENCES "estate_city"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "estate_usertype"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "estate_enquiry" (
	"id"	integer NOT NULL,
	"fullname"	varchar(100),
	"emailid"	varchar(100),
	"mobileno"	varchar(50),
	"message"	varchar(500),
	"enquiryno"	varchar(50),
	"enquirydate"	datetime NOT NULL,
	"status"	varchar(100),
	"remark"	varchar(500),
	"remarkdate"	date,
	"property_id"	integer,
	FOREIGN KEY("property_id") REFERENCES "estate_property"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "estate_feedback" (
	"id"	integer NOT NULL,
	"userremark"	varchar(500),
	"postingdate"	datetime NOT NULL,
	"ispublish"	varchar(50),
	"property_id"	integer,
	"user_id"	integer,
	FOREIGN KEY("property_id") REFERENCES "estate_property"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "estate_usertype"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2022-04-06 06:08:01.083417');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2022-04-06 06:08:01.161964');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2022-04-06 06:08:01.256207');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2022-04-06 06:08:01.350369');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2022-04-06 06:08:01.428927');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2022-04-06 06:08:01.530729');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2022-04-06 06:08:01.609280');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2022-04-06 06:08:01.750360');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2022-04-06 06:08:01.813271');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2022-04-06 06:08:01.938714');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2022-04-06 06:08:01.985604');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2022-04-06 06:08:02.064158');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2022-04-06 06:08:02.142703');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2022-04-06 06:08:02.283763');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2022-04-06 06:08:02.393594');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2022-04-06 06:08:02.487781');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2022-04-06 06:08:02.581972');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2022-04-06 06:08:02.644898');
INSERT INTO "django_migrations" VALUES (19,'estate','0001_initial','2022-04-06 06:41:06.304864');
INSERT INTO "django_migrations" VALUES (20,'estate','0002_delete_usertype','2022-04-07 11:20:16.076343');
INSERT INTO "django_migrations" VALUES (21,'estate','0003_usertype','2022-04-07 11:20:46.004332');
INSERT INTO "django_migrations" VALUES (22,'estate','0004_auto_20220408_1700','2022-04-08 11:30:48.615717');
INSERT INTO "django_migrations" VALUES (23,'estate','0005_auto_20220408_1701','2022-04-08 11:31:23.556482');
INSERT INTO "django_migrations" VALUES (24,'estate','0006_remove_property_state','2022-04-08 12:05:42.593220');
INSERT INTO "django_migrations" VALUES (25,'estate','0007_remove_property_type','2022-04-08 12:17:58.795327');
INSERT INTO "django_migrations" VALUES (26,'estate','0008_auto_20220408_1749','2022-04-08 12:19:11.056298');
INSERT INTO "django_migrations" VALUES (27,'estate','0009_auto_20220408_1749','2022-04-08 12:19:46.590748');
INSERT INTO "django_migrations" VALUES (28,'estate','0010_remove_property_user','2022-04-09 08:06:30.224433');
INSERT INTO "django_migrations" VALUES (29,'estate','0011_auto_20220409_1339','2022-04-09 08:09:34.404137');
INSERT INTO "django_migrations" VALUES (30,'estate','0012_auto_20220409_1339','2022-04-09 08:10:03.314647');
INSERT INTO "django_migrations" VALUES (31,'estate','0013_delete_enquiry','2022-04-18 11:32:42.268908');
INSERT INTO "django_migrations" VALUES (32,'estate','0014_enquiry','2022-04-18 11:33:03.633535');
INSERT INTO "django_migrations" VALUES (33,'estate','0015_auto_20220419_1455','2022-04-19 09:25:31.121430');
INSERT INTO "django_admin_log" VALUES (1,'2022-04-07 11:22:25.288232','2','abhi@gmail.com','',4,1,3);
INSERT INTO "django_admin_log" VALUES (2,'2022-04-07 11:22:25.471897','4','ankit@gmail.com','',4,1,3);
INSERT INTO "django_admin_log" VALUES (3,'2022-04-07 11:22:25.559920','3','rohit@gmail.com','',4,1,3);
INSERT INTO "django_admin_log" VALUES (4,'2022-04-09 08:13:12.354042','2','One BHK Building','',11,1,3);
INSERT INTO "django_admin_log" VALUES (5,'2022-04-18 11:56:46.054746','2','Rohit','[{"changed": {"fields": ["Type"]}}]',8,1,2);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'estate','propertytype');
INSERT INTO "django_content_type" VALUES (8,'estate','usertype');
INSERT INTO "django_content_type" VALUES (9,'estate','enquiry');
INSERT INTO "django_content_type" VALUES (10,'estate','feedback');
INSERT INTO "django_content_type" VALUES (11,'estate','property');
INSERT INTO "django_content_type" VALUES (12,'estate','state');
INSERT INTO "django_content_type" VALUES (13,'estate','city');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_propertytype','Can add property type');
INSERT INTO "auth_permission" VALUES (26,7,'change_propertytype','Can change property type');
INSERT INTO "auth_permission" VALUES (27,7,'delete_propertytype','Can delete property type');
INSERT INTO "auth_permission" VALUES (28,7,'view_propertytype','Can view property type');
INSERT INTO "auth_permission" VALUES (29,8,'add_usertype','Can add user type');
INSERT INTO "auth_permission" VALUES (30,8,'change_usertype','Can change user type');
INSERT INTO "auth_permission" VALUES (31,8,'delete_usertype','Can delete user type');
INSERT INTO "auth_permission" VALUES (32,8,'view_usertype','Can view user type');
INSERT INTO "auth_permission" VALUES (33,9,'add_enquiry','Can add enquiry');
INSERT INTO "auth_permission" VALUES (34,9,'change_enquiry','Can change enquiry');
INSERT INTO "auth_permission" VALUES (35,9,'delete_enquiry','Can delete enquiry');
INSERT INTO "auth_permission" VALUES (36,9,'view_enquiry','Can view enquiry');
INSERT INTO "auth_permission" VALUES (37,10,'add_feedback','Can add feedback');
INSERT INTO "auth_permission" VALUES (38,10,'change_feedback','Can change feedback');
INSERT INTO "auth_permission" VALUES (39,10,'delete_feedback','Can delete feedback');
INSERT INTO "auth_permission" VALUES (40,10,'view_feedback','Can view feedback');
INSERT INTO "auth_permission" VALUES (41,11,'add_property','Can add property');
INSERT INTO "auth_permission" VALUES (42,11,'change_property','Can change property');
INSERT INTO "auth_permission" VALUES (43,11,'delete_property','Can delete property');
INSERT INTO "auth_permission" VALUES (44,11,'view_property','Can view property');
INSERT INTO "auth_permission" VALUES (45,12,'add_state','Can add state');
INSERT INTO "auth_permission" VALUES (46,12,'change_state','Can change state');
INSERT INTO "auth_permission" VALUES (47,12,'delete_state','Can delete state');
INSERT INTO "auth_permission" VALUES (48,12,'view_state','Can view state');
INSERT INTO "auth_permission" VALUES (49,13,'add_city','Can add city');
INSERT INTO "auth_permission" VALUES (50,13,'change_city','Can change city');
INSERT INTO "auth_permission" VALUES (51,13,'delete_city','Can delete city');
INSERT INTO "auth_permission" VALUES (52,13,'view_city','Can view city');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$390000$fNf6WhLqvs7Lk1CiIUNkaI$5HOF0C89IH2cCSOYPo/FRmHWjNCx+X9JzsSAhfrvOrs=','2023-04-19 04:55:05.631603',1,'admin','','admin@gmail.com',1,1,'2022-04-06 06:09:37.996006','');
INSERT INTO "auth_user" VALUES (9,'pbkdf2_sha256$390000$OQ4fu1Z0vX9pyoP6QqCIaZ$m3NfXkwORw40XNZLHFhkVgpjB7gDlTTRIUqKBVlT69A=','2023-04-20 15:26:10.284429',0,'omkale1234om@gmail.com','Kale','',0,1,'2023-04-03 04:08:31.503075','om');
INSERT INTO "django_session" VALUES ('626h08whyq2r3ybox6wfsm4by1f21ods','e30:1nc10D:8l7bFriQaGX0T_Hg5hdHpcn6B29ingUU7UmgPinI2eo','2022-04-20 08:26:57.417789');
INSERT INTO "django_session" VALUES ('5px79drz6fze7sa5xjgbt0a8bll20qkw','.eJxVjEEOwiAQRe_C2hDoQHFcuu8ZyMxApWpoUtqV8e7apAvd_vfef6lI21ri1vISp6QuyqrT78Ykj1x3kO5Ub7OWua7LxHpX9EGbHuaUn9fD_Tso1Mq3PvcePYROJHUhmMCeLEJvkhem0TOAiAMWtJQtG4c5ETgMiCMbA6LeH9N0N8s:1nc5Vy:UZYqND-qeLWXzW7NhFDVsulopeqcpSXXpA0Ytc98utM','2022-04-20 13:16:02.466331');
INSERT INTO "django_session" VALUES ('nstsqisf5ay10qrequo9gq5tapiumtqw','.eJxVjEEOwiAQRe_C2hDoQHFcuu8ZyMxApWpoUtqV8e7apAvd_vfef6lI21ri1vISp6QuyqrT78Ykj1x3kO5Ub7OWua7LxHpX9EGbHuaUn9fD_Tso1Mq3PvcePYROJHUhmMCeLEJvkhem0TOAiAMWtJQtG4c5ETgMiCMbA6LeH9N0N8s:1ncQIT:tWeK0B7VSYzVy_44B10ARukK3dz5qJL1XBhu8h90YMU','2022-04-21 11:27:29.419565');
INSERT INTO "django_session" VALUES ('1yql7ziei3464u7po4pn8gr2n21m9how','.eJxVjEEOwiAQRe_C2hDoQHFcuu8ZyMxApWpoUtqV8e7apAvd_vfef6lI21ri1vISp6QuyqrT78Ykj1x3kO5Ub7OWua7LxHpX9EGbHuaUn9fD_Tso1Mq3PvcePYROJHUhmMCeLEJvkhem0TOAiAMWtJQtG4c5ETgMiCMbA6LeH9N0N8s:1ncn8Z:ucslMUCJCixtM4KDYvismtnVskai4ESAeBrtZMs6Gy8','2022-04-22 11:50:47.781148');
INSERT INTO "django_session" VALUES ('q32boq5eifpacs8tgidgrvz9icqklgcg','.eJxVjDsOwjAQBe_iGln-rT-U9JzB2rUdHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3ZmwE6_G2F6lLaDfMd26zz1ti4z8V3hBx382nN5Xg7376DiqN_agySwKji0oJQhGYrUWnvnfQJvpbFOCghAmZQJOosicApqKl46wuDY-wOb7TZr:1nesO6:cz_I4-seN2MRS0wJcWfAGb_KrEOmdNHAWjK1PfG7uEs','2022-04-28 05:51:26.864451');
INSERT INTO "django_session" VALUES ('f467ujl23htpn63is0ju5j3z8poduhrj','.eJxVjDkOwjAUBe_iGllRbH07lPScwforDqBYylIh7g6RUkD7Zua9XMFtrWVbdC6juLNL7vS7EfJDpx3IHadb89ymdR7J74o_6OKvTfR5Ody_g4pL_dbEZgbGKWAaUgRRtJwJVCHELkgPGI07EtOhV05GmQNkBuZBCIN7fwArbDnS:1njP3F:acp18jTapuc4ZBJDGWoC08JMc58LLoVYdAjwdKJ41mU','2022-05-10 17:32:37.657738');
INSERT INTO "django_session" VALUES ('ke8b3ki4nesrythclqr87k8pb5xso8m2','.eJxVjDsOwjAQBe_iGln-rT-U9JzB2rUdHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3ZmwE6_G2F6lLaDfMd26zz1ti4z8V3hBx382nN5Xg7376DiqN_agySwKji0oJQhGYrUWnvnfQJvpbFOCghAmZQJOosicApqKl46wuDY-wOb7TZr:1nmsvu:ESLRR63THA-JTveU582RFE3UNJ6rMqa_10ANZvkag08','2022-05-20 08:03:26.720116');
INSERT INTO "django_session" VALUES ('6du4a566866ug5ggyj4qf42ookeidb5h','.eJxVjDsOwjAQBe_iGln-rT-U9JzB2rUdHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3ZmwE6_G2F6lLaDfMd26zz1ti4z8V3hBx382nN5Xg7376DiqN_agySwKji0oJQhGYrUWnvnfQJvpbFOCghAmZQJOosicApqKl46wuDY-wOb7TZr:1npxiw:IYFYL9i09lxEGDYxHHRdhUQ7V359PLeKioPQDPLpDD8','2022-05-28 19:46:46.735770');
INSERT INTO "django_session" VALUES ('know0x25q9iu1c7mm3zljvgdv3e3s9s9','.eJxVjDsOwjAQBe_iGllrEhMvJT1nsNb7IQHkSPlUiLtDpBTQvpl5L5dpXfq8zjrlQdzZBXf43QrxQ-sG5E71Nnoe6zINxW-K3-nsr6Po87K7fwc9zf23RrAuQWhOgMwGkDrQQKDQSiwcFFNJZnS0liMmYW06Q4wokUUtte79AdpCOE0:1o26xS:LhaJGEix7oP5b6P59s7I9M-GYQpcaYbCXiAjskWieos','2022-07-01 08:03:58.331574');
INSERT INTO "django_session" VALUES ('bu2lghc53rx4nq0sy4m3gl55394yv589','.eJxVjMsOwiAQRf-FtSG0Mjxcuu83kBkGpGogKe3K-O_apAvd3nPOfYmA21rC1tMSZhYX4cXpdyOMj1R3wHestyZjq-syk9wVedAup8bpeT3cv4OCvXxrpyy7aEf2OaNSMVtD7Gx0mlFRHpKBATyxAas9nAHA-EhqtE4TKWTx_gDyEDfr:1pjBiR:n2aVcGmQK6XYSUAdoP3_23Zx_Jl5L3Y_TSJIjCfUBmg','2023-04-17 04:22:47.143971');
INSERT INTO "estate_propertytype" VALUES (11,'1 BHK','2023-04-18 19:02:50.716401');
INSERT INTO "estate_propertytype" VALUES (12,'2 BHK','2023-04-18 19:02:59.399280');
INSERT INTO "estate_propertytype" VALUES (13,'3 BHK','2023-04-18 19:03:07.420501');
INSERT INTO "estate_state" VALUES (5,'Maharashtra','2023-04-18 10:59:23.231854');
INSERT INTO "estate_city" VALUES (19,'Mulund','2023-04-18 19:01:26.342880',5);
INSERT INTO "estate_city" VALUES (20,'Bhandup','2023-04-18 19:01:37.895365',5);
INSERT INTO "estate_city" VALUES (21,'Thane','2023-04-19 03:09:02.792547',5);
INSERT INTO "estate_usertype" VALUES (5,'Owner','2023-04-03 04:08:31.746137',9);
INSERT INTO "estate_property" VALUES (8,'DAIMOND','good property','buy','Thane','1','1','2','1','450','41','30lakhs','normal','good','44771673','no','yes','no','no','no','no','no','no','no','no','no','no','yes','no','no','no','1.jpg','62.jpg','63.jpg','64.jpg','65.jpg','60.jpg','rajdhani road','400612','ganesh ','2023-04-19 03:44:49.164013',21,11,5);
INSERT INTO "estate_property" VALUES (9,'SHREEDHAR DHAM','good property','buy','Thane','1','1','3','1','400','38','25 LAKHS','normal','good','63080858','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','2.jpg','59.jpg','58.jpg','55.jpg','56.jpg','57.jpg','govind nagar','400612','rajan','2023-04-19 03:48:07.923042',21,11,5);
INSERT INTO "estate_property" VALUES (10,'GANESH','good property','buy','Thane','1','1','3','1','440','39','27 LAKHS','normal','good','30946701','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','3.jpg','66.jpg','65_r5xPpRG.jpg','59_ymuH1qu.jpg','60_IQyl9rT.jpg','64_WOoBTjx.jpg','BIHAR NAGAR','400612','good','2023-04-19 03:51:14.097758',21,11,5);
INSERT INTO "estate_property" VALUES (11,'BLACKHOUSE','good property','Rent','Thane','1','1','2','1','450','42','5000','normal','good','64028282','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','3_LQTJjGx.jpg','56_wJwXRhT.jpg','54.jpg','50.jpg','55_c6F2gtR.jpg','53.jpg','newroad','400612','good','2023-04-19 03:54:02.112254',21,11,5);
INSERT INTO "estate_property" VALUES (12,'royal','good property','Rent','Thane','1','1','2','1','400','35','6000','normal','good','65986540','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','4.jpg','61.jpg','50_1A44A1t.jpg','52.jpg','48.jpg','30.jpg','govind nagar','400612','good','2023-04-19 03:56:16.150861',21,11,5);
INSERT INTO "estate_property" VALUES (13,'Reymond','good property','Rent','Thane','1','1','2','1','500','38','8000','normal','good','99674727','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','5.png','5.jpg','6.jpg','45.jpg','39.jpg','9.jpg','rajdhani road','400612','good','2023-04-19 03:57:58.804818',21,11,5);
INSERT INTO "estate_property" VALUES (14,'green palm','good property','buy','Thane','2','2','2','1','600','47','45 LAKHS','normal','good','25991443','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','yes','7.jpg','52_S3TnPmo.jpg','27.jpg','49.jpg','51.jpg','11.webp','newroad','400612','good','2023-04-19 04:00:24.511477',21,12,5);
INSERT INTO "estate_property" VALUES (15,'lord','good property','buy','Thane','2','2','5','1','650','50','47 LAKHS','normal','good','15886901','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','9_orjUBez.jpg','22.jpg','18.jpg','20.jpg','26.jpg','8.jpg','BIHAR NAGAR','400612','good','2023-04-19 04:02:32.074316',21,12,5);
INSERT INTO "estate_property" VALUES (16,'EMPIRE','good property','buy','Thane','2','2','2','2','600','42','40 lAKHS','normal','good','81811180','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','11_mcPjApA.webp','10.jpg','1_TXT3Qt1.jpg','36.jpg','17.jpg','14.jpg','shindevadi kolhare road THANE','410101','good','2023-04-19 04:06:58.263783',21,12,5);
INSERT INTO "estate_property" VALUES (17,'GOLDEN','good property','Rent','Thane','2','2','4','1','650','43','38 LAKHS','normal','good','59236301','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','11.jpg','37.jpg','39_bTh0b6K.jpg','26_lD1Ukys.jpg','16.jpg','14_jl1j5k2.jpg','RAJENDER NAGAR ','400612','good','2023-04-19 04:10:43.233250',21,12,5);
INSERT INTO "estate_property" VALUES (18,'green palm','GOOD PROPERTY','Rent','Thane','2','2','3','1','650','49','7000','normal','good','50508203','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','11_xIjoqlk.webp','32.jpg','46.jpg','50_tsxgGlz.jpg','44.jpg','27_5vLtuqi.jpg','shindevadi kolhare road THANE','410101','good','2023-04-19 04:13:09.535354',21,12,5);
INSERT INTO "estate_property" VALUES (19,'Reymond','GOOD PROPERTY','Rent','Thane','2','2','2','2','680','50','50 LAKHS','normal','good','18363857','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','12.jpg','23.jpg','26_Q8uh4lq.jpg','52_cXaAYWN.jpg','46_109MJCj.jpg','33.jpg','newroad','400612','good','2023-04-19 04:15:05.860395',21,12,5);
INSERT INTO "estate_property" VALUES (20,'SUN','GOOD PROPERTY','buy','Thane','3','2','3','1','750','55','55 LAKHS','normal','good','47832149','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','14_dlsk6vZ.jpg','7_0kJ5BNq.jpg','3_9OPXi9r.jpg','2_rlGtw77.jpg','6_4ap48hU.jpg','9_01rjXH5.jpg','newroad','400612','good','2023-04-19 04:18:03.076709',21,13,5);
INSERT INTO "estate_property" VALUES (21,'green palm','GOOD PROPERTY','buy','Thane','3','2','3','2','760','53','60 LAKHS','normal','good','77625710','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','15.jpg','1_uMrUpay.jpg','5_Dul8Vyf.jpg','5_d3LhmcS.png','7_a8SWpqM.jpg','1_Supwd5j.jpg','BIHAR NAGAR','400612','good','2023-04-19 04:20:00.737281',21,13,5);
INSERT INTO "estate_property" VALUES (22,'GANESH','GOOD PROPERTY','buy','Thane','3','3','5','2','800','58','65 LAKHS','normal','good','96133338','no','yes','no','yes','no','no','yes','no','no','no','no','no','yes','no','no','yes','16_YMqwMOD.jpg','9_O55ynol.jpg','17_h1PvePr.jpg','50_riCjYTJ.jpg','62_BpuNUMB.jpg','63_E271eN2.jpg','shindevadi kolhare road THANE','410101','good','2023-04-19 04:21:57.636699',21,13,5);
INSERT INTO "estate_property" VALUES (23,'SHREEDHAR DHAM','GOOD PROPERTY','Rent','Thane','3','2','6','1','700','50','52 LAKHS','normal','good','32999006','no','yes','no','no','no','no','no','no','no','yes','no','no','yes','no','no','no','16_RocQ7Oo.jpg','28.jpg','41.jpg','6_L1Du0n0.jpg','2_juLvs6r.jpg','3_0ykNNS9.jpg','RAJENDER NAGAR','400612','good','2023-04-19 04:23:58.834496',21,13,5);
INSERT INTO "estate_property" VALUES (24,'EPICWORLD','GOOD PROPERTY','Rent','Thane','3','3','5','1','650','50','50 LAKHS','normal','good','40127418','no','yes','no','no','no','yes','no','no','no','no','no','no','no','no','no','no','17_icCrj3D.jpg','25.jpg','33_hd1aah7.jpg','54_epqnAMw.jpg','30_oiw3QBG.jpg','47.jpg','RAJENDER NAGAR','400612','good','2023-04-19 04:26:47.287607',21,13,5);
INSERT INTO "estate_property" VALUES (25,'golden','good property','Rent','Thane','3','3','3','1','790','52','10000','normal','good','69282008','no','yes','no','no','no','no','yes','no','no','no','no','no','no','no','no','no','18_BVIC5W9.jpg','51_yUeopGo.jpg','62_q4vOG60.jpg','64_n7mdk0y.jpg','46_OHajfhL.jpg','47_VsZBTKc.jpg','shindevadi kolhare road THANE','410101','good','2023-04-19 04:29:44.062134',21,13,5);
INSERT INTO "estate_property" VALUES (26,'green palm','good property','Rent','Thane','3','2','5','1','800','50','11000','normal','good','76020060','no','yes','no','no','no','yes','yes','no','yes','yes','no','no','yes','no','no','no','19.jpg','34.jpg','4_1gwoGFF.jpg','5_wtg9QVc.jpg','2_Er9TjvD.jpg','7_dX9VYgJ.jpg','govind nagar','400612','good','2023-04-19 04:31:33.536629',21,13,5);
INSERT INTO "estate_property" VALUES (27,'EKVIRA','GOOD PROPERTY','buy','MULUND','1','1','2','1','450','42','25 LAKHS','normal','good','30250543','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','20_jPe0Mk8.jpg','42.jpg','40.jpg','22_0Y88qnp.jpg','43.jpg','52_cvQtr00.jpg','GAIKWAD NAGAR','400601','good','2023-04-19 04:35:45.768526',19,11,5);
INSERT INTO "estate_property" VALUES (28,'JIVDHANI','GOOD PROPERTY','buy','MULUND','1','1','2','1','450','38','29 LAKHS','normal','good','95996474','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','21.jpg','8_PtFIaVv.jpg','4_TiuiQaH.jpg','2_cjOsHCN.jpg','5_GKfUQfN.jpg','7_oQL6oKk.jpg','SREERAM NAGAR','400601','good','2023-04-19 04:38:12.788645',19,11,5);
INSERT INTO "estate_property" VALUES (29,'GREAT EMPIER','GOOD PROPERTY','buy','MULUND','1','1','2','1','440','41','35 LAKHS','normal','good','84042357','no','yes','no','no','no','no','yes','no','no','no','no','no','no','no','no','no','22_Z3aSn8x.jpg','1_m4TIv94.jpg','7_Vjv9jeT.jpg','5_ds44kzv.png','11_UcrDKui.webp','10_N38w7aQ.jpg','NEW HIGHWAY ROAD','400601','good','2023-04-19 04:41:05.267612',19,11,5);
INSERT INTO "estate_property" VALUES (30,'LIONKING','GOOD PROPERTY','Rent','MULUND','1','1','2','1','450','42','8000','normal','good','14241091','no','yes','no','no','no','no','yes','no','yes','yes','no','no','yes','no','no','no','23_Fx16Yhu.jpg','14_BEKrA3o.jpg','3_MgKSVPe.jpg','1_oFF2I1P.jpg','5_TbIAtd5.png','10_UWqdWlq.jpg','newroad','400612','good','2023-04-19 04:43:50.233710',21,11,5);
INSERT INTO "estate_property" VALUES (31,'green palm','GOOD PROPERTY','Rent','MULUND','1','1','2','1','440','45','9000','normal','good','24198563','no','yes','no','no','no','yes','no','no','yes','no','no','no','yes','no','yes','no','24.jpg','62_plx7amf.jpg','43_u4yAs9M.jpg','3_Zdd7c6L.jpg','5_a761NkY.jpg','43_dc3fZUc.jpg','rajdhani road','400612','good','2023-04-19 04:45:35.664712',21,11,5);
INSERT INTO "estate_property" VALUES (32,'green palm','GOOD PROPERTY','Rent','MULUND','1','1','6','1','460','43','9000','normal','good','24266418','no','yes','no','no','no','no','no','no','yes','no','yes','no','no','no','no','no','25_KDEc8gW.jpg','2_Jh86n3v.jpg','5_xPOcnPn.jpg','5_v9r0cbb.png','8_EqgBhz3.jpg','1_avF0Ijk.jpg','govind nagar','400601','good','2023-04-19 04:47:32.045302',21,11,5);
INSERT INTO "estate_property" VALUES (33,'LORDSHIV','GOOD PROPERTY','Rent','MULUND','1','2','7','1','460','44','12000','normal','good','26551632','no','yes','no','no','no','no','no','no','no','yes','no','no','yes','no','no','no','26_6B5jN6W.jpg','3_kE8DHCX.jpg','1_WKSjLOv.jpg','5_ffh9GDq.png','29.jpg','47_59vVUNI.jpg','GAIKWAD NAGAR','400601','good','2023-04-19 04:49:28.765389',19,11,5);
INSERT INTO "estate_property" VALUES (34,'Richa apartment','good view','Rent','MULUND','1','1','6','1','450','42','12000','normal','good','89724181','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','28_2euWB9F.jpg','5_UEupfkN.png','4_mg4XyPF.jpg','2_vyKSfPS.jpg','5_uC28CQa.jpg','8_Ide2H6T.jpg','NEW HIGHWAY ROAD','400601','good','2023-04-19 04:58:02.852163',19,11,5);
INSERT INTO "estate_property" VALUES (35,'SHREERAM','GOOD PROPERTY','buy','MULUND','2','2','2','1','650','50','50 LAKHS','normal','good','95483582','no','yes','no','no','no','no','yes','no','no','yes','no','no','no','no','no','no','29_A9Hq9x8.jpg','11_8WUNtDy.jpg','4_P5z11is.jpg','5_pyZUEpQ.png','9_YKZUXRN.jpg','7_fYUeXtV.jpg','GAIKWAD NAGAR','400601','good','2023-04-19 05:00:21.092815',19,12,5);
INSERT INTO "estate_property" VALUES (36,'green WORLD','GOOD VIEWS','buy','MULUND','2','2','2','1','650','50','50 LAKHS','normal','good','75683835','no','yes','no','no','no','yes','yes','no','no','no','no','no','yes','no','no','no','7_0UZTMrz.jpg','8_12BY2bo.jpg','32_bdxBYg9.jpg','49_INEbX5H.jpg','63_GRC0JK9.jpg','1_hXr2pcO.jpg','LORD NAGAR','400601','good','2023-04-19 05:02:42.616205',19,12,5);
INSERT INTO "estate_property" VALUES (37,'HIGHTOWER','GOOD PROPERTY','Rent','MULUND','2','2','2','1','600','45','12000','normal','good','35344753','no','yes','no','no','no','yes','no','no','no','no','no','no','no','no','no','no','30_QQUWqVk.jpg','66_KxvKPnX.jpg','4_GGXZfpG.jpg','64_30SEGAD.jpg','61_E1SEbND.jpg','63_X8isseV.jpg','rajdhani road','400601','good','2023-04-19 05:04:48.834754',21,12,5);
INSERT INTO "estate_property" VALUES (38,'green WORLD','GOOD PROPERTY','Rent','MULUND','2','2','5','1','650','50','11000','normal','good','14796766','no','yes','no','no','no','no','no','no','no','no','no','no','yes','no','no','no','31.jpg','18_3uGtaRU.jpg','10_haT1gnm.jpg','11_85q2UFU.jpg','7_GsDiLyP.jpg','5_4znmjK3.png','OLDHIGHWAY','400601','good','2023-04-19 05:07:14.538040',19,12,5);
INSERT INTO "estate_property" VALUES (39,'GOLDTOWER','GOOD PROPERTY','Rent','MULUND','2','2','2','1','660','47','11000','normal','good','63960347','no','yes','no','no','no','yes','no','no','no','no','no','no','no','no','no','no','33_sWhQ1lr.jpg','1_i5S5usi.jpg','2_8s4P2lV.jpg','3_lff43hx.jpg','4_XQ46GPF.jpg','5_gH8MmEu.jpg','NEW HIGHWAY ROAD','400601','good','2023-04-19 05:10:08.836942',19,12,5);
INSERT INTO "estate_property" VALUES (40,'REYMOND WORLD','GOOD PROPERTY','buy','MULUND','3','3','5','1','700','51','60 LAKHS','normal','good','76813329','no','yes','no','no','no','yes','no','no','no','no','no','no','no','no','no','no','34_Ocb6Btr.jpg','7_UuBe8Y7.jpg','6_AbLykxB.jpg','5_E3E5fTI.png','5_KpwggRB.jpg','8_DYlZ05Y.jpg','govind nagar','400601','good','2023-04-19 05:12:28.753915',19,13,5);
INSERT INTO "estate_property" VALUES (41,'GREEN EMPIER','GOOD PROPERTY','buy','MULUND','3','2','3','1','750','53','62 LAKHS','normal','good','62125128','no','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','34_aoi3BQL.jpg','27_z5OFNyy.jpg','23_8lm0oGf.jpg','24_ugRkzjo.jpg','23_Az3GBCl.jpg','14_s5FejyR.jpg','newroad','400612','good','2023-04-19 05:15:42.777895',21,13,5);
INSERT INTO "estate_property" VALUES (42,'Raj homes','good','buy','MULUND','3','3','22','1','800','800','60 lakh','normal','good','56457126','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','34_6iGZUAS.jpg','16_QXGDrup.jpg','6_Qj5TD5i.jpg','5_7TEZxm1.png','32_nHBoxMx.jpg','25_KKOMmpK.jpg','govind nagar','400612','good','2023-04-19 05:17:19.024857',21,13,5);
INSERT INTO "estate_property" VALUES (43,'Vilas building','nice','Rent','MULUND','3','3','5','1','800','799','12000','normal','good','56475868','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','35.jpg','36_Y7YA80T.jpg','17_EV0JFYb.jpg','20_zl0jMzF.jpg','26_iycd9Yy.jpg','37_qtJwhb2.jpg','shindevadi kolhare road neral','410101','good','2023-04-19 05:18:30.360694',19,13,5);
INSERT INTO "estate_property" VALUES (44,'beyond apartment','nice','Rent','MULUND','3','3','22','2','800','42','11000','1313','1231','47861275','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','36_oohoV9F.jpg','7_q6E0kCF.jpg','8_WcA3n56.jpg','6_U9pUB6l.jpg','6_Td11qUJ.jpg','8_c2fnlgL.jpg','GAIKWAD NAGAR','400601','good','2023-04-19 05:19:57.521440',19,13,5);
INSERT INTO "estate_property" VALUES (45,'Mukund villa','nice','Rent','MULUND','3','3','6','2','900','900','8000','1321','31212','64375278','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','36_6wY1ClJ.jpg','20_xcLl4U8.jpg','11_ihznmLL.webp','6_Og8hOPZ.jpg','31_lx40Fz8.jpg','47_6JTlPdc.jpg','BIHAR NAGAR','400612','good','2023-04-19 05:21:03.031279',19,13,5);
INSERT INTO "estate_property" VALUES (46,'Ekvira building','Well furnished','buy','Bhandup','1','1','6','1','440','440','40 lakh','1313','1231','46353243','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','37_DNC0sqF.jpg','31_hCYkdVe.jpg','41_iP5RCp8.jpg','50_wcT3Tj1.jpg','41_GkHs493.jpg','61_LmuVpyZ.jpg','rajdhani road','400612','good','2023-04-19 05:22:40.562144',20,11,5);
INSERT INTO "estate_property" VALUES (47,'Gavdevi','good','buy','Bhandup','1','1','22','1','450','450','50 LAKHS','1313','31212','19217327','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','37_06fsDiB.jpg','37_UNS6cXO.jpg','30_PjzePF7.jpg','35_zL4ktpP.jpg','26_hoKCLg7.jpg','31_bBPnEpY.jpg','RAJENDER NAGAR','400612','good','2023-04-19 05:23:50.775575',20,11,5);
INSERT INTO "estate_property" VALUES (48,'Shivam plaza','good','buy','Bhandup','1','1','34','1','400','400','90 lakhs','1313','31212','95343167','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','38.jpg','7_uxNstKg.jpg','8_cHdmP6B.jpg','11_nORrf2v.jpg','7_6OkNMf0.jpg','37_g8N6WDd.jpg','NEW HIGHWAY ROAD','400601','good','2023-04-19 05:25:47.262971',20,11,5);
INSERT INTO "estate_property" VALUES (49,'Vilas villa','Goood','Rent','Bhandup','1','1','45','1','400','400','30 K','1321','235','85828312','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','39_NSzQfqN.jpg','6_rZeYip3.jpg','31_iUeJItC.jpg','46_t7kvw5r.jpg','41_taX4Rqn.jpg','52_GDqokW7.jpg','GAIKWAD NAGAR','400601','nice ','2023-04-19 05:27:35.129735',20,11,5);
INSERT INTO "estate_property" VALUES (50,'Gajanan dham','Well maintained','Rent','Bhandup','1','1','70','1','400','400','30 K','1313','123','32856713','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','40_ldn89Jy.jpg','20_TY85Og0.jpg','17_VlRNiuT.jpg','20_nLtyfJY.jpg','21_taIDVci.jpg','26_qbnTTce.jpg','shindevadi kolhare road THANE','410101','good','2023-04-19 05:29:24.081829',20,11,5);
INSERT INTO "estate_property" VALUES (51,'Neice Complex','well maintend','Rent','Bhandup','1','1','22','1','400','400','8000 K','1321','235','46229463','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','41_oj6oAc8.jpg','66_cU1FM2E.jpg','41_bsaNFdi.jpg','21_iVUxDN1.jpg','7_zpzOSZI.jpg','28_Zt0D9ym.jpg','rajdhani road','400612','nice ','2023-04-19 05:30:37.721784',20,11,5);
INSERT INTO "estate_property" VALUES (52,'VIlas apartment','good','buy','Bhandup','2','2','60','2','650','650','90 lakhs','1321','235','76867877','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','42_eEbAtEU.jpg','36_EcxExcq.jpg','37_SFIyQm3.jpg','36_oTfp267.jpg','36_WrTQsVq.jpg','57_OcURC86.jpg','GAIKWAD NAGAR','400601','nice ','2023-04-19 05:33:15.568561',20,12,5);
INSERT INTO "estate_property" VALUES (53,'Mulund plaza','nice','buy','MULUND','3','3','6','1','800','800','60 LAKHS','423','234','30901697','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','3_Gohd0jn.jpg','6_h2XXhGl.jpg','22_k8LLekq.jpg','2_6DPzWMK.jpg','16_dIEa6BW.jpg','8_ejA8VCR.jpg','NEW HIGHWAY ROAD','400601','good','2023-04-19 05:35:58.599489',19,13,5);
INSERT INTO "estate_property" VALUES (54,'VIlas dham','good','buy','Bhandup','2','2','6','1','650','400','50 LAKHS','1313','31212','27823049','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','44_GXPjhZ1.jpg','26_mHG25DX.jpg','21_FAZNtjd.jpg','16_UbryxOl.jpg','12_hOcfG6Q.jpg','8_qJtKAxU.jpg','shindevadi kolhare road THANE','410101','nice ','2023-04-19 05:38:29.937037',20,12,5);
INSERT INTO "estate_property" VALUES (55,'Welly plaza','good','buy','Bhandup','2','2','2','1','650','650','1 crore','1313','2343','11205082','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','46_HW4ry1w.jpg','46_u4I0XqV.jpg','22_pHyB6NB.jpg','6_in3Dcx3.jpg','8_9P55W3k.jpg','3_t0eeWOb.jpg','GAIKWAD NAGAR','400601','good','2023-04-19 05:39:40.122138',20,12,5);
INSERT INTO "estate_property" VALUES (56,'Bhandup apartment','good','Rent','Bhandup','2','2','6','2','700','700','1.2 crore','32','342','90086908','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','48_Asv5oBR.jpg','29_mBDtUYg.jpg','7_CFc93ld.jpg','11_FnQFYHM.jpg','7_QoEp0Pc.jpg','9_DO5E45I.jpg','Ram gadkari road','40078','nice ','2023-04-19 05:41:38.913002',20,12,5);
INSERT INTO "estate_property" VALUES (57,'Richa villas','good','buy','Bhandup','3','3','22','1','900','900','3 crore','322','123','58443204','no','no','no','no','no','yes','no','no','yes','no','no','no','no','yes','no','no','49_NrW1uxs.jpg','7_IY98nuU.jpg','20_2hDxso2.jpg','24_Abh9FtS.jpg','31_0Jw8jgS.jpg','27_ptueh1D.jpg','Riddhi road near richa apartments','40078','nice ','2023-04-19 05:43:22.738195',20,13,5);
INSERT INTO "estate_property" VALUES (58,'Reymond house','good','buy','Bhandup','3','3','5','1','1000','1000','3 crore','32','213','72034056','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','54_LEeUy6E.jpg','7_OoGlcjw.jpg','8_d0xE0Nw.jpg','7_EKXtw0L.jpg','8_wH3NJT0.jpg','8_uoMQZ4u.jpg','NEW HIGHWAY ROAD','400601','good','2023-04-19 05:44:52.306639',20,13,5);
INSERT INTO "estate_property" VALUES (59,'Viraj homes','good','Rent','Bhandup','3','3','34','1','1200','1200','60000 ','21','13','30055201','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','61_a0KxPvs.jpg','8_JWgdTJV.jpg','8_W0oz558.jpg','7_zZkBhQq.jpg','8_d3dlQg0.jpg','8_kbXusue.jpg','newroad','400612','good','2023-04-19 05:46:18.456914',20,13,5);
INSERT INTO "estate_property" VALUES (60,'Malbar hills','Well furnished','Rent','Bhandup','3','3','46','1','850','850','6 crore','213','311','40273613','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','56_1in4MRD.jpg','22_fJE1BNd.jpg','8_S4Jbhjb.jpg','56_86zSwNM.jpg','47_myqth9i.jpg','31_EsNtMK3.jpg','NEW HIGHWAY ROAD','400601','good','2023-04-19 05:47:41.472587',20,13,5);
INSERT INTO "estate_property" VALUES (61,'MULUND HOMES ','Well developed','buy','MULUND','1','1','6','1','578','567','25 lk','23','323','69253146','no','yes','no','no','no','yes','no','no','no','no','no','no','no','no','no','no','66_AuO57oV.jpg','7_Bt986PS.jpg','8_5NHbyJZ.jpg','7_HgQr7mv.jpg','8_6nielKb.jpg','9_KgjFhGV.jpg','NEW HIGHWAY ROAD','400601','nice ','2023-04-19 07:37:31.125122',19,11,5);
INSERT INTO "estate_property" VALUES (62,'DMCE','Good property','buy','Mulund','1','1','7','1','680','580','40 lakh12','12','14','76653291','yes','yes','no','no','no','no','no','no','no','no','no','no','no','no','no','no','1_kVJ7Kqy.jpg','7_VhDnKdJ.jpg','9_tX0Y1MH.jpg','7_LZtHBk8.jpg','8_6LZM8X2.jpg','17_rOIa8I1.jpg','GAIKWAD NAGAR','400601','dmce','2023-04-19 10:53:00.419389',19,11,5);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "estate_city_state_id_7d6bfa53" ON "estate_city" (
	"state_id"
);
CREATE INDEX IF NOT EXISTS "estate_usertype_user_id_0354e29b" ON "estate_usertype" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "estate_property_city_id_5d252790" ON "estate_property" (
	"city_id"
);
CREATE INDEX IF NOT EXISTS "estate_property_type_id_6d67f81b" ON "estate_property" (
	"type_id"
);
CREATE INDEX IF NOT EXISTS "estate_property_user_id_bc655569" ON "estate_property" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "estate_enquiry_property_id_373d713d" ON "estate_enquiry" (
	"property_id"
);
CREATE INDEX IF NOT EXISTS "estate_feedback_property_id_7e05b7dd" ON "estate_feedback" (
	"property_id"
);
CREATE INDEX IF NOT EXISTS "estate_feedback_user_id_2783705e" ON "estate_feedback" (
	"user_id"
);
COMMIT;
