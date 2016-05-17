inherited frmCadSubSecao: TfrmCadSubSecao
  Left = 205
  Caption = 'Tabela de Sub-Se'#231#227'o'
  ClientHeight = 315
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 286
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 61
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeNMDESC
        Transparent = True
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 101
        Width = 31
        Height = 13
        Caption = 'Se'#231#227'o'
        FocusControl = DBLookupComboBox1
        Transparent = True
      end
      object DBText1: TDBText [3]
        Left = 16
        Top = 32
        Width = 33
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'SUB_CODIGO'
        DataSource = Dm.dsSubSecao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label4: TLabel [4]
        Left = 16
        Top = 144
        Width = 40
        Height = 13
        Caption = '% Avista'
        FocusControl = dbePeAvista
        Transparent = True
      end
      object Label5: TLabel [5]
        Left = 152
        Top = 144
        Width = 48
        Height = 13
        Caption = '% A Prazo'
        FocusControl = dbePeAprazo
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 216
      end
      object dbeNMDESC: TDBEdit
        Left = 16
        Top = 77
        Width = 394
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SUB_DESCRICAO'
        DataSource = Dm.dsSubSecao
        TabOrder = 1
        OnExit = dbeNMDESCExit
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 16
        Top = 117
        Width = 394
        Height = 21
        DataField = 'SEC_NOME'
        DataSource = Dm.dsSubSecao
        TabOrder = 2
      end
      object dbePeAvista: TDBEdit
        Left = 16
        Top = 160
        Width = 121
        Height = 21
        DataField = 'SUB_PEAVISTA'
        DataSource = Dm.dsSubSecao
        TabOrder = 3
        OnExit = dbePeAvistaExit
      end
      object dbePeAprazo: TDBEdit
        Left = 152
        Top = 160
        Width = 121
        Height = 21
        DataField = 'SUB_PEAPRAZO'
        DataSource = Dm.dsSubSecao
        TabOrder = 4
        OnExit = dbePeAprazoExit
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 404
          Top = 28
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Top = 18
        end
      end
      inherited Panel3: TPanel
        Height = 198
      end
      inherited grdConsultar: TDBGrid
        Height = 198
        Columns = <
          item
            Expanded = False
            FieldName = 'SUB_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUB_DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 450
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select SUB_CODIGO, SUB_DESCRICAO from SUBSECAO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarSUB_CODIGO: TIntegerField
      FieldName = 'SUB_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarSUB_DESCRICAO: TStringField
      FieldName = 'SUB_DESCRICAO'
      Size = 30
    end
  end
  object qrySecao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select * from SECAO Where (SEC_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 236
    Top = 86
  end
end
