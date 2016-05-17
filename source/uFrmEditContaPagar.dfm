object frmEditaContPagar: TfrmEditaContPagar
  Left = 208
  Top = 120
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Editar Conta a Pagar'
  ClientHeight = 492
  ClientWidth = 536
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
    Width = 536
    Height = 451
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 23
      Height = 13
      Caption = '&Loja:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 16
      Top = 86
      Width = 57
      Height = 13
      Caption = 'Fornecedor:'
    end
    object Label4: TLabel
      Left = 16
      Top = 122
      Width = 85
      Height = 13
      Caption = 'N'#186' da Nota/Serie:'
      FocusControl = dbeNRNOTA
    end
    object Label5: TLabel
      Left = 192
      Top = 123
      Width = 77
      Height = 13
      Hint = 'Data da Compra'
      Caption = 'Data da Compra'
      FocusControl = edtDTCOMP
    end
    object Label6: TLabel
      Left = 16
      Top = 162
      Width = 51
      Height = 13
      Caption = 'Descri'#231#227'o:'
      FocusControl = mmoDescricao
    end
    object Label1: TLabel
      Left = 16
      Top = 237
      Width = 46
      Height = 13
      Caption = '&Natureza:'
      FocusControl = edtCDNATU
      Transparent = True
    end
    object Label7: TLabel
      Left = 16
      Top = 275
      Width = 100
      Height = 13
      Caption = 'Data de &Vencimento:'
      FocusControl = dbeDTVENC
      Transparent = True
    end
    object Label8: TLabel
      Left = 168
      Top = 275
      Width = 81
      Height = 13
      Caption = 'Valor da &Parcela:'
      FocusControl = dbeVALOR
      Transparent = True
    end
    object spNatureza: TSpeedButton
      Left = 139
      Top = 250
      Width = 23
      Height = 22
      Hint = 'Localizar natureza'
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
      OnClick = spNaturezaClick
    end
    object lbl_Natureza: TLabel
      Left = 164
      Top = 256
      Width = 13
      Height = 13
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 112
      Top = 24
      Width = 80
      Height = 22
      AutoSize = True
      DataField = 'PAG_PARCELA'
      DataSource = DM2.dsContasPagar
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 112
      Top = 10
      Width = 39
      Height = 13
      Caption = 'Parcela:'
      Transparent = True
    end
    object Label10: TLabel
      Left = 16
      Top = 312
      Width = 34
      Height = 13
      Caption = 'Banco:'
      FocusControl = dbeCDBANC
      Transparent = True
    end
    object Label11: TLabel
      Left = 84
      Top = 312
      Width = 42
      Height = 13
      Caption = 'Ag'#234'ncia:'
      FocusControl = dbeNRAGEN
      Transparent = True
    end
    object Label12: TLabel
      Left = 168
      Top = 312
      Width = 31
      Height = 13
      Caption = 'Conta:'
      FocusControl = dbeNRCONT
      Transparent = True
    end
    object Label13: TLabel
      Left = 320
      Top = 312
      Width = 58
      Height = 13
      Caption = 'N'#186'. Cheque:'
      FocusControl = dbeNRCHEQ
      Transparent = True
    end
    object Label14: TLabel
      Left = 16
      Top = 10
      Width = 39
      Height = 13
      Caption = 'Compra:'
      Transparent = True
    end
    object DBText2: TDBText
      Left = 16
      Top = 24
      Width = 80
      Height = 22
      AutoSize = True
      DataField = 'PAG_NRENTRADA'
      DataSource = DM2.dsContasPagar
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 16
      Top = 350
      Width = 75
      Height = 13
      Caption = 'Valor dos Juros:'
      FocusControl = dbeVLJURO
      Transparent = True
    end
    object Label16: TLabel
      Left = 168
      Top = 350
      Width = 49
      Height = 13
      Caption = 'Desconto:'
      FocusControl = dbeVLDESC
      Transparent = True
    end
    object Label17: TLabel
      Left = 15
      Top = 389
      Width = 55
      Height = 13
      Caption = 'Valor Pago:'
      FocusControl = dbeVLPAGO
      Transparent = True
    end
    object Label18: TLabel
      Left = 320
      Top = 351
      Width = 83
      Height = 13
      Caption = 'Data Pagamento:'
      FocusControl = dbeDTPAGA
      Transparent = True
    end
    object Label19: TLabel
      Left = 321
      Top = 275
      Width = 33
      Height = 13
      Caption = 'Atraso:'
      FocusControl = DBEdit5
    end
    object lblConta: TLabel
      Left = 168
      Top = 389
      Width = 28
      Height = 13
      Caption = 'Conta'
      Transparent = True
    end
    object cmbLoja: TDBLookupComboBox
      Left = 16
      Top = 63
      Width = 338
      Height = 21
      Hint = 'Loja'
      DataField = 'PAG_NOMELOJA'
      DataSource = DM2.dsContasPagar
      TabOrder = 0
    end
    object edtCDFORN: TDBLookupComboBox
      Left = 16
      Top = 99
      Width = 338
      Height = 21
      Hint = 'Fornecedor'
      DataField = 'PAG_NMFORNECEDOR'
      DataSource = DM2.dsContasPagar
      TabOrder = 1
    end
    object dbeNRNOTA: TDBEdit
      Left = 16
      Top = 138
      Width = 116
      Height = 21
      Hint = 'N'#250'mero da Nota'
      DataField = 'PAG_NRNOTA'
      DataSource = DM2.dsContasPagar
      TabOrder = 2
      OnExit = dbeNRNOTAExit
      OnKeyPress = dbeNRNOTAKeyPress
    end
    object dbeSERIE: TDBEdit
      Left = 138
      Top = 138
      Width = 42
      Height = 21
      Hint = 'S'#233'rie'
      DataField = 'PAG_SERIENOTA'
      DataSource = DM2.dsContasPagar
      TabOrder = 3
      OnExit = dbeSERIEExit
      OnKeyPress = dbeSERIEKeyPress
    end
    object edtDTCOMP: TDBEdit
      Left = 192
      Top = 138
      Width = 122
      Height = 21
      DataField = 'PAG_DATACOMPRA'
      DataSource = DM2.dsContasPagar
      TabOrder = 4
      OnExit = edtDTCOMPExit
    end
    object mmoDescricao: TDBMemo
      Left = 16
      Top = 178
      Width = 338
      Height = 58
      Hint = 'Descri'#231#227'o da compra'
      DataField = 'PAG_DESCRICAO'
      DataSource = DM2.dsContasPagar
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object edtCDNATU: TDBEdit
      Left = 16
      Top = 251
      Width = 122
      Height = 21
      DataField = 'PAG_NATUREZADESPESA'
      DataSource = DM2.dsContasPagar
      TabOrder = 6
      OnChange = edtCDNATUChange
      OnExit = edtCDNATUExit
      OnKeyPress = edtCDNATUKeyPress
    end
    object dbeDTVENC: TDBEdit
      Left = 16
      Top = 291
      Width = 121
      Height = 21
      DataField = 'PAG_DATAVENCIMENTO'
      DataSource = frmManuContasPagar.dsContasPagar
      TabOrder = 7
      OnExit = dbeDTVENCExit
      OnKeyPress = dbeDTVENCKeyPress
    end
    object dbeVALOR: TDBEdit
      Left = 168
      Top = 291
      Width = 134
      Height = 21
      DataField = 'PAG_VALORPARCELA'
      DataSource = DM2.dsContasPagar
      TabOrder = 8
      OnKeyPress = dbeVALORKeyPress
    end
    object dbeCDBANC: TDBEdit
      Left = 16
      Top = 328
      Width = 57
      Height = 21
      DataField = 'PAG_BANCO'
      DataSource = DM2.dsContasPagar
      TabOrder = 9
      OnExit = dbeCDBANCExit
      OnKeyPress = dbeCDBANCKeyPress
    end
    object dbeNRAGEN: TDBEdit
      Left = 84
      Top = 328
      Width = 53
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PAG_AGENCIA'
      DataSource = DM2.dsContasPagar
      TabOrder = 10
      OnKeyPress = dbeNRAGENKeyPress
    end
    object dbeNRCONT: TDBEdit
      Left = 168
      Top = 328
      Width = 134
      Height = 21
      DataField = 'PAG_NRCONTA'
      DataSource = DM2.dsContasPagar
      TabOrder = 11
      OnExit = dbeNRCONTExit
      OnKeyPress = dbeNRCONTKeyPress
    end
    object dbeNRCHEQ: TDBEdit
      Left = 320
      Top = 328
      Width = 122
      Height = 21
      DataField = 'PAG_NRCHEQUE'
      DataSource = DM2.dsContasPagar
      TabOrder = 12
      OnExit = dbeNRCHEQExit
      OnKeyPress = dbeNRCHEQKeyPress
    end
    object dbeVLJURO: TDBEdit
      Left = 16
      Top = 366
      Width = 134
      Height = 21
      DataField = 'PAG_VALORJUROS'
      DataSource = DM2.dsContasPagar
      TabOrder = 13
      OnExit = dbeVLJUROExit
    end
    object dbeVLDESC: TDBEdit
      Left = 168
      Top = 366
      Width = 134
      Height = 21
      DataField = 'PAG_VALORDESCONTO'
      DataSource = DM2.dsContasPagar
      TabOrder = 14
      OnExit = dbeVLDESCExit
    end
    object dbeVLPAGO: TDBEdit
      Left = 15
      Top = 405
      Width = 134
      Height = 21
      DataField = 'PAG_VALORPAGO'
      DataSource = DM2.dsContasPagar
      TabOrder = 16
      OnEnter = dbeVLPAGOEnter
      OnExit = dbeVLPAGOExit
    end
    object dbeDTPAGA: TDBEdit
      Left = 320
      Top = 366
      Width = 122
      Height = 21
      DataField = 'PAG_DATAPAGAMENTO'
      DataSource = DM2.dsContasPagar
      TabOrder = 15
    end
    object DBEdit5: TDBEdit
      Left = 321
      Top = 291
      Width = 68
      Height = 21
      TabStop = False
      DataField = 'PAG_ATRASO'
      DataSource = DM2.dsContasPagar
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 17
    end
    object cmbConta: TComboBox
      Left = 168
      Top = 405
      Width = 276
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 18
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 451
    Width = 536
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtCancelar: TBitBtn
      Left = 346
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Cancelar'
      Caption = '&Cancelar'
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
      Left = 429
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Gravar altera'#231#227'o'
      Caption = '&Gravar'
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
    object btOK: TBitBtn
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkOK
    end
  end
  object qryIncParcela: TSQLQuery
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
        Name = 'pDTCOMPRA'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'pFORNECEDOR'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pNATUREZA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pDESCRICAO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'pNRENTRADA'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'UpDate  CONTASPAGAR SET'
      'PAG_LOJA = :pLOJA, '
      'PAG_DATACOMPRA = :pDTCOMPRA,'
      'PAG_FORNECEDOR = :pFORNECEDOR, '
      'PAG_NATUREZADESPESA = :pNATUREZA,'
      'PAG_DESCRICAO = :pDESCRICAO'
      'Where (PAG_NRENTRADA = :pNRENTRADA)')
    SQLConnection = Dm.SqlAdmin
    Left = 448
    Top = 24
  end
end
