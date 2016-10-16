proc ds2 ;
	package KonwerterJednostek / overwrite=yes;
	
		method KonwerterJednostek();
		end;
		
		method Delete();
		end;
		
		method LB2KG(double LB) returns double;
			return LB/2.20462262;
		end;
		
		method KG2LB(double KG) returns double;
			return KG*2.20462262;
		end;
		
		method IN2M(double IN) returns double;
			return IN/39.3700787;
		end;
		
		method M2IN(double M) returns double;
			return M*39.3700787;
		end;
		
		method MPG2L100(double MPG) returns double;
			return 235.215/MPG;
		end;
		
		method L1002MPG(double L100) returns double;
			return 235.215/L100;
		end;
		
		method C2F(double C) returns double;
			return C*9/5 + 32;
		end;
		
		method F2C(double F) returns double;
			return (F-32)*5/9;
		end;
		
	endpackage;
	run;
quit;

proc ds2;
	data samochody2(overwrite=yes);

		dcl package KonwerterJednostek konwerter();
		
		dcl double SpalanieMiastoL100 SpalanieTrasaL100;
		
		method run();
			set samochody;
			SpalanieMiastoL100 = konwerter.MPG2L100(SpalanieMiastoMPG);
			SpalanieTrasaL100 = konwerter.MPG2L100(SpalanieTrasaMPG);
		end;
		
	enddata;
	run;
quit;
