object formCadastroEditGrupo: TformCadastroEditGrupo
  Left = 0
  Top = 0
  Caption = 'Cadastro de Grupos'
  ClientHeight = 211
  ClientWidth = 486
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
  object Nome: TLabel
    Left = 192
    Top = 85
    Width = 39
    Height = 13
    Caption = 'Nome*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 192
    Top = 32
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object edtNome: TEdit
    Left = 192
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtCodigo: TEdit
    Left = 192
    Top = 51
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object btnSalvarGrupo: TButton
    Left = 192
    Top = 152
    Width = 121
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = btnSalvarGrupoClick
  end
  object FDQryGetGenerator: TFDQuery
    Connection = dmDados.FDConexao
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint]
    UpdateOptions.FetchGeneratorsPoint = gpNone
    SQL.Strings = (
      '         SELECT GEN_ID(GEN_GRUPO_ID, 0) FROM RDB$DATABASE;')
    Left = 48
    Top = 160
  end
  object FDUpdateSQLGrupos: TFDUpdateSQL
    Connection = dmDados.FDConexao
    InsertSQL.Strings = (
      'INSERT INTO GRUPO'
      '(NOME)'
      'VALUES (:NEW_NOME)'
      'RETURNING ID, NOME')
    ModifySQL.Strings = (
      'UPDATE GRUPO'
      'SET NOME = :NEW_NOME'
      'WHERE ID = :OLD_ID'
      'RETURNING ID, NOME')
    DeleteSQL.Strings = (
      'DELETE FROM GRUPO'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, NOME'
      'FROM GRUPO'
      'WHERE ID = :ID')
    Left = 368
    Top = 152
  end
  object FDQryGrupos: TFDQuery
    Connection = dmDados.FDConexao
    UpdateObject = FDUpdateSQLGrupos
    SQL.Strings = (
      'select * from grupo')
    Left = 360
    Top = 88
  end
  object dsGrupos: TDataSource
    DataSet = FDQryGrupos
    Left = 40
    Top = 80
  end
end
