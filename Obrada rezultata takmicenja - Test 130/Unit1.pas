unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls,math, jpeg, Buttons;
const mbe=15;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    Edit4: TEdit;
    Label3: TLabel;
    Memo1: TMemo;
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
  n:= strtoint(Edit1.Text);
  StringGrid1.RowCount:= n + 1;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Image1.Visible:= false;
  Image2.Visible:= false;
  Memo1.Clear();
end;

procedure TForm1.Button1Click(Sender: TObject);
var a:array[1..mbe] of real;
    norma,prosekUspesnih,najbolji,brojUspesnih,zbirUspesnih: real;
begin
  norma:= strtofloat(Edit2.Text);
  zbirUspesnih:= 0;
  brojUspesnih:= 0;

  n:= strtoint(Edit1.Text);
  for k:=1 to n do
  begin
    a[k]:= strtofloat(StringGrid1.Cells[0, k]);
    if (a[k] <= norma) then
    begin
      zbirUspesnih:= zbirUspesnih + a[k];
      brojUspesnih:= brojUspesnih + 1;
    end;
  end;

  najbolji:=a[1];

  if (RadioButton1.Checked) then
  begin
    Image1.Visible:= true;
    Image2.Visible:= false;
    Memo1.Clear();
    for k:=2 to n do
      if (a[k] <= a[1]) then
        najbolji:=a[k];
    Edit4.Text:=floattostr(najbolji);
  end;

  if (RadioButton2.Checked) then
  begin
    Image1.Visible:= false;
    Image2.Visible:= true;
    Memo1.Clear();
    Edit4.Text:='';
    for k:=1 to n do
      if (a[k] <= norma) then
        Memo1.Lines.Add(floattostr(a[k]));
  end;

  prosekUspesnih:= zbirUspesnih / brojUspesnih;
  Edit3.Text:= floattostr(roundto(prosekUspesnih, -2));
end;

end.
