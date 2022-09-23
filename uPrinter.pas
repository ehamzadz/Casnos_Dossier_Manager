unit uPrinter;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.frxClass, FMX.frxDBSet;

type
  TForm5 = class(TForm)
    frxReport1: TfrxReport;
    Button1: TButton;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    code_activite:string;
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

uses DM;

procedure TForm5.Button1Click(Sender: TObject);
begin
  FrxReport1.ShowReport();
end;

end.
