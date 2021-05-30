Program Sorting;

Uses WinCrt;

Type
    eleve = Record
        Nom,Section:String;
        Age:Integer
    End;
   List = Array[1..100] Of eleve;
    
Var
    Buffer:List;
    Feleve:Text;
    Lignes:Integer;
    
Procedure Buffer_in(Var Feleve:Text; Var Buffer:List ;Var i:Integer);
Var
    NomEleve,SectionEleve,Info:String;
    AgeEleve,er:Integer;
Begin
	ReSet(Feleve);
	i:=0;
	While(Not(EOF(Feleve))) Do
	Begin
		Readln(Feleve,Info);
        NomEleve:=Copy(Info,1,Pos(';',Info)-1);
        Delete(Info,1,Pos(';',Info));
        SectionEleve:=Copy(Info,1,Pos(';',Info)-1);
        Delete(Info,1,Pos(';',Info));
        Val(Info,AgeEleve,er);
        i:=i+1;
        With Buffer[i] Do
        Begin
            Nom:=NomEleve;
            Section:=SectionEleve;
            Age:=AgeEleve;
        End;
	End;
	Close(Feleve);
End;

Procedure swap(Var one,two:eleve);
Var
    tmp:eleve;
Begin
	tmp:=one;
	one:=two;
	two:=tmp;
End;

Procedure Bubble (Var Buffer:List;Lignes:Integer);
Var
    Trie:Boolean;
    j:Integer;
    Tmp:Eleve;
Begin
	Repeat
		Trie:=True;
		For j:=1 To Lignes-1 Do
		Begin
			If Buffer[j].Nom>Buffer[j+1].Nom Then
            Begin
            	Trie:=False;
                swap(Buffer[j],Buffer[j+1]);
            End;
		End;
    Until(Trie)
End;

Procedure Selection (Var Buffer:List;Lignes:Integer);
Var

Begin
    For 
End;

Procedure Affich(Buffer:List;Lignes:Integer);
Var
    i:Integer;
    
Begin
    For i:=1 TO Lignes Do
    	Writeln(Buffer[i].Nom,' ',Buffer[i].Section,' ',Buffer[i].Age);
End;

//Programme Principale
Begin
    Assign(Feleve,'eleves.txt');
    Buffer_in(Feleve,Buffer,Lignes);
    Bubble(Buffer,Lignes);
    Affich(Buffer,Lignes);
End.