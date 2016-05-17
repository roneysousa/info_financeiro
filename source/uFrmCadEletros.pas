unit uFrmCadEletros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadEletros = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    dsCadastro: TDataSource;
    cdsConsultarELE_CODIGO: TIntegerField;
    cdsConsultarELE_DESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeDescricaoExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar(aCodigo : String);
  public
    { Public declarations }
  end;

var
  frmCadEletros: TfrmCadEletros;

implementation

uses udmDados, Udm, uFuncoes;

{$R *.dfm}

{ TfrmCadEletros }

procedure TfrmCadEletros.buscar(aCodigo: String);
begin
     dm.FilterCDS(dmDados.cdsEletros, fsInteger, aCodigo);
end;

procedure TfrmCadEletros.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled   := not BtGravar.Enabled;
   BtSair.Enabled     := not BtSair.Enabled;
end;

procedure TfrmCadEletros.FormShow(Sender: TObject);
begin
  inherited;
     dm.RefreshCDS(Dm.CdsConfig);
     If (dm.CdsConfigCFG_CODELETROS.AsInteger > 0) Then
         Dm.FilterCDS(dmDados.cdsEletros, fsInteger, InttoStr(uFuncoes.mvcodigo('ELE_CODIGO','ELETROS')))
     Else
         Dm.FilterCDS(dmDados.cdsEletros, fsInteger, '-1');
     //
     If (dmDados.cdsEletros.IsEmpty) Then
         BtAdicionarClick(Sender);
end;

procedure TfrmCadEletros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dmDados.cdsEletros.close;
end;

procedure TfrmCadEletros.BtAdicionarClick(Sender: TObject);
begin
  inherited;
     tratabotoes;
     dm.RefreshCDS(Dm.CdsConfig);
     //
     dmDados.cdsEletros.Append;
     dmDados.cdsEletrosELE_CODIGO.AsInteger := dm.CdsConfigCFG_CODELETROS.AsInteger+1;
     dbeDescricao.SetFocus;
end;

procedure TfrmCadEletros.BtEditarClick(Sender: TObject);
begin
  inherited;
   if not (dsCadastro.DataSet.IsEmpty) then
    Begin
        tratabotoes;
        dmDados.cdsEletros.Edit;
        dbeDESCRICAO.SetFocus;
    End;
end;

procedure TfrmCadEletros.BtExcluirClick(Sender: TObject);
begin
  inherited;
   if not (dsCadastro.DataSet.IsEmpty) then
     If Application.MessageBox('Deseja excluir este grupo?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dsCadastro.DataSet.Delete;
       dmDados.cdsEletros.ApplyUpdates(0);
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadEletros.BtCancelarClick(Sender: TObject);
begin
  inherited;
     tratabotoes;
     dsCadastro.DataSet.Cancel;
     //
     If (dsCadastro.DataSet.IsEmpty) Then
        Close;
end;

procedure TfrmCadEletros.BtGravarClick(Sender: TObject);
begin
  inherited;
  If uFuncoes.Empty(dbeDESCRICAO.Text) Then
  Begin
       Application.MessageBox('Digite a descrição do eletro!!!','ATENÇÃO',
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
         dm.CdsConfigCFG_CODELETROS.AsInteger := dm.CdsConfigCFG_CODELETROS.AsInteger+1;
         dmDados.cdsEletrosELE_CODIGO.AsInteger := dm.CdsConfigCFG_CODELETROS.AsInteger;
         dm.CdsConfig.Post;
         dm.CdsConfig.ApplyUpdates(0);
    end;
    //
    dmDados.cdsEletros.Post;
    dmDados.cdsEletros.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmDados.cdsEletros.Cancel;
        End;
  End;
end;

procedure TfrmCadEletros.dbeDescricaoExit(Sender: TObject);
begin
  inherited;
   If (dsCadastro.DataSet.State in [dsInsert]  )
    and not uFuncoes.Empty(dbeDescricao.Text) Then
    begin
          If (Dm.ProcurarValor('ELE_DESCRICAO', dbeDescricao.Text, 'ELETROS')) Then
            begin
                 Application.MessageBox('Descrição já cadastrada!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeDescricao.SetFocus;
                 dbeDescricao.Clear;
                 Exit;
            End;
   End;
end;

procedure TfrmCadEletros.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFUncoes.Empty(edtConsultar.Text) Then
     begin
           with cdsConsultar do
           begin
                Close;
                CommandText := 'select ELE_CODIGO, ELE_DESCRICAO from ELETROS  ';
                case rgConsultar.ItemIndex of
                  0: CommandText := CommandText + ' where ELE_CODIGO = ' + edtConsultar.Text;
                  1: CommandText := CommandText + ' where UPPER(ELE_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                end;
                CommandText := CommandText + ' order by ELE_DESCRICAO ';
                Open;
           End;
     End;
end;

procedure TfrmCadEletros.btnConsultarClick(Sender: TObject);
begin
  inherited;
 If not (cdsConsultar.IsEmpty ) then
  begin
       buscar(cdsConsultarELE_CODIGO.AsString);
       PageControl1.ActivePageIndex := 0;
  End;
end;

end.
