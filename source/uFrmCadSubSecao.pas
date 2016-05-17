unit uFrmCadSubSecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask;

type
  TfrmCadSubSecao = class(TfrmCadastro)
    Label1: TLabel;
    Label2: TLabel;
    dbeNMDESC: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    cdsConsultarSUB_CODIGO: TIntegerField;
    cdsConsultarSUB_DESCRICAO: TStringField;
    qrySecao: TSQLQuery;
    Label4: TLabel;
    dbePeAvista: TDBEdit;
    Label5: TLabel;
    dbePeAprazo: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbeNMDESCExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbePeAvistaExit(Sender: TObject);
    procedure dbePeAprazoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure Validar_Secao;
     procedure Localizar_Secao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSubSecao: TfrmCadSubSecao;

implementation

uses Udm, uFuncoes, udmConsulta, UFrmAdmin;

{$R *.dfm}

procedure TfrmCadSubSecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    dm.cdsSubSecao.Close;
    dm.cdsSecao.Close;
    Action := caFree;
end;

procedure TfrmCadSubSecao.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.cdsSubSecao.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir esta sub-seção?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.cdsSubSecao.Delete;
       dm.cdsSubSecao.ApplyUpdates(0);
       {dm.cdsBancos.Close;
       dm.dstBancos.ParamByName('PCODIGO').AsString := dm.mscodigo('BAN_CODIGO','BANCOS');
       dm.cdsBancos.Open;}
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadSubSecao.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dm.cdsSubSecao.RecordCount > 0) then
  Begin
      tratabotoes;
      dm.cdsSubSecao.Edit;
      dbeNMDESC.SetFocus;
  End;
end;

procedure TfrmCadSubSecao.buscar;
begin
  dm.cdsSubSecao.Close;
  With dm.dstSubSecao do
  Begin
       Active := False;
       CommandText := 'Select * from SUBSECAO '+
                      'Where (SUB_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('SUB_CODIGO').AsString;
       Active := True;
  End;
  dm.cdsSubSecao.Open;
end;

procedure TfrmCadSubSecao.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadSubSecao.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsSubSecao.Cancel;
  Localizar_Secao;
  //
  If (dm.cdsSubSecao.RecordCount > 0 ) Then
        Close;
end;

procedure TfrmCadSubSecao.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeNMDESC.Text) Then
  Begin
       Application.MessageBox('Digite a descrição!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMDESC.SetFocus;
       Exit;
  End;
  //
  Validar_Secao;
  //
  Try
    //
    tratabotoes;
    if dm.cdsSubSecao.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_SUBSECAO.Value := dm.CdsConfigCFG_SUBSECAO.Value+1;
      dm.cdsSubSecaoSUB_CODIGO.Value := dm.CdsConfigCFG_SUBSECAO.Value;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
    end;
    dm.cdsSubSecao.Post;
    dm.cdsSubSecao.ApplyUpdates(0);
    Localizar_Secao;
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.cdsSubSecao.Cancel;
        End;
  End;
  //
  inherited;
end;

procedure TfrmCadSubSecao.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm.cdsSubSecao.Append;
  dbeNMDESC.SetFocus;
  dm.cdsSubSecaoSUB_CODIGO.Value := dm.CdsConfigCFG_SUBSECAO.Value+1;
  Dm.cdsSubSecaoSUB_PEAVISTA.AsFloat := 0;
  Dm.cdsSubSecaoSUB_PEAPRAZO.AsFloat := 0;
  //lbl_NMSECA.Caption := '';
end;

procedure TfrmCadSubSecao.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from SUBSECAO ';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where SUB_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(SUB_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by SUB_DESCRICAO';
    Open;
    if IsEmpty then
    begin
      MessageDlg('Nenhum registro encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
      edtConsultar.Clear;
      if edtConsultar.CanFocus then
        edtConsultar.SetFocus;
    end;
  end;
  //
  inherited;
end;

procedure TfrmCadSubSecao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty ) then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       Localizar_Secao;
       dbeNMDESC.SetFocus;
  End;     
end;

procedure TfrmCadSubSecao.Validar_Secao;
begin
     with qrySecao do
     begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger := dm.cdsSubSecaoSEC_CODIGO.Value;
          Open;
          //
          if IsEmpty then
          begin
                Application.MessageBox('Código de seção não encontrado!',
                                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                qrySecao.Close;
                {lbl_NMSECA.Caption := '';
                dbeCDSECAO.Clear;
                dbeCDSECAO.SetFocus;}
                Exit;
         end;
  end;
end;

procedure TfrmCadSubSecao.Localizar_Secao;
begin
     with qrySecao do
     begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger := dm.cdsSubSecaoSEC_CODIGO.Value;
          Open;
          //
          if not IsEmpty then
             //lbl_NMSECA.Caption := FieldByName('SEC_DESCRICAO').AsString
          Else
             //lbl_NMSECA.Caption := '';
     end;
end;

procedure TfrmCadSubSecao.dbeNMDESCExit(Sender: TObject);
begin
  inherited;
  If (Dm.cdsSubSecao.State in [dsInsert]  )
    and not uFuncoes.Empty(dbeNMDESC.Text) Then
  begin
     {With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select SUB_DESCRICAO from SUBSECAO Where (SUB_DESCRICAO = :pDESCRICAO)');
           Params.ParamByName('pDESCRICAO').AsString := dbeNMDESC.Text;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Application.MessageBox('Sub-Seção já cadastrada!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeNMDESC.SetFocus;
                 dbeNMDESC.Clear;
                 Exit;
            End;
      End;}
   End;
end;

procedure TfrmCadSubSecao.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFUncoes.Empty(edtConsultar.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select * from SUBSECAO ';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where SUB_CODIGO = ' + edtConsultar.Text;
                 1: CommandText := CommandText + ' where UPPER(SUB_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + 'order by SUB_DESCRICAO';
               Open;
          End;  // fim-with
     End;     // fim-se
end;

procedure TfrmCadSubSecao.FormShow(Sender: TObject);
begin
  inherited;
     dm.parametros;
     //
     dm.cdsSecao.Close;
     With dm.dstSecao do
     Begin
          Active := False;
          CommandText := 'Select * from SECAO order by SEC_DESCRICAO';
          Active := True;
     End;
     dm.cdsSecao.Open;
     //
     If (dm.CdsConfigCFG_SUBSECAO.Value = 0) Then
     begin
         dm.cdsSubSecao.Open;
         BtAdicionarClick(Sender);
     End
     Else
     Begin
          dm.cdsSubSecao.Close;
          With dm.dstSubSecao do
          Begin
               Active := False;
               CommandText := 'select * from SUBSECAO Where (SUB_CODIGO = :pCODIGO)';
               Params.ParamByName('pCODIGO').AsInteger := uFuncoes.mvcodigo('SUB_CODIGO','SUBSECAO');
               Active := True;
          End;
          dm.cdsSubSecao.Open;
     End;
end;

procedure TfrmCadSubSecao.dbePeAvistaExit(Sender: TObject);
begin
  inherited;
      If (Dm.cdsSubSecao.State in [dsInsert, dsEdit])
       and (Dm.cdsSubSecaoSUB_PEAVISTA.AsFloat > 0) Then
             If (Dm.cdsSubSecaoSUB_PEAVISTA.AsFloat > 100) Then
             begin
                  dbePeAvista.SetFocus;
                  Exit;
             End;
end;

procedure TfrmCadSubSecao.dbePeAprazoExit(Sender: TObject);
begin
  inherited;
      If (Dm.cdsSubSecao.State in [dsInsert, dsEdit])
       and (Dm.cdsSubSecaoSUB_PEAPRAZO .AsFloat > 0) Then
             If (Dm.cdsSubSecaoSUB_PEAPRAZO.AsFloat > 100) Then
             begin
                  dbePeAprazo.SetFocus;
                  Exit;
             End;
end;

procedure TfrmCadSubSecao.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Sub-Secção...'));
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

End.
