object frmEmailForn: TfrmEmailForn
  Left = 113
  Top = 150
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enviar a Fornecedor'
  ClientHeight = 354
  ClientWidth = 638
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
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 638
    Height = 256
    Align = alClient
    TabOrder = 0
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 636
      Height = 254
      Align = alClient
      Ctl3D = False
      DataSource = dsConsulta
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
          Title.Caption = 'LOJA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = False
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
    object ListBox1: TListBox
      Left = 320
      Top = 152
      Width = 281
      Height = 97
      ItemHeight = 13
      TabOrder = 1
      Visible = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 313
    Width = 638
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtSair: TBitBtn
      Left = 546
      Top = 8
      Width = 73
      Height = 25
      Hint = 'Fechar janela'
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
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
    object btnEmail: TBitBtn
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Envia todos os pedidos selecionado'
      Caption = 'Enviar &Todos'
      TabOrder = 1
      OnClick = btnEmailClick
    end
    object btnOutlook: TBitBtn
      Left = 130
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Envia pedido atual'
      Caption = 'Enviar Atual'
      TabOrder = 2
      OnClick = btnOutlookClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 57
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 26
      Height = 13
      Caption = '&Data:'
      FocusControl = edtDTINIC
      Transparent = True
    end
    object Label2: TLabel
      Left = 144
      Top = 13
      Width = 54
      Height = 13
      Caption = 'Fornecedor'
    end
    object edtDTINIC: TDateEdit
      Left = 16
      Top = 27
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnExit = edtDTINICExit
    end
    object btConfirma: TBitBtn
      Left = 470
      Top = 24
      Width = 75
      Height = 25
      Hint = 'Consultar dados'
      Caption = '&OK'
      TabOrder = 1
      OnClick = btConfirmaClick
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
    object cmbFornecedor: TComboBox
      Left = 145
      Top = 26
      Width = 293
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
    end
  end
  object dstConsulta: TSQLDataSet
    CommandText = 
      'select M.MOV_PEDIDO, F.for_fantasia, M.MOV_DATAVENDA, M.MOV_CLIE' +
      'NTE, M.MOV_VALOR, M.MOV_NOMECLIENTE, M.MOV_SITUACAO, M.MOV_VENDE' +
      'DOR,'#13#10'M.MOV_DESCONTO, M.MOV_HORAVENDA, M.MOV_TABELA, '#13#10'M. MOV_AC' +
      'RESCIMO, M.MOV_TIPO_FRETE, M.MOV_PERC_FRETE, M.MOV_IDTRANSPORTAD' +
      'ORA, M.MOV_TABELA_PLANO'#13#10'from VENDAS M'#13#10'INNER JOIN PROVENDAS PV ' +
      'ON PV.MOP_PEDIDO = M.MOV_PEDIDO'#13#10'INNER JOIN PRODUTOS P ON PV.MOP' +
      '_PRODUTO = P.PRO_CODIGO'#13#10'INNER JOIN FORNECEDORES F ON F.FOR_CODI' +
      'GO = P.FOR_CODIGO'#13#10'Where (M.MOV_DATAVENDA >= :pDTINIC) and (M.MO' +
      'V_DATAVENDA <= :pDTFINA) AND (F.FOR_CODIGO = :pCODIGO)'#13#10'group by' +
      ' M.MOV_PEDIDO, F.for_fantasia, M.MOV_DATAVENDA, M.MOV_CLIENTE, M' +
      '.MOV_VALOR, M.MOV_NOMECLIENTE, M.MOV_SITUACAO, M.MOV_VENDEDOR,'#13#10 +
      'M.MOV_DESCONTO, M.MOV_HORAVENDA, M.MOV_TABELA, '#13#10'M. MOV_ACRESCIM' +
      'O, M.MOV_TIPO_FRETE, M.MOV_PERC_FRETE, M.MOV_IDTRANSPORTADORA, M' +
      '.MOV_TABELA_PLANO'#13#10'order by M.MOV_PEDIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 360
    Top = 113
  end
  object cdsConsultaForn: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsulta'
    Left = 456
    Top = 113
    object cdsConsultaFornMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultaFornFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsConsultaFornMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsConsultaFornMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
    end
    object cdsConsultaFornMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultaFornMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      Size = 40
    end
    object cdsConsultaFornMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaFornMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
    end
    object cdsConsultaFornMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsConsultaFornMOV_HORAVENDA: TStringField
      FieldName = 'MOV_HORAVENDA'
      FixedChar = True
      Size = 5
    end
    object cdsConsultaFornMOV_TABELA: TIntegerField
      FieldName = 'MOV_TABELA'
    end
    object cdsConsultaFornMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object cdsConsultaFornMOV_TIPO_FRETE: TStringField
      FieldName = 'MOV_TIPO_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaFornMOV_PERC_FRETE: TFMTBCDField
      FieldName = 'MOV_PERC_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsConsultaFornMOV_IDTRANSPORTADORA: TIntegerField
      FieldName = 'MOV_IDTRANSPORTADORA'
    end
    object cdsConsultaFornMOV_TABELA_PLANO: TIntegerField
      FieldName = 'MOV_TABELA_PLANO'
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsultaForn
    OnStateChange = dsConsultaStateChange
    Left = 528
    Top = 121
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 400
    Top = 113
  end
end
