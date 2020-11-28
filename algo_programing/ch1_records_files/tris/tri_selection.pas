Program tri_selection(input,output);
uses wincrt;

var arraytoSort:Array[1..1000] of Real;
    N:1..1000;


Procedure prSaisieTableau(var vArrayReal:Array of real; N: integer);
var i:1..1000;
Begin
    for i:=1 to N Do
		Begin
			Write('T[ ',i,' ] = ');
			Readln(vArrayReal[i]);
		end;
		Writeln('fin de saisie');
		KeyPressed;
end;

Procedure prAfficherTableau(var vArrayReal:Array of real; N: integer);
var i:1..1000;
Begin
    for i:=1 to N Do
		Begin
			WriteLn('T[ ',i,' ] = ',vArrayReal[i]:10:4);
			
		end;
		Writeln('fin d''affichage');
		KeyPressed;
end;

Procedure prTriSelection(var vArrayReal:Array of real; N: integer);
var indexOfMin,i,j:integer;
    tmp:Real;
    
Begin
	for i := 1 to N Do
	Begin
		 indexOfMin := i;
		 for j:= i+1 to N-1 Do    (* Seek for index of minValue *)
		 Begin
		     if vArrayReal[j] < vArrayReal[i] Then
				 Begin
				 		indexOfMin:=j;
				 end;
		 end;

		 if indexOfMin <> i Then
		 Begin
		 	 tmp := vArrayReal[i];
			 vArrayReal[i]:=vArrayReal[indexOfMin];
			 vArrayReal[indexOfMin]:= tmp;
		 end;
	end;
end;


Procedure prTriParInsertion(var vArrayReal:Array of real; N: integer);
var i,j:1..1000;
    current:real;
Begin
   for i:=2 to N Do
	 Begin
	 
	   current:=vArrayReal[i];
		 j:=i;
		 
		 while(j>1) And (vArrayReal[j-1] > current) do
	   Begin
				vArrayReal[j]:=vArrayReal[j-1];
				j:=j-1;
		 end;
		 
		 vArrayReal[j]:=current; 
	 end;
end;

Begin
	ClrScr;
	Writeln('T R I');
	Writeln('Entrer le nombre d''element du tableau entre 1 et 1000');
	Readln(N);
	
	prSaisieTableau(arraytoSort,N);
	//prTriSelection(arraytoSort,N);
	prTriParInsertion(arraytoSort,N);
	prAfficherTableau(arraytoSort,N);

End.

(* see www.Pascal-Programming.info *)