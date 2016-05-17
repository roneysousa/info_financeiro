inherited frmCadLojas: TfrmCadLojas
  Left = 234
  Top = 121
  Caption = 'Cadastro de Condominio'
  ClientHeight = 397
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 368
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 89
        Width = 74
        Height = 13
        Caption = 'Nome Fantasia:'
        FocusControl = dbeNMFANT
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 129
        Width = 66
        Height = 13
        Caption = 'Raz'#227'o Social:'
        FocusControl = dbeNMRAZA
      end
      object Label3: TLabel [2]
        Left = 18
        Top = 169
        Width = 49
        Height = 13
        Caption = 'Endere'#231'o:'
        FocusControl = DBEdit3
      end
      object Label4: TLabel [3]
        Left = 424
        Top = 167
        Width = 40
        Height = 13
        Caption = 'N'#250'mero:'
        FocusControl = DBEdit4
      end
      object Label5: TLabel [4]
        Left = 16
        Top = 207
        Width = 36
        Height = 13
        Caption = 'Cidade:'
        FocusControl = cmbCidade
      end
      object Label6: TLabel [5]
        Left = 320
        Top = 207
        Width = 30
        Height = 13
        Caption = 'Bairro:'
        FocusControl = cmbBairro
      end
      object Label7: TLabel [6]
        Left = 16
        Top = 6
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
        FocusControl = dbeNMFANT
      end
      object Label8: TLabel [7]
        Left = 16
        Top = 50
        Width = 30
        Height = 13
        Caption = 'CNPJ:'
        FocusControl = dbeNRCNPJ
        Transparent = True
      end
      object DBText1: TDBText [8]
        Left = 16
        Top = 19
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'EMP_CODIGO'
        DataSource = Dm.DsEmpresas
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel [9]
        Left = 160
        Top = 50
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
        FocusControl = DBEdit1
        Transparent = True
      end
      object Label10: TLabel [10]
        Left = 16
        Top = 248
        Width = 45
        Height = 13
        Caption = 'Telefone:'
        FocusControl = DBEdit2
        Transparent = True
      end
      object Label11: TLabel [11]
        Left = 160
        Top = 248
        Width = 20
        Height = 13
        Caption = 'Fax:'
        FocusControl = DBEdit5
        Transparent = True
      end
      object Label12: TLabel [12]
        Left = 304
        Top = 248
        Width = 22
        Height = 13
        Caption = 'Cep:'
        FocusControl = DBEdit6
      end
      object Label15: TLabel [13]
        Left = 263
        Top = 207
        Width = 14
        Height = 13
        Caption = 'UF'
      end
      inherited Panel1: TPanel
        Top = 298
        TabOrder = 12
      end
      object dbeNMFANT: TDBEdit
        Left = 16
        Top = 105
        Width = 530
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMP_FANTASIA'
        DataSource = Dm.DsEmpresas
        TabOrder = 2
        OnExit = dbeNMFANTExit
      end
      object dbeNMRAZA: TDBEdit
        Left = 16
        Top = 145
        Width = 530
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMP_RAZAO'
        DataSource = Dm.DsEmpresas
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 183
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EMP_ENDERECO'
        DataSource = Dm.DsEmpresas
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 424
        Top = 183
        Width = 121
        Height = 21
        DataField = 'EMP_NUMERO'
        DataSource = Dm.DsEmpresas
        TabOrder = 5
      end
      object cmbCidade: TDBLookupComboBox
        Left = 16
        Top = 223
        Width = 238
        Height = 21
        DataField = 'EMP_NMCIDADE'
        DataSource = Dm.DsEmpresas
        TabOrder = 6
        OnExit = cmbCidadeExit
      end
      object cmbBairro: TDBLookupComboBox
        Left = 320
        Top = 223
        Width = 226
        Height = 21
        DataField = 'EMP_NMBAIRRO'
        DataSource = Dm.DsEmpresas
        TabOrder = 8
      end
      object dbeNRCNPJ: TDBEdit
        Left = 16
        Top = 66
        Width = 130
        Height = 21
        DataField = 'EMP_CNPJ'
        DataSource = Dm.DsEmpresas
        MaxLength = 18
        TabOrder = 0
        OnExit = dbeNRCNPJExit
        OnKeyPress = dbeNRCNPJKeyPress
      end
      object DBEdit1: TDBEdit
        Left = 160
        Top = 66
        Width = 186
        Height = 21
        DataField = 'EMP_INSCRICAOESTADUAL'
        DataSource = Dm.DsEmpresas
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 264
        Width = 134
        Height = 21
        DataField = 'EMP_NRFONE'
        DataSource = Dm.DsEmpresas
        TabOrder = 9
      end
      object DBEdit5: TDBEdit
        Left = 160
        Top = 264
        Width = 134
        Height = 21
        DataField = 'EMP_NRFAX'
        DataSource = Dm.DsEmpresas
        TabOrder = 10
      end
      object DBEdit6: TDBEdit
        Left = 304
        Top = 264
        Width = 108
        Height = 21
        DataField = 'EMP_NRCEP'
        DataSource = Dm.DsEmpresas
        TabOrder = 11
      end
      object cmbUF: TDBComboBox
        Left = 262
        Top = 222
        Width = 52
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'EMP_UF'
        DataSource = Dm.DsEmpresas
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
        TabOrder = 7
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 396
          Top = 36
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Top = 17
        end
      end
      inherited Panel3: TPanel
        Height = 280
      end
      inherited grdConsultar: TDBGrid
        Height = 280
        Columns = <
          item
            Expanded = False
            FieldName = 'EMP_CODIGO'
            Title.Caption = 'C'#211'DIGO'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMP_FANTASIA'
            Title.Caption = 'NOME'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 436
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select EMP_CODIGO, EMP_FANTASIA from EMPRESAS'#13#10'order by EMP_FANT' +
      'ASIA'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
  end
end
