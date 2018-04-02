program Game_Kosti;

{$APPTYPE CONSOLE} 

uses 
SysUtils, Math, Windows;

type TArray=array[1..6] of integer; 
TArrayBool=array[1..6] of boolean; 

var a,m:TArray; 
    c:TArrayBool;
    i,j,o,p:integer;
    sr,s1,s2:real;
    k:boolean;
    l,n:string;

procedure RASCHET(i,j:integer);
begin
randomize;
for i:=1 to 5 do
begin
  m[i]:=random(6)+1;
  write(m[i],' ');
end;
for i:=1 to 4 do
begin
  for j:=i+1 to 5 do
    if (m[i]=m[j]) and (not(c[m[i]])) then
      a[m[i]]:=a[m[i]]+1;
      c[m[i]]:=true;
end;
for i:=1 to 6 do
  if a[i]=4 then
  begin
    sr:=i;
    o:=7;
    k:=true;
  end;
  if not(k) then
    for i:=1 to 6 do
      if a[i]=3 then
      begin
        sr:=i;
        o:=6;
        k:=true;
      end;
  if not(k) then
    for i:=1 to 6 do
      if a[i]=2 then
        for j:=1 to 6 do
          if (a[j]=1) and (j<>i) then
          begin
          sr:=(3*i+2*j)/5;
          o:=5;
          k:=true;
          end;
  if not(k) then
    for i:=1 to 6 do
      if a[i]=2 then
      begin
      sr:=i;
      o:=4;
      k:=true;
      end;
  if not(k) then
    for i:=1 to 6 do
      if a[i]=1 then
        for j:=1 to 6 do
          if (a[j]=1) and (j<>i) then
          begin
          sr:=(2*i+2*j)/4;
          o:=3;
          k:=true;
          end;
  if not(k) then
    for i:=1 to 6 do
      if a[i]=1 then
      begin
      sr:=i;
      o:=2;
      k:=true;
      end;
  if not(k) then
    for i:=1 to 6 do
      if a[i]=0 then
      begin
      sr:=(m[1]+m[2]+m[3]+m[4]+m[5])/5;
      o:=1;
      k:=true;
      end;
write('Bally = ',sr*o*10:4:2);
for i:=1 to 6 do
begin
  a[i]:=0;
  c[i]:=false;
end;
k:=false;
end;

begin
write('Vvedite imya 1 igroka: ');
readln(l);
write('Vvedite imya 2 igroka: ');
readln(n);
p:=1;
s1:=0;
s2:=0;
while p<=5 do
  begin
  writeln('ROUND ',p);
  readln;
  RASCHET(i,j);
  s1:=s1+sr*o*10;
  readln;
  RASCHET(i,j);
  s2:=s2+sr*o*10;
  writeln;
  writeln;
  inc(p);
  end;
writeln('Bally igroka ',l,' = ',s1:6:2);
writeln('Bally igroka ',n,' = ',s2:6:2);
if s1>s2 then
  writeln('Pobedil igrok ',l,'!');
if s1=s2 then
  writeln('Nichya');
if s1<s2 then
  writeln('Pobedil igrok ',n,'!');
readln;
end.
