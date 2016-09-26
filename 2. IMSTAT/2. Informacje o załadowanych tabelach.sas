/*Wyświetlenie informacji o załadowanych tabelach.*/

proc imstat;
   tableinfo / host='localhost' port=10010;
   run;
quit;