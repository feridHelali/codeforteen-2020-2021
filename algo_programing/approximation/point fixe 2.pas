Program point_fixe;
Uses WinCrt;

Var 
epsilon,solution:Real;

 
 
 
 Function FnF(x:real):Real;
 Begin 
        FnF:=(sin(x)+cos(x))*5;
End;

 Function fnPointFx (epsilon:Real):Real;
 Var
    x0,x:Real; 
 
 Begin 
        x0:=6;
        Repeat
            x:=x0;
            x0:=FnF(x);
        Until (Abs(x0-x)<epsilon);
         fnPointFx:=x0;  
End;

Begin 
write('Donner la precision: ');readln(epsilon);
Solution:=fnPointFx(epsilon);
WriteLn('S ={',solution:0:10,'}');	
End.