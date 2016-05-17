unit UFrmAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ToolWin, ComCtrls, ImgList, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, DBXpress, DB, SqlExpr, Buttons, ExtCtrls, FMTBcd, jpeg;

type
  TFrmAdmin = class(TForm)
    mmPrincipal: TMainMenu;
    StatusBar1: TStatusBar;
    Cadastro1: TMenuItem;
    mnuMovimento: TMenuItem;
    mnuFinanceiro: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuEmpresasItem: TMenuItem;
    mnuClientesItem: TMenuItem;
    mnuFornecedoresItem: TMenuItem;
    mnuUtilitarios: TMenuItem;
    ImageList1: TImageList;
    N1: TMenuItem;
    mnuSairItem: TMenuItem;
    ImageList2: TImageList;
    mnuTabelaItem: TMenuItem;
    mnuBancosItem: TMenuItem;
    mnuCidadesSubItem: TMenuItem;
    mnuBairrosSubItem: TMenuItem;
    mnuFuncionriosItem: TMenuItem;
    mnuCadProdutosItem: TMenuItem;
    mnuAgendadecontatosItem: TMenuItem;
    mnuVendaItem: TMenuItem;
    mnuCancelamentodevendaItem: TMenuItem;
    mnuOSItem: TMenuItem;
    mnuMovEstoqueItem: TMenuItem;
    mnuEntradadeMercadoriasSubItem: TMenuItem;
    mnuReajusteSubItem: TMenuItem;
    mnuInventarioSubItem: TMenuItem;
    mnuMovEstConsultaSubItem: TMenuItem;
    mnuCaixaItem: TMenuItem;
    mnuAberturadeCaixaSubItem: TMenuItem;
    mnuSuprimentoeSangriasSubItem: TMenuItem;
    mnuSitucaoSubItem: TMenuItem;
    mnuFechamentodeCaixaSybItem: TMenuItem;
    ContasaReceber1: TMenuItem;
    mnuInclusodeCRubItem: TMenuItem;
    ContasaPagar1: TMenuItem;
    mnuFinCPInclusao: TMenuItem;
    mnuBaixadeTituloseChequesSubItem: TMenuItem;
    Motivodadevoluo1: TMenuItem;
    mnuCargosSubItem: TMenuItem;
    mnuSituacaoSubItem: TMenuItem;
    mnuAtividadesSunItem: TMenuItem;
    mnuUnidadesSubItem: TMenuItem;
    mnuSecaoSubItem: TMenuItem;
    mnuSubSecaoSubItem: TMenuItem;
    mnuTributacaoSubItem: TMenuItem;
    mnuRelCadItem: TMenuItem;
    Gerenciais1: TMenuItem;
    otalvendidoporvendedor1: TMenuItem;
    Vendasporoperadordecaixa1: TMenuItem;
    Estoque2: TMenuItem;
    mnuTabeladepreosSubItem: TMenuItem;
    mnuPosiodoestoqueporseoesubsecaoSubItem: TMenuItem;
    mnuTotalvendidoporprodutoSubItem: TMenuItem;
    Historicodeprodutos1: TMenuItem;
    mnuProdutosemexcessoporsecaoSubItem: TMenuItem;
    mnuSugestodecomprasSubItem: TMenuItem;
    mnuTransferenciasItem: TMenuItem;
    mnuTransferenciasporperiodoSubItem: TMenuItem;
    ProdutosreajustadosporperiodoSubItem: TMenuItem;
    mnuFichadeclienteSubItem: TMenuItem;
    mnuGondulasdeprodutosSubItem: TMenuItem;
    mnuRelaodefornecedoresSubItem: TMenuItem;
    mnuRelVendedoresSubItem: TMenuItem;
    mnuEtiquetadeprodutosSubItem: TMenuItem;
    mnuEtiquetadeclienteSubItem: TMenuItem;
    Usuarios1: TMenuItem;
    mnuCadastroUsuariosItem: TMenuItem;
    Configurao1: TMenuItem;
    mnuSobre: TMenuItem;
    Formadepagamentos1: TMenuItem;
    Infog21: TMenuItem;
    N2: TMenuItem;
    InfoG22: TMenuItem;
    mnuNaturezaSubItem: TMenuItem;
    Panel1: TPanel;
    tbtLojas: TSpeedButton;
    tbtClientes: TSpeedButton;
    tbtFornecedor: TSpeedButton;
    tbtProdutos: TSpeedButton;
    tbtFuncionarios: TSpeedButton;
    spContatos: TSpeedButton;
    tbtPDV: TSpeedButton;
    tbtSair: TSpeedButton;
    mnuMovConsultaItem: TMenuItem;
    mnuConsVendasSubItem: TMenuItem;
    mnuRelatoriodeCaixaSubItem: TMenuItem;
    Movimento2: TMenuItem;
    mnuTotaldeProdutosVendidosItens: TMenuItem;
    mnuManutencaoCPSubItem: TMenuItem;
    mnuProdutosItem: TMenuItem;
    mnuManutenodeContasReceberItem: TMenuItem;
    mnuProdutosVencerItem: TMenuItem;
    mnuTotalDerivadosdeProdutosItem: TMenuItem;
    mnuFluxodeCaixaSubItem: TMenuItem;
    mnuRelaodeProdutosSubItem: TMenuItem;
    mnuPedidosItem: TMenuItem;
    mnuTotalVendidoporFabricanteSubItem: TMenuItem;
    mnuClientesSubItem: TMenuItem;
    mnuProdutoMaiseMenosVendidosSubItem: TMenuItem;
    mnuFinCaixaRelDataSubItem: TMenuItem;
    mnuPeriodoSubItem: TMenuItem;
    mnuCoresItem: TMenuItem;
    mnuPrecosSubItem: TMenuItem;
    mnuTiposClientesSubItem: TMenuItem;
    mnuRegiaoSubItem: TMenuItem;
    mnuTotalVendidoporClientesSubItem: TMenuItem;
    ProdutosporClientes1: TMenuItem;
    mnuVisitasItem: TMenuItem;
    Financeiro1: TMenuItem;
    mnuRelContasReceberSubItem: TMenuItem;
    mnuRelContasPagarSubItem: TMenuItem;
    ReceberMs1: TMenuItem;
    mnuTotalNaturezaItem: TMenuItem;
    mnuCedentesSubItem: TMenuItem;
    dataSetAux: TSQLDataSet;
    dataSetAux2: TSQLDataSet;
    mnuCaixadaEmpresaSubItem: TMenuItem;
    BaixadeContasReceber1: TMenuItem;
    BaixadeContasPagar1: TMenuItem;
    SuprimentoseSangrias1: TMenuItem;
    ConsultaSaldoCaixa1: TMenuItem;
    mnuCaixaRelatorioSubItem: TMenuItem;
    Image1: TImage;
    Timer1: TTimer;
    N3: TMenuItem;
    ImportarDados1: TMenuItem;
    mnuTransportadorasSubItem: TMenuItem;
    mnuPlanosSubItem: TMenuItem;
    mnuPromocoes: TMenuItem;
    N4: TMenuItem;
    mnuTotalVendidoSubItem: TMenuItem;
    N5: TMenuItem;
    mnuRenegociaoSubItem: TMenuItem;
    mnuGruposSubItem: TMenuItem;
    mnuGerarBoletosItem: TMenuItem;
    N6: TMenuItem;
    mnuRetornoSubItem: TMenuItem;
    GruposLoja1: TMenuItem;
    N7: TMenuItem;
    ExcluirFatura1: TMenuItem;
    N8: TMenuItem;
    mnuListadeClientesSubItem: TMenuItem;
    ListadeInadimplentes1: TMenuItem;
    N9: TMenuItem;
    mnuTotalPagoMultaJurosSubItem: TMenuItem;
    N10: TMenuItem;
    RenegociaesporPerodo1: TMenuItem;
    mnuEletroEletronicoSubItem: TMenuItem;
    N11: TMenuItem;
    mnuClienteEletrosItem: TMenuItem;
    SituaodoBox1: TMenuItem;
    procedure mnuEmpresasItemClick(Sender: TObject);
    procedure mnuClientesItemClick(Sender: TObject);
    procedure mnuSairItemClick(Sender: TObject);
    procedure mnuFornecedoresItemClick(Sender: TObject);
    procedure mnuBancosItemClick(Sender: TObject);
    procedure mnuCidadesSubItemClick(Sender: TObject);
    procedure mnuBairrosSubItemClick(Sender: TObject);
    procedure mnuCargosSubItemClick(Sender: TObject);
    procedure mnuSituacaoSubItemClick(Sender: TObject);
    procedure mnuAtividadesSunItemClick(Sender: TObject);
    procedure mnuAgendadecontatosItemClick(Sender: TObject);
    procedure mnuUnidadesSubItemClick(Sender: TObject);
    procedure mnuSecaoSubItemClick(Sender: TObject);
    procedure mnuSubSecaoSubItemClick(Sender: TObject);
    procedure mnuTributacaoSubItemClick(Sender: TObject);
    procedure mnuCadProdutosItemClick(Sender: TObject);
    procedure mnuEntradadeMercadoriasSubItemClick(Sender: TObject);
    procedure mnuFuncionriosItemClick(Sender: TObject);
    procedure mnuInclusodeCRubItemClick(Sender: TObject);
    procedure mnuExclusodeNP1Click(Sender: TObject);
    procedure mnuChequesItemClick(Sender: TObject);
    procedure mnuConsulta2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuAberturadeCaixaSubItemClick(Sender: TObject);
    procedure mnuCadastroUsuariosItemClick(Sender: TObject);
    procedure mnuVendaItemClick(Sender: TObject);
    procedure mnuMovEstConsultaSubItemClick(Sender: TObject);
    procedure Formadepagamentos1Click(Sender: TObject);
    procedure mnuCancelamentodevendaItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InfoG22Click(Sender: TObject);
    procedure mnuInventarioSubItemClick(Sender: TObject);
    procedure mnuAbateSubItemClick(Sender: TObject);
    procedure mnuOSItemClick(Sender: TObject);
    procedure mnuReajusteSubItemClick(Sender: TObject);
    procedure mnuTransferenciasItemClick(Sender: TObject);
    procedure mnuSuprimentoeSangriasSubItemClick(Sender: TObject);
    procedure mnuFechamentodeCaixaSybItemClick(Sender: TObject);
    procedure mnuSitucaoSubItemClick(Sender: TObject);
    procedure mnuNaturezaSubItemClick(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure mnuBaixadeTituloseChequesSubItemClick(Sender: TObject);
    procedure mnuFinCPInclusaoClick(Sender: TObject);
    procedure mnuEditarContaPagarItemClick(Sender: TObject);
    procedure mnuExclusoContPagarItemClick(Sender: TObject);
    procedure mnuBaixarContPagarItemClick(Sender: TObject);
    procedure mnuConsVendasSubItemClick(Sender: TObject);
    procedure mnuRelatorioClick(Sender: TObject);
    procedure Motivodadevoluo1Click(Sender: TObject);
    procedure mnuTotaldeProdutosVendidosItensClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuEditarNPItemClick(Sender: TObject);
    procedure mnuManutencaoCPSubItemClick(Sender: TObject);
    procedure mnuProdutosItemClick(Sender: TObject);
    procedure mnuManutenodeContasReceberItemClick(Sender: TObject);
    procedure mnuClientesaniversariantesSubItemClick(Sender: TObject);
    procedure mnuFichadeclienteSubItemClick(Sender: TObject);
    procedure mnuGondulasdeprodutosSubItemClick(Sender: TObject);
    procedure mnuRelaodefornecedoresSubItemClick(Sender: TObject);
    procedure mnuRelVendedoresSubItemClick(Sender: TObject);
    procedure mnuEtiquetadeprodutosSubItemClick(Sender: TObject);
    procedure mnuEtiquetadeclienteSubItemClick(Sender: TObject);
    procedure mnuTabeladepreosSubItemClick(Sender: TObject);
    procedure mnuPosiodoestoqueporseoesubsecaoSubItemClick(Sender: TObject);
    procedure mnuTotalvendidoporprodutoSubItemClick(Sender: TObject);
    procedure Historicodeprodutos1Click(Sender: TObject);
    procedure otalvendidoporvendedor1Click(Sender: TObject);
    procedure Vendasporoperadordecaixa1Click(Sender: TObject);
    procedure mnuTransferenciasporperiodoSubItemClick(Sender: TObject);
    procedure ProdutosreajustadosporperiodoSubItemClick(Sender: TObject);
    procedure mnuProdutosemexcessoporsecaoSubItemClick(Sender: TObject);
    procedure mnuSugestodecomprasSubItemClick(Sender: TObject);
    procedure mnuRecepodedadosItemClick(Sender: TObject);
    procedure mnuProdutosVencerItemClick(Sender: TObject);
    procedure mnuTotalDerivadosdeProdutosItemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnuFluxodeCaixaSubItemClick(Sender: TObject);
    procedure mnuRelaodeProdutosSubItemClick(Sender: TObject);
    procedure mnuPedidosItemClick(Sender: TObject);
    procedure mnuTotalVendidoporFabricanteSubItemClick(Sender: TObject);
    procedure mnuProdutoMaiseMenosVendidosSubItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuFinCaixaRelDataSubItemClick(Sender: TObject);
    procedure mnuPeriodoSubItemClick(Sender: TObject);
    procedure mnuCoresItemClick(Sender: TObject);
    procedure mnuAniversariantesContatosSubItemClick(Sender: TObject);
    procedure mnuPrecosSubItemClick(Sender: TObject);
    procedure mnuTiposClientesSubItemClick(Sender: TObject);
    procedure mnuRegiaoSubItemClick(Sender: TObject);
    procedure ProdutosporClientes1Click(Sender: TObject);
    procedure mnuTotalVendidoporClientesSubItemClick(Sender: TObject);
    procedure mnuVisitasItemClick(Sender: TObject);
    procedure mnuRelContasReceberSubItemClick(Sender: TObject);
    procedure mnuRelContasPagarSubItemClick(Sender: TObject);
    procedure ReceberMs1Click(Sender: TObject);
    procedure mnuTotalNaturezaItemClick(Sender: TObject);
    procedure mnuCedentesSubItemClick(Sender: TObject);
    procedure BaixadeContasReceber1Click(Sender: TObject);
    procedure BaixadeContasPagar1Click(Sender: TObject);
    procedure SuprimentoseSangrias1Click(Sender: TObject);
    procedure ConsultaSaldoCaixa1Click(Sender: TObject);
    procedure mnuCaixaRelatorioSubItemClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ImportarDados1Click(Sender: TObject);
    procedure mnuTransportadorasSubItemClick(Sender: TObject);
    procedure mnuPlanosSubItemClick(Sender: TObject);
    procedure mnuPromocoesClick(Sender: TObject);
    procedure mnuTotalVendidoSubItemClick(Sender: TObject);
    procedure mnuRenegociaoSubItemClick(Sender: TObject);
    procedure mnuGruposSubItemClick(Sender: TObject);
    procedure mnuGerarBoletosItemClick(Sender: TObject);
    procedure mnuRetornoSubItemClick(Sender: TObject);
    procedure GruposLoja1Click(Sender: TObject);
    procedure ExcluirFatura1Click(Sender: TObject);
    procedure mnuListadeClientesSubItemClick(Sender: TObject);
    procedure ListadeInadimplentes1Click(Sender: TObject);
    procedure mnuTotalPagoMultaJurosSubItemClick(Sender: TObject);
    procedure RenegociaesporPerodo1Click(Sender: TObject);
    procedure mnuEletroEletronicoSubItemClick(Sender: TObject);
    procedure mnuClienteEletrosItemClick(Sender: TObject);
    procedure SituaodoBox1Click(Sender: TObject);
  private
    procedure Fechar_Todas;
    { Private declarations }
    procedure SetJustify(Menu: TMenu; MenuItem: TMenuItem; Justify: Byte);
    procedure tratabotoes;
  public
    { Public declarations }
    Procedure AbreForm(aClasseForm: TComponentClass; aForm : TForm);
    procedure VerificaOpcoesMenu(const menu : TMenuItem);
    procedure VerificaAcessoSubMenu(const menu : TMenuItem);
    Function VerificarAcesso(const codMenu : Integer) : Boolean;
    Procedure Limpar_Acessos;
    Procedure Image_Logo;
  end;

Const
      M_USERMASTER = '000';
      M_SNMASTER   = 'ADMG2_';

var
  FrmAdmin: TFrmAdmin;
  TD : TTransactionDesc;
  M_CDUSUA, M_CDLOJA ,M_NMUSUA, M_SNATUA, W_CDCAIX, M_FLSUPE : String;
  M_LJUSUA : Integer;
  M_FLLOGI : Boolean;
  M_FLMAST : Integer;
  M_NMPAST : String;
  codUsuario, codMenu : Integer;
  admin : Boolean;
  aNovo, aAlterar, aApagar : string;

implementation

uses UFrmEmpresas, UfrmClientes, UFrmFornecedor, uFrmCadBancos, uFrmCadCidades,
uFrmCadBairro, uFrmCadCargos, uFrmCadSituacao, uFrmCadAtividade, uFrmCadContatos,
uFrmCadSecao, uFrmCadSubSecao, uFrmCadTributacao, uFrmCadProdutos,
uFrmCadEntradaMercadoria, uFrmCadUnidades2, uFrmCadFuncionarios, uFrmContasReceber,
uFrmExclusaoTitulo, uFrmCadCheques, uFrmDevolucaoCheques, ufrmAberturaCaixa, uFrmUsuarios,
uVendasPDV, uFrmVendas, uFrmConsEstoque, uFrmCadModalidades, uFrmCancelarVenda,
uLogon, uFuncoes, uSobreADM, uFrmInvertario, udmConsulta, uFrmOperadorCaixa, uFrmCadDerivados,
uFrmAbate, uFrmCadPerdas, uFrmTransferencia, uFrmEntradasSaidas, uFrmFecharCaixa, uFrmSituacaoCaixa,
uFrmCadNatureza, uFrmConfiguracoes, uFrmFecharCaixa2, Udm, uFrmCadLojas, uFrmConsVendas,
uFrmRelCaixa, uFrmRelCaixaData, uRelTotVendidoProduto, uFrmCadContasReceber, uFrmEditarTitulo,
uCadContaPagar, uFrmEditarContaPagar, uFrmBaixaContReceber, uFrmRelClieAnivers,
uFrmManuContasPagar, uFrmRelProdutos, uFrmCadContReceber, uFrmManuContReceber,
uDmRelatorios, uFrmSelecionarProdutos, uFrmRelFornecedores, uFrmEtiqClientes,
uFrmTabelaPrecos, uFrmRelEtiqProdutos, uFrmRelPosEstoque, uFrmTotVendidoProd,
uFrmRelHisEstProdutos, uFrmRelTotVendVendedor, uFrmRelVendaCaixa, uFrmRelTransf,
uFrmExcessoSugestao, uFrmCadMotDevolucao, uFrmRelProdutoVencer, uCadDerivados2,
uFrmRelDerivadosProdutos, uFrmRelProdutos2, uFrmReajuste, uFrmRelProdReajustado,
uFrmRelFluxoCaixa, uFrmRelProdutos3, uFrmCadPedido, uFrmRelTotVendFabricante, uFrmRelTotVendCliente,
uFrmRelCaixaPeriodo, uFrmCadCores, uFrmCadTabPrecos, uFrmCadTipoClientes, uFrmCadRegiao,
uFrmRelProdClientes, uFrmRelVisitaCliente, uFrmRelFichaClientes,
uFrmRelContasReceber, uFrmRelContasPagar, uFrmRelTotalRecebido,
  uFrmRelTotalNatureza, uFrmCadCedentes, udmDados, uFrmCadContaSaldo,
  uFrmRelMovCaixa, uFrmImportaDados, uFrmCadTransportadoras,
  uFrmCadNewPedidos, uFrmCadPlano, frmGerarArquivosXML, uFrmCadMesas,
  uFrmNewVenda, uFrmCadPromocoes, uFrmInvertarioNew, uFrmRelTotalVendido,
  uFrmRenegociacao, uFrmCadGrupos, uFrmGerarBoletos, uFrmBaixaBanco,
  uFrmGrupoLojas, uFrmExcluirFatura, uFrmListaClientes,
  uFrmListaInadimplente, uFrmRelMultaJuros, uFrmCadClientes,
  uFrmRelRenegPeriodo, uFrmCadEletros, uFrmRelClienteEletros,
  uFrmMovimentoBox;

{$R *.dfm}

procedure TFrmAdmin.mnuEmpresasItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
  //
  with TfrmCadLojas.create(self) do
    try
      showmodal
    finally
      free;
    end;
End;

procedure TFrmAdmin.mnuClientesItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
  //
  //AbreForm(TFrmClientes, FrmClientes);
  with TfrmCadClientesNew.create(self) do
  try
    showmodal;
  finally
    free;
  end;
  {with TFrmClientes.create(self) do
  try
    showmodal;
  finally
    free;
  end;}
end;

procedure TFrmAdmin.mnuSairItemClick(Sender: TObject);
begin
  If Application.MessageBox('Sair do Sistema?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
          application.Terminate;
end;

procedure TFrmAdmin.mnuFornecedoresItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
  //
  with TfrmFornecedor.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuBancosItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadBancos.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuCidadesSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadCidades.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuBairrosSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadBairro.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuCargosSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadCargos.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuSituacaoSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadSituacao.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuAtividadesSunItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadAtividades.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuAgendadecontatosItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
  //
  with TfrmCadContatos.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuUnidadesSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //

  with TfrmCadUnidades2.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuSecaoSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadSecao.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuSubSecaoSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadSubSecao.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuTributacaoSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadTributacao.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuCadProdutosItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
  //
  AbreForm(TfrmCadProdutos, frmCadProdutos);
  {with TfrmCadProdutos.create(self) do
  try
    showmodal;
  finally
    free;
  end;}
end;

procedure TFrmAdmin.mnuEntradadeMercadoriasSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadEntrada.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuFuncionriosItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
  //

  with TfrmCadFuncionarios.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuInclusodeCRubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  AbreForm(TfrmCadContaReceber, frmCadContaReceber);
 { with TfrmCadContaReceber.create(self) do
  try
    showmodal;
  finally
    free;
  end;}
end;

procedure TFrmAdmin.mnuExclusodeNP1Click(Sender: TObject);
begin
  with TfrmExclusaoTitulo.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuChequesItemClick(Sender: TObject);
begin
  with TfrmCadCheques.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuConsulta2Click(Sender: TObject);
begin
  with TfrmDevolucaoCheque.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If Application.MessageBox('Sair do Sistema?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
        Canclose:=False;
end;

procedure TFrmAdmin.mnuAberturadeCaixaSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmAberturaCaixa.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuCadastroUsuariosItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  with TfrmCadUsuarios.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TFrmAdmin.mnuVendaItemClick(Sender: TObject);
Var
    W_SNATUA  : String;
begin
    dm.RefreshCDS(Dm.CdsConfig);
    //
    With dmConsultas.qryCaixa do
    Begin
         Close;
         //Params.ParamByName('pLOJA').AsInteger    := StrtoInt(UFrmAdmin.M_CDLOJA);
         Params.ParamByName('pCAIXA').AsInteger   := StrtoInt(M_CDUSUA);
         Params.ParamByName('pSITUACAO').AsString := 'A';
         Open;
    End;
    //
    If (dmConsultas.qryCaixa.IsEmpty) Then
    begin
         dmConsultas.qryCaixa.Close;
         //
         with TfrmOperadorCaixa.create(self) do
         try
             uFrmOperadorCaixa.M_NRFORM := 1;
             showmodal;
         finally
            free;
         end;
    End
    Else
    Begin
        W_CDCAIX := uFuncoes.StrZero(dmConsultas.qryCaixa.FieldByName('CAI_CAIXA').AsString,3);
        //
        if (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'S') Then
         begin
            with TfrmVendas.create(self) do
            try
               edtOPERADOR.Text := W_CDCAIX;
               showmodal;
            finally
               free;
            end;
        End
        Else
             AbreForm(TfrmNewVenda, frmNewVenda);
    End;
end;

procedure TFrmAdmin.Fechar_Todas;
//Fechar todas as janelas abertas.
var
  I: Integer;
begin
  with FrmAdmin do
    for I := MDIChildCount-1 downto 0 do
      MDIChildren[I].Close;
end;

procedure TFrmAdmin.mnuMovEstConsultaSubItemClick(Sender: TObject);
begin
    with TfrmConsultaEstoque.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.Formadepagamentos1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
    with TfrmCadModalidades.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuCancelamentodevendaItemClick(Sender: TObject);
begin
    with TfrmCancelarVenda.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.FormShow(Sender: TObject);
Var
    i : integer;
begin
    { If (M_FLLOGI = False) Then
     begin
         Try
             Application.CreateForm(TfrmLogon, frmLogon);
             frmLogon.ShowModal;
         Finally
             frmLogon.Free;
         End;
     End;}
     Image_Logo;
     // Barra de status
     StatusBar1.Panels[0].Text := uFuncoes.StrZero(M_CDUSUA,3) + ' - '+ M_NMUSUA;
     //
     //codMenu := retornarCodMenu(re)
     if (admin) OR (StrtoInt(M_CDUSUA) = 1) Then
        Exit
     Else
        for i := 0 to Pred(mmPrincipal.Items.Count) do
           VerificaAcessoSubMenu(mmPrincipal.Items[i]);
     //
     tratabotoes;
End;

procedure TFrmAdmin.InfoG22Click(Sender: TObject);
begin
    with TfrmSobre.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuInventarioSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    //AbreForm(TfrmInvertario, frmInvertario);
    AbreForm(TfrmInvertarioNew, frmInvertarioNew);
    {with TfrmInvertario.create(self) do
    try
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuAbateSubItemClick(Sender: TObject);
begin
    with TfrmCadAbate.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuOSItemClick(Sender: TObject);
begin
    Application.MessageBox('Modulo não concluído!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TFrmAdmin.mnuReajusteSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmReajuste, frmReajuste);
    {with TfrmReajuste.create(self) do
    try
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuTransferenciasItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    with TfrmTransferencias.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuSuprimentoeSangriasSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    With dmConsultas.qryCaixa do
    Begin
         Close;
         //Params.ParamByName('pLOJA').AsInteger    := StrtoInt(UFrmAdmin.M_CDLOJA);
         Params.ParamByName('pCAIXA').AsInteger   := StrtoInt(M_CDUSUA);
         Params.ParamByName('pSITUACAO').AsString := 'A';
         Open;
    End;
    //
    If (dmConsultas.qryCaixa.IsEmpty) Then
    begin
         dmConsultas.qryCaixa.Close;
         //
         with TfrmOperadorCaixa.create(self) do
         try
             uFrmOperadorCaixa.M_NRFORM := 2;
             showmodal;
         finally
            free;
         end;
    End
    Else
    Begin
        //
        W_CDCAIX := uFuncoes.StrZero(dmConsultas.qryCaixa.FieldByName('CAI_CAIXA').AsString,3);
        //
        with TfrmEntradaSaida.create(self) do
        try
            uFrmEntradasSaidas.M_CDCAIX := StrtoInt(M_CDUSUA);
            showmodal;
        finally
             free;
        end;
    End;

end;

procedure TFrmAdmin.mnuFechamentodeCaixaSybItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    with TfrmFecharCaixa2.create(self) do
    try
       M_FLFECH := True;
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuSitucaoSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    with TfrmFecharCaixa2.create(self) do
    try
       M_FLFECH := False;
       Caption  := 'Movimento do Caixa';
       showmodal;
    finally
       free;
   end;     
end;

procedure TFrmAdmin.mnuNaturezaSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
    with TfrmCadNatureza.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.Configurao1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
          ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmConfiguracoes, frmConfiguracoes);
end;

procedure TFrmAdmin.mnuBaixadeTituloseChequesSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmBaixaContReceber, frmBaixaContReceber);
    {with TfrmBaixaContReceber.create(self) do
    try
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuFinCPInclusaoClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmCadContasPagar, frmCadContasPagar);
    {with TfrmCadContasPagar.create(self) do
    try
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuEditarContaPagarItemClick(Sender: TObject);
begin
    with TfrmEditaContaPagar.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuExclusoContPagarItemClick(Sender: TObject);
begin
{    with TfrmExcContPagar.create(self) do
    try
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuBaixarContPagarItemClick(Sender: TObject);
begin
{    with TfrmBaixaContPagar.create(self) do
    try
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuConsVendasSubItemClick(Sender: TObject);
begin
    with TfrmConsultaVendas.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuRelatorioClick(Sender: TObject);
begin
    with TfrmRelCaixa.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.Motivodadevoluo1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
    with TfrmCadMotivoDevolucao.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuTotaldeProdutosVendidosItensClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    with TfrmRelTotalProdutos.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF (M_NMUSUA <> 'USERMASTER') tHEN
  Begin
    Try
      // Inicia um transação no BD
      Dm.Start;  
      //
      {dm.cdsUsuarios.Close;
      With dm.dstUsuarios do
      Begin
          Active := False;
          CommandText := 'Select * from USUARIOS Where (SEN_CODIGO = :pCODIGO)';
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(M_CDUSUA);
          Active := True;
      End;
      dm.cdsUsuarios.Open;
      //
      dm.cdsUsuarios.Edit;
      //
      dm.cdsUsuariosSEN_DTATUAL.Clear;
      dm.cdsUsuarios.Post;
      dm.cdsUsuarios.ApplyUpdates(0);
      dm.cdsUsuarios.Close;}
      //
      Dm.Comit(Dm.Transc);
      //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           //  Cancelar transação no BD.
           Dm.Rollback;
        End;
     End;
  End;
   //
   Timer1.Enabled := False;
   Action := caFree;
end;

procedure TFrmAdmin.mnuEditarNPItemClick(Sender: TObject);
begin
    with TfrmEditarTitulo.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuManutencaoCPSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmManuContasPagar, frmManuContasPagar);
    {with TfrmManuContasPagar.create(self) do
    try
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuProdutosItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
  dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);

    with TfrmRelProdutos2.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuManutenodeContasReceberItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmManuContReceber, frmManuContReceber);

    {with TfrmManuContReceber.create(self) do
    try
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuClientesaniversariantesSubItemClick(
  Sender: TObject);
begin
    {with TfrmRelClinAniversariantes.create(self) do
    try
       uFrmRelClieAnivers.M_NRFORM := 1;
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuFichadeclienteSubItemClick(Sender: TObject);
begin
    with TfrmRelFichaClientes.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuGondulasdeprodutosSubItemClick(Sender: TObject);
begin
    with TfrmSeleProdutos.create(self) do
    try
       uFrmSelecionarProdutos.M_NRFORM := 1;
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuRelaodefornecedoresSubItemClick(Sender: TObject);
begin
    with TfrmRelFornecedores.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuRelVendedoresSubItemClick(Sender: TObject);
begin
    try
          //
          dmRelatorios.cdsVendedores.Close;
          With dmRelatorios.dstVendedores do
          Begin
               Active := False;
               CommandText := 'Select FUN_CODIGO, FUN_NOME, FUN_CEP, FUN_PECOMI, FUN_TPFUNC, FUN_FONE '
                             +' from FUNCIONARIOS Where (FUN_TPFUNC = :pTPFUNC) order by FUN_NOME ';
               Params.ParamByName('pTPFUNC').AsString := 'V';
               Active := True;
          End;
          dmRelatorios.cdsVendedores.FetchParams; 
          dmRelatorios.cdsVendedores.Open;
          //
          With dmRelatorios.ppRepVendedores do
              PrintReport;
          //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
end;

procedure TFrmAdmin.mnuEtiquetadeprodutosSubItemClick(Sender: TObject);
begin
     ShowMessage('Módulo não concluído.');
   { with TfrmQuantEtiquetas.create(self) do
    try
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuEtiquetadeclienteSubItemClick(Sender: TObject);
begin
    with TfrmSelecioneCliente.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuTabeladepreosSubItemClick(Sender: TObject);
begin
    with TfrmTabelaPrecos.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuPosiodoestoqueporseoesubsecaoSubItemClick(Sender: TObject);
begin
    with TfrmRelPosicaoEstoque.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuTotalvendidoporprodutoSubItemClick(Sender: TObject);
begin
    with TfrmRelTotalVendido.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.Historicodeprodutos1Click(Sender: TObject);
begin
    with TfrmRelHistEstProdutos.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.otalvendidoporvendedor1Click(Sender: TObject);
begin
    with TfrmRelTotVendVendedor.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.Vendasporoperadordecaixa1Click(Sender: TObject);
begin
    with TfrmRelVendaCaixa.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuTransferenciasporperiodoSubItemClick(Sender: TObject);
begin
    with TfrmRelTransferencias.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.ProdutosreajustadosporperiodoSubItemClick(Sender: TObject);
begin
    //
    with TfrmRelProdutosReajustados.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuProdutosemexcessoporsecaoSubItemClick(Sender: TObject);
begin
    with TfrmRelExcessoSugestao.create(self) do
    try
       uFrmExcessoSugestao.M_NRFORM := 1;
       Caption := 'Relatório Produtos em Excesso por Seção';
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuSugestodecomprasSubItemClick(Sender: TObject);
begin
    with TfrmRelExcessoSugestao.create(self) do
    try
       uFrmExcessoSugestao.M_NRFORM := 2;
       Caption := 'Relatório de Sugestão de compras';
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuRecepodedadosItemClick(Sender: TObject);
begin
    with TfrmImportaXML.create(self) do
    try
       TabSheet2.TabVisible := True;
       TabSheet1.TabVisible := False;
       frmGerarArquivosXML.iOpcao := 2;
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuProdutosVencerItemClick(Sender: TObject);
begin
    with TfrmRelProdutosVencer.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuTotalDerivadosdeProdutosItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    with TfrmRelDerivadosProdutos.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
        vk_Escape: mnuSairItemClick(Sender);
    end;
end;

procedure TFrmAdmin.mnuFluxodeCaixaSubItemClick(Sender: TObject);
begin
    with TfrmRelFluxoCaixa.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuRelaodeProdutosSubItemClick(Sender: TObject);
begin
    with TfrmRelacaoProdutos.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuPedidosItemClick(Sender: TObject);
Var
    W_SNATUA  : String;
begin
    //
    With dmConsultas.qryCaixa do
    Begin
         Close;
         Params.ParamByName('pCAIXA').AsInteger   := StrtoInt(M_CDUSUA);
         Params.ParamByName('pSITUACAO').AsString := 'A';
         Open;
    End;
    //
    If (dmConsultas.qryCaixa.IsEmpty) Then
    begin
         {MessageBox (Application.Handle, pChar('Caixa está fechado para este usuário!!!'),
                     'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);}
         dmConsultas.qryCaixa.Close;
         //
         with TfrmOperadorCaixa.create(self) do
         try
             uFrmOperadorCaixa.M_NRFORM := 1;
             showmodal;
         finally
            free;
         end;
    End
    Else
    Begin
        W_CDCAIX := uFuncoes.StrZero(dmConsultas.qryCaixa.FieldByName('CAI_CAIXA').AsString,3);
        //
        {If (Dm.CdsConfigCFG_TELA_PEDIDO.AsInteger = 1 ) Then
          begin}
            with TfrmCadPedidos.create(self) do
              try
                 uFrmCadPedido.M_CDCAIX := StrtoInt(W_CDCAIX);
                 uFrmCadPedido.W_CDLOJA := dmConsultas.qryCaixaCAI_LOJA.AsInteger;
                 showmodal;
              finally
                 free;
              end;
          {End
          Else
          begin
                 AbreForm(TfrmCadNewPedidos, frmCadNewPedidos);
          End;}
    End;
end;

procedure TFrmAdmin.mnuTotalVendidoporFabricanteSubItemClick(
  Sender: TObject);
begin
    with TfrmRelTotalVendidoFabricante.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuProdutoMaiseMenosVendidosSubItemClick(
  Sender: TObject);
begin
    with TfrmRelTotVendCliente.create(self) do
    try
       uFrmRelTotVendCliente.M_NRFORM := 2;
       Height := 370;
       Caption := 'Produtos Mais e Menos Vendidos';
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.SetJustify(Menu: TMenu; MenuItem: TMenuItem;
  Justify: Byte);
var
    ItemInfo: TMenuItemInfo;
    Buffer: array[0..80] of Char;
begin
     ItemInfo.cbSize := SizeOf(TMenuItemInfo);
     ItemInfo.fMask := MIIM_TYPE;
     ItemInfo.dwTypeData := Buffer;
     ItemInfo.cch := SizeOf(Buffer);
     //
     GetMenuItemInfo(Menu.Handle, MenuItem.Command, False, ItemInfo);
     if Justify = 1 then
        ItemInfo.fType := ItemInfo.fType or MFT_RIGHTJUSTIFY;
     SetMenuItemInfo(Menu.Handle, MenuItem.Command, False, ItemInfo);
end;

procedure TFrmAdmin.FormCreate(Sender: TObject);
Var
	i : integer;
  M_DTEXPI : Tdate;
begin
	with dataSetAux do
	begin
		close;
		CommandText :=
			'Update MENUS Set MEN_EXISTE = '+QuotedStr('F');
		ExecSQL(True);
	End;

	for i := 0 to Pred(mmPrincipal.Items.Count) do
		VerificaOpcoesMenu(mmPrincipal.Items[i]);

	with dataSetAux do
	begin
		close;
		CommandText :=
			'Delete from MENUS where MEN_EXISTE = '+QuotedStr('F');
		ExecSQL(True);
	End;
  //
  SetJustify(mmPrincipal,mnuSobre,1);
  //
  Image1.Left := (FrmAdmin.Width Div 2) - (Image1.Width Div 2);
  Image1.Top := (FrmAdmin.Height Div 2) - (Image1.Height Div 2 + StatusBar1.Height);
  //
  M_DTEXPI := StrtoDate('09/11/2009');
  //
  {   If (Date() > M_DTEXPI) Then
     begin
           Application.MessageBox('A validade deste programa expirou!!!'+#13
                                 +'Entre em contato com a InfoG2:'+#13
                                 +'Telefone: (86) 3226-4510'+#13
                                 +'E_mail...: sac@infog2.com.br' ,
              'Atenção',MB_DEFBUTTON2+MB_OK+MB_ICONINFORMATION);
           //
           Dm.parametros;
           dm.CdsConfig.Edit;
           dm.CdsConfig.FieldByName('CFG_FLJURO').AsInteger := 1;
           dm.CdsConfig.ApplyUpdates(0);
           //
           Application.Terminate;
     End;
     //
     Dm.parametros;
     if (dm.CdsConfig.FieldByName('CFG_FLJURO').AsInteger > 0) Then
       begin
           Application.MessageBox('A validade deste programa expirou!!!'+#13
                                 +'Entre em contato com a InfoG2:'+#13
                                 +'Telefone: (86) 3226-4510'+#13
                                 +'E_mail...: sac@infog2.com.br' ,
              'Atenção',MB_DEFBUTTON2+MB_OK+MB_ICONINFORMATION);
            //
            Application.Terminate;
       End;    }
    //
    Timer1.Enabled := True;
end;

procedure TFrmAdmin.mnuFinCaixaRelDataSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    with TfrmRelCaixaData.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuPeriodoSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    with TFrmRelCaixaPeriodo.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuCoresItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
    with TfrmCadCores.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuAniversariantesContatosSubItemClick(Sender: TObject);
begin
{    with TfrmRelClinAniversariantes.create(self) do
    try
       uFrmRelClieAnivers.M_NRFORM := 2;
       Caption := 'Aniversariantes Contatos';
       showmodal;
    finally
       free;
   end;}
end;

procedure TFrmAdmin.mnuPrecosSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
    with TfrmCadTabelaPrecos.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuTiposClientesSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
    with TfrmCadTipoCliente.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuRegiaoSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
  //
    with TfrmCadRegiao.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.ProdutosporClientes1Click(Sender: TObject);
begin
    with TfrmRelProdCliente.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuTotalVendidoporClientesSubItemClick(
  Sender: TObject);
begin
   with TfrmRelTotVendCliente.create(self) do
    try
       uFrmRelTotVendCliente.M_NRFORM := 1;
       Height := 293;
       Caption := 'Total Vendido por Cliente';
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuVisitasItemClick(Sender: TObject);
Begin
    with TfrmRelVisitaCliente.create(self) do
    try
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.mnuRelContasReceberSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmRelContReceber, frmRelContReceber);   
end;

procedure TFrmAdmin.mnuRelContasPagarSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmRelContasPagar, frmRelContasPagar);
end;

procedure TFrmAdmin.AbreForm(aClasseForm: TComponentClass; aForm: TForm);
begin
      Application.CreateForm(aClasseForm, aForm);
      try
          aForm.ShowModal;
      Finally
          aForm.Free;
      End;
end;

procedure TFrmAdmin.ReceberMs1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
     AbreForm(TfrmRelTotalMes, frmRelTotalMes);
end;

procedure TFrmAdmin.mnuTotalNaturezaItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     AbreForm(TfrmRelTotalNatureza, frmRelTotalNatureza);
end;

procedure TFrmAdmin.mnuCedentesSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmCadCedentes, frmCadCedentes);
end;

procedure TFrmAdmin.VerificaOpcoesMenu(const menu: TMenuItem);
var
	i, seq, codMenu, codMenuPai : Integer;
begin
	with dataSetAux do
	begin
		close;
		CommandText := 
			'Select MEN_CODIGO from MENUS Where MEN_NOME = '+
                        QuotedStr(Trim(RetirarCarecterAtalho(menu.Caption)));
		Open;	
		if IsEmpty Then
		begin
			seq := retornaProximoCodigoMenu;
			if Assigned(menu.Parent) and
                           (menu.Parent.Caption <> '') Then
			begin
				codMenuPai := retornarCodMenu(Trim(
				RetirarCarecterAtalho(menu.Parent.Caption)));
				Close;
				CommandText := 'INSERT INTO MENUS (MEN_CODIGO, MEN_NOME, '+
					'MEN_CODIGOPAI, MEN_EXISTE) VALUES ('+
					InttoStr(seq) +', '+
					QuotedStr(Trim(RetirarCarecterAtalho(menu.Caption))) + ', '+
					intToStr(codMenuPai) + ', '+QuotedStr('T')+')';
			End
			else
			begin
				Close;
				CommandText := 'INSERT INTO MENUS (MEN_CODIGO, MEN_NOME, '+
					'MEN_EXISTE) VALUES ('+		
					InttoStr(seq) +', '+
					QuotedStr(Trim(RetirarCarecterAtalho(menu.Caption))) +
					', '+QuotedStr('T')+')';
			end;
			ExecSQL(True);
		End
		Else
		begin
			codMenu := Fields[0].AsInteger;
			close;
			CommandText :=
				'UpDate MENUS SET MEN_EXISTE = '+QuotedStr('T')+
				'WHERE MEN_CODIGO = '+ IntToStr(codMenu);
			ExecSQL(True);
		End;		

	End; // fim-with	dataSetAux
	for i := 0 to Pred(menu.Count) do
		verificaOpcoesMenu(menu.Items[i]);
end;

procedure TFrmAdmin.VerificaAcessoSubMenu(const menu: TMenuItem);
Var
   i : Integer;
begin
     if not VerificarAcesso(retornarCodMenu(
       RetirarCarecterAtalho(menu.Caption))) then
          menu.Enabled := False;
     //
     for i := 0 to Pred(menu.Count) do
      VerificaAcessoSubMenu(menu.Items[i]);
end;

function TFrmAdmin.VerificarAcesso(const codMenu: Integer): Boolean;
var
   Acesso : string;
begin
      Acesso := Dm.Verificar_Acesso_Menu(StrToInt(M_CDUSUA), codMenu);
      //
      if (Acesso = 'S') or
           (codMenu = -1) Then
              Result := true
      Else
              Result := False;
     {with dmDados.spAcessoMenu do
     begin
          Close;
          ParamByName('CODUSUARIO').AsInteger := StrToInt(M_CDUSUA);
          ParamByName('CODMENU').AsInteger    := codMenu;
          ExecProc;
          //
          s := ParamByName('CONSULTAR').AsString;
          if (ParamByName('CONSULTAR').AsString = 'S') or
            (codMenu = -1) Then
              Result := true
          Else
              Result := False;
     End;}
end;

procedure TFrmAdmin.tratabotoes;
begin
     {tbtLojas.Enabled    := False;
     tbtClientes.Enabled := False;
     tbtFornecedor.Enabled := False;
     tbtProdutos.Enabled := False;
     tbtFuncionarios.Enabled := False;
     spContatos.Enabled  := False;
     tbtPDV.Enabled      := False;}
     //Dm.Verificar_Acesso_Botoes(StrtoInt(M_CDUSUA), 'Lojas...');
     //
     tbtLojas.Enabled    := mnuEmpresasItem.Enabled;
     tbtClientes.Enabled := mnuClientesItem.Enabled;
     tbtFornecedor.Enabled := mnuFornecedoresItem.Enabled;
     tbtProdutos.Enabled := mnuCadProdutosItem.Enabled;
     tbtFuncionarios.Enabled := mnuFuncionriosItem.Enabled;
     spContatos.Enabled  := mnuAgendadecontatosItem.Enabled;
     tbtPDV.Enabled      := mnuVendaItem.Enabled;
     //Dm.Verificar_Acesso_Botoes(StrtoInt(M_CDUSUA), 'Venda...');   
end;

procedure TFrmAdmin.Limpar_Acessos;
begin
     aNovo    := '';
     aAlterar := '';
     aApagar  := '';
end;

procedure TFrmAdmin.BaixadeContasReceber1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    with TfrmBaixaContReceber.create(self) do
    try
       uFrmBaixaContReceber.M_CXGERA := 'S';
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.BaixadeContasPagar1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    with TfrmManuContasPagar.create(self) do
    try
       uFrmManuContasPagar.M_CXGERA := 'S';
       showmodal;
    finally
       free;
   end;
end;

procedure TFrmAdmin.SuprimentoseSangrias1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    With dmConsultas.qryCaixa do
    Begin
         Close;
         //Params.ParamByName('pLOJA').AsInteger    := StrtoInt(UFrmAdmin.M_CDLOJA);
         Params.ParamByName('pCAIXA').AsInteger   := StrtoInt(M_CDUSUA);
         Params.ParamByName('pSITUACAO').AsString := 'A';
         Open;
    End;
    //
    If (dmConsultas.qryCaixa.IsEmpty) Then
    begin
         dmConsultas.qryCaixa.Close;
         //
         with TfrmOperadorCaixa.create(self) do
         try
             uFrmOperadorCaixa.M_NRFORM := 2;
             showmodal;
         finally
            free;
         end;
    End
    Else
    Begin
        //
        W_CDCAIX := uFuncoes.StrZero(dmConsultas.qryCaixa.FieldByName('CAI_CAIXA').AsString,3);
        //
        with TfrmEntradaSaida.create(self) do
        try
            uFrmEntradasSaidas.M_CDCAIX := StrtoInt(M_CDUSUA);
            uFrmEntradasSaidas.M_CXGERA := 'S';
            showmodal;
        finally
             free;
        end;
    End;
end;

procedure TFrmAdmin.ConsultaSaldoCaixa1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmCadContasSaldo, frmCadContasSaldo);
end;

procedure TFrmAdmin.mnuCaixaRelatorioSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    AbreForm(TfrmRelMovimentoCaixa, frmRelMovimentoCaixa);
end;

procedure TFrmAdmin.FormResize(Sender: TObject);
begin
  Image1.Left := (FrmAdmin.Width Div 2) - (Image1.Width Div 2);
  Image1.Top := (FrmAdmin.Height Div 2) - (Image1.Height Div 2 + StatusBar1.Height);
end;

procedure TFrmAdmin.Timer1Timer(Sender: TObject);
begin
     StatusBar1.Panels[2].Text := 'Data : '+DatetoStr(Date()) +' - ' + 'Hora : '+TimetoStr(Time); 
end;

procedure TFrmAdmin.ImportarDados1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
    //
    dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
    //
    AbreForm(TfrmImportaDados, frmImportaDados);
end;

procedure TFrmAdmin.mnuTransportadorasSubItemClick(Sender: TObject);
begin
    AbreForm(TfrmCadTransportadora, frmCadTransportadora);
end;

procedure TFrmAdmin.mnuPlanosSubItemClick(Sender: TObject);
begin
     AbreForm(TfrmCadPlano, frmCadPlano);
end;

procedure TFrmAdmin.Image_Logo;
begin
    If FileExists(ExtractFilePath( Application.ExeName )+'logo2.bmp') Then
        Image1.Picture.LoadFromFile(ExtractFilePath( Application.ExeName )+'logo2.bmp');
end;

procedure TFrmAdmin.mnuPromocoesClick(Sender: TObject);
begin
     if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadPromocoes, frmCadPromocoes);
end;

procedure TFrmAdmin.mnuTotalVendidoSubItemClick(Sender: TObject);
begin
    AbreForm(TfrmRelMesasEntregas, frmRelMesasEntregas);
end;

procedure TFrmAdmin.mnuRenegociaoSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRenegociacao, frmRenegociacao);
end;

procedure TFrmAdmin.mnuGruposSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadGrupos, frmCadGrupos);
end;

procedure TFrmAdmin.mnuGerarBoletosItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     //
     AbreForm(TfrmGerarBoletos, frmGerarBoletos);
end;

procedure TFrmAdmin.mnuRetornoSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     //
     AbreForm(TfrmBaixaBanco, frmBaixaBanco);
end;

procedure TFrmAdmin.GruposLoja1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     //
     AbreForm(TfrmGrupoLojas, frmGrupoLojas);
end;

procedure TFrmAdmin.ExcluirFatura1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     //
     AbreForm(TfrmExcluirFatura, frmExcluirFatura);
end;

procedure TFrmAdmin.mnuListadeClientesSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     AbreForm(TfrmListaClientes, frmListaClientes);
end;

procedure TFrmAdmin.ListadeInadimplentes1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     AbreForm(TfrmRelListaInadimplentes, frmRelListaInadimplentes);
end;

procedure TFrmAdmin.mnuTotalPagoMultaJurosSubItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     AbreForm(TfrmRelMultaJuros, frmRelMultaJuros);
end;

procedure TFrmAdmin.RenegociaesporPerodo1Click(Sender: TObject);
begin
     if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     AbreForm(TfrmRelRenegociacaoPeriodo, frmRelRenegociacaoPeriodo);
end;

procedure TFrmAdmin.mnuEletroEletronicoSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     AbreForm(TfrmCadEletros, frmCadEletros);
end;

procedure TFrmAdmin.mnuClienteEletrosItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     AbreForm(TfrmRelClienteEletros, frmRelClienteEletros);
end;

procedure TFrmAdmin.SituaodoBox1Click(Sender: TObject);
begin
     if Sender is TMenuItem then
      codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dm.Verificar_Direitoa_Acesso(Strtoint(UFrmAdmin.M_CDUSUA), codMenu);
     AbreForm(TFrmMovimentoBox, FrmMovimentoBox);
end;

end.

