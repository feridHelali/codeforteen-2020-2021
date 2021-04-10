Program Palette(Input,Output);

uses Crt,dos;
Type TAB = Array[1..20] of Byte;
     MatriceCouleur = Array[1..20,1..10] of Integer;
		 TextFile = Text;
		 
Var  M : MatriceCouleur;
		 FichierSource: TextFile;
		 FichierResultat : TextFile;
		 i,j:1..20;

		 
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
Procedure telechargerSource(Var M:MatriceCouleur;Var fichierCouleur:TextFile);
	 var colonne : 1..20;
	     ligne:1..20;
Begin
  Reset(fichierCouleur);
  colonne:=1;
  ligne:=1;
  while(not Eof(fichierCouleur)) Do
	Begin
		while (not Eoln(fichierCouleur)) Do
		Begin
			read(fichierCouleur,M[ligne,colonne]);
			colonne:=colonne+1;
		end;
		ligne:=ligne+1;
		colonne:=1;
		readln(fichierCouleur);
	end;
	Close(fichierCouleur);
end;

Begin
 {$I-}
	assign(FichierSource, 'Source.txt');
	assign(fichierResultat,'Resultat.txt');
 {$I+}
  telechargerSource(M,FichierSource);

	for i:=1 to 10 Do
		begin
			for j:=1 to 20 Do
				Begin
					Write(M[i,j],'  ');
				end;
				Writeln;
		end;
				
End.
