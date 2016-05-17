object frmConsPedidosNovo: TfrmConsPedidosNovo
  Left = 70
  Top = 133
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Pedidos'
  ClientHeight = 380
  ClientWidth = 676
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 676
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 26
      Height = 13
      Caption = '&Data:'
      FocusControl = edtDTVEND
      Transparent = True
    end
    object edtDTVEND: TDateEdit
      Left = 48
      Top = 11
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnChange = edtDTVENDChange
      OnExit = edtDTVENDExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 676
    Height = 298
    Align = alClient
    TabOrder = 1
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 674
      Height = 296
      Align = alClient
      Ctl3D = False
      DataSource = dsVendas
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
          FieldName = 'MOV_PEDIDO'
          Title.Caption = 'PEDIDO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MOV_DATAVENDA'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FOR_FANTASIA'
          Title.Caption = 'FORNECEDOR'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 156
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOV_NOMECLIENTE'
          Title.Caption = 'CLIENTE'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOV_VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'VALOR'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 93
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MOV_SITUACAO'
          Title.Alignment = taCenter
          Title.Caption = 'ST'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 22
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 339
    Width = 676
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object btnConfirma: TBitBtn
      Left = 496
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Altera pedido atual'
      Caption = '&OK'
      ModalResult = 1
      TabOrder = 0
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
      Left = 584
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar janela'
      Caption = '&Fechar'
      TabOrder = 1
      OnClick = btnFecharClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
        4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
        4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
        41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
        575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
        43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
        6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
        C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
        65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
        6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
        76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
        FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
        4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btnExcluir: TBitBtn
      Left = 16
      Top = 8
      Width = 121
      Height = 25
      Hint = 'Excluir pedido atual'
      Caption = 'Excluir Pedido'
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
    object btnVisualizar: TBitBtn
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Visualiza impress'#227'o do pedido'
      Caption = 'Visualizar'
      TabOrder = 3
      OnClick = btnVisualizarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF485360FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FF4380B7
        1F6FC2656B86F3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FF32A3FF1672D76B6A80F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        A0675B34A1FF1572D45E6782F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFA7756BFFFBF033A6FF4078AD8E675EAC
        7F7597645EAC7D6FCAA083EDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        A7756BFFFFFCFAF0E6AD8A88B78F84D8BAA5EED5B6D7B298B58877CBA083EBC7
        93F2C98CA46769FF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2AF847FDAC0B4F7
        E3CFF6E0C5FFFFF4D7B198AC7D6FEECC9EF3CE97A46769FF00FFFF00FFFF00FF
        BC8268FFFFFFFFFEFC976560F6E9E0F7EADAF6E3CFFFFFEBEFD4B797645EF0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFB08884DECAC4FA
        EFE5F8EAD9FFFFD4D9B8A5AC7F74F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D1926DFFFFFFFFFFFFD5BFBCBA9793DECAC4F6E9DEDAC0B4B78F84B28C7BDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFD5BFBCB0
        8884976560AF867FCAA79DA56B5FA56B5FA56B5FA46769FF00FFFF00FFFF00FF
        DA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA56B5FE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5A56B5FF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DD1
        926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF00FF}
    end
    object BitBtn1: TBitBtn
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Imprimir consulta'
      Caption = 'Imprimir'
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDB0000000000000000000000DBDBDBDB00DBDBDBDB
        DBDBDBDBDB00DB00DBDB00000000000000000000000000DB00DB00DBDBDBDBDB
        DBFCFCFCDBDB000000DB00DBDBDBDBDBDB929292DBDB00DB00DB000000000000
        00000000000000DBDB0000DBDBDBDBDBDBDBDBDBDB00DB00DB00DB0000000000
        0000000000DB00DB0000DBDB00FFFFFFFFFFFFFFFF00DB00DB00DBDBDB00FF00
        00000000FF00000000DBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00FF
        0000000000FF00DBDBDBDBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00
        0000000000000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB}
    end
  end
  object dstVendas: TSQLDataSet
    CommandText = 
      'select M.MOV_PEDIDO, F.for_fantasia, M.MOV_DATAVENDA, M.MOV_CLIE' +
      'NTE, M.MOV_VALOR, M.MOV_NOMECLIENTE, M.MOV_SITUACAO, M.MOV_VENDE' +
      'DOR,'#13#10'M.MOV_DESCONTO, M.MOV_HORAVENDA, M.MOV_TABELA, '#13#10'M. MOV_AC' +
      'RESCIMO, M.MOV_TIPO_FRETE, M.MOV_PERC_FRETE, M.MOV_IDTRANSPORTAD' +
      'ORA, M.MOV_TABELA_PLANO'#13#10'from VENDAS M'#13#10'INNER JOIN PROVENDAS PV ' +
      'ON PV.MOP_PEDIDO = M.MOV_PEDIDO'#13#10'INNER JOIN PRODUTOS P ON PV.MOP' +
      '_PRODUTO = P.PRO_CODIGO'#13#10'INNER JOIN FORNECEDORES F ON F.FOR_CODI' +
      'GO = P.FOR_CODIGO'#13#10'Where (M.MOV_DATAVENDA = :pDTINIC)'#13#10'group by ' +
      'M.MOV_PEDIDO, F.for_fantasia, M.MOV_DATAVENDA, M.MOV_CLIENTE, M.' +
      'MOV_VALOR, M.MOV_NOMECLIENTE, M.MOV_SITUACAO, M.MOV_VENDEDOR,'#13#10'M' +
      '.MOV_DESCONTO, M.MOV_HORAVENDA, M.MOV_TABELA, '#13#10'M. MOV_ACRESCIMO' +
      ', M.MOV_TIPO_FRETE, M.MOV_PERC_FRETE, M.MOV_IDTRANSPORTADORA, M.' +
      'MOV_TABELA_PLANO'#13#10'order by M.MOV_PEDIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 256
    Top = 168
  end
  object dspVendas: TDataSetProvider
    DataSet = dstVendas
    Options = [poAllowCommandText]
    Left = 320
    Top = 168
  end
  object cdsVendas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendas'
    Left = 376
    Top = 168
    object cdsVendasMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsVendasFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsVendasMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsVendasMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
    end
    object cdsVendasMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsVendasMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      Size = 40
    end
    object cdsVendasMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsVendasMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
    end
    object cdsVendasMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsVendasMOV_HORAVENDA: TStringField
      FieldName = 'MOV_HORAVENDA'
      FixedChar = True
      Size = 5
    end
    object cdsVendasMOV_TABELA: TIntegerField
      FieldName = 'MOV_TABELA'
    end
    object cdsVendasMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object cdsVendasMOV_TIPO_FRETE: TStringField
      FieldName = 'MOV_TIPO_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsVendasMOV_PERC_FRETE: TFMTBCDField
      FieldName = 'MOV_PERC_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsVendasMOV_IDTRANSPORTADORA: TIntegerField
      FieldName = 'MOV_IDTRANSPORTADORA'
    end
    object cdsVendasMOV_TABELA_PLANO: TIntegerField
      FieldName = 'MOV_TABELA_PLANO'
    end
  end
  object dsVendas: TDataSource
    DataSet = cdsVendas
    Left = 448
    Top = 120
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPConsulta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 576
    Top = 201
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPConsulta'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42863
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 29633
        mmLeft = 5027
        mmTop = 2117
        mmWidth = 73025
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35190
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2646
        mmTop = 36513
        mmWidth = 13462
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 21696
        mmTop = 36513
        mmWidth = 9567
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'FORNECEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40481
        mmTop = 36513
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 98954
        mmTop = 36513
        mmWidth = 15071
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 183886
        mmTop = 36513
        mmWidth = 12192
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 41275
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'LISTA DE PEDIDOS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 6615
        mmLeft = 135202
        mmTop = 5556
        mmWidth = 53975
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MOV_PEDIDO'
        DataPipeline = ppDBPConsulta
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPConsulta'
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MOV_DATAVENDA'
        DataPipeline = ppDBPConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPConsulta'
        mmHeight = 4022
        mmLeft = 21167
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'FOR_FANTASIA'
        DataPipeline = ppDBPConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPConsulta'
        mmHeight = 4022
        mmLeft = 40481
        mmTop = 529
        mmWidth = 55827
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MOV_NOMECLIENTE'
        DataPipeline = ppDBPConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPConsulta'
        mmHeight = 3969
        mmLeft = 98954
        mmTop = 529
        mmWidth = 74348
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MOV_VALOR'
        DataPipeline = ppDBPConsulta
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPConsulta'
        mmHeight = 4022
        mmLeft = 175419
        mmTop = 529
        mmWidth = 20902
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197115
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 2381
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 161661
        mmTop = 2381
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 6879
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 6879
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 265
        mmTop = 1058
        mmWidth = 197115
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'MOV_VALOR'
        DataPipeline = ppDBPConsulta
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPConsulta'
        mmHeight = 3969
        mmLeft = 164042
        mmTop = 2646
        mmWidth = 32279
        BandType = 7
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'TOTAL ==>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4106
        mmLeft = 119984
        mmTop = 2646
        mmWidth = 18838
        BandType = 7
      end
    end
  end
  object ppDBPConsulta: TppDBPipeline
    DataSource = dsVendas
    UserName = 'DBPConsulta'
    Left = 576
    Top = 241
    object ppDBPConsultappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_PEDIDO'
      FieldName = 'MOV_PEDIDO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPConsultappField2: TppField
      FieldAlias = 'FOR_FANTASIA'
      FieldName = 'FOR_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPConsultappField3: TppField
      FieldAlias = 'MOV_DATAVENDA'
      FieldName = 'MOV_DATAVENDA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPConsultappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_CLIENTE'
      FieldName = 'MOV_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPConsultappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_VALOR'
      FieldName = 'MOV_VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object ppDBPConsultappField6: TppField
      FieldAlias = 'MOV_NOMECLIENTE'
      FieldName = 'MOV_NOMECLIENTE'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object ppDBPConsultappField7: TppField
      FieldAlias = 'MOV_SITUACAO'
      FieldName = 'MOV_SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object ppDBPConsultappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_VENDEDOR'
      FieldName = 'MOV_VENDEDOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPConsultappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_DESCONTO'
      FieldName = 'MOV_DESCONTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 8
    end
    object ppDBPConsultappField10: TppField
      FieldAlias = 'MOV_HORAVENDA'
      FieldName = 'MOV_HORAVENDA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 9
    end
    object ppDBPConsultappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_TABELA'
      FieldName = 'MOV_TABELA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPConsultappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_ACRESCIMO'
      FieldName = 'MOV_ACRESCIMO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 11
    end
    object ppDBPConsultappField13: TppField
      FieldAlias = 'MOV_TIPO_FRETE'
      FieldName = 'MOV_TIPO_FRETE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object ppDBPConsultappField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_PERC_FRETE'
      FieldName = 'MOV_PERC_FRETE'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 13
    end
    object ppDBPConsultappField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_IDTRANSPORTADORA'
      FieldName = 'MOV_IDTRANSPORTADORA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object ppDBPConsultappField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_TABELA_PLANO'
      FieldName = 'MOV_TABELA_PLANO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 15
    end
  end
end
