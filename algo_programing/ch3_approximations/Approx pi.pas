Program approxpi4;

Uses WinCrt;

Var 
    Epsilon:Real;
    
Function Calcul(Epsilon:Real):Real;
Var
    S,Signe,a:LongInt;
    U0,U:Real;
    
Begin
	U:=3/4;
    S:=2;
    Signe:=1;
    Repeat
        U0:=U;
       a:=S*(S+1)*(S+2);
       U:=U0+(Signe*(1/a));
       Signe:=Signe*(-1);
       S:=S+2;
   Until(abs(U-U0)<Epsilon);
   Calcul:=U*4;
End;

Begin
	Readln(Epsilon);
	Writeln('pi =',Calcul(Epsilon))
End.