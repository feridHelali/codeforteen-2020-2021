Program Trim;

Uses WinCrt,Crt,dos;

Var
    stringtoTrim,str1,str2:String;

Function fnTrim(vString:String):String;
Var
    tmpString:String;
    isSpace:Boolean;
    i:Integer;
    
Begin
	tmpString:='';
    If vString[1]=#32 Then isSpace:=True Else isSpace:=False;
    For i:=1 To Length(vString) Do
    Begin
    	If  (vString[i]<>#32) Then
        Begin
        	If (vString[i]='.') AND (tmpString[Length(tmpString)]=#32) Then
        	Begin
                tmpString[Length(tmpString)]:='.';
                tmpString:=tmpString+' ';
            End
            Else
            Begin
                tmpString:=tmpString+vString[i];
                isSpace:=False;
            End;
        End;
        If (vString[i]=#32) And (isSpace=False) Then
        Begin
            tmpString:=tmpString+vString[i];
            isSpace:=True;
        End;
   End;
   
    fnTrim:=tmpString;
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
    Writeln('Str1= ',Str1);
    WriteLn('Str1 Trimmed=',fnTrim(str1));
    Writeln('Number of words in str1:',fnWordCount(fnTrim(str1)));
    WriteLn('Str2= ',Str2);
    WriteLn('Str2 Trimmed=',fnTrim(str2));
    WriteLn('Number of words in str2:',fnWordCount(fnTrim(str2)));
    Readkey;
End.