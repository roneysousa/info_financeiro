inherited frmRelClienteEletros: TfrmRelClienteEletros
  Caption = 'Rela'#231#227'o de Eletros/Comandat'#225'rios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object RadioGroup1: TRadioGroup
      Left = 24
      Top = 56
      Width = 337
      Height = 65
      Caption = '[ Ordem ]'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        '&C'#243'digo'
        '&Nome')
      TabOrder = 0
    end
  end
  inherited Panel2: TPanel
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
  end
  object dstRelatorio: TSQLDataSet
    CommandText = 
      'Select CL.CLI_CODIGO, CL.cli_tipopessoa, CL.cli_cgc, CL.CLI_RAZA' +
      'O, CL.cli_fantasia, CL.CLI_NRBOX, E.ele_descricao from CLIENTES ' +
      'CL'#13#10'Inner join CLIENTE_ELETRO CE on ce.cle_cliente = cli_codigo'#13 +
      #10'Inner join eletros E on e.ele_codigo = CE.cle_eletro'#13#10'Order by ' +
      'CL.CLI_RAZAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 24
    Top = 128
  end
  object dspRelatorio: TDataSetProvider
    DataSet = dstRelatorio
    Options = [poAllowCommandText]
    Left = 64
    Top = 128
  end
  object cdsRelatorio: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorio'
    OnCalcFields = cdsRelatorioCalcFields
    Left = 104
    Top = 128
    object cdsRelatorioCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object cdsRelatorioCLI_TIPOPESSOA: TStringField
      FieldName = 'CLI_TIPOPESSOA'
      FixedChar = True
      Size = 1
    end
    object cdsRelatorioCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      Size = 14
    end
    object cdsRelatorioCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
    object cdsRelatorioCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsRelatorioCLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
    end
    object cdsRelatorioELE_DESCRICAO: TStringField
      FieldName = 'ELE_DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsRelatorioCNPJCPF: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CNPJCPF'
    end
  end
  object dsRelatorio: TDataSource
    AutoEdit = False
    DataSet = cdsRelatorio
    Left = 144
    Top = 128
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
    Left = 200
    Top = 24
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36513
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
        mmHeight = 31221
        mmLeft = 5821
        mmTop = 2910
        mmWidth = 43392
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'RELA'#199#195'O ELETROS/ELETR'#212'NICOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 107421
        mmTop = 5027
        mmWidth = 60367
        BandType = 0
      end
      object lblOrdem: TppLabel
        UserName = 'lblOrdem'
        Caption = 'Ordem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 107421
        mmTop = 10054
        mmWidth = 11811
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'ELE_DESCRICAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 265
        mmWidth = 123825
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 144463
        mmTop = 2646
        mmWidth = 17198
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 149754
        mmTop = 8202
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 8202
        mmWidth = 1852
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162454
        mmTop = 2646
        mmWidth = 32279
        BandType = 8
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1323
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
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197380
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 3440
        mmWidth = 19844
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 3440
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CLI_CODIGO'
      DataPipeline = ppDBPipeline1
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 18256
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CNPJCPF'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4022
          mmLeft = 19315
          mmTop = 6615
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'CLI_RAZAO'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 54504
          mmTop = 6615
          mmWidth = 87313
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'CLI_NRBOX'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 143669
          mmTop = 6615
          mmWidth = 52123
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 17198
          mmWidth = 140000
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'CPF/CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 19315
          mmTop = 1588
          mmWidth = 17357
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'LOJA\COMODAT'#193'RIO\LOCAT'#193'RIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 54504
          mmTop = 1588
          mmWidth = 58208
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'N'#186'. BOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 143669
          mmTop = 1588
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
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
          mmHeight = 4191
          mmLeft = 2910
          mmTop = 12171
          mmWidth = 20955
          BandType = 3
          GroupNo = 0
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
          mmHeight = 4191
          mmLeft = 2910
          mmTop = 1852
          mmWidth = 14309
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'CLI_CODIGO'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '0000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4022
          mmLeft = 2910
          mmTop = 6615
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 529
          mmWidth = 140000
          BandType = 5
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Registro(s):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 2910
          mmTop = 2381
          mmWidth = 19770
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4022
          mmLeft = 23283
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsRelatorio
    UserName = 'DBPipeline1'
    Left = 240
    Top = 24
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_CODIGO'
      FieldName = 'CLI_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'CLI_TIPOPESSOA'
      FieldName = 'CLI_TIPOPESSOA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'CLI_CGC'
      FieldName = 'CLI_CGC'
      FieldLength = 14
      DisplayWidth = 14
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'CLI_RAZAO'
      FieldName = 'CLI_RAZAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'CLI_FANTASIA'
      FieldName = 'CLI_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'CLI_NRBOX'
      FieldName = 'CLI_NRBOX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'ELE_DESCRICAO'
      FieldName = 'ELE_DESCRICAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 6
    end
  end
end
