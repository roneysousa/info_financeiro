unit uFrmCadContaSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadContasSaldo = class(TfrmCadastro)
    Label1: TLabel;
    dsContaSaldo: TDataSource;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    dbeSaldo: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    EditBancoCodigo: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBText1: TDBText;
    cdsConsultarCGS_CODIGO: TIntegerField;
    cdsConsultarCGS_DESCRICAO: TStringField;
    DBGrid1: TDBGrid;
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure EditBancoCodigoExit(Sender: TObject);
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
  frmCadContasSaldo: TfrmCadContasSaldo;

implementation

uses udmDados, Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

{ TfrmCadContasSaldo }

procedure TfrmCadContasSaldo.buscar;
begin
  {With dmDados.cdsContaSaldo do
  Begin
       Active := False;
       Params.ParamByName('pCODIGO').AsInteger :=
          cdsConsultar.FieldByName('CGS_CODIGO').AsInteger;
       Active := True;
  End;}
  dmDados.cdsContaSaldo.Locate('CGS_CODIGO',cdsConsultar.FieldByName('CGS_CODIGO').AsInteger,[])
end;

procedure TfrmCadContasSaldo.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadContasSaldo.DBEdit4KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmCadContasSaldo.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
        with cdsConsultar do
        begin
             Close;
             CommandText := 'Select CGS_CODIGO, CGS_DESCRICAO from CONTAS_SALDOS ';
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where CGS_CODIGO = ' + edtConsultar.Text;
               1: CommandText := CommandText + ' where UPPER(CGS_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
             end;
             CommandText := CommandText + 'order by CGS_DESCRICAO ';
             Open;
        End;  //fim-with
  End;     // fim-se
end;

procedure TfrmCadContasSaldo.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    tratabotoes;
    Dm.RefreshCDS(Dm.CdsConfig);
    dmDados.cdsContaSaldo.Append;
    dmDados.cdsContaSaldoCGS_CODIGO.AsInteger :=
       dm.CdsConfigCFG_CONTAS_SALDO.AsInteger+1;
    dmDados.cdsContaSaldoCGS_VALOR_SALDO.AsFloat := 0;    
    dbeDescricao.SetFocus;
end;

procedure TfrmCadContasSaldo.BtEditarClick(Sender: TObject);
begin
  inherited;
  if not (dmDados.cdsContaSaldo.IsEmpty) then
  Begin
       tratabotoes;
       dmDados.cdsContaSaldo.Edit;
       dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadContasSaldo.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if not (dmDados.cdsContaSaldo.IsEmpty)
    and  (dmDados.cdsContaSaldoCGS_CODIGO.AsInteger > 3) then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
          dmDados.cdsContaSaldo.Delete;
          dmDados.cdsContaSaldo.ApplyUpdates(0);
     end
    else
       Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
         MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadContasSaldo.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dmDados.cdsContaSaldo.Cancel;
  //
  If (dmDados.cdsContaSaldo.IsEmpty) Then
      Close;
end;

procedure TfrmCadContasSaldo.BtGravarClick(Sender: TObject);
begin
    If uFuncoes.Empty(dbeDescricao.Text) Then
    Begin
        Application.MessageBox('Digite a descrição da conta!!!','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        dbeDescricao.SetFocus;
        Exit;
    End;
    //
    If Empty(dbeSaldo.Text) Then
      begin
          Application.MessageBox('Digite o saldo da conta.','ATENÇÃO',
                MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeSaldo.SetFocus;
          Exit;
      End;
    //
     try
          tratabotoes;
          //
          If (dmDados.cdsContaSaldo.State in [dsInsert]) Then
            begin
                 Dm.RefreshCDS(Dm.CdsConfig);
                 Dm.CdsConfig.Edit;
                 Dm.CdsConfigCFG_CONTAS_SALDO.AsInteger :=
                    Dm.CdsConfigCFG_CONTAS_SALDO.AsInteger + 1;
                 Dm.CdsConfig.ApplyUpdates(0);
                 //
                 dmDados.cdsContaSaldoCGS_CODIGO.AsInteger :=
                     Dm.CdsConfigCFG_CONTAS_SALDO.AsInteger;
            End;
            //
            dmDados.cdsContaSaldo.ApplyUpdates(0);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar grava registro!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmDados.cdsContaSaldo.Cancel;
        End;
     End;
  inherited;
end;

procedure TfrmCadContasSaldo.FormCreate(Sender: TObject);
begin
     BtAdicionar.Visible := False;
     BtEditar.Visible    := False;
     BtExcluir.Visible   := False;
     //
     BtCancelar.Visible  := False;
     BtGravar.Visible    := False;
  inherited;
end;

procedure TfrmCadContasSaldo.FormShow(Sender: TObject);
begin
  inherited;
      REGISTRO;
      //
      If (dmDados.cdsContaSaldo.IsEmpty) Then
        begin
             dmDados.Incluir_Conta_Saldo('DINHEIRO',0);
             dmDados.Incluir_Conta_Saldo('CHEQUE',0);
             dmDados.Incluir_Conta_Saldo('DUPLICATAS',0);
        End;
      //
       dmDados.cdsContaSaldo.Close;
       With dmDados.dstContaSaldo  do
       begin
            Active := False;
            //
            CommandText := 'Select * from CONTAS_SALDOS order by CGS_CODIGO';
            //
            Active := True;
       End;
       dmDados.cdsContaSaldo.FetchParams;
       dmDados.cdsContaSaldo.Open;
end;

procedure TfrmCadContasSaldo.REGISTRO;
begin
     Dm.RefreshCDS(Dm.CdsConfig);
     Dm.RefreshCDS(dmDados.cdsContaSaldo); 

end;

procedure TfrmCadContasSaldo.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadContasSaldo.EditBancoCodigoExit(Sender: TObject);
begin
  inherited;
      If (dmDados.cdsContaSaldo.State in [dsInsert, dsEdit])
        and Not Empty(EditBancoCodigo.Text) Then
      begin
           If not uFuncoes.LOCALIZAR_BANCO(StrZero(EditBancoCodigo.Text,3)) Then
            begin
                 EditBancoCodigo.SetFocus;
                 raise Exception.Create('Código de banco não cadastro.')
            End;
      End;

end;

end.
