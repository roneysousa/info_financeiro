inherited frmBuscaAtendente: TfrmBuscaAtendente
  Left = 336
  Top = 216
  Caption = 'Localizar Atendente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited lblConsultar: TLabel
      Width = 131
      Caption = 'Digite o nome do atendente'
    end
    inherited edtConsultar: TEdit
      Width = 386
    end
    inherited btnConsultar: TBitBtn
      Left = 325
      Top = 33
      Visible = False
    end
  end
  inherited grdConsultar: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'FUN_NOME'
        Title.Caption = 'ATENDENTE'
        Width = 378
        Visible = True
      end>
  end
  inherited dstBusca: TSQLDataSet
    CommandText = 
      'select FUN_CODIGO, FUN_NOME from FUNCIONARIOS Where '#13#10'FUN_NOME l' +
      'ike :pNOME and (FUN_TPFUNC = '#39'V'#39') order by FUN_NOME'
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
    object cdsBuscaFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Required = True
    end
    object cdsBuscaFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
  end
end
