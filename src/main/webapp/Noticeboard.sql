drop table notice;

create table notice(
	notice_no number(5) not null primary key,
	title varchar2(200) not null,
	name varchar2(100) not null,
	content varchar2(2000) not null
	created_date date default sysdate
);

insert into notice values
(1, '게시글1', '사용자', '게시글 내용1');
insert into notice values
(2, '게시글2', '사용자', '게시글 내용2');
insert into notice values
(3, '게시글3', '사용자', '게시글 내용3');

