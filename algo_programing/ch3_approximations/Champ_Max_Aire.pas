Program Opt_Champ_Pr_Fixe;

Uses WinCrt,Crt;

Var
    Perimetre,Aire,Airemax,Width,WidthMax,Epsilon:Real;
    
    
Begin
	Write('Donnez Epsilon: ');Readln(Epsilon);
	Write('Donnez le Perimetre: ');Readln(Perimetre);
	AireMax:=0;
	Width:=0;
	WidthMax:=0;
	While(Width<Perimetre/2) Do
        Begin
            Aire:=((Perimetre/2)-Width)*Width;
            If Aire>AireMax Then
            Begin
                AireMax:=Aire;
                WidthMax:=Width;
            End;
            Width:=Width+Epsilon;
   End;
	Writeln('L''aire max= ',AireMax:0:10);
	Writeln('Pour une longeur = ',((Perimetre/2)-WidthMax):0:10,' et une largeur = ',WidthMax:0:10);
End.