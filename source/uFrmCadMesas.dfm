inherited frmCadMesas: TfrmCadMesas
  Left = 261
  Top = 147
  Caption = 'Tabela de Mesas'
  ClientHeight = 314
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 285
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 62
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object DBText1: TDBText [2]
        Left = 16
        Top = 32
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'MES_CODIGO'
        DataSource = dsMesas
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      inherited Panel1: TPanel
        Top = 215
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 78
        Width = 521
        Height = 21
        CharCase = ecUpperCase
        DataField = 'MES_DESCRICAO'
        DataSource = dsMesas
        TabOrder = 1
        OnExit = dbeDescricaoExit
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 412
          Top = 40
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Height = 197
      end
      inherited grdConsultar: TDBGrid
        Height = 197
        Columns = <
          item
            Expanded = False
            FieldName = 'MES_CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 446
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select * from MESAS order by MES_DESCRICAO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    object datasetConsultarMES_CODIGO: TIntegerField
      FieldName = 'MES_CODIGO'
      Required = True
    end
    object datasetConsultarMES_DESCRICAO: TStringField
      FieldName = 'MES_DESCRICAO'
    end
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarMES_CODIGO: TIntegerField
      FieldName = 'MES_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarMES_DESCRICAO: TStringField
      FieldName = 'MES_DESCRICAO'
    end
  end
  object dsMesas: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsMesas
    Left = 288
    Top = 176
  end
end
