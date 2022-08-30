unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls;

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
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Rectangle8Click(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ShowPswdClicked: boolean;

implementation

{$R *.fmx}

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

procedure TForm1.FloatAnimation1Finish(Sender: TObject);
begin
  showmessage('Success!');
  image7.Visible := false;
  FloatAnimation1.Enabled := false;
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

end.
