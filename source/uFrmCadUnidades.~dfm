inherited frmCadUnidades: TfrmCadUnidades
  Caption = 'Tabela de Unidades'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbeCDUNID
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 56
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeNMDESC
        Transparent = True
      end
      object dbeCDUNID: TDBEdit
        Left = 16
        Top = 32
        Width = 55
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UNI_CODIGO'
        DataSource = dsUnidades
        TabOrder = 1
      end
      object dbeNMDESC: TDBEdit
        Left = 16
        Top = 72
        Width = 394
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UNI_DESCRICAO'
        DataSource = dsUnidades
        TabOrder = 2
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          OnClick = btnConsultarClick
        end
      end
      inherited grdConsultar: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'UNI_CODIGO'
            Title.Caption = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNI_DESCRICAO'
            Title.Caption = 'DESCRICAO'
            Width = 426
            Visible = True
          end>
      end
    end
  end
  inherited dsConsultar: TDataSource
    AutoEdit = False
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select * from UNIDADES'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarUNI_CODIGO: TStringField
      Alignment = taRightJustify
      FieldName = 'UNI_CODIGO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsConsultarUNI_DESCRICAO: TStringField
      FieldName = 'UNI_DESCRICAO'
      Size = 30
    end
  end
  object dsUnidades: TDataSource
    DataSet = Dm.cdsUnidades
    Left = 96
    Top = 184
  end
  object qryLocUnidade: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select UNI_CODIGO from UNIDADES'
      'where (UNI_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 316
    Top = 62
  end
  object dsConsultar2: TDataSource
    DataSet = cdsConsultar
    OnStateChange = dsConsultar2StateChange
    OnDataChange = dsConsultar2DataChange
    Left = 196
    Top = 174
  end
end
