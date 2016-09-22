/*Przetwarzanie zbiorów*/

proc ds2;
   data ;   /*1*/
      
      method run();
         ;                 /*2*/
      end;
      
   enddata;
   run;
quit;

/*1
data klasa2(overwrite=yes); - zdefiniowanie zbiory wyjœciowego 'work.klasa2'.
Domyslnie DS2 chroni nas przed przypadkowym nadpianiem zbioru.
Aby nadpisaæ istniej¹cy zbiór nalezy ustwiæ opcjê 'overwrite'
zbioru wyjœciowego na 'yes'.
*/

/*2
set klasa; - Wczytanie obserwacji ze zbioru 'work.class'.
*/