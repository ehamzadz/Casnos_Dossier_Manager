unit uAdd_société;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.DateTimeCtrls,
  System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Grid;

type
  TForm6 = class(TForm)
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Rectangle1: TRectangle;
    Text16: TText;
    ColorAnimation1: TColorAnimation;
    Text17: TText;
    Text18: TText;
    Text19: TText;
    Text20: TText;
    Text22: TText;
    Text1: TText;
    DateEdit1: TDateEdit;
    StringGrid1: TStringGrid;
    Button1: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    code_act :string;
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

uses DM;

procedure TForm6.Button1Click(Sender: TObject);
begin

  if (edit11.Text='') or (edit12.Text='') or (edit13.Text='') or (edit14.Text='') then begin
    showmessage('Completer tous les champs!');
  end else begin
    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add(' INSERT INTO employee values(:nss,:nom,:prenom,:adr,:date,:code) ');
    DM.DataModule1.FDQuery1.ParamByName('nss').asinteger := strtoint(edit11.Text);
    DM.DataModule1.FDQuery1.ParamByName('nom').asstring := edit12.Text;
    DM.DataModule1.FDQuery1.ParamByName('prenom').asstring := edit13.Text;
    DM.DataModule1.FDQuery1.ParamByName('adr').asstring := edit14.Text;
    DM.DataModule1.FDQuery1.ParamByName('date').asdate := strtodate(dateedit1.Text);
    DM.DataModule1.FDQuery1.ParamByName('code').asinteger := strtoint(code_act);
    DM.DataModule1.FDQuery1.ExecSQL;
    //Refresh Tables
    DM.DataModule1.table_employee.filtered := false;
    DM.DataModule1.table_employee.filter:= 'code_act like ' + code_act;
    DM.DataModule1.table_employee.filtered := true;
  end;

end;

procedure TForm6.FormShow(Sender: TObject);
begin
    DM.DataModule1.table_employee.filtered := false;
    DM.DataModule1.table_employee.filter:= 'code_act like ' + code_act;
    DM.DataModule1.table_employee.filtered := true;
end;

procedure TForm6.Rectangle1Click(Sender: TObject);
begin
  form6.Close;
end;

end.
