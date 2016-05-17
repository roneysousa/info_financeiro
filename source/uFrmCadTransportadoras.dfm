inherited frmCadTransportadora: TfrmCadTransportadora
  Left = 187
  Top = 124
  Caption = 'Tabela de Transportadoras'
  ClientHeight = 286
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 257
    ActivePage = TabSheet2
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object DBText1: TDBText [1]
        Left = 16
        Top = 21
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'TRP_CODIGO'
        DataSource = dsTransp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 54
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 95
        Width = 35
        Height = 13
        Caption = '% Frete'
        FocusControl = dbePerc
        Transparent = True
      end
      object Label4: TLabel [4]
        Left = 16
        Top = 135
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit1
      end
      inherited Panel1: TPanel
        Top = 187
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 70
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TRP_NOME'
        DataSource = dsTransp
        TabOrder = 1
      end
      object dbePerc: TDBEdit
        Left = 16
        Top = 111
        Width = 134
        Height = 21
        DataField = 'TRP_PEFRETE'
        DataSource = dsTransp
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 151
        Width = 134
        Height = 21
        DataField = 'TRP_NRFONE'
        DataSource = dsTransp
        TabOrder = 3
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 396
          Top = 44
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Height = 169
      end
      inherited grdConsultar: TDBGrid
        Height = 169
        Columns = <
          item
            Expanded = False
            FieldName = 'TRP_CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRP_NOME'
            Title.Caption = 'Nome'
            Width = 335
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRP_NRFONE'
            Title.Caption = 'Telefone'
            Width = 76
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select TRP_CODIGO, TRP_NOME, TRP_NRFONE from TRANSPORTADORA'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarTRP_CODIGO: TIntegerField
      FieldName = 'TRP_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsConsultarTRP_NOME: TStringField
      FieldName = 'TRP_NOME'
      Size = 50
    end
    object cdsConsultarTRP_NRFONE: TStringField
      Alignment = taRightJustify
      FieldName = 'TRP_NRFONE'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
  end
  object dsTransp: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsTransportadora
    Left = 288
    Top = 176
  end
end
