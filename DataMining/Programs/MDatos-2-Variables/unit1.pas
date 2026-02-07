unit Unit1;

{$mode objfpc}{$H+}

// Comentario
{
 Es
mas
de
un renglon
}


interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  //variables globales

  A,B : Integer; //variables enteras




implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
    //variables locales para este evento
  Sumar: Integer;
begin
  //Almacenar valores en A y B
  A:= StrToInt(Edit1.text);
  B:= StrToInt(Edit2.text);
  Sumar:=A+B;
  //Resultado a la caja Edit3
  Edit3.Text:=IntToStr(Sumar);


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  //concatena texto de caja Edit1 y texto de Edit2
  Edit4.Text:= Edit1.Text + Edit2.Text;
end;

end.

