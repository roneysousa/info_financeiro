object dmConsultas: TdmConsultas
  OldCreateOrder = False
  Left = 195
  Top = 181
  Height = 583
  Width = 792
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
      
        'Select PRO_CODIGO, PRO_DESCRICAO, UNI_CODIGO, UNI_ARMAZENAMENTO,' +
        ' '
      'PRO_VLVENDA from PRODUTOS Where (PRO_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 16
  end
  object qryFornec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select FOR_CODIGO, FOR_FANTASIA from FORNECEDORES '
      'Where (FOR_CODIGO = :pCODIGO)'
      '    ')
    SQLConnection = Dm.SqlAdmin
    Left = 160
    Top = 16
  end
  object qryEntrada: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pNRNOTA'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'pSERIENOTA'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select ENT_FORNECEDOR, ENT_NUMERONOTA from ENTRADAS'
      'Where (ENT_FORNECEDOR = :pCODIGO) '
      'and (ENT_NUMERONOTA = :pNRNOTA) '
      'and (ENT_SERIENOTA = :pSERIENOTA)')
    SQLConnection = Dm.SqlAdmin
    Left = 232
    Top = 16
  end
  object qryUsuarios: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      
        'Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA, SEN_FLSUPE' +
        'R, USU_ADMIN from USUARIOS '
      'Where (SEN_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 304
    Top = 16
    object qryUsuariosSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      Required = True
    end
    object qryUsuariosSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      Size = 40
    end
    object qryUsuariosSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      Size = 6
    end
    object qryUsuariosSEN_FLCAIXA: TStringField
      FieldName = 'SEN_FLCAIXA'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosSEN_FLSUPER: TStringField
      FieldName = 'SEN_FLSUPER'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosUSU_ADMIN: TStringField
      FieldName = 'USU_ADMIN'
      FixedChar = True
      Size = 1
    end
  end
  object qryVendedor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select FUN_CODIGO, FUN_NOME from FUNCIONARIOS'
      'Where (FUN_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 64
  end
  object qryLocCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select CLI_CODIGO, CLI_FANTASIA, CLI_RAZAO from CLIENTES'
      'Where (CLI_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 104
    Top = 64
  end
  object qryCaixa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCAIXA'
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
      'Select CAI_NUMERO, CAI_LOJA, CAI_CAIXA, CAI_SITUACAO from CAIXA'
      'Where (CAI_CAIXA = :pCAIXA)'
      'AND (CAI_SITUACAO = :pSITUACAO)')
    SQLConnection = Dm.SqlAdmin
    Left = 176
    Top = 64
    object qryCaixaCAI_NUMERO: TIntegerField
      FieldName = 'CAI_NUMERO'
      Required = True
    end
    object qryCaixaCAI_LOJA: TIntegerField
      FieldName = 'CAI_LOJA'
      Required = True
    end
    object qryCaixaCAI_CAIXA: TIntegerField
      FieldName = 'CAI_CAIXA'
    end
    object qryCaixaCAI_SITUACAO: TStringField
      FieldName = 'CAI_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object qryAbate: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select PER_SEQUENCIA, PED_DESCRICAO from PERDAS'
      'order by PED_DESCRICAO')
    SQLConnection = Dm.SqlAdmin
    Left = 240
    Top = 64
    object qryAbatePER_SEQUENCIA: TIntegerField
      FieldName = 'PER_SEQUENCIA'
      Required = True
    end
    object qryAbatePED_DESCRICAO: TStringField
      FieldName = 'PED_DESCRICAO'
      Size = 40
    end
  end
  object dstProdutos: TSQLDataSet
    CommandText = 
      'select PRO_CODIGO, PRO_DESCRICAO from PRODUTOS'#13#10'order by PRO_DES' +
      'CRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 112
  end
  object dstTipo: TSQLDataSet
    CommandText = 'select * from PERDAS order by PED_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 160
  end
  object dstPerda: TSQLDataSet
    CommandText = 'select * from PERDA order by PER_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 208
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 112
    Top = 112
  end
  object dspTipo: TDataSetProvider
    DataSet = dstTipo
    Options = [poAllowCommandText]
    Left = 112
    Top = 160
  end
  object dspPerda: TDataSetProvider
    DataSet = dstPerda
    Options = [poAllowCommandText]
    Left = 112
    Top = 208
  end
  object cdsProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 184
    Top = 112
    object cdsProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
  end
  object cdsTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipo'
    Left = 184
    Top = 160
    object cdsTipoPER_SEQUENCIA: TIntegerField
      FieldName = 'PER_SEQUENCIA'
      Required = True
    end
    object cdsTipoPED_DESCRICAO: TStringField
      FieldName = 'PED_DESCRICAO'
      Size = 40
    end
  end
  object cdsPerda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerda'
    Left = 184
    Top = 208
    object cdsPerdaPER_ID: TIntegerField
      FieldName = 'PER_ID'
      Required = True
    end
    object cdsPerdaPER_DESCRICAO: TStringField
      FieldName = 'PER_DESCRICAO'
      Size = 40
    end
  end
  object dstNatureza: TSQLDataSet
    CommandText = 'select NAT_CODIGO, NAT_NOME from NATUREZA order by NAT_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 256
  end
  object dspNatureza: TDataSetProvider
    DataSet = dstNatureza
    Options = [poAllowCommandText]
    Left = 104
    Top = 256
  end
  object cdsNatureza: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNatureza'
    Left = 176
    Top = 256
    object cdsNaturezaNAT_CODIGO: TIntegerField
      FieldName = 'NAT_CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsNaturezaNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      Size = 30
    end
  end
  object dsNatureza: TDataSource
    DataSet = cdsNatureza
    Left = 240
    Top = 256
  end
  object qryCaixaFechar: TSQLQuery
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
        Name = 'pMODALIDADE'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select * from CAIXA_FECHAR'
      'Where (CXF_NUMERO = :pNUMERO) AND '
      '(MOD_MODALIDADE = :pMODALIDADE)')
    SQLConnection = Dm.SqlAdmin
    Left = 312
    Top = 64
  end
  object dstCidades: TSQLDataSet
    CommandText = 'select CID_CODIGO, CID_NOME from CIDADES'#13#10'order by CID_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 304
  end
  object dstBairros: TSQLDataSet
    CommandText = 'select * from BAIRROS order by BAI_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 264
    Top = 120
  end
  object dspCidades: TDataSetProvider
    DataSet = dstCidades
    Options = [poAllowCommandText]
    Left = 104
    Top = 304
  end
  object dspBairros: TDataSetProvider
    DataSet = dstBairros
    Options = [poAllowCommandText]
    Left = 320
    Top = 120
  end
  object cdsCidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidades'
    Left = 168
    Top = 304
  end
  object cdsBairros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBairros'
    Left = 376
    Top = 120
    object cdsBairrosBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      Required = True
    end
    object cdsBairrosBAI_NOME: TStringField
      FieldName = 'BAI_NOME'
    end
    object cdsBairrosCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
    end
  end
  object dstVendas: TSQLDataSet
    CommandText = 
      'select M.MOV_PEDIDO, M.MOV_CUPOM, M.MOV_LOJA, M.MOV_DATAVENDA, M' +
      '.MOV_CLIENTE, M.MOV_VALOR, M.MOV_NOMECLIENTE, M.MOV_SITUACAO, M.' +
      'MOV_VENDEDOR,'#13#10'M.MOV_DESCONTO, M.MOV_HORAVENDA, M.MOV_TABELA, '#13#10 +
      'M. MOV_ACRESCIMO, M.MOV_TIPO_FRETE, M.MOV_PERC_FRETE, M.MOV_IDTR' +
      'ANSPORTADORA, M.MOV_TABELA_PLANO,'#13#10'(Select E.EMP_FANTASIA from E' +
      'MPRESAS E Where (E.EMP_CODIGO = M.MOV_LOJA)) as MOV_NMLOJA from ' +
      'VENDAS M'#13#10'Where (M.MOV_DATAVENDA = :pDATA)'#13#10'order by M.MOV_PEDID' +
      'O'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
        Value = 0d
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 256
    Top = 168
  end
  object dspVendas: TDataSetProvider
    DataSet = dstVendas
    Options = [poAllowCommandText]
    Left = 320
    Top = 168
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'dspVendas'
    Left = 376
    Top = 168
    object cdsVendasMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsVendasMOV_CUPOM: TIntegerField
      FieldName = 'MOV_CUPOM'
      DisplayFormat = '000000'
    end
    object cdsVendasMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
      DisplayFormat = '000'
    end
    object cdsVendasMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsVendasMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
      DisplayFormat = '0000000'
    end
    object cdsVendasMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      DisplayFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsVendasMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      Size = 40
    end
    object cdsVendasMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsVendasMOV_NMLOJA: TStringField
      FieldName = 'MOV_NMLOJA'
      Size = 50
    end
    object cdsVendasMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
    end
    object cdsVendasMOV_NMVENDEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'MOV_NMVENDEDOR'
      LookupDataSet = Dm.cdsFuncionarios
      LookupKeyFields = 'FUN_CODIGO'
      LookupResultField = 'FUN_NOME'
      KeyFields = 'MOV_VENDEDOR'
      Size = 40
      Lookup = True
    end
    object cdsVendasMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      Precision = 15
      Size = 2
    end
    object cdsVendasMOV_HORAVENDA: TStringField
      Alignment = taRightJustify
      FieldName = 'MOV_HORAVENDA'
      FixedChar = True
      Size = 5
    end
    object cdsVendasMOV_TABELA: TIntegerField
      FieldName = 'MOV_TABELA'
    end
    object cdsVendasMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      Precision = 15
      Size = 2
    end
    object cdsVendasMOV_TIPO_FRETE: TStringField
      FieldName = 'MOV_TIPO_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsVendasMOV_PERC_FRETE: TFMTBCDField
      FieldName = 'MOV_PERC_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsVendasMOV_IDTRANSPORTADORA: TIntegerField
      FieldName = 'MOV_IDTRANSPORTADORA'
    end
    object cdsVendasMOV_TABELA_PLANO: TIntegerField
      FieldName = 'MOV_TABELA_PLANO'
    end
  end
  object dsVendas: TDataSource
    DataSet = cdsVendas
    Left = 448
    Top = 120
  end
  object dstCaixa: TSQLDataSet
    CommandText = 'Select * from CAIXA Where (CAI_DTABERTURA = :pDTABERTURA)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTABERTURA'
        ParamType = ptInput
        Value = 0d
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 352
  end
  object dspCaixa: TDataSetProvider
    DataSet = dstCaixa
    Options = [poAllowCommandText]
    Left = 104
    Top = 352
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTABERTURA'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'dspCaixa'
    OnCalcFields = cdsCaixaCalcFields
    Left = 160
    Top = 352
    object cdsCaixaCAI_NUMERO: TIntegerField
      FieldName = 'CAI_NUMERO'
      Required = True
    end
    object cdsCaixaCAI_LOJA: TIntegerField
      FieldName = 'CAI_LOJA'
      Required = True
      DisplayFormat = '000'
    end
    object cdsCaixaCAI_DTABERTURA: TDateField
      FieldName = 'CAI_DTABERTURA'
    end
    object cdsCaixaCAI_DTFECHAMENTO: TDateField
      FieldName = 'CAI_DTFECHAMENTO'
    end
    object cdsCaixaCAI_HOABERTURA: TStringField
      FieldName = 'CAI_HOABERTURA'
      FixedChar = True
      Size = 5
    end
    object cdsCaixaCAI_HOFECHAMENTO: TStringField
      FieldName = 'CAI_HOFECHAMENTO'
      FixedChar = True
      Size = 5
    end
    object cdsCaixaCAI_RGINICIAL: TIntegerField
      FieldName = 'CAI_RGINICIAL'
    end
    object cdsCaixaCAI_RGFINAL: TIntegerField
      FieldName = 'CAI_RGFINAL'
    end
    object cdsCaixaCAI_CAIXA: TIntegerField
      FieldName = 'CAI_CAIXA'
      DisplayFormat = '000'
    end
    object cdsCaixaCAI_SITUACAO: TStringField
      FieldName = 'CAI_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsCaixaCAI_NMLOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'CAI_NMLOJA'
      LookupDataSet = Dm.cdsLoja
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'CAI_LOJA'
      Size = 40
      Lookup = True
    end
    object cdsCaixaCAI_NMSITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAI_NMSITUACAO'
      Size = 12
      Calculated = True
    end
  end
  object dsCaixa: TDataSource
    DataSet = cdsCaixa
    Left = 208
    Top = 352
  end
  object dstProdutosVenda: TSQLDataSet
    CommandText = 'select * from PROVENDAS Where (MOP_PEDIDO = :pPEDIDO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 256
    Top = 216
    object dstProdutosVendaMOP_PEDIDO: TIntegerField
      FieldName = 'MOP_PEDIDO'
    end
    object dstProdutosVendaMOP_PRODUTO: TStringField
      FieldName = 'MOP_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstProdutosVendaMOP_QUANTIDADE: TFMTBCDField
      FieldName = 'MOP_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendaMOP_UNIDADE: TStringField
      FieldName = 'MOP_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstProdutosVendaMOP_VALOR: TFMTBCDField
      FieldName = 'MOP_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosVendaMOP_DESCONTO: TFMTBCDField
      FieldName = 'MOP_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosVendaMOP_SERIE: TStringField
      FieldName = 'MOP_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstProdutosVendaMOP_CUSTO: TFMTBCDField
      FieldName = 'MOP_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosVendaMOP_COMPRA: TFMTBCDField
      FieldName = 'MOP_COMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosVendaMOP_CODCOR: TIntegerField
      FieldName = 'MOP_CODCOR'
    end
  end
  object dspProVendas: TDataSetProvider
    DataSet = dstProdutosVenda
    Options = [poAllowCommandText]
    Left = 328
    Top = 216
  end
  object cdsProdVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspProVendas'
    Left = 400
    Top = 216
    object cdsProdVendaMOP_PEDIDO: TIntegerField
      FieldName = 'MOP_PEDIDO'
    end
    object cdsProdVendaMOP_PRODUTO: TStringField
      FieldName = 'MOP_PRODUTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object cdsProdVendaMOP_QUANTIDADE: TFMTBCDField
      FieldName = 'MOP_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object cdsProdVendaMOP_UNIDADE: TStringField
      FieldName = 'MOP_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsProdVendaMOP_VALOR: TFMTBCDField
      FieldName = 'MOP_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsProdVendaMOP_DESCONTO: TFMTBCDField
      FieldName = 'MOP_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsProdVendaMOP_SERIE: TStringField
      FieldName = 'MOP_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsProdVendaMOP_CUSTO: TFMTBCDField
      FieldName = 'MOP_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsProdVendaMOP_COMPRA: TFMTBCDField
      FieldName = 'MOP_COMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object cdsProdVendaMOP_NMPRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'MOP_NMPRODUTO'
      LookupDataSet = cdsProdutos
      LookupKeyFields = 'PRO_CODIGO'
      LookupResultField = 'PRO_DESCRICAO'
      KeyFields = 'MOP_PRODUTO'
      Size = 40
      Lookup = True
    end
    object cdsProdVendaMOP_CODCOR: TIntegerField
      FieldName = 'MOP_CODCOR'
    end
  end
  object dsProdVenda: TDataSource
    DataSet = cdsProdVenda
    Left = 448
    Top = 208
  end
  object qryMovCaixa: TSQLQuery
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
        Name = 'pVENDA'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select MCA_LOJA, MCA_VENDA, MCA_CAIXA from'
      'MOVIMENTO_CAIXA Where (MCA_LOJA = :pLOJA) '
      'and (MCA_VENDA = :pVENDA)')
    SQLConnection = Dm.SqlAdmin
    Left = 368
    Top = 8
  end
  object qryVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select MOV_PEDIDO, MOV_LOJA, MOV_SEQUENCIA, MOV_DESCONTO'
      'from VENDAS Where (MOV_SEQUENCIA = :pSEQUENCIA) and'
      '(MOV_LOJA = :pLOJA) AND (MOV_PEDIDO = :pPEDIDO)')
    SQLConnection = Dm.SqlAdmin
    Left = 288
    Top = 352
  end
  object dstMovCaixa: TSQLDataSet
    CommandText = 
      'Select DISTINCT MCA_SEQUENCIA, MCA_LOJA, MCA_VENDA, MCA_CAIXA fr' +
      'om movimento_caixa Where (MCA_LOJA = :pLOJA) AND'#13#10'(MCA_CAIXA = :' +
      'pCAIXA) AND (MCA_SEQUENCIA >= :pINICIO) '#13#10'AND (MCA_SEQUENCIA <= ' +
      ':pFINAL) AND (MCA_TIPOMOV = :pTIPO)'
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
        Name = 'pCAIXA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pINICIO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pFINAL'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 240
    Top = 304
  end
  object dspMovCaixa: TDataSetProvider
    DataSet = dstMovCaixa
    Options = [poAllowCommandText]
    Left = 312
    Top = 300
  end
  object cdsMovCaixa: TClientDataSet
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
        Name = 'pCAIXA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pINICIO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pFINAL'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspMovCaixa'
    Left = 384
    Top = 300
  end
  object dsMovCaixa: TDataSource
    DataSet = cdsMovCaixa
    Left = 456
    Top = 300
  end
  object qryLojas2: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS'
      'order by EMP_FANTASIA')
    SQLConnection = Dm.SqlAdmin
    Left = 384
    Top = 65
    object qryLojas2EMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
    end
    object qryLojas2EMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object qryLojas2EMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      Size = 50
    end
  end
  object qryCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select CLI_CODIGO, CLI_FANTASIA, CLI_RAZAO from CLIENTES'
      'Where (CLI_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 448
    Top = 16
  end
  object qryNatureza: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select NAT_CODIGO, NAT_NOME, NAT_TIPO from'
      'NATUREZA Where (NAT_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 453
    Top = 64
  end
  object qryContasPagar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pNRNOTA'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pSERIENOTA'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select PAG_LOJA, PAG_FORNECEDOR, PAG_NRNOTA,'
      'PAG_SERIENOTA from CONTASPAGAR'
      'Where (PAG_FORNECEDOR = :pCODIGO) '
      'and (PAG_NRNOTA = :pNRNOTA) '
      'and (PAG_SERIENOTA = :pSERIENOTA)')
    SQLConnection = Dm.SqlAdmin
    Left = 368
    Top = 352
  end
  object qryBancos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select BAN_CODIGO, BAN_NOME from BANCOS'
      'Where (BAN_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 344
    Top = 264
  end
  object dstSecoes: TSQLDataSet
    CommandText = 'select * from SECAO order by SEC_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 408
  end
  object dspSecoes: TDataSetProvider
    DataSet = dstSecoes
    Options = [poAllowCommandText]
    Left = 104
    Top = 400
  end
  object cdsSecoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSecoes'
    Left = 168
    Top = 400
    object cdsSecoesSEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
      Required = True
    end
    object cdsSecoesSEC_DESCRICAO: TStringField
      FieldName = 'SEC_DESCRICAO'
      Size = 30
    end
  end
  object qrySecao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pDESCRICAO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select * from SECAO Whrere (SEC_DESCRICAO = :pDESCRICAO)')
    SQLConnection = Dm.SqlAdmin
    Left = 240
    Top = 400
  end
  object dstSubSecao: TSQLDataSet
    CommandText = 'select * from SUBSECAO order by SUB_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 312
    Top = 399
  end
  object dspSubSecao: TDataSetProvider
    DataSet = dstSubSecao
    Options = [poAllowCommandText]
    Left = 384
    Top = 400
  end
  object cdsSubSecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubSecao'
    Left = 456
    Top = 400
    object cdsSubSecaoSUB_CODIGO: TIntegerField
      FieldName = 'SUB_CODIGO'
      Required = True
    end
    object cdsSubSecaoSUB_DESCRICAO: TStringField
      FieldName = 'SUB_DESCRICAO'
      Size = 30
    end
    object cdsSubSecaoSEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
    end
  end
  object dstFornecedor: TSQLDataSet
    CommandText = 
      'select FOR_CODIGO, FOR_FANTASIA, FOR_RAZAO from FORNECEDORES ord' +
      'er by FOR_FANTASIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 416
    Top = 264
  end
  object dspFornecedor: TDataSetProvider
    DataSet = dstFornecedor
    Options = [poAllowCommandText]
    Left = 480
    Top = 264
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedor'
    Left = 560
    Top = 264
    object cdsFornecedorFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      Required = True
    end
    object cdsFornecedorFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsFornecedorFOR_RAZAO: TStringField
      FieldName = 'FOR_RAZAO'
      Size = 50
    end
  end
  object qrySubSebSecao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSECAO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pDESCRICAO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select * from SUBSECAO Where (SEC_CODIGO = :pSECAO)'
      'and (SUB_DESCRICAO = :pDESCRICAO )')
    SQLConnection = Dm.SqlAdmin
    Left = 448
    Top = 352
  end
  object qryFornecedor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pFANTASIA'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select FOR_CODIGO, FOR_FANTASIA from FORNECEDORES '
      'Where (FOR_FANTASIA = :pFANTASIA)')
    SQLConnection = Dm.SqlAdmin
    Left = 536
    Top = 216
  end
  object qryProcurar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from USUARIOS')
    SQLConnection = Dm.SqlAdmin
    Left = 508
    Top = 30
  end
  object qryTributacao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select * from TRIBUTACAO Where (TRI_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 520
    Top = 96
  end
  object qryEstoque: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select PRO_CODIGO, EST_QUANTIDADE from ESTOQUE'
      'Where (EST_CODIGOLOJA = :pLOJA) AND (PRO_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 456
    Top = 168
  end
  object qryImpressoraCaixa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select SEN_CODIGO, SEN_ECF, SEN_FLIMPRESSORA from USUARIOS '
      'Where (SEN_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 528
    Top = 176
  end
  object qryAliquota: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select P.PRO_CODIGO, T.TRI_INDICE_ECF from PRODUTOS P'
      'INNER join TRIBUTACAO  T ON T.TRI_CODIGO = P.TRI_CODIGO'
      'Where (P.PRO_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 528
    Top = 328
  end
  object qryEstoqueProcura: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select PRO_CODIGO, EST_QUANTIDADE from ESTOQUE')
    SQLConnection = Dm.SqlAdmin
    Left = 528
    Top = 376
    object qryEstoqueProcuraPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      FixedChar = True
      Size = 13
    end
    object qryEstoqueProcuraEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 15
      Size = 3
    end
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 568
    Top = 16
  end
  object dstConsulta: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 496
    Top = 448
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 560
    Top = 448
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 624
    Top = 448
  end
  object cdsItensVendas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsItensVendasCalcFields
    Left = 576
    Top = 72
    Data = {
      050200009619E0BD01000000180000001100000000000300000005020A495445
      5F4E524954454E01004900000001000557494454480200020014000A4954455F
      43444954454E01004900000001000557494454480200020014000A4954455F4E
      4D4445534301004900000001000557494454480200020028000A4954455F5154
      4954454E08000400000000000A4954455F4344554E4944010049000000010005
      57494454480200020014000A4954455F564C554E495408000400000001000753
      5542545950450200490006004D6F6E6579000A4954455F464C43414E43010049
      00000001000557494454480200020014000A4954455F564C434F4D5008000400
      0000010007535542545950450200490006004D6F6E6579000A4954455F564C43
      555354080004000000010007535542545950450200490006004D6F6E6579000A
      4954455F4E524C4F544501004900000001000557494454480200020014000A49
      54455F4344424149580100490000000100055749445448020002000D000A4954
      455F564C4445534308000400000000000A4954455F564C414352450800040000
      0000000A4954455F56414C49504908000400000000000A4954455F5245464552
      450100490000000100055749445448020002000E000A4954455F434F44434F52
      04000100000000000A4954455F4E4F4D434F5201004900000001000557494454
      480200020019000000}
    object cdsItensVendasITE_NRITEN: TStringField
      Alignment = taRightJustify
      FieldName = 'ITE_NRITEN'
    end
    object cdsItensVendasITE_CDITEN: TStringField
      FieldName = 'ITE_CDITEN'
    end
    object cdsItensVendasITE_NMDESC: TStringField
      FieldName = 'ITE_NMDESC'
      Size = 40
    end
    object cdsItensVendasITE_QTITEN: TFloatField
      FieldName = 'ITE_QTITEN'
    end
    object cdsItensVendasITE_CDUNID: TStringField
      FieldName = 'ITE_CDUNID'
    end
    object cdsItensVendasITE_VLUNIT: TCurrencyField
      FieldName = 'ITE_VLUNIT'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      currency = False
    end
    object cdsItensVendasITE_VLSUBT: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ITE_VLSUBT'
      DisplayFormat = '###,###,##0.#0'
      currency = False
      Calculated = True
    end
    object cdsItensVendasITE_FLCANC: TStringField
      FieldName = 'ITE_FLCANC'
    end
    object cdsItensVendasITE_VLCOMP: TCurrencyField
      FieldName = 'ITE_VLCOMP'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsItensVendasITE_VLCUST: TCurrencyField
      FieldName = 'ITE_VLCUST'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsItensVendasITE_NRLOTE: TStringField
      FieldName = 'ITE_NRLOTE'
    end
    object cdsItensVendasITE_CDBAIX: TStringField
      FieldName = 'ITE_CDBAIX'
      Size = 13
    end
    object cdsItensVendasITE_VLDESC: TFloatField
      FieldName = 'ITE_VLDESC'
      DisplayFormat = '##0.#0'
    end
    object cdsItensVendasITE_VLACRE: TFloatField
      FieldName = 'ITE_VLACRE'
      DisplayFormat = '##0.#0'
    end
    object cdsItensVendasITE_VALIPI: TFloatField
      FieldName = 'ITE_VALIPI'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object cdsItensVendasITE_REFERE: TStringField
      FieldName = 'ITE_REFERE'
      Size = 14
    end
    object cdsItensVendasITE_VLSUBTOT2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ITE_VLSUBTOT2'
      Calculated = True
    end
    object cdsItensVendasITE_CODCOR: TIntegerField
      FieldName = 'ITE_CODCOR'
    end
    object cdsItensVendasITE_NOMCOR: TStringField
      FieldName = 'ITE_NOMCOR'
      Size = 25
    end
  end
  object cdsModalidade: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 559
    Top = 140
    Data = {
      DF0000009619E0BD010000001800000007000000000003000000DF000A4D4F44
      5F434F4449474F0400010000000000084D4F445F4E4F4D450100490000000100
      0557494454480200020014000E4D4F445F5045434F4D495353414F0800040000
      0000000E4D4F445F4142524556494143414F0100490000000100055749445448
      020002001400094D4F445F56414C4F5208000400000001000753554254595045
      0200490006004D6F6E6579000A4D4F445F464C46495841010049000000010005
      57494454480200020001000D4D4F445F4E5250415243454C4108000400000000
      000000}
    object cdsModalidadeMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
    end
    object cdsModalidadeMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
    end
    object cdsModalidadeMOD_PECOMISSAO: TFloatField
      FieldName = 'MOD_PECOMISSAO'
    end
    object cdsModalidadeMOD_ABREVIACAO: TStringField
      FieldName = 'MOD_ABREVIACAO'
    end
    object cdsModalidadeMOD_VALOR: TCurrencyField
      FieldName = 'MOD_VALOR'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsModalidadeMOD_FLFIXA: TStringField
      FieldName = 'MOD_FLFIXA'
      Size = 1
    end
    object cdsModalidadeMOD_NRPARCELA: TFloatField
      FieldName = 'MOD_NRPARCELA'
    end
  end
  object qryIncluir: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from PROVENDAS')
    SQLConnection = Dm.SqlAdmin
    Left = 617
    Top = 131
  end
  object qryProdutos2: TSQLQuery
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
    Left = 616
    Top = 176
  end
  object dstVendasClientes: TSQLDataSet
    CommandText = 
      'Select M.MOV_PEDIDO, M.MOV_CUPOM, M.MOV_LOJA, M.MOV_CLIENTE,'#13#10'M.' +
      'MOV_DATAVENDA, M.MOV_HORAVENDA, M.MOV_VALOR, M.MOV_NOMECLIENTE,'#13 +
      #10'MC.MCA_MODALIDADE, MD.MOD_NOME, TB.PRC_DESCRICAO'#13#10'from VENDAS M' +
      #13#10'INNER join MOVIMENTO_CAIXA MC ON M.MOV_PEDIDO = MC.MCA_VENDA'#13#10 +
      'INNER join MODALIDADE MD ON MC.MCA_MODALIDADE = MD.MOD_CODIGO'#13#10'I' +
      'NNER join TAB_PRECOS TB ON M.MOV_TABELA = TB.PRC_CODIGO'#13#10'Where (' +
      'M.MOV_CLIENTE = :pCLIENTE) AND (M.MOV_SITUACAO = :SITUACAO)'#13#10'ord' +
      'er by M.MOV_DATAVENDA Desc'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCLIENTE'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'SITUACAO'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 456
  end
  object dspVendasClientes: TDataSetProvider
    DataSet = dstVendasClientes
    Options = [poAllowCommandText]
    Left = 112
    Top = 448
  end
  object cdsVendasClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCLIENTE'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'SITUACAO'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspVendasClientes'
    Left = 192
    Top = 448
    object cdsVendasClientesMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
    end
    object cdsVendasClientesMOV_CUPOM: TIntegerField
      FieldName = 'MOV_CUPOM'
    end
    object cdsVendasClientesMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
    end
    object cdsVendasClientesMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
    end
    object cdsVendasClientesMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsVendasClientesMOV_HORAVENDA: TStringField
      FieldName = 'MOV_HORAVENDA'
      FixedChar = True
      Size = 5
    end
    object cdsVendasClientesMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsVendasClientesMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      Size = 40
    end
    object cdsVendasClientesMCA_MODALIDADE: TStringField
      FieldName = 'MCA_MODALIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsVendasClientesMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
    object cdsVendasClientesPRC_DESCRICAO: TStringField
      FieldName = 'PRC_DESCRICAO'
      Size = 40
    end
  end
  object dstItensClientes: TSQLDataSet
    CommandText = 
      'Select H.HIS_PRODUTO, H.HIS_DATA, H.HIS_HORA, H.HIS_TIPO,'#13#10'H.HIS' +
      '_DOCUMENTO, H.HIS_MOVIMENTO, H.HIS_VLVENDA,'#13#10'P.PRO_DESCRICAO'#13#10'FR' +
      'OM HISTORICO H'#13#10'INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_C' +
      'ODIGO'#13#10'Where (H.HIS_DOCUMENTO = :pVENDA) and (H.HIS_TIPO = :pTIP' +
      'O)'#13#10'order by H.HIS_DATA;'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 288
    Top = 448
  end
  object dspItensClientes: TDataSetProvider
    DataSet = dstItensClientes
    Options = [poAllowCommandText]
    Left = 352
    Top = 448
  end
  object cdsItensClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspItensClientes'
    Left = 416
    Top = 448
    object cdsItensClientesHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsItensClientesHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object cdsItensClientesHIS_HORA: TStringField
      FieldName = 'HIS_HORA'
      FixedChar = True
      Size = 5
    end
    object cdsItensClientesHIS_TIPO: TStringField
      FieldName = 'HIS_TIPO'
      FixedChar = True
      Size = 2
    end
    object cdsItensClientesHIS_DOCUMENTO: TIntegerField
      FieldName = 'HIS_DOCUMENTO'
    end
    object cdsItensClientesHIS_MOVIMENTO: TFMTBCDField
      FieldName = 'HIS_MOVIMENTO'
      Precision = 15
      Size = 3
    end
    object cdsItensClientesHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsItensClientesPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
  end
  object dstCores: TSQLDataSet
    CommandText = 
      'select COR_CODIGO, COR_DESCRICAO from CORES order by COR_DESCRIC' +
      'AO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 632
    Top = 270
    object dstCoresCOR_CODIGO: TIntegerField
      FieldName = 'COR_CODIGO'
      Required = True
    end
    object dstCoresCOR_DESCRICAO: TStringField
      FieldName = 'COR_DESCRICAO'
      Size = 25
    end
  end
  object dspCores: TDataSetProvider
    DataSet = dstCores
    Options = [poAllowCommandText]
    Left = 632
    Top = 320
  end
  object cdsCores: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCores'
    Left = 584
    Top = 360
    object cdsCoresCOR_CODIGO: TIntegerField
      FieldName = 'COR_CODIGO'
      Required = True
    end
    object cdsCoresCOR_DESCRICAO: TStringField
      FieldName = 'COR_DESCRICAO'
      Size = 25
    end
  end
  object dstTabPrecos: TSQLDataSet
    CommandText = 'select PRC_CODIGO, PRC_DESCRICAO from TAB_PRECOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 680
    Top = 24
  end
  object dspTabPrecos: TDataSetProvider
    DataSet = dstTabPrecos
    Options = [poAllowCommandText]
    Left = 680
    Top = 80
  end
  object cdsTabPrecos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabPrecos'
    Left = 680
    Top = 128
    object cdsTabPrecosPRC_CODIGO: TIntegerField
      FieldName = 'PRC_CODIGO'
      Required = True
    end
    object cdsTabPrecosPRC_DESCRICAO: TStringField
      FieldName = 'PRC_DESCRICAO'
      Size = 40
    end
  end
  object dsItemVendas: TDataSource
    DataSet = cdsItensVendas
    Left = 688
    Top = 184
  end
  object dstOrcamento: TSQLDataSet
    CommandText = 
      'Select ORC_PEDIDO, ORC_CLIENTE, ORC_DATAVENDA, ORC_VALOR, ORC_SI' +
      'TUACAO, ORC_NOMECLIENTE, DOM_CIDADE from ORCAMENTOS order by ORC' +
      '_DATAVENDA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 696
    Top = 240
    object dstOrcamentoORC_PEDIDO: TIntegerField
      FieldName = 'ORC_PEDIDO'
      Required = True
    end
    object dstOrcamentoORC_CLIENTE: TIntegerField
      FieldName = 'ORC_CLIENTE'
    end
    object dstOrcamentoORC_DATAVENDA: TDateField
      FieldName = 'ORC_DATAVENDA'
    end
    object dstOrcamentoORC_VALOR: TFMTBCDField
      FieldName = 'ORC_VALOR'
      Precision = 15
      Size = 2
    end
    object dstOrcamentoORC_SITUACAO: TStringField
      FieldName = 'ORC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object dstOrcamentoORC_NOMECLIENTE: TStringField
      FieldName = 'ORC_NOMECLIENTE'
      Size = 40
    end
    object dstOrcamentoDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
    end
  end
  object dspOrcamentos: TDataSetProvider
    DataSet = dstOrcamento
    Options = [poAllowCommandText]
    Left = 696
    Top = 288
  end
  object cdsOrcamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrcamentos'
    Left = 696
    Top = 336
    object cdsOrcamentosORC_PEDIDO: TIntegerField
      FieldName = 'ORC_PEDIDO'
      Required = True
      DisplayFormat = '000000'
    end
    object cdsOrcamentosORC_CLIENTE: TIntegerField
      FieldName = 'ORC_CLIENTE'
    end
    object cdsOrcamentosORC_DATAVENDA: TDateField
      FieldName = 'ORC_DATAVENDA'
    end
    object cdsOrcamentosORC_VALOR: TFMTBCDField
      FieldName = 'ORC_VALOR'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsOrcamentosORC_SITUACAO: TStringField
      FieldName = 'ORC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsOrcamentosORC_NOMECLIENTE: TStringField
      FieldName = 'ORC_NOMECLIENTE'
      Size = 40
    end
    object cdsOrcamentosDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
    end
  end
  object dstItensOrcamento: TSQLDataSet
    CommandText = 
      'Select ITO_PEDIDO, ITO_NRITEM, ITO_PRODUTO, ITO_QUANTIDADE, '#13#10' I' +
      'TO_UNIDADE, ITO_VALOR, ITO_DESCONTO from ITENS_ORCAMENTO '#13#10'Where' +
      ' (ITO_PEDIDO = :pPEDIDO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 696
    Top = 384
  end
  object dspItensOrcamento: TDataSetProvider
    DataSet = dstItensOrcamento
    Options = [poAllowCommandText]
    Left = 616
    Top = 416
  end
  object cdsItensOrcamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensOrcamento'
    Left = 680
    Top = 432
    object cdsItensOrcamentoITO_PEDIDO: TIntegerField
      FieldName = 'ITO_PEDIDO'
    end
    object cdsItensOrcamentoITO_NRITEM: TIntegerField
      FieldName = 'ITO_NRITEM'
      Required = True
    end
    object cdsItensOrcamentoITO_PRODUTO: TStringField
      FieldName = 'ITO_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsItensOrcamentoITO_QUANTIDADE: TFMTBCDField
      FieldName = 'ITO_QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object cdsItensOrcamentoITO_UNIDADE: TStringField
      FieldName = 'ITO_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsItensOrcamentoITO_VALOR: TFMTBCDField
      FieldName = 'ITO_VALOR'
      Precision = 15
      Size = 2
    end
    object cdsItensOrcamentoITO_DESCONTO: TFMTBCDField
      FieldName = 'ITO_DESCONTO'
      Precision = 15
      Size = 2
    end
  end
  object qryLoja: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS '
      'Where (EMP_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 104
    Top = 16
  end
  object cdsConsulta2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 640
    Top = 300
  end
  object dstPadrao: TSQLDataSet
    CommandText = 'Select * from MES_REFERENCIA MR Where (MR.mes_codigo = :aMES)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'aMES'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 624
    Top = 16
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 624
    Top = 64
  end
  object cdsProdutos2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 616
    Top = 224
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select FUN_CODIGO, FUN_NOME from FUNCIONARIOS Where (FUN_CODIGO ' +
      '= :pCODIGO)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 576
    Top = 316
  end
  object cdsCaixa2: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select CAI_NUMERO, CAI_LOJA, CAI_CAIXA, CAI_SITUACAO from CAIXA ' +
      'Where (CAI_CAIXA = :pCAIXA) AND (CAI_SITUACAO = :pSITUACAO)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 640
    Top = 341
  end
  object cdsCaixaFechar: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from CAIXA_FECHAR Where (CXF_NUMERO = :pNUMERO) AND (MO' +
      'D_MODALIDADE = :pMODALIDADE)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pMODALIDADE'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 496
    Top = 152
  end
  object cdsGetNatureza: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 496
    Top = 16
  end
  object cdsListaCedentes: TClientDataSet
    Aggregates = <>
    CommandText = 'select CD.CODIGO, CD.CEDENTE_NOME from cedentes CD'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 536
    Top = 496
    object cdsListaCedentesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsListaCedentesCEDENTE_NOME: TStringField
      FieldName = 'CEDENTE_NOME'
      Size = 50
    end
  end
  object cdsGrupos: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from GRUPOS order by GRU_DESCRICAO'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 344
    Top = 496
    object cdsGruposGRU_CODIGO: TIntegerField
      FieldName = 'GRU_CODIGO'
      Required = True
    end
    object cdsGruposGRU_DESCRICAO: TStringField
      FieldName = 'GRU_DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object cdsMesReferente: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from MES_REFERENCIA MR Where (MR.mes_codigo = :aMES)'
    Params = <
      item
        DataType = ftString
        Name = 'aMES'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 248
    Top = 496
    object cdsMesReferenteMES_CODIGO: TStringField
      FieldName = 'MES_CODIGO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsMesReferenteMES_SEQUENCIA: TIntegerField
      FieldName = 'MES_SEQUENCIA'
      Required = True
    end
  end
end
