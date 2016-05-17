unit uFrmCadTributacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadTributacao = class(TfrmCadastro)
    cdsConsultarTRI_CODIGO: TIntegerField;
    cdsConsultarTRI_DESCRICAO: TStringField;
    Label1: TLabel;
    dsTributacao: TDataSource;
    Label2: TLabel;
    dbeNMDESC: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBText1: TDBText;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarChange(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTributacao: TfrmCadTributacao;

implementation

uses Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

{ TfrmCadTributacao }

procedure TfrmCadTributacao.buscar;
begin
  dm.cdsTributacao.Close;
  With dm.dstTributacao do
  Begin
       Active := False;
       CommandText := 'Select * from TRIBUTACAO '+
                      'Where (TRI_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('TRI_CODIGO').AsString;
       Active := True;
  End;
  dm.cdsTributacao.Open;
end;

procedure TfrmCadTributacao.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadTributacao.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm.cdsTributacao.Append;
  dbeNMDESC.SetFocus;
  dm.cdsTributacaoTRI_CODIGO.Value := dm.CdsConfigCFG_TRIBUTACAO.Value+1;
end;

procedure TfrmCadTributacao.BtEditarClick(Sender: TObject);
begin
  inherited;
  if dm.cdsTributacao.RecordCount > 0 then
  Begin
       tratabotoes;
       dm.cdsTributacao.Edit;
       dbeNMDESC.SetFocus;
  End;
end;

procedure TfrmCadTributacao.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.cdsTributacao.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir esta tributação?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.cdsTributacao.Delete;
       dm.cdsTributacao.ApplyUpdates(0);
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadTributacao.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsTributacao.Cancel;
  //
  If (dm.cdsTributacao.RecordCount > 0 ) Then
      Close;
end;

procedure TfrmCadTributacao.BtGravarClick(Sender: TObject);
begin
  inherited;
  If uFuncoes.Empty(dbeNMDESC.Text) Then
  Begin
       Application.MessageBox('Digite a descrição!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMDESC.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if dm.cdsTributacao.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_TRIBUTACAO.Value := dm.CdsConfigCFG_TRIBUTACAO.Value+1;
      dm.cdsTributacaoTRI_CODIGO.Value := dm.CdsConfigCFG_TRIBUTACAO.Value;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
    end;
    //
    {if uFuncoes.Empty(dbePercentual.Text) Then
       dm.cdsTributacao.FieldByName('TRI_PERCETUAL').AsFloat := 0;}
    //
    dm.cdsTributacao.Post;
    dm.cdsTributacao.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           tratabotoes;
           dm.cdsTributacao.Cancel;
        End;
  End;
end;

procedure TfrmCadTributacao.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from TRIBUTACAO ';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where TRI_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(TRI_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by TRI_DESCRICAO';
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

procedure TfrmCadTributacao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty ) then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       dbeNMDESC.SetFocus;
  End;
end;

procedure TfrmCadTributacao.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Tributação...'));
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
   dm.RefreshCDS(dm.cdsTributacao);
end;

procedure TfrmCadTributacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    dm.cdsTributacao.Close;
    Action := caFree;
end;

procedure TfrmCadTributacao.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFUncoes.Empty(edtConsultar.Text) Then
     begin
           with cdsConsultar do
           begin
                Close;
                CommandText := 'Select * from TRIBUTACAO ';
                case rgConsultar.ItemIndex of
                  0: CommandText := CommandText + ' where TRI_CODIGO = ' + edtConsultar.Text;
                  1: CommandText := CommandText + ' where UPPER(TRI_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                end;
                CommandText := CommandText + 'order by TRI_DESCRICAO';
                Open;
           End;  // fim-with
     End;   //fim-se
end;

end.
