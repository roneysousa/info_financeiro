unit uFrmCadAtividade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask;

type
  TfrmCadAtividades = class(TfrmCadastro)
    cdsConsultarATI_CODIGO: TIntegerField;
    cdsConsultarATI_NOME: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    dbeNMDESC: TDBEdit;
    DBText1: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeNMDESCExit(Sender: TObject);
    procedure dbeNMDESCKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure Validar_Entrada;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAtividades: TfrmCadAtividades;

implementation

uses Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

procedure TfrmCadAtividades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.CdsAtividades.Close;
  Action := caFree;
end;

procedure TfrmCadAtividades.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm.CdsAtividades.Append;
  dbeNMDESC.SetFocus;
  dm.CdsAtividadesATI_CODIGO.Value := dm.CdsConfigCFG_ATIVIDADE.Value+1;
end;

procedure TfrmCadAtividades.buscar;
begin
  dm.CdsAtividades.Close;
  With dm.SdsAtividades do
  Begin
       Active := False;
       CommandText := 'Select * from ATIVIDADES '+
                      'Where (ATI_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('ATI_CODIGO').AsString;
       Active := True;
  End;
  dm.CdsAtividades.Open;
end;

procedure TfrmCadAtividades.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadAtividades.BtEditarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.CdsAtividades.Edit;
  dbeNMDESC.SetFocus;
end;

procedure TfrmCadAtividades.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.CdsAtividades.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.CdsAtividades.Delete;
       dm.CdsAtividades.ApplyUpdates(0);
       //
       {dm.CdsAtividades.Close;
       dm.SdsAtividades.ParamByName('IdCodigo').AsString := uFuncoes.mscodigo('ATI_CODIGO','ATIVIDADES');
       dm.CdsAtividades.Open;}
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadAtividades.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.CdsAtividades.Cancel;
  //
  If (dm.CdsAtividades.IsEmpty) Then
      Close;
end;

procedure TfrmCadAtividades.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeNMDESC.Text) Then
  Begin
       Application.MessageBox('Digite a descrição da atividade!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMDESC.SetFocus;
       Exit;
  End;
  //
  If (dm.CdsAtividades.State in [dsinsert]) Then
  Begin
    with cdsConsultar do
    begin
      Close;
      CommandText := 'Select * from ATIVIDADES';
      CommandText := CommandText + ' where ATI_NOME = ' + QuotedStr(AnsiUpperCase(dbeNMDESC.Text));
      Open;
      if not (IsEmpty) then
      begin
        MessageDlg('Registro já cadastrado!!!', mtInformation, [mbOk], 0);
        dbeNMDESC.Clear;
        if dbeNMDESC.CanFocus then
          dbeNMDESC.SetFocus;
        Exit;
      end;
    end;
  End;
  //
  Try
    //
    tratabotoes;
    if dm.CdsAtividades.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_ATIVIDADE.Value := dm.CdsConfigCFG_ATIVIDADE.Value+1;
      dm.CdsAtividadesATI_CODIGO.Value := dm.CdsConfigCFG_ATIVIDADE.Value;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
    end;
    dm.CdsAtividades.Post;
    dm.CdsAtividades.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.CdsAtividades.Cancel;
        End;
  End;
  inherited;
end;

procedure TfrmCadAtividades.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from ATIVIDADES';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where ATI_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(ATI_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by ATI_NOME';
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

procedure TfrmCadAtividades.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
      //tratabotoes;
      buscar;
      PageControl1.ActivePageIndex := 0;
      // dm.CdsAtividades.Edit;
      dbeNMDESC.SetFocus;
  End;
end;

procedure TfrmCadAtividades.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Atividades...'));
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
     dm.RefreshCDS(Dm.CdsConfig);
     //
     If (dm.CdsConfigCFG_ATIVIDADE.Value = 0) Then
         dm.CdsAtividades.Open
     Else
     Begin
         dm.CdsAtividades.Close;
         With dm.SdsAtividades do
         Begin
              Active := False;
              CommandText := 'Select * from ATIVIDADES '+
                             'Where (ATI_CODIGO = :pCODIGO)';
              ParamByName('pCODIGO').AsString := uFuncoes.mscodigo('ATI_CODIGO','ATIVIDADES');
              Active := True;
         End;
         //
         {dm.SdsAtividades.Active := True;
         dm.SdsAtividades.ParamByName('IdCodigo').AsString := uFuncoes.mscodigo('ATI_CODIGO','ATIVIDADES');}
         dm.CdsAtividades.Open;
     End;
end;

procedure TfrmCadAtividades.Validar_Entrada;
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from ATIVIDADES';
    CommandText := CommandText + ' where ATI_NOME = ' + QuotedStr(AnsiUpperCase(dbeNMDESC.Text));
    Open;
    if not (IsEmpty) then
    begin
      MessageDlg('Registro já cadastrado!!!', mtInformation, [mbOk], 0);
      dbeNMDESC.Clear;
      if dbeNMDESC.CanFocus then
        dbeNMDESC.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmCadAtividades.dbeNMDESCExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeNMDESC.Text)
       and (dm.CdsAtividades.State in [dsinsert]) Then
         Validar_Entrada;
  inherited;          
end;

procedure TfrmCadAtividades.dbeNMDESCKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #27) Then
     Begin
          Key := #13;
          BtCancelarClick(Sender);
     End;
     //
  inherited;

end;

procedure TfrmCadAtividades.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edtConsultar.Text) Then
      begin
           with cdsConsultar do
           begin
                Close;
                CommandText := 'Select * from ATIVIDADES';
                case rgConsultar.ItemIndex of
                  0: CommandText := CommandText + ' where ATI_CODIGO = ' + edtConsultar.Text;
                  1: CommandText := CommandText + ' where UPPER(ATI_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                end;
                CommandText := CommandText + 'order by ATI_NOME';
                Open;
           end;  // fim-with
      End;       // se-fim
end;

procedure TfrmCadAtividades.FormShow(Sender: TObject);
begin
  inherited;
    If (dm.CdsAtividades.IsEmpty) Then
       BtAdicionarClick(Sender); 
end;

end.
