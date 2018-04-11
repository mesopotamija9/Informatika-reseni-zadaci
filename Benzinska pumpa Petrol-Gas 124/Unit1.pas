unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label5: TLabel;
    Label6: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Image1: TImage;
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
  k,n: integer;

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
end;

procedure TForm1.Button1Click(Sender: TObject);
var a: array[1..100] of real;
    BMB,TD,odgovarajucaCena,pdv,iznosPDV,litaraGoriva,osnovica,zaUplatu: real;
begin
  BMB:= strtofloat(Edit6.Text);
  TD:= strtofloat(Edit7.Text);
  litaraGoriva:= 0;
  pdv:= 0;
  
  n:= strtoint(Edit1.Text);
  for k:=1 to n do
  begin
    a[k]:= strtofloat(StringGrid1.Cells[0, k]);
    litaraGoriva:= litaraGoriva + a[k];
  end;

  if (RadioButton1.Checked) then
    odgovarajucaCena:= BMB;

  if (RadioButton2.Checked) then
     odgovarajucaCena:= TD;

  osnovica:= odgovarajucaCena * litaraGoriva;

  if (CheckBox1.Checked) then
  begin
    Image1.Visible:= true;
    iznosPDV:=0.18;
    pdv:= osnovica * iznosPDV;
  end
  else
    Image1.Visible:= false;

  zaUplatu:= osnovica + pdv;

  Edit2.Text:= floattostr(litaraGoriva);
  Edit3.Text:= floattostr(osnovica);
  Edit4.Text:= floattostr(pdv);
  Edit5.Text:= floattostr(zaUplatu);
end;

end.
