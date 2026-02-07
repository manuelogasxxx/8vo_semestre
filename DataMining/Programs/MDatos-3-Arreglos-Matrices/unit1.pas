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
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ComCtrls;

const
  //constantes

  MAX=10;


type
 //tipos propios
 // Arreglo = array[0..12] of real;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    TrackBar1: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private

  public


  end;

var
  Form1: TForm1;
  //variables globales

  A,B : Integer; //variables enteras
  AR  : array [0..MAX-1] of real;  //arreglo de tipo real
  M   : array [0..MAX-1,0..MAX-1] of integer;

  cont: Byte;



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

  //REsultado a la caja Edit3

  Edit3.Text:=IntToStr(Sumar);



end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit4.Text:= Edit1.Text + Edit2.Text;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i : Integer;
begin
  //limpia semilla
  randomize();
  for i:=0 to MAX-1 do
  begin
    //LLenar arreglo
    AR[i]:= random(200) * 0.15;

    //Visualizar en Edit5
    Edit5.Text:= Edit5.Text + FloatToStr(AR[i]) + ', ';

  end;//for


end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i,j: Integer;
begin

  for i:=0 to MAX-1 do begin
     for j:=0 to MAX-1 do begin

        M[i,j] := random (500);
        //Visualizar valor en Stringgrid
        StringGrid1.Cells[i,j] := IntToStr(M[i,j]);

     end;

  end;

end;

procedure TForm1.Edit1Change(Sender: TObject);

begin

   Label1.Caption:=IntToStr(cont);
   inc(cont); //incrementar en 1

end;


procedure TForm1.FormCreate(Sender: TObject);

begin

  cont:=1;

end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin

  Label2.Caption:=Inttostr(TrackBar1.Position);


end;

end.

