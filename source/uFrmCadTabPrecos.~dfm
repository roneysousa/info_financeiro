inherited frmCadTabelaPrecos: TfrmCadTabelaPrecos
  Left = 190
  Top = 126
  Caption = 'Tabela de Pre'#231'os'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 54
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object DBText1: TDBText [2]
        Left = 16
        Top = 24
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'PRC_CODIGO'
        DataSource = dsTabPrecos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 96
        Width = 55
        Height = 13
        Caption = 'Desconto 1'
        FocusControl = DBEdit1
        Transparent = True
      end
      object Label4: TLabel [4]
        Left = 136
        Top = 96
        Width = 55
        Height = 13
        Caption = 'Desconto 2'
        FocusControl = DBEdit2
        Transparent = True
      end
      object Label5: TLabel [5]
        Left = 256
        Top = 96
        Width = 55
        Height = 13
        Caption = 'Desconto 3'
        FocusControl = DBEdit3
        Transparent = True
      end
      object Label6: TLabel [6]
        Left = 16
        Top = 136
        Width = 55
        Height = 13
        Caption = 'Desconto 4'
        FocusControl = DBEdit4
      end
      object Label7: TLabel [7]
        Left = 136
        Top = 136
        Width = 55
        Height = 13
        Caption = 'Desconto 5'
        FocusControl = DBEdit5
      end
      object Label8: TLabel [8]
        Left = 256
        Top = 136
        Width = 55
        Height = 13
        Caption = 'Desconto 6'
        FocusControl = DBEdit6
      end
      object Label9: TLabel [9]
        Left = 16
        Top = 176
        Width = 58
        Height = 13
        Caption = 'Acrescimo 1'
        FocusControl = DBEdit7
      end
      object Label10: TLabel [10]
        Left = 136
        Top = 176
        Width = 58
        Height = 13
        Caption = 'Acrescimo 2'
        FocusControl = DBEdit8
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 70
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRC_DESCRICAO'
        DataSource = dsTabPrecos
        TabOrder = 1
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 112
        Width = 100
        Height = 21
        DataField = 'PRC_DESC1'
        DataSource = dsTabPrecos
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 136
        Top = 112
        Width = 100
        Height = 21
        DataField = 'PRC_DESC2'
        DataSource = dsTabPrecos
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 256
        Top = 112
        Width = 100
        Height = 21
        DataField = 'PRC_DESC3'
        DataSource = dsTabPrecos
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 152
        Width = 100
        Height = 21
        DataField = 'PRC_DESC4'
        DataSource = dsTabPrecos
        TabOrder = 5
      end
      object DBEdit5: TDBEdit
        Left = 136
        Top = 152
        Width = 100
        Height = 21
        DataField = 'PRC_DESC5'
        DataSource = dsTabPrecos
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 256
        Top = 152
        Width = 100
        Height = 21
        DataField = 'PRC_DESC6'
        DataSource = dsTabPrecos
        TabOrder = 7
      end
      object DBEdit7: TDBEdit
        Left = 16
        Top = 192
        Width = 100
        Height = 21
        DataField = 'PRC_ACRE1'
        DataSource = dsTabPrecos
        TabOrder = 8
      end
      object DBEdit8: TDBEdit
        Left = 136
        Top = 192
        Width = 100
        Height = 21
        DataField = 'PRC_ACRE2'
        DataSource = dsTabPrecos
        TabOrder = 9
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 372
          Top = 44
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Top = 17
        end
      end
      inherited grdConsultar: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'PRC_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRC_DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 442
            Visible = True
          end>
      end
    end
  end
  inherited dsConsultar: TDataSource
    Left = 188
    Top = 82
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select PRC_CODIGO, PRC_DESCRICAO from TAB_PRECOS'#13#10'order by PRC_D' +
      'ESCRICAO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    Left = 260
    Top = 90
  end
  inherited dspConsultar: TDataSetProvider
    Left = 348
    Top = 82
  end
  inherited cdsConsultar: TClientDataSet
    Left = 420
    Top = 82
    object cdsConsultarPRC_CODIGO: TIntegerField
      FieldName = 'PRC_CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsConsultarPRC_DESCRICAO: TStringField
      FieldName = 'PRC_DESCRICAO'
      Size = 40
    end
  end
  object dsTabPrecos: TDataSource
    AutoEdit = False
    DataSet = DM2.cdsTabPreco
    Left = 304
    Top = 80
  end
end
