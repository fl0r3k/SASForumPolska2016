/*Przetwarzanie zbior�w*/

proc ds2;
   data ;   /*1*/
      
      method run();
         ;                 /*2*/
      end;
      
   enddata;
   run;
quit;

/*1
data klasa2(overwrite=yes); - zdefiniowanie zbiory wyj�ciowego 'work.klasa2'.
Domyslnie DS2 chroni nas przed przypadkowym nadpianiem zbioru.
Aby nadpisa� istniej�cy zbi�r nalezy ustwi� opcj� 'overwrite'
zbioru wyj�ciowego na 'yes'.
*/

/*2
set klasa; - Wczytanie obserwacji ze zbioru 'work.class'.
*/