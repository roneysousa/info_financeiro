unit uFrmCadPlano;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask;

type
  TfrmCadPlano = class(TfrmCadastro)
    dsPlanos: TDataSource;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label1: TLabel;
    DBText1: TDBText;
    cdsConsultarPLA_CODIGO: TIntegerField;
    cdsConsultarPLA_DESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure registro;
 //    Function Validar_Cor(M_NMDESC : String): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadPlano: TfrmCadPlano;

implementation

uses udmDados, Udm, uFuncoes;

{$R *.dfm}

{ TfrmCadPlano }

procedure TfrmCadPlano.buscar;
begin
     Dm.FilterCDS( dmDados.cdsPlanos, fsInteger, cdsConsultarPLA_CODIGO.AsString);
end;

procedure TfrmCadPlano.registro;
begin
     Dm.FilterCDS( dmDados.cdsPlanos, fsInteger, uFuncoes.mscodigo('PLA_CODIGO','PLANO_PAGAMENTO'));
end;

procedure TfrmCadPlano.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadPlano.FormShow(Sender: TObject);
begin
  inherited;
     Dm.RefreshCDS(Dm.CdsConfig);
     //
     If (dm.CdsConfigCfg_PLANO_PG.AsInteger = 0) Then
     begin
          Dm.FilterCDS(dmDados.cdsPlanos, fsInteger, '-1');
          BtAdicionarClick(Sender);
     End
     Else
     Begin
          Dm.FilterCDS( dmDados.cdsPlanos, fsInteger, uFuncoes.mscodigo('PLA_CODIGO','PLANO_PAGAMENTO'));
     End;
end;

procedure TfrmCadPlano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      dmDados.cdsPlanos.Close;
end;

procedure TfrmCadPlano.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  With dmDados.cdsPlanos do
  Begin
       Append;
       FieldByName('PLA_CODIGO').AsInteger :=
          dm.CdsConfigCFG_PLANO_PG.AsInteger + 1;
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadPlano.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dmDados.cdsPlanos.RecordCount > 0) then
  Begin
       tratabotoes;
       dmDados.cdsPlanos.Edit;
       dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadPlano.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if (dmDados.cdsPlanos.RecordCount > 0) then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dmDados.cdsPlanos.Delete;
       dmDados.cdsPlanos.ApplyUpdates(0);
       //
       REGISTRO;
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadPlano.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dmDados.cdsPlanos.Cancel;
  //
  If (dmDados.cdsPlanos.IsEmpty) Then
      Close;
end;

procedure TfrmCadPlano.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeDescricao.Text) Then
  Begin
       Application.MessageBox('Digite o nome do plano.','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeDescricao.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if (dmDados.cdsPlanos.State in [dsinsert]) then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_PLANO_PG.AsInteger := dm.CdsConfigCFG_PLANO_PG.AsInteger+1;
      dmDados.cdsPlanosPLA_CODIGO.AsInteger  :=
         dm.CdsConfigCFG_PLANO_PG.AsInteger ;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
    end;
    dmDados.cdsPlanos.Post;
    dmDados.cdsPlanos.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dmDados.cdsPlanos.Cancel;
        End;
  End;
  //
  inherited;
end;

procedure TfrmCadPlano.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
        with cdsConsultar do
        begin
             Close;
             CommandText := 'select PLA_CODIGO, PLA_DESCRICAO from PLANO_PAGAMENTO ';
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where PLA_CODIGO = ' + edtConsultar.Text;
               1: CommandText := CommandText + ' where UPPER(PLA_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
             end;
             CommandText := CommandText + 'order by PLA_DESCRICAO';
             Open;
        End;  //fim-with
  End;     // fim-se
end;

procedure TfrmCadPlano.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
  End;
end;

end.
