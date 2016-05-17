object DM2: TDM2
  OldCreateOrder = False
  Left = 197
  Top = 192
  Height = 655
  Width = 800
  object dstTransferencias: TSQLDataSet
    CommandText = 
      'select * from TRANSFERENCIAS Where (TRA_NRTRANSFERENCIA = :pNRTR' +
      'ANSFERENCIA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pNRTRANSFERENCIA'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 8
    object dstTransferenciasTRA_NRTRANSFERENCIA: TIntegerField
      FieldName = 'TRA_NRTRANSFERENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstTransferenciasTRA_LOJAORIGEM: TIntegerField
      FieldName = 'TRA_LOJAORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object dstTransferenciasTRA_LOJADESTINO: TIntegerField
      FieldName = 'TRA_LOJADESTINO'
      ProviderFlags = [pfInUpdate]
    end
    object dstTransferenciasTRA_ENTREGADOR: TIntegerField
      FieldName = 'TRA_ENTREGADOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstTransferenciasTRA_DATA: TDateField
      FieldName = 'TRA_DATA'
      ProviderFlags = [pfInUpdate]
    end
    object dstTransferenciasTRA_HORA: TStringField
      FieldName = 'TRA_HORA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstTransferenciasTRA_SITUACAO: TStringField
      FieldName = 'TRA_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstTransferenciasTRA_USUARIO: TIntegerField
      FieldName = 'TRA_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsTranferencias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransferencia'
    Left = 216
    Top = 8
    object cdsTranferenciasTRA_NRTRANSFERENCIA: TIntegerField
      FieldName = 'TRA_NRTRANSFERENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsTranferenciasTRA_LOJAORIGEM: TIntegerField
      FieldName = 'TRA_LOJAORIGEM'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object cdsTranferenciasTRA_LOJADESTINO: TIntegerField
      FieldName = 'TRA_LOJADESTINO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object cdsTranferenciasTRA_ENTREGADOR: TIntegerField
      FieldName = 'TRA_ENTREGADOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000000'
    end
    object cdsTranferenciasTRA_DATA: TDateField
      FieldName = 'TRA_DATA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsTranferenciasTRA_HORA: TStringField
      FieldName = 'TRA_HORA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99:99'
      FixedChar = True
      Size = 5
    end
    object cdsTranferenciasTRA_SITUACAO: TStringField
      FieldName = 'TRA_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsTranferenciasTRA_USUARIO: TIntegerField
      FieldName = 'TRA_USUARIO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000'
    end
    object cdsTranferenciasTRA_NMORIGEM: TStringField
      FieldKind = fkLookup
      FieldName = 'TRA_NMORIGEM'
      LookupDataSet = cdsOrigem
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'TRA_LOJAORIGEM'
      Size = 40
      Lookup = True
    end
    object cdsTranferenciasTRA_NMDESTINO: TStringField
      FieldKind = fkLookup
      FieldName = 'TRA_NMDESTINO'
      LookupDataSet = cdsDestino
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'TRA_LOJADESTINO'
      Size = 40
      Lookup = True
    end
    object cdsTranferenciasTRA_NMENTREGADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'TRA_NMENTREGADOR'
      LookupDataSet = cdsEntregador
      LookupKeyFields = 'FUN_CODIGO'
      LookupResultField = 'FUN_NOME'
      KeyFields = 'TRA_ENTREGADOR'
      Size = 40
      Lookup = True
    end
  end
  object dspTransferencia: TDataSetProvider
    DataSet = dstTransferencias
    Options = [poAllowCommandText]
    Left = 128
    Top = 8
  end
  object dsTransferencias: TDataSource
    AutoEdit = False
    DataSet = cdsTranferencias
    Left = 288
    Top = 8
  end
  object dstLojaOrigem: TSQLDataSet
    CommandText = 
      'select EMP_CODIGO, EMP_FANTASIA from EMPRESAS'#13#10'order by EMP_FANT' +
      'ASIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 64
  end
  object dstLojaDestino: TSQLDataSet
    CommandText = 
      'select EMP_CODIGO, EMP_FANTASIA from EMPRESAS'#13#10'order by EMP_FANT' +
      'ASIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 120
  end
  object dspOrigem: TDataSetProvider
    DataSet = dstLojaOrigem
    Options = [poAllowCommandText]
    Left = 96
    Top = 64
  end
  object cdsOrigem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrigem'
    Left = 152
    Top = 64
    object cdsOrigemEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
    end
    object cdsOrigemEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
  end
  object dsOrigem: TDataSource
    DataSet = cdsOrigem
    Left = 208
    Top = 64
  end
  object dspDestino: TDataSetProvider
    DataSet = dstLojaDestino
    Options = [poAllowCommandText]
    Left = 104
    Top = 120
  end
  object cdsDestino: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDestino'
    Left = 168
    Top = 120
    object cdsDestinoEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
    end
    object cdsDestinoEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
  end
  object dsDestino: TDataSource
    DataSet = cdsDestino
    Left = 232
    Top = 120
  end
  object dstEntregador: TSQLDataSet
    CommandText = 'select FUN_CODIGO, FUN_NOME from FUNCIONARIOS'#13#10'order by FUN_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 176
  end
  object dspEntregados: TDataSetProvider
    DataSet = dstEntregador
    Options = [poAllowCommandText]
    Left = 104
    Top = 168
  end
  object cdsEntregador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEntregados'
    Left = 176
    Top = 168
    object cdsEntregadorFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Required = True
    end
    object cdsEntregadorFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
  end
  object dsEntregador: TDataSource
    DataSet = cdsEntregador
    Left = 240
    Top = 168
  end
  object cdsItensTransf: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsItensTransfCalcFields
    Left = 368
    Top = 40
    Data = {
      0B0100009619E0BD0100000018000000070000000000030000000B010A505254
      5F434F4449474F0100490000000100055749445448020002000D000D5052545F
      44455343524943414F01004900000001000557494454480200020028000B5052
      545F554E494441444501004900000001000557494454480200020002000E5052
      545F5155414E54494441444508000400000000000C5052545F564C434F4D5052
      41080004000000010007535542545950450200490006004D6F6E6579000B5052
      545F564C435553544F080004000000010007535542545950450200490006004D
      6F6E6579000B5052545F564C56454E4441080004000000010007535542545950
      450200490006004D6F6E6579000000}
    object cdsItensTransfPRT_CODIGO: TStringField
      FieldName = 'PRT_CODIGO'
      Size = 13
    end
    object cdsItensTransfPRT_DESCRICAO: TStringField
      FieldName = 'PRT_DESCRICAO'
      Size = 40
    end
    object cdsItensTransfPRT_UNIDADE: TStringField
      FieldName = 'PRT_UNIDADE'
      Size = 2
    end
    object cdsItensTransfPRT_QUANTIDADE: TFloatField
      FieldName = 'PRT_QUANTIDADE'
    end
    object cdsItensTransfPRT_VLCOMPRA: TCurrencyField
      FieldName = 'PRT_VLCOMPRA'
      DisplayFormat = '###,###,##0.#0'
    end
    object cdsItensTransfPRT_VLCUSTO: TCurrencyField
      FieldName = 'PRT_VLCUSTO'
      DisplayFormat = '###,###,##0.#0'
    end
    object cdsItensTransfPRT_VLVENDA: TCurrencyField
      FieldName = 'PRT_VLVENDA'
      DisplayFormat = '###,###,##0.#0'
    end
    object cdsItensTransfPRT_SUBTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PRT_SUBTOTAL'
      DisplayFormat = '###,###,##0.#0'
      Calculated = True
    end
  end
  object dsItensTransf: TDataSource
    DataSet = cdsItensTransf
    Left = 456
    Top = 16
  end
  object dstModalidades: TSQLDataSet
    CommandText = 'select MOD_CODIGO, MOD_NOME from MODALIDADE'#13#10'order by MOD_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 216
  end
  object dspModalidades: TDataSetProvider
    DataSet = dstModalidades
    Options = [poAllowCommandText]
    Left = 104
    Top = 216
  end
  object cdsModalidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModalidades'
    Left = 176
    Top = 216
    object cdsModalidadesMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      Required = True
    end
    object cdsModalidadesMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
  end
  object dsModalidades: TDataSource
    DataSet = cdsModalidades
    Left = 248
    Top = 224
  end
  object dstNatureza: TSQLDataSet
    CommandText = 'select * from NATUREZA Where (NAT_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 272
    object dstNaturezaNAT_CODIGO: TIntegerField
      FieldName = 'NAT_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstNaturezaNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstNaturezaNAT_TIPO: TStringField
      FieldName = 'NAT_TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstNaturezaNAT_FLDESC: TStringField
      FieldName = 'NAT_FLDESC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dspNatureza: TDataSetProvider
    DataSet = dstNatureza
    Options = [poAllowCommandText]
    Left = 104
    Top = 272
  end
  object cdsNatureza: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNatureza'
    Left = 176
    Top = 272
    object cdsNaturezaNAT_CODIGO: TIntegerField
      FieldName = 'NAT_CODIGO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsNaturezaNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      Size = 30
    end
    object cdsNaturezaNAT_TIPO: TStringField
      FieldName = 'NAT_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsNaturezaNAT_FLDESC: TStringField
      FieldName = 'NAT_FLDESC'
      FixedChar = True
      Size = 1
    end
  end
  object dsNatureza: TDataSource
    DataSet = cdsNatureza
    Left = 248
    Top = 272
  end
  object dstPerdas: TSQLDataSet
    CommandText = 
      'select PER_SEQUENCIA, PED_DESCRICAO from PERDAS'#13#10'order by PED_DE' +
      'SCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 320
  end
  object dspPerdas: TDataSetProvider
    DataSet = dstPerdas
    Options = [poAllowCommandText]
    OnGetTableName = dspPerdasGetTableName
    Left = 104
    Top = 320
  end
  object cdsPerdas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerdas'
    Left = 168
    Top = 320
  end
  object dsPerdas: TDataSource
    DataSet = cdsPerdas
    Left = 224
    Top = 320
  end
  object dstDerivados: TSQLDataSet
    CommandText = 
      'select DER_ID, DER_DESCRICAO from DERIVADOS'#13#10'Group by DER_ID, DE' +
      'R_DESCRICAO order by DER_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 288
    Top = 80
  end
  object dspDerivados: TDataSetProvider
    DataSet = dstDerivados
    Options = [poAllowCommandText]
    OnGetTableName = dspDerivadosGetTableName
    Left = 360
    Top = 80
  end
  object cdsDerivados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDerivados'
    Left = 432
    Top = 80
    object cdsDerivadosDER_ID: TIntegerField
      FieldName = 'DER_ID'
    end
    object cdsDerivadosDER_DESCRICAO: TStringField
      FieldName = 'DER_DESCRICAO'
      Size = 40
    end
  end
  object dsDerivados: TDataSource
    DataSet = cdsDerivados
    Left = 504
    Top = 80
  end
  object dstProdutoEntrada: TSQLDataSet
    CommandText = 
      'Select * from ENTRADAPRODUTO Where (ENP_NUMERO=  :pNUMERO) AND (' +
      'PRO_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 304
    Top = 136
    object dstProdutoEntradaENP_NUMERO: TIntegerField
      FieldName = 'ENP_NUMERO'
    end
    object dstProdutoEntradaPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      FixedChar = True
      Size = 13
    end
    object dstProdutoEntradaUNI_UNIDADE: TStringField
      FieldName = 'UNI_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstProdutoEntradaENP_QUANTIDADE: TFMTBCDField
      FieldName = 'ENP_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutoEntradaENP_VALOR: TFMTBCDField
      FieldName = 'ENP_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutoEntradaENP_IPI: TFMTBCDField
      FieldName = 'ENP_IPI'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutoEntradaENP_ICMS: TFMTBCDField
      FieldName = 'ENP_ICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutoEntradaENP_SUBTOTAL: TFMTBCDField
      FieldName = 'ENP_SUBTOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
  end
  object dspProdutoEntrada: TDataSetProvider
    DataSet = dstProdutoEntrada
    Options = [poAllowCommandText]
    OnGetTableName = dspProdutoEntradaGetTableName
    Left = 392
    Top = 136
  end
  object cdsProdutoEntrada: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspProdutoEntrada'
    Left = 480
    Top = 136
  end
  object dsProdutoEntrada: TDataSource
    Left = 560
    Top = 136
  end
  object dstContasPagar: TSQLDataSet
    CommandText = 
      'Select * from CONTASPAGAR Where (PAG_LOJA = :pLOJA)'#13#10'AND (PAG_NR' +
      'ENTRADA = :pNRENTRADA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pNRENTRADA'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 312
    Top = 192
    object dstContasPagarPAG_SEQUENCIA: TIntegerField
      FieldName = 'PAG_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasPagarPAG_LOJA: TIntegerField
      FieldName = 'PAG_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasPagarPAG_NRENTRADA: TIntegerField
      FieldName = 'PAG_NRENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasPagarPAG_PARCELA: TStringField
      FieldName = 'PAG_PARCELA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstContasPagarPAG_QTPARCELAS: TIntegerField
      FieldName = 'PAG_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasPagarPAG_DATACOMPRA: TDateField
      FieldName = 'PAG_DATACOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasPagarPAG_DATAVENCIMENTO: TDateField
      FieldName = 'PAG_DATAVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasPagarPAG_FORNECEDOR: TIntegerField
      FieldName = 'PAG_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasPagarPAG_NRNOTA: TStringField
      FieldName = 'PAG_NRNOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstContasPagarPAG_SERIENOTA: TStringField
      FieldName = 'PAG_SERIENOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstContasPagarPAG_NATUREZADESPESA: TIntegerField
      FieldName = 'PAG_NATUREZADESPESA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasPagarPAG_DESCONTOANTECIPADO: TFMTBCDField
      FieldName = 'PAG_DESCONTOANTECIPADO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasPagarPAG_DESCRICAO: TMemoField
      FieldName = 'PAG_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object dstContasPagarPAG_VALORPARCELA: TFMTBCDField
      FieldName = 'PAG_VALORPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasPagarPAG_SITUACAO: TStringField
      FieldName = 'PAG_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstContasPagarPAG_DATAPAGAMENTO: TDateField
      FieldName = 'PAG_DATAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasPagarPAG_VALORPAGO: TFMTBCDField
      FieldName = 'PAG_VALORPAGO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasPagarPAG_VALORDESCONTO: TFMTBCDField
      FieldName = 'PAG_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasPagarPAG_VALORJUROS: TFMTBCDField
      FieldName = 'PAG_VALORJUROS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasPagarPAG_MODALIDADE: TIntegerField
      FieldName = 'PAG_MODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasPagarPAG_BANCO: TStringField
      FieldName = 'PAG_BANCO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstContasPagarPAG_NRCONTA: TStringField
      FieldName = 'PAG_NRCONTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstContasPagarPAG_NRCHEQUE: TStringField
      FieldName = 'PAG_NRCHEQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstContasPagarPAG_USUARIO: TIntegerField
      FieldName = 'PAG_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasPagarPAG_AGENCIA: TStringField
      FieldName = 'PAG_AGENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
  end
  object dspContasPagar: TDataSetProvider
    DataSet = dstContasPagar
    Options = [poAllowCommandText]
    OnGetTableName = dspContasPagarGetTableName
    Left = 400
    Top = 192
  end
  object cdsContasPagar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pNRENTRADA'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspContasPagar'
    OnCalcFields = cdsContasPagarCalcFields
    Left = 480
    Top = 192
    object cdsContasPagarPAG_SEQUENCIA: TIntegerField
      FieldName = 'PAG_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000000'
    end
    object cdsContasPagarPAG_LOJA: TIntegerField
      FieldName = 'PAG_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object cdsContasPagarPAG_NRENTRADA: TIntegerField
      FieldName = 'PAG_NRENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsContasPagarPAG_PARCELA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAG_PARCELA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsContasPagarPAG_QTPARCELAS: TIntegerField
      FieldName = 'PAG_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '00'
    end
    object cdsContasPagarPAG_DATACOMPRA: TDateField
      FieldName = 'PAG_DATACOMPRA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasPagarPAG_DATAVENCIMENTO: TDateField
      FieldName = 'PAG_DATAVENCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasPagarPAG_FORNECEDOR: TIntegerField
      FieldName = 'PAG_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasPagarPAG_NRNOTA: TStringField
      FieldName = 'PAG_NRNOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object cdsContasPagarPAG_SERIENOTA: TStringField
      FieldName = 'PAG_SERIENOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsContasPagarPAG_NATUREZADESPESA: TIntegerField
      FieldName = 'PAG_NATUREZADESPESA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0000'
      EditFormat = '0000'
    end
    object cdsContasPagarPAG_DESCONTOANTECIPADO: TFMTBCDField
      FieldName = 'PAG_DESCONTOANTECIPADO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasPagarPAG_DESCRICAO: TMemoField
      FieldName = 'PAG_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cdsContasPagarPAG_VALORPARCELA: TFMTBCDField
      FieldName = 'PAG_VALORPARCELA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasPagarPAG_SITUACAO: TStringField
      FieldName = 'PAG_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsContasPagarPAG_DATAPAGAMENTO: TDateField
      FieldName = 'PAG_DATAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasPagarPAG_VALORPAGO: TFMTBCDField
      FieldName = 'PAG_VALORPAGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasPagarPAG_VALORDESCONTO: TFMTBCDField
      FieldName = 'PAG_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasPagarPAG_VALORJUROS: TFMTBCDField
      FieldName = 'PAG_VALORJUROS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasPagarPAG_MODALIDADE: TIntegerField
      FieldName = 'PAG_MODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasPagarPAG_BANCO: TStringField
      Alignment = taRightJustify
      FieldName = 'PAG_BANCO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object cdsContasPagarPAG_NRCONTA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAG_NRCONTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object cdsContasPagarPAG_NRCHEQUE: TStringField
      Alignment = taRightJustify
      FieldName = 'PAG_NRCHEQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object cdsContasPagarPAG_USUARIO: TIntegerField
      FieldName = 'PAG_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasPagarPAG_AGENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAG_AGENCIA'
      ProviderFlags = [pfInUpdate]
      EditMask = '9999-A;0;_'
      FixedChar = True
      Size = 5
    end
    object cdsContasPagarPAG_NOMELOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'PAG_NOMELOJA'
      LookupDataSet = cdsOrigem
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'PAG_LOJA'
      Size = 40
      Lookup = True
    end
    object cdsContasPagarPAG_NMFORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'PAG_NMFORNECEDOR'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FOR_CODIGO'
      LookupResultField = 'FOR_FANTASIA'
      KeyFields = 'PAG_FORNECEDOR'
      Size = 40
      Lookup = True
    end
    object cdsContasPagarPAG_ATRASO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PAG_ATRASO'
      Calculated = True
    end
    object cdsContasPagarPAG_NMMODA: TStringField
      FieldKind = fkLookup
      FieldName = 'PAG_NMMODA'
      LookupDataSet = cdsModalidades
      LookupKeyFields = 'MOD_CODIGO'
      LookupResultField = 'MOD_NOME'
      KeyFields = 'PAG_MODALIDADE'
      Size = 40
      Lookup = True
    end
    object cdsContasPagarPAG_NMSITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'PAG_NMSITUACAO'
      Size = 8
      Calculated = True
    end
  end
  object dsContasPagar: TDataSource
    AutoEdit = False
    DataSet = cdsContasPagar
    Left = 568
    Top = 192
  end
  object dstEntradas: TSQLDataSet
    CommandText = 
      'Select * from ENTRADAS Where (ENT_NUMERO = :pNUMERO) and'#13#10'(ENT_L' +
      'OJA = :pLOJA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 312
    Top = 248
    object dstEntradasENT_NUMERO: TIntegerField
      FieldName = 'ENT_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstEntradasENT_LOJA: TIntegerField
      FieldName = 'ENT_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstEntradasENT_FORNECEDOR: TIntegerField
      FieldName = 'ENT_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradasENT_TRANSPORTADORA: TIntegerField
      FieldName = 'ENT_TRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradasENT_DATAPEDIDO: TDateField
      FieldName = 'ENT_DATAPEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradasENT_DATAENTRADA: TDateField
      FieldName = 'ENT_DATAENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradasENT_NATUREZAOPERACAO: TStringField
      FieldName = 'ENT_NATUREZAOPERACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstEntradasENT_DATAEMISSAONOTA: TDateField
      FieldName = 'ENT_DATAEMISSAONOTA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradasENT_NUMERONOTA: TStringField
      FieldName = 'ENT_NUMERONOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstEntradasENT_SERIENOTA: TStringField
      FieldName = 'ENT_SERIENOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstEntradasENT_VALORMERCADORIAS: TFMTBCDField
      FieldName = 'ENT_VALORMERCADORIAS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_TIPOFRETE: TStringField
      FieldName = 'ENT_TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstEntradasENT_VALORFRETE: TFMTBCDField
      FieldName = 'ENT_VALORFRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_BASECALCULOICMS: TFMTBCDField
      FieldName = 'ENT_BASECALCULOICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_VALORICMS: TFMTBCDField
      FieldName = 'ENT_VALORICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_BASECALCULOSUBSTITUICAO: TFMTBCDField
      FieldName = 'ENT_BASECALCULOSUBSTITUICAO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_VALORSUBSTITUICAO: TFMTBCDField
      FieldName = 'ENT_VALORSUBSTITUICAO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_VALORIPI: TFMTBCDField
      FieldName = 'ENT_VALORIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_VALORSEGURO: TFMTBCDField
      FieldName = 'ENT_VALORSEGURO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_OUTRASPESPESAS: TFMTBCDField
      FieldName = 'ENT_OUTRASPESPESAS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_VALORDESCONTO: TFMTBCDField
      FieldName = 'ENT_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_VALORNOTA: TFMTBCDField
      FieldName = 'ENT_VALORNOTA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstEntradasENT_SITUACAO: TStringField
      FieldName = 'ENT_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstEntradasENT_USUARIO: TIntegerField
      FieldName = 'ENT_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspEntradas: TDataSetProvider
    DataSet = dstEntradas
    Options = [poAllowCommandText]
    OnGetTableName = dspEntradasGetTableName
    Left = 392
    Top = 248
  end
  object cdsEntradas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspEntradas'
    Left = 464
    Top = 248
  end
  object dsEntradas: TDataSource
    DataSet = cdsEntradas
    Left = 528
    Top = 248
  end
  object cdsProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 8
    Data = {
      5F0100009619E0BD01000000180000000A0000000000030000005F010A50524F
      5F434F4449474F0100490000000100055749445448020002000D000850524F5F
      4E4F4D4501004900000001000557494454480200020028000D554E495F444553
      43524943414F01004900000001000557494454480200020002000A50524F5F4E
      524C4F544501004900000001000557494454480200020014000E454E505F5155
      414E544944414445080004000000000009454E505F56414C4F52080004000000
      010007535542545950450200490006004D6F6E65790007454E505F4950490800
      04000000010007535542545950450200490006004D6F6E65790008454E505F49
      434D53080004000000010007535542545950450200490006004D6F6E6579000C
      454E505F535542544F54414C0800040000000100075355425459504502004900
      06004D6F6E6579001050524F5F445456454E43494D454E544F04000600000000
      000000}
    object cdsProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Size = 13
    end
    object cdsProdutosPRO_NOME: TStringField
      FieldName = 'PRO_NOME'
      Size = 40
    end
    object cdsProdutosUNI_DESCRICAO: TStringField
      FieldName = 'UNI_DESCRICAO'
      Size = 2
    end
    object cdsProdutosPRO_NRLOTE: TStringField
      FieldName = 'PRO_NRLOTE'
    end
    object cdsProdutosENP_QUANTIDADE: TFloatField
      FieldName = 'ENP_QUANTIDADE'
      DisplayFormat = '#,##0.##0'
      EditFormat = '#,##0.##0'
    end
    object cdsProdutosENP_VALOR: TCurrencyField
      FieldName = 'ENP_VALOR'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsProdutosENP_IPI: TCurrencyField
      FieldName = 'ENP_IPI'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsProdutosENP_ICMS: TCurrencyField
      FieldName = 'ENP_ICMS'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsProdutosENP_SUBTOTAL: TCurrencyField
      FieldName = 'ENP_SUBTOTAL'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsProdutosPRO_DTVENCIMENTO: TDateField
      FieldName = 'PRO_DTVENCIMENTO'
    end
  end
  object dstContasReceber: TSQLDataSet
    CommandText = 'Select * from CONTASRECEBER Where (REC_CREDITO = :pCREDITO)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 312
    Top = 304
    object dstContasReceberREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasReceberREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasReceberREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasReceberREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '00'
    end
    object dstContasReceberREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DESCRICAO: TMemoField
      FieldName = 'REC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstContasReceberREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstContasReceberREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_VALORACRESIMO: TFMTBCDField
      FieldName = 'REC_VALORACRESIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_VALORDESCONTO: TFMTBCDField
      FieldName = 'REC_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_RESTANTE: TFMTBCDField
      FieldName = 'REC_RESTANTE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_BANCO: TStringField
      FieldName = 'REC_BANCO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstContasReceberREC_AGENCIA: TStringField
      FieldName = 'REC_AGENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstContasReceberREC_NRCONTA: TStringField
      FieldName = 'REC_NRCONTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstContasReceberREC_NRCHEQUE: TStringField
      FieldName = 'REC_NRCHEQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstContasReceberREC_TIPOMODALIDADE: TIntegerField
      FieldName = 'REC_TIPOMODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_USUARIO: TIntegerField
      FieldName = 'REC_USUARIO'
    end
    object dstContasReceberREC_NATUREZA: TIntegerField
      FieldName = 'REC_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DATA_CREDITO: TDateField
      FieldName = 'REC_DATA_CREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_FLBOLETO: TStringField
      FieldName = 'REC_FLBOLETO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstContasReceberREC_VLMULTA: TFMTBCDField
      FieldName = 'REC_VLMULTA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContasReceberREC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_SEUNUMERO: TStringField
      FieldName = 'REC_SEUNUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dstContasReceberREC_FORMABAIXA: TStringField
      FieldName = 'REC_FORMABAIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstContasReceberREC_PEDESC: TFMTBCDField
      FieldName = 'REC_PEDESC'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContasReceberREC_PEMULTA: TFMTBCDField
      FieldName = 'REC_PEMULTA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContasReceberREC_PEJURO: TFMTBCDField
      FieldName = 'REC_PEJURO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContasReceberREC_CDCEDENTE: TIntegerField
      FieldName = 'REC_CDCEDENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_VLLIQUIDO: TFMTBCDField
      FieldName = 'REC_VLLIQUIDO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
  end
  object dspContasReceber: TDataSetProvider
    DataSet = dstContasReceber
    Options = [poAllowCommandText]
    OnGetTableName = dspContasReceberGetTableName
    Left = 408
    Top = 296
  end
  object cdsContasReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspContasReceber'
    OnCalcFields = cdsContasReceberCalcFields
    Left = 504
    Top = 296
    object cdsContasReceberREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      Required = True
    end
    object cdsContasReceberREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      Required = True
      DisplayFormat = '000'
    end
    object cdsContasReceberREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsContasReceberREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      Required = True
      DisplayFormat = '00'
    end
    object cdsContasReceberREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
      DisplayFormat = '00'
    end
    object cdsContasReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      DisplayFormat = '0000000'
    end
    object cdsContasReceberREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
      DisplayFormat = '0000000'
    end
    object cdsContasReceberREC_DESCRICAO: TMemoField
      FieldName = 'REC_DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContasReceberREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasReceberREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasReceberREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsContasReceberREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
      EditMask = '99/99/9999;1;'
    end
    object cdsContasReceberREC_VALORACRESIMO: TFMTBCDField
      FieldName = 'REC_VALORACRESIMO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_VALORDESCONTO: TFMTBCDField
      FieldName = 'REC_VALORDESCONTO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_RESTANTE: TFMTBCDField
      FieldName = 'REC_RESTANTE'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_BANCO: TStringField
      Alignment = taRightJustify
      FieldName = 'REC_BANCO'
      EditMask = '999;0;_'
      FixedChar = True
      Size = 3
    end
    object cdsContasReceberREC_AGENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'REC_AGENCIA'
      EditMask = '9999-A;0;_'
      FixedChar = True
      Size = 5
    end
    object cdsContasReceberREC_NRCONTA: TStringField
      Alignment = taRightJustify
      FieldName = 'REC_NRCONTA'
      EditMask = '999999999999;0;_'
      FixedChar = True
      Size = 12
    end
    object cdsContasReceberREC_NRCHEQUE: TStringField
      Alignment = taRightJustify
      FieldName = 'REC_NRCHEQUE'
      EditMask = '9999999999;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsContasReceberREC_TIPOMODALIDADE: TIntegerField
      FieldName = 'REC_TIPOMODALIDADE'
    end
    object cdsContasReceberREC_NOMELOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'REC_NOMELOJA'
      LookupDataSet = cdsOrigem
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'REC_LOJA'
      Size = 40
      Lookup = True
    end
    object cdsContasReceberREC_USUARIO: TIntegerField
      FieldName = 'REC_USUARIO'
    end
    object cdsContasReceberREC_NMSITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'REC_NMSITUACAO'
      Size = 15
      Calculated = True
    end
    object cdsContasReceberREC_ATRASO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'REC_ATRASO'
      Calculated = True
    end
    object cdsContasReceberREC_NATUREZA: TIntegerField
      FieldName = 'REC_NATUREZA'
    end
    object cdsContasReceberREC_DATA_CREDITO: TDateField
      FieldName = 'REC_DATA_CREDITO'
    end
    object cdsContasReceberREC_NOME_MODA: TStringField
      FieldKind = fkLookup
      FieldName = 'REC_NOME_MODA'
      LookupDataSet = dmRelatorios.cdsModalidade
      LookupKeyFields = 'MOD_CODIGO'
      LookupResultField = 'MOD_NOME'
      KeyFields = 'REC_TIPOMODALIDADE'
      Size = 30
      Lookup = True
    end
    object cdsContasReceberREC_FLBOLETO: TStringField
      FieldName = 'REC_FLBOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsContasReceberREC_VLMULTA: TFMTBCDField
      FieldName = 'REC_VLMULTA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsContasReceberREC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
    end
    object cdsContasReceberREC_SEUNUMERO: TStringField
      FieldName = 'REC_SEUNUMERO'
      Size = 15
    end
    object cdsContasReceberREC_FORMABAIXA: TStringField
      FieldName = 'REC_FORMABAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsContasReceberREC_PEDESC: TFMTBCDField
      FieldName = 'REC_PEDESC'
      DisplayFormat = '##0.#0'
      EditFormat = '##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsContasReceberREC_PEMULTA: TFMTBCDField
      FieldName = 'REC_PEMULTA'
      DisplayFormat = '##0.#0'
      EditFormat = '##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsContasReceberREC_PEJURO: TFMTBCDField
      FieldName = 'REC_PEJURO'
      DisplayFormat = '##0.#0'
      EditFormat = '##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsContasReceberREC_CDCEDENTE: TIntegerField
      FieldName = 'REC_CDCEDENTE'
    end
    object cdsContasReceberREC_VLLIQUIDO: TFMTBCDField
      FieldName = 'REC_VLLIQUIDO'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
  end
  object dstClientes: TSQLDataSet
    CommandText = 
      'Select CLI_CODIGO, CLI_FANTASIA from CLIENTES'#13#10'order by CLI_FANT' +
      'ASIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 312
    Top = 352
  end
  object dspClientes: TDataSetProvider
    DataSet = dstClientes
    Options = [poAllowCommandText]
    Left = 384
    Top = 352
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 456
    Top = 352
    object cdsClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object cdsClientesCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
  end
  object qryProdutos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select PRO_CODIGO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_VLVENDA '
      'from PRODUTOS Where (PRO_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 568
    Top = 56
  end
  object dsContasReceber: TDataSource
    AutoEdit = False
    DataSet = cdsContasReceber
    Left = 576
    Top = 296
  end
  object cdsParcelas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    BeforePost = cdsParcelasBeforePost
    Left = 32
    Top = 368
    Data = {
      E80000009619E0BD010000001800000007000000000003000000E8000D504152
      5F4E5250415243454C4104000100000000000E5041525F56454E43494D454E54
      4F0400060000000000095041525F56414C4F5208000400000001000753554254
      5950450200490006004D6F6E657900095041525F42414E434F01004900000001
      000557494454480200020003000B5041525F4147454E43494101004900000001
      00055749445448020002000500095041525F434F4E5441010049000000010005
      5749445448020002000C000A5041525F43484551554501004900000001000557
      49445448020002000A000000}
    object cdsParcelasPAR_NRPARCELA: TIntegerField
      FieldName = 'PAR_NRPARCELA'
      DisplayFormat = '00'
    end
    object cdsParcelasPAR_VENCIMENTO: TDateField
      FieldName = 'PAR_VENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsParcelasPAR_VALOR: TCurrencyField
      FieldName = 'PAR_VALOR'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
    end
    object cdsParcelasPAR_BANCO: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_BANCO'
      EditMask = '999;0;_'
      Size = 3
    end
    object cdsParcelasPAR_AGENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_AGENCIA'
      EditMask = '9999-A;0;_'
      Size = 5
    end
    object cdsParcelasPAR_CONTA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_CONTA'
      EditMask = '9999999999;0;_'
      Size = 12
    end
    object cdsParcelasPAR_CHEQUE: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_CHEQUE'
      EditMask = '9999999999;0;_'
      Size = 10
    end
    object cdsParcelasPAR_CDBANCO: TStringField
      FieldKind = fkLookup
      FieldName = 'PAR_CDBANCO'
      LookupDataSet = Dm.cdsBancos
      LookupKeyFields = 'BAN_CODIGO'
      LookupResultField = 'BAN_CODIGO'
      KeyFields = 'PAR_BANCO'
      Size = 3
      Lookup = True
    end
  end
  object dsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 104
    Top = 368
  end
  object dstFornecedor: TSQLDataSet
    CommandText = 
      'select FOR_CODIGO, FOR_FANTASIA from FORNECEDORES'#13#10'order by FOR_' +
      'FANTASIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 416
  end
  object dspFornecedor: TDataSetProvider
    DataSet = dstFornecedor
    Options = [poAllowCommandText]
    Left = 104
    Top = 416
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedor'
    Left = 184
    Top = 416
    object cdsFornecedorFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      Required = True
    end
    object cdsFornecedorFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
  end
  object dsFornecedor: TDataSource
    DataSet = cdsFornecedor
    Left = 256
    Top = 416
  end
  object qryTotalCompra: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pNRCOMPRA'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select Sum(PAG_VALORPARCELA) as PAG_TOTCOMPRA '
      'from CONTASPAGAR Where (PAG_LOJA = :pLOJA) '
      'AND (PAG_NRENTRADA = :pNRCOMPRA)')
    SQLConnection = Dm.SqlAdmin
    Left = 568
    Top = 104
  end
  object qryProcurarConta: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pNRENTRADA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select  PAG_LOJA, PAG_NRENTRADA, PAG_PARCELA, '
      'PAG_QTPARCELAS, PAG_SITUACAO from CONTASPAGAR'
      'Where (PAG_LOJA = :pLOJA) '
      'AND (PAG_NRENTRADA = :pNRENTRADA)'
      'AND (PAG_SITUACAO = :pSITUACAO)'
      '')
    SQLConnection = Dm.SqlAdmin
    Left = 520
    Top = 360
  end
  object qryProcContReceber: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pNRCREDITO'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select  REC_LOJA, REC_CREDITO, REC_PARCELA, '
      'REC_QTPARCELAS, REC_SITUACAO from CONTASRECEBER '
      'Where (REC_LOJA = :pLOJA) '
      'AND (REC_CREDITO = :pNRCREDITO)'
      'AND (REC_SITUACAO = :pSITUACAO)'
      '')
    SQLConnection = Dm.SqlAdmin
    Left = 616
    Top = 336
  end
  object cdsParcelasVenda: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 368
    Data = {
      160100009619E0BD01000000180000000900000000000300000016010D504152
      5F4E5250415243454C4104000100000000000E5041525F56454E43494D454E54
      4F0400060000000000095041525F56414C4F5208000400000001000753554254
      5950450200490006004D6F6E657900095041525F42414E434F01004900000001
      000557494454480200020003000B5041525F4147454E43494101004900000001
      00055749445448020002000500095041525F434F4E5441010049000000010005
      5749445448020002000C000A5041525F43484551554501004900000001000557
      49445448020002000A000E5041525F515450415243454C415304000100000000
      000E5041525F4D4F44414C494441444504000100000000000000}
    object cdsParcelasVendaPAR_NRPARCELA: TIntegerField
      FieldName = 'PAR_NRPARCELA'
      DisplayFormat = '00'
    end
    object cdsParcelasVendaPAR_VENCIMENTO: TDateField
      FieldName = 'PAR_VENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsParcelasVendaPAR_VALOR: TCurrencyField
      FieldName = 'PAR_VALOR'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
    end
    object cdsParcelasVendaPAR_BANCO: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_BANCO'
      EditMask = '999;0;_'
      Size = 3
    end
    object cdsParcelasVendaPAR_AGENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_AGENCIA'
      EditMask = '9999-A;0;_'
      Size = 5
    end
    object cdsParcelasVendaPAR_CONTA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_CONTA'
      EditMask = '9999999999;0;_'
      Size = 12
    end
    object cdsParcelasVendaPAR_CHEQUE: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_CHEQUE'
      EditMask = '9999999999;0;_'
      Size = 10
    end
    object cdsParcelasVendaPAR_CDBANCO: TStringField
      FieldKind = fkLookup
      FieldName = 'PAR_CDBANCO'
      LookupDataSet = Dm.cdsBancos
      LookupKeyFields = 'BAN_CODIGO'
      LookupResultField = 'BAN_CODIGO'
      KeyFields = 'PAR_BANCO'
      Size = 3
      Lookup = True
    end
    object cdsParcelasVendaPAR_QTPARCELAS: TIntegerField
      FieldName = 'PAR_QTPARCELAS'
    end
    object cdsParcelasVendaPAR_MODALIDADE: TIntegerField
      FieldName = 'PAR_MODALIDADE'
    end
  end
  object dsParcVendas: TDataSource
    DataSet = cdsParcelasVenda
    Left = 256
    Top = 360
  end
  object dstMotDevolucao: TSQLDataSet
    CommandText = 'Select * from DEVOLUCAO order by DEV_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 320
    Top = 400
    object dstMotDevolucaoDEV_CODIGO: TIntegerField
      FieldName = 'DEV_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstMotDevolucaoDEV_NOME: TStringField
      FieldName = 'DEV_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  object dspMotDevolucao: TDataSetProvider
    DataSet = dstMotDevolucao
    Options = [poAllowCommandText]
    OnGetTableName = dspMotDevolucaoGetTableName
    Left = 408
    Top = 400
  end
  object cdsMotDevolucao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMotDevolucao'
    Left = 488
    Top = 408
    object cdsMotDevolucaoDEV_CODIGO: TIntegerField
      FieldName = 'DEV_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsMotDevolucaoDEV_NOME: TStringField
      FieldName = 'DEV_NOME'
      Size = 60
    end
  end
  object dsMotDevolucao: TDataSource
    AutoEdit = False
    DataSet = cdsMotDevolucao
    Left = 552
    Top = 408
  end
  object dstLotes: TSQLDataSet
    CommandText = 'select * from LOTES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 632
    Top = 16
    object dstLotesLOT_PROCODIGO: TStringField
      FieldName = 'LOT_PROCODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstLotesLOT_NRLOTE: TStringField
      FieldName = 'LOT_NRLOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstLotesLOT_QUANTIDADE: TFMTBCDField
      FieldName = 'LOT_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstLotesLOT_DTVENCIMENTO: TDateField
      FieldName = 'LOT_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspLotes: TDataSetProvider
    DataSet = dstLotes
    Options = [poAllowCommandText]
    OnGetTableName = dspLotesGetTableName
    Left = 632
    Top = 64
  end
  object cdsLotes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLotes'
    Left = 632
    Top = 120
    object cdsLotesLOT_PROCODIGO: TStringField
      FieldName = 'LOT_PROCODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsLotesLOT_NRLOTE: TStringField
      FieldName = 'LOT_NRLOTE'
      Required = True
    end
    object cdsLotesLOT_QUANTIDADE: TFMTBCDField
      FieldName = 'LOT_QUANTIDADE'
      DisplayFormat = '###,##0.#00'
      EditFormat = '###,##0.#00'
      Precision = 15
      Size = 3
    end
    object cdsLotesLOT_DTVENCIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'LOT_DTVENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
  end
  object cdsDerivadosProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 240
    Data = {
      7F0000009619E0BD0100000018000000030000000000030000007F000A50524F
      5F434F4449474F0100490000000100055749445448020002000D000D50524F5F
      44455343524943414F01004900000001000557494454480200020028000F5052
      4F5F434F4449474F42414958410100490000000100055749445448020002000D
      000000}
    object cdsDerivadosProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Size = 13
    end
    object cdsDerivadosProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 40
    end
    object cdsDerivadosProdutosPRO_CODIGOBAIXA: TStringField
      FieldName = 'PRO_CODIGOBAIXA'
      Size = 13
    end
  end
  object dstProdutos: TSQLDataSet
    CommandText = 
      'select PRO_CODIGO, PRO_DESCRICAO from PRODUTOS'#13#10'order by PRO_DES' +
      'CRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 336
    Top = 448
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 408
    Top = 448
  end
  object cdsProdutos2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 480
    Top = 448
    object cdsProdutos2PRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutos2PRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos2
    Left = 544
    Top = 456
  end
  object dstImpressora: TSQLDataSet
    CommandText = 'select * from IMPRESSORA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 608
    Top = 392
    object dstImpressoraIMP_CODIGO: TIntegerField
      FieldName = 'IMP_CODIGO'
      Required = True
    end
    object dstImpressoraIMP_DESCRICAO: TStringField
      FieldName = 'IMP_DESCRICAO'
      Size = 15
    end
  end
  object dspImpressora: TDataSetProvider
    DataSet = dstImpressora
    Options = [poAllowCommandText]
    Left = 680
    Top = 392
  end
  object cdsImpressora: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImpressora'
    Left = 632
    Top = 448
    object cdsImpressoraIMP_CODIGO: TIntegerField
      FieldName = 'IMP_CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsImpressoraIMP_DESCRICAO: TStringField
      FieldName = 'IMP_DESCRICAO'
      Size = 15
    end
  end
  object dsImpressora: TDataSource
    DataSet = cdsImpressora
    Left = 688
    Top = 440
  end
  object cdsPContas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'REC_NRCRED'
        DataType = ftInteger
      end
      item
        Name = 'REC_PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'REC_DTVENC'
        DataType = ftDate
      end
      item
        Name = 'REC_VLPARC'
        DataType = ftCurrency
      end
      item
        Name = 'REC_VLDESC'
        DataType = ftCurrency
      end
      item
        Name = 'REC_VLPAGO'
        DataType = ftCurrency
      end
      item
        Name = 'REC_VLJURO'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 648
    Top = 184
    Data = {
      F00000009619E0BD010000001800000007000000000003000000F0000A524543
      5F4E524352454404000100000000000B5245435F50415243454C410400010000
      0000000A5245435F445456454E4304000600000000000A5245435F564C504152
      43080004000000010007535542545950450200490006004D6F6E6579000A5245
      435F564C44455343080004000000010007535542545950450200490006004D6F
      6E6579000A5245435F564C5041474F0800040000000100075355425459504502
      00490006004D6F6E6579000A5245435F564C4A55524F08000400000001000753
      5542545950450200490006004D6F6E6579000000}
    object cdsPContasREC_NRCRED: TIntegerField
      FieldName = 'REC_NRCRED'
    end
    object cdsPContasREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
    end
    object cdsPContasREC_DTVENC: TDateField
      FieldName = 'REC_DTVENC'
    end
    object cdsPContasREC_VLPARC: TCurrencyField
      FieldName = 'REC_VLPARC'
    end
    object cdsPContasREC_VLDESC: TCurrencyField
      FieldName = 'REC_VLDESC'
    end
    object cdsPContasREC_VLPAGO: TCurrencyField
      FieldName = 'REC_VLPAGO'
    end
    object cdsPContasREC_VLJURO: TCurrencyField
      FieldName = 'REC_VLJURO'
    end
  end
  object dstCores: TSQLDataSet
    CommandText = 
      'select COR_CODIGO, COR_DESCRICAO from CORES Where (COR_CODIGO = ' +
      ':pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 40
    Top = 472
    object dstCoresCOR_CODIGO: TIntegerField
      FieldName = 'COR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstCoresCOR_DESCRICAO: TStringField
      FieldName = 'COR_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
  end
  object dspCores: TDataSetProvider
    DataSet = dstCores
    Options = [poAllowCommandText]
    OnGetTableName = dspCoresGetTableName
    Left = 96
    Top = 472
  end
  object cdsCores: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspCores'
    Left = 152
    Top = 472
    object cdsCoresCOR_CODIGO: TIntegerField
      FieldName = 'COR_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsCoresCOR_DESCRICAO: TStringField
      FieldName = 'COR_DESCRICAO'
      Size = 25
    end
  end
  object dstTabPrecos: TSQLDataSet
    CommandText = 'select * from TAB_PRECOS Where (PRC_CODIGO = :pCODIGO) '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 216
    Top = 472
    object dstTabPrecosPRC_CODIGO: TIntegerField
      FieldName = 'PRC_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstTabPrecosPRC_DESCRICAO: TStringField
      FieldName = 'PRC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstTabPrecosPRC_DESC1: TBCDField
      FieldName = 'PRC_DESC1'
      Precision = 9
      Size = 2
    end
    object dstTabPrecosPRC_DESC2: TBCDField
      FieldName = 'PRC_DESC2'
      Precision = 9
      Size = 2
    end
    object dstTabPrecosPRC_DESC3: TBCDField
      FieldName = 'PRC_DESC3'
      Precision = 9
      Size = 2
    end
    object dstTabPrecosPRC_DESC4: TBCDField
      FieldName = 'PRC_DESC4'
      Precision = 9
      Size = 2
    end
    object dstTabPrecosPRC_DESC5: TBCDField
      FieldName = 'PRC_DESC5'
      Precision = 9
      Size = 2
    end
    object dstTabPrecosPRC_DESC6: TBCDField
      FieldName = 'PRC_DESC6'
      Precision = 9
      Size = 2
    end
    object dstTabPrecosPRC_ACRE1: TBCDField
      FieldName = 'PRC_ACRE1'
      Precision = 9
      Size = 2
    end
    object dstTabPrecosPRC_ACRE2: TBCDField
      FieldName = 'PRC_ACRE2'
      Precision = 9
      Size = 2
    end
  end
  object dspTabPrecos: TDataSetProvider
    DataSet = dstTabPrecos
    Options = [poAllowCommandText]
    OnGetTableName = dspTabPrecosGetTableName
    Left = 280
    Top = 488
  end
  object cdsTabPreco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspTabPrecos'
    Left = 352
    Top = 496
    object cdsTabPrecoPRC_CODIGO: TIntegerField
      FieldName = 'PRC_CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsTabPrecoPRC_DESCRICAO: TStringField
      FieldName = 'PRC_DESCRICAO'
      Size = 40
    end
    object cdsTabPrecoPRC_DESC1: TBCDField
      FieldName = 'PRC_DESC1'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object cdsTabPrecoPRC_DESC2: TBCDField
      FieldName = 'PRC_DESC2'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object cdsTabPrecoPRC_DESC3: TBCDField
      FieldName = 'PRC_DESC3'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object cdsTabPrecoPRC_DESC4: TBCDField
      FieldName = 'PRC_DESC4'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object cdsTabPrecoPRC_DESC5: TBCDField
      FieldName = 'PRC_DESC5'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object cdsTabPrecoPRC_DESC6: TBCDField
      FieldName = 'PRC_DESC6'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object cdsTabPrecoPRC_ACRE1: TBCDField
      FieldName = 'PRC_ACRE1'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
    object cdsTabPrecoPRC_ACRE2: TBCDField
      FieldName = 'PRC_ACRE2'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 9
      Size = 2
    end
  end
  object dstTipoClientes: TSQLDataSet
    CommandText = 
      'Select TPC_CODIGO, TPC_DESCRICAO from TIPOCLIENTE order by TPC_D' +
      'ESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 424
    Top = 496
    object dstTipoClientesTPC_CODIGO: TIntegerField
      FieldName = 'TPC_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstTipoClientesTPC_DESCRICAO: TStringField
      FieldName = 'TPC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
  end
  object dspTpClientes: TDataSetProvider
    DataSet = dstTipoClientes
    Options = [poAllowCommandText]
    OnGetTableName = dspTpClientesGetTableName
    Left = 496
    Top = 496
  end
  object cdsTpClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTpClientes'
    Left = 584
    Top = 496
    object cdsTpClientesTPC_CODIGO: TIntegerField
      FieldName = 'TPC_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsTpClientesTPC_DESCRICAO: TStringField
      FieldName = 'TPC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
  end
  object dstRegioes: TSQLDataSet
    CommandText = 
      'select REG_CODIGO, REG_DESCRICAO from REGIAO order by REG_DESCRI' +
      'CAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 704
    Top = 24
    object dstRegioesREG_CODIGO: TIntegerField
      FieldName = 'REG_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstRegioesREG_DESCRICAO: TStringField
      FieldName = 'REG_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
  end
  object dspRegioes: TDataSetProvider
    DataSet = dstRegioes
    Options = [poAllowCommandText]
    OnGetTableName = dspRegioesGetTableName
    Left = 704
    Top = 80
  end
  object cdsRegioes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegioes'
    Left = 704
    Top = 128
    object cdsRegioesREG_CODIGO: TIntegerField
      FieldName = 'REG_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsRegioesREG_DESCRICAO: TStringField
      FieldName = 'REG_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
  end
  object dstConsulta: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 688
    Top = 232
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 680
    Top = 288
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 688
    Top = 336
  end
  object dstOrcamento: TSQLDataSet
    CommandText = 'Select * from ORCAMENTOS Where (ORC_PEDIDO = :pPEDIDO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 728
    Top = 176
    object dstOrcamentoORC_PEDIDO: TIntegerField
      FieldName = 'ORC_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstOrcamentoORC_LOJA: TIntegerField
      FieldName = 'ORC_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object dstOrcamentoORC_SEQUENCIA: TIntegerField
      FieldName = 'ORC_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dstOrcamentoORC_CLIENTE: TIntegerField
      FieldName = 'ORC_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstOrcamentoORC_DATAVENDA: TDateField
      FieldName = 'ORC_DATAVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstOrcamentoORC_HORAVENDA: TStringField
      FieldName = 'ORC_HORAVENDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstOrcamentoORC_DATACANC: TDateField
      FieldName = 'ORC_DATACANC'
      ProviderFlags = [pfInUpdate]
    end
    object dstOrcamentoORC_HORACANC: TStringField
      FieldName = 'ORC_HORACANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstOrcamentoORC_VENDEDOR: TIntegerField
      FieldName = 'ORC_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstOrcamentoORC_VALOR: TFMTBCDField
      FieldName = 'ORC_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstOrcamentoORC_ENTRADA: TFMTBCDField
      FieldName = 'ORC_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstOrcamentoORC_DESCONTO: TFMTBCDField
      FieldName = 'ORC_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstOrcamentoORC_ACRESCIMO: TFMTBCDField
      FieldName = 'ORC_ACRESCIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstOrcamentoORC_DEVOLUSAO: TFMTBCDField
      FieldName = 'ORC_DEVOLUSAO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstOrcamentoORC_TROCO: TFMTBCDField
      FieldName = 'ORC_TROCO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstOrcamentoORC_SITUACAO: TStringField
      FieldName = 'ORC_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstOrcamentoDOM_ENDERECO: TStringField
      FieldName = 'DOM_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstOrcamentoDOM_NUMERO: TStringField
      FieldName = 'DOM_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstOrcamentoDOM_BAIRRO: TStringField
      FieldName = 'DOM_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstOrcamentoDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstOrcamentoDOM_REFERE: TStringField
      FieldName = 'DOM_REFERE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstOrcamentoORC_NOMECLIENTE: TStringField
      FieldName = 'ORC_NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstOrcamentoORC_TABELA: TIntegerField
      FieldName = 'ORC_TABELA'
      ProviderFlags = [pfInUpdate]
    end
    object dstOrcamentoORC_MODALIDADE: TIntegerField
      FieldName = 'ORC_MODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspOrcamentos: TDataSetProvider
    DataSet = dstOrcamento
    Options = [poAllowCommandText]
    OnGetTableName = dspOrcamentosGetTableName
    Left = 744
    Top = 224
  end
  object cdsOrcamentos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspOrcamentos'
    Left = 744
    Top = 280
    object cdsOrcamentosORC_PEDIDO: TIntegerField
      FieldName = 'ORC_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrcamentosORC_LOJA: TIntegerField
      FieldName = 'ORC_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrcamentosORC_SEQUENCIA: TIntegerField
      FieldName = 'ORC_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrcamentosORC_CLIENTE: TIntegerField
      FieldName = 'ORC_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrcamentosORC_DATAVENDA: TDateField
      FieldName = 'ORC_DATAVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrcamentosORC_HORAVENDA: TStringField
      FieldName = 'ORC_HORAVENDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsOrcamentosORC_DATACANC: TDateField
      FieldName = 'ORC_DATACANC'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrcamentosORC_HORACANC: TStringField
      FieldName = 'ORC_HORACANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsOrcamentosORC_VENDEDOR: TIntegerField
      FieldName = 'ORC_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrcamentosORC_VALOR: TFMTBCDField
      FieldName = 'ORC_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsOrcamentosORC_ENTRADA: TFMTBCDField
      FieldName = 'ORC_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsOrcamentosORC_DESCONTO: TFMTBCDField
      FieldName = 'ORC_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsOrcamentosORC_ACRESCIMO: TFMTBCDField
      FieldName = 'ORC_ACRESCIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsOrcamentosORC_DEVOLUSAO: TFMTBCDField
      FieldName = 'ORC_DEVOLUSAO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsOrcamentosORC_TROCO: TFMTBCDField
      FieldName = 'ORC_TROCO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsOrcamentosORC_SITUACAO: TStringField
      FieldName = 'ORC_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsOrcamentosDOM_ENDERECO: TStringField
      FieldName = 'DOM_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsOrcamentosDOM_NUMERO: TStringField
      FieldName = 'DOM_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsOrcamentosDOM_BAIRRO: TStringField
      FieldName = 'DOM_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsOrcamentosDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrcamentosDOM_REFERE: TStringField
      FieldName = 'DOM_REFERE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsOrcamentosORC_NOMECLIENTE: TStringField
      FieldName = 'ORC_NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsOrcamentosORC_TABELA: TIntegerField
      FieldName = 'ORC_TABELA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrcamentosORC_MODALIDADE: TIntegerField
      FieldName = 'ORC_MODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dstPadrao: TSQLDataSet
    CommandText = 'select * from CONTASRECEBER Where (REC_SEQUENCIA = :pSEQUENCIA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 744
    Top = 312
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 744
    Top = 368
  end
  object cdsHisProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 744
    Top = 416
  end
  object qryCodBarras: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pBARRAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'Update PRODUTOS set PRO_BARRAS = :pBARRAS'
      'Where (PRO_BARRAS = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 592
    Top = 8
  end
  object cdsGenerico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 696
    Top = 480
  end
  object cdsPCRenegociacao: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsPCRenegociacaoCalcFields
    Left = 48
    Top = 528
    Data = {
      6A0100009619E0BD01000000180000000F0000000000030000006A010D434453
      5F53455155454E43494104000100000000000A4344535F43444C4F4A41040001
      00000000000B4344535F4352454449544F04000100000000000D4344535F4E52
      50415243454C4104000100000000000D4344535F4454454D495353414F040006
      00000000000A4344535F445456454E430400060000000000094344535F56414C
      4F5208000400000000000B4344535F434C49454E544504000100000000000943
      44535F4A55524F530800040000000000094344535F4D554C5441080004000000
      00000C4344535F534954554143414F0100490000000100055749445448020002
      0001000B4344535F464C52454E45470200030000000000124344535F44545245
      4E45474F43494143414F04000600000000000C4344535F4E41545552455A4104
      00010000000000104344535F4E4F53534F5F4E554D45524F0100490000000100
      055749445448020002000D000000}
    object cdsPCRenegociacaoCDS_SEQUENCIA: TIntegerField
      FieldName = 'CDS_SEQUENCIA'
    end
    object cdsPCRenegociacaoCDS_CDLOJA: TIntegerField
      FieldName = 'CDS_CDLOJA'
    end
    object cdsPCRenegociacaoCDS_CREDITO: TIntegerField
      Alignment = taCenter
      FieldName = 'CDS_CREDITO'
      DisplayFormat = '0000000'
    end
    object cdsPCRenegociacaoCDS_NRPARCELA: TIntegerField
      Alignment = taCenter
      FieldName = 'CDS_NRPARCELA'
      DisplayFormat = '00'
    end
    object cdsPCRenegociacaoCDS_DTEMISSAO: TDateField
      Alignment = taRightJustify
      FieldName = 'CDS_DTEMISSAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsPCRenegociacaoCDS_DTVENC: TDateField
      Alignment = taCenter
      FieldName = 'CDS_DTVENC'
      EditMask = '99/99/9999;1;_'
    end
    object cdsPCRenegociacaoCDS_VALOR: TFloatField
      FieldName = 'CDS_VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsPCRenegociacaoCDS_CLIENTE: TIntegerField
      FieldName = 'CDS_CLIENTE'
    end
    object cdsPCRenegociacaoCDS_JUROS: TFloatField
      FieldName = 'CDS_JUROS'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsPCRenegociacaoCDS_MULTA: TFloatField
      FieldName = 'CDS_MULTA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsPCRenegociacaoCDS_SITUACAO: TStringField
      FieldName = 'CDS_SITUACAO'
      Size = 1
    end
    object cdsPCRenegociacaoCDS_FLRENEG: TBooleanField
      FieldName = 'CDS_FLRENEG'
    end
    object cdsPCRenegociacaoCDS_ATRASO: TFloatField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'CDS_ATRASO'
      Calculated = True
    end
    object cdsPCRenegociacaoCDS_DTRENEGOCIACAO: TDateField
      Alignment = taRightJustify
      FieldName = 'CDS_DTRENEGOCIACAO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsPCRenegociacaoCSD_VALOR_ATUAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CSD_VALOR_ATUAL'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Calculated = True
    end
    object cdsPCRenegociacaoCDS_NATUREZA: TIntegerField
      FieldName = 'CDS_NATUREZA'
    end
    object cdsPCRenegociacaoCDS_NOSSO_NUMERO: TStringField
      FieldName = 'CDS_NOSSO_NUMERO'
      Size = 13
    end
  end
  object cdsListaParcelas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * FROM CONTASRECEBER where (REC_LOJA = :PCDLOJA) and (REC' +
      '_CLIENTE = :pCLIENTE) AND (REC_SITUACAO = '#39'A'#39') order by REC_DATA' +
      'VENCIMENTO'
    Params = <
      item
        DataType = ftInteger
        Name = 'PCDLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pCLIENTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 144
    Top = 520
    object cdsListaParcelasREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      Required = True
    end
    object cdsListaParcelasREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      Required = True
    end
    object cdsListaParcelasREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      Required = True
    end
    object cdsListaParcelasREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      Required = True
    end
    object cdsListaParcelasREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
    end
    object cdsListaParcelasREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
    end
    object cdsListaParcelasREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
    end
    object cdsListaParcelasREC_DESCRICAO: TMemoField
      FieldName = 'REC_DESCRICAO'
      BlobType = ftMemo
    end
    object cdsListaParcelasREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
    end
    object cdsListaParcelasREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
    end
    object cdsListaParcelasREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsListaParcelasREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsListaParcelasREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
    end
    object cdsListaParcelasREC_VALORACRESIMO: TFMTBCDField
      FieldName = 'REC_VALORACRESIMO'
      Precision = 18
      Size = 2
    end
    object cdsListaParcelasREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      Precision = 18
      Size = 2
    end
    object cdsListaParcelasREC_VALORDESCONTO: TFMTBCDField
      FieldName = 'REC_VALORDESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsListaParcelasREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      Precision = 18
      Size = 2
    end
    object cdsListaParcelasREC_RESTANTE: TFMTBCDField
      FieldName = 'REC_RESTANTE'
      Precision = 18
      Size = 2
    end
    object cdsListaParcelasREC_BANCO: TStringField
      FieldName = 'REC_BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsListaParcelasREC_AGENCIA: TStringField
      FieldName = 'REC_AGENCIA'
      FixedChar = True
      Size = 6
    end
    object cdsListaParcelasREC_NRCONTA: TStringField
      FieldName = 'REC_NRCONTA'
      FixedChar = True
      Size = 12
    end
    object cdsListaParcelasREC_NRCHEQUE: TStringField
      FieldName = 'REC_NRCHEQUE'
      FixedChar = True
      Size = 10
    end
    object cdsListaParcelasREC_TIPOMODALIDADE: TIntegerField
      FieldName = 'REC_TIPOMODALIDADE'
    end
    object cdsListaParcelasREC_USUARIO: TIntegerField
      FieldName = 'REC_USUARIO'
    end
    object cdsListaParcelasREC_NATUREZA: TIntegerField
      FieldName = 'REC_NATUREZA'
    end
    object cdsListaParcelasREC_FLBOLETO: TStringField
      FieldName = 'REC_FLBOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsListaParcelasREC_DATA_CREDITO: TDateField
      FieldName = 'REC_DATA_CREDITO'
    end
    object cdsListaParcelasREC_DTRENEGOCIACAO: TDateField
      FieldName = 'REC_DTRENEGOCIACAO'
    end
    object cdsListaParcelasREC_VLMULTA: TFMTBCDField
      FieldName = 'REC_VLMULTA'
      Precision = 18
      Size = 2
    end
    object cdsListaParcelasREC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
      Size = 13
    end
  end
  object cdsAddCReceber: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from CONTASRECEBER Where (REC_SEQUENCIA = :pSEQUENCIA)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 232
    Top = 536
    object cdsAddCReceberREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      Required = True
    end
    object cdsAddCReceberREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      Required = True
    end
    object cdsAddCReceberREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      Required = True
    end
    object cdsAddCReceberREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      Required = True
    end
    object cdsAddCReceberREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
    end
    object cdsAddCReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
    end
    object cdsAddCReceberREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
    end
    object cdsAddCReceberREC_DESCRICAO: TMemoField
      FieldName = 'REC_DESCRICAO'
      BlobType = ftMemo
    end
    object cdsAddCReceberREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
    end
    object cdsAddCReceberREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
    end
    object cdsAddCReceberREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsAddCReceberREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
    end
    object cdsAddCReceberREC_VALORACRESIMO: TFMTBCDField
      FieldName = 'REC_VALORACRESIMO'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_VALORDESCONTO: TFMTBCDField
      FieldName = 'REC_VALORDESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_RESTANTE: TFMTBCDField
      FieldName = 'REC_RESTANTE'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_BANCO: TStringField
      FieldName = 'REC_BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsAddCReceberREC_AGENCIA: TStringField
      FieldName = 'REC_AGENCIA'
      FixedChar = True
      Size = 6
    end
    object cdsAddCReceberREC_NRCONTA: TStringField
      FieldName = 'REC_NRCONTA'
      FixedChar = True
      Size = 12
    end
    object cdsAddCReceberREC_NRCHEQUE: TStringField
      FieldName = 'REC_NRCHEQUE'
      FixedChar = True
      Size = 10
    end
    object cdsAddCReceberREC_TIPOMODALIDADE: TIntegerField
      FieldName = 'REC_TIPOMODALIDADE'
    end
    object cdsAddCReceberREC_USUARIO: TIntegerField
      FieldName = 'REC_USUARIO'
    end
    object cdsAddCReceberREC_NATUREZA: TIntegerField
      FieldName = 'REC_NATUREZA'
    end
    object cdsAddCReceberREC_FLBOLETO: TStringField
      FieldName = 'REC_FLBOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsAddCReceberREC_DATA_CREDITO: TDateField
      FieldName = 'REC_DATA_CREDITO'
    end
    object cdsAddCReceberREC_DTRENEGOCIACAO: TDateField
      FieldName = 'REC_DTRENEGOCIACAO'
    end
    object cdsAddCReceberREC_VLMULTA: TFMTBCDField
      FieldName = 'REC_VLMULTA'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
      Size = 13
    end
    object cdsAddCReceberREC_SEUNUMERO: TStringField
      FieldName = 'REC_SEUNUMERO'
      Size = 15
    end
    object cdsAddCReceberREC_CDCEDENTE: TIntegerField
      FieldName = 'REC_CDCEDENTE'
    end
  end
end
