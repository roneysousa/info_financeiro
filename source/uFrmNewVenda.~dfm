inherited frmNewVenda: TfrmNewVenda
  Left = 193
  Top = 129
  Caption = 'Pedido de Venda'
  ClientHeight = 511
  ClientWidth = 782
  PopupMenu = PopupMenu1
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 153
    Height = 511
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 151
      Height = 72
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 19
        Width = 29
        Height = 13
        Caption = '&Mesa:'
        FocusControl = edtNRMESA
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edtNRMESA: TEdit
        Left = 8
        Top = 35
        Width = 113
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        OnExit = edtNRMESAExit
        OnKeyPress = edtNRMESAKeyPress
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 73
      Width = 151
      Height = 437
      Align = alClient
      TabOrder = 1
      object dbGridMesas: TDBGrid
        Left = 1
        Top = 1
        Width = 149
        Height = 360
        Align = alClient
        Ctl3D = False
        DataSource = dsMesasOcupadas
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbGridMesasDblClick
        OnKeyDown = dbGridMesasKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'PRV_NRMESA'
            Title.Caption = 'N'#186'. Mesa'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 108
            Visible = True
          end>
      end
      object Panel8: TPanel
        Left = 1
        Top = 361
        Width = 149
        Height = 75
        Align = alBottom
        TabOrder = 1
        object btnTele: TBitBtn
          Left = 16
          Top = 10
          Width = 113
          Height = 25
          Caption = 'F7 - &Tele-Entrega'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnTeleClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333007007700
            703338F88FF33388FF333303300300330703338F388FF8F38FF3333333333338
            8803333333388F3FF833333333333300008833333333338888F3333333333064
            44083333333338F3338F3333333306666408333333338F33338F333333306640
            740333333338F33FF38F33333306640040333333338F3388F8F3333330664080
            0333333338F338F88F33333306640833333333338F338F333333333066408333
            33333338F338F33333333306640883333333338F338F33333333330760008333
            3333338F3338F33333333307644033333333338F3338F33333333307C6033333
            33333383FF8F333333333330003333333333333888F333333333}
          NumGlyphs = 2
        end
        object btnCozinha: TBitBtn
          Left = 16
          Top = 40
          Width = 113
          Height = 25
          Caption = 'F8 - Co&zinha'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnCozinhaClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF878FFFF
            FFFFFFFFF87837FFFFFFFFFFF87F878FFFFF70787883776887787FF88F878876
            8F7F7F877FF87887688F7FFFFFFF8888768F7FF88888F88887987FFFFFFFFF88
            87987FF888888FF8777F7FFFFFFFFFFF878F7FFFFFFFFFFFFF8F788888888888
            887F688888878888888F67777777FFFFFFFF88888888FFFFFFFF}
        end
      end
    end
  end
  inherited Panel2: TPanel
    Left = 153
    Width = 629
    Height = 511
    inherited pnlTopo: TPanel
      Top = 429
      Width = 627
      Height = 81
      inherited pnlBotoes: TPanel
        Width = 625
        Height = 79
        inherited BtAdicionar: TBitBtn
          Top = 16
          Hint = 'Incluir novo item no pedido'
        end
        inherited BtEditar: TBitBtn
          Top = 48
          Visible = False
        end
        inherited BtExcluir: TBitBtn
          Left = 88
          Top = 16
          Hint = 'Excluir item do pedido'
          OnClick = BtExcluirClick
        end
        inherited BtPesquisar: TBitBtn
          Left = 408
          Top = 48
          Visible = False
        end
        inherited BtCancelar: TBitBtn
          Left = 340
          Top = 16
          Hint = 'Cancelar altera'#231#245'es no pedido'
        end
        inherited BtGravar: TBitBtn
          Left = 420
          Top = 16
          Hint = 'Gravar Pedido'
        end
        inherited BtSair: TBitBtn
          Left = 489
          Top = 48
          Visible = False
        end
        object StatusBar1: TStatusBar
          Left = 1
          Top = 56
          Width = 623
          Height = 22
          Panels = <
            item
              Width = 320
            end
            item
              Width = 140
            end
            item
              Alignment = taRightJustify
              Width = 50
            end>
        end
        object btnCliente: TBitBtn
          Left = 171
          Top = 16
          Width = 75
          Height = 25
          Hint = 'Ver dados do cliente'
          Caption = 'C&liente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnClick = btnClienteClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF004A636B0029638C0042525A005A5A5A005A5A5A00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF004A6BB5004273CE00428CDE00398CDE002194D600186B9400315A6B00315A
            6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF004A6BB500427BD600427BD600428CDE003994EF003994EF003194F7002194
            EF00187BAD0021638C00525A5A0073737300FF00FF00FF00FF00FF00FF00FF00
            FF00317BBD00427BD600427BD600427BD600428CDE00398CDE003994EF003994
            EF003194F7003194FF00319CFF003194F70063636300FF00FF00FF00FF00FF00
            FF004273CE004273CE004273CE00427BD600427BD600428CDE003994EF003994
            EF003994F7003194F700319CFF00319CFF0063636300FF00FF00FF00FF00FF00
            FF00427BD6004273CE00426BBD004273BD00427BD600427BD600428CDE00398C
            DE003994EF003994EF003194F7003194FF0063636300FF00FF00FF00FF00FF00
            FF00398CD600426BB5004A6BB500426BBD004273CE00427BD600427BD600428C
            DE003994EF003994EF003994F7003194F70063636300FF00FF00FF00FF00FF00
            FF00426BB50039527B004263AD00425A9C0039527B00394A7300395A8C003963
            9C003973CE00398CDE003994EF003994EF0063636300FF00FF00FF00FF00FF00
            FF00426B9C00425A94004273BD004273BD004273BD004273BD0063ADCE00528C
            AD00425A7B0039527300396BAD003973BD0052525200FF00FF00FF00FF00FF00
            FF0042526B004273BD00427BD600427BD600427BD600427BD6005AB5EF0063BD
            F7004A94DE00427BD600427BD600427BD600394A6300FF00FF00FF00FF00FF00
            FF004A5263008CB5DE005294DE004A94DE00428CDE00428CDE00428CDE00428C
            DE00428CDE00428CDE00428CDE00428CDE00394A5A00FF00FF00FF00FF00FF00
            FF004A5A6B00425A7B00396BAD003173CE00529CEF006BADEF008CD6F70094D6
            FF008CD6F70073CEF7004AADF700429CF70042424A00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00183994003142520042526B00426B9C00396B
            AD004294EF00425A7B00396BAD00425A7B005A5A5A00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00397BD60021429C0021398C0029315A002931
            5A0018216300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF005294BD001852D6001852D6001039B5001031
            B50018296B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btnCupom: TBitBtn
          Left = 255
          Top = 16
          Width = 75
          Height = 25
          Caption = 'F9 Cup&om'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = btnCupomClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
            00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
            00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
            F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
            F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
            F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
            FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
            0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
            0033333337FFFFFF773333333000000003333333377777777333}
          NumGlyphs = 2
        end
        object btnFecharPedido: TBitBtn
          Left = 503
          Top = 16
          Width = 113
          Height = 25
          Caption = 'F2 Fechar &Pedido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnClick = btnFecharPedidoClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            777777777780008777777800080FBB07777770FBB08000808777780008770777
            0777777777770333077700000000077700070227777703330207027777000FBB
            0207077770770000770707777077707777070277770007777207022777777777
            2207000000000000000777777777777777777777777777777777}
        end
      end
    end
    inherited pclPrincipal: TPageControl
      Top = 81
      Width = 627
      Height = 348
      ActivePage = tbsConsulta
      inherited tbsCadastro: TTabSheet [0]
        Caption = 'F10 - Pedido'
        OnShow = tbsCadastroShow
        object grdConsultar: TDBGrid
          Left = 0
          Top = 0
          Width = 619
          Height = 232
          Align = alClient
          Ctl3D = False
          DataSource = dsItensPedidos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = grdConsultarDblClick
          OnKeyDown = grdConsultarKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'PVI_ITEM'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Caption = 'ITEM'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PVI_PRODUTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Caption = 'C'#211'DIGO'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PVI_NMPROD'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 240
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PVI_UNIDADE'
              Title.Alignment = taCenter
              Title.Caption = 'UND.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PVI_QUANTIDADE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'QUANT.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PVI_VALOR'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'VALOR UNT.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PVI_SUBTOTAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'SUB-TOTAL'
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
              FieldName = 'PVI_NMVEND'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Caption = 'ATENDENTE'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 154
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PVI_STATUS'
              Title.Alignment = taCenter
              Title.Caption = 'STATUS'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 68
              Visible = True
            end>
        end
        object plnDados: TPanel
          Left = 0
          Top = 232
          Width = 619
          Height = 88
          Align = alBottom
          TabOrder = 1
          object Label3: TLabel
            Left = 9
            Top = 8
            Width = 62
            Height = 13
            Caption = '&PRODUTO'
            FocusControl = dbeProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 171
            Top = 8
            Width = 82
            Height = 13
            Caption = '&QUANTIDADE'
            FocusControl = dbeQuantidade
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label5: TLabel
            Left = 288
            Top = 8
            Width = 76
            Height = 13
            Caption = '&ATENDENTE'
            FocusControl = dbeVendedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object sbLocProduto: TSpeedButton
            Left = 118
            Top = 23
            Width = 23
            Height = 22
            Hint = 'Localiza produto'
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
            OnClick = sbLocProdutoClick
          end
          object spVendedor: TSpeedButton
            Left = 353
            Top = 22
            Width = 23
            Height = 22
            Hint = 'Localiza vendedor'
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
            OnClick = spVendedorClick
          end
          object dbeProduto: TDBEdit
            Left = 9
            Top = 24
            Width = 110
            Height = 21
            Hint = 
              'Digite o c'#243'digo do produto ou pressione ESC para cancelar inclus' +
              #227'o'
            CharCase = ecUpperCase
            DataField = 'PVI_PRODUTO'
            DataSource = dsItensPedidos
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = dbeProdutoChange
            OnExit = dbeProdutoExit
            OnKeyPress = dbeProdutoKeyPress
          end
          object dbeDescricao: TDBEdit
            Left = 9
            Top = 52
            Width = 541
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'PVI_NMPROD'
            DataSource = dsItensPedidos
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object dbeQuantidade: TDBEdit
            Left = 145
            Top = 24
            Width = 100
            Height = 21
            DataField = 'PVI_QUANTIDADE'
            DataSource = dsItensPedidos
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 7
            ParentFont = False
            TabOrder = 1
            OnKeyPress = dbeQuantidadeKeyPress
          end
          object dbeVendedor: TDBEdit
            Left = 252
            Top = 24
            Width = 100
            Height = 21
            DataField = 'PVI_CDVENDEDOR'
            DataSource = dsItensPedidos
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = dbeVendedorChange
            OnExit = dbeVendedorExit
            OnKeyPress = dbeVendedorKeyPress
          end
          object dbeNMVEND: TDBEdit
            Left = 379
            Top = 24
            Width = 171
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'PVI_NMVEND'
            DataSource = dsItensPedidos
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object btnSalvar: TBitBtn
            Left = 551
            Top = 24
            Width = 23
            Height = 22
            Hint = 'Gravar item'
            TabOrder = 5
            OnClick = btnSalvarClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
              840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
              C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
              F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
              FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
              1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
              0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F0F0F
              1D111111110E0A08031F1F0A0E11131D1F1D1111110E0B09041F1F0C11131D1F
              1D1F1D11110E0B0A051F1F0E131D1F1D11111F1D0F0C0A0A061F1F0F13131D11
              1111111F1D0B0A0A061F1F131515131311100F0F1F1D0A0A061F1F1318181514
              13130F0E0C1F1D0A061F1F151A1916151514110F0E0C1F0A061F1F181C1A1817
              16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
              1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
          end
          object btnCancelar: TBitBtn
            Left = 577
            Top = 24
            Width = 23
            Height = 22
            Hint = 'Cancelar altera'#231#227'o do item'
            TabOrder = 6
            OnClick = btnCancelarClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
              840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
              C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
              F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
              FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
              1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
              0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F1F1D
              111111111D1F0A08031F1F0A0E11131F1D11111D1F0E0B09041F1F0C11131111
              1F1D1D1F110E0B0A051F1F0E13111111111F1D110F0C0A0A061F1F0F13131111
              1D1F1F1D0E0B0A0A061F1F131515131D1F100F1F1D0A0A0A061F1F1318181D1F
              13130F0E1F1D0A0A061F1F151A191F151514110F0E1F0A0A061F1F181C1A1817
              16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
              1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
          end
        end
      end
      inherited tbsConsulta: TTabSheet [1]
        Caption = 'F11 - Consulta'
        TabVisible = True
        OnShow = tbsConsultaShow
        inherited DBGrid1: TDBGrid
          Top = 73
          Width = 619
          Height = 136
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
          OnDblClick = DBGrid1DblClick
          OnKeyDown = DBGrid1KeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'MOV_PEDIDO'
              Title.Caption = 'PEDIDO'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 54
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'MOV_NRMESA'
              Title.Caption = 'N'#186'.MESA'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOV_DATAVENDA'
              Title.Alignment = taCenter
              Title.Caption = 'DATA'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOV_HORAVENDA'
              Title.Alignment = taCenter
              Title.Caption = 'HORA'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
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
              Title.Font.Style = [fsBold]
              Width = 258
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
              Title.Font.Style = [fsBold]
              Width = 101
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
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 619
          Height = 73
          Align = alTop
          TabOrder = 1
          object Label9: TLabel
            Left = 160
            Top = 16
            Width = 36
            Height = 13
            Caption = 'Per'#237'odo'
            Transparent = True
          end
          object Label10: TLabel
            Left = 286
            Top = 34
            Width = 6
            Height = 13
            Caption = #224
            Transparent = True
          end
          object rgConsultar: TRadioGroup
            Left = 6
            Top = 4
            Width = 143
            Height = 62
            Caption = '[ Situa'#231#227'o ]'
            ItemIndex = 0
            Items.Strings = (
              '&Fechadas'
              'Ca&nceladas')
            TabOrder = 0
          end
          object dbeDTINIC: TDateEdit
            Left = 160
            Top = 32
            Width = 121
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
            OnExit = dbeDTINICExit
          end
          object dbeDTFINA: TDateEdit
            Left = 304
            Top = 31
            Width = 121
            Height = 21
            NumGlyphs = 2
            TabOrder = 2
            OnExit = dbeDTFINAExit
          end
          object btnConsultar: TBitBtn
            Left = 452
            Top = 28
            Width = 75
            Height = 25
            Hint = 'Consultar'
            Caption = '&Consultar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = btnConsultarClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600D4F0FF00B1E2FF008ED4FF006BC6FF0048B8FF0025AAFF0000AAFF000092
              DC00007AB90000629600004A730000325000D4E3FF00B1C7FF008EABFF006B8F
              FF004873FF002557FF000055FF000049DC00003DB90000319600002573000019
              5000D4D4FF00B1B1FF008E8EFF006B6BFF004848FF002525FF000000FF000000
              DC000000B900000096000000730000005000E3D4FF00C7B1FF00AB8EFF008F6B
              FF007348FF005725FF005500FF004900DC003D00B90031009600250073001900
              5000F0D4FF00E2B1FF00D48EFF00C66BFF00B848FF00AA25FF00AA00FF009200
              DC007A00B900620096004A00730032005000FFD4FF00FFB1FF00FF8EFF00FF6B
              FF00FF48FF00FF25FF00FF00FF00DC00DC00B900B90096009600730073005000
              5000FFD4F000FFB1E200FF8ED400FF6BC600FF48B800FF25AA00FF00AA00DC00
              9200B9007A009600620073004A0050003200FFD4E300FFB1C700FF8EAB00FF6B
              8F00FF487300FF255700FF005500DC004900B9003D0096003100730025005000
              1900FFD4D400FFB1B100FF8E8E00FF6B6B00FF484800FF252500FF000000DC00
              0000B9000000960000007300000050000000FFE3D400FFC7B100FFAB8E00FF8F
              6B00FF734800FF572500FF550000DC490000B93D000096310000732500005019
              0000FFF0D400FFE2B100FFD48E00FFC66B00FFB84800FFAA2500FFAA0000DC92
              0000B97A000096620000734A000050320000FFFFD400FFFFB100FFFF8E00FFFF
              6B00FFFF4800FFFF2500FFFF0000DCDC0000B9B9000096960000737300005050
              0000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF4800AAFF2500AAFF000092DC
              00007AB90000629600004A73000032500000E3FFD400C7FFB100ABFF8E008FFF
              6B0073FF480057FF250055FF000049DC00003DB9000031960000257300001950
              0000D4FFD400B1FFB1008EFF8E006BFF6B0048FF480025FF250000FF000000DC
              000000B90000009600000073000000500000D4FFE300B1FFC7008EFFAB006BFF
              8F0048FF730025FF570000FF550000DC490000B93D0000963100007325000050
              1900D4FFF000B1FFE2008EFFD4006BFFC60048FFB80025FFAA0000FFAA0000DC
              920000B97A000096620000734A0000503200D4FFFF00B1FFFF008EFFFF006BFF
              FF0048FFFF0025FFFF0000FFFF0000DCDC0000B9B90000969600007373000050
              5000F2F2F200E6E6E600DADADA00CECECE00C2C2C200B6B6B600AAAAAA009E9E
              9E0092929200868686007A7A7A006E6E6E0062626200565656004A4A4A003E3E
              3E0032323200262626001A1A1A000E0E0E00F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFF2F2F2
              F2F2F2F2F2F2F2FFFFFFFFFFF2EBE7E4E4E4E4E4E4E5F2F3F3FFFFF2E2F0E7E3
              E3E3E3E3E3EE1D0F1FF3F2EBF0EEE3E3E2E2E2E2EE1D0C241DF3F2E4E3E3E3E3
              E4E8E8EE1D0C241DF3FFF2E3E3E3E6EDF0F0F0F00C241DF3FFFFF2E3E3E6ED85
              858586791B1DF3FFFFFFF2E3E6EDE8839090858679F0F2FFFFFFF2E3E6ED838E
              8F90908586F0F2FFFFFFF2E3E6ED838E8F8F909086F0F2FFFFFFF2E3E6ED838E
              8F8F8F9086F0F2FFFFFFF2E3E4EDE6838E8F8F83E8F0F2FFFFFFF2E3E4E6EDE6
              838383E8F3E6F2FFFFFFF2E3E4E4E6EDEDEDEDEDE6E3F2FFFFFFF2E2E3E3E3E3
              E6E6E6E6E3E3F2FFFFFFF2F2F2F2F2F2F2F2F2F2F2F2F2FFFFFF}
          end
        end
        object pnlDetalhes: TPanel
          Left = 0
          Top = 209
          Width = 619
          Height = 111
          Align = alBottom
          TabOrder = 2
          object DBNavigator1: TDBNavigator
            Left = 1
            Top = 1
            Width = 617
            Height = 21
            DataSource = dsConsItens
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alTop
            TabOrder = 0
          end
          object DBGrid3: TDBGrid
            Left = 1
            Top = 22
            Width = 617
            Height = 88
            Align = alClient
            DataSource = dsConsItens
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = DBGrid3KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'MOP_PRODUTO'
                Title.Caption = 'C'#211'DIGO'
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOP_NMPROD'
                Title.Caption = 'DESCRI'#199#195'O'
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = [fsBold]
                Width = 234
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOP_QUANTIDADE'
                Title.Alignment = taCenter
                Title.Caption = 'QUANT.'
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = [fsBold]
                Width = 49
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'MOP_UNIDADE'
                Title.Alignment = taCenter
                Title.Caption = 'UND.'
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOP_VALOR'
                Title.Alignment = taRightJustify
                Title.Caption = 'VALOR UNIT.'
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = [fsBold]
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOP_NMVEND'
                Title.Caption = 'ATENDENTE'
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = [fsBold]
                Width = 157
                Visible = True
              end>
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 627
      Height = 80
      Align = alTop
      Enabled = False
      TabOrder = 2
      object Label2: TLabel
        Left = 16
        Top = 1
        Width = 70
        Height = 13
        Caption = 'N'#186'. PEDIDO'
        FocusControl = DBEdit1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 39
        Width = 53
        Height = 13
        Caption = 'N'#186'.MESA'
        FocusControl = DBEdit2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 125
        Top = 39
        Width = 107
        Height = 13
        Caption = 'DATA DO PEDIDO'
        FocusControl = DBEdit3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label8: TLabel
        Left = 275
        Top = 39
        Width = 17
        Height = 13
        Caption = 'ST'
        FocusControl = DBEdit4
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 15
        Width = 100
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'PRV_PEDIDO'
        DataSource = dsrCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 54
        Width = 100
        Height = 21
        TabStop = False
        DataField = 'PRV_NRMESA'
        DataSource = dsrCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 125
        Top = 54
        Width = 134
        Height = 21
        TabStop = False
        DataField = 'PRV_DATAVENDA'
        DataSource = dsrCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Visible = False
      end
      object DBEdit4: TDBEdit
        Left = 269
        Top = 54
        Width = 29
        Height = 21
        Hint = 'Situa'#231#227'o do Pedido'
        TabStop = False
        DataField = 'PRV_SITUACAO'
        DataSource = dsrCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Visible = False
      end
      object Panel7: TPanel
        Left = 353
        Top = 1
        Width = 273
        Height = 78
        Hint = 'Total do Pedido'
        Align = alRight
        Color = clRed
        TabOrder = 4
        object DBText1: TDBText
          Left = 107
          Top = 16
          Width = 150
          Height = 45
          Alignment = taRightJustify
          AutoSize = True
          DataField = 'PRV_VALOR'
          DataSource = dsrCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -32
          Font.Name = 'Arial Black'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
      end
    end
  end
  inherited dsrCadastro: TDataSource
    DataSet = dmDados.cdsPreVenda
    OnDataChange = dsrCadastroDataChange
    Left = 168
    Top = 168
  end
  inherited dsrPesquisa: TDataSource
    DataSet = cdsConsultar
    OnDataChange = dsrPesquisaDataChange
    Left = 208
    Top = 168
  end
  object dsItensPedidos: TDataSource [4]
    AutoEdit = False
    DataSet = dmDados.cdsItensVenda
    OnDataChange = dsItensPedidosDataChange
    Left = 360
    Top = 200
  end
  object dsMesasOcupadas: TDataSource [5]
    DataSet = dmDados.cdsMesasOcupadas
    Left = 89
    Top = 217
  end
  object Timer1: TTimer [6]
    OnTimer = Timer1Timer
    Left = 510
    Top = 161
  end
  object dstConsulta: TSQLDataSet [7]
    CommandText = 
      'select M.MOV_PEDIDO, M.MOV_CUPOM, M.MOV_LOJA, M.MOV_DATAVENDA, M' +
      '.MOV_CLIENTE, M.MOV_VALOR, M.MOV_NOMECLIENTE, M.MOV_SITUACAO, M.' +
      'MOV_VENDEDOR,'#13#10'M.MOV_DESCONTO, M.MOV_HORAVENDA, M.MOV_TABELA, '#13#10 +
      'M. MOV_ACRESCIMO, M.MOV_TIPO_FRETE, M.MOV_PERC_FRETE, M.MOV_IDTR' +
      'ANSPORTADORA, M.MOV_TABELA_PLANO, M.MOV_NRMESA,'#13#10'(Select E.EMP_F' +
      'ANTASIA from EMPRESAS E Where (E.EMP_CODIGO = M.MOV_LOJA)) as MO' +
      'V_NMLOJA from VENDAS M'#13#10'Where (M.MOV_DATAVENDA >= :pDTINIC) and ' +
      '(M.MOV_DATAVENDA <= :pDTFINA) AND (M.MOV_SITUACAO = :pSITUACAO)'#13 +
      #10'order by M.MOV_PEDIDO'
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
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 222
    Top = 249
  end
  object dspConsultar: TDataSetProvider [8]
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 262
    Top = 249
  end
  object cdsConsultar: TClientDataSet [9]
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultar'
    Left = 310
    Top = 249
    object cdsConsultarMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultarMOV_CUPOM: TIntegerField
      FieldName = 'MOV_CUPOM'
    end
    object cdsConsultarMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
    end
    object cdsConsultarMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsConsultarMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
    end
    object cdsConsultarMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultarMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      Size = 40
    end
    object cdsConsultarMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsultarMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
    end
    object cdsConsultarMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsConsultarMOV_HORAVENDA: TStringField
      FieldName = 'MOV_HORAVENDA'
      FixedChar = True
      Size = 5
    end
    object cdsConsultarMOV_TABELA: TIntegerField
      FieldName = 'MOV_TABELA'
    end
    object cdsConsultarMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object cdsConsultarMOV_TIPO_FRETE: TStringField
      FieldName = 'MOV_TIPO_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsConsultarMOV_PERC_FRETE: TFMTBCDField
      FieldName = 'MOV_PERC_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsConsultarMOV_IDTRANSPORTADORA: TIntegerField
      FieldName = 'MOV_IDTRANSPORTADORA'
    end
    object cdsConsultarMOV_TABELA_PLANO: TIntegerField
      FieldName = 'MOV_TABELA_PLANO'
    end
    object cdsConsultarMOV_NMLOJA: TStringField
      FieldName = 'MOV_NMLOJA'
      ReadOnly = True
      Size = 50
    end
    object cdsConsultarMOV_NRMESA: TStringField
      FieldName = 'MOV_NRMESA'
      Size = 6
    end
  end
  object dstConsItens: TSQLDataSet [10]
    CommandText = 'select * from PROVENDAS Where (MOP_PEDIDO = :pPEDIDO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 214
    Top = 289
  end
  object dspConsItens: TDataSetProvider [11]
    DataSet = dstConsItens
    Options = [poAllowCommandText]
    Left = 254
    Top = 289
  end
  object cdsConsItens: TClientDataSet [12]
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsItens'
    OnCalcFields = cdsConsItensCalcFields
    Left = 294
    Top = 289
    object cdsConsItensMOP_PEDIDO: TIntegerField
      FieldName = 'MOP_PEDIDO'
    end
    object cdsConsItensMOP_PRODUTO: TStringField
      FieldName = 'MOP_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsConsItensMOP_QUANTIDADE: TFMTBCDField
      FieldName = 'MOP_QUANTIDADE'
      DisplayFormat = '##0.#0'
      EditFormat = '##0.#0'
      Precision = 18
      Size = 3
    end
    object cdsConsItensMOP_UNIDADE: TStringField
      FieldName = 'MOP_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsConsItensMOP_VALOR: TFMTBCDField
      FieldName = 'MOP_VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsItensMOP_DESCONTO: TFMTBCDField
      FieldName = 'MOP_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsConsItensMOP_SERIE: TStringField
      FieldName = 'MOP_SERIE'
      Size = 30
    end
    object cdsConsItensMOP_CUSTO: TFMTBCDField
      FieldName = 'MOP_CUSTO'
      Precision = 18
      Size = 2
    end
    object cdsConsItensMOP_COMPRA: TFMTBCDField
      FieldName = 'MOP_COMPRA'
      Precision = 18
      Size = 2
    end
    object cdsConsItensMOP_CODCOR: TIntegerField
      FieldName = 'MOP_CODCOR'
    end
    object cdsConsItensMOP_VALIPI: TFMTBCDField
      FieldName = 'MOP_VALIPI'
      Precision = 18
      Size = 2
    end
    object cdsConsItensMOP_CDVENDEDOR: TIntegerField
      FieldName = 'MOP_CDVENDEDOR'
    end
    object cdsConsItensMOP_NMPROD: TStringField
      FieldKind = fkCalculated
      FieldName = 'MOP_NMPROD'
      Size = 60
      Calculated = True
    end
    object cdsConsItensMOP_NMVEND: TStringField
      FieldKind = fkCalculated
      FieldName = 'MOP_NMVEND'
      Size = 40
      Calculated = True
    end
  end
  object dsConsItens: TDataSource [13]
    DataSet = cdsConsItens
    Left = 334
    Top = 289
  end
  object PopupMenu1: TPopupMenu
    Left = 466
    Top = 25
    object CancelarPedido1: TMenuItem
      Caption = '&Cancelar Pedido'
      OnClick = CancelarPedido1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CupomPedido1: TMenuItem
      Caption = 'Cupom Pedido'
      OnClick = btnCupomClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object eleEntrega1: TMenuItem
      Caption = 'Tele-Entrega'
      OnClick = btnTeleClick
    end
    object Cozinha1: TMenuItem
      Caption = 'Cozinha'
      OnClick = btnCozinhaClick
    end
  end
end
