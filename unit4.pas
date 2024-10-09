unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, Menus, ActnList, ColorBox, CheckLst, ValEdit, ComboEx, Process,
  LazUTF8, Unit2, Unit1, DateUtils;

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
try
    AProcess.Executable := 'cmd';
    AProcess.Parameters.Add('/c');
    AProcess.Parameters.Add('taskkill');
    AProcess.Parameters.Add('/f');
    AProcess.Parameters.Add('/im');
    AProcess.Parameters.Add('MyTestStudent.exe');
    AProcess.Options := AProcess.Options + [poWaitOnExit];
    AProcess.Execute;
finally
    AProcess.Free;
end;
end;

procedure TFormTestStart.ButtonStartClick(Sender: TObject);
var
  current_time, new_time, difference_time: TDateTime;
  edit_all_ball, edit_my_ball, edit_success_ball, edit_success_ball_ball: Integer;
  edit_progress: Real;
begin
  // убиваем процесс теста
  TaskKill();

   // открываем новые окна и скрываем старое
  FormResultWallpapier.Show;
  FormResult.Show;
  FormTestStart.Hide;

  // передаем название теста в заголовки и в
  if (length(FormTestStart.EditTestName.Text) <> 0) then
  begin
    FormResultWallpapier.Caption := FormTestStart.EditTestName.Text+'.mtx - MyTestStudent [MyTestXPro] НЕЗАРЕГИСТРИРОВАННАЯ ВЕРСИЯ';
    if (FormTestStart.CheckBoxTestName.Checked = true) then
    begin
      FormResultWallpapier.TextStop.Text := 'Тест "'+FormTestStart.EditTestName.Text+'" остановлен.';
    end;
  end
  else
  begin
    FormResultWallpapier.Caption := 'Тестирование.mtx - MyTestStudent [MyTestXPro] НЕЗАРЕГИСТРИРОВАННАЯ ВЕРСИЯ';
  end;


  // фио и класс
  if (length(FormTestStart.EditTestName.Text) <> 0) then
  begin
    FormResult.Caption := 'Результаты тестирования ('+FormTestStart.EditNameFamilyClass.Text+')';
  end
  else
  begin
    FormResult.Caption := 'Результаты тестирования (Имя Фамилия 4)';
  end;

  // время прохождения
  current_time := Now;
  if ((length(FormTestStart.EditTestTime.Text) <> 0) and (StrToInt(FormTestStart.EditTestTime.Text) > 0)) then
  begin
    new_time := IncMinute(current_time, StrToInt(FormTestStart.EditTestTime.Text));
  end
  else
  begin
    new_time := IncMinute(current_time, 8);
  end;
  difference_time := new_time - current_time;
  FormResultWallpapier.TextTime.Text := 'Время начала: '+FormatDateTime('hh:nn:ss', current_time)+'. Время завершения: '+FormatDateTime('hh:nn:ss', new_time)+'. Продолжительность: '+FormatDateTime('hh:nn:', difference_time)+'17.';

  // количество вопросов, заданий, правильных ответов, оценка
  if (length(FormTestStart.EditAllBall.Text) <> 0) then
  begin
    edit_all_ball := StrToInt(FormTestStart.EditAllBall.Text);
  end
  else
  begin
    edit_all_ball := 30;
  end;

  if (length(FormTestStart.EditMyBall.Text) <> 0) then
  begin
    edit_my_ball := StrToInt(FormTestStart.EditMyBall.Text);
  end
  else
  begin
    edit_my_ball := 30;
  end;

  if (length(FormTestStart.EditSuccessBall.Text) <> 0) then
  begin
    edit_success_ball := StrToInt(FormTestStart.EditSuccessBall.Text);
  end
  else
  begin
    edit_success_ball := 30;
  end;

  if (length(FormTestStart.EditSuccessBallBall.Text) <> 0) then
  begin
    edit_success_ball_ball := StrToInt(FormTestStart.EditSuccessBallBall.Text);
  end
  else
  begin
    edit_success_ball_ball := 5;
  end;

  edit_progress := round((edit_success_ball / edit_all_ball) * 100);

  FormResultWallpapier.TextPoint.Text := 'Всего заданий в тесте: '+IntToStr(edit_all_ball)+'. Задано заданий: '+IntToStr(edit_my_ball)+'. Выполнено: '+IntToStr(edit_my_ball)+'. Правильно: '+IntToStr(edit_success_ball)+'. ';
  FormResultWallpapier.TextTaskList.Text := 'Набрано '+IntToStr(edit_success_ball)+' баллов из '+IntToStr(edit_all_ball)+' возможных. Ваш результат: '+FloatToStr(edit_progress)+',0%.';
  FormResultWallpapier.TextResultBall.Text := 'Оценка: '+IntToStr(edit_success_ball_ball)+'.';

  FormResultWallpapier.MemoBottomAllBalls.Text := IntToStr(edit_all_ball);

  FormResult.LabelBallAll.Caption := IntToStr(edit_all_ball);
  FormResult.LabelBallMy.Caption := IntToStr(edit_my_ball);
  FormResult.LabelBallSuccess.Caption := IntToStr(edit_success_ball);
  FormResult.LabelEfficiency.Caption := FloatToStr(edit_progress)+'%';
  FormResult.LabelResultText.Caption := 'Набрано баллов: '+IntToStr(edit_success_ball)+' из '+IntToStr(edit_all_ball)+' возможных.'+#13+'Ваш результат: '+FloatToStr(edit_progress)+'%.';
  FormResult.StaticTextBall.Caption := 'Ваша оценка: '+IntToStr(edit_success_ball_ball);

  // загрузка ресурсов в зависимости от прогресса по баллам
  if (edit_progress = 100) then
  begin
    FormResultWallpapier.ImageQR.Picture.PNG.LoadFromResourceName(HINSTANCE, 'QR_100');
    FormResult.ImageCircle1.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_100');
    FormResult.ImageCircle2.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_100');
  end
  else if (edit_progress >= 95) and (edit_progress < 100) then
  begin
    FormResultWallpapier.ImageQR.Picture.PNG.LoadFromResourceName(HINSTANCE, 'QR_95');
    FormResult.ImageCircle1.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_95');
    FormResult.ImageCircle2.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_95');
  end
  else if (edit_progress >= 90) and (edit_progress < 95) then
  begin
    FormResultWallpapier.ImageQR.Picture.PNG.LoadFromResourceName(HINSTANCE, 'QR_90');
    FormResult.ImageCircle1.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_90');
    FormResult.ImageCircle2.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_90');
  end
  else if (edit_progress >= 80) and (edit_progress < 90) then
  begin
    FormResultWallpapier.ImageQR.Picture.PNG.LoadFromResourceName(HINSTANCE, 'QR_80');
    FormResult.ImageCircle1.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_80');
    FormResult.ImageCircle2.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_80');
  end
  else if (edit_progress >= 70) and (edit_progress < 80) then
  begin
    FormResultWallpapier.ImageQR.Picture.PNG.LoadFromResourceName(HINSTANCE, 'QR_70');
    FormResult.ImageCircle1.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_70');
    FormResult.ImageCircle2.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_70');
  end
  else if (edit_progress >= 60) and (edit_progress < 70) then
  begin
    FormResultWallpapier.ImageQR.Picture.PNG.LoadFromResourceName(HINSTANCE, 'QR_60');
    FormResult.ImageCircle1.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_60');
    FormResult.ImageCircle2.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_60');
  end
  else if (edit_progress > 0) and (edit_progress < 60) then
  begin
    FormResultWallpapier.ImageQR.Picture.PNG.LoadFromResourceName(HINSTANCE, 'QR_50');
    FormResult.ImageCircle1.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_50');
    FormResult.ImageCircle2.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_50');
  end
  else if (edit_progress = 0) then
  begin
    FormResultWallpapier.ImageQR.Picture.PNG.LoadFromResourceName(HINSTANCE, 'QR_0');
    FormResult.ImageCircle1.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_0');
    FormResult.ImageCircle2.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_0');
  end
  else
  begin
    FormResultWallpapier.ImageQR.Picture.PNG.LoadFromResourceName(HINSTANCE, 'QR_90');
    FormResult.ImageCircle1.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_90');
    FormResult.ImageCircle2.Picture.PNG.LoadFromResourceName(HINSTANCE, 'C_90');
  end;

  // если 5 то зеленый фон
  if (edit_success_ball_ball = 5) then
  begin
    FormResult.Image5Ball.Visible := true;
  end;
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
              'Версия: 1.1 release'+#13+
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
              '5. В строку [верно; балл=] введите количество правильных вопросов.'+#13+
              '5.1 В строку [балл=] введите желаемую оценку.'+#13+
              '6. В строку [Проходил (мин)] введите время, затраченное на прохождение теста.'+#13+
              '7. Нажмите [Создать] - это окно скроется, закроется открытый процесс (если поле [Процесс.exe] не пустое) и откроется сгенерированное окно с заданными параметрами.'+#13+
              'Примечание1: при сворачивании сгенерированного окна с результатом - оно скроется.'+#13+
              #13+
              'Создано для: MyTestXPro современная версия популярной программы компьютерного тестирования знаний.'+#13);
end;

end.

