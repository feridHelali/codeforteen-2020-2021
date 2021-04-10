Program app_pi;
Uses wincrt;

	 (* pi/4 = 3/4 + 1/(2*3*4) - 1/(4*5*6) + 1 /(6*7*8) ... *)
	 (* evaluate Pi with epsilon precision *)
	 
var i,j,k:LongInt;
   s1,s2,epsilon:real;
	 signe:integer;
Begin
  Write('Presision :');
	Readln(epsilon);
   s1:=3/4;
	 i:=0;
	 j:=1;
	 k:=2;
	 signe:=1;

	 Repeat
		 	s2:=s1;
			i:=i+2;
			j:=j+2;
			k:=k+2;
			s1:=s1+(signe*1/(i*j*k));
			signe:=signe*(-1);
		 Until (abs(s1-s2)<epsilon);
	 Writeln('Pi =',s2*4:1:10);
End.