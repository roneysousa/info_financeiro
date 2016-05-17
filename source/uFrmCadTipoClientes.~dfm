inherited frmCadTipoCliente: TfrmCadTipoCliente
  Left = 184
  Top = 201
  Caption = 'Tabela Tipo Clientes'
  ClientHeight = 236
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 207
    inherited TabSheet1: TTabSheet
      object Label2: TLabel [0]
        Left = 16
        Top = 7
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object DBText1: TDBText [1]
        Left = 16
        Top = 23
        Width = 5
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'TPC_CODIGO'
        DataSource = dsTipoClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label1: TLabel [2]
        Left = 16
        Top = 55
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 137
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 71
        Width = 409
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TPC_DESCRICAO'
        DataSource = dsTipoClientes
        TabOrder = 1
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited edtConsultar: TEdit
          OnDblClick = edtConsultarDblClick
        end
        inherited btnConsultar: TBitBtn
          Left = 412
          Top = 36
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Height = 119
      end
      inherited grdConsultar: TDBGrid
        Height = 119
        Columns = <
          item
            Expanded = False
            FieldName = 'TPC_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TPC_DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 457
            Visible = True
          end>
      end
    end
  end
  inherited dsConsultar: TDataSource
    Top = 178
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select TPC_CODIGO, TPC_DESCRICAO from TIPOCLIENTE order by TPC_D' +
      'ESCRICAO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    Left = 220
    Top = 178
  end
  inherited dspConsultar: TDataSetProvider
    Top = 178
  end
  inherited cdsConsultar: TClientDataSet
    Left = 372
    Top = 178
    object cdsConsultarTPC_CODIGO: TIntegerField
      FieldName = 'TPC_CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsConsultarTPC_DESCRICAO: TStringField
      FieldName = 'TPC_DESCRICAO'
      Size = 12
    end
  end
  object dsTipoClientes: TDataSource
    AutoEdit = False
    DataSet = DM2.cdsTpClientes
    Left = 280
    Top = 176
  end
end
