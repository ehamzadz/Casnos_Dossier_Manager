unit uPrinter;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.frxClass, FMX.frxDBSet,
  FMX.frxExportPDF;

type
  TForm5 = class(TForm)
    frxReport1: TfrxReport;
    Button1: TButton;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure frxReport1ClosePreview(Sender: TObject);
    procedure frxPDFExport1BeginExport(Sender: TObject);
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
  //FrxReport1.ShowReport();
  //form5.Close;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.DataModule1.table_activite.Filtered := false;
  DM.DataModule1.table_affiliations.Filtered := false;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  Button1Click(nil);
end;

procedure TForm5.frxPDFExport1BeginExport(Sender: TObject);
begin

end;

procedure TForm5.frxReport1ClosePreview(Sender: TObject);
begin
  form5.Close;
end;

end.
