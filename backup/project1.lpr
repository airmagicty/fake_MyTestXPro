program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2, Unit4
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=False;
  Application.Initialize;
  Application.CreateForm(TFormTestStart, FormTestStart);
  Application.CreateForm(TFormResultWallpapier, FormResultWallpapier);
  Application.CreateForm(TFormResult, FormResult);
  Application.Run;
end.

