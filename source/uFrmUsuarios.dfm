inherited frmCadUsuarios: TfrmCadUsuarios
  Left = 192
  Top = 117
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 423
  ClientWidth = 583
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 583
    Height = 394
    inherited TabSheet1: TTabSheet
      object DBText1: TDBText [0]
        Left = 16
        Top = 22
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'SEN_CODIGO'
        DataSource = Dm.dsUsuarios
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label1: TLabel [1]
        Left = 16
        Top = 8
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
        Transparent = True
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 48
        Width = 31
        Height = 13
        Caption = 'Nome:'
        FocusControl = dbeNMUSUA
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 88
        Width = 31
        Height = 13
        Caption = 'Cargo:'
        FocusControl = DBEdit2
        Transparent = True
      end
      object Label4: TLabel [4]
        Left = 16
        Top = 128
        Width = 53
        Height = 13
        Caption = 'Supervisor:'
        Transparent = True
      end
      object Label5: TLabel [5]
        Left = 118
        Top = 128
        Width = 29
        Height = 13
        Caption = 'Caixa:'
        Transparent = True
      end
      object lbl_senha: TLabel [6]
        Left = 16
        Top = 244
        Width = 34
        Height = 13
        Caption = 'Senha:'
        Transparent = True
      end
      object lbl_confirma: TLabel [7]
        Left = 118
        Top = 244
        Width = 44
        Height = 13
        Caption = 'Confirma:'
        Transparent = True
      end
      object Label6: TLabel [8]
        Left = 217
        Top = 128
        Width = 54
        Height = 13
        Caption = 'Impressora:'
        Transparent = True
      end
      object Label7: TLabel [9]
        Left = 16
        Top = 168
        Width = 154
        Height = 13
        Caption = 'Pasta para impress'#227'o do cupom:'
        FocusControl = DBEdit1
        Transparent = False
      end
      object Label8: TLabel [10]
        Left = 16
        Top = 207
        Width = 50
        Height = 13
        Caption = 'Pasta ECF'
        FocusControl = DBEdit3
      end
      inherited Panel1: TPanel
        Top = 324
        Width = 575
      end
      object dbeNMUSUA: TDBEdit
        Left = 16
        Top = 64
        Width = 395
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SEN_NOME'
        DataSource = Dm.dsUsuarios
        TabOrder = 1
        OnExit = dbeNMUSUAExit
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 104
        Width = 395
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SEN_CARGO'
        DataSource = Dm.dsUsuarios
        TabOrder = 2
      end
      object edt_Confirma: TEdit
        Left = 118
        Top = 258
        Width = 82
        Height = 21
        MaxLength = 6
        PasswordChar = '*'
        TabOrder = 10
        OnExit = edt_ConfirmaExit
      end
      object dbeSNATUA: TEdit
        Left = 16
        Top = 258
        Width = 82
        Height = 21
        MaxLength = 6
        PasswordChar = '*'
        TabOrder = 9
        OnExit = dbeSNATUAExit
      end
      object cmbSUPER: TComboBox
        Left = 16
        Top = 144
        Width = 80
        Height = 22
        Style = csOwnerDrawFixed
        Enabled = False
        ItemHeight = 16
        TabOrder = 3
        Items.Strings = (
          'SIM'
          'N'#195'O')
      end
      object cmbCAIXA: TComboBox
        Left = 118
        Top = 144
        Width = 80
        Height = 22
        Style = csOwnerDrawFixed
        Enabled = False
        ItemHeight = 16
        TabOrder = 4
        OnChange = cmbCAIXAChange
        Items.Strings = (
          'SIM'
          'N'#195'O')
      end
      object cmbImpressora: TDBLookupComboBox
        Left = 216
        Top = 144
        Width = 145
        Height = 21
        DataField = 'SEN_IMPRESSORA'
        DataSource = Dm.dsUsuarios
        TabOrder = 5
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 184
        Width = 395
        Height = 21
        DataField = 'SEN_PASTA_CUPOM'
        DataSource = Dm.dsUsuarios
        TabOrder = 7
      end
      object cbxImpressora: TCheckBox
        Left = 371
        Top = 146
        Width = 119
        Height = 17
        Caption = '&Habilita Impressora'
        Enabled = False
        TabOrder = 6
      end
      object btnAcesso: TBitBtn
        Left = 487
        Top = 297
        Width = 75
        Height = 25
        Caption = 'Ace&ssos'
        TabOrder = 11
        OnClick = btnAcessoClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC90D8FC90D8FC90D8FC90D
          8FC90D8FC90D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0D8FC967CFF06EC6E6518CA03C92B12DAFE328ABE126A9E00D8FC9FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC98AE2FB6F7F8199828064514D35
          8CA92DB0E32AACE20D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0D8FC99CEAFF777876C6BDBA846D664C606439BAE933B5E60D8FC9FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC9A5EFFFB4D3DE8C8480BAB2AF60
          534B45B8DD41C1ED0D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0D8FC9A5EEFFCFF2FF98AFB4B6A9A69D958E46727748A4BD0D8FC9FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC9A5EEFFCEF2FFC6F0FF738788D3
          C9C78A7E787E76730D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0D8FC9A5EEFFCEF2FFC5F0FF99DEF0707F7DD3CACA968881846E674D372B634F
          43584339FF00FFFF00FFFF00FFFF00FF0D8FC9A5EEFFCEF2FFC5F0FFA0EBFF64
          BCCF989895C0BAB69A8C87C4B1B0C5B1B0C7B6B577645AFF00FFFF00FFFF00FF
          0D8FC9A5EEFFCEF2FFC5F0FFA0EBFF6FE2FE579AA5C0B7B5C5BAB7E3D8D8E5D8
          D8EFE6E7B4A9A4FF00FFFF00FFFF00FF0D8FC9A7EFFFD5F6FFCFF6FFA9F0FF75
          E6FF57868AC9BFBCEEE7E9E6DEDEEBE5E5F4EFEFF2EFEF5A483DFF00FFFF00FF
          0D8FC9A4EFFFBFEBFAA6E2F480DAF359C9E5827D75FFFFFFF2F0F0F4F4F4F4F4
          F6A69D95BDB5B058453AFF00FFFF00FF0D8FC95FC6E968C4E664C2E658C1E64A
          BDE5579AACC2BCB7FFFFFFDDDAD97E6E66645247A397916D5C51FF00FFFF00FF
          0D8FC988D7F099E7F793EAFC88EAFE79E6FC6BE0F887786FD4D0CEBAB1AC8C80
          77BBB5AF7E6E6558453AFF00FFFF00FFFF00FF0D8FC90D8FC90D8FC90D8FC90D
          8FC90D8FC90D8FC96D5C516D5C519084797A6C6058453AFF00FF}
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 223
        Width = 395
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SEN_PASTA_ECF'
        DataSource = Dm.dsUsuarios
        TabOrder = 8
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 575
        inherited btnConsultar: TBitBtn
          Left = 388
          Top = 36
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Left = 541
        Height = 306
      end
      inherited grdConsultar: TDBGrid
        Width = 541
        Height = 306
        Columns = <
          item
            Expanded = False
            FieldName = 'SEN_CODIGO'
            Title.Caption = 'C'#211'DIGO'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEN_NOME'
            Title.Caption = 'NOME'
            Width = 454
            Visible = True
          end>
      end
    end
  end
  inherited Panel4: TPanel
    Width = 583
  end
  inherited dsConsultar: TDataSource
    Left = 436
    Top = 154
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select SEN_CODIGO, SEN_NOME from USUARIOS'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    Left = 476
    Top = 154
  end
  inherited dspConsultar: TDataSetProvider
    Left = 508
    Top = 154
  end
  inherited cdsConsultar: TClientDataSet
    Left = 548
    Top = 154
    object cdsConsultarSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      Size = 40
    end
  end
end
