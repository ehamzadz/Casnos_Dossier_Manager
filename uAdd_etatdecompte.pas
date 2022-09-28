unit uAdd_etatdecompte;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.Ani, FMX.Objects, FMX.TabControl,
  FMX.DateTimeCtrls, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.StdCtrls;

type
  TForm7 = class(TForm)
    TabControl1: TTabControl;
    TabItem2: TTabItem;
    Rectangle1: TRectangle;
    Text16: TText;
    ColorAnimation1: TColorAnimation;
    Text17: TText;
    Edit11: TEdit;
    Text18: TText;
    Edit12: TEdit;
    Text19: TText;
    Text20: TText;
    Edit14: TEdit;
    Text22: TText;
    DateEdit1: TDateEdit;
    Edit1: TEdit;
    Text1: TText;
    Text2: TText;
    Edit2: TEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Text3: TText;
    Edit3: TEdit;
    Button1: TButton;
    Edit4: TEdit;
    Text4: TText;
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.fmx}

uses DM;

procedure TForm7.Button1Click(Sender: TObject);
var
  solde :real;
begin
  if edit11.Text<>'' then begin

    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add(' select solde from etat_de_decompte where mat_adh=:mat and code_act=:code order by date_versement DESC ');
    DM.DataModule1.FDQuery1.ParamByName('mat').asinteger := strtoint(Stringgrid1.Cells[0,Stringgrid1.Selected]);
    DM.DataModule1.FDQuery1.ParamByName('code').asinteger := strtoint(Stringgrid2.Cells[0,Stringgrid2.Selected]);
    DM.DataModule1.FDQuery1.open;

    if DM.DataModule1.FDQuery1.Fields[0].Value>0 then begin
      solde := DM.DataModule1.FDQuery1.Fields[0].Value;
      edit4.text := floattostr(solde);
      edit12.text := floattostr(DM.DataModule1.FDQuery1.Fields[0].Value + strtofloat(edit3.text) - strtofloat(edit11.text));
    end else begin
      solde := 0;
      edit4.text := floattostr(solde);
      edit12.text := floattostr(strtofloat(edit3.text) - strtofloat(edit11.text));
    end;

  end;

end;

procedure TForm7.Edit1Change(Sender: TObject);
var
  montant :real;
begin
  if edit1.text<>'' then begin
    montant := strtoint(edit1.text) * 0.15;
    edit3.text := floattostr(montant);
  end;
end;

procedure TForm7.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
  DM.DataModule1.table_activite.Filtered:= true;
  DM.DataModule1.table_activite.Filter := 'mat_adh = ' + Stringgrid1.Cells[0,Stringgrid1.Selected];
  DM.DataModule1.table_activite.Filtered:= true;
end;

end.
