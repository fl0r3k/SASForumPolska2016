proc ds2 ;
	thread MojWatek / overwrite=yes;
		
		dcl int licznik;
		drop licznik;
		
		method Obliczenia(int n);
			dcl int i;
			dcl double y;
			do i = 1 to n;
				y = ranuni(0);
			end;
		end;
		
		method init();
			put 'Start wątka ' _threadid_;
		end;
		
		method run();
			set samochody;
			by Marka;
			licznik + 1;
			Obliczenia(1);
		end;
		
		method term();
			put 'Zakończono wątek' _threadid_ '. Przetworzona liczba wierszy:' licznik;
		end;
		
	endthread;
	run;
quit;

proc ds2;
	data samochody2(overwrite=yes);
	
		dcl thread MojWatek w();
		
		method run();
			set from w threads=5;
		end;
		
	enddata;
	run;
quit;
