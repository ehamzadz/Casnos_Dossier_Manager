unit uAdd_adherent;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.TabControl,
  FMX.DateTimeCtrls, FMX.ListBox, FMX.StdCtrls, FMX.Ani;

type
  TForm3 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Text1: TText;
    Edit1: TEdit;
    Edit2: TEdit;
    Text2: TText;
    Edit3: TEdit;
    Text3: TText;
    DateEdit1: TDateEdit;
    Text4: TText;
    Edit4: TEdit;
    Text5: TText;
    Edit5: TEdit;
    Text6: TText;
    Text7: TText;
    Edit6: TEdit;
    Edit7: TEdit;
    Text8: TText;
    Edit8: TEdit;
    Text9: TText;
    Text10: TText;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Text11: TText;
    Edit9: TEdit;
    Text12: TText;
    Edit10: TEdit;
    Text13: TText;
    CheckBox1: TCheckBox;
    Text14: TText;
    Rectangle9: TRectangle;
    Text15: TText;
    ColorAnimation3: TColorAnimation;
    Rectangle1: TRectangle;
    Text16: TText;
    ColorAnimation1: TColorAnimation;
    Text17: TText;
    Edit11: TEdit;
    Text18: TText;
    Edit12: TEdit;
    Text19: TText;
    Edit13: TEdit;
    Text20: TText;
    Edit14: TEdit;
    procedure CheckBox1Change(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    matricule_adh :string;
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

uses DM;

procedure TForm3.CheckBox1Change(Sender: TObject);
begin
{  if checkbox1.IsChecked=true then begin
    text15.Text := 'Suivant';
  end else begin
    text15.Text := 'Ajouter';
  end;                       }
end;

procedure TForm3.Rectangle1Click(Sender: TObject);
begin

  if (edit11.Text='') or (edit12.Text='') or (edit13.Text='') or (edit14.Text='') then begin
    showmessage('Completer tous les champs!');
  end else begin

    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add(' INSERT INTO activite values(:code,:raison,:nom,:adr,:mat_adh) ');
    DM.DataModule1.FDQuery1.ParamByName('code').asinteger := strtoint(edit11.Text);
    DM.DataModule1.FDQuery1.ParamByName('raison').asstring := edit12.Text;
    DM.DataModule1.FDQuery1.ParamByName('nom').asstring := edit13.Text;
    DM.DataModule1.FDQuery1.ParamByName('adr').asstring := edit14.Text;
    DM.DataModule1.FDQuery1.ParamByName('mat_adh').asstring := matricule_adh;
    DM.DataModule1.FDQuery1.ExecSQL;

    //Refresh Table
    DM.DataModule1.table_activite.Active := false;
    DM.DataModule1.table_activite.Active := true;

  end;

  form3.Close;


end;

procedure TForm3.Rectangle9Click(Sender: TObject);
begin

  matricule_adh := edit1.Text;

  if (edit1.Text='') or (edit2.Text='') or (edit3.Text='') or (edit4.Text='') or (edit5.Text='') or (edit6.Text='') or (edit7.Text='') or (edit8.Text='') or (edit9.Text='') or (edit10.Text='') then begin
    showmessage('Completer tous les champs!');
  end else begin
    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add('INSERT INTO adherent values (:mat_adh,:nom_adh,:pre_adh,:date_adh,:per_pere_adh,:nom_mer_adh,:per_mer_adh,:adr_adh,:nat_adh,:sit_adh,:sexe_adh,:num_tel_adh,:num_compt_banc,:type)');
    DM.DataModule1.FDQuery1.ParamByName('mat_adh').asinteger := strtoint(edit1.Text);
    DM.DataModule1.FDQuery1.ParamByName('nom_adh').asstring := edit2.Text;
    DM.DataModule1.FDQuery1.ParamByName('pre_adh').asstring := edit3.Text;
    DM.DataModule1.FDQuery1.ParamByName('date_adh').asstring := datetostr(DATEEDIT1.Date);
    DM.DataModule1.FDQuery1.ParamByName('per_pere_adh').asstring := edit4.Text;
    DM.DataModule1.FDQuery1.ParamByName('nom_mer_adh').asstring := edit5.Text;
    DM.DataModule1.FDQuery1.ParamByName('per_mer_adh').asstring := edit6.Text;
    DM.DataModule1.FDQuery1.ParamByName('adr_adh').asstring := edit8.Text;
    DM.DataModule1.FDQuery1.ParamByName('nat_adh').asstring := edit7.Text;
    DM.DataModule1.FDQuery1.ParamByName('sit_adh').asstring := ComboBox1.Items[ComboBox1.ItemIndex];
    DM.DataModule1.FDQuery1.ParamByName('sexe_adh').asstring := ComboBox2.Items[ComboBox2.ItemIndex];
    DM.DataModule1.FDQuery1.ParamByName('num_tel_adh').asstring := edit9.Text;
    DM.DataModule1.FDQuery1.ParamByName('num_compt_banc').asstring := edit10.Text;

    if checkbox1.IsChecked=true then begin
      DM.DataModule1.FDQuery1.ParamByName('type').asstring := 'morale';
    end else begin
      DM.DataModule1.FDQuery1.ParamByName('type').asstring := 'normale';
    end;

    DM.DataModule1.FDQuery1.ExecSQL;
    DM.DataModule1.FDTable1.Active := false;
    DM.DataModule1.FDTable1.Active := true;

    tabcontrol1.TabIndex := 1;

  end;

end;

end.
