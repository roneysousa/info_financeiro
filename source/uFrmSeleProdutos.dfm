object frmSelecionaProduto: TfrmSelecionaProduto
  Left = 188
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Procurar Produto'
  ClientHeight = 444
  ClientWidth = 680
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 73
    Align = alTop
    TabOrder = 0
    object lblTexto: TLabel
      Left = 150
      Top = 12
      Width = 130
      Height = 13
      Caption = 'Descri'#231#227'o/Refer'#234'ncia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtNMDESC: TEdit
      Left = 150
      Top = 32
      Width = 436
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 13
      TabOrder = 0
      OnChange = edtNMDESCChange
      OnKeyDown = edtNMDESCKeyDown
      OnKeyPress = edtNMDESCKeyPress
    end
    object rgConsultar: TRadioGroup
      Left = 12
      Top = 5
      Width = 127
      Height = 55
      Caption = 'Consultar por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        '&Refer'#234'ncia'
        '&Descri'#231#227'o')
      ParentFont = False
      TabOrder = 1
      OnClick = rgConsultarClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 73
    Width = 680
    Height = 330
    Align = alClient
    TabOrder = 1
    object GridProdutos: TDBGrid
      Left = 1
      Top = 1
      Width = 678
      Height = 328
      Align = alClient
      DataSource = dsProdutos
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = GridProdutosDblClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'PRO_CODIGO'
          Title.Caption = 'C'#211'DIGO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_REFERENCIA'
          Title.Caption = 'REFER'#202'NCIA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_DESCRICAO'
          Title.Caption = 'DESCRI'#199#195'O'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 249
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_VLPROM'
          Title.Caption = 'VALOR VENDA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNI_CODIGO'
          Title.Caption = 'UNIDADE'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOME_FORN'
          Title.Caption = 'FORNECEDOR'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SECNOME'
          Title.Caption = 'SE'#199#195'O'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUBNOME'
          Title.Caption = 'SUB-SE'#199#195'O'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 78
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 403
    Width = 680
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object btFechar: TBitBtn
      Left = 592
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      ModalResult = 2
      TabOrder = 0
      OnClick = btFecharClick
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
    object btnOk: TBitBtn
      Left = 508
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkOK
    end
  end
  object dstProdutos: TSQLDataSet
    CommandText = 
      'Select P.PRO_CODIGO, P.PRO_BARRAS, P.PRO_DESCRICAO, '#13#10'P.PRO_REFE' +
      'RENCIA, P.PRO_VLCOMPRA, P.PRO_VLCUSTO, PRO_VLVENDA,'#13#10'P.PRO_REFER' +
      'ENCIA,'#13#10'(Select S.SEC_DESCRICAO from SECAO S WHERE (P.SEC_CODIGO' +
      ' = S.SEC_CODIGO)) AS SECNOME,'#13#10'(Select SU.SUB_DESCRICAO from SUB' +
      'SECAO SU WHERE (P.SUB_CODIGO = SU.SUB_CODIGO)) AS SUBNOME,'#13#10'(Sel' +
      'ect F.for_fantasia from FORNECEDORES F WHERE (P.FOR_CODIGO = F.F' +
      'OR_CODIGO)) AS NOME_FORN'#13#10'from PRODUTOS P'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 400
    Top = 16
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 440
    Top = 16
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    OnCalcFields = cdsProdutosCalcFields
    Left = 480
    Top = 16
    object cdsProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsProdutosPRO_VLCOMPRA: TFMTBCDField
      FieldName = 'PRO_VLCOMPRA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsProdutosPRO_VLCUSTO: TFMTBCDField
      FieldName = 'PRO_VLCUSTO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsProdutosPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      Size = 14
    end
    object cdsProdutosSECNOME: TStringField
      FieldName = 'SECNOME'
      ReadOnly = True
      Size = 30
    end
    object cdsProdutosSUBNOME: TStringField
      FieldName = 'SUBNOME'
      ReadOnly = True
      Size = 30
    end
    object cdsProdutosNOME_FORN: TStringField
      FieldName = 'NOME_FORN'
      ReadOnly = True
      Size = 50
    end
    object cdsProdutosPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsProdutosPRO_VLPROM: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'PRO_VLPROM'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 560
    Top = 16
  end
end
