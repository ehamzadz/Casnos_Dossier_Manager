program inventory;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogin in 'uLogin.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
