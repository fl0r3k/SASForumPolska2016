proc ds2 ;
	thread mojWatek / overwrite=yes;
		
		dcl int x;
		drop x;
		
		method Obliczenia(int n);
			dcl int i;
			dcl double y;
			do i = 1 to n;
				y = ranuni(0);
			end;
		end;
		
		method init();
		end;
		
		method run();
			set samochody;
			by Marka;
			x + 1;
			Obliczenia(1);
		end;
		
		method term();
			put 'Wątek ' _threadid_ ' przetworzył ' x ' wierszy.';
		end;
		
	endthread;
	run;
quit;

proc ds2;
	data samochody2(overwrite=yes);
	
		dcl thread mojWatek w();
		
		method init();
		end;
		
		method run();
			set from w threads=5;
		end;
		
		method term();
		end;
		
	enddata;
	run;
quit;
