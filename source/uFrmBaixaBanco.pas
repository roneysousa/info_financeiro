unit uFrmBaixaBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, gbCobranca, FMTBcd, DBClient,
  Provider, DB, SqlExpr, Grids, DBGrids;

type
  TfrmBaixaBanco = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnExecutar: TBitBtn;
    btnFechar: TBitBtn;
    lblNomeArquivoRetorno: TLabel;
    txtNomeArquivoRetorno: TEdit;
    GroupBox1: TGroupBox;
    btnProcurar: TBitBtn;
    gbTitulo1: TgbTitulo;
    gbCobranca1: TgbCobranca;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    dstDados: TSQLDataSet;
    dspDados: TDataSetProvider;
    cdsCedente: TClientDataSet;
    cdsTitulo: TClientDataSet;
    cdsCedenteBAN_CODIGO: TIntegerField;
    cdsCedenteBAN_NOME: TStringField;
    cdsCedenteBAN_NRBANC: TIntegerField;
    cdsCedenteBAN_NRAGEN: TIntegerField;
    cdsCedenteBAN_NRCONT: TStringField;
    cdsCedenteBAN_CARTEIRA: TStringField;
    cdsCedenteBAN_CONVENIO: TIntegerField;
    cdsCedenteBAN_FORMA_CALC: TIntegerField;
    cdsTituloREC_NRVEND: TIntegerField;
    cdsTituloREC_CDGRUP: TIntegerField;
    cdsTituloREC_NRCOTA: TIntegerField;
    cdsTituloREC_NRPARC: TIntegerField;
    cdsTituloREC_DTVENC: TDateField;
    cdsTituloREC_VLPARC: TFMTBCDField;
    cdsTituloREC_DTPAGA: TDateField;
    cdsTituloREC_VLMULT: TFMTBCDField;
    cdsTituloREC_TOTAL_PAGO: TFMTBCDField;
    cdsTituloREC_DTMOVI: TDateField;
    cdsTituloREC_DTCREDITO: TDateField;
    cdsTituloREC_FORMABAIXA: TStringField;
    cdsTituloREC_TPSLIP: TStringField;
    cdsTituloREC_NOSSONUMERO: TStringField;
    cdsTituloREC_VALORTARIFABANCO: TFMTBCDField;
    cdsTituloREC_VALORTITULOTITULO: TFMTBCDField;
    cdsTituloREC_HOPAGA: TStringField;
    cdsTituloREC_MOV_CAIXA: TIntegerField;
    grdConsultar: TDBGrid;
    dsRetornos: TDataSource;
    Label10: TLabel;
    cmbConta: TComboBox;
    Panel3: TPanel;
    lblRegistros1: TLabel;
    lblTotal1: TLabel;
    lblTotal: TLabel;
    lblRegistros: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtNomeArquivoRetornoChange(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure dsRetornosDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Function GetCedente(aBanco, aAgencia : integer; aCedente, aCarteira : String) : Boolean;
    Procedure LimparGrid;
    procedure Carregar_Contas;
    Function GetTotalValorTitulos() : String;
    procedure Limpar;
    procedure AddLog(aMensagem : String);
  public
    { Public declarations }
  end;

var
  frmBaixaBanco: TfrmBaixaBanco;


implementation

uses uFuncoes, udmDados, uFrmAdmin, StrUtils, uDmRelatorios, Udm,
  udmConsulta, uDm2;

{$R *.dfm}

procedure TfrmBaixaBanco.btnFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmBaixaBanco.FormShow(Sender: TObject);
begin

     //lblNomeBanco.Caption := '';
     //
     Carregar_Contas();
     //
     LimparGrid;
     //grdConsultar.Visible        := False;
     //txtRelatorioRetorno.Visible := False;
     grdConsultar.Align := alClient;
     btnExecutar.Enabled := False;
     //
     dm.RefreshCDS(dm.CdsConfig);
     //
     If not uFuncoes.Empty(dm.CdsConfigCFG_PASTA_RETORNO.AsString) Then
         txtNomeArquivoRetorno.Text := dm.CdsConfigCFG_PASTA_RETORNO.AsString
     Else
         txtNomeArquivoRetorno.Text :=  ExtractFilePath( Application.ExeName )+ 'RETORNO';
     //
     cmbConta.SetFocus;
     //
     lblRegistros.Caption := '0';
     btnExecutar.Enabled := False;
end;

procedure TfrmBaixaBanco.txtNomeArquivoRetornoChange(Sender: TObject);
begin
     if not uFuncoes.Empty(txtNomeArquivoRetorno.Text) Then
         btnExecutar.Enabled := True
     Else
     begin
         btnExecutar.Enabled := False;
         //txtRelatorioRetorno.Clear;
     End;
end;

procedure TfrmBaixaBanco.btnProcurarClick(Sender: TObject);
Var
  iCedente : Integer;
begin
   Limpar;
   iCedente := dm.GetCodigoCedente(cmbConta.Text);
   //
   OpenDialog1.FileName := txtNomeArquivoRetorno.Text;
   OpenDialog1.InitialDir := ExtractFilePath(txtNomeArquivoRetorno.Text);
   //
   if OpenDialog1.Execute then
    begin
        txtNomeArquivoRetorno.Text := OpenDialog1.FileName;
        //
        lblTotal.Caption := '0,00';
        //
        btnExecutar.Enabled := False;
        btnProcurar.Enabled := False;
        try
          Screen.Cursor := crHourGlass;
          if not (dmDados.Carregar_Titulos(iCedente, txtNomeArquivoRetorno.Text)) Then
               Raise Exception.Create('Ocorreu um erro!')
          Else
          begin
               dsRetornos.DataSet.First;
               //
               lblTotal.Caption := GetTotalValorTitulos();
          End;
        finally
            btnProcurar.Enabled :=  true;
            btnExecutar.Enabled :=  true;
            //
            Screen.Cursor := crDefault;
        End;
        Application.ProcessMessages;
    End;
end;

procedure TfrmBaixaBanco.btnExecutarClick(Sender: TObject);
{Objetivo: Ler arquivo recebido do banco e dar baixa nos títulos automaticamente}
var
   ANossoNumero, M_HOMOVI, aDescricao, M_NSNUME : string;
   ACedenteCodigo, i, aSequencia, iSeq, iLoja, iCliente, iCredito, iSqCaixa, iCaixa : integer;
   Multa, Valor, ValorCreditado, fJuroMulta, fValorDesc : double;
   aData, aDtCredito : TDate;
   iUsuario, iCedente : integer;
   aNmFile, aNmPasta, aFileLog : String;
//   log: textfile;
begin
    //
    If not FileExists(txtNomeArquivoRetorno.Text) Then
    begin
         Application.MessageBox(PChar('Arquivo não selecionado.'),
                  'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
         btnProcurar.SetFocus;
         Exit;
    End;
    //
    if NOT uFuncoes.Empty(cmbConta.Text) and not (dmDados.cdsTitulos.IsEmpty)Then
    begin
      iCedente := Dm.GetCodigoCedente(cmbConta.Text);
      if (dmDados.Carregar_Titulos(iCedente, txtNomeArquivoRetorno.Text)) Then
      begin
           btnExecutar.Enabled := False;
           //
           gbCobranca1.NomeArquivo := txtNomeArquivoRetorno.Text;
           //
           aNmFile  := RightStr(txtNomeArquivoRetorno.Text, 12);
           aNmPasta := Copy(txtNomeArquivoRetorno.Text,1, (length(txtNomeArquivoRetorno.Text)-length(aNmFile)));
           //
           grdConsultar.Visible := True;
           grdConsultar.Align  := alClient;
           //
           //txtRelatorioRetorno.Visible := False;
           //
           iCaixa := StrtoInt(uFrmAdmin.M_CDUSUA);
           iUsuario := iCaixa;
           With dmDados.cdsTitulos do
            begin
                 M_HOMOVI := Copy(TimetoStr(Time),1,5);
                 DisableControls;
                 iLoja  := dm.GetCodigoCedente(cmbConta.Text);
                 First;
                 //
                 While not (Eof) do
                  begin
                       aSequencia   := 1;
                       //dmAdmDados.GetRegMovCaixa();
                       ANossoNumero := FieldByName('CDS_NOSSONUMERO').AsString;
                       Multa := 0;
                       Valor := FieldByName('CDS_VALOR_DOCUMENTO').AsFloat;
                       ValorCreditado := FieldByName('CDS_VLRECEBIDO').AsFloat;
                       aData := FieldByName('CDS_DTPAGA').AsDateTime;
                       aDtCredito := FieldByName('CDS_DTCRED').AsDateTime;
                       fValorDesc := FieldByName('CDS_VLDESC').AsFloat;
                       fJuroMulta := 0;
                       If (FieldByName('CDS_JUROS_MORA').AsFloat > 0) Then
                          fJuroMulta := FieldByName('CDS_JUROS_MORA').AsFloat;
                       //
                       If not (Dm.VerificarBaixaTitulo(iLoja, ANossoNumero)) Then
                        begin
                             If (Dm.GetNumSeqTitulo(iLoja, ANossoNumero) > 0) Then
                              begin
                                 {iCedente, iUsuario : Integer; aNossoNumero, aArquivo : String;
                                 fValorPago, fValorCreditado, fVljuros, fVlmulta, fVlDesc: Double; aDataPaga,
                                 aDataCreditado: Tdatetime  }
                                 DM2.BaixaTituloBoleto(iLoja, iCaixa, ANossoNumero, aNmFile, 'B',
                                          Valor, ValorCreditado, fJuroMulta, 0, fValorDesc, aData, aDtCredito);
                                 //
                                 AddLog('Titulo Baixado com sucesso: '+ ANossoNumero + ' Valor:' + FormatFloat('###,##0.#0',Valor));
                              End
                              Else
                                 AddLog('Titulo nao Encontrado: '+ ANossoNumero);
                        End
                        Else
                        begin
                            AddLog('Titulo ja Baixado: '+ ANossoNumero);
                            //  Application.MessageBox(PChar('Título já baixado: '+ ANossoNumero),
                            //   'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                        End;
                       //
                       Next;
                  End;
                  EnableControls;
            End;
             //
              MessageDlg('O arquivo retorno ' + aNmFile + ' foi processado com sucesso',mtInformation,[mbOk],0);
              //
              aFileLog := ExtractFilePath( Application.ExeName )+'\nn.txt';
              if FileExists(aFileLog) Then
                 Copyfile(PChar(aFileLog),
                          PChar(ExtractFilePath( Application.ExeName )+'\Retorno\log_'+uFuncoes.RemoveChar(DatetoStr(Date))+'_'+uFuncoes.RemoveChar(TimetoStr(time))+'.txt'),true);
            //
            Dm.Start;
            Try
              If not (dm.IncluirTarefaUsuario( iUsuario,
                 'Baixou Retorno Banco : ' + aNmFile +' *F*')) Then
                    ShowMessage('Erro ao adicionar tarefa do usuário.');
                 dm.Comit(Dm.Transc);
            Except
                 dm.Rollback;
            End;
            //
            Close;
      End
      Else
          raise Exception.Create('Erro ao tentar realizar baixa automatica.');
      //
      dmDados.cdsTitulos.close;
      //
      lblTotal.Caption := '0,00';
      lblRegistros.Caption := '0';
      //
   End;
end;

function TfrmBaixaBanco.GetCedente(aBanco, aAgencia: integer; aCedente,
  aCarteira: String): Boolean;
begin
      Result := False;
      With cdsCedente do
        begin
             Close;
             Params.ParamByName('pNRBANC').AsInteger := aBanco;
             Params.ParamByName('PNRAGEN').AsInteger := aAgencia;
             Params.ParamByName('pNRCONT').AsString  := aCedente;
             Params.ParamByName('pCARTEIRA').AsString := aCarteira; 
             open;
             //
             If not (IsEmpty) Then
                 Result := True;
        End;
end;

procedure TfrmBaixaBanco.LimparGrid;
begin
     if (dmDados.cdsTitulos.Active) Then
       begin
            If not (dmDados.cdsTitulos.IsEmpty) Then
                 dmDados.cdsTitulos.EmptyDataSet;
            dmDados.cdsTitulos.close;
       End;
end;

procedure TfrmBaixaBanco.Carregar_Contas;
begin
      dm.RefreshCDS(dmConsultas.cdsListaCedentes);
      //
      With dmConsultas.cdsListaCedentes do
        begin
             first;
             cmbConta.Clear;
             While not (Eof) do
              begin
                   cmbConta.Items.Add(FieldByName('CEDENTE_NOME').AsString);
                   //
                   Next;
              End;
        End;
end;

procedure TfrmBaixaBanco.dsRetornosDataChange(Sender: TObject;
  Field: TField);
begin
     lblRegistros.Caption := InttoStr(dmDados.cdsTitulos.RecNo) + '/'
               + InttoStr(dmDados.cdsTitulos.RecordCount);
     //
     btnExecutar.Enabled := (dmDados.cdsTitulos.Active) and not (dmDados.cdsTitulos.IsEmpty) ;
end;

function TfrmBaixaBanco.GetTotalValorTitulos: String;
Var
   fValor : Real;
begin
     fValor := 0;
     With dmDados.cdsTitulos do
      begin
           DisableControls;
           First;
           While not (Eof) do
           begin
                fValor := fValor + FieldByName('CDS_VALOR_DOCUMENTO').AsFloat;
                //
                Next;
           End;
           //
           First;
           EnableControls;
      End;
      //
      Result := FormatFloat('###,###,##0.#0', fValor);
end;

procedure TfrmBaixaBanco.Limpar;
begin
    dsRetornos.DataSet.Close;
    lblTotal.Caption := '0,00';
    lblRegistros.Caption := '0';
end;

procedure TfrmBaixaBanco.FormCreate(Sender: TObject);
Var
   iNatureza, iModalidade : Integer;
   qraux : TSQLquery;
   texto : string;
begin
    iNatureza   := Dm.GetCodigoNatureza('BAIXA DE TITULO');
    //
    If (iNatureza = 0) Then
     begin
          Dm.RefreshCDS(dm.CdsConfig);
          dm.CdsConfig.edit;
          dm.CdsConfigCFG_NATUREZA.AsInteger :=
            dm.CdsConfigCFG_NATUREZA.AsInteger + 1;
          dm.CdsConfig.ApplyUpdates(0);
          //
          texto := 'Insert into NATUREZA (NAT_CODIGO, NAT_NOME, NAT_TIPO) values (:pCODIGO, :pNOME, :pTIPO)';
          QrAux := TSqlquery.Create(nil);
          with QrAux do
           try
              Dm.Start;
              try
                 SQLConnection := dm.SQLAdmin;
                 sql.Add(texto);
                 Params.ParamByName('pCODIGO').AsInteger := dm.CdsConfigCFG_NATUREZA.AsInteger;
                 Params.ParamByName('pNOME').AsString  := 'BAIXA DE TITULO';
                 Params.ParamByName('pTIPO').AsString  := '2';
                 ExecSQL();
                 //
                 Dm.Comit(Dm.Transc);
              Except
                  dm.Rollback;
              End;
           finally
               free;
           end;
     End;
     //
    iModalidade := Dm.GetCodigoModalidade('BOLETO BANCARIO');
    //
    If (iModalidade = 0) Then
    begin
          Dm.RefreshCDS(dm.CdsConfig);
          dm.CdsConfig.edit;
          dm.CdsConfigCFG_MODALIDADE.AsInteger :=
            dm.CdsConfigCFG_MODALIDADE.AsInteger + 1;
          dm.CdsConfig.ApplyUpdates(0);
          //
          texto := 'Insert into MODALIDADE (MOD_CODIGO, MOD_NOME, MOD_ABREVIACAO, MOD_NRPARCELA, MOD_FLFIXA, MOD_AVISTA, MOD_FLXTEF)';
          texto := texto + ' values (:pCODIGO, :pNOME, :pABREVIACAO, :pNRPARCELA, :pFLFIXA, :pAVISTA, :pFLXTEF)';
          QrAux := TSqlquery.Create(nil);
          with QrAux do
           try
              Dm.Start;
              try
                 SQLConnection := dm.SQLAdmin;
                 sql.Add(texto);
                 Params.ParamByName('pCODIGO').AsInteger := dm.CdsConfigCFG_MODALIDADE.AsInteger;
                 Params.ParamByName('pNOME').AsString  := 'BOLETO BANCARIO';
                 Params.ParamByName('pABREVIACAO').AsString  := 'BLB';
                 Params.ParamByName('pNRPARCELA').AsInteger  := 1;
                 Params.ParamByName('pFLFIXA').AsString      := 'B';
                 Params.ParamByName('pAVISTA').AsString      := 'A';
                 Params.ParamByName('pFLXTEF').AsString      := 'N';
                 ExecSQL();
                 //
                 Dm.Comit(Dm.Transc);
              Except
                  dm.Rollback;
              End;
           finally
               free;
           end;
    End;
end;

procedure TfrmBaixaBanco.AddLog(aMensagem: String);
var
  log: textfile;
  aFileLog : String;
begin
  try
     aFileLog := ExtractFilePath( Application.ExeName )+'\nn.txt';
     AssignFile(log, aFileLog );
     if not FileExists(aFileLog) then
        Rewrite(log, aFileLog);
     Append(log);
     WriteLn(log, aMensagem);
  finally
     CloseFile(log);
  end;
end;

end.
