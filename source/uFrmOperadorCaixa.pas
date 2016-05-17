unit uFrmOperadorCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmOperadorCaixa = class(TForm)
    Panel1: TPanel;
    pnlBotoes: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    edtCDUSUA: TLabeledEdit;
    edt_SENHA: TLabeledEdit;
    lbl_NMCAIX: TLabel;
    procedure BtGravarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure edt_SENHAExit(Sender: TObject);
    procedure edtCDUSUAExit(Sender: TObject);
    procedure edtCDUSUAKeyPress(Sender: TObject; var Key: Char);
    procedure edt_SENHAChange(Sender: TObject);
    procedure edtCDUSUAChange(Sender: TObject);
    procedure edt_SENHAKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtCDUSUAEnter(Sender: TObject);
    procedure edt_SENHAEnter(Sender: TObject);
  private
    procedure CONSULTA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOperadorCaixa: TfrmOperadorCaixa;
  M_QTTENT, M_NRFORM: Integer;

implementation

uses uFuncoes, uFrmAdmin, uFrmVendas, udmConsulta,uFrmEntradasSaidas;

{$R *.dfm}

procedure TfrmOperadorCaixa.BtGravarClick(Sender: TObject);
Var
     W_CDUSUA, W_SNATUA, M_SNATUA : String;
begin
     // SE nome do usuario estiver vazio
     If uFuncoes.Empty(edtCDUSUA.Text) Then
     begin
          Application.MessageBox('Digite o código de usuário.',
          'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
          edtCDUSUA.SetFocus;
          Exit;
     end;
     // Se a senha do usuario estiver vazio
     If uFuncoes.Empty(edt_SENHA.Text) Then
     begin
          Application.MessageBox('Digite sua senha de usuário.',
               'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
          edt_SENHA.SetFocus;
          Exit;
     end;
     //
     M_QTTENT:=M_QTTENT+1;
     W_CDUSUA := edtCDUSUA.Text;
     W_SNATUA := edt_SENHA.Text;
     //
     W_SNATUA := W_SNATUA+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(W_SNATUA));
     //
     With dmConsultas.qryUsuarios do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsString := W_CDUSUA;
          Open;
     End;
     //
     If not (dmConsultas.qryUsuarios.IsEmpty) Then
     Begin
          If (dmConsultas.qryUsuarios.FieldByName('SEN_FLCAIXA').AsString = 'N')
          OR uFuncoes.Empty(dmConsultas.qryUsuarios.FieldByName('SEN_FLCAIXA').AsString) Then
          Begin
               Application.MessageBox('Usuário não é caixa!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dmConsultas.qryUsuarios.Close;
               lbl_NMCAIX.Caption := '';
               edtCDUSUA.SetFocus;
               edtCDUSUA.Clear;
               Exit;
          End;
          //
          M_SNATUA := dmConsultas.qryUsuarios.FieldByName('SEN_SNATUA').AsString;
     End;

     // Testa senha do usuário
     If (M_QTTENT<=3) Then
     begin
          If (uFuncoes.Codifica(W_SNATUA) <> M_SNATUA) then
          begin
                 Application.MessageBox('Senha inválida!!!',
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edt_SENHA.Clear;
                 edt_SENHA.SetFocus;
                 Exit;
          end
          else
          begin
            If (M_NRFORM = 1) Then
            BEGIN
              with TfrmVendas.create(self) do
              try
                 edtOPERADOR.Text := W_CDUSUA;
                 showmodal;
              finally
                 free;
              end;
            End;
            //
            If (M_NRFORM = 2) Then
            Begin
              with TfrmEntradaSaida.create(self) do
              try
                 uFrmEntradasSaidas.M_CDCAIX := StrtoInt(W_CDUSUA);
                 showmodal;
              finally
                 free;
              end;
            End;
              //
              Close;
          end;
          //
     End
     Else
     begin
          Application.MessageBox('Senha inválida!!!'+#13'Tente novamente.',
                         'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
          Close;
     End;
end;

procedure TfrmOperadorCaixa.BtCancelarClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmOperadorCaixa.edt_SENHAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edt_Senha.text) Then
        edt_Senha.text := edt_Senha.text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edt_Senha.text));
end;

procedure TfrmOperadorCaixa.edtCDUSUAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDUSUA.Text) Then
       edtCDUSUA.Text := uFuncoes.StrZero(edtCDUSUA.Text,3);
end;

procedure TfrmOperadorCaixa.edtCDUSUAKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13, #27] ) then
        key:=#0;
    //
    If (key = #27) Then
    Begin
         key:=#0;
         Close;
    End;
    //
    If (key = #13) and uFuncoes.Empty(edtCDUSUA.Text) Then
    Begin
         key:=#0;
         //
         edtCDUSUA.Text := '000';
         edt_SENHA.SetFocus;
    End;
    //
    If (key = #13) and not uFuncoes.Empty(edtCDUSUA.Text) Then
    Begin
         key:=#0;
         //
         CONSULTA;
    End;
end;

procedure TfrmOperadorCaixa.CONSULTA;
begin
     With dmConsultas.qryUsuarios do
     Begin
          Close;
          //
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDUSUA.Text);
          //
          Open;
     End;
     //
     If (dmConsultas.qryUsuarios.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de caixa não cadastrado!!!','ATENÇÃO',
                              MB_OK+MB_ICONSTOP+MB_APPLMODAL);
          dmConsultas.qryUsuarios.Close;
          lbl_NMCAIX.Caption := '';
          edtCDUSUA.Clear;
          edtCDUSUA.SetFocus;
          Exit;
     End
     Else
     begin
          // Verifica se o usuario é caixa
          If (dmConsultas.qryUsuarios.FieldByName('SEN_FLCAIXA').AsString = 'N')
              OR uFuncoes.Empty(dmConsultas.qryUsuarios.FieldByName('SEN_FLCAIXA').AsString) Then
          Begin
               Application.MessageBox('Usuário não é caixa!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dmConsultas.qryUsuarios.Close;
               lbl_NMCAIX.Caption := '';
               edtCDUSUA.SetFocus;
               edtCDUSUA.Clear;
               Exit;
          End;
          // teste se o caixa do usuario está aberto
          With dmConsultas.qryCaixa do
          Begin
              Close;
             // Params.ParamByName('pLOJA').AsInteger    := StrtoInt(UFrmAdmin.M_CDLOJA);
              Params.ParamByName('pCAIXA').AsInteger   := dmConsultas.qryUsuarios.FieldByName('SEN_CODIGO').AsInteger;
              Params.ParamByName('pSITUACAO').AsString := 'A';
              Open;
          End;
          //
          If (dmConsultas.qryCaixa.IsEmpty) Then
          begin
               Application.MessageBox('Caixa encontra-se fechado,'+#13'realize a abertura do caixa!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dmConsultas.qryUsuarios.Close;
               dmConsultas.qryCaixa.Close; 
               lbl_NMCAIX.Caption := '';
               edtCDUSUA.SetFocus;
               edtCDUSUA.Clear;
               Exit;
          End;
          //
          lbl_NMCAIX.Caption := dmConsultas.qryUsuarios.FieldByName('SEN_NOME').AsString;
          edt_SENHA.SetFocus;
     End;
end;

procedure TfrmOperadorCaixa.edt_SENHAChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDUSUA.Text)
      and not uFuncoes.Empty(edt_SENHA.Text) Then
        BtGravar.Enabled := True
     Else
        BtGravar.Enabled := False;
end;

procedure TfrmOperadorCaixa.edtCDUSUAChange(Sender: TObject);
begin
      If uFuncoes.Empty(edtCDUSUA.Text) Then
          lbl_NMCAIX.Caption := '';
end;

procedure TfrmOperadorCaixa.edt_SENHAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(edt_SENHA.Text) Then
     Begin
          Key := #0;
          BtGravarClick(Sender);
     End;
end;

procedure TfrmOperadorCaixa.FormShow(Sender: TObject);
begin
     lbl_NMCAIX.Caption := '';
end;

procedure TfrmOperadorCaixa.edtCDUSUAEnter(Sender: TObject);
begin
     edt_Senha.Clear; 
end;

procedure TfrmOperadorCaixa.edt_SENHAEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDUSUA.Text) Then
        edtCDUSUA.SetFocus;
end;

end.
