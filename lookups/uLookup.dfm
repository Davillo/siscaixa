object dmLookup: TdmLookup
  OldCreateOrder = False
  Height = 226
  Width = 718
  object FDTransaction: TFDTransaction
    Connection = dmDados.FDConexao
    Left = 104
    Top = 8
  end
  object dsGrupos: TDataSource
    DataSet = FDQueryGrupos
    Left = 48
    Top = 80
  end
  object FDQueryGrupos: TFDQuery
    Active = True
    Connection = dmDados.FDConexao
    Transaction = FDTransaction
    SQL.Strings = (
      'select id,nome from grupo;')
    Left = 48
    Top = 144
  end
  object FDQueryContas: TFDQuery
    Active = True
    Connection = dmDados.FDConexao
    Transaction = FDTransaction
    SQL.Strings = (
      'select id,nome from conta;')
    Left = 144
    Top = 144
  end
  object dsContas: TDataSource
    DataSet = FDQueryContas
    Left = 144
    Top = 88
  end
end
