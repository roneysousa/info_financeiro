unit uFrmCadUnidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadUnidades = class(TfrmCadastro)
    cdsConsultarUNI_CODIGO: TStringField;
    cdsConsultarUNI_DESCRICAO: TStringField;
    Label1: TLabel;
    dbeCDUNID: TDBEdit;
    dsUnidades: TDataSource;
    Label2: TLabel;
    dbeNMDESC: TDBEdit;
    qryLocUnidade: TSQLQuery;
    dsConsultar2: TDataSource;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultar2Click(Sender: TObject);
    procedure btnAlterar2Click(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure dsConsultar2DataChange(Sender: TObject; Field: TField);
    procedure dsConsultar2StateChange(Sender: TObject);
    procedure edtConsultar2Change(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
  private
     procedure tratabotoes;
     procedure buscar;
     procedure Validar_Codigo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUnidades: TfrmCadUnidades;

implementation

uses Udm, uFuncoes;

{$R *.dfm}

{ TfrmCadUnidades }

procedure TfrmCadUnidades.buscar;
begin
  dm.cdsUnidades.Close;
  With dm.dstUnidades do
  Begin
       Active := False;
       CommandText := 'Select UNI_CODIGO, UNI_DESCRICAO from UNIDADES '+
                      'Where (UNI_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('UNI_CODIGO').AsString;
       Active := True;
  End;
  dm.cdsUnidades.Open;
end;

procedure TfrmCadUnidades.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadUnidades.Validar_Codigo;
begin
     //dbeCDUNID.Text := uFuncoes.StrZero(dbeCDBANC.Text,3);
     with qryLocUnidade do
     begin
           Close;
           Params.ParamByName('pCODIGO').AsString := dbeCDUNID.Text;
           Open;
        //
         if not IsEmpty then
         begin
             Application.MessageBox('Registro de banco já cadastro!!!',
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             //
             if dbeCDUNID.CanFocus then
               dbeCDUNID.SetFocus;
             dbeCDUNID.Clear;
             //
             Exit;
         end;
     End;
end;

procedure TfrmCadUnidades.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsUnidades.Append;
  dbeCDUNID.Enabled := True;
  dbeCDUNID.SetFocus;
end;

procedure TfrmCadUnidades.BtEditarClick(Sender: TObject);
begin
  inherited;
  if dm.cdsUnidades.RecordCount > 0 then
  Begin
      tratabotoes;
      dm.cdsUnidades.Edit;
      dbeCDUNID.Enabled := False;
      dbeNMDESC.SetFocus;
  End;
end;

procedure TfrmCadUnidades.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.cdsUnidades.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este banco?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.cdsUnidades.Delete;
       dm.cdsUnidades.ApplyUpdates(0);
       {dm.cdsBancos.Close;
       dm.dstBancos.ParamByName('PCODIGO').AsString := dm.mscodigo('BAN_CODIGO','BANCOS');
       dm.cdsBancos.Open;}
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadUnidades.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsUnidades.Cancel;
end;

procedure TfrmCadUnidades.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeCDUNID.Text) Then
  Begin
       Application.MessageBox('Digite o código da unidade!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeCDUNID.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(dbeNMDESC.Text) Then
  Begin
       Application.MessageBox('Digite a descrição da unidade!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMDESC.SetFocus;
       Exit;
  End;
  //
  Validar_Codigo;
  //
  Try
    //
    tratabotoes;
    dm.cdsUnidades.Post;
    dm.cdsUnidades.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.cdsUnidades.Cancel;
        End;
  End;
  inherited;
end;

procedure TfrmCadUnidades.btnAlterarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  buscar;
  PageControl1.ActivePageIndex := 0;
  dm.cdsUnidades.Edit;
  dbeCDUNID.SetFocus;
end;

procedure TfrmCadUnidades.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select UNI_CODIGO, UNI_DESCRICAO from UNIDADES ';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where UNI_CODIGO = ' + uFuncoes.StrZero(edtConsultar.Text,3);
      1: CommandText := CommandText + ' where UPPER(UNI_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by UNI_DESCRICAO';
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

procedure TfrmCadUnidades.FormActivate(Sender: TObject);
begin
  inherited;
  dm.cdsUnidades.Open;
end;

procedure TfrmCadUnidades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm.cdsUnidades.Close;
  inherited;
end;

procedure TfrmCadUnidades.btnConsultar2Click(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select UNI_CODIGO, UNI_DESCRICAO from UNIDADES ';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where UNI_CODIGO = ' + edtConsultar2.Text;
      1: CommandText := CommandText + ' where UPPER(UNI_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar2.Text) + '%');
    end;
    CommandText := CommandText + ' order by UNI_DESCRICAO';
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

procedure TfrmCadUnidades.btnAlterar2Click(Sender: TObject);
begin
  inherited;
  tratabotoes;
  buscar;
  PageControl1.ActivePageIndex := 0;
  dm.cdsUnidades.Edit;
  dbeCDUNID.SetFocus;
end;

procedure TfrmCadUnidades.edtConsultarChange(Sender: TObject);
begin
  inherited;
  btnConsultar2.Enabled := (edtConsultar2.Text <> '');
end;

procedure TfrmCadUnidades.dsConsultar2DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TfrmCadUnidades.dsConsultar2StateChange(Sender: TObject);
begin
  inherited;
  btnAlterar2.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmCadUnidades.edtConsultar2Change(Sender: TObject);
begin
  inherited;
  btnConsultar2.Enabled := (edtConsultar2.Text <> '');
end;

procedure TfrmCadUnidades.rgConsultarClick(Sender: TObject);
begin
  inherited;
    edtConsultar2.SetFocus; 
end;

end.
