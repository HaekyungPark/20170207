
--data dictionary
select * from dictionary;

SELECT * FROM user_objects;

--table 조회
select * FROM user_objects where object_type='TABLE';

--제약조건 확인
select * from user_constraints WHERE table_name ='BOOK';

--현재 접속한 계정 정보
select * FROM user_users;--constraints

drop table book;

--create table
CREATE TABLE book
(
   no         NUMBER (10) ,
   title      VARCHAR2 (100) not null,
   author     VARCHAR2 (10),
   pub_date   DATE,

	constraint c_book_u unique(no) --unique contraint
);

--insert
--error :  not null constraint (title)
insert 
	into book( author, PUB_DATE)
values (  '박경리', to_date('2007-05-03','yyyy-mm-dd'));

insert 
	into book(title, author, PUB_DATE)
values ( '토지', '박경리', to_date('2007-05-03','yyyy-mm-dd'));

--unique 칼럼은 null이 insert될 수 없다.
insert 
	into book(no, title, author, PUB_DATE)
values ( 1,'토지', '박경리', to_date('2007-05-03','yyyy-mm-dd'));

--drop table

drop table book;

--create table
CREATE TABLE book
(
   no         NUMBER (10) ,
   title      VARCHAR2 (100) not null,
   author     VARCHAR2 (10),
   pub_date   DATE,

	--constraint c_book_u unique(no) --unique contraint
	primary key(no)
);

--error : promary key는 null이 될 수 없음
insert 
	into book(title, author, PUB_DATE)
values ( '토지', '박경리', to_date('2007-05-03','yyyy-mm-dd'));

insert 
	into book(NO,title, author, PUB_DATE)
values ( 1,'토지', '박경리', to_date('2007-05-03','yyyy-mm-dd'));

--error :primary Key constriant
insert 
	into book(no, title, author, PUB_DATE)
values ( 1,'토지', '박경리', to_date('2007-05-03','yyyy-mm-dd'));
--select
-----------------------------------------------------------------
--drop table

drop table book;

--create table
CREATE TABLE book
(
   no         NUMBER (10) ,
   title      VARCHAR2 (100) not null,
   author     VARCHAR2 (10),
   pub_date   DATE,
   state 	  VARCHAR2(20),

	--constraint c_book_u unique(no) --unique contraint
	primary key(no),                  --primary key constraint
	constraint c_book_check check(state in('대여중','대여가능'))
);
--error : check constraint (state)
insert 
	into book
values ( 1,'토지', '박경리', to_date('2007-05-03','yyyy-mm-dd'),'대여');

insert 
	into book
values ( 3,'토지1', '박경리1', to_date('2007-05-03','yyyy-mm-dd'),'대여중');

insert 
	into book
values ( 2,'토지2', '박경리2', to_date('2007-05-03','yyyy-mm-dd'),'대여가능');

select*from book;

-----------------------------------------------------------------------
--author table 생성
create table author(
	no NUMBER(10),
	name varchar2(50) not null,
	description varchar2(2000),
	primary key(no)
	);

insert into author values(1,'박경리','어쩌구저쩌구');

select * from author;
--drop table

drop table book;

--create table
CREATE TABLE book
(
   no         NUMBER (10) ,
   title      VARCHAR2 (100) not null,
   --author     VARCHAR2 (10),
   pub_date   DATE,
   state 	  VARCHAR2(20),
   author_no  number(10) ,

	--constraint c_book_u unique(no) --unique contraint
	primary key(no),                 --primary key constraint
	constraint c_book_check check(state in('대여중','대여가능')),
	constraint c_book_fk             --foreign key constraint
	foreign key(author_no) 
	references author(no)
	--on delete CASCADE 
	on delete set null
);
insert 
	into book
values ( 1,
		'토지', 
		--'박경리', 
		to_date('2007-05-03','yyyy-mm-dd'),
		'대여중',
		1
		);
delete from AUTHOR WHERE NO=1;
select * from author;
select * from book;
--error :  foreign key constraint, --not null constraint (author_no)
insert 
	into book
values ( 1,
		'토지', 
		--'박경리', 
		to_date('2007-05-03','yyyy-mm-dd'),
		'대여중',
		2 --null
		);
		
--test
insert 
	into book
values ( 1,
		'토지', 
		--'박경리', 
		to_date('2007-05-03','yyyy-mm-dd'),
		'대여중',
		1
		);

--error: foreign key constraint book(author_no)
delete from AUTHOR WHERE NO =1;

select a.TITLE, 
	   to_char(a.pub_date,'yyyy/mm/dd') , 
	   a.state, 
	   b.NAME, 
	   b.DESCRIPTION
	from book a, author b
   where a.AUTHOR_NO=b.NO;
   