inherited frmCadEletros: TfrmCadEletros
  Left = 212
  Top = 184
  Caption = 'Tabela de Eletros'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 21
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object DBText1: TDBText [1]
        Left = 16
        Top = 37
        Width = 79
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'ELE_CODIGO'
        DataSource = dsCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 72
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 88
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ELE_DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 1
        OnExit = dbeDescricaoExit
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Top = 18
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Left = 348
          Top = 48
          Visible = False
        end
      end
      inherited grdConsultar: TDBGrid
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ELE_CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ELE_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 434
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select ELE_CODIGO, ELE_DESCRICAO from ELETROS order by ELE_DESCR' +
      'ICAO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarELE_CODIGO: TIntegerField
      FieldName = 'ELE_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarELE_DESCRICAO: TStringField
      FieldName = 'ELE_DESCRICAO'
      Required = True
      Size = 40
    end
  end
  object dsCadastro: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsEletros
    Left = 280
    Top = 80
  end
end
