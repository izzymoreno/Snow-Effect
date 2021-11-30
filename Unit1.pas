unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Math, StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure MoveStars(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

starsx:array [1..400] of word;
starsy:array [1..400] of word;
xmin,ymin,xmax,ymax: word;
xstepstar: word;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
i:word;
begin
Randomize;
xmin:=0;
ymin:=0;
xmax:=Form1.Image1.Width;
ymax:=Form1.Image1.Height;
Form1.Image1.Canvas.Brush.Color:=clBlack;
Form1.Image1.Canvas.FillRect(Rect(xmin,ymin,xmax,ymax));
Form1.Image1.Canvas.Brush.Color:=clWhite;
For i:=1 to 200 do
   begin
   starsx[i]:=random(xmax);
   starsy[i]:=random(ymax);
   Form1.Image1.Canvas.FillRect(Rect(starsx[i],starsy[i],starsx[i]+1,starsy[i]+1));
   end;
end;

Procedure TForm1.MoveStars(Sender: TObject);
var
i:word;
begin
For i:=1 to 200 do
   begin
   starsx[i]:=random(xmax);
   starsy[i]:=random(ymax);
   Form1.Image1.Canvas.Brush.Color:=clWhite;
   Form1.Image1.Canvas.FillRect(Rect(starsx[i],starsy[i],starsx[i]+1,starsy[i]+1));
   starsx[i]:=random(xmax);
   starsy[i]:=random(ymax);
   Form1.Image1.Canvas.Brush.Color:=clBlack;
   Form1.Image1.Canvas.FillRect(Rect(starsx[i]+2,starsy[i],starsx[i]+xstepstar+2,starsy[i]+xstepstar));
   end;
end;

end.
