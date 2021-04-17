program bac_2020_ex2;
uses wincrt;
var 
n,k:Integer;

function suite (n,k:integer):LongInt;
Begin 
    if n=0 then 
        suite:=1
        Else
            suite:=suite(n-1,k)*k;
End;


Begin 
	write('donnez N: ');
	readln(n);
	write('donnez K: ');
	Readln(k);
	write('la suite est: ',suite(n,k));
	
End.