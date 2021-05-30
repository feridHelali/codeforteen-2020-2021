Program Base_Converter;

Uses WinCrt;

Var
    Decimal,Source,Base:Integer;
Function DecimalToBinary(Decimal:Integer):String;
Var
    Binary,ChaineRest:String;
    Rest:Integer;
Begin
    Binary:='';
    Repeat
    	Rest := Decimal mod 2;
    	Decimal := Decimal Div 2;
    	Str(Rest,ChaineRest);
    	Binary:=ChaineRest + Binary;
    Until(Decimal = 0);
    DecimalToBinary:=Binary;
End;

Function BinaryToDecimal(Binary:String):Integer;
Var
    Puissance,i,er,Bit:Integer;
Begin
	Puissance:=1;Decimal:=0;
	For i:=Length(Binary) DownTo 1 Do
	Begin
		Val(Binary[i],Bit,Er);
		If Er=0 Then
        Begin
        	Decimal:=Decimal+(Bit*Puissance);
        	Puissance:=Puissance*2;
        End
        Else
            Writeln('Le nombre donn‚e n''est pas valide :');
    End;
    BinaryToDecimal:=Decimal;    
End;

Function DecimalToBase(Source,Base:Integer):String;
Var
    Target,Digit:String;
    Rest:Integer;
Begin
    Target:='';
    Repeat
    	Rest := Source Mod Base;
        Source:= Source Div Base;
        If(Rest>9) Then
        Begin
            Rest:=Rest+55;
            Digit:=Chr(Rest);
        End
        Else
        Begin
        	Str(Rest,Digit);
        End;
    	Target:=Digit+Target
    Until(Source = 0);
    DecimalToBase:=Target;
End;

Function BaseToDecimal(Source:String;Base:Integer):Integer;
Var
    Puissance,i,er,Digit,Target:Integer;
Begin
	Puissance:=1;Target:=0;
	For i:=Length(Source) DownTo 1 Do
	Begin
		if(Source[i] In ['0'..'9']) Then
            Val(Source[i],Digit,Er)
        Else
        	Digit:=Ord(Source[i])-55;
        Target:=Target+(Digit*Puissance);
        Puissance:=Puissance*Base;
    End;
    BaseToDecimal:=Target;    
End;

Function BinaryToHex(Source:String):String;
Var
    Hex,FourBits,Resultat,Converted:String;
    i,Puissance,Digit,Er,Somme:Integer;
Begin
	//Make sure that the length of the source string is dividable by 4 
    While(Length(Source) Mod 4 <> 0) Do
    Begin
        Source:='0'+Source;
    End;
    //Intial values
    Resultat:='';
    Puissance:=1;
    Converted:='';
    //
    Repeat
    	//extract four bits each time from source and deleting them
    	FourBits:=Copy(Source,Length(Source)-3,4);
    	Delete(Source,Length(Source)-3,4);
    	Somme:=0;Resultat:='';
    	//Convert the four bits to decimal 
    	For i:=4 DownTo 1 Do
    	Begin
    		Val(FourBits[i],Digit,Er);
    		Somme:=Somme+(Digit*Puissance);
    		Puissance:=Puissance*2;
    	End;
    	Puissance:=1;
    	//Converting To Hexadecimal
    	If(Somme>9) Then
            Hex:=Chr(Somme+55)
        Else
            Str(Somme,Hex);
        //Concatinating to the right of the target "converted"
        Resultat:=Hex+Resultat;
        Converted:=Resultat+Converted;
    Until(Source = '');
    BinaryToHex:=Converted;
End;

//Programme Principal
Begin

    For Decimal:=15000 To 15100 Do
    Begin
    	Writeln(DecimalToBinary(Decimal),'     ' ,BinaryToHex(DecimalToBinary(Decimal)));
    End;
End.