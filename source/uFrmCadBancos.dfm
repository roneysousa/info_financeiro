inherited frmCadBancos: TfrmCadBancos
  Left = 197
  Top = 149
  Caption = 'Cadastro de Bancos'
  ClientHeight = 241
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 212
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 24
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbeCDBANC
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 64
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeNMBANC
      end
      inherited Panel1: TPanel
        Top = 142
      end
      object dbeCDBANC: TDBEdit
        Left = 16
        Top = 40
        Width = 43
        Height = 21
        DataField = 'BAN_CODIGO'
        DataSource = dsBancos
        TabOrder = 1
        OnExit = dbeCDBANCExit
        OnKeyPress = dbeCDBANCKeyPress
      end
      object dbeNMBANC: TDBEdit
        Left = 16
        Top = 80
        Width = 465
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAN_NOME'
        DataSource = dsBancos
        TabOrder = 2
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 404
          Top = 36
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Height = 124
      end
      inherited grdConsultar: TDBGrid
        Height = 124
        Columns = <
          item
            Expanded = False
            FieldName = 'BAN_CODIGO'
            Title.Caption = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAN_NOME'
            Title.Caption = 'BANCO'
            Width = 454
            Visible = True
          end>
      end
    end
  end
  inherited dsConsultar: TDataSource
    Left = 372
    Top = 58
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select * from BANCOS order by BAN_NOME'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    Left = 404
    Top = 58
  end
  inherited dspConsultar: TDataSetProvider
    Left = 436
    Top = 58
  end
  inherited cdsConsultar: TClientDataSet
    Left = 476
    Top = 58
    object cdsConsultarBAN_CODIGO: TStringField
      Alignment = taRightJustify
      FieldName = 'BAN_CODIGO'
      Required = True
      EditMask = '999;0;_'
      FixedChar = True
      Size = 3
    end
    object cdsConsultarBAN_NOME: TStringField
      FieldName = 'BAN_NOME'
      Size = 40
    end
  end
  object dsBancos: TDataSource
    AutoEdit = False
    DataSet = Dm.cdsBancos
    Left = 216
    Top = 64
  end
  object qryLocBanco: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCDBANC'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select BAN_CODIGO from BANCOS'
      'where (BAN_CODIGO = :pCDBANC)')
    SQLConnection = Dm.SqlAdmin
    Left = 316
    Top = 62
  end
end
