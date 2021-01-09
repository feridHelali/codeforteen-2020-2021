    (* pi/4 = 3/4 + 1/(2*3*4) - 1/(4*5*6) + 1/(6*7*8) ...*)
Program MyPiApproximation;
Uses Wincrt;
Var 
    Epsilon,somme,somme1:Real;
    i:LongInt;
    signe:ShortInt;
{***PP***}
Begin 
    Write ('Epsilon: ');Readln(Epsilon);	
    somme:=3/4;
    i:=0;
    signe:=1;
    Repeat 
        somme1:=somme;
        i:=i+2;
        somme:=somme+(signe*(1/(i*(i+1)*(i+2))));
        signe:=signe*(-1);
    Until (ABS(somme1-somme)<=Epsilon);
    Write('Pi= ',somme*4:0:10);
End.