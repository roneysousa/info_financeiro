inherited frmRelRenegociacaoPeriodo: TfrmRelRenegociacaoPeriodo
  Left = 304
  Top = 289
  Caption = 'Relat'#243'rio de Renegocia'#231#227'o por Per'#237'odo'
  ClientHeight = 205
  ClientWidth = 346
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 346
    Height = 164
    object Label3: TLabel [2]
      Left = 23
      Top = 109
      Width = 44
      Height = 13
      Caption = '&Dia Vcto.'
    end
    object sedDia: TSpinEdit
      Left = 23
      Top = 127
      Width = 57
      Height = 22
      MaxValue = 31
      MinValue = 0
      TabOrder = 2
      Value = 0
      OnKeyPress = sedDiaKeyPress
    end
  end
  inherited Panel2: TPanel
    Top = 164
    Width = 346
    inherited BtImprimir: TBitBtn
      Left = 173
      OnClick = BtImprimirClick
    end
    inherited BtSair: TBitBtn
      Left = 261
    end
  end
  object dstConsulta: TSQLDataSet
    CommandText = 
      'select R.RNG_CDLOJA, E.EMP_RAZAO,'#13#10'    R.RNG_CLIENTE, R.RNG_NOME' +
      '_CLIENTE, R.RNG_NRBOX, R.RNG_DTMOVI,'#13#10'    R.RGN_TOTAL_RENEGOCIAC' +
      'AO, R.RGN_DESCONTO,'#13#10'    R.RGN_VLENTRADA, R.RGN_VLFINANCIADO, R.' +
      'RGN_PEJUROS,'#13#10'    R.RGN_QUANTIDADE, R.RGN_VLPARCELA, R.RGN_DTVEN' +
      'C1,'#13#10'    R.RGN_DTVENC2,'#13#10'    R.RGN_USUARIO from RENEGOCIACAO R'#13#10 +
      'inner join EMPRESAS E ON E.EMP_CODIGO = R.RNG_CDLOJA'#13#10'where (R.R' +
      'NG_DTMOVI >= :pDTINIC) and'#13#10'(R.RNG_DTMOVI <= :pDTFINA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 8
    Top = 144
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 48
    Top = 144
  end
  object cdsConsulta: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsulta'
    Left = 88
    Top = 144
    object cdsConsultaRNG_CDLOJA: TIntegerField
      FieldName = 'RNG_CDLOJA'
      Required = True
    end
    object cdsConsultaEMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      Size = 50
    end
    object cdsConsultaRNG_CLIENTE: TIntegerField
      FieldName = 'RNG_CLIENTE'
      Required = True
    end
    object cdsConsultaRNG_NOME_CLIENTE: TStringField
      FieldName = 'RNG_NOME_CLIENTE'
      Size = 50
    end
    object cdsConsultaRNG_NRBOX: TStringField
      FieldName = 'RNG_NRBOX'
      Size = 30
    end
    object cdsConsultaRNG_DTMOVI: TDateField
      FieldName = 'RNG_DTMOVI'
    end
    object cdsConsultaRGN_TOTAL_RENEGOCIACAO: TFMTBCDField
      FieldName = 'RGN_TOTAL_RENEGOCIACAO'
      Precision = 18
      Size = 2
    end
    object cdsConsultaRGN_DESCONTO: TBCDField
      FieldName = 'RGN_DESCONTO'
      Precision = 9
      Size = 2
    end
    object cdsConsultaRGN_VLENTRADA: TFMTBCDField
      FieldName = 'RGN_VLENTRADA'
      Precision = 18
      Size = 2
    end
    object cdsConsultaRGN_VLFINANCIADO: TFMTBCDField
      FieldName = 'RGN_VLFINANCIADO'
      Precision = 18
      Size = 2
    end
    object cdsConsultaRGN_PEJUROS: TBCDField
      FieldName = 'RGN_PEJUROS'
      Precision = 9
      Size = 2
    end
    object cdsConsultaRGN_QUANTIDADE: TIntegerField
      FieldName = 'RGN_QUANTIDADE'
    end
    object cdsConsultaRGN_VLPARCELA: TFMTBCDField
      FieldName = 'RGN_VLPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsConsultaRGN_DTVENC1: TDateField
      FieldName = 'RGN_DTVENC1'
    end
    object cdsConsultaRGN_DTVENC2: TDateField
      FieldName = 'RGN_DTVENC2'
    end
    object cdsConsultaRGN_USUARIO: TIntegerField
      FieldName = 'RGN_USUARIO'
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 128
    Top = 144
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 192
    Top = 8
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 49742
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'LOJA\COMODAT'#193'RIO\LOCAT'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 43127
        mmWidth = 58208
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 1000
        mmTop = 41804
        mmWidth = 282840
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 1000
        mmTop = 48154
        mmWidth = 282840
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'N'#186'. BOX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 72496
        mmTop = 43127
        mmWidth = 13377
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'DT.RENEG.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 122767
        mmTop = 43127
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'TOTAL RENEG.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 143140
        mmTop = 43127
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'VL.FINANC.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 170657
        mmTop = 43127
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'VL.ENTRAD.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 191823
        mmTop = 43127
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = '% JUROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 213519
        mmTop = 43127
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'PC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 231775
        mmTop = 43127
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'VALOR PC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 241300
        mmTop = 43127
        mmWidth = 17727
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 31221
        mmLeft = 5821
        mmTop = 4498
        mmWidth = 43392
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'lbl_NMRELA2'
        Caption = 'RELA'#199#195'O RENEGOCIA'#199#213'ES POR PER'#205'ODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 176742
        mmTop = 5027
        mmWidth = 74613
        BandType = 0
      end
      object txtCondominio: TppLabel
        UserName = 'Label10'
        Caption = 'CONDOMINIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 176742
        mmTop = 10054
        mmWidth = 23283
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo'
        Caption = 'PER'#205'ODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 177007
        mmTop = 15081
        mmWidth = 16214
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = '1'#186' VENCIM.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 261144
        mmTop = 43127
        mmWidth = 18881
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'RNG_NOME_CLIENTE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 265
        mmWidth = 67998
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'RNG_NRBOX'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 72761
        mmTop = 265
        mmWidth = 48154
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'RNG_DTMOVI'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 123561
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'RGN_TOTAL_RENEGOCIACAO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 143140
        mmTop = 265
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'RGN_VLFINANCIADO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 170657
        mmTop = 265
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'RGN_VLENTRADA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'RGN_PEJUROS'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 213784
        mmTop = 265
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'RGN_QUANTIDADE'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 232040
        mmTop = 265
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'RGN_VLPARCELA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 241830
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 227013
        mmTop = 265
        mmWidth = 3133
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'RGN_DTVENC1'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 261938
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 229130
        mmTop = 2381
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 247121
        mmTop = 2381
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 234686
        mmTop = 7408
        mmWidth = 11906
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 1000
        mmTop = 529
        mmWidth = 284428
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 247650
        mmTop = 7408
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 265
        mmTop = 1058
        mmWidth = 284428
        BandType = 7
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2646
        mmTop = 3440
        mmWidth = 24299
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 28046
        mmTop = 3704
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'RGN_TOTAL_RENEGOCIACAO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 143140
        mmTop = 2646
        mmWidth = 25929
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'RGN_VLFINANCIADO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 170657
        mmTop = 2646
        mmWidth = 19579
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'RGN_VLENTRADA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 2646
        mmWidth = 20902
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsConsulta
    UserName = 'DBPipeline1'
    Left = 232
    Top = 8
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RNG_CDLOJA'
      FieldName = 'RNG_CDLOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'EMP_RAZAO'
      FieldName = 'EMP_RAZAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'RNG_CLIENTE'
      FieldName = 'RNG_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'RNG_NOME_CLIENTE'
      FieldName = 'RNG_NOME_CLIENTE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'RNG_NRBOX'
      FieldName = 'RNG_NRBOX'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'RNG_DTMOVI'
      FieldName = 'RNG_DTMOVI'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'RGN_TOTAL_RENEGOCIACAO'
      FieldName = 'RGN_TOTAL_RENEGOCIACAO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'RGN_DESCONTO'
      FieldName = 'RGN_DESCONTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'RGN_VLENTRADA'
      FieldName = 'RGN_VLENTRADA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'RGN_VLFINANCIADO'
      FieldName = 'RGN_VLFINANCIADO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'RGN_PEJUROS'
      FieldName = 'RGN_PEJUROS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'RGN_QUANTIDADE'
      FieldName = 'RGN_QUANTIDADE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'RGN_VLPARCELA'
      FieldName = 'RGN_VLPARCELA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'RGN_DTVENC1'
      FieldName = 'RGN_DTVENC1'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'RGN_DTVENC2'
      FieldName = 'RGN_DTVENC2'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'RGN_USUARIO'
      FieldName = 'RGN_USUARIO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 15
    end
  end
  object dstConsulta2: TSQLDataSet
    CommandText = 
      'Select CL.CLI_CODIGO, CL.cli_tipopessoa, CL.CLI_RAZAO, CL.CLI_FA' +
      'NTASIA, CL.CLI_CGC, CL.CLI_CDGRUPO,'#13#10'CL.CLI_NRBOX, r.rec_credito' +
      ', r.rec_loja,  r.rec_parcela, r.rec_dataemissao, r.rec_datavenci' +
      'mento,'#13#10'r.rec_datapagamento, r.rec_valorparcela, r.rec_situacao,' +
      ' r.rec_nosso_numero from CLIENTES CL'#13#10'inner Join CONTASRECEBER R' +
      ' ON CL.CLI_CODIGO = R.REC_CLIENTE'#13#10'Where (R.rec_datavencimento >' +
      '= :pDATA) AND (R.rec_datavencimento <= :pDTFINAL)'#13#10'and (EXTRACT(' +
      'DAY from R.rec_datavencimento) = :pDIA)'#13#10'and (R.REC_SITUACAO =  ' +
      ':pFLSITU)'#13#10'Group By CL.CLI_CODIGO, CL.cli_tipopessoa, CL.CLI_RAZ' +
      'AO, CL.CLI_FANTASIA, CL.CLI_CGC,'#13#10'CL.CLI_CDGRUPO, CL.CLI_NRBOX, ' +
      'r.rec_credito, r.rec_loja, r.rec_parcela, r.rec_dataemissao,'#13#10'r.' +
      'rec_datavencimento, r.rec_datapagamento, r.rec_valorparcela, r.r' +
      'ec_situacao, r.rec_nosso_numero order by CL.CLI_RAZAO, CL.CLI_NR' +
      'BOX'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pDIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pFLSITU'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 184
    Top = 120
  end
  object dspConsulta2: TDataSetProvider
    DataSet = dstConsulta2
    Options = [poAllowCommandText]
    Left = 216
    Top = 120
  end
  object cdsConsulta2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pDIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pFLSITU'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsulta2'
    OnCalcFields = cdsConsulta2CalcFields
    Left = 256
    Top = 120
    object cdsConsulta2CLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object cdsConsulta2CLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
    object cdsConsulta2CLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsConsulta2CLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      Size = 14
    end
    object cdsConsulta2CLI_CDGRUPO: TIntegerField
      FieldName = 'CLI_CDGRUPO'
    end
    object cdsConsulta2CLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
    end
    object cdsConsulta2REC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      Required = True
    end
    object cdsConsulta2REC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      Required = True
    end
    object cdsConsulta2REC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
    end
    object cdsConsulta2REC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
    end
    object cdsConsulta2REC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
    end
    object cdsConsulta2REC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsConsulta2REC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsulta2REC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
    end
    object cdsConsulta2CLI_TIPOPESSOA: TStringField
      FieldName = 'CLI_TIPOPESSOA'
      FixedChar = True
      Size = 1
    end
    object cdsConsulta2REC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      Required = True
    end
    object cdsConsulta2CGCCPF: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CGCCPF'
    end
  end
  object dsConsulta2: TDataSource
    DataSet = cdsConsulta2
    Left = 296
    Top = 120
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline2
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 192
    Top = 64
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline2'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37306
      mmPrintPosition = 0
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 31221
        mmLeft = 5821
        mmTop = 4498
        mmWidth = 43392
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'RELA'#199#195'O RENEGOCIA'#199#213'ES POR PER'#205'ODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 107421
        mmTop = 5027
        mmWidth = 74613
        BandType = 0
      end
      object lblCondominio: TppLabel
        UserName = 'Label101'
        Caption = 'CONDOMINIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 107421
        mmTop = 14552
        mmWidth = 23283
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'txtPeriodo1'
        Caption = 'PER'#205'ODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 107421
        mmTop = 9790
        mmWidth = 16140
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'REC_PARCELA'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 265
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'REC_DATAEMISSAO'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 18256
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'REC_DATAVENCIMENTO'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4022
        mmLeft = 44186
        mmTop = 265
        mmWidth = 21463
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'REC_VALORPARCELA'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 69850
        mmTop = 265
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'REC_NOSSO_NUMERO'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4022
        mmLeft = 92604
        mmTop = 265
        mmWidth = 28840
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 144463
        mmTop = 2646
        mmWidth = 17198
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 149754
        mmTop = 8202
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 8202
        mmWidth = 1852
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162454
        mmTop = 2646
        mmWidth = 32279
        BandType = 8
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line9'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197380
        BandType = 7
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 2646
        mmWidth = 19844
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 2646
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'REC_VALORPARCELA'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 67204
        mmTop = 2646
        mmWidth = 23019
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CLI_CODIGO'
      DataPipeline = ppDBPipeline2
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline2'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19844
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 1323
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'LOJA\COMODAT'#193'RIO\LOCAT'#193'RIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 57679
          mmTop = 2646
          mmWidth = 58208
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'N'#186'. BOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 140759
          mmTop = 2646
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'CLI_RAZAO'
          DataPipeline = ppDBPipeline2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 3969
          mmLeft = 57679
          mmTop = 7408
          mmWidth = 81227
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'CLI_NRBOX'
          DataPipeline = ppDBPipeline2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 3969
          mmLeft = 140759
          mmTop = 7408
          mmWidth = 55827
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'CPF/CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 18256
          mmTop = 2646
          mmWidth = 17357
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'CGCCPF'
          DataPipeline = ppDBPipeline2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 3969
          mmLeft = 18256
          mmTop = 7408
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 265
          mmTop = 18256
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'PC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 7144
          mmTop = 13494
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'DT.EMISS'#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 18513
          mmTop = 13494
          mmWidth = 21463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'DT.VCTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 44186
          mmTop = 13494
          mmWidth = 21463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4191
          mmLeft = 78052
          mmTop = 13494
          mmWidth = 11938
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'NOSSO N'#218'MERO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4191
          mmLeft = 91811
          mmTop = 13494
          mmWidth = 29379
          BandType = 3
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 265
          mmTop = 12700
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'C'#211'DIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 2910
          mmTop = 2646
          mmWidth = 14309
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'CLI_CODIGO'
          DataPipeline = ppDBPipeline2
          DisplayFormat = '0000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 4022
          mmLeft = 2910
          mmTop = 7408
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line6'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 794
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Registro(s):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 1588
          mmTop = 2381
          mmWidth = 19770
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataPipeline = ppDBPipeline2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 4022
          mmLeft = 23019
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'REC_VALORPARCELA'
          DataPipeline = ppDBPipeline2
          DisplayFormat = '###,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 4022
          mmLeft = 69850
          mmTop = 2381
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = dsConsulta2
    UserName = 'DBPipeline2'
    Left = 232
    Top = 64
  end
end
