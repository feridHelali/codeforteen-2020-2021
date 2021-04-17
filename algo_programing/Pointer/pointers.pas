Program pointers_liste(Input,Output);
uses wincrt,crt;

Type
    TListe_Reel = ^maillon;
    maillon = Record
        valeur : Real;
        suivant : TListe_reel;
    End;
	
var maListe, current : TListe_Reel;
    x: real ;

Begin
	clrscr;

	repeat
		write('entrer une valeur :');
		readln(x);
		if maListe = nil then
			Begin
			        new(maListe);
					current:= maListe;
			end
		else
			begin
				new(current^.suivant) ;
				current:=current^.suivant;
			end;
	current^.valeur := x;
	current^.suivant := nil;
	until x=0;
	
	

  current := maListe;
	while(current<>nil) Do
	Begin
		write(current^.valeur:8:2);
		current:= current^.suivant;
	end;
End.