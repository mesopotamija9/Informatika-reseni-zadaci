unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Imenik1: TMenuItem;
    Komitenti1: TMenuItem;
    adresar1: TMenuItem;
    Berza1: TMenuItem;
    Razno1: TMenuItem;
    Krediti1: TMenuItem;
    Nedeljnetemperature1: TMenuItem;
    elekom1: TMenuItem;
    Automobilski1: TMenuItem;
    Stambeni1: TMenuItem;
    Namenski1: TMenuItem;
    KrajRada1: TMenuItem;
    procedure elekom1Click(Sender: TObject);
    procedure Nedeljnetemperature1Click(Sender: TObject);
    procedure KrajRada1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit3, Unit2;

{$R *.dfm}

procedure TForm1.elekom1Click(Sender: TObject);
begin
  Form3.showmodal;
end;

procedure TForm1.Nedeljnetemperature1Click(Sender: TObject);
begin
  Form2.showmodal;
end;

procedure TForm1.KrajRada1Click(Sender: TObject);
begin
  Close;
end;

end.
