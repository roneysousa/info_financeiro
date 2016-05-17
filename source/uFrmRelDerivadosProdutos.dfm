object frmRelDerivadosProdutos: TfrmRelDerivadosProdutos
  Left = 213
  Top = 169
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Derivados de Produtos'
  ClientHeight = 218
  ClientWidth = 333
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 333
    Height = 177
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 15
      Width = 23
      Height = 13
      Caption = '&Loja:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label2: TLabel
      Left = 17
      Top = 106
      Width = 26
      Height = 13
      Caption = '&Data:'
      FocusControl = edtDTINIC
      Transparent = True
    end
    object Label4: TLabel
      Left = 17
      Top = 61
      Width = 40
      Height = 13
      Caption = '&Produto:'
      FocusControl = edtCDPROD
      Transparent = True
    end
    object lbl_nmprod: TLabel
      Left = 64
      Top = 61
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
    object spLocProduto: TSpeedButton
      Left = 139
      Top = 79
      Width = 23
      Height = 22
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
      OnClick = spLocProdutoClick
    end
    object cmbNMLOJA: TComboBox
      Left = 16
      Top = 34
      Width = 302
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnKeyPress = cmbNMLOJAKeyPress
    end
    object edtDTINIC: TDateEdit
      Left = 16
      Top = 124
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      OnKeyPress = edtDTINICKeyPress
    end
    object edtCDPROD: TEdit
      Left = 16
      Top = 80
      Width = 121
      Height = 21
      MaxLength = 13
      TabOrder = 1
      OnChange = edtCDPRODChange
      OnExit = edtCDPRODExit
      OnKeyPress = edtCDPRODKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 177
    Width = 333
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtGravar: TBitBtn
      Left = 159
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
      OnClick = BtGravarClick
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
      Left = 246
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
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
  object dstHisProdutos: TSQLDataSet
    CommandText = 
      'Select H.HIS_PRODUTO, SUM(H.HIS_MOVIMENTO) AS MOVIMENTO'#13#10', H.HIS' +
      '_VLVENDA,'#13#10'P.PRO_VLVENDA'#13#10'from  HISTORICO H'#13#10'INNER join PRODUTOS' +
      ' P ON P.PRO_CODIGO = H.HIS_CODIGOBAIXA'#13#10'INNER join ESTOQUE  E ON' +
      ' E.PRO_CODIGO = P.PRO_CODIGO'#13#10'Where (H.HIS_CODIGOBAIXA = :pCODIG' +
      'OBAIXA) AND'#13#10'(E.EST_CODIGOLOJA = :pLOJA) AND (H.his_data  = :pDT' +
      'MOVIMENTO)  and'#13#10'(H.HIS_TIPO = :pTIPO) AND (E.EST_DTENTRADA = :p' +
      'DTENTRADA)'#13#10'Group by H.HIS_PRODUTO, H.HIS_VLVENDA, P.PRO_VLVENDA' +
      ';'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGOBAIXA'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'pDTMOVIMENTO'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDate
        Name = 'pDTENTRADA'
        ParamType = ptInput
        Value = 0d
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 192
    Top = 144
    object dstHisProdutosHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object dstHisProdutosHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      Precision = 15
      Size = 2
    end
    object dstHisProdutosPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      Precision = 15
      Size = 2
    end
    object dstHisProdutosMOVIMENTO: TFMTBCDField
      FieldName = 'MOVIMENTO'
      Precision = 15
      Size = 3
    end
  end
  object dspHisProdutos: TDataSetProvider
    DataSet = dstHisProdutos
    Options = [poAllowCommandText]
    Left = 224
    Top = 144
  end
  object cdsHisProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGOBAIXA'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'pDTMOVIMENTO'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDate
        Name = 'pDTENTRADA'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'dspHisProdutos'
    OnCalcFields = cdsHisProdutosCalcFields
    Left = 256
    Top = 144
    object cdsHisProdutosHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsHisProdutosPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      Precision = 15
      Size = 2
    end
    object cdsHisProdutosPRO_DESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'PRO_DESCRICAO'
      LookupDataSet = cdsProdutos
      LookupKeyFields = 'PRO_CODIGO'
      LookupResultField = 'PRO_DESCRICAO'
      KeyFields = 'HIS_PRODUTO'
      Size = 40
      Lookup = True
    end
    object cdsHisProdutosHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      Precision = 15
      Size = 2
    end
    object cdsHisProdutosMOVIMENTO: TFMTBCDField
      FieldName = 'MOVIMENTO'
      Precision = 15
      Size = 3
    end
    object cdsHisProdutosSUB_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SUB_TOTAL'
      Calculated = True
    end
  end
  object dsHisProdutos: TDataSource
    DataSet = cdsHisProdutos
    Left = 296
    Top = 56
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipHisProdutos
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 264
    Top = 56
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipHisProdutos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32808
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
        mmLeft = 1323
        mmTop = 529
        mmWidth = 41540
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 26194
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 27252
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'PRODUTO..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 107156
        mmTop = 11906
        mmWidth = 20828
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'LOJA..........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 107156
        mmTop = 7408
        mmWidth = 20066
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lbl_NMRELA2'
        Caption = 'RELAT'#211'RIO: DERIVADOS DE PRODUTOS VENDIDOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 107156
        mmTop = 2910
        mmWidth = 90170
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 31750
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101865
        mmTop = 27517
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 147373
        mmTop = 27252
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'ENTRADA...:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 106892
        mmTop = 16140
        mmWidth = 20997
        BandType = 0
      end
      object txtLoja: TppLabel
        UserName = 'txtLoja'
        Caption = 'txtLoja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 129540
        mmTop = 7408
        mmWidth = 10583
        BandType = 0
      end
      object txtProduto: TppLabel
        UserName = 'txtLoja1'
        Caption = 'txtLoja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 129540
        mmTop = 11906
        mmWidth = 10583
        BandType = 0
      end
      object txtEntrada: TppLabel
        UserName = 'txtEntrada'
        Caption = 'txtLoja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 129540
        mmTop = 16140
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'SUB-TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 173832
        mmTop = 27252
        mmWidth = 20659
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBPipHisProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipHisProdutos'
        mmHeight = 4586
        mmLeft = 1588
        mmTop = 264
        mmWidth = 30480
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MOVIMENTO'
        DataPipeline = ppDBPipHisProdutos
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipHisProdutos'
        mmHeight = 4763
        mmLeft = 100805
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'HIS_VLVENDA'
        DataPipeline = ppDBPipHisProdutos
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipHisProdutos'
        mmHeight = 4763
        mmLeft = 128852
        mmTop = 265
        mmWidth = 31485
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SUB_TOTAL'
        DataPipeline = ppDBPipHisProdutos
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipHisProdutos'
        mmHeight = 4763
        mmLeft = 162985
        mmTop = 265
        mmWidth = 31485
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'Label6'
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
      object ppLabel7: TppLabel
        UserName = 'Label7'
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
      mmHeight = 50536
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'HIS_VLVENDA'
        DataPipeline = ppDBPipHisProdutos
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipHisProdutos'
        mmHeight = 4233
        mmLeft = 128852
        mmTop = 1323
        mmWidth = 31486
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'MOVIMENTO'
        DataPipeline = ppDBPipHisProdutos
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipHisProdutos'
        mmHeight = 4233
        mmLeft = 100805
        mmTop = 1323
        mmWidth = 23813
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 265
        mmWidth = 197380
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'ESTOQUE ATUAL..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 134938
        mmTop = 17727
        mmWidth = 32544
        BandType = 7
      end
      object txtEstoqueAtual: TppLabel
        UserName = 'txtEntrada1'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 169863
        mmTop = 17727
        mmWidth = 25400
        BandType = 7
      end
      object ppMmoPerdas: TppMemo
        UserName = 'MmoPerdas'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 32544
        mmLeft = 2381
        mmTop = 17198
        mmWidth = 55033
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        Caption = 'PERDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 12435
        mmWidth = 14552
        BandType = 7
      end
      object ppMmoQuant: TppMemo
        UserName = 'MmoPerdas1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 32544
        mmLeft = 59531
        mmTop = 17198
        mmWidth = 21431
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label101'
        Caption = 'ESTOQ. ANTERIOR:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 134938
        mmTop = 12435
        mmWidth = 32808
        BandType = 7
      end
      object txtAnterior: TppLabel
        UserName = 'txtAnterior'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 169334
        mmTop = 12435
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'SUB_TOTAL'
        DataPipeline = ppDBPipHisProdutos
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipHisProdutos'
        mmHeight = 4233
        mmLeft = 162985
        mmTop = 1323
        mmWidth = 31485
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 8731
        mmWidth = 197380
        BandType = 7
      end
    end
  end
  object ppDBPipHisProdutos: TppDBPipeline
    DataSource = dsHisProdutos
    UserName = 'DBPipHisProdutos'
    Left = 232
    Top = 56
    object ppDBPipHisProdutosppField1: TppField
      FieldAlias = 'HIS_PRODUTO'
      FieldName = 'HIS_PRODUTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipHisProdutosppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLVENDA'
      FieldName = 'PRO_VLVENDA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 1
    end
    object ppDBPipHisProdutosppField3: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDBPipHisProdutosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'HIS_VLVENDA'
      FieldName = 'HIS_VLVENDA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 3
    end
    object ppDBPipHisProdutosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOVIMENTO'
      FieldName = 'MOVIMENTO'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 16
      Position = 4
    end
  end
  object dstProdutos: TSQLDataSet
    CommandText = 'select PRO_CODIGO, PRO_DESCRICAO from PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 185
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 56
    Top = 185
  end
  object cdsProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 88
    Top = 185
    object cdsProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
  end
  object qryQuantEntra: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLoja'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDate
        Name = 'pDTENTRADA'
        ParamType = ptInput
        Value = 0d
      end>
    SQL.Strings = (
      'Select E.est_quantentrada, E.EST_QUANTIDADE from ESTOQUE E'
      'where (e.est_codigoloja = :pLoja) and'
      '(e.pro_codigo = :pCODIGO) and (e.est_dtentrada = :pDTENTRADA)')
    SQLConnection = Dm.SqlAdmin
    Left = 160
    Top = 144
    object qryQuantEntraEST_QUANTENTRADA: TFMTBCDField
      FieldName = 'EST_QUANTENTRADA'
      Precision = 15
      Size = 2
    end
    object qryQuantEntraEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 15
      Size = 3
    end
  end
  object dstHisPerda: TSQLDataSet
    CommandText = 
      'Select HPD_PRODUTO, HPD_IDPERDA, '#13#10'Sum(HPD_QUANTIDADE)  as QUANT' +
      'IDADE'#13#10'from HISTORICO_PERDA'#13#10'Where (HPD_PRODUTO = :pPRODUTO) '#13#10'A' +
      'ND (HPD_DATA = :pDATA)'#13#10'Group by HPD_PRODUTO, HPD_IDPERDA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pPRODUTO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
        Value = 0d
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 160
    Top = 104
  end
  object dspHisPerdas: TDataSetProvider
    DataSet = dstHisPerda
    Options = [poAllowCommandText]
    Left = 192
    Top = 104
  end
  object cdsHisPerdas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pPRODUTO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'dspHisPerdas'
    Left = 232
    Top = 104
    object cdsHisPerdasHPD_PRODUTO: TStringField
      FieldName = 'HPD_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsHisPerdasHPD_IDPERDA: TIntegerField
      FieldName = 'HPD_IDPERDA'
    end
    object cdsHisPerdasHPD_NMPERDA: TStringField
      FieldKind = fkLookup
      FieldName = 'HPD_NMPERDA'
      LookupDataSet = cdsPerda
      LookupKeyFields = 'PER_ID'
      LookupResultField = 'PER_DESCRICAO'
      KeyFields = 'HPD_IDPERDA'
      Size = 40
      Lookup = True
    end
    object cdsHisPerdasQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 15
      Size = 3
    end
  end
  object dstPerda: TSQLDataSet
    CommandText = 'select * from PERDA order by PER_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 144
  end
  object dspPerda: TDataSetProvider
    DataSet = dstPerda
    Options = [poAllowCommandText]
    Left = 56
    Top = 144
  end
  object cdsPerda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerda'
    Left = 96
    Top = 144
  end
  object qryEstoqueAnterior: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pPRODUTO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
        Value = 0d
      end>
    SQL.Strings = (
      'Select H.HIS_PRODUTO, H.HIS_ANTERIOR, H.HIS_MOVIMENTO,'
      'H.HIS_DATA, H.HIS_ATUAL from HISTORICO H '
      'Where (H.HIS_PRODUTO = :pPRODUTO) AND'
      '(H.HIS_LOJA = :pLOJA) and (H.HIS_TIPO = :pTIPO) '
      'AND (H.HIS_DATA = :pDATA);')
    SQLConnection = Dm.SqlAdmin
    Left = 288
    Top = 104
    object qryEstoqueAnteriorHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object qryEstoqueAnteriorHIS_ANTERIOR: TFMTBCDField
      FieldName = 'HIS_ANTERIOR'
      Precision = 15
      Size = 3
    end
    object qryEstoqueAnteriorHIS_MOVIMENTO: TFMTBCDField
      FieldName = 'HIS_MOVIMENTO'
      Precision = 15
      Size = 3
    end
    object qryEstoqueAnteriorHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object qryEstoqueAnteriorHIS_ATUAL: TFMTBCDField
      FieldName = 'HIS_ATUAL'
      Precision = 15
      Size = 3
    end
  end
end
