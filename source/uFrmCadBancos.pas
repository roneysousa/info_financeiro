unit uFrmCadBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr,
  Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadBancos = class(TfrmCadastro)
    Label1: TLabel;
    dbeCDBANC: TDBEdit;
    dsBancos: TDataSource;
    Label2: TLabel;
    dbeNMBANC: TDBEdit;
    cdsConsultarBAN_CODIGO: TStringField;
    cdsConsultarBAN_NOME: TStringField;
    qryLocBanco: TSQLQuery;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeCDBANCExit(Sender: TObject);
    procedure dbeCDBANCKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure Validar_Codigo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBancos: TfrmCadBancos;

implementation

uses Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

procedure TfrmCadBancos.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsBancos.Append;
  dbeCDBANC.SetFocus;
end;

procedure TfrmCadBancos.BtEditarClick(Sender: TObject);
begin
  inherited;
  if dm.cdsBancos.RecordCount > 0 then
  Begin
      tratabotoes;
      dm.cdsBancos.Edit;
      dbeCDBANC.SetFocus;
  End;    
end;

procedure TfrmCadBancos.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.cdsBancos.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este banco?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.cdsBancos.Delete;
       dm.cdsBancos.ApplyUpdates(0);
       {dm.cdsBancos.Close;
       dm.dstBancos.ParamByName('PCODIGO').AsString := dm.mscodigo('BAN_CODIGO','BANCOS');
       dm.cdsBancos.Open;}
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadBancos.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsBancos.Cancel;
  //
  If (dm.cdsBancos.IsEmpty) Then
      Close;
end;

procedure TfrmCadBancos.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeCDBANC.Text) Then
  Begin
       Application.MessageBox('Digite o código do banco!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeCDBANC.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(dbeNMBANC.Text) Then
  Begin
       Application.MessageBox('Digite o nome do banco!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMBANC.SetFocus;
       Exit;
  End;
  //
  Validar_Codigo;
  //
  Try
    //
    tratabotoes;
    dm.cdsBancos.Post;
    dm.cdsBancos.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.cdsBancos.Cancel;
        End;
  End;
  //
  inherited;
end;

procedure TfrmCadBancos.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select BAN_CODIGO, BAN_NOME from BANCOS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where BAN_CODIGO = ' + uFuncoes.StrZero(edtConsultar.Text,3);
      1: CommandText := CommandText + ' where UPPER(BAN_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by BAN_NOME';
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

procedure TfrmCadBancos.buscar;
begin
  dm.cdsBancos.Close;
  With dm.dstBancos do
  Begin
       Active := False;
       CommandText := 'Select BAN_CODIGO, BAN_NOME from BANCOS '+
                      'Where (BAN_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('BAN_CODIGO').AsString;
       Active := True;
  End;
  dm.cdsBancos.Open;
end;

procedure TfrmCadBancos.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       // tratabotoes;
      buscar;
      PageControl1.ActivePageIndex := 0;
      //dm.cdsBancos.Edit;
      dbeCDBANC.SetFocus;
  End;
end;

procedure TfrmCadBancos.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadBancos.FormActivate(Sender: TObject);
begin
  inherited;
  dm.cdsBancos.Open;
end;

procedure TfrmCadBancos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.cdsBancos.Close;
  Action := caFree;
end;

procedure TfrmCadBancos.dbeCDBANCExit(Sender: TObject);
begin
  inherited;
  If (dm.cdsBancos.State in [dsInsert])
   And not ufuncoes.Empty(dbeCDBANC.Text) Then
       Validar_Codigo;
end;

procedure TfrmCadBancos.dbeCDBANCKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
end;

procedure TfrmCadBancos.Validar_Codigo;
begin
    If (dm.cdsBancos.State = dsInsert) Then
    Begin
       dbeCDBANC.Text := uFuncoes.StrZero(dbeCDBANC.Text,3);
       with qryLocBanco do
       begin
           Close;
           Params.ParamByName('pCDBANC').AsString := dbeCDBANC.Text;
           Open;
        //
         if not IsEmpty then
         begin
             Application.MessageBox('Registro de banco já cadastro!!!',
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             //
             if dbeCDBANC.CanFocus then
               dbeCDBANC.SetFocus;
             dbeCDBANC.Clear;
             //
             Exit;
         end;
         //dbeCDBANC.Text := uFuncoes.StrZero(dbeCDBANC.Text,3);
       End;
    End;
end;

procedure TfrmCadBancos.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
       with cdsConsultar do
       begin
            Close;
            CommandText := 'Select BAN_CODIGO, BAN_NOME from BANCOS';
            case rgConsultar.ItemIndex of
              0: CommandText := CommandText + ' where BAN_CODIGO = ' + edtConsultar.Text;
              //uFuncoes.StrZero(edtConsultar.Text,3);
              1: CommandText := CommandText + ' where UPPER(BAN_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
            end;
            CommandText := CommandText + 'order by BAN_NOME';
            Open;
       end;
  end;
end;

procedure TfrmCadBancos.FormShow(Sender: TObject);
begin
  inherited;
     dm.cdsBancos.Open; 
     If (dm.cdsBancos.IsEmpty) Then
        BtAdicionarClick(Sender);
end;

procedure TfrmCadBancos.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Bancos...'));
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


