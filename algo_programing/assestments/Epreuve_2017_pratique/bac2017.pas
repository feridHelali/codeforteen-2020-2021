Program crypt;
Uses WinCrt;
type
matrice = array [1..100,1..10] of char;

var 
    Clef: String;
    source,Fcrypt:text;

Function IsDistinct (Clef:String):Boolean;
var 
bo:Boolean;
i,j:Integer;
Begin
	bo:=true;
	for i:=1 to Length(clef) do 
        for j:=i+1 to length(clef) do 
            if clef[i] = clef[j] then     	
                bo:=false;
    if  not(bo) then 
        WriteLn('les caracteres de votre clef sont non distincts');
    IsDistinct:=bo;
End;



Procedure SaisieClef (Var clef: String);
var 
b: Boolean;
i: Integer;
Begin
        Repeat 
        	b:=true;
            Write('Donner un cle de cryptage: ');
            Readln(clef);
            i:=1;
            Repeat
            	if clef[i] in ['A'..'Z'] then 
                    i:=i+1
                    Else
                        b:=false;
                    Until ((not(b)) or (i>Length(clef)));
        Until (length(clef) in [5..10]) and (b) and IsDistinct(clef);
End;


Procedure RemplirMatrice (var mat:matrice;clef:String;Ligne:String;var L,C:integer);
var 
pointeur,j,i:Integer;
Begin
	While ((Length(Ligne) mod Length(clef)) <> 0) do 
        Ligne:=ligne+#32;
    pointeur := 1;
    l:= length(Ligne) div length(clef);
    c:= length(clef);
    for i:=1 to l do 
        for j:= 1 to c do 
        Begin
            mat[i,j]:=Ligne[pointeur];
            pointeur := pointeur+1;
        End;   
End;

Function Crypter (ligne,clef:string):string;
var 
    mat:matrice;
    l,c,i,j:integer;
    tmp,result:string;
Begin
	result:='';
    RemplirMatrice(mat,clef,Ligne,l,c);
    For i:= 1 to c do
    Begin
    	tmp:='';
        for j:= 1 to l do
        tmp:=tmp+mat[j,i];
    result:=result+clef[i]+tmp;
End;
Crypter:=Result;
End;


Procedure CrypterTous(var Fcrypt,source:text);
var 
ligne:string;
Begin
	ReSet(source);
	ReWrite(Fcrypt);
	while (not(EOF(source))) do 
    Begin
    	Readln(source,ligne);
        Writeln(FCrypt,crypter(ligne,clef));
	End;
	close(source);
	close(Fcrypt);
End;


Procedure affichage (var Fcrypt:text);
var 
ligne : string;
Begin 
ReSet(Fcrypt);
	while (not(EOF(Fcrypt))) do
	begin 
            Readln(Fcrypt,ligne);
            WriteLn(ligne);
    End;
end;

{********Main Program********}
Begin
	Assign (source,'Source2.txt');
	Assign(Fcrypt,'crypt2.txt');
    SaisieClef(clef);
    crypterTous(Fcrypt,source);    
    affichage(fcrypt);

End.



