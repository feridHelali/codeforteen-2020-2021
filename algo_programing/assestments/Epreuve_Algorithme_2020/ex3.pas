program ex3_bac2020;
uses wincrt,crt;
const
    epsilon=1E-4;
var 
    i:Integer;

Function Valeur1:Real;
var 
    s,x:Real;
Begin
	s:=0; 
    x:=epsilon/2;
    Repeat
        s:=s+sqrt(1-sqr(x))*Epsilon;
        x:=x+epsilon;

    Until(x>1);
    valeur1:=s*4;
End;

Function valeur2:Real;
Var
    S1,S:Real;
    Signe,Denominateur:Integer;
    DenominateurL,DenominateurR:Longint;
Begin
	S1:=16*(1/5)-4*(1/239);
	Signe:=-1;
	Denominateur:=3;
	DenominateurL:=5*5*5;
    DenominateurR:=239*239*239;
    Repeat
    	S:=S1;
    	S1:=S1+16*(Signe*(1/denominateur)*(1/DenominateurL)) -4*(Signe*(1/denominateur)*(1/DenominateurR));
    	Signe:=Signe*(-1);
    	DenominateurL:=DenominateurL*5*5;
    	DenominateurR:=DenominateurR*239*239;
    	Denominateur:=Denominateur+2;
    Until(abs(S1-S)<=Epsilon);
    Valeur2:=S;
End;

Function compare:Real;
Var
    Val1,Val2:Real;
Begin
    Val1:=Valeur1;
    Val2:=Valeur2;
    If(abs(3.1415-Val1)<abs(3.1415-Val2)) Then
        Compare:=Val1
    Else
        Compare:=Val2;
End;

Begin 
	Writeln(valeur1);
	Writeln(Valeur2);
	Writeln('La valeur la plus proche est: ',compare);
End.
