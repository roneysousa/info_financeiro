unit uFrmFecharCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, DBCtrls, ExtCtrls, DBXpress,
  DB, FMTBcd, SqlExpr, Grids, DBGrids, DBClient;

type
  TfrmFechamentoCaixa = class(TForm)
    pnlCliente: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    lbl_NMUSUA: TLabel;
    sbLocCaixa: TSpeedButton;
    edtSENHA: TLabeledEdit;
    dbeCAIXA: TEdit;
    pnlBotoes: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    pnlModa: TPanel;
    qryCaixa: TSQLQuery;
    qryProcurar: TSQLQuery;
    cdsModalidade: TClientDataSet;
    cdsModalidadeMOD_CODIGO: TIntegerField;
    cdsModalidadeMOD_NOME: TStringField;
    cdsModalidadeMOD_PECOMISSAO: TFloatField;
    cdsModalidadeMOD_ABREVIACAO: TStringField;
    cdsModalidadeMOD_VALOR: TCurrencyField;
    dsModalidades: TDataSource;
    GridModa: TDBGrid;
    qryIncluir: TSQLQuery;
    qryLojas2: TSQLQuery;
    qryLojas2EMP_CODIGO: TIntegerField;
    qryLojas2EMP_FANTASIA: TStringField;
    qryLojas2EMP_RAZAO: TStringField;
    cmbNMLOJA: TComboBox;
    qryLoja: TSQLQuery;
    procedure BtCancelarClick(Sender: TObject);
    procedure dbeCAIXAChange(Sender: TObject);
    procedure dbeCAIXAKeyPress(Sender: TObject; var Key: Char);
    procedure sbLocCaixaClick(Sender: TObject);
    procedure dbeCAIXAExit(Sender: TObject);
    procedure dbeCAIXAEnter(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridModaColEnter(Sender: TObject);
    procedure GridModaEnter(Sender: TObject);
    procedure GridModaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNMLOJAExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridModaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure VALIDAR_CAIXA;
    procedure LOJAS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechamentoCaixa: TfrmFechamentoCaixa;
  TD : TTransactionDesc;
  M_NRSEQU, M_QTTENT, M_NRCAIX, W_CDLOJA : Integer;
  M_FLENTR, M_NMMODA : String;
  M_VLDIGI, M_TOENTR : Real;

implementation

uses Udm, uFuncoes, UFrmAdmin, uFrmBuscaCaixa;

{$R *.dfm}

procedure TfrmFechamentoCaixa.BtCancelarClick(Sender: TObject);
begin
     If (dm.cdsCaixa.State in [dsInsert]) then
        dm.cdsCaixa.Cancel;
     //
     dm.cdsCaixa.Close;
     //
     Close;
end;

procedure TfrmFechamentoCaixa.dbeCAIXAChange(Sender: TObject);
begin
      If uFuncoes.Empty(dbeCAIXA.Text) Then
      Begin
          lbl_NMUSUA.Caption := '';
          dm.cdsCaixa.Close;  
          edtSENHA.Clear;
      End;
end;

procedure TfrmFechamentoCaixa.dbeCAIXAKeyPress(Sender: TObject;
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
          GridModa.SetFocus;
     End;

end;

procedure TfrmFechamentoCaixa.sbLocCaixaClick(Sender: TObject);
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

procedure TfrmFechamentoCaixa.dbeCAIXAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeCAIXA.Text) Then
          VALIDAR_CAIXA;
end;

procedure TfrmFechamentoCaixa.dbeCAIXAEnter(Sender: TObject);
begin
     dbeCAIXA.Clear;
end;

procedure TfrmFechamentoCaixa.VALIDAR_CAIXA;
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
               Params.ParamByName('pLOJA').AsInteger    := W_CDLOJA;
               //StrtoInt(UFrmAdmin.M_CDLOJA);
               Params.ParamByName('pCAIXA').AsInteger   := StrtoInt(dbeCAIXA.Text);
               Params.ParamByName('pSITUACAO').AsString := 'A';
               Open;
          End;
          //
          If not (qryCaixa.IsEmpty) Then
          begin
               lbl_NMUSUA.Caption := qryProcurar.FieldByName('SEN_NOME').AsStrinG;
               //
               dm.cdsCaixa.Close;
               With dm.dstCaixa do
               Begin
                    Active := False;
                    CommandText := 'Select * from CAIXA Where (CAI_LOJA = :pLOJA) '+
                             'and (CAI_CAIXA = :pCAIXA) AND (CAI_SITUACAO = :pSITUACAO) ';
                    Params.ParamByName('pLOJA').AsInteger   := W_CDLOJA;
                    //StrtoInt(UFrmAdmin.M_CDLOJA);
                    Params.ParamByName('pCAIXA').AsInteger  := StrtoInt(dbeCAIXA.Text);
                    Params.ParamByName('pSITUACAO').AsString:= 'A';
                    Active := True;
               End;
               dm.cdsCaixa.Open;
               dm.cdsCaixa.Edit;
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

end;

procedure TfrmFechamentoCaixa.BtGravarClick(Sender: TObject);
Var
    M_DTMOVI : TDate;
    M_HOMOVI, M_CDMODA, M_NMMODA :String;
    M_CDLOJA : integer;
    M_VLMODA, M_TOMODA : REAL;
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
          Application.MessageBox(PChar('Digite o código do caixa!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeCAIXA.SetFocus;
          Exit;
     End;
     //
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
     //                        M_VLVEND
     If (M_TOENTR <= 0) Then
     begin
          Application.MessageBox('O total das modalidade é menor '+#13
                                  +'ou igual a zero!!!','ATENÇÃO', MB_OK+MB_ICONSTOP);
          cdsModalidade.First;
          GridModa.SetFocus;
          exit;                     // sair da procedure.
     End;
     //
     try
         // Inicia um transação no BD
         TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
         TD.IsolationLevel := xilREADCOMMITTED;
         Dm.SqlAdmin.StartTransaction(TD);
         //
         M_DTMOVI := Date();
         M_HOMOVI := TimetoStr(Time);
         //M_CDLOJA := StrtoInt(UFrmAdmin.M_CDLOJA);
         //
         dm.parametros;
         dm.CdsConfig.Edit;
         dm.CdsConfigCFG_SEQUENCIA.Value := dm.CdsConfigCFG_SEQUENCIA.Value+1;
         M_NRSEQU := dm.CdsConfigCFG_SEQUENCIA.AsInteger;
         dm.CdsConfig.Post;
         dm.CdsConfig.ApplyUpdates(0);
         // TABELA DE CAIXA
         dm.cdsCaixaCAI_RGFINAL.AsInteger       := M_NRSEQU;
         dm.cdsCaixaCAI_DTFECHAMENTO.AsDateTime := M_DTMOVI;
         dm.cdsCaixaCAI_HOFECHAMENTO.AsString   := M_HOMOVI;
         dm.cdsCaixaCAI_SITUACAO.AsString       := 'F';
         dm.cdsCaixa.Post;
         dm.cdsCaixa.ApplyUpdates(0);
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
                  Begin
                       Close;
                       Params.ParamByName('pNUMERO').AsInteger     := dm.cdsCaixaCAI_NUMERO.AsInteger;
                       Params.ParamByName('pMODALIDADE').AsInteger := cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
                       Params.ParamByName('pVALOR').AsCurrency     := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                       //
                       ExecSQL;
                  End;
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
              //FieldByName('MCA_NATUREZA').AsInteger  := M_CDNATU;
              Post;
              ApplyUpdates(0);
         End;
         //
         Application.MessageBox('Fechamento concluído com sucesso!!!','ATENÇÃO',
            MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         // Grava
         Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
         //
         Close;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar fechar caixa!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
              //
             Close;
        End;
     End;
end;

procedure TfrmFechamentoCaixa.FormShow(Sender: TObject);
begin
     lbl_NMUSUA.Caption := '';
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
          cdsModalidade.Post;
          // Proximo
          Dm.cdsModalidade.Next;
     End;
     //
     cdsModalidade.First;
     //
     LOJAS;
     //
     cmbNMLOJA.SetFocus;
end;

procedure TfrmFechamentoCaixa.GridModaColEnter(Sender: TObject);
begin
     GridModa.SelectedIndex:=1;
     //
     If (uFuncoes.Empty(cdsModalidade.FieldByName('MOD_NOME').AsString)) Then
           cdsModalidade.Delete;
end;

procedure TfrmFechamentoCaixa.GridModaEnter(Sender: TObject);
begin
     GridModa.SelectedIndex:=1; { Vai para a 3a coluna }
end;

procedure TfrmFechamentoCaixa.GridModaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
     //
end;

procedure TfrmFechamentoCaixa.LOJAS;
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

procedure TfrmFechamentoCaixa.cmbNMLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text)  Then
     Begin
          Key := #0;
          dbeCAIXA.SetFocus;
     End;
end;

procedure TfrmFechamentoCaixa.cmbNMLOJAExit(Sender: TObject);
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

procedure TfrmFechamentoCaixa.FormCreate(Sender: TObject);
begin
     dm.cdsCaixa.Close; 
end;

procedure TfrmFechamentoCaixa.GridModaKeyPress(Sender: TObject;
  var Key: Char);
begin
      If (key = #13) and (cdsModalidade.Eof) Then
      Begin
           Key := #0;
           BtGravar.SetFocus; 
      End;
end;

end.
