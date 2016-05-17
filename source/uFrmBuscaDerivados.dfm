inherited frmBuscaDerivados: TfrmBuscaDerivados
  Caption = 'Busca de Derivados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited btnConsultar: TBitBtn
      OnClick = btnConsultarClick
    end
  end
  inherited grdConsultar: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'PED_DESCRICAO'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 378
        Visible = True
      end>
  end
  inherited dstBusca: TSQLDataSet
    CommandText = 'select * from PERDAS  Where PED_DESCRICAO like :pNOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsBusca: TClientDataSet
    object cdsBuscaPER_SEQUENCIA: TIntegerField
      FieldName = 'PER_SEQUENCIA'
      Required = True
    end
    object cdsBuscaPED_DESCRICAO: TStringField
      FieldName = 'PED_DESCRICAO'
      Size = 40
    end
  end
end
