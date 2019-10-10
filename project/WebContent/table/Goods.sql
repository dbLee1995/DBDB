create table goods
(
	CPNum number(5) references company(CPNum),
	GDlistNum number(10) primary key,
	GDlist varchar2(20)
);
CREATE SEQUENCE goods_SEQ;

insert into goods values(1, 1, '닭가슴살');
insert into goods values(1, 2, '도시락');
insert into goods values(1, 3, '볶음밥');
insert into goods values(2, 4, '닭가슴살');
insert into goods values(2, 5, '도시락');
insert into goods values(2, 6, '피자');
