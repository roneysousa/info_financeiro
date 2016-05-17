unit Udm;

interface


uses
  StdCtrls, SysUtils, Classes, DBXpress, FMTBcd, SqlExpr, DB, DBClient, Provider, Forms,
  Windows, ppDB, ppComm, ppRelatv, ppDBPipe, Dialogs, AppEvnts, MidasLib, controls,
  DBTables, inifiles;

type
  TTypeLocalizar = (fsInteger, fsString);
  TDm = class(TDataModule)
    DsEmpresas: TDataSource;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    SdsEmpresas: TSQLDataSet;
    CdsEmpresasEMP_FANTASIA: TStringField;
    CdsEmpresasEMP_RAZAO: TStringField;
    CdsEmpresasEMP_ENDERECO: TStringField;
    CdsEmpresasEMP_NUMERO: TIntegerField;
    CdsEmpresasBAI_CODIGO: TIntegerField;
    CdsEmpresasCID_CODIGO: TIntegerField;
    CdsEmpresasEMP_CNPJ: TStringField;
    DsCidades: TDataSource;
    CdsCidades: TClientDataSet;
    DspCidades: TDataSetProvider;
    SdsCidades: TSQLDataSet;
    SdsBairros: TSQLDataSet;
    SdsClientes: TSQLDataSet;
    SdsContatos: TSQLDataSet;
    DsBairros: TDataSource;
    DsClientes: TDataSource;
    DsContatos: TDataSource;
    CdsBairros: TClientDataSet;
    CdsClientes: TClientDataSet;
    CdsContatos: TClientDataSet;
    DspBairros: TDataSetProvider;
    DspClientes: TDataSetProvider;
    DspContatos: TDataSetProvider;
    CdsCidadesCID_CODIGO: TIntegerField;
    CdsCidadesCID_NOME: TStringField;
    CdsCidadesCID_UF: TStringField;
    CdsContatosCLI_CODIGO: TIntegerField;
    CdsContatosCON_CODIGO: TIntegerField;
    CdsContatosCON_NOME: TStringField;
    CdsContatosCON_DATANASC: TDateField;
    CdsContatosCON_FONE: TStringField;
    CdsContatosCON_CELULAR: TStringField;
    CdsContatosCAR_CODIGO: TIntegerField;
    SdsAtividades: TSQLDataSet;
    DspAtividades: TDataSetProvider;
    CdsAtividades: TClientDataSet;
    DsAtividades: TDataSource;
    CdsConfig: TClientDataSet;
    DsConfig: TDataSource;
    DspConfig: TDataSetProvider;
    SdsConfig: TSQLDataSet;
    CdsConfigCFG_CLIENTE: TIntegerField;
    CdsClientesCLI_FANTASIA: TStringField;
    CdsClientesCLI_RAZAO: TStringField;
    CdsClientesCLI_ENDERECO: TStringField;
    CdsClientesCLI_NUMERO: TIntegerField;
    CdsClientesCLI_CEP: TStringField;
    CdsClientesBAI_CODIGO: TIntegerField;
    CdsClientesCID_CODIGO: TIntegerField;
    CdsClientesCLI_FONE1: TStringField;
    CdsClientesCLI_FONE2: TStringField;
    CdsClientesCLI_FONE3: TStringField;
    CdsClientesCLI_RAMAL1: TStringField;
    CdsClientesCLI_RAMAL2: TStringField;
    CdsClientesCLI_RAMAL3: TStringField;
    CdsClientesCLI_FAX: TStringField;
    CdsClientesCLI_CGC: TStringField;
    CdsClientesCLI_INSCESTADUAL: TStringField;
    CdsClientesCLI_DATACAD: TDateField;
    CdsClientesSIT_CODIGO: TIntegerField;
    CdsClientesCLI_PAGINA: TStringField;
    CdsClientesATI_CODIGO: TIntegerField;
    DsSituacao: TDataSource;
    CdsSituacao: TClientDataSet;
    DspSituacao: TDataSetProvider;
    SdsSituacao: TSQLDataSet;
    DsCargos: TDataSource;
    CdsCargos: TClientDataSet;
    DspCargos: TDataSetProvider;
    SdsCargos: TSQLDataSet;
    CdsContatosCON_CARGO: TStringField;
    SqlAdmin: TSQLConnection;
    dstFornecedor: TSQLDataSet;
    dspFornecedor: TDataSetProvider;
    cdsFornecedor: TClientDataSet;
    dsFornecedor: TDataSource;
    dstFornecedorFOR_CODIGO: TIntegerField;
    dstFornecedorFOR_FANTASIA: TStringField;
    dstFornecedorFOR_RAZAO: TStringField;
    dstFornecedorFOR_CNPJ: TStringField;
    dstFornecedorFOR_INSCESTADUAL: TStringField;
    dstFornecedorFOR_ENDERECO: TStringField;
    dstFornecedorFOR_NUMERO: TIntegerField;
    dstFornecedorFOR_CEP: TStringField;
    dstFornecedorFOR_BAIRRO: TStringField;
    dstFornecedorFOR_CIDADE: TStringField;
    dstFornecedorFOR_UF: TStringField;
    dstFornecedorFOR_FONE1: TStringField;
    dstFornecedorFOR_FONE2: TStringField;
    dstFornecedorFOR_OPERACAO: TIntegerField;
    dstFornecedorFOR_CONTA: TIntegerField;
    dstFornecedorFOR_CONTATO1: TStringField;
    dstFornecedorFOR_CARGO1: TStringField;
    dstFornecedorFOR_FONECON1: TStringField;
    dstFornecedorFOR_CONTATO2: TStringField;
    dstFornecedorFOR_CARGO2: TStringField;
    dstFornecedorFOR_FONECON2: TStringField;
    cdsFornecedorFOR_CODIGO: TIntegerField;
    cdsFornecedorFOR_FANTASIA: TStringField;
    cdsFornecedorFOR_RAZAO: TStringField;
    cdsFornecedorFOR_CNPJ: TStringField;
    cdsFornecedorFOR_INSCESTADUAL: TStringField;
    cdsFornecedorFOR_ENDERECO: TStringField;
    cdsFornecedorFOR_NUMERO: TIntegerField;
    cdsFornecedorFOR_CEP: TStringField;
    cdsFornecedorFOR_BAIRRO: TStringField;
    cdsFornecedorFOR_CIDADE: TStringField;
    cdsFornecedorFOR_UF: TStringField;
    cdsFornecedorFOR_FONE1: TStringField;
    cdsFornecedorFOR_FONE2: TStringField;
    cdsFornecedorFOR_OPERACAO: TIntegerField;
    cdsFornecedorFOR_CONTA: TIntegerField;
    cdsFornecedorFOR_CONTATO1: TStringField;
    cdsFornecedorFOR_CARGO1: TStringField;
    cdsFornecedorFOR_FONECON1: TStringField;
    cdsFornecedorFOR_CONTATO2: TStringField;
    cdsFornecedorFOR_CARGO2: TStringField;
    cdsFornecedorFOR_FONECON2: TStringField;
    CdsClientesCLI_CODIGO: TIntegerField;
    CdsConfigCFG_FORNECEDOR: TIntegerField;
    dstFornecedorFOR_SITE: TStringField;
    dstFornecedorFOR_EMAIL: TStringField;
    dstFornecedorFOR_CDBANC: TStringField;
    cdsFornecedorFOR_SITE: TStringField;
    cdsFornecedorFOR_EMAIL: TStringField;
    cdsFornecedorFOR_CDBANC: TStringField;
    dstBancos: TSQLDataSet;
    dspBancos: TDataSetProvider;
    cdsBancos: TClientDataSet;
    dstBancosBAN_CODIGO: TStringField;
    dstBancosBAN_NOME: TStringField;
    cdsBancosBAN_CODIGO: TStringField;
    cdsBancosBAN_NOME: TStringField;
    cdsFornecedorFOR_NMBANC: TStringField;
    dstFornecedorFOR_AGENCIA: TStringField;
    cdsFornecedorFOR_AGENCIA: TStringField;
    CdsConfigCFG_CIDADE: TIntegerField;
    CdsConfigCGF_BAIRRO: TIntegerField;
    CdsBairrosBAI_CODIGO: TIntegerField;
    CdsBairrosBAI_NOME: TStringField;
    SdsCargosCAR_CODIGO: TIntegerField;
    SdsCargosCAR_NOME: TStringField;
    CdsCargosCAR_CODIGO: TIntegerField;
    CdsCargosCAR_NOME: TStringField;
    CdsConfigCFG_CARGO: TIntegerField;
    SdsSituacaoSIT_CODIGO: TIntegerField;
    SdsSituacaoSIT_NOME: TStringField;
    CdsSituacaoSIT_CODIGO: TIntegerField;
    CdsSituacaoSIT_NOME: TStringField;
    CdsConfigCFG_SITUACAO: TIntegerField;
    SdsAtividadesATI_CODIGO: TIntegerField;
    SdsAtividadesATI_NOME: TStringField;
    CdsAtividadesATI_CODIGO: TIntegerField;
    CdsAtividadesATI_NOME: TStringField;
    CdsConfigCFG_ATIVIDADE: TIntegerField;
    SdsContatosCLI_CODIGO: TIntegerField;
    SdsContatosCON_CODIGO: TIntegerField;
    SdsContatosCON_NOME: TStringField;
    SdsContatosCON_DATANASC: TDateField;
    SdsContatosCON_FONE: TStringField;
    SdsContatosCON_CELULAR: TStringField;
    SdsContatosCAR_CODIGO: TIntegerField;
    CdsConfigCFG_CONTATO: TIntegerField;
    CdsBairrosCID_CODIGO: TIntegerField;
    CdsBairrosCID_NOME: TStringField;
    dstUnidades: TSQLDataSet;
    dspUnidades: TDataSetProvider;
    dstUnidadesUNI_CODIGO: TStringField;
    dstUnidadesUNI_DESCRICAO: TStringField;
    cdsUnidades: TClientDataSet;
    cdsUnidadesUNI_CODIGO: TStringField;
    cdsUnidadesUNI_DESCRICAO: TStringField;
    dsSecao: TDataSource;
    dstSecao: TSQLDataSet;
    dstSecaoSEC_CODIGO: TIntegerField;
    dstSecaoSEC_DESCRICAO: TStringField;
    dspSecao: TDataSetProvider;
    cdsSecao: TClientDataSet;
    cdsSecaoSEC_CODIGO: TIntegerField;
    cdsSecaoSEC_DESCRICAO: TStringField;
    CdsConfigCFG_PRODUTO: TIntegerField;
    CdsConfigCFG_SECAO: TIntegerField;
    CdsConfigCFG_SUBSECAO: TIntegerField;
    CdsConfigCFG_TRIBUTACAO: TIntegerField;
    dstSubSecao: TSQLDataSet;
    dspSubSecao: TDataSetProvider;
    cdsSubSecao: TClientDataSet;
    dsSubSecao: TDataSource;
    dstSubSecaoSUB_CODIGO: TIntegerField;
    dstSubSecaoSUB_DESCRICAO: TStringField;
    cdsSubSecaoSUB_CODIGO: TIntegerField;
    cdsSubSecaoSUB_DESCRICAO: TStringField;
    dstSubSecaoSEC_CODIGO: TIntegerField;
    cdsSubSecaoSEC_CODIGO: TIntegerField;
    cdsSubSecaoSEC_NOME: TStringField;
    dstTributacao: TSQLDataSet;
    dspTributacao: TDataSetProvider;
    cdsTributacao: TClientDataSet;
    cdsTributacaoTRI_CODIGO: TIntegerField;
    cdsTributacaoTRI_DESCRICAO: TStringField;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    dstProdutosPRO_CODIGO: TStringField;
    dstProdutosPRO_BARRAS: TStringField;
    dstProdutosPRO_DESCRICAO: TStringField;
    dstProdutosPRO_APLICACAO: TStringField;
    dstProdutosFOR_CODIGO: TIntegerField;
    dstProdutosPRO_FRACAO: TIntegerField;
    dstProdutosSEC_CODIGO: TIntegerField;
    dstProdutosSUB_CODIGO: TIntegerField;
    dstProdutosPRO_VLCOMPRA: TFMTBCDField;
    dstProdutosPRO_VLCUSTO: TFMTBCDField;
    dstProdutosPRO_VLVENDA: TFMTBCDField;
    dstProdutosPRO_VLFRACAO: TFMTBCDField;
    dstProdutosTRI_CODIGO: TIntegerField;
    dstProdutosPRO_REDUCAOICMS: TFMTBCDField;
    dstProdutosPRO_TAXAS: TFMTBCDField;
    dstProdutosPRO_IPI: TFMTBCDField;
    dstProdutosPRO_FRETE: TFMTBCDField;
    dstProdutosPRO_COMISSIONADO: TStringField;
    dstProdutosPRO_DTCADASTRO: TDateField;
    dstProdutosPRO_DTALTERACAO: TDateField;
    dstProdutosPRO_FOTO: TBlobField;
    dstProdutosPRO_OBSERVACAO: TMemoField;
    dstProdutosSEN_CODIGO: TIntegerField;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_BARRAS: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosPRO_APLICACAO: TStringField;
    cdsProdutosFOR_CODIGO: TIntegerField;
    cdsProdutosPRO_FRACAO: TIntegerField;
    cdsProdutosSEC_CODIGO: TIntegerField;
    cdsProdutosSUB_CODIGO: TIntegerField;
    cdsProdutosPRO_VLCOMPRA: TFMTBCDField;
    cdsProdutosPRO_VLCUSTO: TFMTBCDField;
    cdsProdutosPRO_VLVENDA: TFMTBCDField;
    cdsProdutosPRO_VLFRACAO: TFMTBCDField;
    cdsProdutosTRI_CODIGO: TIntegerField;
    cdsProdutosPRO_REDUCAOICMS: TFMTBCDField;
    cdsProdutosPRO_TAXAS: TFMTBCDField;
    cdsProdutosPRO_IPI: TFMTBCDField;
    cdsProdutosPRO_FRETE: TFMTBCDField;
    cdsProdutosPRO_COMISSIONADO: TStringField;
    cdsProdutosPRO_DTCADASTRO: TDateField;
    cdsProdutosPRO_DTALTERACAO: TDateField;
    cdsProdutosPRO_FOTO: TBlobField;
    cdsProdutosPRO_OBSERVACAO: TMemoField;
    cdsProdutosSEN_CODIGO: TIntegerField;
    cdsProdutosSEC_NOME: TStringField;
    cdsProdutosSUB_NOME: TStringField;
    dstTributacaoTRI_CODIGO: TIntegerField;
    dstTributacaoTRI_DESCRICAO: TStringField;
    cdsProdutosTRI_NOME: TStringField;
    dstProdutosUNI_CODIGO: TStringField;
    dstProdutosUNI_ARMAZENAMENTO: TStringField;
    cdsProdutosUNI_CODIGO: TStringField;
    cdsProdutosUNI_ARMAZENAMENTO: TStringField;
    dstBusca: TSQLDataSet;
    dspBusca: TDataSetProvider;
    cdsBusca: TClientDataSet;
    dsBusca: TDataSource;
    dstEntrada: TSQLDataSet;
    dspEntrada: TDataSetProvider;
    cdsEntrada: TClientDataSet;
    dsEntrada: TDataSource;
    dstEntradaENT_NUMERO: TIntegerField;
    dstEntradaENT_LOJA: TIntegerField;
    dstEntradaFOR_CODIGO: TIntegerField;
    dstEntradaENT_DTPEDIDO: TDateField;
    dstEntradaENT_DTEMISSAO: TDateField;
    dstEntradaENT_DTRECEBIMENTO: TDateField;
    dstEntradaCFO_CODIGO: TStringField;
    dstEntradaENT_NRNOTA: TIntegerField;
    dstEntradaENT_SERIENOTA: TStringField;
    dstEntradaENT_VALORMERCADORIA: TFMTBCDField;
    dstEntradaENT_TIPOFRETE: TStringField;
    dstEntradaENT_VALORFRETE: TFMTBCDField;
    dstEntradaENT_BASEICMS: TFMTBCDField;
    dstEntradaENT_BASESUBSTITUICAO: TFMTBCDField;
    dstEntradaENT_VALORSUBSTITUICAO: TFMTBCDField;
    dstEntradaENT_VALORIPI: TFMTBCDField;
    dstEntradaENT_VALORSEGURO: TFMTBCDField;
    dstEntradaENT_VALORDESPESAS: TFMTBCDField;
    dstEntradaENT_VALORNOTA: TFMTBCDField;
    dstEntradaENT_VALORDESCONTO: TFMTBCDField;
    dstEntradaENT_SITUACAO: TStringField;
    dstEntradaSEN_CODIGO: TIntegerField;
    cdsEntradaENT_NUMERO: TIntegerField;
    cdsEntradaENT_LOJA: TIntegerField;
    cdsEntradaFOR_CODIGO: TIntegerField;
    cdsEntradaENT_DTPEDIDO: TDateField;
    cdsEntradaENT_DTEMISSAO: TDateField;
    cdsEntradaENT_DTRECEBIMENTO: TDateField;
    cdsEntradaCFO_CODIGO: TStringField;
    cdsEntradaENT_NRNOTA: TIntegerField;
    cdsEntradaENT_SERIENOTA: TStringField;
    cdsEntradaENT_VALORMERCADORIA: TFMTBCDField;
    cdsEntradaENT_TIPOFRETE: TStringField;
    cdsEntradaENT_VALORFRETE: TFMTBCDField;
    cdsEntradaENT_BASEICMS: TFMTBCDField;
    cdsEntradaENT_BASESUBSTITUICAO: TFMTBCDField;
    cdsEntradaENT_VALORSUBSTITUICAO: TFMTBCDField;
    cdsEntradaENT_VALORIPI: TFMTBCDField;
    cdsEntradaENT_VALORSEGURO: TFMTBCDField;
    cdsEntradaENT_VALORDESPESAS: TFMTBCDField;
    cdsEntradaENT_VALORNOTA: TFMTBCDField;
    cdsEntradaENT_VALORDESCONTO: TFMTBCDField;
    cdsEntradaENT_SITUACAO: TStringField;
    cdsEntradaSEN_CODIGO: TIntegerField;
    CdsEmpresasEMP_CODIGO: TIntegerField;
    SdsEmpresasEMP_CODIGO: TIntegerField;
    SdsEmpresasEMP_CNPJ: TStringField;
    SdsEmpresasEMP_FANTASIA: TStringField;
    SdsEmpresasEMP_RAZAO: TStringField;
    SdsEmpresasEMP_ENDERECO: TStringField;
    SdsEmpresasEMP_NUMERO: TIntegerField;
    SdsEmpresasBAI_CODIGO: TIntegerField;
    SdsEmpresasCID_CODIGO: TIntegerField;
    cdsEntradaEMP_NOME: TStringField;
    cdsEntradaFOR_NOME: TStringField;
    dstEntradaProduto: TSQLDataSet;
    dspEntradaProduto: TDataSetProvider;
    cdsEntradaProduto: TClientDataSet;
    dstEntradaProdutoENP_NUMERO: TIntegerField;
    dstEntradaProdutoPRO_CODIGO: TStringField;
    dstEntradaProdutoUNI_UNIDADE: TStringField;
    dstEntradaProdutoENP_QUANTIDADE: TFMTBCDField;
    dstEntradaProdutoENP_VALOR: TFMTBCDField;
    dstEntradaProdutoENP_IPI: TFMTBCDField;
    dstEntradaProdutoENP_ICMS: TFMTBCDField;
    cdsEntradaProdutoENP_NUMERO: TIntegerField;
    cdsEntradaProdutoPRO_CODIGO: TStringField;
    cdsEntradaProdutoUNI_UNIDADE: TStringField;
    cdsEntradaProdutoENP_QUANTIDADE: TFMTBCDField;
    cdsEntradaProdutoENP_VALOR: TFMTBCDField;
    cdsEntradaProdutoENP_IPI: TFMTBCDField;
    cdsEntradaProdutoENP_ICMS: TFMTBCDField;
    dstEntradaProdutoPRO_NOME: TStringField;
    dstEntradaProdutoUNI_DESCRICAO: TStringField;
    cdsEntradaProdutoPRO_NOME: TStringField;
    cdsEntradaProdutoUNI_DESCRICAO: TStringField;
    dstEntradaProdutoENP_TOTAL: TCurrencyField;
    CdsConfigCFG_EMPRESA: TIntegerField;
    CdsConfigCFG_ENTRADA: TIntegerField;
    qryEntrada: TSQLQuery;
    cdsEntradaProdutoENP_TOTAL: TCurrencyField;
    dstEntradaProdutoENP_SUBTOTAL: TFMTBCDField;
    cdsEntradaProdutoENP_SUBTOTAL: TFMTBCDField;
    dstFuncionarios: TSQLDataSet;
    dspFuncionarios: TDataSetProvider;
    cdsFuncionarios: TClientDataSet;
    dsFuncionarios: TDataSource;
    dstFuncionariosFUN_CODIGO: TIntegerField;
    dstFuncionariosFUN_NOME: TStringField;
    dstFuncionariosFUN_ENDERECO: TStringField;
    dstFuncionariosFUN_BAIRRO: TStringField;
    dstFuncionariosFUN_CIDADE: TStringField;
    dstFuncionariosFUN_UFFUNC: TStringField;
    dstFuncionariosFUN_NATUREZA: TStringField;
    dstFuncionariosFUN_CEP: TStringField;
    dstFuncionariosFUN_FONE: TStringField;
    dstFuncionariosFUN_TPFUNC: TStringField;
    dstFuncionariosFUN_PECOMI: TFMTBCDField;
    dstFuncionariosFUN_DTADMICAO: TDateField;
    dstFuncionariosFUN_DTDEMICAO: TDateField;
    dstFuncionariosFUN_VLDEBITO: TFMTBCDField;
    dstFuncionariosFUN_CPFCGC: TStringField;
    dstFuncionariosFUN_IDENTIDADE: TStringField;
    dstFuncionariosFUN_ORIDEN: TStringField;
    dstFuncionariosFUN_UFIDEN: TStringField;
    dstFuncionariosFUN_NRCART: TStringField;
    dstFuncionariosFUN_SECART: TStringField;
    dstFuncionariosFUN_UFCART: TStringField;
    dstFuncionariosFUN_CAREMI: TStringField;
    dstFuncionariosFUN_TITULO: TStringField;
    dstFuncionariosFUN_CDSECA: TStringField;
    dstFuncionariosFUN_CDZONA: TStringField;
    dstFuncionariosFUN_ESTCIVIL: TStringField;
    dstFuncionariosFUN_VLSALA: TFMTBCDField;
    dstFuncionariosFUN_LIONIB: TStringField;
    dstFuncionariosFUN_HOENT1: TStringField;
    dstFuncionariosFUN_HOSAI1: TStringField;
    dstFuncionariosFUN_HOENT2: TStringField;
    dstFuncionariosFUN_HOSAI2: TStringField;
    dstFuncionariosFUN_NOMPAI: TStringField;
    dstFuncionariosFUN_NOMMAE: TStringField;
    dstFuncionariosFUN_COMPO1: TStringField;
    dstFuncionariosFUN_COMPO2: TStringField;
    dstFuncionariosFUN_COMPO3: TStringField;
    dstFuncionariosFUN_ASSID1: TStringField;
    dstFuncionariosFUN_ASSID2: TStringField;
    dstFuncionariosFUN_ASSID3: TStringField;
    dstFuncionariosFUN_HONES1: TStringField;
    dstFuncionariosFUN_HONES2: TStringField;
    dstFuncionariosFUN_HONES3: TStringField;
    dstFuncionariosFUN_CARAT1: TStringField;
    dstFuncionariosFUN_CARAT2: TStringField;
    dstFuncionariosFUN_CARAT3: TStringField;
    dstFuncionariosFUN_COMPR1: TMemoField;
    dstFuncionariosFUN_RESPO1: TMemoField;
    dstFuncionariosFUN_ATEST1: TMemoField;
    cdsFuncionariosFUN_CODIGO: TIntegerField;
    cdsFuncionariosFUN_NOME: TStringField;
    cdsFuncionariosFUN_ENDERECO: TStringField;
    cdsFuncionariosFUN_BAIRRO: TStringField;
    cdsFuncionariosFUN_CIDADE: TStringField;
    cdsFuncionariosFUN_UFFUNC: TStringField;
    cdsFuncionariosFUN_NATUREZA: TStringField;
    cdsFuncionariosFUN_CEP: TStringField;
    cdsFuncionariosFUN_FONE: TStringField;
    cdsFuncionariosFUN_TPFUNC: TStringField;
    cdsFuncionariosFUN_DTADMICAO: TDateField;
    cdsFuncionariosFUN_DTDEMICAO: TDateField;
    cdsFuncionariosFUN_VLDEBITO: TFMTBCDField;
    cdsFuncionariosFUN_CPFCGC: TStringField;
    cdsFuncionariosFUN_IDENTIDADE: TStringField;
    cdsFuncionariosFUN_ORIDEN: TStringField;
    cdsFuncionariosFUN_UFIDEN: TStringField;
    cdsFuncionariosFUN_NRCART: TStringField;
    cdsFuncionariosFUN_SECART: TStringField;
    cdsFuncionariosFUN_UFCART: TStringField;
    cdsFuncionariosFUN_CAREMI: TStringField;
    cdsFuncionariosFUN_TITULO: TStringField;
    cdsFuncionariosFUN_CDSECA: TStringField;
    cdsFuncionariosFUN_CDZONA: TStringField;
    cdsFuncionariosFUN_ESTCIVIL: TStringField;
    cdsFuncionariosFUN_VLSALA: TFMTBCDField;
    cdsFuncionariosFUN_LIONIB: TStringField;
    cdsFuncionariosFUN_HOENT1: TStringField;
    cdsFuncionariosFUN_HOSAI1: TStringField;
    cdsFuncionariosFUN_HOENT2: TStringField;
    cdsFuncionariosFUN_HOSAI2: TStringField;
    cdsFuncionariosFUN_NOMPAI: TStringField;
    cdsFuncionariosFUN_NOMMAE: TStringField;
    cdsFuncionariosFUN_COMPO1: TStringField;
    cdsFuncionariosFUN_COMPO2: TStringField;
    cdsFuncionariosFUN_COMPO3: TStringField;
    cdsFuncionariosFUN_ASSID1: TStringField;
    cdsFuncionariosFUN_ASSID2: TStringField;
    cdsFuncionariosFUN_ASSID3: TStringField;
    cdsFuncionariosFUN_HONES1: TStringField;
    cdsFuncionariosFUN_HONES2: TStringField;
    cdsFuncionariosFUN_HONES3: TStringField;
    cdsFuncionariosFUN_CARAT1: TStringField;
    cdsFuncionariosFUN_CARAT2: TStringField;
    cdsFuncionariosFUN_CARAT3: TStringField;
    cdsFuncionariosFUN_COMPR1: TMemoField;
    cdsFuncionariosFUN_RESPO1: TMemoField;
    cdsFuncionariosFUN_ATEST1: TMemoField;
    dstFuncionariosFUN_DTNASCIMENTO: TDateField;
    cdsFuncionariosFUN_DTNASCIMENTO: TDateField;
    dstFuncionariosFUN_FUNCAO: TStringField;
    cdsFuncionariosFUN_FUNCAO: TStringField;
    CdsConfigCFG_FUNCIONARIO: TIntegerField;
    dstFuncionariosFUN_RGEMIS: TDateField;
    cdsFuncionariosFUN_RGEMIS: TDateField;
    dstFuncionariosFUN_FOTO: TBlobField;
    cdsFuncionariosFUN_FOTO: TBlobField;
    dstDebito: TSQLDataSet;
    dspDebito: TDataSetProvider;
    cdsDebito: TClientDataSet;
    dstDebitoDEB_LOJA: TIntegerField;
    dstDebitoDEB_NRCREDITO: TIntegerField;
    dstDebitoCLI_CODIGO: TIntegerField;
    dstDebitoDEB_MATRICULA: TStringField;
    dstDebitoDEB_VENDA: TIntegerField;
    dstDebitoDEB_PARCELA: TStringField;
    dstDebitoDEB_QTPARCELA: TIntegerField;
    dstDebitoDEB_DESCRICAO: TStringField;
    dstDebitoDEB_NRNOTA: TStringField;
    dstDebitoDEB_SERIENOTA: TStringField;
    dstDebitoMOD_CODIGO: TIntegerField;
    dstDebitoDEB_DTMOVIMENTO: TDateField;
    dstDebitoDEB_DTVENCIMENTO: TDateField;
    dstDebitoDEB_DTPAGAMENTO: TDateField;
    dstDebitoDEB_PEJUROS: TFMTBCDField;
    dstDebitoDEB_VLJUROS: TFMTBCDField;
    dstDebitoDEB_VLDESCONTO: TFMTBCDField;
    dstDebitoDEB_VLPARCELA: TFMTBCDField;
    dstDebitoDEB_VLPAGO: TFMTBCDField;
    dstDebitoDEB_VLRESTANTE: TFMTBCDField;
    dstDebitoDEB_TOVENDA: TFMTBCDField;
    dstDebitoDEB_SITUACAO: TStringField;
    dstDebitoSEN_CODIGO: TIntegerField;
    dstDebitoDEB_FLCHEQUE: TStringField;
    dstDebitoDEB_NRCHEQUE: TStringField;
    dstDebitoBAN_COGIGO: TStringField;
    dstDebitoDEB_NRAGENCIA: TStringField;
    dstDebitoDEB_NRBOLETO: TStringField;
    dstDebitoDEB_NRCONC: TStringField;
    dstDebitoDEB_FLEXCLUSAO: TStringField;
    dstDebitoDEB_DTEXCLUSAO: TDateField;
    dstDebitoDEB_USUAEXCLUIO: TIntegerField;
    dstDebitoDEB_DTALTERACAO: TDateField;
    dstDebitoDEB_MOTIVOEXCLUSAO: TStringField;
    dstDebitoDEB_NRRENE: TIntegerField;
    dstDebitoDEB_DTRENE: TDateField;
    dstDebitoDEB_RENACR: TFMTBCDField;
    dstDebitoDEB_RENDES: TFMTBCDField;
    cdsDebitoDEB_LOJA: TIntegerField;
    cdsDebitoDEB_NRCREDITO: TIntegerField;
    cdsDebitoCLI_CODIGO: TIntegerField;
    cdsDebitoDEB_MATRICULA: TStringField;
    cdsDebitoDEB_VENDA: TIntegerField;
    cdsDebitoDEB_PARCELA: TStringField;
    cdsDebitoDEB_QTPARCELA: TIntegerField;
    cdsDebitoDEB_DESCRICAO: TStringField;
    cdsDebitoDEB_NRNOTA: TStringField;
    cdsDebitoDEB_SERIENOTA: TStringField;
    cdsDebitoMOD_CODIGO: TIntegerField;
    cdsDebitoDEB_DTMOVIMENTO: TDateField;
    cdsDebitoDEB_DTVENCIMENTO: TDateField;
    cdsDebitoDEB_DTPAGAMENTO: TDateField;
    cdsDebitoDEB_PEJUROS: TFMTBCDField;
    cdsDebitoDEB_VLJUROS: TFMTBCDField;
    cdsDebitoDEB_VLDESCONTO: TFMTBCDField;
    cdsDebitoDEB_VLPARCELA: TFMTBCDField;
    cdsDebitoDEB_VLPAGO: TFMTBCDField;
    cdsDebitoDEB_VLRESTANTE: TFMTBCDField;
    cdsDebitoDEB_TOVENDA: TFMTBCDField;
    cdsDebitoDEB_SITUACAO: TStringField;
    cdsDebitoSEN_CODIGO: TIntegerField;
    cdsDebitoDEB_FLCHEQUE: TStringField;
    cdsDebitoDEB_NRCHEQUE: TStringField;
    cdsDebitoBAN_COGIGO: TStringField;
    cdsDebitoDEB_NRAGENCIA: TStringField;
    cdsDebitoDEB_NRBOLETO: TStringField;
    cdsDebitoDEB_NRCONC: TStringField;
    cdsDebitoDEB_FLEXCLUSAO: TStringField;
    cdsDebitoDEB_DTEXCLUSAO: TDateField;
    cdsDebitoDEB_USUAEXCLUIO: TIntegerField;
    cdsDebitoDEB_DTALTERACAO: TDateField;
    cdsDebitoDEB_MOTIVOEXCLUSAO: TStringField;
    cdsDebitoDEB_NRRENE: TIntegerField;
    cdsDebitoDEB_DTRENE: TDateField;
    cdsDebitoDEB_RENACR: TFMTBCDField;
    cdsDebitoDEB_RENDES: TFMTBCDField;
    CdsConfigCFG_RECEBIMENTO: TIntegerField;
    CdsConfigCFG_MODALIDADE: TIntegerField;
    CdsConfigCFG_NATUREZA: TIntegerField;
    CdsConfigCFG_CREDITO: TIntegerField;
    dsDebito: TDataSource;
    cdsDebitoDEB_ATRASO: TFloatField;
    cdsDebitoDEB_NMSITUACAO: TStringField;
    dstCheques: TSQLDataSet;
    dspCheques: TDataSetProvider;
    cdsCheques: TClientDataSet;
    dstChequesCHE_DOCUMENTO: TStringField;
    dstChequesCHE_CPFCGC: TStringField;
    dstChequesCHE_LOJA: TIntegerField;
    dstChequesCHE_VENDA: TIntegerField;
    dstChequesBAN_CODIGO: TStringField;
    dstChequesCHE_AGENCIA: TStringField;
    dstChequesCHE_CONTA: TStringField;
    dstChequesCHE_VALORDOCUMENTO: TFMTBCDField;
    dstChequesCHE_VALORDESCONTO: TFMTBCDField;
    dstChequesCHE_VALORACRESIMO: TFMTBCDField;
    dstChequesCHE_VALORJURO: TFMTBCDField;
    dstChequesCHE_SACADO: TStringField;
    dstChequesCHE_DTRECEBIMENTO: TDateField;
    dstChequesCHE_DTVENCIMENTO: TDateField;
    dstChequesCHE_DTPAGAMENTO: TDateField;
    dstChequesCHE_QTDIAS: TFMTBCDField;
    dstChequesCHE_SITUACAO: TStringField;
    dstChequesCHE_BLOQUEIO: TStringField;
    dstChequesCHE_DTDEVOLUCAO1: TDateField;
    dstChequesCHE_CDDEVOLUCAO1: TIntegerField;
    dstChequesCHE_DTDEVOLUCAO2: TDateField;
    dstChequesCHE_CDDEVOLUCAO2: TIntegerField;
    dstChequesCHE_DTPROR: TStringField;
    dstChequesCHE_DTALTERACAO: TDateField;
    dstChequesCHE_FLEXCLUSAO: TStringField;
    dstChequesCHE_FLORCAMENTO: TStringField;
    dstChequesSEN_CODIGO: TIntegerField;
    cdsChequesCHE_DOCUMENTO: TStringField;
    cdsChequesCHE_CPFCGC: TStringField;
    cdsChequesCHE_LOJA: TIntegerField;
    cdsChequesCHE_VENDA: TIntegerField;
    cdsChequesBAN_CODIGO: TStringField;
    cdsChequesCHE_AGENCIA: TStringField;
    cdsChequesCHE_CONTA: TStringField;
    cdsChequesCHE_VALORDOCUMENTO: TFMTBCDField;
    cdsChequesCHE_VALORDESCONTO: TFMTBCDField;
    cdsChequesCHE_VALORACRESIMO: TFMTBCDField;
    cdsChequesCHE_VALORJURO: TFMTBCDField;
    cdsChequesCHE_SACADO: TStringField;
    cdsChequesCHE_DTRECEBIMENTO: TDateField;
    cdsChequesCHE_DTVENCIMENTO: TDateField;
    cdsChequesCHE_DTPAGAMENTO: TDateField;
    cdsChequesCHE_QTDIAS: TFMTBCDField;
    cdsChequesCHE_SITUACAO: TStringField;
    cdsChequesCHE_BLOQUEIO: TStringField;
    cdsChequesCHE_DTDEVOLUCAO1: TDateField;
    cdsChequesCHE_CDDEVOLUCAO1: TIntegerField;
    cdsChequesCHE_DTDEVOLUCAO2: TDateField;
    cdsChequesCHE_CDDEVOLUCAO2: TIntegerField;
    cdsChequesCHE_DTPROR: TStringField;
    cdsChequesCHE_DTALTERACAO: TDateField;
    cdsChequesCHE_FLEXCLUSAO: TStringField;
    cdsChequesCHE_FLORCAMENTO: TStringField;
    cdsChequesSEN_CODIGO: TIntegerField;
    dsCheques: TDataSource;
    dstClientesCheques: TSQLDataSet;
    dspClientesCheques: TDataSetProvider;
    cdsClientesCheques: TClientDataSet;
    dsClientesCheque: TDataSource;
    dstClientesChequesCLC_CPFCGC: TStringField;
    dstClientesChequesCLC_NOME: TStringField;
    dstClientesChequesCLC_ENDERECO: TStringField;
    dstClientesChequesCLC_CEP: TStringField;
    dstClientesChequesCLC_BAIRRO: TStringField;
    dstClientesChequesCLC_CIDADE: TStringField;
    dstClientesChequesCLC_FONE: TStringField;
    dstClientesChequesCLC_IDENTIDADE: TStringField;
    dstClientesChequesCLC_ORGAOEMISSO: TStringField;
    dstClientesChequesCLC_UFEMISSO: TStringField;
    dstClientesChequesCLC_DTNASCIMENTO: TDateField;
    dstClientesChequesCLC_SITUACAO: TStringField;
    dstClientesChequesCLC_QTDEVOLUCAO: TFMTBCDField;
    dstClientesChequesBAN_CODIGO: TStringField;
    dstClientesChequesCLC_AGENCIA: TStringField;
    dstClientesChequesCLC_CONTA: TStringField;
    dstClientesChequesCLC_FLPREF: TStringField;
    dstClientesChequesCLC_NOMEPAI: TStringField;
    dstClientesChequesCLC_NOMEMAE: TStringField;
    dstClientesChequesCLC_DTALTERACAO: TDateField;
    cdsClientesChequesCLC_CPFCGC: TStringField;
    cdsClientesChequesCLC_NOME: TStringField;
    cdsClientesChequesCLC_ENDERECO: TStringField;
    cdsClientesChequesCLC_CEP: TStringField;
    cdsClientesChequesCLC_BAIRRO: TStringField;
    cdsClientesChequesCLC_CIDADE: TStringField;
    cdsClientesChequesCLC_FONE: TStringField;
    cdsClientesChequesCLC_IDENTIDADE: TStringField;
    cdsClientesChequesCLC_ORGAOEMISSO: TStringField;
    cdsClientesChequesCLC_UFEMISSO: TStringField;
    cdsClientesChequesCLC_DTNASCIMENTO: TDateField;
    cdsClientesChequesCLC_SITUACAO: TStringField;
    cdsClientesChequesCLC_QTDEVOLUCAO: TFMTBCDField;
    cdsClientesChequesBAN_CODIGO: TStringField;
    cdsClientesChequesCLC_AGENCIA: TStringField;
    cdsClientesChequesCLC_CONTA: TStringField;
    cdsClientesChequesCLC_FLPREF: TStringField;
    cdsClientesChequesCLC_NOMEPAI: TStringField;
    cdsClientesChequesCLC_NOMEMAE: TStringField;
    cdsClientesChequesCLC_DTALTERACAO: TDateField;
    SdsContatosCON_OBSERVACAO: TMemoField;
    CdsContatosCON_OBSERVACAO: TMemoField;
    dstFuncionariosCAR_CODIGO: TIntegerField;
    cdsFuncionariosCAR_CODIGO: TIntegerField;
    dstFuncionariosFUN_ESTADOCIVIL: TStringField;
    cdsFuncionariosFUN_ESTADOCIVIL: TStringField;
    dstCaixa: TSQLDataSet;
    dspCaixa: TDataSetProvider;
    cdsCaixa: TClientDataSet;
    dsCaixa: TDataSource;
    dstMovimentoCaixa: TSQLDataSet;
    cdsMovimentoCaixa: TClientDataSet;
    dspMovimentoCaixa: TDataSetProvider;
    dsMovimentoCaixa: TDataSource;
    dstMovimentoCaixaMCA_SEQUENCIA: TIntegerField;
    dstMovimentoCaixaMCA_LOJA: TIntegerField;
    dstMovimentoCaixaMCA_VENDA: TIntegerField;
    dstMovimentoCaixaMCA_TIPOMOV: TStringField;
    dstMovimentoCaixaMCA_DTMOVIMENTO: TDateField;
    dstMovimentoCaixaMCA_HRMOVIMENTO: TStringField;
    dstMovimentoCaixaMCA_VLMODALIDADE: TFMTBCDField;
    dstMovimentoCaixaMCA_TOVENDA: TFMTBCDField;
    dstMovimentoCaixaMCA_VLTROCO: TFMTBCDField;
    dstMovimentoCaixaMCA_OBSEVACAO: TStringField;
    dstMovimentoCaixaMCA_SITUACAO: TStringField;
    dstMovimentoCaixaMCA_CAIXA: TIntegerField;
    cdsMovimentoCaixaMCA_SEQUENCIA: TIntegerField;
    cdsMovimentoCaixaMCA_LOJA: TIntegerField;
    cdsMovimentoCaixaMCA_VENDA: TIntegerField;
    cdsMovimentoCaixaMCA_TIPOMOV: TStringField;
    cdsMovimentoCaixaMCA_DTMOVIMENTO: TDateField;
    cdsMovimentoCaixaMCA_HRMOVIMENTO: TStringField;
    cdsMovimentoCaixaMCA_VLMODALIDADE: TFMTBCDField;
    cdsMovimentoCaixaMCA_TOVENDA: TFMTBCDField;
    cdsMovimentoCaixaMCA_VLTROCO: TFMTBCDField;
    cdsMovimentoCaixaMCA_OBSEVACAO: TStringField;
    cdsMovimentoCaixaMCA_SITUACAO: TStringField;
    cdsMovimentoCaixaMCA_CAIXA: TIntegerField;
    cdsMovimentoCaixaMCA_NATUREZA: TIntegerField;
    CdsConfigCFG_SEQUENCIA: TIntegerField;
    qryLoja: TSQLQuery;
    dspLoja: TDataSetProvider;
    cdsLoja: TClientDataSet;
    cdsLojaEMP_CODIGO: TIntegerField;
    cdsLojaEMP_FANTASIA: TStringField;
    cdsLojaEMP_RAZAO: TStringField;
    dstUsuarios: TSQLDataSet;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    dsUsuarios: TDataSource;
    SdsEmpresasEMP_LIMCAIXA: TIntegerField;
    CdsEmpresasEMP_LIMCAIXA: TIntegerField;
    cdsLojaEMP_LIMCAIXA: TIntegerField;
    CdsConfigCFG_CAIXA: TIntegerField;
    CdsConfigCFG_USUARIO: TIntegerField;
    SdsEmpresasEMP_SEQUENCIA: TIntegerField;
    SdsEmpresasEMP_VENDA: TIntegerField;
    SdsEmpresasEMP_DTCAIXA: TDateField;
    SdsEmpresasEMP_FLCAIXA: TStringField;
    SdsEmpresasEMP_CAIXA: TIntegerField;
    CdsEmpresasEMP_SEQUENCIA: TIntegerField;
    CdsEmpresasEMP_VENDA: TIntegerField;
    CdsEmpresasEMP_DTCAIXA: TDateField;
    CdsEmpresasEMP_FLCAIXA: TStringField;
    CdsEmpresasEMP_CAIXA: TIntegerField;
    CdsConfigCFG_VENDA: TIntegerField;
    SdsEmpresasEMP_NRNOTA: TIntegerField;
    CdsEmpresasEMP_NRNOTA: TIntegerField;
    dstUsuariosSEN_CODIGO: TIntegerField;
    dstUsuariosSEN_NOME: TStringField;
    dstUsuariosSEN_SNATUA: TStringField;
    dstUsuariosSEN_CARGO: TStringField;
    dstUsuariosSEN_TERMINAL: TStringField;
    dstUsuariosSEN_LOJA: TIntegerField;
    dstUsuariosSEN_FLSUPER: TStringField;
    dstUsuariosSEN_FLCAIXA: TStringField;
    dstUsuariosSEN_GRUPO: TIntegerField;
    dstUsuariosSEN_DTATUAL: TDateField;
    dstUsuariosSEN_FLEXCLUSAO: TStringField;
    cdsUsuariosSEN_CODIGO: TIntegerField;
    cdsUsuariosSEN_NOME: TStringField;
    cdsUsuariosSEN_SNATUA: TStringField;
    cdsUsuariosSEN_CARGO: TStringField;
    cdsUsuariosSEN_TERMINAL: TStringField;
    cdsUsuariosSEN_LOJA: TIntegerField;
    cdsUsuariosSEN_FLSUPER: TStringField;
    cdsUsuariosSEN_FLCAIXA: TStringField;
    cdsUsuariosSEN_GRUPO: TIntegerField;
    cdsUsuariosSEN_DTATUAL: TDateField;
    cdsUsuariosSEN_FLEXCLUSAO: TStringField;
    dstModalidades: TSQLDataSet;
    dstModalidadesMOD_CODIGO: TIntegerField;
    dstModalidadesMOD_NOME: TStringField;
    dstModalidadesMOD_ABREVIACAO: TStringField;
    dspModalidades: TDataSetProvider;
    cdsModalidade: TClientDataSet;
    dsModalidades: TDataSource;
    cdsModalidadeMOD_CODIGO: TIntegerField;
    cdsModalidadeMOD_NOME: TStringField;
    cdsModalidadeMOD_ABREVIACAO: TStringField;
    dstMovimentoCaixaMCA_MODALIDADE: TStringField;
    cdsMovimentoCaixaMCA_MODALIDADE: TStringField;
    dstMovimentoCaixaMCA_NATUREZA: TIntegerField;
    CdsConfigCFG_NATUREZAVENDA: TIntegerField;
    dstMovimento: TSQLDataSet;
    dspMovimento: TDataSetProvider;
    cdsMovimento: TClientDataSet;
    dsMovimento: TDataSource;
    dstMovimentoMOV_PEDIDO: TIntegerField;
    dstMovimentoMOV_CUPOM: TIntegerField;
    dstMovimentoMOV_SEQUENCIA: TIntegerField;
    dstMovimentoMOV_CLIENTE: TIntegerField;
    dstMovimentoMOV_DATAVENDA: TDateField;
    dstMovimentoMOV_HORAVENDA: TStringField;
    dstMovimentoMOV_DATACANC: TDateField;
    dstMovimentoMOV_HORACANC: TStringField;
    dstMovimentoMOV_MOTCANC: TStringField;
    dstMovimentoMOV_VENDEDOR: TIntegerField;
    dstMovimentoMOV_VALOR: TFMTBCDField;
    dstMovimentoMOV_ENTRADA: TFMTBCDField;
    dstMovimentoMOV_DESCONTO: TFMTBCDField;
    dstMovimentoMOV_ACRESCIMO: TFMTBCDField;
    dstMovimentoMOV_DEVOLUSAO: TFMTBCDField;
    dstMovimentoMOV_TROCO: TFMTBCDField;
    dstMovimentoMOV_SITUACAO: TStringField;
    dstMovimentoDOM_ENDERECO: TStringField;
    dstMovimentoDOM_NUMERO: TStringField;
    dstMovimentoDOM_BAIRRO: TStringField;
    dstMovimentoDOM_CIDADE: TStringField;
    dstMovimentoDOM_REFERE: TStringField;
    cdsMovimentoMOV_PEDIDO: TIntegerField;
    cdsMovimentoMOV_CUPOM: TIntegerField;
    cdsMovimentoMOV_SEQUENCIA: TIntegerField;
    cdsMovimentoMOV_CLIENTE: TIntegerField;
    cdsMovimentoMOV_DATAVENDA: TDateField;
    cdsMovimentoMOV_HORAVENDA: TStringField;
    cdsMovimentoMOV_DATACANC: TDateField;
    cdsMovimentoMOV_HORACANC: TStringField;
    cdsMovimentoMOV_MOTCANC: TStringField;
    cdsMovimentoMOV_VENDEDOR: TIntegerField;
    cdsMovimentoMOV_VALOR: TFMTBCDField;
    cdsMovimentoMOV_ENTRADA: TFMTBCDField;
    cdsMovimentoMOV_DESCONTO: TFMTBCDField;
    cdsMovimentoMOV_ACRESCIMO: TFMTBCDField;
    cdsMovimentoMOV_DEVOLUSAO: TFMTBCDField;
    cdsMovimentoMOV_TROCO: TFMTBCDField;
    cdsMovimentoMOV_SITUACAO: TStringField;
    cdsMovimentoDOM_ENDERECO: TStringField;
    cdsMovimentoDOM_NUMERO: TStringField;
    cdsMovimentoDOM_BAIRRO: TStringField;
    cdsMovimentoDOM_CIDADE: TStringField;
    cdsMovimentoDOM_REFERE: TStringField;
    dstEstoque: TSQLDataSet;
    dspEstoque: TDataSetProvider;
    cdsEstoque: TClientDataSet;
    dstEstoquePRO_CODIGO: TStringField;
    dstEstoqueUNI_CODIGO: TStringField;
    dstEstoqueEST_DTENTRADA: TDateField;
    dstEstoqueEST_QUANTENTRADA: TFMTBCDField;
    dstEstoqueEST_DTSAIDA: TDateField;
    dstEstoqueEST_QUANTSAIDA: TFMTBCDField;
    dstEstoqueEST_CUSTOANTERIOR: TFMTBCDField;
    dstEstoqueEST_CUSTOMEDIO: TFMTBCDField;
    dstEstoqueEST_MAIORCUSTO: TFMTBCDField;
    dstEstoqueEST_QUANTIDADE: TFMTBCDField;
    dstEstoqueEST_MINIMO: TFMTBCDField;
    dstEstoqueULTREAJUST: TDateField;
    dsEstoque: TDataSource;
    dstHistorico: TSQLDataSet;
    dspHistorico: TDataSetProvider;
    cdsHistorico: TClientDataSet;
    dsHistorico: TDataSource;
    cdsItensVendas: TClientDataSet;
    cdsItensVendasITE_NRITEN: TStringField;
    cdsItensVendasITE_CDITEN: TStringField;
    cdsItensVendasITE_NMDESC: TStringField;
    cdsItensVendasITE_QTITEN: TFloatField;
    cdsItensVendasITE_CDUNID: TStringField;
    cdsItensVendasITE_VLUNIT: TCurrencyField;
    cdsItensVendasITE_VLSUBT: TCurrencyField;
    cdsItensVendasITE_FLCANC: TStringField;
    dsItensVendas: TDataSource;
    dstEstoqueEST_CODIGOLOJA: TIntegerField;
    cdsEstoqueEST_CODIGOLOJA: TIntegerField;
    cdsEstoquePRO_CODIGO: TStringField;
    cdsEstoqueUNI_CODIGO: TStringField;
    cdsEstoqueEST_DTENTRADA: TDateField;
    cdsEstoqueEST_QUANTENTRADA: TFMTBCDField;
    cdsEstoqueEST_DTSAIDA: TDateField;
    cdsEstoqueEST_QUANTSAIDA: TFMTBCDField;
    cdsEstoqueEST_CUSTOANTERIOR: TFMTBCDField;
    cdsEstoqueEST_CUSTOMEDIO: TFMTBCDField;
    cdsEstoqueEST_MAIORCUSTO: TFMTBCDField;
    cdsEstoqueEST_QUANTIDADE: TFMTBCDField;
    cdsEstoqueEST_MINIMO: TFMTBCDField;
    cdsEstoqueULTREAJUST: TDateField;
    cdsItensVendasITE_VLCOMP: TCurrencyField;
    cdsItensVendasITE_VLCUST: TCurrencyField;
    dstMovimentoMOV_LOJA: TIntegerField;
    cdsMovimentoMOV_LOJA: TIntegerField;
    dstMovimentoMOV_NOMECLIENTE: TStringField;
    cdsMovimentoMOV_NOMECLIENTE: TStringField;
    dstItensVendas: TSQLDataSet;
    dstItensVendasMOP_PEDIDO: TIntegerField;
    dstItensVendasMOP_PRODUTO: TStringField;
    dstItensVendasMOP_QUANTIDADE: TFMTBCDField;
    dstItensVendasMOP_UNIDADE: TStringField;
    dstItensVendasMOP_VALOR: TFMTBCDField;
    dstItensVendasMOP_DESCONTO: TFMTBCDField;
    dstItensVendasMOP_SERIE: TStringField;
    dstItensVendasMOP_CUSTO: TFMTBCDField;
    dstItensVendasMOP_COMPRA: TFMTBCDField;
    dspItensVenda: TDataSetProvider;
    cdsItensVenda: TClientDataSet;
    cdsItensVendaMOP_PEDIDO: TIntegerField;
    cdsItensVendaMOP_PRODUTO: TStringField;
    cdsItensVendaMOP_QUANTIDADE: TFMTBCDField;
    cdsItensVendaMOP_UNIDADE: TStringField;
    cdsItensVendaMOP_VALOR: TFMTBCDField;
    cdsItensVendaMOP_DESCONTO: TFMTBCDField;
    cdsItensVendaMOP_SERIE: TStringField;
    cdsItensVendaMOP_CUSTO: TFMTBCDField;
    cdsItensVendaMOP_COMPRA: TFMTBCDField;
    dsItensVenda: TDataSource;
    dstHistoricoHIS_SEQUENCIA: TIntegerField;
    dstHistoricoHIS_LOJA: TIntegerField;
    dstHistoricoHIS_PRODUTO: TStringField;
    dstHistoricoHIS_UNIDADE: TStringField;
    dstHistoricoHIS_DATA: TDateField;
    dstHistoricoHIS_HORA: TStringField;
    dstHistoricoHIS_TIPO: TStringField;
    dstHistoricoHIS_DOCUMENTO: TIntegerField;
    dstHistoricoHIS_ANTERIOR: TFMTBCDField;
    dstHistoricoHIS_MOVIMENTO: TFMTBCDField;
    dstHistoricoHIS_ATUAL: TFMTBCDField;
    dstHistoricoHIS_USUARIO: TIntegerField;
    dstHistoricoHIS_MOTIVO: TIntegerField;
    cdsHistoricoHIS_SEQUENCIA: TIntegerField;
    cdsHistoricoHIS_LOJA: TIntegerField;
    cdsHistoricoHIS_PRODUTO: TStringField;
    cdsHistoricoHIS_UNIDADE: TStringField;
    cdsHistoricoHIS_DATA: TDateField;
    cdsHistoricoHIS_HORA: TStringField;
    cdsHistoricoHIS_TIPO: TStringField;
    cdsHistoricoHIS_DOCUMENTO: TIntegerField;
    cdsHistoricoHIS_ANTERIOR: TFMTBCDField;
    cdsHistoricoHIS_MOVIMENTO: TFMTBCDField;
    cdsHistoricoHIS_ATUAL: TFMTBCDField;
    cdsHistoricoHIS_USUARIO: TIntegerField;
    cdsHistoricoHIS_MOTIVO: TIntegerField;
    dstCaixaCAI_NUMERO: TIntegerField;
    dstCaixaCAI_LOJA: TIntegerField;
    dstCaixaCAI_DTABERTURA: TDateField;
    dstCaixaCAI_DTFECHAMENTO: TDateField;
    dstCaixaCAI_HOABERTURA: TStringField;
    dstCaixaCAI_HOFECHAMENTO: TStringField;
    dstCaixaCAI_RGINICIAL: TIntegerField;
    dstCaixaCAI_RGFINAL: TIntegerField;
    dstCaixaCAI_CAIXA: TIntegerField;
    dstCaixaCAI_SITUACAO: TStringField;
    cdsCaixaCAI_NUMERO: TIntegerField;
    cdsCaixaCAI_LOJA: TIntegerField;
    cdsCaixaCAI_DTABERTURA: TDateField;
    cdsCaixaCAI_DTFECHAMENTO: TDateField;
    cdsCaixaCAI_HOABERTURA: TStringField;
    cdsCaixaCAI_HOFECHAMENTO: TStringField;
    cdsCaixaCAI_RGINICIAL: TIntegerField;
    cdsCaixaCAI_RGFINAL: TIntegerField;
    cdsCaixaCAI_CAIXA: TIntegerField;
    cdsCaixaCAI_SITUACAO: TStringField;
    cdsCaixaCAI_NOMELOJA: TStringField;
    dstModalidadesMOD_NRPARCELA: TIntegerField;
    cdsModalidadeMOD_NRPARCELA: TIntegerField;
    CdsConfigCFG_IDDERIVADOS: TIntegerField;
    dstDerivados: TSQLDataSet;
    dspDerivados: TDataSetProvider;
    cdsDerivados: TClientDataSet;
    dsDerivados: TDataSource;
    qryProdutos: TSQLQuery;
    cdsDerivadosDER_ID: TIntegerField;
    cdsDerivadosDER_DESCRICAO: TStringField;
    cdsDerivadosDER_PRODUTO: TStringField;
    cdsDerivadosDER_QUANTIDADE: TFMTBCDField;
    cdsDerivadosDER_PECENTUAL: TFMTBCDField;
    cdsDerivadosDER_PRONOME: TStringField;
    dstAbate: TSQLDataSet;
    dstAbateABT_SEQUENCIA: TIntegerField;
    dstAbateABT_ID: TIntegerField;
    dstAbateABT_TIPO: TIntegerField;
    dstAbateABT_PESO: TFMTBCDField;
    dstAbateABT_PESOAPOSABATE: TFMTBCDField;
    dstAbateABT_PESOMEDIO: TFMTBCDField;
    dstAbateABT_PRODUTO: TStringField;
    dstAbateABT_QUANTIDADE: TFMTBCDField;
    dstAbateABT_PESOPRODUTO: TFMTBCDField;
    dsAbate: TDataSource;
    dspAbate: TDataSetProvider;
    cdsAbate: TClientDataSet;
    cdsAbateABT_SEQUENCIA: TIntegerField;
    cdsAbateABT_ID: TIntegerField;
    cdsAbateABT_TIPO: TIntegerField;
    cdsAbateABT_PESO: TFMTBCDField;
    cdsAbateABT_PESOAPOSABATE: TFMTBCDField;
    cdsAbateABT_PESOMEDIO: TFMTBCDField;
    cdsAbateABT_PRODUTO: TStringField;
    cdsAbateABT_QUANTIDADE: TFMTBCDField;
    cdsAbateABT_PESOPRODUTO: TFMTBCDField;
    dstPerda: TSQLDataSet;
    dspPerda: TDataSetProvider;
    cdsPerda: TClientDataSet;
    dsPerda: TDataSource;
    CdsConfigCFG_ABATE: TIntegerField;
    CdsConfigCFG_PERDAS: TIntegerField;
    dstPerdaHPD_SEQUENCIA: TIntegerField;
    dstPerdaHPD_TIPOABATE: TIntegerField;
    dstPerdaHPD_PRODUTO: TStringField;
    dstPerdaHPD_IDPERDA: TIntegerField;
    dstPerdaHPD_QUANTIDADE: TFMTBCDField;
    dstPerdaHPD_DATA: TDateField;
    dstPerdaHPD_HORA: TStringField;
    dstPerdaHPD_USUARIO: TIntegerField;
    cdsPerdaHPD_SEQUENCIA: TIntegerField;
    cdsPerdaHPD_TIPOABATE: TIntegerField;
    cdsPerdaHPD_PRODUTO: TStringField;
    cdsPerdaHPD_IDPERDA: TIntegerField;
    cdsPerdaHPD_QUANTIDADE: TFMTBCDField;
    cdsPerdaHPD_DATA: TDateField;
    cdsPerdaHPD_HORA: TStringField;
    cdsPerdaHPD_USUARIO: TIntegerField;
    cdsPerdaHPD_DESCPERDA: TStringField;
    CdsConfigCFG_IDPERDA: TIntegerField;
    CdsConfigCFG_HISTORICOPERDA: TIntegerField;
    dstHistoricoHIS_VLCUSTO: TFMTBCDField;
    dstHistoricoHIS_VLCOMPRA: TFMTBCDField;
    dstHistoricoHIS_VLVENDA: TFMTBCDField;
    CdsConfigCFG_TRANSFERENCIA: TIntegerField;
    CdsConfigCFG_LOJAPADRAO: TIntegerField;
    cdsMovimentoCaixaMCA_NOMELOJA: TStringField;
    cdsMovimentoCaixaMCA_NOMEMODA: TStringField;
    CdsConfigCFG_IMAGEMLOGO: TBlobField;
    cdsMovimentoCaixaMCA_NMNATUREZA: TStringField;
    CdsEmpresasEMP_NMCIDADE: TStringField;
    CdsEmpresasEMP_NMBAIRRO: TStringField;
    dstModalidadesMOD_FLFIXA: TStringField;
    cdsModalidadeMOD_FLFIXA: TStringField;
    SdsClientesCLI_CODIGO: TIntegerField;
    SdsClientesCLI_CGC: TStringField;
    SdsClientesCLI_FANTASIA: TStringField;
    SdsClientesCLI_RAZAO: TStringField;
    SdsClientesCLI_ENDERECO: TStringField;
    SdsClientesCLI_NUMERO: TIntegerField;
    SdsClientesCLI_CEP: TStringField;
    SdsClientesBAI_CODIGO: TIntegerField;
    SdsClientesCID_CODIGO: TIntegerField;
    SdsClientesCLI_FONE1: TStringField;
    SdsClientesCLI_FONE2: TStringField;
    SdsClientesCLI_FONE3: TStringField;
    SdsClientesCLI_RAMAL1: TStringField;
    SdsClientesCLI_RAMAL2: TStringField;
    SdsClientesCLI_RAMAL3: TStringField;
    SdsClientesCLI_FAX: TStringField;
    SdsClientesCLI_INSCESTADUAL: TStringField;
    SdsClientesCLI_DATACAD: TDateField;
    SdsClientesSIT_CODIGO: TIntegerField;
    SdsClientesCLI_PAGINA: TStringField;
    SdsClientesATI_CODIGO: TIntegerField;
    SdsClientesCLI_ORGAOEMISSOR: TStringField;
    SdsClientesCLI_UFEMISSOR: TStringField;
    CdsClientesCLI_ORGAOEMISSOR: TStringField;
    CdsClientesCLI_UFEMISSOR: TStringField;
    dstProdutosPRO_LUCROBRUTO: TFMTBCDField;
    dstProdutosPRO_LUCROLIQUIDO: TFMTBCDField;
    cdsProdutosPRO_LUCROBRUTO: TFMTBCDField;
    cdsProdutosPRO_LUCROLIQUIDO: TFMTBCDField;
    SdsClientesCLI_TIPOPESSOA: TStringField;
    CdsClientesCLI_TIPOPESSOA: TStringField;
    cdsAbateABT_TPDESCRICAO: TStringField;
    dstDerivadosDER_ID: TIntegerField;
    dstDerivadosDER_DESCRICAO: TStringField;
    dstDerivadosDER_PRODUTO: TStringField;
    dstDerivadosDER_QUANTIDADE: TFMTBCDField;
    dstDerivadosDER_PECENTUAL: TFMTBCDField;
    cdsPerdaHPD_DESCABATE: TStringField;
    CdsConfigCFG_IMPRESSORA: TIntegerField;
    CdsConfigCFG_FLVENDEDOR: TStringField;
    cdsHistoricoHIS_VLCUSTO: TFMTBCDField;
    cdsHistoricoHIS_VLCOMPRA: TFMTBCDField;
    cdsHistoricoHIS_VLVENDA: TFMTBCDField;
    SdsClientesCLI_FOTOCLIENTE: TBlobField;
    CdsClientesCLI_FOTOCLIENTE: TBlobField;
    CdsConfigCFG_SEQPAGAR: TIntegerField;
    CdsConfigCFG_DATATUAL: TDateField;
    CdsConfigCFG_NMNATUREZA: TStringField;
    dstProdutosPRO_CONTROLELOTE: TStringField;
    cdsProdutosPRO_CONTROLELOTE: TStringField;
    ppDBParametros: TppDBPipeline;
    CdsConfigCFG_SEQRECEBER: TIntegerField;
    SdsClientesCLI_DTANIVERSARIO: TDateField;
    CdsClientesCLI_DTANIVERSARIO: TDateField;
    CdsConfigCFG_ETIQUETAPRODUTO: TIntegerField;
    SdsClientesCLI_UFCLIENTE: TStringField;
    CdsClientesCLI_UFCLIENTE: TStringField;
    CdsConfigCFG_PADRAOBARRAS: TStringField;
    CdsConfigCFG_MOTIVODEVOLUCAO: TIntegerField;
    CdsConfigCFG_FLVENDAESTOQUE: TStringField;
    SaveDialog1: TSaveDialog;
    CdsConfigCFG_FLLOTE: TStringField;
    cdsItensVendasITE_NRLOTE: TStringField;
    CdsConfigCFG_FLCUPOMVENDA: TStringField;
    dstUsuariosSEN_ECF: TIntegerField;
    cdsUsuariosSEN_ECF: TIntegerField;
    dstTributacaoTRI_INDICE_ECF: TStringField;
    cdsTributacaoTRI_INDICE_ECF: TStringField;
    dstProdutosPRO_CODIGOBAIXA: TStringField;
    cdsProdutosPRO_CODIGOBAIXA: TStringField;
    dstHistoricoHIS_CODIGOBAIXA: TStringField;
    cdsHistoricoHIS_CODIGOBAIXA: TStringField;
    cdsItensVendasITE_CDBAIX: TStringField;
    cdsPerdaHPD_NMPRODUTO: TStringField;
    ApplicationEvents1: TApplicationEvents;
    cdsUsuariosSEN_IMPRESSORA: TStringField;
    dstProdutosPRO_HOREAJUTE: TStringField;
    dstProdutosPRO_USUARIO_REAJUSTE: TIntegerField;
    dstProdutosPRO_VALOR_ANTERIOR: TFMTBCDField;
    cdsProdutosPRO_HOREAJUTE: TStringField;
    cdsProdutosPRO_USUARIO_REAJUSTE: TIntegerField;
    cdsProdutosPRO_VALOR_ANTERIOR: TFMTBCDField;
    dstUsuariosSEN_PASTA_CUPOM: TStringField;
    cdsUsuariosSEN_PASTA_CUPOM: TStringField;
    qryUsuario: TSQLQuery;
    dstUsuariosSEN_FLIMPRESSORA: TStringField;
    cdsUsuariosSEN_FLIMPRESSORA: TStringField;
    CdsConfigCFG_CDBARRAS: TStringField;
    CdsConfigCFG_MENSAGEM_CUPOM: TMemoField;
    SdsEmpresasEMP_INSCRICAOESTADUAL: TStringField;
    CdsEmpresasEMP_INSCRICAOESTADUAL: TStringField;
    CdsConfigCFG_EMAIL: TStringField;
    CdsConfigCFG_SMTP_EMAIL: TStringField;
    CdsConfigCFG_COR: TIntegerField;
    dstProdutosPRO_COR: TIntegerField;
    cdsProdutosPRO_COR: TIntegerField;
    cdsProdutosPRO_NOMCOR: TStringField;
    cdsItensVendasITE_VLDESC: TFloatField;
    cdsItensVendasITE_VLACRE: TFloatField;
    dstProdutosPRO_REFERENCIA: TStringField;
    cdsProdutosPRO_REFERENCIA: TStringField;
    CdsConfigCFG_TABPRECO: TIntegerField;
    CdsConfigCFG_TIPOCLIENTE: TIntegerField;
    CdsConfigCFG_REGIAO: TIntegerField;
    SdsClientesCLI_TIPOCLIENTE: TIntegerField;
    SdsClientesCLI_REGIAO: TIntegerField;
    CdsClientesCLI_TIPOCLIENTE: TIntegerField;
    CdsClientesCLI_REGIAO: TIntegerField;
    CdsClientesTIPOCLIENTE: TStringField;
    CdsClientesREGIAO: TStringField;
    CdsConfigCFG_ORCAMENTO: TIntegerField;
    dstMovimentoMOV_TABELA: TIntegerField;
    cdsMovimentoMOV_TABELA: TIntegerField;
    SdsClientesCLI_FLMATRIZ: TStringField;
    CdsClientesCLI_FLMATRIZ: TStringField;
    dstProdutosPRO_FLPROD: TStringField;
    cdsProdutosPRO_FLPROD: TStringField;
    cdsItensVendasITE_VENDEDOR: TIntegerField;
    dstHistoricoHIS_VENDEDOR: TIntegerField;
    cdsHistoricoHIS_VENDEDOR: TIntegerField;
    dstMovimentoCaixaMCA_FUNCIONARIO: TIntegerField;
    cdsMovimentoCaixaMCA_FUNCIONARIO: TIntegerField;
    dstModalidadesMOD_AVISTA: TStringField;
    cdsModalidadeMOD_AVISTA: TStringField;
    cdsTpClientes: TClientDataSet;
    cdsTpClientesTPC_CODIGO: TIntegerField;
    cdsTpClientesTPC_DESCRICAO: TStringField;
    dspTpClientes: TDataSetProvider;
    dstTipoClientes: TSQLDataSet;
    dstTipoClientesTPC_CODIGO: TIntegerField;
    dstTipoClientesTPC_DESCRICAO: TStringField;
    CdsConfigCFG_CEDENTE: TIntegerField;
    CdsConfigCFG_MODELO_BOLETO: TIntegerField;
    CdsConfigCFG_MENSAGEM_BOLETO: TStringField;
    CdsConfigCFG_LOCAL_PAGAMENTO: TStringField;
    CdsConfigCFG_IMAGEM_BOLETO: TBlobField;
    CdsConfigCFG_INSTRUCOES: TMemoField;
    CdsConfigCFG_CEDENTE_ATUAL: TIntegerField;
    dstUsuariosUSU_ADMIN: TStringField;
    cdsUsuariosUSU_ADMIN: TStringField;
    SdsClientesCLI_USUARIO_INC: TIntegerField;
    SdsClientesCLI_USUARIO_ALT: TIntegerField;
    CdsClientesCLI_USUARIO_INC: TIntegerField;
    CdsClientesCLI_USUARIO_ALT: TIntegerField;
    SdsClientesCLI_DATA_INC: TDateField;
    SdsClientesCLI_HORA_INC: TStringField;
    SdsClientesCLI_DATA_ALT: TDateField;
    SdsClientesCLI_HORA_ALT: TStringField;
    CdsClientesCLI_DATA_INC: TDateField;
    CdsClientesCLI_HORA_INC: TStringField;
    CdsClientesCLI_DATA_ALT: TDateField;
    CdsClientesCLI_HORA_ALT: TStringField;
    SdsEmpresasEMP_DATA_CAD: TDateField;
    SdsEmpresasEMP_HOCADA: TStringField;
    SdsEmpresasEMP_USUARIO_CAD: TIntegerField;
    SdsEmpresasEMP_DATA_ALT: TDateField;
    SdsEmpresasEMP_HORA_ALT: TStringField;
    SdsEmpresasEMP_USUARIO_ALT: TIntegerField;
    CdsEmpresasEMP_DATA_CAD: TDateField;
    CdsEmpresasEMP_HOCADA: TStringField;
    CdsEmpresasEMP_USUARIO_CAD: TIntegerField;
    CdsEmpresasEMP_DATA_ALT: TDateField;
    CdsEmpresasEMP_HORA_ALT: TStringField;
    CdsEmpresasEMP_USUARIO_ALT: TIntegerField;
    dstFornecedorFOR_DTCADA: TDateField;
    dstFornecedorFOR_HOCADA: TStringField;
    dstFornecedorFOR_USUARIO_CAD: TIntegerField;
    dstFornecedorFOR_DTALTE: TDateField;
    dstFornecedorFOR_HOALTE: TStringField;
    dstFornecedorFOR_USUARIO_ALT: TIntegerField;
    cdsFornecedorFOR_DTCADA: TDateField;
    cdsFornecedorFOR_HOCADA: TStringField;
    cdsFornecedorFOR_USUARIO_CAD: TIntegerField;
    cdsFornecedorFOR_DTALTE: TDateField;
    cdsFornecedorFOR_HOALTE: TStringField;
    cdsFornecedorFOR_USUARIO_ALT: TIntegerField;
    dstProdutosPRO_USUARIO_CAD: TIntegerField;
    dstProdutosPRO_HOCADA: TStringField;
    dstProdutosPRO_USUARIO_ALT: TIntegerField;
    dstProdutosPRO_HOALTE: TStringField;
    cdsProdutosPRO_USUARIO_CAD: TIntegerField;
    cdsProdutosPRO_HOCADA: TStringField;
    cdsProdutosPRO_USUARIO_ALT: TIntegerField;
    cdsProdutosPRO_HOALTE: TStringField;
    SdsContatosCON_DTCADA: TDateField;
    SdsContatosCON_HOCADA: TStringField;
    SdsContatosCON_USUARIO_CAD: TIntegerField;
    SdsContatosCON_DTALTE: TDateField;
    SdsContatosCON_HOALTE: TStringField;
    SdsContatosCON_USUARIO_ALT: TIntegerField;
    CdsContatosCON_DTCADA: TDateField;
    CdsContatosCON_HOCADA: TStringField;
    CdsContatosCON_USUARIO_CAD: TIntegerField;
    CdsContatosCON_DTALTE: TDateField;
    CdsContatosCON_HOALTE: TStringField;
    CdsContatosCON_USUARIO_ALT: TIntegerField;
    dstFuncionarios2: TSQLDataSet;
    dstFuncionarios2FUN_CODIGO: TIntegerField;
    dstFuncionarios2FUN_NOME: TStringField;
    dstFuncionarios2FUN_ENDERECO: TStringField;
    dstFuncionarios2FUN_BAIRRO: TStringField;
    dstFuncionarios2FUN_CIDADE: TStringField;
    dstFuncionarios2FUN_UFFUNC: TStringField;
    dstFuncionarios2FUN_NATUREZA: TStringField;
    dstFuncionarios2FUN_CEP: TStringField;
    dstFuncionarios2FUN_FONE: TStringField;
    dstFuncionarios2FUN_TPFUNC: TStringField;
    dstFuncionarios2FUN_DTNASCIMENTO: TDateField;
    dstFuncionarios2FUN_DTADMICAO: TDateField;
    dstFuncionarios2FUN_DTDEMICAO: TDateField;
    dstFuncionarios2FUN_VLDEBITO: TFMTBCDField;
    dstFuncionarios2FUN_CPFCGC: TStringField;
    dstFuncionarios2FUN_IDENTIDADE: TStringField;
    dstFuncionarios2FUN_ORIDEN: TStringField;
    dstFuncionarios2FUN_UFIDEN: TStringField;
    dstFuncionarios2FUN_NRCART: TStringField;
    dstFuncionarios2FUN_SECART: TStringField;
    dstFuncionarios2FUN_UFCART: TStringField;
    dstFuncionarios2FUN_CAREMI: TStringField;
    dstFuncionarios2FUN_TITULO: TStringField;
    dstFuncionarios2FUN_CDSECA: TStringField;
    dstFuncionarios2FUN_CDZONA: TStringField;
    dstFuncionarios2FUN_ESTCIVIL: TStringField;
    dstFuncionarios2FUN_VLSALA: TFMTBCDField;
    dstFuncionarios2FUN_LIONIB: TStringField;
    dstFuncionarios2FUN_HOENT1: TStringField;
    dstFuncionarios2FUN_HOSAI1: TStringField;
    dstFuncionarios2FUN_HOENT2: TStringField;
    dstFuncionarios2FUN_HOSAI2: TStringField;
    dstFuncionarios2FUN_NOMPAI: TStringField;
    dstFuncionarios2FUN_NOMMAE: TStringField;
    dstFuncionarios2FUN_COMPO1: TStringField;
    dstFuncionarios2FUN_COMPO2: TStringField;
    dstFuncionarios2FUN_COMPO3: TStringField;
    dstFuncionarios2FUN_ASSID1: TStringField;
    dstFuncionarios2FUN_ASSID2: TStringField;
    dstFuncionarios2FUN_ASSID3: TStringField;
    dstFuncionarios2FUN_HONES1: TStringField;
    dstFuncionarios2FUN_HONES2: TStringField;
    dstFuncionarios2FUN_HONES3: TStringField;
    dstFuncionarios2FUN_CARAT1: TStringField;
    dstFuncionarios2FUN_CARAT2: TStringField;
    dstFuncionarios2FUN_CARAT3: TStringField;
    dstFuncionarios2FUN_COMPR1: TMemoField;
    dstFuncionarios2FUN_RESPO1: TMemoField;
    dstFuncionarios2FUN_ATEST1: TMemoField;
    dstFuncionarios2FUN_FUNCAO: TStringField;
    dstFuncionarios2FUN_RGEMIS: TDateField;
    dstFuncionarios2FUN_FOTO: TBlobField;
    dstFuncionarios2CAR_CODIGO: TIntegerField;
    dstFuncionarios2FUN_ESTADOCIVIL: TStringField;
    dstFuncionarios2FUN_DTCADA: TDateField;
    dstFuncionarios2FUN_HOCADA: TStringField;
    dstFuncionarios2FUN_USUARIO_CAD: TIntegerField;
    dstFuncionarios2FUN_DTALTE: TDateField;
    dstFuncionarios2FUN_HOALTE: TStringField;
    dstFuncionarios2FUN_USUARIO_ALT: TIntegerField;
    cdsFuncionariosFUN_DTCADA: TDateField;
    cdsFuncionariosFUN_HOCADA: TStringField;
    cdsFuncionariosFUN_USUARIO_CAD: TIntegerField;
    cdsFuncionariosFUN_DTALTE: TDateField;
    cdsFuncionariosFUN_HOALTE: TStringField;
    cdsFuncionariosFUN_USUARIO_ALT: TIntegerField;
    CdsConfigCFG_CONTAS_SALDO: TIntegerField;
    dstModalidadesMOD_CAIXA_GERAL: TIntegerField;
    cdsModalidadeMOD_CAIXA_GERAL: TIntegerField;
    CdsConfigCFG_CONTA_CAIXA: TIntegerField;
    CdsConfigCFG_NMCONTA: TStringField;
    CdsConfigCFG_NMCEDENTE: TStringField;
    CdsConfigCFG_PECOMI: TBCDField;
    CdsConfigCFG_PERPIS: TBCDField;
    CdsConfigCFG_PECOFI: TBCDField;
    CdsConfigCFG_PEIPMF: TBCDField;
    dstUsuariosSEN_LIMITEDESCONTO: TBCDField;
    dstUsuariosSEN_LICHEQ: TBCDField;
    cdsUsuariosSEN_LIMITEDESCONTO: TBCDField;
    cdsUsuariosSEN_LICHEQ: TBCDField;
    dstTributacaoTRI_ICMS: TBCDField;
    dstTributacaoTRI_PERCETUAL: TBCDField;
    cdsTributacaoTRI_ICMS: TBCDField;
    cdsTributacaoTRI_PERCETUAL: TBCDField;
    dstProdutosPRO_LIMDESCONTO: TBCDField;
    cdsProdutosPRO_LIMDESCONTO: TBCDField;
    dstSubSecaoSUB_PEAVISTA: TBCDField;
    dstSubSecaoSUB_PEAPRAZO: TBCDField;
    cdsSubSecaoSUB_PEAVISTA: TBCDField;
    cdsSubSecaoSUB_PEAPRAZO: TBCDField;
    dstFuncionarios2FUN_PECOMI: TBCDField;
    cdsFuncionariosFUN_PECOMI: TBCDField;
    dstModalidadesMOD_PECOMISSAO: TBCDField;
    cdsModalidadeMOD_PECOMISSAO: TBCDField;
    cdsContaSaldo: TClientDataSet;
    cdsContaSaldoCGS_CODIGO: TIntegerField;
    cdsContaSaldoCGS_DESCRICAO: TStringField;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsModalidadeMOD_NM_CONTA: TStringField;
    dstProdutosPRO_ANTECIPACAO_ICMS: TBCDField;
    cdsProdutosPRO_ANTECIPACAO_ICMS: TBCDField;
    cdsConsulta: TClientDataSet;
    cdsAcessoMenu: TClientDataSet;
    dstPadrao2: TSQLDataSet;
    dspPadrao2: TDataSetProvider;
    cdsGetNomeMenu: TClientDataSet;
    CdsConfigCFG_FLJURO: TIntegerField;
    CdsConfigCFG_TRANSPORTADORA: TIntegerField;
    CdsConfigCFG_TELA_PEDIDO: TIntegerField;
    dstMovimentoMOV_TIPO_FRETE: TStringField;
    dstMovimentoMOV_PERC_FRETE: TFMTBCDField;
    dstMovimentoMOV_IDTRANSPORTADORA: TIntegerField;
    cdsMovimentoMOV_TIPO_FRETE: TStringField;
    cdsMovimentoMOV_PERC_FRETE: TFMTBCDField;
    cdsMovimentoMOV_IDTRANSPORTADORA: TIntegerField;
    dstMovimentoMOV_TABELA_PLANO: TIntegerField;
    cdsMovimentoMOV_TABELA_PLANO: TIntegerField;
    SdsEmpresasEMP_NRFONE: TStringField;
    SdsEmpresasEMP_NRFAX: TStringField;
    CdsEmpresasEMP_NRFONE: TStringField;
    CdsEmpresasEMP_NRFAX: TStringField;
    SdsEmpresasEMP_NRCEP: TStringField;
    CdsEmpresasEMP_NRCEP: TStringField;
    SdsEmpresasEMP_UF: TStringField;
    CdsEmpresasEMP_UF: TStringField;
    CdsConfigCFG_PLANO_PG: TIntegerField;
    cdsItensVendasITE_CODCOR: TIntegerField;
    CdsConfigCFG_ARQUIVO_PEDIDO: TStringField;
    dstMovimentoMOV_OBSERVACAO: TMemoField;
    cdsMovimentoMOV_OBSERVACAO: TMemoField;
    dstFornecedorFOR_FAX: TStringField;
    cdsFornecedorFOR_FAX: TStringField;
    CdsConfigCFG_EMAIL_AUTENTICACAO: TStringField;
    CdsConfigCFG_EMAIL_PORTA: TIntegerField;
    CdsConfigCFG_EMAIL_PASSWORD: TStringField;
    CdsConfigCFG_MENS_RODAPE_PEDIDO: TMemoField;
    CdsConfigCFG_MENS_RODAPE: TStringField;
    SdsClientesCLI_END_COBRANCA: TStringField;
    CdsClientesCLI_END_COBRANCA: TStringField;
    dstFornecedorFOR_PERCENTUAL_IPI: TFMTBCDField;
    cdsFornecedorFOR_PERCENTUAL_IPI: TFMTBCDField;
    dstItensVendasMOP_CODCOR: TIntegerField;
    dstItensVendasMOP_VALIPI: TFMTBCDField;
    cdsItensVendaMOP_CODCOR: TIntegerField;
    cdsItensVendaMOP_VALIPI: TFMTBCDField;
    cdsItensVendasITE_VALIPI: TFloatField;
    dstMovimentoMOV_MODALIDADE_PEDIDO: TIntegerField;
    cdsMovimentoMOV_MODALIDADE_PEDIDO: TIntegerField;
    dstMovimentoMOV_OBS1: TMemoField;
    dstMovimentoMOV_OBS2: TMemoField;
    cdsMovimentoMOV_OBS1: TMemoField;
    cdsMovimentoMOV_OBS2: TMemoField;
    SdsClientesCLI_CODIGO_MATRIZ: TIntegerField;
    CdsClientesCLI_CODIGO_MATRIZ: TIntegerField;
    CdsClientesCLI_NMMATRIZ: TStringField;
    CdsConfigCFG_VERIFICA_RAZAO: TStringField;
    cdsListaAtividades: TClientDataSet;
    cdsListaAtividadesATI_CODIGO: TIntegerField;
    cdsListaAtividadesATI_NOME: TStringField;
    CdsClientesCLI_NOME_ATIV: TStringField;
    CdsConfigCFG_EMAIL_FROM: TStringField;
    dstUsuariosSEN_PASTA_ECF: TStringField;
    cdsUsuariosSEN_PASTA_ECF: TStringField;
    dstModalidadesMOD_FLXTEF: TStringField;
    dstModalidadesMOD_PASTA_ENVIA_TEF: TStringField;
    dstModalidadesMOD_PASTA_RECEBE_TEF: TStringField;
    cdsModalidadeMOD_FLXTEF: TStringField;
    cdsModalidadeMOD_PASTA_ENVIA_TEF: TStringField;
    cdsModalidadeMOD_PASTA_RECEBE_TEF: TStringField;
    CdsConfigCFG_FLVENDEDOR_ITEM_VENDA: TStringField;
    CdsConfigCFG_FLMESA: TStringField;
    CdsConfigCFG_MESA: TIntegerField;
    cdsListaMesas: TClientDataSet;
    cdsListaMesasMES_CODIGO: TIntegerField;
    cdsListaMesasMES_DESCRICAO: TStringField;
    cdsListaFuncionarios: TClientDataSet;
    cdsListaFuncionariosFUN_CODIGO: TIntegerField;
    cdsListaFuncionariosFUN_NOME: TStringField;
    cdsListaFuncionariosFUN_TPFUNC: TStringField;
    cdsItensVendasITE_NMFUNC: TStringField;
    CdsConfigCFG_QTMESAS: TIntegerField;
    dstMovimentoMOV_NRMESA: TStringField;
    cdsMovimentoMOV_NRMESA: TStringField;
    dstMovimentoDOM_COMPLEMENTO: TStringField;
    dstMovimentoDOM_NRFONE: TStringField;
    cdsMovimentoDOM_COMPLEMENTO: TStringField;
    cdsMovimentoDOM_NRFONE: TStringField;
    CdsConfigCFG_TELEENTEGA: TIntegerField;
    CdsConfigCFG_SEQUENCIA_SERVICO: TIntegerField;
    CdsConfigCFG_FLFECHAR_ORCAMENTO: TStringField;
    SdsClientesCLI_PONTO_REFERENCIA: TStringField;
    CdsClientesCLI_PONTO_REFERENCIA: TStringField;
    CdsConfigCFG_TAXA_SERVICO: TBCDField;
    dstMovimentoMOV_TAXA_SERVICO: TBCDField;
    cdsMovimentoMOV_TAXA_SERVICO: TBCDField;
    CdsConfigCFG_DDD_PADRAO: TStringField;
    cdsListaCargos: TClientDataSet;
    cdsListaCargosCAR_CODIGO: TIntegerField;
    cdsListaCargosCAR_NOME: TStringField;
    cdsFuncionariosFUN_CARGO: TStringField;
    CdsConfigCFG_SCREEN_WIDTH: TIntegerField;
    CdsConfigCFG_SCREEN_HEIGTH: TIntegerField;
    CdsConfigCFG_FLMATRICIAL: TStringField;
    CdsConfigCFG_LINHA_RODAPE_CUPOM: TIntegerField;
    cdsListaSituacao: TClientDataSet;
    cdsListaSituacaoSIT_CODIGO: TIntegerField;
    cdsListaSituacaoSIT_NOME: TStringField;
    CdsClientesCLI_NOME_SITUACAO: TStringField;
    CdsClientesCLI_NRBOX: TStringField;
    CdsConfigCFG_MULTA: TFMTBCDField;
    CdsConfigCFG_JUROS: TFMTBCDField;
    SdsClientesCLI_NRBOX: TStringField;
    cdsListaGrupos: TClientDataSet;
    cdsListaGruposGRU_CODIGO: TIntegerField;
    cdsListaGruposGRU_DESCRICAO: TStringField;
    SdsClientesCLI_CDGRUPO: TIntegerField;
    CdsClientesCLI_CDGRUPO: TIntegerField;
    CdsClientesCLI_NMGRUPO: TStringField;
    CdsConfigCFG_GRUPO: TIntegerField;
    CdsConfigCFG_PASTA_RETORNO: TStringField;
    SdsClientesCLI_FOTO: TGraphicField;
    CdsClientesCLI_FOTO: TGraphicField;
    CdsConfigCFG_NRFATURA: TIntegerField;
    CdsConfigCFG_SEQTAREFAUSUARIOS: TIntegerField;
    dstListaTabelas: TSQLDataSet;
    dspListaTabelas: TDataSetProvider;
    cdsListaBairroResid: TClientDataSet;
    cdsListaEstadoCivil: TClientDataSet;
    cdsListaEstadoCivilECV_CODIGO: TIntegerField;
    cdsListaEstadoCivilECV_DESCRICAO: TStringField;
    cdsListaCidadesEndRes: TClientDataSet;
    cdsListaCidadesEndResCID_CODIGO: TIntegerField;
    cdsListaCidadesEndResCID_NOME: TStringField;
    cdsListaCidadesEndResCID_UF: TStringField;
    cdsListaCidadeCob: TClientDataSet;
    cdsListaCidadeCobCID_CODIGO: TIntegerField;
    cdsListaCidadeCobCID_NOME: TStringField;
    cdsListaCidadeCobCID_UF: TStringField;
    cdsListaBairroCobranca: TClientDataSet;
    SdsClientesCLI_END_NUMERO: TIntegerField;
    SdsClientesCLI_END_CIDADE: TIntegerField;
    SdsClientesCLI_END_CEP: TStringField;
    SdsClientesCLI_END_UF: TStringField;
    SdsClientesCLI_END_BAIRRO: TIntegerField;
    SdsClientesCLI_GRAU_ESCOLARIDADE: TStringField;
    SdsClientesCLI_FLPORTADOR_DEFICIENCIA: TStringField;
    SdsClientesCLI_DESCRICAO_DEFICIENCIA: TStringField;
    SdsClientesCLI_CONJUGUE_NOME: TStringField;
    SdsClientesCLI_CONJUGUE_CPF: TStringField;
    SdsClientesCLI_TEMPO_RESIDENCIA: TStringField;
    SdsClientesCLI_ESTADO_CIVIL: TIntegerField;
    SdsClientesCLI_OBSERVACAO: TMemoField;
    CdsClientesCLI_END_NUMERO: TIntegerField;
    CdsClientesCLI_END_CIDADE: TIntegerField;
    CdsClientesCLI_END_CEP: TStringField;
    CdsClientesCLI_END_UF: TStringField;
    CdsClientesCLI_END_BAIRRO: TIntegerField;
    CdsClientesCLI_GRAU_ESCOLARIDADE: TStringField;
    CdsClientesCLI_FLPORTADOR_DEFICIENCIA: TStringField;
    CdsClientesCLI_DESCRICAO_DEFICIENCIA: TStringField;
    CdsClientesCLI_CONJUGUE_NOME: TStringField;
    CdsClientesCLI_CONJUGUE_CPF: TStringField;
    CdsClientesCLI_TEMPO_RESIDENCIA: TStringField;
    CdsClientesCLI_ESTADO_CIVIL: TIntegerField;
    CdsClientesCLI_OBSERVACAO: TMemoField;
    CdsConfigCFG_RENEGOCIACAO: TIntegerField;
    CdsClientesCLI_DESC_EST_CIVIL: TStringField;
    CdsClientesCLI_CIDADE_RESIDENCIA: TStringField;
    CdsClientesCLI_NMBAIRRO_RESID: TStringField;
    CdsClientesBAI_NOME: TStringField;
    CdsClientesCLI_CIDADE_COBRACA: TStringField;
    SdsClientesCLI_END_LOGRADOURO: TStringField;
    CdsClientesCLI_END_LOGRADOURO: TStringField;
    CdsConfigCFG_CODELETROS: TIntegerField;
    CdsConfigCFG_CDMOVBOX: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dspBancosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspFornecedorGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure DspCargosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure DspSituacaoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure DspAtividadesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure DspClientesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure DspBairrosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure DspCidadesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure DspContatosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspSubSecaoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspSecaoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspUnidadesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspTributacaoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspEntradaGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsEntradaProdutoCalcFields(DataSet: TDataSet);
    procedure cdsDebitoCalcFields(DataSet: TDataSet);
    procedure cdsItensVendasCalcFields(DataSet: TDataSet);
    procedure dspTransferenciaGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspChequesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspHistoricoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspModalidadesGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspDerivadosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure DspEmpresasGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspMovimentoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspProdutosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspEntradaProdutoGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspMovimentoCaixaGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspCaixaGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure DspConfigGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspAbateGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspClientesChequesGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure dspUsuariosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure SqlAdminBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Transc : TTransactionDesc;
    procedure Start;
    procedure Comit(aTransc : TTransactionDesc);
    procedure Rollback;
    procedure parametros;
    procedure Fiscal_Usuario(M_CDUSUA : Integer);
    function Retorna_Barras() : String;
    procedure Contatos_Cliente(M_CDCLIE : Integer);
    Procedure FilterCDS(aCds : TClientDataSet; aType : TTypeLocalizar ; aBusca : String);
    procedure RefreshCDS(aDateSet : TClientDataSet);
    procedure Incluir_Movimento_Caixa(aLoja, aVenda, aCaixa, aNatureza : Integer;
         aTipoMov, aHora, aModa, aSitucao, aObservacao : String;
         aDtMovi : TDate; aValorModa, aTotal, aTroco : Double);
    procedure Baixar_Titulo(aCredito : Integer; aDataRecebimento, aDataCredito : TDate;
         aValorDespesaCobranca, aValorAbatimento, aValorDesconto, aValorMoraJuros : Double; aCaixa : Integer);
    procedure Incluir_Natureza(aDescricao, aTipo : String);
    procedure Atualizar_Fluxo_Parcela(aCredito, aParcela, aCliente : Integer);
    procedure Acessos_Sistema(aCds : TClientDataSet; aTipo, aCodUsu : Integer);
    procedure Incluir_Acesso_Usuario(aCodUsu, aCodMenu : Integer; aNome_Acesso,
       aConsulta, aNovo, aAlterar, aExcluir : String);
    Function ValidarAcesso(aCodUsuario : Integer) : boolean;
    Function GetNomeMenu(aCodMenu : Integer) : String;
    Function Verificar_Acesso_Menu(aUsuario, aCodMenu : Integer) : String;
    Procedure Verificar_Direitoa_Acesso(aUsuario, aCodMenu : Integer);
    Function Verificar_Acesso_Botoes(aUsuario : Integer; aNomeMenu : String) : Boolean;
    Function GetCodMenu(aNomeMenu : String) : Integer;
    Procedure SetAdminUsuario(aCodigo : Integer; aValor : String);
    Function Verificar_Menu_Pai(aCodigo : Integer) : Boolean;
    Function Verificar_Usuario_Caixa(aCodigo : Integer) : Boolean;
    Function Incluir_Modalidade(aNomeModa, aFixa, aVista : String; aNrParcelas : Integer) : Integer;
    procedure CampoConta(aCombo : TComboBox);
    Function GetCodConta(aDescricao : String) : Integer;
    Procedure Fluxo_Boleto_Impresso(aSequencia, aCredito, aLoja : Integer; aSituacao, aValor : String);
    Procedure Fluxo_Boleto(aCDS: TClientDataSet; aFluxo : String);
    Function GetVerifica_Conta(aNomeConta : String) : Boolean;
    Procedure Load_Pedido(iPedido : Integer);
    Function Alterar_Pedido(iPedido, iCliente, iTABELA,  iIDTRANSPORTADORA, iTABELA_PLANO, iModalidade : integer;
            aTIPO_FRETE, aOBSERVACAO : String; fVALOR, fPERC_FRETE : Double; aCDSItens : TClientDataSet) : Boolean;
    Function Excluir_Itens_Pedido(iPedido : Integer) : Boolean;
    Function ConsultaPedidos(aData : TDate): Boolean;
    Function VerificarMesaLivre(aNumero : String): Boolean;
    Function IncluirCliente(aNome, aTelefone, aEndereco, aComplemento, aReferencia, aUF : String;
              iNumero, iBairro, iCidade : Integer) : Boolean;
    Function AddServico(aNRMESA, aHORA, aIDPRODUTO, aSTATUS : String;
         aDATA : TDate; fQUANTIDADE : Double; iItem : Integer) : Boolean;
    Function AtualizaStatusProduto(iPedido, iItem, iSequencia : Integer; aProduto,aStatus : String) : Boolean;
    Function AtualizaStatusServico(iSequencia : Integer; aStatus : String) : Boolean;
    Function AtualizaStatusServicoMesa(aMesa, aStatus : String) : Boolean;
    Function VerificarServicoMesa(aMesa : String) : Boolean;        
    Function VerificarServicoProduto(aCodido, aMesa : String) : integer;
    Function ExcluirServico(iSequencia : Integer) : Boolean;
    Function GetValidarBairro(M_NMBAIR : String; M_CDCIDA : Integer) : boolean;
    Function GetCodigoBairro(M_NMBAIR : String; M_CDCIDA : Integer) : integer;
    Function GetVerificarCidade(aNomeCidade : String) : boolean;
    Function GetCodigoCidade(aNomeCidade : String) : Integer;
    Function AddBairro(aNomeBairro : String; iCidade : Integer): Boolean;
    Function AddCidade(aNomeCidade, aUF : String): Boolean;
    Function GetVerificaTelefone(aTelefone : String): Boolean;
    Function GetCodigoClienteTelefone(aTelefone : String): Integer;
    Function GetValorPromocao(aProduto : String; iDia : Integer) : Double;
    Function ExcluirPedido(iPedido : Integer) : boolean;
    Function GetLojaCaixaAberto(iCaixa : Integer) : Integer;
    Function GetExisteNossoNumeroTitulo(iSeqTitulo : Integer): Boolean;
    Function GetNossoNumeroTitulo(iSeqTitulo : Integer): String;
    Function SetNossoNumeroTitulo(iSeqTitulo : Integer; aNumero : String): Boolean;
    Function GerarNossoNumero(aSequencia : Integer): Boolean;
    Function GetCodigoCedente(aDescricao : String): Integer;
    Function GetCodigoGrupo(aDescricao : String): Integer;
    Function GetCodigoMesReferencia(aMesRef : String) : integer;
    Function GetCodigoModalidade(aDescricao : String): integer;
    Function GetCodigoNatureza(aDescricao : String): integer;
    Function VerificarBaixaTitulo(iCedente : Integer; aNossoNumero : String): Boolean;
    Function GetNumSeqTitulo(iCedente : Integer; aNossoNumero : String): Integer;
    Function VerificarExisteNossoNumero(iCedente : Integer; aNossoNumero : String): Boolean;
    Function VerificarExisteCedenteTitulo(iSequencia : Integer) : Boolean;
    Function AtualizarCedenteTitulo(iSequencia, iCedente : Integer) : Boolean;
    Function GeraNumeroFatura() : Integer;
    Function VerificaExisteFatura(aFatura : String) : Boolean;
    Function ExcluirFatura(aFatura : String) : Boolean;
    Function IncluirTarefaUsuario(iCodigo : Integer; aAcao : String) : Boolean;
    Function VerificaTipoPessoa(iCliente : Integer) : Integer;
    Function GetMesReferencia(aDataRef : Tdatetime) : String;
    Function GetProximoNumero(iCedente : Integer) : String;
    Procedure AbrirCidadeUF(aUF : String);
    Procedure AbrirBairroCidade(iCodigo : Integer; aCDS : TClientDataSet);
    Function GetCodigoSituacao(aDescricao : String): Integer;
    Function GetVerificaContaReceberCliente(iCliente : Integer): Boolean;
    Function GetNomeEmpresa(iCodigo : Integer): String;
    Function ProcurarValor(aCampo, aValor,  aTabela : String): Boolean;
    Function GetVerificarExisteNossoNumero(aNossoNumero : String): Boolean;
    Function ExcluirContaReceber(iSequencia : Integer): Boolean;
  end;

var
  Dm: TDm;
  M_CDUSUARIO, M_NRMENS : Integer;
  CAMINHO : String;
  aArquivoAnexo, aFluxoCalc : String;
  fPeFrete, aValor_Frete : Double;

implementation

uses uFuncoes, udmConsulta, uDm2, UFrmAdmin, uDmRelatorios, udmDados, uFrmTeleEntrega;

{$R *.dfm}


procedure TDm.parametros;
begin
     dm.CdsConfig.Close;
     With dm.SdsConfig do
     begin
          Active := False;
          CommandText := 'Select * from CONFIG';
          Active := True;
     End;
     dm.CdsConfig.Open;
end;

procedure TDm.DataModuleCreate(Sender: TObject);
Var
    CAMINHO : String;
    i : integer;
    teste : TStringList;
begin
     //
     try
      With SqlAdmin do
      begin
        if Connected then
          begin
               CloseDataSets;
               Connected := False;
          end;
        // Se existi o arquivo com o IP do servidor
       { If (fileexists(ExtractFilePath( Application.ExeName )+'caminho.txt')) then
           CAMINHO := uFuncoes.percorreArquivoTexto(ExtractFilePath( Application.ExeName )+'caminho.txt')
        Else
           CAMINHO := 'C:\InfoG2\ADM\Dados\ADMIN.FDB';
        //
        ConnectionName := 'ADMIN';
        DriverName := 'Interbase';
        GetDriverFunc := 'getSQLDriverINTERBASE';
        Params.Clear;
        Params.Add('DriverName=Interbase');
        //
        Params.Add('Database='+CAMINHO);
        Params.Add('RoleName=RoleName');
        Params.Add('User_Name=SYSDBA');
        Params.Add('Password=masterkey');
        Params.Add('ServerCharSet=WIN1252');
        Params.Add('SQLDialect=3');
        Params.Add('BlobSize=-1');
        Params.Add('CommitRetain=False');
        Params.Add('WaitOnLocks=True');
        Params.Add('ErrorResourceFile=');
        Params.Add('LocaleCode=0000');
        Params.Add('Interbase TransIsolation=ReadCommited');
        Params.Add('Trim Char=False');
        VendorLib := 'C:\Arquivos de programas\Firebird\Firebird_2_1\bin\fbclient.dll';}
        //
        Connected := True;
       End;
       //
     Except
          on e: exception do
          begin
              SqlAdmin.Connected := false;
              Application.Terminate;
              raise Exception.Create('Erro na abertura de Base de Dados! Erro:'+#13
                      + E.Message);
          End;
     End;
     //
  {   Try
        SqlAdmin.Connected := True;
        //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar conectar banco de dados!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
           Application.Terminate;
        End;
     End;}
end;

procedure TDm.DataModuleDestroy(Sender: TObject);
begin
   //
   SqlAdmin.Connected := False;
end;

procedure TDm.dspBancosGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'BANCOS';
end;

procedure TDm.dspFornecedorGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'FORNECEDORES';
end;

procedure TDm.DspCargosGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'CARGOS';
end;

procedure TDm.DspSituacaoGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
      TableName := 'SITUACAO';
end;

procedure TDm.DspAtividadesGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'ATIVIDADES';
end;

procedure TDm.DspClientesGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'CLIENTES';
end;

procedure TDm.DspBairrosGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'BAIRROS';
end;

procedure TDm.DspCidadesGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'CIDADES';
end;

procedure TDm.DspContatosGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'CONTATOS';
end;

procedure TDm.dspSubSecaoGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'SUBSECAO';
end;

procedure TDm.dspSecaoGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'SECAO';
end;

procedure TDm.dspUnidadesGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'UNIDADES';
    
end;

procedure TDm.dspTributacaoGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'TRIBUTACAO';
end;

procedure TDm.dspEntradaGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'MERCADORIA';
end;

procedure TDm.cdsEntradaProdutoCalcFields(DataSet: TDataSet);
begin
     cdsEntradaProduto.FieldByName('ENP_TOTAL').AsCurrency :=
       cdsEntradaProduto.FieldByName('ENP_QUANTIDADE').AsCurrency*
       cdsEntradaProduto.FieldByName('ENP_VALOR').AsCurrency;
end;

procedure TDm.cdsDebitoCalcFields(DataSet: TDataSet);
Var
    M_QTDIAS : Double;
begin
     M_QTDIAS := Date() - cdsDebitoDEB_DTVENCIMENTO.Value;
     //If (cdsDebitoDEB_SITUACAO.AsString = 'A') Then
     If not uFuncoes.Empty(cdsDebitoDEB_DTPAGAMENTO.AsString) Then
          M_QTDIAS := cdsDebitoDEB_DTPAGAMENTO.Value - cdsDebitoDEB_DTVENCIMENTO.Value;
     //
     If (M_QTDIAS < 0) Then
         M_QTDIAS := 0;
     //
     cdsDebitoDEB_ATRASO.AsFloat := M_QTDIAS;
     //
     If (cdsDebitoDEB_SITUACAO.AsString = 'P') Then
         cdsDebitoDEB_NMSITUACAO.AsString := 'PRESTAÇÃO PAGA';
     If (cdsDebitoDEB_SITUACAO.AsString = 'C') Then
         cdsDebitoDEB_NMSITUACAO.AsString := 'VENDA CANCELA';
     If (cdsDebitoDEB_SITUACAO.AsString = 'A') Then
         cdsDebitoDEB_NMSITUACAO.AsString := 'PRESTAÇÃO ABERTO';
     If (cdsDebitoDEB_SITUACAO.AsString = '') Then
         cdsDebitoDEB_NMSITUACAO.AsString := 'PRESTAÇÃO ABERTO';
end;

procedure TDm.cdsItensVendasCalcFields(DataSet: TDataSet);
begin
     cdsItensVendasITE_VLSUBT.AsCurrency :=
        cdsItensVendasITE_VLUNIT.AsCurrency*cdsItensVendasITE_QTITEN.AsCurrency;
end;

procedure TDm.dspTransferenciaGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'TRANSFERENCIAS';
end;

procedure TDm.dspChequesGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'CHEQUES';
end;

procedure TDm.dspHistoricoGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'HISTORICO';
end;

procedure TDm.dspModalidadesGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'MODALIDADE';
end;

procedure TDm.dspDerivadosGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'DERIVADOS';
end;

procedure TDm.DspEmpresasGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
      TableName := 'EMPRESAS'; 
end;

procedure TDm.dspMovimentoGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'VENDAS';
end;

procedure TDm.dspProdutosGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'PRODUTOS';
end;

procedure TDm.dspEntradaProdutoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'MERCADORIA';
end;

procedure TDm.dspMovimentoCaixaGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'MOVIMENTO_CAIXA';
end;

procedure TDm.dspCaixaGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'CAIXA';
end;

procedure TDm.DspConfigGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'CONFIG';
end;

procedure TDm.dspAbateGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    TableName := 'ABATE';
end;

procedure TDm.dspClientesChequesGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'CHEQUE_CLIENTES';
end;

procedure TDm.ApplicationEvents1Exception(Sender: TObject; E: Exception);
var
  NomeDoLog: string;
  Arquivo: TextFile;
begin
  NomeDoLog := ChangeFileExt(Application.Exename, '.log');
  AssignFile(Arquivo, NomeDoLog);
  if FileExists(NomeDoLog) then
    Append(arquivo) { se existir, apenas adiciona linhas }
  else
    ReWrite(arquivo); { cria um novo se não existir }
  try
    WriteLn(arquivo, DateTimeToStr(Now) + ':' + E.Message);
    WriteLn(arquivo, '----------------------------------------------------------------------');
    Application.ShowException(E);
  finally
    CloseFile(arquivo)
  end;
end;

procedure TDm.Fiscal_Usuario(M_CDUSUA: Integer);
Var
    M_FLSITU : String;
begin
     If uFuncoes.Empty(UFrmAdmin.M_CDUSUA) Then
        M_CDUSUARIO := 1;
     TD.TransactionID  := M_CDUSUARIO;
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);
     //
     try
       //
       With dmConsultas.qryConsulta do
        begin
             SQL.Clear;
             Close;
             SQL.Add('Select SEN_FLIMPRESSORA from USUARIOS Where (SEN_CODIGO = :pCODIGO)');
             Params.ParamByName('pCODIGO').AsInteger  := M_CDUSUA;
             //
             Open;
             //
             If (dmConsultas.qryConsulta.FieldByName('SEN_FLIMPRESSORA').AsString = '1') Then
                 M_FLSITU := '0'
             Else
                 M_FLSITU := '1';
             //
             With dmConsultas.qryConsulta do
               begin
                   SQL.Clear;
                   Close;
                   SQL.Add('Update USUARIOS Set SEN_FLIMPRESSORA = :pFLIMPRESSORA');
                   SQL.Add('Where (SEN_CODIGO = :pCODIGO) ');
                   Params.ParamByName('pCODIGO').AsInteger      := M_CDUSUA;
                   Params.ParamByName('pFLIMPRESSORA').AsString := M_FLSITU;
                   //
                   ExecSQL();
               End;
        End;
        //
        Dm.SqlAdmin.Commit(TD);
     Except
          on Exc:Exception do
           begin
               Application.MessageBox(PChar('Erro ao tentar atualizar usuário!!!'
                       + Exc.Message),
                       'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //  Cancelar transação no BD.
                Dm.SqlAdmin.Rollback(TD);
           End;
     End;
end;

function TDm.Retorna_Barras: String;
begin
      parametros;
      //
      result := CdsConfig.FieldByName('CFG_CDBARRAS').AsString;
end;

procedure TDm.dspUsuariosGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
      TableName := 'USUARIOS';
end;

procedure TDm.Contatos_Cliente(M_CDCLIE: Integer);
begin
     With CdsContatos do
      begin
           Active := False;
           Params[0].AsInteger := M_CDCLIE;
           Active := True;
      End;
end;

procedure TDm.FilterCDS(aCds: TClientDataSet; aType: TTypeLocalizar;
  aBusca: String);
begin
     aCds.close;
     case aType of
          fsInteger : aCds.Params[0].AsInteger := StrtoInt(aBusca);
          fsString  : aCds.Params[0].AsString  := UpperCase(aBusca);
     end;
     aCds.Open;
end;

procedure TDm.RefreshCDS(aDateSet: TClientDataSet);
begin
     aDateSet.Close;
     aDateSet.Open;
end;

procedure TDm.Comit(aTransc: TTransactionDesc);
begin
     SqlAdmin.Commit(aTransc);
end;

procedure TDm.Rollback;
begin
     SqlAdmin.Rollback(Transc);
     raise Exception.Create(MSG_ERROR);
end;

procedure TDm.Start;
begin
     Transc.IsolationLevel := xilREADCOMMITTED;
     Transc.TransactionID  := StrToInt(IDTransation);
     SqlAdmin.StartTransaction(Transc);
end;


// Loja, Nr.Venda, Cod.Caixa, Cod.Natureza, TipoMov, Hora, Modalidade - 1 Dinheiro,
// Situação, Observação, DataMov, Valor Modalidade, Valor Pago, Troco
procedure TDm.Incluir_Movimento_Caixa(aLoja, aVenda, aCaixa,
  aNatureza: Integer; aTipoMov, aHora, aModa, aSitucao, aObservacao: String;
  aDtMovi: TDate; aValorModa, aTotal, aTroco: Double);
Var
   M_NRSEQU : Integer;
begin
     cdsMovimentoCaixa.Close;
     With dstMovimentoCaixa do
     Begin
          Active := False;
          CommandText := 'Select * from MOVIMENTO_CAIXA '+
                'Where (MCA_SEQUENCIA = :pSEQUENCIA) and (MCA_MODALIDADE = :pMODALIDADE)';
          Params.ParamByName('pSEQUENCIA').AsInteger := -1;
          Params.ParamByName('pMODALIDADE').AsString := aModa;
          Active := True;
     End;
     //
     cdsMovimentoCaixa.Open;
     //
     dm.RefreshCDS(cdsconfig);
     //
     cdsconfig.Edit;
     CdsConfigCFG_SEQUENCIA.AsInteger :=
        CdsConfigCFG_SEQUENCIA.AsInteger + 1;
     cdsconfig.ApplyUpdates(0);
     //
     M_NRSEQU := CdsConfigCFG_SEQUENCIA.AsInteger;
     //  Movimento de Caixa
     With cdsMovimentoCaixa do
       Begin
            Append;
            FieldByName('MCA_SEQUENCIA').AsInteger := M_NRSEQU;
            FieldByName('MCA_LOJA').AsInteger      := aLoja;
            FieldByName('MCA_VENDA').AsInteger     := aVenda;
            FieldByName('MCA_TIPOMOV').AsString    := aTipoMov;
            FieldByName('MCA_DTMOVIMENTO').AsDateTime := aDtMovi;
            FieldByName('MCA_HRMOVIMENTO').AsString   := aHora;
            FieldByName('MCA_MODALIDADE').AsString :=  aModa;
            FieldByName('MCA_VLMODALIDADE').AsCurrency := aValorModa;
            FieldByName('MCA_TOVENDA').AsCurrency  := aTotal;
            FieldByName('MCA_VLTROCO').AsCurrency  := aTroco;
            FieldByName('MCA_SITUACAO').AsString   := aSitucao;
            FieldByName('MCA_OBSEVACAO').AsString  := aObservacao;
            FieldByName('MCA_CAIXA').AsInteger     := aCaixa;
            FieldByName('MCA_NATUREZA').AsInteger  := aNatureza;
            Post;
            ApplyUpdates(0);
       End;
End;

procedure TDm.Baixar_Titulo(aCredito : Integer; aDataRecebimento,
  aDataCredito: TDate; aValorDespesaCobranca, aValorAbatimento,
  aValorDesconto, aValorMoraJuros: Double; aCaixa : Integer);
Var
   aDescNat, M_HOMOVI : String;
   M_CDMODA, W_CDLOJA, W_NRVEND, W_CDCAIX, W_CDNATU : Integer;
   M_DTMOVI : TDate;
   M_VLPAGO : Double;
begin
     M_CDMODA := Incluir_Modalidade('BOLETO','D','A',1);
     //
   Start;   
   try
     FilterCDS(DM2.cdsContasReceber, fsInteger, InttoStr(aCredito));
     if not (DM2.cdsContasReceber.IsEmpty) Then
     begin
         aDescNat := 'RECEBIMENTO DE BOLETOS';
         //
         With DM2.cdsContasReceber do
          begin
               Edit;
               FieldByName('REC_DATAPAGAMENTO').AsDateTime := aDataRecebimento;
               FieldByName('REC_DATA_CREDITO').AsDateTime  := aDataCredito;
               FieldByName('REC_PAGO').AsFloat             := FieldByName('REC_VALORPARCELA').AsFloat;
               FieldByName('REC_SITUACAO').AsString        := 'P';
               //FieldByName('REC_NATUREZA').AsInteger       := ;
               FieldByName('REC_TIPOMODALIDADE').AsInteger := M_CDMODA;
               { := ValorDespesaCobranca;
                := ValorAbatimento;
                := ValorDesconto;
                := ValorMoraJuros;}
                W_CDLOJA := FieldByName('REC_LOJA').AsInteger;
                W_NRVEND := FieldByName('REC_NRVENDA').AsInteger;
                W_CDCAIX := aCaixa;
                W_CDNATU := dmConsultas.GetNaturezaCogigo(aDescNat);
                M_VLPAGO := FieldByName('REC_PAGO').AsFloat;
                M_DTMOVI := Date();
                M_HOMOVI := Copy(TimetoStr(Time),1,5);
               //
               ApplyUpdates(0);
               //  Incluir Movimento de Caixa
               // Loja, Nr.Venda, Cod.Caixa, Cod.Natureza, TipoMov, Hora, Modalidade - 1 Dinheiro,
               // Situação, Observação, DataMov, Valor Modalidade, Valor Pago, Troco
               Dm.Incluir_Movimento_Caixa(W_CDLOJA, W_NRVEND, W_CDCAIX, W_CDNATU, 'R',
                        M_HOMOVI, '1', '', 'RECEBIMENTO DE BOLETO',M_DTMOVI, M_VLPAGO, M_VLPAGO, 0);
          End;
     End;
      Comit(Transc);
   Except
        Rollback;
   End;
end;

procedure TDm.Incluir_Natureza(aDescricao, aTipo: String);
Var
   aCodigo : Integer;
begin
     if not (dmConsultas.GetNatureza(aDescricao)) Then
     begin
          RefreshCDS(CdsConfig);
          //
          CdsConfig.edit;
             CdsConfigCFG_NATUREZA.AsInteger :=
                CdsConfigCFG_NATUREZA.AsInteger + 1;
          CdsConfig.ApplyUpdates(0);
          aCodigo := CdsConfigCFG_NATUREZA.AsInteger;
          //
       with dmConsultas.qryConsulta do
        begin
             SQL.Clear;
             Close;
             SQL.Add('INSERT INTO NATUREZA (NAT_CODIGO, NAT_NOME, NAT_TIPO)');
             SQL.Add('Values (:pCODIGO, :pNOME, :pTIPO) ');
             Params.ParamByName('pCODIGO').AsInteger := aCodigo;
             Params.ParamByName('pNOME').AsString    := aDescricao;
             Params.ParamByName('pTIPO').AsString    := aTipo;
             ExecSQL();
        End;
     End;   
end;

procedure TDm.Atualizar_Fluxo_Parcela(aCredito, aParcela,
  aCliente: Integer);
begin
     With dmConsultas.qryConsulta do
      begin

      End;
end;

procedure TDm.Acessos_Sistema(aCds: TClientDataSet; aTipo, aCodUsu : Integer);
begin
     aCds.Close;
     aCds.Open;
     aCds.EmptyDataSet;
     //
     If (aTipo = 1) Then
     begin
      With dmRelatorios.cdsAcessos do
      begin
           Active := False;
           CommandText := 'Select * from MENUS Where (MEN_NOME <> '+QuotedStr('-')+') order by MEN_CODIGO ';
           Active := True;
           //
           If not (IsEmpty) Then
            begin
                 First;
                 //
                 While not (dmRelatorios.cdsAcessos.Eof) do
                 begin
                       With aCds do
                       begin
                            append;
                            FieldByName('CODIGO').AsInteger    := dmRelatorios.cdsAcessos.FieldByName('MEN_CODIGO').AsInteger;
                            FieldByName('MENU_NOME').AsString  := dmRelatorios.cdsAcessos.FieldByName('MEN_NOME').AsString;
                            FieldByName('MENU_PAI').AsInteger  := dmRelatorios.cdsAcessos.FieldByName('MEN_CODIGOPAI').AsInteger;
                            FieldByName('PERMISSAO').AsBoolean := False;
                            FieldByName('NOVO').AsBoolean      := False;
                            FieldByName('ALTERAR').AsBoolean   := False;
                            FieldByName('EXCLUIR').AsBoolean   := False;
                            Post;
                       End;
                       //
                       dmRelatorios.cdsAcessos.Next;
                  End;
                  //
                  aCds.First;
            End;
      End;
      //
     End;
     // Tipo dois
     If (aTipo = 2) Then
     begin
          With dmdados.cdsPermissoes do
             begin
                 Active := False;
                 CommandText := 'Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO)';
                 Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
                 Active := True;
                 //
                 If not (IsEmpty) Then
                  begin
                   First;
                   //
                   While not (dmdados.cdsPermissoes.Eof) do
                   begin
                       With aCds do
                       begin
                            append;
                            FieldByName('CODIGO').AsInteger    := dmdados.cdsPermissoes.FieldByName('MEN_CODIGO').AsInteger;
                            FieldByName('MENU_NOME').AsString  := GetNomeMenu(dmdados.cdsPermissoes.FieldByName('MEN_CODIGO').AsInteger);
                            If Verificar_Menu_Pai(dmdados.cdsPermissoes.FieldByName('MEN_CODIGO').AsInteger) Then
                                FieldByName('MENU_PAI').AsInteger  := 1;
                            //
                            If (dmdados.cdsPermissoes.FieldByName('PU_CONSULTAR').AsString = 'S') Then
                                FieldByName('PERMISSAO').AsBoolean := True
                            Else
                                FieldByName('PERMISSAO').AsBoolean := False;
                            //
                            If (dmdados.cdsPermissoes.FieldByName('PG_NOVO').AsString = 'S') Then
                                FieldByName('NOVO').AsBoolean      := True
                            Else
                                FieldByName('NOVO').AsBoolean      := False;
                            //
                            If (dmdados.cdsPermissoes.FieldByName('PU_ALTERAR').AsString = 'S') Then
                                FieldByName('ALTERAR').AsBoolean   := True
                            Else
                                FieldByName('ALTERAR').AsBoolean   := False;
                            //
                            If (dmdados.cdsPermissoes.FieldByName('PU_APAGAR').AsString = 'S') Then
                                FieldByName('EXCLUIR').AsBoolean   := True
                            Else
                                FieldByName('EXCLUIR').AsBoolean   := False;
                            //
                            Post;
                       End;
                       //
                       dmdados.cdsPermissoes.Next;
                     End;  // fim-enquanto
                  //
                  aCds.First;
                  End;
             End;
     End;
end;

procedure TDm.Incluir_Acesso_Usuario(aCodUsu, aCodMenu : Integer; aNome_Acesso,
  aConsulta, aNovo, aAlterar, aExcluir: String);
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO) and (MEN_CODIGO = :pMENU)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
      Params.ParamByName('pMENU').AsInteger   := aCodMenu;
      open;
      //
           If (IsEmpty) Then   // incluir registro
           begin
                With dmdados.cdsPermissoes do
                  begin
                       Active := False;
                       CommandText := 'Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO) and (MEN_CODIGO = :pMENU)';
                       Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
                       Params.ParamByName('pMENU').AsInteger   := aCodMenu;
                       Active := True;
                       //
                       Append;
                       FieldByName('USU_CODIGO').AsInteger := aCodUsu;
                       FieldByName('MEN_CODIGO').AsInteger := aCodMenu;
                       ApplyUpdates(0);
                  End;
           End      // altera registro
           Else
           begin
                With dmdados.cdsPermissoes do
                  begin
                       Active := False;
                       CommandText := 'Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO) and (MEN_CODIGO = :pMENU)';
                       Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
                       Params.ParamByName('pMENU').AsInteger   := aCodMenu;
                       Active := True;
                       //
                       edit;
                       FieldByName('PG_NOVO').AsString      := aNovo;
                       FieldByName('PU_ALTERAR').AsString   := aAlterar;
                       FieldByName('PU_APAGAR').asString    := aExcluir;
                       FieldByName('PU_CONSULTAR').AsString := aConsulta;
                       //
                       ApplyUpdates(0);
                  End;
           End;

      //
    finally
      free;
    end;

    { with dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           Sql.Add('Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO) and (MEN_CODIGO = :pMENU)');
           Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
           Params.ParamByName('pMENU').AsInteger   := aCodMenu;
           Open;
           //
           If (IsEmpty) Then   // incluir registro
           begin
                With dmdados.cdsPermissoes do
                  begin
                       Active := False;
                       CommandText := 'Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO) and (MEN_CODIGO = :pMENU)';
                       Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
                       Params.ParamByName('pMENU').AsInteger   := aCodMenu;
                       Active := True;
                       //
                       Append;
                       FieldByName('USU_CODIGO').AsInteger := aCodUsu;
                       FieldByName('MEN_CODIGO').AsInteger := aCodMenu;
                       ApplyUpdates(0);
                  End;
           End      // altera registro
           Else
           begin
                With dmdados.cdsPermissoes do
                  begin
                       Active := False;
                       CommandText := 'Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO) and (MEN_CODIGO = :pMENU)';
                       Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
                       Params.ParamByName('pMENU').AsInteger   := aCodMenu;
                       Active := True;
                       //
                       edit;
                       FieldByName('PG_NOVO').AsString      := aNovo;
                       FieldByName('PU_ALTERAR').AsString   := aAlterar;
                       FieldByName('PU_APAGAR').asString    := aExcluir;
                       FieldByName('PU_CONSULTAR').AsString := aConsulta;
                       //
                       ApplyUpdates(0);
                  End;
           End;
      End;  }
end;

function TDm.ValidarAcesso(aCodUsuario: Integer): boolean;
begin
     Result := False;
     with dmConsultas.qryConsulta do
     //with dmRelatorios.cdsValidarAcesso do
      begin
           {Active := False;
           CommandText := 'Select PU.usu_codigo, count(*) as QUANT from PERMISSOES_USUARIOS PU ';
           CommandText := CommandText + ' Where (PU.usu_codigo = :pUSUARIO) group by PU.usu_codigo ';}
           SQL.Clear;
           Close;
           sql.Add('Select PU.usu_codigo, count(*) as QUANT from PERMISSOES_USUARIOS PU ');
           sql.Add(' Where (PU.usu_codigo = :pUSUARIO) group by PU.usu_codigo ');
           Params.ParamByName('pUSUARIO').AsInteger := aCodUsuario;
           Open;
           ///Active := True;
           //
           If not(IsEmpty) Then
              if (FieldByName('QUANT').AsFloat > 0) Then
                 Result := True;
           //
           Active := False;
      End;
end;

function TDm.GetNomeMenu(aCodMenu  : Integer): String;
begin
     //With dmConsultas.qryConsulta do
     with cdsGetNomeMenu do
      begin
           Active := False;
           CommandText := 'Select MEN_NOME from MENUS Where (MEN_CODIGO = :pCODIGO)';
           Params.ParamByName('pCODIGO').AsInteger := aCodMenu;
           Active := True;
           //
            if not (IsEmpty) Then
              Result := FieldByName('MEN_NOME').AsString
            Else
              Result := 'MENU NÃO ENCONTRADO';
           //
           Active := False;
      End;
end;

function TDm.Verificar_Acesso_Menu(aUsuario, aCodMenu : Integer): String;
begin
     result := 'N';
     //With dmConsultas.qryConsulta do
     with dm.cdsAcessoMenu do
      begin
           Active := False;
           CommandText := 'SELECT PU_CONSULTAR FROM PERMISSOES_USUARIOS ';
           CommandText := CommandText + 'WHERE (USU_CODIGO = :CODUSUARIO) AND (MEN_CODIGO = :CODMENU)';
           Params.ParamByName('CODUSUARIO').AsInteger := aUsuario;
           Params.ParamByName('CODMENU').AsInteger    := aCodMenu;
           Active := True;
           //
           If not (IsEmpty) Then
             If (FieldByName('PU_CONSULTAR').AsString = 'S') Then
                Result := FieldByName('PU_CONSULTAR').AsString;
           //
           Active := False;
      End;
end;

procedure TDm.Verificar_Direitoa_Acesso(aUsuario, aCodMenu: Integer);
begin
     //With dmConsultas.qryConsulta do
     with dmConsultas.cdsConsulta2 do
      begin
           Active := False;
           CommandText := 'SELECT PG_NOVO, PU_ALTERAR, PU_APAGAR, PU_CONSULTAR FROM PERMISSOES_USUARIOS ';
           CommandText := CommandText +'WHERE (USU_CODIGO = :CODUSUARIO) AND (MEN_CODIGO = :CODMENU)';
           Params.ParamByName('CODUSUARIO').AsInteger := aUsuario;
           Params.ParamByName('CODMENU').AsInteger    := aCodMenu;
           Active := True;
           //
           If not (IsEmpty) Then
            begin
                 uFrmAdmin.aNovo    := FieldByName('PG_NOVO').AsString;
                 uFrmAdmin.aAlterar := FieldByName('PU_ALTERAR').AsString;
                 uFrmAdmin.aApagar  := FieldByName('PU_APAGAR').AsString;
            End;
           //
           Active := False;
      End;
end;

function TDm.Verificar_Acesso_Botoes(aUsuario: Integer;
  aNomeMenu: String): Boolean;
begin
     Result := False;
     //
     //With dmConsultas.qryConsulta do
     with dmConsultas.cdsConsulta2 do
      begin
           Active := False;
           CommandText := 'Select PU.USU_CODIGO, PU.MEN_CODIGO, PU.PU_CONSULTAR, M.MEN_NOME from PERMISSOES_USUARIOS PU ';
           CommandText := CommandText  + 'INNER join MENUS M ON M.MEN_CODIGO = PU.MEN_CODIGO ';
           CommandText := CommandText  + ' Where (PU.USU_CODIGO = :pCODIGO) AND (M.MEN_NOME = :pNOME)';
           Params.ParamByName('pCODIGO').AsInteger  := aUsuario;
           Params.ParamByName('pNOME').AsString     := aNomeMenu;
           Active := True;
           //
           If not (IsEmpty) Then
              If (FieldByname('PU_CONSULTAR').AsString = 'S') Then
                 Result := True;
           //
           Active := False;
      End;
end;


function TDm.GetCodMenu(aNomeMenu: String): Integer;
begin
     //With dmConsultas.qryConsulta do
     with dmConsultas.cdsConsulta2 do
      begin
           Active := False;
           CommandText := 'Select MEN_CODIGO from MENUS Where (MEN_NOME = :pNOME)';
           Params.ParamByName('pNOME').AsString := aNomeMenu;
           Active := True;
           //
            if not (IsEmpty) Then
              Result := FieldByName('MEN_CODIGO').AsInteger;
           //
           Active := False;
      End;
end;

procedure TDm.SetAdminUsuario(aCodigo: Integer; aValor: String);
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Update USUARIOS SET USU_ADMIN = :pValor ');
           SQL.Add('Where (SEN_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsInteger := aCodigo;
           Params.ParamByName('pValor').AsString := aValor;
           ExecSQL();
      End;
end;

function TDm.Verificar_Menu_Pai(aCodigo: Integer): Boolean;
begin
     result := False;
     // With dmConsultas.qryConsulta do
     With dmConsultas.cdsConsulta2 do
      begin
           Active := False;
           CommandText := 'Select MEN_CODIGO, MEN_CODIGOPAI from MENUS ';
           CommandText := CommandText + 'Where (MEN_CODIGO = :pCODIGO)';
           Params.ParamByName('pCODIGO').AsInteger := aCodigo;
           Active := True;
           //
           If not (IsEmpty) Then
              If (fieldByName('MEN_CODIGOPAI').IsNull) Then
                 Result := True;
           //
           Active := False;
      End;
end;

function TDm.Verificar_Usuario_Caixa(aCodigo: Integer): Boolean;
begin
     result := False;
     //With dmConsultas.qryConsulta   do
     With cdsConsulta do
     begin
          Active := False;
          CommandText := 'Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA from USUARIOS ';
          CommandText := CommandText + 'Where (SEN_CODIGO = :pCODIGO) ';
          Params.ParamByName('pCODIGO').AsInteger := aCodigo;
          //
          Active := True;
          //
          If not (IsEmpty) Then
              result := True;
     End;
end;

Function TDm.Incluir_Modalidade(aNomeModa, aFixa, aVista : String; aNrParcelas : Integer) : Integer;
begin
     with dmConsultas.qryConsulta do
      begin
          SQL.Clear;
          Close;
          SQL.Add('Select MOD_CODIGO, MOD_NOME from MODALIDADE ');
          SQL.Add('Where (MOD_NOME = :pNOME)');
          Params.ParamByName('pNOME').AsString := aNomeModa;
          //
          Open;
          //
          If not (IsEmpty) Then
            begin
                 RefreshCDS(CdsConfig);
                 //
                 CdsConfig.Edit;
                 CdsConfigCFG_MODALIDADE.AsInteger :=
                    CdsConfigCFG_MODALIDADE.AsInteger + 1;
                 CdsConfig.ApplyUpdates(0);
                 //
                 With dmDados.qryAux do
                  begin
                       SQL.Clear;
                       Close;
                       SQL.Add('Insert into MODALIDADE (MOD_CODIGO, MOD_NOME, MOD_PECOMISSAO, MOD_ABREVIACAO, MOD_NRPARCELA, MOD_FLFIXA, MOD_AVISTA)');
                       SQL.Add('Values (:pCODIGO, :pNOME, :pPECOMISSAO, :pABREVIACAO, :pNRPARCELA, :pFLFIXA, :pAVISTA)');
                       ParamByName('pCODIGO').AsInteger := CdsConfigCFG_MODALIDADE.AsInteger;
                       ParamByName('pNOME').AsString    := aNomeModa;
                       ParamByName('pPECOMISSAO').AsFloat  := 0;
                       ParamByName('pABREVIACAO').AsString := Copy(aNomeModa,1,3);
                       ParamByName('pNRPARCELA').AsFloat := aNrParcelas;
                       ParamByName('pFLFIXA').AsString   := aFixa;
                       ParamByName('pAVISTA').AsString   := aVista;
                       ExecSQL();
                  End;
                  //
                  Result := CdsConfigCFG_MODALIDADE.AsInteger;
            End
            Else
                Result := FieldByName('MOD_CODIGO').AsInteger;
      End;
end;

procedure TDm.CampoConta(aCombo: TComboBox);
begin
     RefreshCDS(dmRelatorios.cdsContaSaldo);
     //
     with dmRelatorios.cdsContaSaldo do
      begin
           First;
           aCombo.Clear;
           While not (Eof) do
           begin
                aCombo.Items.add(FieldByName('CGS_DESCRICAO').AsString);
                //
                next;
           End;
      End;
end;

function TDm.GetCodConta(aDescricao: String): Integer;
begin
     With dmConsultas.cdsConsulta2   do
     begin
          Active := False;
          CommandText := 'Select CGS_CODIGO, CGS_DESCRICAO from CONTAS_SALDOS ';
          CommandText := CommandText + ' Where (CGS_DESCRICAO = :pNOME)';
          Params.ParamByName('pNOME').AsString := aDescricao;
          //
          Active := True;
          //
          If not (IsEmpty) Then
             Result := FieldByname('CGS_CODIGO').AsInteger;
     End;
end;

procedure TDm.Fluxo_Boleto_Impresso(aSequencia, aCredito,
  aLoja: Integer; aSituacao, aValor: String);
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Update CONTASRECEBER SET REC_FLBOLETO = :pFLBOLETO');
           SQL.Add(' Where (REC_SEQUENCIA = :pSEQUENCIA) and (REC_CREDITO = :pCREDITO) and (REC_SITUACAO = :pSITUACAO)');
           ParamByName('pSEQUENCIA').AsInteger := aSequencia;
           ParamByName('pCREDITO').AsInteger   := aCredito;
           //ParamByName('pLOJA').AsInteger      := aLoja;
           ParamByName('pSITUACAO').AsString   := 'A';
           ParamByName('pFLBOLETO').AsString   := aValor;
           ExecSQL();
      End;
end;

procedure TDm.Fluxo_Boleto(aCDS: TClientDataSet; aFluxo : String);
begin
     Dm.Fluxo_Boleto_Impresso(
        aCDS.FieldByName('REC_SEQUENCIA').AsInteger,
        aCDS.FieldByName('REC_CREDITO').AsInteger,
        aCDS.FieldByName('REC_LOJA').AsInteger,
        'A', aFluxo);
end;

function TDm.GetVerifica_Conta(aNomeConta: String): Boolean;
begin
     result := False;
     With dmConsultas.qryConsulta   do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select * from CONTAS_SALDOS ');
          SQL.Add('Where (CGS_DESCRICAO = :pDESCRICAO)');
          Params.ParamByName('pDESCRICAO').AsString := aNomeConta;
          //
          Open;
          //
          If not (IsEmpty) Then
             If not Empty(FieldByName('CGS_NRCONTA').AsString) Then
                result := True;
     End;
end;

procedure TDm.Load_Pedido(iPedido: Integer);
Var
   M_NRITEM : Integer;
begin
    try
        cdsMovimento.Close;
        With dstMovimento  do
          begin
               Close;
               Params.ParamByName('pPEDIDO').AsInteger := iPedido;
               Open;
          End;
        cdsMovimento.Open;
         //
         If not (cdsMovimento.IsEmpty) Then
         begin
              If (dmConsultas.cdsItensVendas.IsEmpty) Then
                dmConsultas.cdsItensVendas.Open;
              //
              With dmDados.cdsItensPedido do
                begin
                     Close;
                     Params.ParamByName('pPEDIDO').AsInteger := iPedido;
                     Open;
                     //
                     If not (IsEmpty) Then
                      begin
                           First;
                           //
                           M_NRITEM := 1;
                           While not (Eof) do
                            begin
                                 dmConsultas.cdsItensVendas.Append;
                                 //
                                 dmConsultas.cdsItensVendasITE_NRITEN.AsString := uFuncoes.StrZero(inttoStr(M_NRITEM),3);
                                 dmConsultas.cdsItensVendasITE_CDITEN.AsString := FieldbyName('MOP_PRODUTO').AsString;
                                 dmConsultas.cdsItensVendasITE_REFERE.AsString := dmConsultas.GetCodReferencia(FieldbyName('MOP_PRODUTO').AsString);
                                 dmConsultas.cdsItensVendasITE_NMDESC.AsString := NOME_PRODUTO(FieldbyName('MOP_PRODUTO').AsString);
                                 dmConsultas.cdsItensVendasITE_QTITEN.AsFloat  := FieldbyName('MOP_QUANTIDADE').AsFloat;
                                 dmConsultas.cdsItensVendasITE_CDUNID.AsString := FieldbyName('MOP_UNIDADE').AsString;
                                 dmConsultas.cdsItensVendasITE_VLUNIT.AsFloat  := FieldbyName('MOP_VALOR').AsFloat;
                                 dmConsultas.cdsItensVendasITE_VLCOMP.AsFloat  := FieldbyName('MOP_COMPRA').AsFloat;
                                 dmConsultas.cdsItensVendasITE_CODCOR.AsInteger := FieldbyName('MOP_CODCOR').AsInteger;
                                 dmConsultas.cdsItensVendasITE_NOMCOR.AsString  := uFuncoes.GetCor(FieldbyName('MOP_CODCOR').AsInteger);
                                 dmConsultas.cdsItensVendasITE_VLCUST.AsFloat  := FieldbyName('MOP_CUSTO').AsFloat;
                                 dmConsultas.cdsItensVendasITE_VLDESC.AsFloat  := FieldbyName('MOP_DESCONTO').AsFloat;
                                 dmConsultas.cdsItensVendasITE_VALIPI.AsFloat  := FieldbyName('MOP_VALIPI').AsFloat;
                                 //uFuncoes.getIPIProduto(FieldbyName('MOP_PRODUTO').AsString);
                                 {dmConsultas.cdsItensVendasITE_VLSUBT.AsFloat  :=
                                   (dmConsultas.cdsItensVendasITE_VLUNIT.AsFloat * dmConsultas.cdsItensVendasITE_QTITEN.AsFloat);}
                                 //
                                 dmConsultas.cdsItensVendas.Post;
                                 //
                                 M_NRITEM := M_NRITEM + 1;
                                 Next;
                            End;
                      End;
                End;
         End;
         //
    Except
        ShowMessage('Erro!!!');
    End;
end;

function TDm.Alterar_Pedido(iPedido, iCliente, iTABELA, iIDTRANSPORTADORA,
  iTABELA_PLANO, iModalidade : integer; aTIPO_FRETE, aOBSERVACAO: String; fVALOR,
  fPERC_FRETE: Double; aCDSItens: TClientDataSet): Boolean;
var qraux, qraux1 : TSQLquery;
    texto : string;
begin
     result := false;
     //
     Start;
     Try
          texto := 'Update VENDAS Set MOV_CLIENTE = :pCLIENTE, MOV_TABELA = :pTABELA, MOV_IDTRANSPORTADORA = :pTRANSPORTADORA, MOV_TABELA_PLANO = :pTABELA_PLANO, MOV_MODALIDADE_PEDIDO = :pMODA, ';
          texto := texto + ' MOV_TIPO_FRETE = :pTIPO_FRETE, MOV_OBSERVACAO = :pOBSERVACAO, MOV_VALOR = :pVALOR, MOV_PERC_FRETE = :pPERC_FRETE ';
          texto := texto + ' Where (MOV_PEDIDO = :pPEDIDO)';
          QrAux := TSqlquery.Create(nil);
          with QrAux do
          try
            SQLConnection := dm.SQLAdmin;
            sql.Add(texto);
            Params.ParamByName('pPEDIDO').AsInteger  := iPedido;
            Params.ParamByName('pCLIENTE').AsInteger := iCliente;
            Params.ParamByName('pTABELA').AsInteger  := iTABELA;
            Params.ParamByName('pTRANSPORTADORA').AsInteger := iIDTRANSPORTADORA;
            Params.ParamByName('pTABELA_PLANO').AsInteger   := iTABELA_PLANO;
            Params.ParamByName('pTIPO_FRETE').AsString := aTIPO_FRETE;
            Params.ParamByName('pOBSERVACAO').AsBlob   := aOBSERVACAO;
            Params.ParamByName('pVALOR').AsFloat       := fVALOR;
            Params.ParamByName('pPERC_FRETE').AsFloat  := fPERC_FRETE;
            Params.ParamByName('pMODA').AsInteger      := iModalidade;
            ExecSQL();
            // Excluir itens
            If (Excluir_Itens_Pedido(iPedido)) Then
              begin
                   // Itens do pedido
                   with aCDSItens do
                     begin
                          DisableControls;
                          First;
                          While not (Eof) do
                           begin
                                With dmConsultas.qryIncluir do
                                 Begin
                                      SQL.Clear;
                                      Close;
                                      SQL.Add('INSERT INTO PROVENDAS (MOP_PEDIDO, MOP_PRODUTO, MOP_QUANTIDADE, ');
                                      SQL.Add('MOP_UNIDADE, MOP_VALOR, MOP_DESCONTO, MOP_CUSTO, MOP_COMPRA, MOP_CODCOR, MOP_VALIPI)');
                                      SQL.Add('VALUES (:pPEDIDO, :pPRODUTO, :pQUANTIDADE, ');
                                      SQL.Add(':pUNIDADE, :pVALOR, :pDESCONTO, :pCUSTO, :pCOMPRA, :pCODCOR, :pVALIPI)');
                                      //
                                      Params.ParamByName('pPEDIDO').AsInteger   := iPedido;
                                      Params.ParamByName('pPRODUTO').AsString   := aCDSItens.FieldByName('ITE_CDITEN').AsString;
                                      Params.ParamByName('pQUANTIDADE').AsFloat := aCDSItens.FieldByName('ITE_QTITEN').AsFloat;
                                      Params.ParamByName('pUNIDADE').AsString   := aCDSItens.FieldByName('ITE_CDUNID').AsString;
                                      Params.ParamByName('pVALOR').AsCurrency   := aCDSItens.FieldByName('ITE_VLUNIT').AsCurrency;
                                      Params.ParamByName('pDESCONTO').AsCurrency := aCDSItens.FieldByName('ITE_VLDESC').AsFloat;
                                      Params.ParamByName('pCUSTO').AsCurrency   := aCDSItens.FieldByName('ITE_VLCOMP').AsCurrency;
                                      Params.ParamByName('pCOMPRA').AsCurrency  := aCDSItens.FieldByName('ITE_VLCUST').AsCurrency;
                                      Params.ParamByName('pCODCOR').AsInteger   := aCDSItens.FieldByName('ITE_CODCOR').AsInteger;
                                      Params.ParamByName('pVALIPI').AsFloat     := aCDSItens.FieldByName('ITE_VALIPI').AsFloat;
                                      //
                                      ExecSQL();
                                 End;
                                //
                                Next;
                           End;
                           EnableControls;
                     End;
                  //
                  result := True;
              End;
          finally
            free;
          end;
          //
          Comit(Transc);
          result := True;
     Except
           Rollback;
     End;
end;

function TDm.Excluir_Itens_Pedido(iPedido: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Delete from PROVENDAS Where (MOP_PEDIDO = :pPEDIDO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pPEDIDO').AsInteger := iPedido;
      ExecSQL();
      //
      result := True;
    finally
      free;
    end;
end;

function TDm.ConsultaPedidos(aData: TDate): Boolean;
begin
     Result := True;
     //
     With dmConsultas.cdsVendas do
     Begin
          Close;
          Params.ParamByName('pDATA').AsDate := aData;
          Open;
          //
          If (IsEmpty) Then
             Result := False;
     End;
end;

procedure TDm.SqlAdminBeforeConnect(Sender: TObject);
Var 
	ConfigIni : TIniFile;
	Path, aFile : String;
Begin
  aFile := ExtractFilePath(ParamStr(0)) + 'fbclient.dll';
  SqlAdmin.VendorLib := aFile;
	ConfigIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
	SqlAdmin.Params.Values['Database'] := ConfigIni.ReadString('CONFIG','DATABASE','');
	ConfigIni.Free;
end;

function TDm.VerificarMesaLivre(aNumero : String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'select PV.PRV_PEDIDO, PV.prv_loja, PV.prv_nrmesa, PV.prv_situacao from PRE_VENDA PV Where (PV.prv_nrmesa = :pMESA) and (PV.prv_situacao = '+QuotedStr('A')+')';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pMESA').AsString := aNumero;
      Open;
      //
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
end;

function TDm.IncluirCliente(aNome, aTelefone, aEndereco, aComplemento,
  aReferencia, aUF: String; iNumero, iBairro, iCidade: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Insert Into Clientes (CLI_CODIGO, CLI_TIPOPESSOA, CLI_RAZAO, CLI_FANTASIA, CLI_ENDERECO, CLI_NUMERO, BAI_CODIGO, CID_CODIGO, CLI_FONE1, CLI_UFCLIENTE, CLI_END_COBRANCA, CLI_PONTO_REFERENCIA, CLI_DATACAD, CLI_HORA_INC) ';
  texto := texto + 'Values (:pCODIGO, :pTIPOPESSOA, :pRAZAO, :pFANTASIA, :pENDERECO, :pNUMERO, :pBAIRRO, :pCIDADE, :pFONE1, :pUFCLIENTE, :pENDCOBRANCA, :pPONTO_REFERENCIA, :pDATA, :pHORA) ';
  //
  RefreshCDS(CdsConfig);
  CdsConfig.Edit;
  CdsConfigCFG_CLIENTE.AsInteger := CdsConfigCFG_CLIENTE.AsInteger + 1;
  CdsConfig.ApplyUpdates(0);
  //
  uFrmTeleEntrega.M_CDCLIE := CdsConfigCFG_CLIENTE.AsInteger;
  //
  RefreshCDS(CdsConfig);
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      Start;
        try
          SQLConnection := dm.SQLAdmin;
          sql.Add(texto);
          Params.ParamByName('pCODIGO').AsInteger    := CdsConfigCFG_CLIENTE.AsInteger;
          Params.ParamByName('pTIPOPESSOA').AsString := 'F';
          Params.ParamByName('pRAZAO').AsString      := aNome;
          Params.ParamByName('pFANTASIA').AsString   := aNome;
          Params.ParamByName('pENDERECO').AsString   := aEndereco;
          Params.ParamByName('pNUMERO').AsInteger    := iNumero;
          Params.ParamByName('pBAIRRO').AsInteger    := iBairro;
          Params.ParamByName('pCIDADE').AsInteger    := iCidade;
          Params.ParamByName('pFONE1').AsString      := aTelefone;
          Params.ParamByName('pUFCLIENTE').AsString  := aUF;
          Params.ParamByName('pENDCOBRANCA').AsString := aComplemento;
          Params.ParamByName('pPONTO_REFERENCIA').AsString := aReferencia;
          Params.ParamByName('pDATA').AsDate         := Date();
          Params.ParamByName('pHORA').AsString       := Copy(TimetoStr(Time),1,5);
          ExecSQL();
          //
          Comit(Transc);
          //
          result := True;
        Except
            Rollback;
        End;
    finally
      free;
    end;
end;

function TDm.AddServico(aNRMESA, aHORA, aIDPRODUTO, aSTATUS: String;
  aDATA: TDate; fQUANTIDADE: Double; iItem : Integer): Boolean;
Var
   iSequencia : integer;
begin
   result := false;
   RefreshCDS(CdsConfig);
   //
   Start;
   try
     CdsConfig.Edit;
     CdsConfigCFG_SEQUENCIA_SERVICO.AsInteger :=
        CdsConfigCFG_SEQUENCIA_SERVICO.AsInteger + 1;
     CdsConfig.ApplyUpdates(0);
     //
     iSequencia := CdsConfigCFG_SEQUENCIA_SERVICO.AsInteger;
     //
     with dmDados.cdsServicos do
      begin
           Close;
           Params.ParamByName('pSEQUENCIA').AsInteger :=
               CdsConfigCFG_SEQUENCIA_SERVICO.AsInteger;
           Open;
           //
           If (Active) Then
            begin
                 Append;
                 //
                 FieldByName('STS_SEQUENCIA').AsInteger := CdsConfigCFG_SEQUENCIA_SERVICO.AsInteger;
                 FieldByName('STS_NRMESA').AsString     := aNRMESA;
                 FieldByName('STS_DATA').AsDateTime     := aDATA;
                 FieldByName('STS_HORA').AsString       := aHORA;
                 FieldByName('STS_IDPRODUTO').AsString  := aIDPRODUTO;
                 FieldByName('STS_QUANTIDADE').AsFloat  := fQUANTIDADE;
                 FieldByName('STS_STATUS').AsString     := aSTATUS;
                 //
                 ApplyUpdates(0);
            End;
      End;
      //
      Comit(Transc);
      //
      //  AtualizaStatusProduto(iPedido, iItem, iSequencia: Integer; aProduto,
      //  aStatus: String)
      Dm.AtualizaStatusProduto(dmDados.cdsPreVendaPRV_PEDIDO.AsInteger,
                               iItem, iSequencia, aIDPRODUTO, aSTATUS);
      //
      result := true;
      //
   Except
         Rollback;
   End;
end;

function TDm.AtualizaStatusServico(iSequencia: Integer; aStatus : String): Boolean;
begin
     Result := False;
     FilterCDS(dmDados.cdsServicos, fsInteger, InttoStr(iSequencia));
     //
     If not (dmDados.cdsServicos.IsEmpty) Then
      begin
         Start;
         try
             //
             With dmDados.cdsServicos do
              begin
                   Edit;
                   FieldByName('STS_STATUS').AsString := aStatus;
                   ApplyUpdates(0);
              End;
             //
             Comit(Transc);
             Result := True;
         Except
             Rollback;
         End;
      End;
end;

function TDm.ExcluirServico(iSequencia: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Delete from STATUS_SERVICOS Where (STS_SEQUENCIA = :pSEQUENCIA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      Start;
      try
        SQLConnection := dm.SQLAdmin;
        sql.Add(texto);
        Params.ParamByName('pSEQUENCIA').AsInteger := iSequencia;
        ExecSQL();
        //
        Comit(Transc);
      Except
           Rollback;
      End;
      result := True;
    finally
      free;
    end;
end;

function TDm.VerificarServicoProduto(aCodido, aMesa: String): integer;
var qraux : TSQLquery;
    texto : string;
begin
  result := 0;
  texto := 'Select STS_SEQUENCIA, STS_NRMESA, STS_IDPRODUTO, STS_STATUS from STATUS_SERVICOS Where (STS_IDPRODUTO = :pCODIGO) ';
  texto := texto + 'and (STS_NRMESA = :pNRMESA) and (STS_STATUS = '+QuotedStr('C')+')';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString := aCodido;
      Params.ParamByName('pNRMESA').AsString := aMesa;
      Open;
      //
      if not (IsEmpty) Then
        result := FieldByName('STS_SEQUENCIA').AsInteger;
    finally
      free;
    end;
end;

function TDm.GetValidarBairro(M_NMBAIR: String;
  M_CDCIDA: Integer): boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := False;
    texto := 'Select BAI_CODIGO from BAIRROS Where (BAI_NOME = :pNOME)';
    texto := texto + 'and (CID_CODIGO = :pCODIGO)';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pNOME').AsString    := M_NMBAIR;
       Params.ParamByName('pCODIGO').AsInteger := M_CDCIDA;
       Open;
       //
       if not (IsEmpty) Then
         result := True;
       finally
         free;
       end;
end;

function TDm.GetCodigoCidade(aNomeCidade: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select CID_CODIGO, CID_NOME from CIDADES Where (CID_NOME = :pNOME)';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pNOME').AsString    := aNomeCidade;
       Open;
       //
       if not (IsEmpty) Then
         result := FieldByName('CID_CODIGO').AsInteger;
       finally
         free;
       end;
end;

function TDm.AddBairro(aNomeBairro: String; iCidade: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := False;
    RefreshCDS(cdsconfig);
    //
    cdsconfig.Edit;
    CdsConfigCGF_BAIRRO.AsInteger :=
       CdsConfigCGF_BAIRRO.AsInteger + 1;
    cdsconfig.ApplyUpdates(0);
    //
    texto := 'Insert Into BAIRROS (BAI_CODIGO, BAI_NOME, CID_CODIGO) Values (:pCODIGO, :pNOME, :pCIDADE)';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
         Start;
         //
         Try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pCODIGO').AsInteger := CdsConfigCGF_BAIRRO.AsInteger;
           Params.ParamByName('pNOME').AsString    := aNomeBairro;
           Params.ParamByName('pCIDADE').AsInteger := iCidade;
           ExecSQL();
           //
           Comit(Transc);
           //
           result := True;
         Except
             Rollback;
         End;
     finally
        free;
     end;
end;

function TDm.AddCidade(aNomeCidade, aUF: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := False;
    RefreshCDS(cdsconfig);
    //
    cdsconfig.Edit;
    CdsConfigCFG_CIDADE.AsInteger :=
       CdsConfigCFG_CIDADE.AsInteger + 1;
    cdsconfig.ApplyUpdates(0);
    //
    texto := 'Insert Into CIDADES (CID_CODIGO, CID_NOME, CID_UF) Values (:pCODIGO, :pNOME, :pUF)';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pCODIGO').AsInteger := CdsConfigCFG_CIDADE.AsInteger;
       Params.ParamByName('pNOME').AsString    := aNomeCidade;
       Params.ParamByName('pUF').AsString      := aUF;
       ExecSQL();
       //
       result := True;
     finally
         free;
     end;
end;

function TDm.GetVerificarCidade(aNomeCidade: String): boolean;
var qraux : TSQLquery;
    texto : string;
begin
    result := False;
    texto := 'Select CID_CODIGO, CID_NOME from CIDADES Where (CID_NOME = :pNOME)';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pNOME').AsString    := aNomeCidade;
       Open;
       //
       if not (IsEmpty) Then
         result := True;
       finally
         free;
       end;
end;

function TDm.GetVerificaTelefone(aTelefone: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    result := False;
    texto := 'Select CLI_CODIGO, CLI_FANTASIA, CLI_RAZAO, CLI_FONE1, CLI_FONE2 from CLIENTES Where (CLI_FONE1 = :pFONE1)';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pFONE1').AsString := aTelefone;
       //Params.ParamByName('pFONE2').AsString := aTelefone;
       Open;
       //
       if not (IsEmpty) Then
         result := True;
       finally
         free;
       end;
end;

function TDm.GetCodigoBairro(M_NMBAIR: String; M_CDCIDA: Integer): integer;
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select BAI_CODIGO, BAI_NOME, CID_CODIGO from BAIRROS where (BAI_NOME = :pNOME) and (CID_CODIGO = :pCIDADE) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pNOME').AsString    := M_NMBAIR;
       Params.ParamByName('pCIDADE').AsInteger := M_CDCIDA;
       Open;
       //
       if not (IsEmpty) Then
         result := FieldByName('BAI_CODIGO').AsInteger;
       finally
         free;
       end;
end;

function TDm.AtualizaStatusServicoMesa(aMesa, aStatus: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := false;
    texto := 'Update STATUS_SERVICOS Set STS_STATUS = :pSTATUS where (STS_NRMESA = :pNRMESA) and ((STS_STATUS = :pSTATUSC) or (STS_STATUS = :pSTATUSP)) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       Start;
       try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pSTATUS').AsString := aStatus;
           Params.ParamByName('pNRMESA').AsString := aMesa;
           Params.ParamByName('pSTATUSC').AsString := 'C';
           Params.ParamByName('pSTATUSP').AsString := 'P';
           ExecSQL();
           Comit(Transc);
           //
           result := True;
       Except
           Rollback;
       End;
     finally
         free;
     end;
end;

function TDm.VerificarServicoMesa(aMesa: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := False;
    texto := 'Select * from STATUS_SERVICOS where (STS_NRMESA = :pNRMESA) and ((STS_STATUS = :pSTATUSC) or (STS_STATUS = :pSTATUSP)) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pNRMESA').AsString := aMesa;
       Params.ParamByName('pSTATUSC').AsString := 'C';
       Params.ParamByName('pSTATUSP').AsString := 'P';
       Open;
       //
       if not (IsEmpty) Then
         result := True;
       finally
         free;
       end;
end;

function TDm.AtualizaStatusProduto(iPedido, iItem, iSequencia: Integer; aProduto,
  aStatus: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := False;
    texto := 'Update PRE_VENDA_ITENS Set PVI_SEQ_SERVICO = :pSEQ_SERVICO where (PVI_PEDIDO = :pPEDIDO) and (PVI_ITEM = :pITEM) and (PVI_PRODUTO = :pPRODUTO) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pSEQ_SERVICO').AsInteger := iSequencia;
       Params.ParamByName('pPEDIDO').AsInteger      := iPedido;
       Params.ParamByName('pITEM').AsInteger        := iItem;
       Params.ParamByName('pPRODUTO').AsString      := aProduto;
       ExecSQL();
       //
       result := True;
     finally
         free;
     end;
end;


function TDm.GetCodigoClienteTelefone(aTelefone: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select CLI_CODIGO, CLI_FONE1 from CLIENTES where (CLI_FONE1 = :pCLI_FONE1) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pCLI_FONE1').AsString := aTelefone;
       Open;
       //
       if not (IsEmpty) Then
            Result := fieldByName('CLI_CODIGO').AsInteger;
       finally
         free;
       end;
end;

function TDm.GetValorPromocao(aProduto: String; iDia: Integer): Double;
Var
    fValor : Double;
begin
     fValor := 0;
     Dm.FilterCDS(dmDados.cdsPromocoes, fsString , aProduto );
     //
     case iDia of
          1 : fValor  := dmDados.cdsPromocoesPRM_VLDOMI.AsFloat;
          2 : fValor  := dmDados.cdsPromocoesPRM_VLSEGU.AsFloat;
          3 : fValor  := dmDados.cdsPromocoesPRM_VLTERC.AsFloat;
          4 : fValor  := dmDados.cdsPromocoesPRM_VLQUAR.AsFloat;
          5 : fValor  := dmDados.cdsPromocoesPRM_VLQUIN.AsFloat;
          6 : fValor  := dmDados.cdsPromocoesPRM_VLSEXT.AsFloat;
          7 : fValor  := dmDados.cdsPromocoesPRM_VLSABA.AsFloat;
     end;
     //
     if (fValor > 0) Then
         Result := fValor
     Else
         Result := dmConsultas.GetProdutoValor(aProduto)  ;
end;

function TDm.ExcluirPedido(iPedido: Integer): boolean;
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Delete from PRE_VENDA where (PRV_PEDIDO = :pPEDIDO) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
        Start;
        try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pPEDIDO').AsInteger := iPedido;
           ExecSQL();
           //
           Comit(Transc);
           //
           Result := true;
        Except
             Rollback;
        End;
     finally
         free;
     end;
end;

function TDm.GetLojaCaixaAberto(iCaixa: Integer): Integer;
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select CAI_NUMERO, CAI_LOJA, CAI_CAIXA, CAI_SITUACAO from CAIXA Where (CAI_CAIXA = :pCAIXA) AND (CAI_SITUACAO = :pSITUACAO) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pCAIXA').AsInteger   := iCaixa;
           Params.ParamByName('pSITUACAO').AsString := 'A';
           Open;
           //
           If not (IsEmpty) Then
               Result := fieldByName('CAI_LOJA').AsInteger
           Else
               Result := 1;
     finally
         free;
     end;
end;

function TDm.SetNossoNumeroTitulo(iSeqTitulo: Integer;
  aNumero: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Update CONTASRECEBER set REC_NOSSO_NUMERO = :pNOSSONUMERO where (REC_SEQUENCIA = :pSEQUENCIA) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
        Start;
        try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pSEQUENCIA').AsInteger  := iSeqTitulo;
           Params.ParamByName('pNOSSONUMERO').AsString := aNumero;
           ExecSQL();
           //
           Comit(Transc);
           //
           Result := true;
        Except
             Rollback;
        End;
     finally
         free;
     end;
end;

function TDm.GetExisteNossoNumeroTitulo(iSeqTitulo: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := false;
    texto := 'Select REC_SEQUENCIA, REC_NOSSO_NUMERO from CONTASRECEBER where (REC_SEQUENCIA = :pSEQUENCIA) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pSEQUENCIA').AsInteger   := iSeqTitulo;
           Open;
           //
           If not (IsEmpty) and not uFuncoes.Empty(FieldByName('REC_NOSSO_NUMERO').AsString) Then
               Result := True;
     finally
         free;
     end;
end;

function TDm.GetNossoNumeroTitulo(iSeqTitulo: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select REC_SEQUENCIA, REC_NOSSO_NUMERO from CONTASRECEBER where (REC_SEQUENCIA = :pSEQUENCIA) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pSEQUENCIA').AsInteger   := iSeqTitulo;
           Open;
           //
           If not (IsEmpty) Then
               Result := FieldByname('REC_NOSSO_NUMERO').AsString;
     finally
         free;
     end;
end;

function TDm.GerarNossoNumero(aSequencia: Integer): Boolean;
Var
   M_NUMERO : String;
begin
    Result := false;
    If not (GetExisteNossoNumeroTitulo(aSequencia)) Then
       begin
           Dm.RefreshCDS(Dm.CdsConfig);
           dm.FilterCDS(dmDados.cdsCedente, fsInteger, Dm.CdsConfigCFG_CEDENTE_ATUAL.AsString);
           If not (dmDados.cdsCedente.IsEmpty) Then
           begin
                dmDados.cdsCedente.Edit;
                dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger :=
                   dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger + 1;
                dmDados.cdsCedente.ApplyUpdates(0);
                //
                M_NUMERO := dmDados.cdsCedenteINICIO_NOSSO_NUMERO.AsString +
                                  uFuncoes.StrZero(dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsString,9);
                //
                If not (Dm.SetNossoNumeroTitulo(aSequencia, M_NUMERO)) Then
                     raise Exception.Create('Erro ao tentar grava nosso número do titulo!!');
                //
                Result := True;
           End;
       End
end;

function TDm.GetCodigoCedente(aDescricao: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select CODIGO, CEDENTE_NOME from CEDENTES where (CEDENTE_NOME = :pNOME) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pNOME').AsString  := aDescricao;
           Open;
           //
           If not (IsEmpty) Then
               Result := FieldByname('CODIGO').AsInteger;
     finally
         free;
     end;
end;

function TDm.GetCodigoGrupo(aDescricao: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select GRU_CODIGO, GRU_DESCRICAO from GRUPOS where (GRU_DESCRICAO = :pNOME) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pNOME').AsString  := aDescricao;
           Open;
           //
           If not (IsEmpty) Then
               Result := FieldByname('GRU_CODIGO').AsInteger;
     finally
         free;
     end;
end;

function TDm.GetCodigoMesReferencia(aMesRef: String): integer;
begin
     With dmConsultas.cdsMesReferente do
      begin
           Close;
           Params.ParamByName('aMES').AsString := aMesRef;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Edit;
                 FieldByName('MES_SEQUENCIA').AsInteger :=
                    FieldByName('MES_SEQUENCIA').AsInteger + 1;
                 ApplyUpdates(0);
                 //
                 Result := FieldByName('MES_SEQUENCIA').AsInteger;
            End
            Else
            begin
                 Append;
                 FieldByName('MES_CODIGO').AsString     := aMesRef;
                 FieldByName('MES_SEQUENCIA').AsInteger :=
                    FieldByName('MES_SEQUENCIA').AsInteger + 1;
                 ApplyUpdates(0);
                 //
                 Result := FieldByName('MES_SEQUENCIA').AsInteger;
            End;
            //
            close;
      End;
end;

function TDm.GetCodigoModalidade(aDescricao: String): integer;
var qraux : TSQLquery;
    texto : string;
begin
    Result := 0;
    texto := 'Select MOD_CODIGO, MOD_NOME from MODALIDADE where (MOD_NOME = :pNOME) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pNOME').AsString  := aDescricao;
           Open;
           //
           If not (IsEmpty) Then
               Result := FieldByname('MOD_CODIGO').AsInteger;
     finally
         free;
     end;
end;

function TDm.GetCodigoNatureza(aDescricao: String): integer;
var qraux : TSQLquery;
    texto : string;
begin
    Result := 0;
    texto := 'Select * from NATUREZA where (NAT_NOME = :pNOME) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pNOME').AsString  := aDescricao;
           Open;
           //
           If not (IsEmpty) Then
               Result := FieldByname('NAT_CODIGO').AsInteger;
     finally
         free;
     end;
end;

function TDm.VerificarBaixaTitulo(iCedente: Integer;
  aNossoNumero: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
     Result := false;
     texto := 'Select REC_SEQUENCIA, REC_LOJA, REC_CREDITO, REC_SITUACAO, REC_CLIENTE, REC_DATAPAGAMENTO, REC_PAGO, REC_NOSSO_NUMERO, REC_CDCEDENTE from CONTASRECEBER ';
     texto := texto + ' where (REC_NOSSO_NUMERO = :pNOSSONUMERO) and (REC_CDCEDENTE = :pCDCEDENTE) ';
     QrAux := TSqlquery.Create(nil);
     with QrAux do
      try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pNOSSONUMERO').AsString  := aNossoNumero;
           Params.ParamByName('pCDCEDENTE').AsInteger   := iCedente;
           Open;
           //
           If not (IsEmpty) Then
              If (FieldByName('REC_PAGO').AsFloat > 0) and (FieldByName('REC_SITUACAO').AsString = 'P')  Then
                  Result := True;
      finally
         free;
      end;
end;

function TDm.GetNumSeqTitulo(iCedente: Integer;
  aNossoNumero: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
     Result := 0;
     texto := 'Select REC_SEQUENCIA, REC_LOJA, REC_CREDITO, REC_SITUACAO, REC_CLIENTE, REC_DATAPAGAMENTO, REC_PAGO, REC_NOSSO_NUMERO, REC_CDCEDENTE from CONTASRECEBER ';
     texto := texto + ' where (REC_NOSSO_NUMERO = :pNOSSONUMERO) and (REC_CDCEDENTE = :pCDCEDENTE) ';
     QrAux := TSqlquery.Create(nil);
     with QrAux do
      try
           SQLConnection := dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pNOSSONUMERO').AsString  := aNossoNumero;
           Params.ParamByName('pCDCEDENTE').AsInteger   := iCedente;
           Open;
           //
           If not (IsEmpty) and (FieldByName('REC_SEQUENCIA').AsInteger > 0) Then
               Result := FieldByName('REC_SEQUENCIA').AsInteger;
      finally
         free;
      end;
end;

function TDm.VerificarExisteNossoNumero(iCedente: Integer;
  aNossoNumero: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select REC_CDCEDENTE, REC_NOSSO_NUMERO from CONTASRECEBER Where (REC_NOSSO_NUMERO = :pNUMERO) and (REC_CDCEDENTE = :pCEDENTE)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pNUMERO').AsString   := aNossoNumero;
      Params.ParamByName('pCEDENTE').AsInteger := iCedente;
      Open;
      //
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
end;

function TDm.VerificarExisteCedenteTitulo(iSequencia: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select REC_SEQUENCIA, REC_CDCEDENTE, REC_NOSSO_NUMERO from CONTASRECEBER Where (REC_SEQUENCIA = :pSEQ)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pSEQ').AsInteger := iSequencia;
      Open;
      //
      If not (IsEmpty) Then
        if uFuncoes.Empty(FieldByName('REC_CDCEDENTE').AsString)
            or (FieldByName('REC_CDCEDENTE').IsNull) Then
               result := True;
    finally
      free;
    end;
end;

function TDm.AtualizarCedenteTitulo(iSequencia,
  iCedente: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Update CONTASRECEBER Set REC_CDCEDENTE = :pCDCEDENTE Where (REC_SEQUENCIA = :pSEQ)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      Start;
      try
        SQLConnection := dm.SQLAdmin;
        sql.Add(texto);
        Params.ParamByName('pSEQ').AsInteger := iSequencia;
        Params.ParamByName('pCDCEDENTE').AsInteger := iCedente;
        ExecSQL();
        //
        Comit(Transc);
        result := True;
      Except
          Rollback;
      End;
    finally
      free;
    end;

end;

function TDm.GeraNumeroFatura: Integer;
begin
     RefreshCDS(CdsConfig);
     Start;
     try
         CdsConfig.Edit;
         CdsConfigCFG_NRFATURA.AsInteger := CdsConfigCFG_NRFATURA.AsInteger + 1;
         CdsConfig.ApplyUpdates(0);
         //
         Comit(Transc);
         //
         Result := CdsConfigCFG_NRFATURA.AsInteger;
     Except
          Rollback;
     End;
end;

function TDm.ExcluirFatura(aFatura: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Delete from CONTASRECEBER Where (REC_NRFATURA = :pNRFATURA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      Start;
      try
        SQLConnection := dm.SQLAdmin;
        sql.Add(texto);
        Params.ParamByName('pNRFATURA').AsString := aFatura;
        ExecSQL();
        //
        Comit(Transc);
        result := True;
      Except
          Rollback;
      End;
    finally
      free;
    end;
end;

function TDm.VerificaExisteFatura(aFatura: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select REC_SEQUENCIA, REC_NRFATURA from CONTASRECEBER Where (REC_NRFATURA = :pNRFATURA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pNRFATURA').AsString := aFatura;
      Open;
      //
      If not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TDm.IncluirTarefaUsuario(iCodigo: Integer;
  aAcao: String): Boolean;
Var
   aTexto, aHora, aComputador : String;
   qryInclusao : TSQLQuery;
   aData : TDate;
   iSeq : Integer;
begin
   Result := False;
   aData := Date();
   aHora := Copy(TimetoStr(Time),1,5);
   aComputador := uFuncoes.SysComputerName();
   aTexto := 'Insert into tarefas_usuarios ("TAR_SEQUENCIA", "TAR_USUARIO", "TAR_DTMOVI", "TAR_HOMOVI", "TAR_COMPUTADOR", "TAR_ACAO") ';
   aTexto := aTexto +' values (:pSEQ, :pUSUARIO, :pDTMOVI, :pHOMOVI, :pCOMPUTADOR, :pACAO)';
   //
   RefreshCDS(cdsConfig);
   cdsConfig.Edit;
   cdsConfigCFG_SEQTAREFAUSUARIOS.AsInteger :=
      cdsConfigCFG_SEQTAREFAUSUARIOS.AsInteger + 1;
   cdsConfig.ApplyUpdates(0);
   iSeq := cdsConfigCFG_SEQTAREFAUSUARIOS.AsInteger;
   //
   qryInclusao := TSQLQuery.Create(nil);
   with qryInclusao do
    try
         SQLConnection := SqlAdmin;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('pSEQ').AsInteger     := iSeq;
         Params.ParamByName('pUSUARIO').AsInteger := iCodigo;
         Params.ParamByName('pDTMOVI').AsDate     := aData;
         Params.ParamByName('pHOMOVI').AsString   := aHora;
         Params.ParamByName('pCOMPUTADOR').AsString := aComputador;
         Params.ParamByName('pACAO').AsString     := aAcao;
         ExecSQL();
         //
         Result := True;
    Finally
         Free;
    End;
end;

function TDm.VerificaTipoPessoa(iCliente: Integer): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select CLI_CODIGO, CLI_TIPOPESSOA from CLIENTES Where (CLI_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCliente;
      Open;
      //
      If not (IsEmpty) Then
         if (FieldByName('CLI_TIPOPESSOA').AsString = 'J') Then
              result := 0
         Else
              result := 1;
    finally
      free;
    end;
end;

function TDm.GetMesReferencia(aDataRef: Tdatetime): String;
Var
   iSeuNumero : Integer;
   aMesRefe : String;
begin
     aMesRefe := Copy(DatetoStr(aDataRef), 4,2) + Copy(DatetoStr(aDataRef), 7,4);
     iSeuNumero := GetCodigoMesReferencia(aMesRefe);
     //
     Result := aMesRefe+InttoStr(iSeuNumero);
end;

function TDm.GetProximoNumero(iCedente: Integer): String;
var
    qraux : TSQLquery;
    texto : string;
    //
    aMesRefe, aNossoNumero : String;
    aFlNossoNumero : boolean;
begin
     //
     FilterCDS(dmDados.cdsCedente, fsInteger, IntToStr(iCedente));
     //
     If not (dmDados.cdsCedente.IsEmpty) Then
      begin
           dmDados.cdsCedente.Edit;
           dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger :=
              dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger + 1;
           dmDados.cdsCedente.ApplyUpdates(0);
           //
           aFlNossoNumero := True;
           while aFlNossoNumero do
           begin
                aNossoNumero := dmDados.cdsCedenteINICIO_NOSSO_NUMERO.AsString +
                    uFuncoes.StrZero(dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsString,9);
                //
                aFlNossoNumero := Dm.VerificarExisteNossoNumero(iCedente, aNossoNumero);
                if (aFlNossoNumero) Then
                begin
                     dmDados.cdsCedente.Edit;
                     dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger :=
                        dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsInteger + 1;
                     dmDados.cdsCedente.ApplyUpdates(0);
                End;
           End;
           //
           aNossoNumero := dmDados.cdsCedenteINICIO_NOSSO_NUMERO.AsString
                           +uFuncoes.StrZero(dmDados.cdsCedentePROXIMO_NOSSO_NUMERO.AsString,9);
           Result := aNossoNumero
      End;
end;

procedure TDm.AbrirBairroCidade(iCodigo: Integer; aCDS: TClientDataSet);
begin
     with aCDS do
      begin
           Close;
           Params[0].AsInteger := iCodigo;
           Open;
      End;
end;

procedure TDm.AbrirCidadeUF(aUF: String);
begin

end;

function TDm.GetCodigoSituacao(aDescricao: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  result := 0;
  texto := 'Select SIT_CODIGO, SIT_NOME from SITUACAO Where (SIT_NOME = :pNOME)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pNOME').AsString := aDescricao;
      Open;
      //
      If not (IsEmpty) Then
          result := FieldByName('SIT_CODIGO').AsInteger;
    finally
      free;
    end;
end;

function TDm.GetVerificaContaReceberCliente(iCliente: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select REC_SEQUENCIA, REC_LOJA, REC_CLIENTE, REC_DATAEMISSAO from CONTASRECEBER Where (REC_CLIENTE = :pCLIENTE)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCLIENTE').AsInteger := iCliente;
      Open;
      //
      If not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TDm.GetNomeEmpresa(iCodigo: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCodigo;
      Open;
      //
      If not (IsEmpty) Then
          result := FieldByName('EMP_RAZAO').AsString;
    finally
      free;
    end;

end;

function TDm.ProcurarValor(aCampo,aValor, aTabela: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := false;
  texto := 'Select '+aCampo+ ' from '+aTabela+' Where ('+aCampo+' = '+QuotedStr(aValor)+')';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := SQLAdmin;
      sql.Add(texto);
      Open;
      //
      If not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TDm.GetVerificarExisteNossoNumero(aNossoNumero: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'select R.rec_sequencia, R.rec_loja, R.rec_credito, R.rec_cliente, ';
  texto := texto + ' R.rec_nosso_numero, R.rec_situacao from CONTASRECEBER R where (r.rec_nosso_numero = :pNUMERO) ';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pNUMERO').AsString := aNossoNumero;
      Open;
      //
      If not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

function TDm.ExcluirContaReceber(iSequencia: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Delete from contasreceber R Where (r.rec_sequencia =  :pSequencia)';
  //
  Start;
  try
    QrAux := TSqlquery.Create(nil);
    with QrAux do
      try
        SQLConnection := dm.SQLAdmin;
        sql.Add(texto);
        Params.ParamByName('pSequencia').AsInteger := iSequencia;
        ExecSQL();
        Comit(Transc);
        //
        result := True;
      finally
        free;
      end;
  Except
      Rollback;
  End;
end;

end.
