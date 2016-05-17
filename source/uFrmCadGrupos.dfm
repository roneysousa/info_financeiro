inherited frmCadGrupos: TfrmCadGrupos
  Left = 234
  Top = 206
  Caption = 'Cadastro de Grupos'
  ClientHeight = 321
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 292
    ActivePage = TabSheet2
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 10
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object DBText1: TDBText [1]
        Left = 10
        Top = 21
        Width = 79
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'GRU_CODIGO'
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
        Left = 10
        Top = 56
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
      end
      inherited Panel1: TPanel
        Top = 222
      end
      object dbeDescricao: TDBEdit
        Left = 10
        Top = 72
        Width = 394
        Height = 21
        CharCase = ecUpperCase
        DataField = 'GRU_DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 1
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 388
          Top = 44
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Left = 489
          Top = 17
        end
      end
      inherited Panel3: TPanel
        Height = 204
      end
      inherited grdConsultar: TDBGrid
        Height = 204
        Columns = <
          item
            Expanded = False
            FieldName = 'GRU_CODIGO'
            Title.Caption = 'C'#211'DIGO'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRU_DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 440
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select GRU_CODIGO, GRU_DESCRICAO from GRUPOS order by GRU_DESCRI' +
      'CAO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarGRU_CODIGO: TIntegerField
      FieldName = 'GRU_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarGRU_DESCRICAO: TStringField
      FieldName = 'GRU_DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object dsCadastro: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsGrupos
    Left = 224
    Top = 80
  end
end
