create table company
(
	CPNum number(5) primary key,
	CPName varchar2(20),
	phone number(20)
);
CREATE SEQUENCE company_SEQ;

insert into company values(1, '맛있닭', 07089845571);
insert into company values(2, '푸드원', 07049911458);