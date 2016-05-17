object frmBaixaContPagar: TfrmBaixaContPagar
  Left = 215
  Top = 72
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Baixa de Contas a Pagar'
  ClientHeight = 444
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 0
    Top = 0
    Width = 560
    Height = 403
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 69
      Height = 13
      Caption = 'N'#186' da Compra:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 45
      Width = 23
      Height = 13
      Caption = 'Loja:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 17
      Top = 83
      Width = 57
      Height = 13
      Caption = 'Fornecedor:'
    end
    object Label4: TLabel
      Left = 16
      Top = 119
      Width = 85
      Height = 13
      Caption = 'N'#186' da Nota/Serie:'
      FocusControl = DBEdit1
    end
    object Label5: TLabel
      Left = 16
      Top = 232
      Width = 77
      Height = 13
      Hint = 'Data da Compra'
      Caption = 'Data da Compra'
      FocusControl = DBEdit3
    end
    object Label6: TLabel
      Left = 16
      Top = 159
      Width = 51
      Height = 13
      Caption = 'Descri'#231#227'o:'
      FocusControl = DBMemo1
    end
    object Label7: TLabel
      Left = 157
      Top = 232
      Width = 97
      Height = 13
      Hint = 'Data do Vencimento'
      Caption = 'Data do Vencimento'
      FocusControl = DBEdit4
    end
    object Label8: TLabel
      Left = 297
      Top = 231
      Width = 33
      Height = 13
      Caption = 'Atraso:'
      FocusControl = DBEdit5
    end
    object Label9: TLabel
      Left = 16
      Top = 270
      Width = 78
      Height = 13
      Caption = 'Total da Compra'
    end
    object Label10: TLabel
      Left = 157
      Top = 270
      Width = 81
      Height = 13
      Caption = 'Valor da Parcela:'
      FocusControl = dbeVLPARC
      Transparent = True
    end
    object Label11: TLabel
      Left = 157
      Top = 309
      Width = 49
      Height = 13
      Caption = 'Desconto:'
      FocusControl = dbeVLDESC
      Transparent = True
    end
    object Label12: TLabel
      Left = 16
      Top = 348
      Width = 55
      Height = 13
      Caption = 'Valor Pago:'
      FocusControl = dbeVLPAGO
      Transparent = True
    end
    object Label13: TLabel
      Left = 17
      Top = 309
      Width = 75
      Height = 13
      Caption = 'Valor dos Juros:'
      FocusControl = dbeVLJURO
      Transparent = True
    end
    object Label14: TLabel
      Left = 157
      Top = 349
      Width = 83
      Height = 13
      Caption = 'Data Pagamento:'
      FocusControl = dbeDTPAGA
      Transparent = True
    end
    object Label15: TLabel
      Left = 320
      Top = 323
      Width = 58
      Height = 13
      Caption = '&Modalidade:'
      FocusControl = cmbModalidade
      Visible = False
    end
    object DBText1: TDBText
      Left = 160
      Top = 22
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
    object txtNRCOMPRA: TDBText
      Left = 16
      Top = 22
      Width = 134
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
    object Label16: TLabel
      Left = 160
      Top = 6
      Width = 39
      Height = 13
      Caption = 'Parcela:'
      Transparent = True
    end
    object cmbLoja: TDBLookupComboBox
      Left = 16
      Top = 60
      Width = 350
      Height = 21
      Hint = 'Loja'
      DataField = 'PAG_NOMELOJA'
      DataSource = DM2.dsContasPagar
      ReadOnly = True
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 16
      Top = 96
      Width = 350
      Height = 21
      Hint = 'Fornecedor'
      DataField = 'PAG_NMFORNECEDOR'
      DataSource = DM2.dsContasPagar
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 135
      Width = 128
      Height = 21
      Hint = 'N'#250'mero da Nota'
      DataField = 'PAG_NRNOTA'
      DataSource = DM2.dsContasPagar
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 150
      Top = 135
      Width = 30
      Height = 21
      Hint = 'S'#233'rie'
      DataField = 'PAG_SERIENOTA'
      DataSource = DM2.dsContasPagar
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 247
      Width = 134
      Height = 21
      DataField = 'PAG_DATACOMPRA'
      DataSource = DM2.dsContasPagar
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 5
    end
    object DBMemo1: TDBMemo
      Left = 15
      Top = 175
      Width = 350
      Height = 55
      Hint = 'Descri'#231#227'o da compra'
      DataField = 'PAG_DESCRICAO'
      DataSource = DM2.dsContasPagar
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 157
      Top = 247
      Width = 134
      Height = 21
      DataField = 'PAG_DATAVENCIMENTO'
      DataSource = DM2.dsContasPagar
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 6
    end
    object DBEdit5: TDBEdit
      Left = 297
      Top = 247
      Width = 68
      Height = 21
      DataField = 'PAG_ATRASO'
      DataSource = DM2.dsContasPagar
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 7
    end
    object edtTOTCOMPRA: TCurrencyEdit
      Left = 16
      Top = 286
      Width = 134
      Height = 21
      Hint = 'Total da Compra'
      AutoSize = False
      DisplayFormat = ' ,0.00;-,0.00'
      ReadOnly = True
      TabOrder = 8
    end
    object dbeVLPARC: TDBEdit
      Left = 157
      Top = 286
      Width = 134
      Height = 21
      DataField = 'PAG_VALORPARCELA'
      DataSource = DM2.dsContasPagar
      ReadOnly = True
      TabOrder = 9
    end
    object dbeVLDESC: TDBEdit
      Left = 157
      Top = 325
      Width = 134
      Height = 21
      DataField = 'PAG_VALORDESCONTO'
      DataSource = DM2.dsContasPagar
      TabOrder = 11
      OnExit = dbeVLDESCExit
    end
    object dbeVLPAGO: TDBEdit
      Left = 16
      Top = 364
      Width = 134
      Height = 21
      DataField = 'PAG_VALORPAGO'
      DataSource = DM2.dsContasPagar
      TabOrder = 12
    end
    object dbeVLJURO: TDBEdit
      Left = 17
      Top = 325
      Width = 134
      Height = 21
      DataField = 'PAG_VALORJUROS'
      DataSource = DM2.dsContasPagar
      TabOrder = 10
      OnExit = dbeVLJUROExit
    end
    object dbeDTPAGA: TDBEdit
      Left = 157
      Top = 364
      Width = 134
      Height = 21
      DataField = 'PAG_DATAPAGAMENTO'
      DataSource = DM2.dsContasPagar
      TabOrder = 13
    end
    object cmbModalidade: TDBLookupComboBox
      Left = 320
      Top = 339
      Width = 134
      Height = 21
      DataField = 'PAG_NMMODA'
      DataSource = DM2.dsContasPagar
      TabOrder = 14
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 403
    Width = 560
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtCancelar: TBitBtn
      Left = 377
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
      Left = 460
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
  end
end
