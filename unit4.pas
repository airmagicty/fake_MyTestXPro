unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormTestStart }

  TFormTestStart = class(TForm)
    ButtonStart: TButton;
    procedure ButtonStartClick(Sender: TObject);
  private

  public

  end;

var
  FormTestStart: TFormTestStart;

implementation

{$R *.lfm}

{ TFormTestStart }

procedure TFormTestStart.ButtonStartClick(Sender: TObject);
begin
  //Application.CreateForm(TFormResult, FormResult);
  //Application.CreateForm(TFormResultWallpapier, FormResultWallpapier);
end;

end.

