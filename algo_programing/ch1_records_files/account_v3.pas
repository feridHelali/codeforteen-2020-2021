<<<<<<< HEAD
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
	
 (* fnFormatString this functon format a string with a givin size*)
function fnFormatString(vStr:String;strln:Integer):String;
var extentionStr:String;
    i:1..255;
Begin
  if Length(vStr) >= strln Then
	      fnFormatString:=Copy(vStr,1,strln)
	Else
	      extentionStr:='';
	      for i:=Length(vStr) to strln do
				Begin
				   extentionStr:=extentionStr+' ';
				end;
	      fnFormatString:=Copy(vStr,1,strln)+extentionStr;
end;

 (* fnDateToString this functon format a TDate record to string*)
function fnDateToString(dt:TDate):String;
var day,month,year:String;
Begin
  str(dt.Day,day);
	str(dt.Month,month);
  str(dt.Year,year);
	fnDateToString:=Concat(day,'/',month,'/',year);
end;

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
	 			If IOResult<>0 Then Rewrite(FP); 
	    	while not EOF(FP) do read(FP,tmp); (* Atteindre fin de Fichier *)
				(*
				   you can replace the line above With
					 seek(FP,FileSize(FP));
					 Or
					 SeekEof(FP);
				*)
	    	Write(FP,TmpCompte);
	 End;
	Close(FP);
	End;

	Procedure prAfficherComptes(Var FP:TFPlan);
  var TmpCompte:TCompte;
	cde:string;
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
				str(TmpCompte.Code,cde);
				writeln('| ',fnFormatString(cde,24),' | ',fnFormatString(TmpCompte.Libelle,47),'|');
				writeln('-------------------------------------------------------------------------------');
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
	  Gotoxy(15,25); Write('Votre Choix:');
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
	var    tmpEcriture,tmp:TEcriture;
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
	    Gotoxy(23,25);
	    Write('Voullez vous enregistrer cette piece (O/N) ');Read(Rep);
	  Until (Upcase(Rep) In ['O','N']);
	  If Upcase(Rep)='O' Then
	  Begin
	 			{$I-}
	      Reset(FJournal);
	 			{$I+}
	 			If IOResult<>0 Then Rewrite(FJournal); 
	    	while not EOF(FJournal) do read(FJournal,tmp);
				(*
				   Atteindre fin de Fichier 
				   you can replace the line above With
					 seek(FJournal,FileSize(FJournal));
					 Or
					 SeekEof(FJournal)
				*)
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
	    currentFileSize:LongInt;
			compteDebit,compteCredit:string;
	begin
	 ClrScr;
    {$I-}
		Reset(FJournal);
		{$I+}
	  if IOResult=0 then
		Begin
		  currentFileSize:=FileSize(FJournal);
		  Gotoxy(10,2);Writeln('           J O U R N A L    C O M P T A B L E            ');
			Writeln('Taille de Fichier',currentFileSize);
		  writeln('===============================================================================');
		  writeln('| #  Date | Cpt Debit | CptCredit | Libelle                  | Debit   |Credit|');
		  writeln('===============================================================================');
			while Not Eof(FJournal) Do
			Begin
				Read(FJournal,tmpEcriture);
				with tmpEcriture do
				begin
						write(FilePos(FJournal):3, ' ');
						write(fnFormatString(fnDateToString(DateEcriture),10));
						writeln('            ',fnFormatString(LibelleEcriture,40));
						str(DBCompte,compteDebit);
						write('             ',fnFormatString(compteDebit,10));
						write('           ');
					  write(fnFormatString(fnlookUpForAccount(DBCompte,FPlan),25));
						writeln(MntDebit:10:3);
						write('                         ');
						str(CRCompte,compteCredit);
						write(fnFormatString(compteCredit,10));
						write('   ');
						write(fnFormatString(fnlookUpForAccount(CRCompte,FPlan),25));
						writeln('     ',MntCredit:10:3);
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


 
  Procedure prSupprimerEcriture(Var FJournal:TFJournal;Var FPlan:TFPLan);
	var currentFileSize, position:LongInt;
	    tmpEcriture:TEcriture;
			bufferEcriture,newBuffer:Array[1..1000] of TEcriture;
		  indice,i:0..1000;
		  nbEcritures:0..1000;
		  ecritureExist:boolean;

	Begin
	  ClrScr;
    {$I-}
		Reset(FJournal);
		{$I+}
	  if IOResult=0 then
		 Begin
		   currentFileSize:=FileSize(FJournal);
		   Gotoxy(10,2);Writeln('           S U P P R E S S I O N    E C R I T U R E             ');
			 Writeln('Nobre d''ecritures :',currentFileSize:5);
			 Write('Numero d''ecriture a supprimer :');
			 Readln(position);
			 i:=0;
			 while not Eof(FJournal) do
			  Begin
				  i:=i+1;
					read(FJournal,tmpEcriture);
					bufferEcriture[i]:= tmpEcriture;
				end;
				nbEcritures:=i;
				for indice:=1 to nbEcritures do
				Begin
					if indice<>position then newBuffer[indice]:=bufferEcriture[indice];
				end;
				(* rewrite the Buffer again*)
		    Gotoxy(20,8);Write('Ecriture Numero: ',position, ' est supprimer.');
				ReWrite(FJournal);
				for indice:=1 to nbEcritures-1
			  Do
					  Write(FJournal,newBuffer[indice]);
				
		 end
		Else
		  Writeln('File Error Numero:',IOResult);


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
		Gotoxy(20,14); Writeln('5 : Supprimer Ecriture.');
		Gotoxy(20,16); Writeln('6 : Retour Menu Principal');
	  Gotoxy(15,25); Write('Votre Choix:');
	  Repeat
	    Readln(ChMenu);
		Until (ChMenu In [1..5]);
	  Case ChMenu Of
	    1: prSaisePiece(FJournal,FPlan);
	    2: prListerPiece(FJournal,FPlan);
			3: prModifierPiece(FJournal,FPlan);
			4: prExtraitCompte(FJournal,FPlan);
			5: prSupprimerEcriture(FJournal,FPlan);
			6: quit:= true;
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
			GotoXY(23,25); Write('Veillez Choisir  [ 1 , 2 , 3 ] :');Read(Choix);
		until  choix in [1..3];
			Case Choix Of
	      1 : prGestionPC(FP);
	      2 : prGestionJournal(FJournal,FP);
				3 : ClrScr;
			end;

    Repeat
      GotoXY(23,25);Write('Voullez vous quitter? [ O / N]   :'); Read(Res);
    Until (Upcase(Res) In ['O','N']);
    If Upcase(Res)='O' Then
      Exit := True;
  Until (Exit);
=======
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
    extrait:Text;
 (* fnFormatString this functon format a string with a givin size*)
function fnFormatString(vStr:String;strln:Integer):String;
var extentionStr:String;
    i:1..255;
Begin
  if Length(vStr) >= strln Then
	      fnFormatString:=Copy(vStr,1,strln)
	Else
	      extentionStr:='';
	      for i:=Length(vStr) to strln do
				Begin
				   extentionStr:=extentionStr+' ';
				end;
	      fnFormatString:=Copy(vStr,1,strln)+extentionStr;
end;

 (* fnDateToString this functon format a TDate record to string*)
function fnDateToString(dt:TDate):String;
var day,month,year:String;
Begin
  str(dt.Day,day);
	str(dt.Month,month);
  str(dt.Year,year);
	fnDateToString:=Concat(day,'/',month,'/',year);
end;

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
	 			If IOResult<>0 Then Rewrite(FP); 

	    	while not EOF(FP) do read(FP,tmp); (* Atteindre fin de Fichier *)
				(*
				   you can replace the line above With
					 seek(FP,FileSize(FP));
				*)
	    	Write(FP,TmpCompte);
	 End;
	Close(FP);
	End;

	Procedure prAfficherComptes(Var FP:TFPlan);
  var TmpCompte:TCompte;
	cde:string;
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
				str(TmpCompte.Code,cde);
				writeln('| ',fnFormatString(cde,24),' | ',fnFormatString(TmpCompte.Libelle,47),'|');
				writeln('-------------------------------------------------------------------------------');
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
	  Gotoxy(15,25); Write('Votre Choix:');
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
	var    tmpEcriture,tmp:TEcriture;
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
					GotoXY(37,4);Readln(Year);
				end;
				GotoXY(31,5);Readln(tmpEcriture.LibelleEcriture);
				GotoXY(31,6);Readln(tmpEcriture.DBCompte);
				GotoXY(38,6);Write(fnlookUpForAccount(tmpEcriture.DBCompte,FPlan));
				GotoXY(31,7);Readln(tmpEcriture.MntDebit);
				GotoXY(31,8);Readln(tmpEcriture.CrCompte);
				GotoXY(38,8);Write(fnlookUpForAccount(tmpEcriture.CrCompte,FPlan));
				GotoXY(31,9);Readln(tmpEcriture.MntCredit);
	  Repeat
	    Gotoxy(23,25);
	    Write('Voullez vous enregistrer cette piece (O/N) ');Read(Rep);
	  Until (Upcase(Rep) In ['O','N']);
	  If Upcase(Rep)='O' Then
	  Begin
	 			{$I-}
	      Reset(FJournal);
	 			{$I+}
	 			If IOResult<>0 Then Rewrite(FJournal); 
	    	while not EOF(FJournal) do read(FJournal,tmp);
				(*
				   Atteindre fin de Fichier 
				   you can replace the line above With
					 seek(FJournal,FileSize(FJournal));
					 Or
					 SeekEof(FJournal)
				*)
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
	    currentFileSize:LongInt;
			compteDebit,compteCredit:string;
	begin
	 ClrScr;
    {$I-}
		Reset(FJournal);
		{$I+}
	  if IOResult=0 then
		Begin
		  currentFileSize:=FileSize(FJournal);
		  Gotoxy(10,2);Writeln('           J O U R N A L    C O M P T A B L E            ');
			Writeln('Taille de Fichier',currentFileSize);
		  writeln('===============================================================================');
		  writeln('| #  Date | Cpt Debit | CptCredit | Libelle                  | Debit   |Credit|');
		  writeln('===============================================================================');
			while Not Eof(FJournal) Do
			Begin
				Read(FJournal,tmpEcriture);
				with tmpEcriture do
				begin
						write(FilePos(FJournal):3, ' ');
						write(fnFormatString(fnDateToString(DateEcriture),10));
						writeln('            ',fnFormatString(LibelleEcriture,40));
						str(DBCompte,compteDebit);
						write('             ',fnFormatString(compteDebit,10));
						write('           ');
					  write(fnFormatString(fnlookUpForAccount(DBCompte,FPlan),25));
						writeln(MntDebit:10:3);
						write('                         ');
						str(CRCompte,compteCredit);
						write(fnFormatString(compteCredit,10));
						write('   ');
						write(fnFormatString(fnlookUpForAccount(CRCompte,FPlan),25));
						writeln('     ',MntCredit:10:3);
				end;
			end;
		End
		Else Writeln('Probleme Fichier : ', IOResult);
		Close(FJournal);
		
	end;
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

Procedure prExportToCSV(Var FJournal:TFJournal;Var FPlan:TFPLan);
var
	code:Integer;
	tmpecriture:tEcriture;
	vCSV:Text;
	strCode:String;
	SDebit,SCredit:Real;
Begin
  Clrscr;
  writeln('E X P O R T  V E R S  C S V');
	GoToXY(10,4);Write('CODE: ');
	GoTOXY(17,4);Read(code);
	if fnlookupforaccount(code,fplan)<>'Compte n''existe pas. Veillez l''ajouter' then
    Begin
    	str(Code,strCode);
    	Assign(vCSV,strCode+fnlookupforaccount(code,fplan)+'.csv');
        {$I-}
            ReSet(fjournal);
		{$I+}
		if Ioresult<>0 then
			writeln('Probleme de fichier Erreur Num: ',ioresult)
		else
		Begin
			ReWrite(vCSV);
			WriteLn(vCSV,'Date;Libelle;Mnt_Debit;Mnt_Credit');
            SDebit:=0;
            SCredit:=0;
			While Not(EOF(fjournal)) Do
			Begin
                Read(FJournal,tmpEcriture);
                if (tmpEcriture.DBCompte =code) or (tmpEcriture.CRCompte=code) then
                Begin
                	with tmpEcriture Do
                	Begin
                		If DBCompte=Code Then
                		Begin
                            Writeln(vCSV,fnDateToString(DateEcriture),';',LibelleEcriture,';',MntDebit:7:3,';','');
                            SDebit:=SDebit+MntDebit;
                        End
                        Else
                        Begin
                            Writeln(vCSV,fnDateToString(DateEcriture),';',LibelleEcriture,';','',';',MntCredit:7:3);
                            SCredit:=SCredit+MntCredit;
                        End;
                    End;
                End;
			End;
			Writeln(vCSV,'',';','',';',SDebit:7:3,';',SCredit:7:3);
			Close(vCSV);
        End;
    End;
    Close(fJournal);
End;
  Procedure prSupprimerEcriture(Var FJournal:TFJournal;Var FPlan:TFPLan);
	var currentFileSize, position:LongInt;
	    tmpEcriture:TEcriture;
			bufferEcriture,newBuffer:Array[1..1000] of TEcriture;
		  indice,i:0..1000;
		  nbEcritures:0..1000;
		  ecritureExist:boolean;

	Begin
	  ClrScr;
    {$I-}
		Reset(FJournal);
		{$I+}
	  if IOResult=0 then
		 Begin
		   currentFileSize:=FileSize(FJournal);
		   Gotoxy(10,2);Writeln('           S U P P R E S S I O N    E C R I T U R E             ');
			 Writeln('Nobre d''ecritures :',currentFileSize:5);
			 Write('Numero d''ecriture a supprimer :');
			 Readln(position);
			 i:=0;
			 while not Eof(FJournal) do
			  Begin
				  i:=i+1;
					read(FJournal,tmpEcriture);
					bufferEcriture[i]:= tmpEcriture;
				end;
				nbEcritures:=i;
				for indice:=1 to nbEcritures do
				Begin
					if indice<>position then newBuffer[indice]:=bufferEcriture[indice];
				end;
				(* rewrite the Buffer again*)
		    Gotoxy(20,8);Write('Ecriture Numero: ',position, ' est supprimer.');
				ReWrite(FJournal);
				for indice:=1 to nbEcritures-1
			  Do
					  Write(FJournal,newBuffer[indice]);
				
		 end
		Else
		  Writeln('File Error Numero:',IOResult);


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
		Gotoxy(20,14); Writeln('5 : Supprimer Ecriture.');
		Gotoxy(20,16); Writeln('6 : Export To CSV');
		Gotoxy(20,18); Writeln('7 : Retour Au Menu Principal');
	  Gotoxy(15,25); Write('Votre Choix:');
	  Repeat
	    Readln(ChMenu);
		Until (ChMenu In [1..7]);
	  Case ChMenu Of
	    1: prSaisePiece(FJournal,FPlan);
	    2: prListerPiece(FJournal,FPlan);
			3: prModifierPiece(FJournal,FPlan);
			4: prExtraitCompte(FJournal,FPlan,extrait);
			5: prSupprimerEcriture(FJournal,FPlan);
            6:prExportToCSV(FJournal,FPlan);
			7: quit:= true;
	  End;

End;




(*Main Program*)
Begin
  	Assign(extrait,'extrait.html');
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
			GotoXY(23,25); Write('Veillez Choisir  [ 1 , 2 , 3 ] :');Read(Choix);
		until  choix in [1..3];
			Case Choix Of
	      1 : prGestionPC(FP);
	      2 : prGestionJournal(FJournal,FP);
				3 : ClrScr;
			end;

    Repeat
      GotoXY(23,25);Write('Voullez vous quitter? [ O / N]   :'); Read(Res);
    Until (Upcase(Res) In ['O','N']);
    If Upcase(Res)='O' Then
      Exit := True;
  Until (Exit);
>>>>>>> 839a7f4323a0dbc435eaf7a7686e7e8cab9fcaf5
End.