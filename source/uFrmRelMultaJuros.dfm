inherited frmRelMultaJuros: TfrmRelMultaJuros
  Top = 203
  Caption = 'Relat'#243'rio de Total Recebido Multa/Juros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Top = 55
    end
    inherited Label2: TLabel
      Top = 99
    end
    object Label4: TLabel [2]
      Left = 23
      Top = 14
      Width = 55
      Height = 13
      Caption = '&Condominio'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    inherited edtDTINIC: TDateEdit
      Top = 71
      TabOrder = 1
    end
    inherited edtDTFINA: TDateEdit
      Top = 115
      TabOrder = 2
    end
    object cmbNMLOJA: TComboBox
      Left = 23
      Top = 30
      Width = 298
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
  end
  inherited Panel2: TPanel
    inherited BtImprimir: TBitBtn
      OnClick = BtImprimirClick
    end
  end
  object dstConsulta: TSQLDataSet
    CommandText = 
      'select SUM(CR.REC_VALORPARCELA) AS VALOR, SUM(CR.REC_PAGO) AS PA' +
      'GO,'#13#10'SUM(CR.REC_VALORPARCELA - CR.REC_PAGO) AS TOTAL,'#13#10'SUM(CR.RE' +
      'C_VALORDESCONTO) AS DESCONTO,'#13#10'SUM(CR.REC_VLMULTA) AS MULTA,'#13#10'SU' +
      'M(CR.REC_VALORJUROS) AS JUROS from CONTASRECEBER CR Where (CR.RE' +
      'C_DATAPAGAMENTO >= :pDTINICIO) And'#13#10'(CR.REC_DATAPAGAMENTO <= :pD' +
      'TFINAL)'#13#10'AND (CR.REC_LOJA = :pLOJA) AND (CR.REC_SITUACAO = :pSIT' +
      'UACAO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 160
    Top = 104
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 192
    Top = 104
  end
  object cdsConsulta: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsulta'
    Left = 224
    Top = 104
    object cdsConsultaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultaPAGO: TFMTBCDField
      FieldName = 'PAGO'
      ReadOnly = True
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ReadOnly = True
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      ReadOnly = True
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultaMULTA: TFMTBCDField
      FieldName = 'MULTA'
      ReadOnly = True
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultaJUROS: TFMTBCDField
      FieldName = 'JUROS'
      ReadOnly = True
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 264
    Top = 104
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
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
    Left = 160
    Top = 64
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33867
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
        mmHeight = 23283
        mmLeft = 1852
        mmTop = 2117
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'RELAT'#211'RIO : MULTA/JUROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 102659
        mmTop = 7144
        mmWidth = 48133
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo1'
        Caption = 'txtPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 16404
        mmWidth = 16140
        BandType = 0
      end
      object lblSituacao: TppLabel
        UserName = 'lblSituacao'
        Caption = 'lblSituacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 11906
        mmWidth = 17463
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197380
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 32808
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 3175
        mmTop = 28310
        mmWidth = 20955
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 60568
        mmTop = 28310
        mmWidth = 12192
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VALOR'
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
        mmLeft = 37835
        mmTop = 794
        mmWidth = 35454
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Valor a Receber:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 3175
        mmTop = 794
        mmWidth = 27686
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Valor a Recebido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 3175
        mmTop = 6085
        mmWidth = 29676
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Valor do Desconto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 3175
        mmTop = 11377
        mmWidth = 32258
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Total Multa/Juros:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 3175
        mmTop = 16404
        mmWidth = 30438
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PAGO'
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
        mmLeft = 37835
        mmTop = 6085
        mmWidth = 35454
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCONTO'
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
        mmLeft = 37835
        mmTop = 11377
        mmWidth = 35454
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'JUROS'
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
        mmLeft = 37835
        mmTop = 16404
        mmWidth = 35454
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line6'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 2381
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 161661
        mmTop = 2381
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 6879
        mmWidth = 11906
        BandType = 8
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsConsulta
    UserName = 'DBPipeline1'
    Left = 200
    Top = 64
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAGO'
      FieldName = 'PAGO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO'
      FieldName = 'DESCONTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'MULTA'
      FieldName = 'MULTA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUROS'
      FieldName = 'JUROS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
  end
end
