unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, Math, ExtCtrls, jpeg;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Edit2: TEdit;
    StringGrid1: TStringGrid;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    procedure FormActivate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  k,n: integer;

implementation

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
  Image1.Visible:= false;
  Image2.Visible:= false;
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  n:= strtoint(Edit2.Text);
  StringGrid1.RowCount:= n + 1;
end;

procedure TForm2.Button1Click(Sender: TObject);
var a:array[1..100] of real;
    stanjePre,zbirUplata,maksimum,prosek,kamata,krajnjeStanje: real;
begin
  stanjePre:= strtofloat(Edit1.Text);
  zbirUplata:=0;
  kamata:=0;

  n:= strtoint(Edit2.Text);
  for k:=1 to n do
  begin
    a[k]:= strtofloat(StringGrid1.Cells[0, k]);
    zbirUplata:= zbirUplata + a[k];
  end;

  Edit3.Text:= floattostr(zbirUplata);

  maksimum:= a[1];
  prosek:= zbirUplata / n;
  for k:=1 to n do
    if (a[k] > maksimum) then
      maksimum:= a[k];

  if (RadioButton1.Checked) then
  begin
    Image1.Visible:= true;
    Image2.Visible:= false;
    Edit4.Text:= floattostr(maksimum);
    Edit5.Text:= '';
  end;

  if (RadioButton2.Checked) then
  begin
    Image1.Visible:= false;
    Image2.Visible:= true;
    Edit5.Text:= '';
    Edit5.Text:= floattostr(roundto(prosek,-2));
  end;

  if (CheckBox1.Checked) then
    kamata:= zbirUplata * 0.015;

  krajnjeStanje:= stanjePre + zbirUplata + kamata;

  Edit6.Text:= floattostr(krajnjeStanje);
end;

end.
 