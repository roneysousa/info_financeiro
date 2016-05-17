inherited frmLocLoja: TfrmLocLoja
  Caption = 'Localizar'
  OldCreateOrder = True
  OnClose = FormClose
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
        FieldName = 'EMP_FANTASIA'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 364
        Visible = True
      end>
  end
  inherited dstBusca: TSQLDataSet
    CommandText = 
      'select EMP_CODIGO, EMP_FANTASIA from EMPRESAS'#13#10'Where EMP_FANTASI' +
      'A like :pNOME'
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
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    object cdsBuscaEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
    end
    object cdsBuscaEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
  end
end
