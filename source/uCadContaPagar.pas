unit uCadContaPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Spin, Grids, DBGrids, DBXpress,
  FMTBcd, DB, DBClient, SqlExpr, Provider, ToolEdit, CurrEdit, Menus;

type
  TfrmCadContasPagar = class(TForm)
    pnlDados: TPanel;
    Panel2: TPanel;
    BtAdicionar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    dbeNRNOTA: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbeSERIE: TMaskEdit;
    edtCDNATU: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    pnlGrid: TPanel;
    dbgridParcelas: TDBGrid;
    Label10: TLabel;
    cmbNMLOJA: TComboBox;
    edtCDFORN: TEdit;
    edtDTCOMP: TMaskEdit;
    mmoDescricao: TMemo;
    lbl_NRPRES: TLabel;
    lbl_VLTOTAL: TLabel;
    spLocFornecedor: TSpeedButton;
    spNatureza: TSpeedButton;
    lbl_Natureza: TLabel;
    btClonar: TBitBtn;
    dspContasPagar: TDataSetProvider;
    dstContasPagar: TSQLDataSet;
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
    dstContasPagarPAG_AGENCIA: TStringField;
    cdsContasPagar: TClientDataSet;
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
    edtQTPARC: TCurrencyEdit;
    cbxAvista: TCheckBox;
    cmbConta: TComboBox;
    lblConta: TLabel;
    lblConta2: TLabel;
    PopupMenu1: TPopupMenu;
    pmnFornecedoresItem: TMenuItem;
    pmnBancosItem: TMenuItem;
    pmnNaturezasItem: TMenuItem;
    cmbNaturezas: TComboBox;
    lbl_NMFORN: TEdit;
    procedure BtSairClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCDFORNKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDNATUKeyPress(Sender: TObject; var Key: Char);
    procedure spLocFornecedorClick(Sender: TObject);
    procedure edtCDFORNExit(Sender: TObject);
    procedure mmoDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDNATUExit(Sender: TObject);
    procedure edtDTCOMPExit(Sender: TObject);
    procedure dbeSERIEKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNRNOTAKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNRNOTAExit(Sender: TObject);
    procedure dbeSERIEExit(Sender: TObject);
    procedure cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTCOMPKeyPress(Sender: TObject; var Key: Char);
    procedure spNaturezaClick(Sender: TObject);
    procedure edtCDFORNChange(Sender: TObject);
    procedure edtCDNATUChange(Sender: TObject);
    procedure edtQTPARCExit(Sender: TObject);
    procedure dbgridParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgridParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure dbgridParcelasCellClick(Column: TColumn);
    procedure dbgridParcelasColExit(Sender: TObject);
    procedure edtQTPARCKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgridParcelasEnter(Sender: TObject);
    procedure edtQTPARCEnter(Sender: TObject);
    procedure dbgridParcelasColEnter(Sender: TObject);
    procedure mmoDescricaoExit(Sender: TObject);
    procedure btClonarClick(Sender: TObject);
    procedure dspContasPagarGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure FormCreate(Sender: TObject);
    procedure cbxAvistaClick(Sender: TObject);
    procedure pmnFornecedoresItemClick(Sender: TObject);
    procedure pmnBancosItemClick(Sender: TObject);
    procedure pmnNaturezasItemClick(Sender: TObject);
  private
    novo, alterar, apagar : String;
    procedure tratabotoes;
    procedure LOJAS;
    Function VALIDAR_NOTA(W_CDFORN, W_NRNOTA, W_NRSERI : String) : Boolean;
    Procedure LIMPAR_CAMPOS;
    Procedure CRIAR_PARCELAS;
    procedure ALTUALIZAR_PARCELAS;
    procedure VALOR_CONTA;

    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmCadContasPagar: TfrmCadContasPagar;
  M_CDFORN, M_CDNATU : String;
  M_VLCONT, W_VLCONT : REAL;
  TD : TTransactionDesc;
  W_NRPARC : integer;

implementation

uses udmConsulta, uFrmLocFornec, uFuncoes, uBuscarNatureza, uDm2, Udm,
  UFrmAdmin, udmDados, UFrmFornecedor, uFrmCadBancos, uFrmCadNatureza;

{$R *.dfm}

procedure TfrmCadContasPagar.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmCadContasPagar.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtCancelar.Enabled  := not BtCancelar.Enabled;
   BtGravar.Enabled    := not BtGravar.Enabled;
   BtSair.Enabled      := not BtSair.Enabled;
   btClonar.Enabled    := not btClonar.Enabled;
end;

procedure TfrmCadContasPagar.BtAdicionarClick(Sender: TObject);
begin
     tratabotoes;
     LIMPAR_CAMPOS;
     pnlDados.Enabled := True;
     LOJAS;
     //
     dmConsultas.CarregarNaturezas(cmbNaturezas, '1');
     cmbNMLOJA.SetFocus;
     lbl_NRPRES.Caption :=  uFuncoes.StrZero(InttoStr(dm.CdsConfigCFG_ENTRADA.AsInteger+1),7);
     edtDTCOMP.Text := DatetoStr(Date());
end;

procedure TfrmCadContasPagar.BtCancelarClick(Sender: TObject);
begin
     tratabotoes;
     LIMPAR_CAMPOS;
     pnlDados.Enabled := False;
     //
     BtAdicionar.SetFocus;
end;

procedure TfrmCadContasPagar.BtGravarClick(Sender: TObject);
Var
    M_NRENTR, M_SEQPAG, W_QTPARC, M_CDLOJA, V_NRPARC : Integer;
    M_HOMOVI : String;
    M_VLPAGO : Double;
    M_VLANTE, M_VLMOVI, M_VLATUA : Double;
    M_CDFORN, M_CDMODA : Integer;
    M_DTMOVI : TDate;
    iUsuario, iNatureza : Integer;
begin
     If (dm2.cdsParcelas.Active = False) Then
     begin
          Application.MessageBox('Quantidade de parcela vazia!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtQTPARC.SetFocus;
          Exit;
     End;
     //
     dm2.cdsParcelas.DisableControls;
     dm2.cdsParcelas.First;
     M_VLCONT := 0;
     While not (dm2.cdsParcelas.Eof) do
     begin
         dm2.cdsParcelas.Edit;
         //
         If (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString)
           or (dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency = 0))
           or (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsString)) Then
         begin
              V_NRPARC := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
              dm2.cdsParcelas.EnableControls;
              dm2.cdsParcelas.Locate('PAR_NRPARCELA',V_NRPARC,[]);
              dbgridParcelas.SetFocus;
              Exit;
              break;
         End;
         //
         If not (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString)) Then
         Begin
              If (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString))
                or (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString))
                or (uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString)) then
              begin
                    V_NRPARC := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
                    dm2.cdsParcelas.EnableControls;
                    dm2.cdsParcelas.Locate('PAR_NRPARCELA',V_NRPARC,[]);
                    dbgridParcelas.SetFocus;
                    Exit;
                    break;
              End;
         End;
         //
         M_VLCONT := M_VLCONT + dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
         //
         dm2.cdsParcelas.Next;
     End;
     //
     dm2.cdsParcelas.EnableControls;
     //
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Application.MessageBox('Selecione a loja!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNMLOJA.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
          Application.MessageBox('Digite o código do fornecedor!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtCDFORN.SetFocus;
          Exit;
     End;
     //
     If (edtDTCOMP.Text = '  /  /    ') Then
     Begin
          Application.MessageBox('Digite a data da compra!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTCOMP.SetFocus;
          Exit;
     End;
     //
     If (mmoDescricao.Lines.Text = ' ')
     or (mmoDescricao.Lines.Count = 0) Then
     Begin
          Application.MessageBox('Digite a descrição da conta!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          mmoDescricao.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbNaturezas.Text) Then
     Begin
          Application.MessageBox('Selecione a natureza!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNaturezas.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtQTPARC.Text) Then
     Begin
          Application.MessageBox('Digite a quantidade de parcelas!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtQTPARC.SetFocus;
          Exit;
     End;
     //
     If (M_VLCONT = 0) Then
     Begin
          Application.MessageBox('Total das parcelas não pode ser zero!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbgridParcelas.SetFocus;
          Exit;
     End;
     //
     If (cbxAvista.Checked) Then
        if Empty(cmbConta.Text) Then
          begin
             Application.MessageBox('Selecione a conta.','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             //
             cmbConta.SetFocus;
             Exit;
          End;
     //
     iNatureza := dmConsultas.GetNaturezaCogigo(cmbNaturezas.Text);
     iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);    
     // Inicia um transação no BD
     TD.TransactionID  := StrtoInt(uFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);
     //
     try
        M_HOMOVI := Copy(TimetoStr(Time),1,5);
        M_DTMOVI := Date;
        M_VLPAGO := 0;
        //
        dm.parametros;
        dm.CdsConfig.Edit;
        dm.CdsConfigCFG_ENTRADA.Value       := dm.CdsConfigCFG_ENTRADA.Value+1;
        M_NRENTR := dm.CdsConfigCFG_ENTRADA.AsInteger;
        dm.CdsConfig.Post;
        dm.CdsConfig.ApplyUpdates(0);
        //
        M_CDLOJA := uFuncoes.CDLOJA(cmbNMLOJA.Text);
        // Gerando contas a pagar do valor da nota
        With cdsContasPagar do
        Begin
             Active := False;
             With dstContasPagar do
             begin
                  Active := False;
                  CommandText := 'Select * from CONTASPAGAR Where (PAG_LOJA = :pLOJA)'+
                                 ' AND (PAG_NRENTRADA = :pNRENTRADA)';
                  Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                  Params.ParamByName('pNRENTRADA').AsInteger := M_NRENTR;
                  Active := True;
             End;
             //
             FetchParams; 
             Active := True;
             //
             If (IsEmpty) Then
             Begin
                dm2.cdsParcelas.DisableControls;
                dm2.cdsParcelas.First;
                //
                While not (dm2.cdsParcelas.Eof) DO
                Begin
                  dm.CdsConfig.Edit;
                  dm.CdsConfigCFG_SEQPAGAR.AsInteger  := dm.CdsConfigCFG_SEQPAGAR.AsInteger + 1;
                  M_SEQPAG := dm.CdsConfigCFG_SEQPAGAR.AsInteger;
                  dm.CdsConfig.Post;
                  dm.CdsConfig.ApplyUpdates(0);
                  //
                  Append;
                  FieldByName('PAG_SEQUENCIA').AsInteger := M_SEQPAG;
                  FieldByName('PAG_NRENTRADA').AsInteger := M_NRENTR;
                  FieldByName('PAG_LOJA').AsInteger      := M_CDLOJA;
                  FieldByName('PAG_PARCELA').AsString    := uFuncoes.StrZero(dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsString,2);
                  FieldByName('PAG_QTPARCELAS').AsInteger   := StrtoInt(edtQTPARC.Text);
                  FieldByName('PAG_DATACOMPRA').AsDateTime  := StrtoDate(edtDTCOMP.Text);
                  FieldByName('PAG_FORNECEDOR').AsInteger   := StrtoInt(edtCDFORN.Text);
                  FieldByName('PAG_NRNOTA').AsString           := dbeNRNOTA.Text;
                  FieldByName('PAG_SERIENOTA').AsString        := dbeSERIE.Text;
                  FieldByName('PAG_NATUREZADESPESA').AsInteger := iNatureza;  // StrtoInt(edtCDNATU.Text);
                  FieldByName('PAG_DESCONTOANTECIPADO').AsFloat := 0;
                  FieldByName('PAG_VALORPARCELA').AsCurrency    := dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
                  FieldByName('PAG_DATAVENCIMENTO').AsDateTime  := dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsDateTime;
                  FieldByName('PAG_DESCRICAO').AsString         := mmoDescricao.Text;
                  FieldByName('PAG_VALORJUROS').AsCurrency      := 0;
                  FieldByName('PAG_VALORDESCONTO').AsCurrency   := 0;
                  If not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString) Then
                     FieldByName('PAG_BANCO').AsString             := uFuncoes.StrZero(dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString,3);
                  If not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString) Then
                     FieldByName('PAG_NRCONTA').AsString           := uFuncoes.StrZero(dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString,10);
                  If not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString) Then
                      FieldByName('PAG_NRCHEQUE').AsString          := uFuncoes.StrZero(dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString,10);
                  If not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString) Then
                      FieldByName('PAG_AGENCIA').AsString           := dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString;
                  FieldByName('PAG_USUARIO').AsInteger          := StrtoInt(uFrmAdmin.M_CDUSUA);
                  //
                  If (cbxAvista.Checked) Then
                    begin
                         FieldByName('PAG_VALORPAGO').AsCurrency     := dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
                         FieldByName('PAG_DATAPAGAMENTO').AsDateTime := StrtoDate(edtDTCOMP.Text);
                         FieldByName('PAG_SITUACAO').AsString        := 'P';
                         M_VLPAGO := dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
                         //  Incluir Movimento de Caixa
                         Dm.Incluir_Movimento_Caixa(M_CDLOJA, 0, StrtoInt(uFrmAdmin.M_CDUSUA), StrtoInt(edtCDNATU.Text), 'P',
                               M_HOMOVI, '1', '', 'PAGAMENTO DE CONTA', StrtoDate(edtDTCOMP.Text), M_VLPAGO, M_VLPAGO, 0);
                         //
                    End
                    Else
                         FieldByName('PAG_SITUACAO').AsString        := 'A';
                  //
                  Post;
                  ApplyUpdates(0);
                  // Nova alteração
                  If not Empty(cmbConta.Text) Then
                  begin
                       M_CDMODA := Dm.GetCodConta(cmbConta.Text);
                       M_VLANTE := 0;
                       M_VLMOVI := 0;
                       M_VLATUA := 0;
                       M_CDLOJA := FieldByName('PAG_LOJA').AsInteger;
                       M_CDFORN := FieldByName('PAG_FORNECEDOR').AsInteger;
                       M_VLANTE := dmDados.GetValorAtual(M_CDMODA);
                       M_VLMOVI := FieldByName('PAG_VALORPAGO').AsCurrency;
                       //
                       dmDados.SetSaldoConta(M_CDMODA,M_VLMOVI,'S');
                       //
                       M_VLATUA := dmDados.GetValorAtual(M_CDMODA);
                       // Nova alteração   incluir registro o Caixa Geral
                       dmDados.Incluir_Movimento_Contas(M_CDLOJA, StrtoInt(uFrmAdmin.M_CDUSUA),
                          M_CDMODA, FieldByName('PAG_NATUREZADESPESA').AsInteger, 0, M_CDFORN,
                          M_VLANTE, M_VLMOVI, M_VLATUA,
                          FieldByName('PAG_NRNOTA').AsString,
                          'S', M_HOMOVI, 'PAGAMENTO DE CONTA', '',
                          FieldByName('PAG_NRCHEQUE').AsString, M_DTMOVI);
                  End;
                  //
                  dm2.cdsParcelas.Next;
                End; // fim-do-enquanto
                //
                dm2.cdsParcelas.EnableControls;
             End;
        End;
        // Grava
        Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
        //
        Application.MessageBox (pChar('Registro gravado com sucesso!!!'),
                     'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
        //
        Dm.Start;
        Try
           If not (dm.IncluirTarefaUsuario( iUsuario,
               'Inc.Conta Pagar > Nº.Compra : '+uFuncoes.StrZero(InttoStr(M_NRENTR),7)+
               ' Fornecedor: ' +  uFuncoes.StrZero(edtCDFORN.Text,5)+
               ' Valor:'+FormatFloat('###,##0.#0', M_VLCONT) +' *F*')) Then
                  ShowMessage('Erro ao adicionar tarefa do usuário.');
            dm.Comit(Dm.Transc);

        Except
             dm.Rollback;
        End;
        //
        tratabotoes;
        LIMPAR_CAMPOS;
        pnlDados.Enabled := False;
        BtAdicionar.SetFocus;
        //
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar incluir conta!!!'
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
              tratabotoes;
              LIMPAR_CAMPOS;
        End;
     End;
end;

procedure TfrmCadContasPagar.LOJAS;
begin
     With dmConsultas.qryLoja do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS');
          SQL.Add('order by EMP_FANTASIA');
          Open;
          First;
     End;
     //
     cmbNMLOJA.Clear;
     While not (dmConsultas.qryLoja.Eof) do
     Begin
          cmbNMLOJA.Items.Add(dmConsultas.qryLoja.FieldByName('EMP_FANTASIA').AsString);
          //
          dmConsultas.qryLoja.Next;
     End;
end;

procedure TfrmCadContasPagar.FormShow(Sender: TObject);
begin
     cdsContasPagar.Close;
     //
     dm.cdsBancos.Close;
     With dm.dstBancos do
     Begin
          Active := False;
          CommandText := 'Select * from BANCOS order by BAN_CODIGO';
          Active := True;
     End;
     dm.cdsBancos.Open;
     //
           
     //
     pnlDados.Enabled   := False;
     lbl_NMFORN.Clear;
     lbl_Natureza.Caption := '';
     //
     If (BtAdicionar.Visible) Then
         BtAdicionar.SetFocus
     Else
         BtSair.SetFocus;
     //
     Dm.CampoConta(cmbConta);
     //
     If (dm2.cdsParcelas.Active) Then
        dm2.cdsParcelas.EmptyDataSet;
     //
     lblConta2.Visible := False;
     cmbConta.Visible := False;
end;

procedure TfrmCadContasPagar.edtCDFORNKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     If (key = #13) and not uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
          Key := #0;
          edtDTCOMP.SetFocus;
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
          Key := #0;
          spLocFornecedorClick(Sender);
     End;
end;

procedure TfrmCadContasPagar.edtCDNATUKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     //    
     If (key = #13) and uFuncoes.Empty(edtCDNATU.Text) Then
     Begin
          Key := #0;
          spNaturezaClick(Sender);
     End;
     //
     If (key = #13) and not uFuncoes.Empty(edtCDNATU.Text) Then
     Begin
          Key := #0;
          edtQTPARC.SetFocus;
     End;
end;

procedure TfrmCadContasPagar.spLocFornecedorClick(Sender: TObject);
begin
  with TfrmBuscaFornec.create(self) do
  try
     uFrmLocFornec.M_NRFROM := 4;
     showmodal;
  finally
    edtCDFORN.Text := uFuncoes.StrZero(M_CDFORN,5);
    If not uFuncoes.Empty(edtCDFORN.Text) Then
       edtDTCOMP.SetFocus
    Else
       edtCDFORN.SetFocus;
    free;
  end;
end;

procedure TfrmCadContasPagar.edtCDFORNExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
          With dmConsultas.qryFornec do
          Begin
               Close;
               Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDFORN.Text);
               Open;
          End;
          //
          If (dmConsultas.qryFornec.IsEmpty) Then
          Begin
              Application.MessageBox(PChar('Fornecedor não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_NMFORN.Clear;
              edtCDFORN.Clear;
              edtCDFORN.SetFocus;
              Exit;
          End
          Else
          Begin
             If not uFuncoes.Empty(edtCDFORN.text)
               and not uFuncoes.Empty(dbeNRNOTA.Text)
               And not uFuncoes.Empty(dbeSERIE.Text) Then
             Begin
               If (VALIDAR_NOTA(edtCDFORN.text, dbeNRNOTA.Text,
                   dbeSERIE.Text) = False) Then
               Begin
                   edtDTCOMP.SetFocus;
               End
               Else
               begin
                   edtCDFORN.SetFocus;
                   Exit;
               End;    
             End;
             //
             lbl_NMFORN.Text := dmConsultas.qryFornec.FieldByName('FOR_FANTASIA').AsString;
             edtCDFORN.Text := uFuncoes.StrZero(edtCDFORN.Text,5);
          End;
          //
     End;
end;

procedure TfrmCadContasPagar.mmoDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #27) Then
     BEgin
         Key := #0;
         BtCancelarClick(Sender);
     End;
     //
end;

procedure TfrmCadContasPagar.edtCDNATUExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDNATU.Text) Then
     Begin
          With dmConsultas.qryNatureza do
          Begin
               Close;
               Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDNATU.Text);
               Open;
          End;
          //
          If (dmConsultas.qryNatureza.IsEmpty) Then
          Begin
              Application.MessageBox(PChar('Natureza não cadastrada!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_Natureza.Caption := '';
              edtCDNATU.Clear;
              edtCDNATU.SetFocus;
              Exit;
          End
          Else
          Begin
             If (dmConsultas.qryNatureza.FieldByName('NAT_TIPO').AsString = '2') Then
             Begin
                  Application.MessageBox(PChar('Tipo de Natureza não é de despesa!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                  lbl_Natureza.Caption := '';
                  edtCDNATU.Clear;
                  edtCDNATU.SetFocus;
                  Exit;
             End
             Else
             begin
                 lbl_Natureza.Caption := dmConsultas.qryNatureza.FieldByName('NAT_NOME').AsString;
                 edtCDNATU.Text := uFuncoes.StrZero(edtCDNATU.Text,4);
             End;
          End;
     End;
end;

procedure TfrmCadContasPagar.edtDTCOMPExit(Sender: TObject);
begin
     If (edtDTCOMP.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTCOMP.Text);
              //
              If (StrToDate(edtDTCOMP.Text)>Date()) Then
              Begin
                   Application.MessageBox(PChar('Data da compra deve ser menor ou '+#13' igual a atual!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTCOMP.Text := DatetoStr(Date());
                   edtDTCOMP.SetFocus;
                   Exit;
              End;
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTCOMP.Clear;
                     edtDTCOMP.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmCadContasPagar.dbeSERIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     {If not( key in['0'..'9',#8, #13] ) then
         key:=#0;}
     //
     If (key = #13) Then
     Begin
          Key := #0;
          mmoDescricao.SetFocus;
     End;
end;

procedure TfrmCadContasPagar.dbeNRNOTAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     If (key = #13) Then
     Begin
          Key := #0;
          dbeSERIE.SetFocus;
     End;
end;

procedure TfrmCadContasPagar.dbeNRNOTAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeNRNOTA.Text) Then
     begin
         dbeNRNOTA.Text := uFuncoes.StrZero(dbeNRNOTA.Text,10);
         //
         If not uFuncoes.Empty(edtCDFORN.text)
            and not uFuncoes.Empty(dbeNRNOTA.Text)
            And not uFuncoes.Empty(dbeSERIE.Text) Then
         Begin
             If (VALIDAR_NOTA(edtCDFORN.text, dbeNRNOTA.Text,
                 dbeSERIE.Text) = False) Then
                 dbeSERIE.SetFocus
             Else
                 dbeNRNOTA.SetFocus;
         End;
     End;
end;

procedure TfrmCadContasPagar.dbeSERIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeSERIE.Text) Then
     begin
         dbeSERIE.Text := uFuncoes.StrZero(dbeSERIE.Text,2);
         //
         If not uFuncoes.Empty(edtCDFORN.text)
            and not uFuncoes.Empty(dbeNRNOTA.Text)
            And not uFuncoes.Empty(dbeSERIE.Text) Then
         Begin
             If (VALIDAR_NOTA(edtCDFORN.text, dbeNRNOTA.Text,
                 dbeSERIE.Text) = False) Then
                 mmoDescricao.SetFocus
             Else
                 dbeSERIE.SetFocus;
         End;
     End;
end;

function TfrmCadContasPagar.VALIDAR_NOTA(W_CDFORN, W_NRNOTA,
  W_NRSERI: String): Boolean;
begin
     If not uFuncoes.Empty(W_CDFORN)
       and not uFuncoes.Empty(W_NRNOTA)
       and not uFuncoes.Empty(W_NRSERI) Then
     Begin
           With dmConsultas.qryContasPagar do
           Begin
                Close;
                //
                Params.ParamByName('pCODIGO').AsInteger   := StrtoInt(W_CDFORN);
                Params.ParamByName('pNRNOTA').AsString    := uFuncoes.StrZero(W_NRNOTA,10);
                Params.ParamByName('pSERIENOTA').AsString := uFuncoes.StrZero(W_NRSERI,2);
                //
                Open;
           End;
           //
           If not (dmConsultas.qryContasPagar.IsEmpty) Then
           Begin
              Application.MessageBox(PChar('Registro de nota já cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              result := True;
              Exit;
           End;
     End
     Else
         result := False;
end;

procedure TfrmCadContasPagar.cmbNMLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Key := #0;
          edtCDFORN.SetFocus;
     End;
end;

procedure TfrmCadContasPagar.edtDTCOMPKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (cmbNMLOJA.Text <> '  /  /    ') Then
     Begin
          Key := #0;
          dbeNRNOTA.SetFocus;
     End;
end;

procedure TfrmCadContasPagar.spNaturezaClick(Sender: TObject);
begin
  with TfrmBuscaNatureza.create(self) do
  try
     uBuscarNatureza.M_NRFROM := 1;
     showmodal;
  finally
    If not uFuncoes.Empty(M_CDNATU) Then
    Begin
         edtCDNATU.Text := uFuncoes.StrZero(M_CDNATU,4);
         edtQTPARC.SetFocus;
    End
    Else
       edtCDNATU.SetFocus;
    free;
  end;
end;

procedure TfrmCadContasPagar.edtCDFORNChange(Sender: TObject);
begin
    If uFuncoes.Empty(edtCDFORN.Text) Then
        lbl_NMFORN.Clear;
end;

procedure TfrmCadContasPagar.edtCDNATUChange(Sender: TObject);
begin
    If uFuncoes.Empty(edtCDNATU.Text) Then
        lbl_Natureza.Caption := '';
end;

procedure TfrmCadContasPagar.LIMPAR_CAMPOS;
begin
    dbeNRNOTA.Clear;
    dbeSERIE.Clear;
    edtCDNATU.Clear;;
    edtQTPARC.Clear;
    cmbNMLOJA.Clear;
    edtCDFORN.Clear;
    edtDTCOMP.Clear;
    mmoDescricao.Lines.Clear;
    cmbNaturezas.Items.Clear;
    lbl_NRPRES.Caption  := '0000000';
    lbl_VLTOTAL.Caption := '0,00';
    lbl_NMFORN.Clear;
    lbl_Natureza.Caption  := '';
    cbxAvista.Checked   := False;
    //
    If (dm2.cdsParcelas.Active = True) Then
       dm2.cdsParcelas.EmptyDataSet;
    dm2.cdsParcelas.Close;
end;

procedure TfrmCadContasPagar.CRIAR_PARCELAS;
Var
    M_QTPARC : integer;
begin
     If (dm2.cdsParcelas.Active = False) Then
         dm2.cdsParcelas.Open;
     //
     dm2.cdsParcelas.EmptyDataSet;
     //
     dm2.cdsParcelas.DisableControls;
     For M_QTPARC := 1 to StrtoInt(edtQTPARC.Text) do
     Begin
          // Incluir
          dm2.cdsParcelas.Append;
          dm2.cdsParcelas.FieldByName('PAR_NRPARCELA').AsInteger := M_QTPARC;
          dm2.cdsParcelas.Post;
     End;
     //
     dm2.cdsParcelas.First;
     dm2.cdsParcelas.EnableControls;
end;

procedure TfrmCadContasPagar.edtQTPARCExit(Sender: TObject);
begin
     If (edtQTPARC.Value >= 1) Then
     begin
          CRIAR_PARCELAS;
          //
          dbgridParcelas.SetFocus;
     End;
     If (edtQTPARC.Value < 1) Then
        dm2.cdsParcelas.Close;    
end;

procedure TfrmCadContasPagar.dbgridParcelasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
     //
     If (DM2.cdsParcelas.Active = True) Then
     Begin
         IF (KEY = 38) or (key = 40) then // avalio se é seta para cima ou para baixo;
         Begin
             VALOR_CONTA;
             //
             If (dm2.cdsParcelas.Eof) Then
                dm2.cdsParcelas.First;
         End;
     End;
     //
     case key of
        13 : Key := 9;
     end;
end;

procedure TfrmCadContasPagar.ALTUALIZAR_PARCELAS;
Var
   W_DTVENC : tdate;
   W_VLPARC : REAL;
   W_NRBANC, W_NRAGEN, W_NRCONT : String;
   W_NRCHEQ, W_PCATUA, N_RGATUA : Integer;
begin
     M_VLCONT := 0;
     N_RGATUA := dm2.cdsParcelas.FieldByName('PAR_NRPARCELA').AsInteger;
     //
     If uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsString)
         or  uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString)
         or (dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency = 0) Then
     begin
          dm2.cdsParcelas.Locate('PAR_NRPARCELA', N_RGATUA,[]);
          dbgridParcelas.SetFocus;
          Exit;
     End;
     //
     dm2.cdsParcelas.DisableControls;
     //
     //dm2.cdsParcelas.First;
     //
     W_DTVENC := dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsDateTime;
     W_VLPARC := dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
     W_NRBANC := dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString;
     W_NRAGEN := dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString;
     W_NRCONT := dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString;
     If not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString) Then
         W_NRCHEQ := dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsInteger;
     W_PCATUA := 0;
     //
     M_VLCONT := W_VLPARC * edtQTPARC.Value;
     //
     While not (dm2.cdsParcelas.Eof) do
     begin
         dm2.cdsParcelas.Edit;
         //
         dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsDateTime := IncMonth(W_DTVENC,W_PCATUA);
         dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency      := W_VLPARC;
         If not uFuncoes.Empty(W_NRBANC) Then
             dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString        := uFuncoes.StrZero(W_NRBANC,3);
         If not uFuncoes.Empty(W_NRAGEN) Then
             dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString      := uFuncoes.StrZero(W_NRAGEN,5);
         If not uFuncoes.Empty(W_NRCONT) Then
             dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString        := uFuncoes.StrZero(W_NRCONT,10);
         If (W_NRCHEQ > 0) Then
             dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString       := uFuncoes.StrZero(InttoStr(W_NRCHEQ+W_PCATUA),10);
         //
         W_PCATUA := W_PCATUA + 1;
         dm2.cdsParcelas.Next;
     End;
     //
     dm2.cdsParcelas.Locate('PAR_NRPARCELA', N_RGATUA,[]);
     //dm2.cdsParcelas.First;
     dm2.cdsParcelas.EnableControls;
     dbgridParcelas.SelectedIndex := 1;
     //
     lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0',M_VLCONT);
end;

procedure TfrmCadContasPagar.dbgridParcelasKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (Key = #13) and
         (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByname('PAR_CHEQUE'))
         and (dm2.cdsParcelas.FieldByName('PAR_NRPARCELA').AsInteger = 1)
         and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsString)
         and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString) then
      Begin
            Key := #0;
            //
            //ALTUALIZAR_PARCELAS;
      End;
      //
      {if (Key = #13) and
         (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByname('PAR_CHEQUE'))
         and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsString)
         and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString) then
             VALOR_CONTA;}
end;

procedure TfrmCadContasPagar.dbgridParcelasCellClick(Column: TColumn);
begin
   { If (dm2.cdsParcelas.FieldByName('PAR_NRPARCELA').AsInteger = 1) Then
        dbgridParcelas.Options := dbgridParcelas.Options + [dgEditing]
    else
        dbgridParcelas.Options := dbgridParcelas.Options - [dgEditing];}
end;

procedure TfrmCadContasPagar.dbgridParcelasColExit(Sender: TObject);
Var
   N_VLCONT : Real;
begin
    If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsString) Then
    Begin
      If (dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime < Strtodate(edtDTCOMP.Text)) Then
      Begin
           Application.MessageBox(PChar('Data de vencimento deve ser '+#13'maior ou igual a da compra!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime := Strtodate(edtDTCOMP.Text);
           dbgridParcelas.SelectedIndex := 1;
           Exit;
      End;
   End;
   //
{   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_CDBANCO'))
     and uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString) then
       dbgridParcelas.SelectedIndex := 2;
   //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_VALOR')) Then
     //and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString) then
         VALOR_CONTA;
   //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_CONTA'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString) Then
   Begin
        dm2.cdsParcelas.Edit;
        dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString :=
            uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString,10);
   End;}
   //
   If (dbgridParcelas.SelectedField <> dm2.cdsParcelas.FieldByName('PAR_CHEQUE'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString) Then
   Begin
        dm2.cdsParcelas.Edit;
        dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString :=
            uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString,10);
   End;
   //
   {If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_VALOR')) Then
   begin
       N_VLCONT := W_VLCONT;
       W_VLCONT := 0;
       W_VLCONT := dm2.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency;
       Label11.Caption := FormatFloat('###,###,##0.#0', W_VLCONT);
       //lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0', W_VLCONT);
   End;}
   //
end;

procedure TfrmCadContasPagar.edtQTPARCKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtQTPARC.Value >= 1) Then
     Begin
          Key := #0;
          dbgridParcelas.SelectedIndex := 1;
     End;
end;

procedure TfrmCadContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.cdsBancos.Close;
     cdsContasPagar.Close;  
     //
     Action := caFree;
end;

procedure TfrmCadContasPagar.dbgridParcelasEnter(Sender: TObject);
begin
     If uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsString) Then
     begin
         dbgridParcelas.SelectedIndex := 1;
         Exit;
     End;
     //
     If uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString) Then
     Begin
         dbgridParcelas.SelectedIndex := 2;
         Exit;
     End;
     //
     If uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString) Then
     Begin
         dbgridParcelas.SelectedIndex := 4;
         Exit;
     End;
     //
     If uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString) Then
     Begin
         dbgridParcelas.SelectedIndex := 5;
         Exit;
     End;
     //
     If uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString) Then
     Begin
         dbgridParcelas.SelectedIndex := 6;
         Exit;
     End;
     //
     //If (dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency = 0) Then   
end;

procedure TfrmCadContasPagar.edtQTPARCEnter(Sender: TObject);
begin
     If (dm2.cdsParcelas.Active = True) Then
          dm2.cdsParcelas.EmptyDataSet;
     //
     dm2.cdsParcelas.Close;
end;

procedure TfrmCadContasPagar.dbgridParcelasColEnter(Sender: TObject);
begin
    If (dm2.cdsParcelasPAR_NRPARCELA.AsInteger > 0) Then
      dbgridParcelas.Options := dbgridParcelas.Options + [dgEditing]
    else
    begin
        dbgridParcelas.Options := dbgridParcelas.Options - [dgEditing];
        BtGravar.SetFocus;
    End;
    //
     If (uFuncoes.Empty(dm2.cdsParcelasPAR_NRPARCELA.AsString)) Then
     begin
           dm2.cdsParcelas.Delete;
           dm2.cdsParcelas.First;
     End;
    //
    If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_NRPARCELA')) Then
        dbgridParcelas.SelectedIndex := 1;
    //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_AGENCIA'))
     and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString) then
   begin
        dm2.cdsParcelas.Edit;
        dm2.cdsParcelas.FieldByName('PAR_BANCO').AsString :=
            uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_BANCO').AsString,3);
        //
        If (uFuncoes.LOCALIZAR_BANCO(dm2.cdsParcelas.FieldByName('PAR_BANCO').AsString) = False) Then
        begin
             Application.MessageBox('Código de banco não cadastrado!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dm2.cdsParcelas.FieldByName('PAR_BANCO').Clear;
             dbgridParcelas.SelectedIndex := 3;
             Exit;
        End;
   End;
   //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_BANCO'))
     and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString) then
         VALOR_CONTA;
   //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_VALOR'))
     and not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_VALOR').AsString) then
         VALOR_CONTA;
   //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_CHEQUE'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString) Then
   Begin
        dm2.cdsParcelas.Edit;
        dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString :=
            uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_CONTA').AsString,10);
   End;
   //
   If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString) Then
   Begin
        dm2.cdsParcelas.Edit;
        dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString :=
            uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString,10);
   End;
   //
end;

procedure TfrmCadContasPagar.VALOR_CONTA;
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
         M_VLCONT := M_VLCONT + dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
         dm2.cdsParcelas.Next;
     End;
     //
     dm2.cdsParcelas.Locate('PAR_NRPARCELA',W_NRPARC,[]);
     dm2.cdsParcelas.EnableControls;
     //
     lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0', M_VLCONT);
  End;
end;

procedure TfrmCadContasPagar.mmoDescricaoExit(Sender: TObject);
begin
     If uFuncoes.Empty(mmoDescricao.Lines.Text) Then
       mmoDescricao.SetFocus;
end;

procedure TfrmCadContasPagar.btClonarClick(Sender: TObject);
begin
     If (dm2.cdsParcelas.Active = True) Then
     begin
         ALTUALIZAR_PARCELAS;
         VALOR_CONTA;
     End;
end;


procedure TfrmCadContasPagar.dspContasPagarGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
      TableName := 'CONTASPAGAR';
end;

procedure TfrmCadContasPagar.FormCreate(Sender: TObject);
begin
   If not (UFrmAdmin.admin) Then
   begin
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Inclusão'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     BtAdicionar.Visible := (novo = 'S');
     {BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');}
     //
   End;
end;

procedure TfrmCadContasPagar.cbxAvistaClick(Sender: TObject);
begin
     if (cbxAvista.Checked) Then
     begin
       cmbConta.Visible := True;
       lblConta2.Visible := True;
     End
     Else
     begin
       cmbConta.Visible := False;
       lblConta2.Visible := False;
     End;
end;

procedure TfrmCadContasPagar.pmnFornecedoresItemClick(Sender: TObject);
begin
    FrmAdmin.AbreForm(TfrmFornecedor, frmFornecedor);
end;

procedure TfrmCadContasPagar.pmnBancosItemClick(Sender: TObject);
begin
    FrmAdmin.AbreForm(TfrmCadBancos, frmCadBancos);
end;

procedure TfrmCadContasPagar.pmnNaturezasItemClick(Sender: TObject);
begin
     FrmAdmin.AbreForm(TfrmCadNatureza, frmCadNatureza);
     //
     dmConsultas.CarregarNaturezas(cmbNaturezas, '1');
end;

end.
