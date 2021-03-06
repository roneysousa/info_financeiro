object frmVisualizarPC: TfrmVisualizarPC
  Left = 237
  Top = 140
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Visualizar Parcela'
  ClientHeight = 408
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 367
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Cr'#233'dito'
      FocusControl = DBEdit1
      Transparent = True
    end
    object Label2: TLabel
      Left = 158
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Parcela'
      FocusControl = DBEdit2
      Transparent = True
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 20
      Height = 13
      Caption = 'Loja'
      FocusControl = DBEdit3
      Transparent = True
    end
    object Label4: TLabel
      Left = 16
      Top = 88
      Width = 133
      Height = 13
      Caption = 'Loja\Comodat'#225'rio\Locat'#225'rio'
      FocusControl = DBEdit4
      Transparent = True
    end
    object Label5: TLabel
      Left = 16
      Top = 128
      Width = 65
      Height = 13
      Caption = 'Data Emiss'#227'o'
      FocusControl = DBEdit5
      Transparent = True
    end
    object Label6: TLabel
      Left = 158
      Top = 128
      Width = 82
      Height = 13
      Caption = 'Data Vencimento'
      FocusControl = DBEdit6
      Transparent = True
    end
    object Label7: TLabel
      Left = 300
      Top = 128
      Width = 80
      Height = 13
      Caption = 'Data Pagamento'
      FocusControl = DBEdit7
      Transparent = True
    end
    object Label8: TLabel
      Left = 16
      Top = 168
      Width = 24
      Height = 13
      Caption = 'Valor'
      FocusControl = DBEdit8
      Transparent = True
    end
    object Label9: TLabel
      Left = 158
      Top = 168
      Width = 25
      Height = 13
      Caption = 'Juros'
      FocusControl = DBEdit9
      Transparent = True
    end
    object Label10: TLabel
      Left = 300
      Top = 168
      Width = 52
      Height = 13
      Caption = 'Valor Pago'
      FocusControl = DBEdit10
      Transparent = True
    end
    object Label11: TLabel
      Left = 16
      Top = 208
      Width = 127
      Height = 13
      Caption = 'Modalidade de Pagamento'
      FocusControl = DBEdit11
      Transparent = True
    end
    object Label12: TLabel
      Left = 16
      Top = 246
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBMemo1
      Transparent = True
    end
    object Label13: TLabel
      Left = 300
      Top = 8
      Width = 46
      Height = 13
      Caption = 'N'#186' Venda'
      FocusControl = DBEdit12
      Transparent = True
    end
    object Label18: TLabel
      Left = 440
      Top = 128
      Width = 30
      Height = 13
      Caption = 'Atraso'
      FocusControl = DBEdit17
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 24
      Width = 134
      Height = 21
      Color = clSilver
      DataField = 'REC_CREDITO'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 158
      Top = 24
      Width = 134
      Height = 21
      Color = clSilver
      DataField = 'REC_PARCELA'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 64
      Width = 500
      Height = 21
      Color = clSilver
      DataField = 'EMP_FANTASIA'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 104
      Width = 500
      Height = 21
      Color = clSilver
      DataField = 'CLI_FANTASIA'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 144
      Width = 134
      Height = 21
      Color = clSilver
      DataField = 'REC_DATAEMISSAO'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 158
      Top = 144
      Width = 134
      Height = 21
      Color = clSilver
      DataField = 'REC_DATAVENCIMENTO'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 300
      Top = 144
      Width = 134
      Height = 21
      Color = clSilver
      DataField = 'REC_DATAPAGAMENTO'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 16
      Top = 184
      Width = 134
      Height = 21
      Color = clSilver
      DataField = 'REC_VALORPARCELA'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 158
      Top = 184
      Width = 134
      Height = 21
      Color = clSilver
      DataField = 'REC_VALORJUROS'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 300
      Top = 184
      Width = 134
      Height = 21
      Color = clSilver
      DataField = 'REC_PAGO'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit11: TDBEdit
      Left = 16
      Top = 224
      Width = 500
      Height = 21
      Color = clSilver
      DataField = 'MOD_NOME'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 262
      Width = 500
      Height = 89
      DataField = 'REC_DESCRICAO'
      DataSource = dsConsulta
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 11
    end
    object DBEdit12: TDBEdit
      Left = 300
      Top = 24
      Width = 134
      Height = 21
      Color = clSilver
      DataField = 'REC_NRVENDA'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object DBEdit17: TDBEdit
      Left = 440
      Top = 144
      Width = 74
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'ATRASO'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 367
    Width = 533
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtSair: TBitBtn
      Left = 434
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Sair esta janela'
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtSairClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000006400004242
        42008C6363009A666600B9666600BB686800B0717200C3686900C66A6B00C76A
        6D00CF6C6E00D2686900D16D6E00CC6E7100C0797A00D2707200D4707100D572
        7300D0727500D3747600D9757600D8767700E37D7E000080000000960000DC7F
        8000FF00FF00D7868700DA888800D8888A00DA888A00DF898A00E6808100E085
        8500E9818200EE868700E3888900E78C8D00F0878800F18B8C00F28B8C00F18D
        8E00F48C8D00F48E8F00EB8F9000EC969700E49A9800F3919200F7909100F791
        9200F2939400F9909200F9949500FA949500F9969700F0999A00FC999A00FF9D
        9E00F7B58400F5A7A500FACCAA00FBD6BB00FADCDC00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001A1A1A1A1A1A
        1A02011A1A1A1A1A1A1A1A1A1A1A02030405011A1A1A1A1A1A1A1A1A0203080B
        0B07010303030303031A1A1A030C0C0C0A09010E1F323B3B031A1A1A030C0C10
        0F0D01181818183B031A1A1A03111114151201181818183B031A1A1A03161616
        201301181717173B031A1A1A0326222D3E1D01171700003B031A1A1A03262337
        3F1E013C3A3A3A3B031A1A1A03272B282A19013C3D3D3D3B031A1A1A03273031
        2921013C3D3D3D3B031A1A1A032734352F24013C3D3D3D3B031A1A1A03273338
        3625013C3D3D3D3B031A1A1A03032E33392C013C3D3D3D3B031A1A1A1A1A0306
        1B1C010303030303031A1A1A1A1A1A1A0303011A1A1A1A1A1A1A}
    end
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pISEQ'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select CR.rec_sequencia, CR.rec_loja, CR.rec_credito, CR.rec_par' +
        'cela, CR.rec_cliente,'
      
        'CR.rec_nrvenda, CR.rec_dataemissao, CR.rec_datavencimento, CR.re' +
        'c_datapagamento,'
      
        'CR.rec_valorparcela, CR.rec_valorjuros, CR.rec_pago, CR.rec_desc' +
        'ricao, CR.rec_tipomodalidade,'
      'CL.cli_fantasia, CL.cli_razao, M.mod_nome, E.emp_fantasia,'
      'cr.rec_nrconta, cr.rec_banco, cr.rec_agencia, cr.rec_nrcheque'
      'from CONTASRECEBER CR'
      'INNER join CLIENTES CL on CR.rec_cliente = CL.cli_codigo'
      'INNER join modalidade M on CR.rec_tipomodalidade = M.mod_codigo'
      'INNER join EMPRESAS E on CR.rec_loja = E.emp_codigo'
      'where (cr.rec_sequencia = :pISEQ)')
    SQLConnection = Dm.SqlAdmin
    Left = 320
    Top = 336
  end
  object dspConsulta: TDataSetProvider
    DataSet = qryConsulta
    Options = [poAllowCommandText]
    Left = 360
    Top = 336
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pISEQ'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsulta'
    OnCalcFields = cdsConsultaCalcFields
    Left = 400
    Top = 336
    object cdsConsultaREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      Required = True
    end
    object cdsConsultaREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      Required = True
    end
    object cdsConsultaREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultaREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      Required = True
      DisplayFormat = '00'
    end
    object cdsConsultaREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      DisplayFormat = '0000000'
    end
    object cdsConsultaREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
      DisplayFormat = '0000000'
    end
    object cdsConsultaREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
    end
    object cdsConsultaREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
    end
    object cdsConsultaREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
    end
    object cdsConsultaREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultaREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultaREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultaREC_DESCRICAO: TMemoField
      FieldName = 'REC_DESCRICAO'
      BlobType = ftMemo
    end
    object cdsConsultaREC_TIPOMODALIDADE: TIntegerField
      FieldName = 'REC_TIPOMODALIDADE'
    end
    object cdsConsultaCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsConsultaCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
    object cdsConsultaMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
    object cdsConsultaEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object cdsConsultaREC_NRCONTA: TStringField
      FieldName = 'REC_NRCONTA'
      FixedChar = True
      Size = 12
    end
    object cdsConsultaREC_BANCO: TStringField
      FieldName = 'REC_BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsConsultaREC_AGENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'REC_AGENCIA'
      EditMask = '####-A;0;_'
      FixedChar = True
      Size = 6
    end
    object cdsConsultaREC_NRCHEQUE: TStringField
      FieldName = 'REC_NRCHEQUE'
      FixedChar = True
      Size = 10
    end
    object cdsConsultaATRASO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ATRASO'
      Calculated = True
    end
  end
  object dsConsulta: TDataSource
    AutoEdit = False
    DataSet = cdsConsulta
    Left = 440
    Top = 336
  end
end
