Program Palette(Input,Output);

uses Crt,dos;
Type TAB = Array[1..20] of Byte;
     MatriceCouleur = Array[1..20,1..10] of Integer;
		 TextFile = Text;
		 
Var  M : MatriceCouleur;
		 FichierSource: TextFile;
		 FichierResultat : TextFile;
        Row,Column,Ligne:Integer;
        
		 
{ Procedure de tri Rapide d'un Tableau de 20 Entier }
{ debut, fin : indices des cases [debut,fin] }
Procedure Tri_Rapide (debut, fin : Integer ; Var Tableau : Tab);
Var
  indice, pointeur, tmp, milieu : Integer;
Begin
  If (fin > debut) Then
    Begin
      milieu := (debut+fin) Div 2;
      tmp := Tableau[milieu];
      Tableau[milieu] := Tableau[debut];
      Tableau[debut] := tmp;
      pointeur := debut;
      For indice := debut+1 To fin Do
        If (Tableau[indice]<Tableau[debut]) Then
          Begin
            pointeur := pointeur+1;
            tmp := Tableau[indice];
            Tableau[indice] := Tableau[pointeur];
            Tableau[pointeur] := tmp;
          End;
      tmp := Tableau[pointeur];
      Tableau[pointeur] := Tableau[debut];
      Tableau[debut] := tmp;
      Tri_Rapide(debut, pointeur-1, Tableau);
      Tri_Rapide(pointeur+1, fin, Tableau);
    End;
End;

{ Procedure de transfert du fichier Source.txt ver Matrice de Couleur}
Procedure telechargerSource(Var M:MatriceCouleur;Var fichierCouleur:TextFile;Var ligne:Integer);
	 var colonne : 1..10;
    stringLigne,Cell:String;
    er:Integer;
Begin
  Reset(fichierCouleur);
    Ligne:=1;
    Colonne:=1;
    While(Not EOf(fichierCouleur)) Do
    Begin
        Readln(fichierCouleur,stringLigne);
        If (stringLigne[length(stringLigne)]<>' ') Then
            stringLigne:=stringLigne+' ';
        Repeat
        	Cell:=Copy(stringLigne,1,Pos(' ',stringLigne)-1);
        	Delete(stringLigne,1,pos(' ',stringLigne));
        	Val(Cell,M[ligne,colonne],er);
        	colonne:=colonne+1;
        Until(Cell='');
        Colonne:=1;
        Ligne:=Ligne+1;
    End;
    Ligne:=Ligne-1;
	Close(fichierCouleur);
end;

Procedure Tri_Matrice(Var M:matriceCouleur;Ligne:Integer);
Var
    tmpArray:Tab;
    Colonne:1..10;
    Row:1..20;
Begin
    For Colonne:=1 To 10 Do
    Begin
    	For Row:=1 To Ligne Do
            tmpArray[Row]:=M[Row,Colonne];
        Tri_Rapide(1,Ligne,tmpArray);
        For Row:=1 To Ligne Do
           M[Row,Colonne]:=tmpArray[Row];
    End;
End;

Procedure saveSortedMatrix(M:matriceCouleur;Var fichierResultat:Text;Ligne:Integer);
Var
    Row:Integer;
Begin
    {$I-}
        ReWrite(fichierResultat);
    {$I+}
    For Row:=1 To Ligne Do 
    Begin
        For Column:=1 To 10 Do
            Write(fichierResultat,M[Row,Column],' ');
        Writeln(fichierResultat);
    End;
    Close(fichierResultat);
End;

Procedure Affichage_Fichier_Resultat(Var fichierResultat:Text);
Var
    Line:String;
Begin
	Reset(fichierResultat);
    While(Not Eof(fichierResultat)) Do 
    Begin
    	Readln(fichierResultat,Line);
    	Writeln(Line);
    End;
    Close(FichierResultat);
End;


Begin
 {$I-}
	assign(FichierSource, 'Source.txt');
	assign(fichierResultat,'Resultat.txt');
 {$I+}
	telechargerSource(M,FichierSource,Ligne);
    Tri_Matrice(M,Ligne);
    saveSortedMatrix(M,fichierResultat,Ligne);
    Affichage_Fichier_Resultat(fichierResultat);
End.
