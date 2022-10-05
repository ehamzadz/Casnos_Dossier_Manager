unit uAdd_mise_en_demeure;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.Ani, FMX.Objects, FMX.StdCtrls,
  FMX.ListBox, FMX.DateTimeCtrls, FMX.Controls.Presentation, FMX.Edit,
  FMX.TabControl, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope;

type
  TForm9 = class(TForm)
    TabControl1: TTabControl;
    TabItem2: TTabItem;
    Rectangle1: TRectangle;
    Text16: TText;
    ColorAnimation1: TColorAnimation;
    Text22: TText;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Text1: TText;
    Edit1: TEdit;
    Text2: TText;
    Edit2: TEdit;
    Text3: TText;
    Edit3: TEdit;
    DateEdit1: TDateEdit;
    procedure Rectangle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}

uses DM;

procedure TForm9.Rectangle1Click(Sender: TObject);
var
  mat_adh: integer;
begin

  if (edit1.Text='') or (edit2.Text='') or (edit3.Text='') then begin
    showmessage('Completer tous les champs!');
  end else begin

    mat_adh := strtoint(Stringgrid1.Cells[0,Stringgrid1.Selected]);

    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add(' insert into mise_en_demeur (date_mise_en_demeur,prix_dette,som_pena_retard,periode,mat_adh) values(:date,:dette,:pen,:periode,:mat) ');
    DM.DataModule1.FDQuery1.ParamByName('date').asdate := dateedit1.date;
    DM.DataModule1.FDQuery1.ParamByName('dette').asinteger := strtoint(edit1.text);
    DM.DataModule1.FDQuery1.ParamByName('pen').asdate := strtoint(edit2.text);
    DM.DataModule1.FDQuery1.ParamByName('periode').asstring := edit3.text;
    DM.DataModule1.FDQuery1.ParamByName('mat').asinteger := mat_adh;
    DM.DataModule1.FDQuery1.ExecSQL;

    DM.DataModule1.table_mise_en_demeur.Active := false;
    DM.DataModule1.table_mise_en_demeur.Active := true;

    form9.Close;

  end;

end;

end.
