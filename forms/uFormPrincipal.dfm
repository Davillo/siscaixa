object formPrincipal: TformPrincipal
  Left = 0
  Top = 0
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 208
    Top = 88
    object MenuPrincipal1: TMenuItem
      Caption = 'Cadastros'
      object GrupodeContas1: TMenuItem
        Caption = 'Grupo de Contas'
        OnClick = GrupodeContas1Click
      end
      object Contas1: TMenuItem
        Caption = 'Contas'
        OnClick = Contas1Click
      end
      object Movimentos1: TMenuItem
        Caption = 'Movimentos'
        OnClick = Movimentos1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
    end
  end
end
