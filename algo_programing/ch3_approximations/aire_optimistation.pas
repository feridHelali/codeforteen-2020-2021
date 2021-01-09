Program optimisation;
		 Uses wincrt;

		 // Aire Maximale pour un perimetre fix L
var l,x,s,smax,xmax,epsilone:real;

Begin
	Write('Donner L');
	Readln(L);

	Smax:=0;
	x:=0;
	epsilone:=1E-5;
	xmax:=0;
	While (x < (L/2)) Do
	Begin
	  S:=x*0.5*(L-2*x);
		if ( s>sMax ) Then
		Begin
			  xmax:=x;
				smax:=s;
		end;
		x:=x+epsilone;
	end;
	Writeln('Rectangle :', xmax:0:4, ' et ', (l-2*xmax)/2:0:4);
	WriteLn('Surface Smax',Smax);
End.