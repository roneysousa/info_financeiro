unit uFrmCadMotDevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadMotivoDevolucao = class(TfrmCadastro)
    Label1: TLabel;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    DBText1: TDBText;
    cdsConsultarDEV_CODIGO: TIntegerField;
    cdsConsultarDEV_NOME: TStringField;
    procedure BtGravarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarChange(Sender: TObject);
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
  frmCadMotivoDevolucao: TfrmCadMotivoDevolucao;

implementation

uses uDm2, Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

procedure TfrmCadMotivoDevolucao.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(edtDescricao.Text) Then
  Begin
       Application.MessageBox('Digite a descrição!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       edtDescricao.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if dm2.cdsMotDevolucao.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_MOTIVODEVOLUCAO.Value := dm.CdsConfigCFG_MOTIVODEVOLUCAO.Value+1;
      dm2.cdsMotDevolucaoDEV_CODIGO.Value   := dm.CdsConfigCFG_MOTIVODEVOLUCAO.Value;
      dm.CdsConfig.ApplyUpdates(0);
    end;
    dm2.cdsMotDevolucao.Post;
    dm2.cdsMotDevolucao.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm2.cdsMotDevolucao.Cancel;
        End;
  End;
  inherited;
end;

procedure TfrmCadMotivoDevolucao.buscar;
begin
  dm2.cdsMotDevolucao.Close;
  With dm2.dstMotDevolucao do
  Begin
       Active := False;
       CommandText := 'Select * from DEVOLUCAO '+
                      'Where (DEV_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('DEV_CODIGO').AsString;
       Active := True;
  End;
  dm2.cdsMotDevolucao.Open;
end;

procedure TfrmCadMotivoDevolucao.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadMotivoDevolucao.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dm2.cdsMotDevolucao.RecordCount > 0) then
  Begin
      tratabotoes;
      dm2.cdsMotDevolucao.Edit;
      edtDescricao.SetFocus;
  End;
end;

procedure TfrmCadMotivoDevolucao.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm2.cdsMotDevolucao.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm2.cdsMotDevolucao.Delete;
       dm2.cdsMotDevolucao.ApplyUpdates(0);
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadMotivoDevolucao.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm2.cdsMotDevolucao.Cancel;
  //
  If (dm2.cdsMotDevolucao.RecordCount > 0 ) Then
      Close;
end;

procedure TfrmCadMotivoDevolucao.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm2.cdsMotDevolucao.Append;
  dm2.cdsMotDevolucaoDEV_CODIGO.Value := dm.CdsConfigCFG_MOTIVODEVOLUCAO.Value+1;
  edtDescricao.SetFocus;
end;

procedure TfrmCadMotivoDevolucao.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from DEVOLUCAO';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where DEV_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(DEV_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by DEV_NOME';
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

procedure TfrmCadMotivoDevolucao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       edtDescricao.SetFocus;
  End;
end;

procedure TfrmCadMotivoDevolucao.FormShow(Sender: TObject);
begin
  inherited;
  dm2.cdsMotDevolucao.Close;
  With dm2.dstMotDevolucao do
  Begin
       Active := False;
       CommandText := 'Select * from DEVOLUCAO order by DEV_CODIGO';
       Active := True;
  End;
  dm2.cdsMotDevolucao.Open;
end;

procedure TfrmCadMotivoDevolucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      dm2.cdsMotDevolucao.Close;
      //
      Action := caFree;
end;

procedure TfrmCadMotivoDevolucao.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
       with cdsConsultar do
         begin
           Close;
           CommandText := 'Select * from DEVOLUCAO';
           case rgConsultar.ItemIndex of
             0: CommandText := CommandText + ' where DEV_CODIGO = ' + edtConsultar.Text;
             1: CommandText := CommandText + ' where UPPER(DEV_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
           end;
           CommandText := CommandText + 'order by DEV_NOME';
           Open;
         End;  //fim-with
     End;   //fim-se
end;

procedure TfrmCadMotivoDevolucao.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Motivo da devolução'));
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
