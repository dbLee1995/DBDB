create table notice
(
	ntNum number(10) primary key,
	ntTitle varchar2(40),
	ntContent varchar2(100),
	ntDate date
);

CREATE SEQUENCE notice_SEQ;