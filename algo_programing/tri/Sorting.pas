Program Ste_Alfa;
Uses Wincrt,crt,dos;
Type
  TDate = Record
    day: 1..31;
    month: 1..12;
    year: 1970..3000;
  End;
  TREmployee = Record
    Code: String[10];
    Name: String[30];
    Date: TDate;
    Salary: Real;
  End;
  TRBuffer = Array[1..100] Of TREmployee;
Var
  InputFile,sortedOnCode,sortedOnName,sortedOnSalary: Text;
  ChMenu: 1..4;
  Size,i: Integer;
  Buffer: TRBuffer;
Procedure prSwap(Var left,right:TREmployee);
Var
  tmpEmployee: TREmployee;
Begin
  tmpEmployee := left;
  left := right;
  right := tmpEmployee;
End;

(* read the text file into the buffer *)
Procedure prReadBuffer(Var InputFile:Text;Var Buffer:TRBuffer;Var Size:Integer);

 { Parse is helper function that take a file ligne and return Employee Record}
 { fn with out side effect that parse a string with ; delimitter to TREmployee Record *}
Function fnParseLigne(line:String): TREmployee;
Var
  employee: TREmployee;
  pt,order,error: Integer;
  fields: Array[1..10] Of String;
  currentField: String;
Begin
  order := 1;
  currentfield := '';
  For pt:=1 To Length(line) Do
    Begin
      If line[pt]=';' Then
        Begin
          order := order+1;
          currentfield := '';
        End
      Else
        Begin
          currentfield := currentfield + line[pt];
        End;
      fields[order] := currentfield;
    End;
  //for i:=1 to 4 do writeln('fields[',i,']= ',fields[i]);
  With employee Do
    Begin
      code := fields[1];
      name := fields[2];
      With date Do
        Begin
          Val(Copy(fields[3],1,2),day,error);
          Val(Copy(fields[3],4,2),month,error);
          Val(Copy(fields[3],7,4),year,error);
        End;
      Val(fields[4],salary,error);
    End;
 { return Employee}
  fnParseLigne := employee;
End;
	(*end of   fnParseLine *)

Var
  i: 0..100;
  line: String;
Begin
 {$I-}
  Reset(InputFile);
 {$I+}
  If Ioresult<>0 Then
    Begin
      Gotoxy(15,23);
      Writeln('Erreur de lecture de fichier n°:',Ioresult);
    End
  Else
    Begin
      i := 0;
      While Not Eof(InputFile) Do
        Begin
          i := i+1;
          Readln(InputFile,line);
          Buffer[i] := fnParseLigne(line);
        End;
      Size := i;
    End;
  Close(InputFile);
End;

(* save the sorted buffer to the target file*)
Procedure prWriteBuffer(var targetFileName:text;Var Buffer:TRBuffer;Size:Integer);
var index:Integer;
Begin
  {$I-}
	rewrite(targetFileName);
	{$I+}
	if IOResult<> 0 then Writeln('Erreur d''ecriture sur le disque n°:',IOResult)
	Else
	Begin
		 for index:=1 to size Do
		 Begin
		 with Buffer[index] do
			 Begin
			 			WriteLn(targetfileName,code,';',name,';',date.day,'/',date.month,'/',date.year,';',salary:10:3);
			 end;
		 end;
	end;
	Writeln('Success : The Sorted file is ready');
	close(targetFileName);
End;


(* sort the buffer array on Employee.code ASC *)
Procedure prBubbleSorting (Var Buffer:TRBuffer; Size:Integer);
Var
  sorted: Boolean;
  index: Integer;
Begin
  Repeat
    sorted := True;
    For index:=1 To size-1 Do
      Begin
        If Buffer[index].code > Buffer[index+1].code Then
          Begin
            prSwap(Buffer[index],Buffer[index+1]);
            sorted := False;
          End;
      End;
	Until sorted=true;
End;


	(*   prSelectionSorting sort the buffer on EmployeeName ASC *)
  Procedure prSelectionSorting (Var Buffer:TRBuffer; Size:Integer);
  Begin
    Writeln('SelectionSorting works ');
  End;

	(*   prInsertionSorting sort the buffer on Salary DES *)
  Procedure prInsertionSorting (Var Buffer:TRBuffer; Size:Integer);
  Begin
    Writeln ('InsertionSorting works');
  End;
	
{* Main Program*}
  Begin
    Assign(InputFile,'emp.csv');
		Assign(sortedOnCode,'sortcode.csv');
		Assign(sortedOnName,'sortname.csv');
		Assign(sortedOnSalary,'sortsalary.csv');
		
    Clrscr;
    Gotoxy(30,2);
    Writeln('Ste Alfa');
    Gotoxy(20,6);
    Writeln('1 : Tri a bulles fichier salairies.');
    Gotoxy(20,8);
    Writeln('2 : Tri a selection fichier salairies.');
    Gotoxy(20,10);
    Writeln('3 : Tri a insertion fichier salairies');
    Gotoxy(20,12);
    Writeln('4 : Quitter');
    Gotoxy(15,23);
    Write('Votre Choix:');
    Repeat
      Readln(ChMenu);
    Until (ChMenu In [1..4]);
    Case ChMenu Of
      1:
         Begin
           prReadBuffer(inputFile,Buffer,Size);
           prBubbleSorting(Buffer,size);
           prWriteBuffer(sortedOnCode,Buffer,Size);
         End;
      2:
         Begin
           prReadBuffer(inputFile,Buffer,Size);
           prSelectionSorting(Buffer,size);
           prWriteBuffer(InputFile,Buffer,Size);
         End;
      3:
         Begin
           prReadBuffer(inputFile,Buffer,Size);
           prInsertionSorting(Buffer,size);
           prWriteBuffer(InputFile,Buffer,Size);
         End;
      4: Readln;
    End;
  End.
