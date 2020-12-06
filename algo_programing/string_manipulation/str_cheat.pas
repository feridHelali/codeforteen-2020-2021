Program StrMemo(Input,Ouptut);

uses crt,dos;

Const SERVER_URL='http://localhost:3000';

Type  strArray =Array[1..1000] of String;

Var str1,str3,str4,str5,str6:string;
    str2:string[100];
		position,error:integer;
		val_of_str4:real;
		value_to_convert: LongInt;


Begin
WriteLn('S T R I N G S');
ClrScr;

(* string function and procedures : Length, Copy, Pos, Val, Str, Concat, Insert, Delete, Fillchar *)

(* Length : str -> integer , is function, without side-effect *)
  str1:='We are the world, We are the children, We are the ones who make a brighter day, so let''s start giving';
	WriteLn('length of str :', Length(str1):5);

(* Copy : (str,integer,integer) -> sting ; funtion without side-effects  Copy(strSource,fromPosition,howMatchCaracter) *);
  str2:=Copy(str1,4,10);
  WriteLn('Copy(str,4,10)=',str2);

	

(* Pos : ( string, string ) -> integer ; function without side-effects Pos(stringToLocate,StringSource) *)
 str2:='world';
 position := Pos(str2,str1);
 WriteLn('Pos(str,''World'')=',position:5);


 (* Val : ( string, int | real | byte... , integer) ; procedure with side-effects  Val(stringToconvert,targetNumericVariable,error) *);
 str4 :='456582695';
 val_of_str4:=0;
 
 Val(str4,val_of_str4,error);
 Writeln('Valeur:',val_of_str4:10);
 Writeln('error:',error);

 str4 :='4565A82695';
 val_of_str4:=0;
 Val(str4,val_of_str4,error);
 Writeln('Valeur:',val_of_str4:10:0);
 Writeln('error:',error:10);



 (* Str :( int | real | byte... , string); procedure with side-effect  Str(NumericVariableToConvert,targetStringVariable) *)
 value_to_convert := 56232598;
 writeln('string before Str convertion    :', str5);
 Str(value_to_convert,str5);
 writeln('string after Str convertion     :', str5);
 

 (* Concat : (String, String, String,...) -> String , function without side-effects ; Concat(str1,str2,str3...); *);
 str6:= Concat(str1,str2,str3,str4);
 WriteLn(str6);



(* Insert : (string, string, index), procedure with side-effects; Insert(sourceStringToInsert,targetString,atPosition) *);

Writeln('str6 before insertion',str6);
Insert('  ** virus **  ',str6,15);
WriteLn(str6);

(* Delete : (string,string,integer), procedure with side-effects; Delete(stringSource,nbCaracterFrom);


(*Fillchar : fill string s with character c until s is n-1 char long.
Syntax : fillchar(s,n,c);  function side-effects *)


ReadKey;
End.