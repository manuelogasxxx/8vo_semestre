unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

const
  MAX=10; //se puede cambiar
type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

  F:Textfile;  //Manipular archivo

  AR  : array [0..MAX-1] of real;  //arreglo de tipo real

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  cad : String;  //cadena
  i   : Integer;
  begin
   cad:=Edit1.Text;
   //a toda la cadena
  // cad:=UpperCase(cad);

  //por caracter
   for i:=1 to length(cad) do begin

     cad[i]:=UpCase(cad[i]);

   end;


   Edit1.Text:=cad;


end;


//función para comprobar que una cadena sea un palíndromo
procedure TForm1.Button2Click(Sender: TObject);
var cadena1, cadena2: string;
var longCadena,i,max: integer;
  flag:boolean;
begin
     //inicialización de la bandera
     flag:=false;
     cadena1 := edit1.Text;
     cadena2 := edit1.Text;
     max:=length(cadena1);
     for i:=1 to length(cadena1) do begin
        if(cadena1[i] <> cadena2[max]) then begin
           flag:=true;
           break;
        end;
        max:=max-1;
     end;

     if(not flag) then begin
        ShowMessage('la cadena si es un palíndromo');
     end
     else begin
       ShowMessage('la cadena no es un palíndromo');
     end;


end;

//generar aleatorios
procedure TForm1.Button3Click(Sender: TObject);
var
  i:integer;
begin
     randomize();
     Edit2.Clear;
     for i:=0 to MAX-1 do
      begin
        //LLenar arreglo
        AR[i]:= random(200) * 0.15;

        //Visualizar en Edit5
        Edit2.Text:= Edit2.Text + FloatToStr(AR[i]) + ', ';

      end;//for


end;


//botón para ordenar el arreglo
procedure TForm1.Button4Click(Sender: TObject);
var i,j:integer;
  aux: real;
begin
    for i:=0 to (MAX-1) do begin
      for j:=0 to (MAX-1) do begin
        if(AR[i]<AR[j]) then begin
           //hacer el intercambio
           aux:= AR[i];
           AR[i]:= AR[j];
           AR[j]:= aux;
        end;
      end;
    end;

    //visualizar los cambios
    Edit2.clear;
    for i:=0 to (MAX-1) do begin
       Edit2.Text:= Edit2.Text + FloatToStr(AR[i]) + ', ';
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
 //solicitar archivo y mostrar contenido en Memo


 if (OpenDialog1.Execute=True) then  //Si eligió un archivo
 begin

   Memo1.Lines.LoadFromFile(Opendialog1.FileName);
 end;

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var
  renglon : String;
begin
 //Abrir archivo, leer cecuancialmente contenido y visualizar en Memo

 if (Opendialog1.Execute=True) then begin

   AssignFile(F,Opendialog1.FileName);

   //Intentar abrirlo
   {$I-}
      Reset(F);  //abrir sin re escribir

   {$I+}

   if (IOResult=0) then   //Todo bien
   begin
     Memo1.Clear;
      while not(EOF(F)) do begin
         readln(F,renglon);      //leer
         Memo1.Lines.Add(renglon);     //mandar a memo

      end;
    CloseFile(F);  //cerrrar archivo
   end

   else
   begin
     ShowMessage('No se puede abrir...intente con otro programador');
   end;




 end;


end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
 //EScribir al final del archivo que eliga el usuario
 //Se escribo lo que contenga Edit1

 if (OpenDialog1.Execute=True) then
 begin
   Assignfile(F,opendialog1.FileName);

   {$I-}
     reset(F);
   {$I+}

   if IOResult= 0 then
   begin
     append(F);  //apuntador de archivo al final
     writeln(F,Edit1.Text);
     CloseFile(F);


   end;



 end;


end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  If SaveDialog1.Execute then
  begin
    AssignFile(F,Savedialog1.FileName);


    {$I-}
     rewrite(F);  //crear archivo...si existe Sobre escribe y destruye

    {$I+}

    if IOResult=0 then
    begin
       Writeln(F,Edit1.Text);
       closefile(F);


    end;

  end;
end;

end.

