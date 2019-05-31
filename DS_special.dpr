program DS_special;

uses
  Forms,
  DS_special_pas in 'DS_special_pas.pas' {Form1},
  Unit1 in 'Unit1.pas' {Frame1: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
