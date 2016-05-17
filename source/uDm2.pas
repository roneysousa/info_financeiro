unit uDm2;

interface

uses
  SysUtils, Classes, FMTBcd, DB, Provider, DBClient, SqlExpr, Forms,
  Windows, Messages;

type
  TDM2 = class(TDataModule)
    dstTransferencias: TSQLDataSet;
    dstTransferenciasTRA_NRTRANSFERENCIA: TIntegerField;
    dstTransferenciasTRA_LOJAORIGEM: TIntegerField;
    dstTransferenciasTRA_LOJADESTINO: TIntegerField;
    dstTransferenciasTRA_ENTREGADOR: TIntegerField;
    dstTransferenciasTRA_DATA: TDateField;
    dstTransferenciasTRA_HORA: TStringField;
    dstTransferenciasTRA_SITUACAO: TStringField;
    dstTransferenciasTRA_USUARIO: TIntegerField;
    cdsTranferencias: TClientDataSet;
    dspTransferencia: TDataSetProvider;
    dsTransferencias: TDataSource;
    cdsTranferenciasTRA_NRTRANSFERENCIA: TIntegerField;
    cdsTranferenciasTRA_LOJAORIGEM: TIntegerField;
    cdsTranferenciasTRA_LOJADESTINO: TIntegerField;
    cdsTranferenciasTRA_ENTREGADOR: TIntegerField;
    cdsTranferenciasTRA_DATA: TDateField;
    cdsTranferenciasTRA_HORA: TStringField;
    cdsTranferenciasTRA_SITUACAO: TStringField;
    cdsTranferenciasTRA_USUARIO: TIntegerField;
    dstLojaOrigem: TSQLDataSet;
    dstLojaDestino: TSQLDataSet;
    dspOrigem: TDataSetProvider;
    cdsOrigem: TClientDataSet;
    dsOrigem: TDataSource;
    cdsOrigemEMP_CODIGO: TIntegerField;
    cdsOrigemEMP_FANTASIA: TStringField;
    dspDestino: TDataSetProvider;
    cdsDestino: TClientDataSet;
    dsDestino: TDataSource;
    cdsDestinoEMP_CODIGO: TIntegerField;
    cdsDestinoEMP_FANTASIA: TStringField;
    dstEntregador: TSQLDataSet;
    dspEntregados: TDataSetProvider;
    cdsEntregador: TClientDataSet;
    dsEntregador: TDataSource;
    cdsEntregadorFUN_CODIGO: TIntegerField;
    cdsEntregadorFUN_NOME: TStringField;
    cdsTranferenciasTRA_NMORIGEM: TStringField;
    cdsTranferenciasTRA_NMDESTINO: TStringField;
    cdsTranferenciasTRA_NMENTREGADOR: TStringField;
    cdsItensTransf: TClientDataSet;
    dsItensTransf: TDataSource;
    cdsItensTransfPRT_CODIGO: TStringField;
    cdsItensTransfPRT_DESCRICAO: TStringField;
    cdsItensTransfPRT_UNIDADE: TStringField;
    cdsItensTransfPRT_QUANTIDADE: TFloatField;
    cdsItensTransfPRT_VLCOMPRA: TCurrencyField;
    cdsItensTransfPRT_VLCUSTO: TCurrencyField;
    cdsItensTransfPRT_VLVENDA: TCurrencyField;
    cdsItensTransfPRT_SUBTOTAL: TCurrencyField;
    dstModalidades: TSQLDataSet;
    dspModalidades: TDataSetProvider;
    cdsModalidades: TClientDataSet;
    dsModalidades: TDataSource;
    cdsModalidadesMOD_CODIGO: TIntegerField;
    cdsModalidadesMOD_NOME: TStringField;
    dstNatureza: TSQLDataSet;
    dspNatureza: TDataSetProvider;
    cdsNatureza: TClientDataSet;
    dsNatureza: TDataSource;
    dstNaturezaNAT_CODIGO: TIntegerField;
    dstNaturezaNAT_NOME: TStringField;
    dstNaturezaNAT_TIPO: TStringField;
    dstNaturezaNAT_FLDESC: TStringField;
    cdsNaturezaNAT_CODIGO: TIntegerField;
    cdsNaturezaNAT_NOME: TStringField;
    cdsNaturezaNAT_TIPO: TStringField;
    cdsNaturezaNAT_FLDESC: TStringField;
    dstPerdas: TSQLDataSet;
    dspPerdas: TDataSetProvider;
    cdsPerdas: TClientDataSet;
    dsPerdas: TDataSource;
    dstDerivados: TSQLDataSet;
    dspDerivados: TDataSetProvider;
    cdsDerivados: TClientDataSet;
    dsDerivados: TDataSource;
    cdsDerivadosDER_ID: TIntegerField;
    cdsDerivadosDER_DESCRICAO: TStringField;
    dstProdutoEntrada: TSQLDataSet;
    dstProdutoEntradaENP_NUMERO: TIntegerField;
    dstProdutoEntradaPRO_CODIGO: TStringField;
    dstProdutoEntradaUNI_UNIDADE: TStringField;
    dstProdutoEntradaENP_QUANTIDADE: TFMTBCDField;
    dstProdutoEntradaENP_VALOR: TFMTBCDField;
    dstProdutoEntradaENP_IPI: TFMTBCDField;
    dstProdutoEntradaENP_ICMS: TFMTBCDField;
    dstProdutoEntradaENP_SUBTOTAL: TFMTBCDField;
    dspProdutoEntrada: TDataSetProvider;
    cdsProdutoEntrada: TClientDataSet;
    dsProdutoEntrada: TDataSource;
    dstContasPagar: TSQLDataSet;
    dspContasPagar: TDataSetProvider;
    cdsContasPagar: TClientDataSet;
    dsContasPagar: TDataSource;
    dstEntradas: TSQLDataSet;
    dspEntradas: TDataSetProvider;
    dstEntradasENT_NUMERO: TIntegerField;
    dstEntradasENT_LOJA: TIntegerField;
    dstEntradasENT_FORNECEDOR: TIntegerField;
    dstEntradasENT_DATAPEDIDO: TDateField;
    dstEntradasENT_DATAENTRADA: TDateField;
    dstEntradasENT_NATUREZAOPERACAO: TStringField;
    dstEntradasENT_DATAEMISSAONOTA: TDateField;
    dstEntradasENT_NUMERONOTA: TStringField;
    dstEntradasENT_SERIENOTA: TStringField;
    dstEntradasENT_VALORMERCADORIAS: TFMTBCDField;
    dstEntradasENT_TIPOFRETE: TStringField;
    dstEntradasENT_BASECALCULOICMS: TFMTBCDField;
    dstEntradasENT_VALORICMS: TFMTBCDField;
    dstEntradasENT_BASECALCULOSUBSTITUICAO: TFMTBCDField;
    dstEntradasENT_VALORSUBSTITUICAO: TFMTBCDField;
    dstEntradasENT_VALORIPI: TFMTBCDField;
    dstEntradasENT_VALORSEGURO: TFMTBCDField;
    dstEntradasENT_OUTRASPESPESAS: TFMTBCDField;
    dstEntradasENT_VALORDESCONTO: TFMTBCDField;
    dstEntradasENT_VALORNOTA: TFMTBCDField;
    dstEntradasENT_SITUACAO: TStringField;
    cdsEntradas: TClientDataSet;
    dsEntradas: TDataSource;
    dstContasPagarPAG_SEQUENCIA: TIntegerField;
    dstContasPagarPAG_LOJA: TIntegerField;
    dstContasPagarPAG_NRENTRADA: TIntegerField;
    dstContasPagarPAG_PARCELA: TStringField;
    dstContasPagarPAG_QTPARCELAS: TIntegerField;
    dstContasPagarPAG_DATACOMPRA: TDateField;
    dstContasPagarPAG_DATAVENCIMENTO: TDateField;
    dstContasPagarPAG_FORNECEDOR: TIntegerField;
    dstContasPagarPAG_NRNOTA: TStringField;
    dstContasPagarPAG_SERIENOTA: TStringField;
    dstContasPagarPAG_NATUREZADESPESA: TIntegerField;
    dstContasPagarPAG_DESCONTOANTECIPADO: TFMTBCDField;
    dstContasPagarPAG_DESCRICAO: TMemoField;
    dstContasPagarPAG_VALORPARCELA: TFMTBCDField;
    dstContasPagarPAG_SITUACAO: TStringField;
    dstContasPagarPAG_DATAPAGAMENTO: TDateField;
    dstContasPagarPAG_VALORPAGO: TFMTBCDField;
    dstContasPagarPAG_VALORDESCONTO: TFMTBCDField;
    dstContasPagarPAG_VALORJUROS: TFMTBCDField;
    dstContasPagarPAG_MODALIDADE: TIntegerField;
    dstContasPagarPAG_BANCO: TStringField;
    dstContasPagarPAG_NRCONTA: TStringField;
    dstContasPagarPAG_NRCHEQUE: TStringField;
    dstContasPagarPAG_USUARIO: TIntegerField;
    cdsProdutos: TClientDataSet;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_NOME: TStringField;
    cdsProdutosUNI_DESCRICAO: TStringField;
    cdsProdutosENP_QUANTIDADE: TFloatField;
    cdsProdutosENP_VALOR: TCurrencyField;
    cdsProdutosENP_IPI: TCurrencyField;
    cdsProdutosENP_ICMS: TCurrencyField;
    cdsProdutosENP_SUBTOTAL: TCurrencyField;
    dstEntradasENT_VALORFRETE: TFMTBCDField;
    dstEntradasENT_USUARIO: TIntegerField;
    dstContasReceber: TSQLDataSet;
    dstContasReceberREC_LOJA: TIntegerField;
    dstContasReceberREC_CREDITO: TIntegerField;
    dstContasReceberREC_QTPARCELAS: TIntegerField;
    dstContasReceberREC_CLIENTE: TIntegerField;
    dstContasReceberREC_NRVENDA: TIntegerField;
    dstContasReceberREC_DESCRICAO: TMemoField;
    dstContasReceberREC_DATAEMISSAO: TDateField;
    dstContasReceberREC_DATAVENCIMENTO: TDateField;
    dstContasReceberREC_VALORPARCELA: TFMTBCDField;
    dstContasReceberREC_SITUACAO: TStringField;
    dstContasReceberREC_DATAPAGAMENTO: TDateField;
    dstContasReceberREC_VALORACRESIMO: TFMTBCDField;
    dstContasReceberREC_VALORJUROS: TFMTBCDField;
    dstContasReceberREC_VALORDESCONTO: TFMTBCDField;
    dstContasReceberREC_PAGO: TFMTBCDField;
    dstContasReceberREC_RESTANTE: TFMTBCDField;
    dstContasReceberREC_BANCO: TStringField;
    dstContasReceberREC_AGENCIA: TStringField;
    dstContasReceberREC_NRCONTA: TStringField;
    dstContasReceberREC_NRCHEQUE: TStringField;
    dstContasReceberREC_TIPOMODALIDADE: TIntegerField;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    cdsContasReceberREC_LOJA: TIntegerField;
    cdsContasReceberREC_CREDITO: TIntegerField;
    cdsContasReceberREC_QTPARCELAS: TIntegerField;
    cdsContasReceberREC_CLIENTE: TIntegerField;
    cdsContasReceberREC_NRVENDA: TIntegerField;
    cdsContasReceberREC_DESCRICAO: TMemoField;
    cdsContasReceberREC_DATAEMISSAO: TDateField;
    cdsContasReceberREC_DATAVENCIMENTO: TDateField;
    cdsContasReceberREC_VALORPARCELA: TFMTBCDField;
    cdsContasReceberREC_SITUACAO: TStringField;
    cdsContasReceberREC_DATAPAGAMENTO: TDateField;
    cdsContasReceberREC_VALORACRESIMO: TFMTBCDField;
    cdsContasReceberREC_VALORJUROS: TFMTBCDField;
    cdsContasReceberREC_VALORDESCONTO: TFMTBCDField;
    cdsContasReceberREC_PAGO: TFMTBCDField;
    cdsContasReceberREC_RESTANTE: TFMTBCDField;
    cdsContasReceberREC_BANCO: TStringField;
    cdsContasReceberREC_AGENCIA: TStringField;
    cdsContasReceberREC_NRCONTA: TStringField;
    cdsContasReceberREC_NRCHEQUE: TStringField;
    cdsContasReceberREC_TIPOMODALIDADE: TIntegerField;
    cdsContasReceberREC_NOMELOJA: TStringField;
    dstClientes: TSQLDataSet;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsClientesCLI_CODIGO: TIntegerField;
    cdsClientesCLI_FANTASIA: TStringField;
    dstEntradasENT_TRANSPORTADORA: TIntegerField;
    qryProdutos: TSQLQuery;
    dstContasReceberREC_USUARIO: TIntegerField;
    cdsContasReceberREC_USUARIO: TIntegerField;
    dsContasReceber: TDataSource;
    cdsContasReceberREC_NMSITUACAO: TStringField;
    cdsContasReceberREC_ATRASO: TFloatField;
    dstContasReceberREC_PARCELA: TIntegerField;
    cdsContasReceberREC_PARCELA: TIntegerField;
    cdsParcelas: TClientDataSet;
    dsParcelas: TDataSource;
    cdsParcelasPAR_NRPARCELA: TIntegerField;
    cdsParcelasPAR_VENCIMENTO: TDateField;
    cdsParcelasPAR_VALOR: TCurrencyField;
    cdsParcelasPAR_BANCO: TStringField;
    cdsParcelasPAR_AGENCIA: TStringField;
    cdsParcelasPAR_CONTA: TStringField;
    cdsParcelasPAR_CHEQUE: TStringField;
    dstContasPagarPAG_AGENCIA: TStringField;
    cdsParcelasPAR_CDBANCO: TStringField;
    cdsContasPagarPAG_SEQUENCIA: TIntegerField;
    cdsContasPagarPAG_LOJA: TIntegerField;
    cdsContasPagarPAG_NRENTRADA: TIntegerField;
    cdsContasPagarPAG_PARCELA: TStringField;
    cdsContasPagarPAG_QTPARCELAS: TIntegerField;
    cdsContasPagarPAG_DATACOMPRA: TDateField;
    cdsContasPagarPAG_DATAVENCIMENTO: TDateField;
    cdsContasPagarPAG_FORNECEDOR: TIntegerField;
    cdsContasPagarPAG_NRNOTA: TStringField;
    cdsContasPagarPAG_SERIENOTA: TStringField;
    cdsContasPagarPAG_NATUREZADESPESA: TIntegerField;
    cdsContasPagarPAG_DESCONTOANTECIPADO: TFMTBCDField;
    cdsContasPagarPAG_DESCRICAO: TMemoField;
    cdsContasPagarPAG_VALORPARCELA: TFMTBCDField;
    cdsContasPagarPAG_SITUACAO: TStringField;
    cdsContasPagarPAG_DATAPAGAMENTO: TDateField;
    cdsContasPagarPAG_VALORPAGO: TFMTBCDField;
    cdsContasPagarPAG_VALORDESCONTO: TFMTBCDField;
    cdsContasPagarPAG_VALORJUROS: TFMTBCDField;
    cdsContasPagarPAG_MODALIDADE: TIntegerField;
    cdsContasPagarPAG_BANCO: TStringField;
    cdsContasPagarPAG_NRCONTA: TStringField;
    cdsContasPagarPAG_NRCHEQUE: TStringField;
    cdsContasPagarPAG_USUARIO: TIntegerField;
    cdsContasPagarPAG_AGENCIA: TStringField;
    cdsContasPagarPAG_NOMELOJA: TStringField;
    dstFornecedor: TSQLDataSet;
    dspFornecedor: TDataSetProvider;
    cdsFornecedor: TClientDataSet;
    dsFornecedor: TDataSource;
    cdsFornecedorFOR_CODIGO: TIntegerField;
    cdsFornecedorFOR_FANTASIA: TStringField;
    cdsContasPagarPAG_NMFORNECEDOR: TStringField;
    cdsContasPagarPAG_ATRASO: TFloatField;
    qryTotalCompra: TSQLQuery;
    cdsContasPagarPAG_NMMODA: TStringField;
    cdsContasPagarPAG_NMSITUACAO: TStringField;
    qryProcurarConta: TSQLQuery;
    qryProcContReceber: TSQLQuery;
    cdsParcelasVenda: TClientDataSet;
    cdsParcelasVendaPAR_NRPARCELA: TIntegerField;
    cdsParcelasVendaPAR_VENCIMENTO: TDateField;
    cdsParcelasVendaPAR_VALOR: TCurrencyField;
    cdsParcelasVendaPAR_BANCO: TStringField;
    cdsParcelasVendaPAR_AGENCIA: TStringField;
    cdsParcelasVendaPAR_CONTA: TStringField;
    cdsParcelasVendaPAR_CHEQUE: TStringField;
    cdsParcelasVendaPAR_CDBANCO: TStringField;
    cdsParcelasVendaPAR_QTPARCELAS: TIntegerField;
    cdsParcelasVendaPAR_MODALIDADE: TIntegerField;
    dsParcVendas: TDataSource;
    dstContasReceberREC_SEQUENCIA: TIntegerField;
    cdsContasReceberREC_SEQUENCIA: TIntegerField;
    dstMotDevolucao: TSQLDataSet;
    dstMotDevolucaoDEV_CODIGO: TIntegerField;
    dstMotDevolucaoDEV_NOME: TStringField;
    dspMotDevolucao: TDataSetProvider;
    cdsMotDevolucao: TClientDataSet;
    cdsMotDevolucaoDEV_CODIGO: TIntegerField;
    cdsMotDevolucaoDEV_NOME: TStringField;
    dsMotDevolucao: TDataSource;
    cdsProdutosPRO_NRLOTE: TStringField;
    dstLotes: TSQLDataSet;
    dstLotesLOT_PROCODIGO: TStringField;
    dstLotesLOT_NRLOTE: TStringField;
    dstLotesLOT_QUANTIDADE: TFMTBCDField;
    dstLotesLOT_DTVENCIMENTO: TDateField;
    dspLotes: TDataSetProvider;
    cdsLotes: TClientDataSet;
    cdsLotesLOT_PROCODIGO: TStringField;
    cdsLotesLOT_NRLOTE: TStringField;
    cdsLotesLOT_QUANTIDADE: TFMTBCDField;
    cdsLotesLOT_DTVENCIMENTO: TDateField;
    cdsProdutosPRO_DTVENCIMENTO: TDateField;
    cdsDerivadosProdutos: TClientDataSet;
    cdsDerivadosProdutosPRO_CODIGO: TStringField;
    cdsDerivadosProdutosPRO_DESCRICAO: TStringField;
    cdsDerivadosProdutosPRO_CODIGOBAIXA: TStringField;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos2: TClientDataSet;
    dsProdutos: TDataSource;
    cdsProdutos2PRO_CODIGO: TStringField;
    cdsProdutos2PRO_DESCRICAO: TStringField;
    dstImpressora: TSQLDataSet;
    dspImpressora: TDataSetProvider;
    cdsImpressora: TClientDataSet;
    dstImpressoraIMP_CODIGO: TIntegerField;
    dstImpressoraIMP_DESCRICAO: TStringField;
    cdsImpressoraIMP_CODIGO: TIntegerField;
    cdsImpressoraIMP_DESCRICAO: TStringField;
    dsImpressora: TDataSource;
    cdsPContas: TClientDataSet;
    cdsPContasREC_NRCRED: TIntegerField;
    cdsPContasREC_PARCELA: TIntegerField;
    cdsPContasREC_DTVENC: TDateField;
    cdsPContasREC_VLPARC: TCurrencyField;
    cdsPContasREC_VLDESC: TCurrencyField;
    cdsPContasREC_VLPAGO: TCurrencyField;
    cdsPContasREC_VLJURO: TCurrencyField;
    dstCores: TSQLDataSet;
    dstCoresCOR_CODIGO: TIntegerField;
    dstCoresCOR_DESCRICAO: TStringField;
    dspCores: TDataSetProvider;
    cdsCores: TClientDataSet;
    cdsCoresCOR_CODIGO: TIntegerField;
    cdsCoresCOR_DESCRICAO: TStringField;
    dstTabPrecos: TSQLDataSet;
    dstTabPrecosPRC_CODIGO: TIntegerField;
    dstTabPrecosPRC_DESCRICAO: TStringField;
    dspTabPrecos: TDataSetProvider;
    cdsTabPreco: TClientDataSet;
    cdsTabPrecoPRC_CODIGO: TIntegerField;
    cdsTabPrecoPRC_DESCRICAO: TStringField;
    dstTipoClientes: TSQLDataSet;
    dstTipoClientesTPC_CODIGO: TIntegerField;
    dspTpClientes: TDataSetProvider;
    cdsTpClientes: TClientDataSet;
    cdsTpClientesTPC_CODIGO: TIntegerField;
    dstTipoClientesTPC_DESCRICAO: TStringField;
    cdsTpClientesTPC_DESCRICAO: TStringField;
    dstRegioes: TSQLDataSet;
    dstRegioesREG_CODIGO: TIntegerField;
    dstRegioesREG_DESCRICAO: TStringField;
    dspRegioes: TDataSetProvider;
    cdsRegioes: TClientDataSet;
    cdsRegioesREG_CODIGO: TIntegerField;
    cdsRegioesREG_DESCRICAO: TStringField;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dstOrcamento: TSQLDataSet;
    dstOrcamentoORC_PEDIDO: TIntegerField;
    dstOrcamentoORC_LOJA: TIntegerField;
    dstOrcamentoORC_SEQUENCIA: TIntegerField;
    dstOrcamentoORC_CLIENTE: TIntegerField;
    dstOrcamentoORC_DATAVENDA: TDateField;
    dstOrcamentoORC_HORAVENDA: TStringField;
    dstOrcamentoORC_DATACANC: TDateField;
    dstOrcamentoORC_HORACANC: TStringField;
    dstOrcamentoORC_VENDEDOR: TIntegerField;
    dstOrcamentoORC_VALOR: TFMTBCDField;
    dstOrcamentoORC_ENTRADA: TFMTBCDField;
    dstOrcamentoORC_DESCONTO: TFMTBCDField;
    dstOrcamentoORC_ACRESCIMO: TFMTBCDField;
    dstOrcamentoORC_DEVOLUSAO: TFMTBCDField;
    dstOrcamentoORC_TROCO: TFMTBCDField;
    dstOrcamentoORC_SITUACAO: TStringField;
    dstOrcamentoDOM_ENDERECO: TStringField;
    dstOrcamentoDOM_NUMERO: TStringField;
    dstOrcamentoDOM_BAIRRO: TStringField;
    dstOrcamentoDOM_CIDADE: TStringField;
    dstOrcamentoDOM_REFERE: TStringField;
    dstOrcamentoORC_NOMECLIENTE: TStringField;
    dstOrcamentoORC_TABELA: TIntegerField;
    dspOrcamentos: TDataSetProvider;
    cdsOrcamentos: TClientDataSet;
    cdsOrcamentosORC_PEDIDO: TIntegerField;
    cdsOrcamentosORC_LOJA: TIntegerField;
    cdsOrcamentosORC_SEQUENCIA: TIntegerField;
    cdsOrcamentosORC_CLIENTE: TIntegerField;
    cdsOrcamentosORC_DATAVENDA: TDateField;
    cdsOrcamentosORC_HORAVENDA: TStringField;
    cdsOrcamentosORC_DATACANC: TDateField;
    cdsOrcamentosORC_HORACANC: TStringField;
    cdsOrcamentosORC_VENDEDOR: TIntegerField;
    cdsOrcamentosORC_VALOR: TFMTBCDField;
    cdsOrcamentosORC_ENTRADA: TFMTBCDField;
    cdsOrcamentosORC_DESCONTO: TFMTBCDField;
    cdsOrcamentosORC_ACRESCIMO: TFMTBCDField;
    cdsOrcamentosORC_DEVOLUSAO: TFMTBCDField;
    cdsOrcamentosORC_TROCO: TFMTBCDField;
    cdsOrcamentosORC_SITUACAO: TStringField;
    cdsOrcamentosDOM_ENDERECO: TStringField;
    cdsOrcamentosDOM_NUMERO: TStringField;
    cdsOrcamentosDOM_BAIRRO: TStringField;
    cdsOrcamentosDOM_CIDADE: TStringField;
    cdsOrcamentosDOM_REFERE: TStringField;
    cdsOrcamentosORC_NOMECLIENTE: TStringField;
    cdsOrcamentosORC_TABELA: TIntegerField;
    dstOrcamentoORC_MODALIDADE: TIntegerField;
    cdsOrcamentosORC_MODALIDADE: TIntegerField;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsHisProdutos: TClientDataSet;
    qryCodBarras: TSQLQuery;
    cdsGenerico: TClientDataSet;
    dstContasReceberREC_NATUREZA: TIntegerField;
    cdsContasReceberREC_NATUREZA: TIntegerField;
    dstContasReceberREC_DATA_CREDITO: TDateField;
    cdsContasReceberREC_DATA_CREDITO: TDateField;
    cdsContasReceberREC_NOME_MODA: TStringField;
    dstTabPrecosPRC_DESC1: TBCDField;
    dstTabPrecosPRC_DESC2: TBCDField;
    dstTabPrecosPRC_DESC3: TBCDField;
    dstTabPrecosPRC_DESC4: TBCDField;
    dstTabPrecosPRC_DESC5: TBCDField;
    dstTabPrecosPRC_DESC6: TBCDField;
    dstTabPrecosPRC_ACRE1: TBCDField;
    dstTabPrecosPRC_ACRE2: TBCDField;
    cdsTabPrecoPRC_DESC1: TBCDField;
    cdsTabPrecoPRC_DESC2: TBCDField;
    cdsTabPrecoPRC_DESC3: TBCDField;
    cdsTabPrecoPRC_DESC4: TBCDField;
    cdsTabPrecoPRC_DESC5: TBCDField;
    cdsTabPrecoPRC_DESC6: TBCDField;
    cdsTabPrecoPRC_ACRE1: TBCDField;
    cdsTabPrecoPRC_ACRE2: TBCDField;
    cdsPCRenegociacao: TClientDataSet;
    cdsPCRenegociacaoCDS_SEQUENCIA: TIntegerField;
    cdsPCRenegociacaoCDS_CDLOJA: TIntegerField;
    cdsPCRenegociacaoCDS_CREDITO: TIntegerField;
    cdsPCRenegociacaoCDS_NRPARCELA: TIntegerField;
    cdsPCRenegociacaoCDS_DTEMISSAO: TDateField;
    cdsPCRenegociacaoCDS_DTVENC: TDateField;
    cdsPCRenegociacaoCDS_VALOR: TFloatField;
    cdsPCRenegociacaoCDS_CLIENTE: TIntegerField;
    cdsPCRenegociacaoCDS_JUROS: TFloatField;
    cdsPCRenegociacaoCDS_MULTA: TFloatField;
    cdsPCRenegociacaoCDS_SITUACAO: TStringField;
    cdsPCRenegociacaoCDS_FLRENEG: TBooleanField;
    cdsPCRenegociacaoCDS_ATRASO: TFloatField;
    cdsPCRenegociacaoCDS_DTRENEGOCIACAO: TDateField;
    cdsListaParcelas: TClientDataSet;
    cdsListaParcelasREC_SEQUENCIA: TIntegerField;
    cdsListaParcelasREC_LOJA: TIntegerField;
    cdsListaParcelasREC_CREDITO: TIntegerField;
    cdsListaParcelasREC_PARCELA: TIntegerField;
    cdsListaParcelasREC_QTPARCELAS: TIntegerField;
    cdsListaParcelasREC_CLIENTE: TIntegerField;
    cdsListaParcelasREC_NRVENDA: TIntegerField;
    cdsListaParcelasREC_DESCRICAO: TMemoField;
    cdsListaParcelasREC_DATAEMISSAO: TDateField;
    cdsListaParcelasREC_DATAVENCIMENTO: TDateField;
    cdsListaParcelasREC_VALORPARCELA: TFMTBCDField;
    cdsListaParcelasREC_SITUACAO: TStringField;
    cdsListaParcelasREC_DATAPAGAMENTO: TDateField;
    cdsListaParcelasREC_VALORACRESIMO: TFMTBCDField;
    cdsListaParcelasREC_VALORJUROS: TFMTBCDField;
    cdsListaParcelasREC_VALORDESCONTO: TFMTBCDField;
    cdsListaParcelasREC_PAGO: TFMTBCDField;
    cdsListaParcelasREC_RESTANTE: TFMTBCDField;
    cdsListaParcelasREC_BANCO: TStringField;
    cdsListaParcelasREC_AGENCIA: TStringField;
    cdsListaParcelasREC_NRCONTA: TStringField;
    cdsListaParcelasREC_NRCHEQUE: TStringField;
    cdsListaParcelasREC_TIPOMODALIDADE: TIntegerField;
    cdsListaParcelasREC_USUARIO: TIntegerField;
    cdsListaParcelasREC_NATUREZA: TIntegerField;
    cdsListaParcelasREC_FLBOLETO: TStringField;
    cdsListaParcelasREC_DATA_CREDITO: TDateField;
    cdsListaParcelasREC_DTRENEGOCIACAO: TDateField;
    cdsPCRenegociacaoCSD_VALOR_ATUAL: TFloatField;
    cdsAddCReceber: TClientDataSet;
    cdsAddCReceberREC_SEQUENCIA: TIntegerField;
    cdsAddCReceberREC_LOJA: TIntegerField;
    cdsAddCReceberREC_CREDITO: TIntegerField;
    cdsAddCReceberREC_PARCELA: TIntegerField;
    cdsAddCReceberREC_QTPARCELAS: TIntegerField;
    cdsAddCReceberREC_CLIENTE: TIntegerField;
    cdsAddCReceberREC_NRVENDA: TIntegerField;
    cdsAddCReceberREC_DESCRICAO: TMemoField;
    cdsAddCReceberREC_DATAEMISSAO: TDateField;
    cdsAddCReceberREC_DATAVENCIMENTO: TDateField;
    cdsAddCReceberREC_VALORPARCELA: TFMTBCDField;
    cdsAddCReceberREC_SITUACAO: TStringField;
    cdsAddCReceberREC_DATAPAGAMENTO: TDateField;
    cdsAddCReceberREC_VALORACRESIMO: TFMTBCDField;
    cdsAddCReceberREC_VALORJUROS: TFMTBCDField;
    cdsAddCReceberREC_VALORDESCONTO: TFMTBCDField;
    cdsAddCReceberREC_PAGO: TFMTBCDField;
    cdsAddCReceberREC_RESTANTE: TFMTBCDField;
    cdsAddCReceberREC_BANCO: TStringField;
    cdsAddCReceberREC_AGENCIA: TStringField;
    cdsAddCReceberREC_NRCONTA: TStringField;
    cdsAddCReceberREC_NRCHEQUE: TStringField;
    cdsAddCReceberREC_TIPOMODALIDADE: TIntegerField;
    cdsAddCReceberREC_USUARIO: TIntegerField;
    cdsAddCReceberREC_NATUREZA: TIntegerField;
    cdsAddCReceberREC_FLBOLETO: TStringField;
    cdsAddCReceberREC_DATA_CREDITO: TDateField;
    cdsAddCReceberREC_DTRENEGOCIACAO: TDateField;
    cdsAddCReceberREC_VLMULTA: TFMTBCDField;
    cdsAddCReceberREC_NOSSO_NUMERO: TStringField;
    cdsPCRenegociacaoCDS_NATUREZA: TIntegerField;
    cdsPCRenegociacaoCDS_NOSSO_NUMERO: TStringField;
    cdsListaParcelasREC_VLMULTA: TFMTBCDField;
    cdsListaParcelasREC_NOSSO_NUMERO: TStringField;
    dstContasReceberREC_FLBOLETO: TStringField;
    dstContasReceberREC_VLMULTA: TFMTBCDField;
    dstContasReceberREC_NOSSO_NUMERO: TStringField;
    dstContasReceberREC_SEUNUMERO: TStringField;
    dstContasReceberREC_FORMABAIXA: TStringField;
    dstContasReceberREC_PEDESC: TFMTBCDField;
    dstContasReceberREC_PEMULTA: TFMTBCDField;
    dstContasReceberREC_PEJURO: TFMTBCDField;
    dstContasReceberREC_CDCEDENTE: TIntegerField;
    dstContasReceberREC_VLLIQUIDO: TFMTBCDField;
    cdsContasReceberREC_FLBOLETO: TStringField;
    cdsContasReceberREC_VLMULTA: TFMTBCDField;
    cdsContasReceberREC_NOSSO_NUMERO: TStringField;
    cdsContasReceberREC_SEUNUMERO: TStringField;
    cdsContasReceberREC_FORMABAIXA: TStringField;
    cdsContasReceberREC_PEDESC: TFMTBCDField;
    cdsContasReceberREC_PEMULTA: TFMTBCDField;
    cdsContasReceberREC_PEJURO: TFMTBCDField;
    cdsContasReceberREC_CDCEDENTE: TIntegerField;
    cdsContasReceberREC_VLLIQUIDO: TFMTBCDField;
    cdsAddCReceberREC_SEUNUMERO: TStringField;
    cdsAddCReceberREC_CDCEDENTE: TIntegerField;
    procedure cdsItensTransfCalcFields(DataSet: TDataSet);
    procedure dspProdutoEntradaGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspDerivadosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspPerdasGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspContasPagarGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspEntradasGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsContasReceberCalcFields(DataSet: TDataSet);
    procedure cdsParcelasBeforePost(DataSet: TDataSet);
    procedure cdsContasPagarCalcFields(DataSet: TDataSet);
    procedure dspContasReceberGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspMotDevolucaoGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspLotesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspCoresGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspTabPrecosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspTpClientesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspRegioesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspOrcamentosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsPCRenegociacaoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure VALOR_CONTA;
    function LISTA_PRODUTOS(M_NRVEND : Integer) : boolean;
    Function AddParcelaParaRenegociacao(iloja, iCliente : Integer): Boolean;
    Function AddParcelaContaReceber( pLOJA, pCREDITO ,
       pCLIENTE, pNRVENDA, pPARCELA, pQTPARCELAS, pNATUREZA, pUSUARIO : Integer; pVALORPARCELA : Double;
       pDESCRICAO, pSITUACAO, pFLBOLETO : String;
       pDATAEMISSAO, pDATAVENCIMENTO, pDTRENEGOCIACAO : TDATETime) : Boolean;
    Function SetParcelaRenegociacao(iSequencia : Integer) : Boolean;
    Function BaixaTituloBoleto(iCedente, iUsuario : Integer; aNossoNumero, aArquivo, aTipoBaixa : String; fValorPago,
            fValorCreditado, fVljuros, fVlmulta, fVlDesc : Double; aDataPaga, aDataCreditado : Tdatetime) : Boolean;
    Function BaixaTituloManual(iSequencia, iCedente, iUsuario : Integer; aTipoBaixa : String; fValorPago,
            fValorCreditado, fVljuros, fVlmulta, fVlDesc : Double; aDataPaga : Tdatetime) : Boolean;
    { Public declarations }
  end;

var
  DM2: TDM2;

implementation

uses Udm, uFuncoes, uCadContaPagar, uFrmManuContasPagar, DateUtils,
  uDmRelatorios;

{$R *.dfm}

procedure TDM2.cdsItensTransfCalcFields(DataSet: TDataSet);
begin
     cdsItensTransfPRT_SUBTOTAL.AsCurrency :=
         cdsItensTransfPRT_QUANTIDADE.AsCurrency *
         cdsItensTransfPRT_VLCOMPRA.AsCurrency; 
end;

procedure TDM2.dspProdutoEntradaGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
      TableName := 'ENTRADAPRODUTO';
end;

procedure TDM2.dspDerivadosGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'DERIVADOS';
end;

procedure TDM2.dspPerdasGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'PERDAS;'
end;

procedure TDM2.dspContasPagarGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONTASPAGAR';
end;

procedure TDM2.dspEntradasGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'ENTRADAS';
end;

procedure TDM2.cdsContasReceberCalcFields(DataSet: TDataSet);
Var
    M_QTDIAS : Double;
begin
     M_QTDIAS := Date() - cdsContasReceberREC_DATAVENCIMENTO.Value;
     //If (cdsDebitoDEB_SITUACAO.AsString = 'A') Then
     If not uFuncoes.Empty(cdsContasReceberREC_DATAPAGAMENTO.AsString) Then
          M_QTDIAS := cdsContasReceberREC_DATAPAGAMENTO.Value - cdsContasReceberREC_DATAVENCIMENTO.Value;
     //
     If (M_QTDIAS < 0) Then
         M_QTDIAS := 0;
     //
     cdsContasReceberREC_ATRASO.AsFloat := M_QTDIAS;
     //
     If (cdsContasReceberREC_SITUACAO.AsString = 'P') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'PRESTAÇÃO PAGA';
     If (cdsContasReceberREC_SITUACAO.AsString = 'C') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'VENDA CANCELA';
     If (cdsContasReceberREC_SITUACAO.AsString = 'A') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'PRESTAÇÃO ABERTA';
     If (cdsContasReceberREC_SITUACAO.AsString = '') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'PRESTAÇÃO ABERTA';
end;

procedure TDM2.cdsParcelasBeforePost(DataSet: TDataSet);
begin
     If (dm2.cdsParcelas.State in [dsInsert, dsEdit]) Then
     begin
        If not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString) Then
        begin
            dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString :=
               uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString,10);
        End;
        //
        If not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_BANCO').AsString)
          and (uFuncoes.LOCALIZAR_BANCO(dm2.cdsParcelas.FieldByName('PAR_BANCO').AsString) = False) Then
        begin
             Application.MessageBox('Código de banco não cadastrado!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dm2.cdsParcelas.FieldByName('PAR_BANCO').Clear;
             Exit;
        End;
     End
end;

procedure TDM2.VALOR_CONTA;
Var
   W_NRPARC : Integer;
   M_VLCONT : Real;
begin
   If (dm2.cdsParcelas.Active  = True) Then
   Begin
     W_NRPARC := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
     //
     dm2.cdsParcelas.DisableControls;
     dm2.cdsParcelas.First;
     M_VLCONT := 0;
     While not (dm2.cdsParcelas.Eof) do
     begin
         dm2.cdsParcelas.Edit;
         //
         If (dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency > 0) Then
               M_VLCONT := M_VLCONT + dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
         dm2.cdsParcelas.Next;
     End;
     //
     dm2.cdsParcelas.Locate('PAR_NRPARCELA',W_NRPARC,[]);
     dm2.cdsParcelas.EnableControls;
     //
     frmCadContasPagar.lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0', M_VLCONT);
  End;
end;

procedure TDM2.cdsContasPagarCalcFields(DataSet: TDataSet);
Var
    M_QTDIAS : Double;
begin
     If (cdsContasPagar.FieldByName('PAG_SITUACAO').AsString = 'A') Then
     begin
         M_QTDIAS := Date() - cdsContasPagar.FieldByName('PAG_DATAVENCIMENTO').AsDateTime;
         cdsContasPagar.FieldByName('PAG_NMSITUACAO').AsString := 'ABERTA';
     End
     Else
     BEgin
         cdsContasPagar.FieldByName('PAG_NMSITUACAO').AsString := 'PAGA';
         M_QTDIAS := cdsContasPagar.FieldByName('PAG_DATAPAGAMENTO').AsDateTime -
                     cdsContasPagar.FieldByName('PAG_DATAVENCIMENTO').AsDateTime;
     End;
     //
     cdsContasPagar.FieldByName('PAG_ATRASO').AsFloat := M_QTDIAS;
     //
End;

procedure TDM2.dspContasReceberGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONTASRECEBER';
end;

procedure TDM2.dspMotDevolucaoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'DEVOLUCAO';
end;

procedure TDM2.dspLotesGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'LOTES';
end;

procedure TDM2.dspCoresGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
      TableName := 'CORES';
end;

procedure TDM2.dspTabPrecosGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'TAB_PRECOS';
end;

procedure TDM2.dspTpClientesGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'TIPOCLIENTE';
end;

procedure TDM2.dspRegioesGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'REGIAO';
end;

procedure TDM2.dspOrcamentosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'ORCAMENTOS';
end;

function TDM2.LISTA_PRODUTOS(M_NRVEND: Integer): boolean;
begin
     With cdsHisProdutos do
      begin
           Active := False;
           CommandText := 'Select H.HIS_PRODUTO, H.HIS_DOCUMENTO, P.PRO_DESCRICAO, H.HIS_UNIDADE, H.HIS_VLVENDA, H.HIS_MOVIMENTO from HISTORICO H ';
           CommandText := CommandText + ' INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO Where (H.HIS_DOCUMENTO = :pDOCUMENTO)';
           Params[0].AsInteger := M_NRVEND;
           Active := True;
           //
           If not (IsEmpty) Then
              Result := True
           Else
              Result := False;
      End;
end;

function TDM2.AddParcelaParaRenegociacao(iloja, iCliente: Integer): Boolean;
Var
    W_VLJURO : DOUBLE;
    M_QTDIAS : Double;
begin
     result := false;
     //
     dm.RefreshCDS(Dm.CdsConfig);
     //
     If not (cdsPCRenegociacao.Active) then
       cdsPCRenegociacao.Open;
     //
     With cdsListaParcelas do
      begin
           Close;
           Params.ParamByName('pCDLOJA').AsInteger   := iloja;
           Params.ParamByName('pCLIENTE').AsInteger := iCliente;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 First;
                 While not (Eof) do
                  begin
                       W_VLJURO := 0;
                       M_QTDIAS := 0;
                       If (FieldByNAme('REC_SITUACAO').AsString = 'A') Then
                          M_QTDIAS  :=   Date() - FieldByNAme('REC_DATAVENCIMENTO').AsDateTime ;
                       //
                       cdsPCRenegociacao.Append;
                       cdsPCRenegociacaoCDS_SEQUENCIA.AsInteger := FIeldByname('REC_SEQUENCIA').AsInteger;
                       cdsPCRenegociacaoCDS_CDLOJA.AsInteger    := iloja;
                       cdsPCRenegociacaoCDS_CREDITO.AsInteger   := FIeldByname('REC_CREDITO').AsInteger;
                       cdsPCRenegociacaoCDS_NRPARCELA.AsInteger := FieldByNAme('REC_PARCELA').AsInteger;
                       cdsPCRenegociacaoCDS_CLIENTE.AsInteger   := iCliente;
                       cdsPCRenegociacaoCDS_DTEMISSAO.AsDateTime := FieldByNAme('REC_DATAEMISSAO').AsDateTime;
                       cdsPCRenegociacaoCDS_DTVENC.AsDateTime   := FieldByNAme('REC_DATAVENCIMENTO').AsDateTime;
                       cdsPCRenegociacaoCDS_VALOR.AsFloat       := FieldByNAme('REC_VALORPARCELA').AsFloat;
                       If (FieldByNAme('REC_DATAVENCIMENTO').AsDateTime < Date()) Then
                       begin
                           cdsPCRenegociacaoCDS_MULTA.AsFloat       := uFuncoes.Arredondar(uFuncoes.Gerapercentual(FieldByNAme('REC_VALORPARCELA').AsFloat, dm.CdsConfigCFG_MULTA.AsFloat),2);
                           W_VLJURO                                 := uFuncoes.Arredondar(uFuncoes.Gerapercentual(FieldByNAme('REC_VALORPARCELA').AsFloat, dm.CdsConfigCFG_JUROS.AsFloat),2);
                           W_VLJURO                                 := uFuncoes.Arredondar(((W_VLJURO / 30) * M_QTDIAS),2);
                           cdsPCRenegociacaoCDS_JUROS.AsFloat       := W_VLJURO;
                       End
                       Else
                       begin
                           cdsPCRenegociacaoCDS_JUROS.AsFloat       := 0;
                           cdsPCRenegociacaoCDS_MULTA.AsFloat       := 0;
                       End;
                       cdsPCRenegociacaoCDS_SITUACAO.AsString   := FieldByNAme('REC_SITUACAO').AsString;
                       cdsPCRenegociacaoCDS_FLRENEG.AsBoolean   := false;
                       cdsPCRenegociacaoCDS_NATUREZA.AsInteger  := FieldByNAme('REC_NATUREZA').AsInteger;
                       cdsPCRenegociacaoCDS_NOSSO_NUMERO.AsString := FieldByNAme('REC_NOSSO_NUMERO').AsString;
                       //
                       cdsPCRenegociacao.Post;
                       //
                       Next;
                  End;

            End;
      End;
      //
      Result := true;
end;

procedure TDM2.cdsPCRenegociacaoCalcFields(DataSet: TDataSet);
begin
     If (cdsPCRenegociacaoCDS_VALOR.AsFloat > 0) Then
      begin
          //
          cdsPCRenegociacaoCSD_VALOR_ATUAL.AsFloat :=
             cdsPCRenegociacaoCDS_VALOR.AsFloat + cdsPCRenegociacaoCDS_JUROS.AsFloat
             + cdsPCRenegociacaoCDS_MULTA.AsFloat;
     End;
     //
     If (cdsPCRenegociacaoCDS_SITUACAO.AsString = 'A') Then
      begin
          cdsPCRenegociacaoCDS_ATRASO.AsFloat  :=
            Date() - cdsPCRenegociacaoCDS_DTVENC.AsDateTime ;
      End;
end;

function TDM2.AddParcelaContaReceber(pLOJA, pCREDITO, pCLIENTE, pNRVENDA,
  pPARCELA, pQTPARCELAS, pNATUREZA, pUSUARIO: Integer; pVALORPARCELA: Double;
  pDESCRICAO, pSITUACAO, pFLBOLETO: String; pDATAEMISSAO,
  pDATAVENCIMENTO, pDTRENEGOCIACAO: TDATETime): Boolean;
Var
   M_SEQREC : integer;
begin
      result := false;
      //
      dm.RefreshCDS(dm.CdsConfig);
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_SEQRECEBER.Value    := dm.CdsConfigCFG_SEQRECEBER.Value+1;
      M_SEQREC := dm.CdsConfigCFG_SEQRECEBER.AsInteger;
      dm.CdsConfig.ApplyUpdates(0);
      //
      With cdsAddCReceber do
       Begin
             Active := False;
             Active := True;
             //
             If (IsEmpty) Then
             Begin
                  //
                  Append;
                  FieldByName('REC_SEQUENCIA').AsInteger := M_SEQREC;
                  FieldByName('REC_CREDITO').AsInteger   := pCREDITO;
                  FieldByName('REC_LOJA').AsInteger      := pLOJA;
                  FieldByName('REC_PARCELA').AsInteger   := pPARCELA;
                  FieldByName('REC_QTPARCELAS').AsInteger   := pQTPARCELAS;
                  FieldByName('REC_CLIENTE').AsInteger      := pCLIENTE;
                  FieldByName('REC_DATAEMISSAO').AsDateTime := pDATAEMISSAO;
                  FieldByName('REC_DATAVENCIMENTO').AsDateTime  := pDATAVENCIMENTO;
                  FieldByName('REC_VALORPARCELA').AsCurrency    := pVALORPARCELA;
                  FieldByName('REC_DESCRICAO').AsString         := pDESCRICAO;
                  FieldByName('REC_SITUACAO').AsString          := 'A';
                  FieldByName('REC_VALORJUROS').AsCurrency      := 0;
                  FieldByName('REC_VALORDESCONTO').AsCurrency   := 0;
                  FieldByName('REC_USUARIO').AsInteger          := pUSUARIO;
                  FieldByName('REC_NATUREZA').AsInteger         := pNATUREZA;
                  FieldByName('REC_NOSSO_NUMERO').AsString      := Dm.GetProximoNumero(pLOJA);
                  FieldByName('REC_SEUNUMERO').AsString         := Dm.GetMesReferencia(pDATAVENCIMENTO);
                  //
                  ApplyUpdates(0);
            End;
       End;
       //
       result := True;
end;

function TDM2.SetParcelaRenegociacao(iSequencia: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := False;
    texto := 'Update CONTASRECEBER set REC_SITUACAO = :pSITUACAO, REC_DTRENEGOCIACAO = :pDATA Where (REC_SEQUENCIA = :pSEQUENCIA)  ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pSEQUENCIA').AsInteger  := iSequencia;
           Params.ParamByName('pSITUACAO').AsString    := 'N';
           Params.ParamByName('pDATA').AsDateTime      := Date();
           ExecSQL();
           Result := True;
     finally
         free;
     end;
end;

function TDM2.BaixaTituloBoleto(iCedente, iUsuario : Integer; aNossoNumero, aArquivo, aTipoBaixa : String;
  fValorPago, fValorCreditado, fVljuros, fVlmulta, fVlDesc: Double; aDataPaga,
  aDataCreditado: Tdatetime): Boolean;
var qraux : TSQLquery;
    texto, aModalidade, M_HOMOVI : string;
    M_DTMOVI : TDatetime;
    iNatureza : Integer;
begin
    result := false;
    //
    M_HOMOVI := Copy(TimetoStr(Time),1,5);
    M_DTMOVI := Date();
    iNatureza   := Dm.GetCodigoNatureza('BAIXA DE TITULO');
    If (aTipoBaixa = 'B') Then
       aModalidade := InttoStr(Dm.GetCodigoModalidade('BOLETO BANCARIO'))
    Else
       aModalidade := '1';
    //
    texto := 'Update CONTASRECEBER set REC_SITUACAO = :pSITUACAO, REC_DATAPAGAMENTO = :pDTPAGA, REC_PAGO = :pVLPAGO, REC_VLLIQUIDO = :pVLLIQUIDO, REC_TIPOMODALIDADE = :pTPMODALIDADE, ';
    texto := texto + 'REC_DATA_CREDITO = :pDTCREDITO, REC_FORMABAIXA = :pFMBAIXA, REC_NMARQUIVO = :pNMARQUIVO, ';
    texto := texto + 'REC_VALORJUROS = :pJUROS, REC_VALORDESCONTO = :pDESCONTO, REC_VLMULTA = :pMULTA ';
    texto := texto + 'Where (REC_NOSSO_NUMERO = :pNOSSONUMERO) and (REC_CDCEDENTE = :pCDCEDENTE)';
    //
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
         Dm.Start;
         try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pNOSSONUMERO').AsString  := aNossoNumero;
           Params.ParamByName('pCDCEDENTE').AsInteger   := iCedente;
           //
           Params.ParamByName('pSITUACAO').AsString     := 'P';
           Params.ParamByName('pDTPAGA').AsDateTime     := aDataPaga;
           Params.ParamByName('pVLPAGO').AsFloat        := fValorPago;
           Params.ParamByName('pVLLIQUIDO').AsFloat     := fValorCreditado;
           Params.ParamByName('pJUROS').AsFloat         := fVljuros;
           Params.ParamByName('pDESCONTO').AsFloat      := fVlDesc;
           Params.ParamByName('pMULTA').AsFloat         := fVlmulta;
           //
           If (aTipoBaixa = 'B') Then
               Params.ParamByName('pTPMODALIDADE').AsInteger := Dm.GetCodigoModalidade('BOLETO BANCARIO')  // modalidade - baixa de boleto
           Else
               Params.ParamByName('pTPMODALIDADE').AsInteger := 1;
           Params.ParamByName('pDTCREDITO').AsDateTime  := aDataCreditado;
           Params.ParamByName('pFMBAIXA').AsString      := aTipoBaixa;
           Params.ParamByName('pNMARQUIVO').AsString    := aArquivo;
           //
           ExecSQL();
           //
           Dm.Comit(Dm.Transc);
           // Movimento de caixa
           //  Incluir Movimento de Caixa
           // Loja, Nr.Venda, Cod.Caixa, Cod.Natureza, TipoMov, Hora, Modalidade - 1 Dinheiro,
           // Situação, Observação, DataMov, Valor Modalidade, Valor Pago, Troco
           Dm.Incluir_Movimento_Caixa(iCedente, 0, iUsuario, iNatureza, 'R', M_HOMOVI, aModalidade,
               'N', 'BAIXA DE BOLETO: ' +aNossoNumero, M_DTMOVI, fValorPago, fValorPago, 0);
           //
           Result := True;
         Except
             Dm.Rollback;
         End;
     finally
         free;
     end;
end;

function TDM2.BaixaTituloManual(iSequencia, iCedente, iUsuario: Integer;
  aTipoBaixa: String; fValorPago, fValorCreditado, fVljuros, fVlmulta,
  fVlDesc: Double; aDataPaga: Tdatetime): Boolean;
var qraux : TSQLquery;
    texto, aModalidade, M_HOMOVI : string;
    M_DTMOVI : TDatetime;
    iNatureza : Integer;
begin
    result := false;
    //
    M_HOMOVI := Copy(TimetoStr(Time),1,5);
    M_DTMOVI := Date();
    iNatureza   := Dm.GetCodigoNatureza('BAIXA DE TITULO');
    If (aTipoBaixa = 'B') Then
       aModalidade := InttoStr(Dm.GetCodigoModalidade('BOLETO BANCARIO'))
    Else
       aModalidade := '1';
    //
    texto := 'Update CONTASRECEBER set REC_SITUACAO = :pSITUACAO, REC_DATAPAGAMENTO = :pDTPAGA, REC_PAGO = :pVLPAGO, REC_VLLIQUIDO = :pVLLIQUIDO, REC_TIPOMODALIDADE = :pTPMODALIDADE, ';
    texto := texto + 'REC_DATA_CREDITO = :pDTCREDITO, REC_FORMABAIXA = :pFMBAIXA, ';
    texto := texto + 'REC_VALORJUROS = :pJUROS, REC_VALORDESCONTO = :pDESCONTO, REC_VLMULTA = :pMULTA ';
    texto := texto + 'Where (REC_SEQUENCIA = :pSEQUENCIA) and (REC_SITUACAO = :pSITUACAO2)';
    //
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
         Dm.Start;
         try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pSEQUENCIA').AsInteger := iSequencia;
           Params.ParamByName('pSITUACAO2').AsString  := 'A';
           //Params.ParamByName('pCDCEDENTE').AsInteger   := iCedente;
           //
           Params.ParamByName('pSITUACAO').AsString     := 'P';
           Params.ParamByName('pDTPAGA').AsDateTime     := aDataPaga;
           Params.ParamByName('pDTCREDITO').AsDateTime  := aDataPaga;
           Params.ParamByName('pVLPAGO').AsFloat        := fValorPago;
           Params.ParamByName('pVLLIQUIDO').AsFloat     := fValorCreditado;
           Params.ParamByName('pJUROS').AsFloat         := fVljuros;
           Params.ParamByName('pDESCONTO').AsFloat      := fVlDesc;
           Params.ParamByName('pMULTA').AsFloat         := fVlmulta;
           //
           If (aTipoBaixa = 'B') Then
               Params.ParamByName('pTPMODALIDADE').AsInteger := Dm.GetCodigoModalidade('BOLETO BANCARIO')  // modalidade - baixa de boleto
           Else
               Params.ParamByName('pTPMODALIDADE').AsInteger := 1;
           Params.ParamByName('pFMBAIXA').AsString      := aTipoBaixa;
           //
           ExecSQL();
           //
           Dm.Comit(Dm.Transc);
           // Movimento de caixa
           //  Incluir Movimento de Caixa
           // Loja, Nr.Venda, Cod.Caixa, Cod.Natureza, TipoMov, Hora, Modalidade - 1 Dinheiro,
           // Situação, Observação, DataMov, Valor Modalidade, Valor Pago, Troco
           Dm.Incluir_Movimento_Caixa(iCedente, 0, iUsuario, iNatureza, 'R', M_HOMOVI, aModalidade,
               'N', 'BAIXA DE BOLETO MANUAL : ' + InttoStr(iSequencia) , M_DTMOVI, fValorPago, fValorPago, 0);
           //
           Result := True;
         Except
             Dm.Rollback;
         End;
     finally
         free;
     end;
end;

end.
