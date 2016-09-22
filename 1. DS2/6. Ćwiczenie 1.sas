/*�wiczenie 1*/
/*Dla kazdego ucznia ze zbioru 'klasa' policz jego BMI*/
/*Wzrost i waga podane s� w jednostkach imperialnych*/
/* 1 kg = 2.20462262 lb               */
/* 1 m  = 39.3700787 in               */
/* bmi  = waga_kg/(wzrost_m*wzrost_m) */

/*1
Zadeklaruj zbior wyjsciowy o nazwie 'klasa_BMI'
*/

/*2
Przed instrukcj� 'RETAIN' zadeklaruj 3 zmienne globalne
o typie double: 'lb2kg', 'in2m' oraz 'BMI'.
*/

/*3
Zadeklaruj 2 zmienne lokalne dla metody 'run()': 'waga_kg' oraz 'wzrost_m'.
*/

/*4
Dodaj instrukcj� 'set' w metodzie 'run()' wczytuj�c� zbi�r 'klasa'.
*/

/*5
Przelicz wage w funtach na kilogramy oraz wzrost w calach na metry.
*/

/*6
Wed�ug wzoru podanego na poczatku zadania oblicz BMI.
*/

/*7
Usu� zb�dne metody.
*/

proc ds2;
   data /*1*/;
      /*2*/
      retain lb2kg in2m (2.20462262 39.3700787);
      drop   lb2kg in2m;
      
      method init();
      end;
      
      method run();
         /*3*/
         /*4*/
         /*5*/
         /*6*/
      end;
      
      method term();
      end;
      
   enddata;
   run;
quit;