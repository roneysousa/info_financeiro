unit uFrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image3: TImage;
    Image1: TImage;
    edt_SENHA: TEdit;
    edtCDUSUA: TEdit;
    procedure edt_SENHAKeyPress(Sender: TObject; var Key: Char);
    procedure edt_SENHAExit(Sender: TObject);
    procedure edtCDUSUAExit(Sender: TObject);
    procedure edtCDUSUAKeyPress(Sender: TObject; var Key: Char);
    procedure edt_SENHAEnter(Sender: TObject);
  private
    { Private declarations }
    procedure ValidarUsuario(const usuario, senha : string);
  public
    { Public declarations }
    codigoUsuario : Integer;
    nomeUsuario   : String;
    administrador :  boolean;
  end;

var
  frmLogin: TfrmLogin;
  M_QTTENT: Integer;
  M_NMUSUA : String;

implementation

uses uFuncoes, udmConsulta, Udm, UFrmAdmin;

{$R *.dfm}

procedure TfrmLogin.edt_SENHAKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #27) Then
     Begin
         key:=#0;
         ModalResult := mrCancel;
         Exit;
     End;
     //
     If (Key =#13) and not uFuncoes.Empty(edtCDUSUA.Text)
        and not uFuncoes.Empty(edt_SENHA.Text) Then
     begin
          Key := #0;
          //ACESSO(edtCDUSUA.Text, edt_SENHA.Text);
          if uFuncoes.Empty(edtCDUSUA.Text) Then
            begin
                 MessageDlg('Informe o código do usuário.',
                   mtInformation, [mbOK], 0);
                 edtCDUSUA.SetFocus;
                 Exit;
            End;
          //
          if uFuncoes.Empty(edt_SENHA.Text) Then
            begin
                 MessageDlg('Informe a senha.',
                   mtInformation, [mbOK], 0);
                 edt_SENHA.SetFocus;
                 Exit;
            End;
          //
         If not uFuncoes.Empty(edt_Senha.text) Then
           begin
                edt_Senha.text := edt_Senha.text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edt_Senha.text));
                edt_Senha.text := uFuncoes.Codifica(edt_Senha.text);
           End;
          //
          ValidarUsuario(edtCDUSUA.Text, edt_SENHA.Text);
     End;
end;

procedure TfrmLogin.edt_SENHAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edt_Senha.text) Then
      Begin
        M_NMUSUA := edt_Senha.text;
        edt_Senha.text := edt_Senha.text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edt_Senha.text));
      End;
end;

procedure TfrmLogin.edtCDUSUAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDUSUA.Text) Then
        edtCDUSUA.Text := uFuncoes.StrZero(edtCDUSUA.Text,3);
end;

procedure TfrmLogin.edtCDUSUAKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13, #27] ) then
        key:=#0;
    //
    If (key = #27) Then
    Begin
         key:=#0;
         ModalResult := mrCancel;
         Exit;
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
         If not dmConsultas.GetUsuario(StrtoInt(edtCDUSUA.Text)) Then
         begin
              Application.MessageBox('Registro de usuário não cadastrado!!!','ATENÇÃO',
                            MB_OK+MB_ICONSTOP+MB_APPLMODAL);
              edtCDUSUA.Clear;
              edtCDUSUA.SetFocus;
              Exit;
         End
         Else
             edt_SENHA.SetFocus;
    End;
end;

procedure TfrmLogin.ValidarUsuario(const usuario, senha: string);
Var
   M_FLADMI : String;
begin
  M_FLADMI := 'N';
  //
  Try
     M_QTTENT:=M_QTTENT+1;
     // W_SNATUA := W_SNATUA+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(W_SNATUA));
     //senha := uFuncoes.Codifica(senha);
     UFrmAdmin.admin    := False;
     //
     dm.RefreshCDS(Dm.CdsConfig);
     // Se Super-Usuário
     If (edtCDUSUA.Text = UFrmAdmin.M_USERMASTER) and (M_QTTENT<=3) Then
     begin
          If (edt_SENHA.Text = uFuncoes.Codifica(UFrmAdmin.M_SNMASTER)) Then
          Begin
              UFrmAdmin.M_CDUSUA := '001';
              UFrmAdmin.M_NMUSUA := 'USERMASTER';
              UFrmAdmin.M_CDLOJA := uFuncoes.StrZero(dm.CdsConfigCFG_LOJAPADRAO.AsString,3);
              UFrmAdmin.M_FLLOGI := True;
              UFrmAdmin.M_FLSUPE := 'S';
              UFrmAdmin.M_FLMAST := 1;
              UFrmAdmin.admin    := True;
              //
              M_FLADMI := 'S';
              codigoUsuario := 1;
              nomeUsuario   := 'INFOG2';
              administrador := True;
              ModalResult := mrOK;
              //
              If not (dm.IncluirTarefaUsuario( StrtoInt(UFrmAdmin.M_CDUSUA),
                    'Entrou no sistema '+'*F*')) Then
                        ShowMessage('Erro ao adicionar tarefa do usuário.');
          End
          Else
          Begin
              Application.MessageBox('Senha inválida!!!',
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              edt_SENHA.Clear;
              edt_SENHA.SetFocus;
              Exit;
          End;
     End;
     //
   If (M_FLADMI = 'N') Then
    begin
     //
     With dmConsultas.qryUsuarios do
     Begin
          Close;
          //
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDUSUA.Text);
          //
          Open;
     End;
     // Procura usuário
     If (M_QTTENT<=3) Then
     begin
          If (dmConsultas.qryUsuarios.FieldByName('SEN_SNATUA').AsString <> senha) Then
          begin
                 Application.MessageBox('Senha inválida!!!',
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edt_SENHA.Clear;
                 edt_SENHA.SetFocus;
                 Exit;
          end
          else
          begin
               codigoUsuario := dmConsultas.qryUsuarios.FieldByName('SEN_CODIGO').AsInteger;
               nomeUsuario   := dmConsultas.qryUsuarios.FieldByName('SEN_NOME').AsString;
               if (dmConsultas.qryUsuarios.FieldByName('USU_ADMIN').AsString = 'T') Then
                  administrador := True
               Else
                  administrador := False;
               //
               UFrmAdmin.M_CDUSUA := dmConsultas.qryUsuarios.FieldByName('SEN_CODIGO').AsString;
               udm.M_CDUSUARIO    := StrtoInt(UFrmAdmin.M_CDUSUA);
               UFrmAdmin.M_NMUSUA := dmConsultas.qryUsuarios.FieldByName('SEN_NOME').AsString;
               UFrmAdmin.M_SNATUA := dmConsultas.qryUsuarios.FieldByName('SEN_SNATUA').AsString;
               UFrmAdmin.M_FLSUPE := dmConsultas.qryUsuarios.FieldByName('SEN_FLSUPER').AsString;
               UFrmAdmin.M_CDLOJA := uFuncoes.StrZero(dm.CdsConfigCFG_LOJAPADRAO.AsString,3);
               UFrmAdmin.M_FLLOGI := True;
               UFrmAdmin.M_FLMAST := 0;
               //
               If (dmConsultas.qryUsuarios.FieldByName('USU_ADMIN').AsString = 'T') Then
                   UFrmAdmin.admin    := True;
               //
               Dm.Start;
               try
                 //
                 dm.cdsUsuarios.Close;
                 With dm.dstUsuarios do
                 Begin
                    Active := False;
                    CommandText := 'Select * from USUARIOS Where (SEN_CODIGO = :pCODIGO)';
                    Params.ParamByName('pCODIGO').AsInteger := StrtoInt(UFrmAdmin.M_CDUSUA);
                    Active := True;
                 End;
                 dm.cdsUsuarios.FetchParams;
                 dm.cdsUsuarios.Open;
                 dm.cdsUsuarios.Edit;
                 //
                 dm.cdsUsuariosSEN_DTATUAL.AsDateTime := Date();
                 dm.cdsUsuariosSEN_TERMINAL.AsString  := uFuncoes.NomeMaquina;
                 // Getcomputer;
                 dm.cdsUsuarios.Post;
                 dm.cdsUsuarios.ApplyUpdates(0);
                 //
                 Dm.Comit(Dm.Transc);
               Except
                     Dm.Rollback;
               End;
               //
               ModalResult := mrOK;
               //
               If not (dm.IncluirTarefaUsuario( StrtoInt(edtCDUSUA.Text),
                    'Entrou no sistema '+'*F*')) Then
                        ShowMessage('Erro ao adicionar tarefa do usuário.');
          end;
          //
     End
     Else
     begin
          Application.MessageBox('O Sistema será Fechado!',
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          Application.Terminate;
     End;
     //
    End;
   Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao acessar o sistema!!!'
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //
             Application.Terminate;
        End;
   End;
end;

procedure TfrmLogin.edt_SENHAEnter(Sender: TObject);
begin
    M_NMUSUA := '';
end;

end.
