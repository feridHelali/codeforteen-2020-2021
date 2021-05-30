Program Pratique_2017;

Uses WinCrt;

Type
    Mat = Array[1..100,1..10] Of Char;
    
Var
    Code:String;
    Source,Crypt:Text;
    
Function ValidCode(Code:String):Boolean;
Var
    B1:Boolean;
    i,j:Integer;
Begin
    B1:=True;
    i:=1;
    Repeat
    	j:=1;
    	Repeat
    		If ((i<>j)And(Code[j]=Code[i])) Then
                B1:=False
            Else
                j:=j+1;
        Until(j>Length(Code)) Or (B1=False);
        i:=i+1;
    Until(i>Length(Code));
    ValidCode:=B1;
 End;


Procedure SaisieCode(Var Code:String);
Var
    j:Integer;
    B:Boolean;
Begin
	Repeat
        Writeln('Donnez le Code :');
        Readln(Code);
        j:=1;
        B:=True;
        Repeat
            If(Code[j] In ['A'..'Z']) Then
                j:=j+1
            Else
                B:=False;
        Until(B = False) Or (j>Length(Code));
    Until((B) And (ValidCode(Code)) And (Length(Code) In [5..10])) ; 
End;

Procedure  LigneMatrice(Var M:Mat;Ligne,Code:String;Var L,C:Integer);
Var
    i:Integer;
Begin
    While(Length(Ligne) mod Length(Code) <> 0) Do
    Begin
    	Ligne:=Ligne+' ';
    End;
    L:=0;
    C:=Length(Code);
    Repeat
    	L:=L+1;
        For i:=1 To C Do
        Begin
            M[L,i]:=Ligne[i];
        End;
        Delete(Ligne,1,C);
    Until(Ligne='');
End;

Function CryptLigne(Ligne,Code:String):String;
Var
    M:Mat;
    L,C,i,j:Integer;
    Cryptee:String;
    
Begin
	Cryptee:='';
    LigneMatrice(M,Ligne,Code,L,C);
    For j:=1 To C Do
    Begin
    	Cryptee:=Cryptee+Code[j];
    	For i:=1 To L Do
    	Begin
    		Cryptee:=Cryptee+M[i,j];
    	End;
    End;
    CryptLigne:=Cryptee;
End;


Procedure CryptAll(Var Source,Crypt:Text;Code:String);
Var
    Ligne:String;
Begin
	ReSet(Source);
	ReWrite(Crypt);
	While(Not(EoF(Source))) Do
	Begin
        Readln(Source,Ligne);
        Writeln(Crypt,CryptLigne(Ligne,Code));
	End;
	Close(Source);
	Close(Crypt);
End;

Procedure Affich(Var Crypt:Text);
Var
    Ligne:String;
    
Begin
	ReSet(Crypt);
    While(Not(EOF(Crypt)))Do
    Begin
    	Readln(Crypt,Ligne);
    	Writeln(Ligne);
    End;
    Close(Crypt);
End;

(*Programme  Principale*)
Begin
	Assign(Source,'Source.txt');
	Assign(Crypt,'Crypt.txt');
    SaisieCode(Code);
    CryptAll(Source,Crypt,Code);
    Affich(Crypt);
End.