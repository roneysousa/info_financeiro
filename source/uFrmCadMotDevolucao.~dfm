inherited frmCadMotivoDevolucao: TfrmCadMotivoDevolucao
  Caption = 'Tabela Motivo da Devolu'#231#227'o'
  ClientHeight = 269
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 240
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 10
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 55
        Width = 51
        Height = 13
        Caption = '&Descri'#231#227'o:'
        FocusControl = edtDescricao
        Transparent = True
      end
      object DBText1: TDBText [2]
        Left = 16
        Top = 23
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'DEV_CODIGO'
        DataSource = DM2.dsMotDevolucao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      inherited Panel1: TPanel
        Top = 170
      end
      object edtDescricao: TDBEdit
        Left = 16
        Top = 71
        Width = 514
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DEV_NOME'
        DataSource = DM2.dsMotDevolucao
        TabOrder = 1
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 396
          Top = 36
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Height = 152
      end
      inherited grdConsultar: TDBGrid
        Height = 152
        Columns = <
          item
            Expanded = False
            FieldName = 'DEV_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEV_NOME'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 447
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select * from DEVOLUCAO order by DEV_NOME'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarDEV_CODIGO: TIntegerField
      FieldName = 'DEV_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarDEV_NOME: TStringField
      FieldName = 'DEV_NOME'
      Size = 60
    end
  end
end
