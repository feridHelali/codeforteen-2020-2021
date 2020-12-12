Program Trim2;

Uses WinCrt,Crt,dos;

Var
    str1,str2:String;

Procedure prTrim(Var vString:String);
Var
    i:Integer;
Begin
	While Pos('  ',vString)>0 Do
	Begin
        Delete(vString,Pos('  ',vString)+1,1);
	End;
	While Pos(' .',vString)>0 Do
	Begin
        Delete(vString,Pos(' .',vString),1);
	End;
End;

Function fnWordCount(vString:String):Integer;
Var
    Words,i:Integer;
Begin
	Words:=0;
	For i:=1 to Length(vString) Do
	Begin
		If vString[i]=#32 Then 
            Words:=Words+1;
    End;
    fnWordCount:=Words;    
End;

(*Main Program*)
Begin
	str1:='         Ali va       a l''ecole  .  Le temps fait beau      .';
    str2:='Ali va       a l''ecole  .  Le temps fait beau      .  ';
    Writeln('Str1=',Str1);
    prTrim(str1);
    WriteLn('Str1 Trimmed=',str1);
    Writeln('Number of words in str1:',fnWordCount(str1));
    WriteLn('Str2=',Str2);
    prTrim(str2);
    WriteLn('Str2 Trimmed=',str2);
    WriteLn('Number of words in str2:',fnWordCount(str2));
    Readkey;
End.