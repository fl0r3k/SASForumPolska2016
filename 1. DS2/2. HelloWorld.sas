/*Program wypisuje tekst "Hello, World!" do logu*/

proc ds2;                     /*1*/
   data _null_;               /*2*/
      method run();           /*3*/
         put 'Hello, World!'; /*4*/
      end;                    /*5*/
   enddata;                   /*6*/
   run;                       /*7*/
quit;                         /*8*/

/*1
proc ds2; - otwarcie procedury DS2 do uruchamiania programów DS2.
*/

/*2
data _null_; - rozpoczęcie bloku data do przetwarzania danych
_null_ oznacza brak zbioru wyjściowego.
*/

/*3
method run(); - w metodzie run() odbywa się główne przetwarzanei danych.
*/

/*4
put 'Hello, World!'; - wypisanie tekstu 'Hello, World!' do logu.
*/

/*5
end; - zakończenie metody run().
*/

/*6
enddata; - zakończenie bloku data.
*/

/*7
run; - uruchomienie bloku data.
*/

/*8
quit; - zakończenie procedury ds2.
*/
