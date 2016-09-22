/*Generowanie danych na potrzeby Warsztatu*/

/*Przepisanie zbioru class do biblioteki work*/
/*z przet³umaczeniem nazwy oraz nazw zmiennych*/
data klasa;
   set sashelp.class;
   rename
      Name=Imie
      Sex=Plec
      Age=Wiek
      Height=Wzrost
      Weight=Waga;
run;

/*Przepisanie zbioru cars do biblioteki work*/
/*z przet³umaczeniem nazwy oraz nazw zmiennych*/
data samochody;
   set sashelp.cars;
   rename
      Make=Marka
      Model=Model
      Type=Typ
      Origin=PochodzenieKraj
      DriveTrain=Naped
      MSRP=CenaSugerowana
      Invoice=Cena
      EngineSize=PojemoscSilnika
      Cylinders=LiczbaCylindrow
      Horsepower=MocKM
      MPG_City=SpalanieMiastoMPG
      MPG_Highway=SpalanieTrasaMPG
      Weight=Masa
      Wheelbase=RozstawOsi
      Length=Dlugosc;
run;

/*Zdefiniowanie pakietu konwersji jednostek*/
/*miêdzy imperialnymi i metrycznymi*/
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