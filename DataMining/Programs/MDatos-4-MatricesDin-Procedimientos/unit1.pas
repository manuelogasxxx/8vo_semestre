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
  MAT2 = Array of Array of Integer;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    StringGrid1: TStringGrid;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
  private

  public
     //procedimiento que llena una matriz
     procedure llenamatriz(var MAT: MAT2; C,F: Integer);

     //calcular la sumatoria de los elementos la primer fila de la matriz
     function sumat(MAT: MAT2; C: Integer) : Integer;


  end;

var
  Form1: TForm1;
  //variables globales

  A,B : Integer; //variables enteras
  AR  : array [0..MAX-1] of real;  //arreglo de tipo real
  M   : array [0..MAX-1,0..MAX-1] of integer;        //Estatica

  MD  : MAT2;

  cont: Byte;

  Cols, Fils : Integer;


implementation

{$R *.lfm}

{ TForm1 }

//Codificacion de procedimientos

function Tform1.sumat(MAT:MAT2; C:Integer): Integer;
var
  valor, i: Integer;
begin
  valor:=0;

  for i:=0 to C-1 do begin
     valor:=valor + MAT[i,0];

  end;

  sumat:=valor;  //Devolver este valor en la función


end;

procedure Tform1.llenamatriz(var MAT:MAT2; C,F: Integer);
var
  i,j: Integer;
begin
  setlength(MAT,C,F);

  for i:=0 to Cols-1 do begin
     for j:=0 to Fils-1 do begin
        MAT[i,j]:= Random(200);

        StringGrid1.Cells[i,j]:= IntToStr(MAT[i,j]);

     end;
  end;

end;


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

procedure TForm1.Button5Click(Sender: TObject);
var
  i,j : integer;
begin
  //Asignar dimensiones especificadas en matriz y asignar valores
{  setlength(MD,Cols,Fils);

  for i:=0 to Cols-1 do begin
     for j:=0 to Fils-1 do begin
        M[i,j]:= Random(200);

        StringGrid1.Cells[i,j]:= IntToStr(M[i,j]);

     end;
  end;

 }
  Button6.Enabled:=True;
  llenamatriz(MD,Cols,Fils);

end;

procedure TForm1.Button6Click(Sender: TObject);
var
  s: Integer;

begin

   s:=sumat(MD,Cols); //llamar funcion de sumatoria

   ShowMessage('La suma es : ' + Inttostr(s) );

end;

procedure TForm1.Edit1Change(Sender: TObject);

begin

   Label1.Caption:=IntToStr(cont);
   inc(cont); //incrementar en 1

end;


procedure TForm1.FormCreate(Sender: TObject);

begin

  cont:=1;
  Trackbar1.Position:= Trackbar1.Min;
  TrackBar2.Position:=TrackBar2.Min;

  Fils:=Trackbar1.Position;
  Cols:=TRackbar2.Position;
  label2.Caption:=Inttostr(Fils);
  Label3.Caption:=Inttostr(Cols);


end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  Fils:=Trackbar1.Position;
  Label2.Caption:=Inttostr(Fils);
  //Modificar propiedades de stringgrid de acuerdo al valor position de TRackbar1 --> Filas
  Stringgrid1.RowCount:=Fils;
  StringGrid1.Height:= Stringgrid1.RowCount * StringGrid1.DefaultRowHeight + 7;





end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  Cols:=Trackbar2.Position;
  Label3.Caption:=Inttostr(Cols);
  //modificar tamaaño de stringgrid
  StringGrid1.ColCount:=Cols;
  StringGrid1.Width:= StringGrid1.ColCount * StringGrid1.DefaultColWidth + 7 ;

end;

end.


