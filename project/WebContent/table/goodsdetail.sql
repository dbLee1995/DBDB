create table goodsdetail
(
	GDlistNum number(10) references goods(GdlistNum),
	GDNum number(10) primary key,
	GDname varchar2(20),
	GDprice number(10),
	GDstock number(5),
	GDdetail varchar2(20)
);
CREATE SEQUENCE goodsdetail_SEQ;