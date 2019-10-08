create table shoppinglist
(
	GDNum number(10),
	id varchar2(20),
	OrderNum number(10),
	GDcount number(5),
	regdate date,
	name varchar2(20),
	phone varchar2(20),
	addr varchar2(20),
	msg varchar2(40),
	buyway varchar2(20),
	state number(5),
	constraint fk_shoppinglist_GDNum foreign key(GDNum) references goodsdetail,
	constraint fk_shoopinglist_id foreign key(id) references account
);