object DataModule1: TDataModule1
  Height = 388
  Width = 621
  PixelsPerInch = 96
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\casnos.mdb'
      'DriverID=MSAcc')
    Connected = True
    LoginPrompt = False
    Left = 136
    Top = 80
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 264
    Top = 80
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'mat_adh'
    Connection = FDConnection1
    TableName = 'adherent'
    Left = 128
    Top = 168
  end
  object table_activite: TFDTable
    Active = True
    IndexFieldNames = 'code_activite'
    Connection = FDConnection1
    TableName = 'activite'
    Left = 208
    Top = 168
  end
  object table_affiliations: TFDTable
    Active = True
    Connection = FDConnection1
    TableName = 'qry_affiliations'
    Left = 296
    Top = 168
  end
  object table_declaration_act: TFDTable
    Active = True
    Connection = FDConnection1
    TableName = 'qry_declaration_act'
    Left = 408
    Top = 168
  end
end
