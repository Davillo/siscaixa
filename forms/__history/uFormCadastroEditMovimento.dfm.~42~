object formCadastroEditMovimento: TformCadastroEditMovimento
  Left = 0
  Top = 0
  Caption = 'Cadastro de Movimentos'
  ClientHeight = 290
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 112
    Top = 29
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object Label2: TLabel
    Left = 112
    Top = 72
    Width = 115
    Height = 13
    Caption = 'Data do movimento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 288
    Top = 26
    Width = 36
    Height = 13
    Caption = 'Conta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 288
    Top = 72
    Width = 27
    Height = 13
    Caption = 'Tipo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 112
    Top = 115
    Width = 32
    Height = 13
    Caption = 'Valor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 288
    Top = 115
    Width = 53
    Height = 13
    Caption = 'Hist'#243'rico:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtCodigo: TEdit
    Left = 112
    Top = 45
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object DBLookupContas: TDBLookupComboBox
    Left = 288
    Top = 45
    Width = 123
    Height = 21
    DataField = 'CONTA_ID'
    DataSource = dsCadastro
    KeyField = 'ID'
    ListField = 'NOME'
    ListSource = dmLookup.dsContas
    TabOrder = 1
    OnClick = DBLookupContasClick
  end
  object cbTipo: TComboBox
    Left = 288
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 2
    Items.Strings = (
      'Entrada'
      'Sa'#237'da')
  end
  object edtHistorico: TEdit
    Left = 288
    Top = 134
    Width = 253
    Height = 21
    TabOrder = 3
  end
  object btnSalvar: TButton
    Left = 249
    Top = 201
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object edtValor: TEdit
    Left = 112
    Top = 134
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtData: TMaskEdit
    Left = 112
    Top = 88
    Width = 118
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 6
    Text = '  /  /    '
  end
  object FDQueryMovimentos: TFDQuery
    Connection = dmDados.FDConexao
    SQL.Strings = (
      'select * from movimento')
    Left = 40
    Top = 224
  end
  object dsCadastro: TDataSource
    DataSet = FDQueryMovimentos
    Left = 128
    Top = 224
  end
  object FDQueryGenerator: TFDQuery
    Connection = dmDados.FDConexao
    Left = 40
    Top = 152
  end
  object FDQueryContas: TFDQuery
    Connection = dmDados.FDConexao
    Left = 208
    Top = 200
  end
end
