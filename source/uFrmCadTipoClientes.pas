unit uFrmCadTipoClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask;

type
  TfrmCadTipoCliente = class(TfrmCadastro)
    Label2: TLabel;
    DBText1: TDBText;
    Label1: TLabel;
    dbeDescricao: TDBEdit;
    dsTipoClientes: TDataSource;
    cdsConsultarTPC_CODIGO: TIntegerField;
    cdsConsultarTPC_DESCRICAO: TStringField;
    procedure btnAlterarClick(Sender: TObject);
    procedure edtConsultarDblClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
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
  frmCadTipoCliente: TfrmCadTipoCliente;

implementation

uses uDm2, Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

{ TfrmCadTipoCliente }

procedure TfrmCadTipoCliente.buscar;
begin
    DM2.cdsTpClientes.Locate('TPC_CODIGO',
                       cdsConsultar.FieldByName('TPC_CODIGO').AsInteger,
                       []);
end;

procedure TfrmCadTipoCliente.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadTipoCliente.btnAlterarClick(Sender: TObject);
begin
  inherited;
     buscar;
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadTipoCliente.edtConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnAlterarClick(Sender);
end;

procedure TfrmCadTipoCliente.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm2.cdsTpClientes.Append;
  dm2.cdsTpClientesTPC_CODIGO.AsInteger := dm.CdsConfigCFG_TIPOCLIENTE.AsInteger+1;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadTipoCliente.FormShow(Sender: TObject);
begin
  inherited;
     Dm.parametros;
     //
     DM2.cdsTpClientes.Open;
     //
     If (Dm.CdsConfigCFG_TIPOCLIENTE.AsInteger = 0) Then
        BtAdicionarClick(Self);
end;

procedure TfrmCadTipoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    DM2.cdsTpClientes.Close;
    //
    Action := caFree; 
end;

procedure TfrmCadTipoCliente.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dm2.cdsTpClientes.RecordCount > 0) then
  Begin
      tratabotoes;
      dm2.cdsTpClientes.Edit;
      dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadTipoCliente.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if (dm2.cdsTpClientes.RecordCount > 0) then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm2.cdsTpClientes.Delete;
       dm2.cdsTpClientes.ApplyUpdates(0);
       //
       dm2.cdsTpClientes.First; 
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadTipoCliente.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm2.cdsTpClientes.Cancel;
  //
  If (dm2.cdsTpClientes.RecordCount = 0) Then
     Close;
end;

procedure TfrmCadTipoCliente.BtGravarClick(Sender: TObject);
begin
  inherited;
  If uFuncoes.Empty(dbeDescricao.Text) Then
  Begin
       Application.MessageBox('Digite a descrição do tipo de cliente!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeDescricao.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if dm2.cdsTpClientes.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_TIPOCLIENTE.AsInteger := dm.CdsConfigCFG_TIPOCLIENTE.AsInteger+1;
      dm2.cdsTpClientesTPC_CODIGO.Value := dm.CdsConfigCFG_TIPOCLIENTE.AsInteger;
      dm.CdsConfig.ApplyUpdates(0);
    end;
    dm2.cdsTpClientes.Post;
    dm2.cdsTpClientes.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm2.cdsTpClientes.Cancel;
        End;
  End;
end;

procedure TfrmCadTipoCliente.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
       with cdsConsultar do
       begin
            Close;
            CommandText := 'Select TPC_CODIGO, TPC_DESCRICAO from TIPOCLIENTE';
            case rgConsultar.ItemIndex of
              0: CommandText := CommandText + ' where TPC_CODIGO = ' + edtConsultar.Text;
              1: CommandText := CommandText + ' where UPPER(TPC_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
            end;
            CommandText := CommandText + 'order by TPC_DESCRICAO ' ;
            Open;
       end;
  end;
end;

procedure TfrmCadTipoCliente.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Tipos de Clientes...'));
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
