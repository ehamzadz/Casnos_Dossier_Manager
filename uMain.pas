unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.ImageList, FMX.ImgList, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Ani, FMX.Effects, FMX.TabControl, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FireDAC.UI.Intf,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI, Vcl.Dialogs;

type
  TForm2 = class(TForm)
    nav_bar: TRectangle;
    Rectangle17: TRectangle;
    logo: TImage;
    Rectangle18: TRectangle;
    Circle1: TCircle;
    N_of_Users_Invts: TText;
    current_tab: TRectangle;
    ImageList1: TImageList;
    Rectangle1: TRectangle;
    Brush1: TBrushObject;
    Brush2: TBrushObject;
    sub_menu: TRectangle;
    SubMenu_Animation: TFloatAnimation;
    Rectangle14: TRectangle;
    Rectangle9: TRectangle;
    ag_de_wly: TLabel;
    Text7: TText;
    Rectangle2: TRectangle;
    Brush3: TBrushObject;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Image1: TImage;
    ColorAnimation1: TColorAnimation;
    Rectangle5: TRectangle;
    Image2: TImage;
    ColorAnimation2: TColorAnimation;
    Rectangle7: TRectangle;
    Image3: TImage;
    ColorAnimation3: TColorAnimation;
    Rectangle10: TRectangle;
    Image4: TImage;
    ColorAnimation4: TColorAnimation;
    Rectangle6: TRectangle;
    Text1: TText;
    Rectangle8: TRectangle;
    Text2: TText;
    Rectangle11: TRectangle;
    Text3: TText;
    content: TRectangle;
    Rectangle15: TRectangle;
    Image6: TImage;
    Text4: TText;
    ColorAnimation5: TColorAnimation;
    Rectangle16: TRectangle;
    Text5: TText;
    top_bar: TRectangle;
    Rectangle13: TRectangle;
    Rectangle19: TRectangle;
    Image5: TImage;
    text_user: TText;
    text_title: TText;
    Rectangle20: TRectangle;
    Image7: TImage;
    TabControl1: TTabControl;
    acceuil: TTabItem;
    adherent: TTabItem;
    users: TTabItem;
    settings: TTabItem;
    Rectangle12: TRectangle;
    Rectangle22: TRectangle;
    Text8: TText;
    Rectangle21: TRectangle;
    Brush4: TBrushObject;
    btn_add_adherent: TRectangle;
    Text6: TText;
    Rectangle25: TRectangle;
    Text10: TText;
    Brush5: TBrushObject;
    Brush6: TBrushObject;
    Brush7: TBrushObject;
    Brush8: TBrushObject;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    StyleBook1: TStyleBook;
    Brush9: TBrushObject;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    btn_del_adherent: TRectangle;
    Rectangle24: TRectangle;
    Text9: TText;
    Text11: TText;
    Brush10: TBrushObject;
    Brush11: TBrushObject;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Rectangle15Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Rectangle10Click(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
    procedure Rectangle7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure SubMenu_AnimationFinish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rectangle19MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btn_del_adherentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  i:integer;

implementation

{$R *.fmx}

uses uLogin, DM;

procedure TForm2.btn_del_adherentClick(Sender: TObject);
var
  matricule :integer;
begin
  if MessageDlg('Voulez vous sure?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    matricule := strtoint(Stringgrid1.Cells[0,Stringgrid1.Selected]);

    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add(' DELETE From adherent where mat_adh=:mat ');
    DM.DataModule1.FDQuery1.ParamByName('mat').asinteger := matricule;
    DM.DataModule1.FDQuery1.ExecSQL;
    DM.DataModule1.FDTable1.Active := false;
    DM.DataModule1.FDTable1.Active := true;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  i := 1;
end;

procedure TForm2.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if (Button = TMouseButton.mbLeft) then StartWindowDrag;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  text_user.Text := 'Bienvenue ' + form1.VAR_USER_GLOB;
end;

procedure TForm2.Image7Click(Sender: TObject);
begin

  if i=1 then begin
    i := 0;
    SubMenu_Animation.StartValue := 224;
    SubMenu_Animation.StopValue := 0;
    SubMenu_Animation.Enabled := true;
    rectangle14.Visible := false;
  end else begin
    if i=0 then begin
      i := 1;
      SubMenu_Animation.StartValue := 0;
      SubMenu_Animation.StopValue := 224;
      SubMenu_Animation.Enabled := true;
    end;
  end;

end;

procedure TForm2.Rectangle10Click(Sender: TObject);
var
  this :TButton;
begin
  this := TButton(sender);
  current_tab.Parent := this;
  text_title.Text := 'Adh�rent informations';
  tabcontrol1.TabIndex := 1;
end;

procedure TForm2.Rectangle15Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm2.Rectangle19MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if (Button = TMouseButton.mbLeft) then StartWindowDrag;
end;

procedure TForm2.Rectangle3Click(Sender: TObject);
var
  this :TButton;
begin
  this := TButton(sender);
  current_tab.Parent := this;
  text_title.Text := 'Acceuil';
  tabcontrol1.TabIndex := 0;
end;

procedure TForm2.Rectangle5Click(Sender: TObject);
var
  this :TButton;
begin
  this := TButton(sender);
  current_tab.Parent := this;
  text_title.Text := 'Param�tres';
  tabcontrol1.TabIndex := 3;
end;

procedure TForm2.Rectangle7Click(Sender: TObject);
var
  this :TButton;
begin
  this := TButton(sender);
  current_tab.Parent := this;
  text_title.Text := 'Utilisateurs';
  tabcontrol1.TabIndex := 2;
end;

procedure TForm2.SubMenu_AnimationFinish(Sender: TObject);
begin
  SubMenu_Animation.Enabled := false;
  if i=1 then rectangle14.Visible := true;
end;

end.
