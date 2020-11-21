Program string_cheat(input,output);

Const CST_STING='VERSION 1.2';

Begin
    (* String Procedures and Functions*)

    (* Length fn pure function*)
    phrase:='Ali va a l''ecole';
    WriteLn('Longeur :',Length(phrase));

    (* copy fn pure function *)
    str:='This is a good example of string';
    str2:=Copy(str,from,count);
    writeln('str:',str);
    writeln('str2:',str2);
  
End.