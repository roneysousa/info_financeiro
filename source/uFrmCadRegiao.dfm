inherited frmCadRegiao: TfrmCadRegiao
  Left = 201
  Top = 131
  Caption = 'Tabela de Regi'#245'es'
  ClientHeight = 256
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 227
    inherited TabSheet1: TTabSheet
      object Label2: TLabel [0]
        Left = 16
        Top = 7
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object DBText1: TDBText [1]
        Left = 16
        Top = 23
        Width = 5
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'REG_CODIGO'
        DataSource = dsRegioes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label1: TLabel [2]
        Left = 16
        Top = 48
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 157
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 64
        Width = 385
        Height = 21
        CharCase = ecUpperCase
        DataField = 'REG_DESCRICAO'
        DataSource = dsRegioes
        TabOrder = 1
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 412
          Top = 44
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Top = 18
        end
      end
      inherited Panel3: TPanel
        Height = 139
      end
      inherited grdConsultar: TDBGrid
        Height = 139
        Columns = <
          item
            Expanded = False
            FieldName = 'REG_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REG_DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 440
            Visible = True
          end>
      end
    end
  end
  inherited dsConsultar: TDataSource
    Left = 204
    Top = 58
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select REG_CODIGO, REG_DESCRICAO from REGIAO order by REG_DESCRI' +
      'CAO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    Left = 284
    Top = 58
  end
  inherited dspConsultar: TDataSetProvider
    Left = 364
    Top = 58
  end
  inherited cdsConsultar: TClientDataSet
    Left = 436
    Top = 58
    object cdsConsultarREG_CODIGO: TIntegerField
      FieldName = 'REG_CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsConsultarREG_DESCRICAO: TStringField
      FieldName = 'REG_DESCRICAO'
      Size = 12
    end
  end
  object dsRegioes: TDataSource
    AutoEdit = False
    DataSet = DM2.cdsRegioes
    Left = 144
    Top = 168
  end
end
