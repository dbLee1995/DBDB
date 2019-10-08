create table goods
(
	CPNum number(5) references company(CPNum),
	GDlistNum number(10) primary key,
	GDlist varchar2(20)
);

CREATE SEQUENCE goods_SEQ;