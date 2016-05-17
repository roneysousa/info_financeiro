inherited frmRelProdCliente: TfrmRelProdCliente
  Left = 266
  Top = 190
  Caption = 'Relat'#243'rio Produtos por Clientes'
  ClientHeight = 307
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 266
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
      Top = 49
      Width = 41
      Height = 13
      Caption = '&Per'#237'odo:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label6: TLabel
      Left = 155
      Top = 71
      Width = 6
      Height = 13
      Caption = #224
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object spLocCliente: TSpeedButton
      Left = 146
      Top = 147
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
    object Label1: TLabel
      Left = 27
      Top = 130
      Width = 35
      Height = 13
      Caption = '&Cliente:'
      FocusControl = edtCDCLIE
      Transparent = True
    end
    object lblCliente: TLabel
      Left = 172
      Top = 152
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
    object lblOrdem: TLabel
      Left = 27
      Top = 88
      Width = 34
      Height = 13
      Caption = '&Ordem:'
      FocusControl = cmbOrdem
      Transparent = True
    end
    object Label3: TLabel
      Left = 27
      Top = 170
      Width = 24
      Height = 13
      Caption = '&Tipo:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label4: TLabel
      Left = 27
      Top = 208
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
      Top = 66
      Width = 121
      Height = 21
      Hint = 'Digite a data inicial'
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtDTINICExit
    end
    object edtDTFINI: TDateEdit
      Left = 169
      Top = 66
      Width = 121
      Height = 21
      Hint = 'Digite a data final'
      NumGlyphs = 2
      TabOrder = 2
      OnExit = edtDTFINIExit
    end
    object edtCDCLIE: TEdit
      Left = 27
      Top = 147
      Width = 117
      Height = 21
      MaxLength = 7
      TabOrder = 4
      OnChange = edtCDCLIEChange
      OnExit = edtCDCLIEExit
      OnKeyPress = edtCDCLIEKeyPress
    end
    object cmbOrdem: TComboBox
      Left = 27
      Top = 104
      Width = 134
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 3
      Text = 'VALOR'
      Items.Strings = (
        'VALOR'
        'QUANTIDADE')
    end
    object cmbTPCLIENTE: TComboBox
      Left = 27
      Top = 184
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 5
    end
    object cmbRegiao: TComboBox
      Left = 27
      Top = 224
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 6
    end
  end
  inherited Panel2: TPanel
    Top = 266
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipProdCliente
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
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbProdutosCliente.rtm'
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
    Top = 24
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipProdCliente'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34660
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
      object txtTipoCliente: TppLabel
        UserName = 'txtFabricante1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 68792
        mmTop = 19315
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
        mmTop = 24077
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
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBPipProdCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipProdCliente'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 265
        mmWidth = 75936
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VALOR'
        DataPipeline = ppDBPipProdCliente
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipProdCliente'
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'QUANT'
        DataPipeline = ppDBPipProdCliente
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipProdCliente'
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'FOR_FANTASIA'
        DataPipeline = ppDBPipProdCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipProdCliente'
        mmHeight = 3704
        mmLeft = 79640
        mmTop = 265
        mmWidth = 42333
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SUB_TOTAL'
        DataPipeline = ppDBPipProdCliente
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipProdCliente'
        mmHeight = 3725
        mmLeft = 171980
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
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
    object ppGroup1: TppGroup
      BreakName = 'CLI_CODIGO'
      DataPipeline = ppDBPipProdCliente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipProdCliente'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17727
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CLI_CODIGO'
          DataPipeline = ppDBPipProdCliente
          DisplayFormat = '0000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipProdCliente'
          mmHeight = 3725
          mmLeft = 1058
          mmTop = 7144
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'CLI_FANTASIA'
          DataPipeline = ppDBPipProdCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipProdCliente'
          mmHeight = 3725
          mmLeft = 19315
          mmTop = 7144
          mmWidth = 90752
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'PRODUTO(S)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 794
          mmTop = 12700
          mmWidth = 20320
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'VALOR UNT.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 126207
          mmTop = 12700
          mmWidth = 19558
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'QUANTIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 147638
          mmTop = 12700
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Weight = 0.750000000000000000
          mmHeight = 529
          mmLeft = 0
          mmTop = 17198
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 529
          mmLeft = 0
          mmTop = 12171
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 529
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label2'
          Caption = 'C'#211'DIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3895
          mmLeft = 2752
          mmTop = 2381
          mmWidth = 13123
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label3'
          Caption = 'CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3895
          mmLeft = 19315
          mmTop = 2381
          mmWidth = 13631
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label101'
          Caption = 'FORNECEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 79640
          mmTop = 12700
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'SUB-TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3895
          mmLeft = 177536
          mmTop = 12700
          mmWidth = 18457
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 197644
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'QUANT'
          DataPipeline = ppDBPipProdCliente
          DisplayFormat = '##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipProdCliente'
          mmHeight = 3725
          mmLeft = 147902
          mmTop = 1058
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SUB_TOTAL'
          DataPipeline = ppDBPipProdCliente
          DisplayFormat = '##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipProdCliente'
          mmHeight = 3704
          mmLeft = 171980
          mmTop = 1058
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDBPipProdCliente: TppDBPipeline
    DataSource = dsProdutosCliente
    UserName = 'DBPipProdCliente'
    Left = 312
    Top = 56
    object ppDBPipProdClienteppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'HIS_LOJA'
      FieldName = 'HIS_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipProdClienteppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_CODIGO'
      FieldName = 'CLI_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipProdClienteppField3: TppField
      FieldAlias = 'CLI_FANTASIA'
      FieldName = 'CLI_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipProdClienteppField4: TppField
      FieldAlias = 'HIS_PRODUTO'
      FieldName = 'HIS_PRODUTO'
      FieldLength = 13
      DisplayWidth = 13
      Position = 3
    end
    object ppDBPipProdClienteppField5: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppDBPipProdClienteppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 16
      Position = 5
    end
    object ppDBPipProdClienteppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 6
    end
    object ppDBPipProdClienteppField8: TppField
      FieldAlias = 'FOR_FANTASIA'
      FieldName = 'FOR_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDBPipProdClienteppField9: TppField
      FieldAlias = 'SUB_TOTAL'
      FieldName = 'SUB_TOTAL'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 8
    end
  end
  object dstProdutosClientes: TSQLDataSet
    CommandText = 
      'Select H.HIS_LOJA, C.CLI_CODIGO, C.CLI_FANTASIA, H.HIS_PRODUTO, ' +
      'P.PRO_DESCRICAO,  F.FOR_FANTASIA, SUM(H.HIS_MOVIMENTO) as QUANT,' +
      #13#10'Sum(H.HIS_VLVENDA) VALOR'#13#10'FROM HISTORICO H'#13#10'INNER join PRODUTO' +
      'S P ON H.HIS_PRODUTO = P.PRO_CODIGO'#13#10'INNER join VENDAS M ON H.HI' +
      'S_DOCUMENTO = M.MOV_PEDIDO'#13#10'INNER join CLIENTES C ON M.MOV_CLIEN' +
      'TE = C.CLI_CODIGO'#13#10'INNER join FORNECEDORES F ON P.FOR_CODIGO = F' +
      '.FOR_CODIGO'#13#10'Group by H.HIS_LOJA, C.CLI_CODIGO, C.CLI_FANTASIA, ' +
      'H.HIS_PRODUTO, P.PRO_DESCRICAO, F.FOR_FANTASIA'#13#10'Order by C.CLI_F' +
      'ANTASIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 224
    Top = 112
  end
  object dspProdutosClientes: TDataSetProvider
    DataSet = dstProdutosClientes
    Options = [poAllowCommandText]
    Left = 264
    Top = 112
  end
  object cdsProdutosCliente: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosClientes'
    OnCalcFields = cdsProdutosClienteCalcFields
    Left = 304
    Top = 112
    object cdsProdutosClienteHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
    end
    object cdsProdutosClienteCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsProdutosClienteCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsProdutosClienteHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsProdutosClientePRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsProdutosClienteQUANT: TFMTBCDField
      FieldName = 'QUANT'
      Precision = 15
      Size = 3
    end
    object cdsProdutosClienteVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object cdsProdutosClienteFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsProdutosClienteSUB_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SUB_TOTAL'
      Calculated = True
    end
  end
  object dsProdutosCliente: TDataSource
    DataSet = cdsProdutosCliente
    Left = 344
    Top = 112
  end
end
