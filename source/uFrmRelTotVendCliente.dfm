inherited frmRelTotVendCliente: TfrmRelTotVendCliente
  Left = 209
  Top = 125
  Caption = 'Total Vendido por Cliente'
  ClientHeight = 336
  ClientWidth = 393
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 393
    Height = 295
    object Label2: TLabel
      Left = 27
      Top = 3
      Width = 23
      Height = 13
      Caption = '&Loja:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label1: TLabel
      Left = 27
      Top = 84
      Width = 34
      Height = 13
      Caption = '&Se'#231#227'o:'
      FocusControl = cmbNMSECAO
      Transparent = True
    end
    object Label3: TLabel
      Left = 27
      Top = 122
      Width = 53
      Height = 13
      Caption = 'Su&bSe'#231#227'o:'
      FocusControl = cmbSUBSECAO
      Transparent = True
    end
    object Label4: TLabel
      Left = 27
      Top = 162
      Width = 53
      Height = 13
      Caption = '&Fabricante:'
      FocusControl = cmbFabricante
      Transparent = True
    end
    object Label5: TLabel
      Left = 27
      Top = 41
      Width = 41
      Height = 13
      Caption = '&Per'#237'odo:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label6: TLabel
      Left = 155
      Top = 64
      Width = 6
      Height = 13
      Caption = #224
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object lblTipo: TLabel
      Left = 27
      Top = 202
      Width = 24
      Height = 13
      Caption = '&Tipo:'
      FocusControl = cmbMaisMenos
      Transparent = True
    end
    object lbl_Limite: TLabel
      Left = 171
      Top = 202
      Width = 30
      Height = 13
      Caption = '&Limite:'
      FocusControl = edtLimite
      Transparent = True
    end
    object lblOrdem: TLabel
      Left = 27
      Top = 244
      Width = 34
      Height = 13
      Caption = '&Ordem:'
      FocusControl = cmbOrdem
      Transparent = True
    end
    object spLocCliente: TSpeedButton
      Left = 290
      Top = 260
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
      Visible = False
      OnClick = spLocClienteClick
    end
    object cmbNMLOJA: TComboBox
      Left = 27
      Top = 19
      Width = 263
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object cmbNMSECAO: TComboBox
      Left = 27
      Top = 99
      Width = 263
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
      OnEnter = cmbNMSECAOEnter
      OnExit = cmbNMSECAOExit
    end
    object cmbSUBSECAO: TComboBox
      Left = 27
      Top = 138
      Width = 263
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 4
    end
    object cmbFabricante: TComboBox
      Left = 27
      Top = 178
      Width = 263
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 5
    end
    object edtDTINIC: TDateEdit
      Left = 27
      Top = 59
      Width = 121
      Height = 21
      Hint = 'Digite a data inicial'
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtDTINICExit
    end
    object edtDTFINI: TDateEdit
      Left = 169
      Top = 59
      Width = 120
      Height = 21
      Hint = 'Digite a data final'
      NumGlyphs = 2
      TabOrder = 2
      Text = ' =/  /    '
      OnExit = edtDTFINIExit
    end
    object cmbMaisMenos: TComboBox
      Left = 27
      Top = 218
      Width = 134
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 6
      Text = 'MAIS VENDIDOS'
      Items.Strings = (
        'MAIS VENDIDOS'
        'MENOS VENDIDOS')
    end
    object edtLimite: TRxSpinEdit
      Left = 171
      Top = 218
      Width = 117
      Height = 21
      MaxValue = 10.000000000000000000
      TabOrder = 7
    end
    object cmbOrdem: TComboBox
      Left = 27
      Top = 260
      Width = 134
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 8
      Text = 'VALOR'
      Items.Strings = (
        'VALOR'
        'QUANTIDADE')
    end
    object edtCDCLIE: TEdit
      Left = 171
      Top = 260
      Width = 117
      Height = 21
      MaxLength = 7
      TabOrder = 9
      Visible = False
      OnExit = edtCDCLIEExit
      OnKeyPress = edtCDCLIEKeyPress
    end
  end
  inherited Panel2: TPanel
    Top = 295
    Width = 393
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
  end
  object dstTotVendClientes: TSQLDataSet
    CommandText = 
      'Select H.HIS_LOJA, M.MOV_CLIENTE, M.MOV_NOMECLIENTE, '#13#10'P.FOR_COD' +
      'IGO,'#13#10'Sum(H.HIS_MOVIMENTO) as QUANT,'#13#10'Sum(H.HIS_VLVENDA) as VALO' +
      'R'#13#10'FROM HISTORICO H'#13#10'INNER join PRODUTOS P ON H.HIS_PRODUTO = P.' +
      'PRO_CODIGO'#13#10'INNER join VENDAS M ON H.HIS_DOCUMENTO = M.MOV_PEDID' +
      'O'#13#10'Where (H.HIS_LOJA = :pLOJA)'#13#10'AND (H.HIS_DATA >= :pDTINICIAL) ' +
      'AND (H.HIS_DATA <= :pDTFINAL)'#13#10'AND (H.HIS_TIPO = :pTIPO)'#13#10'Group ' +
      'by H.HIS_LOJA, M.MOV_CLIENTE, M.MOV_NOMECLIENTE,'#13#10'P.FOR_CODIGO'#13#10 +
      'Order by M.MOV_NOMECLIENTE;'
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
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 24
    Top = 296
  end
  object dstTotVendido: TDataSetProvider
    DataSet = dstTotVendClientes
    Options = [poAllowCommandText]
    Left = 64
    Top = 296
  end
  object cdsTotalVendido: TClientDataSet
    Active = True
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
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dstTotVendido'
    OnCalcFields = cdsTotalVendidoCalcFields
    Left = 104
    Top = 296
    object cdsTotalVendidoHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
    end
    object cdsTotalVendidoMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
    end
    object cdsTotalVendidoMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      Size = 40
    end
    object cdsTotalVendidoQUANT: TFMTBCDField
      FieldName = 'QUANT'
      Precision = 15
      Size = 3
    end
    object cdsTotalVendidoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object cdsTotalVendidoPERCENTUAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PERCENTUAL'
      Calculated = True
    end
  end
  object dsTotalVendido: TDataSource
    DataSet = cdsTotalVendido
    Left = 144
    Top = 296
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
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbRelTotalVendClientes.rtm'
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
    Left = 304
    Top = 136
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42069
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
        mmHeight = 26458
        mmLeft = 1588
        mmTop = 2381
        mmWidth = 50006
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'EMPRESA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83608
        mmTop = 8467
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'PER'#205'ODO  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83608
        mmTop = 13758
        mmWidth = 19050
        BandType = 0
      end
      object txtEmpresa: TppLabel
        UserName = 'txtEmpresa'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 104246
        mmTop = 8467
        mmWidth = 17992
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtEmpresa1'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 104246
        mmTop = 13758
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 35719
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 116417
        mmTop = 35983
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 141023
        mmTop = 35983
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = '% VENDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 173302
        mmTop = 35983
        mmWidth = 18521
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 529
        mmTop = 34925
        mmWidth = 197644
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 529
        mmTop = 40481
        mmWidth = 197644
        BandType = 0
      end
      object txtRelatorio: TppLabel
        UserName = 'txtRelatorio'
        Caption = 'txtRelatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83608
        mmTop = 3704
        mmWidth = 17727
        BandType = 0
      end
      object txtFabricante: TppLabel
        UserName = 'txtFabricante'
        Caption = 'txtFabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 83608
        mmTop = 18521
        mmWidth = 20320
        BandType = 0
      end
      object txtSecao: TppLabel
        UserName = 'txtSecao'
        Caption = 'txtSecao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 83608
        mmTop = 23283
        mmWidth = 13674
        BandType = 0
      end
      object txtSubsecao: TppLabel
        UserName = 'txtSubsecao'
        Caption = 'txtSubsecao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 83608
        mmTop = 28046
        mmWidth = 19346
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MOV_NOMECLIENTE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 265
        mmWidth = 91281
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VALOR'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 98690
        mmTop = 265
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'QUANT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 133615
        mmTop = 265
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PERCENTUAL'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 169069
        mmTop = 265
        mmWidth = 22754
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 794
        mmWidth = 197644
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
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197644
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 98690
        mmTop = 1588
        mmWidth = 29633
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'QUANT'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 133615
        mmTop = 1588
        mmWidth = 29633
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'PERCENTUAL'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 169069
        mmTop = 1588
        mmWidth = 22754
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 24299
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 25929
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsTotalVendido
    UserName = 'DBPipeline1'
    Left = 344
    Top = 136
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'HIS_LOJA'
      FieldName = 'HIS_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_CLIENTE'
      FieldName = 'MOV_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'MOV_NOMECLIENTE'
      FieldName = 'MOV_NOMECLIENTE'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 16
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTUAL'
      FieldName = 'PERCENTUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'FOR_CODIGO'
      FieldName = 'FOR_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
  end
  object dstMaisMenosProdutos: TSQLDataSet
    CommandText = 
      'Select H.HIS_LOJA, H.HIS_PRODUTO, P.PRO_DESCRICAO,'#13#10'C.COR_DESCRI' +
      'CAO, S.SEC_DESCRICAO ,SUM(H.HIS_MOVIMENTO) as QUANT,'#13#10'Sum(H.HIS_' +
      'VLVENDA) VALOR'#13#10'FROM HISTORICO H'#13#10'INNER join PRODUTOS P ON H.HIS' +
      '_PRODUTO = P.PRO_CODIGO'#13#10'INNER join VENDAS   M ON H.HIS_DOCUMENT' +
      'O = M.MOV_PEDIDO'#13#10'INNER join CORES    C ON P.PRO_COR = C.COR_COD' +
      'IGO'#13#10'INNER join SECAO    S ON P.SEC_CODIGO = S.SEC_CODIGO'#13#10'Where' +
      ' (H.HIS_LOJA = :pLOJA)'#13#10'AND (H.HIS_DATA >= :pDTINICIAL) AND (H.H' +
      'IS_DATA <= :pDTFINAL)'#13#10'AND (H.HIS_TIPO = :pTIPO)'#13#10'Group by H.HIS' +
      '_LOJA, H.HIS_PRODUTO, P.PRO_DESCRICAO,'#13#10'C.COR_DESCRICAO, S.SEC_D' +
      'ESCRICAO'#13#10'Order by Sum(H.HIS_VLVENDA) desc'
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
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 296
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstMaisMenosProdutos
    Options = [poAllowCommandText]
    Left = 296
    Top = 32
  end
  object cdsProdutos: TClientDataSet
    Active = True
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
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspProdutos'
    OnCalcFields = cdsProdutosCalcFields
    Left = 296
    Top = 64
    object cdsProdutosHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
    end
    object cdsProdutosHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsProdutosQUANT: TFMTBCDField
      FieldName = 'QUANT'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPERCENTUAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PERCENTUAL'
      Calculated = True
    end
    object cdsProdutosCOR_DESCRICAO: TStringField
      FieldName = 'COR_DESCRICAO'
      Size = 25
    end
    object cdsProdutosSEC_DESCRICAO: TStringField
      FieldName = 'SEC_DESCRICAO'
      Size = 30
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 296
    Top = 96
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBPipProdutos
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
    Left = 304
    Top = 168
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipProdutos'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 62706
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
        mmTop = 6085
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
        mmTop = 11377
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
        mmTop = 6085
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
        mmTop = 11377
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
        mmTop = 1323
        mmWidth = 17727
        BandType = 0
      end
      object txtFabricante2: TppLabel
        UserName = 'txtFabricante1'
        Caption = 'txtFabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 16140
        mmWidth = 20373
        BandType = 0
      end
      object txtSecao2: TppLabel
        UserName = 'txtSecao1'
        Caption = 'txtSecao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 20902
        mmWidth = 13758
        BandType = 0
      end
      object txtSubsecao2: TppLabel
        UserName = 'txtSubsecao1'
        Caption = 'txtSubsecao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 25665
        mmWidth = 19315
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
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 794
        mmTop = 57415
        mmWidth = 16002
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 140494
        mmTop = 57415
        mmWidth = 11176
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 154871
        mmTop = 57415
        mmWidth = 21251
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = '% VENDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 180182
        mmTop = 57415
        mmWidth = 16933
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 56356
        mmWidth = 197644
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 61913
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'TIPO :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 69056
        mmTop = 30427
        mmWidth = 10202
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'ORDEM :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 69056
        mmTop = 34925
        mmWidth = 15028
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'LIMITE :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 69056
        mmTop = 39423
        mmWidth = 13293
        BandType = 0
      end
      object txtTipo: TppLabel
        UserName = 'txtTipo'
        Caption = 'txtTipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 80433
        mmTop = 30163
        mmWidth = 10583
        BandType = 0
      end
      object txtOrdem: TppLabel
        UserName = 'txtOrdem'
        Caption = 'txtOrdem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 84667
        mmTop = 34925
        mmWidth = 14563
        BandType = 0
      end
      object txtLimite: TppLabel
        UserName = 'txtLimite'
        Caption = 'txtLimite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 83079
        mmTop = 39423
        mmWidth = 13123
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'TOTAL DAS VENDAS NO PERIODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 794
        mmTop = 51329
        mmWidth = 58886
        BandType = 0
      end
      object txtValor: TppLabel
        UserName = 'txtValor'
        Caption = 'txtValor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 139436
        mmTop = 51329
        mmWidth = 13081
        BandType = 0
      end
      object txtQuant: TppLabel
        UserName = 'txtQuant'
        Caption = 'txtQuant'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 162190
        mmTop = 51594
        mmWidth = 14520
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 50536
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label102'
        Caption = 'COR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 70644
        mmTop = 57415
        mmWidth = 7112
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'SE'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 98690
        mmTop = 57415
        mmWidth = 11345
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
        DataPipeline = ppDBPipProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipProdutos'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 265
        mmWidth = 67998
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VALOR'
        DataPipeline = ppDBPipProdutos
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipProdutos'
        mmHeight = 3979
        mmLeft = 130704
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'QUANT'
        DataPipeline = ppDBPipProdutos
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipProdutos'
        mmHeight = 3979
        mmLeft = 155046
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PERCENTUAL'
        DataPipeline = ppDBPipProdutos
        DisplayFormat = '##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipProdutos'
        mmHeight = 3725
        mmLeft = 178594
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'COR_DESCRICAO'
        DataPipeline = ppDBPipProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipProdutos'
        mmHeight = 3725
        mmLeft = 70644
        mmTop = 265
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'SEC_DESCRICAO'
        DataPipeline = ppDBPipProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipProdutos'
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 265
        mmWidth = 29898
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
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line8'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 265
        mmTop = 529
        mmWidth = 197644
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 1058
        mmTop = 1323
        mmWidth = 24299
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataPipeline = ppDBPipProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipProdutos'
        mmHeight = 4022
        mmLeft = 25929
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBPipProdutos: TppDBPipeline
    DataSource = dsProdutos
    UserName = 'DBPipProdutos'
    Left = 344
    Top = 168
    object ppDBPipProdutosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'HIS_LOJA'
      FieldName = 'HIS_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipProdutosppField2: TppField
      FieldAlias = 'HIS_PRODUTO'
      FieldName = 'HIS_PRODUTO'
      FieldLength = 13
      DisplayWidth = 13
      Position = 1
    end
    object ppDBPipProdutosppField3: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppDBPipProdutosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 16
      Position = 3
    end
    object ppDBPipProdutosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 4
    end
    object ppDBPipProdutosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTUAL'
      FieldName = 'PERCENTUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipProdutosppField7: TppField
      FieldAlias = 'COR_DESCRICAO'
      FieldName = 'COR_DESCRICAO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 6
    end
    object ppDBPipProdutosppField8: TppField
      FieldAlias = 'SEC_DESCRICAO'
      FieldName = 'SEC_DESCRICAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
  end
  object ppReport3: TppReport
    AutoStop = False
    DataPipeline = ppDBPLimite
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
    Template.FileName = 
      'C:\Empresa\SERVICO\DELPHI\Relatorios\rbRelProdMaisMenosVendidos.' +
      'rtm'
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
    Left = 304
    Top = 200
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPLimite'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 63236
      mmPrintPosition = 0
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'EMPRESA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 6085
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'PER'#205'ODO  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 10848
        mmWidth = 19050
        BandType = 0
      end
      object txtEmpresa3: TppLabel
        UserName = 'txtEmpresa3'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 89694
        mmTop = 6085
        mmWidth = 17992
        BandType = 0
      end
      object txtPeriodo3: TppLabel
        UserName = 'txtPeriodo3'
        Caption = 'txtEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 89694
        mmTop = 10848
        mmWidth = 17992
        BandType = 0
      end
      object txtRelatorio2: TppLabel
        UserName = 'txtRelatorio2'
        Caption = 'txtRelatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 1323
        mmWidth = 17727
        BandType = 0
      end
      object txtFabricante3: TppLabel
        UserName = 'txtFabricante3'
        Caption = 'txtFabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 15610
        mmWidth = 20373
        BandType = 0
      end
      object txtSecao3: TppLabel
        UserName = 'txtSecao3'
        Caption = 'txtSecao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 20373
        mmWidth = 13758
        BandType = 0
      end
      object txtSubsecao3: TppLabel
        UserName = 'txtSubsecao3'
        Caption = 'txtSubsecao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 25135
        mmWidth = 19315
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
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
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 794
        mmTop = 57150
        mmWidth = 16002
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label101'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 140494
        mmTop = 57150
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 155046
        mmTop = 57150
        mmWidth = 21251
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = '% VENDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 178594
        mmTop = 57150
        mmWidth = 16933
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 56356
        mmWidth = 197644
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 61913
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'TIPO :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 29898
        mmWidth = 10202
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'ORDEM :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 34396
        mmWidth = 15028
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label201'
        Caption = 'LIMITE :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 38894
        mmWidth = 13293
        BandType = 0
      end
      object txtTipo2: TppLabel
        UserName = 'txtTipo1'
        Caption = 'txtTipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 80433
        mmTop = 29633
        mmWidth = 10583
        BandType = 0
      end
      object txtOrdem2: TppLabel
        UserName = 'txtOrdem1'
        Caption = 'txtOrdem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 84667
        mmTop = 34396
        mmWidth = 14563
        BandType = 0
      end
      object txtLimite1: TppLabel
        UserName = 'txtLimite1'
        Caption = 'txtLimite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83079
        mmTop = 38894
        mmWidth = 13123
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'TOTAL DAS VENDAS NO PERIODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 794
        mmTop = 51329
        mmWidth = 58886
        BandType = 0
      end
      object txtValor1: TppLabel
        UserName = 'txtValor1'
        Caption = 'txtValor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 129382
        mmTop = 51329
        mmWidth = 21960
        BandType = 0
      end
      object txtQuant1: TppLabel
        UserName = 'txtQuant1'
        Caption = 'txtQuant'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 161396
        mmTop = 51329
        mmWidth = 14552
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 50536
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'COR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 70644
        mmTop = 57150
        mmWidth = 7112
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'SE'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 98690
        mmTop = 57150
        mmWidth = 11345
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DESCRICAO'
        DataPipeline = ppDBPLimite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPLimite'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 265
        mmWidth = 67998
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VALOR'
        DataPipeline = ppDBPLimite
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPLimite'
        mmHeight = 3969
        mmLeft = 130704
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'QUANTIDADE'
        DataPipeline = ppDBPLimite
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPLimite'
        mmHeight = 3979
        mmLeft = 155046
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'PERCENTUAL'
        DataPipeline = ppDBPLimite
        DisplayFormat = '##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPLimite'
        mmHeight = 3969
        mmLeft = 178594
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'COR'
        DataPipeline = ppDBPLimite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPLimite'
        mmHeight = 3725
        mmLeft = 70644
        mmTop = 265
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'SECAO'
        DataPipeline = ppDBPLimite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPLimite'
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 265
        mmWidth = 29898
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'Line13'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 794
        mmWidth = 197644
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
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 2381
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
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
      object ppLabel44: TppLabel
        UserName = 'Label44'
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
        UserName = 'SystemVariable6'
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
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'Line14'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197644
        BandType = 7
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 1058
        mmTop = 1323
        mmWidth = 24299
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataPipeline = ppDBPLimite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPLimite'
        mmHeight = 4022
        mmLeft = 25929
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBPLimite: TppDBPipeline
    DataSource = dsProdutosLimites
    UserName = 'DBPLimite'
    Left = 344
    Top = 200
    object ppDBPLimiteppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOJA'
      FieldName = 'LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPLimiteppField2: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 13
      DisplayWidth = 13
      Position = 1
    end
    object ppDBPLimiteppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDBPLimiteppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPLimiteppField5: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPLimiteppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTUAL'
      FieldName = 'PERCENTUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPLimiteppField7: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 40
      DisplayWidth = 40
      Position = 6
    end
    object ppDBPLimiteppField8: TppField
      FieldAlias = 'SECAO'
      FieldName = 'SECAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppDBPLimiteppField9: TppField
      FieldAlias = 'COR'
      FieldName = 'COR'
      FieldLength = 25
      DisplayWidth = 25
      Position = 8
    end
  end
  object cdsLimite: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 232
    Data = {
      FA0000009619E0BD010000001800000009000000000003000000FA00044C4F4A
      4104000100000000000750524F4455544F010049000000010005574944544802
      0002000D000944455343524943414F0100490000000100055749445448020002
      0028000A5155414E54494441444508000400000000000556414C4F5208000400
      0000010007535542545950450200490006004D6F6E6579000A50455243454E54
      55414C08000400000000000A464F524E454345444F5201004900000001000557
      4944544802000200280005534543414F01004900000001000557494454480200
      02001E0003434F5201004900000001000557494454480200020019000000}
    object cdsLimiteLOJA: TIntegerField
      FieldName = 'LOJA'
    end
    object cdsLimitePRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 13
    end
    object cdsLimiteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cdsLimiteQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsLimiteVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object cdsLimitePERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object cdsLimiteFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 40
    end
    object cdsLimiteSECAO: TStringField
      FieldName = 'SECAO'
      Size = 30
    end
    object cdsLimiteCOR: TStringField
      FieldName = 'COR'
      Size = 25
    end
  end
  object dsProdutosLimites: TDataSource
    DataSet = cdsLimite
    Left = 344
    Top = 232
  end
  object dstPadrao: TSQLDataSet
    CommandText = 
      'Select M.MOV_LOJA, P.PRO_DESCRICAO, P.PRO_CODIGO, PV.MOP_CODCOR,' +
      ' Count(*) as QUANT, Sum(PV.MOP_VALOR) as VALOR FROM VENDAS M INN' +
      'ER join PROVENDAS PV ON PV.MOP_PEDIDO = M.MOV_PEDIDO INNER join ' +
      'PRODUTOS P ON PV.MOP_PRODUTO = P.PRO_CODIGO Where (M.MOV_LOJA = ' +
      ':pLOJA) AND (M.MOV_DATAVENDA >= :pDTINICIAL) AND (M.MOV_DATAVEND' +
      'A <= :pDTFINAL) AND (M.MOV_SITUACAO = :pTIPO) Group by M.MOV_LOJ' +
      'A, P.PRO_DESCRICAO, P.PRO_CODIGO, PV.MOP_CODCOR Order by Sum(PV.' +
      'MOP_VALOR) desc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptUnknown
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 152
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 56
    Top = 152
  end
  object cdsNovoProdutos: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select M.MOV_LOJA, P.PRO_DESCRICAO, P.PRO_CODIGO, PV.MOP_CODCOR,' +
      ' Count(*) as QUANT, Sum(PV.MOP_VALOR) as VALOR FROM VENDAS M INN' +
      'ER join PROVENDAS PV ON PV.MOP_PEDIDO = M.MOV_PEDIDO INNER join ' +
      'PRODUTOS P ON PV.MOP_PRODUTO = P.PRO_CODIGO Where (M.MOV_LOJA = ' +
      ':pLOJA) AND (M.MOV_DATAVENDA >= :pDTINICIAL) AND (M.MOV_DATAVEND' +
      'A <= :pDTFINAL) AND (M.MOV_SITUACAO = :pTIPO) Group by M.MOV_LOJ' +
      'A, P.PRO_DESCRICAO, P.PRO_CODIGO, PV.MOP_CODCOR Order by Sum(PV.' +
      'MOP_VALOR) desc'
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    OnCalcFields = cdsNovoProdutosCalcFields
    Left = 96
    Top = 152
    object cdsNovoProdutosMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
    end
    object cdsNovoProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsNovoProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsNovoProdutosMOP_CODCOR: TIntegerField
      FieldName = 'MOP_CODCOR'
    end
    object cdsNovoProdutosQUANT: TIntegerField
      FieldName = 'QUANT'
      ReadOnly = True
      Required = True
    end
    object cdsNovoProdutosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsNovoProdutosPERCENTUAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PERCENTUAL'
      Calculated = True
    end
  end
end
