unit _About_;

interface

uses
  LCLIntf, LCLType, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TfAbout = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Timer2: TTimer;
    procedure FormClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbout: TfAbout;

implementation

uses _Easter_;

  {$R *.lfm}

procedure TfAbout.FormClick(Sender: TObject);
begin
  fAbout.Close;
  fMain.Enabled := True;
end;

procedure TfAbout.Timer1Timer(Sender: TObject);
const
  px: integer = 3;
  py: integer = 1;
begin
  image1.left := image1.left + px;
  if (image1.left + image1.Width + px > panel1.Width - 2) or (image1.left + px < 2) then
    px := -px;
  image1.top := image1.top + py;
  if (image1.top + image1.Height + py > panel1.Height - 2) or (image1.top + py < 2) then
    py := -py;
end;

procedure TfAbout.Timer2Timer(Sender: TObject);
const
  px: integer = 1;
  py: integer = 3;
begin
  label1.left := label1.left + px;
  if (label1.left + label1.Width + px > panel1.Width - 2) or (label1.left + px < 2) then
    px := -px;
  label1.top := label1.top + py;
  if (label1.top + label1.Height + py > panel1.Height - 2) or (label1.top + py < 2) then
    py := -py;
end;

end.
