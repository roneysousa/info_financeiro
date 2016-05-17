inherited frmRelMovimentoCaixa: TfrmRelMovimentoCaixa
  Left = 200
  Top = 128
  Caption = 'Movimento de Caixa'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 41
      Height = 13
      Caption = 'Per'#237'odo:'
      Transparent = True
    end
    object lblConta2: TLabel
      Left = 16
      Top = 66
      Width = 28
      Height = 13
      Caption = 'Conta'
      Transparent = True
    end
    object Label2: TLabel
      Left = 141
      Top = 44
      Width = 6
      Height = 13
      Caption = #224
      Transparent = True
    end
    object edtDTINIC: TDateEdit
      Left = 16
      Top = 39
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object edtDTFINA: TDateEdit
      Left = 152
      Top = 39
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object cmbConta: TComboBox
      Left = 16
      Top = 81
      Width = 257
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
    end
  end
  inherited Panel2: TPanel
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
  end
  object dstMovCaixa: TSQLDataSet
    CommandText = 
      'Select MC.cgm_loja, N.NAT_NOME, MC.cgm_tipo_mov, MC.cgm_dtmovi,'#13 +
      #10'MC.cgm_vlmovimento, MC.cgm_descricao, MC.cgm_vlmovimento, CS.CG' +
      'S_DESCRICAO,'#13#10'MC.cgm_cliente,  MC.CGM_FORNECEDOR'#13#10'from MOVIMENTO' +
      '_CONTAS MC'#13#10'INNER join NATUREZA N ON MC.cgm_natureza = N.nat_cod' +
      'igo'#13#10'INNER join contas_saldos CS ON MC.cgm_conta_saiu = CS.cgs_c' +
      'odigo'#13#10'WHERE (MC.cgm_dtmovi between :pDTINIC AND :pDTFINA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 128
  end
  object dspMovCaixa: TDataSetProvider
    DataSet = dstMovCaixa
    Options = [poAllowCommandText]
    Left = 64
    Top = 128
  end
  object cdsMovCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    ProviderName = 'dspMovCaixa'
    OnCalcFields = cdsMovCaixaCalcFields
    Left = 112
    Top = 128
    object cdsMovCaixaCGM_LOJA: TIntegerField
      FieldName = 'CGM_LOJA'
    end
    object cdsMovCaixaNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      Size = 30
    end
    object cdsMovCaixaCGM_TIPO_MOV: TStringField
      FieldName = 'CGM_TIPO_MOV'
      FixedChar = True
      Size = 3
    end
    object cdsMovCaixaCGM_DTMOVI: TDateField
      FieldName = 'CGM_DTMOVI'
    end
    object cdsMovCaixaCGM_VLMOVIMENTO: TFMTBCDField
      FieldName = 'CGM_VLMOVIMENTO'
      Precision = 15
      Size = 2
    end
    object cdsMovCaixaCGM_DESCRICAO: TStringField
      FieldName = 'CGM_DESCRICAO'
      Size = 60
    end
    object cdsMovCaixaCGM_VLMOVIMENTO_1: TFMTBCDField
      FieldName = 'CGM_VLMOVIMENTO_1'
      Precision = 15
      Size = 2
    end
    object cdsMovCaixaCGS_DESCRICAO: TStringField
      FieldName = 'CGS_DESCRICAO'
      Size = 30
    end
    object cdsMovCaixaCGM_CLIENTE: TIntegerField
      FieldName = 'CGM_CLIENTE'
    end
    object cdsMovCaixaCGM_FORNECEDOR: TIntegerField
      FieldName = 'CGM_FORNECEDOR'
    end
    object cdsMovCaixaCGM_RECEITA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CGM_RECEITA'
      Calculated = True
    end
    object cdsMovCaixaCGM_DESPESA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CGM_DESPESA'
      Calculated = True
    end
  end
end
