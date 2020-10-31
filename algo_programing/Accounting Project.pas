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
  Choix : 1..2;
  FP: TFPlan;
	FJournal:TFJournal;
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
	  Gotoxy(20,4);Writeln('Code      :');
	  Gotoxy(20,6);Writeln('Libele    :');
	  Gotoxy(40,4);Readln(TmpCompte.Code);
	  Gotoxy(40,6);Readln(TmpCompte.Libelle);
	  Repeat
	    Gotoxy(23,10);
	    Write('Voullez vous enregistrer ce compte (O/N)');Read(Rep);
	  Until (Upcase(Rep) In ['O','N']);

	  If Upcase(Rep)='O' Then
	  Begin
	 			{$I-}
	      Reset(FP);
	 			{$I+}
	 			If IOResult<>0 Then Rewrite(FP); (* Atteindre fin de Fichier *)
	    	while not EOF(FP) do read(FP,tmp);
	    	Write(FP,TmpCompte);
	 End;
	Close(FP);
	End;

	Procedure prAfficherComptes(Var FP:TFPlan);
  var TmpCompte:TCompte;
	Begin
		ClrScr;
		GotoXY(32,1);Writeln('PLAN COMTABLE');
		writeln('===============================================================================');
		writeln('=      Code Compte          |              Libelle Compte                     =');
		writeln('===============================================================================');

    {$I-}
		Reset(FP);
		{$I+}
	  if IOResult=0 then
		Begin
			while Not Eof(FP) Do
			Begin
				Read(FP,TmpCompte);
				writeln('=     ',TmpCompte.Code,'      |          ',TmpCompte.Libelle,'               =');
				writeln('------------------------------------------------------------------------------');
			end;
		End
		Else Writeln('Probleme Fichier : ', IOResult);
		Close(FP);
	end;

  (* ------------------------------------------- prMAJCompte ------------------------------*)
  Procedure prMAJCompte(Var FP:TFPlan);
	Var
	  bufferComptes:TPlanComptable;
	  tmp: TCompte;
	  code: integer;
		indice:0..1000;
		nbComptes:0..1000;
		oldLibelle,newLibelle:string[50];
		accountExist:boolean;
	Begin
		Clrscr;
		Gotoxy(32,4);Write('MISE A JOURS COMPTE');
	  Gotoxy(20,6);Write('Code      :');Readln(code);
		{$I-}
		Reset(FP);
		{$I+}
	  if IOResult=0 then
			Begin
			  indice:=0;
				nbComptes:=0;
				while Not Eof(FP) Do
				Begin
				  indice:=indice+1;
					Read(FP,tmp);
					bufferComptes[indice]:=tmp;
				end;
				
				nbComptes:=indice;
				indice:=0;
				accountExist:=False;
				
				while indice<nbComptes Do
				Begin
				  indice:=indice+1;
					if bufferComptes[indice].code=code
							then
							  begin
									oldLibelle:=bufferComptes[indice].libelle;
							    accountExist:=true;
								end;
				end;
	
	      if  accountExist=true  then
				begin
						Gotoxy(20,8);Write('Ancienne Libelle    :',oldLibelle);
						Gotoxy(20,10);Write('Nouvelle Libelle    :');Read(newLibelle);
						indice:=0;
						while indice<nbComptes Do
						Begin
						  indice:=indice+1;
							if(bufferComptes[indice].code=code) then bufferComptes[indice].libelle:=newLibelle;
						end;
			
						ReWrite(FP);
						for indice:=1 to nbComptes Do
							  Write(FP,bufferComptes[indice]);
			   End
				 Else begin Gotoxy(20,20);Writeln('Compte du code ',code, ' est introuvable.'); end;
			End
		Else Writeln('Probleme Fichier : ', IOResult);
		Close(FP);
	end;


  (* ------------------------------------------- prSupprimerCompte ------------------------------*)
	 Procedure prSupprimerCompte(Var FP:TFPlan);
	Var
	  bufferComptes,newBuffer:TPlanComptable;
	  tmp: TCompte;
	  code: integer;
		indice,i:0..1000;
		nbComptes:0..1000;
		accountExist:boolean;
	Begin
		Clrscr;
		Gotoxy(32,4);Write('SUPPRESSION COMPTE');
	  Gotoxy(20,6);Write('Code      :');Readln(code);
		{$I-}
		Reset(FP);
		{$I+}
	  if IOResult=0 then
		Begin
		    indice:=0;
				nbComptes:=0;
				while Not Eof(FP) Do
				Begin
				  indice:=indice+1;
					Read(FP,tmp);
					bufferComptes[indice]:=tmp;
				end;
				
				nbComptes:=indice;
				accountExist:=False;
			  i:=1;
				
				for indice:=1 to nbComptes Do
				Begin
					if bufferComptes[indice].code<>code
					then
					  begin
						  newBuffer[i]:=bufferComptes[indice];
							i:=i+1;
						end
					Else
					    accountExist:=true;
				end;

	      if  accountExist=true  then
				begin
						Gotoxy(20,8);Write('Compte ',code, ' est supprimer.');
						ReWrite(FP);
						for indice:=1 to i-1
					  Do
							  Write(FP,newBuffer[indice]);
			   End
				 Else begin Gotoxy(20,20);Writeln('Compte du code ',code, ' est introuvable.'); end;
		End
		Else Writeln('Probleme Fichier : ', IOResult);
		Close(FP);
	end;
		

Var
  ChMenu: 1..5;
	quit:Boolean;
Begin
	  Clrscr;
	  Gotoxy(30,2);  Writeln('Gestion plan comptable');
	  Gotoxy(20,6);  Writeln('1 : Ajoutez des comptes.');
	  Gotoxy(20,8);  Writeln('2 : Affichez la liste des comptes.');
	  Gotoxy(20,10); Writeln('3 : Mettre a jour un compte.');
	  Gotoxy(20,12); Writeln('4 : Supprimez un compte.');
		Gotoxy(20,14); Writeln('5 : Retour Menu Principal');
	  Gotoxy(15,23); Write('Votre Choix:');
	  Repeat
	    Readln(ChMenu);
		Until (ChMenu In [1..5]);
	  Case ChMenu Of
	    1: prSaisieCompte(FP);
	    2: prAfficherComptes(FP);
			3: prMAJCompte(FP);
			4: prSupprimerCompte(FP);
			5: quit:= true;
	  End;
End;



(* ============   Gestion Journal    ====================*)
Procedure prGestionJournal(Var FJournal:TFJournal;var FPlan:TFPLan);
		(* ------------------------------------------- prSaisiePiece ------------------------------*)
	function fnlookUpForAccount(code:integer;var FPlan:TFPLan):String;
	var tmpCompte:TCompte;
	    compteExiste: boolean;
	Begin
		 {$I-}
	      Reset(FPlan);
	 	 {$I+}
		 if IOResult = 0 Then
		 Begin
		   compteExiste:=false;
			 While not Eof(FPlan) Do
			 Begin
			 		Read(Fplan,tmpCompte);
					if (tmpCompte.Code = code) then
					     begin
							  fnLookUpForAccount:=tmpCompte.Libelle;
								compteExiste:=true;
							 end
			 end;
		 End;
     if Not compteExiste then 
     				fnLookUpForAccount:='Compte n''existe pas. Veillez l''ajouter';
		 close(FPlan);
	end;

 (* ------------------------------------------- prSaisiePiece ------------------------------*)
	Procedure prSaisePiece(Var FJournal:TFJournal;var FPlan:TFPLan);
	var    tmpEcriture:TEcriture;
				 Rep:Char;
		 Begin
		  	Clrscr;
				Gotoxy(10,2);Writeln('          S A I S I E    P I E C E  C O M P T A B L E            ');
	  		Gotoxy(10,4);Writeln('Date de la piece   : __/__/____');
	  		Gotoxy(10,5);Writeln('Libelle Ecriture   : ________________________________________________');
				Gotoxy(10,6);Writeln('Compte a Debiter   : ____');
				Gotoxy(10,7);Writeln('Montant a Debiter  : ___________');
				Gotoxy(10,8);Writeln('Compte a crediter  : ____');
				Gotoxy(10,9);Writeln('Montant a crediter : ___________');

				with tmpEcriture.DateEcriture do  Begin
					GotoXY(31,4);Readln(Day);
					GotoXY(34,4);Readln(Month);
					GotoXY(37,4);Readln(Day);
				end;
				GotoXY(31,5);Readln(tmpEcriture.LibelleEcriture);
				GotoXY(31,6);Readln(tmpEcriture.DBCompte);
				GotoXY(38,6);Write(fnlookUpForAccount(tmpEcriture.DBCompte,FPlan));
				GotoXY(31,7);Readln(tmpEcriture.MntDebit);
				GotoXY(31,8);Readln(tmpEcriture.CrCompte);
				GotoXY(38,8);Write(fnlookUpForAccount(tmpEcriture.CrCompte,FPlan));
				GotoXY(31,9);Readln(tmpEcriture.MntCredit);
	  Repeat
	    Gotoxy(23,20);
	    Write('Voullez vous enregistrer cette piece (O/N) ');Read(Rep);
	  Until (Upcase(Rep) In ['O','N']);
	  If Upcase(Rep)='O' Then
	  Begin
	 			{$I-}
	      Reset(FJournal);
	 			{$I+}
	 			If IOResult<>0 Then Rewrite(FJournal); (* Atteindre fin de Fichier *)
	    	while not EOF(FJournal) do read(FJournal,tmpEcriture);
	    	Write(FJournal,TmpEcriture);
				Close(FJournal);
	 	End;
		
	end;

	(* ------------------------------------------- prModifierPiece ------------------------------*)
	Procedure prModifierPiece(Var FJournal:TFJournal;var FPlan:TFPLan);
	begin
	  WriteLn('prModifierPiece not yet implemented');

	end;

	(* ------------------------------------------- prListerPieces ------------------------------*)
	Procedure prListerPiece(Var FJournal:TFJournal;var FPlan:TFPLan);
	var tmpEcriture:TEcriture;
	begin
	 ClrScr;
		Gotoxy(10,2);Writeln('          JOURNAL  C O M P T A B L E            ');
			GotoXY(32,1);Writeln('PLAN COMTABLE');
		writeln('===============================================================================');
		writeln('|   Date | Cpt Debit | CptCredit | Libelle                   | Debit   |Credit|');
		writeln('===============================================================================');
    {$I-}
		Reset(FJournal);
		{$I+}
	  if IOResult=0 then
		Begin
			while Not Eof(FJournal) Do
			Begin
				Read(FJournal,tmpEcriture);
				with tmpEcriture do
				begin
						writeln(DateEcriture.Day:2 ,'/',DateEcriture.Month:2,'/',DateEcriture.Year:4,'         ',LibelleEcriture);
						writeln(DBCompte:7,'           ', fnlookUpForAccount(DBCompte,FPlan),'                           ',MntDebit:10:3);
						writeln('           ',CRCompte:7,'                   ',fnlookUpForAccount(CRCompte,FPlan),'             ',MntCredit:10:3);
				end;
			end;
		End
		Else Writeln('Probleme Fichier : ', IOResult);
		Close(FJournal);
		
	end;

		(* ------------------------------------------- prExtraitCompte ------------------------------*)
	Procedure prExtraitCompte(Var FJournal:TFJournal;var FPlan:TFPLan);
	begin
	 ClrScr;
		WriteLn('prExtraitCompte not yet implemented');
	end;


Var
 ChMenu: 1..5;
	quit:Boolean;

Begin
	  Clrscr;
	  Gotoxy(30,2);  Writeln('Journal comptable');
	  Gotoxy(20,6);  Writeln('1 : Saisie Piece Comptable.');
	  Gotoxy(20,8);  Writeln('2 : Liste des Pieces Comptable.');
	  Gotoxy(20,10); Writeln('3 : Modifier Piece Comptable.');
	  Gotoxy(20,12); Writeln('4 : Extrait de Compte.');
		Gotoxy(20,14); Writeln('5 : Retour Menu Principal');
	  Gotoxy(15,23); Write('Votre Choix:');
	  Repeat
	    Readln(ChMenu);
		Until (ChMenu In [1..5]);
	  Case ChMenu Of
	    1: prSaisePiece(FJournal,FPlan);
	    2: prListerPiece(FJournal,FPlan);
			3: prModifierPiece(FJournal,FPlan);
			4: prExtraitCompte(FJournal,FPlan);
			5: quit:= true;
	  End;

End;




(*Main Program*)
Begin
  Assign(FP,'PlanComptable.dat');
	Assign(FJournal,'Journal.dat');
  Exit := False;
  Repeat
(*Main Loop*)
    Clrscr;
    Gotoxy(32,2); Write('Comptabilite');
    Gotoxy(20,6); Write('1: Gestion plan comptable.');
    Gotoxy(20,8); Write('2: Gestion des ecritures.');
		Gotoxy(20,10);Write('3: Quit.');

		Repeat
			GotoXY(23,14); Write('Veillez Choisir  [ 1 , 2 , 3 ] :');Read(Choix);
		until  choix in [1..3];
			Case Choix Of
	      1 : prGestionPC(FP);
	      2 : prGestionJournal(FJournal,FP);
				3 : ClrScr;
			end;

    Repeat
      GotoXY(23,23);Write('Voullez vous quitter? [ O / N]   :'); Read(Res);
    Until (Upcase(Res) In ['O','N']);
    If Upcase(Res)='O' Then
      Exit := True;
  Until (Exit);
End.