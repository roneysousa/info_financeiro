inherited frmCadCores: TfrmCadCores
  Left = 193
  Top = 141
  Caption = 'Tabela de Cores'
  ClientHeight = 288
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 259
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 60
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object DBText1: TDBText [2]
        Left = 16
        Top = 32
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'COR_CODIGO'
        DataSource = dsCores
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      inherited Panel1: TPanel
        Top = 189
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 76
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COR_DESCRICAO'
        DataSource = dsCores
        TabOrder = 1
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 404
          Top = 36
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Top = 17
        end
      end
      inherited Panel3: TPanel
        Height = 171
      end
      inherited grdConsultar: TDBGrid
        Height = 171
        Columns = <
          item
            Expanded = False
            FieldName = 'COR_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COR_DESCRICAO'
            Title.Caption = 'DESCRICAO'
            Width = 449
            Visible = True
          end>
      end
    end
  end
  inherited dsConsultar: TDataSource
    Left = 436
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select COR_CODIGO, COR_DESCRICAO from CORES order by COR_DESCRIC' +
      'AO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarCOR_CODIGO: TIntegerField
      FieldName = 'COR_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarCOR_DESCRICAO: TStringField
      FieldName = 'COR_DESCRICAO'
      Size = 25
    end
  end
  object dsCores: TDataSource
    AutoEdit = False
    DataSet = DM2.cdsCores
    Left = 320
    Top = 72
  end
end
