object frmRelFluxoCaixa: TfrmRelFluxoCaixa
  Left = 242
  Top = 191
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio Fluxo de Caixa'
  ClientHeight = 170
  ClientWidth = 320
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
    Width = 320
    Height = 129
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 41
      Height = 13
      Caption = '&Per'#237'odo:'
      Transparent = True
    end
    object edtDTINIC: TDateEdit
      Left = 16
      Top = 29
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnExit = edtDTINICExit
    end
    object edtDTFINA: TDateEdit
      Left = 16
      Top = 69
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtDTFINAExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 320
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtImprimir: TBitBtn
      Left = 144
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
      Left = 232
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
    object cbxMatricial: TCheckBox
      Left = 10
      Top = 12
      Width = 97
      Height = 17
      Caption = '&Matricial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
  object dstFluxoCaixa: TSQLDataSet
    CommandText = 
      'Select P.SEC_CODIGO, S.SEC_DESCRICAO, Sum(H.HIS_MOVIMENTO) as QU' +
      'ANTIDADE,'#13#10'Sum(H.his_vlvenda  * H.his_movimento) AS VLVENDA,  Su' +
      'm(H.his_vlcompra) AS VLCOMPRA,'#13#10'Sum(H.his_vlvenda) - Sum(H.his_v' +
      'lcompra) AS BRUTO'#13#10'from PRODUTOS P'#13#10'INNER join SECAO S ON S.SEC_' +
      'CODIGO = P.SEC_CODIGO'#13#10'INNER join HISTORICO H ON H.HIS_PRODUTO =' +
      ' P.PRO_CODIGO'#13#10'Where (H.HIS_DATA >= :pDTINCIAL)'#13#10'and   (H.HIS_DA' +
      'TA <= :pDTFINAL)'#13#10'AND   (H.HIS_TIPO = '#39'V'#39')'#13#10'Group By P.SEC_CODIG' +
      'O, S.SEC_DESCRICAO'#13#10#13#10
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
    Left = 16
    Top = 96
  end
  object dspFluxo: TDataSetProvider
    DataSet = dstFluxoCaixa
    Options = [poAllowCommandText]
    Left = 56
    Top = 96
  end
  object cdsFluxo: TClientDataSet
    Active = True
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
    ProviderName = 'dspFluxo'
    Left = 96
    Top = 96
    object cdsFluxoSEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
    end
    object cdsFluxoSEC_DESCRICAO: TStringField
      FieldName = 'SEC_DESCRICAO'
      Size = 30
    end
    object cdsFluxoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object cdsFluxoVLVENDA: TFMTBCDField
      FieldName = 'VLVENDA'
      Precision = 15
      Size = 2
    end
    object cdsFluxoVLCOMPRA: TFMTBCDField
      FieldName = 'VLCOMPRA'
      Precision = 15
      Size = 2
    end
    object cdsFluxoBRUTO: TFMTBCDField
      FieldName = 'BRUTO'
      Precision = 15
      Size = 2
    end
  end
  object dsFluxo: TDataSource
    DataSet = cdsFluxo
    Left = 136
    Top = 96
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPFluxo
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
    Left = 232
    Top = 96
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPFluxo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36777
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
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'C'#211'D.SE'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4057
        mmLeft = 529
        mmTop = 27252
        mmWidth = 20373
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
        mmLeft = 109009
        mmTop = 2910
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'USU'#193'RIO....:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 109009
        mmTop = 7408
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label8'
        Caption = 'PER'#205'ODO....:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 108744
        mmTop = 11906
        mmWidth = 21431
        BandType = 0
      end
      object lbl_NMRELA: TppLabel
        UserName = 'lbl_NMRELA'
        Caption = 'FLUXO DE CAIXA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 130704
        mmTop = 2910
        mmWidth = 29210
        BandType = 0
      end
      object lbl_Usuario: TppLabel
        UserName = 'lbl_NMRELA1'
        Caption = 'lbl_NMRELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 130704
        mmTop = 7408
        mmWidth = 20373
        BandType = 0
      end
      object lbl_DATA: TppLabel
        UserName = 'lbl_DATA'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 130704
        mmTop = 11906
        mmWidth = 17727
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 35983
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'NOME DA SE'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4057
        mmLeft = 22490
        mmTop = 27252
        mmWidth = 30268
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'QUANTIDADE VENDIDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8202
        mmLeft = 75406
        mmTop = 27252
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 110331
        mmTop = 27252
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'COMPRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 131498
        mmTop = 27517
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'LUC.BRUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 151077
        mmTop = 27517
        mmWidth = 20638
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'SEC_CODIGO'
        DataPipeline = ppDBPFluxo
        DisplayFormat = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPFluxo'
        mmHeight = 4057
        mmLeft = 529
        mmTop = 176
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SEC_DESCRICAO'
        DataPipeline = ppDBPFluxo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPFluxo'
        mmHeight = 3969
        mmLeft = 22490
        mmTop = 264
        mmWidth = 49477
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'QUANTIDADE'
        DataPipeline = ppDBPFluxo
        DisplayFormat = '#,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFluxo'
        mmHeight = 4057
        mmLeft = 75406
        mmTop = 176
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLVENDA'
        DataPipeline = ppDBPFluxo
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFluxo'
        mmHeight = 3969
        mmLeft = 100542
        mmTop = 264
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLCOMPRA'
        DataPipeline = ppDBPFluxo
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFluxo'
        mmHeight = 3969
        mmLeft = 125148
        mmTop = 264
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'BRUTO'
        DataPipeline = ppDBPFluxo
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFluxo'
        mmHeight = 3969
        mmLeft = 149754
        mmTop = 264
        mmWidth = 22490
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
      object ppLabel7: TppLabel
        UserName = 'Label7'
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
      object ppLabel11: TppLabel
        UserName = 'Label11'
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
      mmHeight = 161396
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 794
        mmWidth = 197380
        BandType = 7
      end
      object ppDBCVLVenda: TppDBCalc
        UserName = 'DBCVLVenda'
        DataField = 'VLVENDA'
        DataPipeline = ppDBPFluxo
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFluxo'
        mmHeight = 4057
        mmLeft = 100542
        mmTop = 1588
        mmWidth = 22490
        BandType = 7
      end
      object ppDBCTotCompra: TppDBCalc
        UserName = 'DBCTotCompra'
        DataField = 'VLCOMPRA'
        DataPipeline = ppDBPFluxo
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFluxo'
        mmHeight = 4057
        mmLeft = 125148
        mmTop = 1588
        mmWidth = 22490
        BandType = 7
      end
      object ppDBCTotBruto: TppDBCalc
        UserName = 'DBCTotBruto'
        DataField = 'BRUTO'
        DataPipeline = ppDBPFluxo
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPFluxo'
        mmHeight = 4057
        mmLeft = 150019
        mmTop = 1588
        mmWidth = 22490
        BandType = 7
      end
      object mmoContas: TppMemo
        UserName = 'mmoContas'
        Caption = 'TESTE'#13#10'NOVO'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          'TESTE')
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 16933
        mmWidth = 81227
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label10'
        Caption = '>> CONTAS - PAGAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 5027
        mmTop = 11113
        mmWidth = 35348
        BandType = 7
      end
      object mmoVLContas: TppMemo
        UserName = 'mmoVLContas'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 85990
        mmTop = 16933
        mmWidth = 33073
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 5027
        mmTop = 15875
        mmWidth = 116417
        BandType = 7
      end
    end
  end
  object ppDBPFluxo: TppDBPipeline
    DataSource = dsFluxo
    UserName = 'DBPFluxo'
    Left = 272
    Top = 96
    object ppDBPFluxoppField1: TppField
      FieldAlias = 'SEC_CODIGO'
      FieldName = 'SEC_CODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPFluxoppField2: TppField
      FieldAlias = 'SEC_DESCRICAO'
      FieldName = 'SEC_DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPFluxoppField3: TppField
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPFluxoppField4: TppField
      FieldAlias = 'VLVENDA'
      FieldName = 'VLVENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPFluxoppField5: TppField
      FieldAlias = 'VLCOMPRA'
      FieldName = 'VLCOMPRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPFluxoppField6: TppField
      FieldAlias = 'BRUTO'
      FieldName = 'BRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object dstContasPagas: TSQLDataSet
    CommandText = 
      'Select CP.PAG_DATACOMPRA, CP.PAG_DESCRICAO, CP.PAG_VALORPARCELA ' +
      'from CONTASPAGAR CP'#13#10'Where (CP.PAG_DATAPAGAMENTO >= :pDTINCIAL)'#13 +
      #10'and   (CP.PAG_DATAPAGAMENTO <= :pDTFINAL)'#13#10'AND   (CP.PAG_SITUAC' +
      'AO = '#39'P'#39')'
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
    Left = 152
    Top = 8
  end
  object dspContasPagas: TDataSetProvider
    DataSet = dstContasPagas
    Options = [poAllowCommandText]
    Left = 184
    Top = 8
  end
  object cdsContasPagas: TClientDataSet
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
    ProviderName = 'dspContasPagas'
    Left = 216
    Top = 8
    object cdsContasPagasPAG_DESCRICAO: TMemoField
      FieldName = 'PAG_DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContasPagasPAG_VALORPARCELA: TFMTBCDField
      FieldName = 'PAG_VALORPARCELA'
      Precision = 15
      Size = 2
    end
    object cdsContasPagasPAG_DATACOMPRA: TDateField
      FieldName = 'PAG_DATACOMPRA'
    end
  end
  object dstModalidades: TSQLDataSet
    CommandText = 
      'Select MD.MOD_NOME, SUM(MC.mca_vlmodalidade) - Sum(MC.mca_vltroc' +
      'o) AS VALOR from movimento_caixa MC'#13#10'INNER join MODALIDADE MD ON' +
      ' MD.MOD_CODIGO = MC.MCA_MODALIDADE'#13#10'Where (MC.mca_dtmovimento >=' +
      ' :pDTINCIAL)'#13#10'AND   (MC.mca_dtmovimento <= :pDTFINAL)'#13#10'AND   (MC' +
      '.mca_tipomov = '#39'V'#39')'#13#10'Group by MD.MOD_NOME;'#13#10#13#10
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
    Left = 152
    Top = 40
  end
  object dspModalidade: TDataSetProvider
    DataSet = dstModalidades
    Options = [poAllowCommandText]
    Left = 184
    Top = 40
  end
  object cdsModalidade: TClientDataSet
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
    ProviderName = 'dspModalidade'
    Left = 216
    Top = 40
    object cdsModalidadeMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
    object cdsModalidadeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
  end
  object qryDescontos: TSQLQuery
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
    SQL.Strings = (
      
        'Select Sum(MOV_ACRESCIMO) as ACRESCIMO, Sum(MOV_DESCONTO) as DES' +
        'CONTO'
      'from VENDAS V'
      'Where (V.MOV_DATAVENDA >= :pDTINCIAL)'
      'and   (V.MOV_DATAVENDA <= :pDTFINAL)'
      'AND   (V.MOV_SITUACAO = '#39'F'#39')')
    SQLConnection = Dm.SqlAdmin
    Left = 184
    Top = 80
    object qryDescontosACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Precision = 15
      Size = 2
    end
    object qryDescontosDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 2
    end
  end
end
