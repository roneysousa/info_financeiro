unit uFrmCadGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask;

type
  TfrmCadGrupos = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    dsCadastro: TDataSource;
    cdsConsultarGRU_CODIGO: TIntegerField;
    cdsConsultarGRU_DESCRICAO: TStringField;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar(aCodigo : String);
  public
    { Public declarations }
  end;

var
  frmCadGrupos: TfrmCadGrupos;

implementation

uses udmDados, Udm, uFuncoes;

{$R *.dfm}

{ TfrmCadGrupos }

procedure TfrmCadGrupos.buscar(aCodigo: String);
begin
    dm.FilterCDS(dmDados.cdsGrupos, fsInteger, aCodigo);
end;

procedure TfrmCadGrupos.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled   := not BtGravar.Enabled;
   BtSair.Enabled     := not BtSair.Enabled;
end;

procedure TfrmCadGrupos.BtAdicionarClick(Sender: TObject);
begin
  inherited;
     tratabotoes;
     dm.RefreshCDS(Dm.CdsConfig);
     //
     dmDados.cdsGrupos.Append;
     dmDados.cdsGruposGRU_CODIGO.Value := dm.CdsConfigCFG_GRUPO.AsInteger+1;
     dbeDescricao.SetFocus;
end;

procedure TfrmCadGrupos.BtEditarClick(Sender: TObject);
begin
  inherited;
  if not (dsCadastro.DataSet.IsEmpty) then
    Begin
        tratabotoes;
        dmDados.cdsGrupos.Edit;
        dbeDESCRICAO.SetFocus;
    End;
end;

procedure TfrmCadGrupos.BtCancelarClick(Sender: TObject);
begin
  inherited;
     tratabotoes;
     dsCadastro.DataSet.Cancel;
     //
     If (dsCadastro.DataSet.IsEmpty) Then
        Close;
end;

procedure TfrmCadGrupos.BtGravarClick(Sender: TObject);
begin
  inherited;
  //
  If uFuncoes.Empty(dbeDESCRICAO.Text) Then
  Begin
       Application.MessageBox('Digite a descrição do grupo!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeDESCRICAO.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if dsCadastro.DataSet.State in [dsinsert] then
    begin
      dm.RefreshCDS(dm.CdsConfig);
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_GRUPO.Value := dm.CdsConfigCFG_GRUPO.Value+1;
      dmDados.cdsGruposGRU_CODIGO.AsInteger := dm.CdsConfigCFG_GRUPO.AsInteger;
      dm.CdsConfig.Post;
      dm.CdsConfig.ApplyUpdates(0);
    end;
    //
    dmDados.cdsGrupos.Post;
    dmDados.cdsGrupos.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmDados.cdsGrupos.Cancel;
        End;
  End;
end;

procedure TfrmCadGrupos.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFUncoes.Empty(edtConsultar.Text) Then
     begin
           with cdsConsultar do
           begin
                Close;
                CommandText := 'select GRU_CODIGO, GRU_DESCRICAO from GRUPOS ';
                case rgConsultar.ItemIndex of
                  0: CommandText := CommandText + ' where GRU_CODIGO = ' + edtConsultar.Text;
                  1: CommandText := CommandText + ' where UPPER(GRU_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                end;
                CommandText := CommandText + 'order by GRU_DESCRICAO';
                Open;
           End;
     End;
end;

procedure TfrmCadGrupos.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if not (dsCadastro.DataSet.IsEmpty) then
     If Application.MessageBox('Deseja excluir este grupo?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dsCadastro.DataSet.Delete;
       dmDados.cdsGrupos.ApplyUpdates(0);
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadGrupos.FormShow(Sender: TObject);
begin
  inherited;
     dm.RefreshCDS(Dm.CdsConfig);
     If (dm.CdsConfigCFG_GRUPO.AsInteger > 0) Then
         Dm.FilterCDS(dmDados.cdsGrupos, fsInteger, InttoStr(uFuncoes.mvcodigo('GRU_CODIGO','GRUPOS')))
     Else
         Dm.FilterCDS(dmDados.cdsGrupos, fsInteger, '-1');
     //
     If (dmDados.cdsGrupos.IsEmpty) Then
         BtAdicionarClick(Sender);
end;

procedure TfrmCadGrupos.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty ) then
  begin
       buscar(cdsConsultarGRU_CODIGO.AsString);
       PageControl1.ActivePageIndex := 0;
       dbeDESCRICAO.SetFocus;
  End;
end;

end.
