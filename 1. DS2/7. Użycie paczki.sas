/*Uzycie paczki*/

proc ds2;
   data klasa_bmi(overwrite=yes);
      
      dcl double bmi;
      
      method run();
         dcl double waga_kg wzrost_m;
         
         
         
         set klasa;
         
         waga_kg = lb2kg(waga);
         wzrost_m = in2m(wzrost);
         
         bmi = waga_kg/(wzrost_m*wzrost_m);
      end;
      
   enddata;
   run;
quit;