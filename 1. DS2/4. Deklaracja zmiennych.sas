/*Deklaracja zmiennych*/

proc ds2;
   data _null_;
   
      ;           /*A - zmienna globalna typu int*/
      
      method init();
         ;     /*B - zmienna lokalna (dost�pna tylko w obr�bie metody init)*/
      end;
      
      method run();
         ;   /*C - lokalna zmienna tekstowa, pomie�ci 20 znak�w*/
         ;            /*A jest globalna, mozna odwo�a� si� do niej w dowolnej metodzie*/
         ;        /*D - niezadeklarowana czyli globalna o typie double*/
      end;
      
      method term();
      end;
      
   enddata;
   run;
quit;
