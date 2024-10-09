unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, Unit1;

type

  { TFormResult }

  TFormResult = class(TForm)
    BitBtnOk: TBitBtn;
    ImageCircle1: TImage;
    ImageCircle2: TImage;
    Image5Ball: TImage;
    Label1: TLabel;
    LabelResultText: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelBallAll: TLabel;
    LabelBallMy: TLabel;
    LabelBallSuccess: TLabel;
    LabelEfficiency: TLabel;
    Shape1: TShape;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticTextBall: TStaticText;
    ResultTimer: TTimer;
    procedure BitBtnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure ResultTimerTimer(Sender: TObject);
  private

  public

  end;

var
  FormResult: TFormResult;
  timer_time: Integer;

implementation

{$R *.lfm}

{ TFormResult }

procedure TFormResult.BitBtnOkClick(Sender: TObject);
begin
  FormResult.Close;
end;

procedure TFormResult.FormActivate(Sender: TObject);
begin
  timer_time := 4;
  FormResult.BitBtnOk.Caption := 'ОК (5)';
  FormResult.ResultTimer.Enabled := true;
end;

// анимация закрытия на фоне
procedure TFormResult.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  FormResultWallpapier.BitBtnCloseNew.Hide;
  FormResultWallpapier.CheckComboBoxBottom.Hide;
  FormResultWallpapier.ButtonNextWP.Top := FormResultWallpapier.ButtonNextWP.Top + 30;
  FormResultWallpapier.BitBtnSkipFillWP.Top := FormResultWallpapier.BitBtnSkipFillWP.Top + 30;
end;

// таймер
procedure TFormResult.ResultTimerTimer(Sender: TObject);
begin
  if (timer_time <= 0) then
  begin
    FormResult.ResultTimer.Enabled := false;
    FormResult.BitBtnOk.Enabled := true;
    FormResult.BitBtnOk.Caption := 'ОК';
  end
  else
  begin
    FormResult.BitBtnOk.Caption := 'ОК ('+IntToStr(timer_time)+')';
    timer_time := timer_time - 1;
  end;
end;

end.

