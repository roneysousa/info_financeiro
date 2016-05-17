object frmTeleEntrega: TfrmTeleEntrega
  Left = 222
  Top = 188
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados da Tele-Entrega'
  ClientHeight = 318
  ClientWidth = 493
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 277
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Telefone:'
      Transparent = True
    end
    object sbLocProduto: TSpeedButton
      Left = 82
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Localiza cliente'
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
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
      Transparent = True
    end
    object Label3: TLabel
      Left = 17
      Top = 105
      Width = 64
      Height = 13
      Caption = 'Complemento'
      Transparent = True
    end
    object Label4: TLabel
      Left = 17
      Top = 145
      Width = 27
      Height = 13
      Caption = 'Bairro'
      Transparent = True
    end
    object Label5: TLabel
      Left = 17
      Top = 185
      Width = 33
      Height = 13
      Caption = 'Cidade'
      Transparent = True
    end
    object Label7: TLabel
      Left = 17
      Top = 225
      Width = 98
      Height = 13
      Caption = 'Ponto de Refer'#234'ncia'
      Transparent = True
    end
    object Label6: TLabel
      Left = 116
      Top = 18
      Width = 78
      Height = 13
      Caption = 'Nome do Cliente'
      Transparent = True
    end
    object Label8: TLabel
      Left = 395
      Top = 64
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label9: TLabel
      Left = 395
      Top = 185
      Width = 14
      Height = 13
      Caption = 'UF'
      Transparent = True
    end
    object edtTelefone: TMaskEdit
      Left = 42
      Top = 32
      Width = 66
      Height = 21
      EditMask = '9999-9999;0;_'
      MaxLength = 9
      TabOrder = 1
      OnChange = edtTelefoneChange
      OnExit = edtTelefoneExit
      OnKeyPress = edtTelefoneKeyPress
    end
    object edtNome: TEdit
      Left = 116
      Top = 32
      Width = 351
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnKeyPress = edtNomeKeyPress
    end
    object edtEndereco: TEdit
      Left = 16
      Top = 81
      Width = 370
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 3
      OnKeyPress = edtEnderecoKeyPress
    end
    object edtNumero: TEdit
      Left = 395
      Top = 81
      Width = 72
      Height = 21
      TabOrder = 4
      OnKeyPress = edtNumeroKeyPress
    end
    object edtComplemento: TEdit
      Left = 17
      Top = 122
      Width = 449
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
      OnKeyPress = edtComplementoKeyPress
    end
    object edtBairro: TEdit
      Left = 17
      Top = 162
      Width = 449
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
      OnKeyPress = edtBairroKeyPress
    end
    object edtCidade: TEdit
      Left = 17
      Top = 202
      Width = 370
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 7
      OnExit = edtCidadeExit
      OnKeyPress = edtCidadeKeyPress
    end
    object edtReferencia: TEdit
      Left = 17
      Top = 242
      Width = 449
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 9
      OnKeyPress = edtReferenciaKeyPress
    end
    object edtUF: TEdit
      Left = 395
      Top = 201
      Width = 72
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 8
      OnKeyPress = edtUFKeyPress
    end
    object edtDDD: TMaskEdit
      Left = 16
      Top = 32
      Width = 24
      Height = 21
      EditMask = '(99);0;_'
      MaxLength = 4
      TabOrder = 0
      OnKeyPress = edtDDDKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 277
    Width = 493
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtCancelar: TBitBtn
      Left = 302
      Top = 10
      Width = 75
      Height = 25
      Hint = 'Cancelar altera'#231#245'es no pedido'
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
      Left = 390
      Top = 10
      Width = 75
      Height = 25
      Hint = 'Confirmar'
      Caption = 'C&onfirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
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
  end
end
