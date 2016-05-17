inherited frmBuscaNatureza: TfrmBuscaNatureza
  Caption = 'Localizar Natureza'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited edtConsultar: TEdit
      Width = 386
    end
    inherited btnConsultar: TBitBtn
      Top = 1
      Visible = False
    end
  end
  inherited grdConsultar: TDBGrid
    OnKeyPress = grdConsultarKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'NAT_NOME'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 365
        Visible = True
      end>
  end
  inherited dstBusca: TSQLDataSet
    CommandText = 
      'Select NAT_CODIGO, NAT_NOME, NAT_TIPO from NATUREZA'#13#10'Where (NAT_' +
      'NOME like :pNOME)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsBusca: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
      end>
    object cdsBuscaNAT_CODIGO: TIntegerField
      FieldName = 'NAT_CODIGO'
      Required = True
    end
    object cdsBuscaNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      Size = 30
    end
    object cdsBuscaNAT_TIPO: TStringField
      FieldName = 'NAT_TIPO'
      FixedChar = True
      Size = 1
    end
  end
end
