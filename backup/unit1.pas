unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, Buttons, ActnList, CheckLst, ComCtrls, ComboEx, ValEdit, MaskEdit,
  SynEdit;

type

  { TFormResultWallpapier }

  TFormResultWallpapier = class(TForm)
    BitBtnClose: TBitBtn;
    BitBtnSkipFillWP: TBitBtn;
    BitBtnReturnPlay: TBitBtn;
    BitBtnCloseNew: TButton;
    CheckComboBoxBottom: TCheckComboBox;
    EditBootom11: TEdit;
    EditBootom12: TEdit;
    EditBootom13: TEdit;
    EditBootom16: TEdit;
    EditBootom17: TEdit;
    EditBootom3: TEdit;
    EditBootom4: TEdit;
    EditBootom5: TEdit;
    EditBootom6: TEdit;
    EditBootom7: TEdit;
    EditBootom8: TEdit;
    EditBootom9: TEdit;
    Image1: TImage;
    LabelTitleInfo: TLabel;
    MainBaseMenu: TMainMenu;
    Memo1: TMemo;
    Memo10: TMemo;
    Memo2: TMemo;
    MemoBottomAllBalls: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    Memo8: TMemo;
    Memo9: TMemo;
    MemoWallpapierText: TMemo;
    MenuItemFile: TMenuItem;
    MenuItemTest: TMenuItem;
    MenuItemSettings: TMenuItem;
    MenuItemWho: TMenuItem;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    TextStop: TEdit;
    TextTaskList: TEdit;
    TextTime: TEdit;
    TextPoint: TEdit;
    TextResultBall: TEdit;
    ButtonNextWP: TToggleBox;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure MemoBottomAllBallsChange(Sender: TObject);
  private

  public

  end;

var
  FormResultWallpapier: TFormResultWallpapier;

implementation

{$R *.lfm}

{ TFormResultWallpapier }

procedure TFormResultWallpapier.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFormResultWallpapier.MemoBottomAllBallsChange(Sender: TObject);
begin

end;

procedure TFormResultWallpapier.BitBtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.

