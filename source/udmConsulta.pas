unit udmConsulta;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, StdCtrls;

type
  TdmConsultas = class(TDataModule)
    qryProdutos: TSQLQuery;
    qryFornec: TSQLQuery;
    qryEntrada: TSQLQuery;
    qryUsuarios: TSQLQuery;
    qryUsuariosSEN_CODIGO: TIntegerField;
    qryUsuariosSEN_NOME: TStringField;
    qryUsuariosSEN_SNATUA: TStringField;
    qryVendedor: TSQLQuery;
    qryLocCliente: TSQLQuery;
    qryCaixa: TSQLQuery;
    qryCaixaCAI_LOJA: TIntegerField;
    qryCaixaCAI_CAIXA: TIntegerField;
    qryCaixaCAI_SITUACAO: TStringField;
    qryUsuariosSEN_FLCAIXA: TStringField;
    qryAbate: TSQLQuery;
    dstProdutos: TSQLDataSet;
    dstTipo: TSQLDataSet;
    dstPerda: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    dspTipo: TDataSetProvider;
    dspPerda: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsTipo: TClientDataSet;
    cdsPerda: TClientDataSet;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsTipoPER_SEQUENCIA: TIntegerField;
    cdsTipoPED_DESCRICAO: TStringField;
    cdsPerdaPER_ID: TIntegerField;
    cdsPerdaPER_DESCRICAO: TStringField;
    dstNatureza: TSQLDataSet;
    dspNatureza: TDataSetProvider;
    cdsNatureza: TClientDataSet;
    cdsNaturezaNAT_CODIGO: TIntegerField;
    cdsNaturezaNAT_NOME: TStringField;
    dsNatureza: TDataSource;
    qryCaixaFechar: TSQLQuery;
    dstCidades: TSQLDataSet;
    dstBairros: TSQLDataSet;
    dspCidades: TDataSetProvider;
    dspBairros: TDataSetProvider;
    cdsCidades: TClientDataSet;
    cdsBairros: TClientDataSet;
    cdsBairrosBAI_CODIGO: TIntegerField;
    cdsBairrosBAI_NOME: TStringField;
    cdsBairrosCID_CODIGO: TIntegerField;
    dstVendas: TSQLDataSet;
    dspVendas: TDataSetProvider;
    cdsVendas: TClientDataSet;
    dsVendas: TDataSource;
    cdsVendasMOV_PEDIDO: TIntegerField;
    cdsVendasMOV_CUPOM: TIntegerField;
    cdsVendasMOV_LOJA: TIntegerField;
    cdsVendasMOV_DATAVENDA: TDateField;
    cdsVendasMOV_CLIENTE: TIntegerField;
    cdsVendasMOV_VALOR: TFMTBCDField;
    cdsVendasMOV_NOMECLIENTE: TStringField;
    cdsVendasMOV_SITUACAO: TStringField;
    cdsVendasMOV_NMLOJA: TStringField;
    dstCaixa: TSQLDataSet;
    dspCaixa: TDataSetProvider;
    cdsCaixa: TClientDataSet;
    dsCaixa: TDataSource;
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
    cdsCaixaCAI_NMLOJA: TStringField;
    cdsCaixaCAI_NMSITUACAO: TStringField;
    qryCaixaCAI_NUMERO: TIntegerField;
    qryUsuariosSEN_FLSUPER: TStringField;
    cdsVendasMOV_VENDEDOR: TIntegerField;
    cdsVendasMOV_NMVENDEDOR: TStringField;
    cdsVendasMOV_DESCONTO: TFMTBCDField;
    dstProdutosVenda: TSQLDataSet;
    dstProdutosVendaMOP_PEDIDO: TIntegerField;
    dstProdutosVendaMOP_PRODUTO: TStringField;
    dstProdutosVendaMOP_QUANTIDADE: TFMTBCDField;
    dstProdutosVendaMOP_UNIDADE: TStringField;
    dstProdutosVendaMOP_VALOR: TFMTBCDField;
    dstProdutosVendaMOP_DESCONTO: TFMTBCDField;
    dstProdutosVendaMOP_SERIE: TStringField;
    dstProdutosVendaMOP_CUSTO: TFMTBCDField;
    dstProdutosVendaMOP_COMPRA: TFMTBCDField;
    dspProVendas: TDataSetProvider;
    cdsProdVenda: TClientDataSet;
    dsProdVenda: TDataSource;
    cdsProdVendaMOP_PEDIDO: TIntegerField;
    cdsProdVendaMOP_PRODUTO: TStringField;
    cdsProdVendaMOP_QUANTIDADE: TFMTBCDField;
    cdsProdVendaMOP_UNIDADE: TStringField;
    cdsProdVendaMOP_VALOR: TFMTBCDField;
    cdsProdVendaMOP_DESCONTO: TFMTBCDField;
    cdsProdVendaMOP_SERIE: TStringField;
    cdsProdVendaMOP_CUSTO: TFMTBCDField;
    cdsProdVendaMOP_COMPRA: TFMTBCDField;
    cdsVendasMOV_HORAVENDA: TStringField;
    cdsProdVendaMOP_NMPRODUTO: TStringField;
    qryMovCaixa: TSQLQuery;
    qryVenda: TSQLQuery;
    dstMovCaixa: TSQLDataSet;
    dspMovCaixa: TDataSetProvider;
    cdsMovCaixa: TClientDataSet;
    dsMovCaixa: TDataSource;
    qryLojas2: TSQLQuery;
    qryLojas2EMP_CODIGO: TIntegerField;
    qryLojas2EMP_FANTASIA: TStringField;
    qryLojas2EMP_RAZAO: TStringField;
    qryCliente: TSQLQuery;
    qryNatureza: TSQLQuery;
    qryContasPagar: TSQLQuery;
    qryBancos: TSQLQuery;
    dstSecoes: TSQLDataSet;
    dspSecoes: TDataSetProvider;
    cdsSecoes: TClientDataSet;
    cdsSecoesSEC_CODIGO: TIntegerField;
    cdsSecoesSEC_DESCRICAO: TStringField;
    qrySecao: TSQLQuery;
    dstSubSecao: TSQLDataSet;
    dspSubSecao: TDataSetProvider;
    cdsSubSecao: TClientDataSet;
    cdsSubSecaoSUB_CODIGO: TIntegerField;
    cdsSubSecaoSUB_DESCRICAO: TStringField;
    cdsSubSecaoSEC_CODIGO: TIntegerField;
    dstFornecedor: TSQLDataSet;
    dspFornecedor: TDataSetProvider;
    cdsFornecedor: TClientDataSet;
    cdsFornecedorFOR_CODIGO: TIntegerField;
    cdsFornecedorFOR_FANTASIA: TStringField;
    cdsFornecedorFOR_RAZAO: TStringField;
    qrySubSebSecao: TSQLQuery;
    qryFornecedor: TSQLQuery;
    qryProcurar: TSQLQuery;
    qryTributacao: TSQLQuery;
    qryEstoque: TSQLQuery;
    qryImpressoraCaixa: TSQLQuery;
    qryAliquota: TSQLQuery;
    qryEstoqueProcura: TSQLQuery;
    qryEstoqueProcuraPRO_CODIGO: TStringField;
    qryEstoqueProcuraEST_QUANTIDADE: TFMTBCDField;
    qryConsulta: TSQLQuery;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    cdsItensVendas: TClientDataSet;
    cdsItensVendasITE_NRITEN: TStringField;
    cdsItensVendasITE_CDITEN: TStringField;
    cdsItensVendasITE_NMDESC: TStringField;
    cdsItensVendasITE_QTITEN: TFloatField;
    cdsItensVendasITE_CDUNID: TStringField;
    cdsItensVendasITE_VLUNIT: TCurrencyField;
    cdsItensVendasITE_VLSUBT: TCurrencyField;
    cdsItensVendasITE_FLCANC: TStringField;
    cdsItensVendasITE_VLCOMP: TCurrencyField;
    cdsItensVendasITE_VLCUST: TCurrencyField;
    cdsItensVendasITE_CDBAIX: TStringField;
    cdsModalidade: TClientDataSet;
    cdsModalidadeMOD_CODIGO: TIntegerField;
    cdsModalidadeMOD_NOME: TStringField;
    cdsModalidadeMOD_PECOMISSAO: TFloatField;
    cdsModalidadeMOD_ABREVIACAO: TStringField;
    cdsModalidadeMOD_VALOR: TCurrencyField;
    cdsModalidadeMOD_FLFIXA: TStringField;
    cdsModalidadeMOD_NRPARCELA: TFloatField;
    qryIncluir: TSQLQuery;
    qryProdutos2: TSQLQuery;
    cdsItensVendasITE_NRLOTE: TStringField;
    dstVendasClientes: TSQLDataSet;
    dspVendasClientes: TDataSetProvider;
    cdsVendasClientes: TClientDataSet;
    cdsVendasClientesMOV_PEDIDO: TIntegerField;
    cdsVendasClientesMOV_CUPOM: TIntegerField;
    cdsVendasClientesMOV_LOJA: TIntegerField;
    cdsVendasClientesMOV_CLIENTE: TIntegerField;
    cdsVendasClientesMOV_DATAVENDA: TDateField;
    cdsVendasClientesMOV_HORAVENDA: TStringField;
    cdsVendasClientesMOV_VALOR: TFMTBCDField;
    cdsVendasClientesMOV_NOMECLIENTE: TStringField;
    cdsVendasClientesMCA_MODALIDADE: TStringField;
    cdsVendasClientesMOD_NOME: TStringField;
    dstItensClientes: TSQLDataSet;
    dspItensClientes: TDataSetProvider;
    cdsItensClientes: TClientDataSet;
    cdsItensClientesHIS_PRODUTO: TStringField;
    cdsItensClientesHIS_DATA: TDateField;
    cdsItensClientesHIS_HORA: TStringField;
    cdsItensClientesHIS_TIPO: TStringField;
    cdsItensClientesHIS_DOCUMENTO: TIntegerField;
    cdsItensClientesHIS_MOVIMENTO: TFMTBCDField;
    cdsItensClientesHIS_VLVENDA: TFMTBCDField;
    cdsItensClientesPRO_DESCRICAO: TStringField;
    qryAbatePER_SEQUENCIA: TIntegerField;
    qryAbatePED_DESCRICAO: TStringField;
    dstCores: TSQLDataSet;
    dspCores: TDataSetProvider;
    cdsCores: TClientDataSet;
    dstCoresCOR_CODIGO: TIntegerField;
    dstCoresCOR_DESCRICAO: TStringField;
    cdsCoresCOR_CODIGO: TIntegerField;
    cdsCoresCOR_DESCRICAO: TStringField;
    cdsItensVendasITE_VLDESC: TFloatField;
    cdsItensVendasITE_VLACRE: TFloatField;
    dstTabPrecos: TSQLDataSet;
    dspTabPrecos: TDataSetProvider;
    cdsTabPrecos: TClientDataSet;
    cdsTabPrecosPRC_CODIGO: TIntegerField;
    cdsTabPrecosPRC_DESCRICAO: TStringField;
    cdsItensVendasITE_VALIPI: TFloatField;
    dsItemVendas: TDataSource;
    dstOrcamento: TSQLDataSet;
    dspOrcamentos: TDataSetProvider;
    cdsOrcamentos: TClientDataSet;
    dstOrcamentoORC_PEDIDO: TIntegerField;
    dstOrcamentoORC_CLIENTE: TIntegerField;
    dstOrcamentoORC_DATAVENDA: TDateField;
    dstOrcamentoORC_VALOR: TFMTBCDField;
    dstOrcamentoORC_SITUACAO: TStringField;
    dstOrcamentoORC_NOMECLIENTE: TStringField;
    dstOrcamentoDOM_CIDADE: TStringField;
    cdsOrcamentosORC_PEDIDO: TIntegerField;
    cdsOrcamentosORC_CLIENTE: TIntegerField;
    cdsOrcamentosORC_DATAVENDA: TDateField;
    cdsOrcamentosORC_VALOR: TFMTBCDField;
    cdsOrcamentosORC_SITUACAO: TStringField;
    cdsOrcamentosORC_NOMECLIENTE: TStringField;
    cdsOrcamentosDOM_CIDADE: TStringField;
    dstItensOrcamento: TSQLDataSet;
    dspItensOrcamento: TDataSetProvider;
    cdsItensOrcamento: TClientDataSet;
    cdsItensOrcamentoITO_PEDIDO: TIntegerField;
    cdsItensOrcamentoITO_PRODUTO: TStringField;
    cdsItensOrcamentoITO_QUANTIDADE: TFMTBCDField;
    cdsItensOrcamentoITO_UNIDADE: TStringField;
    cdsItensOrcamentoITO_VALOR: TFMTBCDField;
    cdsItensOrcamentoITO_DESCONTO: TFMTBCDField;
    cdsItensVendasITE_REFERE: TStringField;
    cdsItensVendasITE_VLSUBTOT2: TCurrencyField;
    cdsVendasClientesPRC_DESCRICAO: TStringField;
    cdsVendasMOV_TABELA: TIntegerField;
    cdsVendasMOV_ACRESCIMO: TFMTBCDField;
    qryUsuariosUSU_ADMIN: TStringField;
    qryLoja: TSQLQuery;
    cdsConsulta2: TClientDataSet;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsProdutos2: TClientDataSet;
    cdsVendedor: TClientDataSet;
    cdsCaixa2: TClientDataSet;
    cdsCaixaFechar: TClientDataSet;
    cdsGetNatureza: TClientDataSet;
    cdsItensVendasITE_CODCOR: TIntegerField;
    cdsItensVendasITE_NOMCOR: TStringField;
    dstProdutosVendaMOP_CODCOR: TIntegerField;
    cdsProdVendaMOP_CODCOR: TIntegerField;
    cdsVendasMOV_TIPO_FRETE: TStringField;
    cdsVendasMOV_PERC_FRETE: TFMTBCDField;
    cdsVendasMOV_IDTRANSPORTADORA: TIntegerField;
    cdsVendasMOV_TABELA_PLANO: TIntegerField;
    cdsItensOrcamentoITO_NRITEM: TIntegerField;
    cdsListaCedentes: TClientDataSet;
    cdsListaCedentesCODIGO: TIntegerField;
    cdsListaCedentesCEDENTE_NOME: TStringField;
    cdsGrupos: TClientDataSet;
    cdsGruposGRU_CODIGO: TIntegerField;
    cdsGruposGRU_DESCRICAO: TStringField;
    cdsMesReferente: TClientDataSet;
    cdsMesReferenteMES_CODIGO: TStringField;
    cdsMesReferenteMES_SEQUENCIA: TIntegerField;
    procedure cdsCaixaCalcFields(DataSet: TDataSet);
    procedure cdsItensVendasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function BUSCA_CLIENTE(M_CDCLIE : Integer) : boolean;
    function BUSCA_PRODUTO(M_CDPROD : string ; M_CDLOJA, M_CDFORN : Integer) : boolean;
    function GetLoja(M_CDCAIX : integer) : String;
    function GetCliente(M_CDCLIE : integer) : Boolean;
    function GetProduto(M_CDPROD : String) : Boolean;
    function GetVerificaProduto(M_CDPROD : String) : Boolean;
    function GetVerificaCodBarras(M_CDBARR : String) : Boolean;
    function GetBarrasCodProduto(M_CDBARR : String) : String;
    function GetProdutoValor(M_CDPROD : String) : Double;
    function GetVendedor(M_CDVEND : Integer) : Boolean;
    function GetNomeVendedor(M_CDVEND : Integer) : String;
    function GetFornecedor(M_CDFORN : Integer) : Boolean;
    function GetCodFuncionario(M_NMDESC : String) : Integer;
    function GetNatureza(M_NMNATU : String) : Boolean;
    function GetNatureza2(M_NMNATU : String) : Boolean;
    function GetNaturezaCogigo(M_NMNATU : String) : Integer;
    Function GetCedente(aCodigo : Integer) : Boolean;
    Function Validar_Cedente(aBancoCodigo, aAgenciaCodigo, aCedenteCodigo : String) : Boolean;
    Function GetTitulo(aCredito : Integer): Boolean;
    Function GetUsuario(aCodigo : Integer): Boolean;
    function GetIDTransportadora(M_NMTRAN : String) : integer;
    function GetNomeTransportadora(iCodigo : Integer) : String;
    function GetCodReferencia(aCodigo : String) : String;
    procedure Lojas(aCombo : TComboBox);
    procedure CarregarNaturezas(aCombo : TComboBox; aTipo : String);
  end;

var
  dmConsultas: TdmConsultas;

implementation

uses Udm, uFuncoes;

{$R *.dfm}

function TdmConsultas.BUSCA_CLIENTE(M_CDCLIE: Integer): boolean;
begin
     With qryLocCliente do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select C.CLI_CODIGO, C.CLI_FANTASIA, C.CLI_RAZAO, C.CLI_ENDERECO, C.CLI_NUMERO, CLI_CGC,  ');
          SQL.Add('CLI_INSCESTADUAL, CLI_CEP, CID.CID_NOME, B.BAI_NOME from CLIENTES C');
          SQL.Add('INNER join BAIRROS B ON C.BAI_CODIGO = B.BAI_CODIGO');
          SQL.Add('INNER join CIDADES CID ON C.CID_CODIGO = CID.CID_CODIGO');
          SQL.Add('Where (CLI_CODIGO = :pCODIGO) ');
          Params.ParamByName('pCODIGO').AsInteger := M_CDCLIE;
          Open;
     End;
     //
     If not (dmConsultas.qryLocCliente.IsEmpty) Then
         result := True
     Else
        result := False;
end;

function TdmConsultas.BUSCA_PRODUTO(M_CDPROD : string ; M_CDLOJA, M_CDFORN: Integer): boolean;
begin
     With qryLocCliente do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select E.PRO_CODIGO, E.EST_QUANTIDADE, P.PRO_DESCRICAO, ');
          SQL.Add('P.PRO_VLCOMPRA, P.PRO_VLCUSTO, P.PRO_VLVENDA From ESTOQUE E ');
          SQL.Add('INNER join PRODUTOS P ON E.PRO_CODIGO = P.PRO_CODIGO');
          SQL.Add('Where (E.PRO_CODIGO = :pCODIGO) AND (E.EST_CODIGOLOJA = :pCDLOJA)');
          If (M_CDFORN > 0 ) Then
          Begin
               SQL.Add(' AND  (P.FOR_CODIGO = :pCDFORN)');
               Params.ParamByName('pCDFORN').AsInteger := M_CDFORN;
          End;
          //SQL.Add(' AND  (E.EST_QUANTIDADE > :pQUANTIDADE)');
          Params.ParamByName('pCODIGO').AsString  := uFuncoes.StrZero(M_CDPROD,13);
          Params.ParamByName('pCDLOJA').AsInteger := M_CDLOJA;
          //Params.ParamByName('pQUANTIDADE').AsFloat := 0;
          Open;
     End;
     //
     If not (dmConsultas.qryLocCliente.IsEmpty) Then
        result := True
     Else
        result := False;
end;

procedure TdmConsultas.CarregarNaturezas(aCombo: TComboBox; aTipo: String);
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select NAT_CODIGO, NAT_NOME, NAT_TIPO from NATUREZA Where (NAT_TIPO = :pTIPO) order by NAT_NOME';
    //
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
           SQLConnection := Dm.SQLAdmin;
           sql.Add(texto);
           Params.ParamByName('pTIPO').AsString := aTipo;
           Open;
           //
           aCombo.Clear;
           If not (IsEmpty) Then
            Begin
                 First;
                 While not (Eof) do
                  begin
                       aCombo.Items.add(FieldByName('NAT_NOME').AsString);
                       //
                       next;
                  End;
            End;
     finally
         free;
     end;
end;

procedure TdmConsultas.cdsCaixaCalcFields(DataSet: TDataSet);
begin
     If (cdsCaixaCAI_SITUACAO.AsString = 'A') Then
        cdsCaixaCAI_NMSITUACAO.AsString := 'ABERTO'
     Else
        cdsCaixaCAI_NMSITUACAO.AsString := 'FECHADO';
end;

procedure TdmConsultas.cdsItensVendasCalcFields(DataSet: TDataSet);
Var
    M_VLVEND, VALOR, fDesc, fValorIPI : Double;
begin
   {If (udm.aFluxoCalc <> 'N') Then
    begin}
    fDesc := cdsItensVendasITE_VLDESC.AsFloat;
    //
    M_VLVEND := cdsItensVendasITE_VLUNIT.AsCurrency;
               //  -(uFuncoes.Gerapercentual(cdsItensVendasITE_VLUNIT.AsCurrency, cdsItensVendasITE_VLDESC.AsFloat))
    {    M_VLVEND := cdsItensVendasITE_VLUNIT.AsCurrency;
                 //+(uFuncoes.Gerapercentual(cdsItensVendasITE_VLUNIT.AsCurrency, cdsItensVendasITE_VLACRE.AsFloat));}
     //
     cdsItensVendasITE_VLSUBTOT2.AsCurrency :=
           M_VLVEND * cdsItensVendasITE_QTITEN.AsCurrency;
     VALOR := M_VLVEND * cdsItensVendasITE_QTITEN.AsCurrency;
     fValorIPI := uFuncoes.Arredondar(VALOR
                 + uFuncoes.Gerapercentual(VALOR, cdsItensVendasITE_VALIPI.AsFloat),2);
     cdsItensVendasITE_VLSUBT.AsCurrency := uFuncoes.Arredondar(fValorIPI
                 - uFuncoes.Gerapercentual(fValorIPI, fDesc) ,2);
     //   (M_VLVEND + * cdsItensVendasITE_QTITEN.AsCurrency (uFuncoes.Gerapercentual(M_VLVEND, cdsItensVendasITE_VALIPI.AsFloat))) * cdsItensVendasITE_QTITEN.AsCurrency;
   //End;
   {Else
       cdsItensVendasITE_VLSUBT.AsCurrency :=
           cdsItensVendasITE_VLUNIT.AsCurrency * cdsItensVendasITE_QTITEN.AsCurrency;}
end;

function TdmConsultas.GetBarrasCodProduto(M_CDBARR: String): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PRO_CODIGO, PRO_BARRAS, PRO_FLPROD from PRODUTOS ';
  texto := texto + ' Where (PRO_BARRAS = :pBARRAS) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      //If uFuncoes.StrIsFloat(dm.cdsProdutosPRO_BARRAS.AsString) Then
          ParamByName('pBARRAS').AsString  := uFuncoes.StrZero(M_CDBARR,13);
      {Else
          ParamByName('pBARRAS').AsString  := M_CDBARR;}
      Open;
      //
      If not IsEmpty Then
         result := FieldByName('PRO_CODIGO').AsString;
    finally
      free;
    end;

end;

function TdmConsultas.GetCedente(aCodigo: Integer): Boolean;
begin
     Result := False;
     With qryConsulta do
      begin
           SQL.clear;
           Close;
           SQL.Add('Select CODIGO, CEDENTE_NOME from CEDENTES ');
           SQL.Add('Where (CODIGO = :pCODIGO)');
           ParamByName('pCODIGO').AsInteger   := aCodigo;
           Open;
           //
           If not IsEmpty Then
            Result := True;
      End;
end;

function TdmConsultas.GetCliente(M_CDCLIE: integer): Boolean;
begin
     Result := False;
     With qryConsulta do
      begin
           SQL.clear;
           Close;
           SQL.Add('Select CLI_CODIGO, CLI_FANTASIA from CLIENTES ');
           SQL.Add('Where (CLI_CODIGO = :pCODIGO)');
           ParamByName('pCODIGO').AsInteger   := M_CDCLIE;
           Open;
           //
           If not IsEmpty Then
            Result := True;
      End;
end;

function TdmConsultas.GetCodFuncionario(M_NMDESC: String): Integer;
begin
     With qryConsulta do
      begin
           SQL.clear;
           Close;
           SQL.Add('Select FUN_CODIGO from FUNCIONARIOS');
           SQL.Add('Where (FUN_NOME = :pNOME)');
           ParamByName('pNOME').AsString := M_NMDESC;
           Open;
           //
           If not IsEmpty Then
               Result := qryConsulta.FieldByname('FUN_CODIGO').AsInteger;
      End;
end;

function TdmConsultas.GetCodReferencia(aCodigo: String): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PRO_CODIGO, PRO_REFERENCIA from PRODUTOS Where (PRO_CODIGO = :pCODIGO) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString := aCodigo;
      open;
      //
      If not IsEmpty Then
            Result := FieldByname('PRO_REFERENCIA').AsString;
    finally
      free;
    end;
end;

function TdmConsultas.GetFornecedor(M_CDFORN: Integer): Boolean;
begin
     Result := False;
     With qryConsulta do
      begin
           SQL.clear;
           Close;
           SQL.Add('Select FOR_CODIGO, FOR_FANTASIA from FORNECEDORES ');
           SQL.Add('Where (FOR_CODIGO = :pCODIGO)');
           ParamByName('pCODIGO').AsInteger := M_CDFORN;
           Open;
           //
           If not IsEmpty Then
              Result := true;
      End;
end;

function TdmConsultas.GetIDTransportadora(M_NMTRAN: String): integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from TRANSPORTADORA Where (TRP_NOME = :pNOME) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pNOME').AsString := M_NMTRAN;
      open;
      //
      If not IsEmpty Then
            Result := FieldByname('TRP_CODIGO').AsInteger;
    finally
      free;
    end;           //
end;

function TdmConsultas.GetLoja(M_CDCAIX: integer): String;
begin
     With qryConsulta do
      begin
           SQL.clear;
           Close;
           SQL.Add('Select L.EMP_CODIGO, L.emp_fantasia from CAIXA CX ');
           SQL.Add('inner join EMPRESAS L ON (L.EMP_CODIGO = CX.CAI_LOJA)');
           SQL.Add('Where (CX.CAI_CAIXA = :pCAIXA) AND (CX.CAI_SITUACAO = :pSITUACAO)');
           ParamByName('pCAIXA').AsInteger   := M_CDCAIX;
           ParamByName('pSITUACAO').AsString := 'A';
           Open;
           //
           If not IsEmpty Then
            Result := qryConsulta.FieldByname('EMP_CODIGO').AsString;
      End;
end;

function TdmConsultas.GetNatureza(M_NMNATU: String): Boolean;
begin
     Result := False;
     // aqui
     With cdsGetNatureza do
      begin
           Active := False;
           CommandText := 'Select * from NATUREZA Where (NAT_NOME = :pNOME)';
           Params.ParamByName('pNOME').AsString  := M_NMNATU;
           Active := True;
           //
           If not IsEmpty Then
             If (FieldByName('NAT_TIPO').AsString = '2') Then
                Result := true;
           //
           Active := False;
      End;
end;

function TdmConsultas.GetNatureza2(M_NMNATU: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
    Result := False;
    texto := 'Select * from NATUREZA Where (NAT_NOME = :pNOME) ';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pNOME').AsString := M_NMNATU;
       Open;
       //
       if not (IsEmpty) Then
            Result := True;
       finally
         free;
       end;
end;


function TdmConsultas.GetNaturezaCogigo(M_NMNATU: String): Integer;
begin
     With cdsConsulta2 do
      begin
           Active := False;
           CommandText := 'Select * from NATUREZA Where (NAT_NOME = :pNOME)';
           Params.ParamByName('pNOME').AsString  := M_NMNATU;
           Active := True;
           //
           If not IsEmpty Then
             Result :=  FieldByName('NAT_CODIGO').AsInteger;
           //
           Active := False;
      End;
end;

function TdmConsultas.GetNomeTransportadora(iCodigo: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from TRANSPORTADORA Where (TRP_CODIGO = :pCODIGO) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger :=  iCodigo;
      open;
      //
      If not IsEmpty Then
            Result := FieldByname('TRP_NOME').AsString;
    finally
      free;
    end;
end;

function TdmConsultas.GetNomeVendedor(M_CDVEND: Integer): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select FUN_CODIGO, FUN_NOME, FUN_TPFUNC from FUNCIONARIOS ';
  texto := texto + ' Where (FUN_CODIGO = :pCODIGO) ';
  // AND (FUN_TPFUNC = :pTPFUNC)
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      ParamByName('pCODIGO').AsInteger := M_CDVEND;
      //ParamByName('pTPFUNC').AsString  := 'V';
      Open;
      //
      If not IsEmpty Then
         result := FieldByName('FUN_NOME').AsString;
    finally
      free;
    end;
end;

function TdmConsultas.GetProduto(M_CDPROD: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select PRO_CODIGO, PRO_FLPROD from PRODUTOS ';
  texto := texto + ' Where ((PRO_CODIGO = :pCODIGO) or (PRO_BARRAS = :pBARRAS)) AND (PRO_FLPROD = :pFLPROD)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString  := StrZero(M_CDPROD,13);
      Params.ParamByName('pBARRAS').AsString  := M_CDPROD;
      Params.ParamByName('pFLPROD').AsString  := 'S';
      Open;
      //
      If not IsEmpty Then
         result := True;
    finally
      free;
    end;
end;

function TdmConsultas.GetProdutoValor(M_CDPROD: String): Double;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PRO_CODIGO, PRO_VLVENDA from PRODUTOS Where (PRO_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString := StrZero(M_CDPROD,13);
      Open;
      //
      If not IsEmpty Then
         result := FieldByName('PRO_VLVENDA').AsFloat;
    finally
      free;
    end;
end;

function TdmConsultas.GetTitulo(aCredito : Integer): Boolean;
begin
     Result := False;
     With qryConsulta do
      begin
           SQL.clear;
           Close;
           SQL.Add('Select * from CONTASRECEBER ');
           SQL.Add('Where (REC_CREDITO = :pCREDITO) and (REC_SITUACAO = :pSITUACAO)');
           ParamByName('pCREDITO').AsInteger := aCredito;
           ParamByName('pSITUACAO').AsString := 'A';
           Open;
           //
           If not IsEmpty Then
              Result := true;
      End;
end;

function TdmConsultas.GetUsuario(aCodigo: Integer): Boolean;
begin
     Result := False;
     With qryUsuarios do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger := aCodigo;
          Open;
     End;
     //
     If not (qryUsuarios.IsEmpty) Then
        Result := True;
end;

function TdmConsultas.GetVendedor(M_CDVEND : Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select FUN_CODIGO, FUN_TPFUNC from FUNCIONARIOS ';
  texto := texto + ' Where (FUN_CODIGO = :pCODIGO) AND (FUN_TPFUNC = :pTPFUNC)';
  //  or (FUN_TPFUNC = '+QuotedStr('G')+'))
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      ParamByName('pCODIGO').AsInteger := M_CDVEND;
      ParamByName('pTPFUNC').AsString  := 'V';
      Open;
      //
      If not IsEmpty Then
         result := True;
    finally
      free;
    end;

    { Result := False;
     With qryConsulta do
      begin
           SQL.clear;
           Close;
           SQL.Add('Select FUN_CODIGO, FUN_TPFUNC from FUNCIONARIOS ');
           SQL.Add('Where (FUN_CODIGO = :pCODIGO) AND (FUN_TPFUNC = :pTPFUNC)');
           ParamByName('pCODIGO').AsInteger := M_CDVEND;
           ParamByName('pTPFUNC').AsString  := 'V';
           Open;
           //
           If not IsEmpty Then
              Result := true;
      End;}
end;

function TdmConsultas.GetVerificaCodBarras(M_CDBARR: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select PRO_CODIGO, PRO_BARRAS, PRO_FLPROD from PRODUTOS ';
  texto := texto + ' Where (PRO_BARRAS = :pBARRAS) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      ParamByName('pBARRAS').AsString  := uFuncoes.StrZero(M_CDBARR,13);
      Open;
      //
      If not IsEmpty Then
         result := True;
    finally
      free;
    end;

end;

function TdmConsultas.GetVerificaProduto(M_CDPROD: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select PRO_CODIGO, PRO_FLPROD from PRODUTOS ';
  texto := texto + ' Where ((PRO_CODIGO = :pCODIGO) or (PRO_BARRAS = :pBARRAS)) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      ParamByName('pCODIGO').AsString  := uFuncoes.StrZero(M_CDPROD,13);
      //
    //  If uFuncoes.StrIsFloat(dm.cdsProdutosPRO_BARRAS.AsString) Then
          ParamByName('pBARRAS').AsString  := uFuncoes.StrZero(M_CDPROD,13);
      {Else
          ParamByName('pBARRAS').AsString  := M_CDPROD;}
      Open;
      //
      If not IsEmpty Then
         result := True;
    finally
      free;
    end;
end;

procedure TdmConsultas.Lojas(aCombo: TComboBox);
begin
     with cdsConsulta2 do
      begin
           Active := False;
           CommandText := 'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS order by EMP_FANTASIA ';
           Active := True;
           //
           First;
           aCombo.Clear;
           While not (Eof) do
           begin
                aCombo.Items.add(FieldByName('EMP_FANTASIA').AsString);
                //
                next;
           End;
           //
           Active := False;
      End;
end;

function TdmConsultas.Validar_Cedente(aBancoCodigo, aAgenciaCodigo,
  aCedenteCodigo : String): Boolean;
begin
     Result := False;
     //
     With dmConsultas.qryProdutos do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select BANCO_CODIGO, AGENCIA_CODIGO, CEDENTE_CODIGO, CARTEIRA, INICIO_NOSSO_NUMERO, TIPO_BOLETO ');
           SQL.Add(' from CEDENTES Where (BANCO_CODIGO = :pBANCO) and (AGENCIA_CODIGO = :pAGENCIA) ');
           //SQL.Add('and (CEDENTE_CODIGO = :pCEDENTE) ');
           //and (CARTEIRA = :pCARTEIRA)
           Params.ParamByName('pBANCO').AsString    := Trim(aBancoCodigo);
           Params.ParamByName('pAGENCIA').AsString  := Trim(aAgenciaCodigo);
           //Params.ParamByName('pCEDENTE').AsString  := aCedenteCodigo;    // '87000000004';
           //
           Open;
           //
           If not (IsEmpty) Then
             Result := True;
           //
      End;
end;

end.
