object FrmPrint: TFrmPrint
  Left = 183
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Imprimir'
  ClientHeight = 165
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 280
    Top = 120
    Width = 35
    Height = 13
    Caption = 'C'#243'pias:'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 257
    Height = 41
    Caption = 'Impressora selecionada:'
    TabOrder = 0
    object lblImpressora: TLabel
      Left = 9
      Top = 20
      Width = 240
      Height = 13
      AutoSize = False
      Caption = 'lblImpressora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object rgPaginas: TRadioGroup
    Left = 8
    Top = 55
    Width = 257
    Height = 105
    Caption = 'P'#225'ginas:'
    ItemIndex = 0
    Items.Strings = (
      'Todas'
      'Sele'#231#227'o'
      'P'#225'ginas')
    TabOrder = 1
    OnClick = rgPaginasClick
  end
  object btnImprimir: TBitBtn
    Left = 268
    Top = 16
    Width = 75
    Height = 25
    Hint = 'Imprimir'
    Caption = 'Imprimir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnImprimirClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object btnFechar: TBitBtn
    Left = 268
    Top = 48
    Width = 75
    Height = 25
    Hint = 'Fechar'
    Caption = 'Fechar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnFecharClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
  end
  object btnOpcoes: TBitBtn
    Left = 268
    Top = 80
    Width = 75
    Height = 25
    Hint = 'Op'#231#245'es'
    Caption = 'Op'#231#245'es'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnOpcoesClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
      FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
      FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
      FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
      FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
      FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
      C880733777777777733700000000000000007777777777777777333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object seCopias: TSpinEdit
    Left = 280
    Top = 136
    Width = 57
    Height = 22
    Ctl3D = False
    MaxValue = 9999
    MinValue = 1
    ParentCtl3D = False
    TabOrder = 5
    Value = 1
  end
  object pnlSelecao: TPanel
    Left = 76
    Top = 100
    Width = 177
    Height = 27
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
    object edtSelecao: TEdit
      Left = 9
      Top = 2
      Width = 153
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = '1-1'
    end
  end
  object pnlPaginas: TPanel
    Left = 76
    Top = 129
    Width = 177
    Height = 27
    BevelOuter = bvNone
    TabOrder = 7
    Visible = False
    object Label4: TLabel
      Left = 84
      Top = 6
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label5: TLabel
      Left = 9
      Top = 7
      Width = 12
      Height = 13
      Caption = 'de'
    end
    object edtDe: TEdit
      Left = 28
      Top = 3
      Width = 49
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtAte: TEdit
      Left = 108
      Top = 3
      Width = 53
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  object RvRenderPrinter1: TRvRenderPrinter
    DisplayName = 'RPRender'
    Left = 176
    Top = 16
  end
end
