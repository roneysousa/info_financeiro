unit uFrmExcContPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DBXpress, FMTBcd,
  DB, SqlExpr;

type
  TfrmExcContPagar = class(TForm)
    pnlDados: TPanel;
    Panel2: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    edtNRCOMPRA: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cmbLoja: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    qryExcluirConta: TSQLQuery;
    procedure BtSairClick(Sender: TObject);
    procedure edtNRCOMPRAChange(Sender: TObject);
    procedure edtNRCOMPRAEnter(Sender: TObject);
    procedure edtNRCOMPRAExit(Sender: TObject);
    procedure edtNRCOMPRAKeyPress(Sender: TObject; var Key: Char);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure cmbLojaEnter(Sender: TObject);
  private
    procedure BUSCA_CONTA;
    procedure tratabotoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExcContPagar: TfrmExcContPagar;

implementation

uses uDm2, uFuncoes, UFrmAdmin, Udm;

{$R *.dfm}

procedure TfrmExcContPagar.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmExcContPagar.BUSCA_CONTA;
begin
     dm2.cdsContasPagar.Close;
     With dm2.dstContasPagar do
     Begin
          Active := False;
          CommandText := 'Select * from CONTASPAGAR Where (PAG_NRENTRADA = :pNRCOMPRA)';
          Params.ParamByName('pNRCOMPRA').AsInteger := StrtoInt(edtNRCOMPRA.Text);
          Active := True;
     End;
     //
     dm2.cdsContasPagar.FetchParams;
     dm2.cdsContasPagar.Open;
     //
     If (dm2.cdsContasPagar.IsEmpty) then
     Begin
          Application.MessageBox(PChar('Registro de conta a pagar não encontrada...'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dm2.cdsContasPagar.Close;
          edtNRCOMPRA.Clear; 
          edtNRCOMPRA.SetFocus;
          Exit;
     End
     Else
     begin
          edtNRCOMPRA.Text := uFuncoes.StrZero(edtNRCOMPRA.Text,7);
          Tratabotoes;
     End;
end;

procedure TfrmExcContPagar.tratabotoes;
begin
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled   := not BtGravar.Enabled;
   BtSair.Enabled     := not BtSair.Enabled;
end;

procedure TfrmExcContPagar.edtNRCOMPRAChange(Sender: TObject);
begin
     If uFuncoes.Empty (edtNRCOMPRA.Text) Then
         dm2.cdsContasPagar.Close;
     If (BtCancelar.Enabled = True) Then
        tratabotoes;
end;

procedure TfrmExcContPagar.edtNRCOMPRAEnter(Sender: TObject);
begin
     If (BtCancelar.Enabled = True) Then
        tratabotoes;
     //
     dm2.cdsContasPagar.Close;
end;

procedure TfrmExcContPagar.edtNRCOMPRAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRCOMPRA.Text) Then
          BUSCA_CONTA;
end;

procedure TfrmExcContPagar.edtNRCOMPRAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(edtNRCOMPRA.Text) Then
     Begin
          Key := #0;
          cmbLoja.SetFocus;
     End;
end;

procedure TfrmExcContPagar.BtCancelarClick(Sender: TObject);
begin
     Tratabotoes;
     dm2.cdsContasPagar.Close;
     //
     edtNRCOMPRA.Clear; 
     edtNRCOMPRA.SetFocus;
end;

procedure TfrmExcContPagar.BtGravarClick(Sender: TObject);
Var
  TD : TTransactionDesc;
  M_NRENTR : Integer;
begin

     // Inicia um transação no BD
     TD.TransactionID  := StrtoInt(uFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);
     //
     Try
        Tratabotoes;
        //
        M_NRENTR := dm2.cdsContasPagarPAG_NRENTRADA.AsInteger;
        //
        dm2.cdsContasPagar.Close;
        //
        With qryExcluirConta do
        Begin
             Close;
             Params.ParamByName('pNRCOMPRA').AsInteger := M_NRENTR;
             ExecSQL;
        End;
        // Grava
        Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
        //
        MessageBox (Application.Handle, pChar('Registro de debito excluido!!!'),
                     'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
        //
        edtNRCOMPRA.Clear;
        edtNRCOMPRA.SetFocus;
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

procedure TfrmExcContPagar.cmbLojaEnter(Sender: TObject);
begin
     If not uFuncoes.Empty(cmbLoja.Text) Then
        BtCancelar.SetFocus;
end;

end.
