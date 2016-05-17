unit uFrmDevolucaoCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, FMTBcd, DB, SqlExpr, DBCtrls, DBXpress;

type
  TfrmDevolucaoCheque = class(TForm)
    Panel6: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label13: TLabel;
    edtCDBANC: TEdit;
    Label1: TLabel;
    edtNRAGEN: TEdit;
    Label2: TLabel;
    edtNRCONT: TEdit;
    edtNRCHEQ: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtDTDEVO: TMaskEdit;
    qryProcurar: TSQLQuery;
    lbl_NMBANC: TLabel;
    Label5: TLabel;
    dbeNRCPF: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    edtCDMOTI: TEdit;
    lbl_NMMOTI: TLabel;
    procedure BtSairClick(Sender: TObject);
    procedure edtCDBANCExit(Sender: TObject);
    procedure edtCDBANCChange(Sender: TObject);
    procedure edtNRCHEQKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRAGENExit(Sender: TObject);
    procedure edtNRCONTExit(Sender: TObject);
    procedure edtNRCHEQExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCDMOTIKeyPress(Sender: TObject; var Key: Char);
    procedure BtGravarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
  private
     procedure VALIDAR_BANCO;
     procedure VALIDAR_MOTIVO;
     procedure LIMPAR;
     procedure BUSCA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDevolucaoCheque: TfrmDevolucaoCheque;
  Transacao: TTransactionDesc;

implementation

uses uFuncoes, Udm, UFrmAdmin;

{$R *.dfm}

procedure TfrmDevolucaoCheque.BtSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmDevolucaoCheque.VALIDAR_BANCO;
begin
     With qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select BAN_CODIGO, BAN_NOME from BANCOS');
          SQL.Add('Where (BAN_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDBANC.Text,3);
          //
          Open;
     End;
     //
     If (qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de banco não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMBANC.Caption := '';
          edtCDBANC.SetFocus;
          edtCDBANC.Clear;
          Exit;
     End
     Else
     Begin
         lbl_NMBANC.Caption := qryProcurar.FieldByName('BAN_NOME').AsString;
         edtCDBANC.Text := uFuncoes.StrZero(edtCDBANC.Text,3);
         edtNRAGEN.SetFocus;
     End;
end;

procedure TfrmDevolucaoCheque.edtCDBANCExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDBANC.Text) Then
        VALIDAR_BANCO;
end;

procedure TfrmDevolucaoCheque.edtCDBANCChange(Sender: TObject);
begin
      If uFuncoes.Empty(edtCDBANC.Text) Then
      begin
           lbl_NMBANC.Caption := '';
           LIMPAR;
           dm.cdsCheques.Close;
      End;
end;

procedure TfrmDevolucaoCheque.BUSCA;
begin
  If not uFuncoes.Empty(edtNRCHEQ.Text) Then
    edtNRCHEQ.Text := uFuncoes.StrZero(edtNRCHEQ.Text,8);
  //
  dm.cdsCheques.Close;
  With dm.dstCheques do
  Begin
       Active := False;
       CommandText := 'Select * from CHEQUES Where (CHE_DOCUMENTO = :pDOCUMENTO) '+
                      'And (BAN_CODIGO = :pCODIGO) AND (CHE_AGENCIA = :pAGENCIA) '+
                      'And (CHE_CONTA = :pCONTA)';
       ParamByName('pDOCUMENTO').AsString  := edtNRCHEQ.Text;
       ParamByName('pCODIGO').AsString     := edtCDBANC.Text;
       ParamByName('pAGENCIA').AsString    := edtNRAGEN.Text;
       ParamByName('pCONTA').AsString      := edtNRCONT.Text;
       Active := True;
  End;
  dm.cdsCheques.Open;
  //
  If (dm.cdsCheques.IsEmpty) Then
  Begin
       Application.MessageBox('Registro de cheque não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       edtNRAGEN.Clear;
       edtNRCONT.Clear;
       edtNRCHEQ.Clear;
       edtCDBANC.SetFocus;
       edtCDBANC.Clear;
       Exit;
  End
  Else
  Begin
       If (dm.cdsCheques.FieldByName('CHE_SITUACAO').AsString = '2') Then
       Begin
           Application.MessageBox('2ª devolução de cheque ja realizada!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtNRAGEN.Clear;
           edtNRCONT.Clear;
           edtNRCHEQ.Clear;
           edtCDBANC.SetFocus;
           edtCDBANC.Clear;
           Exit;
       End;
       //
       If (not uFuncoes.Empty(dm.cdsCheques.FieldByName('CHE_DTDEVOLUCAO1').AsString)
         or not uFuncoes.Empty(dm.cdsCheques.FieldByName('CHE_DTDEVOLUCAO2').AsString))
         And (dm.cdsCheques.FieldByName('CHE_SITUACAO').AsString <> '*') Then
       Begin
           Application.MessageBox('Cheque não pode ser devolvido!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtNRAGEN.Clear;
           edtNRCONT.Clear;
           edtNRCHEQ.Clear;
           edtCDBANC.SetFocus;
           edtCDBANC.Clear;
           Exit;
       End;
       //
       edtCDMOTI.SetFocus;
  End;
end;

procedure TfrmDevolucaoCheque.edtNRCHEQKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (Key = #13) and not uFuncoes.Empty(edtCDBANC.Text)
      and not uFuncoes.Empty(edtNRAGEN.Text) and  not uFuncoes.Empty(edtNRCONT.Text)
      and not uFuncoes.Empty(edtNRCHEQ.Text) Then
    Begin
          Key := #0;
          //
          BUSCA;
    End;
end;

procedure TfrmDevolucaoCheque.edtNRAGENExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRAGEN.Text) Then
        edtNRAGEN.Text := uFuncoes.StrZero(edtNRAGEN.Text,5);
end;

procedure TfrmDevolucaoCheque.edtNRCONTExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRCONT.Text) Then
        edtNRCONT.Text := uFuncoes.StrZero(edtNRCONT.Text,12);
end;

procedure TfrmDevolucaoCheque.edtNRCHEQExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRCHEQ.Text) Then
        edtNRCHEQ.Text := uFuncoes.StrZero(edtNRCHEQ.Text,8);
end;

procedure TfrmDevolucaoCheque.LIMPAR;
begin
    edtNRAGEN.Clear;
    edtNRCONT.Clear;
    edtNRCHEQ.Clear;
    edtCDMOTI.Clear;
    lbl_NMMOTI.Caption := '';
end;

procedure TfrmDevolucaoCheque.FormActivate(Sender: TObject);
begin
     edtDTDEVO.Text := DatetoStr(Date);
end;

procedure TfrmDevolucaoCheque.VALIDAR_MOTIVO;
begin
     With qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select * from DEVOLUCAO ');
          SQL.Add('Where (DEV_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDMOTI.Text);
          //
          Open;
     End;
     //
     If (qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de motivo de devolução não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMMOTI.Caption := '';
          //
          BtCancelar.Enabled := False;
          BtGravar.Enabled   := False;
          edtCDMOTI.SetFocus;
          edtCDMOTI.Clear;
          Exit;
     End
     Else
     Begin
         lbl_NMMOTI.Caption := qryProcurar.FieldByName('DEV_NOME').AsString;
         edtCDMOTI.Text := uFuncoes.StrZero(edtCDMOTI.Text,2);
         //
         BtCancelar.Enabled := True;
         BtGravar.Enabled := True;
     End;
end;

procedure TfrmDevolucaoCheque.edtCDMOTIKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) Then
     Begin
          Key := #0;
          VALIDAR_MOTIVO;
     End;
end;

procedure TfrmDevolucaoCheque.BtGravarClick(Sender: TObject);
Var
    M_DTDEVO : TDate;
    M_FLSITU, M_FLRESP, M_MENSAG : String;
begin
     M_DTDEVO := Date();
     //
     Try
        Transacao.TransactionID := StrtoInt(UFrmAdmin.M_CDUSUA);
        Transacao.IsolationLevel := xilREPEATABLEREAD;
        dm.SqlAdmin.StartTransaction(Transacao);
        //
        If (dm.cdsCheques.FieldByName('CHE_SITUACAO').AsString = '*')
         or uFuncoes.Empty(dm.cdsCheques.FieldByName('CHE_SITUACAO').AsString) Then
        begin
             M_FLSITU := '1';
             M_MENSAG := 'Confirma devolução do cheque?';
        End
        Else
        begin
             M_FLSITU := '2';
             M_MENSAG := 'Cheque já devolvido !!!'+#13'Confirma 2ª devolução do cheque?';
        End;
        //
        If Application.MessageBox(PChar(M_MENSAG),
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_APPLMODAL) = idYes then
        Begin
                  dm.cdsCheques.Edit;
                  //
                  If (dm.cdsCheques.FieldByName('CHE_SITUACAO').AsString = '*')
                     or uFuncoes.Empty(dm.cdsCheques.FieldByName('CHE_SITUACAO').AsString) Then
                  begin
                       dm.cdsCheques.FieldByName('CHE_DTDEVOLUCAO1').AsDateTime := M_DTDEVO;
                       dm.cdsCheques.FieldByName('CHE_SITUACAO').AsString       := '1';
                       dm.cdsCheques.FieldByName('CHE_CDDEVOLUCAO1').AsString   := edtCDMOTI.Text;
                  End
                  Else
                  Begin
                       dm.cdsCheques.FieldByName('CHE_DTDEVOLUCAO2').AsDateTime := M_DTDEVO;
                       dm.cdsCheques.FieldByName('CHE_SITUACAO').AsString       := '2';
                       dm.cdsCheques.FieldByName('CHE_CDDEVOLUCAO2').AsString   := edtCDMOTI.Text;
                  End;
                  //
                  dm.cdsCheques.FieldByName('CHE_DTALTERACAO').AsDateTime := Date();
                  //
                  dm.cdsCheques.Post;
                  dm.cdsCheques.ApplyUpdates(0);
                  //
                  dm.cdsClientesCheques.Close;
                  With dm.dstClientesCheques do
                  begin
                       Active := False;
                       CommandText := 'Select * from CHEQUE_CLIENTES ';
                       CommandText := CommandText + 'Where (CLC_CPFCGC = :pCPFCGC)';
                       Params.ParamByName('pCPFCGC').AsString := dbeNRCPF.Text;
                       //
                       Active := True;
                  End;
                  dm.cdsClientesCheques.Open;
                  //
                  If not (dm.cdsClientesCheques.IsEmpty) Then
                  Begin
                       dm.cdsClientesCheques.Edit;
                       dm.cdsClientesCheques.FieldByName('CLC_SITUACAO').AsString := 'S';
                       dm.cdsClientesCheques.FieldByName('CLC_DTALTERACAO').AsDateTime := Date();
                       //
                       dm.cdsClientesCheques.Post;
                       dm.cdsClientesCheques.ApplyUpdates(0);
                  End;
                  //
                  Application.MessageBox('Devolução de cheque realizada!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                  //
                  BtCancelar.Enabled := False;
                  BtGravar.Enabled   := False;
                  //
                  lbl_NMBANC.Caption := '';
                  edtCDBANC.Clear; 
                  LIMPAR;
                  dm.cdsCheques.Close;
                  edtCDBANC.SetFocus; 
        End;
        dm.SqlAdmin.Commit(Transacao);
        //
      Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.SqlAdmin.Rollback(Transacao);
        End;
     End;
end;

procedure TfrmDevolucaoCheque.BtCancelarClick(Sender: TObject);
begin
     BtCancelar.Enabled := False;
     BtGravar.Enabled   := False;
     //
     lbl_NMBANC.Caption := '';
     edtCDBANC.Clear;
     LIMPAR;
     dm.cdsCheques.Close;
     edtCDBANC.SetFocus;
end;

end.

