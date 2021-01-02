Program pi_euler1;

Uses WinCrt;

Var
    Epsilon,MyPi:Real;

Function FnApprox(Epsilon:real):real;
Var
    i,j:LongInt;
    h,h0:Real;
    ChangeUp:Boolean;
Begin
	i:=2;
	j:=1;
	h0:=i/j;
	ChangeUp:=false;
	Repeat
        h:=h0;
        if ChangeUp Then
            i:=i+2
        Else
            j:=j+2;
        //Write(i,'/',j,'    ');
        h0:=h*(i/j);
        ChangeUp:=Not(ChangeUp);
    Until(Abs(h0-h)<Epsilon);
    FnApprox:=h*2;
End;


Begin
	Writeln('Donnez la precision : ');Readln(Epsilon);
	MyPi:=FnApprox(Epsilon);
	Writeln('Pi= ',MyPi:0:10,' a ',Epsilon:0:10,' pres');
End.