/*Pobieranie obserwacji z aktywnej tabeli*/

proc imstat;
   table mylasr.samochody;
   fetch; /* dopisanie limitów i kolumn*/
   run;
quit;