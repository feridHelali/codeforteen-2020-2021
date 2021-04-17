Program Palette(Input,Output);

uses Crt,dos;
Type TAB = Array[1..20] of Byte;
     MatriceCouleur = Array[1..20,1..10] of Integer;
		 TextFile = Text;
		 
Var  M : MatriceCouleur;
		 FichierSource: TextFile;
		 FichierResultat : TextFile;
		 i,j:1..20;
        Ligne:Integer;
		 
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

Begin
  Reset(fichierCouleur);
    Ligne:=1;
    While(Not EOf(fichierCouleur)) Do
    Begin
    	Readln(fichierCouleur,
    	M[Ligne,1],M[Ligne,2],M[Ligne,3],
    	M[Ligne,4],M[Ligne,5],M[Ligne,6],
    	M[Ligne,7],M[Ligne,8],M[Ligne,9],M[Ligne,10]);
    	Ligne:=Ligne+1;
    End;
    Ligne:=Ligne-1;
	Close(fichierCouleur);
end;

Begin
 {$I-}
	assign(FichierSource, 'Source.txt');
	assign(fichierResultat,'Resultat.txt');
 {$I+}

	telechargerSource(M,FichierSource,Ligne);
	for i:=1 to Ligne Do
		begin
			for j:=1 to 10Do
				Begin
					Write(M[i,j],'  ');
				end;
				Writeln;
		end;
				
End.
