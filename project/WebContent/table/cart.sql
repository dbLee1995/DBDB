create table cart
(
	cnum number(10) primary key,
	GDNum number(10) references goodsdetail(GDNum),
	regdate date
);