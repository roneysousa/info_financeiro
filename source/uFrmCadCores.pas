unit uFrmCadCores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadCores = class(TfrmCadastro)
    Label1: TLabel;
    dbeDescricao: TDBEdit;
    dsCores: TDataSource;
    Label2: TLabel;
    DBText1: TDBText;
    cdsConsultarCOR_CODIGO: TIntegerField;
    cdsConsultarCOR_DESCRICAO: TStringField;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure registro;
     Function Validar_Cor(M_NMDESC : String): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadCores: TfrmCadCores;

implementation

uses uFuncoes, uDm2, Udm, udmConsulta, UFrmAdmin;

{$R *.dfm}

{ TfrmCadCores }

procedure TfrmCadCores.buscar;
begin
  With DM2.cdsCores  do
  Begin
       Active := False;
       Params.ParamByName('pCODIGO').AsInteger := cdsConsultar.FieldByName('COR_CODIGO').AsInteger;
       Active := True;
  End;
end;

procedure TfrmCadCores.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadCores.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm2.cdsCores.Append;
  dm2.cdsCoresCOR_CODIGO.AsInteger := dm.CdsConfigCFG_COR.AsInteger+1;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadCores.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dm2.CdsCores.RecordCount > 0) then
  Begin
      tratabotoes;
      dm2.CdsCores.Edit;
      dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadCores.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm2.CdsCores.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm2.CdsCores.Delete;
       dm2.CdsCores.ApplyUpdates(0);
       //
       registro;
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadCores.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm2.cdsCores.Cancel;
  If (dm2.cdsCores.RecordCount = 0) Then
     Close;
end;

procedure TfrmCadCores.BtGravarClick(Sender: TObject);
begin
  inherited;
  If uFuncoes.Empty(dbeDescricao.Text) Then
  Begin
       Application.MessageBox('Digite a descrição da cor!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeDescricao.SetFocus;
       Exit;
  End;
  //
  If (DM2.cdsCores.State in [dsinsert]) Then
    If Validar_Cor(dbeDescricao.Text) Then
    Begin
         Application.MessageBox('Descrição de cor já cadastrada!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         PageControl1.ActivePageIndex := 0;
         dbeDescricao.Clear; 
         dbeDescricao.SetFocus;
         Exit;
    End;
  //
  Try
    //
    tratabotoes;
    if dm2.CdsCores.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_COR.AsInteger := dm.CdsConfigCFG_COR.AsInteger+1;
      dm2.CdsCoresCOR_CODIGO.Value := dm.CdsConfigCFG_COR.AsInteger;
      dm.CdsConfig.ApplyUpdates(0);
    end;
    dm2.cdsCores.Post;
    dm2.cdsCores.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm2.cdsCores.Cancel;
        End;
  End;
end;

procedure TfrmCadCores.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
        with cdsConsultar do
        begin
             Close;
             CommandText := 'Select COR_CODIGO, COR_DESCRICAO from CORES ';
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where COR_CODIGO = ' + edtConsultar.Text;
               1: CommandText := CommandText + ' where UPPER(COR_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
             end;
             CommandText := CommandText + 'order by COR_DESCRICAO';
             Open;
        end;  // fim-with
  end;       // fim-se
end;

procedure TfrmCadCores.btnAlterarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadCores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dm2.cdsCores.Close;
     //
     Action := caFree; 
end;

procedure TfrmCadCores.registro;
begin
     with DM2.cdsCores  do
      begin
            Close;
            Params.ParamByName('PCODIGO').AsInteger := uFuncoes.mvcodigo('COR_CODIGO','CORES');
            Open;
      End;
end;

procedure TfrmCadCores.FormShow(Sender: TObject);
begin
  inherited;
  DM.parametros;
  //
  If (DM.CdsConfigCFG_COR.AsInteger = 0) Then
  Begin
       with DM2.cdsCores  do
        begin
             Close;
             Open;
        End;
        BtAdicionarClick(Sender);
  end
  Else
       registro;
end;

function TfrmCadCores.Validar_Cor(M_NMDESC: String): Boolean;
begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select COR_DESCRICAO from CORES ');
           SQL.Add('Where (COR_DESCRICAO = :pDESCRICAO)');
           Params.ParamByName('pDESCRICAO').AsString := M_NMDESC;
           Open;
           //
           If not (IsEmpty) Then
              Result := True
           Else
              Result := False;
           //
           Close;
      End;
end;

procedure TfrmCadCores.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Cores...'));
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
