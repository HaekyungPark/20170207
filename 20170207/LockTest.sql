insert INTO BOOK VALUES(1,'토지2', sysdate, '대여중', 1);

update BOOK SET title = '토지1' WHERE no = 1;

commit;

select * from book;