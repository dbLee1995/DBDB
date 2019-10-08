create table QnA
(
	id varchar2(20) references account(id),
	category varchar2(20),
	title varchar2(20),
	content varchar2(100),
	regdate date,
	answer varchar2(100),
	answerdate date,
	answerstate number(5)
);