/*Definiowanie paczki*/

proc ds2;
   package konwersja / overwrite=yes;
      
      dcl double lb2kg in2m;
      
      method konwersja();
         lb2kg = 2.20462262;
         in2m = 39.3700787;
      end;
      
      method delete();
      end;
      
      method lb2kg(double lb) returns double;
         return lb/this.lb2kg;
      end;
      
      method in2m(double in) returns double;
         return in/this.in2m;
      end;
      
   endpackage;
   run;
quit;