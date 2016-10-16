%macro LibnameClear(libref);
	%if %sysfunc(libref(&libref.)) = 0 %then %do;
		libname &libref. clear;
	%end;
%mend LibnameClear;

%macro LASR_DropTable(table);
	%if %sysfunc(exist(&table)) %then %do;
		proc imstat data=&table. noprint;
			droptable;
			run;
		quit;
	%end;
%mend LASR_DropTable;
