Program FP;
Uses WinCrt;
Var 
x:Real;
Epsylone:Real;

Procedure Solve(Epsylone:Real);
Var
    iteration:Integer;
    xo,x:Real;
Begin
    iteration:=1;
    xo:=-3;
    Repeat 
    	x:=xo;
    	xo:=sin(x)-2;
    	iteration:=iteration+1;
    Until (abs(x-xo)<=Epsylone);
    Writeln('x=  ',x);
    Writeln('xo= ',xo);
End;

Begin
	WriteLn('Donnez ue precision: ');
	Readln(Epsylone);
    solve(epsylone);	
End.
