declare
first_num number;
second_num number;
add number;
sub number;
mul number;
div number;

procedure arthmetic (A in number , B in number , C out number , D out number , E out number , F out number) is
begin
C := A + B;
D := A - B;
E := A * B;
F := A / B;
end;

begin 
first_num := 6;
second_num := 3;
arthmetic(first_num,second_num,add,sub,mul,div);
dbms_output.put_line('Addition is ' || add);
dbms_output.put_line('Subtraction is ' || sub);
dbms_output.put_line('Multiplication is ' || mul);
dbms_output.put_line('Division is ' || div);
end;



create table emp(eno number(3) primary key,ename char(30),job char(20),commission number(10),sal number(5),deptno number(2));
insert into emp values(1,'Raj','Prof',1200,96000,10);
insert into emp values(2,'Amar','Assoc Prof',1300,80000,20);
insert into emp values(3,'Rahat','Prof',3494,90000,10);

declare
    procedure raise_salary(eid in number , bonus in number) is
        salary number;
        begin
        select sal into salary from emp where eno = eid;
        update emp set sal = salary + bonus where eno = eid;
        end;
begin
raise_salary(2,1234);
end;
select * from emp



create or replace procedure fire_employee(eid in number) is
begin
delete from emp where eno = eid;
end;

begin
fire_employee(2);
end;



declare
    total_emp number;
    function tot return number is
    cnt number;
    begin
    select count(*) into cnt from emp;
    return (cnt);
    end;
begin
    total_emp := tot();
    dbms_output.put_line('Total number of employees are ' || total_emp);
end;



create or replace function addition(A in number , B in number) return number is
C number;
begin
C := A + B;
return (C);
end;

declare
result number;
begin
result := addition(4,5);
dbms_output.put_line('The total is ' || result);
end;



create or replace function f1 return number is
res number;
begin
res := sql%rowcount;
return (res);
end;

declare
total number;
begin
update emp set sal = 6969 where job = 'Prof';
total := f1();
dbms_output.put_line('number of updated records are ' || total);
end;



create or replace trigger emp_uppercase
before insert or update of ename
on emp
for each row
begin
 :new.ename := upper(:new.ename);
end;

begin
insert into emp values(4,'harsh','Doctor',234,40000,15);
end;



create or replace trigger show
after update of ename
on emp
for each row
begin
dbms_output.put_line('Old name is ' || :old.ename);
dbms_output.put_line('New name is ' || :new.ename);
end;

begin
update emp set ename = 'Payal' where eno = 4;
end;



create or replace trigger check_sunday
before insert or delete or update
on emp
declare
dayy varchar(20);
begin
dayy := trim((to_char(sysdate,'day')));
if dayy = 'Sunday' then
raise_application_error(-20022,'NO OPERATION CAN BE PERFORMED ON SUNDAY');
end if;
end;



create or replace trigger sus
before insert
on emp
for each row
declare 
comm number;
salary number;
begin
comm := :new.commission;
salary := :new.sal;
if comm > salary then
raise_application_error(-20022,'this insertion is not possible');
end if;
end;



