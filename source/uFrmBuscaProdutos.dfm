inherited frmBuscaProduto: TfrmBuscaProduto
  Left = 244
  Top = 157
  Caption = 'Localizar Produto'
  ClientWidth = 424
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 424
    inherited edtConsultar: TEdit
      Width = 385
    end
    inherited btnConsultar: TBitBtn
      Left = 341
      Top = 1
      Visible = False
      OnClick = btnConsultarClick
    end
  end
  inherited grdConsultar: TDBGrid
    Width = 424
    OnKeyPress = grdConsultarKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'PRO_DESCRICAO'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 393
        Visible = True
      end>
  end
  inherited dstBusca: TSQLDataSet
    CommandText = 
      'Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO from PRODUTOS Where' +
      ' PRO_DESCRICAO like :pNOME'
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
    object cdsBuscaPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsBuscaPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
  end
end
