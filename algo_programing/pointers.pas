Program pointers_liste(Input,Output);
Uses Wincrt;
Type
  TLinkedList_Real = ^node;
  node = Record
    value : Real;
    next : TLinkedList_Real;
  End;
Var
  maListe, current : TLinkedList_Real;
  x: Real ;
	
Function creatHead (Var list:TLinkedList_Real): TLinkedList_Real;
Begin
  If list = Nil Then
    Begin
      new(list);
      creatHead := list
    End;
End;


Begin
  Clrscr;
	current := creatHead(maListe);
  Repeat
    Write('Entrer une valeur :');
    Readln(x);
		if current <> nil  then
		Begin
				if x <> 0 then
					begin
			    	new(current^.next) ;
			    	current := current^.next;
			    	current^.value := x;
			    	current^.next := Nil;
					end;
		end;
  Until x=0;
  current := maListe;
  While (current<>Nil) Do
    Begin
      Write(current^.value:8:2);
      current := current^.next;
    End;
End.
