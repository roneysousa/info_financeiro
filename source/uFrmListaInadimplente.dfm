object frmRelListaInadimplentes: TfrmRelListaInadimplentes
  Left = 191
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista de Inadimplentes'
  ClientHeight = 470
  ClientWidth = 741
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
    Width = 741
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 112
      Height = 13
      Caption = '&Per'#237'odo de Vencimento'
      FocusControl = edtDTINIC
      Transparent = True
    end
    object Label12: TLabel
      Left = 16
      Top = 53
      Width = 29
      Height = 13
      Caption = '&Grupo'
      FocusControl = cmbGrupos
      Transparent = True
    end
    object Label2: TLabel
      Left = 272
      Top = 48
      Width = 44
      Height = 13
      Caption = '&Dia Vcto.'
    end
    object edtDTINIC: TDateEdit
      Left = 16
      Top = 28
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnEnter = edtDTINICEnter
      OnExit = edtDTINICExit
      OnKeyPress = edtDTINICKeyPress
    end
    object edtDTFINA: TDateEdit
      Left = 144
      Top = 28
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = edtDTFINAEnter
      OnExit = edtDTFINAExit
      OnKeyPress = edtDTFINAKeyPress
    end
    object cmbGrupos: TComboBox
      Left = 16
      Top = 67
      Width = 249
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
      OnEnter = cmbGruposEnter
      OnKeyPress = cmbGruposKeyPress
    end
    object btnConsulta: TBitBtn
      Left = 338
      Top = 65
      Width = 75
      Height = 25
      Caption = '&Consultar'
      TabOrder = 4
      OnClick = btnConsultaClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00840000008400
        0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008400000084000000840000008400000084000000FF00FF008400000000FF
        FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008400000000FFFF00840000008400000084000000FF00FF008400000000FF
        FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008400000000FFFF00840000008400000084000000FF00FF00840000008400
        00008400000084000000840000008400000084000000FF00FF00840000008400
        00008400000084000000840000008400000084000000FF00FF00840000008400
        000000FFFF0084000000840000008400000084000000840000008400000000FF
        FF008400000084000000840000008400000084000000FF00FF00840000008400
        000000FFFF00840000008400000084000000FF00FF00840000008400000000FF
        FF008400000084000000840000008400000084000000FF00FF00840000008400
        000000FFFF00840000008400000084000000FF00FF00840000008400000000FF
        FF008400000084000000840000008400000084000000FF00FF00FF00FF008400
        0000840000008400000084000000840000008400000084000000840000008400
        000084000000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
        FF008400000000FFFF00840000008400000084000000FF00FF008400000000FF
        FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008400000084000000840000008400000084000000FF00FF00840000008400
        0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF008400
        00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008400000000FFFF0084000000FF00FF00FF00FF00FF00FF008400
        000000FFFF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF008400
        00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object rgTipo: TRadioGroup
      Left = 470
      Top = 16
      Width = 123
      Height = 78
      Caption = '[ Tipo ] '
      ItemIndex = 1
      Items.Strings = (
        '&Resumo'
        '&Detalhado')
      TabOrder = 5
      Visible = False
    end
    object sedDia: TSpinEdit
      Left = 272
      Top = 66
      Width = 57
      Height = 22
      MaxValue = 31
      MinValue = 0
      TabOrder = 3
      Value = 0
      OnEnter = sedDiaEnter
      OnKeyPress = sedDiaKeyPress
    end
    object rgModeloCartas: TRadioGroup
      Left = 608
      Top = 16
      Width = 123
      Height = 78
      Caption = '[ Carta Cobran'#231'a ]'
      ItemIndex = 0
      Items.Strings = (
        'Convoca'#231#227'o'
        'Rescis'#227'o')
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 741
    Height = 324
    Align = alClient
    TabOrder = 1
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 739
      Height = 281
      Align = alClient
      Ctl3D = False
      DataSource = dsDados
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
          FieldName = 'CDS_NOME'
          Title.Caption = 'Nome'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CDS_CGCCPF'
          Title.Alignment = taCenter
          Title.Caption = 'CNPJ/CPF'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDS_NRBOX'
          Title.Caption = 'N'#186'. Box'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDS_NMGRUPO'
          Title.Caption = 'Grupo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CDS_QTPARC'
          Title.Alignment = taCenter
          Title.Caption = 'Qt.T'#237'tulos'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CDS_QTPAGA'
          Title.Alignment = taCenter
          Title.Caption = 'Qt. Pagas'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CDS_QTABERTAS'
          Title.Alignment = taCenter
          Title.Caption = 'Qt. Abertas'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDS_VLPCATUAL'
          Title.Caption = 'Vl. Atual PC'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDS_VLDEBITO'
          Title.Alignment = taRightJustify
          Title.Caption = 'D'#233'bito'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDS_VLMULTA'
          Title.Caption = 'Total Multa'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDS_VLJUROS'
          Title.Caption = 'Total Juros'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CDS_SUBTOTAL'
          Title.Caption = 'Total D'#233'bito'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 1
      Top = 282
      Width = 739
      Height = 41
      Align = alBottom
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 16
        Top = 8
        Width = 224
        Height = 25
        DataSource = dsDados
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 429
    Width = 741
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object lblRegistros: TLabel
      Left = 16
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Registro(s):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btnFechar: TBitBtn
      Left = 632
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar janela'
      Caption = '&Fechar'
      TabOrder = 2
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
    object btnVisualizar: TBitBtn
      Left = 531
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Visualizar impress'#227'o'
      Caption = '&Visualizar'
      TabOrder = 1
      OnClick = btnVisualizarClick
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
    object btnExcel: TBitBtn
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Exportar para Excel'
      Caption = '&Excel'
      TabOrder = 0
      OnClick = btnExcelClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300000000000000000000000000000000000039724B39724B
        39724B326C46326C46326C462B65412B65412B6541255C37255C37255C371D52
        301D52301D5230194C2939724B6BA67B65A07665A0765E9B715E9B7157966A57
        966A48935E48935E48935E3C8C563C8C56348C4E348C4E194C29407A566BA67B
        EBF3EBE8F1E8E6F0E6E4EFE4E2EEE3DFECDFDEEBDEDCEADDDCEADBD9E8D9D8E7
        D8D8E7D8348C4E194C29407A5670AA80EDF5EDEBF3EBEAF1E9E6F0E6E4EFE4E2
        EEE3DFECDFDEEBDEDCEADBDCEADBDAE9DAD8E7D83C8C561D523046805C75AF85
        EFF6EFEDF5EDEBF3EBE9F2E9E8F1E8E4EFE481AA8D2B512F2B512F2B512F2B51
        2FDAE9DA3C8C561D52304C87617BB58AF3F8F354A4592B512F2B512F2B512F2B
        512F1C771D6CB67448935E4A964C255C37DCEADB48935E255C37548E6681BC90
        F4F9F4F1F7F154A45962B27554A4591C771D7BC18548935E4A964C255C3781AA
        8DDCEADD48935E255C3757966A8AB795F6FAF6F5F9F5F3F8F354A45931873481
        BC9048935E4A964C255C37609963609963DFECDF48935E255C375E9B7194C79C
        F9FBFAF6FAF6F5F9F531873494C79C5BAA6454A459326C46036803E6F0E6E2EE
        E3E1EDE157966A2B654165A07694C79CFCFDFBF9FBFA3F93469DD0A76CB6745B
        AA6441874854A459318734036803E6F0E6E4EFE457966A2B65416BA67B9DD0A7
        FCFDFC4A964CAAD6B272BB7B72BB7B48935E56825967B06E54A4593187340368
        03E6F0E65E9B71326C4670AA809DD0A7FEFEFE67B06E63AC6863AC68569A5DF6
        F9F6F3F8F3568259568259568259568259E9F2E95E9B71326C4675AF85AAD6B2
        FEFEFEFDFEFDFDFEFDFCFDFBF9FBFAF8FAF8F6F9F6F4F9F4F1F7F1EFF6EFEDF5
        EDEBF3EB65A07639724B7BB58AAAD6B2FFFFFFFFFFFFFEFFFEFDFEFDFCFDFBF9
        FBFAF8FAF8F6FAF6F4F9F4F1F7F1EFF6EFEDF5ED65A07639724B7BB58AAAD6B2
        AAD6B29DD0A79DD0A794C79C94C79C94C79C8AB79581BC907BB58A75AF8570AA
        8070AA806BA67B39724B81BC907BB58A75AF8570AA806BA67B65A0765E9B7157
        966A548E664C87614C876146805C407A56407A5639724B39724B}
    end
    object btnCartao: TBitBtn
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Carta'
      TabOrder = 3
      OnClick = btnCartaoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
        77F07F773FFFFFFF77F70FFF7700000000007F337777777777770FFFFF0FFFFF
        FFF07F333F7F3FFFF3370FFF700F0000FFF07F3F777F777733370F707F0FFFFF
        FFF07F77337F3FFFFFF7007EEE0F000000F077FFFF7F777777370777770FFFFF
        FFF07777777F3FFFFFF7307EEE0F000000F03773FF7F7777773733707F0FFFFF
        FFF03337737F3FFF33373333700F000FFFF03333377F77733FF73333330FFFFF
        00003333337F3FF377773333330F00FF0F033333337F77337F733333330FFFFF
        00333333337FFFFF773333333300000003333333337777777333}
      NumGlyphs = 2
    end
    object btnImpCarta: TBitBtn
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imp.Carta'
      TabOrder = 4
      OnClick = btnImpCartaClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DD000DDDDDDDDDD000DD0000D000
        000000000000000D0000D0F8888888888888880D0000D0F8888888888888880D
        0000D0F8888888822899880D0000D0FFFFFFFFFFFFFFFF0D0000D70077777777
        7777007D0000DDD00000000000000DDD0000DDD00FFFFFFFFFF00DDD0000DDDD
        0F00000000F0DDDD0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00000000F0DDDD
        0000DDDD0FFFFFFFFFF0DDDD0000DDDD0F00FFFFFFF0DDDD0000DDDD0FFFFFFF
        FFF0DDDD0000DDDD000000000000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
    end
  end
  object dsDados: TDataSource
    DataSet = dmDados.cdsListaClientes
    OnDataChange = dsDadosDataChange
    Left = 480
    Top = 57
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsDados
    UserName = 'DBPipeline1'
    Left = 480
    Top = 305
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_CODIGO'
      FieldName = 'CDS_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'CDS_NOME'
      FieldName = 'CDS_NOME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'CDS_CGCCPF'
      FieldName = 'CDS_CGCCPF'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_CDGRUPO'
      FieldName = 'CDS_CDGRUPO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'CDS_NMGRUPO'
      FieldName = 'CDS_NMGRUPO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'CDS_NRBOX'
      FieldName = 'CDS_NRBOX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_QTPARC'
      FieldName = 'CDS_QTPARC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_QTPAGA'
      FieldName = 'CDS_QTPAGA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_QTABERTAS'
      FieldName = 'CDS_QTABERTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_VLPAGO'
      FieldName = 'CDS_VLPAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_VLDEBITO'
      FieldName = 'CDS_VLDEBITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_VLMULTA'
      FieldName = 'CDS_VLMULTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_VLJUROS'
      FieldName = 'CDS_VLJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_SUBTOTAL'
      FieldName = 'CDS_SUBTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 448
    Top = 305
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34925
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
        mmLeft = 3969
        mmTop = 3440
        mmWidth = 46567
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'LISTA DE LOJAS\COMODAT'#193'RIOS\LOCAT'#193'RIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 82815
        mmTop = 7408
        mmWidth = 99484
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'RELA'#199#195'O DE INADIMPLENTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 82815
        mmTop = 13494
        mmWidth = 51858
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'lblPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 82815
        mmTop = 18521
        mmWidth = 15536
        BandType = 0
      end
      object lblDia: TppLabel
        UserName = 'lblDia'
        Caption = 'lblDia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 83079
        mmTop = 23283
        mmWidth = 8001
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CDS_NOME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 529
        mmWidth = 78317
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CDS_CGCCPF'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 80698
        mmTop = 529
        mmWidth = 35454
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CDS_NRBOX'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 118004
        mmTop = 529
        mmWidth = 36777
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CDS_QTPARC'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 156104
        mmTop = 529
        mmWidth = 10000
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CDS_QTPAGA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 168275
        mmTop = 529
        mmWidth = 10000
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CDS_QTABERTAS'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 182034
        mmTop = 529
        mmWidth = 10000
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CDS_VLDEBITO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 212725
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CDS_VLPCATUAL'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3810
        mmLeft = 194205
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CDS_VLMULTA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 231246
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CDS_VLJUROS'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 246063
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CDS_SUBTOTAL'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 261673
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 1058
        mmWidth = 284428
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Data/Hora : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 223573
        mmTop = 3175
        mmWidth = 19050
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'P'#225'gina: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 229923
        mmTop = 7938
        mmWidth = 12700
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 244211
        mmTop = 3175
        mmWidth = 32015
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 244211
        mmTop = 7673
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 529
        mmTop = 2646
        mmWidth = 19770
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 1588
        mmWidth = 284428
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 21696
        mmTop = 2646
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Total Debito Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 529
        mmTop = 8202
        mmWidth = 31538
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'CDS_VLDEBITO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 35190
        mmTop = 8202
        mmWidth = 30163
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Total Debito Geral com Multa/Juros:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4374
        mmLeft = 529
        mmTop = 13758
        mmWidth = 59972
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'CDS_SUBTOTAL'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 61648
        mmTop = 14023
        mmWidth = 32544
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CDS_CDGRUPO'
      DataPipeline = ppDBPipeline1
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 529
          mmTop = 8731
          mmWidth = 10626
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'CDS_NMGRUPO'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          ReprintOnSubsequent = True
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3979
          mmLeft = 529
          mmTop = 3969
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 2381
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'CPF/CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 80698
          mmTop = 8731
          mmWidth = 17357
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'N'#186'. BOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 118004
          mmTop = 8731
          mmWidth = 13377
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'PC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 158486
          mmTop = 8731
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object ppMemo1: TppMemo
          UserName = 'Memo1'
          Caption = 'Memo1'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Lines.Strings = (
            'PC'
            'PAGA')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 8731
          mmLeft = 166688
          mmTop = 4233
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppMemo2: TppMemo
          UserName = 'Memo2'
          Caption = 'Memo2'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Lines.Strings = (
            'PC'
            'ABERTAS')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 8731
          mmLeft = 180446
          mmTop = 4233
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppMemo3: TppMemo
          UserName = 'Memo3'
          Caption = 'Memo3'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Lines.Strings = (
            'D'#201'BITO')
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 216430
          mmTop = 8731
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppMemo4: TppMemo
          UserName = 'Memo4'
          Caption = 'Memo4'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Lines.Strings = (
            'TOTAL'
            'D'#201'BITO')
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 8731
          mmLeft = 266965
          mmTop = 4498
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppMemo5: TppMemo
          UserName = 'Memo5'
          Caption = 'Memo5'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Lines.Strings = (
            'VALOR'
            'ATUAL PC')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 8731
          mmLeft = 194734
          mmTop = 4233
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppMemo6: TppMemo
          UserName = 'Memo6'
          Caption = 'Memo6'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Lines.Strings = (
            'MULTA')
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 230982
          mmTop = 8731
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppMemo7: TppMemo
          UserName = 'Memo7'
          Caption = 'Memo7'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Lines.Strings = (
            'JUROS')
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 246857
          mmTop = 8731
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 19315
        mmPrintPosition = 0
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Registro(s) do Grupo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 529
          mmTop = 2117
          mmWidth = 37592
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 39423
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 2381
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Total Debito Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 529
          mmTop = 8467
          mmWidth = 33147
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'CDS_VLDEBITO'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 35190
          mmTop = 8467
          mmWidth = 37571
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'CDS_VLDEBITO'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '###,###.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3704
          mmLeft = 212990
          mmTop = 2117
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'CDS_VLMULTA'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '###,###.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3704
          mmLeft = 231246
          mmTop = 2117
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'CDS_VLJUROS'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '###,###.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3704
          mmLeft = 246063
          mmTop = 2117
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'CDS_SUBTOTAL'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '###,###.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3704
          mmLeft = 261673
          mmTop = 2117
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Total Debito Grupo com Multa/Juros:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4374
          mmLeft = 529
          mmTop = 14023
          mmWidth = 61383
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'CDS_SUBTOTAL'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 63765
          mmTop = 14023
          mmWidth = 37571
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 392
    Top = 32
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 512
    Top = 56
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline2
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
    Left = 448
    Top = 345
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline2'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4022
        mmLeft = 23548
        mmTop = 794
        mmWidth = 22987
        BandType = 4
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'CDS_VLDEBITO'
        DataPipeline = ppDBPipeline2
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 49742
        mmTop = 794
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'CDS_CDGRUPO'
      DataPipeline = ppDBPipeline2
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline2'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 18521
        mmPrintPosition = 0
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'CDS_NMGRUPO'
          DataPipeline = ppDBPipeline2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline2'
          mmHeight = 3969
          mmLeft = 4763
          mmTop = 7408
          mmWidth = 78846
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'GRUPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 4763
          mmTop = 2646
          mmWidth = 12912
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'QT.BOLETOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 23548
          mmTop = 11906
          mmWidth = 22987
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 49477
          mmTop = 11906
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 2646
          mmLeft = 0
          mmTop = 794
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 0
          mmTop = 17198
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
      end
    end
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = dsDados
    UserName = 'DBPipeline2'
    Left = 480
    Top = 345
    object ppDBPipeline2ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_CODIGO'
      FieldName = 'CDS_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = 'CDS_NOME'
      FieldName = 'CDS_NOME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = 'CDS_CGCCPF'
      FieldName = 'CDS_CGCCPF'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object ppDBPipeline2ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_CDGRUPO'
      FieldName = 'CDS_CDGRUPO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline2ppField5: TppField
      FieldAlias = 'CDS_NMGRUPO'
      FieldName = 'CDS_NMGRUPO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object ppDBPipeline2ppField6: TppField
      FieldAlias = 'CDS_NRBOX'
      FieldName = 'CDS_NRBOX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDBPipeline2ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_QTPARC'
      FieldName = 'CDS_QTPARC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline2ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_QTPAGA'
      FieldName = 'CDS_QTPAGA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline2ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_QTABERTAS'
      FieldName = 'CDS_QTABERTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_VLPCATUAL'
      FieldName = 'CDS_VLPCATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline2ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_VLPAGO'
      FieldName = 'CDS_VLPAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline2ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_VLDEBITO'
      FieldName = 'CDS_VLDEBITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline2ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_VLMULTA'
      FieldName = 'CDS_VLMULTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPipeline2ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_VLJUROS'
      FieldName = 'CDS_VLJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDBPipeline2ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'CDS_SUBTOTAL'
      FieldName = 'CDS_SUBTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
  end
end
