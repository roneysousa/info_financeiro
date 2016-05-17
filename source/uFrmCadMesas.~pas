unit uFrmCadMesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, Mask, DBCtrls, DBClient, Provider, DB,
  SqlExpr, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmCadMesas = class(TfrmCadastro)
    Label1: TLabel;
    dsMesas: TDataSource;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    DBText1: TDBText;
    datasetConsultarMES_CODIGO: TIntegerField;
    datasetConsultarMES_DESCRICAO: TStringField;
    cdsConsultarMES_CODIGO: TIntegerField;
    cdsConsultarMES_DESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure dbeDescricaoExit(Sender: TObject);
  private
    { Private declarations }
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar(iCodigo : integer);
     procedure registro;
  public
    { Public declarations }
  end;

var
  frmCadMesas: TfrmCadMesas;

implementation

uses udmDados, Udm, uFuncoes;

{$R *.dfm}

{ TfrmCadMesas }

procedure TfrmCadMesas.buscar(iCodigo : integer);
begin
     Dm.FilterCDS(dmDados.cdsMesas, fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadMesas.registro;
begin
     Dm.FilterCDS( dmDados.cdsMesas, fsInteger, uFuncoes.mscodigo('MES_CODIGO','MESAS'));
end;

procedure TfrmCadMesas.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadMesas.FormShow(Sender: TObject);
begin
     Dm.RefreshCDS(Dm.CdsConfig);
     //
     If (dm.CdsConfigCFG_MESA.AsInteger = 0) Then
     begin
          Dm.FilterCDS(dmDados.cdsMesas, fsInteger, '-1');
          BtAdicionarClick(Sender);
     End
     Else
         registro; 
          //Dm.FilterCDS( dmDados.cdsME, fsInteger, uFuncoes.mscodigo('PLA_CODIGO','PLANO_PAGAMENTO'));
  inherited;
end;

procedure TfrmCadMesas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dmDados.cdsMesas.Close; 
end;

procedure TfrmCadMesas.BtAdicionarClick(Sender: TObject);
begin
  tratabotoes;
  dm.parametros;
  With dmDados.cdsMesas do
  Begin
       Append;
       FieldByName('MES_CODIGO').AsInteger :=
          dm.CdsConfigCFG_MESA.AsInteger + 1;
  End;
  dbeDescricao.SetFocus;
  inherited;
end;

procedure TfrmCadMesas.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dmDados.cdsMesas.Active) AND (dmDados.cdsMesas.RecordCount > 0) then
  Begin
       tratabotoes;
       dmDados.cdsMesas.Edit;
       dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadMesas.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if (dmDados.cdsMesas.Active) AND (dmDados.cdsPlanos.RecordCount > 0) then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dmDados.cdsMesas.Delete;
       dmDados.cdsMesas.ApplyUpdates(0);
       //
       REGISTRO;
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadMesas.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dmDados.cdsMesas.Cancel;
  //
  If (dmDados.cdsMesas.IsEmpty) Then
      Close;
end;

procedure TfrmCadMesas.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeDescricao.Text) Then
  Begin
       Application.MessageBox('Digite uma descrição para mesa.','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeDescricao.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if (dmDados.cdsMesas.State in [dsinsert]) then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_MESA.AsInteger := dm.CdsConfigCFG_MESA.AsInteger+1;
      dmDados.cdsMesasMES_CODIGO.AsInteger  :=
         dm.CdsConfigCFG_MESA.AsInteger ;
      dm.CdsConfig.ApplyUpdates(0);
    end;
    dmDados.cdsMesas.Post;
    dmDados.cdsMesas.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dmDados.cdsMesas.Cancel;
        End;
  End;
  //
  inherited;
end;

procedure TfrmCadMesas.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar(cdsConsultarMES_CODIGO.AsInteger);
       PageControl1.ActivePageIndex := 0;
  End;
end;

procedure TfrmCadMesas.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
        with cdsConsultar do
        begin
             Close;
             CommandText := 'select * from MESAS ';
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where MES_CODIGO = ' + edtConsultar.Text;
               1: CommandText := CommandText + ' where UPPER(MES_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
             end;
             CommandText := CommandText + 'order by MES_DESCRICAO';
             Open;
        End;  //fim-with
  End;     // fim-se
end;

procedure TfrmCadMesas.dbeDescricaoExit(Sender: TObject);
begin
  inherited;
     if (dmDados.cdsMesas.State in [dsInsert]) and 
       not uFuncoes.Empty (dbeDescricao.Text) Then
         begin
              If (dmDados.GetDescricaoMesa(dbeDescricao.Text)) Then
               begin
                    Application.MessageBox('Mesas já cadastrada !',
                      'Atenção', MB_ICONQUESTION+MB_OK+MB_APPLMODAL);
                    dbeDescricao.SetFocus;
                    Exit;
               End;
         End;
end;

end.
