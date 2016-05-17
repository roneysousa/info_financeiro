object frmRelExcessoSugestao: TfrmRelExcessoSugestao
  Left = 233
  Top = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio'
  ClientHeight = 226
  ClientWidth = 381
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
    Width = 381
    Height = 185
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 56
      Width = 34
      Height = 13
      Caption = '&Se'#231#227'o:'
      FocusControl = cmbNMSECAO
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 17
      Width = 23
      Height = 13
      Caption = '&Loja:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object cmbNMSECAO: TComboBox
      Left = 17
      Top = 71
      Width = 256
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
    end
    object cmbNMLOJA: TComboBox
      Left = 17
      Top = 33
      Width = 256
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 185
    Width = 381
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtSair: TBitBtn
      Left = 297
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
    object btImprimir: TBitBtn
      Left = 209
      Top = 8
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
  object dstProdutos: TSQLDataSet
    CommandText = 
      'Select P.PRO_CODIGO, P.PRO_DESCRICAO, F.FOR_FANTASIA, P.UNI_CODI' +
      'GO,'#13#10'SUM(H.HIS_MOVIMENTO) as TOTALVENDIDO,'#13#10'(SUM(H.HIS_MOVIMENTO' +
      ')/3) AS MEDIA,'#13#10'E.EST_QUANTIDADE, E.EST_CODIGOLOJA,'#13#10'(E.EST_QUAN' +
      'TIDADE - (SUM(H.HIS_MOVIMENTO)/3)) AS EXCESSO'#13#10'from PRODUTOS P'#13#10 +
      'INNER join FORNECEDORES F ON F.FOR_CODIGO = P.FOR_CODIGO'#13#10'INNER ' +
      'join ESTOQUE E ON E.PRO_CODIGO = P.PRO_CODIGO'#13#10'INNER join HISTOR' +
      'ICO H ON H.his_produto = P.PRO_CODIGO'#13#10'Where (H.HIS_DATA >= :pDT' +
      'INICIAL) AND (H.HIS_DATA <= :pDTFINAL)'#13#10'and (E.EST_CODIGOLOJA = ' +
      ':pLOJA) '#13#10'AND (H.HIS_TIPO = '#39'V'#39')'#13#10'AND (P.SEC_CODIGO = :pSECAO)'#13#10 +
      'Group By P.PRO_CODIGO, P.PRO_DESCRICAO, F.FOR_FANTASIA, P.UNI_CO' +
      'DIGO, E.EST_QUANTIDADE, E.EST_CODIGOLOJA;'
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
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pSECAO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 8
    Top = 191
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 48
    Top = 191
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 88
    Top = 192
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
    object cdsProdutosFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsProdutosUNI_CODIGO: TStringField
      FieldName = 'UNI_CODIGO'
      FixedChar = True
      Size = 2
    end
    object cdsProdutosTOTALVENDIDO: TFMTBCDField
      FieldName = 'TOTALVENDIDO'
      Precision = 15
      Size = 3
    end
    object cdsProdutosMEDIA: TFMTBCDField
      FieldName = 'MEDIA'
      Precision = 15
      Size = 3
    end
    object cdsProdutosEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object cdsProdutosEST_CODIGOLOJA: TIntegerField
      FieldName = 'EST_CODIGOLOJA'
    end
    object cdsProdutosEXCESSO: TFMTBCDField
      FieldName = 'EXCESSO'
      Precision = 15
      Size = 3
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsDados
    Left = 136
    Top = 192
  end
  object cdsDados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 144
    Data = {
      F60000009619E0BD010000001800000008000000000003000000F6000A50524F
      5F434450524F4401004900000001000557494454480200020014000A50524F5F
      4E4D50524F4401004900000001000557494454480200020014000A50524F5F4E
      4D4641425201004900000001000557494454480200020014000A50524F5F4344
      554E494401004900000001000557494454480200020014000A50524F5F455354
      4F515508000400000000000950524F5F4D454449410800040000000100075355
      42545950450200490006004D6F6E6579000B50524F5F4558434553534F080004
      00000000000A50524F5F53554745535408000400000000000000}
    object cdsDadosPRO_CDPROD: TStringField
      FieldName = 'PRO_CDPROD'
    end
    object cdsDadosPRO_NMPROD: TStringField
      FieldName = 'PRO_NMPROD'
    end
    object cdsDadosPRO_NMFABR: TStringField
      FieldName = 'PRO_NMFABR'
    end
    object cdsDadosPRO_CDUNID: TStringField
      FieldName = 'PRO_CDUNID'
    end
    object cdsDadosPRO_ESTOQU: TFloatField
      FieldName = 'PRO_ESTOQU'
    end
    object cdsDadosPRO_MEDIA: TCurrencyField
      FieldName = 'PRO_MEDIA'
    end
    object cdsDadosPRO_EXCESSO: TFloatField
      FieldName = 'PRO_EXCESSO'
    end
    object cdsDadosPRO_SUGEST: TFloatField
      FieldName = 'PRO_SUGEST'
    end
  end
  object ppDBProdutos: TppDBPipeline
    DataSource = dsProdutos
    UserName = 'DBProdutos'
    Left = 312
    Top = 56
    object ppDBProdutosppField1: TppField
      FieldAlias = 'PRO_CDPROD'
      FieldName = 'PRO_CDPROD'
      FieldLength = 20
      DisplayWidth = 20
      Position = 0
    end
    object ppDBProdutosppField2: TppField
      FieldAlias = 'PRO_NMPROD'
      FieldName = 'PRO_NMPROD'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDBProdutosppField3: TppField
      FieldAlias = 'PRO_NMFABR'
      FieldName = 'PRO_NMFABR'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object ppDBProdutosppField4: TppField
      FieldAlias = 'PRO_CDUNID'
      FieldName = 'PRO_CDUNID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppDBProdutosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_ESTOQU'
      FieldName = 'PRO_ESTOQU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDBProdutosppField6: TppField
      FieldAlias = 'PRO_MEDIA'
      FieldName = 'PRO_MEDIA'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 5
    end
    object ppDBProdutosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_EXCESSO'
      FieldName = 'PRO_EXCESSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDBProdutosppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_SUGEST'
      FieldName = 'PRO_SUGEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
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
    Template.FileName = 'C:\EMPRESA\SERVICO\DELPHI\Relatorios\rbRelExcessoSugestao.rtm'
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
    Top = 16
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBProdutos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34660
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'lbl_NMRELA2'
        Caption = 'RELAT'#211'RIO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 107156
        mmTop = 5027
        mmWidth = 20638
        BandType = 0
      end
      object lbl_NMRELA: TppLabel
        UserName = 'lbl_NMRELA'
        Caption = 'PRODUTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 128852
        mmTop = 5027
        mmWidth = 20151
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'LOJA...........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 107156
        mmTop = 9525
        mmWidth = 21082
        BandType = 0
      end
      object lbl_loja: TppLabel
        UserName = 'lbl_loja'
        Caption = 'LOJA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 128852
        mmTop = 9525
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'SE'#199#195'O...... :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 107156
        mmTop = 14023
        mmWidth = 20574
        BandType = 0
      end
      object txtSecao: TppLabel
        UserName = 'lbl_loja1'
        Caption = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 128852
        mmTop = 14023
        mmWidth = 1016
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
        mmHeight = 23283
        mmLeft = 3440
        mmTop = 2646
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 1058
        mmTop = 29369
        mmWidth = 13123
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 26194
        mmTop = 29369
        mmWidth = 19050
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 33866
        mmWidth = 197380
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 28310
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'FABRICANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 75936
        mmTop = 29369
        mmWidth = 20659
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'UNID.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 116681
        mmTop = 29369
        mmWidth = 8721
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'ESTOQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 128588
        mmTop = 29369
        mmWidth = 15663
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'MEDIA VENDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 145786
        mmTop = 29369
        mmWidth = 24606
        BandType = 0
      end
      object txtExcesso: TppLabel
        UserName = 'txtExcesso'
        Caption = 'EXCESSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 181240
        mmTop = 29369
        mmWidth = 15346
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
        DataField = 'PRO_CDPROD'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 529
        mmTop = 529
        mmWidth = 22521
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'PRO_NMPROD'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 26194
        mmTop = 529
        mmWidth = 22860
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PRO_NMFABR'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 75936
        mmTop = 529
        mmWidth = 39423
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'PRO_CDUNID'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 110241
        mmTop = 529
        mmWidth = 21082
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'PRO_ESTOQU'
        DataPipeline = ppDBProdutos
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 121667
        mmTop = 529
        mmWidth = 22267
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'PRO_MEDIA'
        DataPipeline = ppDBProdutos
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 151860
        mmTop = 529
        mmWidth = 18796
        BandType = 4
      end
      object txtCampo: TppDBText
        UserName = 'txtCampo'
        AutoSize = True
        DataField = 'PRO_EXCESSO'
        DataPipeline = ppDBProdutos
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3725
        mmLeft = 172985
        mmTop = 529
        mmWidth = 24130
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
  end
end
