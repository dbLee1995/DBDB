create table review
(
	GDNum number(10),
	id varchar2(20),
	title varchar2(20),
	content varchar2(20),
	regdate date,
	score number(5),
	constraint fk_review_GDNum foreign key(GDNum) references goodsdetail,
	constraint fk_review_id foreign key(id) references account
);