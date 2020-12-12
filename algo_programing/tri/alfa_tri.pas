program SplitDemo;

{$mode fpc}

{uses ; tout est dans l'unité System!!}

Type TArrayStr = Array Of string;

function SplitString(Text: String; Delimiter : char): TArrayStr;
var
   intIdx: Integer;
   intIdxOutput: Integer;
   // en $MODE fpc, Result n'est pas reconnu comme mot réservé
   Result: TArrayStr;  // Result est ici une variable locale ordinaire
begin
   intIdxOutput := 0;
   SetLength(Result, 1);
   Result[intIdxOutput] := '';
   for intIdx := 1 to Length(Text) do
   begin
      if Text[intIdx] = Delimiter then
      begin
         intIdxOutput := intIdxOutput + 1;
         SetLength(Result, Length(Result) + 1);
      end
      else
         Result[intIdxOutput] := Result[intIdxOutput] + Text[intIdx];
   end;
    // affecte la valeur de Result au résultat de la fonction
   SplitString := Result
end;

Var Strlst: TArrayStr;
    I : Integer;
    Txt: String;

begin
  WriteLn('Bonjour!');
  Write('Saisissez un texte (separateur : '';'' : ');
  ReadLn(Txt);
  Strlst := SplitString(Txt, ';');
  For I := 0 To Length(Strlst) -1 Do WriteLn(I+1,' = ', Strlst[I]);
  Readln
end.