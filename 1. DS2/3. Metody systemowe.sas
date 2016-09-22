/*Metody systemowe DS2*/

proc ds2;
   data _null_;
   
      method init();/*1*/
         put '*****START*****';
         put 'Rzeczy do zrobienia przed rozpoczêciem';
         put 'przetwarzania danych.';
         put '***************';
         put ;
      end;
      
      method run();
         put '***********************';
         put '*****PRZETWARZANIE*****';
         put '***********************';
      end;
      
      method term();/*2*/
         put ;
         put '***************';
         put 'Rzeczy do zrobienia po zakoñczeniu';
         put 'przetwarzania danych.';
         put '*****KONIEC*****';
      end;
      
   enddata;
   run;
quit;

/*1
method init(); - zdefiniowanie metody init().
Wykonuje siê automatycznie tylko raz przed metod¹ run().
*/

/*2
method term(); - zdefiniowanie metody term().
Wykonuje siê automatycznie tylko raz po zakoñczeniu metody run().
*/

