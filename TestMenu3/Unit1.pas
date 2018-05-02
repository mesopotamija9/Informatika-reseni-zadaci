unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Primanja1: TMenuItem;
    Socijalna1: TMenuItem;
    Dodaci1: TMenuItem;
    N1: TMenuItem;
    ManjeplataBklasa1: TMenuItem;
    VeceplateAklasa1: TMenuItem;
    Odbici1: TMenuItem;
    Doprinosi1: TMenuItem;
    Porezi1: TMenuItem;
    Krediti1: TMenuItem;
    Alimentacija1: TMenuItem;
    Dinarski1: TMenuItem;
    UEURima1: TMenuItem;
    KrajRada1: TMenuItem;
    procedure ManjeplataBklasa1Click(Sender: TObject);
    procedure VeceplateAklasa1Click(Sender: TObject);
    procedure KrajRada1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.ManjeplataBklasa1Click(Sender: TObject);
begin
  Form2.showmodal;
end;

procedure TForm1.VeceplateAklasa1Click(Sender: TObject);
begin
  Form3.showmodal;
end;

procedure TForm1.KrajRada1Click(Sender: TObject);
begin
  Close;
end;

end.
