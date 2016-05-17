unit uFrmSituacaoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, FMTBcd, DB, SqlExpr,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBPipe, DBXpress,
  ppCtrls, ppPrnabl, ppBands, ppCache, DBClient, ppVar, ppStrtch, ppMemo;

type
  TfrmSituacaoCaixa = class(TForm)
    Panel1: TPanel;
    pnlBotoes: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    Label2: TLabel;
    dbeCAIXA: TEdit;
    Label4: TLabel;
    sbLocCaixa: TSpeedButton;
    edtSENHA: TLabeledEdit;
    lbl_NMUSUA: TLabel;
    qryProcurar: TSQLQuery;
    qryCaixa: TSQLQuery;
    cmbNMLOJA: TComboBox;
    qryLojas2: TSQLQuery;
    qryLojas2EMP_CODIGO: TIntegerField;
    qryLojas2EMP_FANTASIA: TStringField;
    qryLojas2EMP_RAZAO: TStringField;
    qryLoja: TSQLQuery;
    ppRSituacaoCaixa: TppReport;
    dsMovCaixa: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    cdsMovCaixa: TClientDataSet;
    cdsMovCaixaMCA_MODALIDADE: TStringField;
    cdsMovCaixaMCA_NATUREZA: TIntegerField;
    cdsMovCaixaMCA_OBSERVACAO: TStringField;
    cdsMovCaixaMCA_VLMODALIDADE: TCurrencyField;
    qryMovCaixa: TSQLQuery;
    cdsMovCaixaMCA_MODANOME: TStringField;
    ppDBPipeMovCaixa: TppDBPipeline;
    cdsMovCaixaMCA_TIPOMOV: TStringField;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    qryNatureza: TSQLQuery;
    cdsMovCaixaMCA_NOMENATUREZA: TStringField;
    cdsMovCaixaMCA_DESCNATU: TStringField;
    ppDBText2: TppDBText;
    lbl_NMRELA: TppLabel;
    lblCaixa: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppDBImage1: TppDBImage;
    ppDBParametros: TppDBPipeline;
    ppLine5: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    cdsMovCaixaMCA_SINAL: TStringField;
    ppDBText1: TppDBText;
    ppMmoModa: TppMemo;
    ppLabel5: TppLabel;
    MmoValor: TppMemo;
    mmoInfo: TppMemo;
    mmoDiferenca: TppMemo;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine6: TppLine;
    lblVLINICIAL: TppLabel;
    qryVLINICIAL: TSQLQuery;
    ppLine7: TppLine;
    procedure BtCancelarClick(Sender: TObject);
    procedure cmbLojaKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCAIXAChange(Sender: TObject);
    procedure dbeCAIXAEnter(Sender: TObject);
    procedure dbeCAIXAExit(Sender: TObject);
    procedure dbeCAIXAKeyPress(Sender: TObject; var Key: Char);
    procedure sbLocCaixaClick(Sender: TObject);
    procedure cmbNMLOJAExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure edtSENHAExit(Sender: TObject);
    procedure edtSENHAKeyPress(Sender: TObject; var Key: Char);
    procedure BtGravarClick(Sender: TObject);
    procedure cdsMovCaixaCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    procedure VALIDAR_CAIXA;
    procedure VALIDAR_SENHA;
    procedure SITUACAO_CAIXA;
    procedure LOJAS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSituacaoCaixa: TfrmSituacaoCaixa;
  Transacao: TTransactionDesc;
  W_CDLOJA : Integer;
  M_NRSEQU, M_QTTENT, M_NRCAIX, M_RGINIC : Integer;

implementation

uses uFuncoes, Udm, UFrmAdmin, uFrmBuscaCaixa, uDmRelatorios, udmConsulta;

{$R *.dfm}

procedure TfrmSituacaoCaixa.BtCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSituacaoCaixa.cmbLojaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Key := #0;
          dbeCAIXA.SetFocus;
     End;
end;

procedure TfrmSituacaoCaixa.dbeCAIXAChange(Sender: TObject);
begin
      If uFuncoes.Empty(dbeCAIXA.Text) Then
      Begin
          lbl_NMUSUA.Caption := '';
          edtSENHA.Clear;
      End;
end;

procedure TfrmSituacaoCaixa.dbeCAIXAEnter(Sender: TObject);
begin
     dbeCAIXA.Clear;
end;

procedure TfrmSituacaoCaixa.dbeCAIXAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeCAIXA.Text) Then
          VALIDAR_CAIXA;
end;

procedure TfrmSituacaoCaixa.dbeCAIXAKeyPress(Sender: TObject;
  var Key: Char);
begin
      If not( key in['0'..'9',#8, #13]) then
        key:=#0;
     //
     If (key = #13) and uFuncoes.Empty(dbeCAIXA.Text) Then
     Begin
          Key := #0;
          sbLocCaixaClick(Sender);
     End;
     //
     If (key = #13) and not uFuncoes.Empty(dbeCAIXA.Text) Then
     Begin
          Key := #0;
          edtSENHA.SetFocus;
     End;
end;

procedure TfrmSituacaoCaixa.SITUACAO_CAIXA;
begin
     With qryProcurar do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select * from EMPRESAS Where (EMP_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := dm.cdsCaixa.FieldByName('CAI_LOJA').AsInteger;
          Open;
     End;
     //
end;

procedure TfrmSituacaoCaixa.VALIDAR_CAIXA;
begin
     With qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA from USUARIOS');
          SQL.Add('Where (SEN_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(dbeCAIXA.Text);
          //
          Open;
     End;
     //
     If (qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de caixa não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMUSUA.Caption := '';
          dbeCAIXA.SetFocus;
          dbeCAIXA.Clear;
          Exit;
     End
     Else
     begin
          If (qryProcurar.FieldByName('SEN_FLCAIXA').AsString = 'N')
          OR uFuncoes.Empty(qryProcurar.FieldByName('SEN_FLCAIXA').AsString) Then
          Begin
               Application.MessageBox('Usuário não é caixa!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               qryProcurar.Close;
               lbl_NMUSUA.Caption := '';
               dbeCAIXA.SetFocus;
               dbeCAIXA.Clear;
               Exit;
          End;
          //
          With qryCaixa do
          Begin
               Close;
               Params.ParamByName('pLOJA').AsInteger    := StrtoInt(UFrmAdmin.M_CDLOJA);
               Params.ParamByName('pCAIXA').AsInteger   := StrtoInt(dbeCAIXA.Text);
               Params.ParamByName('pSITUACAO').AsString := 'A';
               Open;
          End;
          //
          If (qryCaixa.IsEmpty) Then
          begin
               MessageBox (Application.Handle, pChar('Caixa já está fechado para '+#13+'este operador!!!'),
                           'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
               qryCaixa.Close;
               dbeCAIXA.Clear;
               dbeCAIXA.SetFocus;
               Exit;
          End
          Else
          begin
              //
              lbl_NMUSUA.Caption := qryProcurar.FieldByName('SEN_NOME').AsString;
              M_RGINIC := qryCaixa.FieldByName('CAI_RGINICIAL').AsInteger;
              M_NRCAIX := qryCaixa.FieldByName('CAI_NUMERO').AsInteger;
              dbeCAIXA.Text := uFuncoes.StrZero(dbeCAIXA.Text,3);
              edtSENHA.SetFocus;
          End;
     End;
end;

procedure TfrmSituacaoCaixa.sbLocCaixaClick(Sender: TObject);
begin
  with TfrmBuscaCaixa.create(self) do
  try
    uFrmBuscaCaixa.W_NRFORM := 3;
    showmodal;
  finally
    If not uFuncoes.Empty(uFrmBuscaCaixa.M_CDCAIX) Then
         dbeCAIXA.Text := uFuncoes.StrZero(uFrmBuscaCaixa.M_CDCAIX,3);
    free;
    //dbeCAIXA.SetFocus;
    edtSENHA.SetFocus;
  end;
end;

procedure TfrmSituacaoCaixa.LOJAS;
begin
     With qryLojas2 do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS');
          SQL.Add('order by EMP_FANTASIA');
          Open;
          First;
     End;
     //
     While not (qryLojas2.Eof) do
     Begin
          cmbNMLOJA.Items.Add(qryLojas2.FieldByName('EMP_FANTASIA').AsString);
          //
          qryLojas2.Next;
     End;
end;

procedure TfrmSituacaoCaixa.cmbNMLOJAExit(Sender: TObject);
begin
      If not uFuncoes.Empty(cmbNMLOJA.Text) Then
      Begin
           //
           With qryLojas2 do
           Begin
                SQL.Clear;
                Close;
                SQL.Add('Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS');
                SQL.Add('Where (EMP_FANTASIA = :pFANTASIA)');
                Params.ParamByName('pFANTASIA').AsString := cmbNMLOJA.Text;
                Open;
                First;
           End;
           //
           W_CDLOJA := qryLojas2.FieldByName('EMP_CODIGO').AsInteger;
           //
           With qryLoja do
           begin
                Close;
                Params.ParamByName('pCODIGO').AsInteger := W_CDLOJA;
                //
                Open;
           End;
           //
           if qryLoja.IsEmpty then
           begin
                MessageDlg('Registro de loja não encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
                cmbNMLOJA.SetFocus;
                Exit
           end;
      End;
end;

procedure TfrmSituacaoCaixa.FormShow(Sender: TObject);
begin
     M_QTTENT := 2;
     LOJAS;
     //
     lbl_NMUSUA.Caption := '';
     cmbNMLOJA.SetFocus;
end;

procedure TfrmSituacaoCaixa.cmbNMLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Key := #0;
          dbeCAIXA.SetFocus;
     End;
end;

procedure TfrmSituacaoCaixa.VALIDAR_SENHA;
Var
    W_SNATUA : String;
begin
          If (M_QTTENT >= 0) Then
          Begin
               {edtSENHA.Text := edtSENHA.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edtSENHA.text));
               edtSENHA.Text := uFuncoes.Codifica(edtSENHA.Text);}
               W_SNATUA := edtSENHA.Text;
               W_SNATUA := W_SNATUA+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(W_SNATUA));
               W_SNATUA := uFuncoes.Codifica(W_SNATUA);
               //
               If (W_SNATUA = qryProcurar.FieldByName('SEN_SNATUA').AsString) Then
               Begin
                   //
                   If (BtGravar.CanFocus) Then
                   begin
                       edtSENHA.Text := edtSENHA.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edtSENHA.text));
                       edtSENHA.Text := uFuncoes.Codifica(edtSENHA.Text);
                       BtGravar.SetFocus;
                   End;
               End
               Else
               Begin
                   //
                   Application.MessageBox('Senha anterior não confere!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   M_QTTENT := M_QTTENT - 1;
                   edtSENHA.SetFocus;
                   edtSENHA.Clear;
                   Exit;
               End;
          End
          Else
              Close;
end;

procedure TfrmSituacaoCaixa.edtSENHAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtSENHA.Text) Then
        VALIDAR_SENHA;
end;

procedure TfrmSituacaoCaixa.edtSENHAKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key = #13) and not uFuncoes.Empty(edtSENHA.Text) Then
     Begin
          Key := #0;
          BtGravar.SetFocus;
     End;

end;

procedure TfrmSituacaoCaixa.BtGravarClick(Sender: TObject);
Var
    M_TOMODA, M_TOINFO, M_TOGERA, M_TODIFE, M_VLINIC : Real;
begin
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
          Application.MessageBox(PChar('Selecione a loja!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNMLOJA.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(dbeCAIXA.Text) Then
     Begin
          Application.MessageBox(PChar('Digite o código do operador!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeCAIXA.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtSENHA.Text) Then
     Begin
          Application.MessageBox(PChar('Digite a senha do operador!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtSENHA.SetFocus;
          Exit;
     End;
     //
     try
        Transacao.TransactionID := StrtoInt(UFrmAdmin.M_CDUSUA);
        Transacao.IsolationLevel := xilREPEATABLEREAD;
        dm.SqlAdmin.StartTransaction(Transacao);
        //
        Dm.cdsModalidade.Close;
        With dm.dstModalidades do
        Begin
            Active := False;
            CommandText := 'Select * from MODALIDADE order By MOD_CODIGO';
            Active := True;
        End;
        Dm.cdsModalidade.Open;
        Dm.cdsModalidade.First;
        //
        cdsMovCaixa.Open;
        cdsMovCaixa.EmptyDataSet;
        //
        ppMmoModa.Lines.Clear;
        MmoValor.Lines.Clear;
        mmoInfo.Lines.Clear;
        mmoDiferenca.Lines.Clear;
        //
        M_TOGERA := 0;
        M_TODIFE := 0;
        While not (Dm.cdsModalidade.Eof) do
        Begin
            M_TOMODA := 0;
            M_TOINFO := 0;
            // Movimento do caixa - DINHEIRO
            With qryMovCaixa do
            begin
               Active := False;
               Params.ParamByName('pLOJA').AsInteger  := W_CDLOJA;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
               Params.ParamByName('pCAIXA').AsInteger := StrtoInt(dbeCAIXA.Text);
               Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
               Params.ParamByName('pTIPOMOV').AsString := 'V';
               Active := True;
          End;
          //
          If not (qryMovCaixa.IsEmpty) Then
          Begin
               //
               cdsMovCaixa.Append;
               cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := qryMovCaixa.FieldByName('MCA_MODALIDADE').AsString;
               cdsMovCaixa.FieldByName('MCA_MODANOME').AsString   := Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
               cdsMovCaixa.FieldByName('MCA_NATUREZA').AsInteger  := qryMovCaixa.FieldByName('MCA_NATUREZA').AsInteger;
               cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := qryMovCaixa.FieldByName('TOTAL').AsCurrency;
               cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := 'V';
               cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := qryMovCaixa.FieldByName('MCA_OBSEVACAO').AsString;
               cdsMovCaixa.Post;
               //
               M_TOMODA := M_TOMODA + qryMovCaixa.FieldByName('TOTAL').AsCurrency;
               //
               dm.cdsMovimentoCaixa.Close;
               With dm.dstMovimentoCaixa do
               Begin
                    Active := False;
                    CommandText := 'Select * from movimento_caixa '+
                                   ' Where (MCA_MODALIDADE = :pMODALIDADE) and (MCA_LOJA = :pLOJA) '+
                                   ' AND (MCA_SEQUENCIA >= :pSEQUENCIA) AND (MCA_CAIXA = :pCAIXA) '+
                                   ' AND ((MCA_TIPOMOV = :pTIPOSAIDA) OR (MCA_TIPOMOV = :pTIPOENTRADA))';
                    Params.ParamByName('pMODALIDADE').AsString  := qryMovCaixa.FieldByName('MCA_MODALIDADE').AsString;
                    Params.ParamByName('pLOJA').AsInteger       := W_CDLOJA;
                    Params.ParamByName('pSEQUENCIA').AsInteger  := M_RGINIC;
                    Params.ParamByName('pCAIXA').AsInteger      := StrtoInt(dbeCAIXA.Text);
                    Params.ParamByName('pTIPOSAIDA').AsString   := 'S';
                    Params.ParamByName('pTIPOENTRADA').AsString := 'E';
                    //
                    Active := True;
               End;
               dm.cdsMovimentoCaixa.Open;
               //
               If not (dm.cdsMovimentoCaixa.IsEmpty) Then
               Begin
                    dm.cdsMovimentoCaixa.First;
                    //
                    While not (dm.cdsMovimentoCaixa.Eof) do
                    Begin
                         cdsMovCaixa.Append;
                         cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := dm.cdsMovimentoCaixa.FieldByName('MCA_MODALIDADE').AsString;
                         cdsMovCaixa.FieldByName('MCA_MODANOME').AsString   := Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
                         cdsMovCaixa.FieldByName('MCA_NATUREZA').AsInteger  := dm.cdsMovimentoCaixa.FieldByName('MCA_NATUREZA').AsInteger;
                         If (dm.cdsMovimentoCaixa.FieldByname('MCA_TIPOMOV').AsString = 'E') Then
                         begin
                             cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := dm.cdsMovimentoCaixa.FieldByname('MCA_VLMODALIDADE').AsCurrency;
                             M_TOMODA := M_TOMODA + dm.cdsMovimentoCaixa.FieldByname('MCA_VLMODALIDADE').AsCurrency;
                             M_TOGERA := M_TOGERA + dm.cdsMovimentoCaixa.FieldByname('MCA_VLMODALIDADE').AsCurrency;
                         End
                         Else
                         Begin
                             cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := - dm.cdsMovimentoCaixa.FieldByname('MCA_VLMODALIDADE').AsCurrency;
                             M_TOMODA := M_TOMODA - dm.cdsMovimentoCaixa.FieldByname('MCA_VLMODALIDADE').AsCurrency;
                             M_TOGERA := M_TOGERA - dm.cdsMovimentoCaixa.FieldByname('MCA_VLMODALIDADE').AsCurrency;
                         End;
                         cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := dm.cdsMovimentoCaixa.FieldByname('MCA_TIPOMOV').AsString;
                         cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := dm.cdsMovimentoCaixa.FieldByName('MCA_OBSEVACAO').AsString;
                         cdsMovCaixa.Post;
                         // Proximo
                         dm.cdsMovimentoCaixa.Next;
                    End;
                    //
               End;
          End;
          //
          With dmConsultas.qryCaixaFechar do
          Begin
               Close;
               Params.ParamByName('pNUMERO').AsInteger     := M_NRCAIX;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByname('MOD_CODIGO').AsInteger;
               Open;
          End;
          //
          If not (dmConsultas.qryCaixaFechar.IsEmpty) Then
             M_TOINFO := dmConsultas.qryCaixaFechar.FieldByname('CXF_VALOR').AsCurrency
          Else
             M_TOINFO := 0;
          //
          With ppRSituacaoCaixa do
          Begin
               ppMmoModa.Lines.Add(Dm.cdsModalidade.FieldByName('MOD_NOME').AsString);
               MmoValor.Lines.Add(FormatFloat('###,###,##0.#0',M_TOMODA));
               mmoInfo.Lines.Add(FormatFloat('###,###,##0.#0', M_TOINFO));
               mmoDiferenca.Lines.Add(FormatFloat('###,###,##0.#0',M_TOINFO-M_TOMODA));
          End;
          //
          If (M_TOINFO > 0) Then
              M_TODIFE := M_TODIFE + M_TOINFO;
          M_TOGERA := M_TOGERA + qryMovCaixa.FieldByName('TOTAL').AsCurrency;
          //
          Dm.cdsModalidade.Next;
        End;  // Fim-do-enquanto
        //
        With qryVLINICIAL do
        Begin
             Close;
             Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
             Params.ParamByName('pLOJA').AsInteger      := W_CDLOJA;
             Params.ParamByName('pCAIXA').AsInteger     := StrtoInt(dbeCAIXA.text);
             Params.ParamByName('pTIPOMOV').AsString    := 'A';
             //
             Open;
        End;
        //
        If not (qryVLINICIAL.IsEmpty) Then
            M_VLINIC := qryVLINICIAL.FieldByName('MCA_VLMODALIDADE').AsCurrency;
        //
        With ppRSituacaoCaixa do
        Begin
             lbl_NMRELA.Caption := 'RELATÓRIO : SITUAÇÃO DO CAIXA';
             lblCaixa.Caption   := 'CAIXA.....: '+lbl_NMUSUA.Caption;
             lblVLINICIAL.Caption := 'ABERTURA DO CAIXA : '+ FormatFloat('###,###,##0.#0',M_VLINIC);
             //
             ppMmoModa.Lines.Add(uFuncoes.Replicate('-',45));
             MmoValor.Lines.Add(uFuncoes.Replicate('-',30));
             mmoInfo.Lines.Add(uFuncoes.Replicate('-',30));
             mmoDiferenca.Lines.Add(uFuncoes.Replicate('-',30));
             //
             ppMmoModa.Lines.Add('TOTAL :');
             MmoValor.Lines.Add(FormatFloat('###,###,##0.#0',M_TOGERA));
             mmoDiferenca.Lines.Add(FormatFloat('###,###,##0.#0',M_TODIFE));
             //
             PrintReport;
        End;
        //
        dm.SqlAdmin.Commit(Transacao);
        //
      Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gerar relatório!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.SqlAdmin.Rollback(Transacao);
        End;
     End;
end;

procedure TfrmSituacaoCaixa.cdsMovCaixaCalcFields(DataSet: TDataSet);
begin
     If (cdsMovCaixaMCA_TIPOMOV.AsString = 'V') THEN
       cdsMovCaixaMCA_DESCNATU.AsString := 'TOTAL VENDIDO'
     Else
       cdsMovCaixaMCA_DESCNATU.AsString :=
          cdsMovCaixaMCA_NOMENATUREZA.AsString;
     //
     If (cdsMovCaixaMCA_TIPOMOV.AsString = 'V')
       or (cdsMovCaixaMCA_TIPOMOV.AsString = 'E') THEN
          cdsMovCaixaMCA_SINAL.AsString := '(+)'
     Else
          cdsMovCaixaMCA_SINAL.AsString := '(-)';
end;

procedure TfrmSituacaoCaixa.FormActivate(Sender: TObject);
begin
    dbeCAIXA.Clear;
    edtSENHA.Clear;
    lbl_NMUSUA.Caption := '';
end;

end.
