unit uFrmCadRegiao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask;

type
  TfrmCadRegiao = class(TfrmCadastro)
    Label2: TLabel;
    DBText1: TDBText;
    cdsConsultarREG_CODIGO: TIntegerField;
    cdsConsultarREG_DESCRICAO: TStringField;
    Label1: TLabel;
    dbeDescricao: TDBEdit;
    dsRegioes: TDataSource;
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
  public
    { Public declarations }
  end;

var
  frmCadRegiao: TfrmCadRegiao;

implementation

uses uDm2, Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

{ TfrmCadRegiao }

procedure TfrmCadRegiao.buscar;
begin
    DM2.cdsRegioes.Locate('REG_CODIGO',
                       cdsConsultar.FieldByName('REG_CODIGO').AsInteger,
                       []);
end;

procedure TfrmCadRegiao.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadRegiao.btnAlterarClick(Sender: TObject);
begin
  inherited;
     buscar;
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadRegiao.FormShow(Sender: TObject);
begin
  inherited;
     Dm.parametros;
     //
     DM2.cdsRegioes.Open;
     //
     If (Dm.CdsConfigCFG_REGIAO.AsInteger = 0) Then
        BtAdicionarClick(Self);
end;

procedure TfrmCadRegiao.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm2.cdsRegioes.Append;
  dm2.cdsRegioesREG_CODIGO.AsInteger := dm.CdsConfigCFG_REGIAO.AsInteger+1;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadRegiao.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dm2.cdsRegioes.RecordCount > 0) then
  Begin
      tratabotoes;
      dm2.cdsRegioes.Edit;
      dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadRegiao.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if (dm2.cdsRegioes.RecordCount > 0) then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm2.cdsRegioes.Delete;
       dm2.cdsRegioes.ApplyUpdates(0);
       //
       dm2.cdsRegioes.First;
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadRegiao.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm2.cdsRegioes.Cancel;
  //
  If (dm2.cdsRegioes.RecordCount = 0) Then
     Close;
end;

procedure TfrmCadRegiao.BtGravarClick(Sender: TObject);
begin
  inherited;
  If uFuncoes.Empty(dbeDescricao.Text) Then
  Begin
       Application.MessageBox('Digite a descrição da região!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeDescricao.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if dm2.cdsRegioes.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_REGIAO.AsInteger := dm.CdsConfigCFG_REGIAO.AsInteger+1;
      dm2.cdsRegioesREG_CODIGO.Value := dm.CdsConfigCFG_REGIAO.AsInteger;
      dm.CdsConfig.ApplyUpdates(0);
    end;
    dm2.cdsRegioes.Post;
    dm2.cdsRegioes.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm2.cdsRegioes.Cancel;
        End;
  End;
end;

procedure TfrmCadRegiao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    DM2.cdsRegioes.Close;
    //
    Action := caFree; 
end;

procedure TfrmCadRegiao.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
       with cdsConsultar do
       begin
            Close;
            CommandText := 'Select REG_CODIGO, REG_DESCRICAO from REGIAO';
            case rgConsultar.ItemIndex of
              0: CommandText := CommandText + ' where REG_CODIGO = ' + edtConsultar.Text;
              1: CommandText := CommandText + ' where UPPER(REG_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
            end;
            CommandText := CommandText + 'order by REG_DESCRICAO ' ;
            Open;
       end;
  end;
end;

procedure TfrmCadRegiao.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Região...'));
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
