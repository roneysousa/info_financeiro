unit uFrmSupervisor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr;

type
  TfrmSupervisor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label1: TLabel;
    edtCDSUPE: TEdit;
    edtSENHA: TEdit;
    Label2: TLabel;
    qryProcurar: TSQLQuery;
    qryProcurarSEN_CODIGO: TIntegerField;
    qryProcurarSEN_NOME: TStringField;
    qryProcurarSEN_SNATUA: TStringField;
    qryProcurarSEN_FLSUPER: TStringField;
    qryProcurarSEN_FLCAIXA: TStringField;
    procedure BtSairClick(Sender: TObject);
    procedure edtCDSUPEExit(Sender: TObject);
    procedure edtSENHAExit(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtCDSUPEKeyPress(Sender: TObject; var Key: Char);
    procedure edtSENHAKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure VALIDAR_CAIXA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSupervisor: TfrmSupervisor;

implementation

uses uFuncoes, Udm, uFormaPagamento, udmConsulta;

{$R *.dfm}

procedure TfrmSupervisor.BtSairClick(Sender: TObject);
begin
      uFormaPagamento.M_FLSUPE := False;
      //
      Close;
end;

procedure TfrmSupervisor.VALIDAR_CAIXA;
begin
     With dmConsultas.qryUsuarios do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA, SEN_FLSUPER from USUARIOS');
          SQL.Add('Where (SEN_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDSUPE.Text);
          //
          Open;
     End;
     //
     If (dmConsultas.qryUsuarios.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de supervisor não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtCDSUPE.SetFocus;
          edtCDSUPE.Clear;
          Exit;
     End
     Else
     begin
          If (dmConsultas.qryUsuarios.FieldByName('SEN_FLSUPER').AsString = 'N')
             OR uFuncoes.Empty(dmConsultas.qryUsuarios.FieldByName('SEN_FLSUPER').AsString) Then
          Begin
               Application.MessageBox('Usuário não é supervisor!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dmConsultas.qryUsuarios.Close;
               edtCDSUPE.SetFocus;
               edtCDSUPE.Clear;
               Exit;
          End
          Else
              edtCDSUPE.Text := uFuncoes.StrZero(edtCDSUPE.Text,3);
          //
     End;
end;

procedure TfrmSupervisor.edtCDSUPEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDSUPE.Text) Then
         VALIDAR_CAIXA;
end;

procedure TfrmSupervisor.edtSENHAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtSenha.text) Then
        edtSenha.text := edtSenha.text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edtSenha.text));
end;

procedure TfrmSupervisor.BtGravarClick(Sender: TObject);
Var
    W_SNATUA : String;
begin
     W_SNATUA := edtSENHA.Text;
     W_SNATUA := W_SNATUA+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(W_SNATUA));
     W_SNATUA := uFuncoes.Codifica(W_SNATUA);
     //
     If (W_SNATUA = dmConsultas.qryUsuarios.FieldByName('SEN_SNATUA').AsString) Then
     Begin
          //
          edtSENHA.Text := edtSENHA.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edtSENHA.text));
          edtSENHA.Text := uFuncoes.Codifica(edtSENHA.Text);
          uFormaPagamento.M_FLSUPE := True;
          Close;
     End
     Else
     Begin
          //
          Application.MessageBox('Senha anterior não confere!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          //M_QTTENT := M_QTTENT - 1;
          uFormaPagamento.M_FLSUPE := False;
          edtSENHA.SetFocus;
          edtSENHA.Clear;
          Exit;
     End;
end;

procedure TfrmSupervisor.edtCDSUPEKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13, #27] ) then
        key:=#0;
     //
     If (key = #27) Then
     Begin
          Key := #0;
          Close;
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDSUPE.Text) Then
     Begin
           Key := #0;
           edtSENHA.SetFocus;
     End;
end;

procedure TfrmSupervisor.edtSENHAKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) and not uFuncoes.Empty(edtSENHA.Text) Then
     Begin
           Key := #0;
           BtGravar.SetFocus;
     End;
     //
     If (key = #27) Then
     Begin
          Key := #0;
          Close;
     End;     
end;

procedure TfrmSupervisor.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #27) Then
     Begin
          Key := #0;
          Close;
     End;
end;

end.
