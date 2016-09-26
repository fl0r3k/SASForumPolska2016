libname mylasr sasiola
   port=10010
   tag='mylasr'
   verbose=yes
   startserver=yes;

/*Generowanie danych na potrzeby Warsztatu*/

/*Przepisanie zbioru class do biblioteki work*/
/*z przetłumaczeniem nazwy oraz nazw zmiennych*/
data mylasr.klasa;
   set sashelp.class;
   rename
      Name=Imie
      Sex=Plec
      Age=Wiek
      Height=Wzrost
      Weight=Waga;
run;

/*Przepisanie zbioru cars do biblioteki work*/
/*z przetłumaczeniem nazwy oraz nazw zmiennych*/
data mylasr.samochody;
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