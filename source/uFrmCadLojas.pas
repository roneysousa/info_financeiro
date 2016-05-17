unit uFrmCadLojas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadLojas = class(TfrmCadastro)
    cdsConsultarEMP_CODIGO: TIntegerField;
    cdsConsultarEMP_FANTASIA: TStringField;
    Label1: TLabel;
    dbeNMFANT: TDBEdit;
    Label2: TLabel;
    dbeNMRAZA: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    cmbCidade: TDBLookupComboBox;
    Label6: TLabel;
    cmbBairro: TDBLookupComboBox;
    Label7: TLabel;
    dbeNRCNPJ: TDBEdit;
    Label8: TLabel;
    DBText1: TDBText;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label15: TLabel;
    cmbUF: TDBComboBox;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNRCNPJExit(Sender: TObject);
    procedure dbeNRCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure cmbCidadeExit(Sender: TObject);
    procedure dbeNMFANTExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadLojas: TfrmCadLojas;

implementation

uses Udm, uFuncoes, udmConsulta, UFrmAdmin, udmDados;

{$R *.dfm}

procedure TfrmCadLojas.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where EMP_CODIGO = ' + uFuncoes.StrZero(edtConsultar.Text,5);
      1: CommandText := CommandText + ' where UPPER(EMP_FANTASIA) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by EMP_FANTASIA';
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

procedure TfrmCadLojas.buscar;
begin
  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'Select * from EMPRESAS '+
                      'Where (EMP_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('EMP_CODIGO').AsString;
       Active := True;
  End;
  dm.CdsEmpresas.Open;
end;

procedure TfrmCadLojas.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadLojas.FormCreate(Sender: TObject);
begin
  inherited;
     //
   If not (UFrmAdmin.admin) Then
   begin
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Lojas...'));
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
     //
   End;
  dm.parametros;
  //
  If (dm.CdsConfigCFG_EMPRESA.Value = 0) Then
      dm.CdsEmpresas.Open
  Else
  Begin
      //
      dm.CdsEmpresas.Close;
      With dm.SdsEmpresas do
      Begin
           Active := False;
           CommandText := 'Select * from EMPRESAS '+
                          'Where (EMP_CODIGO = :pCODIGO)';
           Params.ParamByName('PCODIGO').AsInteger := uFuncoes.mvcodigo('EMP_CODIGO','EMPRESAS');
           Active := True;
      End;
      dm.CdsEmpresas.Open;
  End;
end;

procedure TfrmCadLojas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    dm.CdsEmpresas.Close;
    //
    Action := caFree;
end;

procedure TfrmCadLojas.dbeNRCNPJExit(Sender: TObject);
begin
  inherited;
    If (dm.CdsEmpresas.State in [dsInsert, dsEdit])
     and not uFuncoes.Empty(dbeNRCNPJ.Text) Then
      try
        If not (uFuncoes.CGC(uFuncoes.StrZero(dbeNRCNPJ.Text,14))) Then
        Begin
            MessageDlg('CNPJ inválido!!!', mtInformation, [mbOk], 0);
            dbeNRCNPJ.Clear;
            dbeNRCNPJ.SetFocus;
            Exit;
        End;
      Except
            dbeNRCNPJ.Clear;
            dbeNRCNPJ.SetFocus;
      End;
end;

procedure TfrmCadLojas.dbeNRCNPJKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If (Key = #27) and (dm.CdsEmpresas.State in [dsInsert, dsEdit] ) Then
     Begin
          Key := #0;
          BtCancelarClick(Sender);
     End;
end;

procedure TfrmCadLojas.BtExcluirClick(Sender: TObject);
Var
   iUsuario : Integer;
   aCodigo : String;
begin
  inherited;
  if dm.CdsEmpresas.RecordCount > 0 then
  Begin
     aCodigo  := uFuncoes.StrZero(dm.CdsEmpresasEMP_CODIGO.AsString,3);
     iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
     //
     If Application.MessageBox('Deseja excluir este Condominio?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       begin
             dm.CdsEmpresas.Delete;
             dm.CdsEmpresas.ApplyUpdates(0);
             //
             If not (dm.IncluirTarefaUsuario(iUsuario,
               'Excluiu Condominio : '+aCodigo+' *F*')) Then
                 ShowMessage('Erro ao adicionar tarefa do usuário.');
             //
             dm.CdsEmpresas.Close;
             dm.SdsEmpresas.ParamByName('pCodigo').AsInteger := uFuncoes.mvcodigo('EMP_CODIGO','EMPRESAS');
             dm.CdsEmpresas.Open;
             //
       end
      else
          showmessage('Não ha registro a ser excluido');
  End;
end;

procedure TfrmCadLojas.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.CdsEmpresas.Cancel;
  //
  if (dm.CdsEmpresas.IsEmpty) Then
    Close;
end;

procedure TfrmCadLojas.BtGravarClick(Sender: TObject);
Var
   M_HOMOVI : String;
   iUsuario : Integer;
begin
  inherited;
  If uFuncoes.Empty(dbeNRCNPJ.Text) Then
  Begin
       Application.MessageBox('Digite o número do CNPJ!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNRCNPJ.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(dbeNMFANT.Text) Then
  Begin
       Application.MessageBox('Digite o nome de fantasia!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMFANT.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(dbeNMRAZA.Text) Then
  Begin
       Application.MessageBox('Digite a razão social!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMRAZA.SetFocus;
       Exit;
  End;
  //
  iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
  //
  Try
    tratabotoes;
    M_HOMOVI := Copy(TimetoStr(time),1,5);
    //
    if dm.CdsEmpresas.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_EMPRESA.Value := dm.CdsConfigCFG_EMPRESA.Value+1;
      dm.CdsEmpresasEMP_CODIGO.Value := dm.CdsConfigCFG_EMPRESA.Value;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
      //
      Dm.CdsEmpresasEMP_DATA_CAD.AsDateTime := Date();
      dm.CdsEmpresasEMP_HOCADA.AsString     := M_HOMOVI;
      dm.CdsEmpresasEMP_USUARIO_CAD.AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
      //
      If not (dm.IncluirTarefaUsuario( iUsuario,
            'Incluiu Condominio : '+uFuncoes.StrZero(dm.CdsEmpresasEMP_CODIGO.AsString,3)+' *F*')) Then
           ShowMessage('Erro ao adicionar tarefa do usuário.');
    end
    Else
      If not (dm.IncluirTarefaUsuario( iUsuario,
            'Alterou Condominio : '+uFuncoes.StrZero(dm.CdsEmpresasEMP_CODIGO.AsString,3)+' *F*')) Then
              ShowMessage('Erro ao adicionar tarefa do usuário.');
    //
    if dm.CdsEmpresas.State in [dsEdit] then
    begin
      Dm.CdsEmpresasEMP_DATA_ALT.AsDateTime := Date();
      dm.CdsEmpresasEMP_HORA_ALT.AsString     := M_HOMOVI;
      dm.CdsEmpresasEMP_USUARIO_ALT.AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
    End;

    //
    dm.CdsEmpresas.ApplyUpdates(0);
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.CdsEmpresas.Cancel;
        End;
  End;
end;

procedure TfrmCadLojas.btnAlterarClick(Sender: TObject);
begin
  inherited;
    If not (cdsConsultar.IsEmpty) Then
    begin
        buscar;
        PageControl1.ActivePageIndex := 0;
        dbeNRCNPJ.SetFocus;
    End;
end;

procedure TfrmCadLojas.BtEditarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.CdsEmpresas.Edit;
  dbeNRCNPJ.SetFocus;
end;

procedure TfrmCadLojas.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm.CdsEmpresas.Append;
  Dm.RefreshCDS(dmConsultas.cdsCidades);
  dbeNRCNPJ.SetFocus;
  dm.CdsEmpresasEMP_CODIGO.Value := dm.CdsConfigCFG_EMPRESA.Value+1;
end;

procedure TfrmCadLojas.cmbCidadeExit(Sender: TObject);
begin
  inherited;
     If (dm.CdsEmpresas.State in [dsInsert, dsEdit]) Then
     begin
          dmConsultas.cdsBairros.Close;
          With dmConsultas.dstBairros do
          Begin
               Active := False;
               CommandText := 'Select * from BAIRROS Where (CID_CODIGO = :pCODIGO)'+
                              ' order by BAI_NOME';
               Params.ParamByName('pCODIGO').AsInteger := dm.CdsEmpresas.FieldByName('CID_CODIGO').AsInteger;
               Active := True;
          End;
          dmConsultas.cdsBairros.Open;
     End;
end;


procedure TfrmCadLojas.dbeNMFANTExit(Sender: TObject);
begin
  inherited;
  If (Dm.CdsEmpresas.State in [dsInsert]  )
    and not uFuncoes.Empty(dbeNMFANT.Text) Then
  begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select EMP_FANTASIA from EMPRESAS Where (EMP_FANTASIA = :pFANTASIA)');
           Params.ParamByName('pFANTASIA').AsString := dbeNMFANT.Text;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Application.MessageBox('Loja já cadastrada!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeNMFANT.SetFocus;
                 dbeNMFANT.Clear;
                 Exit;
            End;
      End;
   End;
end;

procedure TfrmCadLojas.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
       with cdsConsultar do
       begin
            Close;
            CommandText := 'Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS';
            case rgConsultar.ItemIndex of
              0: CommandText := CommandText + ' where EMP_CODIGO = ' + uFuncoes.StrZero(edtConsultar.Text,5);
              1: CommandText := CommandText + ' where UPPER(EMP_FANTASIA) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
            end;
            CommandText := CommandText + 'order by EMP_FANTASIA';
            Open;
       End;     // Fim-with
  end;
end;

procedure TfrmCadLojas.FormShow(Sender: TObject);
begin
  inherited;
     if (dm.CdsEmpresas.IsEmpty) Then
      begin
           Dm.RefreshCDS(dmConsultas.cdsCidades);
           BtAdicionarClick(Sender);
      End;
end;

end.
