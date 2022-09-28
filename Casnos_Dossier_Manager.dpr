program Casnos_Dossier_Manager;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogin in 'uLogin.pas' {Form1},
  DM in 'DM.pas' {DataModule1: TDataModule},
  uMain in 'uMain.pas' {Form2},
  uAdd_adherent in 'uAdd_adherent.pas' {Form3},
  uAdd_affiliation in 'uAdd_affiliation.pas' {Form4},
  uPrinter in 'uPrinter.pas' {Form5},
  uAdd_soci�t� in 'uAdd_soci�t�.pas' {Form6},
  uAdd_etatdecompte in 'uAdd_etatdecompte.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
