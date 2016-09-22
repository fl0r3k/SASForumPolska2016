/*Deklaracja zmiennych*/

proc ds2;
   data _null_;
   
      dcl int A;           /*A - zmienna globalna typu int*/
      
      method init();
         dcl double B;     /*B - zmienna lokalna (dostêpna tylko w obrêbie metody init)*/
      end;
      
      method run();
         dcl char(20) C;   /*C - lokalna zmienna tekstowa, pomieœci 20 znaków*/
         A = 1;            /*A jest globalna, mozna odwo³aæ siê do niej w dowolnej metodzie*/
         D = A + 1;        /*D - niezadeklarowana czyli globalna*/
      end;
      
      method term();
      end;
      
   enddata;
   run;
quit;
