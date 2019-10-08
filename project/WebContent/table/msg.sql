create table msg
(
	id varchar2(20) references account(id),
	msgNum number(10) primary key, 
	msgTitle varchar2(40),
	msgcontent varchar2(100),
	msgdate date
);

CREATE SEQUENCE msg_SEQ;