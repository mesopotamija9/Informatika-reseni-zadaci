unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls, Buttons;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    Label3: TLabel;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Image1: TImage;
    Image2: TImage;
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
  Form3: TForm3;
  k,n,r,s: integer;

implementation

{$R *.dfm}

procedure TForm3.FormActivate(Sender: TObject);
begin
  Image1.Visible:= false;
  Image2.Visible:= false;
end;

procedure TForm3.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  n:= strtoint(Edit1.text);
  StringGrid1.RowCount:= n + 1;
end;

procedure TForm3.Button1Click(Sender: TObject);
var a:array[1..100] of real;
    zbir,pom,prosek,porez,doprinos,isplata: real;
begin
  zbir:=0;
  
  n:= strtoint(Edit1.text);
  for k:=1 to n do
  begin
    a[k]:= strtofloat(StringGrid1.Cells[0, k]);
    zbir:= zbir + a[k];
  end;

  Edit2.Text:=floattostr(zbir);

  for r:=1 to (n-1) do
    for s:=(r+1) to n do
     if (a[r] > a[s]) then
     begin
     pom:= a[r];
     a[r]:= a[s];
     a[s]:= pom;
     end;

  if (RadioButton1.Checked) then
  begin
    Image1.Visible:= true;
    Image2.Visible:= false;
    Edit3.Text:=floattostr(a[n]);
    Edit4.Text:='';
  end;

  if (RadioButton2.Checked) then
  begin
    Image1.Visible:= false;
    Image2.Visible:= true;
    prosek:= zbir / n;
    Edit3.Text:='';
    Edit4.Text:=floattostr(prosek);
  end;

  if (CheckBox1.Checked) then
    porez:= zbir * 0.12;

  if (CheckBox2.Checked) then
    doprinos:= zbir * 0.17;

  isplata:= zbir - porez - doprinos;

  Edit5.Text:=floattostr(isplata);
end;

end.
