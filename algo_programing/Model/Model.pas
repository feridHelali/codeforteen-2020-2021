Program MyProgram;

Uses WinCrt,Crt;

Type
    PInteger = ^Integer;
    PString = ^String[10];
    
Var 
    i:PInteger;
    S:PString;

(***Main Program***)
Begin
    Writeln('P O I N T E R S ');
    new(i);
    new(S);
    i^:=15;
    S^:='Badie';
    WriteLn('i = ',i^);
    Writeln('S = ',S^);
End.