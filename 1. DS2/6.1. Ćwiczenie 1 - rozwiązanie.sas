/*Æwiczenie 1*/
/*Dla kazdego ucznia ze zbioru 'klasa' policz jego BMI*/
/*Wzrost i waga podane s¹ w jednostkach imperialnych*/
/* 1 kg = 2.20462262 lb               */
/* 1 m  = 39.3700787 in               */
/* bmi  = waga_kg/(wzrost_m*wzrost_m) */

/*1
Zadeklaruj zbior wyjsciowy o nazwie 'klasa_BMI'
*/

/*2
Przed instrukcj¹ 'RETAIN' zadeklaruj 3 zmienne globalne
o typie double: 'lb2kg', 'in2m' oraz 'BMI'.
*/

/*3
Zadeklaruj 2 zmienne lokalne dla metody 'run()': 'waga_kg' oraz 'wzrost_m'.
*/

/*4
Dodaj instrukcjê 'set' w metodzie 'run()' wczytuj¹c¹ zbiór 'klasa'.
*/

/*5
Przelicz wage w funtach na kilogramy oraz wzrost w calach na metry.
*/

/*6
Wed³ug wzoru podanego na poczatku zadania oblicz BMI.
*/

/*7
Usuñ zbêdne metody.
*/

proc ds2;
   data KLASA_BMI(OVERWRITE=YES);
      
      DCL DOUBLE LB2KG IN2M BMI;
      
      retain lb2kg in2m (2.20462262 39.3700787);
      drop   lb2kg in2m;
      
      method run();
         DCL DOUBLE WAGA_KG WZROST_M;
         
         SET KLASA;
         
         WAGA_KG = WAGA/LB2KG;
         WZROST_M = WZROST/IN2M;
         
         BMI = WAGA_KG/(WZROST_M*WZROST_M);
      end;
      
   enddata;
   run;
quit;