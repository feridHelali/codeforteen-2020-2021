Program Accounting;
Uses Wincrt,Crt,dos;
Type
  TCompte = Record
    Code : Integer;
    Libele : String[50];
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
    LibeleEcritre : String[255];
    MntDebit,MntCredit : Real;
  End;
  TPlanComptable = Array [1..500] Of TCompte;
  TJournal = Array [1..1000] Of TEcriture;
  TFPLan = File Of TCompte;
  TFJournal = File Of TEcriture;
Var
  Choix : 1..2;
  FP: TFPlan;
  Exit: Boolean;
  Res: Char;
(*Gestion Plan Comptable*)

Procedure prGestionPC;

Procedure prSaisie(Var FP:TFPlan);
Var
  vCode: Integer;
  vLibele: String[50];
  TmpCompte: TCompte;
  Rep: Char;
Begin
  Clrscr;
  Gotoxy(20,4);
  Writeln('Code      :');
  Gotoxy(20,6);
  Writeln('Libele    :');
  Gotoxy(40,4);
  Readln(vCode);
  Gotoxy(40,6);
  Readln(vLibele);
  With TmpCompte Do
    Begin
      Code := vCode;
      Libele := vLibele;
    End;
  Repeat
    Gotoxy(23,10);
    Writeln('Voullez vous enregistrer ce compte (O/N)');
    Readln(Rep);
  Until (Upcase(Rep) In ['O','N']);
  If Upcase(Rep)='O' Then
    Begin
 {$I-}
      Reset(FP);
 {$I+}
      If Ioresult<>0 Then
        Begin
          Rewrite(FP);
        End;
      While (Not(Eof(FP))) Do
        Read;
      Write(FP,TmpCompte);
    End;
  Close(FP);
End;
Var
  ChMenu: 1..4;
Begin
  Clrscr;
  Gotoxy(30,2);
  Writeln('Gestion plan comptable');
  Gotoxy(20,6);
  Writeln('1: Ajoutez des comptes.');
  Gotoxy(20,8);
  Writeln('2: Affichez la liste des comptes.');
  Gotoxy(20,10);
  Writeln('3: Mettre a jour un compte.');
  Gotoxy(20,12);
  Writeln('4: Supprimez un compte.');
  Gotoxy(15,23);
  Writeln('Votre Choix:');
  Repeat
    Readln(ChMenu);
  Until (ChMenu In [1..4]);
  Case ChMenu Of
    1: prSaisie(FP);
    2..4: Writeln('Under Construction')
  End;
End;
(*Gestion Journal*)

Procedure prGestionJournal;
Begin
End;
(*Main Program*)
Begin
  Assign(FP,'PlanComptable.dat');
  Exit := False;
  Repeat
(*Main Loop*)
    Clrscr;
    Gotoxy(32,2);
    Writeln('Comptabilite');
    Writeln('1: Gestion plan comptable.');
    Writeln('2: Gestion des ecritures.');
    Readln(Choix);
    Case Choix Of
      1 : prGestionPC;
      2 : prGestionJournal
    End;
    Writeln('5raj');
    Repeat
      Writeln('Voullez vous quitter? (O/N)');
      Readln(Res);
    Until (Upcase(Res) In ['O','N']);
    If Upcase(Res)='O' Then
      Exit := True;
  Until (Exit);
End.
