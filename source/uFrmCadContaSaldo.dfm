inherited frmCadContasSaldo: TfrmCadContasSaldo
  Left = 207
  Top = 153
  Caption = 'Cadastro Contas Saldo'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
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
        Top = 65
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 105
        Width = 73
        Height = 13
        Caption = 'Saldo da Conta'
        FocusControl = dbeSaldo
        Transparent = True
      end
      object Label4: TLabel [3]
        Left = 16
        Top = 145
        Width = 39
        Height = 13
        Caption = 'Ag'#234'ncia'
        FocusControl = DBEdit4
        Transparent = True
      end
      object Label5: TLabel [4]
        Left = 92
        Top = 145
        Width = 31
        Height = 13
        Caption = 'Banco'
        FocusControl = EditBancoCodigo
        Transparent = True
      end
      object Label6: TLabel [5]
        Left = 16
        Top = 185
        Width = 46
        Height = 13
        Caption = 'N'#186'. Conta'
        FocusControl = DBEdit6
        Transparent = True
      end
      object DBText1: TDBText [6]
        Left = 16
        Top = 32
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'CGS_CODIGO'
        DataSource = dsContaSaldo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 81
        Width = 394
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CGS_DESCRICAO'
        DataSource = dsContaSaldo
        TabOrder = 1
      end
      object dbeSaldo: TDBEdit
        Left = 16
        Top = 121
        Width = 153
        Height = 21
        DataField = 'CGS_VALOR_SALDO'
        DataSource = dsContaSaldo
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 161
        Width = 69
        Height = 21
        DataField = 'CGS_AGENCIA'
        DataSource = dsContaSaldo
        TabOrder = 3
        OnKeyPress = DBEdit4KeyPress
      end
      object EditBancoCodigo: TDBEdit
        Left = 92
        Top = 161
        Width = 75
        Height = 21
        DataField = 'CGS_BANCO'
        DataSource = dsContaSaldo
        MaxLength = 3
        TabOrder = 4
        OnExit = EditBancoCodigoExit
        OnKeyPress = DBEdit4KeyPress
      end
      object DBEdit6: TDBEdit
        Left = 16
        Top = 201
        Width = 134
        Height = 21
        DataField = 'CGS_NRCONTA'
        DataSource = dsContaSaldo
        TabOrder = 5
        OnKeyPress = DBEdit4KeyPress
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 572
        Height = 242
        Align = alClient
        Ctl3D = False
        DataSource = dsContaSaldo
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = btnAlterarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CGS_CODIGO'
            Title.Caption = 'C'#211'DIGO'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CGS_DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 358
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CGS_VALOR_SALDO'
            Title.Alignment = taRightJustify
            Title.Caption = 'SALDO'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 356
          Top = 36
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Top = 15
        end
      end
      inherited grdConsultar: TDBGrid
        ParentFont = False
        TitleFont.Name = 'Verdana'
        Columns = <
          item
            Expanded = False
            FieldName = 'CGS_CODIGO'
            Title.Caption = 'C'#211'DIGO'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CGS_DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 436
            Visible = True
          end>
      end
    end
  end
  inherited dsConsultar: TDataSource
    Left = 284
    Top = 258
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select CGS_CODIGO, CGS_DESCRICAO from CONTAS_SALDOS'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    Left = 364
    Top = 258
  end
  inherited dspConsultar: TDataSetProvider
    Left = 444
    Top = 258
  end
  inherited cdsConsultar: TClientDataSet
    Left = 516
    Top = 258
    object cdsConsultarCGS_CODIGO: TIntegerField
      FieldName = 'CGS_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarCGS_DESCRICAO: TStringField
      FieldName = 'CGS_DESCRICAO'
      Size = 30
    end
  end
  object dsContaSaldo: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsContaSaldo
    Left = 480
    Top = 64
  end
end
