unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Process, LazUTF8,
  Unit2, Unit1;

type

  { TFormTestStart }

  TFormTestStart = class(TForm)
    ButtonStart: TButton;
    EditTime: TEdit;
    EditTestName: TEdit;
    EditNameFamilyClass: TEdit;
    EditAllBall: TEdit;
    EditMyBall: TEdit;
    EditSuccessBall: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure ButtonStartClick(Sender: TObject);
  private

  public

  end;

var
  FormTestStart: TFormTestStart;

implementation

{$R *.lfm}

{ TFormTestStart }

//TaskKill
procedure TaskKill(FileName: String);
var AProcess: TProcess;
  begin
    AProcess := TProcess.Create(nil);
    AProcess.CommandLine := 'cmd  /x/c taskkill /f /im "'+FileName+'"';
    //AProcess.CommandLine := 'notepad.exe';
    AProcess.Options := AProcess.Options + [poWaitOnExit];
    AProcess.Execute;
    AProcess.Free;
    //ShowMessage ('notepad.exe остановлен!');
end;

procedure TFormTestStart.ButtonStartClick(Sender: TObject);
begin
  // открываем новые окна и скрываем старое
  FormResultWallpapier.Show;
  FormResult.Show;
  FormTestStart.Hide;
end;

end.

