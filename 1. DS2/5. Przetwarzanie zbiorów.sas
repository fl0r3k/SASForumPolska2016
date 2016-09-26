/*Przetwarzanie zbiorów*/

proc ds2;
   data ;            /*1*/
      
      method run();
         ;           /*2*/
      end;
      
   enddata;
   run;
quit;

/*1
data klasa2(overwrite=yes); - zdefiniowanie zbioru wyjściowego 'work.klasa2'.
Domyslnie DS2 chroni nas przed przypadkowym nadpianiem zbioru.
Aby nadpisać istniejący zbiór nalezy ustwić opcję 'overwrite'
zbioru wyjściowego na 'yes'.
*/

/*2
set klasa; - Wczytanie obserwacji ze zbioru 'work.class'.
*/