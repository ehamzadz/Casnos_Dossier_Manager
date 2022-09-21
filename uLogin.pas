unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.TabControl, FireDAC.Stan.Param;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image3: TImage;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Image4: TImage;
    Text2: TText;
    Rectangle8: TRectangle;
    Image6: TImage;
    Text4: TText;
    ColorAnimation1: TColorAnimation;
    ColorAnimation2: TColorAnimation;
    Rectangle10: TRectangle;
    Rectangle1: TRectangle;
    Image2: TImage;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Edit1: TEdit;
    Rectangle7: TRectangle;
    Edit2: TEdit;
    Rectangle9: TRectangle;
    Text5: TText;
    Text6: TText;
    Text1: TText;
    Text3: TText;
    ColorAnimation3: TColorAnimation;
    Image5: TImage;
    Image7: TImage;
    FloatAnimation1: TFloatAnimation;
    EditButton1: TEditButton;
    StyleBook1: TStyleBook;
    Text7: TText;
    TabControl1: TTabControl;
    tabLogin: TTabItem;
    tabRegister: TTabItem;
    Rectangle11: TRectangle;
    Image8: TImage;
    Image9: TImage;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Image10: TImage;
    Text8: TText;
    ColorAnimation4: TColorAnimation;
    Rectangle15: TRectangle;
    Image11: TImage;
    Text9: TText;
    ColorAnimation5: TColorAnimation;
    Image12: TImage;
    Image13: TImage;
    FloatAnimation2: TFloatAnimation;
    Rectangle16: TRectangle;
    Image14: TImage;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Edit3: TEdit;
    Rectangle20: TRectangle;
    Text10: TText;
    ColorAnimation6: TColorAnimation;
    Text11: TText;
    Text12: TText;
    Text14: TText;
    Rectangle21: TRectangle;
    ColorAnimation7: TColorAnimation;
    Rectangle19: TRectangle;
    ColorAnimation8: TColorAnimation;
    Rectangle22: TRectangle;
    Edit4: TEdit;
    Text13: TText;
    Rectangle23: TRectangle;
    Edit5: TEdit;
    Text15: TText;
    Rectangle24: TRectangle;
    Text16: TText;
    Edit6: TEdit;
    EditButton2: TEditButton;
    Image15: TImage;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Rectangle8Click(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure Text14Click(Sender: TObject);
    procedure Text7Click(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure Rectangle20Click(Sender: TObject);
    procedure FloatAnimation2Finish(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VAR_USER_GLOB :string;
  end;

var
  Form1: TForm1;
  ShowPswdClicked,ShowPswdClicked2: boolean;

implementation

{$R *.fmx}

uses DM, uMain;

procedure TForm1.EditButton1Click(Sender: TObject);
begin
  if (ShowPswdClicked = false) then begin
    edit2.Password := false;
    ShowPswdClicked := true;
  end else begin
    edit2.Password := true;
    ShowPswdClicked := false;
  end;
end;

procedure TForm1.EditButton2Click(Sender: TObject);
begin
  if (ShowPswdClicked2 = false) then begin
    edit6.Password := false;
    ShowPswdClicked2 := true;
  end else begin
    edit6.Password := true;
    ShowPswdClicked2 := false;
  end;

end;

procedure TForm1.FloatAnimation1Finish(Sender: TObject);
var
  Var_User, Var_Pswd :string;
begin
  image7.Visible := false;
  FloatAnimation1.Enabled := false;
  //showmessage('Success!');

  Var_User := edit1.Text;
  Var_Pswd := edit2.Text;

  DM.DataModule1.FDQuery1.SQL.Clear;
  DM.DataModule1.FDQuery1.SQL.Add('select count(username) from users where username=:usr and password=:pswd ');
  DM.DataModule1.FDQuery1.ParamByName('usr').AsString := Var_User;
  DM.DataModule1.FDQuery1.ParamByName('pswd').AsString := Var_Pswd;

  DM.DataModule1.FDQuery1.Open();

  if (DM.DataModule1.FDQuery1.Fields[0].asinteger=0) then begin
    showmessage('Invalid!');
  end else begin
    VAR_USER_GLOB := Var_User;

    Visible := False; // Makes Form1 invisible
    try
      form2.ShowModal; // Shows the Form
    finally
      close;
    end;
  end;


end;

procedure TForm1.FloatAnimation2Finish(Sender: TObject);
begin
  image13.Visible := false;
  FloatAnimation2.Enabled := false;
  showmessage('Inscrit avec succ�s');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ShowPswdClicked := false;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if (Button = TMouseButton.mbLeft) then StartWindowDrag;
end;

procedure TForm1.Rectangle20Click(Sender: TObject);
var
  Var_User, Var_Pswd, Var_service, Var_Name: string;
begin

  Var_Name := edit3.Text;
  Var_service := edit4.Text;
  Var_User := edit5.Text;
  Var_Pswd := edit6.Text;

  if (Var_Name='') OR (Var_service='') OR (Var_User='') OR (Var_Pswd='') then begin
    showmessage('Completer tous les champs:');
  end else begin

    DM.DataModule1.FDQuery1.SQL.Clear;
    DM.DataModule1.FDQuery1.SQL.Add('select count(username) from users where username=:usr and password=:pswd ');
    DM.DataModule1.FDQuery1.ParamByName('usr').AsString := Var_User;
    DM.DataModule1.FDQuery1.ParamByName('pswd').AsString := Var_Pswd;

    DM.DataModule1.FDQuery1.Open();

    if (DM.DataModule1.FDQuery1.Fields[0].asinteger=0) then begin
      DM.DataModule1.FDQuery1.SQL.Clear;
      DM.DataModule1.FDQuery1.SQL.Add('insert into users values(:usr,:pswd,:nom,:service)');
      DM.DataModule1.FDQuery1.ParamByName('usr').value := Var_User;
      DM.DataModule1.FDQuery1.ParamByName('pswd').value := Var_Pswd;
      DM.DataModule1.FDQuery1.ParamByName('nom').value := Var_Name;
      DM.DataModule1.FDQuery1.ParamByName('service').value := Var_service;

      DM.DataModule1.FDQuery1.ExecSQL;

      image13.Visible := true;
      FloatAnimation2.Enabled := true;

    end else begin
      showmessage('Invalid Username!');
    end;
  end;

end;

procedure TForm1.Rectangle8Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.Rectangle9Click(Sender: TObject);
begin
  {rectangle9.Margins.Left := 7;
  rectangle9.Margins.Right := 7;
  text5.Color := TAlphaColorRec.White;}
  image7.Visible := true;
  FloatAnimation1.Enabled := true;
end;

procedure TForm1.Text14Click(Sender: TObject);
begin
  tabcontrol1.TabIndex :=0;
end;

procedure TForm1.Text7Click(Sender: TObject);
begin
  tabcontrol1.TabIndex :=1;
end;

end.
