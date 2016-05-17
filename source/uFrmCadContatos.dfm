inherited frmCadContatos: TfrmCadContatos
  Left = 207
  Top = 131
  Caption = 'Cadastro de Contatos'
  ClientHeight = 397
  OldCreateOrder = True
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 368
    inherited TabSheet1: TTabSheet
      object Label2: TLabel [0]
        Left = 10
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbeCDCLIE
        Transparent = True
      end
      object Label3: TLabel [1]
        Left = 10
        Top = 86
        Width = 83
        Height = 13
        Caption = 'Nome do Contato'
        FocusControl = dbeNMCONT
        Transparent = True
      end
      object Label4: TLabel [2]
        Left = 10
        Top = 124
        Width = 56
        Height = 13
        Caption = 'Nascimento'
        Transparent = True
      end
      object Label5: TLabel [3]
        Left = 10
        Top = 162
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit5
        Transparent = True
      end
      object Label6: TLabel [4]
        Left = 170
        Top = 162
        Width = 32
        Height = 13
        Caption = 'Celular'
        FocusControl = DBEdit6
        Transparent = True
      end
      object Label8: TLabel [5]
        Left = 10
        Top = 199
        Width = 28
        Height = 13
        Caption = 'Cargo'
        FocusControl = DBLookupComboBox1
        Transparent = True
      end
      object DBText1: TDBText [6]
        Left = 10
        Top = 21
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'CON_CODIGO'
        DataSource = Dm.DsContatos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel [7]
        Left = 10
        Top = 49
        Width = 32
        Height = 13
        Caption = 'Cliente'
        FocusControl = dbeCDCLIE
        Transparent = True
      end
      object spLocCliente: TSpeedButton [8]
        Left = 90
        Top = 64
        Width = 23
        Height = 22
        Hint = 'Localizar cliente'
        Enabled = False
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777770077777777777770FF077777777777077FF07777
          7777770777FF077777777770777FFF00777777790777F1111077777790771117
          0B77777770799170B77777777709990B77777777770990B77777777777090B77
          777777777770B777777777777777777777777777777777777777}
        OnClick = spLocClienteClick
      end
      object lbl_NMCLIE: TLabel [9]
        Left = 120
        Top = 68
        Width = 13
        Height = 13
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel [10]
        Left = 8
        Top = 237
        Width = 61
        Height = 13
        Caption = 'Observa'#231#227'o:'
        FocusControl = DBMemo1
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 298
      end
      object dbeCDCLIE: TDBEdit
        Left = 10
        Top = 64
        Width = 79
        Height = 21
        DataField = 'CLI_CODIGO'
        DataSource = Dm.DsContatos
        TabOrder = 1
        OnChange = dbeCDCLIEChange
        OnExit = dbeCDCLIEExit
        OnKeyPress = dbeCDCLIEKeyPress
      end
      object dbeNMCONT: TDBEdit
        Left = 10
        Top = 101
        Width = 534
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CON_NOME'
        DataSource = Dm.DsContatos
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 10
        Top = 178
        Width = 134
        Height = 21
        DataField = 'CON_FONE'
        DataSource = Dm.DsContatos
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 170
        Top = 178
        Width = 134
        Height = 21
        DataField = 'CON_CELULAR'
        DataSource = Dm.DsContatos
        TabOrder = 5
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 10
        Top = 215
        Width = 534
        Height = 21
        DataField = 'CON_CARGO'
        DataSource = Dm.DsContatos
        TabOrder = 6
      end
      object DBMemo1: TDBMemo
        Left = 8
        Top = 252
        Width = 534
        Height = 59
        DataField = 'CON_OBSERVACAO'
        DataSource = Dm.DsContatos
        ScrollBars = ssVertical
        TabOrder = 7
        OnKeyPress = DBMemo1KeyPress
      end
      object dbeDTNASC: TDBDateEdit
        Left = 10
        Top = 140
        Width = 121
        Height = 21
        DataField = 'CON_DATANASC'
        DataSource = Dm.DsContatos
        NumGlyphs = 2
        TabOrder = 3
        OnExit = dbeDTNASCExit
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 436
          Top = 36
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Top = 17
        end
      end
      inherited Panel3: TPanel
        Height = 280
      end
      inherited grdConsultar: TDBGrid
        Height = 280
        Columns = <
          item
            Expanded = False
            FieldName = 'CON_CODIGO'
            Title.Caption = 'CODIGO'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CON_NOME'
            Title.Caption = 'NOME'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 443
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select CON_CODIGO, CON_NOME from CONTATOS'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarCON_CODIGO: TIntegerField
      FieldName = 'CON_CODIGO'
      DisplayFormat = '00000'
    end
    object cdsConsultarCON_NOME: TStringField
      FieldName = 'CON_NOME'
      Size = 50
    end
  end
  object qryCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select CLI_CODIGO, CLI_FANTASIA from CLIENTES'
      'Where (CLI_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 308
    Top = 78
  end
end
