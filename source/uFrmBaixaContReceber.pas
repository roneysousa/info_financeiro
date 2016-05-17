unit uFrmBaixaContReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, FMTBcd, DB,
  DBClient, Provider, SqlExpr, DBXpress, gbCobranca;

type
  TfrmBaixaContReceber = class(TForm)
    pnlSuperior: TPanel;
    pnlDados: TPanel;
    Panel2: TPanel;
    grdConsultar: TDBGrid;
    edtCDCLIE: TEdit;
    Label3: TLabel;
    spLocClientes: TSpeedButton;
    btBaixa: TBitBtn;
    BtSair: TBitBtn;
    dstContasReceber: TSQLDataSet;
    dstContasReceberREC_LOJA: TIntegerField;
    dstContasReceberREC_CREDITO: TIntegerField;
    dstContasReceberREC_PARCELA: TIntegerField;
    dstContasReceberREC_QTPARCELAS: TIntegerField;
    dstContasReceberREC_CLIENTE: TIntegerField;
    dstContasReceberREC_NRVENDA: TIntegerField;
    dstContasReceberREC_DATAEMISSAO: TDateField;
    dstContasReceberREC_DATAVENCIMENTO: TDateField;
    dstContasReceberREC_VALORPARCELA: TFMTBCDField;
    dstContasReceberREC_SITUACAO: TStringField;
    dstContasReceberREC_DATAPAGAMENTO: TDateField;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    cdsContasReceberREC_LOJA: TIntegerField;
    cdsContasReceberREC_CREDITO: TIntegerField;
    cdsContasReceberREC_PARCELA: TIntegerField;
    cdsContasReceberREC_QTPARCELAS: TIntegerField;
    cdsContasReceberREC_CLIENTE: TIntegerField;
    cdsContasReceberREC_NRVENDA: TIntegerField;
    cdsContasReceberREC_DATAEMISSAO: TDateField;
    cdsContasReceberREC_DATAVENCIMENTO: TDateField;
    cdsContasReceberREC_VALORPARCELA: TFMTBCDField;
    cdsContasReceberREC_SITUACAO: TStringField;
    cdsContasReceberREC_DATAPAGAMENTO: TDateField;
    cdsContasReceberREC_NMSITUACAO: TStringField;
    cdsContasReceberREC_ATRASO: TFloatField;
    cdsContasReceberREC_NMCLIENTE: TStringField;
    dsContas: TDataSource;
    btFiltar: TBitBtn;
    dstContasReceberREC_VALORJUROS: TFMTBCDField;
    cdsContasReceberREC_VALORJUROS: TFMTBCDField;
    cdsContasReceberREC_VLSUBTOTAL: TCurrencyField;
    pnlEdicao: TPanel;
    Label5: TLabel;
    lbl_Debito: TLabel;
    btBaixaTodos: TBitBtn;
    dstContasReceberREC_PAGO: TFMTBCDField;
    cdsContasReceberREC_PAGO: TFMTBCDField;
    btnBoleto: TBitBtn;
    lbl_NMCLIE: TEdit;
    dstContasReceberREC_NOSSO_NUMERO: TStringField;
    cdsContasReceberREC_NOSSO_NUMERO: TStringField;
    Label1: TLabel;
    edtNRTITU: TEdit;
    lblParcelas: TLabel;
    procedure BtSairClick(Sender: TObject);
    procedure spLocClientesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure cdsContasReceberCalcFields(DataSet: TDataSet);
    procedure btFiltarClick(Sender: TObject);
    procedure dsContasDataChange(Sender: TObject; Field: TField);
    procedure btBaixaClick(Sender: TObject);
    procedure btBaixaTodosClick(Sender: TObject);
    procedure btnBoletoClick(Sender: TObject);
    procedure edtCDCLIEEnter(Sender: TObject);
    procedure edtNRTITUExit(Sender: TObject);
    procedure edtNRTITUChange(Sender: TObject);
    procedure edtNRTITUKeyPress(Sender: TObject; var Key: Char);
  private
    procedure CONSULTA;
    Function GetClienteNossoNumero(aNossoNumero : String): Integer;
    procedure CONSULTA2(iCliente : Integer);
    procedure Limpar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaContReceber: TfrmBaixaContReceber;
  M_CDCLIE, M_CXGERA : String;

implementation

Uses uFrmBuscaClientes, uFuncoes, udmConsulta, uFrmBaixaReceber, uDm2, uFrmAdmin,
  Udm, udmDados, uFrmBaixaAutomatico;

{$R *.dfm}

procedure TfrmBaixaContReceber.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmBaixaContReceber.spLocClientesClick(Sender: TObject);
begin
  with TfrmBuscaClientes.create(self) do
  try
     uFrmBuscaClientes.M_NRFROM := 3;
     showmodal;
  finally
    edtCDCLIE.Text := M_CDCLIE;
    If not uFuncoes.Empty(edtCDCLIE.Text) Then
       btFiltar.SetFocus
    Else
       edtCDCLIE.SetFocus;
    free;
  end;
end;

procedure TfrmBaixaContReceber.FormShow(Sender: TObject);
begin
      btFiltar.Enabled := False;
      lbl_NMCLIE.Clear;
      edtCDCLIE.SetFocus;
end;

procedure TfrmBaixaContReceber.edtCDCLIEExit(Sender: TObject);
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
              Application.MessageBox(PChar('Loja\Comodatário\Locatário não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_NMCLIE.Clear;
              edtCDCLIE.Clear;
              edtCDCLIE.SetFocus;
              Exit;
          End
          Else
          Begin
             If not uFuncoes.Empty(edtCDCLIE.text) Then
                 btFiltar.SetFocus
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

procedure TfrmBaixaContReceber.edtCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.text) Then
     Begin
         cdsContasReceber.Close;
         lblParcelas.Caption := 'Registro(s) : ';
         lbl_NMCLIE.Clear;
         Limpar;
         btFiltar.Enabled     := False;
         btBaixa.Enabled      := False;
         btBaixaTodos.Enabled := False;
     End
     Else
        btFiltar.Enabled := true;
end;

procedure TfrmBaixaContReceber.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     If (key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          if (btFiltar.Enabled) Then
             btFiltar.SetFocus;
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClientesClick(Sender);
     End;
end;

procedure TfrmBaixaContReceber.cdsContasReceberCalcFields(
  DataSet: TDataSet);
begin
     If (cdsContasReceberREC_SITUACAO.AsString = 'P') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'PAGA';
     If (cdsContasReceberREC_SITUACAO.AsString = 'C') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'CANCELA';
     If (cdsContasReceberREC_SITUACAO.AsString = 'A') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'ABERTA';
     If (cdsContasReceberREC_SITUACAO.AsString = '') Then
         cdsContasReceberREC_NMSITUACAO.AsString := 'ABERTA';
     //
     cdsContasReceberREC_VLSUBTOTAL.AsCurrency :=
        cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency +
        cdsContasReceber.FieldByName('REC_VALORJUROS').AsCurrency
end;

procedure TfrmBaixaContReceber.CONSULTA;
Var
   M_TODEBI : Double;
   aTexto : String;
begin
     M_TODEBI := 0;
     //
     aTexto := 'Select REC_LOJA, REC_CREDITO, REC_PARCELA, REC_QTPARCELAS, REC_CLIENTE, REC_NRVENDA, REC_DATAEMISSAO, REC_DATAVENCIMENTO, REC_VALORJUROS, REC_VALORPARCELA,REC_SITUACAO, REC_DATAPAGAMENTO, REC_PAGO, REC_NOSSO_NUMERO ';
     aTexto := aTexto + 'from CONTASRECEBER Where (REC_CLIENTE = :pCLIENTE) ';
     aTexto := aTexto + 'and (REC_SITUACAO = :pSITUACAO) ';
     aTexto := aTexto + 'order by REC_CREDITO, REC_PARCELA ';

     //
     With cdsContasReceber do
     begin
          Close;
          CommandText := aTexto;
          Params.ParamByName('pCLIENTE').AsInteger := StrtoInt(edtCDCLIE.Text);
          Params.ParamByName('pSITUACAO').AsString := 'A';
          Open;
          //
          If (IsEmpty) Then
          begin
               Application.MessageBox(PChar('Não há registro de conta da Loja\Comodatário\Locatário!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               Close;
               lbl_Debito.Caption := '0,00';
               edtCDCLIE.Clear;
               edtCDCLIE.SetFocus;
               Exit;
          End
          Else
          begin
               DisableControls;
               While not (Eof) do
               begin
                    M_TODEBI := M_TODEBI + FieldByName('REC_VALORPARCELA').AsCurrency;
                    //
                    next;
               End;
               First;
               EnableControls;
               //
               lbl_Debito.Caption := FormatFloat('###,##0.#0',M_TODEBI);
          End;
     End;
end;

procedure TfrmBaixaContReceber.btFiltarClick(Sender: TObject);
Var
    iCodCliente : Integer;
    aNossoNumero : String;
begin
     if not uFuncoes.Empty(edtCDCLIE.Text) Then
         CONSULTA;
     if uFuncoes.Empty(edtCDCLIE.Text) and not uFuncoes.Empty(edtNRTITU.Text) Then
       begin
            aNossoNumero := edtNRTITU.Text;
            iCodCliente := GetClienteNossoNumero(aNossoNumero);
            if (iCodCliente > 0) Then
               CONSULTA2(iCodCliente)
            Else
            begin
               Application.MessageBox(PChar('Título não encontrado ou já baixado.'),
                      'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION +MB_APPLMODAL);
               cdsContasReceber.Close;
               lbl_Debito.Caption := '0,00';
               edtNRTITU.Clear;
               edtNRTITU.SetFocus;
               Exit;
            End;
       End;
end;

procedure TfrmBaixaContReceber.dsContasDataChange(Sender: TObject;
  Field: TField);
begin
     If (cdsContasReceber.FieldByName('REC_SITUACAO').AsString = 'A')  Then
     begin
        btBaixa.Enabled       := True;
        btBaixaTodos.Enabled  := True;
     End
     Else
     begin
        btBaixa.Enabled       := False;
        btBaixaTodos.Enabled  := False;
    End;
    //
    if (dsContas.DataSet.Active) and  not (dsContas.DataSet.IsEmpty) Then
       lblParcelas.Caption := 'Registro(s) : '+Inttostr(dsContas.DataSet.RecordCount)
    Else
       lblParcelas.Caption := 'Registro(s) : ';
end;

procedure TfrmBaixaContReceber.btBaixaClick(Sender: TObject);
begin
    dm2.cdsContasReceber.Close;
    With dm2.dstContasReceber do
    begin
         Active := False;
         CommandText := 'Select * from CONTASRECEBER Where (REC_CREDITO = :pCREDITO) and (REC_PARCELA = :pPARCELA) '
                       +' and (REC_LOJA = :pLOJA) and (REC_CLIENTE = :pCLIENTE) And (REC_SITUACAO = :pSITUACAO)';
         Params.ParamByName('pCREDITO').AsInteger := cdsContasReceber.FieldByName('REC_CREDITO').AsInteger;
         Params.ParamByName('pPARCELA').AsInteger := cdsContasReceber.FieldByName('REC_PARCELA').AsInteger;
         Params.ParamByName('pLOJA').AsInteger    := cdsContasReceber.FieldByName('REC_LOJA').AsInteger;
         Params.ParamByName('pCLIENTE').AsInteger := cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger;
         Params.ParamByName('pSITUACAO').AsString := 'A';
         Active := True;
    End;
    dm2.cdsContasReceber.FetchParams;
    dm2.cdsContasReceber.Open;
    dm2.cdsContasReceber.Edit;
    dm2.cdsContasReceber.FieldByName('REC_DATAPAGAMENTO').AsDateTime := Date;
    //
    with TfrmBaixaReceber.create(self) do
    try
       showmodal;
    finally
       free;
       CONSULTA;
   end;
end;

procedure TfrmBaixaContReceber.btBaixaTodosClick(Sender: TObject);
Var
    TD : TTransactionDesc;
    M_DTMOVI : Tdate;
    W_NRRECE, W_CDLOJA : Integer;
    W_NRVEND, W_CDCAIX, W_CDNATU : integer;
    M_HOMOVI : String;
    M_VLPAGO, M_VLTROC : Double;
begin
     If Application.MessageBox('Confirma baixa de contas?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
     Begin
          // Inicia um transação no BD
          {TD.TransactionID  := StrtoInt(uFrmAdmin.M_CDUSUA);
          TD.IsolationLevel := xilREADCOMMITTED;
          Dm.SqlAdmin.StartTransaction(TD);}
          Dm.Start;
          //
          try
               M_DTMOVI := Date();
               M_HOMOVI := Copy(TimetoStr(Time),1,5);
               //
               With cdsContasReceber do
                begin
                     //
                     With DM2.cdsPContas do
                      begin
                           Active := False;
                           Active := True;
                           EmptyDataSet;
                      End;
                     //
                     DisableControls;
                     First;
                     //
                     W_NRRECE := FieldByName('REC_CREDITO').AsInteger;
                     W_CDLOJA := FieldByName('REC_LOJA').AsInteger;
                     W_CDCAIX := StrtoInt(uFrmAdmin.M_CDUSUA);
                     W_CDNATU := dmConsultas.GetNaturezaCogigo('RECEBIMENTO DE CONTA');
                     //
                     While not (Eof) do
                      begin
                           Edit;
                           //
                           FieldByName('REC_SITUACAO').AsString        := 'P';
                           FieldByName('REC_DATAPAGAMENTO').AsDateTime := M_DTMOVI;
                           FieldByName('REC_PAGO').AsCurrency          := FieldByName('REC_VALORPARCELA').AsCurrency;
                           //
                           With DM2.cdsPContas do
                            begin
                                 Append;
                                 FieldByName('REC_NRCRED').AsInteger  := cdsContasReceber.FieldByName('REC_CREDITO').AsInteger;
                                 FieldByName('REC_PARCELA').AsInteger := cdsContasReceber.FieldByName('REC_PARCELA').AsInteger;
                                 FieldByName('REC_DTVENC').AsDateTime := cdsContasReceber.FieldByName('REC_DATAVENCIMENTO').AsDateTime;
                                 FieldByName('REC_VLPARC').AsFloat    := cdsContasReceber.FieldByName('REC_VALORPARCELA').AsFloat ;
                                 FieldByName('REC_VLDESC').AsFloat    := cdsContasReceber.FieldByName('REC_VALORPARCELA').AsFloat;
                                 FieldByName('REC_VLPAGO').AsFloat    := cdsContasReceber.FieldByName('REC_PAGO').AsFloat;
                                 FieldByName('REC_VLJURO').AsFloat    := cdsContasReceber.FieldByName('REC_VALORJUROS').AsFloat;
                                 //
                                 W_NRVEND := cdsContasReceberREC_NRVENDA.AsInteger;
                                 M_VLPAGO := cdsContasReceber.FieldByName('REC_PAGO').AsFloat;
                                 M_VLTROC := 0;
                                 //
                                 Post;
                            End;
                            // Loja, Nr.Venda, Cod.Caixa, Cod.Natureza, TipoMov, Hora, Modalidade - 1 Dinheiro,
                            // Situação, Observação, DataMov, Valor Modalidade, Valor Pago, Troco
                            //  Incluir Movimento de Caixa
                            Dm.Incluir_Movimento_Caixa(W_CDLOJA, W_NRVEND, W_CDCAIX, W_CDNATU, 'R',
                                M_HOMOVI, '1', '', 'RECEBIMENTO DE CONTA',M_DTMOVI, M_VLPAGO, M_VLPAGO, M_VLTROC);
                           //
                           Next;
                      End;
                     //
                     ApplyUpdates(0);
                     //
                     EnableControls;
                End;
                //
                //Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
                Dm.Comit(dm.Transc);
                //
                MessageBox (Application.Handle, pChar('Baixa realizada com sucesso!!!'),
                     'CONCLUÍDO',MB_ICONINFORMATION+ MB_OK);
                //
                If Application.MessageBox('Deseja imprimir cupom de recebimento?',
                  'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
                      uFuncoes.NotaRecebimento('TELA', 0, W_NRRECE, W_CDLOJA, 'S','1');
                //
                CONSULTA;
          Except
              on Exc:Exception do
               begin
                  Application.MessageBox(PChar('Erro ao tentar realizar baixa de contas!!!'
                          + Exc.Message),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   //  Cancelar transação no BD.
                   //Dm.SqlAdmin.Rollback(TD);
                   Dm.Rollback;  
               End;
          End;
     End;
end;

procedure TfrmBaixaContReceber.btnBoletoClick(Sender: TObject);
begin
     FrmAdmin.AbreForm(TfrmBaixaAutomatico, frmBaixaAutomatico);
end;

procedure TfrmBaixaContReceber.edtCDCLIEEnter(Sender: TObject);
begin
    cdsContasReceber.Close;
end;

function TfrmBaixaContReceber.GetClienteNossoNumero(
  aNossoNumero: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  result := 0;
  texto := 'Select R.rec_sequencia, R.rec_loja, R.rec_credito, R.rec_cliente, R.rec_nosso_numero, R.rec_situacao from CONTASRECEBER R ';
  texto := texto + ' where (r.rec_nosso_numero = :pNUMERO) and (R.rec_situacao = '+QuotedStr('A')+') ';
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
          result := FieldByName('rec_cliente').AsInteger;
    finally
      free;
    end;
end;

procedure TfrmBaixaContReceber.CONSULTA2(iCliente: Integer);
Var
   M_TODEBI : Double;
   aTexto : String;
begin
     M_TODEBI := 0;
     //
     aTexto := 'Select REC_LOJA, REC_CREDITO, REC_PARCELA, REC_QTPARCELAS, REC_CLIENTE, REC_NRVENDA, REC_DATAEMISSAO, REC_DATAVENCIMENTO, REC_VALORJUROS, REC_VALORPARCELA,REC_SITUACAO, REC_DATAPAGAMENTO, REC_PAGO, REC_NOSSO_NUMERO ';
     aTexto := aTexto + 'from CONTASRECEBER Where (REC_CLIENTE = :pCLIENTE) ';
     aTexto := aTexto + 'and (REC_SITUACAO = :pSITUACAO) ';
     aTexto := aTexto + 'order by REC_CREDITO, REC_PARCELA ';
     //
     edtCDCLIE.SetFocus;
     edtCDCLIE.Text := InttoStr(iCliente);
     edtNRTITU.SetFocus;
     //
     With cdsContasReceber do
     begin
          Close;
          CommandText := aTexto;
          Params.ParamByName('pCLIENTE').AsInteger := iCliente;
          Params.ParamByName('pSITUACAO').AsString := 'A';
          Open;
          //
          If (IsEmpty) Then
          begin
               Application.MessageBox(PChar('Não há registro de conta da Loja\Comodatário\Locatário!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               Close;
               lbl_Debito.Caption := '0,00';
               edtCDCLIE.Clear;
               edtCDCLIE.SetFocus;
               Exit;
          End
          Else
          begin
               DisableControls;
               While not (Eof) do
               begin
                    M_TODEBI := M_TODEBI + FieldByName('REC_VALORPARCELA').AsCurrency;
                    //
                    next;
               End;
               //
               Locate('REC_NOSSO_NUMERO', edtNRTITU.Text,[]);
               //
               EnableControls;
               //
               lbl_Debito.Caption := FormatFloat('###,##0.#0',M_TODEBI);
               //
               grdConsultar.SetFocus;
          End;
     End;
end;

procedure TfrmBaixaContReceber.edtNRTITUExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRTITU.Text) Then
     Begin
          edtNRTITU.Text := uFuncoes.StrZero(edtNRTITU.Text, 10);
          //
          If not (Dm.GetVerificarExisteNossoNumero(edtNRTITU.Text)) Then
          begin
               Application.MessageBox(PChar('Nosso número não encontrado.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               edtNRTITU.SetFocus;
               Exit;
          End;
     End;
end;

procedure TfrmBaixaContReceber.edtNRTITUChange(Sender: TObject);
begin
    If uFuncoes.Empty(edtNRTITU.text) Then
     Begin
         cdsContasReceber.Close;
         edtCDCLIE.Clear;
         Limpar;
         btFiltar.Enabled     := False;
         btBaixa.Enabled      := False;
         btBaixaTodos.Enabled := False;
     End
     Else
        btFiltar.Enabled := true;
end;

procedure TfrmBaixaContReceber.edtNRTITUKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     //
     If (key = #13) and not uFuncoes.Empty(edtNRTITU.Text) Then
     Begin
          Key := #0;
          if (btFiltar.Enabled) Then
             btFiltar.SetFocus;
     End;
end;

procedure TfrmBaixaContReceber.Limpar;
begin
     lbl_NMCLIE.Clear;
     lblParcelas.Caption := 'Registro(s) : ';
     lbl_Debito.Caption  := '0,00';
end;

end.
