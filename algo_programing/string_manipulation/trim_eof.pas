Program Trim_Using_SeekEOF;

Uses WinCrt,Crt,Dos;

Var
    F:Text;
    tmp:char;
    tmpS:String;
    
Begin
	Assign(F,'src.txt');

	ReSet(F);
	While Not Eof(F) Do
	Begin
		While Not SeekEoln(F) Do (*It ignores all white spaces not the uneccesary ones only maybe we can do something else to make it work the way we want ;)*)
		Begin
            Read(F,tmp);
            Write(tmp);
        End;
        Readln(F,tmpS);
        Writeln;
	End;
	Close(F);
End.