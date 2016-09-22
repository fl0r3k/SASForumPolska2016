/*Deklaracja zmiennych*/

proc ds2;
   data _null_;
   
      ;           /*A - zmienna globalna typu int*/
      
      method init();
         ;     /*B - zmienna lokalna (dostêpna tylko w obrêbie metody init)*/
      end;
      
      method run();
         ;   /*C - lokalna zmienna tekstowa, pomieœci 20 znaków*/
         ;            /*A jest globalna, mozna odwo³aæ siê do niej w dowolnej metodzie*/
         ;        /*D - niezadeklarowana czyli globalna o typie double*/
      end;
      
      method term();
      end;
      
   enddata;
   run;
quit;
