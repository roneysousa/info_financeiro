inherited frmRelTotalNatureza: TfrmRelTotalNatureza
  Left = 210
  Top = 131
  Caption = 'Total por Natureza'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 16
      Top = 18
      Width = 38
      Height = 13
      Caption = '&Per'#237'odo'
      FocusControl = edtDTINIC
      Transparent = True
    end
    object Label2: TLabel
      Left = 17
      Top = 61
      Width = 23
      Height = 13
      Caption = '&Loja:'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object edtDTINIC: TDateEdit
      Left = 16
      Top = 36
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnExit = edtDTINICExit
    end
    object edtDTFINA: TDateEdit
      Left = 152
      Top = 36
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtDTFINAExit
    end
    object cbxReceita: TCheckBox
      Left = 16
      Top = 110
      Width = 97
      Height = 17
      Caption = '&Receita'
      TabOrder = 3
    end
    object cbxDespesa: TCheckBox
      Left = 152
      Top = 110
      Width = 97
      Height = 17
      Caption = '&Despesa'
      TabOrder = 4
    end
    object cmbNMLOJA: TComboBox
      Left = 16
      Top = 80
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
  object dstDados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 136
  end
  object dspDados: TDataSetProvider
    DataSet = dstDados
    Options = [poAllowCommandText]
    Left = 56
    Top = 136
  end
  object cdsTotalPagar: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select P.PAG_LOJA, N.NAT_NOME, Sum(P.PAG_VALORPAGO) as VALOR fro' +
      'm CONTASPAGAR P INNER join NATUREZA N ON P.pag_naturezadespesa =' +
      ' N.NAT_CODIGO Where (P.PAG_DATAVENCIMENTO >= :pDTINICIAL) AND (P' +
      '.PAG_DATAVENCIMENTO <= :pDTFINAL) Group by P.PAG_LOJA, N.NAT_NOM' +
      'E order by N.NAT_NOME'
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspDados'
    Left = 104
    Top = 136
  end
  object cdsTotalReceber: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select R.REC_LOJA, N.NAT_NOME, Sum(R.REC_VALORPARCELA) as VALOR,' +
      ' Sum(R.REC_PAGO) as VALOR_PAGO from CONTASRECEBER R INNER join N' +
      'ATUREZA N ON R.REC_NATUREZA = N.NAT_CODIGO Where (R.REC_DATAVENC' +
      'IMENTO >= :pDTINICIAL) AND (R.REC_DATAVENCIMENTO <= :pDTFINAL) a' +
      'nd (R.REC_LOJA = :pLOJA) Group by R.REC_LOJA, N.NAT_NOME order b' +
      'y N.NAT_NOME'
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspDados'
    Left = 160
    Top = 136
  end
end
