/*Filtrowanie obserwacji na aktywanej tabeli*/

proc imstat;
   table mylasr.samochody;
   where Marka='Kia';
   fetch; /* dopisanie zbioru wynikowego */
   run;
quit;