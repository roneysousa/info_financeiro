object frmCadNewPedidos: TfrmCadNewPedidos
  Left = 172
  Top = 153
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedidos'
  ClientHeight = 339
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 228
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 629
      Top = 79
      Width = 104
      Height = 13
      Caption = 'Forma de Pagamento:'
      Transparent = True
    end
    object Label16: TLabel
      Left = 629
      Top = 118
      Width = 39
      Height = 13
      Caption = 'Tabela :'
      Transparent = True
    end
    object cmbPagamento: TComboBox
      Left = 629
      Top = 96
      Width = 160
      Height = 22
      Hint = 'Selecione forma de pagamento'
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 6
      Width = 609
      Height = 177
      Caption = '[ Cliente ]'
      TabOrder = 1
      object Label2: TLabel
        Left = 10
        Top = 16
        Width = 39
        Height = 13
        Caption = '&C'#243'digo :'
        FocusControl = edtCDCLIE
        Transparent = True
      end
      object spLocCliente: TSpeedButton
        Left = 111
        Top = 31
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
      end
      object Label6: TLabel
        Left = 140
        Top = 16
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
        Top = 55
        Width = 49
        Height = 13
        Caption = 'Endere'#231'o:'
        Transparent = True
      end
      object Label4: TLabel
        Left = 11
        Top = 95
        Width = 30
        Height = 13
        Caption = 'Bairro:'
        Transparent = True
      end
      object Label5: TLabel
        Left = 291
        Top = 95
        Width = 36
        Height = 13
        Caption = 'Cidade:'
        Transparent = True
      end
      object Label7: TLabel
        Left = 356
        Top = 56
        Width = 40
        Height = 13
        Caption = 'N'#250'mero:'
      end
      object Label8: TLabel
        Left = 468
        Top = 16
        Width = 30
        Height = 13
        Caption = '&CNPJ:'
        FocusControl = edtNMCLIE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edtCDCLIE: TEdit
        Left = 11
        Top = 32
        Width = 97
        Height = 21
        MaxLength = 7
        TabOrder = 0
      end
      object edtNMCLIE: TEdit
        Left = 139
        Top = 32
        Width = 322
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 40
        TabOrder = 1
      end
      object edtENDER: TEdit
        Left = 11
        Top = 71
        Width = 322
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edtNumero: TEdit
        Left = 356
        Top = 71
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edtBairro: TEdit
        Left = 11
        Top = 111
        Width = 270
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object edtCidade: TEdit
        Left = 291
        Top = 111
        Width = 187
        Height = 21
        TabOrder = 5
      end
      object edtCNPJ: TEdit
        Left = 468
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 6
      end
    end
    object cmbTabela: TComboBox
      Left = 629
      Top = 131
      Width = 160
      Height = 22
      Hint = 'Selecione tabela de pre'#231'os'
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
    end
    object GroupBox3: TGroupBox
      Left = 627
      Top = 9
      Width = 161
      Height = 69
      TabOrder = 3
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
      end
      object rbtOrcamento: TRadioButton
        Left = 79
        Top = 48
        Width = 79
        Height = 17
        Caption = '&Orcamento'
        TabOrder = 2
      end
    end
  end
end
