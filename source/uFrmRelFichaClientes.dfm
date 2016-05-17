inherited frmRelFichaClientes: TfrmRelFichaClientes
  Left = 226
  Top = 162
  Caption = 'Ficha de Lojas\Comodat'#225'rios\Locat'#225'rios'
  ClientHeight = 274
  ClientWidth = 517
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 517
    Height = 233
    object Label2: TLabel
      Left = 19
      Top = 20
      Width = 74
      Height = 13
      Caption = '&Tipo de Cliente:'
      FocusControl = cmbTPCLIENTE
      Transparent = True
    end
    object Label1: TLabel
      Left = 194
      Top = 20
      Width = 37
      Height = 13
      Caption = '&Regi'#227'o:'
      FocusControl = cmbRegiao
      Transparent = True
    end
    object Label3: TLabel
      Left = 19
      Top = 109
      Width = 34
      Height = 13
      Caption = '&Ordem:'
      FocusControl = cmbOrdem
      Transparent = True
    end
    object Label4: TLabel
      Left = 19
      Top = 63
      Width = 151
      Height = 13
      Caption = '&Lojas\Comodat'#225'rios\Locat'#225'rios:'
      FocusControl = edtCDCLIE
      Transparent = True
    end
    object spLocCliente: TSpeedButton
      Left = 138
      Top = 80
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
    object Label12: TLabel
      Left = 194
      Top = 109
      Width = 29
      Height = 13
      Caption = 'Grupo'
      Transparent = True
    end
    object Label5: TLabel
      Left = 194
      Top = 155
      Width = 42
      Height = 13
      Caption = 'Situa'#231#227'o'
    end
    object cmbTPCLIENTE: TComboBox
      Left = 19
      Top = 38
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object cmbRegiao: TComboBox
      Left = 194
      Top = 38
      Width = 220
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
    end
    object cmbOrdem: TComboBox
      Left = 19
      Top = 125
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
      Items.Strings = (
        'C'#211'DIGO'
        'FANTASIA'
        'RAZ'#195'O SOCIAL')
    end
    object edtCDCLIE: TEdit
      Left = 19
      Top = 80
      Width = 117
      Height = 21
      MaxLength = 7
      TabOrder = 2
      OnChange = edtCDCLIEChange
      OnExit = edtCDCLIEExit
      OnKeyPress = edtCDCLIEKeyPress
    end
    object rgTipo: TRadioGroup
      Left = 19
      Top = 155
      Width = 166
      Height = 41
      Caption = '[ Tipo ]'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&Complento'
        '&Lista')
      TabOrder = 5
    end
    object cmbGrupos: TComboBox
      Left = 194
      Top = 125
      Width = 220
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 4
    end
    object cmbSituacao: TComboBox
      Left = 194
      Top = 171
      Width = 220
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 6
    end
    object lblCliente: TEdit
      Left = 194
      Top = 75
      Width = 295
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
  end
  inherited Panel2: TPanel
    Top = 233
    Width = 517
    inherited BtSair: TBitBtn
      Left = 425
    end
    inherited btImprimir: TBitBtn
      Left = 337
      OnClick = btImprimirClick
    end
  end
  object dstLista: TSQLDataSet
    CommandText = 
      'Select CLI_CODIGO, CLI_FANTASIA, CLI_RAZAO, CLI_TIPOPESSOA, CLI_' +
      'CGC, CLI_ENDERECO, CLI_NUMERO, CLI_CEP, CLI_FONE1, CLI_INSCESTAD' +
      'UAL, CLI_ORGAOEMISSOR, CLI_UFEMISSOR, CLI_UFCLIENTE,'#13#10'CLI_DTANIV' +
      'ERSARIO,(Select C.CID_NOME from CIDADES C Where (C.CID_CODIGO = ' +
      'CLIENTES.CID_CODIGO)) AS CLI_NMCIDADE,'#13#10'(Select B.BAI_NOME from ' +
      'BAIRROS B Where (B.BAI_CODIGO = CLIENTES.BAI_CODIGO)) AS CLI_NMB' +
      'AIRRO,'#13#10'CLI_FONE2, CLI_FAX, CLI_NRBOX, CLI_CDGRUPO'#13#10'from CLIENTE' +
      'S'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 216
  end
  object dspLista: TDataSetProvider
    DataSet = dstLista
    Options = [poAllowCommandText]
    Left = 48
    Top = 216
  end
  object cdsLista: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLista'
    OnCalcFields = cdsListaCalcFields
    Left = 80
    Top = 216
    object cdsListaCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object cdsListaCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsListaCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
    object cdsListaCLI_TIPOPESSOA: TStringField
      FieldName = 'CLI_TIPOPESSOA'
      FixedChar = True
      Size = 1
    end
    object cdsListaCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      Size = 14
    end
    object cdsListaCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 50
    end
    object cdsListaCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
    end
    object cdsListaCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      Size = 8
    end
    object cdsListaCLI_FONE1: TStringField
      FieldName = 'CLI_FONE1'
      Size = 10
    end
    object cdsListaCLI_INSCESTADUAL: TStringField
      FieldName = 'CLI_INSCESTADUAL'
      Size = 14
    end
    object cdsListaCLI_ORGAOEMISSOR: TStringField
      FieldName = 'CLI_ORGAOEMISSOR'
      Size = 5
    end
    object cdsListaCLI_UFEMISSOR: TStringField
      FieldName = 'CLI_UFEMISSOR'
      FixedChar = True
      Size = 2
    end
    object cdsListaCLI_UFCLIENTE: TStringField
      FieldName = 'CLI_UFCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsListaCLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
      ReadOnly = True
    end
    object cdsListaCLI_DTANIVERSARIO: TDateField
      FieldName = 'CLI_DTANIVERSARIO'
    end
    object cdsListaCLI_NMCIDADE: TStringField
      FieldName = 'CLI_NMCIDADE'
      ReadOnly = True
      Size = 40
    end
    object cdsListaCLI_NMBAIRRO: TStringField
      FieldName = 'CLI_NMBAIRRO'
      ReadOnly = True
    end
    object cdsListaCLI_FONE2: TStringField
      FieldName = 'CLI_FONE2'
      ReadOnly = True
      Size = 10
    end
    object cdsListaCLI_FAX: TStringField
      FieldName = 'CLI_FAX'
      ReadOnly = True
      Size = 10
    end
    object cdsListaTELEFONE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'TELEFONE'
      Size = 13
    end
    object cdsListaFAX: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'FAX'
      Size = 13
    end
    object cdsListaCLI_CDGRUPO: TIntegerField
      FieldName = 'CLI_CDGRUPO'
      ReadOnly = True
    end
  end
  object dsLista: TDataSource
    AutoEdit = False
    DataSet = cdsLista
    Left = 120
    Top = 216
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPLista
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
    Left = 256
    Top = 168
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPLista'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 46567
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
        mmHeight = 31221
        mmLeft = 5821
        mmTop = 4498
        mmWidth = 43392
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lbl_NMRELA2'
        Caption = 'RELA'#199#195'O DE LOJAS\COMODAT'#193'RIOS\LOCAT'#193'RIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 5292
        mmWidth = 88371
        BandType = 0
      end
      object txtTipo: TppLabel
        UserName = 'Label8'
        Caption = 'Label8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98425
        mmTop = 10319
        mmWidth = 10583
        BandType = 0
      end
      object txtRegiao: TppLabel
        UserName = 'Label21'
        Caption = 'Label21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98425
        mmTop = 14817
        mmWidth = 12435
        BandType = 0
      end
      object txtOrdem: TppLabel
        UserName = 'txtOrdem'
        Caption = 'txtOrdem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98425
        mmTop = 19050
        mmWidth = 14817
        BandType = 0
      end
      object txtFluxo: TppLabel
        UserName = 'Label25'
        Caption = 'Label25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98425
        mmTop = 23548
        mmWidth = 12435
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
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 40746
        mmWidth = 14309
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 39423
        mmWidth = 197380
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 45508
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'RAZ'#195'O SOCIAL/NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 17198
        mmTop = 40746
        mmWidth = 38015
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'FANTASIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 96573
        mmTop = 40746
        mmWidth = 17441
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'BOX\MESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 159279
        mmTop = 40746
        mmWidth = 18669
        BandType = 0
      end
      object txtGrupo: TppLabel
        UserName = 'txtGrupo'
        Caption = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 98690
        mmTop = 28046
        mmWidth = 974
        BandType = 0
      end
      object txtSituacao: TppLabel
        UserName = 'txtSituacao'
        Caption = 'SITUA'#199#195'O:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 98690
        mmTop = 33073
        mmWidth = 18965
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CLI_CODIGO'
        DataPipeline = ppDBPLista
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPLista'
        mmHeight = 3598
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CLI_RAZAO'
        DataPipeline = ppDBPLista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPLista'
        mmHeight = 3598
        mmLeft = 17198
        mmTop = 1058
        mmWidth = 78052
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CLI_FANTASIA'
        DataPipeline = ppDBPLista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPLista'
        mmHeight = 3598
        mmLeft = 96573
        mmTop = 1058
        mmWidth = 60854
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CLI_NRBOX'
        DataPipeline = ppDBPLista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPLista'
        mmHeight = 3979
        mmLeft = 159279
        mmTop = 1058
        mmWidth = 31485
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel17: TppLabel
        UserName = 'Label17'
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
      object ppLabel18: TppLabel
        UserName = 'Label18'
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
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 2117
        mmTop = 2910
        mmWidth = 19727
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBPLista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPLista'
        mmHeight = 4022
        mmLeft = 24077
        mmTop = 2910
        mmWidth = 17198
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197380
        BandType = 7
      end
    end
  end
  object ppDBPLista: TppDBPipeline
    DataSource = dsLista
    UserName = 'DBPLista'
    Left = 296
    Top = 168
    object ppDBPListappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_CODIGO'
      FieldName = 'CLI_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPListappField2: TppField
      FieldAlias = 'CLI_FANTASIA'
      FieldName = 'CLI_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPListappField3: TppField
      FieldAlias = 'CLI_RAZAO'
      FieldName = 'CLI_RAZAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPListappField4: TppField
      FieldAlias = 'CLI_TIPOPESSOA'
      FieldName = 'CLI_TIPOPESSOA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object ppDBPListappField5: TppField
      FieldAlias = 'CLI_CGC'
      FieldName = 'CLI_CGC'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object ppDBPListappField6: TppField
      FieldAlias = 'CLI_ENDERECO'
      FieldName = 'CLI_ENDERECO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPListappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_NUMERO'
      FieldName = 'CLI_NUMERO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPListappField8: TppField
      FieldAlias = 'CLI_CEP'
      FieldName = 'CLI_CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 7
    end
    object ppDBPListappField9: TppField
      FieldAlias = 'CLI_FONE1'
      FieldName = 'CLI_FONE1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPListappField10: TppField
      FieldAlias = 'CLI_INSCESTADUAL'
      FieldName = 'CLI_INSCESTADUAL'
      FieldLength = 14
      DisplayWidth = 14
      Position = 9
    end
    object ppDBPListappField11: TppField
      FieldAlias = 'CLI_ORGAOEMISSOR'
      FieldName = 'CLI_ORGAOEMISSOR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppDBPListappField12: TppField
      FieldAlias = 'CLI_UFEMISSOR'
      FieldName = 'CLI_UFEMISSOR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 11
    end
    object ppDBPListappField13: TppField
      FieldAlias = 'CLI_UFCLIENTE'
      FieldName = 'CLI_UFCLIENTE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 12
    end
    object ppDBPListappField14: TppField
      FieldAlias = 'CLI_NRBOX'
      FieldName = 'CLI_NRBOX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppDBPListappField15: TppField
      FieldAlias = 'CLI_DTANIVERSARIO'
      FieldName = 'CLI_DTANIVERSARIO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 14
    end
    object ppDBPListappField16: TppField
      FieldAlias = 'CLI_NMCIDADE'
      FieldName = 'CLI_NMCIDADE'
      FieldLength = 40
      DisplayWidth = 40
      Position = 15
    end
    object ppDBPListappField17: TppField
      FieldAlias = 'CLI_NMBAIRRO'
      FieldName = 'CLI_NMBAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
    object ppDBPListappField18: TppField
      FieldAlias = 'CLI_FONE2'
      FieldName = 'CLI_FONE2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppDBPListappField19: TppField
      FieldAlias = 'CLI_FAX'
      FieldName = 'CLI_FAX'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppDBPListappField20: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 13
      DisplayWidth = 13
      Position = 19
    end
    object ppDBPListappField21: TppField
      FieldAlias = 'FAX'
      FieldName = 'FAX'
      FieldLength = 13
      DisplayWidth = 13
      Position = 20
    end
    object ppDBPListappField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_CDGRUPO'
      FieldName = 'CLI_CDGRUPO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 21
    end
  end
end
