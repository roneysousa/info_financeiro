unit uFrmBaixaReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBXpress, DBCtrls, Mask, DB,
  ToolEdit, RXDBCtrl;

type
  TfrmBaixaReceber = class(TForm)
    pnlDados: TPanel;
    Panel2: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    txtNRCRED: TDBText;
    DBText1: TDBText;
    Label16: TLabel;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    dbeBanco: TDBEdit;
    Label9: TLabel;
    dbeAgencia: TDBEdit;
    Label10: TLabel;
    dbeConta: TDBEdit;
    Label11: TLabel;
    dbeCheque: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    dbeVLMULTA: TDBEdit;
    Label14: TLabel;
    dbeVLJURO: TDBEdit;
    Label15: TLabel;
    dbeVLDESC: TDBEdit;
    Label17: TLabel;
    dbeVLPAGO: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    cmbModa: TDBLookupComboBox;
    Label20: TLabel;
    dbeNossoNumero: TDBEdit;
    dbeNome: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dbeDTPAGA: TDBDateEdit;
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeVLJUROExit(Sender: TObject);
    procedure dbeVLDESCExit(Sender: TObject);
    procedure dbeVLMULTAExit(Sender: TObject);
    procedure dbeDTPAGAExit(Sender: TObject);
  private
     procedure CALCULAR;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaReceber: TfrmBaixaReceber;

implementation

uses uDm2, uFuncoes, Udm, UFrmAdmin, udmConsulta, uFrmBaixaContReceber,
  udmDados;

{$R *.dfm}

procedure TfrmBaixaReceber.BtCancelarClick(Sender: TObject);
begin
     dm2.cdsContasReceber.Cancel;
     dm2.cdsContasReceber.Close;
     //
     Close;
end;

procedure TfrmBaixaReceber.BtGravarClick(Sender: TObject);
Var
    TD : TTransactionDesc;
    M_FLNVPC : String;
    M_DTEMIS, M_DTVENC, M_DTMOVI : TDate;
    M_CDCLIE, M_NRCRED, M_CDLOJA, M_QTPARC, M_SEQREC : Integer;
    M_NRPARC, M_CDBANC, M_NRAGEN, M_NRCONT, M_NRCHEQ : String;
    M_VLREST, M_VLPARC, M_VLPAGO : Real;
    M_DESCRI : String;
    W_NRSEQU, W_CDLOJA, W_NRRECE, W_NRPARC, M_NRVEND : Integer;
    W_CDCAIX, W_CDNATU, W_NRVEND : Integer;
    aDescNat, M_HOMOVI : String;
    M_CDMODA : Integer;
    M_VLANTE, M_VLMOVI, M_VLATUA, M_VLMULT, M_VLJURO, M_VLDESC : Double;
    M_CDCEDE : Integer;
    ANossoNumero, aSeuNumero : String;
    M_DTPAGA : TDateTime;
    iUsuario : Integer;
    M_VLPAGAR :  Double;
begin
     iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
     M_VLPAGAR := (dm2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsFloat +
                  dm2.cdsContasReceber.FieldByName('REC_VLMULTA').AsFloat +
                  dm2.cdsContasReceber.FieldByName('REC_VALORJUROS').AsFloat)
                  - dm2.cdsContasReceber.FieldByName('REC_VALORDESCONTO').AsFloat;
     //
     If (dm2.cdsContasReceber.FieldByName('REC_PAGO').AsCurrency = 0)
       or uFuncoes.Empty(dm2.cdsContasReceber.FieldByName('REC_PAGO').AsString) Then
     Begin
         Application.MessageBox('Digite o valor pago!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeVLPAGO.SetFocus;
         Exit;
     End;
     //
     If (dbeDTPAGA.Text = '  /  /    ') Then
     Begin
         Application.MessageBox('Digite a data do pagamento!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dm2.cdsContasReceber.FieldByName('REC_DATAPAGAMENTO').AsDateTime := Date();
         dbeDTPAGA.SetFocus;
         Exit;
     End;
     //
     If Empty(cmbModa.Text) Then
     Begin
         Application.MessageBox('Selecione a modalidade de pagamento!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         cmbModa.SetFocus;
         Exit;
     End;
     //
     If (cmbModa.Text = 'CHEQUE') Then
      begin
         If Empty(dbeBanco.Text) Then
          begin
              Application.MessageBox('Informe o código do banco.','ATENÇÃO',
                MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dbeBanco.SetFocus;
               Exit;
          End;
          //
         If Empty(dbeAgencia.Text) Then
          begin
              Application.MessageBox('Informe a agência do banco.','ATENÇÃO',
                MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dbeAgencia.SetFocus;
               Exit;
          End;
          //
         If Empty(dbeConta.Text) Then
          begin
              Application.MessageBox('Informe o número da conta.','ATENÇÃO',
                MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dbeConta.SetFocus;
               Exit;
          End;
          //
         If Empty(dbeCheque.Text) Then
          begin
              Application.MessageBox('Informe o número do cheque.','ATENÇÃO',
                MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dbeCheque.SetFocus;
               Exit;
          End;
      End;
     //
     aDescNat := 'RECEBIMENTO DE CONTA';
     Dm.Incluir_Natureza(aDescNat,'2');
     //
     M_VLPAGO := 0;
     M_VLMULT := 0;
     M_VLJURO := 0;
     M_VLDESC := 0;
     // Inicia um transação no BD
     {TD.TransactionID  := StrtoInt(uFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);}
     //Dm.Start;
     //
     try
        M_HOMOVI := Copy(TimetoStr(Time),1,5);
        M_DTMOVI := Date();
        M_NRCRED := dm2.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger;
        M_VLPARC := dm2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency;
        M_VLPAGO := dm2.cdsContasReceber.FieldByName('REC_PAGO').AsFloat;
        M_CDCLIE := dm2.cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger;
        M_VLANTE := 0;
        M_VLMOVI := 0;
        M_VLATUA := 0;
        M_CDCEDE := dm2.cdsContasReceber.FieldByName('REC_CDCEDENTE').AsInteger;
        M_VLPAGO := dm2.cdsContasReceber.FieldByName('REC_PAGO').AsFloat;
        M_VLMULT := dm2.cdsContasReceber.FieldByName('REC_VLMULTA').AsFloat;
        M_VLJURO := dm2.cdsContasReceber.FieldByName('REC_VALORJUROS').AsFloat;
        M_VLDESC := dm2.cdsContasReceber.FieldByName('REC_VALORDESCONTO').AsFloat;
        ANossoNumero := dm2.cdsContasReceber.FieldByName('REC_NOSSO_NUMERO').AsString;
        M_DTPAGA := dm2.cdsContasReceber.FieldByName('REC_DATAPAGAMENTO').AsDateTime;
        M_NRPARC := dm2.cdsContasReceber.FieldByName('REC_PARCELA').AsString;
        aSeuNumero := dm2.cdsContasReceber.FieldByName('REC_SEUNUMERO').AsString;
        //
        // dm2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency
        If (uFuncoes.Arredondar(M_VLPAGAR,2) > uFuncoes.Arredondar(dm2.cdsContasReceber.FieldByName('REC_PAGO').AsFloat,2)) Then
        begin
             M_FLNVPC := 'S';
             //
             M_NRCRED := dm2.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger;
             M_CDLOJA := dm2.cdsContasReceber.FieldByName('REC_LOJA').AsInteger;
             M_NRPARC := dm2.cdsContasReceber.FieldByName('REC_PARCELA').AsString;
             M_NRVEND := dm2.cdsContasReceber.FieldByName('REC_NRVENDA').AsInteger;
             M_CDCLIE := dm2.cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger;
             M_QTPARC := dm2.cdsContasReceber.FieldByName('REC_QTPARCELAS').AsInteger;
             M_DTEMIS := dm2.cdsContasReceber.FieldByName('REC_DATAEMISSAO').AsDateTime;
             M_DTVENC := dm2.cdsContasReceber.FieldByName('REC_DATAVENCIMENTO').AsDateTime;
             //
             If not uFuncoes.Empty(dm2.cdsContasReceber.FieldByName('REC_DESCRICAO').AsString) Then
                 M_DESCRI := dm2.cdsContasReceber.FieldByName('REC_DESCRICAO').AsString;
             //
             M_VLREST := dm2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency -
                         dm2.cdsContasReceber.FieldByName('REC_PAGO').AsCurrency;
             //
             If not uFuncoes.Empty(dm2.cdsContasReceber.FieldByName('REC_BANCO').AsString) Then
                 M_CDBANC := dm2.cdsContasReceber.FieldByName('REC_BANCO').AsString;
             If not uFuncoes.Empty(dm2.cdsContasReceber.FieldByName('REC_NRCONTA').AsString) Then
                 M_NRAGEN := dm2.cdsContasReceber.FieldByName('REC_NRCONTA').AsString;
             If not uFuncoes.Empty(dm2.cdsContasReceber.FieldByName('REC_AGENCIA').AsString) Then
                 M_NRCONT := dm2.cdsContasReceber.FieldByName('REC_AGENCIA').AsString;
        End
        Else
            M_FLNVPC := 'N';
          // Grava
          dm2.cdsContasReceber.FieldByName('REC_SITUACAO').AsString := 'P';
          dm2.cdsContasReceber.FieldByName('REC_RESTANTE').AsCurrency :=
               dm2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency -
               dm2.cdsContasReceber.FieldByName('REC_PAGO').AsCurrency;
          //
          W_NRSEQU := dm2.cdsContasReceber.FieldByName('REC_SEQUENCIA').AsInteger;
          W_NRRECE := dm2.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger;
          W_NRPARC := dm2.cdsContasReceber.FieldByName('REC_PARCELA').AsInteger;
          W_CDLOJA := dm2.cdsContasReceber.FieldByName('REC_LOJA').AsInteger;
          W_NRVEND := dm2.cdsContasReceber.FieldByName('REC_NRVENDA').AsInteger;
          W_CDCAIX := StrtoInt(uFrmAdmin.M_CDUSUA);
          W_CDNATU := dmConsultas.GetNaturezaCogigo(aDescNat);
          //                    AQUI
          {If not uFuncoes.Empty(dm2.cdsContasReceber.FieldByName('REC_NOSSO_NUMERO').AsString) Then
              iCedente, iUsuario : Integer; aNossoNumero, aArquivo : String;
              fValorPago, fValorCreditado, fVljuros, fVlmulta: Double; aDataPaga,
              aDataCreditado: Tdatetime
              DM2.BaixaTituloBoleto(M_CDCEDE, W_CDCAIX, ANossoNumero, ' ', 'C',
                    M_VLPAGO, M_VLPAGO, M_VLJURO, M_VLMULT, M_VLDESC, M_DTPAGA, M_DTPAGA)
          Else}
             {iSequencia, iCedente, iUsuario: Integer;
              aTipoBaixa: String; fValorPago, fValorCreditado, fVljuros, fVlmulta,
              fVlDesc: Double; aDataPaga}
             DM2.BaixaTituloManual(W_NRSEQU, M_CDCEDE, W_CDCAIX, 'C',
                M_VLPAGO, M_VLPAGO, M_VLJURO, M_VLMULT, M_VLDESC, M_DTPAGA);
          //
          uFuncoes.AddLog('Titulo Baixado com sucesso: '+ ANossoNumero + ' Valor:' + FormatFloat('###,##0.#0',M_VLPAGO));
          {dm2.cdsContasReceber.Post;
          dm2.cdsContasReceber.ApplyUpdates(0);
          //  Incluir Movimento de Caixa
          // Loja, Nr.Venda, Cod.Caixa, Cod.Natureza, TipoMov, Hora, Modalidade - 1 Dinheiro,
          // Situação, Observação, DataMov, Valor Modalidade, Valor Pago, Troco
          Dm.Incluir_Movimento_Caixa(W_CDLOJA, W_NRVEND, W_CDCAIX, W_CDNATU, 'R',
                       M_HOMOVI, '1', '', 'RECEBIMENTO DE CONTA',M_DTMOVI, M_VLPAGO, M_VLPAGO, 0);}
          //
          If (M_FLNVPC = 'S') Then
          Begin
             //Incluir novo registro
             dm.parametros;
             dm.CdsConfig.Edit;
             dm.CdsConfigCFG_SEQRECEBER.AsInteger  := dm.CdsConfigCFG_SEQRECEBER.AsInteger + 1;
             M_SEQREC := dm.CdsConfigCFG_SEQRECEBER.AsInteger;
             dm.CdsConfig.ApplyUpdates(0);
             //
             With dm2.cdsContasReceber do
             Begin
                  Append;
                  FieldByName('REC_SEQUENCIA').AsInteger    := M_SEQREC;
                  FieldByName('REC_CREDITO').AsInteger      := M_NRCRED;
                  FieldByName('REC_LOJA').AsInteger         := M_CDLOJA;
                  FieldByName('REC_NRVENDA').AsInteger      := M_NRVEND;
                  FieldByName('REC_CLIENTE').AsInteger      := M_CDCLIE;
                  FieldByName('REC_PARCELA').AsString       := uFuncoes.StrZero(M_NRPARC,2);
                  FieldByName('REC_QTPARCELAS').AsInteger   := M_QTPARC;
                  FieldByName('REC_DATAEMISSAO').AsDateTime := M_DTEMIS;
                  FieldByName('REC_VALORDESCONTO').AsFloat  := 0;
                  FieldByName('REC_VALORPARCELA').AsCurrency    := M_VLREST;
                  FieldByName('REC_DATAVENCIMENTO').AsDateTime  := M_DTVENC;
                  FieldByName('REC_DESCRICAO').AsString         := M_DESCRI;
                  FieldByName('REC_SITUACAO').AsString          := 'A';
                  FieldByName('REC_VALORJUROS').AsCurrency      := 0;
                  FieldByName('REC_VALORDESCONTO').AsCurrency   := 0;
                  If not uFuncoes.Empty(M_CDBANC) Then
                     FieldByName('REC_BANCO').AsString    := M_CDBANC;
                  If not uFuncoes.Empty(M_NRCONT) Then
                     FieldByName('REC_NRCONTA').AsString  := uFuncoes.StrZero(M_NRCONT,10);
                  If not uFuncoes.Empty(M_NRAGEN) Then
                      FieldByName('REC_AGENCIA').AsString := M_NRAGEN;
                  //
                  // FieldByName('REC_CDCEDENTE').AsInteger  :=
                  if not ufuncoes.Empty(ANossoNumero) Then
                     FieldByName('REC_NOSSO_NUMERO').AsString := ANossoNumero;
                  if not uFuncoes.Empty(aSeuNumero) Then
                     FieldByName('REC_SEUNUMERO').AsString := aSeuNumero;
                  FieldByName('REC_USUARIO').AsInteger    := StrtoInt(uFrmAdmin.M_CDUSUA);
                  //
                  Post;
                  ApplyUpdates(0);
             End;
          End;
          // nova alteração  Caixa Geral
          If (uFrmBaixaContReceber.M_CXGERA = 'S') Then
            begin
                 M_CDMODA := dmDados.GetModaRecebimento(dm2.cdsContasReceber.FieldByName('REC_TIPOMODALIDADE').AsInteger); 
                 M_VLANTE := dmDados.GetValorAtual(M_CDMODA);
                 M_VLMOVI := dm2.cdsContasReceber.FieldByName('REC_PAGO').AsCurrency;
                 //
                 dmDados.SetSaldoConta(M_CDMODA,M_VLMOVI,'E');
                 //
                 M_VLATUA := dmDados.GetValorAtual(M_CDMODA);
                 // Nova alteração   incluir registro o Caixa Geral
                 dmDados.Incluir_Movimento_Contas(W_CDLOJA, StrtoInt(uFrmAdmin.M_CDUSUA),
                           M_CDMODA, W_CDNATU, M_CDCLIE, 0,
                           M_VLANTE, M_VLMOVI, M_VLATUA,
                           dm2.cdsContasReceber.FieldByName('REC_CREDITO').AsString,
                           'E', M_HOMOVI, 'RECEBIMENTO DE PRESTAÇÃO', '',
                           dm2.cdsContasReceber.FieldByName('REC_NRCHEQUE').AsString
                           ,M_DTMOVI);
            End;
          //
          //Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
         //Dm.Comit(Dm.Transc);
          //
          Application.MessageBox (pChar('Baixa realizada com sucesso!!!'),
                     'CONCLUÍDO',MB_ICONINFORMATION+MB_OK+MB_APPLMODAL);
          //
          dm.RefreshCDS(dm.cdsConfig);
          //
          If Application.MessageBox('Deseja imprimir cupom de recebimento?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
                  //uFuncoes.NotaRecebimento('TELA', W_NRSEQU, W_NRRECE, W_CDLOJA, 'N', '1');
                  uFuncoes.Nota_Recebimento('TELA', cmbModa.Text, W_NRSEQU, W_NRRECE, W_CDLOJA, 'N', '1');
          //
          dm.Start;
          try
            If not (dm.IncluirTarefaUsuario( iUsuario,
              'Baixou Conta Receber > Credito: '+uFuncoes.StrZero(InttoStr(M_NRCRED),7)+
              ' PC : '+uFuncoes.StrZero(M_NRPARC,2)+
              ' Cliente :'+uFuncoes.StrZero(InttoStr(M_CDCLIE),7)+
              ' Valor Recebido :'+FormatFloat('###,##0.#0', M_VLPAGO)+' *F*')) Then
                ShowMessage('Erro ao adicionar tarefa do usuário.');
             dm.Comit(Dm.Transc);
          Except
              dm.Rollback;
          End;
          //
          Close;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar realizar baixa de conta!!!'
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              //Dm.SqlAdmin.Rollback(TD);
             // Dm.Rollback;  
        End;
     End;
end;

procedure TfrmBaixaReceber.FormShow(Sender: TObject);
begin
    dbeVLPAGO.SetFocus;
    dbeNome.Text := uFuncoes.NOME_CLIENTE(DM2.cdsContasReceberREC_CLIENTE.AsInteger);
    //
    dbeBanco.ReadOnly   := False;
    dbeAgencia.ReadOnly := False;
    dbeConta.ReadOnly   := False;
    dbeCheque.ReadOnly  := False;
end;

procedure TfrmBaixaReceber.dbeVLJUROExit(Sender: TObject);
begin
     If (dm2.cdsContasReceber.State in [dsEdit]) Then
       CALCULAR;
end;

procedure TfrmBaixaReceber.dbeVLDESCExit(Sender: TObject);
begin
     If (dm2.cdsContasReceber.State in [dsEdit]) Then
        CALCULAR;
end;

procedure TfrmBaixaReceber.CALCULAR;
begin
       dm2.cdsContasReceber.FieldByName('REC_PAGO').AsCurrency :=
         dm2.cdsContasReceber.FieldByName('REC_VLMULTA').AsCurrency +
         (dm2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency +
          dm2.cdsContasReceber.FieldByName('REC_VALORJUROS').AsCurrency) -
         dm2.cdsContasReceber.FieldByName('REC_VALORDESCONTO').AsCurrency;
end;

procedure TfrmBaixaReceber.dbeVLMULTAExit(Sender: TObject);
begin
     If (dm2.cdsContasReceber.State in [dsEdit]) Then
          CALCULAR;
end;

procedure TfrmBaixaReceber.dbeDTPAGAExit(Sender: TObject);
begin
     If (dm2.cdsContasReceber.State in [dsEdit])
      and not uFuncoes.Empty(dbeDTPAGA.Text) Then
         if (dm2.cdsContasReceberREC_DATAPAGAMENTO.AsDateTime > Date()) Then
          begin
               Application.MessageBox (pChar('Data não pode ser superior a atual.'),
                     'Atenção',MB_ICONEXCLAMATION+MB_OK+MB_APPLMODAL);
               dm2.cdsContasReceberREC_DATAPAGAMENTO.AsDateTime := Date();
               dbeDTPAGA.SetFocus;
               Exit;
          End;
end;

end.
