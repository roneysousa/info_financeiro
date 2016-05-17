unit uFrmCadCargos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask;

type
  TfrmCadCargos = class(TfrmCadastro)
    Label1: TLabel;
    Label2: TLabel;
    dbeNMCARGO: TDBEdit;
    DBText1: TDBText;
    cdsConsultarCAR_CODIGO: TIntegerField;
    cdsConsultarCAR_NOME: TStringField;
    procedure BtAdicionarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeNMCARGOExit(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure Registro;
     function Validar_Descricao(aNome : String) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCargos: TfrmCadCargos;

implementation

uses Udm, uFuncoes, Math, UFrmAdmin;

{$R *.dfm}

{ TfrmCadCargos }

procedure TfrmCadCargos.buscar;
begin
  dm.CdsCargos.Close;
  With dm.SdsCargos do
  Begin
       Active := False;
       CommandText := 'Select * from CARGOS '+
                      'Where (CAR_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('CAR_CODIGO').AsString;
       Active := True;
  End;
  dm.CdsCargos.Open;
end;

procedure TfrmCadCargos.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadCargos.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm.CdsCargos.Append;
  dbeNMCARGO.SetFocus;
  dm.CdsCargosCAR_CODIGO.Value := dm.CdsConfigCFG_CARGO.Value+1;
end;

procedure TfrmCadCargos.FormActivate(Sender: TObject);
begin
  inherited;
    dm.parametros;
    If (dm.CdsCargos.Active = False) Then
         dm.CdsCargos.Open;
end;

procedure TfrmCadCargos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dm.CdsCargos.Close;
     Action := caFree;
end;

procedure TfrmCadCargos.BtEditarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.CdsCargos.Edit;
  dbeNMCARGO.SetFocus;
end;

procedure TfrmCadCargos.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.CdsCargos.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este cargo?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.CdsCargos.Delete;
       dm.CdsCargos.ApplyUpdates(0);
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadCargos.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsCargos.Cancel;
  //
  If (dm.cdsCargos.IsEmpty) Then
    Close;
end;

procedure TfrmCadCargos.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeNMCARGO.Text) Then
  Begin
       Application.MessageBox('Digite a descrição do cargo!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMCARGO.SetFocus;
       Exit;
  End;
  //
  If (Dm.CdsCargos.State in [dsInsert]) Then
    If (Validar_Descricao(dbeNMCARGO.Text)) Then
    begin
        dbeNMCARGO.SetFocus;
        raise Exception.Create('Cargo já cadastrado.');
    End;
  //
  Try
    //
    tratabotoes;
    if dm.CdsCargos.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_CARGO.Value := dm.CdsConfigCFG_CARGO.Value+1;
      dm.CdsCargosCAR_CODIGO.Value := dm.CdsConfigCFG_CARGO.Value;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
    end;
    dm.CdsCargos.Post;
    dm.CdsCargos.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.CdsCargos.Cancel;
        End;
  End;
  inherited;
end;

procedure TfrmCadCargos.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from CARGOS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where CAR_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(CAR_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by CAR_NOME';
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

procedure TfrmCadCargos.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       // tratabotoes;
       buscar;
       PageControl1.ActivePageIndex := 0;
       dbeNMCARGO.SetFocus;
  End;
end;

procedure TfrmCadCargos.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
       with cdsConsultar do
       begin
            Close;
            CommandText := 'Select * from CARGOS';
            case rgConsultar.ItemIndex of
              0: CommandText := CommandText + ' where CAR_CODIGO = ' + edtConsultar.Text;
              1: CommandText := CommandText + ' where UPPER(CAR_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
            end;
            CommandText := CommandText + 'order by CAR_NOME';
            Open;
       End;  // fim-with
  End;   // fim-se
end;

procedure TfrmCadCargos.Registro;
begin
  dm.CdsCargos.Close;
  With dm.SdsCargos do
  Begin
       Active := False;
       CommandText := 'Select * from CARGOS '+
                      'Where (CAR_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsInteger := uFuncoes.mvcodigo('CAR_CODIGO','CARGOS');
       Active := True;
  End;
  dm.CdsCargos.Open;
end;

procedure TfrmCadCargos.FormShow(Sender: TObject);
begin
  inherited;
     Registro;
     //
     If (dm.CdsCargos.IsEmpty) Then
        BtAdicionarClick(Sender);
end;

function TfrmCadCargos.Validar_Descricao(aNome: String): Boolean;
var qraux : TSQLquery;
    tabela, texto : string;
begin
  result := False;
  tabela := 'CARGOS';
  texto := 'Select CAR_NOME from '+tabela+ ' where (CAR_NOME = :NOME)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params[0].AsString := aNome;
      open;
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
end;

procedure TfrmCadCargos.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Cargos...'));
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

procedure TfrmCadCargos.dbeNMCARGOExit(Sender: TObject);
begin
  inherited;
  If (Dm.CdsCargos.State in [dsInsert]) and not uFuncoes.Empty(dbeNMCARGO.Text)  Then
    If (Validar_Descricao(dbeNMCARGO.Text)) Then
    begin
        dbeNMCARGO.SetFocus;
        raise Exception.Create('Cargo já cadastrado.');
    End;
end;

end.
