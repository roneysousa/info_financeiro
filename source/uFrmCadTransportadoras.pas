unit uFrmCadTransportadoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadTransportadora = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    dsTransp: TDataSource;
    Label3: TLabel;
    dbePerc: TDBEdit;
    cdsConsultarTRP_CODIGO: TIntegerField;
    cdsConsultarTRP_NOME: TStringField;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    cdsConsultarTRP_NRFONE: TStringField;
    procedure BtAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
  private
    { Private declarations }
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure REGISTRO;
  public
    { Public declarations }
  end;

var
  frmCadTransportadora: TfrmCadTransportadora;

implementation

uses udmDados, Udm, uFuncoes;

{$R *.dfm}

procedure TfrmCadTransportadora.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  With dmDados.cdsTransportadora do
  Begin
       Append;
       FieldByName('TRP_CODIGO').AsInteger :=
          dm.CdsConfigCFG_TRANSPORTADORA.AsInteger + 1;
       FieldByName('TRP_PEFRETE').AsInteger := 0;
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadTransportadora.buscar;
begin
     Dm.FilterCDS( dmDados.cdsTransportadora, fsInteger, cdsConsultarTRP_CODIGO.AsString);
end;

procedure TfrmCadTransportadora.REGISTRO;
begin
   Dm.FilterCDS( dmDados.cdsTransportadora, fsInteger, uFuncoes.mscodigo('TRP_CODIGO','TRANSPORTADORA'));
end;

procedure TfrmCadTransportadora.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadTransportadora.FormShow(Sender: TObject);
begin
  inherited;
     Dm.RefreshCDS(Dm.CdsConfig);
     //
     If (dm.CdsConfigCFG_TRANSPORTADORA.AsInteger = 0) Then
     begin
          Dm.FilterCDS(dmDados.cdsTransportadora, fsInteger, '-1');
          BtAdicionarClick(Sender);
     End
     Else
     Begin
          Dm.FilterCDS( dmDados.cdsTransportadora, fsInteger, uFuncoes.mscodigo('TRP_CODIGO','TRANSPORTADORA'));
     End;
end;

procedure TfrmCadTransportadora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dmDados.cdsTransportadora.Close;
end;

procedure TfrmCadTransportadora.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
        with cdsConsultar do
        begin
             Close;
             CommandText := 'select TRP_CODIGO, TRP_NOME, TRP_NRFONE from TRANSPORTADORA ';
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where TRP_CODIGO = ' + edtConsultar.Text;
               1: CommandText := CommandText + ' where UPPER(TRP_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
             end;
             CommandText := CommandText + 'order by TRP_NOME';
             Open;
        End;  //fim-with
  End;     // fim-se
end;

procedure TfrmCadTransportadora.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
  End;
end;

procedure TfrmCadTransportadora.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dmDados.cdsTransportadora.RecordCount > 0) then
  Begin
       tratabotoes;
       dmDados.cdsTransportadora.Edit;
       dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadTransportadora.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if (dmDados.cdsTransportadora.RecordCount > 0) then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dmDados.cdsTransportadora.Delete;
       dmDados.cdsTransportadora.ApplyUpdates(0);
       //
       REGISTRO;
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadTransportadora.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dmDados.cdsTransportadora.Cancel;
  //
  If (dmDados.cdsTransportadora.IsEmpty) Then
      Close;
end;

procedure TfrmCadTransportadora.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeDescricao.Text) Then
  Begin
       Application.MessageBox('Digite o nome da transportadora.','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeDescricao.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if (dmDados.cdsTransportadora.State in [dsinsert]) then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_TRANSPORTADORA.AsInteger := dm.CdsConfigCFG_TRANSPORTADORA.AsInteger+1;
      dmDados.cdsTransportadoraTRP_CODIGO.AsInteger  :=
         dm.CdsConfigCFG_TRANSPORTADORA.AsInteger ;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
    end;
    dmDados.cdsTransportadora.Post;
    dmDados.cdsTransportadora.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dmDados.cdsTransportadora.Cancel;
        End;
  End;
  inherited;
end;

end.
