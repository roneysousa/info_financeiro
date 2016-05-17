inherited frmCadAtividades: TfrmCadAtividades
  Left = 185
  Top = 146
  Caption = 'Cadastro de Atividade'
  ClientHeight = 246
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 217
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 10
        Top = 9
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 10
        Top = 57
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeNMDESC
        Transparent = True
      end
      object DBText1: TDBText [2]
        Left = 10
        Top = 25
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'ATI_CODIGO'
        DataSource = Dm.DsAtividades
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
        Top = 147
      end
      object dbeNMDESC: TDBEdit
        Left = 10
        Top = 73
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ATI_NOME'
        DataSource = Dm.DsAtividades
        TabOrder = 1
        OnExit = dbeNMDESCExit
        OnKeyPress = dbeNMDESCKeyPress
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
          Top = 17
        end
      end
      inherited Panel3: TPanel
        Height = 129
      end
      inherited grdConsultar: TDBGrid
        Height = 129
        Columns = <
          item
            Expanded = False
            FieldName = 'ATI_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATI_NOME'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 436
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select * from ATIVIDADES'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarATI_CODIGO: TIntegerField
      FieldName = 'ATI_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarATI_NOME: TStringField
      FieldName = 'ATI_NOME'
      Size = 40
    end
  end
end
