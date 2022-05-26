declare
n emp.name%type;
begin
select name into n from emp where sal=300000 or sal =200000;
dbms_output.put_line('Name is ' || n);
exception
when TOO_MANY_ROWS then
dbms_output.put_line('too many rows');
when NO_dATA_FOUND then
dbms_output.put_line('no data found');
end;



create table emp(eno number(4) , name char(30) , job char(20) , sal number(8));
insert into emp values('1','ram','prof',300000)
insert into emp values('2','sham','assoc prof',200000)

declare
begin
delete from emp where sal=70000;
if sql%rowcount = 0 then 
dbms_output.put_line('record could not be deleted');
else 
dbms_output.put_line('record deleted');
end if;
end;



create table emp(eno number(4) , name char(30) , job char(20) , sal number(8));
insert into emp values('1','ram','prof',300000)
insert into emp values('2','sham','assoc prof',200000)

declare
res number;
begin
delete from emp where sal=200000;
if sql%rowcount = 0 then 
dbms_output.put_line('record could not be deleted');
else 
res := sql%rowcount;
dbms_output.put_line(res || ' record deleted');
end if;
end;



create table emp(empno number(3) primary key,ename char(30),job char(20),sal number(5),deptno number(2));
insert into emp values(1,'ram','prof',90000,10);
insert into emp values(2,'sham','assoc prof',70000,20);
insert into emp values(3,'raj','prof',95000,10);


declare
cursor c1 is select empno,ename,job from emp;
rec c1%rowtype;
begin
open c1;
loop
fetch c1 into rec;
dbms_output.put_line(rec.empno);
dbms_output.put_line(rec.ename);
dbms_output.put_line(rec.job);
end loop;
close c1;
end;




declare
cursor c1 is select empno,ename,job from emp where deptno=10;
rec c1%rowtype;
begin
open c1;
loop
fetch c1 into rec;
exit when c1%NOTFOUND;
dbms_output.put_line(rec.empno);
dbms_output.put_line(rec.ename);
dbms_output.put_line(rec.job);
end loop;
close c1;
end;


declare
cursor c1 is select * from emp order by sal desc fetch first 2 rows only;
rec c1%rowtype;
begin
open c1;
loop
fetch c1 into rec;
exit when c1%NOTFOUND;
dbms_output.put_line(rec.empno);
dbms_output.put_line(rec.ename);
dbms_output.put_line(rec.job);
dbms_output.put_line(rec.sal);
end loop;
close c1;
end;




declare
cursor c1(n number) is select * from emp fetch first n rows only;
rec c1%rowtype;
total number := 0;
begin
open c1(2);
loop 
fetch c1 into rec;
exit when c1%NOTFOUND;
total := total + rec.sal;
end loop;
close c1;
dbms_output.put_line(total);
end;