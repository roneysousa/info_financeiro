inherited frmCadCargos: TfrmCadCargos
  Left = 134
  Top = 160
  Caption = 'Cadastro de Cargos'
  ClientHeight = 240
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 211
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 10
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 10
        Top = 56
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeNMCARGO
        Transparent = True
      end
      object DBText1: TDBText [2]
        Left = 10
        Top = 32
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'CAR_CODIGO'
        DataSource = Dm.DsCargos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 141
      end
      object dbeNMCARGO: TDBEdit
        Left = 10
        Top = 72
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CAR_NOME'
        DataSource = Dm.DsCargos
        TabOrder = 1
        OnExit = dbeNMCARGOExit
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
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Height = 123
      end
      inherited grdConsultar: TDBGrid
        Height = 123
        Columns = <
          item
            Expanded = False
            FieldName = 'CAR_CODIGO'
            Title.Caption = 'CODIGO'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAR_NOME'
            Title.Caption = 'DESCRI'#199#195'O'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 446
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select * from CARGOS'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarCAR_NOME: TStringField
      FieldName = 'CAR_NOME'
      Size = 40
    end
  end
end
