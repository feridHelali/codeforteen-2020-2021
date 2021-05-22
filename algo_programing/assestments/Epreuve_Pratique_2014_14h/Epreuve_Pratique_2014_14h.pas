Program bac_2014_14h;

Uses WinCrt;

Type 
    Mat = Array [1..5,1..5] Of Char;
    
Var
    M:Mat;
    Cle,Mes:String;
    FR:Text;
    i,j:Integer;
Procedure Saisie_Mes(Var Mes:String);
Var 
    i:Integer;
    B:Boolean;
Begin
	Repeat
		Writeln('Donnez Le Message a Crypter :');
		Readln(Mes);
		i:=1;
		B:=True;
		Repeat
			If (Mes[i] In ['A'..'Z',' ']) Then
                i:=i+1
            Else
                B:=False;
        Until(B=False) Or (i>Length(Mes));
    Until(B) And (Mes<>'');  
End;

Function Exist(i:Integer; Cle:String):Boolean;
Var
    j:Integer;
    B0:Boolean;
Begin
    j:=1;
    B0:=False;
    Repeat
    	If (Cle[i]<>Cle[j]) Then
            j:=j+1
        Else If ((Cle[i] = Cle[j]) And (i<>j)) Then
            B0:=False;
    Until(B0=False) Or (j>Length(Cle));
    Exist:=B0; 
End;

Procedure Saisie_Cle(Var Cle:String);
Var 
    i:Integer;
    B,Distinct:Boolean;
Begin
	Repeat
        Writeln('Donnez La Cle de Cryptage : ');
        Readln(Cle);
        i:=1;
		B:=True;
		Repeat
			If (Cle[i] In ['A'..'V','X'..'Z']) Then
                i:=i+1
            Else
                B:=False;
            Distinct:= Exist(i,Cle) = False;
        Until(B=False) Or (i>Length(Cle)) Or (Distinct = False);
    Until(B And Distinct And (Length(Cle) In [3..10]));
End;

Procedure Remp(Var M:Mat;Cle:String);
Var
    L,i,C,Code:Integer;
Begin
    L:=1;
    i:=1;
    C:=1;
    Repeat
    	If (C>5) Then
        Begin
            C:=1;
            L:=L+1;
        End;
    	M[L,C]:=Cle[i];
    	i:=i+1;
    	C:=C+1;
    Until(i>Length(Cle));
    Code:=65;
    Repeat
        If (C>5) Then
        Begin
            C:=1;
            L:=L+1;
        End;
    	While ((Pos(Chr(Code),Cle)<>0) Or (Chr(Code) = 'W')) Do
            Code:=Code+1; 
        M[L,C]:=Chr(Code);
        Code:=Code+1;
        C:=C+1;
    Until(L>5);
End;

Function Position(Ch:Char;M:Mat):String;
Var
    P,L1,C1:String;
    L,C:Integer;
    Reached:Boolean;
Begin
    L:=1;
    C:=1;
    Reached:=False;
    Repeat
    	If (C>5) Then
        Begin
            C:=1;
            L:=L+1;
        End;
        If (M[L,C]=Ch)Then
        Begin
        	Str(L,L1);
        	Str(C,C1);
        	P:=L1+C1;
        	Reached := True;
        End
        Else
            C:=C+1;
    Until(L>5) Or (Reached);  
    Position:=P;    
End;

Function Crypt(Mes:String;M:Mat):String;
Var
    Result,P:String;
    i:Integer;
Begin
    For i:=1 To Length(Mes) Do
        If (Mes[i] = 'W') Then
            Mes[i]:='V';
    Result := '';
    For i:=1 To Length(Mes) Do
    Begin
    	If(Mes[i] = ' ') Then
            Result:=Result+' '
        Else
        Begin
        	P:=Position(Mes[i],M);
            Result:=Result+P;
        End;
    End;
    Crypt:=Result;    
End;

Begin
	Assign(FR,'Mess_Crypt.txt');
	Saisie_Mes(Mes);
	Saisie_Cle(Cle);
	Remp(M,Cle);
	ReWrite(FR);
	Writeln(FR,Crypt(Mes,M));
	Close(FR);
	Writeln('Le message est crypt‚e dans le fichier Mess_Crypt :)');
End.




