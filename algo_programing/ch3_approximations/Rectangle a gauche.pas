Program Calcul_Aire;

Uses WinCrt,Crt;

//Const

//Type

//Var

    
Function f(x:Real):Real ;
Begin
	f:=SQRT(x);
End;

Procedure Main;
Var
    x,Aire,Epsilon,fx:Real;
Begin
    Epsilon:=0.1;
    Repeat
        Aire:=0;
        x:=2;
        Repeat
            fx:=f(x);
            Aire:=Aire+(fx*Epsilon);
            x:=x+Epsilon;
        Until(x>5);
        Writeln('Aire : ',Aire:5:15,' a ',Epsilon:1:10,' pres');
        Delay(2000);
        Epsilon:=Epsilon*0.1;
    Until(Epsilon<1E-15);
End;


(**Main**)
Begin
	
        Main;

End.