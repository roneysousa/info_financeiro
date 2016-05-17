object frmParcelas: TfrmParcelas
  Left = 189
  Top = 153
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Parcelas'
  ClientHeight = 283
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 73
    Align = alTop
    TabOrder = 0
    TabStop = True
    object lbl_NMMODA: TLabel
      Left = 12
      Top = 46
      Width = 85
      Height = 22
      Caption = 'INFOG2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_VLTOTAL: TLabel
      Left = 483
      Top = 46
      Width = 38
      Height = 22
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblCodigo: TLabel
      Left = 12
      Top = 2
      Width = 44
      Height = 13
      Caption = 'Clien&te:'
      FocusControl = edtCDCLIE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object spLocCliente: TSpeedButton
      Left = 92
      Top = 17
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
    object lblNome: TLabel
      Left = 121
      Top = 2
      Width = 37
      Height = 13
      Caption = 'Nome:'
      FocusControl = edtNMCLIE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtCDCLIE: TEdit
      Left = 12
      Top = 17
      Width = 82
      Height = 21
      MaxLength = 7
      TabOrder = 0
      OnChange = edtCDCLIEChange
      OnExit = edtCDCLIEExit
      OnKeyPress = edtCDCLIEKeyPress
    end
    object edtNMCLIE: TEdit
      Left = 120
      Top = 17
      Width = 322
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 40
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 236
    Width = 582
    Height = 47
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    TabStop = True
    object BtCancelar: TBitBtn
      Left = 144
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
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
      Left = 491
      Top = 12
      Width = 75
      Height = 25
      Caption = '&OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtGravarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btClonar: TBitBtn
      Left = 394
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Clona&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btClonarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFA0756E7443427443427443427443427443427443427443
        42744342744342FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756EFFF8E5F7
        EDD9F7EBD5F4E9D1F4E9D0F4E7CFF6EAD0EEDDC4754443FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA0756EF7EDDCF2D9BFF2D7BBF0D5BAEFD4B5EED3B2EED9
        BFE5D0BA754443FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756EFAEFDEFC
        C591FCC591FCC591FCC591FCC591FCC591E3D1BC754443FF00FFFF00FFA0756E
        744342744342744342A0756EFCF4E7F6D9BAF7D7B6F6D4B5F6D4B2F4D1ADF0DC
        C2E6D3C081524CFF00FFFF00FFA0756EFFF8E5F7EDD9F7EBD5A0756EFEF6EBF8
        DABCF8D9B8F8D8B7F7D5B6F7D4B2F3DEC7E7D7C581524DFF00FFFF00FFA0756E
        F7EDDCF2D9BFF2D7BBA0756EFEFAF2FCC591FCC591FCC591FCC591FCC591FCC5
        91EBDDCF8F5F5AFF00FFFF00FFA0756EFAEFDEFCC591FCC591A0756EFFFCFAFC
        E3CCFBE0C7FADEC6F8DEC4FCE2C6FCF0DEE1D7CE8F5E59FF00FFFF00FFA0756E
        FCF4E7F6D9BAF7D7B6A0756EFFFFFFFEFFFFFBFBFBFAF8F7FAFAF6E5D5D0C6B1
        AFA793959E675AFF00FFFF00FFA0756EFEF6EBF8DABCF8D9B8A0756EFFFFFFFF
        FFFFFFFEFEFFFCF8FFFEFAA0756EA0756EA0756EA0756EFF00FFFF00FFA0756E
        FEFAF2FCC591FCC591A0756EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EE5A1
        54B6735DFF00FFFF00FFFF00FFA0756EFFFCFAFCE3CCFBE0C7A0756EA0756EA0
        756EA0756EA0756EA0756EA0756EAA6D68FF00FFFF00FFFF00FFFF00FFA0756E
        FFFFFFFEFFFFFBFBFBFAF8F7FAFAF6E5D5D0C6B1AFA793959E675AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFA0756EFFFFFFFFFFFFFFFEFEFFFCF8FFFEFAA0
        756EA0756EA0756EA0756EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756E
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EE5A154B6735DFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFA0756EA0756EA0756EA0756EA0756EA0756EA0
        756EAA6D68FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 582
    Height = 163
    Align = alClient
    TabOrder = 2
    object dbgridParcelas: TDBGrid
      Left = 1
      Top = 1
      Width = 580
      Height = 161
      Align = alClient
      DataSource = DM2.dsParcelas
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      OnColEnter = dbgridParcelasColEnter
      OnColExit = dbgridParcelasColExit
      OnEnter = dbgridParcelasEnter
      OnKeyDown = dbgridParcelasKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'PAR_NRPARCELA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'N'#186' PARCELA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'PAR_VENCIMENTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'DT. VENCIMENTO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR_VALOR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'VALOR PARCELA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR_BANCO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'BANCO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR_AGENCIA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'AGENCIA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR_CONTA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Title.Caption = 'N'#186' CONTA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR_CHEQUE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Title.Caption = 'CHEQUE'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 73
          Visible = True
        end>
    end
  end
end
