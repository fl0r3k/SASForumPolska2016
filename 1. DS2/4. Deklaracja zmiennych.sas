/*Deklaracja zmiennych*/

proc ds2;
   data _null_;
   
      ;           /*A - zmienna globalna typu int*/
      
      method init();
         ;        /*B - zmienna lokalna (dostępna tylko w obrębie metody init)*/
      end;
      
      method run();
         ;        /*C - lokalna zmienna tekstowa, pomieści 20 znaków*/
         ;        /*A jest globalna, mozna odwołać się do niej w dowolnej metodzie*/
         ;        /*D - niezadeklarowana czyli globalna o typie double*/
      end;
      
      method term();
      end;
      
   enddata;
   run;
quit;
