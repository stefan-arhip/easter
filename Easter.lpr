program Easter;

uses
  Forms, Interfaces,
  _Easter_ in '_Easter_.pas' {Form1},
  _About_ in '_About_.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfAbout, fAbout);
  Application.Run;
end.
