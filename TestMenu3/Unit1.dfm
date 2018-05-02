object Form1: TForm1
  Left = 192
  Top = 125
  Width = 979
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 152
    Top = 40
    object Primanja1: TMenuItem
      Caption = 'Primanja'
      object Socijalna1: TMenuItem
        Caption = 'Socijalna'
      end
      object Dodaci1: TMenuItem
        Caption = 'Dodaci'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ManjeplataBklasa1: TMenuItem
        Caption = 'Manje plata B klasa'
        OnClick = ManjeplataBklasa1Click
      end
      object VeceplateAklasa1: TMenuItem
        Caption = 'Vece plate A klasa'
        OnClick = VeceplateAklasa1Click
      end
    end
    object Odbici1: TMenuItem
      Caption = 'Odbici'
      object Doprinosi1: TMenuItem
        Caption = 'Doprinosi'
      end
      object Porezi1: TMenuItem
        Caption = 'Porezi'
      end
      object Krediti1: TMenuItem
        Caption = 'Krediti'
        object Dinarski1: TMenuItem
          Caption = 'Dinarski'
        end
        object UEURima1: TMenuItem
          Caption = 'U EUR-ima'
        end
      end
      object Alimentacija1: TMenuItem
        Caption = 'Alimentacija'
      end
    end
    object KrajRada1: TMenuItem
      Caption = 'Kraj Rada'
      OnClick = KrajRada1Click
    end
  end
end
