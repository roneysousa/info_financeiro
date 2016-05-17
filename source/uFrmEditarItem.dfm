object frmEditarItem: TfrmEditarItem
  Left = 192
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Alterar Item'
  ClientHeight = 195
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 154
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 46
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      Transparent = True
    end
    object Label3: TLabel
      Left = 16
      Top = 85
      Width = 16
      Height = 13
      Caption = 'Cor'
      Transparent = True
    end
    object Label4: TLabel
      Left = 193
      Top = 85
      Width = 55
      Height = 13
      Caption = 'Quantidade'
      Transparent = True
    end
    object Label5: TLabel
      Left = 254
      Top = 85
      Width = 46
      Height = 13
      Caption = 'Desconto'
      Transparent = True
    end
    object Label14: TLabel
      Left = 309
      Top = 104
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
      Left = 365
      Top = 84
      Width = 49
      Height = 13
      Caption = 'Sub-Total:'
      Transparent = True
    end
    object Label13: TLabel
      Left = 120
      Top = 83
      Width = 66
      Height = 13
      Caption = 'Valor Unit'#225'rio:'
      FocusControl = edtQUANT
      Transparent = True
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 22
      Width = 186
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'ITE_REFERE'
      DataSource = dmConsultas.dsItemVendas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 62
      Width = 398
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'ITE_NMDESC'
      DataSource = dmConsultas.dsItemVendas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtCDCOR: TDBEdit
      Left = 16
      Top = 99
      Width = 52
      Height = 21
      DataField = 'ITE_CODCOR'
      DataSource = dmConsultas.dsItemVendas
      MaxLength = 4
      TabOrder = 2
      OnChange = edtCDCORChange
      OnKeyPress = edtCDCORKeyPress
    end
    object edtQUANT: TDBEdit
      Left = 193
      Top = 99
      Width = 57
      Height = 21
      DataField = 'ITE_QTITEN'
      DataSource = dmConsultas.dsItemVendas
      MaxLength = 8
      TabOrder = 3
      OnExit = edtQUANTExit
      OnKeyPress = edtQUANTKeyPress
    end
    object edtDesconto: TDBEdit
      Left = 255
      Top = 99
      Width = 51
      Height = 21
      DataField = 'ITE_VLDESC'
      DataSource = dmConsultas.dsItemVendas
      MaxLength = 5
      TabOrder = 4
      OnExit = edtDescontoExit
      OnKeyPress = edtDescontoKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 323
      Top = 99
      Width = 91
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'ITE_VLSUBT'
      DataSource = dmConsultas.dsItemVendas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit3: TDBEdit
      Left = 97
      Top = 99
      Width = 91
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'ITE_VLUNIT'
      DataSource = dmConsultas.dsItemVendas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      OnKeyPress = edtCDCORKeyPress
    end
    object edtNMCOR: TDBEdit
      Left = 16
      Top = 123
      Width = 172
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'ITE_NOMCOR'
      DataSource = dmConsultas.dsItemVendas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      OnChange = edtCDCORChange
      OnKeyPress = edtCDCORKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 154
    Width = 437
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object btnConfirma: TBitBtn
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = btnConfirmaClick
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
    object btnFechar: TBitBtn
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnFecharClick
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
  end
end
