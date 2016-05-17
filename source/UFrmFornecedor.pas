unit UFrmFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Grids, DBGrids, StdCtrls, Buttons, ToolEdit, RXDBCtrl,
  DBCtrls, Mask, ComCtrls, ExtCtrls, DB, FMTBcd, DBClient, Provider,
  SqlExpr;

type
  TfrmFornecedor = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    edtNome: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit14: TDBEdit;
    dbeNRCNPJ: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit1: TDBEdit;
    TabSheet2: TTabSheet;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Panel1: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtPesquisar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Panel2: TPanel;
    rgConsultar: TRadioGroup;
    lblConsultar: TLabel;
    edtConsultar: TEdit;
    btnConsultar: TBitBtn;
    btnAlterar: TBitBtn;
    Panel3: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    dbGridConsulta: TDBGrid;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    dsConsulta: TDataSource;
    dstConsultaFOR_CODIGO: TIntegerField;
    dstConsultaFOR_FANTASIA: TStringField;
    dstConsultaFOR_CNPJ: TStringField;
    dstConsultaFOR_FONE1: TStringField;
    cdsConsultarFOR_CODIGO: TIntegerField;
    cdsConsultarFOR_FANTASIA: TStringField;
    cdsConsultarFOR_CNPJ: TStringField;
    cdsConsultarFOR_FONE1: TStringField;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit21: TDBEdit;
    Label24: TLabel;
    DBEdit22: TDBEdit;
    Label25: TLabel;
    DBEdit23: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit2: TDBEdit;
    dstConsClientes: TSQLDataSet;
    dspConsClientes: TDataSetProvider;
    cdsConsClientes: TClientDataSet;
    dsConsClientes: TDataSource;
    DBNavigator1: TDBNavigator;
    cdsConsClientesFOR_CODIGO: TIntegerField;
    cdsConsClientesFOR_FANTASIA: TStringField;
    cdsConsClientesFOR_RAZAO: TStringField;
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarKeyPress(Sender: TObject; var Key: Char);
    procedure dsConsultaStateChange(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure BtPesquisarClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure dbeNRCNPJExit(Sender: TObject);
    procedure dbGridConsultaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    novo, alterar, apagar : String;
    procedure tratabotoes;
    procedure tratabotoes2;
    procedure buscar;
    procedure parametros;
    procedure Navegar(iCodigo : Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedor: TfrmFornecedor;

implementation

uses Udm, UFrmAdmin, uFuncoes, udmConsulta;

{$R *.dfm}

procedure TfrmFornecedor.TabSheet2Show(Sender: TObject);
begin
 if (dm.cdsFornecedor.Active = True) Then
 Begin
  If (dm.dsFornecedor.State in [dsedit,dsinsert]) then
    If Application.MessageBox(PChar('Você deve salvar os dados do cliente'+#13+'Deseja salvar?'),
          'Salvar pendencias', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
       BtGravar.Click;
    panel1.Visible := false;
  IF dm.cdsFornecedor.RecNo <> 0 then
     begin
       //btadicionar2.Enabled := true;
       //bteditar2.Enabled := true;
       {dm.cdsFornecedor.Close;
       dm.dstFornecedor.Params.ParamByName('PCODIGO').Value := dm.cdsFornecedor.FieldByName('CLI_CODIGO').Value;
       dm.cdsFornecedor.Open;}
     end
  else
     begin
       //btadicionar2.Enabled := false;
       //bteditar2.Enabled := false;
     end;
 End
 Else
     panel1.Visible := false;
 //
 btnConsultar.Enabled := False;
 cdsConsultar.Close;
 //
 If (edtConsultar.CanFocus) Then
 Begin
      edtConsultar.Clear; 
      edtConsultar.SetFocus;
 End;
end;

procedure TfrmFornecedor.TabSheet1Show(Sender: TObject);
begin
    panel1.Visible := true;
end;

procedure TfrmFornecedor.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   DBNavigator1.Enabled := not DBNavigator1.Enabled;
end;

procedure TfrmFornecedor.tratabotoes2;
begin
   {BtAdicionar2.Enabled := not BtAdicionar2.Enabled;
   BtEditar2.Enabled := not BtEditar2.Enabled;
   BtCancelar2.Enabled := not BtCancelar2.Enabled;
   BtGravar2.Enabled := not BtGravar2.Enabled;}
end;

procedure TfrmFornecedor.BtAdicionarClick(Sender: TObject);
begin
  tratabotoes;
  parametros;
  dm.cdsFornecedor.Append;
  dm.cdsFornecedorFOR_CODIGO.Value := dm.CdsConfigCFG_FORNECEDOR.Value+1;
  dm.cdsFornecedorFOR_PERCENTUAL_IPI.AsFloat := 0;
  edtNome.SetFocus;
end;

procedure TfrmFornecedor.BtEditarClick(Sender: TObject);
begin
  tratabotoes;
  dm.cdsFornecedor.Edit;
  edtNome.SetFocus; 
end;

procedure TfrmFornecedor.BtExcluirClick(Sender: TObject);
Var
   iUsuario : Integer;
   aCodigo : String;
begin
  if dm.cdsFornecedor.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este fornecedor?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       aCodigo  := uFuncoes.StrZero(dm.cdsFornecedorFOR_CODIGO.AsString,5);
       iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
       //
       dm.cdsFornecedor.Delete;
       dm.cdsFornecedor.ApplyUpdates(0);
       //
       If not (dm.IncluirTarefaUsuario(iUsuario,
          'Excluiu Fornecedor : '+aCodigo+' *F*')) Then
            ShowMessage('Erro ao adicionar tarefa do usuário.');
       //
       dm.cdsFornecedor.Close;
       dm.dstFornecedor.ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('FOR_CODIGO','FORNECEDORES');
       dm.cdsFornecedor.Open;
       //
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmFornecedor.BtCancelarClick(Sender: TObject);
begin
  tratabotoes;
  dm.cdsFornecedor.Cancel;
  //
  Dm.RefreshCDS(cdsConsClientes);
  //
  If (dm.cdsFornecedor.IsEmpty) Then
    Close;
end;

procedure TfrmFornecedor.BtGravarClick(Sender: TObject);
Var
   M_HOMOVI : String;
   iUsuario : Integer;
begin
  If uFuncoes.Empty(edtNome.Text) Then
  Begin
       Application.MessageBox('Digite o nome Fantásia!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       edtNome.SetFocus;
       Exit;
  End;
  //
  iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
  //
  Try
    tratabotoes;
    M_HOMOVI := Copy(TimetoStr(time),1,5);
    //
    if dm.cdsFornecedor.State in [dsinsert] then
    begin
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_FORNECEDOR.Value := dm.CdsConfigCFG_FORNECEDOR.Value+1;
      dm.cdsFornecedorFOR_CODIGO.Value   := dm.CdsConfigCFG_FORNECEDOR.Value;
      dm.CdsConfig.Post;
      dm.CdsConfig.ApplyUpdates(0);
      //
      dm.cdsFornecedorFOR_DTCADA.AsDateTime := Date();
      Dm.cdsFornecedorFOR_HOCADA.AsString   := M_HOMOVI;
      dm.cdsFornecedorFOR_USUARIO_CAD.AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
      //
       If not (dm.IncluirTarefaUsuario( iUsuario,
            'Incluiu Fornecedor : '+uFuncoes.StrZero(dm.cdsFornecedorFOR_CODIGO.AsString,5)+' *F*')) Then
               ShowMessage('Erro ao adicionar tarefa do usuário.');
    end
    Else
        If not (dm.IncluirTarefaUsuario( iUsuario,
            'Alterou Fornecedor : '+uFuncoes.StrZero(dm.CdsFornecedorFOR_CODIGO.AsString,5)+' *F*')) Then
              ShowMessage('Erro ao adicionar tarefa do usuário.');
    //
    if dm.cdsFornecedor.State in [dsEdit] then
    begin
      dm.cdsFornecedorFOR_DTALTE.AsDateTime := Date();
      Dm.cdsFornecedorFOR_HOALTE.AsString   := M_HOMOVI;
      dm.cdsFornecedorFOR_USUARIO_ALT.AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
    End;
    //
    dm.cdsFornecedor.Post;
    dm.cdsFornecedor.ApplyUpdates(0);
    //
    dm.CdsConfig.Close; 
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.cdsFornecedor.Cancel;
        End;
  End;
  //
  Dm.RefreshCDS(cdsConsClientes);
end;

procedure TfrmFornecedor.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmFornecedor.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select FOR_CODIGO, FOR_FANTASIA, FOR_CNPJ, FOR_FONE1 from FORNECEDORES';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where FOR_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(FOR_FANTASIA) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by FOR_FANTASIA';
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

procedure TfrmFornecedor.btnAlterarClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  buscar;
  cdsConsClientes.Locate('FOR_CODIGO',Dm.cdsFornecedorFOR_CODIGO.AsInteger,[]);
  //BtEditarClick(Sender);
end;

procedure TfrmFornecedor.edtConsultarChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtConsultar.Text) Then
     begin
          btnConsultar.Enabled := not uFuncoes.Empty(edtConsultar.Text);
          //
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select FOR_CODIGO, FOR_FANTASIA, FOR_CNPJ, FOR_FONE1 from FORNECEDORES';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where FOR_CODIGO = ' + edtConsultar.Text;
                 1: CommandText := CommandText + ' where UPPER(FOR_FANTASIA) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
               end;
               CommandText := CommandText + 'order by FOR_FANTASIA';
               Open;
          end;
     End;  // fim-se
     //
     If uFuncoes.Empty(edtConsultar.Text) Then
     begin
          btnConsultar.Enabled := False;
          cdsConsultar.Close;
     End;
end;

procedure TfrmFornecedor.btnAlterarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if rgConsultar.ItemIndex = 0 then
  begin
    if not( key in['0'..'9', #8] ) then
    begin
      beep;
      key:=#0;
    end;
  end;

end;

procedure TfrmFornecedor.dsConsultaStateChange(Sender: TObject);
begin
  btnAlterar.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmFornecedor.buscar;
begin
  dm.cdsFornecedor.Close;
  With dm.dstFornecedor do
  begin
       Active := False;
       CommandText := 'Select * from FORNECEDORES Where (FOR_CODIGO = :pCODIGO)';
       Params.ParamByName('PCODIGO').AsInteger  := cdsConsultar.FieldByName('FOR_CODIGO').AsInteger;
       Active := True;
  End;
  dm.cdsFornecedor.FetchParams;
  dm.cdsFornecedor.Open;
end;

procedure TfrmFornecedor.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  If (key = #37) Then
    key :=#0;
  //
  if (Key =#13) and not uFuncoes.Empty(edtConsultar.Text) then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmFornecedor.BtPesquisarClick(Sender: TObject);
begin
     PageControl1.ActivePageIndex := 1;
end;

procedure TfrmFornecedor.rgConsultarClick(Sender: TObject);
begin
     edtConsultar.SetFocus; 
end;

procedure TfrmFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.cdsFornecedor.Close;
     cdsConsClientes.Close; 
     Action := caFree;  
end;

procedure TfrmFornecedor.parametros;
begin
     dm.CdsConfig.Close;
     With dm.SdsConfig do
     begin
          Active := False;
          CommandText := 'Select * from CONFIG';
          Active := True;
     End;
     dm.CdsConfig.Open;
end;

procedure TfrmFornecedor.sbPrimeiroClick(Sender: TObject);
begin
  dsConsulta.DataSet.First;
end;

procedure TfrmFornecedor.sbAnteriorClick(Sender: TObject);
begin
  dsConsulta.DataSet.Prior;
end;

procedure TfrmFornecedor.sbProximoClick(Sender: TObject);
begin
  dsConsulta.DataSet.Next;
end;

procedure TfrmFornecedor.sbUltimoClick(Sender: TObject);
begin
  dsConsulta.DataSet.Last;
end;

procedure TfrmFornecedor.dsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TfrmFornecedor.dbeNRCNPJExit(Sender: TObject);
begin
    If (dm.cdsFornecedor.State in [dsInsert])
     and not uFuncoes.Empty(dbeNRCNPJ.Text) Then
      try
        If not (uFuncoes.CGC(uFuncoes.StrZero(dbeNRCNPJ.Text,14))) Then
        Begin
            MessageDlg('CNPJ inválido!!!', mtInformation, [mbOk], 0);
            dbeNRCNPJ.Clear;
            dbeNRCNPJ.SetFocus;
            Exit;
        End;
      Except
            dbeNRCNPJ.SetFocus;
            dbeNRCNPJ.Clear;
      End;
end;

procedure TfrmFornecedor.dbGridConsultaDblClick(Sender: TObject);
begin
     If not (cdsConsultar.IsEmpty) Then
        btnAlterarClick(Sender);
end;

procedure TfrmFornecedor.FormShow(Sender: TObject);
begin
  //
  PageControl1.ActivePageIndex := 0;
  //
  parametros;
  If (dm.CdsConfigCFG_FORNECEDOR.AsInteger = 0 ) Then
  begin
       dm.cdsFornecedor.Open;
       BtAdicionarClick(Sender); 
  End
  Else
  begin
      dm.cdsFornecedor.Close;
      With dm.dstFornecedor do
      Begin
           Active := False;
           CommandText := 'Select * from FORNECEDORES Where (FOR_CODIGO = :pCODIGO)';
           ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('FOR_CODIGO','FORNECEDORES');
           Active := True;
      End;
      dm.cdsFornecedor.FetchParams;
      dm.cdsFornecedor.Open;
  End;
  //
  cdsConsClientes.Open; 
end;

procedure TfrmFornecedor.edtNomeExit(Sender: TObject);
begin
  If (Dm.cdsFornecedor.State in [dsInsert]  )
    and not uFuncoes.Empty(edtNome.Text) Then
  begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select FOR_FANTASIA from FORNECEDORES Where (FOR_FANTASIA = :pNOME)');
           Params.ParamByName('pNOME').AsString := edtNome.Text;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Application.MessageBox('Fornecedor já cadastrado!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edtNome.SetFocus;
                 edtNome.Clear;
                 Exit;
            End;
      End;
   End;
end;

procedure TfrmFornecedor.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Fornecedores...'));
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

procedure TfrmFornecedor.Navegar(iCodigo: Integer);
begin
  dm.cdsFornecedor.Close;
  With dm.dstFornecedor do
  begin
       Active := False;
       CommandText := 'Select * from FORNECEDORES Where (FOR_CODIGO = :pCODIGO)';
       Params.ParamByName('PCODIGO').AsInteger  := iCodigo;
       Active := True;
  End;
  dm.cdsFornecedor.FetchParams;
  dm.cdsFornecedor.Open;
end;

procedure TfrmFornecedor.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
       Navegar(cdsConsClientesFOR_CODIGO.AsInteger);
end;

end.
