object frmCancelarVenda: TfrmCancelarVenda
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cancelamento de Venda'
  ClientHeight = 341
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 536
    Height = 72
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 39
      Width = 69
      Height = 13
      Caption = 'N'#186'. do &Pedido:'
      FocusControl = edtNRVEND
      Transparent = True
    end
    object Label7: TLabel
      Left = 16
      Top = 12
      Width = 54
      Height = 13
      Caption = 'N'#186'. &Cupom:'
      FocusControl = edtNRCUPOM
      Transparent = True
    end
    object edtNRVEND: TEdit
      Left = 95
      Top = 35
      Width = 100
      Height = 21
      TabOrder = 1
      OnChange = edtNRVENDChange
      OnEnter = edtNRVENDEnter
      OnExit = edtNRVENDExit
      OnKeyPress = edtNRVENDKeyPress
    end
    object edtNRCUPOM: TEdit
      Left = 95
      Top = 8
      Width = 100
      Height = 21
      TabOrder = 0
      OnChange = edtNRCUPOMChange
      OnEnter = edtNRCUPOMEnter
      OnExit = edtNRCUPOMExit
      OnKeyPress = edtNRCUPOMKeyPress
    end
    object dbeNRCUPOM: TDBEdit
      Left = 200
      Top = 8
      Width = 100
      Height = 21
      DataField = 'MOV_CUPOM'
      DataSource = Dm.dsMovimento
      TabOrder = 2
      Visible = False
      OnEnter = dbeNRCUPOMEnter
    end
    object dbeNRPEDIDO: TDBEdit
      Left = 200
      Top = 35
      Width = 100
      Height = 21
      DataField = 'MOV_PEDIDO'
      DataSource = Dm.dsMovimento
      TabOrder = 3
      Visible = False
      OnEnter = dbeNRPEDIDOEnter
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 300
    Width = 536
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object BtCancelar: TBitBtn
      Left = 440
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'C&ancela'
      Default = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BtGravar: TBitBtn
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtGravarClick
      OnEnter = BtGravarEnter
      Kind = bkOK
    end
    object btnExcluir: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Excluir pedido'
      Caption = '&Excluir'
      Enabled = False
      TabOrder = 2
      OnClick = btnExcluirClick
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 97
    Width = 536
    Height = 203
    Align = alClient
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 10
      Width = 23
      Height = 13
      Caption = 'Loja:'
      Transparent = True
    end
    object Label4: TLabel
      Left = 16
      Top = 86
      Width = 35
      Height = 13
      Caption = 'Cliente:'
      FocusControl = DBEdit3
      Transparent = True
    end
    object Label5: TLabel
      Left = 323
      Top = 10
      Width = 79
      Height = 13
      Caption = 'Total da Venda: '
      FocusControl = DBEdit4
      Transparent = True
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 26
      Height = 13
      Caption = 'Data:'
      FocusControl = DBEdit2
    end
    object DBEdit4: TDBEdit
      Left = 323
      Top = 24
      Width = 126
      Height = 24
      DataField = 'MOV_VALOR'
      DataSource = Dm.dsMovimento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 100
      Width = 80
      Height = 21
      DataField = 'MOV_CLIENTE'
      DataSource = Dm.dsMovimento
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 62
      Width = 90
      Height = 21
      DataField = 'MOV_DATAVENDA'
      DataSource = Dm.dsMovimento
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 102
      Top = 100
      Width = 347
      Height = 21
      DataField = 'MOV_NOMECLIENTE'
      DataSource = Dm.dsMovimento
      ReadOnly = True
      TabOrder = 3
    end
    object cmbLoja: TComboBox
      Left = 16
      Top = 24
      Width = 301
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 4
    end
  end
  object qryMovCaixa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pTIPOMOV'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'UpDate MOVIMENTO_CAIXA SET MCA_TIPOMOV = :pTIPOMOV'
      'Where (MCA_VENDA = :pVENDA) AND (MCA_LOJA = :pLOJA)')
    SQLConnection = Dm.SqlAdmin
    Left = 472
    Top = 57
  end
end
