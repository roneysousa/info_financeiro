inherited frmRelVisitaCliente: TfrmRelVisitaCliente
  Left = 222
  Top = 148
  Caption = 'Visita de Cliente'
  ClientHeight = 237
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 196
    object Label2: TLabel
      Left = 27
      Top = 10
      Width = 23
      Height = 13
      Caption = '&Loja:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label5: TLabel
      Left = 27
      Top = 51
      Width = 41
      Height = 13
      Caption = '&Per'#237'odo:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label6: TLabel
      Left = 155
      Top = 73
      Width = 6
      Height = 13
      Caption = #224
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label1: TLabel
      Left = 27
      Top = 94
      Width = 35
      Height = 13
      Caption = '&Cliente:'
      FocusControl = edtCDCLIE
      Transparent = True
    end
    object spLocCliente: TSpeedButton
      Left = 146
      Top = 111
      Width = 23
      Height = 22
      Hint = 'Localizar cliente'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777770077777777777770FF077777777777077FF07777
        7777770777FF077777777770777FFF00777777790777F1111077777790771117
        0B77777770799170B77777777709990B77777777770990B77777777777090B77
        777777777770B777777777777777777777777777777777777777}
      OnClick = spLocClienteClick
    end
    object lblCliente: TLabel
      Left = 172
      Top = 120
      Width = 13
      Height = 13
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 27
      Top = 134
      Width = 37
      Height = 13
      Caption = '&Regi'#227'o:'
    end
    object cmbNMLOJA: TComboBox
      Left = 27
      Top = 26
      Width = 263
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object edtDTINIC: TDateEdit
      Left = 27
      Top = 68
      Width = 121
      Height = 21
      Hint = 'Digite a data inicial'
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtDTINICExit
    end
    object edtDTFINI: TDateEdit
      Left = 169
      Top = 68
      Width = 121
      Height = 21
      Hint = 'Digite a data final'
      NumGlyphs = 2
      TabOrder = 2
      OnExit = edtDTFINIExit
    end
    object edtCDCLIE: TEdit
      Left = 27
      Top = 111
      Width = 117
      Height = 21
      MaxLength = 7
      TabOrder = 3
      OnChange = edtCDCLIEChange
      OnExit = edtCDCLIEExit
      OnKeyPress = edtCDCLIEKeyPress
    end
    object cmbRegiao: TComboBox
      Left = 27
      Top = 149
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 4
    end
  end
  inherited Panel2: TPanel
    Top = 196
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
  end
  object dstVisitaCliente: TSQLDataSet
    CommandText = 
      'select M.MOV_PEDIDO, M.MOV_DATAVENDA, M.MOV_LOJA, M.MOV_CLIENTE,' +
      ' M.MOV_VALOR, C.CLI_FANTASIA, C.CID_CODIGO'#13#10'FROM VENDAS M'#13#10'INNER' +
      ' join CLIENTES C ON M.MOV_CLIENTE = C.CLI_CODIGO'#13#10'Where (M.MOV_L' +
      'OJA = :pLOJA)'#13#10'Group by M.MOV_PEDIDO, M.MOV_DATAVENDA, M.MOV_LOJ' +
      'A, M.MOV_CLIENTE, M.MOV_VALOR, C.CLI_FANTASIA, C.CID_CODIGO'#13#10'Ord' +
      'er by C.CLI_FANTASIA'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 208
    Top = 8
  end
  object dspVisitaCliente: TDataSetProvider
    DataSet = dstVisitaCliente
    Options = [poAllowCommandText]
    Left = 248
    Top = 8
  end
  object cdsVisitaCliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspVisitaCliente'
    Left = 288
    Top = 8
    object cdsVisitaClienteMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
    end
    object cdsVisitaClienteMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsVisitaClienteMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
    end
    object cdsVisitaClienteMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
    end
    object cdsVisitaClienteCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsVisitaClienteCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
    end
    object cdsVisitaClienteMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      DisplayFormat = '#,###,##0.00'
      Precision = 15
      Size = 2
    end
  end
  object cdsDados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 8
    Data = {
      2E0100009619E0BD01000000180000000B0000000000030000002E0106504544
      49444F01004900000001000557494454480200020007000644544D4F56490400
      060000000000044C4F4A410400010000000000094344434C49454E5445010049
      0000000100055749445448020002000700044E4F4D4501004900000001000557
      494454480200020028000750524F4455544F0100490000000100055749445448
      020002000D000B4445534350524F4455544F0100490000000100055749445448
      0200020028000A464F524E454345444F52010049000000010005574944544802
      0002001E00055155414E5408000400000000000556414C4F5208000400000001
      0007535542545950450200490006004D6F6E6579000643494441444501004900
      00000100055749445448020002001E000000}
    object cdsDadosPEDIDO: TStringField
      FieldName = 'PEDIDO'
      Size = 7
    end
    object cdsDadosDTMOVI: TDateField
      FieldName = 'DTMOVI'
    end
    object cdsDadosLOJA: TIntegerField
      FieldName = 'LOJA'
    end
    object cdsDadosCDCLIENTE: TStringField
      FieldName = 'CDCLIENTE'
      Size = 7
    end
    object cdsDadosNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsDadosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 13
    end
    object cdsDadosDESCPRODUTO: TStringField
      FieldName = 'DESCPRODUTO'
      Size = 40
    end
    object cdsDadosFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 30
    end
    object cdsDadosQUANT: TFloatField
      FieldName = 'QUANT'
    end
    object cdsDadosVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object cdsDadosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 344
    Top = 40
  end
  object dstClientes: TSQLDataSet
    CommandText = 
      'Select M.MOV_PEDIDO, M.MOV_LOJA, C.CLI_FANTASIA'#13#10'FROM VENDAS M'#13#10 +
      'INNER join CLIENTES C ON M.MOV_CLIENTE = C.CLI_CODIGO'#13#10'Where (M.' +
      'MOV_LOJA = :pLOJA)'#13#10'AND (M.MOV_DATAVENDA >= :pDTINICIAL) AND (M.' +
      'MOV_DATAVENDA <= :pDTFINAL)'#13#10'Group by M.MOV_PEDIDO, M.MOV_LOJA, ' +
      'C.CLI_FANTASIA'#13#10'Order by C.CLI_FANTASIA'
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
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
        Value = 0d
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 200
    Top = 112
  end
  object dspClientes: TDataSetProvider
    DataSet = dstClientes
    Options = [poAllowCommandText]
    Left = 240
    Top = 112
  end
  object cdsClientes: TClientDataSet
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
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'dspClientes'
    Left = 280
    Top = 112
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBDados
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
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbVisitaCliente.rtm'
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
    Left = 296
    Top = 88
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBDados'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36248
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'Label1'
        Caption = 'EMPRESA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 8467
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'PER'#205'ODO  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 13758
        mmWidth = 19050
        BandType = 0
      end
      object txtEmpresa2: TppLabel
        UserName = 'txtEmpresa2'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 89694
        mmTop = 8467
        mmWidth = 17992
        BandType = 0
      end
      object txtPeriodo2: TppLabel
        UserName = 'txtPeriodo2'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 89694
        mmTop = 13758
        mmWidth = 17992
        BandType = 0
      end
      object txtRelatorio1: TppLabel
        UserName = 'txtRelatorio1'
        Caption = 'txtRelatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 3704
        mmWidth = 17727
        BandType = 0
      end
      object txtCliente: TppLabel
        UserName = 'txtFabricante1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 68792
        mmTop = 18521
        mmWidth = 21929
        BandType = 0
      end
      object txtRegiao: TppLabel
        UserName = 'txtSecao1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 68792
        mmTop = 23283
        mmWidth = 13716
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
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
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 30427
        mmWidth = 197644
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35190
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 30956
        mmWidth = 14478
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 19315
        mmTop = 30956
        mmWidth = 15325
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 110861
        mmTop = 30956
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label5'
        Caption = 'CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 154517
        mmTop = 30956
        mmWidth = 13462
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label6'
        Caption = 'PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 94721
        mmTop = 30956
        mmWidth = 13631
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label7'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 138907
        mmTop = 30956
        mmWidth = 12361
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CDCLIENTE'
        DataPipeline = ppDBDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDados'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 264
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = ppDBDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBDados'
        mmHeight = 3969
        mmLeft = 19315
        mmTop = 265
        mmWidth = 70115
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DTMOVI'
        DataPipeline = ppDBDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBDados'
        mmHeight = 3969
        mmLeft = 110861
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CIDADE'
        DataPipeline = ppDBDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBDados'
        mmHeight = 3969
        mmLeft = 154252
        mmTop = 265
        mmWidth = 42333
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VALOR'
        DataPipeline = ppDBDados
        DisplayFormat = '#,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDados'
        mmHeight = 3969
        mmLeft = 129382
        mmTop = 265
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PEDIDO'
        DataPipeline = ppDBDados
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBDados'
        mmHeight = 3969
        mmLeft = 90488
        mmTop = 265
        mmWidth = 18256
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line7'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 794
        mmWidth = 197644
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
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
      object ppLabel16: TppLabel
        UserName = 'Label16'
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
        UserName = 'SystemVariable4'
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
      mmHeight = 9525
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197644
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label8'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 1323
        mmWidth = 24638
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBDados'
        mmHeight = 4064
        mmLeft = 25929
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBDados: TppDBPipeline
    DataSource = dsDados
    UserName = 'DBDados'
    Left = 336
    Top = 88
    object ppDBDadosppField1: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 0
    end
    object ppDBDadosppField2: TppField
      FieldAlias = 'DTMOVI'
      FieldName = 'DTMOVI'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 1
    end
    object ppDBDadosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOJA'
      FieldName = 'LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBDadosppField4: TppField
      FieldAlias = 'CDCLIENTE'
      FieldName = 'CDCLIENTE'
      FieldLength = 7
      DisplayWidth = 7
      Position = 3
    end
    object ppDBDadosppField5: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object ppDBDadosppField6: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 13
      DisplayWidth = 13
      Position = 5
    end
    object ppDBDadosppField7: TppField
      FieldAlias = 'DESCPRODUTO'
      FieldName = 'DESCPRODUTO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 6
    end
    object ppDBDadosppField8: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppDBDadosppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDBDadosppField10: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 9
    end
    object ppDBDadosppField11: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
  end
  object dstConsulta: TSQLDataSet
    CommandText = 
      'Select MOV_PEDIDO, MOV_DATAVENDA from VENDAS '#13#10' Where (MOV_DATAV' +
      'ENDA >= :pDTINICIAL) '#13#10' and   (MOV_DATAVENDA <= :pDTFINAL) '#13#10' an' +
      'd   (MOV_CLIENTE    = :pCLIENTE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'pCLIENTE'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 200
    Top = 152
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 240
    Top = 152
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'pCLIENTE'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspConsulta'
    Left = 280
    Top = 152
  end
end
