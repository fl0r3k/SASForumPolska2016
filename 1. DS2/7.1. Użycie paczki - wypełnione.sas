/*Uzycie paczki*/

proc ds2;
   data klasa_bmi(overwrite=yes);
      
      dcl double bmi;
      
      method run();
         dcl double waga_kg wzrost_m;
         
         dcl package konwersja k();
         
         set klasa;
         
         waga_kg = k.lb2kg(waga);
         wzrost_m = k.in2m(wzrost);
         
         bmi = waga_kg/(wzrost_m*wzrost_m);
      end;
      
   enddata;
   run;
quit;