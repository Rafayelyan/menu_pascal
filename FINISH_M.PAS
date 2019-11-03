program menu;
uses crt,graph;
type z = array[1..20,1..20] of real;
type zi = array[1..20,1..20] of integer;
var grdriver,grmode,x1,y1,x2,y2,width,height,delta:integer;
var c:char;
var count:integer;
var b:integer;
{}
var x:z;
var y:zi;
var i,j,t,l:integer;
var n,m:real;
var hp:integer;
{graphics needs vareybles}
var d,dm,err:integer;
var size,ket,px1,py1,tn,tm:integer;
var num:real;
var k:char;
var s,ress,si,sj,sarr:string;

{grafic functions}

function inputType(inputt:string;k:char;s:string):boolean;
var t:boolean;
begin
  if inputt='n' then
  if ((length(s)=0) and (k='0')) then inputType:=false
  else
  inputType:=((k>='0') and (k<='9'));
  if inputt= 'elem' then
  if (s='0') and (k<>'.') then inputType:=false
  else if (ket>0) and (k='.') then inputType:=false
  else
  inputType:=((k>='0') and (k<='9')) or ((k='.') and ((length(s)<>0)))
   or  ((k='-') and (length(s)=0));
end;
Procedure endl(var px1:integer;var py1:integer);
begin
     px1 := 20;
     py1 := py1 + 10;
end;
Procedure print(output:string);
begin
  outtextxy(px1,py1,output);
  px1 := px1 + length(output)*8;
end;
Procedure input(var num:real;inpt:string;var ket:integer);
  begin
    s := '';
    size := 4;
    ket := 0;
    repeat
          k := readkey;
          if inputType(inpt,k,s) then
          begin
               s := s + k;
               if k = '.' then
               ket := length(s);
               if err = 0 then
               outtextxy(px1,py1,s);
          end;
          if (k=#8) then
          begin
               delete(s,length(s),1);
               setfillstyle(1,black);
               bar(px1+((length(s))*8),py1,px1+((length(s)+1)*8),py1+8);
          end;

    until (k=#13) and (length(s)<=size);

    if ket=0 then ket:=length(s);
    val(s,num,err);
  end;
{the problem functions}
function ispos(px1:z;i:integer;n:real;m:real):boolean;
var t,tn:integer;
begin
     t:=0;
     tn := trunc(n);
     for j:=1 to tn do
      if x[i,j]>0 then
      t:=t+1;
     if t=m then
     ispos := true
     else
     ispos := false;
end;
procedure getline(i:integer;var l:integer);
begin
     if ispos(x,i,n,m) = true then
     l :=i;
end;
procedure changex(l:integer;var x:z;n:real;m:real);
var i,tn,tm:integer;
begin
     tn := trunc(n);
     tm := trunc(m);
     for i:=1 to tm do
     begin
          x[l,i] := x[l,i] + x[tn,i];
          x[tn,i] := x[l,i] - x[tn,i];
          x[l,i] := x[l,i] - x[tn,i];
     end;
end;
procedure changey(l:integer;var x:zi;n:real;m:real);
var i,tn,tm:integer;
begin
     tn := trunc(n);
     tm := trunc(m);
     for i:=1 to tm do
     begin
          x[l,i] := x[l,i] + x[tn,i];
          x[tn,i] := x[l,i] - x[tn,i];
          x[l,i] := x[l,i] - x[tn,i];
     end;
end;
{menu function protaypes}
procedure down(var count:integer);forward;
procedure up(var count:integer);forward;
procedure callfunc(count:integer);forward;

procedure my_menu(c1,c2,c3,c4:integer);
begin

  cleardevice;
  setBkColor(3);
  setFillStyle(1,2);
  setTextStyle(1,0,4);
  width := 135;
  height := 40;
  x1 := Trunc((getMaxX/2)-(width/2));
  x2 := Trunc((getMaxX/2)+(width/2));
  delta := 8;
  y1 := 60;


  bar(x1,y1,x2,height+y1);
  setcolor(c1);
  outTextXY(trunc(x1 + (width/2) - 52),y1,'Pahanj');
  y1 := y1 + height + (delta*2);
  bar(x1,y1,x2,height + y1);
  setcolor(c2);
  outTextXY(trunc(x1 + (width/2) - 38),y1,'Xndir');
  y1 := y1 + height + (delta*2);
  bar(x1,y1,x2,height + y1);
  setcolor(c3);
  outTextXY(trunc(x1 + (width/2) - 30),y1,'Xax');
  y1 := y1 + height + (delta*2);
  bar(x1,y1,x2,height + y1);
  setcolor(c4);
  outTextXY(trunc(x1 + (width/2) - 30),y1,'Exit');


  repeat
  c := readkey;
  case c of
    #72: up(count);
    #80: down(count);
    #13: callfunc(count);
  end;
  until (b=1);
  {until ((c = #27) or (b=1));}


  {closeGraph();}

end;
procedure pahanj(count:integer);
var ty,bx1,by1:integer;
begin

     cleardevice;
     setBkColor(black);
     setFillStyle(1,green);
     setTextStyle(1,0,1);
     width := 180;
     height := 320;
     x1 := Trunc((getMaxX/2)-(width));
     x2 := Trunc((getMaxX/2)+(width));
     y1 := 60;
     ty := 80;

     bar(x1,y1,x2,height+y1);
     setcolor(15);

     outTextXY(trunc(x1+3),ty+y1,'569.Trvac e MxN chapi  matric@:Texe');
     y1:=y1+20;
     outTextXY(trunc(x1+3),ty+y1,'rov poxel matrici verjin tox@, ayn');
     y1:=y1+20;
     outTextXY(trunc(x1+3),ty+y1,'arajin toxi het, vor@ miayn drakan');
     y1:=y1+20;
     outTextXY(trunc(x1+3),ty+y1,'tarrer parunakum: Artacel stacvac');
     y1:=y1+20;
     outTextXY(trunc(x1+3),ty+y1,'matric@: Ete aydpisi tox chka, apa');
     y1:=y1+20;
     outTextXY(trunc(x1+3),ty+y1,'artacel nervucvac matric@');

     bx1:=x2+10;
     by1:=60+height+10;

     bar(bx1,by1,bx1+70,by1+30);
     outtextXY(bx1,by1,'Back(b)');

     repeat
     c := readkey;
     case c of
     #72:pahanj(count);
     #80:pahanj(count);
     #98:my_menu(15,15,15,15);
     end;
     until b=1;
end;

Procedure xndir(count:integer);
begin
	cleardevice;

    setBkColor(black);
    setFillStyle(1,black);
    setTextStyle(0,0,0);

    px1 := 20;
    py1 := 20;
    print('n=');
    input(n,'n',ket);
    endl(px1,py1);
    print('m=');
    input(m,'n',ket);

    tn := trunc(n);
    tm := trunc(m);
    for i:=1 to tn do
    for j:=1 to tm do
      begin
        str(i,si);
        str(j,sj);
        endl(px1,py1);
        print('x['+si+']['+sj+']= ');
        input(x[i,j],'elem',ket);
        y[i,j] := length(s) - ket;
    end;
    for i:=1 to tn do
     begin
          getline(i,l);
          if l>0 then
          break;
     end;
     if l>1 then
     begin
     changex(l,x,n,m);
     changey(l,y,n,m);
     end;
     endl(px1,py1);
     for i:=1 to tn do
     begin
      for j:=1 to tm do
      begin
        str(x[i,j]:size:y[i,j],sarr);
        print(sarr+' ');
      end;
       endl(px1,py1);
    end;

    setcolor(15);
    outtextXY(getmaxx-120,getmaxy-70,'Back(b)');

    repeat
     c := readkey;
     case c of
     #72:hp:=1;
     #80:hp:=1;
     #98:my_menu(15,15,15,15);
     end;
     until b=1;

end;
procedure down(var count:integer);
begin
  if count <= 4 then
  begin
    count:= count + 1;     {11,}
    case count of
      1:my_menu(11,15,15,15);
      2:my_menu(15,11,15,15);
      3:my_menu(15,15,11,15);
      4:my_menu(15,15,15,11);
    end;
    if count = 5 then
    begin
      count:=0;
      down(count);
    end;
  end;
end;
procedure up(var count:integer);
begin
  if count >= 0 then
  begin
    count:= count - 1;
    case count of
      1:my_menu(11,15,15,15);
      2:my_menu(15,11,15,15);
      3:my_menu(15,15,11,15);
      4:my_menu(15,15,15,11);
    end;
    if count = 0 then
    begin
         count:=5;
         up(count);
   end;
  end;
end;
procedure callfunc(count:integer);
begin
     case count of
          1:pahanj(count);
          2:xndir(count);
         { 4:b:=1; }
     end;
     if count = 4 then
     begin
          b:=1;
     end;
end;
Begin
  detectGraph(grdriver,grmode);
  initGraph(grdriver,grmode,'');
  count :=0;

  b:=0;

  my_menu(15,15,15,15);


End.