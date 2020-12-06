program Ste_Alfa;
uses wincrt,crt,dos;
Type 
    
    TDate = Record
        day:1..31;
        month:1..12;
        year:1970..3000;
    end;

    TREmployee=Record 
        Code:String[10];
        Name:string[30];
        Date: TDate;
        Salary:Real;
    End;

    TRBuffer=Array[1..100] of TREmployee;
    
Var 
    InputFile:text;
    ChMenu:1..4;
    Size:integer;
    Buffer:TRBuffer;


Procedure prSwap(var left,right:TREmployee);
Begin 
    
End;

Procedure prReadBuffer(var InputFile:Text;var Buffer:TRBuffer;var Size:Integer);
Begin 
	WriteLn('prReadBuffer works');
End;

Procedure prWriteBuffer(var InputFile:Text;var Buffer:TRBuffer;Size:Integer);
Begin 
	WriteLn('prWriteBuffer works');
End;

Procedure BubbleSorting (var Buffer:TRBuffer; Size:Integer);
Begin
	WriteLn('BubbleSorting works');
End;

Procedure SelectionSorting (var Buffer:TRBuffer; Size:Integer);
Begin
	WriteLn('SelectionSorting works ');
End;

Procedure InsertionSorting (var Buffer:TRBuffer; Size:Integer);
Begin
	WriteLn ('InsertionSorting works');
End;


{**********************}
Begin 
  Assign(InputFile,'emp.csv');
   Clrscr;
     Gotoxy(30,2);Writeln('Ste Alfa');
     Gotoxy(20,6);Writeln('1 : Tri a bulles fichier salairies.');
     Gotoxy(20,8);Writeln('2 : Tri a selection fichier salairies.');
     Gotoxy(20,10);Writeln('3 : Tri a insertion fichier salairies');
     Gotoxy(20,12);Writeln('4 : Quitter');
     Gotoxy(15,23);Write('Votre Choix:');
      Repeat
        Readln(ChMenu);
      Until (ChMenu In [1..4]);
      Case ChMenu Of
        1:begin
            prReadBuffer(inputFile,Buffer,Size);
            BubbleSorting(Buffer,size);
            prWriteBuffer(InputFile,Buffer,Size);
        End;
        2:begin
             prReadBuffer(inputFile,Buffer,Size);
            SelectionSorting(Buffer,size);
              prWriteBuffer(InputFile,Buffer,Size);
                end;
        3: begin
                prReadBuffer(inputFile,Buffer,Size);
                InsertionSorting(Buffer,size);
              prWriteBuffer(InputFile,Buffer,Size);
              end;
        4:  Readln;
      End;
   
End.