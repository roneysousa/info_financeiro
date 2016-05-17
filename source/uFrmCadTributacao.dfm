inherited frmCadTributacao: TfrmCadTributacao
  Left = 207
  Top = 135
  Caption = 'Tabela de Tributa'#231#227'o'
  ClientHeight = 319
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 290
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
        Top = 64
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
        FocusControl = dbeNMDESC
        Transparent = True
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 104
        Width = 29
        Height = 13
        Caption = 'ICMS:'
        FocusControl = DBEdit3
        Transparent = True
      end
      object DBText1: TDBText [3]
        Left = 16
        Top = 32
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'TRI_CODIGO'
        DataSource = dsTributacao
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
        Width = 32
        Height = 13
        Caption = 'Indice:'
        FocusControl = DBEdit1
      end
      inherited Panel1: TPanel
        Top = 220
      end
      object dbeNMDESC: TDBEdit
        Left = 16
        Top = 80
        Width = 264
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TRI_DESCRICAO'
        DataSource = dsTributacao
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 120
        Width = 212
        Height = 21
        DataField = 'TRI_ICMS'
        DataSource = dsTributacao
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 160
        Width = 56
        Height = 21
        DataField = 'TRI_INDICE_ECF'
        DataSource = dsTributacao
        TabOrder = 3
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
          Top = 18
        end
      end
      inherited Panel3: TPanel
        Height = 202
      end
      inherited grdConsultar: TDBGrid
        Height = 202
        Columns = <
          item
            Expanded = False
            FieldName = 'TRI_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRI_DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 453
            Visible = True
          end>
      end
    end
  end
  inherited dsConsultar: TDataSource
    Left = 324
    Top = 146
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select TRI_CODIGO, TRI_DESCRICAO from TRIBUTACAO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarTRI_CODIGO: TIntegerField
      FieldName = 'TRI_CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsConsultarTRI_DESCRICAO: TStringField
      FieldName = 'TRI_DESCRICAO'
      FixedChar = True
    end
  end
  object dsTributacao: TDataSource
    DataSet = Dm.cdsTributacao
    Left = 280
    Top = 176
  end
end
