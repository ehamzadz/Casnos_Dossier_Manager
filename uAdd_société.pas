unit uAdd_soci�t�;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.DateTimeCtrls;

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
    procedure Rectangle1Click(Sender: TObject);
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

procedure TForm6.Rectangle1Click(Sender: TObject);
begin

  if (edit11.Text='') or (edit12.Text='') or (edit13.Text='') or (edit14.Text='') then begin
    showmessage('Completer tous les champs!');
  end else begin

    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add(' INSERT INTO employee values(:nss,:nom,:prenom,:adr,:date,:mat) ');
    DM.DataModule1.FDQuery1.ParamByName('nss').asinteger := strtoint(edit11.Text);
    DM.DataModule1.FDQuery1.ParamByName('nom').asstring := edit12.Text;
    DM.DataModule1.FDQuery1.ParamByName('prenom').asstring := edit13.Text;
    DM.DataModule1.FDQuery1.ParamByName('adr').asstring := edit14.Text;
    DM.DataModule1.FDQuery1.ParamByName('date').asdate := strtodate(dateedit1.Text);
    DM.DataModule1.FDQuery1.ParamByName('mat').asinteger := strtoint(code_act);
    DM.DataModule1.FDQuery1.ExecSQL;

    //Refresh Tables
    DM.DataModule1.table_activite.Active := false;
    DM.DataModule1.table_activite.Active := true;

    form6.close;
  end;




end;

end.
