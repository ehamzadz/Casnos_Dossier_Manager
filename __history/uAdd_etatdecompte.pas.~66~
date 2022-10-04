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
    TabItem1: TTabItem;
    Rectangle2: TRectangle;
    Text5: TText;
    ColorAnimation2: TColorAnimation;
    Text6: TText;
    Edit5: TEdit;
    Text7: TText;
    Edit6: TEdit;
    Text8: TText;
    DateEdit2: TDateEdit;
    Text9: TText;
    Edit7: TEdit;
    Text10: TText;
    Edit8: TEdit;
    Text11: TText;
    Text12: TText;
    Edit9: TEdit;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    Text13: TText;
    Edit10: TEdit;
    Edit13: TEdit;
    Text14: TText;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    LinkGridToDataSourceBindSourceDB22: TLinkGridToDataSource;
    Button2: TButton;
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure StringGrid2CellClick(const Column: TColumn; const Row: Integer);
    procedure StringGrid3CellClick(const Column: TColumn; const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  mat_ecai :real;

implementation

{$R *.fmx}

uses DM;

procedure TForm7.Button1Click(Sender: TObject);
var
  solde :real;
begin
  if edit11.Text<>'' then begin

    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add(' select * from etat_de_decompte where mat_adh=:mat and code_act=:code order by date_versement DESC ');
    DM.DataModule1.FDQuery1.ParamByName('mat').asinteger := strtoint(Stringgrid1.Cells[0,Stringgrid1.Selected]);
    DM.DataModule1.FDQuery1.ParamByName('code').asinteger := strtoint(Stringgrid2.Cells[0,Stringgrid2.Selected]);
    DM.DataModule1.FDQuery1.open;

    if DM.DataModule1.FDQuery1.FieldByName('mont_encai').Value>0 then begin

      solde := DM.DataModule1.FDQuery1.FieldByName('mont_encai').Value;
      mat_ecai := DM.DataModule1.FDQuery1.FieldByName('mont_encai').Value;
      edit4.text := floattostr(solde);
      edit12.text := floattostr(solde + strtofloat(edit3.text) - strtofloat(edit11.text));

    end else begin
      solde := 0;
      edit4.text := floattostr(solde);
      edit12.text := floattostr(strtofloat(edit3.text) - strtofloat(edit11.text));
    end;
//
//    if DM.DataModule1.FDQuery1.FieldByName('mont_encai').Value>0 then begin
//      mat_ecai := DM.DataModule1.FDQuery1.FieldByName('mont_encai').Value;
//    end else mat_ecai:=0;

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

procedure TForm7.Rectangle1Click(Sender: TObject);
begin



    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add(' insert into etat_de_decompte (periode,nature,assiette,mont_fact,solde,date_versement,mont_encai,mat_adh,code_act) values(:periode,:nature,:ass,:mont_fact,:solde,:date,:mont_enc,:mat,:code) ');
    DM.DataModule1.FDQuery1.ParamByName('periode').asstring := edit2.text;
    DM.DataModule1.FDQuery1.ParamByName('nature').asstring := edit14.text;
    DM.DataModule1.FDQuery1.ParamByName('ass').asstring := Stringgrid2.Cells[4,Stringgrid2.Selected]; // edit1.text;
    DM.DataModule1.FDQuery1.ParamByName('mont_fact').asstring := edit11.text;
    DM.DataModule1.FDQuery1.ParamByName('solde').asstring := floattostr(mat_ecai);
    DM.DataModule1.FDQuery1.ParamByName('date').asdate := now;
    DM.DataModule1.FDQuery1.ParamByName('mont_enc').asstring := edit12.text;
    DM.DataModule1.FDQuery1.ParamByName('mat').asinteger := strtoint(Stringgrid1.Cells[0,Stringgrid1.Selected]);
    DM.DataModule1.FDQuery1.ParamByName('code').asinteger := strtoint(Stringgrid2.Cells[0,Stringgrid2.Selected]);
    DM.DataModule1.FDQuery1.ExecSQL;

    DM.DataModule1.table_etat.Active := false;
    DM.DataModule1.table_etat.Active := true;

    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add(' UPDATE activite SET assiette=:assiette where code_activite=:code ');
    DM.DataModule1.FDQuery1.ParamByName('assiette').asinteger := strtoint(edit12.text);
    DM.DataModule1.FDQuery1.ParamByName('code').asinteger := strtoint(Stringgrid2.Cells[0,Stringgrid2.Selected]);
    DM.DataModule1.FDQuery1.ExecSQL;

    DM.DataModule1.table_activite.Active := false;
    DM.DataModule1.table_activite.Active := true;

    form7.Close;
end;

procedure TForm7.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
  DM.DataModule1.table_activite.Filtered:= true;
  DM.DataModule1.table_activite.Filter := 'mat_adh = ' + Stringgrid1.Cells[0,Stringgrid1.Selected];
  DM.DataModule1.table_activite.Filtered:= true;
end;

procedure TForm7.StringGrid2CellClick(const Column: TColumn;
  const Row: Integer);
begin

  edit1.Text:= Stringgrid2.Cells[4,Stringgrid2.Selected];

end;

procedure TForm7.StringGrid3CellClick(const Column: TColumn;
  const Row: Integer);
begin
  DM.DataModule1.table_activite.Filtered:= true;
  DM.DataModule1.table_activite.Filter := 'mat_adh = ' + Stringgrid3.Cells[0,Stringgrid3.Selected];
  DM.DataModule1.table_activite.Filtered:= true;
end;

end.
