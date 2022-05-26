declare
a number := 1;
b number := 2;
c number := 3;
begin
if a > b and b > c then
dbms_output.put_line(a || ' is the largest among all');
elsif b > a and b > c then
dbms_output.put_line(b || ' is the largest among all');
else dbms_output.put_line(c || ' is the largest among all');
end if;
end;


declare
n number := 69;
rem number;
begin
rem := mod(n,2);
if rem = 0 then
dbms_output.put_line('it is an even number');
else dbms_output.put_line('it is an odd number');
end if;
end;


declare
marks number := 69;
begin
if marks > 80 then
dbms_output.put_line('A grade');
elsif marks > 70 then
dbms_output.put_line('B grade');
elsif marks > 50 then
dbms_output.put_line('C grade');
elsif marks > 40 then
dbms_output.put_line('D grade');
else dbms_output.put_line('E grade');
end if;
end;


declare
n number := 7;
res number;
begin
for c in 1..10
loop
res := n * c;
dbms_output.put_line(res);
end loop;
end;


declare
n number := 5;
prod number := 1;
begin
while n > 0
loop
prod := prod * n;
n := n - 1;
end loop;
dbms_output.put_line(prod);
end;


declare 
n number := 11;
first number := 0;
second number := 1;
cnt number := 1;
res number;
begin
dbms_output.put_line(first);
dbms_output.put_line(second);
while cnt <= n-2
loop
res := mod(cnt,2);
if res = 1 then
first := first + second;
dbms_output.put_line(first);
cnt := cnt + 1;
else 
second := first + second;
dbms_output.put_line(second);
cnt := cnt + 1;
end if;
end loop;
end;


declare
n number := 235;
res number := 0;
begin
while n > 0 
loop
res := res*10 + mod(n,10);
n := floor(n/10);
end loop;
dbms_output.put_line(res);
end;



