object frmCadPedidos: TfrmCadPedidos
  Left = 186
  Top = 122
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedido'
  ClientHeight = 516
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 217
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 11
      Top = 4
      Width = 609
      Height = 169
      Caption = '[ Cliente ]'
      TabOrder = 0
      object Label2: TLabel
        Left = 10
        Top = 25
        Width = 39
        Height = 13
        Caption = '&C'#243'digo :'
        FocusControl = edtCDCLIE
        Transparent = True
      end
      object spLocCliente: TSpeedButton
        Left = 109
        Top = 40
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
      object Label6: TLabel
        Left = 140
        Top = 25
        Width = 31
        Height = 13
        Caption = '&Nome:'
        FocusControl = edtNMCLIE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label3: TLabel
        Left = 11
        Top = 62
        Width = 49
        Height = 13
        Caption = 'Endere'#231'o:'
        Transparent = True
      end
      object Label4: TLabel
        Left = 11
        Top = 98
        Width = 30
        Height = 13
        Caption = 'Bairro:'
        Transparent = True
      end
      object Label5: TLabel
        Left = 291
        Top = 98
        Width = 36
        Height = 13
        Caption = 'Cidade:'
        Transparent = True
      end
      object Label7: TLabel
        Left = 341
        Top = 62
        Width = 40
        Height = 13
        Caption = 'N'#250'mero:'
      end
      object Label19: TLabel
        Left = 467
        Top = 25
        Width = 30
        Height = 13
        Caption = 'CNPJ:'
        FocusControl = edtNMCLIE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label20: TLabel
        Left = 466
        Top = 62
        Width = 90
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual:'
      end
      object Label21: TLabel
        Left = 486
        Top = 98
        Width = 22
        Height = 13
        Caption = 'Cep:'
      end
      object edtCDCLIE: TEdit
        Left = 11
        Top = 41
        Width = 97
        Height = 21
        MaxLength = 7
        TabOrder = 0
        OnChange = edtCDCLIEChange
        OnEnter = edtCDCLIEEnter
        OnExit = edtCDCLIEExit
        OnKeyPress = edtCDCLIEKeyPress
      end
      object edtNMCLIE: TEdit
        Left = 139
        Top = 41
        Width = 322
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 40
        ReadOnly = True
        TabOrder = 1
      end
      object edtENDER: TEdit
        Left = 11
        Top = 76
        Width = 322
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 3
      end
      object edtNumero: TEdit
        Left = 341
        Top = 76
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object edtBairro: TEdit
        Left = 11
        Top = 114
        Width = 270
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 6
      end
      object edtCidade: TEdit
        Left = 291
        Top = 114
        Width = 187
        Height = 21
        ReadOnly = True
        TabOrder = 7
      end
      object btCompras: TBitBtn
        Left = 484
        Top = 138
        Width = 112
        Height = 25
        Hint = #218'ltimos pedidos do cliente'
        Caption = '&Ultimos Pedidos'
        TabOrder = 8
        OnClick = btComprasClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF011FBCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF0084DC0084DC0314BFFF00FFFF00FF8C3816
          8C38168C38168C38168C38168C38168C38168C38168C38168C38168B4C3BD07E
          6E0084DC203B6B63280FFF00FF8C3816F8F3EBF7F0E6F6EEE2F6EBDEF3E9D9F3
          E6D5F0E3D1F0E2CC8B6763CF9292CA868472504F45798857230DFF00FF8C3816
          FAF6EEFAF3EAF8F0E6F6EDE1F4EADDF3E7D9F3E6D4835C58D39595C787877E4D
          4D7E675B9288787930131C1C1C1C1C1C1C1C1CC5C2BBF8F2E9F6F0E5B6B0A6B5
          ADA45D5759D58E8BCA89897E4D4C63514B968B7BCCBFA98C3816919191919191
          919191C5C2BFF8F4EDF7F2E7B7B1A999A6A6095377635B65834C4A8170686F69
          5FD4C6B2EEDCC58C3816FF00FF8C3816FCFAF7FBF8F4FBF7F0FAF3EBB7B4AC0F
          242C03537D14465D837872A1998EA39A8EEEE1CAEEDEC68C38161C1C1C1C1C1C
          1C1C1CC7C5C2FBF8F3B8B6B1B8B4AD0B11132A4A575F6868ABA499A79F95B2AA
          9DB1A799EEE0C98C3816919191919191919191C9C7C5FCFAF6FBF7F2B8B6B0F8
          F2EAF7EFE6F6EEE2F4EBDDF3E9D8B4AC9EF0E3D0EFE1CC8C3816FF00FF8C3816
          FFFEFEFEFCFBFCFBF8FBF8F6BAB7B2FAF4EEF8F2E9B7B2AAF6EEE1F4EBDCB4AC
          A1F2E6D4F0E3D08C38161C1C1C1C1C1C1C1C1CC9C9C9FEFCFBFEFBF8BBB8B5BA
          B7B2B8B5B0B7B4ACB7B1A9B6B0A6B5AFA4F3E9D8F2E5D48C3816919191919191
          919191CACACAFFFEFCFEFCFAFCFAF7FBF8F4FBF6F0B8B4AFF8F2E7F7EFE3F4ED
          E0F3EADAF3E7D78C3816FF00FF8C3816FFFFFFFFFFFFFFFFFFFEFEFCFEFCFAFC
          FAF6FBF8F3FBF6EFFAF3EBF8F2E7F6EFE2F4EBDEF4E9D98C3816FF00FF8C3816
          8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
          168C38168C38168C3816FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object edtCNPJ: TEdit
        Left = 466
        Top = 40
        Width = 130
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtIncricao: TEdit
        Left = 466
        Top = 76
        Width = 130
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtCep: TEdit
        Left = 485
        Top = 114
        Width = 110
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 9
      end
    end
    object GroupBox3: TGroupBox
      Left = 626
      Top = 4
      Width = 173
      Height = 69
      TabOrder = 1
      object lbl_Pedido: TEdit
        Left = 8
        Top = 17
        Width = 121
        Height = 24
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '0000000'
        OnClick = lbl_PedidoClick
        OnKeyPress = lbl_PedidoKeyPress
      end
      object rbtPedido: TRadioButton
        Left = 8
        Top = 48
        Width = 58
        Height = 17
        Caption = '&Pedido'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = rbtPedidoClick
      end
      object rbtOrcamento: TRadioButton
        Left = 79
        Top = 48
        Width = 79
        Height = 17
        Caption = '&Orcamento'
        TabOrder = 2
        OnClick = rbtOrcamentoClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 11
      Top = 173
      Width = 609
      Height = 40
      Caption = '[ Frete/Transportadora ]'
      TabOrder = 3
      object Label23: TLabel
        Left = 512
        Top = 14
        Width = 10
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rbCif: TRadioButton
        Left = 10
        Top = 16
        Width = 52
        Height = 17
        Caption = 'CIF'
        TabOrder = 0
      end
      object rbFOB: TRadioButton
        Left = 68
        Top = 16
        Width = 51
        Height = 17
        Caption = 'FOB'
        TabOrder = 1
      end
      object cmbTransportadora: TComboBox
        Left = 154
        Top = 12
        Width = 255
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 2
        OnExit = cmbTransportadoraExit
      end
      object edtPercFrete: TCurrencyEdit
        Left = 424
        Top = 11
        Width = 85
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00;-,0.00'
        MaxLength = 8
        MaxValue = 100.000000000000000000
        TabOrder = 3
      end
    end
    object GroupBox5: TGroupBox
      Left = 626
      Top = 72
      Width = 173
      Height = 142
      TabOrder = 2
      object Label1: TLabel
        Left = 9
        Top = 10
        Width = 104
        Height = 13
        Caption = 'Forma de Pagamento:'
        Transparent = True
      end
      object Label16: TLabel
        Left = 9
        Top = 55
        Width = 36
        Height = 13
        Caption = 'Tabela:'
        Transparent = True
      end
      object Label24: TLabel
        Left = 9
        Top = 95
        Width = 87
        Height = 13
        Caption = 'Plano Pagamento:'
      end
      object cmbPagamento: TComboBox
        Left = 9
        Top = 27
        Width = 160
        Height = 22
        Hint = 'Selecione forma de pagamento'
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
      end
      object cmbTabela: TComboBox
        Left = 9
        Top = 70
        Width = 160
        Height = 22
        Hint = 'Selecione tabela de pre'#231'os'
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 1
      end
      object cmbPlano: TComboBox
        Left = 9
        Top = 112
        Width = 160
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 2
      end
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 239
    Width = 748
    Height = 165
    Align = alClient
    TabOrder = 1
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 746
      Height = 85
      TabStop = False
      Align = alClient
      Ctl3D = False
      DataSource = dsItensVenda
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grdConsultarDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ITE_NRITEN'
          Title.Alignment = taRightJustify
          Title.Caption = 'Item'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITE_CDITEN'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITE_NMDESC'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 254
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITE_NOMCOR'
          Title.Caption = 'Cor'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITE_REFERE'
          Title.Caption = 'Refer'#234'ncia'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITE_VLUNIT'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vl.Unit'#225'rio'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 73
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ITE_QTITEN'
          Title.Alignment = taCenter
          Title.Caption = 'Quant.'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITE_VLSUBT'
          Title.Alignment = taRightJustify
          Title.Caption = 'Sub-Total'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITE_VALIPI'
          Title.Alignment = taRightJustify
          Title.Caption = 'IPI %'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITE_VLDESC'
          Title.Caption = 'Desc.%'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 1
      Top = 86
      Width = 746
      Height = 78
      Align = alBottom
      TabOrder = 1
      object Label25: TLabel
        Left = 4
        Top = 2
        Width = 61
        Height = 13
        Caption = 'Observa'#231#227'o:'
      end
      object lblItens: TLabel
        Left = 92
        Top = 2
        Width = 13
        Height = 13
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 396
        Top = 4
        Width = 69
        Height = 13
        Caption = 'Ref. Comercial'
      end
      object Label27: TLabel
        Left = 612
        Top = 4
        Width = 65
        Height = 13
        Caption = 'Ref. Bancario'
      end
      object Panel4: TPanel
        Left = 1
        Top = 18
        Width = 744
        Height = 59
        Align = alBottom
        Caption = 'Panel4'
        TabOrder = 0
        object mmoObs: TMemo
          Left = 1
          Top = 1
          Width = 339
          Height = 57
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object mnoObs2: TMemo
          Left = 340
          Top = 1
          Width = 218
          Height = 57
          Align = alRight
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object mnoObs3: TMemo
          Left = 558
          Top = 1
          Width = 185
          Height = 57
          Align = alRight
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 404
    Width = 748
    Height = 71
    Align = alBottom
    TabOrder = 2
    object Label11: TLabel
      Left = 8
      Top = 4
      Width = 76
      Height = 13
      Caption = 'C'#243'digo Pro&duto:'
      FocusControl = edtCDPROD
      Transparent = True
    end
    object spLocProdutos: TSpeedButton
      Left = 131
      Top = 20
      Width = 23
      Height = 22
      Hint = 'Localizar produto'
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
      OnClick = spLocProdutosClick
    end
    object Label12: TLabel
      Left = 232
      Top = 4
      Width = 58
      Height = 13
      Caption = '&Quantidade:'
      FocusControl = edtQUANT
      Transparent = True
    end
    object Label13: TLabel
      Left = 159
      Top = 4
      Width = 66
      Height = 13
      Caption = 'Valor Unit'#225'rio:'
      FocusControl = edtQUANT
      Transparent = True
    end
    object Label17: TLabel
      Left = 361
      Top = 5
      Width = 49
      Height = 13
      Caption = '&Desconto:'
      Transparent = True
    end
    object Label14: TLabel
      Left = 413
      Top = 24
      Width = 10
      Height = 13
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label18: TLabel
      Left = 426
      Top = 4
      Width = 49
      Height = 13
      Caption = 'Sub-Total:'
      FocusControl = edtQUANT
      Transparent = True
    end
    object Label22: TLabel
      Left = 309
      Top = 5
      Width = 19
      Height = 13
      Caption = 'Cor:'
      FocusControl = edtCDCOR
      Transparent = True
    end
    object edtTOTAL: TPanel
      Left = 512
      Top = 8
      Width = 280
      Height = 56
      Alignment = taRightJustify
      BorderStyle = bsSingle
      Caption = '0,00'
      Color = clRed
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -35
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtCDPROD: TEdit
      Left = 8
      Top = 20
      Width = 121
      Height = 21
      Hint = 'Digite o c'#243'digo do produto'
      CharCase = ecUpperCase
      MaxLength = 13
      TabOrder = 0
      OnChange = edtCDPRODChange
      OnEnter = edtCDPRODEnter
      OnExit = edtCDPRODExit
      OnKeyPress = edtCDPRODKeyPress
    end
    object edtQUANT: TCurrencyEdit
      Left = 232
      Top = 20
      Width = 70
      Height = 21
      Hint = 'Digite a quantidade do produto'
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = ',0.00;-,0.00'
      MaxLength = 8
      TabOrder = 2
      OnChange = edtQUANTChange
      OnExit = edtQUANTExit
      OnKeyPress = edtQUANTKeyPress
    end
    object edtVLUNIT: TCurrencyEdit
      Left = 159
      Top = 20
      Width = 70
      Height = 21
      AutoSize = False
      Color = clWhite
      DisplayFormat = ',0.00;-,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnExit = edtVLUNITExit
      OnKeyPress = edtVLUNITKeyPress
    end
    object edtDesconto: TCurrencyEdit
      Left = 361
      Top = 20
      Width = 52
      Height = 21
      Hint = 'Digite o percentual de desconto'
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 4
      OnChange = edtDescontoChange
      OnExit = edtDescontoExit
      OnKeyPress = edtDescontoKeyPress
    end
    object edtVLSUBT: TCurrencyEdit
      Left = 426
      Top = 20
      Width = 80
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clSilver
      DisplayFormat = ',0.00;-,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object lbl_NMPROD: TEdit
      Left = 8
      Top = 43
      Width = 344
      Height = 21
      Hint = 'Descri'#231#227'o do produto'
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
      TabOrder = 7
    end
    object edtCDCOR: TEdit
      Left = 308
      Top = 20
      Width = 49
      Height = 21
      Hint = 'Digite o c'#243'digo da cor'
      MaxLength = 3
      TabOrder = 3
      OnChange = edtCDCORChange
      OnExit = edtCDCORExit
      OnKeyPress = edtCDCORKeyPress
    end
    object edtNMCOR: TEdit
      Left = 357
      Top = 43
      Width = 150
      Height = 21
      Hint = 'Cor do produto'
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
      TabOrder = 8
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 475
    Width = 748
    Height = 41
    Align = alBottom
    TabOrder = 3
    object BtExcluir: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Excluir item'
      Caption = 'E&xcluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtExcluirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E0000000100000001000031319C003131
        A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
        E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
        FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
        FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
        0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
        0E0E0E0E0E0E0B08031B1B0A0E0E0E0E0E0E0E0E0E0E0E09041B1B0E0E0E0E0E
        0E0E0E0E0E0E0E0A051B1B0E0E1818181818181818180B0A061B1B0E0E1B1B1B
        1B1B1B1B1B1B0A0A061B1B0E10100E0E0E0E0E0E0E0B0A0A061B1B0E1313100E
        0E0E0E0E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
        11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
        0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
    end
    object BtCancelar: TBitBtn
      Left = 624
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Cancelar pedido'
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtCancelarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
        840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
        C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
        F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
        FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
        1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
        0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F1F1D
        111111111D1F0A08031F1F0A0E11131F1D11111D1F0E0B09041F1F0C11131111
        1F1D1D1F110E0B0A051F1F0E13111111111F1D110F0C0A0A061F1F0F13131111
        1D1F1F1D0E0B0A0A061F1F131515131D1F100F1F1D0A0A0A061F1F1318181D1F
        13130F0E1F1D0A0A061F1F151A191F151514110F0E1F0A0A061F1F181C1A1817
        16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
        1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
    end
    object BtGravar: TBitBtn
      Left = 712
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Gravar pedido'
      Caption = '&Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtGravarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
        840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
        C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
        F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
        FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
        1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
        0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F0F0F
        1D111111110E0A08031F1F0A0E11131D1F1D1111110E0B09041F1F0C11131D1F
        1D1F1D11110E0B0A051F1F0E131D1F1D11111F1D0F0C0A0A061F1F0F13131D11
        1111111F1D0B0A0A061F1F131515131311100F0F1F1D0A0A061F1F1318181514
        13130F0E0C1F1D0A061F1F151A1916151514110F0E0C1F0A061F1F181C1A1817
        16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
        1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
    end
    object bntEditar: TBitBtn
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Alterar Item'
      Caption = 'Editar'
      TabOrder = 3
      OnClick = bntEditarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E0000000100000001000031319C003131
        A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
        E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
        FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
        FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
        0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
        0E0E0E0E0E0E0B08031B1B0A0E1818181818181818181809041B1B0E0E181B1B
        1B1B1B1B1B1B180A051B1B0E0E0E181B1B1B1B1B1B180B0A061B1B0E0E0E0E18
        1B1B1B1B180B0A0A061B1B0E10100E0E181B1B180E0B0A0A061B1B0E1313100E
        0E18180E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
        11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
        0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
    end
    object bntConsulta: TBitBtn
      Left = 288
      Top = 8
      Width = 120
      Height = 25
      Caption = 'Consulta Pedidos'
      TabOrder = 4
      OnClick = bntConsultaClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183FF00FFFF00FFFF00FF636E7BFEEED4F7E3C5F6DFBCF5DBB4F3
        D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FF5E98C7
        3489D07F859DF6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
        97F3D199B78183FF00FFFF00FFFF00FF4BB6FF288BE0858498F5E3CBF5DFC3F3
        DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC97F3D199B78183FF00FFFF00FFFF00FF
        B481764DB5FF278BDE79819AF6E3CAF5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
        99F3D198B78183FF00FFFF00FFFF00FFBA8E85FFFCF44CB9FF5A91BFA48179BE
        978EAC7E79BE9589D6B49BF1D3AAF0D0A1F3D29BB78183FF00FFFF00FFFF00FF
        BA8E85FFFFFDFBF4ECBFA19FC7A59CE1C9B8F2DFC6E0C3ADC59F90D7B49BF0D4
        A9F5D5A3B78183FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5C09C97E3CEC4F9
        EADAF8E7D2FFFFF7E0C2ADBE9589F2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
        CB9A82FFFFFFFFFEFDAC7F7BF8EEE7F9EFE3F8EADAFFFFF0F3DEC7AC7E79F4DB
        B9F8DDB4B78183FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFC19F9CE6D6D1FB
        F3EBFAEFE2FFFFDEE2C8B8BE978DF7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
        DCA887FFFFFFFFFFFFDFCDCBC9ACA9E6D6D1F8EEE6E3CEC4C7A59CC3A394E6D9
        C4C6BCA9B78183FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFDFCDCBC1
        9F9CAC7F7BC09D97D6BAB1B8857AB8857AB8857AB78183FF00FFFF00FFFF00FF
        E3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B8857AE8B2
        70ECA54AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE4D4D2B8857AFAC577CD9377FF00FFFF00FFFF00FFFF00FF
        EDBD92FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B
        86FF00FFFF00FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887DC
        A887DCA887DCA887DCA887B8857AFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object JvRollOut1: TJvRollOut
    Left = 0
    Top = 217
    Width = 748
    Height = 22
    Align = alTop
    Caption = '<< Filtro >>'
    Collapsed = True
    TabOrder = 4
    FAWidth = 145
    FAHeight = 87
    FCWidth = 22
    FCHeight = 22
    object GroupBox2: TGroupBox
      Left = 5
      Top = 23
      Width = 783
      Height = 61
      TabOrder = 0
      object Label8: TLabel
        Left = 10
        Top = 14
        Width = 54
        Height = 13
        Caption = 'Fornecedor'
        Transparent = True
      end
      object Label9: TLabel
        Left = 387
        Top = 14
        Width = 31
        Height = 13
        Caption = 'Se'#231#227'o'
        Transparent = True
      end
      object Label10: TLabel
        Left = 585
        Top = 14
        Width = 48
        Height = 13
        Caption = 'Subse'#231#227'o'
        Transparent = True
      end
      object Label15: TLabel
        Left = 192
        Top = 14
        Width = 52
        Height = 13
        Caption = 'Refer'#234'ncia'
        Transparent = True
      end
      object cmbFornecedor: TComboBox
        Left = 10
        Top = 28
        Width = 160
        Height = 22
        Hint = 'Selecione o fornecedor'
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        OnEnter = cmbFornecedorEnter
      end
      object cmbSecao: TComboBox
        Left = 387
        Top = 28
        Width = 160
        Height = 22
        Hint = 'Selecione a se'#231#227'o'
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 2
        OnEnter = cmbSecaoEnter
      end
      object cmbSubSecao: TComboBox
        Left = 585
        Top = 28
        Width = 160
        Height = 22
        Hint = 'Selecione sub-se'#231#227'o'
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 3
        OnEnter = cmbSubSecaoEnter
      end
      object cmbReferencia: TComboBox
        Left = 192
        Top = 28
        Width = 160
        Height = 22
        Hint = 'Selecione o fornecedor'
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 1
        OnEnter = cmbReferenciaEnter
      end
    end
  end
  object dsItensVenda: TDataSource
    DataSet = dmConsultas.cdsItensVendas
    OnDataChange = dsItensVendaDataChange
    Left = 568
    Top = 100
  end
  object qryProdutos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'pBARRAS'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO, PRO_FRACAO,'
      'PRO_VLVENDA, TRI_CODIGO, PRO_LIMDESCONTO, UNI_CODIGO, '
      'UNI_ARMAZENAMENTO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_IPI,'
      'PRO_CODIGOBAIXA, PRO_REFERENCIA from PRODUTOS '
      'Where (PRO_CODIGO = :pCODIGO) or (PRO_BARRAS = :pBARRAS)')
    SQLConnection = Dm.SqlAdmin
    Left = 312
    Top = 32
    object qryProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object qryProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      FixedChar = True
      Size = 13
    end
    object qryProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object qryProdutosPRO_FRACAO: TIntegerField
      FieldName = 'PRO_FRACAO'
    end
    object qryProdutosPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      Precision = 15
      Size = 2
    end
    object qryProdutosTRI_CODIGO: TIntegerField
      FieldName = 'TRI_CODIGO'
    end
    object qryProdutosUNI_CODIGO: TStringField
      FieldName = 'UNI_CODIGO'
      FixedChar = True
      Size = 2
    end
    object qryProdutosUNI_ARMAZENAMENTO: TStringField
      FieldName = 'UNI_ARMAZENAMENTO'
      FixedChar = True
      Size = 2
    end
    object qryProdutosPRO_VLCOMPRA: TFMTBCDField
      FieldName = 'PRO_VLCOMPRA'
      Precision = 15
      Size = 2
    end
    object qryProdutosPRO_VLCUSTO: TFMTBCDField
      FieldName = 'PRO_VLCUSTO'
      Precision = 15
      Size = 2
    end
    object qryProdutosPRO_CODIGOBAIXA: TStringField
      FieldName = 'PRO_CODIGOBAIXA'
      FixedChar = True
      Size = 13
    end
    object qryProdutosPRO_IPI: TFMTBCDField
      FieldName = 'PRO_IPI'
      Precision = 15
      Size = 2
    end
    object qryProdutosPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      Size = 14
    end
    object qryProdutosPRO_LIMDESCONTO: TBCDField
      FieldName = 'PRO_LIMDESCONTO'
      Precision = 9
      Size = 2
    end
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 32
    object PDV1: TMenuItem
      Caption = '&ECF'
      Visible = False
      object mnuLeituraXItem: TMenuItem
        Caption = '&Leitura X'
        OnClick = mnuLeituraXItemClick
      end
      object mnuReducaoZItem: TMenuItem
        Caption = 'Redu'#231#227'o Z'
        OnClick = mnuReducaoZItemClick
      end
      object mnuCancelarltimoCupomItem: TMenuItem
        Caption = 'Cancelar '#218'l&timo Cupom'
        OnClick = mnuCancelarltimoCupomItemClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuCancelarItemAnterior: TMenuItem
        Caption = '&Cancelar Item Anterior'
        ShortCut = 116
        OnClick = mnuCancelarItemAnteriorClick
      end
      object mnuItemGenericoItem: TMenuItem
        Caption = 'Cancelar Item Generico...'
        ShortCut = 117
        OnClick = mnuItemGenericoItemClick
      end
      object mnuCancelarmentodeCupomItem: TMenuItem
        Caption = 'Cancelarmento de &Cupom'
        ShortCut = 118
        OnClick = mnuCancelarmentodeCupomItemClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuMemoriaFiscalItem: TMenuItem
        Caption = '&Memoria Fiscal...'
        OnClick = mnuMemoriaFiscalItemClick
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 363
    Top = 148
    object mnuClientesItem: TMenuItem
      Caption = 'Clientes...'
      OnClick = mnuClientesItemClick
    end
    object mnuProdutosItem: TMenuItem
      Caption = 'Produtos...'
      OnClick = mnuProdutosItemClick
    end
    object mnuFornecedoresItem: TMenuItem
      Caption = 'Fornecedores...'
      OnClick = mnuFornecedoresItemClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuCoresItem: TMenuItem
      Caption = 'Cores...'
      OnClick = mnuCoresItemClick
    end
    object mnuTransportadoraItem: TMenuItem
      Caption = 'Transportadora...'
      OnClick = mnuTransportadoraItemClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnuFormadePagamentoItem: TMenuItem
      Caption = 'Forma de Pagamento'
      OnClick = mnuFormadePagamentoItemClick
    end
    object mnuTabeladePrecosItem: TMenuItem
      Caption = 'Tabela de Pre'#231'os'
      OnClick = mnuTabeladePrecosItemClick
    end
    object mnuPlanodePagamentoItem: TMenuItem
      Caption = 'Plano de Pagamento'
      OnClick = mnuPlanodePagamentoItemClick
    end
  end
end
