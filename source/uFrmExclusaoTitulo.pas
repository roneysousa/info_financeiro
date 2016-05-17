unit uFrmExclusaoTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, FMTBcd, DB, SqlExpr, Buttons, DBXpress,
  DBClient, Provider;

type
  TfrmExclusaoTitulo = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    edtNRCRED: TEdit;
    edtNRPARC: TEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    edtCDCLIE: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    dbeMTEXCLU: TDBEdit;
    qryProcurar: TSQLQuery;
    DBEdit14: TDBEdit;
    Panel3: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    lbl_NMCLIE: TLabel;
    dstContasReceber: TSQLDataSet;
    dstContasReceberREC_LOJA: TIntegerField;
    dstContasReceberREC_CREDITO: TIntegerField;
    dstContasReceberREC_PARCELA: TStringField;
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
    cdsContasReceberREC_PARCELA: TStringField;
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
    dsContasReceber: TDataSource;
    DBMemo1: TDBMemo;
    edtCDLOJA: TComboBox;
    procedure edtNRPARCKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDLOJAExit(Sender: TObject);
    procedure edtNRCREDExit(Sender: TObject);
    procedure edtNRPARCExit(Sender: TObject);
    procedure edtNRPARCChange(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtNRCREDChange(Sender: TObject);
    procedure edtCDLOJAChange(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure cdsContasReceberCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRCREDKeyPress(Sender: TObject; var Key: Char);
  private
     procedure BUSCA;
     procedure VALIDAR_LOJA;
     procedure VALIDAR_CLIENTE;
     procedure LIMPAR;
     procedure LOJAS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExclusaoTitulo: TfrmExclusaoTitulo;
  Transacao: TTransactionDesc;

implementation

uses Udm, uFuncoes, UFrmAdmin, uDm2, udmConsulta;

{$R *.dfm}

{ TfrmExclusaoTitulo }

procedure TfrmExclusaoTitulo.BUSCA;
begin
    With cdsContasReceber do
    Begin
         Active := False;
         //
         Params.ParamByName('pLOJA').AsInteger      := uFuncoes.CDLOJA(edtCDLOJA.Text);
         Params.ParamByName('pNRCREDITO').AsInteger := StrtoInt(edtNRCRED.Text);
         Params.ParamByName('pPARCELA').AsString    := uFuncoes.StrZero(edtNRPARC.Text,2);
         //
         Active := True;
    End;
    //
    If (cdsContasReceber.IsEmpty) Then
    Begin
      MessageDlg('Registro de credito não encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
      edtCDLOJA.Clear;
      edtNRCRED.Clear;
      edtNRPARC.Clear;
      lbl_NMCLIE.Caption := '';
      //
      BtCancelar.Enabled := False;
      BtGravar.Enabled   := False;
      LOJAS;
      //
      if edtCDLOJA.CanFocus then
        edtCDLOJA.SetFocus;
    End
    Else
    Begin
         BtCancelar.Enabled := True;
         BtGravar.Enabled   := True;
         //
         cdsContasReceber.Edit;
         VALIDAR_CLIENTE;
         //dbeMTEXCLU.SetFocus;
    End;
end;

procedure TfrmExclusaoTitulo.edtNRPARCKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
     //
     If (Key = #13) and not ufuncoes.Empty(edtNRPARC.Text) Then
     Begin
           Key := #0;
           edtNRPARC.Text := uFuncoes.StrZero(edtNRPARC.Text,2);
           //BUSCA;
     End;
end;

procedure TfrmExclusaoTitulo.VALIDAR_LOJA;
begin
     With qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_RAZAO from EMPRESAS');
          SQL.Add('Where (EMP_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDLOJA.Text);
          //
          Open;
     End;
     //
     If (qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de loja não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtCDLOJA.SetFocus;
          edtCDLOJA.Clear;
          Exit;
     End
     Else
     Begin
         edtCDLOJA.Text := uFuncoes.StrZero(edtCDLOJA.Text,3);
     End;
end;

procedure TfrmExclusaoTitulo.edtCDLOJAExit(Sender: TObject);
begin
     If not ufuncoes.Empty(edtCDLOJA.Text) Then
        VALIDAR_LOJA;
end;

procedure TfrmExclusaoTitulo.edtNRCREDExit(Sender: TObject);
begin
     If not ufuncoes.Empty(edtNRCRED.Text) Then
         edtNRCRED.Text := uFuncoes.StrZero(edtNRCRED.Text,7);
end;

procedure TfrmExclusaoTitulo.edtNRPARCExit(Sender: TObject);
begin
     If not ufuncoes.Empty(edtNRPARC.Text) Then
     begin
         edtNRPARC.Text := uFuncoes.StrZero(edtNRPARC.Text,2);
         BUSCA;
     End;
end;

procedure TfrmExclusaoTitulo.edtNRPARCChange(Sender: TObject);
begin
     If ufuncoes.Empty(edtNRPARC.Text) Then
     begin
          cdsContasReceber.Close;
          lbl_NMCLIE.Caption := '';
          //
          BtCancelar.Enabled := False;
          BtGravar.Enabled   := False;
     End;
end;

procedure TfrmExclusaoTitulo.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmExclusaoTitulo.FormActivate(Sender: TObject);
begin
     edtCDLOJA.SetFocus;
end;

procedure TfrmExclusaoTitulo.VALIDAR_CLIENTE;
begin
     With qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select CLI_CODIGO, CLI_FANTASIA from CLIENTES');
          SQL.Add('Where (CLI_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDCLIE.Text);
          //
          Open;
     End;
     //
     If (qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de cliente não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMCLIE.Caption := '';
          Exit;
     End
     Else
     Begin
          lbl_NMCLIE.Caption := qryProcurar.FieldByName('CLI_FANTASIA').AsString;
          edtCDCLIE.Text     := uFuncoes.StrZero(edtCDCLIE.Text,7);
     End;
end;

procedure TfrmExclusaoTitulo.BtGravarClick(Sender: TObject);
begin
   If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
   Begin
     Try
        //
        Transacao.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
        Transacao.IsolationLevel := xilREPEATABLEREAD;
        dm.SqlAdmin.StartTransaction(Transacao);
        //
        cdsContasReceber.edit;
        dm2.cdsContasReceber.FieldByName('REC_SITUACAO').AsString := 'E';
        {dm2.cdsContasReceber.FieldByName('DEB_DTEXCLUSAO').AsDateTime  := Date();
        dm2.cdsContasReceber.FieldByName('DEB_FLEXCLUSAO').AsString    := 'E';
        dm2.cdsContasReceber.FieldByName('DEB_USUAEXCLUIO').AsInteger  := StrtoInt(UFrmAdmin.M_CDUSUA);
        dm2.cdsContasReceber.FieldByName('DEB_DTALTERACAO').AsDateTime := Date();}
        //
        cdsContasReceber.Post;
        cdsContasReceber.ApplyUpdates(0);
        //
        BtCancelar.Enabled := False;
        BtGravar.Enabled   := False;
        //
        cdsContasReceber.Close;
        //
        dm.SqlAdmin.Commit(Transacao);
        //
        Application.MessageBox(PChar('Registro de credito excluido!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar excluir registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.SqlAdmin.Rollback(Transacao);
           //
           cdsContasReceber.Close;
           BtCancelar.Enabled := False;
           BtGravar.Enabled   := False;
        End;
     End;
     //
   End;
end;

procedure TfrmExclusaoTitulo.edtNRCREDChange(Sender: TObject);
begin
     If ufuncoes.Empty(edtNRCRED.Text) Then
         cdsContasReceber.Close;
end;

procedure TfrmExclusaoTitulo.edtCDLOJAChange(Sender: TObject);
begin
     If ufuncoes.Empty(edtCDLOJA.Text) Then
         cdsContasReceber.Close;
end;

procedure TfrmExclusaoTitulo.BtCancelarClick(Sender: TObject);
begin
     cdsContasReceber.Cancel;
     edtCDLOJA.Clear;
     LIMPAR;
     edtCDLOJA.SetFocus;
end;

procedure TfrmExclusaoTitulo.LIMPAR;
begin
     edtNRCRED.Clear;
     edtNRPARC.Clear;
     lbl_NMCLIE.Caption := '';
     //
     BtCancelar.Enabled := False;
     BtGravar.Enabled   := False;
end;

procedure TfrmExclusaoTitulo.cdsContasReceberCalcFields(DataSet: TDataSet);
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

procedure TfrmExclusaoTitulo.LOJAS;
begin
     With dmConsultas.qryLojas2 do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS');
          SQL.Add('order by EMP_FANTASIA');
          Open;
          First;
     End;
     //
     edtCDLOJA.Clear; 
     While not (dmConsultas.qryLojas2.Eof) do
     Begin
          edtCDLOJA.Items.Add(dmConsultas.qryLojas2.FieldByName('EMP_FANTASIA').AsString);
          //
          dmConsultas.qryLojas2.Next;
     End;
end;

procedure TfrmExclusaoTitulo.FormShow(Sender: TObject);
begin
     LOJAS;
end;

procedure TfrmExclusaoTitulo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmExclusaoTitulo.edtNRCREDKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
end;

end.
