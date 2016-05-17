unit uFrmCadSecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask;

type
  TfrmCadSecao = class(TfrmCadastro)
    cdsConsultarSEC_CODIGO: TIntegerField;
    cdsConsultarSEC_DESCRICAO: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    dbeNMDESC: TDBEdit;
    DBText1: TDBText;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNMDESCExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSecao: TfrmCadSecao;

implementation

uses Udm, uFuncoes, udmConsulta, UFrmAdmin;

{$R *.dfm}

procedure TfrmCadSecao.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm.cdsSecao.Append;
  dbeNMDESC.SetFocus;
  dm.cdsSecaoSEC_CODIGO.Value := dm.CdsConfigCFG_SECAO.Value+1;
end;

procedure TfrmCadSecao.buscar;
begin
  dm.cdsSecao.Close;
  With dm.dstSecao do
  Begin
       Active := False;
       CommandText := 'Select * from SECAO '+
                      'Where (SEC_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('SEC_CODIGO').AsString;
       Active := True;
  End;
  dm.cdsSecao.Open;
end;

procedure TfrmCadSecao.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadSecao.BtEditarClick(Sender: TObject);
begin
  inherited;
  if dm.cdsSecao.RecordCount > 0 then
  Begin
      tratabotoes;
      dm.cdsSecao.Edit;
      dbeNMDESC.SetFocus;
  End;

end;

procedure TfrmCadSecao.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.cdsSecao.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este bairro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.cdsSecao.Delete;
       dm.cdsSecao.ApplyUpdates(0);
       {dm.cdsBancos.Close;
       dm.dstBancos.ParamByName('PCODIGO').AsString := dm.mscodigo('BAN_CODIGO','BANCOS');
       dm.cdsBancos.Open;}
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadSecao.BtCancelarClick(Sender: TObject);
begin
  inherited;
     tratabotoes;
     dm.cdsSecao.Cancel;
     //
     If (dm.cdsSecao.RecordCount > 0) Then
        Close;
end;

procedure TfrmCadSecao.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeNMDESC.Text) Then
  Begin
       Application.MessageBox('Digite a decrição da seção!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMDESC.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if dm.cdsSecao.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_SECAO.Value := dm.CdsConfigCFG_SECAO.Value+1;
      dm.cdsSecaoSEC_CODIGO.Value := dm.CdsConfigCFG_SECAO.Value;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
    end;
    dm.cdsSecao.Post;
    dm.cdsSecao.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.cdsSecao.Cancel;
        End;
  End;
  inherited;
end;

procedure TfrmCadSecao.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select SEC_CODIGO, SEC_DESCRICAO from SECAO ';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where SEC_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(SEC_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by SEC_DESCRICAO';
    Open;
    if IsEmpty then
    begin
      MessageDlg('Nenhum registro encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
      edtConsultar.Clear;
      if edtConsultar.CanFocus then
        edtConsultar.SetFocus;
    end;
  end;
  inherited;
end;

procedure TfrmCadSecao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty ) then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       dbeNMDESC.SetFocus;
  End;     
end;

procedure TfrmCadSecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dm.cdsSecao.Close; 
  inherited;

end;

procedure TfrmCadSecao.dbeNMDESCExit(Sender: TObject);
begin
  inherited;
  If (Dm.cdsSecao.State in [dsInsert]  )
    and not uFuncoes.Empty(dbeNMDESC.Text) Then
  begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select SEC_DESCRICAO from SECAO Where (SEC_DESCRICAO = :pNOME)');
           Params.ParamByName('pNOME').AsString := dbeNMDESC.Text;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Application.MessageBox('Seção já cadastrada!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeNMDESC.SetFocus;
                 dbeNMDESC.Clear;
                 Exit;
            End;
      End;
   End;
end;

procedure TfrmCadSecao.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFUncoes.Empty(edtConsultar.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select SEC_CODIGO, SEC_DESCRICAO from SECAO ';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where SEC_CODIGO = ' + edtConsultar.Text;
                 1: CommandText := CommandText + ' where UPPER(SEC_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + 'order by SEC_DESCRICAO';
               Open;
          End;  //fim-with
     End;   // fim-se
end;

procedure TfrmCadSecao.FormShow(Sender: TObject);
begin
  inherited;
     dm.parametros;
     If (dm.CdsConfigCFG_SECAO.Value = 0) Then
     begin
         dm.cdsSecao.Open;
         BtAdicionarClick(Sender);
     End
     Else
     Begin
          dm.cdsSecao.Close;
          With dm.dstSecao do
          Begin
               Active := False;
               CommandText := 'select * from SECAO Where (SEC_CODIGO = :pCODIGO)';
               Params.ParamByName('pCODIGO').AsInteger := uFuncoes.mvcodigo('SEC_CODIGO','SECAO');
               Active := True;
          End;
          dm.cdsSecao.Open;
     End;

end;

procedure TfrmCadSecao.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Seção...'));
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
end;

end.
