object frmCadEntrada: TfrmCadEntrada
  Left = 199
  Top = 116
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Entrada de Mercadoria'
  ClientHeight = 473
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 137
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 20
      Height = 13
      Caption = 'Loja'
      Transparent = True
    end
    object Label2: TLabel
      Left = 555
      Top = 88
      Width = 33
      Height = 13
      Caption = 'Pedido'
      Transparent = True
      Visible = False
    end
    object Label3: TLabel
      Left = 11
      Top = 48
      Width = 54
      Height = 13
      Caption = 'Fornecedor'
      Transparent = True
    end
    object Label4: TLabel
      Left = 11
      Top = 88
      Width = 59
      Height = 13
      Caption = 'Data Pedido'
      Transparent = True
    end
    object Label5: TLabel
      Left = 120
      Top = 88
      Width = 65
      Height = 13
      Caption = 'Data Emiss'#227'o'
      Transparent = True
    end
    object Label6: TLabel
      Left = 227
      Top = 88
      Width = 89
      Height = 13
      Caption = 'Data Recebimento'
      Transparent = True
    end
    object Label7: TLabel
      Left = 332
      Top = 88
      Width = 41
      Height = 13
      Caption = 'N'#186'. Nota'
      Transparent = True
    end
    object Label8: TLabel
      Left = 441
      Top = 88
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
      Transparent = True
    end
    object spFornecedor: TSpeedButton
      Left = 113
      Top = 64
      Width = 23
      Height = 22
      Hint = 'Localizar Fornecedor'
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
      OnClick = spFornecedorClick
    end
    object dbeNRPEDI: TEdit
      Left = 555
      Top = 104
      Width = 100
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Visible = False
    end
    object edtCDFORN: TEdit
      Left = 12
      Top = 64
      Width = 100
      Height = 21
      MaxLength = 5
      TabOrder = 2
      OnChange = edtCDFORNChange
      OnExit = edtCDFORNExit
      OnKeyPress = edtCDFORNKeyPress
    end
    object dbeNRNOTA: TMaskEdit
      Left = 333
      Top = 104
      Width = 100
      Height = 21
      TabOrder = 6
      OnExit = dbeNRNOTAExit
      OnKeyPress = dbeNRNOTAKeyPress
    end
    object dbeSERIE: TMaskEdit
      Left = 441
      Top = 104
      Width = 43
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 7
      OnExit = dbeSERIEExit
      OnKeyPress = dbeSERIEKeyPress
    end
    object cmbLoja: TComboBox
      Left = 12
      Top = 24
      Width = 301
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      OnEnter = cmbLojaEnter
      OnKeyPress = cmbLojaKeyPress
    end
    object GroupBox1: TGroupBox
      Left = 629
      Top = 8
      Width = 151
      Height = 57
      Caption = 'N'#186'. Pedido'
      TabOrder = 8
      object lbl_NRPEDIDO: TLabel
        Left = 22
        Top = 21
        Width = 110
        Height = 22
        Caption = '0000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object dbeDTPEDI: TDateEdit
      Left = 11
      Top = 104
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
      OnExit = dbeDTPEDIExit
      OnKeyPress = dbeDTPEDIKeyPress
    end
    object dbeDTEMISS: TDateEdit
      Left = 120
      Top = 104
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
      OnExit = dbeDTEMISSExit
      OnKeyPress = dbeDTEMISSKeyPress
    end
    object dbeDTRECE: TDateEdit
      Left = 227
      Top = 104
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 5
      OnExit = dbeDTRECEExit
      OnKeyPress = dbeDTRECEKeyPress
    end
    object lbl_NMFORN: TEdit
      Left = 144
      Top = 64
      Width = 291
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 137
    Width = 784
    Height = 187
    Align = alClient
    TabOrder = 1
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 782
      Height = 185
      TabStop = False
      Align = alClient
      Ctl3D = False
      DataSource = dsProdutos
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PRO_NOME'
          Title.Caption = 'PRODUTO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 288
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UNI_DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'UNIDADE'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ENP_QUANTIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'QUANTIDADE'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENP_VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENP_IPI'
          Title.Alignment = taCenter
          Title.Caption = 'IPI'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENP_ICMS'
          Title.Alignment = taCenter
          Title.Caption = 'ICMS'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENP_SUBTOTAL'
          Title.Caption = 'SUB-TOTAL'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 430
    Width = 784
    Height = 43
    Align = alBottom
    TabOrder = 4
    object pnlBotoes: TPanel
      Left = 1
      Top = 1
      Width = 782
      Height = 41
      Align = alBottom
      Color = clNavy
      TabOrder = 0
      object BtAdicionar: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Adicionar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BtAdicionarClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000220B0000220B00000001000000010000EFA54A00C684
          6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00CE9C7B00B584
          8400B58C8400CE9C8400B5948C00C6A59400EFCE9400F7CE9400C6A59C00EFCE
          9C00F7CE9C00F7D69C00C6ADA500CEADA500F7D6A500CEB5AD00D6B5AD00C6BD
          AD00F7D6AD00F7DEAD00D6BDB500DEBDB500DEC6B500E7C6B500EFC6B500EFCE
          B500F7D6B500F7DEB500FFDEB500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7
          C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
          DE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373709090909
          09090909090909090937373710302926231A16110E0E0E130937373710302C28
          26221611110E0E110937373714322E2C2826221A11110E110937373714332E2C
          292823221A11110E093737371736322E2E2C2826221A11110937373718383432
          2E2C2928261A1616093737371C383534312E2C292826221A093737371C383835
          34322E2C28262323093737371D3838383532312E2C282822093737371E383838
          3835323131302719093737371F383838383834342E0D0C0A093737371F383838
          383838362A0204000137373725383838383838382B070503373737371F353434
          343434342A070B37373737371F212121211F1F211C0637373737}
      end
      object BtCancelar: TBitBtn
        Left = 491
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
        TabOrder = 1
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
        Left = 578
        Top = 8
        Width = 99
        Height = 25
        Caption = '&Fechar Pedido'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BtGravarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          92635DA46769A46769A46769A46769A46769A46769A46769A46769A46769A467
          69A46769FF00FFFF00FFFF00FFFF00FF92635DFCF3DEFFEED5FFEED5FFEED5FF
          EED5FEEBD1FEEBD1FEEBD1FEEBD1F7EDD0A46769FF00FFFF00FFFF00FFFF00FF
          92635DF7EAD8FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82F2E2
          C7A46769FF00FFFF00FFFF00FFFF00FF92635DF8EFDEFAE9D5FAE7D4FAE7D3F8
          E6D1F8E6D0F8E6D0F8E6D0F8E6D0F0E2C9A46769FF00FFFF00FFFF00FFFF00FF
          92635DEAE2D4FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82E1D3
          BAA46769FF00FFFF00FFFF00FFFF00FF987468AA9F95A69A92A59991A5998EA4
          978BA39689A19587A19384A19183A49381986B65FF00FFFF00FF8C38168C3816
          8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
          168C38168C38168C38168C3816FF00FFA77568E0E9EAE17545E17545E17545E1
          7545E17545E17545E17545E17545D7D8CAA46769FF00FF8B35128C38158C3816
          8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
          168C38168C38168C3816FF00FFFF00FFB17E6BD7B09CD1AF9ED1AF9ECEAA97CC
          A995CCA793CBA591CAA590CAA38BD4A78CA46769FF00FFFF00FFFF00FFFF00FF
          BB846EFFFFFFFFE3C1FFE2C0FFE2BFFFE2BFFFE2BFFFE2BFFFE2BFFFE2BFFFFC
          EFA46769FF00FFFF00FFFF00FFFF00FFC58C70FFFFFFFEBD82FEBD82FEBD82FE
          BD82FEBD82FEBD82FEBD82FEBD82FBF6E9A46769FF00FFFF00FFFF00FFFF00FF
          CB9173FFFFFFFEFFFFFEFFFFFEFEFEFEFBFAFBFAF7FBF8F6FAF7F3F8F4F0FCFA
          F0A46769FF00FFFF00FFFF00FFFF00FFD49876FFFFFFFEBD82FEBD82FEBD82FE
          BD82FEBD82FEBD82FEBD82FEBD82FFFCF4A46769FF00FFFF00FFFF00FFFF00FF
          D49876FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFAFFFF
          FFA46769FF00FFFF00FFFF00FFFF00FFD49876CF8E68CF8E68CF8E68CF8E68CF
          8E68CF8E68CF8E68CF8E68CF8E68CF8E68A46769FF00FFFF00FF}
      end
      object BtSair: TBitBtn
        Left = 698
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
        TabOrder = 3
        OnClick = BtSairClick
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
  end
  object pnlProdutos: TPanel
    Left = 0
    Top = 324
    Width = 784
    Height = 67
    Align = alBottom
    TabOrder = 2
    object spProdutos: TSpeedButton
      Left = 127
      Top = 17
      Width = 23
      Height = 22
      Hint = 'Localizar Produto'
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
      OnClick = spProdutosClick
    end
    object Label10: TLabel
      Left = 6
      Top = 2
      Width = 62
      Height = 13
      Caption = '&PRODUTO'
      FocusControl = edtCDPROD
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label11: TLabel
      Left = 327
      Top = 2
      Width = 57
      Height = 13
      Caption = '&UNIDADE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 393
      Top = 2
      Width = 48
      Height = 13
      Caption = '&QUANT.'
      FocusControl = edtQUANT
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 512
      Top = 2
      Width = 42
      Height = 13
      Caption = '&VALOR'
      FocusControl = edtValor
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 594
      Top = 2
      Width = 17
      Height = 13
      Caption = '&IPI'
      FocusControl = edtIPI
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label15: TLabel
      Left = 643
      Top = 2
      Width = 31
      Height = 13
      Caption = 'I&CMS'
      FocusControl = edtICMS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label16: TLabel
      Left = 708
      Top = 2
      Width = 70
      Height = 13
      Caption = '&SUB-TOTAL'
      FocusControl = edtSubTotal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_lotes: TLabel
      Left = 226
      Top = 2
      Width = 96
      Height = 13
      Caption = '&LOTE OU S'#201'RIE'
      FocusControl = edtNRLOTE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtCDPROD: TEdit
      Left = 5
      Top = 17
      Width = 121
      Height = 21
      MaxLength = 13
      TabOrder = 0
      OnChange = edtCDPRODChange
      OnEnter = edtCDPRODEnter
      OnExit = edtCDPRODExit
      OnKeyPress = edtCDPRODKeyPress
    end
    object edtQUANT: TCurrencyEdit
      Left = 391
      Top = 17
      Width = 60
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = ',0.000'
      TabOrder = 4
      OnExit = edtQUANTExit
      OnKeyPress = edtQUANTKeyPress
    end
    object edtValor: TCurrencyEdit
      Left = 455
      Top = 17
      Width = 99
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 5
      OnExit = edtValorExit
      OnKeyPress = edtValorKeyPress
    end
    object edtIPI: TCurrencyEdit
      Left = 558
      Top = 17
      Width = 55
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 6
      OnKeyPress = edtIPIKeyPress
    end
    object edtICMS: TCurrencyEdit
      Left = 617
      Top = 17
      Width = 55
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 7
      OnKeyPress = edtICMSKeyPress
    end
    object edtSubTotal: TCurrencyEdit
      Left = 675
      Top = 17
      Width = 103
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 8
      OnExit = edtSubTotalExit
      OnKeyPress = edtSubTotalKeyPress
    end
    object cmbUNIDADE: TComboBox
      Left = 328
      Top = 17
      Width = 60
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
      OnEnter = cmbUNIDADEEnter
      OnKeyPress = cmbUNIDADEKeyPress
    end
    object edtNRLOTE: TEdit
      Left = 225
      Top = 17
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 1
    end
    object edtDTVENC: TDateEdit
      Left = 225
      Top = 42
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      OnExit = edtDTVENCExit
    end
    object lbl_NMPROD: TEdit
      Left = 5
      Top = 42
      Width = 217
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
  end
  object pnlTotal: TPanel
    Left = 0
    Top = 391
    Width = 784
    Height = 39
    Align = alBottom
    TabOrder = 3
    object Label9: TLabel
      Left = 430
      Top = 13
      Width = 95
      Height = 13
      Caption = 'Total do Pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Gradiente2: TGradiente
      Left = 520
      Top = 1
      Width = 263
      Height = 37
      Direccion = dVertical
      ColorDesde = clBtnFace
      ColorHasta = clBtnFace
      Align = alRight
    end
    object lbl_TOTAL: TRxLabel
      Left = 710
      Top = -2
      Width = 69
      Height = 41
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -35
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clBlack
      ShadowPos = spRightBottom
      Transparent = True
    end
  end
  object dsProdutos: TDataSource
    DataSet = DM2.cdsProdutos
    Left = 488
    Top = 16
  end
  object qryLoja: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS'
      'order by EMP_FANTASIA')
    SQLConnection = Dm.SqlAdmin
    Left = 536
    Top = 16
    object qryLojaEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
    end
    object qryLojaEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object qryLojaEMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      Size = 50
    end
  end
  object cdsLoja: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from EMPRESAS'
    Params = <>
    ProviderName = 'dm2.dspPadrao'
    Left = 600
    Top = 48
  end
end
