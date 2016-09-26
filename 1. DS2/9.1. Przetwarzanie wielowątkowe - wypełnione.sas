/*Przetwarzanie wielowątkowe*/

proc ds2;
   thread watek / overwrite=yes;
   
      dcl double wid;
   
      method init();
      end;
   
      method run();
         set samochody;
         by Marka;
         wid=_threadid_;
         put 'ID wątku: ' wid ' Marka: ' Marka ' Model: ' Model;
      end;
      
      method term();
      end;
      
   endthread;
   run;
   
   data out(overwrite=yes);
      dcl thread watek w;
      method run();
         set from w threads=4;
      end;
   enddata;
   run;
quit;