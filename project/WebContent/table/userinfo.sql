create table userinfo
(
	id varchar2(20) references account(id),
	fname varchar2(20),
	lname varchar2(20),
	addr varchar2(100)
);