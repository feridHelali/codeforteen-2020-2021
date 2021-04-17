        Program aprox;
        Uses WinCrt;
        Var
        n:integer;
        a,b:real;

        Function f(x:real):real;
        Begin
             f:=1/(sqr(x+1));
        End;


        Function RectD(a,b:real;n:integer):real;
        Var
           s,x,step:real;
           i:integer;
        Begin
             s:=0;
             step:=(b-a)/n;
             x:=a+step;
             for i:=1 to n do
                 Begin
                      s:=s+f(x);
                      x:=x+step;
                 End;
             RectD:=s*step;
        End;


        Function RectG(a,b:real;n:integer):real;
        Var
           s,x,step:real;
           i:integer;
        Begin
             s:=0;
             step:=(b-a)/n;
             x:=a;
             for i:=1 to n-1 do
                 Begin
                      s:=s+f(x);
                      x:=x+step;
                 End;
             RectG:=s*step;
        End;

        Function RectM(a,b:real;n:integer):real;
        Var
           s,x,step:real;
           i:integer;
        Begin
             s:=0;
             step:=(b-a)/n;
             x:=a-(step/2);
             for i:=1 to n do
                 Begin
                      s:=s+f(x);
                      x:=x+step;
                 End;
             RectM:=s*step;
        End;

    Function RectT(a,b:real;n:integer):real;
        Var
           s,x,step:real;
           i:integer;
        Begin
             s:=0;
             step:=(b-a)/n;
             x:=a;
             for i:=1 to n do
                 Begin
                      s:=s+(0.5*(f(x)+f(x+step)));
                      x:=x+step;
                 End;
             RectT:=s*step;
        End;
        
        
   
        (***Main Module***)
        procedure main;
        Var
           nb:longint;
        Begin
             nb:=40;
             repeat

                   Writeln('AireD: ',RectD(0,1,nb):5:10,' a pas= ',nb);
                   Writeln('AireG: ',RectG(0,1,nb):5:10,' a pas= ',nb);
                   Writeln('AireM: ',RectM(0,1,nb):5:10,' a pas= ',nb);
                   Writeln('AireT: ',RectT(0,1,nb):5:10,' a pas= ',nb);
                   writeln('');
                   nb:=nb*10;
             Until (nb>250000000);
        End;



        Begin
        main;
        writeln('Sba7 el 5ir');
        End.