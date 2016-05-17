inherited frmCadClientesNew: TfrmCadClientesNew
  Left = 194
  Top = 107
  Caption = 'Cadastro de Lojas\Comodat'#225'rios\Locat'#225'rios'
  ClientHeight = 600
  ClientWidth = 733
  OldCreateOrder = True
  PopupMenu = PopupMenu1
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 733
    Height = 571
    inherited TabSheet1: TTabSheet
      inherited Panel1: TPanel
        Top = 501
        Width = 725
        inherited BtCancelar: TBitBtn
          Left = 371
        end
        inherited BtGravar: TBitBtn
          Left = 451
        end
        inherited BtSair: TBitBtn
          Left = 635
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 725
        Height = 101
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 10
          Top = 5
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object DBText1: TDBText
          Left = 10
          Top = 21
          Width = 79
          Height = 22
          AutoSize = True
          Color = clBtnFace
          DataField = 'CLI_CODIGO'
          DataSource = Dm.DsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 48
          Width = 118
          Height = 13
          Caption = 'Comodat'#225'rios\Locat'#225'rios'
          FocusControl = DBEdit5
        end
        object Label10: TLabel
          Left = 544
          Top = 48
          Width = 36
          Height = 13
          Caption = 'N'#186'. Box'
          FocusControl = DBEdit5
        end
        object DBNavigator1: TDBNavigator
          Left = 128
          Top = 16
          Width = 224
          Height = 25
          DataSource = dsConsClientes
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
          OnClick = DBNavigator1Click
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 64
          Width = 530
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          DataField = 'CLI_RAZAO'
          DataSource = dsCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnExit = dbeRazaoExit
        end
        object DBEdit7: TDBEdit
          Left = 544
          Top = 64
          Width = 175
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          DataField = 'CLI_NRBOX'
          DataSource = dsCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 101
        Width = 725
        Height = 400
        ActivePage = tbPessoais
        Align = alClient
        TabOrder = 2
        object tbPessoais: TTabSheet
          Caption = 'Pessoais'
          object lblCPFCNPJ: TLabel
            Left = 208
            Top = 4
            Width = 52
            Height = 13
            Caption = 'CPF/CNPJ'
            FocusControl = dbeNRCNPJ
          end
          object lblRazao: TLabel
            Left = 8
            Top = 48
            Width = 96
            Height = 13
            Caption = 'Raz'#227'o Social/Nome'
            FocusControl = dbeRazao
          end
          object lblFantasia: TLabel
            Left = 8
            Top = 88
            Width = 111
            Height = 13
            Caption = 'Nome Fantasia/Apelido'
            FocusControl = dbeNMCLIE
          end
          object lblIdentedade: TLabel
            Left = 8
            Top = 128
            Width = 50
            Height = 13
            Caption = 'Identidade'
            FocusControl = DBEdit4
          end
          object lblEstCivil: TLabel
            Left = 352
            Top = 128
            Width = 55
            Height = 13
            Caption = 'Estado Civil'
            FocusControl = cmbEstCivil
          end
          object Label7: TLabel
            Left = 8
            Top = 167
            Width = 48
            Height = 13
            Caption = 'Telefone1'
            FocusControl = dbeNRFONE
          end
          object Label8: TLabel
            Left = 145
            Top = 167
            Width = 48
            Height = 13
            Caption = 'Telefone2'
            FocusControl = DBEdit6
          end
          object lblOragao: TLabel
            Left = 209
            Top = 128
            Width = 68
            Height = 13
            Caption = #211'rg'#227'o Emissor'
            FocusControl = dbeOrgao
          end
          object lblUfEmissor: TLabel
            Left = 295
            Top = 128
            Width = 53
            Height = 13
            Caption = 'UF Emissor'
          end
          object Label28: TLabel
            Left = 273
            Top = 165
            Width = 82
            Height = 13
            Caption = 'Data de cadastro'
          end
          object Label57: TLabel
            Left = 400
            Top = 167
            Width = 97
            Height = 13
            Caption = 'Data de Nascimento'
          end
          object Label51: TLabel
            Left = 8
            Top = 249
            Width = 42
            Height = 13
            Caption = 'Situa'#231#227'o'
          end
          object Label52: TLabel
            Left = 209
            Top = 248
            Width = 71
            Height = 13
            Caption = 'Tipo de Cliente'
            FocusControl = DBLookupComboBox5
            Transparent = True
          end
          object Label2: TLabel
            Left = 8
            Top = 208
            Width = 102
            Height = 13
            Caption = 'Grau de Escolaridade'
            FocusControl = DBEdit1
            Transparent = True
          end
          object Label4: TLabel
            Left = 352
            Top = 208
            Width = 119
            Height = 13
            Caption = 'Descri'#231#227'o da Defici'#234'ncia'
            FocusControl = dbeDescDeficiencia
            Transparent = True
          end
          object Label25: TLabel
            Left = 8
            Top = 290
            Width = 36
            Height = 13
            Caption = 'N'#186'. Box'
            FocusControl = dbeNRBOX
            Transparent = True
          end
          object Label6: TLabel
            Left = 209
            Top = 290
            Width = 29
            Height = 13
            Caption = 'Grupo'
            FocusControl = DBLookupComboBox3
            Transparent = True
          end
          object Label20: TLabel
            Left = 8
            Top = 329
            Width = 83
            Height = 13
            Caption = 'Tipo de Atividade'
          end
          object rbTipoPessoa: TDBRadioGroup
            Left = 6
            Top = 5
            Width = 185
            Height = 37
            Caption = '[ Tipo de Pessoa ]'
            Columns = 2
            DataField = 'CLI_TIPOPESSOA'
            DataSource = dsCadastro
            Items.Strings = (
              'F'#237'sica'
              'Jur'#237'dica')
            TabOrder = 0
            Values.Strings = (
              'F'
              'J')
            OnChange = rbTipoPessoaChange
            OnClick = rbTipoPessoaClick
          end
          object dbeNRCNPJ: TDBEdit
            Left = 208
            Top = 20
            Width = 186
            Height = 21
            DataField = 'CLI_CGC'
            DataSource = dsCadastro
            TabOrder = 1
            OnEnter = dbeNRCNPJEnter
            OnExit = dbeNRCNPJExit
          end
          object dbeRazao: TDBEdit
            Left = 8
            Top = 64
            Width = 530
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CLI_RAZAO'
            DataSource = dsCadastro
            TabOrder = 2
            OnExit = dbeRazaoExit
          end
          object dbeNMCLIE: TDBEdit
            Left = 8
            Top = 104
            Width = 530
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CLI_FANTASIA'
            DataSource = dsCadastro
            TabOrder = 3
          end
          object imgCliente: TDBImage
            Left = 424
            Top = 259
            Width = 105
            Height = 105
            Hint = 'D'#234' um duplo clique para procurar foto do cliente'
            DataField = 'CLI_FOTOCLIENTE'
            DataSource = Dm.DsClientes
            Enabled = False
            Stretch = True
            TabOrder = 17
            Visible = False
          end
          object btProcurar: TBitBtn
            Left = 557
            Top = 199
            Width = 75
            Height = 25
            Hint = 'Procurar foto do cliente no computador'
            Caption = 'P&rocurar'
            Enabled = False
            TabOrder = 18
            OnClick = btProcurarClick
            Glyph.Data = {
              F6040000424DF604000000000000360000002800000015000000130000000100
              180000000000C004000000000000000000000000000000000000FEEDE0FEECDE
              FEEBDCFDE9DAFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DC
              C4F7D7BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DCC4F7D7
              BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DCC4F7D7
              BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8B08060B08060B08060D5B197A070508048308048208040208040
              20804020803810803810803010703010703010EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFA07060FFE8F0D0A890C09880C090
              80A08070907860806850503830504840703010EABB99E8B69300FEEDE0FEECDE
              FEEBDCB08060B08060D6B299A070508048308048208040208040208040208038
              10803810803010703010703010403830803010EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8FDE7D5FDE6D3A07060FFE8F0D0A890C09880C09080A080709078
              60806850503830504840703010504040803810EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8B08870D6B299A07860FFE8F0FFF8FFF0D8D0E0B0A0D09880C098
              80503830A08870403830803010F0C0A0803810EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8FDE7D5F9E0CCB08060B0A090FFF8FFF0D8D0E0B0A0D0A8907058
              50C0B8B0706860504040803810F0C0B0804020EABB99E8B69300FEEDE0FEECDE
              FEEBDCC08870B08060D6B299B08870F0E0E0B09890FFF0F0F0D8D0705840A088
              80A09080503830F0C0A0803810F0C8C0804020EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8FDE7D5FDE6D3B09070FFFFFFE0D8D0B09890A08880C0A8A0C0A8
              A0C0A8A0FFD8D0F0C0B0804020F0D0C0804020EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8B08870D6B299C09880FFFFFFFFFFFFE0E0D0F0D8D0E0E0F05068
              D03058D0D0C0D0F0C8C0804020F0D8D0804820EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8FDE7D5F9E0CCC0A080FFFFFFFFFFFFFFFFFFFFFFFF6070D050A0
              F02078D03048C0F0D0C0804020FFF0F0804830EABB99E8B69300FEEDE0FEECDE
              FEEBDCC08870B08060D6B299C0A090FFFFFFFFF8FFFFF8FFFFFFFF9098D090C0
              F050A8F06070C0F0D8D0804820A07060A07050EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8FDE7D5FDE6D3C0A890FFFFFFFFFFFFFFFFFFFFFFFFE0E8F0A0A8
              E09098D0F0E8F0FFF0F0804830ECC09FEABB99EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8FDE7D5FDE6D3D0A890C0A890C0A090C0A080C09880B09070B088
              70B08060A07860A07060A07050ECC09FEABB99EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DCC4F7D7
              BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99EABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE9DAFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DC
              C4F7D7BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99E8B69300FEEDE0FEECDE
              FEEBDCFDE9DAFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DC
              C4F7D7BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99E8B69300}
          end
          object DBEdit4: TDBEdit
            Left = 8
            Top = 144
            Width = 192
            Height = 21
            DataField = 'CLI_INSCESTADUAL'
            DataSource = dsCadastro
            TabOrder = 4
            OnKeyPress = DBEdit4KeyPress
          end
          object cmbEstCivil: TDBLookupComboBox
            Left = 352
            Top = 144
            Width = 186
            Height = 21
            DataField = 'CLI_DESC_EST_CIVIL'
            DataSource = dsCadastro
            TabOrder = 7
          end
          object dbeNRFONE: TDBEdit
            Left = 8
            Top = 183
            Width = 121
            Height = 21
            DataField = 'CLI_FONE1'
            DataSource = dsCadastro
            TabOrder = 8
            OnExit = dbeNRFONEExit
          end
          object DBEdit6: TDBEdit
            Left = 145
            Top = 183
            Width = 121
            Height = 21
            DataField = 'CLI_FONE2'
            DataSource = dsCadastro
            TabOrder = 9
          end
          object dbeOrgao: TDBEdit
            Left = 209
            Top = 144
            Width = 80
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CLI_ORGAOEMISSOR'
            DataSource = dsCadastro
            TabOrder = 5
          end
          object cmbUFEMISSOR: TDBComboBox
            Left = 295
            Top = 144
            Width = 50
            Height = 22
            Style = csOwnerDrawFixed
            DataField = 'CLI_UFEMISSOR'
            DataSource = Dm.DsClientes
            ItemHeight = 16
            Items.Strings = (
              'AC'
              'AL'
              'AM'
              'AP'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MG'
              'MS'
              'MT'
              'PA'
              'PB'
              'PE'
              'PR'
              'PI'
              'RJ'
              'RN'
              'RO'
              'RR'
              'RS'
              'SC'
              'SE'
              'SP'
              'TO')
            TabOrder = 6
          end
          object DBDateEdit1: TDBDateEdit
            Left = 273
            Top = 183
            Width = 121
            Height = 21
            DataField = 'CLI_DATACAD'
            DataSource = Dm.DsClientes
            NumGlyphs = 2
            TabOrder = 10
          end
          object dbeDTNASC: TDBDateEdit
            Left = 400
            Top = 183
            Width = 121
            Height = 21
            DataField = 'CLI_DTANIVERSARIO'
            DataSource = Dm.DsClientes
            NumGlyphs = 2
            TabOrder = 11
            OnExit = dbeDTNASCExit
          end
          object DBLookupComboBox2: TDBLookupComboBox
            Left = 8
            Top = 265
            Width = 192
            Height = 21
            DataField = 'CLI_NOME_SITUACAO'
            DataSource = Dm.DsClientes
            TabOrder = 15
          end
          object DBLookupComboBox5: TDBLookupComboBox
            Left = 209
            Top = 264
            Width = 204
            Height = 21
            DataField = 'TIPOCLIENTE'
            DataSource = Dm.DsClientes
            TabOrder = 16
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 224
            Width = 192
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CLI_GRAU_ESCOLARIDADE'
            DataSource = dsCadastro
            TabOrder = 12
          end
          object rgDeficiencia: TDBRadioGroup
            Left = 209
            Top = 208
            Width = 137
            Height = 39
            Caption = '[ Portador de Defici'#234'ncia ]'
            Columns = 2
            DataField = 'CLI_FLPORTADOR_DEFICIENCIA'
            DataSource = dsCadastro
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 13
            TabStop = True
            Values.Strings = (
              'S'
              'N')
            OnClick = rgDeficienciaClick
          end
          object dbeDescDeficiencia: TDBEdit
            Left = 352
            Top = 224
            Width = 186
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CLI_DESCRICAO_DEFICIENCIA'
            DataSource = dsCadastro
            TabOrder = 14
          end
          object PnlImagem: TPanel
            Left = 560
            Top = 14
            Width = 145
            Height = 177
            BevelInner = bvRaised
            BorderWidth = 1
            BorderStyle = bsSingle
            TabOrder = 19
            object imgFoto: TImage
              Left = 3
              Top = 3
              Width = 135
              Height = 167
              Align = alClient
              AutoSize = True
              Stretch = True
            end
          end
          object dbeNRBOX: TDBEdit
            Left = 8
            Top = 306
            Width = 192
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CLI_NRBOX'
            DataSource = Dm.DsClientes
            TabOrder = 20
          end
          object DBLookupComboBox3: TDBLookupComboBox
            Left = 209
            Top = 306
            Width = 204
            Height = 21
            DataField = 'CLI_NMGRUPO'
            DataSource = Dm.DsClientes
            TabOrder = 21
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 8
            Top = 344
            Width = 405
            Height = 21
            DataField = 'CLI_NOME_ATIV'
            DataSource = Dm.DsClientes
            TabOrder = 22
          end
          object btnSalvarPasta: TBitBtn
            Left = 558
            Top = 231
            Width = 147
            Height = 25
            Hint = 'Clique aqui para salvar a foto em uma pasta do computador'
            Caption = 'Salvar em Pasta'
            Enabled = False
            TabOrder = 24
            OnClick = btnSalvarPastaClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777770080000000800770330888887703077033088888770307703308888877
              0307703300000000030770333333333333077030000000003307703077777777
              0307703077777777030770307777777703077030777777770307703077777777
              0007703077777777070770000000000000077777777777777777}
          end
          object btnCaptura: TBitBtn
            Left = 632
            Top = 199
            Width = 75
            Height = 25
            Hint = 'Capturar da WebCam'
            Caption = 'Capturar'
            TabOrder = 23
            OnClick = btnCapturaClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              77777777777777777777777800000008777777707777777077007770788F8870
              008077707777777080807770777887707070777078800870F070777080088070
              00F0007008877070770008088770000877770F07700777777777007007777777
              7777777777777777777777777777777777777777777777777777}
          end
        end
        object tbEndereco: TTabSheet
          Caption = 'Endere'#231'o'
          ImageIndex = 1
          object GroupBox1: TGroupBox
            Left = 9
            Top = 3
            Width = 657
            Height = 150
            Caption = '[ Resid'#234'ncial ]'
            TabOrder = 0
            object Label12: TLabel
              Left = 8
              Top = 20
              Width = 21
              Height = 13
              Caption = 'CEP'
            end
            object Label13: TLabel
              Left = 96
              Top = 20
              Width = 46
              Height = 13
              Caption = 'Endere'#231'o'
            end
            object Label14: TLabel
              Left = 569
              Top = 20
              Width = 37
              Height = 13
              Caption = 'N'#250'mero'
            end
            object Label15: TLabel
              Left = 8
              Top = 60
              Width = 14
              Height = 13
              Caption = 'UF'
            end
            object Label16: TLabel
              Left = 82
              Top = 60
              Width = 33
              Height = 13
              Caption = 'Cidade'
              FocusControl = cmbCidade
            end
            object Label17: TLabel
              Left = 369
              Top = 60
              Width = 27
              Height = 13
              Caption = 'Bairro'
              FocusControl = cmbBairro
            end
            object Label44: TLabel
              Left = 8
              Top = 99
              Width = 162
              Height = 13
              Caption = 'Tempo Resid'#234'ncia (Ano(s)-Meses)'
              FocusControl = DBEdit2
              Transparent = True
            end
            object dbeCEP: TDBEdit
              Left = 8
              Top = 36
              Width = 81
              Height = 21
              DataField = 'CLI_END_CEP'
              DataSource = dsCadastro
              TabOrder = 0
            end
            object DBEdit10: TDBEdit
              Left = 96
              Top = 36
              Width = 465
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CLI_END_LOGRADOURO'
              DataSource = dsCadastro
              TabOrder = 1
            end
            object DBEdit11: TDBEdit
              Left = 569
              Top = 36
              Width = 76
              Height = 21
              DataField = 'CLI_END_NUMERO'
              DataSource = dsCadastro
              TabOrder = 2
            end
            object cmbUFCliente: TDBComboBox
              Left = 8
              Top = 75
              Width = 69
              Height = 22
              Style = csOwnerDrawFixed
              DataField = 'CLI_END_UF'
              DataSource = Dm.DsClientes
              ItemHeight = 16
              Items.Strings = (
                'AC'
                'AL'
                'AM'
                'AP'
                'BA'
                'CE'
                'DF'
                'ES'
                'GO'
                'MA'
                'MG'
                'MS'
                'MT'
                'PA'
                'PB'
                'PE'
                'PR'
                'PI'
                'RJ'
                'RN'
                'RO'
                'RR'
                'RS'
                'SC'
                'SE'
                'SP'
                'TO')
              TabOrder = 3
              OnExit = cmbUFClienteExit
            end
            object cmbCidade: TDBLookupComboBox
              Left = 82
              Top = 76
              Width = 281
              Height = 21
              DataField = 'CLI_CIDADE_RESIDENCIA'
              DataSource = dsCadastro
              TabOrder = 4
              OnEnter = cmbCidadeEnter
            end
            object cmbBairro: TDBLookupComboBox
              Left = 369
              Top = 76
              Width = 275
              Height = 21
              DataField = 'CLI_NMBAIRRO_RESID'
              DataSource = dsCadastro
              TabOrder = 5
              OnEnter = cmbBairroEnter
            end
            object DBEdit2: TDBEdit
              Left = 8
              Top = 115
              Width = 69
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CLI_TEMPO_RESIDENCIA'
              DataSource = dsCadastro
              TabOrder = 6
            end
          end
          object GroupBox2: TGroupBox
            Left = 8
            Top = 163
            Width = 657
            Height = 145
            Caption = '[ Cobran'#231'a ]'
            TabOrder = 1
            object Label3: TLabel
              Left = 8
              Top = 20
              Width = 21
              Height = 13
              Caption = 'CEP'
              FocusControl = DBEdit13
              Transparent = True
            end
            object Label5: TLabel
              Left = 96
              Top = 20
              Width = 46
              Height = 13
              Caption = 'Endere'#231'o'
              FocusControl = DBEdit14
              Transparent = True
            end
            object Label19: TLabel
              Left = 569
              Top = 20
              Width = 37
              Height = 13
              Caption = 'N'#250'mero'
              FocusControl = DBEdit15
              Transparent = True
            end
            object Label21: TLabel
              Left = 8
              Top = 58
              Width = 14
              Height = 13
              Caption = 'UF'
            end
            object Label26: TLabel
              Left = 82
              Top = 58
              Width = 33
              Height = 13
              Caption = 'Cidade'
              FocusControl = cmbCidadeCobranca
            end
            object Label27: TLabel
              Left = 369
              Top = 58
              Width = 27
              Height = 13
              Caption = 'Bairro'
              FocusControl = cmbBairroCobranca
            end
            object DBEdit13: TDBEdit
              Left = 8
              Top = 36
              Width = 81
              Height = 21
              DataField = 'CLI_CEP'
              DataSource = dsCadastro
              TabOrder = 0
            end
            object DBEdit14: TDBEdit
              Left = 96
              Top = 36
              Width = 465
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CLI_END_COBRANCA'
              DataSource = dsCadastro
              TabOrder = 1
            end
            object DBEdit15: TDBEdit
              Left = 569
              Top = 36
              Width = 76
              Height = 21
              DataField = 'CLI_NUMERO'
              DataSource = dsCadastro
              TabOrder = 2
            end
            object cmbUFCobranca: TDBComboBox
              Left = 8
              Top = 73
              Width = 69
              Height = 22
              Style = csOwnerDrawFixed
              DataField = 'CLI_UFCLIENTE'
              DataSource = Dm.DsClientes
              ItemHeight = 16
              Items.Strings = (
                'AC'
                'AL'
                'AM'
                'AP'
                'BA'
                'CE'
                'DF'
                'ES'
                'GO'
                'MA'
                'MG'
                'MS'
                'MT'
                'PA'
                'PB'
                'PE'
                'PR'
                'PI'
                'RJ'
                'RN'
                'RO'
                'RR'
                'RS'
                'SC'
                'SE'
                'SP'
                'TO')
              TabOrder = 3
              OnExit = cmbUFCobrancaExit
            end
            object cmbCidadeCobranca: TDBLookupComboBox
              Left = 82
              Top = 73
              Width = 281
              Height = 21
              DataField = 'CLI_CIDADE_COBRACA'
              DataSource = dsCadastro
              TabOrder = 4
              OnEnter = cmbCidadeCobrancaEnter
            end
            object cmbBairroCobranca: TDBLookupComboBox
              Left = 369
              Top = 73
              Width = 275
              Height = 21
              DataField = 'BAI_NOME'
              DataSource = dsCadastro
              TabOrder = 5
              OnEnter = cmbBairroCobrancaEnter
            end
          end
        end
        object tbConjugue: TTabSheet
          Caption = 'Conjugue'
          ImageIndex = 3
          object Label33: TLabel
            Left = 16
            Top = 8
            Width = 20
            Height = 13
            Caption = 'CPF'
            FocusControl = dbeCPFConjugue
            Transparent = True
          end
          object Label34: TLabel
            Left = 16
            Top = 53
            Width = 28
            Height = 13
            Caption = 'Nome'
            FocusControl = dbeNMConjugue
            Transparent = True
          end
          object dbeCPFConjugue: TDBEdit
            Left = 16
            Top = 24
            Width = 147
            Height = 21
            DataField = 'CLI_CONJUGUE_CPF'
            DataSource = dsCadastro
            TabOrder = 0
            OnExit = dbeCPFConjugueExit
          end
          object dbeNMConjugue: TDBEdit
            Left = 16
            Top = 69
            Width = 637
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CLI_CONJUGUE_NOME'
            DataSource = dsCadastro
            TabOrder = 1
          end
        end
        object tbOutros: TTabSheet
          Caption = 'Outros'
          ImageIndex = 5
          object Label29: TLabel
            Left = 8
            Top = 17
            Width = 58
            Height = 13
            Caption = 'Observa'#231#227'o'
            FocusControl = DBMemo1
            Transparent = True
          end
          object Label11: TLabel
            Left = 8
            Top = 184
            Width = 89
            Height = 13
            Caption = 'Eletros\Eletr'#244'nicos'
            Transparent = True
          end
          object DBMemo1: TDBMemo
            Left = 8
            Top = 33
            Width = 530
            Height = 144
            DataField = 'CLI_OBSERVACAO'
            DataSource = dsCadastro
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object DBGrid1: TDBGrid
            Left = 8
            Top = 200
            Width = 530
            Height = 120
            DataSource = dsLista
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CLE_DESCRICAO'
                Title.Caption = 'Descri'#231#227'o'
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = []
                Width = 432
                Visible = True
              end>
          end
          object btnIncEletro: TBitBtn
            Left = 8
            Top = 328
            Width = 75
            Height = 25
            Hint = 'Clique aqui para incluir novo item'
            Caption = 'Incluir'
            TabOrder = 2
            OnClick = btnIncEletroClick
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777700000007777777777777707700000007777777777777707700000007777
              7777777700000000000077777777777777077000000070000000000007077000
              000070FFFFFFFFFF07777000000070F00F00F00F07777000000070FFFFFFFFFF
              077770000000704444444444447770000000774FFFFFFFFFF47770000000774F
              00F00F00F47770000000774FFFFFFFFFF4777000000077444444444444777000
              0000774744744744747770000000774444444444447770000000777777777777
              777770000000}
          end
          object btnExcEletro: TBitBtn
            Left = 88
            Top = 328
            Width = 75
            Height = 25
            Hint = 'Clique aqui para excluir o item selecionado'
            Caption = 'Excluir'
            TabOrder = 3
            OnClick = btnExcEletroClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              3333333777777777F3333330F77777703333333733F3F3F73F33330FF0808077
              0333337F37F7F7F37F33330FF0807077033333733737F73F73F330FF77808707
              703337F37F37F37F37F330FF08807807703037F37F37F37F37F700FF08808707
              700377F37337F37F377330FF778078077033373F73F7F3733733330FF0808077
              0333337F37F7F7F37F33330FF08070770333337FF7F7F7FF7F33330000000000
              03333377777777777F33330F888777770333337FFFFFFFFF7F33330000000000
              033333777777777773333333307770333333333337FFF7F33333333330000033
              3333333337777733333333333333333333333333333333333333}
            NumGlyphs = 2
          end
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 725
        Height = 97
        inherited lblConsultar: TLabel
          Top = 27
        end
        inherited rgConsultar: TRadioGroup
          Height = 88
          Items.Strings = (
            '&C'#243'digo'
            '&Fantasia/Apelido'
            '&Raz'#227'o Social/Nome'
            'C&PF/CNPJ')
        end
        inherited edtConsultar: TEdit
          Top = 43
          Width = 426
        end
        inherited btnConsultar: TBitBtn
          Left = 580
          Top = 40
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Left = 396
          Top = 24
          Visible = False
        end
      end
      inherited Panel3: TPanel
        Left = 691
        Top = 97
        Height = 445
      end
      inherited grdConsultar: TDBGrid
        Top = 97
        Width = 691
        Height = 445
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CLI_CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLI_RAZAO'
            Title.Caption = 'Raz'#227'o/Nome'
            Width = 259
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLI_FANTASIA'
            Title.Caption = 'Fantasia/Apelido'
            Width = 189
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLI_CGC'
            Title.Caption = 'CPF/CNPJ'
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLI_FONE1'
            Title.Alignment = taRightJustify
            Title.Caption = 'Telefone'
            Width = 83
            Visible = True
          end>
      end
    end
  end
  inherited Panel4: TPanel
    Width = 733
  end
  inherited dsConsultar: TDataSource
    Left = 276
    Top = 130
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select CLI_CODIGO, CLI_RAZAO, CLI_FANTASIA, CLI_FONE1, CLI_CGC f' +
      'rom CLIENTES'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    Left = 316
    Top = 122
  end
  inherited dspConsultar: TDataSetProvider
    Left = 396
    Top = 122
  end
  inherited cdsConsultar: TClientDataSet
    Left = 468
    Top = 122
    object cdsConsultarCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultarCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
    object cdsConsultarCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsConsultarCLI_FONE1: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONE1'
      EditMask = '(##) ####-####;0;_'
      Size = 10
    end
    object cdsConsultarCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      Size = 14
    end
  end
  object dsCadastro: TDataSource
    AutoEdit = False
    DataSet = Dm.CdsClientes
    OnDataChange = dsCadastroDataChange
    Left = 468
    Top = 70
  end
  object dsConsClientes: TDataSource
    DataSet = cdsConsClientes
    Left = 620
    Top = 65
  end
  object cdsConsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsClientes'
    Left = 572
    Top = 65
    object cdsConsClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object cdsConsClientesCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsConsClientesCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
  end
  object dspConsClientes: TDataSetProvider
    DataSet = dstConsClientes
    Options = [poAllowCommandText]
    Left = 540
    Top = 65
  end
  object dstConsClientes: TSQLDataSet
    CommandText = 
      'select CLI_CODIGO, CLI_FANTASIA, CLI_RAZAO from CLIENTES order b' +
      'y CLI_RAZAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 508
    Top = 65
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'JPEG (*.jpg)|*.jpg'
    InitialDir = 'C:\'
    Left = 516
    Top = 142
  end
  object PopupMenu1: TPopupMenu
    Left = 372
    Top = 70
    object pmnCidades: TMenuItem
      Caption = '&Cidades...'
      OnClick = pmnCidadesClick
    end
    object pmnBairros: TMenuItem
      Caption = '&Bairros...'
      OnClick = pmnBairrosClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Situao1: TMenuItem
      Caption = '&Situa'#231#227'o...'
      OnClick = Situao1Click
    end
    object ipodeCliente1: TMenuItem
      Caption = '&Tipo de Cliente...'
      OnClick = ipodeCliente1Click
    end
    object Atividade1: TMenuItem
      Caption = 'Tipo de &Atividade'
      OnClick = Atividade1Click
    end
    object pmnEletroEletronicoSubItem: TMenuItem
      Caption = 'Eletro/Eletronico'
      OnClick = pmnEletroEletronicoSubItemClick
    end
  end
  object dsLista: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsClienteEletro
    Left = 568
    Top = 395
  end
end
