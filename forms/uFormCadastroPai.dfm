object formCadastroPai: TformCadastroPai
  Left = 0
  Top = 0
  ClientHeight = 210
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dbGridLista: TDBGrid
    Left = 0
    Top = 40
    Width = 571
    Height = 169
    DataSource = dsCadastro
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object panelCad: TPanel
    Left = -1
    Top = 0
    Width = 572
    Height = 41
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 125
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 253
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 397
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
    end
  end
  object FDQueryCadastro: TFDQuery
    Connection = dmDados.FDConexao
    UpdateObject = FDUpdateCadastro
    Left = 128
    Top = 120
  end
  object FDUpdateCadastro: TFDUpdateSQL
    Connection = dmDados.FDConexao
    Left = 328
    Top = 120
  end
  object dsCadastro: TDataSource
    DataSet = FDQueryCadastro
    Left = 232
    Top = 120
  end
end
