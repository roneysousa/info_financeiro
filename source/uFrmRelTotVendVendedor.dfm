object frmRelTotVendVendedor: TfrmRelTotVendVendedor
  Left = 240
  Top = 178
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relatorio Total Vendido por Vendedor'
  ClientHeight = 207
  ClientWidth = 365
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
  object Panel2: TPanel
    Left = 0
    Top = 166
    Width = 365
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 0
    object BtSair: TBitBtn
      Left = 275
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
      Left = 187
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 365
    Height = 166
    ActivePage = tbsComissao
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '&Produtos'
      object Label1: TLabel
        Left = 16
        Top = 18
        Width = 38
        Height = 13
        Caption = '&Per'#237'odo'
        FocusControl = edtDTINIC
        Transparent = True
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
      object ckbDetalhado: TCheckBox
        Left = 16
        Top = 67
        Width = 97
        Height = 17
        Caption = '&Detalhado'
        TabOrder = 2
        OnClick = ckbDetalhadoClick
      end
      object cbxVendedor: TCheckBox
        Left = 16
        Top = 91
        Width = 97
        Height = 17
        Caption = '&Vendedor'
        TabOrder = 3
        Visible = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Servi'#231'os'
      ImageIndex = 1
      object Label2: TLabel
        Left = 16
        Top = 18
        Width = 38
        Height = 13
        Caption = '&Per'#237'odo'
        FocusControl = edtDTINIC2
        Transparent = True
      end
      object edtDTINIC2: TDateEdit
        Left = 16
        Top = 36
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
        OnExit = edtDTINIC2Exit
      end
      object edtDTFINA2: TDateEdit
        Left = 152
        Top = 36
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        OnExit = edtDTFINA2Exit
      end
      object ckbDetalhado2: TCheckBox
        Left = 16
        Top = 72
        Width = 97
        Height = 17
        Caption = '&Detalhado'
        TabOrder = 2
        Visible = False
      end
    end
    object tbsComissao: TTabSheet
      Caption = '&Comis'#227'o'
      ImageIndex = 2
      object Label3: TLabel
        Left = 16
        Top = 18
        Width = 38
        Height = 13
        Caption = '&Per'#237'odo'
        FocusControl = edtDTINIC3
        Transparent = True
      end
      object edtDTINIC3: TDateEdit
        Left = 16
        Top = 36
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
        OnExit = edtDTINIC3Exit
      end
      object edtDTFINA3: TDateEdit
        Left = 152
        Top = 36
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        OnExit = edtDTFINA3Exit
      end
    end
  end
  object dstVendas: TSQLDataSet
    CommandText = 
      'Select V.MOV_VENDEDOR, Sum(V.mov_valor), F.FUN_NOME'#13#10'from VENDAS' +
      ' V'#13#10'INNER join FUNCIONARIOS F ON F.FUN_CODIGO = V.MOV_VENDEDOR'#13#10 +
      'Where (V.mov_datavenda >= :pDTINICIAL) and (V.mov_datavenda <= :' +
      'pDTFINAL)'#13#10'group by V.MOV_VENDEDOR, F.FUN_NOME'
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
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 172
  end
  object dspVendas: TDataSetProvider
    DataSet = dstVendas
    Options = [poAllowCommandText]
    Left = 56
    Top = 172
  end
  object cdsVendas: TClientDataSet
    Active = True
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
      end>
    ProviderName = 'dspVendas'
    OnCalcFields = cdsVendasCalcFields
    Left = 96
    Top = 172
    object cdsVendasMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
      DisplayFormat = '00000'
    end
    object cdsVendasSUM: TFMTBCDField
      FieldName = 'SUM'
      Precision = 15
      Size = 2
    end
    object cdsVendasFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsVendasCODIGO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CODIGO'
      Size = 5
      Calculated = True
    end
  end
  object dsVendas: TDataSource
    DataSet = cdsVendas
    Left = 136
    Top = 172
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBVendedores
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
    Template.FileName = 'C:\EMPRESA\SERVICO\DELPHI\Relatorios\rbRelTotVendVendedor.rtm'
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
    Left = 328
    Top = 32
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBVendedores'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37571
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
        mmLeft = 5556
        mmTop = 4763
        mmWidth = 41540
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 31485
        mmWidth = 14478
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 30427
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'VENDEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 31485
        mmWidth = 20066
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lbl_NMRELA2'
        Caption = 'RELAT'#211'RIO : TOTAL VENDIDO POR VENDEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 7144
        mmWidth = 82127
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 35983
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'TOTAL VENDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 165365
        mmTop = 31485
        mmWidth = 29104
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo'
        Caption = 'txtPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 16140
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'TIPO : SIMPLES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 11642
        mmWidth = 26723
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CODIGO'
        DataPipeline = ppDBVendedores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBVendedores'
        mmHeight = 4064
        mmLeft = 1058
        mmTop = 169
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'FUN_NOME'
        DataPipeline = ppDBVendedores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBVendedores'
        mmHeight = 4022
        mmLeft = 17198
        mmTop = 254
        mmWidth = 19727
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'SUM'
        DataPipeline = ppDBVendedores
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBVendedores'
        mmHeight = 4022
        mmLeft = 186680
        mmTop = 264
        mmWidth = 7789
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
  end
  object ppDBVendedores: TppDBPipeline
    DataSource = dsVendas
    UserName = 'DBVendedores'
    Left = 328
    Top = 64
    object ppDBVendedoresppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_VENDEDOR'
      FieldName = 'MOV_VENDEDOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBVendedoresppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUM'
      FieldName = 'SUM'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 1
    end
    object ppDBVendedoresppField3: TppField
      FieldAlias = 'FUN_NOME'
      FieldName = 'FUN_NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDBVendedoresppField4: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 3
    end
  end
  object dstDetalhado: TSQLDataSet
    CommandText = 
      'Select V.MOV_VENDEDOR, F.FUN_NOME, P.PRO_DESCRICAO,'#13#10'SUM(H.HIS_M' +
      'OVIMENTO) AS QUANT,'#13#10'sum(H.HIS_VLVENDA * H.HIS_MOVIMENTO) AS VAL' +
      'OR'#13#10'from VENDAS V'#13#10'INNER join FUNCIONARIOS F ON F.FUN_CODIGO = V' +
      '.MOV_VENDEDOR'#13#10'INNER join HISTORICO H ON V.MOV_PEDIDO = H.HIS_DO' +
      'CUMENTO'#13#10'INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO'#13#10 +
      'Where (V.mov_datavenda >= :pDTINICIAL) and (V.mov_datavenda <= :' +
      'pDTFINAL)'#13#10'Group by V.MOV_VENDEDOR, F.FUN_NOME, P.PRO_DESCRICAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 137
  end
  object dspDetalhado: TDataSetProvider
    DataSet = dstDetalhado
    Options = [poAllowCommandText]
    Left = 56
    Top = 137
  end
  object cdsDetalhado: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspDetalhado'
    Left = 96
    Top = 137
    object cdsDetalhadoMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
      DisplayFormat = '000000'
      EditFormat = '000000'
    end
    object cdsDetalhadoFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsDetalhadoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsDetalhadoQUANT: TFMTBCDField
      FieldName = 'QUANT'
      DisplayFormat = '###.00'
      EditFormat = '###.00'
      Precision = 15
      Size = 3
    end
    object cdsDetalhadoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,##0.#0'
      Precision = 15
      Size = 5
    end
  end
  object dsDetalhado: TDataSource
    DataSet = cdsDetalhado
    Left = 136
    Top = 137
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBPDetalhado
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
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbRelVendedores2.RTM'
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
    Top = 32
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPDetalhado'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28046
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
        Caption = 'RELAT'#211'RIO : TOTAL VENDIDO POR VENDEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 7144
        mmWidth = 82127
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'TIPO : DETALHADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 11642
        mmWidth = 33105
        BandType = 0
      end
      object txtPeriodo2: TppLabel
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
        mmTop = 16140
        mmWidth = 16140
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'QUANT'
        DataPipeline = ppDBPDetalhado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPDetalhado'
        mmHeight = 3969
        mmLeft = 140759
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VALOR'
        DataPipeline = ppDBPDetalhado
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPDetalhado'
        mmHeight = 3969
        mmLeft = 167482
        mmTop = 794
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBPDetalhado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPDetalhado'
        mmHeight = 3969
        mmLeft = 37835
        mmTop = 529
        mmWidth = 97896
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11642
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
    object ppGroup1: TppGroup
      BreakName = 'MOV_VENDEDOR'
      DataPipeline = ppDBPDetalhado
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPDetalhado'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17992
        mmPrintPosition = 0
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'C'#211'DIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 2117
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'VENDEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16933
          mmTop = 2117
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label101'
          Caption = 'QUANTIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 138377
          mmTop = 12435
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 182298
          mmTop = 12435
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 16933
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'MOV_VENDEDOR'
          DataPipeline = ppDBPDetalhado
          DisplayFormat = '000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPDetalhado'
          mmHeight = 3969
          mmLeft = 794
          mmTop = 7673
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'FUN_NOME'
          DataPipeline = ppDBPDetalhado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPDetalhado'
          mmHeight = 3969
          mmLeft = 16404
          mmTop = 7673
          mmWidth = 91017
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'DESCRI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 37967
          mmTop = 12435
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
      end
    end
  end
  object ppDBPDetalhado: TppDBPipeline
    DataSource = dsDetalhado
    UserName = 'DBPDetalhado'
    Left = 296
    Top = 64
  end
  object dstVendedores: TSQLDataSet
    CommandText = 
      'Select V.mov_pedido, V.mov_datavenda, V.mov_horavenda, H.HIS_VEN' +
      'DEDOR, H.HIS_PRODUTO,'#13#10'P.PRO_DESCRICAO, H.HIS_VLVENDA, V.MOV_VAL' +
      'OR, V.mov_entrada, '#13#10'MOV_DESCONTO, MOV_ACRESCIMO,'#13#10'SB.SUB_PEAVIS' +
      'TA, SB.SUB_PEAPRAZO,'#13#10'(Select F.fun_nome FROM FUNCIONARIOS F whe' +
      're (H.HIS_VENDEDOR = F.FUN_CODIGO))'#13#10'as VENDEDOR'#13#10'from VENDAS V'#13 +
      #10'INNER join HISTORICO H ON V.MOV_PEDIDO = H.HIS_DOCUMENTO'#13#10'INNER' +
      ' join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO'#13#10'INNER join SUB' +
      'SECAO SB ON SB.SUB_CODIGO = P.SUB_CODIGO'#13#10'Where (V.mov_datavenda' +
      ' >= :pDTINICIAL) and (V.mov_datavenda <= :pDTFINAL) AND (V.MOV_S' +
      'ITUACAO = :pSITUACAO)'#13#10'AND (H.HIS_VENDEDOR > 0)'#13#10'Group by V.mov_' +
      'pedido, V.mov_datavenda, V.mov_horavenda,'#13#10'H.HIS_VENDEDOR, H.HIS' +
      '_PRODUTO,'#13#10'P.PRO_DESCRICAO, H.HIS_VLVENDA, V.MOV_VALOR, V.mov_en' +
      'trada, '#13#10'MOV_DESCONTO, MOV_ACRESCIMO, SB.SUB_PEAVISTA, SB.SUB_PE' +
      'APRAZO'#13#10'order by H.HIS_VENDEDOR'#13#10
    MaxBlobSize = -1
    Params = <
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
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 212
    Top = 136
  end
  object cdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <
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
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendedores'
    OnCalcFields = cdsVendedoresCalcFields
    Left = 276
    Top = 136
    object cdsVendedoresMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
    end
    object cdsVendedoresMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsVendedoresMOV_HORAVENDA: TStringField
      FieldName = 'MOV_HORAVENDA'
      FixedChar = True
      Size = 5
    end
    object cdsVendedoresPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsVendedoresHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      Precision = 15
      Size = 2
    end
    object cdsVendedoresMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      Precision = 15
      Size = 2
    end
    object cdsVendedoresMOV_ENTRADA: TFMTBCDField
      FieldName = 'MOV_ENTRADA'
      Precision = 15
      Size = 2
    end
    object cdsVendedoresMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      Precision = 15
      Size = 2
    end
    object cdsVendedoresVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 40
    end
    object cdsVendedoresHIS_VENDEDOR: TIntegerField
      FieldName = 'HIS_VENDEDOR'
    end
    object cdsVendedoresPRO_VLDESC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRO_VLDESC'
    end
    object cdsVendedoresPRO_VLACRE: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRO_VLACRE'
    end
    object cdsVendedoresPRO_DIFDESC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRO_DIFDESC'
    end
    object cdsVendedoresPRO_DIFACRE: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRO_DIFACRE'
    end
    object cdsVendedoresPRO_AVISTA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRO_AVISTA'
    end
    object cdsVendedoresPRO_APRAZO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PRO_APRAZO'
    end
    object cdsVendedoresHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsVendedoresMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      Precision = 15
      Size = 2
    end
    object cdsVendedoresSUB_PEAVISTA: TBCDField
      FieldName = 'SUB_PEAVISTA'
      DisplayFormat = '###.#0'
      EditFormat = '###.#0'
      Precision = 9
      Size = 2
    end
    object cdsVendedoresSUB_PEAPRAZO: TBCDField
      FieldName = 'SUB_PEAPRAZO'
      DisplayFormat = '###.#0'
      EditFormat = '###.#0'
      Precision = 9
      Size = 2
    end
  end
  object dsVendedores: TDataSource
    DataSet = cdsVendedores
    Left = 324
    Top = 136
  end
  object dspVendedores: TDataSetProvider
    DataSet = dstVendedores
    Options = [poAllowCommandText]
    Left = 244
    Top = 136
  end
  object ppReport3: TppReport
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
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbRelVendedores3.rtm'
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
    Left = 295
    Top = 98
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object ppDBImage3: TppDBImage
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
      object ppLabel17: TppLabel
        UserName = 'Label5'
        Caption = 'RELAT'#211'RIO : TOTAL VENDIDO POR VENDEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 7144
        mmWidth = 82127
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label6'
        Caption = 'TIPO : DETALHADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 11642
        mmWidth = 33105
        BandType = 0
      end
      object txtPeriodo3: TppLabel
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
        mmTop = 16140
        mmWidth = 16140
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText10: TppDBText
        UserName = 'DBText7'
        DataField = 'HIS_VLVENDA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 108744
        mmTop = 264
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText8'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 49742
        mmTop = 264
        mmWidth = 57415
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'MOV_PEDIDO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 211
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'MOV_DATAVENDA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 18256
        mmTop = 264
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'MOV_HORAVENDA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3979
        mmLeft = 37042
        mmTop = 254
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'PRO_VLDESC'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 131234
        mmTop = 264
        mmWidth = 14647
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'PRO_VLACRE'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 148961
        mmTop = 264
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'PRO_AVISTA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 264
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'PRO_APRAZO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 182563
        mmTop = 264
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line6'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel20: TppLabel
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
      object ppSystemVariable5: TppSystemVariable
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
      object ppLabel21: TppLabel
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
      object ppSystemVariable6: TppSystemVariable
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
    object ppGroup2: TppGroup
      BreakName = 'HIS_VENDEDOR'
      DataPipeline = ppDBPipeline1
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17992
        mmPrintPosition = 0
        object ppLabel23: TppLabel
          UserName = 'Label10'
          Caption = 'VENDEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3810
          mmLeft = 1323
          mmTop = 2381
          mmWidth = 17949
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label101'
          Caption = 'VL.DESC.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3810
          mmLeft = 131234
          mmTop = 12700
          mmWidth = 14647
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label11'
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 116946
          mmTop = 12700
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line4'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 16933
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line2'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText5'
          DataField = 'VENDEDOR'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3979
          mmLeft = 1323
          mmTop = 7408
          mmWidth = 91017
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label16'
          Caption = 'DESCRI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3810
          mmLeft = 49742
          mmTop = 12435
          mmWidth = 18965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'VENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3810
          mmLeft = 1323
          mmTop = 12171
          mmWidth = 11049
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'DATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3810
          mmLeft = 18256
          mmTop = 12435
          mmWidth = 8721
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'HORA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3810
          mmLeft = 37835
          mmTop = 12435
          mmWidth = 9271
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          Caption = 'VL.ACRES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3810
          mmLeft = 147638
          mmTop = 12700
          mmWidth = 16002
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'AVISTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3810
          mmLeft = 168011
          mmTop = 12700
          mmWidth = 11557
          BandType = 3
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'A PRAZO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 183092
          mmTop = 12700
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 23548
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'HIS_VLVENDA'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '###,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4233
          mmLeft = 100806
          mmTop = 1058
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 49477
          mmTop = 265
          mmWidth = 147902
          BandType = 5
          GroupNo = 0
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Total Avista :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 1852
          mmTop = 6085
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'Total A Prazo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 1852
          mmTop = 10583
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'PRO_AVISTA'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '###,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 32808
          mmTop = 6085
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'PRO_APRAZO'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '###,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 32808
          mmTop = 10583
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line11'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 56886
          mmTop = 15081
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          Caption = 'Comiss'#227'o :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4022
          mmLeft = 1588
          mmTop = 15875
          mmWidth = 17653
          BandType = 5
          GroupNo = 0
        end
        object ppVariable1: TppVariable
          OnPrint = ppVariable1Print
          UserName = 'Variable1'
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 63500
          mmTop = 15875
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object ppVariable2: TppVariable
          OnPrint = ppVariable2Print
          UserName = 'Variable2'
          CalcOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 63500
          mmTop = 5292
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object ppVariable3: TppVariable
          OnPrint = ppVariable3Print
          UserName = 'Variable3'
          CalcOrder = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 63500
          mmTop = 10319
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsVendedores
    UserName = 'DBPipeline1'
    Left = 327
    Top = 98
  end
  object dstRelatorio: TSQLDataSet
    CommandText = 
      'Select F.FUN_NOME, P.PRO_DESCRICAO, SUM(H.HIS_MOVIMENTO) AS QUAN' +
      'T,'#13#10'sum(H.HIS_VLVENDA * H.HIS_MOVIMENTO) AS VALOR'#13#10'from HISTORIC' +
      'O H'#13#10'INNER join FUNCIONARIOS F ON F.FUN_CODIGO = H.his_vendedor'#13 +
      #10'INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO'#13#10'Where (H' +
      '.HIS_DATA >= :pDTINICIAL) and (H.HIS_DATA <= :pDTFINAL)'#13#10'Group b' +
      'y F.FUN_NOME, P.PRO_DESCRICAO;'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDTINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTFINAL'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 172
    Top = 88
    object dstRelatorioFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object dstRelatorioPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object dstRelatorioQUANT: TFMTBCDField
      FieldName = 'QUANT'
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object dstRelatorioVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 5
    end
  end
  object dspRelatorio: TDataSetProvider
    DataSet = dstRelatorio
    Options = [poAllowCommandText]
    Left = 204
    Top = 88
  end
  object cdsRelatorio: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDTINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTFINAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspRelatorio'
    Left = 236
    Top = 88
    object cdsRelatorioFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsRelatorioPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsRelatorioQUANT: TFMTBCDField
      FieldName = 'QUANT'
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsRelatorioVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 5
    end
  end
  object dsRelatorio: TDataSource
    DataSet = cdsRelatorio
    Left = 265
    Top = 88
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = dsRelatorio
    UserName = 'DBPipeline2'
    Left = 188
    Top = 24
    object ppDBPipeline2ppField1: TppField
      FieldAlias = 'FUN_NOME'
      FieldName = 'FUN_NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 0
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppDBPipeline2ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 19
      Position = 2
    end
    object ppDBPipeline2ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 5
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
  end
  object ppReport4: TppReport
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
    Left = 140
    Top = 24
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline2'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppDBImage4: TppDBImage
        UserName = 'DBImage4'
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
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'RELAT'#211'RIO : TOTAL VENDIDO POR VENDEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 7144
        mmWidth = 82127
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'TIPO : DETALHADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 11642
        mmWidth = 33105
        BandType = 0
      end
      object lblPeriodo4: TppLabel
        UserName = 'lblPeriodo4'
        Caption = 'txtPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 16140
        mmWidth = 16140
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 264
        mmWidth = 97631
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'QUANT'
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
        mmLeft = 123030
        mmTop = 264
        mmWidth = 23241
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'VALOR'
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
        mmLeft = 152400
        mmTop = 264
        mmWidth = 23020
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
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
      object ppLabel41: TppLabel
        UserName = 'Label41'
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
      object ppLine12: TppLine
        UserName = 'Line12'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
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
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
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
    object ppGroup3: TppGroup
      BreakName = 'FUN_NOME'
      DataPipeline = ppDBPipeline2
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline2'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17198
        mmPrintPosition = 0
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'FUN_NOME'
          DataPipeline = ppDBPipeline2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 3969
          mmLeft = 1852
          mmTop = 7408
          mmWidth = 97631
          BandType = 3
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label37'
          Caption = 'NOME DO VENDEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 1852
          mmTop = 2910
          mmWidth = 37761
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'Label38'
          Caption = 'DESCRI'#199#195'O DOS PRODUTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 1852
          mmTop = 11906
          mmWidth = 50504
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'Label39'
          Caption = 'QUANTIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4191
          mmLeft = 123030
          mmTop = 11642
          mmWidth = 23241
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'Label40'
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4191
          mmLeft = 164020
          mmTop = 11642
          mmWidth = 12192
          BandType = 3
          GroupNo = 0
        end
        object ppLine14: TppLine
          UserName = 'Line14'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 16404
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line15'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLine13: TppLine
          UserName = 'Line13'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 265
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'QUANT'
          DataPipeline = ppDBPipeline2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 4022
          mmLeft = 123030
          mmTop = 1588
          mmWidth = 23241
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VALOR'
          DataPipeline = ppDBPipeline2
          DisplayFormat = '###,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 3969
          mmLeft = 152400
          mmTop = 1588
          mmWidth = 23020
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object dstComissao: TSQLDataSet
    CommandText = 
      'Select V.mov_pedido, V.MOV_NRMESA, V.mov_datavenda, V.MOV_VALOR,' +
      ' F.FUN_CODIGO,'#13#10'F.fun_nome, V.MOV_TAXA_SERVICO'#13#10'from VENDAS V'#13#10'i' +
      'nner join PROVENDAS PV on PV.mop_pedido = V.mov_pedido'#13#10'inner jo' +
      'in FUNCIONARIOS F on F.fun_codigo = PV.mop_cdvendedor'#13#10'Where (V.' +
      'mov_datavenda >= :pDTINICIAL) and (V.mov_datavenda <= :pDTFINAL)' +
      ' AND (V.MOV_SITUACAO = :pSITUACAO)'#13#10'AND (PV.mop_nritem = 1) AND ' +
      'NOT (V.MOV_NRMESA LIKE '#39'T%'#39')'#13#10'Group by V.mov_pedido, V.MOV_NRMES' +
      'A, V.mov_datavenda, V.MOV_VALOR, F.FUN_CODIGO, F.fun_nome, V.MOV' +
      '_TAXA_SERVICO'#13#10'order by F.FUN_CODIGO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDTINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 4
    Top = 88
  end
  object dspComissao: TDataSetProvider
    DataSet = dstComissao
    Options = [poAllowCommandText]
    Left = 36
    Top = 88
  end
  object cdsComissao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'pDTINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pDTFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspcomissao'
    Left = 68
    Top = 88
    object cdsComissaoMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
    end
    object cdsComissaoMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsComissaoMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      Precision = 18
      Size = 2
    end
    object cdsComissaoFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Required = True
    end
    object cdsComissaoFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsComissaoMOV_TAXA_SERVICO: TBCDField
      FieldName = 'MOV_TAXA_SERVICO'
      Precision = 9
      Size = 2
    end
  end
  object dsComissao: TDataSource
    DataSet = cdsComissao
    Left = 100
    Top = 88
  end
  object ppRepComissao: TppReport
    AutoStop = False
    DataPipeline = ppDBPComissao
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
    Top = 56
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPComissao'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37571
      mmPrintPosition = 0
      object ppImgLogo: TppImage
        UserName = 'ImgLogo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 30163
        mmLeft = 5027
        mmTop = 2117
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'RELAT'#211'RIO DE COMISS'#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 130440
        mmTop = 7144
        mmWidth = 46038
        BandType = 0
      end
      object txtPeriodoComissao: TppLabel
        UserName = 'Label501'
        Caption = 'PERIODO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 130440
        mmTop = 12435
        mmWidth = 17187
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'MOV_PEDIDO'
        DataPipeline = ppDBPComissao
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPComissao'
        mmHeight = 4022
        mmLeft = 3704
        mmTop = 211
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'MOV_DATAVENDA'
        DataPipeline = ppDBPComissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPComissao'
        mmHeight = 4022
        mmLeft = 21960
        mmTop = 211
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'MOV_VALOR'
        DataPipeline = ppDBPComissao
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPComissao'
        mmHeight = 3969
        mmLeft = 65881
        mmTop = 264
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'MOV_TAXA_SERVICO'
        DataPipeline = ppDBPComissao
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPComissao'
        mmHeight = 4022
        mmLeft = 95515
        mmTop = 211
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine19: TppLine
        UserName = 'Line19'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 187325
        BandType = 8
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 138113
        mmTop = 3704
        mmWidth = 16976
        BandType = 8
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 143140
        mmTop = 8467
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 155575
        mmTop = 3704
        mmWidth = 32015
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable10'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 155311
        mmTop = 8467
        mmWidth = 1947
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'FUN_CODIGO'
      DataPipeline = ppDBPComissao
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPComissao'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object ppDBText24: TppDBText
          UserName = 'DBText24'
          DataField = 'FUN_NOME'
          DataPipeline = ppDBPComissao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPComissao'
          mmHeight = 3969
          mmLeft = 31221
          mmTop = 2117
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
        object ppLine16: TppLine
          UserName = 'Line16'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 1588
          mmTop = 794
          mmWidth = 187325
          BandType = 3
          GroupNo = 0
        end
        object ppLine17: TppLine
          UserName = 'Line17'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 1323
          mmTop = 12171
          mmWidth = 187325
          BandType = 3
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label45'
          Caption = 'VENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 4350
          mmTop = 7144
          mmWidth = 12150
          BandType = 3
          GroupNo = 0
        end
        object ppLabel46: TppLabel
          UserName = 'Label46'
          Caption = 'FUNCION'#193'RIO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 3969
          mmTop = 2117
          mmWidth = 25908
          BandType = 3
          GroupNo = 0
        end
        object ppLabel47: TppLabel
          UserName = 'Label47'
          Caption = 'DATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 23813
          mmTop = 6879
          mmWidth = 9567
          BandType = 3
          GroupNo = 0
        end
        object ppLabel48: TppLabel
          UserName = 'Label48'
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4191
          mmLeft = 75936
          mmTop = 6879
          mmWidth = 12192
          BandType = 3
          GroupNo = 0
        end
        object ppLabel49: TppLabel
          UserName = 'Label49'
          Caption = 'TX.SERVI'#199'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4191
          mmLeft = 91546
          mmTop = 6879
          mmWidth = 21294
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppLabel36: TppLabel
          UserName = 'Label36'
          Caption = 'Comiss'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 3704
          mmTop = 2381
          mmWidth = 17992
          BandType = 5
          GroupNo = 0
        end
        object ppLine18: TppLine
          UserName = 'Line18'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 187325
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'MOV_TAXA_SERVICO'
          DataPipeline = ppDBPComissao
          DisplayFormat = '###,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPComissao'
          mmHeight = 4233
          mmLeft = 95515
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDBPComissao: TppDBPipeline
    DataSource = dsComissao
    UserName = 'DBPComissao'
    Left = 132
    Top = 88
  end
end
