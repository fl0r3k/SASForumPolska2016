/*wyświetlenie tabel w pamięci serwera LASR*/
proc imstat;
	tableinfo;
	run;
quit;

proc imstat;
	table im.samochody;
	numrows;
	columninfo;
	fetch / format;
	run;
	
/* 	dropcolumn SpalanieMiastoL100KM; */
/* 	dropcolumn SpalanieTrasaL100KM; */
/* 	dropcolumn SpalanieMieszaneL100KM; */
/* 	run; */
	
	compute SpalanieMiastoL100KM "SpalanieMiastoL100KM = round(235.215/SpalanieMiastoMPG,0.01);";
	compute SpalanieTrasaL100KM "SpalanieTrasaL100KM = round(235.215/SpalanieTrasaMPG,0.01);";
	compute SpalanieMieszaneL100KM "SpalanieMieszaneL100KM = round(0.7*SpalanieTrasaL100KM + 0.3*SpalanieMiastoL100KM,0.01);";
	run;
	
	table im.samochody;
	columninfo;
	fetch Marka Model SpalanieMiastoL100KM Cena / format from=1 to=5 orderby=(SpalanieMiastoL100KM);
	fetch Marka Model SpalanieTrasaL100KM Cena / format from=1 to=5 orderby=(SpalanieTrasaL100KM);
	fetch Marka Model SpalanieMieszaneL100KM Cena / format from=1 to=5 orderby=(SpalanieMieszaneL100KM);
	run;
	
	where SpalanieMieszaneL100KM > 6;
	deleterows;
	run;
	
	where;
	fetch Marka Model Cena SpalanieMiastoL100KM SpalanieTrasaL100KM SpalanieMieszaneL100KM / format;
	run;

quit;

data samochody2;
	set im.samochody;
	keep Marka Model Cena SpalanieMiastoL100KM SpalanieTrasaL100KM SpalanieMieszaneL100KM ;
run;

proc imstat data=im.samochody;
	droptable;
	run;
quit;
