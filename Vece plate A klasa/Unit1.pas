unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, math, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    BitBtn1: TBitBtn;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
var a:array[1..100] of real;
    zbir,maksimalniIznos,prosek,zaIsplatu,porez,doprinos:real;
begin
  zbir:= 0;
  porez:= 0;
  doprinos:=0;
  
  n:=strtoint(Edit1.Text);
  for k:=1 to n do
  begin
    a[k]:= strtofloat(StringGrid1.cells[0, k]);
    zbir:= zbir + a[k];
  end;

  maksimalniIznos:=a[1];

  if (RadioButton1.Checked) then
  begin
    Image1.Visible:= true;
    Image2.Visible:= false;
    for k:=2 to n do
      if (a[k] > maksimalniIznos) then
        maksimalniIznos:= a[k];
    Edit3.Text:= floattostr(maksimalniIznos);
    Edit4.Text:= '';
  end;

  if (RadioButton2.Checked) then
  begin
    Image1.Visible:= false;
    Image2.Visible:= true;

    prosek:= zbir / n;
    Edit4.Text:= floattostr(roundto(prosek, -2));
    Edit3.Text:= '';
  end;

  if (CheckBox1.Checked) then
     porez:= zbir * 0.12;

  if (CheckBox2.Checked) then
     doprinos:= zbir * 0.17;

  zaIsplatu:= zbir - porez - doprinos;

  Edit2.Text:= floattostr(zbir);
  Edit5.Text:= floattostr(zaIsplatu);
end;

end.
