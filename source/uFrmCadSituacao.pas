unit uFrmCadSituacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask;

type
  TfrmCadSituacao = class(TfrmCadastro)
    cdsConsultarSIT_CODIGO: TIntegerField;
    cdsConsultarSIT_NOME: TStringField;
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
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  frmCadSituacao: TfrmCadSituacao;

implementation

uses Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

{ TfrmCadSituacao }

procedure TfrmCadSituacao.buscar;
begin
  dm.CdsSituacao.Close;
  With dm.SdsSituacao do
  Begin
       Active := False;
       CommandText := 'Select * from SITUACAO '+
                      'Where (SIT_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('SIT_CODIGO').AsString;
       Active := True;
  End;
  dm.CdsSituacao.Open;

end;

procedure TfrmCadSituacao.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadSituacao.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm.CdsSituacao.Append;
  dbeNMDESC.SetFocus;
  dm.CdsSituacaoSIT_CODIGO.Value := dm.CdsConfigCFG_SITUACAO.Value+1;

end;

procedure TfrmCadSituacao.BtEditarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.CdsSituacao.Edit;
  dbeNMDESC.SetFocus;
end;

procedure TfrmCadSituacao.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.CdsSituacao.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.CdsSituacao.Delete;
       dm.CdsSituacao.ApplyUpdates(0);
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadSituacao.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.CdsSituacao.Cancel;
  //
  If (dm.CdsSituacao.RecordCount >0) Then
     Close;
end;

procedure TfrmCadSituacao.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeNMDESC.Text) Then
  Begin
       Application.MessageBox('Digite a descrição da situação!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMDESC.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if dm.CdsSituacao.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_SITUACAO.Value := dm.CdsConfigCFG_SITUACAO.Value+1;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsSituacaoSIT_CODIGO.Value := dm.CdsConfigCFG_SITUACAO.Value;
    end;
    dm.CdsSituacao.Post;
    dm.CdsSituacao.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.CdsSituacao.Cancel;
        End;
  End;
  inherited;
end;

procedure TfrmCadSituacao.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from SITUACAO';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where SIT_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(SIT_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by SIT_NOME';
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

procedure TfrmCadSituacao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       dbeNMDESC.SetFocus;
   End;
end;

procedure TfrmCadSituacao.FormActivate(Sender: TObject);
begin
  inherited;
    If (dm.CdsSituacao.Active = False) Then
         dm.CdsSituacao.Open;
end;

procedure TfrmCadSituacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.CdsSituacao.Close;
     Action := caFree;
  inherited;
end;

procedure TfrmCadSituacao.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
       with cdsConsultar do
       begin
            Close;
            CommandText := 'Select * from SITUACAO';
            case rgConsultar.ItemIndex of
              0: CommandText := CommandText + ' where SIT_CODIGO = ' + edtConsultar.Text;
              1: CommandText := CommandText + ' where UPPER(SIT_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
            end;
            CommandText := CommandText + 'order by SIT_NOME';
            Open;
       End;  //fim-with
  End;       //fim-se
end;

procedure TfrmCadSituacao.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Situação...'));
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

procedure TfrmCadSituacao.FormShow(Sender: TObject);
begin
  inherited;
  Dm.RefreshCDS(dm.CdsSituacao);
  //
  If (dm.CdsSituacao.IsEmpty) Then
      BtAdicionarClick(Self);
end;

end.
