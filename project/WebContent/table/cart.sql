create table cart
(
	cnum number(10) primary key,
	GDNum number(10) references goodsdetail(GDNum),
	count number(10),
	regdate date
);