Program comparisson;
uses wincrt,crt;
var str1,str2:string;
Begin
	str1:='Ali';
	str2:='Ala';

	if str1<str2 then  writeln('Ali < Ala') else writeln('Ali > Ala');
	ReadKey;
end.