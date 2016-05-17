inherited frmCadNatureza: TfrmCadNatureza
  Caption = 'Tabela de Natureza'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 56
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
        FocusControl = dbeDESCRICAO
        Transparent = True
      end
      object DBText1: TDBText [2]
        Left = 16
        Top = 32
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'NAT_CODIGO'
        DataSource = DM2.dsNatureza
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbeDESCRICAO: TDBEdit
        Left = 16
        Top = 72
        Width = 394
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NAT_NOME'
        DataSource = DM2.dsNatureza
        TabOrder = 1
        OnExit = dbeDESCRICAOExit
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 104
        Width = 185
        Height = 79
        Caption = 'Tipo de Natureza:'
        Enabled = False
        TabOrder = 2
        object cbxDespesa: TCheckBox
          Left = 16
          Top = 24
          Width = 97
          Height = 17
          Caption = '&Despesa'
          TabOrder = 0
        end
        object cbxRenda: TCheckBox
          Left = 16
          Top = 48
          Width = 97
          Height = 17
          Caption = '&Renda'
          TabOrder = 1
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 396
          Top = 28
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Top = 18
        end
      end
      inherited grdConsultar: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'NAT_CODIGO'
            Title.Caption = 'C'#211'DIGO'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAT_NOME'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 464
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select NAT_CODIGO, NAT_NOME from NATUREZA'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarNAT_CODIGO: TIntegerField
      FieldName = 'NAT_CODIGO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsConsultarNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      Size = 30
    end
  end
end
