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
    BitBtnReturnPlay: TBitBtn;
    BitBtnClose: TBitBtn;
    CheckComboBox1: TCheckComboBox;
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
    LabelTitleInfo: TLabel;
    MainBaseMenu: TMainMenu;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    MenuItemFile: TMenuItem;
    MenuItemTest: TMenuItem;
    MenuItemSettings: TMenuItem;
    MenuItemWho: TMenuItem;
    RadioButton1: TRadioButton;
    RadioGroupWallpapier: TRadioGroup;
    TextStop: TEdit;
    MemoWallpapierText: TMemo;
    TextTime: TEdit;
    TextTaskList: TEdit;
    TextPoint: TEdit;
    TextResultBall: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure MemoWallpapierTextChange(Sender: TObject);
    procedure StaticText1Click(Sender: TObject);
  private

  public

  end;

var
  FormResultWallpapier: TFormResultWallpapier;

implementation

{$R *.lfm}

{ TFormResultWallpapier }

procedure TFormResultWallpapier.StaticText1Click(Sender: TObject);
begin
  end;

procedure TFormResultWallpapier.MemoWallpapierTextChange(Sender: TObject);
begin

end;

procedure TFormResultWallpapier.FormCreate(Sender: TObject);
begin

end;

end.

