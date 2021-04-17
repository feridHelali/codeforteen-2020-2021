Program ex4;

Uses WinCrt;

Type
    TF=File of Integer;
Var
    F,F2:TF;
    i,nb,n2:Integer;

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


Begin
	Randomize;
	Assign(F,'Depart.dat');
	Assign(F2,'Resultat.dat');
	ReWrite(F);
	n2:=0;
	For i:=1 To 100 Do
	Begin
		nb:=Random(1000);
        Write(F,nb);
        If(nb<500) Then
            n2:=n2+1;
    End;
    Close(F);
    Writeln('n2= ',n2);
    Writeln(Comptage(F,500));
End.