Program ex4;

Uses WinCrt;

Type
    TF=File of Integer;
Var
    F,F2:TF;
    i,nombre:Integer;

Function comptage(Var F:TF; a:Integer):Integer;
Var
    i,S,n:Integer;
    
Begin
    ReSet(F);
    S:=0;
    While(Not(EoF(F))) Do
    Begin
    	Read(F,n);
    	If(n<a) Then
            S:=S+1;
    End;
    Close(F);
    Comptage:=S;    
End;

Procedure Tri_Comptage(Var F,F2:TF);
Var
    T : Array [1..100] Of Integer;
    i,nombre:Integer;
Begin
	ReSet(F);
	For i:=1 To 100 Do
	Begin
		Read(F,nombre);
		T[comptage(F,nombre)+1]:=Nombre;
	End;
	Close(F);
	ReWrite(F2);
	For i:=1 To 100 Do
	Begin
		Write(F2,T[i]);
	End;
	Close(F2);
	
End;


Begin
	Randomize;
	Assign(F,'C:\Users\helal\Desktop\codeforteen-2020-2021\algo_programing\assestments\Epreuve_Algorithme_2020\Depart.dat');
	Assign(F2,'C:\Users\helal\Desktop\codeforteen-2020-2021\algo_programing\assestments\Epreuve_Algorithme_2020\Resultat.dat');
	{$I-}
	ReWrite(F);
    {$I+}
    Writeln (IOResult);
	For i:=1 To 100 Do
	Begin
        Write(F,Random(1000));
    End;
    
    Close(F);

    Tri_Comptage(F,F2);
    {$I+}
    Writeln(IoResult);
    ReSet(F2);
    For i:=1 To 100 Do
    Begin
    	Read(F2,nombre);
    	Write(Nombre,' ');
    End;
    Close(F2);
End.