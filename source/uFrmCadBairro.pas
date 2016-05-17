unit uFrmCadBairro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadBairro = class(TfrmCadastro)
    Label1: TLabel;
    Label2: TLabel;
    dbeNMBAIR: TDBEdit;
    DBText1: TDBText;
    datasetConsultarBAI_CODIGO: TIntegerField;
    datasetConsultarBAI_NOME: TStringField;
    cdsConsultarBAI_CODIGO: TIntegerField;
    cdsConsultarBAI_NOME: TStringField;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    qryTestaBairro: TSQLQuery;
    procedure FormActivate(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure REGISTRO;
     Function Validar_Bairro(M_NMBAIR : String; M_CDCIDA : Integer) : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBairro: TfrmCadBairro;

implementation

uses Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

procedure TfrmCadBairro.FormActivate(Sender: TObject);
begin
  inherited;
     {If (dm.CdsConfigCGF_BAIRRO.Value = 0) Then
         dm.CdsBairros.Open
     Else
     Begin
         dm.CdsBairros.Close;
         dm.SdsBairros.ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('BAI_CODIGO','BAIRROS');
         dm.CdsBairros.Open;
     End;}
end;

procedure TfrmCadBairro.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm.CdsBairros.Append;
  dbeNMBAIR.SetFocus;
  dm.CdsBairrosBAI_CODIGO.Value := dm.CdsConfigCGF_BAIRRO.Value+1;
end;

procedure TfrmCadBairro.buscar;
begin
  dm.cdsBairros.Close;
  With dm.SdsBairros do
  Begin
       Active := False;
       CommandText := 'Select * from BAIRROS '+
                      'Where (BAI_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('BAI_CODIGO').AsString;
       Active := True;
  End;
  dm.cdsBairros.Open;
end;

procedure TfrmCadBairro.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadBairro.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dm.CdsBairros.RecordCount > 0) then
  Begin
      tratabotoes;
      dm.CdsBairros.Edit;
      dbeNMBAIR.SetFocus;
  End;
end;

procedure TfrmCadBairro.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.CdsBairros.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este bairro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.CdsBairros.Delete;
       dm.CdsBairros.ApplyUpdates(0);
       {dm.cdsBancos.Close;
       dm.dstBancos.ParamByName('PCODIGO').AsString := dm.mscodigo('BAN_CODIGO','BANCOS');
       dm.cdsBancos.Open;}
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadBairro.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsBairros.Cancel;
  //
  If (dm.cdsBairros.RecordCount > 0 ) Then
    Close;
end;

procedure TfrmCadBairro.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeNMBAIR.Text) Then
  Begin
       Application.MessageBox('Digite o nome do bairro!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMBAIR.SetFocus;
       Exit;
  End;
  //
  If (Validar_Bairro(dbeNMBAIR.Text, Dm.CdsBairrosCID_CODIGO.AsInteger)) Then
    begin
       Application.MessageBox('Bairro já cadastro na cidade!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMBAIR.SetFocus;
       Exit;
    End;
  //
  Try
    //
    tratabotoes;
    if dm.CdsBairros.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCGF_BAIRRO.Value := dm.CdsConfigCGF_BAIRRO.Value+1;
      dm.CdsBairrosBAI_CODIGO.Value := dm.CdsConfigCGF_BAIRRO.Value;
      dm.CdsConfig.ApplyUpdates(0);
      //dm.CdsConfig.Close;
    end;
    dm.CdsBairros.Post;
    dm.CdsBairros.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.CdsBairros.Cancel;
        End;
  End;
  inherited;
end;

procedure TfrmCadBairro.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from BAIRROS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where BAI_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(BAI_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by BAI_NOME';
    Open;
    if IsEmpty then
    begin
      MessageDlg('Nenhum registro encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
      edtConsultar.Clear;
      if edtConsultar.CanFocus then
        edtConsultar.SetFocus;
    end;
  end;
  inherited;
end;

procedure TfrmCadBairro.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       dbeNMBAIR.SetFocus;
  End;
end;

procedure TfrmCadBairro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    dm.CdsBairros.Close;
    Action := caFree;
end;

procedure TfrmCadBairro.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
        with cdsConsultar do
        begin
             Close;
             CommandText := 'Select * from BAIRROS';
             case rgConsultar.ItemIndex of
               0: CommandText := CommandText + ' where BAI_CODIGO = ' + edtConsultar.Text;
               1: CommandText := CommandText + ' where UPPER(BAI_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
             end;
             CommandText := CommandText + 'order by BAI_NOME';
             Open;
        end;  // fim-with
  end;       // fim-se
end;

procedure TfrmCadBairro.FormShow(Sender: TObject);
begin
  inherited;
     dm.parametros;
     REGISTRO; 
end;

procedure TfrmCadBairro.REGISTRO;
begin
     dm.CdsBairros.Close;
     With  dm.SdsBairros do
      begin
           Active := False;
           CommandText := 'Select * from BAIRROS order by BAI_NOME ';
           Active := True;
      End;
     //
     dm.CdsBairros.Open;
     dm.CdsBairros.First;
end;

function TfrmCadBairro.Validar_Bairro(M_NMBAIR: String;
  M_CDCIDA: Integer): boolean;
begin
    Result := False;
    With qryTestaBairro do
      begin
           Close;
           Params.ParamByName('pNOME').AsString    := M_NMBAIR;
           Params.ParamByName('pCODIGO').AsInteger := M_CDCIDA;
           Open;
           //
           If not (IsEmpty) Then
              Result := True;
           //
           qryTestaBairro.Close;
      End;
end;

procedure TfrmCadBairro.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Bairros...'));
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
