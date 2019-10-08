create table cart
(
	GDNum number(10) references goodsdetail(GDNum),
	regdate date
);