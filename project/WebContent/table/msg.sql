create table msg
(
	id varchar2(20) references account(id),
	msgNum number(10), 
	msgTitle varchar2(40),
	msgcontent vatchar2(100),
	msgdate date
);

CREATE SEQUENCE msg_SEQ;