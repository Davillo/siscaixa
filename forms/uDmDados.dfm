object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 196
  Width = 661
  object FDConexao: TFDConnection
    Params.Strings = (
      
        'Database=D:\workdir\delphi\ProjetoCaixa\siscaixa\database\DADOSN' +
        'OVO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=FB')
    LoginPrompt = False
    Left = 256
    Top = 80
  end
end
