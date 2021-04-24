Program Sorting;
Uses WinCRT;
type
    eleve = Record
                    name:string;
                    section:string;
                    age:Byte;
                End;
    buffer = array [1..100] of eleve;
var
    tfile,bubblename,selectionsection:text;
    Rtable:buffer;
    i:integer;
Procedure read_from_file (var tfile:text;var Rtable:buffer;var i:Integer);
var 
info,name,section:string;
e,age:Integer;
Begin
        ReSet(tfile);
        i:=1;
        While not (EOF(tfile)) do 
         Begin
            Readln(tfile,info);
            name:= Copy(info,1,pos(';',info)-1);
            Delete(info,1,pos(';',info));
            section:= Copy(info,1,pos(';',info)-1);
            Delete(info,1,pos(';',info));
            val(info,age,e);
            Rtable[i].name:=name;
            Rtable[i].section:=section;
            Rtable[i].age:=age;
            i:=i+1;
         End;
        close(tfile);
        i:=i-1;
End;
Procedure swap (var first ,second:eleve);
var 
tmp:eleve;
Begin
tmp:=first;
first:=second;
second:=tmp;	
End;


procedure bubble_sort_name (var rtable:buffer;i:integer);
var 
j:integer;
b:Boolean;
begin 
	
	Repeat
        b:=true;
        For j :=1 to i-1 do 
            if rtable[j].name>rtable[j+1].name then 
                Begin
                    swap(rtable[j],rtable[j+1]);
                    b:=false;
                End;
    Until (b);
End;

procedure selection_sort_section (var rtable:buffer;i:integer);
var 
    j,IndexMin,k:integer;

Begin
    For j:=1 To i-1 Do
    Begin
        indexMin:=j;
        {Seek for minimum value index}
        For k:=j+1 To i Do
            If rtable[indexmin].section>rtable[k].section Then
                indexMin:=K;
            If (indexMin<>j) Then
                Swap(rtable[j],rtable[indexmin]);
    End;
End;

Procedure Buffer_Output(Var Sort:Text;rtable:Buffer;i:Integer);
Var
    j:Integer;
Begin
	ReWrite(Sort);
	For j:=1 To i Do 
	Begin
		Writeln(Sort,rtable[j].name,';',rtable[j].section,';',rtable[j].age);
	End;
	Close(Sort);
End;

Procedure affiche(rtable:buffer;i:integer);
var
j:integer;
Begin
        for j:=1 to i do
        Begin 
        WriteLn(rtable[j].name,'   ',rtable[j].section,'   ',rtable[j].age);
        End;
End;

Begin 
	Assign(tfile,'eleve.txt');
	Assign(bubblename,'tri1.txt');
	Assign(selectionsection,'tri2.txt');
	read_from_file(tfile,Rtable,i);
	selection_sort_section(rtable,i);
    Buffer_Output(selectionsection,rtable,i);
    bubble_sort_name(rtable,i);
    Buffer_Output(bubblename,rtable,i);
End.
