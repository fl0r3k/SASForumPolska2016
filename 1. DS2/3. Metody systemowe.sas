/*Metody systemowe DS2*/

proc ds2;
   data _null_;
   
      method init();/*1*/
         put '*****START*****';
         put 'Rzeczy do zrobienia przed rozpoczęciem';
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
         put 'Rzeczy do zrobienia po zakończeniu';
         put 'przetwarzania danych.';
         put '*****KONIEC*****';
      end;
      
   enddata;
   run;
quit;

/*1
method init(); - zdefiniowanie metody init().
Wykonuje się automatycznie tylko raz przed metodą run().
*/

/*2
method term(); - zdefiniowanie metody term().
Wykonuje się automatycznie tylko raz po zakończeniu metody run().
*/

