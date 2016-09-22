/*Metody systemowe DS2*/

proc ds2;
   data _null_;
   
      method init();/*1*/
         put '*****START*****';
         put 'Rzeczy do zrobienia przed rozpocz�ciem';
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
         put 'Rzeczy do zrobienia po zako�czeniu';
         put 'przetwarzania danych.';
         put '*****KONIEC*****';
      end;
      
   enddata;
   run;
quit;

/*1
method init(); - zdefiniowanie metody init().
Wykonuje si� automatycznie tylko raz przed metod� run().
*/

/*2
method term(); - zdefiniowanie metody term().
Wykonuje si� automatycznie tylko raz po zako�czeniu metody run().
*/

