inherited frmRelTotalVendidoFabricante: TfrmRelTotalVendidoFabricante
  Left = 250
  Top = 162
  Caption = 'Total Vendido por Fabricante'
  ClientHeight = 225
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 184
    object Label2: TLabel
      Left = 26
      Top = 17
      Width = 23
      Height = 13
      Caption = '&Loja:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label1: TLabel
      Left = 27
      Top = 62
      Width = 41
      Height = 13
      Caption = '&Per'#237'odo:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label3: TLabel
      Left = 155
      Top = 85
      Width = 6
      Height = 13
      Caption = #224
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label4: TLabel
      Left = 27
      Top = 103
      Width = 57
      Height = 13
      Caption = '&Fornecedor:'
      FocusControl = cmbFabricante
      Transparent = True
    end
    object cmbNMLOJA: TComboBox
      Left = 27
      Top = 33
      Width = 263
      Height = 22
      Hint = 'Selecione a Loja'
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object edtDTINIC: TDateEdit
      Left = 27
      Top = 80
      Width = 121
      Height = 21
      Hint = 'Digite a data inicial'
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtDTINICExit
    end
    object edtDTFINI: TDateEdit
      Left = 169
      Top = 80
      Width = 121
      Height = 21
      Hint = 'Digite a data final'
      NumGlyphs = 2
      TabOrder = 2
      OnExit = edtDTFINIExit
    end
    object cmbFabricante: TComboBox
      Left = 27
      Top = 120
      Width = 263
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
    end
  end
  inherited Panel2: TPanel
    Top = 184
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
  end
  object dstTotVendido: TSQLDataSet
    CommandText = 
      'Select H.HIS_LOJA, F.FOR_FANTASIA, Sum(H.HIS_MOVIMENTO) as QUANT' +
      ','#13#10'Sum(H.HIS_VLVENDA) as VALOR'#13#10'FROM HISTORICO H'#13#10'INNER join PRO' +
      'DUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO'#13#10'INNER join FORNECEDORES' +
      ' F ON P.FOR_CODIGO = F.FOR_CODIGO'#13#10'Where (H.HIS_LOJA = :pLOJA) '#13 +
      #10'AND (H.HIS_DATA >= :pDTINICIAL) AND (H.HIS_DATA <= :pDTFINAL)'#13#10 +
      'AND (H.HIS_TIPO = :pTIPO)'#13#10'Group by H.HIS_LOJA, F.FOR_FANTASIA'#13#10 +
      'Order by F.FOR_FANTASIA;'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 8
    Top = 152
  end
  object dspTotalVendidos: TDataSetProvider
    DataSet = dstTotVendido
    Options = [poAllowCommandText]
    Left = 48
    Top = 152
  end
  object cdsTotalVendido: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspTotalVendidos'
    OnCalcFields = cdsTotalVendidoCalcFields
    Left = 88
    Top = 152
    object cdsTotalVendidoHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
    end
    object cdsTotalVendidoFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsTotalVendidoQUANT: TFMTBCDField
      FieldName = 'QUANT'
      DisplayFormat = '##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsTotalVendidoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsTotalVendidoPERCENTUAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.#0'
      Calculated = True
    end
  end
  object dsTotalVendido: TDataSource
    DataSet = cdsTotalVendido
    Left = 128
    Top = 152
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
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbTotalVendidoFabric2.rtm'
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
    Top = 144
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 48948
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'FABRICANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 1948
        mmTop = 43392
        mmWidth = 22648
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 112977
        mmTop = 43656
        mmWidth = 12192
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 137319
        mmTop = 43656
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = '% VENDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 170657
        mmTop = 43656
        mmWidth = 18542
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 42598
        mmWidth = 197644
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 48154
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'EMPRESA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 13758
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'PER'#205'ODO  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 18785
        mmWidth = 19050
        BandType = 0
      end
      object txtEmpresa: TppLabel
        UserName = 'txtEmpresa'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 122767
        mmTop = 13758
        mmWidth = 17992
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtEmpresa1'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 122502
        mmTop = 18785
        mmWidth = 17992
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
        mmHeight = 26458
        mmLeft = 1588
        mmTop = 2381
        mmWidth = 50006
        BandType = 0
      end
      object txtRelatorio: TppLabel
        UserName = 'txtRelatorio'
        Caption = 'txtRelatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 8731
        mmWidth = 17727
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'FOR_FANTASIA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 1746
        mmTop = 264
        mmWidth = 87048
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VALOR'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 95250
        mmTop = 265
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'QUANT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 128852
        mmTop = 265
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PERCENTUAL'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 166952
        mmTop = 264
        mmWidth = 22754
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 794
        mmWidth = 197644
        BandType = 8
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
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
        mmLeft = 161661
        mmTop = 2381
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
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
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 6879
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197644
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 95250
        mmTop = 1588
        mmWidth = 29633
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'QUANT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 128852
        mmTop = 1588
        mmWidth = 29633
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'PERCENTUAL'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 166952
        mmTop = 1588
        mmWidth = 22754
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 24299
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 25929
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsTotalVendido
    UserName = 'DBPipeline1'
    Left = 224
    Top = 144
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'HIS_LOJA'
      FieldName = 'HIS_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'FOR_FANTASIA'
      FieldName = 'FOR_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 16
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTUAL'
      FieldName = 'PERCENTUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object cdsFabricantes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspFabricantes'
    OnCalcFields = cdsFabricantesCalcFields
    Left = 304
    Top = 128
    object cdsFabricantesFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsFabricantesMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
    end
    object cdsFabricantesCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsFabricantesCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Size = 40
    end
    object cdsFabricantesVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object cdsFabricantesPEDIDO: TStringField
      FieldKind = fkCalculated
      FieldName = 'PEDIDO'
      Size = 7
      Calculated = True
    end
    object cdsFabricantesMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
  end
  object dsFabricante: TDataSource
    DataSet = cdsFabricantes
    Left = 344
    Top = 128
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBPFabricante
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
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbTotalVendidoFabric2.rtm'
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
    Left = 304
    Top = 32
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPFabricante'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38100
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'Label1'
        Caption = 'FORNECEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1519
        mmTop = 32808
        mmWidth = 25231
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 32015
        mmWidth = 197644
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 37571
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label5'
        Caption = 'EMPRESA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 13758
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label6'
        Caption = 'PER'#205'ODO  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 18785
        mmWidth = 19050
        BandType = 0
      end
      object txtEmpresa2: TppLabel
        UserName = 'txtEmpresa'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 122767
        mmTop = 13758
        mmWidth = 17992
        BandType = 0
      end
      object txtPeriodo2: TppLabel
        UserName = 'txtEmpresa1'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 122502
        mmTop = 18785
        mmWidth = 17992
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 26458
        mmLeft = 1588
        mmTop = 2381
        mmWidth = 50006
        BandType = 0
      end
      object txtRelatorio2: TppLabel
        UserName = 'txtRelatorio'
        Caption = 'txtRelatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 8731
        mmWidth = 17727
        BandType = 0
      end
      object txtFornecedor: TppLabel
        UserName = 'txtFornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 102129
        mmTop = 23548
        mmWidth = 21929
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText2'
        DataField = 'VALOR'
        DataPipeline = ppDBPFabricante
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFabricante'
        mmHeight = 3969
        mmLeft = 115888
        mmTop = 169
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText3'
        DataField = 'CID_NOME'
        DataPipeline = ppDBPFabricante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPFabricante'
        mmHeight = 3969
        mmLeft = 148432
        mmTop = 264
        mmWidth = 48419
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText5'
        DataField = 'PEDIDO'
        DataPipeline = ppDBPFabricante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFabricante'
        mmHeight = 4064
        mmLeft = 1588
        mmTop = 169
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText6'
        DataField = 'CLI_FANTASIA'
        DataPipeline = ppDBPFabricante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPFabricante'
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 169
        mmWidth = 72231
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'MOV_DATAVENDA'
        DataPipeline = ppDBPFabricante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFabricante'
        mmHeight = 3969
        mmLeft = 93927
        mmTop = 264
        mmWidth = 18785
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 794
        mmWidth = 197644
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label12'
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
        UserName = 'SystemVariable1'
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
      object ppLabel20: TppLabel
        UserName = 'Label13'
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
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 6879
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line4'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197644
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR'
        DataPipeline = ppDBPFabricante
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFabricante'
        mmHeight = 4022
        mmLeft = 115888
        mmTop = 1588
        mmWidth = 29633
        BandType = 7
      end
      object ppLabel21: TppLabel
        UserName = 'Label7'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 24299
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc4'
        DataPipeline = ppDBPFabricante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPFabricante'
        mmHeight = 4022
        mmLeft = 25929
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'FOR_FANTASIA'
      DataPipeline = ppDBPFabricante
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPFabricante'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppDBText5: TppDBText
          UserName = 'DBText1'
          DataField = 'FOR_FANTASIA'
          DataPipeline = ppDBPFabricante
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPFabricante'
          mmHeight = 3969
          mmLeft = 529
          mmTop = 265
          mmWidth = 87048
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label2'
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 133086
          mmTop = 4498
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label3'
          Caption = 'CIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 147373
          mmTop = 4498
          mmWidth = 13462
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'PEDIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 4498
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19844
          mmTop = 4498
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'DATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 102659
          mmTop = 4498
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line5'
          Weight = 0.750000000000000000
          mmHeight = 529
          mmLeft = 0
          mmTop = 8996
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLine9: TppLine
          UserName = 'Line9'
          Weight = 0.750000000000000000
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 197644
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VALOR'
          DataPipeline = ppDBPFabricante
          DisplayFormat = '###,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPFabricante'
          mmHeight = 4064
          mmLeft = 115888
          mmTop = 794
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDBPFabricante: TppDBPipeline
    DataSource = dsFabricante
    UserName = 'DBPFabricante'
    Left = 336
    Top = 32
    object ppDBPFabricanteppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'HIS_LOJA'
      FieldName = 'HIS_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPFabricanteppField2: TppField
      FieldAlias = 'FOR_FANTASIA'
      FieldName = 'FOR_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPFabricanteppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_PEDIDO'
      FieldName = 'MOV_PEDIDO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPFabricanteppField4: TppField
      FieldAlias = 'CLI_FANTASIA'
      FieldName = 'CLI_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPFabricanteppField5: TppField
      FieldAlias = 'CID_NOME'
      FieldName = 'CID_NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object ppDBPFabricanteppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 5
    end
    object ppDBPFabricanteppField7: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 6
    end
    object ppDBPFabricanteppField8: TppField
      FieldAlias = 'MOV_DATAVENDA'
      FieldName = 'MOV_DATAVENDA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 7
    end
  end
  object dstFabricante: TSQLDataSet
    CommandText = 
      'Select H.HIS_LOJA, F.FOR_FANTASIA, V.MOV_PEDIDO, V.MOV_DATAVENDA' +
      ', C.CLI_FANTASIA, CI.CID_NOME,'#13#10'Sum(H.HIS_VLVENDA) as VALOR'#13#10'FRO' +
      'M HISTORICO H'#13#10'INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CO' +
      'DIGO'#13#10'INNER join FORNECEDORES F ON P.FOR_CODIGO = F.FOR_CODIGO'#13#10 +
      'INNER join VENDAS V ON H.HIS_DOCUMENTO = V.MOV_PEDIDO'#13#10'INNER joi' +
      'n CLIENTES C ON V.MOV_CLIENTE = C.CLI_CODIGO'#13#10'INNER join CIDADES' +
      ' CI ON C.CID_CODIGO = CI.CID_CODIGO'#13#10'Where (H.HIS_LOJA = :pLOJA)' +
      #13#10'AND (H.HIS_DATA >= :pDTINICIAL) AND (H.HIS_DATA <= :pDTFINAL)'#13 +
      #10'AND (H.HIS_TIPO = :pTIPO)'#13#10'Group by H.HIS_LOJA, F.FOR_FANTASIA,' +
      ' V.MOV_PEDIDO, V.MOV_DATAVENDA, CLI_FANTASIA, CI.CID_NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 304
    Top = 80
  end
  object dspFabricantes: TDataSetProvider
    DataSet = dstFabricante
    Options = [poAllowCommandText]
    Left = 344
    Top = 80
  end
  object dstDados: TSQLDataSet
    CommandText = 
      'Select V.MOV_LOJA, V.MOV_PEDIDO, V.MOV_DATAVENDA, C.cli_razao, C' +
      '.CLI_FANTASIA, CI.CID_NOME,'#13#10'F.FOR_FANTASIA, V.MOV_VALOR'#13#10'FROM V' +
      'ENDAS V'#13#10'INNER join CLIENTES C ON V.MOV_CLIENTE = C.CLI_CODIGO'#13#10 +
      'INNER join CIDADES CI ON C.CID_CODIGO = CI.CID_CODIGO'#13#10'INNER joi' +
      'n PROVENDAS PV ON PV.MOP_PEDIDO = V.MOV_PEDIDO'#13#10'INNER join PRODU' +
      'TOS P ON P.PRO_CODIGO = PV.MOP_PRODUTO'#13#10'INNER join FORNECEDORES ' +
      'F ON F.FOR_CODIGO = P.FOR_CODIGO'#13#10'Group by V.MOV_LOJA, V.MOV_PED' +
      'IDO, V.MOV_DATAVENDA,'#13#10'C.cli_razao, C.CLI_FANTASIA, CI.CID_NOME,' +
      #13#10'F.FOR_FANTASIA, V.MOV_VALOR'#13#10'order by V.MOV_PEDIDO, V.MOV_DATA' +
      'VENDA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 192
  end
  object dspDados: TDataSetProvider
    DataSet = dstDados
    Options = [poAllowCommandText]
    Left = 56
    Top = 192
  end
  object cdsDados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDados'
    Left = 88
    Top = 192
    object cdsDadosMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
    end
    object cdsDadosMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsDadosMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsDadosCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
    object cdsDadosCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsDadosCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Size = 40
    end
    object cdsDadosFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsDadosMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 136
    Top = 192
  end
  object ppReport3: TppReport
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
    Left = 112
    Top = 8
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline2'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51065
      mmPrintPosition = 0
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 26458
        mmLeft = 1588
        mmTop = 2381
        mmWidth = 50006
        BandType = 0
      end
      object txtRelatorio3: TppLabel
        UserName = 'txtRelatorio1'
        Caption = 'txtRelatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 8731
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'EMPRESA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 13758
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'PER'#205'ODO  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 18785
        mmWidth = 19050
        BandType = 0
      end
      object txtFornecedor3: TppLabel
        UserName = 'txtFornecedor1'
        Caption = 'txtFornecedor1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 102129
        mmTop = 23548
        mmWidth = 23664
        BandType = 0
      end
      object txtPeriodo3: TppLabel
        UserName = 'txtPeriodo3'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 122502
        mmTop = 18785
        mmWidth = 17992
        BandType = 0
      end
      object txtEmpresa3: TppLabel
        UserName = 'txtEmpresa2'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 122767
        mmTop = 13758
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'FORNECEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 32808
        mmWidth = 25231
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 32015
        mmWidth = 197644
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 37571
        mmWidth = 197644
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'FOR_FANTASIA'
        DataPipeline = ppDBPFabricante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPFabricante'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 41540
        mmWidth = 87048
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 45773
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 19844
        mmTop = 45773
        mmWidth = 15346
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 50271
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 102659
        mmTop = 45773
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 133086
        mmTop = 45773
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 147373
        mmTop = 45773
        mmWidth = 13494
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'MOV_PEDIDO'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4064
        mmLeft = 1588
        mmTop = 169
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CLI_FANTASIA'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 264
        mmWidth = 72231
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'MOV_DATAVENDA'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 93927
        mmTop = 264
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'MOV_VALOR'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 115888
        mmTop = 264
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'CID_NOME'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 148432
        mmTop = 264
        mmWidth = 48419
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'Line13'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 794
        mmWidth = 197644
        BandType = 8
      end
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
        mmLeft = 143669
        mmTop = 2381
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
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
      object ppLabel24: TppLabel
        UserName = 'Label24'
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
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 6879
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine15: TppLine
        UserName = 'Line15'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197644
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'MOV_VALOR'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4022
        mmLeft = 115888
        mmTop = 1588
        mmWidth = 29633
        BandType = 7
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 24299
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4022
        mmLeft = 25929
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = dsDados
    UserName = 'DBPipeline2'
    Left = 160
    Top = 8
    object ppDBPipeline2ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_LOJA'
      FieldName = 'MOV_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline2ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_PEDIDO'
      FieldName = 'MOV_PEDIDO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = 'MOV_DATAVENDA'
      FieldName = 'MOV_DATAVENDA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline2ppField4: TppField
      FieldAlias = 'CLI_RAZAO'
      FieldName = 'CLI_RAZAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline2ppField5: TppField
      FieldAlias = 'CLI_FANTASIA'
      FieldName = 'CLI_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDBPipeline2ppField6: TppField
      FieldAlias = 'CID_NOME'
      FieldName = 'CID_NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object ppDBPipeline2ppField7: TppField
      FieldAlias = 'FOR_FANTASIA'
      FieldName = 'FOR_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBPipeline2ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_VALOR'
      FieldName = 'MOV_VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 7
    end
  end
  object dstLojas: TSQLDataSet
    CommandText = 'Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 8
    Top = 120
  end
  object dspLojas: TDataSetProvider
    DataSet = dstLojas
    Options = [poAllowCommandText]
    Left = 48
    Top = 120
  end
  object cdsLojas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLojas'
    Left = 88
    Top = 120
    object cdsLojasEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
    end
    object cdsLojasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
  end
  object dstFornecedor: TSQLDataSet
    CommandText = 
      'select FOR_CODIGO, FOR_FANTASIA, FOR_RAZAO from FORNECEDORES ord' +
      'er by FOR_FANTASIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 96
    Top = 56
  end
  object dspFornecedor: TDataSetProvider
    DataSet = dstFornecedor
    Options = [poAllowCommandText]
    Left = 136
    Top = 56
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedor'
    Left = 168
    Top = 56
    object cdsFornecedorFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      Required = True
    end
    object cdsFornecedorFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsFornecedorFOR_RAZAO: TStringField
      FieldName = 'FOR_RAZAO'
      Size = 50
    end
  end
end
