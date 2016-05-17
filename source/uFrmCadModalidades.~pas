unit uFrmCadModalidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadModalidades = class(TfrmCadastro)
    cdsConsultarMOD_CODIGO: TIntegerField;
    cdsConsultarMOD_NOME: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    dbeNMMODA: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBText1: TDBText;
    Label5: TLabel;
    dbeQTPARC: TDBEdit;
    cmbFixa2: TComboBox;
    rbTipoModalidade: TDBRadioGroup;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNMMODAExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure dbeQTPARCExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure commobox_fixa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadModalidades: TfrmCadModalidades;

implementation

uses Udm, uFuncoes, udmConsulta, UFrmAdmin, uDmRelatorios;

{$R *.dfm}

{ TfrmCadModalidades }

procedure TfrmCadModalidades.buscar;
begin
  dm.cdsModalidade .Close;
  With dm.dstModalidades do
  Begin
       Active := False;
       CommandText := 'Select * from MODALIDADE '+
                      'Where (MOD_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('MOD_CODIGO').AsString;
       Active := True;
  End;
  dm.cdsModalidade.Open;
end;

procedure TfrmCadModalidades.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   //
   cmbFixa2.Enabled := not cmbFixa2.Enabled;
end;

procedure TfrmCadModalidades.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from MODALIDADE';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where MOD_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(MOD_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by MOD_NOME';
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

procedure TfrmCadModalidades.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty ) then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       commobox_fixa;
       dbeNMMODA.SetFocus;
   End;
end;

procedure TfrmCadModalidades.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  dm.cdsModalidade.Append;
  cmbFixa2.ItemIndex := -1;
  dbeNMMODA.SetFocus;
  dm.cdsModalidadeMOD_CODIGO.Value := dm.CdsConfigCFG_MODALIDADE.Value+1;
  Dm.cdsModalidadeMOD_NRPARCELA.AsInteger := 1; 
end;

procedure TfrmCadModalidades.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dm.cdsModalidade.RecordCount > 0) then
  Begin
      tratabotoes;
      dm.cdsModalidade.Edit;
      commobox_fixa;
      dbeNMMODA.SetFocus;
  End;
end;

procedure TfrmCadModalidades.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm.cdsModalidade.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir esta forma de pagamento?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.cdsModalidade.Delete;
       dm.cdsModalidade.ApplyUpdates(0);
       //
       dm.cdsModalidade.Close;
       dm.dstModalidades.ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('MOD_CODIGO','MODALIDADE');
       dm.cdsModalidade.Open;
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadModalidades.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsModalidade.Cancel;
  commobox_fixa;
end;

procedure TfrmCadModalidades.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeNMMODA.Text) Then
  Begin
       Application.MessageBox('Digite a descrição!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMMODA.SetFocus;
       Exit;
  End;
  //
  //if (StrtoInt(dbeQTPARC.Text) < 1) Then
  if Empty(dbeQTPARC.Text) Then
    begin
         Application.MessageBox('Digite a quantidades parcelas.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeQTPARC.SetFocus;
         Exit;
    End;
  //
  if (cmbFixa2.ItemIndex = -1) Then
    begin
         Application.MessageBox('Selecione um tipo de fixa.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         cmbFixa2.SetFocus;
         Exit;
    End;
  //
  if (rbTipoModalidade.ItemIndex = -1) Then
    begin
         Application.MessageBox('Selecione o tipo de modalidade.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         rbTipoModalidade.SetFocus;
         Exit;
    End;
  //
  Try
    //
    tratabotoes;
    if dm.cdsModalidade.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_MODALIDADE.Value := dm.CdsConfigCFG_MODALIDADE.Value+1;
      dm.cdsModalidadeMOD_CODIGO.Value := dm.CdsConfigCFG_MODALIDADE.Value;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
    end;
    //
    If (cmbFixa2.Text = 'DINHEIRO') Then
      dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString := 'D';
    If (cmbFixa2.Text = 'CHEQUE') Then
      dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString := 'H';
    If (cmbFixa2.Text = 'CARTAO') Then
      dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString := 'C';
    If (cmbFixa2.Text = 'TICKER') Then
      dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString := 'T';
    If (cmbFixa2.Text = 'DUPLICATA') Then
      dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString := 'P';
    //
    dm.cdsModalidade.Post;
    dm.cdsModalidade.ApplyUpdates(0);
    //
    commobox_fixa;
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.cdsModalidade.Cancel;
        End;
  End;
  //
  inherited;
end;

procedure TfrmCadModalidades.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Forma de pagamentos'));
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
   //
   dm.RefreshCDS(Dm.CdsConfig);
   // 
     If (dm.CdsConfigCFG_MODALIDADE.Value = 0) Then
     begin
         dm.cdsModalidade.Close;
         With dm.dstModalidades do
         Begin
             Active := False;
             CommandText := 'Select * from MODALIDADE';
             Active := True;
         End;
         dm.cdsModalidade.Open;
     End
     Else
     Begin
         dm.cdsModalidade.Close;
         With dm.dstModalidades do
         Begin
             Active := False;
             CommandText := 'Select * from MODALIDADE Where (MOD_CODIGO = :pCODIGO)';
             ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('MOD_CODIGO','MODALIDADE');
             Active := True;
         End;
         dm.cdsModalidade.Open;
         //
     End;
     //
     commobox_fixa;
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadModalidades.commobox_fixa;
begin
     If (dm.cdsModalidadeMOD_FLFIXA.AsString = 'D' ) Then
        cmbFixa2.ItemIndex := 0;
     If (dm.cdsModalidadeMOD_FLFIXA.AsString = 'H' ) Then
        cmbFixa2.ItemIndex := 1;
     If (dm.cdsModalidadeMOD_FLFIXA.AsString = 'C' ) Then
        cmbFixa2.ItemIndex := 2;
     If (dm.cdsModalidadeMOD_FLFIXA.AsString = 'T' ) Then
        cmbFixa2.ItemIndex := 3;
     If (dm.cdsModalidadeMOD_FLFIXA.AsString = 'P' ) Then
        cmbFixa2.ItemIndex := 4;
end;

procedure TfrmCadModalidades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   dm.cdsModalidade.Close;
   dmRelatorios.cdsContaSaldo.Close;
   //
   Action := caFree;
end;

procedure TfrmCadModalidades.dbeNMMODAExit(Sender: TObject);
begin
  inherited;
  If (Dm.cdsModalidade.State in [dsInsert]  )
    and not uFuncoes.Empty(dbeNMMODA.Text) Then
  begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select MOD_NOME from MODALIDADE Where (MOD_NOME = :pNOME)');
           Params.ParamByName('pNOME').AsString := dbeNMMODA.Text;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Application.MessageBox('Descrição já cadastrada!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeNMMODA.SetFocus;
                 dbeNMMODA.Clear;
                 Exit;
            End;
      End;
   End;
end;

procedure TfrmCadModalidades.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFUncoes.Empty(edtConsultar.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select * from MODALIDADE';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where MOD_CODIGO = ' + edtConsultar.Text;
                 1: CommandText := CommandText + ' where UPPER(MOD_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + 'order by MOD_NOME';
               Open;
          End;   //fim-with
     End;
end;

procedure TfrmCadModalidades.dbeQTPARCExit(Sender: TObject);
begin
  inherited;
     If (StrtoInt(dbeQTPARC.Text) = 0) Then
      begin
           dbeQTPARC.SetFocus;
           Exit;
      End;
end;

procedure TfrmCadModalidades.FormShow(Sender: TObject);
begin
  inherited;
    Dm.RefreshCDS(dmRelatorios.cdsContaSaldo);
end;

end.
