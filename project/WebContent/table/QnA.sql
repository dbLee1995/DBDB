create table QnA
(	
	qnum number(5) primary key,
	id varchar2(20) references account(id),
	category varchar2(20),
	title varchar2(20),
	content varchar2(200),
	regdate date,
	answer varchar2(200),
	answerdate date,
	answerstate number(5)
);

--qnum(기본키 추가)