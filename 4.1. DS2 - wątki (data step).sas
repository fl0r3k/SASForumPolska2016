proc fcmp outlib=work.paczka.funckje;
	function Obliczenia(n);
		do i = 1 to n;
			y = ranuni(0);
		end;
		return (0);
	endsub;
run;

options cmplib=(work.paczka.funckje);

data samochody2;
	set samochody end=koniec;
	by Marka;
	x + 1;

 	rc = Obliczenia(1);
 	
 	if koniec then do;
 		put 'Data step przetworzył ' x ' wierszy.';
 	end;
 	
 	drop rc ;
run;
