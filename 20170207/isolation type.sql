--isolation type

select*from book;

commit;

set transaction ISOLATION LEVEL SERIALIZABLE;

update book set title='토지4' where no =3;
commit;