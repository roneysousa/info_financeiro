unit uFrmCadContReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Mask, Buttons, ExtCtrls, Grids, DBGrids,
  ToolEdit, CurrEdit, FMTBcd, DB, DBClient, Provider, SqlExpr, DBXpress,
  Menus;

type
  TfrmCadContaReceber = class(TForm)
    pnlDados: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    lbl_NRCRED: TLabel;
    lbl_VLTOTAL: TLabel;
    spLocCliente: TSpeedButton;
    cmbNMLOJA: TComboBox;
    edtCDCLIE: TEdit;
    edtDTMOVI: TMaskEdit;
    mmoDescricao: TMemo;
    pnlGrid: TPanel;
    dbgridParcelas: TDBGrid;
    Panel2: TPanel;
    BtAdicionar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    btClonar: TBitBtn;
    edtQTPARC: TCurrencyEdit;
    dstContasReceber: TSQLDataSet;
    dstContasReceberREC_LOJA: TIntegerField;
    dstContasReceberREC_CREDITO: TIntegerField;
    dstContasReceberREC_PARCELA: TIntegerField;
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
    dstContasReceberREC_USUARIO: TIntegerField;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    cdsContasReceberREC_LOJA: TIntegerField;
    cdsContasReceberREC_CREDITO: TIntegerField;
    cdsContasReceberREC_PARCELA: TIntegerField;
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
    cdsContasReceberREC_USUARIO: TIntegerField;
    cdsContasReceberREC_NMSITUACAO: TStringField;
    cdsContasReceberREC_ATRASO: TFloatField;
    dstContasReceberREC_SEQUENCIA: TIntegerField;
    cdsContasReceberREC_SEQUENCIA: TIntegerField;
    Label5: TLabel;
    edtCDNATU: TEdit;
    spNatureza: TSpeedButton;
    dstContasReceberREC_NATUREZA: TIntegerField;
    cdsContasReceberREC_NATUREZA: TIntegerField;
    lbl_NMCLIE: TEdit;
    lbl_Natureza: TEdit;
    dstContasReceberREC_NOSSO_NUMERO: TStringField;
    dstContasReceberREC_SEUNUMERO: TStringField;
    dstContasReceberREC_CDCEDENTE: TIntegerField;
    dstContasReceberREC_NRFATURA: TStringField;
    cdsContasReceberREC_NOSSO_NUMERO: TStringField;
    cdsContasReceberREC_SEUNUMERO: TStringField;
    cdsContasReceberREC_CDCEDENTE: TIntegerField;
    cdsContasReceberREC_NRFATURA: TStringField;
    cmbNaturezas: TComboBox;
    PopupMenu1: TPopupMenu;
    pmnClientesItem: TMenuItem;
    pmnBancosItem: TMenuItem;
    pmnNaturezasItem: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsContasReceberCalcFields(DataSet: TDataSet);
    procedure BtSairClick(Sender: TObject);
    procedure dspContasReceberGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure btClonarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtQTPARCEnter(Sender: TObject);
    procedure edtQTPARCExit(Sender: TObject);
    procedure edtQTPARCKeyPress(Sender: TObject; var Key: Char);
    procedure dbgridParcelasColEnter(Sender: TObject);
    procedure dbgridParcelasColExit(Sender: TObject);
    procedure dbgridParcelasEnter(Sender: TObject);
    procedure dbgridParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgridParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure spLocClienteClick(Sender: TObject);
    procedure cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTMOVIKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTMOVIExit(Sender: TObject);
    procedure spNaturezaClick(Sender: TObject);
    procedure edtCDNATUExit(Sender: TObject);
    procedure edtCDNATUKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDNATUChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pmnClientesItemClick(Sender: TObject);
    procedure pmnBancosItemClick(Sender: TObject);
    procedure pmnNaturezasItemClick(Sender: TObject);
  private
    novo, alterar, apagar : String;
    procedure tratabotoes;
    procedure LOJAS;
    Procedure LIMPAR_CAMPOS;
    Procedure CRIAR_PARCELAS;
    procedure VALOR_CONTA;
    procedure ALTUALIZAR_PARCELAS;        
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContaReceber: TfrmCadContaReceber;
  M_CDCLIE : String;
  M_VLCONT : REAL;
  TD : TTransactionDesc;
  W_NRPARC : integer;

implementation

uses udmConsulta, Udm, UFrmAdmin, uFuncoes, uDm2, uFrmBuscaClientes, uBuscarNatureza,
  uDmRelatorios, uFrmCadClientes, uFrmCadBancos, uFrmCadNatureza;

{$R *.dfm}

{ TfrmCadContaReceber }

procedure TfrmCadContaReceber.LOJAS;
begin
  with dmRelatorios.cdsLojas do
  begin
        Active := False;
        CommandText := 'Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS order by EMP_FANTASIA';
        Active := True;
        First;
        //
        cmbNMLOJA.Clear;
        While not (Eof) do
        Begin
            cmbNMLOJA.Items.Add(FieldByName('EMP_FANTASIA').AsString);
            //
            Next;
        End;
        //
        Active := False;
   End;     
     {With dmConsultas.qryLoja do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS');
          SQL.Add('order by EMP_FANTASIA');
          Open;
          First;
     End;}
     //
end;

procedure TfrmCadContaReceber.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtCancelar.Enabled  := not BtCancelar.Enabled;
   BtGravar.Enabled    := not BtGravar.Enabled;
   BtSair.Enabled      := not BtSair.Enabled;
   btClonar.Enabled    := not btClonar.Enabled;
end;

procedure TfrmCadContaReceber.FormShow(Sender: TObject);
begin
     cdsContasReceber.Close;
     lbl_Natureza.Clear;
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
     pnlDados.Enabled   := False;
     lbl_NMCLIE.Clear;
     //
     If (BtAdicionar.Visible) Then
         BtAdicionar.SetFocus
     Else
         BtSair.SetFocus; 
end;

procedure TfrmCadContaReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     cdsContasReceber.Close;
     //
     Action := caFree;
end;

procedure TfrmCadContaReceber.cdsContasReceberCalcFields(
  DataSet: TDataSet);
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

procedure TfrmCadContaReceber.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadContaReceber.dspContasReceberGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONTASRECEBER';
end;

procedure TfrmCadContaReceber.BtAdicionarClick(Sender: TObject);
begin
     tratabotoes;
     LIMPAR_CAMPOS;
     pnlDados.Enabled := True;
     pnlGrid.Enabled  := True;
     LOJAS;
     //
     cmbNMLOJA.SetFocus;
     lbl_NRCRED.Caption :=  uFuncoes.StrZero(InttoStr(dm.CdsConfigCFG_CREDITO.AsInteger+1),7);
     edtDTMOVI.Text := DatetoStr(Date());
     //
     dmConsultas.CarregarNaturezas(cmbNaturezas, '2');
end;

procedure TfrmCadContaReceber.LIMPAR_CAMPOS;
begin
    edtQTPARC.Clear;
    cmbNMLOJA.Clear;
    edtCDCLIE.Clear;
    edtDTMOVI.Clear;
    mmoDescricao.Lines.Clear;
    lbl_NRCRED.Caption  := '0000000';
    lbl_VLTOTAL.Caption := '0,00';
    lbl_NMCLIE.Clear;
    cmbNaturezas.Items.Clear;
    //
    If (dm2.cdsParcelas.Active = True) Then
       dm2.cdsParcelas.EmptyDataSet;
    dm2.cdsParcelas.Close;
end;

procedure TfrmCadContaReceber.BtCancelarClick(Sender: TObject);
begin
     tratabotoes;
     LIMPAR_CAMPOS;
     pnlDados.Enabled := False;
     pnlGrid.Enabled  := False;
     //
     BtAdicionar.SetFocus;
end;

procedure TfrmCadContaReceber.btClonarClick(Sender: TObject);
begin
     If (dm2.cdsParcelas.Active = True) Then
     begin
         ALTUALIZAR_PARCELAS;
         VALOR_CONTA;
     End;
end;

procedure TfrmCadContaReceber.BtGravarClick(Sender: TObject);
Var
    M_SEQREC, M_NRCRED, W_QTPARC, M_CDLOJA, V_NRPARC, iSeuNumero : Integer;
    aMesRefe, aNossoNumero, aDtVencimento, aFatura : String;
    iUsuario, iNatureza : Integer;
begin
     If (dm2.cdsParcelas.Active = False) Then
     begin
          Application.MessageBox('Quantidade de parcela vazia!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtQTPARC.SetFocus;
          Exit;
     End;
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
          Application.MessageBox('Selecione o condomino!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNMLOJA.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Application.MessageBox('Digite o código da Loja!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtCDCLIE.SetFocus;
          Exit;
     End;
     //
     If (edtDTMOVI.Text = '  /  /    ') Then
     Begin
          Application.MessageBox('Digite a data de emissão!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTMOVI.SetFocus;
          Exit;
     End;
     //
     If (mmoDescricao.Lines.Text = ' ') or
        (mmoDescricao.Lines.Count = 0) Then
     Begin
          Application.MessageBox('Digite a descrição da conta!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          mmoDescricao.SetFocus;
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
     If Empty(cmbNaturezas.Text) Then  // edtCDNATU
      begin
          Application.MessageBox('Selecione a natureza!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNaturezas.SetFocus;
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
     iNatureza := dmConsultas.GetNaturezaCogigo(cmbNaturezas.Text);
     //
     iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
     // Inicia um transação no BD
     TD.TransactionID  := StrtoInt(uFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);
     //
     try
        dm.parametros;
        dm.CdsConfig.Edit;
        dm.CdsConfigCFG_CREDITO.Value       := dm.CdsConfigCFG_CREDITO.Value+1;
        dm.CdsConfigCFG_NRFATURA.AsInteger  := dm.CdsConfigCFG_NRFATURA.AsInteger + 1;
        M_NRCRED := dm.CdsConfigCFG_CREDITO.AsInteger;
        aFatura  := uFuncoes.StrZero(dm.CdsConfigCFG_NRFATURA.AsString,10);
        dm.CdsConfig.Post;
        dm.CdsConfig.ApplyUpdates(0);
        //
        M_CDLOJA := uFuncoes.CDLOJA(cmbNMLOJA.Text);
        // Gerando contas a receber
        With cdsContasReceber do
        Begin
             Active := False;
             With dstContasReceber do
             begin
                  Active := False;
                  CommandText := 'Select * from CONTASRECEBER Where (REC_CREDITO = :pCREDITO)'+
                                 ' and (REC_LOJA = :pLOJA) ';
                  Params.ParamByName('pCREDITO').AsInteger := M_NRCRED;
                  Params.ParamByName('pLOJA').AsInteger    := M_CDLOJA;
                  Active := True;
             End;
             //
             cdsContasReceber.FetchParams;
             Active := True;
             //
             If (IsEmpty) Then
             Begin
                dm2.cdsParcelas.DisableControls;
                dm2.cdsParcelas.First;
                //
                While not (dm2.cdsParcelas.Eof) DO
                Begin
                  //
                  dm.CdsConfig.Edit;
                  dm.CdsConfigCFG_SEQRECEBER.Value    := dm.CdsConfigCFG_SEQRECEBER.Value+1;
                  M_SEQREC := dm.CdsConfigCFG_SEQRECEBER.AsInteger;
                  dm.CdsConfig.ApplyUpdates(0);
                  //
                  aDtVencimento := dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsString;
                  aMesRefe      := Copy(aDtVencimento, 4,2) + Copy(aDtVencimento, 7,4);
                  iSeuNumero    := Dm.GetCodigoMesReferencia(aMesRefe);
                  //
                  Append;
                  FieldByName('REC_SEQUENCIA').AsInteger := M_SEQREC;
                  FieldByName('REC_CREDITO').AsInteger   := M_NRCRED;
                  FieldByName('REC_LOJA').AsInteger      := M_CDLOJA;
                  FieldByName('REC_PARCELA').AsInteger   := dm2.cdsParcelas.FieldByname('PAR_NRPARCELA').AsInteger;
                  FieldByName('REC_QTPARCELAS').AsInteger   := StrtoInt(edtQTPARC.Text);
                  FieldByName('REC_CLIENTE').AsInteger      := StrtoInt(edtCDCLIE.Text);
                  FieldByName('REC_DATAEMISSAO').AsDateTime := StrtoDate(edtDTMOVI.Text);
                  FieldByName('REC_DATAVENCIMENTO').AsDateTime  := dm2.cdsParcelas.FieldByname('PAR_VENCIMENTO').AsDateTime;
                  FieldByName('REC_VALORPARCELA').AsCurrency    := dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
                  FieldByName('REC_DESCRICAO').AsString         := mmoDescricao.Text;
                  FieldByName('REC_SITUACAO').AsString          := 'A';
                  FieldByName('REC_VALORJUROS').AsCurrency      := 0;
                  FieldByName('REC_VALORDESCONTO').AsCurrency   := 0;
                  If not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString) Then
                     FieldByName('REC_BANCO').AsString             := uFuncoes.StrZero(dm2.cdsParcelas.FieldByname('PAR_BANCO').AsString,3);
                  If not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString) Then
                     FieldByName('REC_NRCONTA').AsString           := uFuncoes.StrZero(dm2.cdsParcelas.FieldByname('PAR_CONTA').AsString,10);
                  If not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString) Then
                      FieldByName('REC_NRCHEQUE').AsString          := uFuncoes.StrZero(dm2.cdsParcelas.FieldByname('PAR_CHEQUE').AsString,10);
                  If not uFuncoes.Empty(dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString) Then
                      FieldByName('REC_AGENCIA').AsString           := dm2.cdsParcelas.FieldByname('PAR_AGENCIA').AsString;
                  FieldByName('REC_USUARIO').AsInteger          := StrtoInt(uFrmAdmin.M_CDUSUA);
                  FieldByName('REC_NATUREZA').AsInteger         := iNatureza; //StrtoInt(edtCDNATU.Text);
                  FieldByName('REC_SEUNUMERO').AsString         := aMesRefe+InttoStr(iSeuNumero);
                  FieldByName('REC_NOSSO_NUMERO').AsString      := Dm.GetProximoNumero(M_CDLOJA);
                  FieldByName('REC_NRFATURA').AsString          := aFatura;
                  Post;
                  ApplyUpdates(0);
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
                     'ATENÇÃO',MB_ICONINFORMATION+ MB_OK + MB_APPLMODAL);
        //
        Dm.Start;
        Try
           If not (dm.IncluirTarefaUsuario( iUsuario,
               'Inc.Conta Receber > Nº.Credito : '+uFuncoes.StrZero(InttoStr(M_NRCRED),7)+
               ' Cliente: ' +  uFuncoes.StrZero(edtCDCLIE.Text,7)+
               ' Valor:'+FormatFloat('###,##0.#0',M_VLCONT) +' *F*')) Then
                  ShowMessage('Erro ao adicionar tarefa do usuário.');
            dm.Comit(Dm.Transc);

        Except
             dm.Rollback;
        End;
        //
        tratabotoes;
        LIMPAR_CAMPOS;
        pnlDados.Enabled := False;
        //
        edtCDNATU.Clear;
        lbl_Natureza.Clear;
        edtQTPARC.Value := 1;
        //
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
     //
     pnlGrid.Enabled  := False;
end;

procedure TfrmCadContaReceber.edtQTPARCEnter(Sender: TObject);
begin
     If (dm2.cdsParcelas.Active = True) Then
          dm2.cdsParcelas.EmptyDataSet;
     //
     dm2.cdsParcelas.Close;
end;

procedure TfrmCadContaReceber.edtQTPARCExit(Sender: TObject);
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

procedure TfrmCadContaReceber.edtQTPARCKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtQTPARC.Value >= 1) Then
     Begin
          Key := #0;
          dbgridParcelas.SetFocus;
          //dbgridParcelas.SelectedIndex := 1;
     End;
end;

procedure TfrmCadContaReceber.CRIAR_PARCELAS;
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

procedure TfrmCadContaReceber.dbgridParcelasColEnter(Sender: TObject);
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

procedure TfrmCadContaReceber.dbgridParcelasColExit(Sender: TObject);
Var
   N_VLCONT : Real;
begin
    If (dbgridParcelas.SelectedField = dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsString) Then
    Begin
      If (dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime < Strtodate(edtDTMOVI.Text)) Then
      Begin
           Application.MessageBox(PChar('Data de vencimento deve ser '+#13'maior ou igual a do movimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime := Strtodate(edtDTMOVI.Text);
           dbgridParcelas.SelectedIndex := 1;
           Exit;
      End;
   End;
   //
   If (dbgridParcelas.SelectedField <> dm2.cdsParcelas.FieldByName('PAR_CHEQUE'))
      and not uFuncoes.Empty(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString) Then
   Begin
        dm2.cdsParcelas.Edit;
        dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString :=
            uFuncoes.StrZero(dm2.cdsParcelas.FieldByName('PAR_CHEQUE').AsString,10);
   End;
end;

procedure TfrmCadContaReceber.VALOR_CONTA;
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

procedure TfrmCadContaReceber.dbgridParcelasEnter(Sender: TObject);
begin
  If (BtGravar.Enabled) and (dm2.cdsParcelas.Active)  Then
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
  End;
end;

procedure TfrmCadContaReceber.dbgridParcelasKeyDown(Sender: TObject;
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

procedure TfrmCadContaReceber.dbgridParcelasKeyPress(Sender: TObject;
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
end;

procedure TfrmCadContaReceber.edtCDCLIEChange(Sender: TObject);
begin
    If uFuncoes.Empty(edtCDCLIE.Text) Then
        lbl_NMCLIE.Clear;
end;

procedure TfrmCadContaReceber.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          With dmConsultas.qryLocCliente do
          Begin
               Close;
               Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDCLIE.Text);
               Open;
          End;
          //
          If (dmConsultas.qryLocCliente.IsEmpty) Then
          Begin
              Application.MessageBox(PChar('Cliente não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_NMCLIE.Clear;
              edtCDCLIE.Clear;
              edtCDCLIE.SetFocus;
              Exit;
          End
          Else
          Begin
             If not uFuncoes.Empty(edtCDCLIE.text) Then
                 edtDTMOVI.SetFocus
             Else
             begin
                 edtCDCLIE.SetFocus;
                 Exit;
             End;
             //
             lbl_NMCLIE.Text := dmConsultas.qryLocCliente.FieldByName('CLI_FANTASIA').AsString;
             edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
          End;
          //
     End;
end;

procedure TfrmCadContaReceber.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     If (key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          edtDTMOVI.SetFocus;
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClienteClick(Sender);
     End;
end;

procedure TfrmCadContaReceber.spLocClienteClick(Sender: TObject);
begin
  edtCDCLIE.SetFocus;
  //
  with TfrmBuscaClientes.create(self) do
  try
     uFrmBuscaClientes.M_NRFROM := 1;
     showmodal;
  finally
    edtCDCLIE.Text := uFuncoes.StrZero(M_CDCLIE,7);
    If not uFuncoes.Empty(edtCDCLIE.Text) Then
       edtDTMOVI.SetFocus
    Else
       edtCDCLIE.SetFocus;
    free;
  end;
end;

procedure TfrmCadContaReceber.ALTUALIZAR_PARCELAS;
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
     //
     dm2.cdsParcelas.EnableControls;
     dbgridParcelas.SelectedIndex := 1;
     //
     lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0',M_VLCONT);
end;

procedure TfrmCadContaReceber.cmbNMLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Key := #0;
          edtCDCLIE.SetFocus;
     End;
end;

procedure TfrmCadContaReceber.edtDTMOVIKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtDTMOVI.Text <> '  /  /    ') Then
     Begin
          Key := #0;
          mmoDescricao.SetFocus;
     End;
end;

procedure TfrmCadContaReceber.edtDTMOVIExit(Sender: TObject);
begin
     If (edtDTMOVI.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTMOVI.Text);
              //
              {If (StrToDate(edtDTMOVI.Text)<Date()) Then
              Begin
                   Application.MessageBox(PChar('Data da emissão deve ser maior ou '+#13' igual a atual!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTMOVI.Clear;
                   edtDTMOVI.SetFocus;
                   Exit;
              End;}
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTMOVI.Clear;
                     edtDTMOVI.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmCadContaReceber.spNaturezaClick(Sender: TObject);
begin
  with TfrmBuscaNatureza.create(self) do
  try
     showmodal;
  finally
    If not uFuncoes.Empty(cdsBuscaNAT_CODIGO.AsString) Then
    Begin
         edtCDNATU.Text := uFuncoes.StrZero(cdsBuscaNAT_CODIGO.AsString,4);
         edtQTPARC.SetFocus;
    End
    Else
       edtCDNATU.SetFocus;
    //
    free;
  end;

end;

procedure TfrmCadContaReceber.edtCDNATUExit(Sender: TObject);
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
              lbl_Natureza.Clear;
              edtCDNATU.Clear;
              edtCDNATU.SetFocus;
              Exit;
          End
          Else
          Begin
             If (dmConsultas.qryNatureza.FieldByName('NAT_TIPO').AsString = '1') Then
             Begin
                  Application.MessageBox(PChar('Tipo de Natureza não é de crédito!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                  lbl_Natureza.Clear;
                  edtCDNATU.Clear;
                  edtCDNATU.SetFocus;
                  Exit;
             End
             Else
             begin
                 lbl_Natureza.Text := dmConsultas.qryNatureza.FieldByName('NAT_NOME').AsString;
                 edtCDNATU.Text := uFuncoes.StrZero(edtCDNATU.Text,4);
             End;
          End;
     End;
end;

procedure TfrmCadContaReceber.edtCDNATUKeyPress(Sender: TObject;
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

procedure TfrmCadContaReceber.edtCDNATUChange(Sender: TObject);
begin
    If uFuncoes.Empty(edtCDNATU.Text) Then
        lbl_Natureza.Clear;
end;

procedure TfrmCadContaReceber.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Inclusão de Titulo'));
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
     //BtEditar.Visible    := (alterar = 'S');
     //BtExcluir.Visible   := (apagar = 'S');
     //
   End;
end;

procedure TfrmCadContaReceber.pmnClientesItemClick(Sender: TObject);
begin
      FrmAdmin.AbreForm(TfrmCadClientesNew, frmCadClientesNew);
end;

procedure TfrmCadContaReceber.pmnBancosItemClick(Sender: TObject);
begin
     FrmAdmin.AbreForm(TfrmCadBancos, frmCadBancos);
end;

procedure TfrmCadContaReceber.pmnNaturezasItemClick(Sender: TObject);
begin
     FrmAdmin.AbreForm(TfrmCadNatureza, frmCadNatureza);
     //
     dmConsultas.CarregarNaturezas(cmbNaturezas, '2');
end;

end.
