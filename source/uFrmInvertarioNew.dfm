object frmInvertarioNew: TfrmInvertarioNew
  Left = 191
  Top = 174
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Invent'#225'rio'
  ClientHeight = 341
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 129
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 4
      Width = 23
      Height = 13
      Caption = '&Loja:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label1: TLabel
      Left = 16
      Top = 42
      Width = 40
      Height = 13
      Caption = '&Produto:'
      FocusControl = edtCDPROD
      Transparent = True
    end
    object sbLocCaixa: TSpeedButton
      Left = 136
      Top = 57
      Width = 23
      Height = 22
      Hint = 'Localiza produto'
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
      OnClick = sbLocCaixaClick
    end
    object lbl_Lotes: TLabel
      Left = 16
      Top = 80
      Width = 24
      Height = 13
      Caption = 'L&ote:'
      FocusControl = edtLOTE
      Transparent = True
    end
    object lbl_DTVENC: TLabel
      Left = 168
      Top = 80
      Width = 85
      Height = 13
      Caption = '&Data Vencimento:'
      FocusControl = edtLOTE
      Transparent = True
    end
    object edtCDPROD: TEdit
      Left = 16
      Top = 58
      Width = 121
      Height = 21
      MaxLength = 13
      TabOrder = 1
      OnChange = edtCDPRODChange
      OnEnter = edtCDPRODEnter
      OnExit = edtCDPRODExit
      OnKeyPress = edtCDPRODKeyPress
    end
    object edtNMPROD: TEdit
      Left = 168
      Top = 58
      Width = 337
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object cmbNMLOJA: TComboBox
      Left = 17
      Top = 20
      Width = 490
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnKeyPress = cmbNMLOJAKeyPress
    end
    object edtLOTE: TEdit
      Left = 16
      Top = 96
      Width = 143
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 3
      OnChange = edtLOTEChange
      OnExit = edtLOTEExit
      OnKeyPress = edtLOTEKeyPress
    end
    object edtDTVENC: TMaskEdit
      Left = 167
      Top = 96
      Width = 120
      Height = 21
      Enabled = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
      OnExit = edtDTVENCExit
      OnKeyPress = edtDTVENCKeyPress
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 129
    Width = 522
    Height = 171
    Align = alClient
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Unidade:'
      FocusControl = dbeUNIDADE
      Transparent = True
    end
    object Label5: TLabel
      Left = 16
      Top = 56
      Width = 69
      Height = 13
      Caption = 'Estoque Atual:'
      FocusControl = dbeQTATUAL
      Transparent = True
    end
    object Label6: TLabel
      Left = 16
      Top = 96
      Width = 58
      Height = 13
      Caption = '&Quantidade:'
      FocusControl = edtQTENTRADA
      Transparent = True
    end
    object lbl_Lote: TLabel
      Left = 130
      Top = 56
      Width = 81
      Height = 13
      Caption = 'Estoque do Lote:'
      Transparent = True
    end
    object dbeUNIDADE: TDBEdit
      Left = 16
      Top = 32
      Width = 41
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'UNI_CODIGO'
      DataSource = dsEstoque
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbeQTATUAL: TDBEdit
      Left = 16
      Top = 72
      Width = 100
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'EST_QUANTIDADE'
      DataSource = dsEstoque
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtQTENTRADA: TCurrencyEdit
      Left = 16
      Top = 112
      Width = 100
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = ',0.000;-,0.000'
      MaxLength = 9
      TabOrder = 3
      OnChange = edtQTENTRADAChange
      OnKeyPress = edtQTENTRADAKeyPress
    end
    object edtNRLOTE: TEdit
      Left = 242
      Top = 72
      Width = 151
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Visible = False
    end
    object edtQUANT: TCurrencyEdit
      Left = 128
      Top = 72
      Width = 100
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clSilver
      DecimalPlaces = 3
      DisplayFormat = ',0.000;-,0.000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 300
    Width = 522
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object BtCancelar: TBitBtn
      Left = 355
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtCancelarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
        0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
        0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
        1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
        3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
        5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
        2828281F05002828282828282828282828282817050713282828282828282828
        2828282817060715282828282828282828282828281507062328280004040404
        040404232828000701282802090807070707061B28282706062328040B090711
        2727272828282800071328060D070A07232828282828281C070128070E13020B
        082028282828281C0701280F101D28020D0818282828280107132816191E2828
        140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
        282827140808041B282828282828282828282828282828282828282828282828
        2828282828282828282828282828282828282828282828282828}
    end
    object BtGravar: TBitBtn
      Left = 435
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gravar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtGravarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000942929009431
        31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
        4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
        5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
        73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
        8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
        A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
        BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
        CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
        E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
        33343433332505050B4848191516111B27384647452D0002131048191515111A
        05184046492E0102121048191515111C03032F42493200011210481915151120
        0601243A493200011210481915151221231D1F27322C04041310481915151515
        1515151313151515160F48190D111E282B292B2828292B26150C481909384544
        4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
        3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
        4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
        4343434343434630130F4848092D3A363636363636363A2A0748}
    end
    object BtSair: TBitBtn
      Left = 95
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
      TabOrder = 2
      Visible = False
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
  object sqlLoja: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS order b' +
        'y EMP_FANTASIA')
    SQLConnection = Dm.SqlAdmin
    Left = 352
    Top = 89
  end
  object dstAtualizar: TSQLDataSet
    CommandText = 
      'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and ' +
      '(PRO_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGOLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 304
    Top = 137
  end
  object dspAtualizar: TDataSetProvider
    DataSet = dstAtualizar
    Options = [poAllowCommandText]
    OnGetTableName = dspAtualizarGetTableName
    Left = 344
    Top = 137
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGOLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspAtualizar'
    Left = 416
    Top = 137
    object cdsEstoqueEST_CODIGOLOJA: TIntegerField
      FieldName = 'EST_CODIGOLOJA'
    end
    object cdsEstoquePRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      FixedChar = True
      Size = 13
    end
    object cdsEstoqueUNI_CODIGO: TStringField
      FieldName = 'UNI_CODIGO'
      FixedChar = True
      Size = 2
    end
    object cdsEstoqueEST_DTENTRADA: TDateField
      FieldName = 'EST_DTENTRADA'
    end
    object cdsEstoqueEST_QUANTENTRADA: TFMTBCDField
      FieldName = 'EST_QUANTENTRADA'
      DisplayFormat = '###,##0.#00'
      EditFormat = '###,##0.#00'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueEST_DTSAIDA: TDateField
      FieldName = 'EST_DTSAIDA'
    end
    object cdsEstoqueEST_QUANTSAIDA: TFMTBCDField
      FieldName = 'EST_QUANTSAIDA'
      DisplayFormat = '###,##0.#00'
      EditFormat = '###,##0.#00'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueEST_CUSTOANTERIOR: TFMTBCDField
      FieldName = 'EST_CUSTOANTERIOR'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueEST_CUSTOMEDIO: TFMTBCDField
      FieldName = 'EST_CUSTOMEDIO'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueEST_MAIORCUSTO: TFMTBCDField
      FieldName = 'EST_MAIORCUSTO'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      DisplayFormat = '###,##0.#00'
      EditFormat = '###,##0.#00'
      Precision = 18
      Size = 3
    end
    object cdsEstoqueEST_MINIMO: TFMTBCDField
      FieldName = 'EST_MINIMO'
      DisplayFormat = '###,##0.#00'
      EditFormat = '###,##0.#00'
      Precision = 18
      Size = 3
    end
    object cdsEstoqueULTREAJUST: TDateField
      FieldName = 'ULTREAJUST'
    end
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGOLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspHistorico'
    Left = 408
    Top = 233
    object cdsHistoricoHIS_SEQUENCIA: TIntegerField
      FieldName = 'HIS_SEQUENCIA'
    end
    object cdsHistoricoHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
    end
    object cdsHistoricoHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsHistoricoHIS_UNIDADE: TStringField
      FieldName = 'HIS_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsHistoricoHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object cdsHistoricoHIS_HORA: TStringField
      FieldName = 'HIS_HORA'
      FixedChar = True
      Size = 5
    end
    object cdsHistoricoHIS_TIPO: TStringField
      FieldName = 'HIS_TIPO'
      FixedChar = True
      Size = 2
    end
    object cdsHistoricoHIS_DOCUMENTO: TIntegerField
      FieldName = 'HIS_DOCUMENTO'
    end
    object cdsHistoricoHIS_ANTERIOR: TFMTBCDField
      FieldName = 'HIS_ANTERIOR'
      Precision = 18
      Size = 3
    end
    object cdsHistoricoHIS_MOVIMENTO: TFMTBCDField
      FieldName = 'HIS_MOVIMENTO'
      Precision = 18
      Size = 3
    end
    object cdsHistoricoHIS_ATUAL: TFMTBCDField
      FieldName = 'HIS_ATUAL'
      Precision = 18
      Size = 3
    end
    object cdsHistoricoHIS_USUARIO: TIntegerField
      FieldName = 'HIS_USUARIO'
    end
    object cdsHistoricoHIS_MOTIVO: TIntegerField
      FieldName = 'HIS_MOTIVO'
    end
    object cdsHistoricoHIS_VLCUSTO: TFMTBCDField
      FieldName = 'HIS_VLCUSTO'
      Precision = 18
      Size = 2
    end
    object cdsHistoricoHIS_VLCOMPRA: TFMTBCDField
      FieldName = 'HIS_VLCOMPRA'
      Precision = 18
      Size = 2
    end
    object cdsHistoricoHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      Precision = 18
      Size = 2
    end
    object cdsHistoricoHIS_CODIGOBAIXA: TStringField
      FieldName = 'HIS_CODIGOBAIXA'
      FixedChar = True
      Size = 13
    end
    object cdsHistoricoHIS_VENDEDOR: TIntegerField
      FieldName = 'HIS_VENDEDOR'
    end
  end
  object cdsLotes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGOLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspLotes'
    Left = 400
    Top = 265
    object cdsLotesLOT_PROCODIGO: TStringField
      FieldName = 'LOT_PROCODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsLotesLOT_NRLOTE: TStringField
      FieldName = 'LOT_NRLOTE'
      Required = True
    end
    object cdsLotesLOT_QUANTIDADE: TFMTBCDField
      FieldName = 'LOT_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsLotesLOT_DTVENCIMENTO: TDateField
      FieldName = 'LOT_DTVENCIMENTO'
    end
  end
  object dsEstoque: TDataSource
    DataSet = cdsEstoque
    Left = 472
    Top = 145
  end
  object dstHistorico: TSQLDataSet
    CommandText = 
      'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) and ' +
      '(HIS_LOJA = :pLOJA) AND (HIS_PRODUTO = :pPRODUTO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGOLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 296
    Top = 233
  end
  object dstLotes: TSQLDataSet
    CommandText = 
      'Select * from LOTES Where (LOT_PROCODIGO = :pCODIGO) AND (LOT_NR' +
      'LOTE = :pLOTE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGOLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 296
    Top = 265
  end
  object dspHistorico: TDataSetProvider
    DataSet = dstHistorico
    Options = [poAllowCommandText]
    OnGetTableName = dspHistoricoGetTableName
    Left = 352
    Top = 233
  end
  object dspLotes: TDataSetProvider
    DataSet = dstLotes
    Options = [poAllowCommandText]
    OnGetTableName = dspLotesGetTableName
    Left = 352
    Top = 265
  end
end
