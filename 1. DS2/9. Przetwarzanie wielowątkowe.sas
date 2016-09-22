/*Przetwarzanie wielow¹tkowe*/

proc ds2;
   thread watek / overwrite=yes;
      
      dcl double wid;
   
      method init();
      end;
   
      method run();
         set samochody;
         by Marka;
         wid=_threadid_;
         put 'ID w¹tku: ' wid ' Marka: ' Marka ' Model: ' Model;
      end;
      
      method term();
      end;
      
   endthread;
   run;
   
   data samochody2(overwrite=yes);
      
      method run();
         
      end;
      
   enddata;
   run;
quit;