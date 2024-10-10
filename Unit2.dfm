object dmodDataConn: TdmodDataConn
  Height = 480
  Width = 640
  object connBase0: TFDConnection
    Params.Strings = (
      'Database=GMERP'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=mepidcs01'
      'Port=1526'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Left = 48
    Top = 176
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 48
    Top = 80
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 48
    Top = 16
  end
  object qbLstOS: TFDQuery
    Connection = connBase0
    Left = 48
    Top = 240
  end
end
