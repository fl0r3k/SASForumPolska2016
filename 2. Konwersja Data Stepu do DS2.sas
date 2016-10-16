data samochody2;
	if _N_ = 1 then do;
		put 'Zrób coś na początku data stepu';
	end;
	
	set samochody end=koniec;
 	
 	if koniec then do;
 		put 'Zrób coś przed zakończeniem data stepu';
 	end;
run;

proc ds2;
	data /*tu wstaw nazwę zbióru wyjścioweg*/(overwrite=yes);
	
		method init();
			/*tu co ma być zrobione na początku DS2*/
		end;
		
		method run();
			/*tu wczytaj dane ze zbioru*/
		end;
		
		method term();
			/*tu co ma być zrobione na zakończenie końcu DS2*/
		end;
		
	enddata;
	run;
quit;