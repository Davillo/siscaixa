inherited formModuloGrupos: TformModuloGrupos
  Caption = 'M'#243'dulo de Grupos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbGridLista: TDBGrid
    Width = 579
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome do grupo'
        Visible = True
      end>
  end
  inherited panelCad: TPanel
    inherited BitBtn1: TBitBtn
      OnClick = BitBtn1Click
    end
    inherited BitBtn2: TBitBtn
      OnClick = BitBtn2Click
    end
    inherited BitBtn3: TBitBtn
      OnClick = BitBtn3Click
    end
  end
  inherited FDQueryCadastro: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint]
    UpdateOptions.FetchGeneratorsPoint = gpNone
    SQL.Strings = (
      'select * from grupo order by id asc')
    Left = 168
    Top = 136
    object FDQueryCadastroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryCadastroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
  end
  inherited FDUpdateCadastro: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO GRUPO'
      '(ID, NOME)'
      'VALUES (:NEW_ID, :NEW_NOME)')
    ModifySQL.Strings = (
      'UPDATE GRUPO'
      'SET ID = :NEW_ID, NOME = :NEW_NOME'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM GRUPO'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, NOME'
      'FROM GRUPO'
      'WHERE ID = :ID')
    Left = 352
    Top = 136
  end
  inherited dsCadastro: TDataSource
    Left = 264
    Top = 136
  end
  object FDQueryDelete: TFDQuery
    Connection = dmDados.FDConexao
    SQL.Strings = (
      'select * from grupo;')
    Left = 56
    Top = 136
    object FDQueryDeleteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryDeleteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
  end
end
