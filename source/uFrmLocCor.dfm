inherited frmBuscaCor: TfrmBuscaCor
  Caption = 'Localizar Cor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited edtConsultar: TEdit
      Width = 378
    end
    inherited btnConsultar: TBitBtn
      Top = 1
      Visible = False
    end
  end
  inherited grdConsultar: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COR_CODIGO'
        Title.Caption = 'C'#211'DIGO'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COR_DESCRICAO'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 306
        Visible = True
      end>
  end
  inherited dstBusca: TSQLDataSet
    CommandText = 'select * from CORES'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsBusca: TClientDataSet
    object cdsBuscaCOR_CODIGO: TIntegerField
      FieldName = 'COR_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsBuscaCOR_DESCRICAO: TStringField
      FieldName = 'COR_DESCRICAO'
      Size = 25
    end
  end
end
