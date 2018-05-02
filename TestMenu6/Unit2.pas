unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls, Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Image1: TImage;
    BitBtn1: TBitBtn;
    Button1: TButton;
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
  k,n,r,s: integer;

implementation

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
  Image1.Visible:= false;
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  n:= strtoint(Edit1.Text);
  StringGrid1.RowCount:= n + 1;
end;

procedure TForm2.Button1Click(Sender: TObject);
var a:array[1..100] of real;
    zbir,prosek,pom: real;
begin
  zbir:=0;

  n:= strtoint(Edit1.Text);
  for k:=1 to n do
  begin
    a[k]:=strtofloat(StringGrid1.Cells[0, k]);
    zbir:= zbir + a[k];
  end;

  prosek:= zbir / n;

  if (CheckBox1.Checked) then
  begin
    Image1.Visible:= true;
    Edit2.Text:=floattostr(prosek);
  end
  else
  begin
    Image1.Visible:= false;
    Edit2.Text:='';
  end;

  for r:=1 to (n-1) do
    for s:=(r+1) to n do
      if (a[r] > a[s]) then
      begin
        pom:=a[r];
        a[r]:= a[s];
        a[s]:= pom;
      end;

  if (RadioButton1.Checked) then
  begin
    Edit3.Text:=floattostr(a[n]);
    Edit4.Text:='';
  end;

  if (RadioButton2.Checked) then
  begin
    Edit3.Text:='';
    Edit4.Text:=floattostr(a[1]);
  end;
end;

end.
