Program Accounting;
Uses Wincrt,Crt,dos;
Type

  TCompte = Record
    Code : Integer;
    Libelle : String[50];
  End;
  TDate = Record
    Day : 1..31;
    Month : 1..12;
    Year : 1971..9999;
  End;
  TEcriture = Record
    CRCompte,DBCompte : Integer;
    DateEcriture : TDate;
    Folio : Word;
    LibelleEcriture : String[255];
    MntDebit,MntCredit : Real;
  End;
  TPlanComptable = Array [1..1000] Of TCompte;
  TJournal = Array [1..5000] Of TEcriture;
  TFPLan = File Of TCompte;
  TFJournal = File Of TEcriture;
Var
	extrait:Text;
  Choix : 1..2;
  FP: TFPlan;
  FJournal: TFJournal;
  Exit: Boolean;
  Res: Char;
(* =========       Gestion Plan Comptable    ==================*)

Procedure prGestionPC(Var FP:TFPlan);
 (* ------------------------------------------- prSaisieCompte ------------------------------*)

Procedure prSaisieCompte(Var FP:TFPlan);
Var
  TmpCompte,tmp: TCompte;
  Rep: Char;
Begin
  Clrscr;
  Gotoxy(20,4);
  Writeln('Code      :');
  Gotoxy(20,6);
  Writeln('Libele    :');
  Gotoxy(40,4);
  Readln(TmpCompte.Code);
  Gotoxy(40,6);
  Readln(TmpCompte.Libelle);
  Repeat
    Gotoxy(23,10);
    Write('Voullez vous enregistrer ce compte (O/N)');
    Read(Rep);
  Until (Upcase(Rep) In ['O','N']);
  If Upcase(Rep)='O' Then
    Begin
 {$I-}
      Reset(FP);
 {$I+}
      If Ioresult<>0 Then Rewrite(FP);
(* Atteindre fin de Fichier *)
      While Not Eof(FP) Do
        read(FP,tmp);
      Write(FP,TmpCompte);
    End;
  Close(FP);
End;
Procedure prAfficherComptes(Var FP:TFPlan);
Var
  TmpCompte: TCompte;
Begin
  Clrscr;
  Gotoxy(32,1);
  Writeln('PLAN COMTABLE');
  Writeln('===============================================================================');
  Writeln('=      Code Compte          |              Libelle Compte                     =');
  Writeln('===============================================================================');
 {$I-}
  Reset(FP);
 {$I+}
  If Ioresult=0 Then
    Begin
      While Not Eof(FP) Do
        Begin
          Read(FP,TmpCompte);
          Writeln('=     ',TmpCompte.Code,'      |          ',TmpCompte.Libelle,'               =');
          Writeln('------------------------------------------------------------------------------');
        End;
    End
  Else Writeln('Probleme Fichier : ', Ioresult);
  Close(FP);
End;
 (* ------------------------------------------- prMAJCompte ------------------------------*)

Procedure prMAJCompte(Var FP:TFPlan);
Var
  bufferComptes: TPlanComptable;
  tmp: TCompte;
  code: Integer;
  indice: 0..1000;
  nbComptes: 0..1000;
  oldLibelle,newLibelle: String[50];
  accountExist: Boolean;
Begin
  Clrscr;
  Gotoxy(32,4);
  Write('MISE A JOURS COMPTE');
  Gotoxy(20,6);
  Write('Code      :');
  Readln(code);
 {$I-}
  Reset(FP);
 {$I+}
  If Ioresult=0 Then
    Begin
      indice := 0;
      nbComptes := 0;
      While Not Eof(FP) Do
        Begin
          indice := indice+1;
          Read(FP,tmp);
          bufferComptes[indice] := tmp;
        End;
      nbComptes := indice;
      indice := 0;
      accountExist := False;
      While indice<nbComptes Do
        Begin
          indice := indice+1;
          If bufferComptes[indice].code=code
            Then
            Begin
              oldLibelle := bufferComptes[indice].libelle;
              accountExist := True;
            End;
        End;
      If accountExist=True Then
        Begin
          Gotoxy(20,8);
          Write('Ancienne Libelle    :',oldLibelle);
          Gotoxy(20,10);
          Write('Nouvelle Libelle    :');
          Read(newLibelle);
          indice := 0;
          While indice<nbComptes Do
            Begin
              indice := indice+1;
              If (bufferComptes[indice].code=code) Then bufferComptes[indice].libelle := newLibelle;
            End;
          Rewrite(FP);
          For indice:=1 To nbComptes Do
            Write(FP,bufferComptes[indice]);
        End
      Else
        Begin
          Gotoxy(20,20);
          Writeln('Compte du code ',code, ' est introuvable.');
        End;
    End
  Else Writeln('Probleme Fichier : ', Ioresult);
  Close(FP);
End;
 (* ------------------------------------------- prSupprimerCompte ------------------------------*)

Procedure prSupprimerCompte(Var FP:TFPlan);
Var
  bufferComptes,newBuffer: TPlanComptable;
  tmp: TCompte;
  code: Integer;
  indice,i: 0..1000;
  nbComptes: 0..1000;
  accountExist: Boolean;
Begin
  Clrscr;
  Gotoxy(32,4);
  Write('SUPPRESSION COMPTE');
  Gotoxy(20,6);
  Write('Code      :');
  Readln(code);
 {$I-}
  Reset(FP);
 {$I+}
  If Ioresult=0 Then
    Begin
      indice := 0;
      nbComptes := 0;
      While Not Eof(FP) Do
        Begin
          indice := indice+1;
          Read(FP,tmp);
          bufferComptes[indice] := tmp;
        End;
      nbComptes := indice;
      accountExist := False;
      i := 1;
      For indice:=1 To nbComptes Do
        Begin
          If bufferComptes[indice].code<>code
            Then
            Begin
              newBuffer[i] := bufferComptes[indice];
              i := i+1;
            End
          Else
            accountExist := True;
        End;
      If accountExist=True Then
        Begin
          Gotoxy(20,8);
          Write('Compte ',code, ' est supprimer.');
          Rewrite(FP);
          For indice:=1 To i-1
            Do
            Write(FP,newBuffer[indice]);
        End
      Else
        Begin
          Gotoxy(20,20);
          Writeln('Compte du code ',code, ' est introuvable.');
        End;
    End
  Else Writeln('Probleme Fichier : ', Ioresult);
  Close(FP);
End;
Var
  ChMenu: 1..5;
  quit: Boolean;
Begin
  Clrscr;
  Gotoxy(30,2);
  Writeln('Gestion plan comptable');
  Gotoxy(20,6);
  Writeln('1 : Ajoutez des comptes.');
  Gotoxy(20,8);
  Writeln('2 : Affichez la liste des comptes.');
  Gotoxy(20,10);
  Writeln('3 : Mettre a jour un compte.');
  Gotoxy(20,12);
  Writeln('4 : Supprimez un compte.');
  Gotoxy(20,14);
  Writeln('5 : Retour Menu Principal');
  Gotoxy(15,23);
  Write('Votre Choix:');
  Repeat
    Readln(ChMenu);
  Until (ChMenu In [1..5]);
  Case ChMenu Of
    1: prSaisieCompte(FP);
    2: prAfficherComptes(FP);
    3: prMAJCompte(FP);
    4: prSupprimerCompte(FP);
    5: quit := True;
  End;
End;
(* ============   Gestion Journal    ====================*)

Procedure prGestionJournal(Var FJournal:TFJournal;Var FPlan:TFPLan; var extrait:text);
 (* ------------------------------------------- prSaisiePiece ------------------------------*)

Function fnlookUpForAccount(code:Integer;Var FPlan:TFPLan): String;
Var
  tmpCompte: TCompte;
  compteExiste: Boolean;
Begin
 {$I-}
  Reset(FPlan);
 {$I+}
  If Ioresult = 0 Then
    Begin
      compteExiste := False;
      While Not Eof(FPlan) Do
        Begin
          Read(Fplan,tmpCompte);
          If (tmpCompte.Code = code) Then
            Begin
              fnLookUpForAccount := tmpCompte.Libelle;
              compteExiste := True;
            End
        End;
    End;
  If Not compteExiste Then
    fnLookUpForAccount := 'Compte n''existe pas. Veillez l''ajouter';
  Close(FPlan);
End;
 (* ------------------------------------------- prSaisiePiece ------------------------------*)

Procedure prSaisePiece(Var FJournal:TFJournal;Var FPlan:TFPLan);
Var
  tmpEcriture,tmp: TEcriture;
  Rep: Char;
Begin
  Clrscr;
  Gotoxy(10,2);
  Writeln('          S A I S I E    P I E C E  C O M P T A B L E            ');
  Gotoxy(10,4);
  Writeln('Date de la piece   : __/__/____');
  Gotoxy(10,5);
  Writeln('Libelle Ecriture   : ________________________________________________');
  Gotoxy(10,6);
  Writeln('Compte a Debiter   : ____');
  Gotoxy(10,7);
  Writeln('Montant a Debiter  : ___________');
  Gotoxy(10,8);
  Writeln('Compte a crediter  : ____');
  Gotoxy(10,9);
  Writeln('Montant a crediter : ___________');
  With tmpEcriture.DateEcriture Do
    Begin
      Gotoxy(31,4);
      Readln(Day);
      Gotoxy(34,4);
      Readln(Month);
      Gotoxy(37,4);
      Readln(Day);
    End;
  Gotoxy(31,5);
  Readln(tmpEcriture.LibelleEcriture);
  Gotoxy(31,6);
  Readln(tmpEcriture.DBCompte);
  Gotoxy(38,6);
  Write(fnlookUpForAccount(tmpEcriture.DBCompte,FPlan));
  Gotoxy(31,7);
  Readln(tmpEcriture.MntDebit);
  Gotoxy(31,8);
  Readln(tmpEcriture.CrCompte);
  Gotoxy(38,8);
  Write(fnlookUpForAccount(tmpEcriture.CrCompte,FPlan));
  Gotoxy(31,9);
  Readln(tmpEcriture.MntCredit);
  Repeat
    Gotoxy(23,20);
    Write('Voullez vous enregistrer cette piece (O/N) ');
    Read(Rep);
  Until (Upcase(Rep) In ['O','N']);
  If Upcase(Rep)='O' Then
    Begin
 {$I-}
      Reset(FJournal);
 {$I+}
      If Ioresult<>0 Then Rewrite(FJournal);
(* Atteindre fin de Fichier *)
      While Not Eof(FJournal) Do
        read(FJournal,tmp);
      Write(FJournal,TmpEcriture);
      Close(FJournal);
    End;
End;
 (* ------------------------------------------- prModifierPiece ------------------------------*)

Procedure prModifierPiece(Var FJournal:TFJournal;Var FPlan:TFPLan);
Begin
  Writeln('prModifierPiece not yet implemented');
End;
 (* ------------------------------------------- prListerPieces ------------------------------*)

Procedure prListerPiece(Var FJournal:TFJournal;Var FPlan:TFPLan);
Var
  tmpEcriture: TEcriture;
Begin
  Clrscr;
  Gotoxy(10,2);
  Writeln('          JOURNAL  C O M P T A B L E            ');
  Gotoxy(32,1);
  Writeln('PLAN COMTABLE');
  Writeln('===============================================================================');
  Writeln('|   Date | Cpt Debit | CptCredit | Libelle                   | Debit   |Credit|');
  Writeln('===============================================================================');
 {$I-}
  Reset(FJournal);
 {$I+}
  If Ioresult=0 Then
    Begin
      While Not Eof(FJournal) Do
        Begin
          Read(FJournal,tmpEcriture);
          With tmpEcriture Do
            Begin
              Writeln(DateEcriture.Day:2 ,'/',DateEcriture.Month:2,'/',DateEcriture.Year:4,
                      '         ',LibelleEcriture);
              Writeln(DBCompte:7,'           ', fnlookUpForAccount(DBCompte,FPlan),
              '                           ',MntDebit: 10: 3);
              Writeln('           ',CRCompte:7,'                   ',fnlookUpForAccount(CRCompte,
                      FPlan),'             ',MntCredit: 10: 3);
            End;
        End;
    End
  Else Writeln('Probleme Fichier : ', Ioresult);
  Close(FJournal);
End;
 (* ------------------------------------------- prExtraitCompte ------------------------------*)

Procedure prExtraitCompte(Var FJournal:TFJournal;Var FPlan:TFPLan; var extrait:Text);
var
	code:Integer;
	tmpecriture:tecriture;
Begin
  Clrscr;
  writeln('E X T R A I T    D E    C O M P T E');
	GoToXY(10,4);Write('CODE: ');
	GoTOXY(17,4);Read(code);
	if fnlookupforaccount(code,fplan)<>'Compte n''existe pas. Veillez l''ajouter' then
		Begin
			{$I-}
				reset(fjournal);
			{$I+}
			if Ioresult<>0 then
				writeln('Probleme de fichier Erreur Num: ',ioresult)
			else
				Begin
					rewrite(extrait);
					WriteLn(extrait,'<!DOCTYPE html><body> <table><thead><span>',code,'</span><span>',fnlookupforaccount(code,fplan),'</span></thead><tbody>');
					While not EOF(fjournal) do
					begin
						read(fjournal,tmpecriture);
						if (tmpecriture.dbcompte =code) or (tmpecriture.crcompte=code) then
							begin
								write(extrait,'<tr><td>',tmpecriture.dateecriture.day:2,'/',tmpecriture.dateecriture.Month:2,'/',tmpecriture.dateecriture.Year:4,'</td><td>',tmpecriture.LibelleEcriture,'</td>');
								If tmpEcriture.DbCompte=Code Then
									Writeln(extrait,'<td>',TmpEcriture.MNTDebit:10:3,'</td><td></td>')
								Else
									Writeln(extrait,'<td></td><td>',TmpEcriture.MNTCredit:10:3,'</td>')
							end;
					end;
					Writeln(extrait,'</tr></tbody></table></body></html>');
					Close(extrait);
				end
		End
	Else
		writeln('Compte n"existe pas');
	Close(Fjournal);
End;
	
Var
  ChMenu: 1..5;
  quit: Boolean;
Begin
  Clrscr;
  Gotoxy(30,2);
  Writeln('Journal comptable');
  Gotoxy(20,6);
  Writeln('1 : Saisie Piece Comptable.');
  Gotoxy(20,8);
  Writeln('2 : Liste des Pieces Comptable.');
  Gotoxy(20,10);
  Writeln('3 : Modifier Piece Comptable.');
  Gotoxy(20,12);
  Writeln('4 : Extrait de Compte.');
  Gotoxy(20,14);
  Writeln('5 : Retour Menu Principal');
  Gotoxy(15,23);
  Write('Votre Choix:');
  Repeat
    Readln(ChMenu);
  Until (ChMenu In [1..5]);
  Case ChMenu Of
    1: prSaisePiece(FJournal,FPlan);
    2: prListerPiece(FJournal,FPlan);
    3: prModifierPiece(FJournal,FPlan);
    4: prExtraitCompte(FJournal,FPlan,extrait);
    5: quit := True;
  End;
End;
(**************Main Program***************)
Begin
	Assign(extrait,'extrait.html');
  Assign(FP,'PlanComptable.dat');
  Assign(FJournal,'Journal.dat');
  Exit := False;
  Repeat
(*Main Loop*)
    Clrscr;
    Gotoxy(32,2);
    Write('Comptabilite');
    Gotoxy(20,6);
    Write('1: Gestion plan comptable.');
    Gotoxy(20,8);
    Write('2: Gestion des ecritures.');
    Gotoxy(20,10);
    Write('3: Quit.');
    Repeat
      Gotoxy(23,14);
      Write('Veillez Choisir  [ 1 , 2 , 3 ] :');
      Read(Choix);
    Until choix In [1..3];
    Case Choix Of
      1 : prGestionPC(FP);
      2 : prGestionJournal(FJournal,FP,extrait);
      3 : Clrscr;
    End;
    Repeat
      Gotoxy(23,23);
      Write('Voullez vous quitter? [ O / N]   :');
      Read(Res);
    Until (Upcase(Res) In ['O','N']);
    If Upcase(Res)='O' Then
      Exit := True;
  Until (Exit);
End.
