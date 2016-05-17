unit uFrmCadFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBCtrls, DBClient, Provider, DB,
  SqlExpr, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask,
  ExtDlgs;

type
  TfrmCadFuncionarios = class(TfrmCadastro)
    Label1: TLabel;
    DataSource1: TDataSource;
    DBText1: TDBText;
    Label3: TLabel;
    dbeNMFUNC: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    Label15: TLabel;
    dbeNRCPF: TDBEdit;
    Label16: TLabel;
    dbeNRIDEN: TDBEdit;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    DBEdit21: TDBEdit;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    DBEdit23: TDBEdit;
    Label25: TLabel;
    DBEdit24: TDBEdit;
    Label26: TLabel;
    DBEdit25: TDBEdit;
    Label27: TLabel;
    DBEdit26: TDBEdit;
    Label28: TLabel;
    DBEdit27: TDBEdit;
    Label29: TLabel;
    DBEdit28: TDBEdit;
    Label30: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    Label32: TLabel;
    DBEdit31: TDBEdit;
    Label33: TLabel;
    DBEdit32: TDBEdit;
    Label34: TLabel;
    DBEdit33: TDBEdit;
    cmbUFCLIE: TDBComboBox;
    DBComboBox1: TDBComboBox;
    cdsConsultarFUN_CODIGO: TIntegerField;
    cdsConsultarFUN_NOME: TStringField;
    Panel5: TPanel;
    BtAdicionar2: TBitBtn;
    BtEditar2: TBitBtn;
    BtExcluir2: TBitBtn;
    BtPesquisar2: TBitBtn;
    BtCancelar2: TBitBtn;
    BtGravar2: TBitBtn;
    BtSair2: TBitBtn;
    Label2: TLabel;
    fotoFunc: TDBImage;
    btFoto: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    dbeNMFUNCAO: TDBLookupComboBox;
    Label19: TLabel;
    DBComboBox2: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbeNMFUNCExit(Sender: TObject);
    procedure dbeNRIDENExit(Sender: TObject);
    procedure dbeNRCPFExit(Sender: TObject);
    procedure btFotoClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarDblClick(Sender: TObject);
    procedure dbeNRCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    novo, alterar, apagar : String;
    procedure tratabotoes;
    procedure buscar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncionarios: TfrmCadFuncionarios;

implementation

uses Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

procedure TfrmCadFuncionarios.FormCreate(Sender: TObject);
begin
   If not (UFrmAdmin.admin) Then
   begin
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Funcionários...'));
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
     //
     PageControl1.ActivePageIndex := 0;
  inherited;
end;

procedure TfrmCadFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dm.cdsFuncionarios.Close;
     Action := caFree;
end;

procedure TfrmCadFuncionarios.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.parametros;
  PageControl1.ActivePageIndex := 0;
  dm.cdsFuncionarios.Append;
  dbeNMFUNC.SetFocus;
  dm.cdsFuncionariosFUN_CODIGO.Value         := dm.CdsConfigCFG_FUNCIONARIO.Value+1;
  dm.cdsFuncionariosFUN_DTADMICAO.AsDateTime := Date();
end;

procedure TfrmCadFuncionarios.buscar;
begin
  {dm.cdsFuncionarios.Close;
  With dm.dstFuncionarios do
  Begin
       Active := False;
       CommandText := 'Select * from FUNCIONARIOS '+
                      'Where (FUN_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('FUN_CODIGO').AsString;
       Active := True;
  End;
  dm.cdsFuncionarios.Open;}
  //
         With dm.cdsFuncionarios do
          begin
               Active := False;
               Params.ParamByName('PCODIGO').AsInteger :=
                  cdsConsultar.FieldByName('FUN_CODIGO').AsInteger;
               Active := True;
          End;
end;

procedure TfrmCadFuncionarios.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   btFoto.Enabled := not btFoto.Enabled;
   //
   BtAdicionar2.Enabled := not BtAdicionar2.Enabled;
   BtEditar2.Enabled := not BtEditar2.Enabled;
   BtExcluir2.Enabled := not BtExcluir2.Enabled;
   BtPesquisar2.Enabled := not BtPesquisar2.Enabled;
   BtCancelar2.Enabled := not BtCancelar2.Enabled;
   BtGravar2.Enabled := not BtGravar2.Enabled;
   BtSair2.Enabled := not BtSair2.Enabled;
end;

procedure TfrmCadFuncionarios.BtEditarClick(Sender: TObject);
begin
  inherited;
  if not (dm.cdsFuncionarios.IsEmpty) and (dm.cdsFuncionarios.RecordCount > 0) then
  Begin
      tratabotoes;
      Dm.RefreshCDS(dm.cdsListaCargos);
      dm.cdsFuncionarios.Edit;
      If (PageControl1.ActivePageIndex = 0) Then
          dbeNMFUNC.SetFocus
      Else
         dbeNMFUNCAO.SetFocus;  
  End;    
end;

procedure TfrmCadFuncionarios.BtExcluirClick(Sender: TObject);
Var
   iUsuario : Integer;
   aCodigo : String;
begin
  if dm.cdsFuncionarios.RecordCount > 0 then
     if application.MessageBox('Deseja excluir este funcionario','Exclusão de registro',mb_yesno) = id_yes then
       begin
           aCodigo  := uFuncoes.StrZero(dm.cdsFuncionariosFUN_CODIGO.AsString,5);
           iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
           //
           dm.cdsFuncionarios.Delete;
           dm.cdsFuncionarios.ApplyUpdates(0);
           //
           If not (dm.IncluirTarefaUsuario(iUsuario,
             'Excluiu Funcionario : '+aCodigo+' *F*')) Then
              ShowMessage('Erro ao adicionar tarefa do usuário.');
           //
           dm.cdsFuncionarios.Close;
           dm.dstFuncionarios.ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('FUN_CODIGO','FUNCIONARIOS');
           dm.cdsFuncionarios.Open;
       end
  else
      showmessage('Não ha registro a ser excluido');
  inherited;
end;

procedure TfrmCadFuncionarios.BtPesquisarClick(Sender: TObject);
begin
  inherited;
    PageControl1.ActivePageIndex := 2;
end;

procedure TfrmCadFuncionarios.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsFuncionarios.Cancel;
  //
  If (dm.cdsFuncionarios.IsEmpty) Then
     close;

end;

procedure TfrmCadFuncionarios.BtGravarClick(Sender: TObject);
Var
   M_HOMOVI : String;
   iUsuario : Integer;
begin
  If uFuncoes.Empty(dbeNMFUNC.Text) Then
  Begin
       Application.MessageBox('Digite o nome do Funcionario!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMFUNC.SetFocus;
       Exit;
  End;
  //
  iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
  //
  Try
    //
    tratabotoes;
    M_HOMOVI := Copy(TimetoStr(Time),1,5);
    //
    if dm.cdsFuncionarios.State in [dsinsert] then
    begin
      dm.RefreshCDS(Dm.CdsConfig);
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_FUNCIONARIO.Value  := dm.CdsConfigCFG_FUNCIONARIO.Value+1;
      dm.cdsFuncionariosFUN_CODIGO.Value := dm.CdsConfigCFG_FUNCIONARIO.Value;
      dm.CdsConfig.ApplyUpdates(0);
      //
      Dm.cdsFuncionarios.FieldByName('FUN_USUARIO_CAD').AsInteger := StrtoInt(UFrmAdmin.M_CDUSUA);
      Dm.cdsFuncionarios.FieldByName('FUN_DTCADA').AsDateTime := Date();
      Dm.cdsFuncionarios.FieldByName('FUN_HOCADA').AsString   := M_HOMOVI;
      //
       If not (dm.IncluirTarefaUsuario( iUsuario,
            'Incluiu Funcionario : '+uFuncoes.StrZero(dm.cdsFuncionariosFUN_CODIGO.AsString,5)+' *F*')) Then
               ShowMessage('Erro ao adicionar tarefa do usuário.');
    end
    Else
    begin
        If not (dm.IncluirTarefaUsuario( iUsuario,
            'Alterou Funcionario : '+uFuncoes.StrZero(dm.cdsFuncionariosFUN_CODIGO.AsString,5)+' *F*')) Then
               ShowMessage('Erro ao adicionar tarefa do usuário.');
    End;           
    //
    If (dm.cdsFuncionarios.State in [dsEdit]) Then
    begin
      Dm.cdsFuncionariosFUN_USUARIO_ALT.AsInteger := StrtoInt(UFrmAdmin.M_CDUSUA);
      Dm.cdsFuncionariosFUN_DTALTE.AsDateTime := Date();
      Dm.cdsFuncionariosFUN_HOALTE.AsString   := M_HOMOVI;
    End;
    //If (dm.cdsFuncionarios.FieldByName('FUN_CARGO').AsString = 'VENDEDOR') Then
    If not uFuncoes.Empty(dbeNMFUNCAO.Text) Then
        dm.cdsFuncionarios.FieldByName('FUN_TPFUNC').AsString := dbeNMFUNCAO.Text;
    //
    dm.cdsFuncionarios.Post;
    dm.cdsFuncionarios.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.cdsFuncionarios.Cancel;
        End;
  End;
  inherited;
end;

procedure TfrmCadFuncionarios.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select FUN_CODIGO, FUN_NOME from FUNCIONARIOS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where FUN_CODIGO = ' + uFuncoes.StrZero(edtConsultar.Text,5);
      1: CommandText := CommandText + ' where UPPER(FUN_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by FUN_NOME';
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

procedure TfrmCadFuncionarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
     If not(cdsConsultar.IsEmpty) Then
     begin
          buscar;
          PageControl1.ActivePageIndex := 0;
          dbeNMFUNC.SetFocus;
     End;
end;

procedure TfrmCadFuncionarios.dbeNMFUNCExit(Sender: TObject);
begin
  inherited;
 If (dm.cdsFuncionarios.State = dsInsert) Then
 Begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select FUN_CODIGO, FUN_NOME from FUNCIONARIOS';
    CommandText := CommandText + ' where UPPER(FUN_NOME) = ' + QuotedStr(AnsiUpperCase(edtConsultar.Text));
    Open;
    if NOT IsEmpty then
    begin
      MessageDlg('Funcionário já cadastrado!!!' , mtInformation, [mbOk], 0);
      dbeNMFUNC.Clear;
      if dbeNMFUNC.CanFocus then
        dbeNMFUNC.SetFocus;
    end;
  end;
 End;
end;

procedure TfrmCadFuncionarios.dbeNRIDENExit(Sender: TObject);
begin
  inherited;
  If (dm.cdsFuncionarios.State in [dsInsert, dsEdit])
   and not uFuncoes.Empty(dbeNRIDEN.Text) Then
  Begin
       dm.cdsFuncionarios.FieldByName('FUN_IDENTIDADE').AsString :=
           uFuncoes.StrZero(dm.cdsFuncionarios.FieldByName('FUN_IDENTIDADE').AsString,11);
  End;
end;

procedure TfrmCadFuncionarios.dbeNRCPFExit(Sender: TObject);
begin
  inherited;
  If (dm.cdsFuncionarios.State in [dsInsert, dsEdit])
   and not uFuncoes.Empty(dbeNRCPF.Text) Then
  Begin
        If not (uFuncoes.CPF(dm.cdsFuncionarios.FieldByName('FUN_CPFCGC').AsString)) Then
        Begin
            MessageDlg('CPF inválido!!!', mtInformation, [mbOk], 0);
            dbeNRCPF.Clear;
            dbeNRCPF.SetFocus;
            Exit;
        End;
  End;
end;

procedure TfrmCadFuncionarios.btFotoClick(Sender: TObject);
begin
     Try
          If (OpenPictureDialog1.Execute) Then
              fotoFunc.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar abrir foto!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
  inherited;
end;

procedure TfrmCadFuncionarios.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key =#13 then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmCadFuncionarios.edtConsultarDblClick(Sender: TObject);
begin
  inherited;
        btnConsultar.SetFocus; 
end;

procedure TfrmCadFuncionarios.dbeNRCPFKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If (Key = #27) and (dm.cdsFuncionarios.State in [dsInsert]) Then
    Begin
         Key := #0;
         BtCancelarClick(Sender);
    End;
end;

procedure TfrmCadFuncionarios.edtConsultarChange(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edtConsultar.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select FUN_CODIGO, FUN_NOME from FUNCIONARIOS';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where FUN_CODIGO = ' + uFuncoes.StrZero(edtConsultar.Text,5);
                 1: CommandText := CommandText + ' where UPPER(FUN_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + 'order by FUN_NOME';
               Open;
          end;
     End;
end;

procedure TfrmCadFuncionarios.FormShow(Sender: TObject);
begin
  inherited;
     dm.parametros;
     Dm.RefreshCDS(dm.cdsListaCargos);
     //
     If (dm.CdsConfigCFG_FUNCIONARIO.AsInteger = 0) Then
     begin
         With dm.cdsFuncionarios do
          begin
               Active := False;
               Params.ParamByName('PCODIGO').AsInteger := -1;
               Active := True;
          End;
          //
          BtAdicionarClick(Sender);
     End
     Else
     Begin
         With dm.cdsFuncionarios do
          begin
               Active := False;
               Params.ParamByName('PCODIGO').AsInteger :=
                  uFuncoes.mvcodigo('FUN_CODIGO','FUNCIONARIOS');
               Active := True;
          End;
         //
         {dm.cdsFuncionarios.Close;
         dm.dstFuncionarios2.ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('FUN_CODIGO','FUNCIONARIOS');
         dm.cdsFuncionarios.Open;}
         //
     End;
end;

end.
