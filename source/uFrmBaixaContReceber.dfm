object frmBaixaContReceber: TfrmBaixaContReceber
  Left = 207
  Top = 167
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Baixa de Contas a Receber'
  ClientHeight = 385
  ClientWidth = 700
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
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 87
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 13
      Top = 6
      Width = 133
      Height = 13
      Caption = '&Loja\Comodat'#225'rio\Locat'#225'rio'
      FocusControl = edtCDCLIE
    end
    object spLocClientes: TSpeedButton
      Left = 123
      Top = 20
      Width = 23
      Height = 22
      Hint = 'Localizar Loja\Comodat'#225'rio\Locat'#225'rio'
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
      OnClick = spLocClientesClick
    end
    object Label1: TLabel
      Left = 13
      Top = 42
      Width = 46
      Height = 13
      Caption = '&N'#186'.T'#237'tulo:'
      FocusControl = edtNRTITU
    end
    object edtCDCLIE: TEdit
      Left = 13
      Top = 21
      Width = 108
      Height = 21
      MaxLength = 7
      TabOrder = 0
      OnChange = edtCDCLIEChange
      OnEnter = edtCDCLIEEnter
      OnExit = edtCDCLIEExit
      OnKeyPress = edtCDCLIEKeyPress
    end
    object btFiltar: TBitBtn
      Left = 605
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Fil&tra'
      TabOrder = 2
      OnClick = btFiltarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF075507075507FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0755079D
        D9AD47AA22035300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF135F129DD9AD47AA22095B00FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF115E1191
        CE9F41A31F085A00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0F5A0E82CB953CA420075800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF12842325
        BD5014A628047407FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF138A242BD15E19B8420DA12304910B006800FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF18922B3AE76F27CB5918
        B23C0C9E1D038A06008200006900FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF1C992F4DFF8839E97225CB5816B53A0A9E1A018A03008300008700006A
        00FF00FFFF00FFFF00FFFF00FFFF00FF168E2836DA672CC6551BA1380F8E2707
        7F12047304006A00006900006E00007400006400FF00FFFF00FFFF00FF005200
        0466061566001468010176082A9A3A3ACCCB00C4CE05817F20963521A7371996
        2D067A0E045D08FF00FF004C00005E00748904EB9F22E796117D8F0A0AAA2755
        D48136EBFF00D8FF0D9AA440D7762CD85178C79E12811E004C00FF00FF004C00
        D7A560F3E39EE7CC62D08A0A005303005102468C4D38EDFF005F4F0044004370
        44F75FF43C1339FF00FFFF00FFFF00FFD7B48CFFFFEEF0DD8FD19212FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF9EFFFF03FFAB00AB790179FF00FFFF00FF
        FF00FFC2A072C49541FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFBD3
        FBFA2FFA8B008BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFA98FAFF00FFFF00FF}
    end
    object lbl_NMCLIE: TEdit
      Left = 151
      Top = 21
      Width = 325
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtNRTITU: TEdit
      Left = 13
      Top = 57
      Width = 132
      Height = 21
      MaxLength = 10
      TabOrder = 1
      OnChange = edtNRTITUChange
      OnExit = edtNRTITUExit
      OnKeyPress = edtNRTITUKeyPress
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 87
    Width = 700
    Height = 220
    Align = alClient
    TabOrder = 1
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 698
      Height = 218
      Align = alClient
      Ctl3D = False
      DataSource = dsContas
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'REC_CREDITO'
          Title.Alignment = taCenter
          Title.Caption = 'CREDITO'
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
          FieldName = 'REC_NOSSO_NUMERO'
          Title.Alignment = taCenter
          Title.Caption = 'N.N'#218'MERO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 84
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'REC_PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'PC'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REC_NRVENDA'
          Title.Alignment = taCenter
          Title.Caption = 'VENDA'
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
          FieldName = 'REC_DATAEMISSAO'
          Title.Caption = 'DT.EMISS'#195'O'
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
          FieldName = 'REC_DATAVENCIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'VENCIMENTO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 86
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'REC_DATAPAGAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'PAGAMENTO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'REC_VALORPARCELA'
          Title.Alignment = taRightJustify
          Title.Caption = 'VALOR'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REC_VALORJUROS'
          Title.Alignment = taRightJustify
          Title.Caption = 'VL.JUROS'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REC_VLSUBTOTAL'
          Title.Alignment = taRightJustify
          Title.Caption = 'SUBTOTAL'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 85
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 344
    Width = 700
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object btBaixa: TBitBtn
      Left = 23
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Baixa'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btBaixaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object BtSair: TBitBtn
      Left = 605
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar janela'
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
    object btBaixaTodos: TBitBtn
      Left = 111
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Baixa todas as contas'
      Caption = '&Todos'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btBaixaTodosClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000000
        07FFF7FFF8FFF8FFF0FFF7888787878880FFF7FFF8FF07FFF0FFF78887887378
        80FFF7888888F7B7F0FF00000006877B700F0600600088F77000066066008788
        7B000E66666088FFF07006006000878880000660660088FFF0FF0E6666607777
        70FF067888600FFFFFFF067777000FFFFFFF06666660FFFFFFFF}
    end
    object btnBoleto: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Autom'#225'tico...'
      TabOrder = 3
      Visible = False
      OnClick = btnBoletoClick
    end
  end
  object pnlEdicao: TPanel
    Left = 0
    Top = 307
    Width = 700
    Height = 37
    Align = alBottom
    TabOrder = 3
    object Label5: TLabel
      Left = 11
      Top = 12
      Width = 139
      Height = 13
      Caption = 'TOTAL DEBITO     ===>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_Debito: TLabel
      Left = 206
      Top = 10
      Width = 31
      Height = 19
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblParcelas: TLabel
      Left = 588
      Top = 11
      Width = 66
      Height = 13
      Caption = 'Registro(s):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dstContasReceber: TSQLDataSet
    CommandText = 
      'Select REC_LOJA, REC_CREDITO, REC_PARCELA, REC_QTPARCELAS, REC_C' +
      'LIENTE, REC_NRVENDA, REC_DATAEMISSAO, REC_DATAVENCIMENTO, REC_VA' +
      'LORJUROS, REC_VALORPARCELA,REC_SITUACAO, REC_DATAPAGAMENTO, REC_' +
      'PAGO, REC_NOSSO_NUMERO'#13#10'from CONTASRECEBER Where (REC_CLIENTE = ' +
      ':pCLIENTE)'#13#10'and (REC_SITUACAO = :pSITUACAO)'#13#10'order by REC_CREDIT' +
      'O, REC_PARCELA'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 344
    Top = 216
    object dstContasReceberREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasReceberREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasReceberREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object dstContasReceberREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstContasReceberREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
    end
  end
  object dspContasReceber: TDataSetProvider
    DataSet = dstContasReceber
    Options = [poAllowCommandText]
    Left = 416
    Top = 216
  end
  object cdsContasReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspContasReceber'
    OnCalcFields = cdsContasReceberCalcFields
    Left = 480
    Top = 216
    object cdsContasReceberREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object cdsContasReceberREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsContasReceberREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsContasReceberREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '00'
    end
    object cdsContasReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0000000'
    end
    object cdsContasReceberREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0000000'
    end
    object cdsContasReceberREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasReceberREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasReceberREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsContasReceberREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;'
    end
    object cdsContasReceberREC_NMSITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'REC_NMSITUACAO'
      Size = 15
      Calculated = True
    end
    object cdsContasReceberREC_ATRASO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'REC_ATRASO'
      Calculated = True
    end
    object cdsContasReceberREC_NMCLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'REC_NMCLIENTE'
      LookupDataSet = DM2.cdsClientes
      LookupKeyFields = 'CLI_CODIGO'
      LookupResultField = 'CLI_FANTASIA'
      KeyFields = 'REC_CLIENTE'
      Size = 40
      Lookup = True
    end
    object cdsContasReceberREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      DisplayFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_VLSUBTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'REC_VLSUBTOTAL'
      DisplayFormat = '###,###,##0.#0'
      currency = False
      Calculated = True
    end
    object cdsContasReceberREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
    end
  end
  object dsContas: TDataSource
    DataSet = cdsContasReceber
    OnDataChange = dsContasDataChange
    Left = 544
    Top = 217
  end
end
