inherited frmRelProdutosReajustados: TfrmRelProdutosReajustados
  Caption = 'Relat'#243'rio de Produtos Reajustados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited BtImprimir: TBitBtn
      OnClick = BtImprimirClick
    end
  end
  object dstProdutos: TSQLDataSet
    CommandText = 
      'select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO, PRO_VLCOMPRA, PRO_' +
      'VLVENDA, PRO_DTALTERACAO, PRO_LUCROBRUTO, PRO_LUCROLIQUIDO, PRO_' +
      'HOREAJUTE, PRO_VALOR_ANTERIOR from PRODUTOS'#13#10'Where (PRO_DTALTERA' +
      'CAO >= :pDTINICIAL)'#13#10'AND (PRO_DTALTERACAO <= :pDTFINAL)'
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
    Left = 8
    Top = 163
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 48
    Top = 163
  end
  object cdsProdutos: TClientDataSet
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
    ProviderName = 'dspProdutos'
    Left = 88
    Top = 163
    object cdsProdutosPRO_CODIGO: TStringField
      Alignment = taRightJustify
      DisplayWidth = 7
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsProdutosPRO_VLCOMPRA: TFMTBCDField
      FieldName = 'PRO_VLCOMPRA'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_DTALTERACAO: TDateField
      FieldName = 'PRO_DTALTERACAO'
    end
    object cdsProdutosPRO_LUCROBRUTO: TFMTBCDField
      FieldName = 'PRO_LUCROBRUTO'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_LUCROLIQUIDO: TFMTBCDField
      FieldName = 'PRO_LUCROLIQUIDO'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_HOREAJUTE: TStringField
      FieldName = 'PRO_HOREAJUTE'
      FixedChar = True
      Size = 5
    end
    object cdsProdutosPRO_VALOR_ANTERIOR: TFMTBCDField
      FieldName = 'PRO_VALOR_ANTERIOR'
      Precision = 15
      Size = 2
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
    Template.FileName = 'C:\EMPRESA\SERVICO\DELPHI\Relatorios\rbRelProdReajustados.rtm'
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
    Left = 264
    Top = 56
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBProdutos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33338
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
      object ppLabel8: TppLabel
        UserName = 'lbl_NMRELA2'
        Caption = 'RELATORIO DE PRODUTOS REAJUSTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 118534
        mmTop = 1852
        mmWidth = 72496
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'PER'#205'ODO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 118534
        mmTop = 6615
        mmWidth = 17441
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
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo'
        Caption = '99/99/9999 A 99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 136525
        mmTop = 6615
        mmWidth = 39624
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'USU'#193'RIO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 118798
        mmTop = 11377
        mmWidth = 17187
        BandType = 0
      end
      object txtUsuario: TppLabel
        UserName = 'txtUsuario'
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 136790
        mmTop = 11377
        mmWidth = 3048
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 27252
        mmWidth = 14478
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 27252
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'VL.VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 27252
        mmWidth = 17865
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'L.BRUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 108479
        mmTop = 27252
        mmWidth = 15917
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'L.LIQUIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 127000
        mmTop = 27252
        mmWidth = 18119
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'VL.ANTER.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 146315
        mmTop = 27252
        mmWidth = 18796
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'DATA/HORA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 166423
        mmTop = 27252
        mmWidth = 21082
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
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PRO_CODIGO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 0
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 265
        mmWidth = 73290
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PRO_VLVENDA'
        DataPipeline = ppDBProdutos
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 89959
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PRO_LUCROBRUTO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 108479
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PRO_LUCROLIQUIDO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 127000
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PRO_VALOR_ANTERIOR'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 146315
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PRO_HOREAJUTE'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3969
        mmLeft = 185473
        mmTop = 265
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PRO_DTALTERACAO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4064
        mmLeft = 166688
        mmTop = 265
        mmWidth = 17198
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
        mmWidth = 203200
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
        mmTop = 2117
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
        mmTop = 2117
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
        mmTop = 7408
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
        mmTop = 7408
        mmWidth = 1852
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
        mmHeight = 4064
        mmLeft = 26988
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 1588
        mmWidth = 24638
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 794
        mmWidth = 203200
        BandType = 7
      end
    end
  end
  object ppDBProdutos: TppDBPipeline
    DataSource = dsProdutos
    UserName = 'DBProdutos'
    Left = 272
    Top = 96
    object ppDBProdutosppField1: TppField
      FieldAlias = 'PRO_CODIGO'
      FieldName = 'PRO_CODIGO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBProdutosppField2: TppField
      FieldAlias = 'PRO_BARRAS'
      FieldName = 'PRO_BARRAS'
      FieldLength = 13
      DisplayWidth = 13
      Position = 1
    end
    object ppDBProdutosppField3: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppDBProdutosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLCOMPRA'
      FieldName = 'PRO_VLCOMPRA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 3
    end
    object ppDBProdutosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLVENDA'
      FieldName = 'PRO_VLVENDA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 4
    end
    object ppDBProdutosppField6: TppField
      FieldAlias = 'PRO_DTALTERACAO'
      FieldName = 'PRO_DTALTERACAO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 5
    end
    object ppDBProdutosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_LUCROBRUTO'
      FieldName = 'PRO_LUCROBRUTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 6
    end
    object ppDBProdutosppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_LUCROLIQUIDO'
      FieldName = 'PRO_LUCROLIQUIDO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 7
    end
    object ppDBProdutosppField9: TppField
      FieldAlias = 'PRO_HOREAJUTE'
      FieldName = 'PRO_HOREAJUTE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 8
    end
    object ppDBProdutosppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VALOR_ANTERIOR'
      FieldName = 'PRO_VALOR_ANTERIOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 9
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 144
    Top = 120
  end
end
