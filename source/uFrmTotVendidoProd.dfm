object frmRelTotalVendido: TfrmRelTotalVendido
  Left = 283
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relatorio de Total Vendido por Produto'
  ClientHeight = 215
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 174
    Align = alClient
    TabOrder = 0
    object Label4: TLabel
      Left = 16
      Top = 61
      Width = 53
      Height = 13
      Caption = '&Fabricante:'
      FocusControl = cmbFabricante
      Transparent = True
    end
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 38
      Height = 13
      Caption = '&Per'#237'odo'
      FocusControl = edtDTINIC
      Transparent = True
    end
    object cmbFabricante: TComboBox
      Left = 17
      Top = 77
      Width = 256
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
    end
    object edtDTINIC: TDateEdit
      Left = 16
      Top = 36
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnExit = edtDTINICExit
    end
    object edtDTFINA: TDateEdit
      Left = 152
      Top = 36
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtDTFINAExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 174
    Width = 342
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtSair: TBitBtn
      Left = 257
      Top = 10
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
    object btImprimir: TBitBtn
      Left = 169
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = btImprimirClick
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
  end
  object dstTotalVendido: TSQLDataSet
    CommandText = 
      'Select P.PRO_CODIGO, P.PRO_DESCRICAO, F.for_fantasia, P.uni_codi' +
      'go,'#13#10'Sum(H.his_movimento) AS QUANTVENDIDA'#13#10'from PRODUTOS P'#13#10'INNE' +
      'R join ESTOQUE E ON E.PRO_CODIGO = P.PRO_CODIGO'#13#10'INNER join HIST' +
      'ORICO H ON H.HIS_PRODUTO = P.PRO_CODIGO'#13#10'INNER join FORNECEDORES' +
      ' F ON F.FOR_CODIGO = P.FOR_CODIGO'#13#10'Where (H.HIS_TIPO = '#39'V'#39')'#13#10'Gro' +
      'up By P.PRO_CODIGO, P.PRO_DESCRICAO, F.for_fantasia, P.uni_codig' +
      'o'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 8
    Top = 178
  end
  object dspTotalVendido: TDataSetProvider
    DataSet = dstTotalVendido
    Options = [poAllowCommandText]
    Left = 48
    Top = 179
  end
  object cdsTotalVendido: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotalVendido'
    Left = 88
    Top = 179
    object cdsTotalVendidoPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsTotalVendidoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsTotalVendidoFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsTotalVendidoUNI_CODIGO: TStringField
      FieldName = 'UNI_CODIGO'
      FixedChar = True
      Size = 2
    end
    object cdsTotalVendidoQUANTVENDIDA: TFMTBCDField
      FieldName = 'QUANTVENDIDA'
      Precision = 15
      Size = 3
    end
    object cdsTotalVendidoPRO_QUANTATUAL: TFloatField
      FieldKind = fkLookup
      FieldName = 'PRO_QUANTATUAL'
      LookupDataSet = cdsEstoque
      LookupKeyFields = 'PRO_CODIGO'
      LookupResultField = 'EST_QUANTIDADE'
      KeyFields = 'PRO_CODIGO'
      Lookup = True
    end
  end
  object dsTotalVendido: TDataSource
    DataSet = cdsTotalVendido
    Left = 120
    Top = 179
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBProdutos
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
    Left = 296
    Top = 24
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBProdutos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
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
        mmTop = 1058
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lbl_NMRELA2'
        AutoSize = False
        Caption = 'RELAT'#211'RIO : TOTAL VENDIDO POR PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 111125
        mmTop = 2646
        mmWidth = 79841
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1000
        mmTop = 26988
        mmWidth = 14478
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 16933
        mmTop = 26988
        mmWidth = 21167
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 25665
        mmWidth = 197380
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 31750
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'FABRICANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 83873
        mmTop = 26988
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'UNID.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 136790
        mmTop = 26723
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'ESTOQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 148696
        mmTop = 26723
        mmWidth = 17526
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'QUANT.VENDIDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 167746
        mmTop = 26723
        mmWidth = 29369
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo'
        AutoSize = False
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 111390
        mmTop = 7408
        mmWidth = 79904
        BandType = 0
      end
      object txtFabricante: TppLabel
        UserName = 'txtPeriodo1'
        AutoSize = False
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 111125
        mmTop = 11906
        mmWidth = 79904
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PRO_CODIGO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 1852
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3969
        mmLeft = 16933
        mmTop = 529
        mmWidth = 65088
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'FOR_FANTASIA'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3969
        mmLeft = 83873
        mmTop = 529
        mmWidth = 52652
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'UNI_CODIGO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 139409
        mmTop = 529
        mmWidth = 5080
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'PRO_QUANTATUAL'
        DataPipeline = ppDBProdutos
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 156062
        mmTop = 529
        mmWidth = 8805
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'QUANTVENDIDA'
        DataPipeline = ppDBProdutos
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 182732
        mmTop = 529
        mmWidth = 13716
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
    object ppGroup1: TppGroup
      BreakName = 'PRO_CODIGO'
      DataPipeline = ppDBProdutos
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBProdutos'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppDBProdutos: TppDBPipeline
    DataSource = dsTotalVendido
    UserName = 'DBProdutos'
    Left = 296
    Top = 56
  end
  object dstEstoque: TSQLDataSet
    CommandText = 'select EST_CODIGOLOJA, PRO_CODIGO, EST_QUANTIDADE from ESTOQUE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 8
    Top = 144
  end
  object dspEstoque: TDataSetProvider
    DataSet = dstEstoque
    Options = [poAllowCommandText]
    Left = 48
    Top = 144
  end
  object cdsEstoque: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoque'
    Left = 88
    Top = 144
  end
  object dsEstoque: TDataSource
    DataSet = cdsEstoque
    Left = 128
    Top = 144
  end
end
