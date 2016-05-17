inherited frmCadSecao: TfrmCadSecao
  Caption = 'Tabela Se'#231#245'es'
  ClientHeight = 283
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 254
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 19
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 64
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeNMDESC
        Transparent = True
      end
      object DBText1: TDBText [2]
        Left = 16
        Top = 32
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'SEC_CODIGO'
        DataSource = Dm.dsSecao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      inherited Panel1: TPanel
        Top = 184
      end
      object dbeNMDESC: TDBEdit
        Left = 16
        Top = 80
        Width = 394
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SEC_DESCRICAO'
        DataSource = Dm.dsSecao
        TabOrder = 1
        OnExit = dbeNMDESCExit
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
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Height = 166
      end
      inherited grdConsultar: TDBGrid
        Height = 166
        Columns = <
          item
            Expanded = False
            FieldName = 'SEC_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEC_DESCRICAO'
            Title.Caption = 'DESCRIC'#195'O'
            Width = 456
            Visible = True
          end>
      end
    end
  end
  inherited dsConsultar: TDataSource
    AutoEdit = False
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select SEC_CODIGO, SEC_DESCRICAO from SECAO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarSEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarSEC_DESCRICAO: TStringField
      FieldName = 'SEC_DESCRICAO'
      Size = 30
    end
  end
end
