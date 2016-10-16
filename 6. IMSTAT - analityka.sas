/*klasteryzacja obserwacji*/
proc imstat;
	table im.irys;
	run;
	
	cluster DlugoscDzialekKielicha SzerokoscDzialekKielicha DlugoscPlatka SzerokoscPlatka /
		method  = kmeans
		maxiter	= 50
		numclus	= 3
		nsamp	= 2
		conv	= 1.e-06
		init	= rand
		freq	= Gatunek
		vars	= (Gatunek DlugoscDzialekKielicha SzerokoscDzialekKielicha DlugoscPlatka SzerokoscPlatka)
		temptable;
	run;
	
	table im.&_TEMPLAST_;
	fetch / to=20 format;
	run;
quit;

/*trenowanie sieci neuronowej*/
proc imstat;
	table im.irys;
	where part <= 0.5;
	neural Gatunek /
		seed	= 12345
		input	= (DlugoscDzialekKielicha SzerokoscDzialekKielicha DlugoscPlatka SzerokoscPlatka)
		nominal	= (Gatunek)
		hidden	= (3)
		maxiter	= 1000
		numtries= 10
		lower	= -20
		upper	= 20
		code	= (file="&path.\irys_score.sas" replace)
		temptable;
	run;
	
	where part > 0.5;
	neural Gatunek /
		lasrann	= im.&_TEMPLAST_
		idvars	= Gatunek
		temptable;
	run;
	
	table im.&_TEMPLAST_;
	fetch / to=20 format;
	run;
quit;