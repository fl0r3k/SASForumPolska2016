/*Deklaracja zmiennych*/

proc ds2;
   data _null_;
   
      dcl int A;           /*A - zmienna globalna typu int*/
      
      method init();
         dcl double B;     /*B - zmienna lokalna (dost�pna tylko w obr�bie metody init)*/
      end;
      
      method run();
         dcl char(20) C;   /*C - lokalna zmienna tekstowa, pomie�ci 20 znak�w*/
         A = 1;            /*A jest globalna, mozna odwo�a� si� do niej w dowolnej metodzie*/
         D = A + 1;        /*D - niezadeklarowana czyli globalna*/
      end;
      
      method term();
      end;
      
   enddata;
   run;
quit;
