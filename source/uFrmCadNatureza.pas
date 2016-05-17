unit uFrmCadNatureza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadNatureza = class(TfrmCadastro)
    cdsConsultarNAT_CODIGO: TIntegerField;
    cdsConsultarNAT_NOME: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    dbeDESCRICAO: TDBEdit;
    DBText1: TDBText;
    GroupBox1: TGroupBox;
    cbxDespesa: TCheckBox;
    cbxRenda: TCheckBox;
    procedure BtAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeDESCRICAOExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure CHEQUE_BOXS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadNatureza: TfrmCadNatureza;

implementation

uses Udm, uFuncoes, uDm2, udmConsulta, UFrmAdmin;

{$R *.dfm}

{ TfrmCadNatureza }

procedure TfrmCadNatureza.buscar;
begin
  dm2.cdsNatureza.Close;
  With dm2.dstNatureza do
  Begin
       Active := False;
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('NAT_CODIGO').AsString;
       Active := True;
  End;
  dm2.cdsNatureza.Open;
end;

procedure TfrmCadNatureza.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled   := not BtGravar.Enabled;
   BtSair.Enabled     := not BtSair.Enabled;
   GroupBox1.Enabled  := not GroupBox1.Enabled; 
end;

procedure TfrmCadNatureza.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  //
  cbxDespesa.Checked := False;
  cbxRenda.Checked   := False;
  //
  dm2.cdsNatureza.Append;
  dm2.cdsNaturezaNAT_CODIGO.Value := dm.CdsConfigCFG_NATUREZA.Value+1;
  dbeDESCRICAO.SetFocus;
end;

procedure TfrmCadNatureza.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Natureza...'));
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
     DM2.cdsNatureza.Close;
     DM2.dstNatureza.ParamByName('PCODIGO').AsInteger := uFuncoes.mvcodigo('NAT_CODIGO','NATUREZA');
     DM2.cdsNatureza.Open;
     //
     CHEQUE_BOXS;
end;

procedure TfrmCadNatureza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      DM2.cdsNatureza.Close;
      Action := caFree;
end;

procedure TfrmCadNatureza.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select NAT_CODIGO, NAT_NOME from NATUREZA ';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where NAT_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(NAT_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by NAT_NOME';
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

procedure TfrmCadNatureza.btnAlterarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty ) then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       CHEQUE_BOXS;
       dbeDESCRICAO.SetFocus;
  End;     
end;

procedure TfrmCadNatureza.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm2.cdsNatureza.Cancel;
end;

procedure TfrmCadNatureza.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if dm2.cdsNatureza.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este bairro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm2.cdsNatureza.Delete;
       dm2.cdsNatureza.ApplyUpdates(0);
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadNatureza.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dm2.cdsNatureza.RecordCount > 0) then
  Begin
      tratabotoes;
      dm2.cdsNatureza.Edit;
      CHEQUE_BOXS;
      dbeDESCRICAO.SetFocus;
  End;
end;

procedure TfrmCadNatureza.BtGravarClick(Sender: TObject);
begin
  inherited;
  //
  If uFuncoes.Empty(dbeDESCRICAO.Text) Then
  Begin
       Application.MessageBox('Digite a descrição da natureza!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeDESCRICAO.SetFocus;
       Exit;
  End;
  //
  If (cbxDespesa.Checked = False)
    and (cbxRenda.Checked = False) Then
  Begin
       Application.MessageBox('Selecione o tipo de natureza!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       GroupBox1.SetFocus;
       Exit;
  End;
  //
  Try
    //
    tratabotoes;
    if dm2.cdsNatureza.State in [dsinsert] then
    begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_NATUREZA.Value := dm.CdsConfigCFG_NATUREZA.Value+1;
      dm2.cdsNaturezaNAT_CODIGO.Value := dm.CdsConfigCFG_NATUREZA.Value;
      dm.CdsConfig.Post;
      dm.CdsConfig.ApplyUpdates(0);
    end;
    //
    If (cbxDespesa.Checked = True)
      and (cbxRenda.Checked = False) Then
        dm2.cdsNatureza.FieldByName('NAT_TIPO').AsString := '1';
    If (cbxRenda.Checked = True)
      and (cbxDespesa.Checked = False) Then
        dm2.cdsNatureza.FieldByName('NAT_TIPO').AsString := '2';
    If (cbxDespesa.Checked = True)
      and (cbxRenda.Checked = True) Then
        dm2.cdsNatureza.FieldByName('NAT_TIPO').AsString := '3';
    //
    dm2.cdsNatureza.Post;
    dm2.cdsNatureza.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm2.cdsNatureza.Cancel;
        End;
  End;
end;

procedure TfrmCadNatureza.CHEQUE_BOXS;
begin
    If uFuncoes.Empty(dm2.cdsNatureza.FieldByName('NAT_TIPO').AsString) Then
    begin
         cbxDespesa.Checked := False;
         cbxRenda.Checked   := False;
    End;
    //
    If (dm2.cdsNatureza.FieldByName('NAT_TIPO').AsString = '1') Then
    begin
         cbxDespesa.Checked := True;
         cbxRenda.Checked   := False;
    End;
    //
    If (dm2.cdsNatureza.FieldByName('NAT_TIPO').AsString = '2') Then
    begin
         cbxRenda.Checked   := True;
         cbxDespesa.Checked := False;
    End;
    //
    If (dm2.cdsNatureza.FieldByName('NAT_TIPO').AsString = '3') Then
    Begin
         cbxDespesa.Checked := True;
         cbxRenda.Checked   := True;
    End;
end;

procedure TfrmCadNatureza.dbeDESCRICAOExit(Sender: TObject);
begin
  inherited;
  If (Dm2.cdsNatureza.State in [dsInsert]  )
    and not uFuncoes.Empty(dbeDESCRICAO.Text) Then
  begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select NAT_NOME from NATUREZA Where (NAT_NOME = :pNOME)');
           Params.ParamByName('pNOME').AsString := dbeDESCRICAO.Text;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Application.MessageBox('Descrição já cadastrada!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeDESCRICAO.SetFocus;
                 dbeDESCRICAO.Clear;   
                 Exit;
            End;
      End;
   End;
end;

procedure TfrmCadNatureza.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFUncoes.Empty(edtConsultar.Text) Then
     begin
           with cdsConsultar do
           begin
                Close;
                CommandText := 'Select NAT_CODIGO, NAT_NOME from NATUREZA ';
                case rgConsultar.ItemIndex of
                  0: CommandText := CommandText + ' where NAT_CODIGO = ' + edtConsultar.Text;
                  1: CommandText := CommandText + ' where UPPER(NAT_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                end;
                CommandText := CommandText + 'order by NAT_NOME';
                Open;
           End;
     End;
end;

end.
