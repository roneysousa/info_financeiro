unit uFrmUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadUsuarios = class(TfrmCadastro)
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    dbeNMUSUA: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    lbl_senha: TLabel;
    cdsConsultarSEN_CODIGO: TIntegerField;
    cdsConsultarSEN_NOME: TStringField;
    edt_Confirma: TEdit;
    dbeSNATUA: TEdit;
    lbl_confirma: TLabel;
    cmbSUPER: TComboBox;
    cmbCAIXA: TComboBox;
    Label6: TLabel;
    cmbImpressora: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    cbxImpressora: TCheckBox;
    btnAcesso: TBitBtn;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeSNATUAExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_ConfirmaExit(Sender: TObject);
    procedure cmbImpressoraEnter(Sender: TObject);
    procedure cmbCAIXAChange(Sender: TObject);
    procedure dbeNMUSUAExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAcessoClick(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure Exibir_edites;
     procedure Ocultar_edites;
     procedure FLUXO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

uses Udm, uFuncoes, UFrmAdmin, udmConsulta, uFrmCadPermissoes;

{$R *.dfm}

procedure TfrmCadUsuarios.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  //
  cmbSUPER.ItemIndex := 1;
  cmbCAIXA.ItemIndex := 1;
  //
  dm.cdsUsuarios.Append;
  dbeNMUSUA.SetFocus;
  dm.cdsUsuariosSEN_CODIGO.Value := dm.CdsConfigCFG_USUARIO.Value+1;
  //
  Exibir_edites;
  dbeSNATUA.Clear;
  edt_Confirma.Clear;  
end;

procedure TfrmCadUsuarios.buscar;
begin
  dm.cdsUsuarios.Close;
  With dm.dstUsuarios do
  Begin
       Active := False;
       CommandText := 'Select * from USUARIOS '+
                      'Where (SEN_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := cdsConsultar.FieldByName('SEN_CODIGO').AsInteger;
       Active := True;
  End;
  dm.cdsUsuarios.FetchParams; 
  dm.cdsUsuarios.Open;
  //
end;

procedure TfrmCadUsuarios.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   btnAcesso.Enabled := NOT btnAcesso.Enabled; 
   //
   cmbSUPER.Enabled := not cmbSUPER.Enabled;
   cmbCAIXA.Enabled := not cmbCAIXA.Enabled;
   cbxImpressora.Enabled :=  not cbxImpressora.Enabled;
end;

procedure TfrmCadUsuarios.BtEditarClick(Sender: TObject);
begin
  inherited;
 try
  if (dm.cdsUsuarios.Active)
    and (dm.cdsUsuarios.RecordCount > 0) then
  Begin
       tratabotoes;
       dm.cdsUsuarios.Edit;
       //
       If NOT (UFrmAdmin.admin) AND (UFrmAdmin.M_FLMAST = 0) Then
       begin
           If (dm.cdsUsuarios.FieldByName('SEN_CODIGO').AsInteger <> StrtoInt(UFrmAdmin.M_CDUSUA)) Then
           begin
                Application.MessageBox(Pchar(uFrmAdmin.M_NMUSUA+  ' você não pode editar este usuário!!!'),'ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                dm.cdsUsuarios.Cancel;
                tratabotoes;
                Exit;
           End;
       End;
       //
       FLUXO;
       //
       dbeNMUSUA.SetFocus;
       //
       Exibir_edites;
  End;
 Except
          on Exc:Exception do
           begin
               Application.MessageBox(PChar('Erro ao tentar editar usuário!!!'
                       + Exc.Message),
                       'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           End;
 End;
end;

procedure TfrmCadUsuarios.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.cdsUsuarios.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este usuário?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.cdsUsuarios.Delete;
       dm.cdsUsuarios.ApplyUpdates(0);
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadUsuarios.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsUsuarios.Cancel;
  FLUXO;
  //
  Ocultar_edites;
end;

procedure TfrmCadUsuarios.BtGravarClick(Sender: TObject);
begin
  inherited;
  If uFuncoes.Empty(dbeNMUSUA.Text) Then
  Begin
       Application.MessageBox('Digite o nome do usuário!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMUSUA.SetFocus;
       Exit;
  End;
  //
  If (dm.cdsUsuarios.State in [dsInsert] ) AND
    uFuncoes.Empty(dbeSNATUA.Text) Then
  Begin
       Application.MessageBox('Digite sua senha!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeSNATUA.SetFocus;
       Exit;
  End;
  //
  If (dm.cdsUsuarios.State in [dsInsert] ) AND
      uFuncoes.Empty(edt_Confirma.Text) Then
  Begin
       Application.MessageBox('Digite a confirmação da senha!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       edt_Confirma.SetFocus;
       Exit;
  End;
  //
  If not uFuncoes.Empty(edt_Confirma.text) Then
  begin
       edt_Confirma.Text := edt_Confirma.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edt_Confirma.Text));
       //
       If ( edt_Confirma.Text = dbeSNATUA.Text) Then
            dm.cdsUsuariosSEN_SNATUA.AsString := uFuncoes.Codifica(edt_Confirma.Text)
       Else
       begin
            Application.MessageBox( 'A senha incorreta!','ATENÇÃO',
                          MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edt_Confirma.Clear;
            edt_Confirma.SetFocus;
            Exit;
       End;
  End;
  //
  Try
    //
    tratabotoes;
    if dm.cdsUsuarios.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_USUARIO.Value  := dm.CdsConfigCFG_USUARIO.Value+1;
      dm.cdsUsuariosSEN_CODIGO.Value := dm.CdsConfigCFG_USUARIO.Value;
      dm.CdsConfig.ApplyUpdates(0);
      //
    end;
    //
    If (cmbSUPER.ItemIndex = 0) Then
        dm.cdsUsuarios.FieldByName('SEN_FLSUPER').AsString := 'S'
    Else
        dm.cdsUsuarios.FieldByName('SEN_FLSUPER').AsString := 'N';
    //
    If (cmbCAIXA.ItemIndex = 0) Then
    begin
        dm.cdsUsuarios.FieldByName('SEN_FLCAIXA').AsString := 'S';
    End
    Else
        dm.cdsUsuarios.FieldByName('SEN_FLCAIXA').AsString := 'N';
    // Fluxo impressora
    If (cbxImpressora.Checked) Then
        dm.cdsUsuarios.FieldByName('SEN_FLIMPRESSORA').AsString := '1'
    Else
        dm.cdsUsuarios.FieldByName('SEN_FLIMPRESSORA').AsString := '0';
    //
    if (dm.cdsUsuarios.FieldByName('SEN_CODIGO').AsInteger = 1) Then
        dm.cdsUsuarios.FieldByName('USU_ADMIN').AsString := 'T'
    Else
        dm.cdsUsuarios.FieldByName('USU_ADMIN').AsString := 'F';
    //
    dm.cdsUsuarios.Post;
    dm.cdsUsuarios.ApplyUpdates(0);
    //
    FLUXO;
    Ocultar_edites;
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.cdsUsuarios.Cancel;
        End;
  End;
end;

procedure TfrmCadUsuarios.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select SEN_CODIGO, SEN_NOME from USUARIOS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where SEN_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(SEN_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by SEN_NOME';
    Open;
    if IsEmpty then
    begin
      MessageDlg('Nenhum registro encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
      edtConsultar.Clear;
      if edtConsultar.CanFocus then
        edtConsultar.SetFocus;
    end;
  end;
end;

procedure TfrmCadUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
   If not (cdsConsultar.IsEmpty) Then
   begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       //
       //If (uFrmAdmin.M_NMUSUA <> 'USERMASTER') Then
       If not (uFrmAdmin.admin) Then
       begin
           If (dm.cdsUsuarios.FieldByName('SEN_CODIGO').AsInteger <> StrtoInt(UFrmAdmin.M_CDUSUA)) Then
           begin
                Application.MessageBox(Pchar(uFrmAdmin.M_NMUSUA+  ' você não pode editar este usuário!!!'),'ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //dm.cdsUsuarios.Cancel;
                //tratabotoes;
                Exit;
           End;
       End;
       //
       FLUXO;
       dbeNMUSUA.SetFocus;
       //
       Ocultar_edites;
       //Exibir_edites;
   End;
end;

procedure TfrmCadUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
   If not (UFrmAdmin.admin) Then
   begin
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Bancos...'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     BtAdicionar.Visible := (novo = 'S');
     BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');
   End;
   //
   dm.RefreshCDS(DM.CdsConfig) ;
end;

procedure TfrmCadUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    dm.cdsUsuarios.Close;
    Action := caFree;
end;

procedure TfrmCadUsuarios.dbeSNATUAExit(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(dbeSNATUA.Text) Then
        dbeSNATUA.Text := dbeSNATUA.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(dbeSNATUA.Text));
end;

procedure TfrmCadUsuarios.Exibir_edites;
begin
     lbl_senha.Visible    := True;
     lbl_confirma.Visible := True;
     edt_Confirma.Visible := True;
     dbeSNATUA.Visible    := True;
     //
     //dbeSNATUA.Text    := dm.cdsUsuariosSEN_SNATUA.AsString;
     //edt_Confirma.Text := dm.cdsUsuariosSEN_SNATUA.AsString;
end;

procedure TfrmCadUsuarios.Ocultar_edites;
begin
     lbl_senha.Visible    := False;
     lbl_confirma.Visible := False;
     //
     edt_Confirma.Visible := False;
     dbeSNATUA.Visible    := False;
end;

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
  inherited;
      dm.parametros;
      dm.cdsUsuarios.Close;
      With dm.dstUsuarios do
        begin
             Active := False;
             CommandText := 'Select * from USUARIOS Where (SEN_CODIGO = :pCODIGO)';
             Params.ParamByName('pCODIGO').AsInteger := uFuncoes.mvcodigo('SEN_CODIGO','USUARIOS');
             Active := True;
        End;
      dm.cdsUsuarios.FetchParams;
      dm.cdsUsuarios.Open;
      //
      {if (uFrmAdmin.admin) or (StrtoInt(uFrmAdmin.M_CDUSUA) = 1)  Then
          btnAcesso.Visible := True
      Else
          btnAcesso.Visible := False;}
      //
      if (uFrmAdmin.admin) Then
         btnAcesso.Visible := True
      Else
         btnAcesso.Visible := False;
      //
      FLUXO;
      Ocultar_edites;
end;

procedure TfrmCadUsuarios.FLUXO;
begin
       If not (dm.cdsUsuarios.State in [dsEdit]) Then
          dm.cdsUsuarios.Edit;
       //
       If (dm.cdsUsuarios.FieldByName('SEN_FLSUPER').AsString = 'S') Then
           cmbSUPER.ItemIndex := 0
       Else
           cmbSUPER.ItemIndex := 1;
       //
       If (dm.cdsUsuarios.FieldByName('SEN_FLCAIXA').AsString = 'S') Then
           cmbCAIXA.ItemIndex := 0
       Else
           cmbCAIXA.ItemIndex := 1;
       //
       If (dm.cdsUsuarios.FieldByName('SEN_FLIMPRESSORA').AsString = '0')
          or uFuncoes.Empty(dm.cdsUsuarios.FieldByName('SEN_FLIMPRESSORA').AsString) Then
           cbxImpressora.Checked := False
       Else
           cbxImpressora.Checked := True;
       //
end;

procedure TfrmCadUsuarios.edt_ConfirmaExit(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edt_Confirma.Text) Then
     Begin
       edt_Confirma.Text := edt_Confirma.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edt_Confirma.Text));
       //
       If ( edt_Confirma.Text = dbeSNATUA.Text) Then
            dm.cdsUsuariosSEN_SNATUA.AsString := uFuncoes.Codifica(edt_Confirma.Text)
       Else
       begin
            Application.MessageBox( 'A senha incorreta!','ATENÇÃO',
                          MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edt_Confirma.Clear;
            edt_Confirma.SetFocus;
            Exit;
       End;
  End;
end;

procedure TfrmCadUsuarios.cmbImpressoraEnter(Sender: TObject);
begin
  inherited;
     If (dm.cdsUsuarios.State in [dsInsert, dsEdit] ) Then
        If (cmbCAIXA.ItemIndex = 1) Then
        Begin
             dbeSNATUA.SetFocus;
             cmbImpressora.Enabled := False;
        End;
end;

procedure TfrmCadUsuarios.cmbCAIXAChange(Sender: TObject);
begin
  inherited;
     If (dm.cdsUsuarios.State in [dsInsert, dsEdit] ) Then
      If (cmbCAIXA.ItemIndex = 0) Then
        cmbImpressora.Enabled := True
      Else
      Begin
          //cmbImpressora.ItemIndex := 0;
          cmbImpressora.Enabled := False;
      End;
end;

procedure TfrmCadUsuarios.dbeNMUSUAExit(Sender: TObject);
begin
  inherited;
  If (Dm.cdsUsuarios.State in [dsInsert]  )
    and not uFuncoes.Empty(dbeNMUSUA.Text) Then
  begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select SEN_NOME from USUARIOS Where (SEN_NOME = :pNOME)');
           Params.ParamByName('pNOME').AsString := dbeNMUSUA.Text;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Application.MessageBox('Usuário já cadastrado!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeNMUSUA.SetFocus;
                 dbeNMUSUA.Clear;   
                 Exit;
            End;
      End;
   End;
end;

procedure TfrmCadUsuarios.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edtConsultar.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select SEN_CODIGO, SEN_NOME from USUARIOS';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where SEN_CODIGO = ' + edtConsultar.Text;
                 1: CommandText := CommandText + ' where UPPER(SEN_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + 'order by SEN_NOME';
               Open;
          End;   //fim-with
      End;    // fim-se
end;

procedure TfrmCadUsuarios.btnAcessoClick(Sender: TObject);
begin
  inherited;
  if (dm.cdsUsuarios.Active)
    and (dm.cdsUsuarios.RecordCount > 0) then
  Begin
       //
       IF (StrtoInt(UFrmAdmin.M_CDUSUA) <= 1) tHEN
        Begin
            FrmAdmin.AbreForm(TfrmCadPermissoes, frmCadPermissoes);
            Exit;
        End;
       //
       If  NOT (UFrmAdmin.admin) Then
       begin
           //
           Application.MessageBox(Pchar(uFrmAdmin.M_NMUSUA+  ', você não tem permissão de administrador. '),'ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Exit;
           //
           {If (dm.cdsUsuarios.FieldByName('SEN_CODIGO').AsInteger <> StrtoInt(UFrmAdmin.M_CDUSUA)) Then
           begin
                Application.MessageBox(Pchar(uFrmAdmin.M_NMUSUA+  ' você não pode editar este usuário!!!'),'ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                Exit;
           End;}
       End
       else
           FrmAdmin.AbreForm(TfrmCadPermissoes, frmCadPermissoes);
  End;
end;

end.
