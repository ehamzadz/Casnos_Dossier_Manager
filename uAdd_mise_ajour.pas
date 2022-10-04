unit uAdd_mise_ajour;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, FMX.Ani,
  FMX.Objects, FMX.TabControl, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TForm8 = class(TForm)
    TabControl1: TTabControl;
    TabItem2: TTabItem;
    Rectangle1: TRectangle;
    Text16: TText;
    ColorAnimation1: TColorAnimation;
    Text22: TText;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    procedure Rectangle1Click(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid2CellClick(const Column: TColumn; const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

uses DM;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.DataModule1.table_activite.Filtered:= false;
  DM.DataModule1.table_etat.Filtered:= false;
end;

procedure TForm8.Rectangle1Click(Sender: TObject);
var
  mat_adh,code_act,id_etat :integer;
begin

  mat_adh := strtoint(Stringgrid1.Cells[0,Stringgrid1.Selected]);
  code_act := strtoint(Stringgrid2.Cells[0,Stringgrid2.Selected]);
  id_etat := strtoint(Stringgrid3.Cells[0,Stringgrid3.Selected]);

  DM.DataModule1.FDQuery1.SQL.Clear;
  DM.DataModule1.FDQuery1.SQL.Add(' insert into mise_ajour (mat_adh,code_act,id_etat,date_mise_ajour) values(:mat,:code,:id,:date) ');
  DM.DataModule1.FDQuery1.ParamByName('mat').asinteger := mat_adh;
  DM.DataModule1.FDQuery1.ParamByName('code').asinteger := code_act;
  DM.DataModule1.FDQuery1.ParamByName('id').asinteger := id_etat;
  DM.DataModule1.FDQuery1.ParamByName('date').asdate := now;
  DM.DataModule1.FDQuery1.ExecSQL;

  DM.DataModule1.table_mise_ajour_total.Active := false;
  DM.DataModule1.table_mise_ajour_total.Active := true;

  form8.Close;

end;

procedure TForm8.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
  DM.DataModule1.table_activite.Filtered:= false;
  DM.DataModule1.table_activite.Filter := 'mat_adh = ' + Stringgrid1.Cells[0,Stringgrid1.Selected];
  DM.DataModule1.table_activite.Filtered:= true;
end;

procedure TForm8.StringGrid2CellClick(const Column: TColumn;
  const Row: Integer);
begin
  DM.DataModule1.table_etat.Filtered:= false;
  DM.DataModule1.table_etat.Filter := 'code_act = ' + Stringgrid2.Cells[0,Stringgrid2.Selected];
  DM.DataModule1.table_etat.Filtered:= true;
end;

end.


