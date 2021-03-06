unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,math, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
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
  k,n:integer;

implementation

{$R *.dfm}

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  n:=strtoint(Edit1.Text);
  StringGrid1.RowCount:= n + 1;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Image1.Visible:= false;
  Image2.Visible:= false;
end;

procedure TForm1.Button1Click(Sender: TObject);
var a: array[1..100] of real;
    zbir,prosek,porez,doprinos,zaIsplatu: real;
begin
   zbir:=0;
   porez:=0;
   doprinos:=0;

   n:=strtoint(Edit1.Text);
   for k:=1 to n do
   begin
     a[k]:=strtofloat(StringGrid1.Cells[0, k]);
     zbir:=zbir + a[k];
   end;

   prosek:=zbir / n;

   if (CheckBox1.Checked) then
   begin
     Image1.Visible:= true;
     porez:= zbir * 0.12;
   end
   else
     Image1.Visible:= false;

   if (CheckBox2.Checked) then
   begin
     Image2.Visible:= true;
     doprinos:= zbir * 0.17;
   end
   else
     Image2.Visible:= false;

   zaIsplatu:= zbir - porez - doprinos;

   Edit2.Text:=floattostr(zbir);
   Edit3.Text:=floattostr(roundto(prosek,-2));
   Edit4.Text:=floattostr(porez);
   Edit5.Text:=floattostr(doprinos);
   Edit6.Text:=floattostr(zaIsplatu);
end;

end.
