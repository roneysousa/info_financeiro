inherited frmBuscaFornec: TfrmBuscaFornec
  Left = 225
  Top = 202
  ClientWidth = 425
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 425
    inherited edtConsultar: TEdit
      Width = 385
    end
    inherited btnConsultar: TBitBtn
      Top = 1
      Visible = False
      OnClick = btnConsultarClick
    end
  end
  inherited grdConsultar: TDBGrid
    Width = 425
    OnKeyPress = grdConsultarKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'FOR_FANTASIA'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 378
        Visible = True
      end>
  end
  inherited dstBusca: TSQLDataSet
    CommandText = 
      'select FOR_CODIGO, FOR_FANTASIA from FORNECEDORES'#13#10'Where FOR_FAN' +
      'TASIA like :pNOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    object dstBuscaFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      Required = True
    end
    object dstBuscaFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
  end
  inherited cdsBusca: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    object cdsBuscaFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      Required = True
    end
    object cdsBuscaFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
  end
end
