object frmRelProdutosVencer: TfrmRelProdutosVencer
  Left = 198
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Produtos '#224' Vencer'
  ClientHeight = 224
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 183
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 376
      Height = 64
      Align = alTop
      Caption = '[ Dias ]'
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 18
        Width = 47
        Height = 13
        Caption = 'Dia Iniciar'
        FocusControl = edtDias
        Transparent = True
      end
      object Label2: TLabel
        Left = 96
        Top = 40
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label3: TLabel
        Left = 125
        Top = 18
        Width = 41
        Height = 13
        Caption = 'Dia Final'
        FocusControl = edtDias
        Transparent = True
      end
      object edtDias: TEdit
        Left = 16
        Top = 34
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 0
        OnChange = edtDiasChange
        OnEnter = edtDiasEnter
        OnExit = edtDiasExit
        OnKeyPress = edtDiasKeyPress
      end
      object edtFinal: TEdit
        Left = 122
        Top = 34
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 1
        OnChange = edtDiasChange
        OnEnter = edtFinalEnter
        OnExit = edtFinalExit
        OnKeyPress = edtFinalKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 65
      Width = 376
      Height = 75
      Align = alClient
      Caption = '[ Per'#237'odo ]'
      TabOrder = 1
      object Label4: TLabel
        Left = 16
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Iniciar'
        Transparent = True
      end
      object Label5: TLabel
        Left = 152
        Top = 16
        Width = 22
        Height = 13
        Caption = 'Final'
        Transparent = True
      end
      object edtDTINICIAL: TDateEdit
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
        OnEnter = edtDTINICIALEnter
        OnExit = edtDTINICIALExit
      end
      object edtDTFINAL: TDateEdit
        Left = 152
        Top = 32
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        OnChange = edtDTFINALChange
        OnEnter = edtDTFINALEnter
        OnExit = edtDTFINALExit
      end
    end
    object rgOpcoes: TRadioGroup
      Left = 1
      Top = 140
      Width = 376
      Height = 42
      Align = alBottom
      Caption = '[ Op'#231#245'es ]'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&A Vencer'
        '&Vencido')
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 183
    Width = 378
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtImprimir: TBitBtn
      Left = 198
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtImprimirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDB0000000000000000000000DBDBDBDB00DBDBDBDB
        DBDBDBDBDB00DB00DBDB00000000000000000000000000DB00DB00DBDBDBDBDB
        DBFCFCFCDBDB000000DB00DBDBDBDBDBDB929292DBDB00DB00DB000000000000
        00000000000000DBDB0000DBDBDBDBDBDBDBDBDBDB00DB00DB00DB0000000000
        0000000000DB00DB0000DBDB00FFFFFFFFFFFFFFFF00DB00DB00DBDBDB00FF00
        00000000FF00000000DBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00FF
        0000000000FF00DBDBDBDBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00
        0000000000000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB}
    end
    object BtSair: TBitBtn
      Left = 286
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtSairClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000006400004242
        42008C6363009A666600B9666600BB686800B0717200C3686900C66A6B00C76A
        6D00CF6C6E00D2686900D16D6E00CC6E7100C0797A00D2707200D4707100D572
        7300D0727500D3747600D9757600D8767700E37D7E000080000000960000DC7F
        8000FF00FF00D7868700DA888800D8888A00DA888A00DF898A00E6808100E085
        8500E9818200EE868700E3888900E78C8D00F0878800F18B8C00F28B8C00F18D
        8E00F48C8D00F48E8F00EB8F9000EC969700E49A9800F3919200F7909100F791
        9200F2939400F9909200F9949500FA949500F9969700F0999A00FC999A00FF9D
        9E00F7B58400F5A7A500FACCAA00FBD6BB00FADCDC00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001A1A1A1A1A1A
        1A02011A1A1A1A1A1A1A1A1A1A1A02030405011A1A1A1A1A1A1A1A1A0203080B
        0B07010303030303031A1A1A030C0C0C0A09010E1F323B3B031A1A1A030C0C10
        0F0D01181818183B031A1A1A03111114151201181818183B031A1A1A03161616
        201301181717173B031A1A1A0326222D3E1D01171700003B031A1A1A03262337
        3F1E013C3A3A3A3B031A1A1A03272B282A19013C3D3D3D3B031A1A1A03273031
        2921013C3D3D3D3B031A1A1A032734352F24013C3D3D3D3B031A1A1A03273338
        3625013C3D3D3D3B031A1A1A03032E33392C013C3D3D3D3B031A1A1A1A1A0306
        1B1C010303030303031A1A1A1A1A1A1A0303011A1A1A1A1A1A1A}
    end
  end
  object dstProdutos: TSQLDataSet
    CommandText = 
      'Select * from LOTES L'#13#10'Where (L.LOT_DTVENCIMENTO >= :pDTINCIAL)'#13 +
      #10'and   (L.LOT_DTVENCIMENTO <= :pDTFINAL)'#13#10'and   (L.LOT_QUANTIDAD' +
      'E <> 0)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINCIAL'
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
    Left = 8
    Top = 186
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 42
    Top = 186
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINCIAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'dspProdutos'
    Left = 76
    Top = 186
    object cdsProdutosLOT_PROCODIGO: TStringField
      FieldName = 'LOT_PROCODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosLOT_NRLOTE: TStringField
      FieldName = 'LOT_NRLOTE'
      Required = True
    end
    object cdsProdutosLOT_QUANTIDADE: TFMTBCDField
      FieldName = 'LOT_QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object cdsProdutosLOT_DTVENCIMENTO: TDateField
      FieldName = 'LOT_DTVENCIMENTO'
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsDados
    Left = 110
    Top = 186
  end
  object qryTotal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select LOT_PROCODIGO, Sum(LOT_QUANTIDADE) AS TOTAL from LOTES'
      'Where (LOT_PROCODIGO = :pCODIGO)'
      'Group by LOT_PROCODIGO')
    SQLConnection = Dm.SqlAdmin
    Left = 264
    Top = 8
    object qryTotalLOT_PROCODIGO: TStringField
      FieldName = 'LOT_PROCODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object qryTotalTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 3
    end
  end
  object cdsDados: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PRO_CDPROD'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'PRO_NMPROD'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PRO_NMFABR'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PRO_VLVEND'
        DataType = ftCurrency
      end
      item
        Name = 'PRO_NRLOTE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PRO_QTESTO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsDadosIndex1'
        Fields = 'PRO_NMPROD'
      end>
    IndexFieldNames = 'PRO_NMPROD'
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsDadosCalcFields
    Left = 304
    Top = 8
    Data = {
      D00000009619E0BD010000001800000006000000000003000000D0000A50524F
      5F434450524F440100490000000100055749445448020002000D000A50524F5F
      4E4D50524F4401004900000001000557494454480200020028000A50524F5F4E
      4D4641425201004900000001000557494454480200020028000A50524F5F564C
      56454E44080004000000010007535542545950450200490006004D6F6E657900
      0A50524F5F4E524C4F544501004900000001000557494454480200020014000A
      50524F5F51544553544F08000400000000000000}
    object cdsDadosPRO_CDPROD: TStringField
      FieldName = 'PRO_CDPROD'
      Size = 13
    end
    object cdsDadosPRO_NMPROD: TStringField
      FieldName = 'PRO_NMPROD'
      Size = 40
    end
    object cdsDadosPRO_NMFABR: TStringField
      FieldName = 'PRO_NMFABR'
      Size = 40
    end
    object cdsDadosPRO_VLVEND: TCurrencyField
      FieldName = 'PRO_VLVEND'
    end
    object cdsDadosPRO_NRLOTE: TStringField
      FieldName = 'PRO_NRLOTE'
    end
    object cdsDadosPRO_QTESTO: TFloatField
      FieldName = 'PRO_QTESTO'
    end
    object cdsDadosPRO_TOESTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PRO_TOESTO'
      Calculated = True
    end
  end
  object ppRepProdutos: TppReport
    AutoStop = False
    DataPipeline = ppDBProdutos
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 (21 x 29,7 cm) '
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\EMPRESA\SERVICO\DELPHI\Relatorios\rbRelProdutosAVencer.rtm'
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
    Left = 312
    Top = 80
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBProdutos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 23283
        mmLeft = 3440
        mmTop = 2646
        mmWidth = 41540
        BandType = 0
      end
      object txtNMRELATORIO: TppLabel
        UserName = 'lbl_NMRELA2'
        Caption = 'RELA'#199#195'O DE PRODUTOS '#192' VENCER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 119327
        mmTop = 3704
        mmWidth = 63161
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 794
        mmTop = 27517
        mmWidth = 11176
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 21960
        mmTop = 27517
        mmWidth = 16669
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 26458
        mmWidth = 197380
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 31221
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'FABRICANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 71967
        mmTop = 27517
        mmWidth = 17949
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'VL.VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 112448
        mmTop = 27517
        mmWidth = 14605
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'LOTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 130175
        mmTop = 27517
        mmWidth = 17484
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'EST.LOTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 153194
        mmTop = 27517
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'EST. TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3302
        mmLeft = 169863
        mmTop = 27517
        mmWidth = 17727
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo'
        Caption = 'PER'#205'ODO : 99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 119327
        mmTop = 8731
        mmWidth = 37084
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'PRO_CDPROD'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3302
        mmLeft = 265
        mmTop = 265
        mmWidth = 19897
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PRO_NMPROD'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3979
        mmLeft = 21960
        mmTop = 265
        mmWidth = 48683
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PRO_NMFABR'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3979
        mmLeft = 71967
        mmTop = 265
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'PRO_VLVEND'
        DataPipeline = ppDBProdutos
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3471
        mmLeft = 109834
        mmTop = 265
        mmWidth = 17695
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'PRO_NRLOTE'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3302
        mmLeft = 130133
        mmTop = 265
        mmWidth = 17526
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'PRO_QTESTO'
        DataPipeline = ppDBProdutos
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3302
        mmLeft = 150813
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'PRO_TOESTO'
        DataPipeline = ppDBProdutos
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3175
        mmLeft = 170921
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
      object ppLine5: TppLine
        UserName = 'Line5'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3969
        mmLeft = 26723
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 1323
        mmWidth = 24638
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 7
      end
    end
  end
  object ppDBProdutos: TppDBPipeline
    DataSource = dsProdutos
    UserName = 'DBProdutos'
    Left = 280
    Top = 88
    object ppDBProdutosppField1: TppField
      FieldAlias = 'PRO_CDPROD'
      FieldName = 'PRO_CDPROD'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBProdutosppField2: TppField
      FieldAlias = 'PRO_NMPROD'
      FieldName = 'PRO_NMPROD'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppDBProdutosppField3: TppField
      FieldAlias = 'PRO_NMFABR'
      FieldName = 'PRO_NMFABR'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDBProdutosppField4: TppField
      FieldAlias = 'PRO_VLVEND'
      FieldName = 'PRO_VLVEND'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 3
    end
    object ppDBProdutosppField5: TppField
      FieldAlias = 'PRO_NRLOTE'
      FieldName = 'PRO_NRLOTE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppDBProdutosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_QTESTO'
      FieldName = 'PRO_QTESTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDBProdutosppField7: TppField
      FieldAlias = 'PRO_TOESTO'
      FieldName = 'PRO_TOESTO'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 6
    end
  end
end
