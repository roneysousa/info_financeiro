inherited frmCadBairro: TfrmCadBairro
  Left = 172
  Top = 140
  Caption = 'Cadastro de Bairro'
  ClientHeight = 270
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 241
    ActivePage = TabSheet1
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
        Top = 58
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNMBAIR
        Transparent = True
      end
      object DBText1: TDBText [2]
        Left = 16
        Top = 32
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'BAI_CODIGO'
        DataSource = Dm.DsBairros
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
        Top = 99
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBLookupComboBox1
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 171
      end
      object dbeNMBAIR: TDBEdit
        Left = 16
        Top = 74
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAI_NOME'
        DataSource = Dm.DsBairros
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 16
        Top = 114
        Width = 524
        Height = 21
        DataField = 'CID_NOME'
        DataSource = Dm.DsBairros
        TabOrder = 2
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 396
          Top = 28
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Top = 17
        end
      end
      inherited Panel3: TPanel
        Height = 153
      end
      inherited grdConsultar: TDBGrid
        Height = 153
        Columns = <
          item
            Expanded = False
            FieldName = 'BAI_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAI_NOME'
            Title.Caption = 'NOME'
            Width = 449
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select BAI_CODIGO, BAI_NOME from BAIRROS order by BAI_NOME'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    object datasetConsultarBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      Required = True
    end
    object datasetConsultarBAI_NOME: TStringField
      FieldName = 'BAI_NOME'
      Size = 40
    end
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsConsultarBAI_NOME: TStringField
      FieldName = 'BAI_NOME'
      Size = 40
    end
  end
  object qryTestaBairro: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select BAI_CODIGO from BAIRROS Where (BAI_NOME = :pNOME)'
      'and (CID_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 404
    Top = 78
  end
end
