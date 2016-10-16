%let path=D:\SAS\SASForumPolska2016;
%include "&path.\makra.sas";

%libnameClear(im);
libname im sasiola startserver=yes;

/*Generowanie danych na potrzeby Warsztatu*/

/*Przepisanie zbioru class do biblioteki work*/
/*z przetłumaczeniem nazwy oraz nazw zmiennych*/
data work.klasa;
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
data work.samochody;
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
data work.irys;
   set sashelp.iris;
   rename
      Species=Gatunek
      SepalLength=DlugoscDzialekKielicha
      SepalWidth=SzerokoscDzialekKielicha
      PetalLength=DlugoscPlatka
      PetalWidth=SzerokoscPlatka;
run;


%LASR_DropTable(im.klasa);
data im.klasa;
	set klasa;
	part = ranuni(12345);
run;

%LASR_DropTable(im.samochody);
data im.samochody;
	set samochody;
	part = ranuni(12345);
run;

%LASR_DropTable(im.irys);
data im.irys;
	set irys;
	part = ranuni(12345);
run;

proc ds2 ;
	package KonwerterJednostek / overwrite=yes;
	
		method KonwerterJednostek();
		end;
		
		method Delete();
		end;
		
		method LB2KG(double LB) returns double;
			return LB/2.20462262;
		end;
		
		method KG2LB(double KG) returns double;
			return KG*2.20462262;
		end;
		
		method IN2M(double IN) returns double;
			return IN/39.3700787;
		end;
		
		method M2IN(double M) returns double;
			return M*39.3700787;
		end;
		
		method MPG2L100(double MPG) returns double;
			return 235.215/MPG;
		end;
		
		method L1002MPG(double L100) returns double;
			return 235.215/L100;
		end;
		
		method C2F(double C) returns double;
			return C*9/5 + 32;
		end;
		
		method F2C(double F) returns double;
			return (F-32)*5/9;
		end;
		
	endpackage;
	run;
quit;
