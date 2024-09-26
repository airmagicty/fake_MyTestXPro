unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TFormResult }

  TFormResult = class(TForm)
    BitBtnOk: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Shape1: TShape;
    StaticTextBall: TStaticText;
    procedure BitBtnOkClick(Sender: TObject);
  private

  public

  end;

var
  FormResult: TFormResult;

implementation

{$R *.lfm}

{ TFormResult }

procedure TFormResult.BitBtnOkClick(Sender: TObject);
begin
  FormResult.Close;
end;

end.

