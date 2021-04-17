Program Palette;

Uses WinCrt;

Type
    Mat=Array[1..20,1..10] Of Integer;
    
Var
    M:Mat;
    S,R:Text;
    
Procedure Tri_Rapide (d, f : Integer ; Var T : Tab);
Var i, p, x, m : Integer;
Begin
    If (f > d) Then
    Begin
        m :=(d+f) div 2;
        x := T[m]; T[m]:=T[d]; T[d]:=x;
        p:=d;
        For i := d+1 to f Do
        If (T[i]<T[d]) Then
        Begin
            p:=p+1;
            x:=T[i];
            T[i]:=T[p];
            T[p]:=x;
        End;
        x:=T[p];
        T[p]:=T[d];
        T[d]:=x;
        Tri_Rapide(d, p-1, T);
        Tri_Rapide(p+1, f, T);
    End;
End;


(***Programme Principal***)
Begin
	Assign(S,'C:\Users\MSI\Desktop\Badie\codeforteen-2020-2021\algo_programing\assestments\Epreuve_Algoritme_2018');
	Assign(R,'Resultat.txt');
End.