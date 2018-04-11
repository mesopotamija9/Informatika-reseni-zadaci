unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls, Buttons;
const mbe=15;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Edit4: TEdit;
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
  n,k: integer;

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
  Image3.Visible:= false;
  Memo1.Clear();
end;

procedure TForm1.Button1Click(Sender: TObject);
var a:array[1..mbe] of real;
    dugBezPDV:array[1..mbe] of real;
    dugovanje:array[1..mbe] of real;
    cenaF,cenaG,odgovarajucaCena,pdv,zbir: real;
begin
  cenaF:=strtofloat(Edit2.Text);
  cenaG:=strtofloat(Edit3.Text);
  pdv:= 0;
  zbir:= 0;

  n:= strtoint(Edit1.Text);
  for k:=1 to n do
  begin
    a[k]:= strtofloat(StringGrid1.Cells[0, k]);
  end;

  if (Radiobutton1.Checked) then
  begin
     Memo1.Clear();
     Image2.Visible:= true;
     Image3.Visible:= false;
     odgovarajucaCena:= cenaF;
  end;

  if (Radiobutton2.Checked) then
  begin
     Memo1.Clear();
     Image2.Visible:= false;
     Image3.Visible:= true;
     odgovarajucaCena:= cenaG;
  end;

  for k:=1 to n do
  begin
    dugovanje[k]:= a[k] * odgovarajucaCena;
  end;

  if (CheckBox1.Checked) then
  begin
    Image1.Visible:= true;
    pdv:= 0.18;
    for k:=1 to n do
    begin
      dugovanje[k]:= dugovanje[k] + dugovanje[k] * pdv;
    end;
  end
  else
    Image1.Visible:= false;

  for k:=1 to n do
  begin
    Memo1.Lines.Add(floattostr(dugovanje[k]));
    zbir:= zbir + dugovanje[k];
  end;

  Edit4.Text:= floattostr(zbir);
end;

end.
