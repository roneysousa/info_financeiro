object frmImportaXML: TfrmImportaXML
  Left = 223
  Top = 141
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar arquivos para importa'#231#227'o'
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
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label2: TLabel
      Left = 144
      Top = 28
      Width = 6
      Height = 13
      Caption = #224
    end
    object edtDTINIC: TDateEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      Hint = 'Digite o per'#237'odo inicial'
      NumGlyphs = 2
      TabOrder = 0
      OnExit = edtDTINICExit
    end
    object edtDTFINA: TDateEdit
      Left = 158
      Top = 24
      Width = 121
      Height = 21
      Hint = 'Digite o per'#237'odo final'
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtDTFINAExit
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 360
    Width = 680
    Height = 43
    Align = alBottom
    TabOrder = 1
    object lblPerc: TLabel
      Left = 632
      Top = 16
      Width = 17
      Height = 13
      Caption = '0%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object BmsXPProgressBar1: TBmsXPProgressBar
      Left = 32
      Top = 16
      Width = 593
      Height = 16
      BackColors.StartColor = 14671839
      BackColors.EndColor = clWhite
      BarColors.StartColor = 11530400
      BarColors.EndColor = 5290064
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 403
    Width = 680
    Height = 41
    Align = alBottom
    Color = 10485760
    TabOrder = 2
    object btnFechar: TBitBtn
      Left = 592
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar janela'
      Caption = '&Fechar'
      TabOrder = 0
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
    object btnGerar: TBitBtn
      Left = 12
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Clique aqui para gerar arquivos para importa'#231#227'o'
      Caption = 'Gerar'
      TabOrder = 1
      OnClick = btnGerarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000000000000000
        966835AD7D3EB6924CBEA456C0A859C0A859C0A758B99A50AF8544A57138A166
        31976332000000000000000000000000B27334E8DDD2F7F7F7F7F7F7EEEEEEEB
        EBEBEBEBEBEAEAEAF4F4F4F7F7F7ECEAE8C18F61000000000000000000000000
        B17133EBE0D5FBFBFBFBFBFBC9C9C9D0D0D0BFBFBFE1E1E1FBFBFBFBFBFBF0EE
        ECC4956A000000000000000000000000B06F32EBDFD5FBFBFBFBFBFBEEEEEEE6
        E6E6EFEFEFF2F2F2FBFBFBFBFBFBF0EEECC18C5E000000000000000000000000
        B06D31EADFD5FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0EE
        ECC69971000000000000000000000000AF6C30EADED4FAFAFAFAFAFAF9F9F9EF
        EFEFFAFAFAFAFAFAFAFAFAFAFAFAF0EDECC69870000000000000000000000000
        AF6C2FE8DDD2F8F8F8F4F4F4E8E8E8B7B7B7F3F3F3F3F3F3EEEEEEF8F8F8EEEC
        EABD814C000000000000000000000000AF6B2FE6DAD0D3D3D39A9A9ACECECEB2
        B2B2CECECEE9E9E9A6A6A6C0C0C0E8E6E4B56E31000000000000000000000000
        AF6B2FE3D7CDADADADC0C0C0E7E7E7DDDDDDBEBEBEEEEEEED7D7D7CACACAE0DE
        DCB56F31000000000000000000000000AF6B2FE1D5CBEFEFEFE1E1E1E1E1E1EE
        EEEEDADADAD8D8D8DFDFDFEDEDEDE6E4E2B56F31000000000000000000000000
        AF6B2FDDD1C7EAEAEAEAEAEAEAEAEAEAEAEAE7E7E7E0E0E0EAEAEAEAEAEAE1DF
        DDB67032000000000000000000000000AF6B2FD9CDC3E5E5E5E5E5E5E5E5E5E5
        E5E5E5E5E5E5E5E5E5E5E5E5E5E5DCDAD9B67132000000000000000000000000
        AF6B2FD7CBC1E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E2E2E2E1E1E1D9D7
        D5B77333000000000000000000000000AF6B2FD7CBC1E3E3E3E3E3E3E3E3E3E3
        E3E3E3E3E3E3E3E3DADADACBCBCBC0BFBDAA7948000000000000000000000000
        AF6B2FCCA483D4B79BD9C1A1DECCA8E2D4ACE2D5ACE2D5ACD3C6A0E6DCC7C0C0
        BC1F231F000000000000000000000000A96F37BE7636C37F3CCE974ADBB259E4
        C564E6C866E6C866DDBF62BBB08D000000000000000000000000}
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 57
    Width = 680
    Height = 303
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = '&Importa'#231#227'o'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 672
        Height = 275
        Align = alClient
        TabOrder = 0
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 185
          Height = 273
          Align = alLeft
          TabOrder = 0
          object lstTabelas: TListBox
            Left = 1
            Top = 1
            Width = 183
            Height = 271
            Align = alClient
            ItemHeight = 13
            Items.Strings = (
              'BAIRROS'
              'CIDADES'
              'CLIENTES'
              'FORNECEDORES'
              'PLANO_PAGAMENTO'
              'PRODUTOS'
              'TAB_PRECOS'
              'TRANSPORTADORA'
              'VENDAS')
            TabOrder = 0
            OnClick = lstTabelasClick
          end
        end
        object Panel6: TPanel
          Left = 186
          Top = 1
          Width = 485
          Height = 273
          Align = alClient
          TabOrder = 1
          object grdConsultar: TDBGrid
            Left = 1
            Top = 1
            Width = 483
            Height = 271
            Align = alClient
            Ctl3D = False
            DataSource = dsTabela
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Exporta'#231#227'o'
      ImageIndex = 1
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 183
        Height = 275
        Align = alLeft
        TabOrder = 0
        object lstExportacao: TListBox
          Left = 1
          Top = 1
          Width = 181
          Height = 273
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
          OnClick = lstExportacaoClick
        end
      end
      object Panel8: TPanel
        Left = 183
        Top = 0
        Width = 489
        Height = 275
        Align = alClient
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 487
          Height = 273
          Align = alClient
          Ctl3D = False
          DataSource = dsXML
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
  end
  object dstTabela: TSQLDataSet
    CommandText = 
      'Select Max(M.mov_pedido) as FINAL , min(M.mov_pedido) AS INICIO,' +
      ' Count(*)  from VENDAS M Where (MOV_DATAVENDA >= :pDTINIC) and (' +
      'MOV_DATAVENDA <= :pDTFINA);'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 297
    Top = 17
  end
  object dspTabela: TDataSetProvider
    DataSet = dstTabela
    Options = [poAllowCommandText]
    Left = 329
    Top = 17
  end
  object cdsTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabela'
    Left = 361
    Top = 17
  end
  object dsTabela: TDataSource
    AutoEdit = False
    DataSet = cdsTabela
    Left = 393
    Top = 17
  end
  object cdsXML: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 425
    Top = 81
  end
  object dsXML: TDataSource
    DataSet = cdsXML
    Left = 465
    Top = 81
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Arquivos XML|*.xml'
    Left = 400
    Top = 176
  end
  object cdsLimites: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select Max(M.mov_pedido) as FINAL , min(M.mov_pedido) AS INICIO,' +
      ' Count(*)  from VENDAS M Where (MOV_DATAVENDA >= :pDTINIC) and (' +
      'MOV_DATAVENDA <= :pDTFINA);'
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    ProviderName = 'dspTabela'
    Left = 218
    Top = 202
    object cdsLimitesFINAL: TIntegerField
      FieldName = 'FINAL'
      ReadOnly = True
    end
    object cdsLimitesINICIO: TIntegerField
      FieldName = 'INICIO'
      ReadOnly = True
    end
    object cdsLimitesCOUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsLimites
    Left = 266
    Top = 202
  end
end
