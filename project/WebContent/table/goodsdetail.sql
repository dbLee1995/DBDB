create table goodsdetail
(
	GDlistNum number(10) references goods(GdlistNum),
	GDNum number(10) primary key,
	GDname varchar2(50),
	GDprice number(10),
	GDstock number(5),
	GDdetail varchar2(50),
	GDsumary varchar2(50)
);
alter table goodsdetail add(gdsumary varchar2(50));
--1
insert into Goodsdetail values(1,1,'닭가슴살 스테이크 오리지널',13900,1000,'1.jpg','sm_steak.jpg');
insert into Goodsdetail values(1,2,'닭가슴살 스테이크 갈릭',14500,1000,'2.jpg','sm_steak.jpg');
insert into Goodsdetail values(1,3,'닭가슴살 스테이크 고추',14500,1000,'3.jpg','sm_steak.jpg');
insert into Goodsdetail values(1,4,'닭가슴살 스테이크 호박',14500,1000,'4.jpg','sm_steak.jpg');
insert into Goodsdetail values(1,5,'닭가슴살 스테이크 야채',14500,1000,'5.jpg','sm_steak.jpg');
insert into Goodsdetail values(1,6,'닭가슴살 스테이크 혼합',14500,1000,'6.jpg','sm_steak.jpg');
insert into Goodsdetail values(1,7,'닭가슴살 스테이크 어니언',14500,1000,'1.jpg','sm_steak.jpg');
insert into Goodsdetail values(1,8,'닭가슴살 스테이크 치즈',14500,1000,'2.jpg','sm_steak.jpg');
insert into Goodsdetail values(1,9,'닭가슴살 스테이크 카레',14500,1000,'3.jpg','sm_steak.jpg');
insert into Goodsdetail values(1,10,'닭가슴살 스테이크 칠리',14500,1000,'4.jpg','sm_steak.jpg');
--2
insert into goodsdetail VALUES (2,11,'소프트마늘 야채 닭가슴살 도시락',22200,100,'11.jpg','sm_lunchbox.jpg');
insert into goodsdetail VALUES (2,12,'소프트마늘 감자 닭가슴살 도시락',22200,95,'12.jpg','sm_lunchbox.jpg');
insert into goodsdetail VALUES (2,13,'닭가슴살볼 야채 도시락',22200,100,'13.jpg','sm_lunchbox.jpg');
insert into goodsdetail VALUES (2,14,'닭가슴살볼 감자 도시락',22200,120,'14.jpg','sm_lunchbox.jpg');
insert into goodsdetail VALUES (2,15,'야채현미밥 비프스테이크 도시락',27500,130,'15.jpg','sm_lunchbox.jpg');
insert into goodsdetail VALUES (2,16,'라따뚜이 덮밥 도시락',22500,80,'16.jpg','sm_lunchbox.jpg');
insert into goodsdetail VALUES (2,17,'버섯소불고기 덮밥 도시락',25000,85,'17.jpg','sm_lunchbox.jpg');
insert into goodsdetail VALUES (2,18,'랍스터볶음밥 참치오믈렛 도시락',19500,100,'18.jpg','sm_lunchbox.jpg');
insert into goodsdetail VALUES (2,19,'부지깽이밥 닭가슴살 볼 도시락',22700,80,'19.jpg','sm_lunchbox.jpg');
insert into goodsdetail VALUES (2,20,'참치오믈렛 곤드레나물밥 도시락',19500,90,'20.jpg','sm_lunchbox.jpg');
--3
insert into goodsdetail values(3, 21, '붉닭볶음밥', 20500, 100, 'spicyrice.jpg','sm_friedrice.jpg');
insert into goodsdetail values(3, 22, '버섯볶음밥', 21500, 100, 'mushroomrice.jpg','sm_friedrice.jpg');
insert into goodsdetail values(3, 23, '카레볶음밥', 22000, 100, 'curryrice.jpg','sm_friedrice.jpg');
insert into goodsdetail values(3, 24, '새우볶음밥', 20000, 100, 'shrimprice.jpg','sm_friedrice.jpg');
insert into goodsdetail values(3, 25, '해물볶음밥', 21000, 100, 'seafoodrice.jpg','sm_friedrice.jpg');
insert into goodsdetail values(3, 26, '믹스볶음밥', 22000, 100, 'mixrice.jpg','sm_friedrice.jpg');
insert into goodsdetail values(3, 27, '갈릭볶음밥', 20900, 100, 'spicyrice.jpg','sm_friedrice.jpg');
insert into goodsdetail values(3, 28, '간장볶음밥', 21900, 100, 'mushroomrice.jpg','sm_friedrice.jpg');
insert into goodsdetail values(3, 29, '계란볶음밥', 22900, 100, 'curryrice.jpg','sm_friedrice.jpg');
insert into goodsdetail values(3, 30, '치킨볶음밥', 23900, 100, 'shrimprice.jpg','sm_friedrice.jpg');
--4
insert into Goodsdetail values(4,31,'훈제 닭가슴살',9900,1000,'40.jpg','sm_chickenbreast.jpg');
insert into Goodsdetail values(4,32,'마늘 훈제 닭가슴살',10300,1000,'41.jpg','sm_chickenbreast.jpg');
insert into Goodsdetail values(4,33,'칠리 훈제 닭가슴살',10300,1000,'42.jpg','sm_chickenbreast.jpg');
insert into Goodsdetail values(4,34,'갈릭 훈제 닭가슴살',10300,1000,'43.jpg','sm_chickenbreast.jpg');
insert into Goodsdetail values(4,35,'냉장 생 닭가슴살',7500,1000,'44.jpg','sm_chickenbreast.jpg');
insert into Goodsdetail values(4,36,'카레훈제 닭가슴살',10300,1000,'40.jpg','sm_chickenbreast.jpg');
insert into Goodsdetail values(4,37,'아몬드 훈제 닭가슴살',10300,1000,'41.jpg','sm_chickenbreast.jpg');
insert into Goodsdetail values(4,38,'토마토훈제 닭가슴살',10300,1000,'42.jpg','sm_chickenbreast.jpg');
insert into Goodsdetail values(4,39,'바질 훈제 닭가슴살',10300,1000,'43.jpg','sm_chickenbreast.jpg');
insert into Goodsdetail values(4,40,'염분 무첨가 훈제 닭가슴살',10200,1000,'43.jpg','sm_chickenbreast.jpg');
--5
insert into goodsdetail VALUES (5,41,'닭가슴살 소시지 훈제',16500,100,'51.jpg','sm_sausage.jpg');
insert into goodsdetail VALUES (5,42,'닭가슴살 소시지 할라피뇨',16500,95,'52.jpg','sm_sausage.jpg');
insert into goodsdetail VALUES (5,43,'닭가슴살 소시지 견과',16500,100,'53.jpg','sm_sausage.jpg');
insert into goodsdetail VALUES (5,44,'닭가슴살 소시지 현미',16500,120,'54.jpg','sm_sausage.jpg');
insert into goodsdetail VALUES (5,45,'닭가슴살 소시지 마늘',19500,130,'55.jpg','sm_sausage.jpg');
insert into goodsdetail VALUES (5,46,'닭가슴살 소시지 카레',19500,80,'56.jpg','sm_sausage.jpg');
insert into goodsdetail VALUES (5,47,'닭가슴살 소시지 매콤치즈',19500,85,'57.jpg','sm_sausage.jpg');
insert into goodsdetail VALUES (5,48,'닭가슴살 소시지 옥수수',15500,100,'58.jpg','sm_sausage.jpg');
insert into goodsdetail VALUES (5,49,'닭가슴살 소시지 새우',14000,80,'59.jpg','sm_sausage.jpg');
insert into goodsdetail VALUES (5,50,'닭가슴살 소시지 불고기',23400,90,'60.jpg','sm_sausage.jpg');
--6
insert into goodsdetail values(6, 51, '야채피자', 9900, 100, 'pizza.jpg','sm_pizza.jpg');
insert into goodsdetail values(6, 52, '치킨피자', 10900, 150, 'pizza.jpg','sm_pizza.jpg');
insert into goodsdetail values(6, 53, '페페로니피자', 10900, 200, 'pizza.jpg','sm_pizza.jpg');
insert into goodsdetail values(6, 54, '마르게리타', 11900, 100, 'pizza.jpg','sm_pizza.jpg');
insert into goodsdetail values(6, 55, '하와이안피자', 11900, 100, 'pizza.jpg','sm_pizza.jpg');
insert into goodsdetail values(6, 56, '파인애플피자', 11900, 150, 'pizza.jpg','sm_pizza.jpg');
insert into goodsdetail values(6, 57, '핫치킨피자', 12900, 200, 'pizza.jpg','sm_pizza.jpg');
insert into goodsdetail values(6, 58, '루꼴라피자', 12900, 150, 'pizza.jpg','sm_pizza.jpg');
insert into goodsdetail values(6, 59, '시금치피자', 12900, 50, 'pizza.jpg','sm_pizza.jpg');
insert into goodsdetail values(6, 60, '고르곤졸라피자', 11900, 100, 'pizza.jpg','sm_pizza.jpg');