inherited frmCadCedentes: TfrmCadCedentes
  Top = 77
  Caption = 'Cadastro de Cedentes'
  ClientHeight = 497
  ClientWidth = 712
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 712
    Height = 468
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      inherited Panel1: TPanel
        Top = 398
        Width = 704
        TabOrder = 3
        inherited BtExcluir: TBitBtn
          Visible = False
        end
      end
      object gpbIdentificacao: TGroupBox
        Left = 0
        Top = 0
        Width = 704
        Height = 105
        Align = alTop
        Caption = 'Identifica'#231#227'o do cedente'
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 56
          Width = 71
          Height = 13
          Caption = 'Nome Cedente'
          Transparent = True
        end
        object Label3: TLabel
          Left = 432
          Top = 56
          Width = 47
          Height = 13
          Caption = 'CPF/CGC'
          FocusControl = dbeInscricao
        end
        object Label1: TLabel
          Left = 16
          Top = 13
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          Transparent = True
        end
        object DBText1: TDBText
          Left = 16
          Top = 29
          Width = 80
          Height = 22
          AutoSize = True
          Color = clBtnFace
          DataField = 'CODIGO'
          DataSource = dsCedente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object dbeNMCEDE: TDBEdit
          Left = 16
          Top = 72
          Width = 394
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CEDENTE_NOME'
          DataSource = dsCedente
          TabOrder = 1
        end
        object dbeInscricao: TDBEdit
          Left = 432
          Top = 72
          Width = 186
          Height = 21
          DataField = 'NUMERO_INSCRICAO'
          DataSource = dsCedente
          TabOrder = 2
          OnEnter = dbeInscricaoEnter
        end
        object rbnTipo: TDBRadioGroup
          Left = 464
          Top = 11
          Width = 153
          Height = 44
          Caption = '[ Tipo ]'
          Columns = 2
          DataField = 'TIPO_INSCRICAO'
          DataSource = dsCedente
          Items.Strings = (
            'F'#237'sica'
            'Juridica')
          TabOrder = 0
          Values.Strings = (
            'F'
            'J')
        end
      end
      object gpbDadosBancarios: TGroupBox
        Left = 0
        Top = 105
        Width = 704
        Height = 140
        Align = alTop
        Caption = 'Dados banc'#225'rios do cedente'
        TabOrder = 1
        object Label5: TLabel
          Left = 6
          Top = 22
          Width = 112
          Height = 13
          Caption = 'Banco (C'#243'digo / Nome)'
          FocusControl = EditBancoCodigo
        end
        object Label7: TLabel
          Left = 404
          Top = 22
          Width = 130
          Height = 13
          Caption = 'C'#243'digo do cedente / D'#237'gito'
          FocusControl = EditCedenteCodigo
        end
        object Label9: TLabel
          Left = 538
          Top = 22
          Width = 36
          Height = 13
          Caption = 'Carteira'
          FocusControl = EditCarteira
        end
        object Label10: TLabel
          Left = 6
          Top = 60
          Width = 160
          Height = 13
          Caption = 'Ag'#234'ncia (C'#243'digo / D'#237'gito / Nome)'
          FocusControl = EditAgenciaCodigo
        end
        object Label13: TLabel
          Left = 404
          Top = 60
          Width = 114
          Height = 13
          Caption = 'Conta (N'#250'mero / D'#237'gito)'
          FocusControl = EditContaNumero
        end
        object Label4: TLabel
          Left = 540
          Top = 60
          Width = 58
          Height = 13
          Caption = 'Logo Banco'
          FocusControl = imgLogo
        end
        object lblProximoNossoNumero: TLabel
          Left = 104
          Top = 98
          Width = 113
          Height = 13
          Caption = 'Inicio de Nosso N'#250'mero'
          FocusControl = EditProximoNossoNumero
          Transparent = True
        end
        object Label6: TLabel
          Left = 6
          Top = 98
          Width = 63
          Height = 13
          Caption = 'N'#186'. Conv'#234'nio'
          FocusControl = dbeNrConvenio
          Transparent = True
        end
        object EditCarteira: TDBEdit
          Left = 540
          Top = 37
          Width = 41
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CARTEIRA'
          DataSource = dsCedente
          TabOrder = 4
        end
        object EditCedenteCodigoDigito: TDBEdit
          Left = 508
          Top = 37
          Width = 20
          Height = 21
          DataField = 'CEDENTE_CODIGO_DIGITO'
          DataSource = dsCedente
          TabOrder = 3
        end
        object EditCedenteCodigo: TDBEdit
          Left = 404
          Top = 37
          Width = 99
          Height = 21
          DataField = 'CEDENTE_CODIGO'
          DataSource = dsCedente
          TabOrder = 2
        end
        object EditBancoNome: TDBEdit
          Left = 70
          Top = 37
          Width = 328
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BANCO_NOME'
          DataSource = dsCedente
          TabOrder = 1
        end
        object EditBancoCodigo: TDBEdit
          Left = 6
          Top = 37
          Width = 59
          Height = 21
          DataField = 'BANCO_CODIGO'
          DataSource = dsCedente
          TabOrder = 0
          OnChange = EditBancoCodigoChange
          OnExit = EditBancoCodigoExit
        end
        object EditContaNumeroDigito: TDBEdit
          Left = 509
          Top = 75
          Width = 20
          Height = 21
          DataField = 'CONTA_NUMERO_DIGITO'
          DataSource = dsCedente
          TabOrder = 9
        end
        object EditContaNumero: TDBEdit
          Left = 404
          Top = 75
          Width = 99
          Height = 21
          DataField = 'CONTA_NUMERO'
          DataSource = dsCedente
          TabOrder = 8
          OnExit = EditContaNumeroExit
          OnKeyPress = EditContaNumeroKeyPress
        end
        object EditAgenciaNome: TDBEdit
          Left = 104
          Top = 75
          Width = 294
          Height = 21
          CharCase = ecUpperCase
          DataField = 'AGENCIA_NOME'
          DataSource = dsCedente
          TabOrder = 7
        end
        object EditAgenciaDigito: TDBEdit
          Left = 70
          Top = 75
          Width = 27
          Height = 21
          DataField = 'AGENCIA_DIGITO'
          DataSource = dsCedente
          TabOrder = 6
        end
        object EditAgenciaCodigo: TDBEdit
          Left = 6
          Top = 75
          Width = 59
          Height = 21
          DataField = 'AGENCIA_CODIGO'
          DataSource = dsCedente
          TabOrder = 5
        end
        object EditProximoNossoNumero: TDBEdit
          Left = 104
          Top = 113
          Width = 115
          Height = 21
          DataField = 'INICIO_NOSSO_NUMERO'
          DataSource = dsCedente
          TabOrder = 11
        end
        object imgLogo: TDBImage
          Left = 540
          Top = 75
          Width = 151
          Height = 35
          DataField = 'LOGO_BANCO'
          DataSource = dsCedente
          Stretch = True
          TabOrder = 12
          OnClick = imgLogoClick
        end
        object dbeNrConvenio: TDBEdit
          Left = 6
          Top = 113
          Width = 95
          Height = 21
          DataField = 'NUMERO_CONVENIO'
          DataSource = dsCedente
          TabOrder = 10
          OnKeyPress = dbeNrConvenioKeyPress
        end
      end
      object gpbEndereco: TGroupBox
        Left = 0
        Top = 247
        Width = 704
        Height = 151
        Align = alBottom
        Caption = 'Endere'#231'o de cedente'
        TabOrder = 2
        object Label15: TLabel
          Left = 6
          Top = 19
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = EditRua
        end
        object Label16: TLabel
          Left = 262
          Top = 19
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = EditNumero
        end
        object Label17: TLabel
          Left = 358
          Top = 19
          Width = 64
          Height = 13
          Caption = 'Complemento'
          FocusControl = EditComplemento
        end
        object Label18: TLabel
          Left = 6
          Top = 59
          Width = 27
          Height = 13
          Caption = 'Bairro'
          FocusControl = EditBairro
        end
        object Label19: TLabel
          Left = 246
          Top = 59
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = EditCidade
        end
        object Label20: TLabel
          Left = 453
          Top = 59
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label21: TLabel
          Left = 522
          Top = 59
          Width = 21
          Height = 13
          Caption = 'CEP'
          FocusControl = EditCEP
        end
        object Label22: TLabel
          Left = 6
          Top = 99
          Width = 26
          Height = 13
          Caption = 'EMail'
          FocusControl = EditEMail
        end
        object EditRua: TDBEdit
          Left = 6
          Top = 35
          Width = 251
          Height = 21
          CharCase = ecUpperCase
          DataField = 'RUA'
          DataSource = dsCedente
          TabOrder = 0
        end
        object EditNumero: TDBEdit
          Left = 262
          Top = 35
          Width = 91
          Height = 21
          DataField = 'Numero'
          DataSource = dsCedente
          TabOrder = 1
        end
        object EditComplemento: TDBEdit
          Left = 358
          Top = 35
          Width = 251
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMPLEMENTO'
          DataSource = dsCedente
          TabOrder = 2
        end
        object EditBairro: TDBEdit
          Left = 6
          Top = 75
          Width = 231
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Bairro'
          DataSource = dsCedente
          TabOrder = 3
        end
        object EditCidade: TDBEdit
          Left = 246
          Top = 75
          Width = 203
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CIDADE'
          DataSource = dsCedente
          TabOrder = 4
        end
        object EditCEP: TDBEdit
          Left = 522
          Top = 75
          Width = 87
          Height = 21
          DataField = 'CEP'
          DataSource = dsCedente
          TabOrder = 6
        end
        object EditEMail: TDBEdit
          Left = 6
          Top = 115
          Width = 351
          Height = 21
          CharCase = ecLowerCase
          DataField = 'EMAIL'
          DataSource = dsCedente
          TabOrder = 7
        end
        object cmbUFCLIE: TDBComboBox
          Left = 455
          Top = 75
          Width = 61
          Height = 22
          Style = csOwnerDrawFixed
          DataField = 'ESTADO'
          DataSource = dsCedente
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
          TabOrder = 5
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 704
        inherited btnConsultar: TBitBtn
          Left = 388
          Top = 44
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Left = 508
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Left = 670
        Height = 380
      end
      inherited grdConsultar: TDBGrid
        Width = 670
        Height = 380
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#211'DIGO'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEDENTE_NOME'
            Title.Caption = 'CEDENTE'
            Width = 257
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCO_NOME'
            Title.Caption = 'BANCO'
            Width = 287
            Visible = True
          end>
      end
    end
  end
  inherited Panel4: TPanel
    Width = 712
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select CODIGO, CEDENTE_NOME, BANCO_NOME from CEDENTES'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited dspConsultar: TDataSetProvider
    Left = 300
    Top = 154
  end
  inherited cdsConsultar: TClientDataSet
    Left = 444
    Top = 170
    object cdsConsultarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsConsultarCEDENTE_NOME: TStringField
      FieldName = 'CEDENTE_NOME'
      Size = 10
    end
    object cdsConsultarBANCO_NOME: TStringField
      FieldName = 'BANCO_NOME'
    end
  end
  object dsCedente: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsCedente
    Left = 280
    Top = 72
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    InitialDir = 'C:\'
    Left = 348
    Top = 134
  end
end
