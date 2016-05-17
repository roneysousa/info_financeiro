inherited frmBuscaCaixa: TfrmBuscaCaixa
  Caption = 'Localizar Caixa'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited btnConsultar: TBitBtn
      OnClick = btnConsultarClick
      Kind = bkOK
    end
  end
  inherited grdConsultar: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'SEN_NOME'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 378
        Visible = True
      end>
  end
  inherited dstBusca: TSQLDataSet
    CommandText = 
      'select SEN_CODIGO, SEN_NOME from USUARIOS'#13#10'Where SEN_NOME like :' +
      'pNOME'
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
  inherited dspBusca: TDataSetProvider
    Left = 200
  end
end
