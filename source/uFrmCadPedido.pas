unit uFrmCadPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, Mask, ToolEdit,
  CurrEdit, FMTBcd, DBClient, Provider, SqlExpr, DBXpress, Menus, ToolWin,
  ComCtrls, JvExExtCtrls, JvExtComponent, JvRollOut;

type
  TfrmCadPedidos = class(TForm)
    pnlSuperior: TPanel;
    pnlGrid: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    grdConsultar: TDBGrid;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtCDCLIE: TEdit;
    spLocCliente: TSpeedButton;
    Label6: TLabel;
    edtNMCLIE: TEdit;
    Label3: TLabel;
    edtENDER: TEdit;
    edtNumero: TEdit;
    Label4: TLabel;
    edtBairro: TEdit;
    Label5: TLabel;
    edtCidade: TEdit;
    Label7: TLabel;
    dsItensVenda: TDataSource;
    edtTOTAL: TPanel;
    Label11: TLabel;
    edtCDPROD: TEdit;
    edtQUANT: TCurrencyEdit;
    spLocProdutos: TSpeedButton;
    Label12: TLabel;
    edtVLUNIT: TCurrencyEdit;
    Label13: TLabel;
    BtExcluir: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    qryProdutos: TSQLQuery;
    qryProdutosPRO_CODIGO: TStringField;
    qryProdutosPRO_BARRAS: TStringField;
    qryProdutosPRO_DESCRICAO: TStringField;
    qryProdutosPRO_FRACAO: TIntegerField;
    qryProdutosPRO_VLVENDA: TFMTBCDField;
    qryProdutosTRI_CODIGO: TIntegerField;
    qryProdutosUNI_CODIGO: TStringField;
    qryProdutosUNI_ARMAZENAMENTO: TStringField;
    qryProdutosPRO_VLCOMPRA: TFMTBCDField;
    qryProdutosPRO_VLCUSTO: TFMTBCDField;
    qryProdutosPRO_CODIGOBAIXA: TStringField;
    MainMenu1: TMainMenu;
    PDV1: TMenuItem;
    mnuLeituraXItem: TMenuItem;
    mnuReducaoZItem: TMenuItem;
    mnuCancelarltimoCupomItem: TMenuItem;
    N1: TMenuItem;
    mnuCancelarItemAnterior: TMenuItem;
    mnuItemGenericoItem: TMenuItem;
    N2: TMenuItem;
    mnuMemoriaFiscalItem: TMenuItem;
    btCompras: TBitBtn;
    Label17: TLabel;
    edtDesconto: TCurrencyEdit;
    Label14: TLabel;
    edtVLSUBT: TCurrencyEdit;
    Label18: TLabel;
    qryProdutosPRO_IPI: TFMTBCDField;
    GroupBox3: TGroupBox;
    lbl_Pedido: TEdit;
    rbtPedido: TRadioButton;
    rbtOrcamento: TRadioButton;
    qryProdutosPRO_REFERENCIA: TStringField;
    qryProdutosPRO_LIMDESCONTO: TBCDField;
    JvRollOut1: TJvRollOut;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    cmbFornecedor: TComboBox;
    cmbSecao: TComboBox;
    cmbSubSecao: TComboBox;
    cmbReferencia: TComboBox;
    lbl_NMPROD: TEdit;
    edtCDCOR: TEdit;
    edtNMCOR: TEdit;
    edtCNPJ: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    edtIncricao: TEdit;
    Label21: TLabel;
    edtCep: TEdit;
    Label22: TLabel;
    GroupBox4: TGroupBox;
    rbCif: TRadioButton;
    rbFOB: TRadioButton;
    cmbTransportadora: TComboBox;
    edtPercFrete: TCurrencyEdit;
    Label23: TLabel;
    PopupMenu1: TPopupMenu;
    mnuClientesItem: TMenuItem;
    mnuCoresItem: TMenuItem;
    mnuProdutosItem: TMenuItem;
    mnuFornecedoresItem: TMenuItem;
    N3: TMenuItem;
    mnuTransportadoraItem: TMenuItem;
    N4: TMenuItem;
    mnuFormadePagamentoItem: TMenuItem;
    mnuTabeladePrecosItem: TMenuItem;
    mnuPlanodePagamentoItem: TMenuItem;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    cmbPagamento: TComboBox;
    Label16: TLabel;
    cmbTabela: TComboBox;
    Label24: TLabel;
    cmbPlano: TComboBox;
    Panel1: TPanel;
    Label25: TLabel;
    bntEditar: TBitBtn;
    bntConsulta: TBitBtn;
    lblItens: TLabel;
    Panel4: TPanel;
    mmoObs: TMemo;
    mnoObs2: TMemo;
    mnoObs3: TMemo;
    Label26: TLabel;
    Label27: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure cmbSubSecaoEnter(Sender: TObject);
    procedure cmbSecaoEnter(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure spLocProdutosClick(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtQUANTExit(Sender: TObject);
    procedure edtCDPRODEnter(Sender: TObject);
    procedure edtQUANTKeyPress(Sender: TObject; var Key: Char);
    procedure BtExcluirClick(Sender: TObject);
    procedure dsItensVendaDataChange(Sender: TObject; Field: TField);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuLeituraXItemClick(Sender: TObject);
    procedure mnuReducaoZItemClick(Sender: TObject);
    procedure mnuCancelarltimoCupomItemClick(Sender: TObject);
    procedure mnuCancelarItemAnteriorClick(Sender: TObject);
    procedure mnuItemGenericoItemClick(Sender: TObject);
    procedure mnuCancelarmentodeCupomItemClick(Sender: TObject);
    procedure mnuMemoriaFiscalItemClick(Sender: TObject);
    procedure btComprasClick(Sender: TObject);
    procedure edtCDCLIEEnter(Sender: TObject);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtAcrescimoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtQUANTChange(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure lbl_PedidoKeyPress(Sender: TObject; var Key: Char);
    procedure rbtPedidoClick(Sender: TObject);
    procedure lbl_PedidoClick(Sender: TObject);
    procedure rbtOrcamentoClick(Sender: TObject);
    procedure cmbReferenciaEnter(Sender: TObject);
    procedure cmbFornecedorEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCDCORKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCORExit(Sender: TObject);
    procedure edtCDCORChange(Sender: TObject);
    procedure cmbTransportadoraExit(Sender: TObject);
    procedure mnuClientesItemClick(Sender: TObject);
    procedure mnuProdutosItemClick(Sender: TObject);
    procedure mnuFornecedoresItemClick(Sender: TObject);
    procedure mnuCoresItemClick(Sender: TObject);
    procedure mnuTransportadoraItemClick(Sender: TObject);
    procedure mnuFormadePagamentoItemClick(Sender: TObject);
    procedure mnuTabeladePrecosItemClick(Sender: TObject);
    procedure mnuPlanodePagamentoItemClick(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure bntConsultaClick(Sender: TObject);
    procedure bntEditarClick(Sender: TObject);
    procedure edtVLUNITExit(Sender: TObject);
    procedure edtVLUNITKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CARREGAR_PAGAMENTO;
    procedure CARREGAR_PLANO;
    procedure CARREGAR_DADOS_CLIENTE;
    procedure LIMPAR;
    procedure CARREGAR_COMBOS;
    procedure SUBSECAO(M_CDSECA : Integer);
    procedure REFERENCIA(M_CDFORN : Integer);
    procedure DADOS_PRODUTO;
    procedure LIMPAR_DADOS_PRODUTO;
    function VALOR_VENDA() : DOUBLE ;
    procedure Adicionar_Produtos;
    procedure TOTAL;
    procedure tratabotoes(OPCAO : Integer);
    Procedure MODALIDADES;
    Procedure ITENS;
    procedure NOVO;
    procedure MENUS(OPCAO : Integer);
    procedure NUMERO_PEDIDO;
    procedure SUB_TOTAL;
    procedure Tabela_Precos;
    Function GetTabelaCodigo(M_NMTABE : String) : Integer;
    Function DESC_ACRE(M_NMTABE : String; M_VLPROD : Double) : Double;
    Function CRIAR_VENDA_ORCAMENTO(M_NRPEDI : Integer) : Boolean;
    Function EXCLUIR_ORCAMENTO(M_NRPEDI : Integer) : Boolean;
    procedure NUMERO_ORCAMENTO;
    Procedure EditarItem(iCodigo : String);
    Procedure Edita();
    Procedure Seleciona_Pedido(iPedido : Integer);
    Function CalcularValorUnitario(fValorUnitario : Double) : Double;
  public
    { Public declarations }
  end;

var
  frmCadPedidos: TfrmCadPedidos;
  M_CDPROD, M_NMPROD, M_CDUNID, M_CDBARR, M_CDARMA, M_CDTRIB : String;
  M_CDCLIE, M_NMCLIE : String;
  W_CDLOJA, M_CDCAIX, M_NRITEM, M_IMPRES, iRetorno : Integer;
  M_TOTALVENDA, M_QTPROD, M_VLVEND, M_LIDESC, M_VLFRAC, M_VLCOMP, M_VLCUST, M_VALIPI : Double;
  M_FLFRAC, M_FLESTO, M_NRLOTE, M_VLALIQ, M_BARRAS, M_NMREFE  : String;
  M_FLBAIX, M_CDBAIX : String;
  M_FLVEND, M_FLORCA : boolean;
  //
  M_VLDES1, M_VLDES2, M_VLDES3, M_VLDES4, M_VLDES5, M_VLDES6, M_VLDES7 : Double;
  M_VLACR1, M_VLACR2, iTotalItens : Double;
  M_NRORCA  : Integer;
  M_FLALTE : String;


implementation

uses udmConsulta, uLocCliente, uFuncoes,uFrmBuscaProdutos , ufrmLocProdutos,
  Udm, uDm2, uFiscal, uFrmMemFiscal, uFrmSeleLote, uFrmUltimasVendas, uFrmDescontos,
  uFrmOrcamentos, Math, udmDados, uFrmLocCor, uFrmObsevacaoPedido,
  UFrmAdmin, UfrmClientes, uFrmCadProdutos, UFrmFornecedor, uFrmCadCores,
  uFrmCadTransportadoras, uFrmCadModalidades, uFrmCadTabPrecos,
  uFrmCadPlano, uFrmEditarItem, uFrmConsPedidosNovo, uDmRelatorios;

const
    ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
    ScreenHeight: LongInt = 600;

{$R *.dfm}

procedure TfrmCadPedidos.CARREGAR_PAGAMENTO;
begin
     cmbPagamento.Clear;
     dmConsultas.cdsConsulta.Close;
     With dmConsultas.cdsConsulta do
      begin
           Close;
           CommandText := 'Select MOD_NOME from MODALIDADE order by MOD_NOME';
           Open;
           //
           If not (IsEmpty) Then
             begin
                  While not (Eof) do
                    begin
                         cmbPagamento.Items.Add(FieldByName('MOD_NOME').AsString);
                         //
                         Next;
                    End;
             End;
      End;
end;

procedure TfrmCadPedidos.FormCreate(Sender: TObject);
begin
      scaled := true;
      if (screen.width <> ScreenWidth) then
      begin
            height := longint(height) * longint(screen.height) DIV ScreenHeight;
            width := longint(width) * longint(screen.width) DIV ScreenWidth;
            scaleBy(screen.width, ScreenWidth);
      end;
      //
      CARREGAR_PAGAMENTO;
      Tabela_Precos;
      CARREGAR_PLANO;
      CARREGAR_COMBOS;
      tratabotoes(2);
      //
      M_TOTALVENDA := 0;
      M_NRITEM := 0;
      lbl_NMPROD.text := '';
      edtQUANT.Value     := 1;
      btCompras.Enabled  := False;
      //
      M_FLALTE := 'N';
      NOVO;
      //
      If (dm2.cdsParcelasVenda.Active = False) Then
         dm2.cdsParcelasVenda.Open;
      dm2.cdsParcelasVenda.EmptyDataSet;
      //
      dmRelatorios.CarregaRel;
end;

procedure TfrmCadPedidos.spLocClienteClick(Sender: TObject);
begin
  edtCDCLIE.SetFocus;
  with TfrmLocCliente.create(self) do
  try
    uLocCliente.M_NRFROM := 5;
    showmodal;
  finally
    free;
    edtCDCLIE.Text := M_CDCLIE;
    if not uFuncoes.Empty(edtCDCLIE.Text) Then
        edtNMCLIE.SetFocus
    Else
        edtCDCLIE.SetFocus;
  end;
end;

procedure TfrmCadPedidos.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
      begin
           edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
           If (dmConsultas.BUSCA_CLIENTE(StrtoInt(edtCDCLIE.Text))) Then
            begin
                  btCompras.Enabled  := true;
                  CARREGAR_DADOS_CLIENTE;
            End
            Else
            begin
                 Dm.FilterCDS(Dm.CdsClientes, fsInteger, edtCDCLIE.Text);
                 if not (Dm.CdsClientes.IsEmpty) Then
                      Application.MessageBox(PChar('Dados de cliente esta incompleto.'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL)
                 Else
                     Application.MessageBox(PChar('Código de cliente não cadastrado!!!'),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edtNMCLIE.Enabled  := True;
                 btCompras.Enabled  := False;;
                 edtCDCLIE.Clear;
                 edtCDCLIE.SetFocus;
                 Exit;
            End;
      End;
end;

procedure TfrmCadPedidos.edtCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.Text) Then
      begin
           LIMPAR;
           btCompras.Enabled := False;
      end;
end;

procedure TfrmCadPedidos.edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClienteClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          edtNMCLIE.SetFocus;
     End;
end;

procedure TfrmCadPedidos.CARREGAR_DADOS_CLIENTE;
begin
     //edtNMCLIE.Text := dmConsultas.qryLocCliente.FieldByName('CLI_FANTASIA').AsString;
     edtNMCLIE.Text := dmConsultas.qryLocCliente.FieldByName('CLI_RAZAO').AsString;
     edtENDER.Text  := dmConsultas.qryLocCliente.FieldByName('CLI_ENDERECO').AsString;
     edtNumero.Text := dmConsultas.qryLocCliente.FieldByName('CLI_NUMERO').AsString;
     edtBairro.Text := dmConsultas.qryLocCliente.FieldByName('BAI_NOME').AsString;
     edtCidade.Text := dmConsultas.qryLocCliente.FieldByName('CID_NOME').AsString;
     edtCNPJ.Text   := uFuncoes.FormataCNPJ(dmConsultas.qryLocCliente.FieldByName('CLI_CGC').AsString);
     edtIncricao.Text := dmConsultas.qryLocCliente.FieldByName('CLI_INSCESTADUAL').AsString;
     edtCep.Text    := uFuncoes.FormataCep(dmConsultas.qryLocCliente.FieldByName('CLI_CEP').AsString);
end;

procedure TfrmCadPedidos.LIMPAR;
begin
     edtNMCLIE.Clear;
     edtENDER.Clear;
     edtNumero.Clear;
     edtBairro.Clear;
     edtCidade.Clear;
     edtCNPJ.Clear;
     edtIncricao.Clear;
     edtCep.Clear;      
     //
     edtCDPROD.Clear;
     edtVLUNIT.Clear;
     edtDesconto.Clear;
     edtQUANT.Clear;
     edtVLSUBT.Clear;
     lbl_NMPROD.clear;
end;

procedure TfrmCadPedidos.CARREGAR_COMBOS;
begin
     // Fornecedores
     With dmConsultas.cdsConsulta do
      begin
           Close;
           CommandText := 'Select FOR_FANTASIA from FORNECEDORES order by FOR_FANTASIA';
           Open;
           //
           If not (IsEmpty) Then
             begin
                  cmbFornecedor.Clear;
                  cmbFornecedor.Items.Add(' ');
                  //
                  While not (Eof) do
                    begin
                         cmbFornecedor.Items.Add(FieldByName('FOR_FANTASIA').AsString);
                         //
                         Next;
                    End;
             End;
      End;
      //
     // seção
     With dmConsultas.cdsConsulta do
      begin
           Close;
           CommandText := 'Select SEC_DESCRICAO from SECAO order by SEC_DESCRICAO';
           Open;
           //
           If not (IsEmpty) Then
             begin
                  cmbSecao.Clear;
                  cmbSecao.Items.Add(' ');
                  While not (Eof) do
                    begin
                         If not uFuncoes.Empty(FieldByName('SEC_DESCRICAO').AsString) Then
                             cmbSecao.Items.Add(FieldByName('SEC_DESCRICAO').AsString);
                         //
                         Next;
                    End;
             End;
      End;
      // Transportadora
     With dmConsultas.cdsConsulta do
      begin
           Close;
           CommandText := 'Select * from TRANSPORTADORA ';
           Open;
           //
           If not (IsEmpty) Then
             begin
                  cmbTransportadora.Clear;
                  //cmbTransportadora.Items.Add(' ');
                  While not (Eof) do
                    begin
                         If not uFuncoes.Empty(FieldByName('TRP_NOME').AsString) Then
                             cmbTransportadora.Items.Add(FieldByName('TRP_NOME').AsString);
                         //
                         Next;
                    End;
             End;
      End;
end;

procedure TfrmCadPedidos.SUBSECAO(M_CDSECA: Integer);
begin
     cmbSubSecao.Clear;
     cmbSubSecao.Items.Add(' ');
     //
     With dmConsultas.cdsConsulta do
      begin
           Close;
           CommandText := 'Select SUB_DESCRICAO from SUBSECAO Where (SEC_CODIGO = :pCODIGO) order by SUB_DESCRICAO';
           Params.ParamByName('pCODIGO').AsInteger := M_CDSECA;
           Open;
           //
           If not (IsEmpty) Then
             begin
                  While not (Eof) do
                    begin
                         cmbSubSecao.Items.Add(FieldByName('SUB_DESCRICAO').AsString);
                         //
                         Next;
                    End;
             End;
      End;
end;

procedure TfrmCadPedidos.cmbSubSecaoEnter(Sender: TObject);
begin
     If not uFuncoes.Empty(cmbSecao.Text) Then
        SUBSECAO(uFuncoes.CDSECAO(cmbSecao.Text));
end;

procedure TfrmCadPedidos.cmbSecaoEnter(Sender: TObject);
begin
     cmbSubSecao.Clear;
end;

procedure TfrmCadPedidos.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadPedidos.edtCDPRODKeyPress(Sender: TObject; var Key: Char);
begin
     {If not( key in['0'..'9',#8, #13] ) then
        key:=#0;}
     //
     If (Key = #13) and uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
          Key := #0;
          spLocProdutosClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
          Key := #0;
          edtCDCOR.SetFocus;
     End;
end;

procedure TfrmCadPedidos.spLocProdutosClick(Sender: TObject);
begin

  If (edtCDPROD.CanFocus) Then
      edtCDPROD.SetFocus;
  //
  //frmLocProdutos := TfrmLocProdutos.Create(Application);
  with TfrmLocProdutos.create(self) do
  try
     //
     If not uFuncoes.Empty(cmbFornecedor.Text) Then
         ufrmLocProdutos.M_CDFORN := uFuncoes.CDFABRICANTE(cmbFornecedor.Text);
     If not uFuncoes.Empty(cmbSecao.Text) Then
         ufrmLocProdutos.M_CDSECA := uFuncoes.CDSECAO(cmbSecao.Text);
     If not uFuncoes.Empty(cmbSubSecao.Text) Then
         ufrmLocProdutos.M_CDSUBS := uFuncoes.CDSUBSECAO(M_CDSECA, cmbSubSecao.Text);
     if not uFuncoes.Empty(cmbReferencia.Text) Then
         ufrmLocProdutos.M_NMREFE := cmbReferencia.Text;
     //
     //showmodal;
     if (ShowModal = mrOK) then
      begin
        If not (cdsProdutos.IsEmpty) Then
        begin
            edtCDPROD.Text := cdsProdutos.FieldByName('PRO_CODIGO').AsString;
            edtQUANT.SetFocus;
        End
        Else
            edtCDPROD.SetFocus;
      End;
  finally
     //
     free;
  end;
end;

procedure TfrmCadPedidos.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text ) Then
     begin
          lbl_NMPROD.Clear;
          edtCDCOR.Clear;
          edtNMCOR.Clear;
          edtVLSUBT.Value := 0;
     End;
end;

procedure TfrmCadPedidos.edtCDPRODExit(Sender: TObject);
begin
   Try
     If not uFuncoes.Empty(edtCDPROD.Text) then
      begin
         With qryProdutos do
          begin
             Close;
             SQL.Clear;
             //
             SQL.Add('Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO, PRO_FRACAO, ');
             SQL.Add('PRO_VLVENDA, TRI_CODIGO, PRO_LIMDESCONTO, UNI_CODIGO, ');
             SQL.Add('UNI_ARMAZENAMENTO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_IPI, ');
             SQL.Add('PRO_CODIGOBAIXA, PRO_REFERENCIA from PRODUTOS ');
             SQL.Add('Where ((PRO_CODIGO = :pCODIGO) or (PRO_BARRAS = :pBARRAS) or (PRO_REFERENCIA = :pREFERENCIA)) ');
             // Fabricante
             If not uFuncoes.Empty(cmbFornecedor.Text) Then
                 SQL.Add(' And (FOR_CODIGO = '+ QuotedStr(InttoStr(uFuncoes.CDFABRICANTE(cmbFornecedor.Text)))+') ');
             // Referencia
             If not uFuncoes.Empty(cmbReferencia.Text) Then
                 SQL.Add(' And (PRO_REFERENCIA = '+ QuotedStr(cmbReferencia.Text)+') ');
             // Secao
             {If not uFuncoes.Empty(cmbReferencia.Text) Then
                 SQL.Add(' And (SEC_CODIGO = '+ InttoStr(uFuncoes.CDSECAO(cmbSecao.Text))+') ');
                 //SQL.Add(' And (SEC_CODIGO = '+ QuotedStr(InttoStr(uFuncoes.CDSECAO(cmbSecao.Text)))+') ');
             // Sub-Secao
             {If not uFuncoes.Empty(cmbReferencia.Text) Then
                 SQL.Add(' And (SUB_CODIGO = '+ QuotedStr(InttoStr(uFuncoes.CDSUBSECAO(uFuncoes.CDSECAO(cmbSecao.Text), cmbSubSecao.Text)))+') ');}
             //
             Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.text,13);
             Params.ParamByName('pBARRAS').AsString := edtCDPROD.text;
             Params.ParamByName('pREFERENCIA').AsString := edtCDPROD.text;
             //
             Open;
          End;
          //
          If (qryProdutos.IsEmpty) Then
          begin
                Application.MessageBox('Produto não encontrado.',
                   'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL );
                 edtCDPROD.Clear;
                 edtCDPROD.SetFocus;
                 Exit;
          End
          Else
          Begin
               //
               edtCDPROD.Text := uFuncoes.StrZero(edtCDPROD.Text,13);
               DADOS_PRODUTO;
               edtVLUNIT.SetFocus;  
               //edtQUANT.SetFocus;
               //edtCDCOR.SetFocus;
          End;
      End;
   Except
         Application.MessageBox(PChar('Erro ao tentar incluir produto!!!'),
               'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
         edtCDPROD.Clear;
         edtCDPROD.SetFocus;
   End;
end;

procedure TfrmCadPedidos.DADOS_PRODUTO;
begin
            If uFuncoes.Empty(qryProdutos.FieldByName('TRI_CODIGO').AsString)
              and (M_IMPRES > 0) Then
            begin
                 Application.MessageBox('Produto sem tributação!!!',
                                'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //
                qryProdutos.Close;
                edtCDPROD.Clear;
                edtCDPROD.SetFocus;
                Exit;
            End;
               // Carrega as variaveis de memoria
               M_CDPROD := qryProdutos.FieldByName('PRO_CODIGO').AsString;
               M_CDBARR := qryProdutos.FieldByName('PRO_BARRAS').AsString;
               M_NMPROD := Copy(qryProdutos.FieldByName('PRO_DESCRICAO').AsString,1,29);
               M_CDUNID := qryProdutos.FieldByName('UNI_CODIGO').AsString;
               M_CDARMA := qryProdutos.FieldByName('UNI_ARMAZENAMENTO').AsString;
               M_CDTRIB := qryProdutos.FieldByName('TRI_CODIGO').AsString;
               M_VLVEND := qryProdutos.FieldByName('PRO_VLVENDA').AsFloat;
               //CalcularValorUnitario(qryProdutos.FieldByName('PRO_VLVENDA').AsFloat);
               //DESC_ACRE(cmbTabela.Text, qryProdutos.FieldByName('PRO_VLVENDA').AsFloat);
               //M_VLVEND := qryProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
               M_VALIPI := qryProdutos.FieldByName('PRO_IPI').AsFloat;
               M_LIDESC := qryProdutos.FieldByName('PRO_LIMDESCONTO').AsFloat;
               M_VLFRAC := qryProdutos.FieldByName('PRO_FRACAO').AsCurrency;
               M_VLCOMP := qryProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
               M_VLCUST := qryProdutos.FieldByName('PRO_VLCUSTO').AsCurrency;
               M_NMREFE := qryProdutos.FieldByName('PRO_REFERENCIA').AsString;
               //
               If not uFuncoes.Empty(qryProdutos.FieldByName('PRO_CODIGOBAIXA').AsString) Then
               begin
                   M_FLBAIX := 'S';
                   M_CDBAIX := qryProdutos.FieldByName('PRO_CODIGOBAIXA').AsString;
               End
               Else
                   M_FLBAIX := 'N';
          //
          {lbl_NMPROD.Caption := dmConsultas.qryLocCliente.FieldByName('PRO_DESCRICAO').AsString;
          edtVLUNIT.Value    := dmConsultas.qryLocCliente.FieldByName('PRO_VLVENDA').AsCurrency;}
          lbl_NMPROD.Text := qryProdutos.FieldByName('PRO_DESCRICAO').AsString;
          edtVLUNIT.Value    := M_VLVEND;
end;

function TfrmCadPedidos.VALOR_VENDA: DOUBLE;
var
    VALOR : Double;
begin
     VALOR := 0;
     With dmConsultas.cdsItensVendas do
     begin
          DisableControls;
          First;
          While not (Eof) do
          begin
               If (FieldByName('ITE_FLCANC').AsString <> 'C') Then
                   VALOR := VALOR + FieldByname('ITE_VLSUBT').AsFloat;
                   //VALOR := VALOR + uFuncoes.Arredondar(FieldByname('ITE_VLSUBT').AsFloat,2);
               //
               next;
          End;
          //
          EnableControls;
          //
          First;
     End;   // fim-with
     //
     result := VALOR;
end;

procedure TfrmCadPedidos.Adicionar_Produtos;
begin
           //
           MENUS(2);
           M_VLALIQ := uFuncoes.Alltrim(BUSCA_ALIQUOTA(M_CDPROD));
           M_QTPROD := edtQUANT.Value;
           //
           Try
                InttoStr(StrtoInt(edtQUANT.Text));
                M_FLFRAC := 'N';
           Except
                M_FLFRAC := 'S';
           End;
        //
        M_NRITEM := M_NRITEM + 1;
        M_FLVEND := true;
        //
        With dmConsultas.cdsItensVendas do
        Begin
            Append;
            FieldByName('ITE_NRITEN').AsString    := uFuncoes.StrZero(InttoStr(M_NRITEM),3);
            FieldByName('ITE_CDITEN').AsString    := M_CDPROD;
            FieldByName('ITE_NMDESC').AsString    := lbl_NMPROD.Text;
            FieldByName('ITE_QTITEN').AsFloat     := edtQUANT.Value;
            FieldByName('ITE_VLDESC').AsFloat     := edtDesconto.Value;
            FieldByName('ITE_VLUNIT').AsCurrency  := edtVLUNIT.Value;
            FieldByName('ITE_VALIPI').AsFloat     := M_VALIPI;
            FieldByName('ITE_REFERE').AsString    := M_NMREFE;
            If not uFuncoes.Empty(edtCDCOR.Text) Then
            begin
                 FieldByName('ITE_CODCOR').AsInteger   := StrtoInt(edtCDCOR.Text);
                 FieldByName('ITE_NOMCOR').AsString    := uFuncoes.GetCor(StrtoInt(edtCDCOR.Text));
            End;
            Post;
        End;
        //
        TOTAL;
        //
        iTotalItens := iTotalItens + edtQUANT.Value;
        lblItens.Caption := 'QUANT.ITENS: '+ InttoStr(M_NRITEM) + '       TOTAL DE ITENS:' +  FloattoStr(iTotalItens);
        //
        edtDesconto.Value  := 0;
        edtVLSUBT.Value    := 0;
        //
        edtCDPROD.Clear;
        edtCDPROD.SetFocus;
end;

procedure TfrmCadPedidos.edtQUANTExit(Sender: TObject);
begin
     if uFuncoes.Empty(edtCDPROD.Text) Then
     begin
         edtCDPROD.SetFocus;
         Exit;
     End;
     //
     {if uFuncoes.Empty(edtCDCOR.Text) Then
     begin
         edtCDCOR.SetFocus;
         Exit;
     End;}
     //
     If (edtQUANT.Value = 0) Then
       edtQUANT.SetFocus;
     //

end;

procedure TfrmCadPedidos.edtCDPRODEnter(Sender: TObject);
begin
     LIMPAR_DADOS_PRODUTO;
     //
     udm.aFluxoCalc := 'S';
end;

procedure TfrmCadPedidos.LIMPAR_DADOS_PRODUTO;
begin
     edtVLUNIT.Clear;
     lbl_NMPROD.Text := '';
     edtQUANT.Value := 1;
end;

procedure TfrmCadPedidos.edtQUANTKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #27) Then
     begin
          Key := #0;
          edtCDPROD.Clear;
          edtCDPROD.SetFocus;
          Exit;
     End;
     //
     If (Key = #13) and (edtQUANT.Value > 0) Then
     Begin
          Key := #0;
          //edtDesconto.SetFocus;
          edtCDCOR.SetFocus;
     End;
end;


procedure TfrmCadPedidos.BtExcluirClick(Sender: TObject);
begin
     If not (dmConsultas.cdsItensVendas.IsEmpty)
      and (dmConsultas.cdsItensVendas.RecordCount > 0) Then
      Begin
           dmConsultas.cdsItensVendas.Delete;
           TOTAL;
           //
           If (dmConsultas.cdsItensVendas.IsEmpty) Then
             M_NRITEM := 0;
      End;
end;

procedure TfrmCadPedidos.TOTAL;
begin
     M_TOTALVENDA := uFuncoes.Arredondar(VALOR_VENDA,2);
     edtTOTAL.Caption := FormatFloat('###,###,##0.#0', M_TOTALVENDA);
end;

procedure TfrmCadPedidos.dsItensVendaDataChange(Sender: TObject;
  Field: TField);
begin
     if not (dmConsultas.cdsItensVendas.IsEmpty)
      and (dmConsultas.cdsItensVendas.RecordCount > 0) Then
         tratabotoes(1)
     Else
         tratabotoes(2);
     //
     bntEditar.Enabled   := not dmConsultas.cdsItensVendas.IsEmpty;
     bntConsulta.Enabled := dmConsultas.cdsItensVendas.IsEmpty;
end;

procedure TfrmCadPedidos.tratabotoes(OPCAO : Integer);
begin
     If (OPCAO = 1) then
     begin
          BtExcluir.Enabled  := True;
          BtCancelar.Enabled := True;
          BtGravar.Enabled   := True;
     End
     Else
     begin
          BtExcluir.Enabled  := False;
          BtCancelar.Enabled := False;
          BtGravar.Enabled   := False;
     End;
end;

procedure TfrmCadPedidos.BtCancelarClick(Sender: TObject);
begin
     If (Application.MessageBox('Confirma cancelamento de pedido?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes) Then
     Begin
          NOVO;
          edtCDCLIE.SetFocus;
     End;
end;

procedure TfrmCadPedidos.BtGravarClick(Sender: TObject);
Var
     W_NRPEDI, iIDTransp, iIDPlano, iModalidade : Integer;
     aTipoFrete, aTexto, aObs1, aObs2 : String;
     fPercFrete : Double;
begin
     if uFuncoes.Empty(cmbPagamento.Text) Then
      begin
            Application.MessageBox('Selecione a modalidade de pagamento!',
             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION);
            cmbPagamento.SetFocus;
            Exit;                     // sair da procedure.
      End;
      //
     if uFuncoes.Empty(cmbTabela.Text) Then
      begin
            Application.MessageBox('Selecione a tabela de preços!',
             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION);
            cmbTabela.SetFocus;
            Exit;                     // sair da procedure.
      End;
     //
     if uFuncoes.Empty(edtCDCLIE.Text) Then
      begin
            Application.MessageBox('Digite o código do cliente.',
             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION);
            edtCDCLIE.SetFocus;
            Exit;                     // sair da procedure.
      End;
      //
     if uFuncoes.Empty(edtNMCLIE.Text) Then
      begin
            Application.MessageBox('Digite o nome do cliente.',
             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION);
            edtNMCLIE.SetFocus;
            Exit;                     // sair da procedure.
      End;
      //
      If not (rbCif.Checked) and not (rbFOB.Checked) Then
        begin
            Application.MessageBox('Selecione o tipo de frete.',
             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION);
            rbCif.SetFocus;
            Exit;                     // sair da procedure.
        End;
      //
     if uFuncoes.Empty(cmbPlano.Text) Then
      begin
            Application.MessageBox('Selecione o plano de pagamento.',
             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION);
            cmbPlano.SetFocus;
            Exit;                     // sair da procedure.
      End;
      //
      if (edtPercFrete.Value > 0) and uFuncoes.Empty(cmbTransportadora.Text) Then
        begin
            Application.MessageBox('Selecione a transportadora.',
             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION);
            cmbTransportadora.SetFocus;
            Exit;                     // sair da procedure.
        End;
     //
     BtCancelar.Enabled := False;
     BtGravar.Enabled   := False;
     //
     // Tipo de frete
          If (rbCif.Checked) Then
             aTipoFrete := 'C';
          If (rbFOB.Checked) Then
             aTipoFrete := 'F';
          // Percentual de frete
          fPercFrete := edtPercFrete.Value;
          // Transportadora
          iIDTransp := dmConsultas.GetIDTransportadora(cmbTransportadora.Text);
          // Plano
          iIDPlano := uFuncoes.GetCodPlano(cmbPlano.Text);
          //
          iModalidade := uFuncoes.getModalidade(cmbPagamento.text);
          //
          M_CDCLIE := edtCDCLIE.Text;
          M_NMCLIE := edtNMCLIE.Text;
          aTexto := mmoObs.Lines.Text;
          aObs1  := mnoObs2.Lines.Text;
          aObs2  := mnoObs3.Lines.Text;
     //
   If (M_FLALTE = 'N') Then
   begin
     try
          Screen.Cursor := crHourGlass;
          //
          MODALIDADES;
          ITENS;
          W_NRPEDI := StrtoInt(lbl_Pedido.Text);
          //
          if (rbtPedido.Checked) Then
          begin
            // uFuncoes.VENDA
            { TOTAL da venda,
              Desconto,
              Loja,
              Caixa,
              Impressora,
              Cliente,
              Tabela de preços,
              Data Atual,
              nome clientes,
              Hora,
              Janela de Vendas - 2 : pedido; 1 : venda
            }
            {Application.CreateForm(TfrmObsPedido, frmObsPedido);  // Carrega form na memória
            try
                frmObsPedido.ShowModal; // Mostra form em modo exclusivo
            Finally
                // obter a observação do pedido
                aTexto := frmObsPedido.mmoTexto.Lines.Text;
                frmObsPedido.Free; // Libera Memória
            End;}
            TOTAL;
            //
            if not (uFuncoes.VENDA(M_TOTALVENDA, 0, 0, W_CDLOJA, M_CDCAIX,
                  M_IMPRES, StrtoInt(M_CDCLIE), uFuncoes.GetTabela(cmbTabela.Text),1,Date(), M_NMCLIE, TimetoStr(time()), '2',
                     aTipoFrete, fPercFrete, iIDTransp, iIDPlano, iModalidade, aTexto, aObs1, aObs2, '001', 'N', 0)) Then
              begin
                   Application.MessageBox(PChar('Erro no fechamento de venda!!!'),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   Exit;
              End
              Else
              begin
                   if (M_FLORCA) Then
                      If not (EXCLUIR_ORCAMENTO(M_NRORCA)) Then
                           Application.MessageBox(PChar('Erro na exclusão do orçamento.'),
                                'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   //
                   dmRelatorios.VIA_PEDIDO_NOVO(StrToInt(lbl_Pedido.Text),
                               iModalidade
                               ,'S', '', 'N');
                   // uFuncoes.VIA_PEDIDO(W_NRPEDI, uFuncoes.GetModaPedido(W_NRPEDI),'N', cmbFornecedor.Text);
                   NOVO;
              End;
           End;  // fim-se Pedido
           //
           if (rbtOrcamento.Checked) Then
           begin
                If not (uFuncoes.ORCAMENTO(M_TOTALVENDA, 0, W_CDLOJA, M_CDCAIX,
                  M_IMPRES, StrtoInt(M_CDCLIE), uFuncoes.GetTabela(cmbTabela.Text), uFuncoes.getModalidade(cmbPagamento.Text), Date(),
                  M_NMCLIE, TimetoStr(time()), '2', edtENDER.Text, edtBairro.Text,
                     edtCidade.Text, edtNumero.Text)) Then
                begin
                    Application.MessageBox(PChar('Erro no fechamento do orçamento !!!'),
                           'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                    Exit;
                End
                Else
                begin
                     //
                     If Application.MessageBox('Deseja imprimir orçamento?',
                         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
                           uFuncoes.VIA_ORCAMENTO(W_NRPEDI, uFuncoes.GetModaPedido(W_NRPEDI),'N', cmbFornecedor.Text, cmbPagamento.Text);
                     NOVO;
                End;
           End;
     Finally
          Screen.Cursor := crDefault;
     End;
     //
     Application.ProcessMessages;
  End
  Else
  begin
       If (Dm.Alterar_Pedido(StrToInt(lbl_Pedido.Text), StrtoInt(edtCDCLIE.Text),
          uFuncoes.GetTabela(cmbTabela.Text), iIDTransp, iIDPlano, iModalidade, aTipoFrete, aTexto,
           M_TOTALVENDA,  fPercFrete, dmConsultas.cdsItensVendas  )) Then
           begin
                Application.MessageBox('Pedido alterado com sucesso.',
                   'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
                //
                //uFuncoes.VIA_PEDIDO(StrToInt(lbl_Pedido.Text), uFuncoes.GetModaPedido(StrToInt(lbl_Pedido.Text)),'N', cmbFornecedor.Text);
                 dmRelatorios.VIA_PEDIDO_NOVO(StrToInt(lbl_Pedido.Text),
                                iModalidade,'S', '', 'N');
                //
                NOVO;
           End;
  End;
end;

procedure TfrmCadPedidos.MODALIDADES;
begin
     //
     Dm.cdsModalidade.Close;
     With dm.dstModalidades do
     Begin
          Active := False;
          CommandText := 'Select * from MODALIDADE order By MOD_NOME';
          Active := True;
     End;
     Dm.cdsModalidade.Open;
     Dm.cdsModalidade.First;
     //
     dmConsultas.cdsModalidade.Close;
     dmConsultas.cdsModalidade.Open;
     dmConsultas.cdsModalidade.EmptyDataSet;
     //
     While not (Dm.cdsModalidade.Eof) do
     Begin
          dmConsultas.cdsModalidade.Append;
          dmConsultas.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger :=
             Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
          dmConsultas.cdsModalidade.FieldByName('MOD_NOME').AsString      :=
             Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
          dmConsultas.cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat :=
             Dm.cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat;
          dmConsultas.cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString :=
             Dm.cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString;
          dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency := 0;
          dmConsultas.cdsModalidade.FieldByName('MOD_FLFIXA').AsString  :=
             Dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString;
          dmConsultas.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger :=
             Dm.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
          dmConsultas.cdsModalidade.Post;
          // Proximo
          Dm.cdsModalidade.Next;
     End;
     //
     dmConsultas.cdsModalidade.First;
     //
     If (dmConsultas.cdsModalidade.Locate('MOD_NOME',cmbPagamento.Text,[])) Then
      begin
           dmConsultas.cdsModalidade.Edit;
           dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency := M_TOTALVENDA;
           dmConsultas.cdsModalidade.Post;
      End;
end;

procedure TfrmCadPedidos.NOVO;
begin
     udm.aFluxoCalc := 'S';
     dmConsultas.cdsItensVendas.Close;
     dmConsultas.cdsItensVendas.Open;
     dmConsultas.cdsItensVendas.EmptyDataSet;
     //
     LIMPAR;
     cmbFornecedor.ItemIndex := -1;
     cmbSecao.ItemIndex      := -1;
     cmbSubSecao.ItemIndex   := -1;
     cmbTransportadora.ItemIndex := -1;
     cmbTabela.ItemIndex := -1;
     cmbPlano.ItemIndex := -1;
     //
     CARREGAR_PAGAMENTO;
     CARREGAR_COMBOS;
     //
     BtCancelar.Enabled := False;
     BtGravar.Enabled   := False;
     //
     edtVLUNIT.Clear;
     edtQUANT.Value := 1;
     edtTOTAL.Caption := '0,00';
     M_TOTALVENDA := 0;
     edtCDCLIE.Clear;
     edtPercFrete.Clear;
     mmoObs.clear;
     tratabotoes(2);
     //
     cmbPagamento.ItemIndex := -1;
     //
     M_FLVEND := False;
     M_FLORCA := False;
     MENUS(2);
     NUMERO_PEDIDO;
     //
     Tabela_Precos;
     rbtPedido.Checked := True;
     //
     lblItens.Caption := '';
     M_NRITEM := 0;
     iTotalItens := 0;
end;

procedure TfrmCadPedidos.FormShow(Sender: TObject);
begin
     MENUS(1);
     mnuCancelarltimoCupomItem.Enabled := False;
     //
     mnuCancelarltimoCupomItem.Enabled := False;
     //
     dm.parametros;
     NUMERO_PEDIDO;
     //M_FLESTO := dm.CdsConfigCFG_FLVENDAESTOQUE.AsString;
     //
     M_IMPRES := uFuncoes.IMPRESSORA(M_CDCAIX);
     bntConsulta.Enabled := True;
end;

procedure TfrmCadPedidos.mnuLeituraXItemClick(Sender: TObject);
begin
// ---------------------------- Leitura X -------------------------------
     Try
        If (M_FLVEND = False) Then
             uFiscal.FISCAL('LeituraX', M_IMPRES)
        Else
        Begin
             Application.MessageBox (PChar('Você tem que fechar a venda atual!!!'),
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK+MB_APPLMODAL);
             Exit;
        End;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Erro ao tentar realizar leitura X!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
end;

procedure TfrmCadPedidos.mnuReducaoZItemClick(Sender: TObject);
begin
// ---------------------------- Redução Z -------------------------------
     Try
         If (M_FLVEND =  False) Then
         begin
             If MessageBox (Application.Handle, 'A Redução Z impossibilitará novas impressões'+#13
                            +'de Cupons Fiscais!'+#13+#13+'Continua ?',
                            'ATENÇÃO',MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=idYes then
                 uFiscal.FISCAL('ReducaoZ',M_IMPRES)
             Else
                 Exit;
         //
         End
         Else
         Begin
              MessageBox (Application.Handle, 'Você tem que fechar a venda atual!!!',
                  'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
              Exit;
         End;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Erro ao tentar realizar Redução Z!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
end;

procedure TfrmCadPedidos.mnuCancelarltimoCupomItemClick(Sender: TObject);
begin
     Try
        iRetorno := uFiscal.FISCAL('CancelaCupom', M_IMPRES);
        //
        if (iRetorno = 1) Then
          Begin
               //
               NOVO;
               mnuCancelarltimoCupomItem.Enabled := False;
          End;
     Except

     End;
end;

procedure TfrmCadPedidos.mnuCancelarItemAnteriorClick(Sender: TObject);
begin
   If (M_FLVEND = True) Then
   begin
        dmConsultas.cdsItensVendas.Last;
        If (dmConsultas.cdsItensVendas.FieldByName('ITE_FLCANC').AsString <> 'C') Then
          Begin
              iRetorno := uFiscal.FISCAL('CancelaItemAnterior', M_IMPRES);
              If (iRetorno = 1) Then
                  Begin
                      dmConsultas.cdsItensVendas.Edit;
                      dmConsultas.cdsItensVendas.FieldByName('ITE_FLCANC').AsString := 'C';
                      dmConsultas.cdsItensVendas.Post;
                      //
                      {M_TOVEND := Arredondar(M_TOVEND-M_SUBTOT,2);
                      edtTOTAL.Caption := FormatFloat('###,###,##0.00',M_TOVEND);}
                      VALOR_VENDA;
                      TOTAL;
                  End;
          End
          Else
          begin
              Application.MessageBox (Pchar('O item '+uFuncoes.StrZero(InttoStr(M_NRITEM),3)
                  +' já foi cancelado!!!'),'ATENÇÃO',MB_ICONINFORMATION+ MB_OK+MB_APPLMODAL);
              Exit;
          End;
   End
   Else
       Application.MessageBox('Não há venda aberta!!!',
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK+MB_APPLMODAL);
end;

procedure TfrmCadPedidos.mnuItemGenericoItemClick(Sender: TObject);
Var
   W_NRITEM : String;
   W_VLTOIT : Double;
begin
   If (M_FLVEND = True) Then
   begin
        W_NRITEM := InputBox('Cancelar item', 'Digite o número do item?', '');
        Try
             StrtoInt(W_NRITEM);
             W_NRITEM := uFuncoes.StrZero(Copy(W_NRITEM,1,3),3);
        Except
              Application.MessageBox (Pchar('Cancelamento de item não executado!!!'),
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK+MB_APPLMODAL);
              Exit;
        End;
        //
        If (dmConsultas.cdsItensVendas.Locate('ITE_NRITEN',W_NRITEM,[])) Then
        Begin
            If (dmConsultas.cdsItensVendas.FieldByName('ITE_FLCANC').AsString <> 'C') Then
            Begin
                iRetorno := uFiscal.FISCAL('CancelaItemGenerico',M_IMPRES, W_NRITEM);
                If (iRetorno = 1) Then
                    Begin
                        dmConsultas.cdsItensVendas.Edit;
                        dmConsultas.cdsItensVendas.FieldByName('ITE_FLCANC').AsString := 'C';
                        dmConsultas.cdsItensVendas.Post;
                        //
                        VALOR_VENDA;
                        TOTAL;
                    End;
            End
            Else
            begin
                MessageBox (Application.Handle, Pchar('O item '+dmConsultas.cdsItensVendas.FieldByName('ITE_NRITEN').AsString
                    +' já foi cancelado!!!'),'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
                Exit;
            End;
        End
        Else
        begin
             MessageBox (Application.Handle, Pchar('O item '+uFuncoes.StrZero(W_NRITEM,3)
                   +' não existe!!!'),'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
             Exit;
        End;
   End
   Else
       MessageBox (Application.Handle, 'Não há venda aberta!!!',
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
end;

procedure TfrmCadPedidos.mnuCancelarmentodeCupomItemClick(Sender: TObject);
begin
   If (M_FLVEND = True) Then
   begin
         If (Application.MessageBox('Confirma cancelamento de venda?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes) Then
         begin
              iRetorno := uFiscal.FISCAL('CancelaCupom', M_IMPRES);
              //
              If (iRetorno = 1) Then
                  NOVO;
         End;
   End
   Else
       Application.MessageBox('Não há venda aberta!!!',
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK+MB_APPLMODAL);
end;

procedure TfrmCadPedidos.mnuMemoriaFiscalItemClick(Sender: TObject);
begin
     If (M_FLVEND = False) Then
     Begin
          with TfrmMemoriaFiscal.create(self) do
            try
               showmodal;
            finally
               free;
             end;
     End
     Else
     begin
          Application.MessageBox ( 'Você tem que fechar a venda atual!!!',
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
          Exit;
     End;
end;

procedure TfrmCadPedidos.MENUS(OPCAO: Integer);
begin
     if (OPCAO = 1) Then
      begin
        //  MENUS
        mnuLeituraXItem.Enabled      := True;
        mnuReducaoZItem.Enabled      := True;
        mnuMemoriaFiscalItem.Enabled  := True;
        //
        mnuCancelarItemAnterior.Enabled           := False;
        mnuItemGenericoItem.Enabled       := False;
        //mnuCancelarmentodeCupomItem.Enabled := False;
      End
      Else
      begin
        //  MENUS
        mnuLeituraXItem.Enabled      := False;
        mnuReducaoZItem.Enabled      := False;
        mnuMemoriaFiscalItem.Enabled  := False;
        //
        mnuCancelarItemAnterior.Enabled     := True;
        mnuItemGenericoItem.Enabled         := True;
        //mnuCancelarmentodeCupomItem.Enabled := True;
      End;
end;

procedure TfrmCadPedidos.btComprasClick(Sender: TObject);
begin
     With dmConsultas.cdsVendasClientes do
       begin
            Close;
            Params.ParamByName('pCLIENTE').AsInteger := StrtoInt(edtCDCLIE.Text);
            Params.ParamByName('SITUACAO').AsString  := 'F';
            Open;
            //
       End;
       //
      if (dmConsultas.cdsVendasClientes.IsEmpty) then
        begin
             Application.MessageBox ('Não há vendas para cliente.',
                    'AVISO',MB_ICONEXCLAMATION+ MB_OK+MB_APPLMODAL);
             Exit;
        End
        Else
        begin
             With TfrmUltimaVendas.create(self) do
                 try
                    uFrmUltimasVendas.M_CDCLIE := StrtoInt(edtCDCLIE.Text);
                    uFrmUltimasVendas.M_NMCLIE := edtNMCLIE.Text;
                    showmodal;
                 finally
                    free;
                 end;
        End;
end;

procedure TfrmCadPedidos.ITENS;
begin
     Dm.cdsItensVendas.Close;
     Dm.cdsItensVendas.Open;
     Dm.cdsItensVendas.EmptyDataSet;
     //
     with dmConsultas.cdsItensVendas do
      begin
           DisableControls;
           First;
           While not (EoF) do
            begin
                 Dm.cdsItensVendas.Append;
                 //
                 Dm.cdsItensVendas.FieldByName('ITE_NRITEN').AsString := FieldByName('ITE_NRITEN').AsString;
                 Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString := FieldByName('ITE_CDITEN').AsString;
                 Dm.cdsItensVendas.FieldByName('ITE_NMDESC').AsString := FieldByName('ITE_NMDESC').AsString;
                 Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat  := FieldByName('ITE_QTITEN').AsFloat;
                 Dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString := FieldByName('ITE_CDUNID').AsString;
                 Dm.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency := FieldByName('ITE_VLUNIT').AsCurrency;
                 Dm.cdsItensVendas.FieldByName('ITE_VLCOMP').AsCurrency := FieldByName('ITE_VLCOMP').AsCurrency;
                 Dm.cdsItensVendas.FieldByName('ITE_VLCUST').AsCurrency := FieldByName('ITE_VLCUST').AsCurrency;
                 Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString := FieldByName('ITE_FLCANC').AsString;
                 Dm.cdsItensVendas.FieldByName('ITE_NRLOTE').AsString := FieldByName('ITE_NRLOTE').AsString;
                 Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString := FieldByName('ITE_CDBAIX').AsString;
                 Dm.cdsItensVendas.FieldByName('ITE_VLDESC').AsFloat  := FieldByName('ITE_VLDESC').AsFloat;
                 Dm.cdsItensVendas.FieldByName('ITE_CODCOR').AsInteger := FieldByName('ITE_CODCOR').AsInteger;
                 Dm.cdsItensVendas.FieldByName('ITE_VALIPI').AsInteger := FieldByName('ITE_VALIPI').AsInteger;
                 //
                 Dm.cdsItensVendas.Post;
                 //
                 Next;
            End;
           EnableControls;
      End;
end;

procedure TfrmCadPedidos.edtCDCLIEEnter(Sender: TObject);
begin
     LIMPAR;
     btCompras.Enabled := False;
end;

procedure TfrmCadPedidos.NUMERO_PEDIDO;
begin
     lbl_Pedido.Text := uFuncoes.StrZero(InttoStr(Dm.CdsConfigCFG_VENDA.AsInteger + 1),7)
end;

procedure TfrmCadPedidos.edtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     begin
          Key := #0;
          edtCDPROD.Clear;
          edtCDPROD.SetFocus;
          Exit;
     End;
     //
     If (Key = #13) Then
      begin
           Key := #0;
           Perform(WM_NEXTDLGCTL, 0, 0);
      End;
end;

procedure TfrmCadPedidos.edtAcrescimoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) Then
      begin
           Key := #0;
           Perform(WM_NEXTDLGCTL, 0, 0);
      End;
end;

procedure TfrmCadPedidos.BitBtn1Click(Sender: TObject);
begin
    with TfrmDescontos.create(self) do
    try
       uFrmDescontos.M_VALOR1 := M_TOTALVENDA;
       showmodal;
    finally
       free;
   end;
end;

procedure TfrmCadPedidos.edtQUANTChange(Sender: TObject);
Begin
     SUB_TOTAL;
end;

procedure TfrmCadPedidos.SUB_TOTAL;
Var
    M_VLVEND : Double;
begin
     If uFuncoes.Empty (edtQUANT.Text) Then
           edtVLSUBT.Value := 0
      Else
      begin
           If (edtQUANT.Value > 0) Then
           begin
                M_VLVEND := edtVLUNIT.Value
                     -(uFuncoes.Gerapercentual(edtVLUNIT.Value, edtDesconto.Value));
                //
                // edtVLSUBT.Value := M_VLVEND * edtQUANT.Value;
                edtVLSUBT.Value := (M_VLVEND + (uFuncoes.Gerapercentual(M_VLVEND, M_VALIPI))) * edtQUANT.Value;
           End
           Else
               edtVLSUBT.Value := edtVLUNIT.Value;
      End;
end;

procedure TfrmCadPedidos.edtDescontoChange(Sender: TObject);
begin
     SUB_TOTAL;
end;

procedure TfrmCadPedidos.Tabela_Precos;
begin
     //dmConsultas.cdsConsulta.Close;
     with dmConsultas.cdsTabPrecos do
      begin
           Active := False;
           {CommandText := 'Select PRC_CODIGO, PRC_DESCRICAO from TAB_PRECOS ' +
                          ' order by PRC_CODIGO ';}
           Active := True;
      End;
     {dmConsultas.cdsConsulta.FetchParams;
     dmConsultas.cdsConsulta.Open;}
     //
     If not (dmConsultas.cdsTabPrecos.IsEmpty) Then
      begin
           cmbTabela.Clear;
           With dmConsultas.cdsTabPrecos do
            begin
                 First;
                 While not (EoF) do
                  begin
                       cmbTabela.Items.Add(FieldByName('PRC_DESCRICAO').AsString);
                       //
                       Next;
                  End;
            End;  // fim-with
            //
            cmbTabela.ItemIndex := 0;
      End;
end;

function TfrmCadPedidos.DESC_ACRE(M_NMTABE: String; M_VLPROD : Double): Double;
Var
   W_VLPROD : Double;
begin
     W_VLPROD := 0;
     //
     With DM2.cdsTabPreco do
      begin
           Close;
           Params.ParamByName('pCODIGO').AsInteger := GetTabelaCodigo(cmbTabela.Text);
           Open;
           //
           If not (IsEmpty) Then
           begin
                M_VLDES1 := FieldByName('PRC_DESC1').AsFloat;
                M_VLDES2 := FieldByName('PRC_DESC2').AsFloat;
                M_VLDES3 := FieldByName('PRC_DESC3').AsFloat;
                M_VLDES4 := FieldByName('PRC_DESC4').AsFloat;
                M_VLDES5 := FieldByName('PRC_DESC5').AsFloat;
                M_VLDES6 := FieldByName('PRC_DESC6').AsFloat;
                //
                M_VLACR1 := FieldByName('PRC_ACRE1').AsFloat;
                M_VLACR2 := FieldByName('PRC_ACRE2').AsFloat;
                // 1º Desconto
                W_VLPROD :=  M_VLPROD - uFuncoes.Gerapercentual(M_VLPROD, M_VLDES1);
                // 2º Desconto
                W_VLPROD :=  W_VLPROD - uFuncoes.Gerapercentual(W_VLPROD, M_VLDES2);
                // 3º Desconto
                W_VLPROD :=  W_VLPROD - uFuncoes.Gerapercentual(W_VLPROD, M_VLDES3);
                // 4º Desconto
                W_VLPROD :=  W_VLPROD - uFuncoes.Gerapercentual(W_VLPROD, M_VLDES4);
                // 5º Desconto
                W_VLPROD :=  W_VLPROD - uFuncoes.Gerapercentual(W_VLPROD, M_VLDES5);
                // 6º Desconto
                W_VLPROD :=  W_VLPROD - uFuncoes.Gerapercentual(W_VLPROD, M_VLDES6);
                // 1º Acrescimo
                W_VLPROD := W_VLPROD + uFuncoes.Gerapercentual(W_VLPROD, M_VLACR1);
                // 2º Acrescimo
                W_VLPROD := W_VLPROD + uFuncoes.Gerapercentual(W_VLPROD, M_VLACR2);
           End;
           //
           Result := W_VLPROD;
      End;  //fim-do-with
end;

function TfrmCadPedidos.GetTabelaCodigo(M_NMTABE: String): Integer;
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PRC_CODIGO from TAB_PRECOS Where (PRC_DESCRICAO = :pDESCRICAO)');
           Params.ParamByName('pDESCRICAO').AsString := M_NMTABE;
           Open;
           //
           If not (IsEmpty) Then
              Result :=  FieldByName('PRC_CODIGO').AsInteger;
      End;
end;

procedure TfrmCadPedidos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    If (dmConsultas.cdsItensVendas.Active) And
       not (dmConsultas.cdsItensVendas.IsEmpty) Then
        If Application.MessageBox('Gravar pedido?',
            'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
            BtGravar.SetFocus
        Else
            Canclose:=False;
end;

procedure TfrmCadPedidos.lbl_PedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadPedidos.rbtPedidoClick(Sender: TObject);
begin
     NUMERO_PEDIDO;
     NOVO;
end;

procedure TfrmCadPedidos.lbl_PedidoClick(Sender: TObject);
begin
    if (rbtOrcamento.Checked) Then
    begin
        M_NRORCA := 0;
        //
        with TfrmOrcamentos.create(self) do
        try
           if (ShowModal = mrOK) then
               If (CRIAR_VENDA_ORCAMENTO(dmConsultas.cdsOrcamentos.FieldByname('ORC_PEDIDO').AsInteger)) Then
               begin
                    M_NRORCA := dmConsultas.cdsOrcamentos.FieldByname('ORC_PEDIDO').AsInteger;
                    If (BtGravar.Enabled) Then
                        BtGravar.SetFocus;
               End;
          finally
             free;
          end;
     End;
end;

function TfrmCadPedidos.CRIAR_VENDA_ORCAMENTO(M_NRPEDI: Integer): Boolean;
Var
    M_NMFMPG, M_NMTABE  : String;
    M_INDEX : Integer;
begin
     M_FLORCA := False;
     Result := M_FLORCA;
     //
     dmConsultas.cdsItensVendas.Open;
     dmConsultas.cdsItensVendas.EmptyDataSet;
     //
     With dm2.cdsOrcamentos do
      begin
           Close;
           Params.ParamByName('pPEDIDO').AsInteger := M_NRPEDI;
           Open;
           //
           If not (IsEmpty) Then
           begin
                edtCDCLIE.Text := FieldByName('ORC_CLIENTE').AsString;
                edtNMCLIE.Text := FieldByName('ORC_NOMECLIENTE').AsString;
                edtENDER.Text  := FieldByName('DOM_ENDERECO').AsString;
                edtNumero.Text := FieldByName('DOM_NUMERO').AsString;
                edtBairro.Text := FieldByName('DOM_BAIRRO').AsString;
                edtCidade.Text := FieldByName('DOM_CIDADE').AsString;
                //
                M_NMFMPG := uFuncoes.GetFormaPagamento(FieldByName('ORC_MODALIDADE').AsInteger);
                // cmbPagamento
                cmbPagamento.ItemIndex := 0;
                for M_INDEX := 0 to cmbPagamento.Items.Count - 1 do
                  begin
                       If (cmbPagamento.Text = M_NMFMPG) Then
                         begin
                              cmbPagamento.ItemIndex := M_INDEX;
                              Break;
                         End;
                       cmbPagamento.ItemIndex := cmbPagamento.ItemIndex + 1;
                  End;
                // Tabela de preços
                M_NMTABE := uFuncoes.GetNomeTabela(FieldByName('ORC_TABELA').AsInteger);
                cmbTabela.ItemIndex := 0;
                for M_INDEX := 0 to cmbTabela.Items.Count - 1 do
                  begin
                       If (cmbTabela.Text = M_NMTABE) Then
                         begin
                              cmbTabela.ItemIndex := M_INDEX;
                              Break;
                         End;
                       cmbTabela.ItemIndex := cmbTabela.ItemIndex + 1;
                  End;
                // Fornecedor
                cmbFornecedor.ItemIndex := 1;
                for M_INDEX := 1 to cmbFornecedor.Items.Count - 1 do
                  begin
                       If (cmbFornecedor.Text = uFuncoes.getFornecedorOrcamento(M_NRPEDI)) Then
                         begin
                              cmbFornecedor.ItemIndex := M_INDEX;
                              Break;
                         End;
                       cmbFornecedor.ItemIndex := cmbFornecedor.ItemIndex + 1;
                  End;
                //
                With dmConsultas.cdsItensOrcamento do
                 begin
                      Active := False;
                      Params.ParamByName('pPEDIDO').AsInteger := M_NRPEDI;
                      Active := True;
                 End;
                 //
                 M_NRITEM := 0;
                 //
                 With dmConsultas.cdsItensOrcamento do
                 begin
                     While not (Eof) do
                     begin
                       M_NRITEM := M_NRITEM + 1;
                       M_FLVEND := true;
                       //
                       With dmConsultas.cdsItensVendas do
                       Begin
                           Append;
                           FieldByName('ITE_NRITEN').AsString    := uFuncoes.StrZero(InttoStr(M_NRITEM),3);
                           FieldByName('ITE_CDITEN').AsString    := dmConsultas.cdsItensOrcamento.FieldByName('ITO_PRODUTO').AsString;
                           FieldByName('ITE_NMDESC').AsString    := uFuncoes.NOME_PRODUTO(dmConsultas.cdsItensOrcamento.FieldByName('ITO_PRODUTO').AsString);
                           FieldByName('ITE_QTITEN').AsFloat     := dmConsultas.cdsItensOrcamento.FieldByName('ITO_QUANTIDADE').AsFloat;
                           FieldByName('ITE_VLDESC').AsFloat     := dmConsultas.cdsItensOrcamento.FieldByName('ITO_DESCONTO').AsFloat;
                           FieldByName('ITE_VLUNIT').AsCurrency  := dmConsultas.cdsItensOrcamento.FieldByName('ITO_VALOR').AsFloat;
                           FieldByName('ITE_VALIPI').AsFloat     := uFuncoes.IPI_PRODUTO(dmConsultas.cdsItensOrcamento.FieldByName('ITO_PRODUTO').AsString);
                           Post;
                       End;
                       //
                       If (M_NRITEM > 2) Then
                         Break;
                       //
                       next;
                     End; // fim-enquanto
                 End;  // fim-with
                 //
                TOTAL;
                //
                M_FLORCA := True;
                Result := M_FLORCA;
                rbtPedido.Checked := True;
                NUMERO_PEDIDO;
           End;
      End;
     //
     result := M_FLORCA;
end;

procedure TfrmCadPedidos.NUMERO_ORCAMENTO;
begin
     dm.parametros;
     lbl_Pedido.Text := uFuncoes.StrZero(
       InttoStr(Dm.CdsConfig.FieldByName('CFG_ORCAMENTO').AsInteger + 1),7);
end;

procedure TfrmCadPedidos.rbtOrcamentoClick(Sender: TObject);
begin
     NUMERO_ORCAMENTO;
     //NOVO;
end;

procedure TfrmCadPedidos.REFERENCIA(M_CDFORN: Integer);
begin
     // Referencia
     With dmConsultas.cdsConsulta do
      begin
           Close;
           CommandText := 'Select PRO_REFERENCIA from PRODUTOS ';
           if (M_CDFORN > 0) Then
              CommandText := CommandText + ' Where (FOR_CODIGO = '+QuotedStr(InttoStr(M_CDFORN))+') '; 
           CommandText := CommandText + 'Group by PRO_REFERENCIA order by PRO_REFERENCIA ';
           Open;
           //
           If not (IsEmpty) Then
             begin
                  cmbReferencia.Clear;
                  cmbReferencia.Items.Add(' ');
                  While not (Eof) do
                    begin
                         If not uFuncoes.Empty(FieldByName('PRO_REFERENCIA').AsString) Then
                             cmbReferencia.Items.Add(FieldByName('PRO_REFERENCIA').AsString);
                         //
                         Next;
                    End;
             End;
      End;
end;

procedure TfrmCadPedidos.cmbReferenciaEnter(Sender: TObject);
begin
     If uFuncoes.Empty(cmbFornecedor.Text) Then
         REFERENCIA(0)
     Else
         REFERENCIA(uFuncoes.CDFABRICANTE(cmbFornecedor.Text));
end;

procedure TfrmCadPedidos.cmbFornecedorEnter(Sender: TObject);
begin
     cmbReferencia.Clear;
end;

function TfrmCadPedidos.EXCLUIR_ORCAMENTO(M_NRPEDI: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
 Result := False;
 try
  texto := 'Delete From ORCAMENTOS Where (ORC_PEDIDO = '+QuotedStr(InttoStr(M_NRPEDI)) +')';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Clear;
      Close;
      sql.Add(texto);
      ExecSQL();
      //
      texto := 'Delete From ITENS_ORCAMENTO Where (ITO_PEDIDO = '+QuotedStr(InttoStr(M_NRPEDI)) +')';
      sql.Clear;
      Close;
      sql.Add(texto);
      ExecSQL();
      //
      Result := True;
    finally
      free;
    end;
  Except
       
  End;
end;

procedure TfrmCadPedidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key = vk_F5) then
         lbl_PedidoClick(Sender);

end;

procedure TfrmCadPedidos.edtCDCORKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDCOR.Text) Then
     Begin
          Key := #0;
          //
          Application.CreateForm(TfrmBuscaCor, frmBuscaCor);
          try
               frmBuscaCor.showModal;
          Finally
               if not (frmBuscaCor.cdsBusca.IsEmpty) Then
                begin
                    edtCDCOR.Text := frmBuscaCor.cdsBuscaCOR_CODIGO.AsString;
                    Perform(WM_NEXTDLGCTL, 0, 0);
                End;
               //      
               frmBuscaCor.free;
          End;
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDCOR.Text) Then
     Begin
          Key := #0;
          //edtQUANT.SetFocus;
          edtDesconto.SetFocus;  
     End;
end;

procedure TfrmCadPedidos.edtCDCORExit(Sender: TObject);
begin
     if not uFuncoes.Empty(edtCDCOR.Text) Then
      begin
           Dm.FilterCDS(DM2.cdsCores, fsInteger , edtCDCOR.Text);
           //
           If not (DM2.cdsCores.IsEmpty) Then
           begin
                edtCDCOR.Text := uFuncoes.StrZero(edtCDCOR.Text,3);  
                edtNMCOR.Text := DM2.cdsCoresCOR_DESCRICAO.AsString;
           End
           Else
           begin
                 Application.MessageBox (PChar('Código de cor não cadastrado.'),
                            'AVISO', MB_ICONWARNING + MB_OK + MB_APPLMODAL);
                 edtCDCOR.Clear;
                 edtCDCOR.SetFocus;
                 Exit;
           End;
      End;
end;

procedure TfrmCadPedidos.edtCDCORChange(Sender: TObject);
begin
     if uFuncoes.Empty(edtCDCOR.Text) Then
          edtNMCOR.Clear;
end;

procedure TfrmCadPedidos.cmbTransportadoraExit(Sender: TObject);
Var
    iCodigo : integer;
begin
      If not uFuncoes.Empty(cmbTransportadora.Text) Then
       begin
            iCodigo := dmConsultas.GetIDTransportadora(cmbTransportadora.Text);
            Dm.FilterCDS (dmDados.cdsTransportadora, fsInteger, InttoStr(iCodigo));
            If not (dmDados.cdsTransportadora.IsEmpty) Then
               edtPercFrete.Value := dmDados.cdsTransportadoraTRP_PEFRETE.AsCurrency;  
       End;
end;

procedure TfrmCadPedidos.mnuClientesItemClick(Sender: TObject);
begin
     FrmAdmin.AbreForm(TFrmClientes, FrmClientes); 
end;

procedure TfrmCadPedidos.mnuProdutosItemClick(Sender: TObject);
begin
    FrmAdmin.AbreForm(TfrmCadProdutos, frmCadProdutos);
end;

procedure TfrmCadPedidos.mnuFornecedoresItemClick(Sender: TObject);
begin
     FrmAdmin.AbreForm(TfrmFornecedor, frmFornecedor);
end;

procedure TfrmCadPedidos.mnuCoresItemClick(Sender: TObject);
begin
     FrmAdmin.AbreForm(TfrmCadCores,frmCadCores);
end;

procedure TfrmCadPedidos.mnuTransportadoraItemClick(Sender: TObject);
begin
      FrmAdmin.AbreForm(TfrmCadTransportadora, frmCadTransportadora);
      //
      //CARREGAR_PAGAMENTO;
      CARREGAR_COMBOS;
end;

procedure TfrmCadPedidos.mnuFormadePagamentoItemClick(Sender: TObject);
begin
      FrmAdmin.AbreForm(TfrmCadModalidades, frmCadModalidades);
      CARREGAR_PAGAMENTO;
     // CARREGAR_COMBOS;   
end;

procedure TfrmCadPedidos.mnuTabeladePrecosItemClick(Sender: TObject);
begin
      FrmAdmin.AbreForm(TfrmCadTabelaPrecos, frmCadTabelaPrecos);
      //
      Tabela_Precos;
      //CARREGAR_PAGAMENTO;
      //CARREGAR_COMBOS;
end;

procedure TfrmCadPedidos.mnuPlanodePagamentoItemClick(Sender: TObject);
begin
      FrmAdmin.AbreForm(TfrmCadPlano, frmCadPlano);
      //
      CARREGAR_PLANO;
      //CARREGAR_COMBOS;
end;

procedure TfrmCadPedidos.CARREGAR_PLANO;
begin
      // Planos
     With dmConsultas.cdsConsulta do
      begin
           Close;
           CommandText := 'Select * from PLANO_PAGAMENTO';
           Open;
           //
           If not (IsEmpty) Then
             begin
                  cmbPlano.Clear;
                  //
                  While not (Eof) do
                    begin
                         If not uFuncoes.Empty(FieldByName('PLA_DESCRICAO').AsString) Then
                             cmbPlano.Items.Add(FieldByName('PLA_DESCRICAO').AsString);
                         //
                         Next;
                    End;
             End;
      End;
end;

procedure TfrmCadPedidos.edtDescontoExit(Sender: TObject);
begin
    if uFuncoes.Empty(edtCDCOR.Text) Then
       begin
           edtCDCOR.SetFocus;
           Exit;
       End;
     //
     If (edtQUANT.Value > 0) Then
     Begin
           Adicionar_Produtos;
           edtCDPROD.Clear;
           edtCDPROD.SetFocus;
     End;
end;

procedure TfrmCadPedidos.EditarItem(iCodigo: String);
begin
     Application.CreateForm(TfrmEditarItem, frmEditarItem);
     Try
          With frmEditarItem do
          begin
               //
               ShowModal;
          End;
     Finally
          frmEditarItem.Free;
     End;
end;

procedure TfrmCadPedidos.grdConsultarDblClick(Sender: TObject);
begin
     Edita();
end;

procedure TfrmCadPedidos.Seleciona_Pedido(iPedido: Integer);
begin
      NOVO;
      // udm.aFluxoCalc := 'N';
      Dm.Load_Pedido(iPedido);
      edtCDCLIE.SetFocus;
      edtCDCLIE.Text := Dm.cdsMovimentoMOV_CLIENTE.AsString;
      lbl_Pedido.Text := ufuncoes.StrZero(Dm.cdsMovimentoMOV_PEDIDO.AsString,7);
      edtPercFrete.Value := Dm.cdsMovimentoMOV_PERC_FRETE.AsFloat;
      if (Dm.cdsMovimentoMOV_TIPO_FRETE.AsString = 'F' ) Then
         rbFOB.Checked := True
      Else
         rbCif.Checked := False;
      //
      {CARREGAR_COMBOS;
      CARREGAR_PAGAMENTO;
      Tabela_Precos;}
      //
      cmbTransportadora.Clear;
      cmbTransportadora.Items.Add(dmConsultas.GetNomeTransportadora(Dm.cdsMovimentoMOV_IDTRANSPORTADORA.AsInteger));
      cmbTransportadora.ItemIndex := 0;
      //
      cmbPlano.Clear;
      cmbPlano.Items.Add(uFuncoes.GetCondicaoPagamento(Dm.cdsMovimentoMOV_TABELA_PLANO.AsInteger));
      cmbPlano.ItemIndex := 0;
      //
      cmbTabela.Clear;
      cmbTabela.Items.Add(uFuncoes.GetNomeTabela(Dm.cdsMovimentoMOV_TABELA.AsInteger));
      //uFuncoes.GetFormaPagamento(GetModaPedido(Dm.cdsMovimentoMOV_PEDIDO.AsInteger));
      cmbTabela.ItemIndex := 0;
      //
      cmbPagamento.Clear;
      cmbPagamento.Items.Add(uFuncoes.GetFormaPagamento(Dm.cdsMovimentoMOV_MODALIDADE_PEDIDO.AsInteger));
      cmbPagamento.ItemIndex := 0;
      //
      Perform(WM_NEXTDLGCTL, 0, 0);
      TOTAL;
      mmoObs.Lines.Text := Dm.cdsMovimentoMOV_OBSERVACAO.AsString;
      //
      M_FLALTE := 'S';
end;

procedure TfrmCadPedidos.bntConsultaClick(Sender: TObject);
begin
     Application.CreateForm(TfrmConsPedidosNovo, frmConsPedidosNovo);
     Try
          With frmConsPedidosNovo do
          begin
               //
               if ShowModal = mrOK then
                begin
                  if not (cdsVendas.IsEmpty) Then
                      Seleciona_Pedido(cdsVendasMOV_PEDIDO.AsInteger);

                End
                Else
                    NOVO;
          End;
     Finally
          frmConsPedidosNovo.Free;
     End;
end;

procedure TfrmCadPedidos.Edita;
begin
      EditarItem(dmConsultas.cdsItensVendasITE_CDITEN.AsString);
      //
      TOTAL;
      //
      edtDesconto.Value  := 0;
      edtVLSUBT.Value    := 0;
      //
      edtCDPROD.Clear;
      edtCDPROD.SetFocus;
end;

procedure TfrmCadPedidos.bntEditarClick(Sender: TObject);
begin
    Edita();
end;

function TfrmCadPedidos.CalcularValorUnitario(
  fValorUnitario: Double): Double;
begin
     Result := DESC_ACRE(cmbTabela.Text, fValorUnitario);
end;

procedure TfrmCadPedidos.edtVLUNITExit(Sender: TObject);
begin
     if not Empty(edtCDPROD.Text) and (edtVLUNIT.Value > 0 ) Then
      begin
           edtVLUNIT.Value := DESC_ACRE(cmbTabela.Text, edtVLUNIT.Value);
           SUB_TOTAL;
      End;
end;

procedure TfrmCadPedidos.edtVLUNITKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) and not uFuncoes.Empty(edtVLUNIT.Text) Then
      begin
           Key := #0;
           edtQUANT.SetFocus;
      End;
end;

end.
