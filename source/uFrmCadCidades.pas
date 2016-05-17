unit uFrmCadCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr,
  Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadCidades = class(TfrmCadastro)
    datasetConsultarCID_CODIGO: TIntegerField;
    datasetConsultarCID_NOME: TStringField;
    datasetConsultarCID_UF: TStringField;
    cdsConsultarCID_CODIGO: TIntegerField;
    cdsConsultarCID_NOME: TStringField;
    cdsConsultarCID_UF: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    dbeNMCIDADE: TDBEdit;
    Label3: TLabel;
    DBText1: TDBText;
    cmbUFCLIE: TDBComboBox;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     function Validar_Descricao(aNome, aUF : String) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCidades: TfrmCadCidades;

implementation

uses Udm, uFuncoes, Math, udmConsulta, UFrmAdmin; 

{$R *.dfm}

procedure TfrmCadCidades.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm.CdsCidades.Append;
  dbeNMCIDADE.SetFocus;
  dm.CdsCidadesCID_CODIGO.Value := dm.CdsConfigCFG_CIDADE.Value+1;
end;

procedure TfrmCadCidades.buscar;
begin
  dm.CdsCidades.Close;
  With dm.SdsCidades do
  Begin
       Active := False;
       CommandText := 'Select * from CIDADES '+
                      'Where (CID_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('CID_CODIGO').AsString;
       Active := True;
  End;
  dm.CdsCidades.Open;
end;

procedure TfrmCadCidades.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadCidades.BtEditarClick(Sender: TObject);
begin
  inherited;
  if dm.CdsCidades.RecordCount > 0 then
  Begin
       tratabotoes;
       dm.CdsCidades.Edit;
       dbeNMCIDADE.SetFocus;
  End;
end;

procedure TfrmCadCidades.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.CdsCidades.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir esta cidade?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.CdsCidades.Delete;
       dm.CdsCidades.ApplyUpdates(0);
       {dm.cdsBancos.Close;
       dm.dstBancos.ParamByName('PCODIGO').AsString := dm.mscodigo('BAN_CODIGO','BANCOS');
       dm.cdsBancos.Open;}
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadCidades.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.CdsCidades.Cancel;
  //
  If Dm.CdsCidades.IsEmpty Then
      Close;
end;

procedure TfrmCadCidades.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeNMCIDADE.Text) Then
  Begin
       Application.MessageBox('Digite o nome da cidade!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMCIDADE.SetFocus;
       Exit;
  End;
  //
  If (Validar_Descricao(dbeNMCIDADE.Text, cmbUFCLIE.Text)) Then
  begin
      dbeNMCIDADE.SetFocus;  
      raise Exception.Create('Cidade já cadastrado no UF.');
  End;
  //
  Try
    //
    tratabotoes;
    if dm.CdsCidades.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_CIDADE.Value := dm.CdsConfigCFG_CIDADE.Value+1;
      dm.CdsCidadesCID_CODIGO.Value := dm.CdsConfigCFG_CIDADE.Value;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
    end;
    dm.CdsCidades.Post;
    dm.CdsCidades.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.CdsCidades.Cancel;
        End;
  End;
  //
  inherited;
end;

procedure TfrmCadCidades.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       dbeNMCIDADE.SetFocus;
  End;
end;

procedure TfrmCadCidades.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from CIDADES';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where CID_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(CID_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by CID_NOME';
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

procedure TfrmCadCidades.FormActivate(Sender: TObject);
begin
  inherited;
     dm.parametros;
     dm.CdsCidades.Open;
end;

procedure TfrmCadCidades.FormShow(Sender: TObject);
begin
  inherited;
     dm.parametros;
     dm.CdsCidades.Open;
     //
     If Dm.CdsCidades.IsEmpty Then
        BtAdicionarClick(Sender);
end;

procedure TfrmCadCidades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      dm.CdsCidades.Close;
      Action := caFree;
end;

procedure TfrmCadCidades.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
        with cdsConsultar do
        begin
             Close;
             CommandText := 'Select * from CIDADES';
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where CID_CODIGO = ' + edtConsultar.Text;
               1: CommandText := CommandText + ' where UPPER(CID_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
             end;
             CommandText := CommandText + 'order by CID_NOME';
             Open;
        End;  //fim-with
  End;     // fim-se
end;

function TfrmCadCidades.Validar_Descricao(aNome, aUF : String): Boolean;
var qraux : TSQLquery;
    tabela, texto : string;
begin
  result := False;
  tabela := 'CIDADES';
  texto := 'Select CID_NOME from '+tabela+ ' where (CID_NOME = :NOME) and (CID_UF = :UF)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params[0].AsString := aNome;
      Params[1].AsString := aUF;
      open;
      If not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
end;

procedure TfrmCadCidades.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Cidades...'));
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
