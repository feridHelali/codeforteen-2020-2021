        Program aprox;
        Uses WinCrt;
        Var
        n:integer;
        a,b:real;

        Function f(x:real):real;
        Begin
             f:=1/(sqr(x+1));
        End;
    
    Function v(x:real):real;
    Begin
    	v:=exp(-(sqr(x)));
    End;

        Function RectDF(a,b:real;n:integer):real;
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
             RectDF:=s*step;
        End;

        Function RectDV(a,b:real;n:integer):real;
        Var
           s,x,step:real;
           i:integer;
        Begin
             s:=0;
             step:=(b-a)/n;
             x:=a+step;
             for i:=1 to n do
                 Begin
                      s:=s+v(x);
                      x:=x+step;
                 End;
             RectDV:=s*step;
        End;

        Function RectGF(a,b:real;n:integer):real;
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
             RectGF:=s*step;
         End;
         
    Function RectGV(a,b:real;n:integer):real;
        Var
           s,x,step:real;
           i:integer;
        Begin
             s:=0;
             step:=(b-a)/n;
             x:=a;
             for i:=1 to n-1 do
                 Begin
                      s:=s+v(x);
                      x:=x+step;
                 End;
             RectGV:=s*step;
        End;

        Function RectMF(a,b:real;n:integer):real;
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
             RectMF:=s*step;
        End;

        Function RectMV(a,b:real;n:integer):real;
        Var
           s,x,step:real;
           i:integer;
        Begin
             s:=0;
             step:=(b-a)/n;
             x:=a-(step/2);
             for i:=1 to n do
                 Begin
                      s:=s+v(x);
                      x:=x+step;
                 End;
             RectMV:=s*step;
         End;
         
    Function RectTF(a,b:real;n:integer):real;
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
             RectTF:=s*step;
        End;
        
        Function RectTV(a,b:real;n:integer):real;
        Var
           s,x,step:real;
           i:integer;
        Begin
             s:=0;
             step:=(b-a)/n;
             x:=a;
             for i:=1 to n do
                 Begin
                      s:=s+(0.5*(v(x)+v(x+step)));
                      x:=x+step;
                 End;
             RectTV:=s*step;
        End;
        
   
        (***Main Module***)
        procedure main;
        Var
           nb:longint;
            RD,RG,RT,RM:Real;
        Begin
             nb:=40;
             repeat
                    RD:=RectDV(0,1.2859,nb)-RectDF(0,1.2859,nb);
                    RG:=RectGV(0,1.2859,nb)-RectGF(0,1.2859,nb);
                    RM:=RectMV(0,1.2859,nb)-RectMF(0,1.2859,nb);
                    RT:=RectTV(0,1.2859,nb)-RectTF(0,1.2859,nb);
                   Writeln('AireD: ',RD:5:10,' a pas= ',nb);
                   Writeln('AireG: ',RG:5:10,' a pas= ',nb);
                   Writeln('AireM: ',RM:5:10,' a pas= ',nb);
                   Writeln('AireT: ',RT:5:10,' a pas= ',nb);
                   writeln('');
                   nb:=nb*10;
             Until (nb>250000000);
        End;



        Begin
        main;
        writeln('Sba7 el 5ir');
        End.