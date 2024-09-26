unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, Process, LazUTF8, Unit2, Unit1;

type

  { TFormTestStart }

  TFormTestStart = class(TForm)
    BitBtnInfo: TBitBtn;
    ButtonStart: TButton;
    CheckBoxTestName: TCheckBox;
    EditSuccessBallBall: TEdit;
    EditTestTime: TEdit;
    EditTestName: TEdit;
    EditNameFamilyClass: TEdit;
    EditAllBall: TEdit;
    EditMyBall: TEdit;
    EditSuccessBall: TEdit;
    procedure BitBtnInfoClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure EditAllBallEditingDone(Sender: TObject);
  private

  public

  end;

var
  FormTestStart: TFormTestStart;

implementation

{$R *.lfm}

{ TFormTestStart }

//TaskKill
procedure TaskKill();
var AProcess: TProcess;
  begin
    AProcess := TProcess.Create(nil);
    AProcess.CommandLine := 'cmd  /x/c taskkill /f /im "MyTestStudent.exe"';
    AProcess.Options := AProcess.Options + [poWaitOnExit];
    AProcess.Execute;
    AProcess.Free;
end;

procedure TFormTestStart.ButtonStartClick(Sender: TObject);
begin
  // убиваем процесс теста
  //TaskKill();

   // открываем новые окна и скрываем старое
  FormResultWallpapier.Show;
  FormResult.Show;
  FormTestStart.Hide;

  // передаем значения в нужные поля
  //FormResult.LabelBallAll.Caption:=;
end;

procedure TFormTestStart.EditAllBallEditingDone(Sender: TObject);
begin
  if (length(FormTestStart.EditMyBall.Text) = 0) then
  begin
    FormTestStart.EditMyBall.Text := FormTestStart.EditAllBall.Text;
    end;
end;

procedure TFormTestStart.BitBtnInfoClick(Sender: TObject);
begin
  ShowMessage('FSTest - Генератор результата тестирования MyTestXPro'+#13+
              'Версия: 1.0 release'+#13+
              'Разработчик: airmagicty'+#13+
              '© 2024г'+#13+
              #13+
              'Автор не несет ответственности за использование пользователем данной программы, все предоставлено исключительно в образовательных и развлекательных целях.'+#13+
              #13+
              'Инструкция по использованию:'+#13+
              '1. В строку [Имя теста] введите название вашего теста, которое отобразится вверху панели.'+#13+
              '1.1 Выберите, указывать ли название теста в отчете: по умолчанию не указывается.'+#13+
              '2. В строку [Имя Фам Класс] введите Фамилию Имя Класс, которые так же отобразятся в результате.'+#13+
              '3. В строку [заданий в тесте] введите количество вопросов в тесте.'+#13+
              '4. В строку [заданий задано] введите количество вопросов, которое вы из них прошли.'+#13+
              '5. В строку [из них правильно] введите количество правильных вопросов.'+#13+
              '6. В строку [Проходил (мин)] введите время, затраченное на прохождение теста.'+#13+
              '7. Нажмите [Создать] - это окно скроется, закроется открытый процесс (если поле [Процесс.exe] не пустое) и откроется сгенерированное окно с заданными параметрами.'+#13+
              'Примечание1: при сворачивании сгенерированного окна с результатом - оно скроется.'+#13+
              #13+
              'Создано для: MyTestXPro современная версия популярной программы компьютерного тестирования знаний.'+#13);
end;

end.

