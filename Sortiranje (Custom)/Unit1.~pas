unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  k,n,r,s: integer;

implementation

{$R *.dfm}

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  n:= strtoint(Edit1.Text);
  StringGrid1.RowCount:= n + 1;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Memo1.Clear();
  Memo2.Clear();
end;

procedure TForm1.Button1Click(Sender: TObject);
var a: array[1..100] of real;
    b: array[1..100] of real;
    pom: real;
begin
  Memo1.Clear();
  Memo2.Clear();
  
  n:= strtoint(Edit1.Text);
  for k:=1 to n do
  begin
    a[k]:= strtofloat(StringGrid1.Cells[0, k]);
    b[k]:= strtofloat(StringGrid1.Cells[0, k]);
  end;

 {Sortiranje a niza od najmanjeg ka najvecem}

 for r:=1 to (n-1) do
   for s:=(r+1) to n do
     if (a[r] > a[s]) then
     begin
       pom:= a[r];
       a[r]:= a[s];
       a[s]:=pom;
     end;

  {Sortiranje b niza od najveceg ka najmanjem}

  for r:=1 to (n-1) do
   for s:=(r+1) to n do
     if (b[r] < b[s]) then
     begin
       pom:= b[r];
       b[r]:= b[s];
       b[s]:=pom;
     end;

  for k:=1 to n do
  begin
    Memo1.Lines.Add(floattostr(a[k]));
    Memo2.Lines.Add(floattostr(b[k]));
  end;

end;

end.
