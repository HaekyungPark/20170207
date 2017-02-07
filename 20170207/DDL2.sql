--author table 생성
create table author(
	no NUMBER(10),
	name varchar2(50) not null,
	description varchar2(2000),
	primary key(no)
	);

insert into author values(1,'박경리','어쩌구저쩌구');

--<<<<<<<constraint 추가하는 방법2(alter table)>>>>>>

drop table book cascade constraint;

--create table
CREATE TABLE book
(
   no         NUMBER (10) ,
   title      VARCHAR2 (100) not null,
   author     VARCHAR2 (10),
   pub_date   DATE,
   state      VARCHAR2(20),
   author_no  number(10)
);

alter TABLE book add constraint c_book_pk primary key(no);
alter table book add constraint c_book_check check (state in('대여중', '대여가능'));
alter table book add constraint c_book_fk foreign key(author_no) references author(no);


--제약 조건 삭제
alter table book drop constraint c_book_check;
alter table author drop primary key cascade;
