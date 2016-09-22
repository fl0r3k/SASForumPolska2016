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
proc ds2; - otwarcie procedury DS2 do uruchamiania program�w DS2.
*/

/*2
data _null_; - rozpocz�cie bloku data do przetwarzania danych
_null_ oznacza brak zbioru wyj�ciowego.
*/

/*3
method run(); - w metodzie run() odbywa si� g��wne przetwarzanei danych.
*/

/*4
put 'Hello, World!'; - wypisanie tekstu 'Hello, World!' do logu.
*/

/*5
end; - zako�czenie metody run().
*/

/*6
enddata; - zako�czenie bloku data.
*/

/*7
run; - uruchomienie bloku data.
*/

/*8
quit; - zako�czenie procedury ds2.
*/
