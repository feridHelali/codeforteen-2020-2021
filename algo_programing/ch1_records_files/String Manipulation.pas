Program StringManipulation(Input,Output);

Uses WinCrt,dos,crt;

Var
    Chaine,sous_chaine,ch_a_inserer,chaine2,chNumeric,Chaine3:String;
    position,nbCaracteres,atPosition,er:Byte;
    x:Integer;
    Caractere:Char;
Begin
    chaine:='Badie Sakka  4eme Informatique';
    chaine2:=chaine;
	(*//Longeur fn pure
	Writeln('Votre chaine est de longeur : ',Length(Chaine));
	ReadKey;*)
	
	(*//Copy fn pure
	position:=1;
	nbCaracteres:=3;
	sous_chaine:=Copy(Chaine,position,nbCaracteres); 
	Writeln('ch : ',Chaine);
	Writeln('Copy : ',sous_chaine);
	readkey;*)
	
	(*//Insert pr side-effect
	Writeln('Donnez la chaine a inserer : ');
	Readln(ch_a_inserer);
	Writeln('Donnnez la position de l''insertion');
	Readln(atPosition);
	Writeln('chaine avant insertion : ',chaine);
	Insert(ch_a_inserer,chaine,atPosition);
	Writeln('la chaine apres insertion :',chaine);
	ReadKey;*)
	
	(*//Delete pr side effect

	Writeln('donnez la postoion de supression ');
	Readln(atPosition);
	Writeln('donnez le nombre de caracteres a suprimer:');
	Readln(nbCaracteres);
	Writeln('La chaine avant delete : ',chaine2);
	Delete(chaine2,atPosition,nbCaracteres);
	Writeln('La chaine apres delete : ',chaine2);
	Readkey;*)
	
	(*str pr side effect
	x:=15;
	str(x,chNumeric);
    Writeln(' x= ',x);
    Writeln('x apres str: ',chNumeric);
	*)
	
	(* val pr side effect 
	x:=2546;
	Writeln('Donnez la chaine Numerique:');
	readln(chNumeric);
	WriteLn(' x avnat val  ',x);
	val(chNumeric,x,er);
    WriteLn('X apres val ',x);
	If er <>0 Then
        Writeln('Error @ position',er);
    *)
    (*Pos fn pure
        Writeln('Donnez le caractere que vous voullez chercher dans la chaine: ');
        Readln(Caractere);
        Position:=Pos(Caractere,Chaine);
        If Position<>0 Then
            Writeln('La position de ',Caractere,' dans "',Chaine,'" est: ',Position)
        Else
            Writeln(Caractere,' N''existe pas dans "',Chaine,'"');
    *)
    (*Concat fn pure
        Writeln('Chaine 1: ',Chaine);
        Writeln('Chaine 2: ',Chaine2);
        Chaine3:=Concat(Chaine,Chaine2);
        Writeln('La concatenation de chaine1 et chaine 2 est : ',Chaine3);*)
    (*Index*)
        Writeln(Chaine);
        Writeln('Donnez la postition du caractere que vous voullez chercher');
        Readln(Position);
        Writeln('Le caractere n',Position,' Dans ',Chaine,' est : ',Chaine[Position]);
    (**)
End.