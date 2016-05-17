unit uFrmFecharCaixa2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, FMTBcd, DB, SqlExpr, DBXpress,
  DBClient, ppCtrls, ppBands, ppClass, ppStrtch, ppMemo, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe;

type
  TfrmFecharCaixa2 = class(TForm)
    pnlBotoes: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    pnlModa: TPanel;
    GridModa: TDBGrid;
    pnlCliente: TPanel;
    Label4: TLabel;
    lbl_NMUSUA: TLabel;
    sbLocCaixa: TSpeedButton;
    edtSENHA: TLabeledEdit;
    dbeCAIXA: TEdit;
    qryLoja: TSQLQuery;
    qryIncluir: TSQLQuery;
    qryLojas2: TSQLQuery;
    qryLojas2EMP_CODIGO: TIntegerField;
    qryLojas2EMP_FANTASIA: TStringField;
    qryLojas2EMP_RAZAO: TStringField;
    qryProcurar: TSQLQuery;
    qryCaixa: TSQLQuery;
    dsModalidades: TDataSource;
    cdsModalidade: TClientDataSet;
    cdsModalidadeMOD_CODIGO: TIntegerField;
    cdsModalidadeMOD_NOME: TStringField;
    cdsModalidadeMOD_PECOMISSAO: TFloatField;
    cdsModalidadeMOD_ABREVIACAO: TStringField;
    cdsModalidadeMOD_VALOR: TCurrencyField;
    qryMovCaixa: TSQLQuery;
    qryNatureza: TSQLQuery;
    qryVLINICIAL: TSQLQuery;
    cdsMovCaixa: TClientDataSet;
    cdsMovCaixaMCA_MODALIDADE: TStringField;
    cdsMovCaixaMCA_MODANOME: TStringField;
    cdsMovCaixaMCA_NATUREZA: TIntegerField;
    cdsMovCaixaMCA_OBSERVACAO: TStringField;
    cdsMovCaixaMCA_VLMODALIDADE: TCurrencyField;
    cdsMovCaixaMCA_TIPOMOV: TStringField;
    cdsMovCaixaMCA_NOMENATUREZA: TStringField;
    cdsMovCaixaMCA_DESCNATU: TStringField;
    cdsMovCaixaMCA_SINAL: TStringField;
    ppDBPipeMovCaixa: TppDBPipeline;
    ppDBParametros: TppDBPipeline;
    dsMovCaixa: TDataSource;
    ppRSituacaoCaixa: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lbl_NMRELA: TppLabel;
    lblCaixa: TppLabel;
    ppLine3: TppLine;
    ppDBImage1: TppDBImage;
    lblVLINICIAL: TppLabel;
    ppLine7: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppMmoModa: TppMemo;
    ppLabel5: TppLabel;
    MmoValor: TppMemo;
    mmoInfo: TppMemo;
    mmoDiferenca: TppMemo;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine6: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel4: TppLabel;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppLine2: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppLine4: TppLine;
    cdsModalidadeMOD_FIXA: TStringField;
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeCAIXAEnter(Sender: TObject);
    procedure dbeCAIXAChange(Sender: TObject);
    procedure dbeCAIXAExit(Sender: TObject);
    procedure dbeCAIXAKeyPress(Sender: TObject; var Key: Char);
    procedure sbLocCaixaClick(Sender: TObject);
    procedure cdsMovCaixaCalcFields(DataSet: TDataSet);
    procedure GridModaColEnter(Sender: TObject);
    procedure GridModaEnter(Sender: TObject);
    procedure GridModaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridModaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure VALIDAR_CAIXA;
    procedure LOJAS;
    procedure RELATORIO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFecharCaixa2: TfrmFecharCaixa2;
  TD : TTransactionDesc;
  M_NRSEQU, M_QTTENT, M_NRCAIX, W_CDLOJA : Integer;
  M_FLENTR, M_NMMODA, M_SNATUAL : String;
  M_VLDIGI, M_TOENTR : Real;
  M_RGINIC, M_RGFINA : Integer;
  M_FLFECH : boolean;

implementation

uses Udm, uFuncoes, UFrmAdmin, udmConsulta, uFrmSituacaoCaixa2, uFrmBuscaCaixa,
  udmDados;

{$R *.dfm}

procedure TfrmFecharCaixa2.BtCancelarClick(Sender: TObject);
begin
     If (dm.cdsCaixa.State in [dsInsert]) then
        dm.cdsCaixa.Cancel;
     //
     dm.cdsCaixa.Close;
     //
     Close;
end;

procedure TfrmFecharCaixa2.LOJAS;
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
end;

procedure TfrmFecharCaixa2.VALIDAR_CAIXA;
begin
   If (M_FLFECH = True) Then
   Begin
     With dm.cdsConsulta do  // qryProcurar
     begin
          Active := False;
          CommandText := 'Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA from USUARIOS';
          CommandText :=  CommandText + ' Where (SEN_CODIGO = :pCODIGO)';
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(dbeCAIXA.Text);
          //
          Active := True;
     End;
     //
     If (dm.cdsConsulta.IsEmpty) Then
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
          If (dm.cdsConsulta.FieldByName('SEN_FLCAIXA').AsString = 'N')
            OR uFuncoes.Empty(dm.cdsConsulta.FieldByName('SEN_FLCAIXA').AsString) Then
          Begin
               Application.MessageBox('Usuário não é caixa!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dm.cdsConsulta.Active := False;
               lbl_NMUSUA.Caption := '';
               dbeCAIXA.SetFocus;
               dbeCAIXA.Clear;
               Exit;
          End;
          //
          With qryCaixa do
          Begin
               Close;
               Params.ParamByName('pCAIXA').AsInteger   := StrtoInt(dbeCAIXA.Text);
               Params.ParamByName('pSITUACAO').AsString := 'A';
               Open;
          End;
          //
          If not (qryCaixa.IsEmpty) Then
          begin
               lbl_NMUSUA.Caption := dm.cdsConsulta.FieldByName('SEN_NOME').AsStrinG;
               M_SNATUAL          := dm.cdsConsulta.FieldByName('SEN_SNATUA').AsString;
               //
               dm.cdsCaixa.Close;
               With dm.dstCaixa do
               Begin
                    Active := False;
                    CommandText := 'Select * from CAIXA Where '+
                             '(CAI_CAIXA = :pCAIXA) AND (CAI_SITUACAO = :pSITUACAO) ';
                    Params.ParamByName('pCAIXA').AsInteger  := StrtoInt(dbeCAIXA.Text);
                    Params.ParamByName('pSITUACAO').AsString:= 'A';
                    Active := True;
               End;
               dm.cdsCaixa.Open;
               dm.cdsCaixa.Edit;
               dbeCAIXA.Text := uFuncoes.StrZero(dbeCAIXA.Text,3);
          End
          Else
          begin
               MessageBox (Application.Handle, pChar('Caixa está fechado para '+#13+'este operador!!!'),
                           'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
               qryCaixa.Close;
               dbeCAIXA.Clear;
               dbeCAIXA.SetFocus;
               Exit;
          End;
     End;
   End
   Else
   Begin
     With dm.cdsConsulta do
     begin
          Active := False;
          CommandText := 'Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA from USUARIOS' ;
          CommandText := CommandText + ' Where (SEN_CODIGO = :pCODIGO)';
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(dbeCAIXA.Text);
          //
          Active := True;
     End;
     //
     If (dm.cdsConsulta.IsEmpty) Then
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
          If (dm.cdsConsulta.FieldByName('SEN_FLCAIXA').AsString = 'N')
            OR uFuncoes.Empty(dm.cdsConsulta.FieldByName('SEN_FLCAIXA').AsString) Then
          Begin
               Application.MessageBox('Usuário não é caixa!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dm.cdsConsulta.Close;
               lbl_NMUSUA.Caption := '';
               dbeCAIXA.SetFocus;
               dbeCAIXA.Clear;
               Exit;
          End;
          //
          With qryCaixa do
          Begin
               Close;
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
              lbl_NMUSUA.Caption := dm.cdsConsulta.FieldByName('SEN_NOME').AsString;
              M_SNATUAL          := dm.cdsConsulta.FieldByName('SEN_SNATUA').AsString;
              M_RGINIC := qryCaixa.FieldByName('CAI_RGINICIAL').AsInteger;
              M_RGFINA := qryCaixa.FieldByName('CAI_RGFINAL').AsInteger;
              M_NRCAIX := qryCaixa.FieldByName('CAI_NUMERO').AsInteger;
              dbeCAIXA.Text := uFuncoes.StrZero(dbeCAIXA.Text,3);
              If (M_FLFECH = True) Then
                  edtSENHA.SetFocus
              Else
                  BtGravar.SetFocus;
          End;
     End;
   End;
end;

procedure TfrmFecharCaixa2.BtGravarClick(Sender: TObject);
Var
    M_DTMOVI : TDate;
    M_HOMOVI, M_CDMODA,  M_NMMODA, M_SNDIGI :String;
    M_CDLOJA, W_CDMODA, W_CDNATU, W_NRCAIX, W_CDCAIX : integer;
    M_VLMODA, M_TOMODA : REAL;
    M_TOINFO, M_TOGERA, M_TODIFE, M_VLINIC, M_TOTROC : Real;
    M_VLANTE, M_VLMOVI, M_VLATUA : Double;
begin
     If uFuncoes.Empty(dbeCAIXA.Text) Then
     Begin
          Application.MessageBox(PChar('Digite o código do caixa!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeCAIXA.SetFocus;
          Exit;
     End;
     //
     If (Caption <> 'Movimento do Caixa') then
     begin
       dm.RefreshCDS(Dm.CdsConfig);
       If (Dm.CdsConfigCFG_FLFECHAR_ORCAMENTO.AsString = 'S') Then
         begin
            dm.RefreshCDS(dmDados.cdsPrevendasAbertas);
            //
            If not (dmDados.cdsPrevendasAbertas.IsEmpty) Then
              begin
                   Application.MessageBox(PChar('Existe pre-vendas abertas.'+#13+'Você deve fecha-lá primero !'),
                      'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                   Exit;
              End;
       End;
     End;
     //
     M_SNDIGI := PasswordInputBox('Senha','Digite sua senha:');
     M_SNDIGI := M_SNDIGI+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(M_SNDIGI));
     M_SNDIGI := uFuncoes.Codifica(M_SNDIGI);
     //
     if M_SNDIGI <> M_SNATUAL then
     Begin
          Application.MessageBox('Senha incorreta!!!',
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          Exit;
     End;
     //
  If (M_FLFECH = TRUE) Then
  Begin
     cdsModalidade.First;
     cdsModalidade.DisableControls;
     //
     M_TOENTR := 0;
     While not (cdsModalidade.Eof) do
     begin
          cdsModalidade.Edit;
          M_TOENTR := M_TOENTR+cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
          // proximo
          cdsModalidade.Next;
     End;
     //
     cdsModalidade.EnableControls;
     //
     If (M_TOENTR <= 0) Then
     begin
          Application.MessageBox('O total das modalidade é menor '+#13
                                  +'ou igual a zero!!!','ATENÇÃO', MB_OK+MB_ICONSTOP);
          cdsModalidade.First;
          GridModa.SetFocus;
          exit;                     // sair da procedure.
     End;
  End;
  //
         dm.cdsCaixa.Close;
         With dm.dstCaixa do
         Begin
               Active := False;
               CommandText := 'Select * from CAIXA Where (CAI_CAIXA = :pCAIXA) and (CAI_SITUACAO = :pSITUACAO)';
               Params.ParamByName('pCAIXA').AsInteger   := StrtoInt(dbeCAIXA.Text);
               Params.ParamByName('pSITUACAO').AsString := 'A';
               Active := True;
         End;
         dm.cdsCaixa.Open;
         //
         If (dm.cdsCaixa.IsEmpty) Then
         Begin
              Application.MessageBox('Caixa já está fechado para este operador!!!'+#13
                 ,'ATENÇÃO', MB_OK+MB_ICONSTOP);
              dbeCAIXA.Clear;
              dbeCAIXA.SetFocus;
              Exit;
         End
         Else
            W_CDLOJA := dm.cdsCaixaCAI_LOJA.AsInteger;
     //
     If (M_FLFECH = True) Then
     Begin
      //Dm.Start;
      // Inicia um transação no BD
      TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
      TD.IsolationLevel := xilREADCOMMITTED;
      Dm.SqlAdmin.StartTransaction(TD);
      //
      try
         //
         M_DTMOVI := Date();
         M_HOMOVI := TimetoStr(Time);
         //
         dm.RefreshCDS(Dm.CdsConfig);
         dm.CdsConfig.Edit;
         dm.CdsConfigCFG_SEQUENCIA.Value := dm.CdsConfigCFG_SEQUENCIA.Value+1;
         Dm.CdsConfigCFG_TELEENTEGA.AsInteger := 0;
         M_NRSEQU := dm.CdsConfigCFG_SEQUENCIA.AsInteger;
         dm.CdsConfig.Post;
         dm.CdsConfig.ApplyUpdates(0);
         // TABELA DE CAIXA
         dm.cdsCaixa.Edit;
         dm.cdsCaixaCAI_RGFINAL.AsInteger       := M_NRSEQU;
         dm.cdsCaixaCAI_DTFECHAMENTO.AsDateTime := M_DTMOVI;
         dm.cdsCaixaCAI_HOFECHAMENTO.AsString   := M_HOMOVI;
         dm.cdsCaixaCAI_SITUACAO.AsString       := 'F';
         W_CDLOJA := dm.cdsCaixaCAI_LOJA.AsInteger;
         W_NRCAIX := Dm.cdsCaixaCAI_NUMERO.AsInteger;
         W_CDCAIX := Dm.cdsCaixaCAI_CAIXA.AsInteger;
         dm.cdsCaixa.Post;
         dm.cdsCaixa.ApplyUpdates(0);
         //
         // Nova alteração   incluir registro o Caixa Geral
         If not (dmConsultas.GetNatureza('FECHAMENTO DE CAIXA')) Then
            Dm.Incluir_Natureza('FECHAMENTO DE CAIXA', '2');
         //   TABELA DETALHE DE CAIXA
         cdsModalidade.First;
         cdsModalidade.DisableControls;
         //
         M_TOMODA := 0;
         While not (cdsModalidade.Eof) do
         begin
              cdsModalidade.Edit;
              M_CDMODA := cdsModalidade.FieldByName('MOD_CODIGO').AsString;
              M_NMMODA := cdsModalidade.FieldByName('MOD_NOME').AsString;
              M_VLMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
              M_TOMODA := M_TOMODA + cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
              //
              If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
              Begin
                  With qryIncluir do
                  //With dmDados.cdsAux do
                  Begin
                       Close;
                       Params.ParamByName('pNUMERO').AsInteger     := dm.cdsCaixaCAI_NUMERO.AsInteger;
                       Params.ParamByName('pMODALIDADE').AsInteger := cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
                       Params.ParamByName('pVALOR').AsCurrency     := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                       //
                       ExecSQL;
                  End;
                  //
                      Dm.RefreshCDS(Dm.CdsConfig);
                      W_CDMODA := dmDados.GetModaRecebimento(StrtoInt(M_CDMODA));
                      M_VLANTE := dmDados.GetValorAtual(W_CDMODA);
                      M_VLMOVI := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                      W_CDNATU := dmConsultas.GetNaturezaCogigo('FECHAMENTO DE CAIXA');
                      //
                      dmDados.SetSaldoConta(W_CDMODA,M_VLMOVI,'E');
                      //
                      M_VLATUA := dmDados.GetValorAtual(W_CDMODA);
                      //
                      dmDados.Incluir_Movimento_Contas(W_CDLOJA, StrtoInt(dbeCAIXA.Text),
                         W_CDMODA, W_CDNATU, 0, 0,
                         M_VLANTE, M_VLMOVI, M_VLATUA,
                         InttoStr(W_NRCAIX),
                         'E', Copy(M_HOMOVI,1,5), 'FECHAMENTO DE CAIXA', '', '', M_DTMOVI);
              End;
              // proximo
              cdsModalidade.Next;
         End;  // fim-do-enquanto
         //
         cdsModalidade.EnableControls;
         // TABELA MOVIMENTO DE CAIXA
         dm.cdsMovimentoCaixa.Close;
         With dm.dstMovimentoCaixa do
         Begin
              Active := False;
              CommandText := 'Select * from MOVIMENTO_CAIXA '+
                                  'Where (MCA_SEQUENCIA = :pSEQUENCIA) and (MCA_LOJA = :pLOJA)';
              Params.ParamByName('pSEQUENCIA').AsInteger := M_NRSEQU;
              Params.ParamByName('pLOJA').AsInteger      := W_CDLOJA;
              Active := True;
         End;
         dm.cdsMovimentoCaixa.Open;
         //
         With dm.cdsMovimentoCaixa do
         Begin
              Append;
              FieldByName('MCA_SEQUENCIA').AsInteger := M_NRSEQU;
              FieldByName('MCA_LOJA').AsInteger      := W_CDLOJA;
              FieldByName('MCA_TIPOMOV').AsString    := 'F';
              FieldByName('MCA_DTMOVIMENTO').AsDateTime := M_DTMOVI;
              FieldByName('MCA_HRMOVIMENTO').AsString   := M_HOMOVI;
              FieldByName('MCA_SITUACAO').AsString   := 'N';
              FieldByName('MCA_CAIXA').AsInteger     := Strtoint(dbeCAIXA.Text);
              FieldByName('MCA_OBSEVACAO').AsString  := 'FECHAMENTO DE CAIXA';
              Post;
              ApplyUpdates(0);
         End;
         //
         Application.MessageBox('Fechamento concluído com sucesso!!!','ATENÇÃO',
            MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         //
         dm.SqlAdmin.Commit(TD);
         // Nova alteração 04/01/2010 - impressão de cupom
         // CupomFechamentoCaixa(iNumCaixa, iLoja, iCaixa : Integer) : Boolean;
         dm.RefreshCDS(Dm.CdsConfig);
         //
         If (Dm.CdsConfigCFG_FLMATRICIAL.AsString = 'S') Then
              uFuncoes.CupomFechamentoCaixa(W_NRCAIX, W_CDLOJA, W_CDCAIX);
         //
         Close;
         //
        Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar fechar caixa!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.SqlAdmin.Rollback(TD);
           //Dm.Rollback;
        End;
       End;
     End
     Else
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
            // Movimento do caixa -
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
          If not (qryMovCaixa.IsEmpty) Then  //
          Begin
               //
               cdsMovCaixa.Append;
               cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
               cdsMovCaixa.FieldByName('MCA_MODANOME').AsString   := Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
               cdsMovCaixa.FieldByName('MCA_NATUREZA').AsInteger  := qryMovCaixa.FieldByName('MCA_NATUREZA').AsInteger;
               If (Dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString = 'D') Then
               begin
                   cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency :=
                       qryMovCaixa.FieldByName('TOTAL').AsCurrency - qryMovCaixa.FieldByName('MCA_TOTROCO').AsCurrency;
                   M_TOMODA := M_TOMODA + (qryMovCaixa.FieldByName('TOTAL').AsCurrency - qryMovCaixa.FieldByName('MCA_TOTROCO').AsCurrency);
                   M_TOTROC := qryMovCaixa.FieldByName('MCA_TOTROCO').AsCurrency;
                  //
               End
               Else
               Begin
                   cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := qryMovCaixa.FieldByName('TOTAL').AsCurrency;
                   M_TOMODA := M_TOMODA + qryMovCaixa.FieldByName('TOTAL').AsCurrency;
                   M_TOTROC := 0;
                  //
               End;
               cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := 'V';
               cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := qryMovCaixa.FieldByName('MCA_OBSEVACAO').AsString;
               cdsMovCaixa.Post;
          End;
            // Movimento do caixa - Conta a Paga
            //With qryMovCaixa do
            With dm.cdsConsulta do
            begin
               Active := False;
               CommandText := ' Select MCA_MODALIDADE, MCA_NATUREZA, MCA_OBSEVACAO, ';
               CommandText := CommandText + ' Sum(MCA_VLMODALIDADE) AS TOTAL, ';
               CommandText := CommandText + ' Sum(MCA_VLTROCO) AS MCA_TOTROCO from movimento_caixa ';
               CommandText := CommandText + ' Where (MCA_MODALIDADE = :pMODALIDADE) and (MCA_LOJA = :pLOJA) ';
               CommandText := CommandText + ' AND (MCA_SEQUENCIA >= :pSEQUENCIA) AND (MCA_CAIXA = :pCAIXA) ';
               CommandText := CommandText + ' AND (MCA_TIPOMOV = :pTIPOMOV) ';
               CommandText := CommandText + ' Group by MCA_MODALIDADE, MCA_NATUREZA, MCA_OBSEVACAO ';

               Params.ParamByName('pLOJA').AsInteger  := W_CDLOJA;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
               Params.ParamByName('pCAIXA').AsInteger := StrtoInt(dbeCAIXA.Text);
               Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
               Params.ParamByName('pTIPOMOV').AsString := 'P';
               Active := True;
          End;
          //
          //If not (qryMovCaixa.IsEmpty) Then
          If not (dm.cdsConsulta.IsEmpty) Then
          Begin
               //
               cdsMovCaixa.Append;
               cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
               cdsMovCaixa.FieldByName('MCA_MODANOME').AsString   := Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
               cdsMovCaixa.FieldByName('MCA_NATUREZA').AsInteger  := dm.cdsConsulta.FieldByName('MCA_NATUREZA').AsInteger;
               If (Dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString = 'D') Then
               begin
                   cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency :=
                       dm.cdsConsulta.FieldByName('TOTAL').AsCurrency - dm.cdsConsulta.FieldByName('MCA_TOTROCO').AsCurrency;
                   M_TOMODA := M_TOMODA + (dm.cdsConsulta.FieldByName('TOTAL').AsCurrency - dm.cdsConsulta.FieldByName('MCA_TOTROCO').AsCurrency);
                   M_TOTROC := dm.cdsConsulta.FieldByName('MCA_TOTROCO').AsCurrency;
                  //
               End
               Else
               Begin
                   cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := dm.cdsConsulta.FieldByName('TOTAL').AsCurrency;
                   M_TOMODA := M_TOMODA + dm.cdsConsulta.FieldByName('TOTAL').AsCurrency;
                   M_TOTROC := 0;
                  //
               End;
               cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := 'P';
               cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := dm.cdsConsulta.FieldByName('MCA_OBSEVACAO').AsString;
               cdsMovCaixa.Post;
          End;
          //
               dm.cdsMovimentoCaixa.Close;
               With dm.dstMovimentoCaixa do
               Begin
                    Active := False;
                    CommandText := 'Select * from movimento_caixa '+
                                   ' Where (MCA_MODALIDADE = :pMODALIDADE) and (MCA_LOJA = :pLOJA) '+
                                   ' AND (MCA_SEQUENCIA >= :pSEQUENCIA) AND (MCA_CAIXA = :pCAIXA) '+
                                   ' AND ((MCA_TIPOMOV = :pTIPOSAIDA) OR (MCA_TIPOMOV = :pTIPOENTRADA))';
                    Params.ParamByName('pMODALIDADE').AsString  := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
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
                         cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
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
        //
        If (M_FLFECH = True) Then
        Begin
          With dmConsultas.cdsCaixaFechar do
          Begin
               Close;
               Params.ParamByName('pNUMERO').AsInteger     := M_NRCAIX;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByname('MOD_CODIGO').AsInteger;
               Open;
          End;
          //
          If not (dmConsultas.cdsCaixaFechar.IsEmpty) Then
             M_TOINFO := dmConsultas.cdsCaixaFechar.FieldByname('CXF_VALOR').AsCurrency
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
         End;
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
        If (M_FLFECH = False) Then
        Begin
          with TfrmSituacaoCaixa2.create(self) do
          try
             lbl_caixa.Caption    := lbl_NMUSUA.Caption;
             lbl_VLINICAL.Caption := FormatFloat('###,###,##0.#0',M_VLINIC);
             showmodal;
          finally
             free;
          end;
       End;
       {Else
       Begin
        //
        With ppRSituacaoCaixa do
        Begin
             lbl_NMRELA.Caption := 'RELATÓRIO : SITUAÇÃO DO CAIXA';
             lblCaixa.Caption   := 'CAIXA.....:  '+lbl_NMUSUA.Caption;
             lblVLINICIAL.Caption := 'ABERTURA DO CAIXA : '+ FormatFloat('###,###,##0.#0',M_VLINIC);
             //
             ppMmoModa.Lines.Add(uFuncoes.Replicate('-',45));
             MmoValor.Lines.Add(uFuncoes.Replicate('-',30));
             mmoInfo.Lines.Add(uFuncoes.Replicate('-',30));
             mmoDiferenca.Lines.Add(uFuncoes.Replicate('-',30));
             //
             ppMmoModa.Lines.Add('TOTAL :');
             MmoValor.Lines.Add(FormatFloat('###,###,##0.#0',M_TOGERA - M_TOTROC));
             mmoDiferenca.Lines.Add(FormatFloat('###,###,##0.#0', (M_TOGERA - M_TOTROC) - M_TODIFE));
             //
             PrintReport;
             //
             Close;
        End;}
       //End;
    //End;
end;

procedure TfrmFecharCaixa2.FormCreate(Sender: TObject);
begin
     dm.cdsCaixa.Close;
end;

procedure TfrmFecharCaixa2.FormShow(Sender: TObject);
begin
   lbl_NMUSUA.Caption := '';
   //
   If (M_FLFECH = True) Then
   Begin
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
     cdsModalidade.Open;
     While not (Dm.cdsModalidade.Eof) do
     Begin
          cdsModalidade.Append;
          cdsModalidade.FieldByName('MOD_CODIGO').AsInteger :=
             Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
          cdsModalidade.FieldByName('MOD_NOME').AsString      :=
             Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
          cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat :=
             Dm.cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat;
          cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString :=
             Dm.cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString;
          cdsModalidade.FieldByName('MOD_VALOR').AsCurrency := 0;
          cdsModalidade.FieldByName('MOD_FIXA').AsString    :=
              DM.cdsModalidade.FieldByName('MOD_FLFIXA').AsString;
          cdsModalidade.Post;
          // Proximo
          Dm.cdsModalidade.Next;
     End;
     //
     cdsModalidade.First;
   End
   Else
   Begin
        pnlModa.Visible  := False;
        pnlCliente.Align := alClient;
   End;
   //
   LOJAS;
   dbecaixa.SetFocus;     
   //
end;

procedure TfrmFecharCaixa2.RELATORIO;
Var
    M_TOMODA, M_TOINFO, M_TOGERA, M_TODIFE, M_VLINIC : Real;
begin
     //
     If uFuncoes.Empty(dbeCAIXA.Text) Then
     Begin
          Application.MessageBox(PChar('Digite o código do operador!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeCAIXA.SetFocus;
          Exit;
     End;
     //
     {If uFuncoes.Empty(edtSENHA.Text) Then
     Begin
          Application.MessageBox(PChar('Digite a senha do operador!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtSENHA.SetFocus;
          Exit;
     End;}
     //
     try
        TD.TransactionID := StrtoInt(UFrmAdmin.M_CDUSUA);
        TD.IsolationLevel := xilREPEATABLEREAD;
        dm.SqlAdmin.StartTransaction(TD);
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
            // Movimento do caixa
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
          If not (qryMovCaixa.IsEmpty) Then  ///
          Begin
               //
               cdsMovCaixa.Append;
               cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := qryMovCaixa.FieldByName('MCA_MODALIDADE').AsString;
               cdsMovCaixa.FieldByName('MCA_MODANOME').AsString   := Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
               cdsMovCaixa.FieldByName('MCA_NATUREZA').AsInteger  := qryMovCaixa.FieldByName('MCA_NATUREZA').AsInteger;
               If (Dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString = 'D') Then
                   cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency :=
                       qryMovCaixa.FieldByName('TOTAL').AsCurrency - qryMovCaixa.FieldByName('MCA_TOTROCO').AsCurrency
               Else
                   cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := qryMovCaixa.FieldByName('TOTAL').AsCurrency;
               cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := 'V';
               cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := qryMovCaixa.FieldByName('MCA_OBSEVACAO').AsString;
               cdsMovCaixa.Post;
               //cdsMovCaixa.ApplyUpdates(0);
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
                         //cdsMovCaixa.ApplyUpdates(0);
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
          M_TOINFO := 0;
          //
          If not (dmConsultas.qryCaixaFechar.IsEmpty) Then
             M_TOINFO := dmConsultas.qryCaixaFechar.FieldByname('CXF_VALOR').AsCurrency;
          //
          With ppRSituacaoCaixa do
          Begin
               ppMmoModa.Lines.Add(Dm.cdsModalidade.FieldByName('MOD_NOME').AsString);
               MmoValor.Lines.Add(FormatFloat('###,###,##0.#0',M_TOMODA));
               If (M_TOINFO > 0) Then
               Begin
                   mmoInfo.Lines.Add(FormatFloat('###,###,##0.#0', M_TOINFO));
                   mmoDiferenca.Lines.Add(FormatFloat('###,###,##0.#0',M_TOINFO-M_TOMODA));
               End
               Else
               Begin
                   mmoInfo.Lines.Add(uFuncoes.Replicate(' ',15));
                   mmoDiferenca.Lines.Add(uFuncoes.Replicate(' ',15));
               End;
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
             lblCaixa.Caption   := 'CAIXA.....:  '+lbl_NMUSUA.Caption;
             lblVLINICIAL.Caption := 'ABERTURA DO CAIXA : '+ FormatFloat('###,###,##0.#0',M_VLINIC);
             //
             ppMmoModa.Lines.Add(uFuncoes.Replicate('-',45));
             MmoValor.Lines.Add(uFuncoes.Replicate('-',30));
             mmoInfo.Lines.Add(uFuncoes.Replicate('-',30));
             mmoDiferenca.Lines.Add(uFuncoes.Replicate('-',30));
             //
             ppMmoModa.Lines.Add('TOTAL :');
             MmoValor.Lines.Add(FormatFloat('###,###,##0.#0',M_TOGERA));
             mmoDiferenca.Lines.Add(FormatFloat('###,###,##0.#0', M_TOGERA - M_TODIFE));
             //
             PrintReport;
        End;
        //
        dm.SqlAdmin.Commit(TD);
        //
      Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gerar relatório!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.SqlAdmin.Rollback(TD);
        End;
     End;
end;



procedure TfrmFecharCaixa2.dbeCAIXAEnter(Sender: TObject);
begin
     dbeCAIXA.Clear;
end;

procedure TfrmFecharCaixa2.dbeCAIXAChange(Sender: TObject);
begin
      If uFuncoes.Empty(dbeCAIXA.Text) Then
      Begin
          lbl_NMUSUA.Caption := '';
          dm.cdsCaixa.Close;  
          edtSENHA.Clear;
      End;
end;

procedure TfrmFecharCaixa2.dbeCAIXAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeCAIXA.Text) Then
          VALIDAR_CAIXA;
end;

procedure TfrmFecharCaixa2.dbeCAIXAKeyPress(Sender: TObject;
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
          If (M_FLFECH = True) Then
             GridModa.SetFocus
          Else
             BtGravar.SetFocus; 
     End;
end;

procedure TfrmFecharCaixa2.sbLocCaixaClick(Sender: TObject);
begin
  with TfrmBuscaCaixa.create(self) do
  try
    uFrmBuscaCaixa.W_NRFORM := 2;
    showmodal;
  finally
    If not uFuncoes.Empty(uFrmBuscaCaixa.M_CDCAIX) Then
         dbeCAIXA.Text := uFuncoes.StrZero(uFrmBuscaCaixa.M_CDCAIX,3);
    free;
  end;
end;

procedure TfrmFecharCaixa2.cdsMovCaixaCalcFields(DataSet: TDataSet);
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

procedure TfrmFecharCaixa2.GridModaColEnter(Sender: TObject);
begin
     GridModa.SelectedIndex:=1;
     //
     If (uFuncoes.Empty(cdsModalidade.FieldByName('MOD_NOME').AsString)) Then
           cdsModalidade.Delete;
end;

procedure TfrmFecharCaixa2.GridModaEnter(Sender: TObject);
begin
     GridModa.SelectedIndex:=1; { Vai para a 2ª coluna }
end;

procedure TfrmFecharCaixa2.GridModaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     //
     If (key = vk_Escape) Then
       btCancelar.SetFocus;
     //
     If (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
     //
     case key of
        13 : Key := 9;
     end;
end;

procedure TfrmFecharCaixa2.GridModaKeyPress(Sender: TObject;
  var Key: Char);
begin
      If (key = #13) and (cdsModalidade.Eof) Then
      Begin
           Key := #0;
           If (M_FLFECH = True) Then
               BtGravar.SetFocus;
      End;
end;

end.
