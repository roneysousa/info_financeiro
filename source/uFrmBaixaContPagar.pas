unit uFrmBaixaContPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, ToolEdit, CurrEdit, DBXpress, DB;

type
  TfrmBaixaContPagar = class(TForm)
    pnlDados: TPanel;
    Panel2: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    cmbLoja: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    edtTOTCOMPRA: TCurrencyEdit;
    Label10: TLabel;
    dbeVLPARC: TDBEdit;
    Label11: TLabel;
    dbeVLDESC: TDBEdit;
    Label12: TLabel;
    dbeVLPAGO: TDBEdit;
    Label13: TLabel;
    dbeVLJURO: TDBEdit;
    Label14: TLabel;
    dbeDTPAGA: TDBEdit;
    Label15: TLabel;
    cmbModalidade: TDBLookupComboBox;
    DBText1: TDBText;
    txtNRCOMPRA: TDBText;
    Label16: TLabel;
    procedure BtSairClick(Sender: TObject);
    procedure edtNRCOMPRAChange(Sender: TObject);
    procedure edtNRCOMPRAEnter(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbeVLJUROExit(Sender: TObject);
    procedure dbeVLDESCExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure BUSCA_CONTA;
    procedure tratabotoes;
    procedure TOTAL_COMPRA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaContPagar: TfrmBaixaContPagar;

implementation

uses uFuncoes, uDm2, UFrmAdmin, Udm;

{$R *.dfm}

procedure TfrmBaixaContPagar.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmBaixaContPagar.BUSCA_CONTA;
begin
    { dm2.cdsContasPagar.Close;
     With dm2.dstContasPagar do
     Begin
          Active := False;
          CommandText := 'Select * from CONTASPAGAR Where (PAG_NRENTRADA = :pNRCOMPRA) '
                        +'AND (PAG_PARCELA = :pPAG_PARCELA) ';
          Params.ParamByName('pNRCOMPRA').AsInteger    := StrtoInt(edtNRCOMPRA.Text);
          Params.ParamByName('pPAG_PARCELA').AsString  := uFuncoes.StrZero(edtNRPARCELA.Text,2);
          Active := True;
     End;
     //
     dm2.cdsContasPagar.FetchParams;
     dm2.cdsContasPagar.Open;
     //
     If (dm2.cdsContasPagar.IsEmpty) then
     Begin
          Application.MessageBox(PChar('Registro de compra não encontrado...'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dm2.cdsContasPagar.Close;
          edtNRPARCELA.Clear;
          edtNRPARCELA.SetFocus;
          Exit;
     End
     Else
     begin
          If (dm2.cdsContasPagar.FieldByName('PAG_SITUACAO').AsString = 'P') then
          Begin
              Application.MessageBox(PChar('Baixa de debito já realizada...'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              dm2.cdsContasPagar.Close;
              edtNRPARCELA.Clear;
              edtNRPARCELA.SetFocus;
              Exit;
          End;
          //
          edtNRPARCELA.Text := uFuncoes.StrZero(edtNRPARCELA.Text,2);
          Tratabotoes;
          TOTAL_COMPRA;
          //
          dm2.cdsContasPagar.Edit;
          //dm2.cdsContasPagar.FieldByName('PAG_DATAPAGAMENTO').AsDateTime := Date();
          dbeVLJURO.SetFocus;
     End;}
     //
     TOTAL_COMPRA;
end;

procedure TfrmBaixaContPagar.TOTAL_COMPRA;
begin
     With dm2.qryTotalCompra do
     Begin
         Close;
         Params.ParamByName('pLOJA').AsInteger :=
                dm2.cdsContasPagar.FieldByName('PAG_LOJA').AsInteger;
         Params.ParamByName('pNRCOMPRA').AsInteger :=
                dm2.cdsContasPagar.FieldByName('PAG_NRENTRADA').AsInteger;
         Open;
     End;
     //
     edtTOTCOMPRA.Value := dm2.qryTotalCompra.FieldByName('PAG_TOTCOMPRA').AsCurrency; 
end;

procedure TfrmBaixaContPagar.tratabotoes;
begin
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled   := not BtGravar.Enabled;
end;

procedure TfrmBaixaContPagar.edtNRCOMPRAChange(Sender: TObject);
begin
{     If (BtCancelar.Enabled = True) Then
        tratabotoes;}
end;

procedure TfrmBaixaContPagar.edtNRCOMPRAEnter(Sender: TObject);
begin
     If (BtCancelar.Enabled = True) Then
        tratabotoes;
     //
     dm2.cdsContasPagar.Close;
end;

procedure TfrmBaixaContPagar.BtCancelarClick(Sender: TObject);
begin
     tratabotoes;
     edtTOTCOMPRA.Clear; 
     dm2.cdsContasPagar.Cancel;
     dm2.cdsContasPagar.Close;
     //
     Close;
end;

procedure TfrmBaixaContPagar.BtGravarClick(Sender: TObject);
Var
  TD : TTransactionDesc;
begin
     If (dbeDTPAGA.Text = '  /  /    ') Then
     Begin
         Application.MessageBox('Digite a data do pagamento!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeDTPAGA.SetFocus;
         Exit;
     End;
     //
     If (dm2.cdsContasPagar.FieldByName('PAG_VALORPAGO').AsCurrency = 0)
       or uFuncoes.Empty(dm2.cdsContasPagar.FieldByName('PAG_VALORPAGO').AsString) Then
     Begin
         Application.MessageBox('Digite o valor pago!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeVLPAGO.SetFocus;
         Exit;
     End;
     // Inicia um transação no BD
     TD.TransactionID  := StrtoInt(uFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);
     //
     Try
        tratabotoes;
        //
        dm2.cdsContasPagar.FieldByName('PAG_SITUACAO').AsString := 'P';
        dm2.cdsContasPagar.Post;
        dm2.cdsContasPagar.ApplyUpdates(0);
        //
        edtTOTCOMPRA.Clear;
        // Grava
        Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
        //
        MessageBox (Application.Handle, pChar('Baixa realizada com sucesso!!!'),
                     'CONCLUÍDO',MB_ICONINFORMATION+ MB_OK);
        //
        Close;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar incluir conta!!!'
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
        End;
     End;
end;

procedure TfrmBaixaContPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmBaixaContPagar.dbeVLJUROExit(Sender: TObject);
begin
     If (dm2.cdsContasPagar.State in [dsEdit]) Then
       If (dm2.cdsContasPagar.FieldByName('PAG_VALORJUROS').AsCurrency > 0) Then
           dm2.cdsContasPagar.FieldByName('PAG_VALORPAGO').AsCurrency :=
           dm2.cdsContasPagar.FieldByName('PAG_VALORPARCELA').AsCurrency+
           dm2.cdsContasPagar.FieldByName('PAG_VALORJUROS').AsCurrency
       Else
           dm2.cdsContasPagar.FieldByName('PAG_VALORPAGO').AsCurrency :=
              dm2.cdsContasPagar.FieldByName('PAG_VALORPARCELA').AsCurrency;
end;

procedure TfrmBaixaContPagar.dbeVLDESCExit(Sender: TObject);
begin
     If (dm2.cdsContasPagar.State in [dsEdit]) Then
       If  (dm2.cdsContasPagar.FieldByName('PAG_VALORDESCONTO').AsCurrency > 0) Then
           dm2.cdsContasPagar.FieldByName('PAG_VALORPAGO').AsCurrency :=
           dm2.cdsContasPagar.FieldByName('PAG_VALORPAGO').AsCurrency-
           dm2.cdsContasPagar.FieldByName('PAG_VALORDESCONTO').AsCurrency;
end;

procedure TfrmBaixaContPagar.FormShow(Sender: TObject);
begin
     dm2.cdsContasPagar.FieldByName('PAG_DATAPAGAMENTO').AsDateTime := Date();
     TOTAL_COMPRA;
     //
     dbeVLJURO.SetFocus;
end;

end.
