unit UfrmClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, ComCtrls, ImgList,
  ToolEdit, RXDBCtrl, db, Grids, DBGrids, FMTBcd, DBClient, Provider,
  SqlExpr, ExtDlgs, JPEG;


type
  TFrmClientes = class(TForm)
    Panel1: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtPesquisar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBText1: TDBText;
    lbl_Fantasia: TLabel;
    dbeNMCLIE: TDBEdit;
    Label4: TLabel;
    dbeEndereco: TDBEdit;
    lbl_Razao: TLabel;
    dbeRazao: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cmbCidade: TDBLookupComboBox;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    cmbBairro: TDBLookupComboBox;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    lbl_CPFCGC: TLabel;
    dbeNRCNPJ: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    lbl_Incricao: TLabel;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    ImageList1: TImageList;
    btadicionar2: TBitBtn;
    bteditar2: TBitBtn;
    btcancelar2: TBitBtn;
    btgravar2: TBitBtn;
    DBEdit1: TDBEdit;
    Label21: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    lblConsultar: TLabel;
    rgConsultar: TRadioGroup;
    edtConsultar: TEdit;
    btnConsultar: TBitBtn;
    btnAlterar: TBitBtn;
    grdConsultar: TDBGrid;
    Panel3: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarCLI_FANTASIA: TStringField;
    Label22: TLabel;
    cmbTPPESSOA: TComboBox;
    lbl_emissor: TLabel;
    dbeEmissor: TDBEdit;
    cmbUFEMISSOR: TDBComboBox;
    lbl_UFEMISSOR: TLabel;
    Label2: TLabel;
    btProcurar: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    Label3: TLabel;
    cmbUFCliente: TDBComboBox;
    Label15: TLabel;
    Label16: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    Label23: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    dbeDTNASC: TDBDateEdit;
    spbCidade: TSpeedButton;
    spbBairro: TSpeedButton;
    Label24: TLabel;
    DBEdit2: TDBEdit;
    dstConsClientes: TSQLDataSet;
    dspConsClientes: TDataSetProvider;
    cdsConsClientes: TClientDataSet;
    dsConsClientes: TDataSource;
    DBNavigator1: TDBNavigator;
    cdsConsClientesCLI_CODIGO: TIntegerField;
    cdsConsClientesCLI_FANTASIA: TStringField;
    cdsConsClientesCLI_RAZAO: TStringField;
    cdsConsultarCLI_RAZAO: TStringField;
    spCadAtividade: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    cdsConsultarCLI_FONE1: TStringField;
    DBLookupComboBox2: TDBLookupComboBox;
    Label25: TLabel;
    dbeNRBOX: TDBEdit;
    cdsConsultarCLI_NRBOX: TStringField;
    Label26: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    imgFotoFunc: TImage;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure dbeNMCLIEChange(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure btadicionar2Click(Sender: TObject);
    procedure bteditar2Click(Sender: TObject);
    procedure btgravar2Click(Sender: TObject);
    procedure btcancelar2Click(Sender: TObject);
    procedure btexcluir2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure dsConsultarStateChange(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure cmbBairroEnter(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dbeNRCNPJExit(Sender: TObject);
    procedure cmbTPPESSOAExit(Sender: TObject);
    procedure dbeNRCNPJEnter(Sender: TObject);
    procedure cmbTPPESSOAChange(Sender: TObject);
    procedure cmbTPPESSOAEnter(Sender: TObject);
    procedure btProcurarClick(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeDTNASCExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbCidadeClick(Sender: TObject);
    procedure spbBairroClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure rbtFluxoClienteChange(Sender: TObject);
    procedure dbeRazaoExit(Sender: TObject);
    procedure dbeRazaoKeyPress(Sender: TObject; var Key: Char);
    procedure spCadAtividadeClick(Sender: TObject);
    procedure DBEdit16KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure tratabotoes;
    procedure tratabotoes2;
    procedure buscar;
    procedure Bairros;
    procedure Tipo_Pessoa;
    procedure HABILITAR_CONTROLES;
    procedure NavegarCliente(iCodigo : Integer);
    procedure FormataCPFCGC;
    Procedure CarregaFotoParaBanco(FileName: String);
    Procedure ObtemImagemDoBanco(var imgDestino: TImage);
    Procedure GetFotoCliente();
  public
    { Public declarations }
  end;

var
  FrmClientes: TFrmClientes;
  M_FLEDIT : String;
  M_FLMENU : Boolean;

implementation

uses Udm, uFuncoes, UFrmAdmin, uFrmCadCidades, uFrmCadBairro, udmDados, uFrmCadAtividade,
  uDm2;

{$R *.dfm}

procedure TFrmClientes.BtAdicionarClick(Sender: TObject);
begin
  tratabotoes;
  dm.parametros;
  TabSheet3.TabVisible := False; 
  dm.CdsClientes.Append;
  dm.CdsClientesCLI_CODIGO.Value       := dm.CdsConfigCFG_CLIENTE.Value+1;
  dm.CdsClientesCLI_DATACAD.AsDateTime := Date();
  dm.CdsClientesCLI_TIPOPESSOA.AsString := 'F';
  Tipo_Pessoa;
  HABILITAR_CONTROLES;
  //
  cmbTPPESSOA.SetFocus;
end;

procedure TFrmClientes.BtEditarClick(Sender: TObject);
begin
   If not (dm.CdsClientes.IsEmpty)
    and  (dm.CdsClientes.RecordCount > 0) Then
    begin
        TabSheet3.TabVisible := False;
        dm.CdsClientes.Edit;
        Tipo_Pessoa;
        dbeRazao.SetFocus;
        // dbeNMCLIE 
        tratabotoes;
    End;     
end;

procedure TFrmClientes.BtExcluirClick(Sender: TObject);
Var
   iUsuario : Integer;
   aCodigo : String;
begin
   If not (dm.CdsClientes.IsEmpty)
    and  (dm.CdsClientes.RecordCount > 0) Then
   begin
      aCodigo  := uFuncoes.StrZero(dm.CdsClientesCLI_CODIGO.AsString,7);
      iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
      //
      if application.MessageBox('Deseja excluir esta Lojas\Comodatários\Locatários?','Exclusão de registro',
       MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = id_yes then
        begin
           dm.CdsClientes.Delete;
           dm.CdsClientes.ApplyUpdates(0);
           dm.CdsClientes.Close;
           //
             If not (dm.IncluirTarefaUsuario(iUsuario,
               'Excluiu Lojas\Comodatários\Locatários : '+aCodigo+' *F*')) Then
                 ShowMessage('Erro ao adicionar tarefa do usuário.');
           //
           dm.CdsClientes.Close;
           dm.SdsClientes.ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('CLI_CODIGO','CLIENTES');
           dm.CdsClientes.Open;
        end
        else
           showmessage('Não ha registro a ser excluido');
   End;        
end;

procedure TFrmClientes.BtCancelarClick(Sender: TObject);
begin
 if (dm.CdsClientes.State in [dsInsert, dsEdit]) Then
 begin
      tratabotoes;
      dm.CdsClientes.Cancel;
      TabSheet3.TabVisible := True;
      Tipo_Pessoa;
      HABILITAR_CONTROLES;
      //
      Dm.Contatos_Cliente(dm.CdsClientesCLI_CODIGO.AsInteger);
      Dm.RefreshCDS(cdsConsClientes);
      //
      If (dm.CdsClientes.IsEmpty) Then
         close;
  End;
end;

procedure TFrmClientes.BtGravarClick(Sender: TObject);
Var
   M_HOMOVI : String;
   iUsuario : Integer;
begin
      If uFuncoes.Empty(cmbTPPESSOA.Text) Then
      Begin
           Application.MessageBox('Selecione o tipo de pessoa!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbTPPESSOA.SetFocus;
           Exit;
      End;
      //
      If uFuncoes.Empty(dbeNMCLIE.Text) Then
      Begin
           Application.MessageBox('Digite o nome do cliente!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNMCLIE.SetFocus;
           Exit;
      End;
   //
      If uFuncoes.Empty(dbeRazao.Text) Then
      Begin
           dbeRazao.SetFocus;
           Exit;
      End;
   //
   {   If uFuncoes.Empty(dbeEndereco.Text) Then
      Begin
           Application.MessageBox('Digite o endereço do cliente!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeEndereco.SetFocus;
           Exit;
      End;
   //
      If uFuncoes.Empty(cmbUFCliente.Text) Then
      Begin
           Application.MessageBox('Digite a UF do cliente!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbUFCliente.SetFocus;
           Exit;
      End;
   //
      If uFuncoes.Empty(dbeNRCNPJ.Text) Then
      Begin
           if (cmbTPPESSOA.ItemIndex = 0) Then
              Application.MessageBox('Digite o CPF do cliente!!!','ATENÇÃO',  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL)
           Else
              Application.MessageBox('Digite o CNPJ do cliente!!!','ATENÇÃO',  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           //
           dbeNRCNPJ.SetFocus;
           Exit;
      End;}
  //
  iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
  //
 if (dm.CdsClientes.State in [dsInsert, dsEdit]) Then
 begin
  tratabotoes;
  TabSheet3.TabVisible:= True;
  Tipo_Pessoa;
  //
  M_HOMOVI := Copy(TimetoStr(Time),1,5);
  //
  if dm.CdsClientes.State in [dsinsert] then
     begin
          dm.parametros;
          dm.CdsConfig.Edit;
          dm.CdsConfigCFG_CLIENTE.Value := dm.CdsConfigCFG_CLIENTE.Value+1;
          dm.CdsClientesCLI_CODIGO.Value := dm.CdsConfigCFG_CLIENTE.Value;
          // Usuário que incluiu
          Dm.CdsClientesCLI_USUARIO_INC.AsInteger := StrtoInt(UFrmAdmin.M_CDUSUA);
          Dm.CdsClientesCLI_DATA_INC.AsDateTime := Date();
          Dm.CdsClientesCLI_HORA_INC.AsString   := M_HOMOVI;
          //
          dm.CdsConfig.ApplyUpdates(0);
          dm.CdsConfig.Close;
          If not (dm.IncluirTarefaUsuario( iUsuario,
            'Incluiu Lojas\Comodatários\Locatários : '+uFuncoes.StrZero(dm.CdsClientesCLI_CODIGO.AsString,7)+' *F*')) Then
               ShowMessage('Erro ao adicionar tarefa do usuário.');
     end
     Else
         If not (dm.IncluirTarefaUsuario( iUsuario,
            'Alterou Lojas\Comodatários\Locatários : '+uFuncoes.StrZero(dm.CdsClientesCLI_CODIGO.AsString,7)+' *F*')) Then
              ShowMessage('Erro ao adicionar tarefa do usuário.');
  //
    If (cmbTPPESSOA.Text = 'FISICA') Then
        dm.CdsClientesCLI_TIPOPESSOA.AsString := 'F'
    Else
        dm.CdsClientesCLI_TIPOPESSOA.AsString := 'J';
  //
  If (Dm.CdsClientes.State = dsEdit) Then
    begin
       // Usuário que alterou
       Dm.CdsClientesCLI_USUARIO_ALT.AsInteger := StrtoInt(UFrmAdmin.M_CDUSUA);
       Dm.CdsClientesCLI_DATA_ALT.AsDateTime := Date;
       Dm.CdsClientesCLI_HORA_ALT.AsString   := M_HOMOVI;
    End;
  //    Gravar
  dm.CdsClientes.Post;
  dm.CdsClientes.ApplyUpdates(0);
  //
  GetFotoCliente;
  //
  Dm.Contatos_Cliente(dm.CdsClientesCLI_CODIGO.AsInteger);
  //Tipo_Pessoa;
  Dm.RefreshCDS(cdsConsClientes);
  //
  Dm.RefreshCDS(dmDados.cdsMatriz);
 End; 
end;

procedure TFrmClientes.BtSairClick(Sender: TObject);
begin
     close;
end;

procedure TFrmClientes.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   cmbTPPESSOA.Enabled := not cmbTPPESSOA.Enabled;
   btProcurar.Enabled  := not btProcurar.Enabled;
   // imgCliente.Enabled  := not imgCliente.Enabled;
   //
   spbCidade.Enabled   := not spbCidade.Enabled;
   spbBairro.Enabled   := not spbBairro.Enabled;
   spCadAtividade.Enabled := not spCadAtividade.Enabled;  
   //
   DBNavigator1.Enabled := not DBNavigator1.Enabled; 
end;

procedure TFrmClientes.dbeNMCLIEChange(Sender: TObject);
begin
  if dm.CdsClientes.State in [dsinsert] then
     if length(dm.CdsClientesCLI_RAZAO.AsString) = 0 then
        dm.CdsClientesCLI_RAZAO.AsString := dm.CdsClientesCLI_FANTASIA.AsString;
end;

procedure TFrmClientes.TabSheet2Show(Sender: TObject);
begin
  if dm.CdsClientes.State in [dsedit,dsinsert] then
    if application.MessageBox('Você deve salvar os dados do cliente'+#13+'Deseja salvar?','Salvar pendencias',mb_yesno) = idyes then
       BtGravar.Click;
    panel1.Visible := false;
  IF dm.CdsClientes.RecNo <> 0 then
     begin
       btadicionar2.Enabled := true;
       bteditar2.Enabled := true;
       Dm.Contatos_Cliente(dm.CdsClientesCLI_CODIGO.AsInteger);
       {dm.CdsContatos.Close;
       dm.sdsContatos.Params.ParamByName('PCODIGO').Value := dm.CdsClientesCLI_CODIGO.Value;
       dm.CdsContatos.Open;}
     end
  else
     begin
       btadicionar2.Enabled := false;
       bteditar2.Enabled := false;
     end;

end;

procedure TFrmClientes.TabSheet1Show(Sender: TObject);
begin
    panel1.Visible := true;
end;

procedure TFrmClientes.btadicionar2Click(Sender: TObject);
begin
  dm.CdsContatos.Append;
  dm.CdsContatosCLI_CODIGO.Value := dm.CdsClientesCLI_CODIGO.Value; 
  DBGrid1.SetFocus;
  tratabotoes2;
//  DBGrid1.EditorMode := true;
end;

procedure TFrmClientes.bteditar2Click(Sender: TObject);
begin
  if dm.CdsContatos.RecordCount > 0 then
     if application.MessageBox('Deseja excluir este contato','Exclusão de contato',mb_yesno) = id_yes then
       begin
       dm.CdsContatos.Delete;
       dm.CdsContatos.ApplyUpdates(0);
       dm.CdsContatos.Close;
       dm.CdsContatos.Open;
       end
  else
      showmessage('Não ha registro a ser excluido');
end;

procedure TFrmClientes.tratabotoes2;
begin
   BtAdicionar2.Enabled := not BtAdicionar2.Enabled;
   BtEditar2.Enabled := not BtEditar2.Enabled;
   BtCancelar2.Enabled := not BtCancelar2.Enabled;
   BtGravar2.Enabled := not BtGravar2.Enabled;
end;

procedure TFrmClientes.btgravar2Click(Sender: TObject);
begin
  If (dm.CdsContatos.State in [dsInsert]) Then
  Begin
      dm.parametros;
      dm.CdsConfig.Edit;
      dm.CdsConfigCFG_CONTATO.Value := dm.CdsConfigCFG_CONTATO.Value+1;
      dm.CdsContatosCON_CODIGO.Value := dm.CdsConfigCFG_CONTATO.Value;
      dm.CdsConfig.ApplyUpdates(0);
      dm.CdsConfig.Close;
  End;
  //
  dm.CdsContatosCLI_CODIGO.Value := dm.CdsClientesCLI_CODIGO.Value;
  dm.CdsContatos.ApplyUpdates(0);
  tratabotoes2;
end;

procedure TFrmClientes.btcancelar2Click(Sender: TObject);
begin
  dm.CdsContatos.Cancel;
  tratabotoes2;
end;

procedure TFrmClientes.btexcluir2Click(Sender: TObject);
begin
  if dm.CdsContatos.RecordCount > 0 then
     if application.MessageBox('Deseja excluir este contato','Exclusão de contato',mb_yesno) = id_yes then
       begin
       dm.CdsContatos.Delete;
       dm.CdsContatos.ApplyUpdates(0);
       end
  else
      showmessage('Não ha registro a ser excluido');
end;

procedure TFrmClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm.CdsCidades.Close;
    dm.CdsBairros.Close;
    Dm.cdsListaAtividades.Close;
    dmDados.cdsMatriz.Close;
    Dm.CdsBairros.Close;
    DM.cdsListaSituacao.Close;
    DM.cdsTpClientes.Close;
    DM2.cdsRegioes.Close;
    //
    cdsConsClientes.Close;
    // 
    Action := caFree;
end;

procedure TFrmClientes.edtConsultarKeyPress(Sender: TObject;
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
  //
  if rgConsultar.ItemIndex = 0 then
  begin
    if not( key in['0'..'9', #8] ) then
    begin
      beep;
      key:=#0;
    end;
  end;
  //
end;

procedure TFrmClientes.edtConsultarChange(Sender: TObject);
begin
     btnConsultar.Enabled := (edtConsultar.Text <> '');
     If not uFuncoes.Empty(edtConsultar.Text) Then
     Begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select CLI_CODIGO, CLI_RAZAO, CLI_FANTASIA, CLI_FONE1, CLI_NRBOX from CLIENTES';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where CLI_CODIGO = ' + edtConsultar.Text;
                 1: CommandText := CommandText + ' where UPPER(CLI_FANTASIA) like ' + QuotedStr(AnsiUpperCase(Copy(edtConsultar.Text,1,49)) + '%');
                 2: CommandText := CommandText + ' where UPPER(CLI_RAZAO) like ' + QuotedStr(AnsiUpperCase(Copy(edtConsultar.Text,1,49)) + '%');
                 3: CommandText := CommandText + ' where UPPER(CLI_NRBOX) like ' + QuotedStr(AnsiUpperCase(Copy(edtConsultar.Text,1, 19)) + '%');
               end;
               //
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' order by CLI_CODIGO';
                 1: CommandText := CommandText + ' order by CLI_FANTASIA';
                 2: CommandText := CommandText + ' order by CLI_RAZAO';
                 3: CommandText := CommandText + ' order by CLI_CODIGO';
               end;

               Open;
          end;
     End;
     //
     If uFuncoes.Empty(edtConsultar.Text) Then
       cdsConsultar.Close;
end;

procedure TFrmClientes.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.First;
end;

procedure TFrmClientes.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.Prior;
end;

procedure TFrmClientes.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.Next;
end;

procedure TFrmClientes.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.Last;
end;

procedure TFrmClientes.btnAlterarClick(Sender: TObject);
begin
     If (M_FLEDIT = 'F') Then
     begin
          BtCancelarClick(Sender);
          //
          //tratabotoes;
          buscar;
          cdsConsClientes.Locate('CLI_CODIGO',Dm.CdsClientesCLI_CODIGO.AsInteger,[]);
          HABILITAR_CONTROLES;
          PageControl1.ActivePageIndex := 0;
          Panel1.Visible := True;
          //
          Dm.Contatos_Cliente(dm.CdsClientesCLI_CODIGO.AsInteger);
          //BtEditarClick(Sender);
     End;
end;

procedure TFrmClientes.buscar;
begin
  {dm.CdsClientes.Close;
  With dm.SdsClientes do
  Begin
       Active := False;
       CommandText := 'Select * from CLIENTES '+
                      'Where (CLI_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('CLI_CODIGO').AsString;
       Active := True;
  End;
  dm.CdsClientes.Open;}
         With dm.CdsClientes do
          begin
                Active := False;
                Params[0].AsInteger := cdsConsultar.FieldByName('CLI_CODIGO').AsInteger;
                Active := True;
                //
                FormataCPFCGC;
                //
                GetFotoCliente;
          End;
end;

procedure TFrmClientes.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select CLI_CODIGO, CLI_FANTASIA from CLIENTES';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where CLI_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(CLI_FANTASIA) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by CLI_FANTASIA';
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

procedure TFrmClientes.BtPesquisarClick(Sender: TObject);
begin
     PageControl1.ActivePageIndex := 1;
     BtCancelarClick(Sender);
end;

procedure TFrmClientes.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TFrmClientes.dsConsultarStateChange(Sender: TObject);
begin
  btnAlterar.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TFrmClientes.TabSheet3Show(Sender: TObject);
begin
      M_FLEDIT := 'F';
      //BtCancelarClick(Sender);
      If (dm.CdsClientes.State in [dsInsert, dsEdit]) Then
      Begin
          dm.CdsClientes.Cancel;
          tratabotoes;
      End;
      Panel1.Visible := False;
      dsConsultar.DataSet.Close;
      edtConsultar.Clear;
      edtConsultar.SetFocus;
end;

procedure TFrmClientes.rgConsultarClick(Sender: TObject);
begin
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código:';
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome/Fantasia:';
      edtConsultar.Clear;
    end;
    2:
    begin
      lblConsultar.Caption := 'Razão Social:';
      edtConsultar.Clear;
    end;
    3:
    begin
      lblConsultar.Caption := 'Nº. Box\Mesa:';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TFrmClientes.Bairros;
begin
     dm.CdsBairros.Close;
     With dm.SdsBairros do
     Begin
          Active := False;
          CommandText := 'Select * from BAIRROS '+
                         'Where (CID_CODIGO = :pCODIGO) '+
                         'order by BAI_NOME';
          ParamByName('pCODIGO').AsString := cmbCidade.KeyValue;
          //dm.CdsClientesCID_CODIGO.AsString;
          Active := True;
     End;
     dm.CdsBairros.Open;
end;

procedure TFrmClientes.cmbBairroEnter(Sender: TObject);
begin
     If not uFuncoes.Empty(cmbCidade.Text) Then
     Begin
          Bairros;
     End
     Else
     Begin
          dm.CdsBairros.Close;
          cmbCidade.SetFocus;
     End;
end;

procedure TFrmClientes.grdConsultarDblClick(Sender: TObject);
begin
     If (M_FLEDIT = 'F') and not(cdsConsultar.IsEmpty) Then
     begin
          buscar;
          PageControl1.ActivePageIndex := 0;
          Panel1.Visible := True;
     End;
end;

procedure TFrmClientes.dbeNRCNPJExit(Sender: TObject);
begin
    If (dm.CdsClientes.State in [dsInsert])
     and not uFuncoes.Empty(dbeNRCNPJ.Text) Then
          If (dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
          Begin
            Try
              If not (uFuncoes.CPF(dbeNRCNPJ.Text)) Then
              Begin
                  MessageDlg('CPF inválido!!!', mtInformation, [mbOk], 0);
                  dbeNRCNPJ.Clear;
                  dbeNRCNPJ.SetFocus;
                  Exit;
              End;
            Except
              dbeNRCNPJ.SetFocus;
              dbeNRCNPJ.Clear;
            End;
          End
          Else
          Begin
            try
              If not (uFuncoes.CGC(dbeNRCNPJ.Text)) Then
              Begin
                  MessageDlg('CNPJ inválido!!!', mtInformation, [mbOk], 0);
                  dbeNRCNPJ.Clear;
                  dbeNRCNPJ.SetFocus;
                  Exit;
              End
              Else
              begin
                   If (dm.CdsClientes.State in [dsInsert]) and (uFuncoes.GetVerificaCNPJ(dbeNRCNPJ.Text)) Then
                    begin
                         MessageDlg('CNPJ já cadastrado.', mtInformation, [mbOk], 0);
                         dbeNRCNPJ.SetFocus;
                         dbeNRCNPJ.Clear;
                         Exit;
                    End;
              End;
            Except
              dbeNRCNPJ.SetFocus;
              dbeNRCNPJ.Clear;
            End;
         End;
end;

procedure TFrmClientes.Tipo_Pessoa;
begin
    If (dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
     begin
        cmbTPPESSOA.ItemIndex   := 0;
        dm.CdsClientesCLI_CGC.EditMask := '999.999.999-99;0'
        //rbtFluxoCliente.Visible := false;
        //cmbRazaoSocial.Visible  := false;
        //lblRazaoMatriz.Visible  := false;
     End
    Else
     Begin
        cmbTPPESSOA.ItemIndex   := 1;
        dm.CdsClientesCLI_CGC.EditMask := '99.999.999/9999-99;0';
        {lblRazaoMatriz.Visible  := True;
        rbtFluxoCliente.Visible := True;
        cmbRazaoSocial.Visible  := True;}
     End;
end;

procedure TFrmClientes.cmbTPPESSOAExit(Sender: TObject);
begin
   { If not uFuncoes.Empty(cmbTPPESSOA.Text) Then
    begin
      If (cmbTPPESSOA.Text = 'FISICA') Then
          dm.CdsClientesCLI_TIPOPESSOA.AsString := 'F'
      Else
          dm.CdsClientesCLI_TIPOPESSOA.AsString := 'J';
      //
      HABILITAR_CONTROLES;
    End;}
end;

procedure TFrmClientes.HABILITAR_CONTROLES;
begin
    If (dm.CdsClientes.State in [dsInsert, dsEdit]) Then
    Begin
      If (dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
      Begin
          lbl_emissor.Visible   := True;
          lbl_UFEMISSOR.Visible:= True;
          dbeEmissor.Visible   := True;
          cmbUFEMISSOR.Visible := True;
          //
          lbl_Fantasia.Caption := 'Nome do Cliente';
          lbl_Razao.Caption    := 'Apelido';
          lbl_CPFCGC.Caption   := 'CPF';
          lbl_Incricao.Caption := 'RG';
          dm.CdsClientesCLI_CGC.EditMask := '999.999.999-99;0';
          //rbtFluxoCliente.Visible := False;
      End
      Else
      Begin
          lbl_emissor.Visible   := False;
          lbl_UFEMISSOR.Visible:= False;
          dbeEmissor.Visible   := False;
          cmbUFEMISSOR.Visible := False;
          //
          lbl_Fantasia.Caption := 'Nome Fantásia';
          lbl_Razao.Caption    := 'Razão Social';
          lbl_CPFCGC.Caption   := 'CNPJ';
          lbl_Incricao.Caption := 'Inscrição Estadual';
          //
          dm.CdsClientesCLI_CGC.EditMask := '99.999.999/9999-99;0';
          //rbtFluxoCliente.Visible := True;
      End;
    End;
    //
    If (dm.CdsClientes.State in [dsBrowse]) Then
    Begin
      If (dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
      Begin
          lbl_emissor.Visible   := True;
          lbl_UFEMISSOR.Visible:= True;
          dbeEmissor.Visible   := True;
          cmbUFEMISSOR.Visible := True;
          //
          lbl_Fantasia.Caption := 'Nome do Cliente';
          lbl_Razao.Caption    := 'Apelido';
          lbl_CPFCGC.Caption   := 'CPF';
          lbl_Incricao.Caption := 'RG';
          //rbtFluxoCliente.Visible := False;
      End
      Else
      Begin
          lbl_emissor.Visible   := False;
          lbl_UFEMISSOR.Visible:= False;
          dbeEmissor.Visible   := False;
          cmbUFEMISSOR.Visible := False;
          //
          lbl_Fantasia.Caption := 'Nome Fantásia';
          lbl_Razao.Caption    := 'Razão Social';
          lbl_CPFCGC.Caption   := 'CPNJ';
          lbl_Incricao.Caption := 'Inscrição Estadual';
          //rbtFluxoCliente.Visible := True;
          //
      End;
    End;
end;

procedure TFrmClientes.dbeNRCNPJEnter(Sender: TObject);
begin
    { If (dm.CdsClientes.State in [dsInsert, dsedit] ) Then
     Begin
          If (dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
              dm.CdsClientesCLI_CGC.EditMask := '999.999.999-99;0'
          Else
              dm.CdsClientesCLI_CGC.EditMask := '99.999.999/9999-99;0';
     End;}
end;

procedure TFrmClientes.cmbTPPESSOAChange(Sender: TObject);
begin
    If not uFuncoes.Empty(cmbTPPESSOA.Text) Then
    begin
      If (cmbTPPESSOA.Text = 'FISICA') Then
      begin
          dm.CdsClientesCLI_TIPOPESSOA.AsString := 'F';
          //rbtFluxoCliente.Visible := False;
      End
      Else
      begin
          dm.CdsClientesCLI_TIPOPESSOA.AsString := 'J';
          //rbtFluxoCliente.Visible := True;
      End;
      //
      HABILITAR_CONTROLES;
    End;
end;

procedure TFrmClientes.cmbTPPESSOAEnter(Sender: TObject);
begin
    If not uFuncoes.Empty(cmbTPPESSOA.Text) Then
      HABILITAR_CONTROLES;
end;

procedure TFrmClientes.btProcurarClick(Sender: TObject);
begin
  If (dm.CdsClientes.State in [dsInsert, dsEdit]) Then
  Begin
     If OpenPictureDialog1.Execute Then
      begin
          CarregaFotoParaBanco(OpenPictureDialog1.FileName);
          //
          GetFotoCliente;
      End;
     {Try
          If (OpenPictureDialog1.Execute) Then
             imgCliente.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar abrir imagem!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;}
  End;
end;


procedure TFrmClientes.TabSheet1Exit(Sender: TObject);
begin
     //BtCancelarClick(Sender);
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
     //dm.CdsCidades.Open;
     //dm.CdsBairros.Open;
     //dm.CdsSituacao.Open;
     //dm.CdsAtividades.Open;
     //
     dm.RefreshCDS(dm.CdsCidades);
     dm.RefreshCDS(dm.CdsBairros);
     Dm.RefreshCDS(Dm.cdsListaAtividades);
     Dm.RefreshCDS(dmDados.cdsMatriz);
     Dm.RefreshCDS(Dm.CdsBairros);
     Dm.RefreshCDS(DM.cdsListaSituacao);
     Dm.RefreshCDS(DM.cdsTpClientes);
     Dm.RefreshCDS(DM2.cdsRegioes);
     dm.RefreshCDS(dm.cdsListaGrupos);
     //
     dm.parametros;
     If (dm.CdsConfigCFG_CLIENTE.AsInteger = 0) Then
     begin
          dm.CdsClientes.close;
          With dm.CdsClientes do
          Begin
               Active := False;
               //CommandText := 'Select * from CLIENTES ';
               Params[0].AsInteger := 0;
               Active := True;
          End;
          BtAdicionarClick(Sender);
          {Dm.CdsClientes.FetchParams;
          dm.CdsClientes.Open}
     End
     Else
     Begin
         With dm.CdsClientes do
          begin
                Active := False;
                Params[0].AsInteger := uFuncoes.mvcodigo('CLI_CODIGO','CLIENTES');
                Active := True;
          End;
         {dm.CdsClientes.Close;
         dm.SdsClientes.ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('CLI_CODIGO','CLIENTES');
         dm.CdsClientes.Open;}
     End;
     //
     Tipo_Pessoa;
     GetFotoCliente;
     HABILITAR_CONTROLES;
     //rbtFluxoCliente.Visible := False;
     //
     PageControl1.ActivePageIndex := 0;
     //
     cdsConsClientes.Open; 
end;

procedure TFrmClientes.edtConsultarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If (cdsConsultar.Active) Then
   Begin
     IF (KEY = VK_UP) then
          cdsConsultar.Prior;
     //
     IF (KEY = VK_DOWN) then
          cdsConsultar.Next;
   End;

end;

procedure TFrmClientes.dbeDTNASCExit(Sender: TObject);
begin
     If (dbeDTNASC.Text <> '  /  /    ') and (Dm.DsClientes.State in [dsInsert, dsEdit]) Then
     Begin
          try
              StrToDate(dbeDTNASC.Text);
              dbeDTNASC.Text := DatetoStr(dbeDTNASC.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTNASC.Clear;
                     dbeDTNASC.SetFocus;
                End;
           end;
     End;
end;

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
   If not (UFrmAdmin.admin) Then
   begin
     //
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Clientes...'));
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

procedure TFrmClientes.spbCidadeClick(Sender: TObject);
begin
     with TfrmCadCidades.create(self) do
      try
          showmodal;
     finally
         free;
     end;
     //
     dm.RefreshCDS(dm.CdsCidades);
end;

procedure TFrmClientes.spbBairroClick(Sender: TObject);
begin
     with TfrmCadBairro.create(self) do
      try
          showmodal;
     finally
         free;
     end;
     //
     dm.RefreshCDS(dm.CdsBairros);
end;

procedure TFrmClientes.NavegarCliente(iCodigo: Integer);
begin
          //
          With dm.CdsClientes do
          begin
                Active := False;
                Params[0].AsInteger := iCodigo;
                Active := True;
          End;
          //
          HABILITAR_CONTROLES;
          PageControl1.ActivePageIndex := 0;
          Panel1.Visible := True;
          //
          Tipo_Pessoa;
          //
          GetFotoCliente;
          //
          Dm.Contatos_Cliente(dm.CdsClientesCLI_CODIGO.AsInteger);
          //BtEditarClick(Sender);
end;

procedure TFrmClientes.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
     //if  not (cdsConsClientes.isEmpty) Then
       NavegarCliente(cdsConsClientesCLI_CODIGO.AsInteger);
end;

procedure TFrmClientes.rbtFluxoClienteChange(Sender: TObject);
begin
{  if (Dm.CdsClientes.State in [dsInsert, dsEdit] ) Then
     if (rbtFluxoCliente.ItemIndex = 0) Then
      begin
         cmbRazaoSocial.Enabled := False;
         Dm.CdsClientesCLI_CODIGO_MATRIZ.Clear;
      End
     Else
         cmbRazaoSocial.Enabled := True;}
end;

procedure TFrmClientes.dbeRazaoExit(Sender: TObject);
begin
    If (dm.CdsClientes.State = dsInsert) and not uFuncoes.Empty(dbeRazao.Text) Then
      if (Dm.CdsConfigCFG_VERIFICA_RAZAO.AsString = 'S') Then
        if (uFuncoes.Verificar_Razao(dbeRazao.Text)) Then
        begin
             Application.MessageBox(PChar('Razão já cadastrada.'),
                'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dbeRazao.Clear;
             dbeRazao.SetFocus;
             Exit;
        End;
end;

procedure TFrmClientes.dbeRazaoKeyPress(Sender: TObject; var Key: Char);
begin
      if (key = #27) then
       begin
            key := #0;
            If (dm.CdsClientes.State in [dsInsert, dsEdit]) Then
                BtCancelarClick(Sender);
       End;
end;

procedure TFrmClientes.spCadAtividadeClick(Sender: TObject);
begin
     with TfrmCadAtividades.create(self) do
      try
          showmodal;
     finally
         free;
     end;
     //
     dm.RefreshCDS(dm.cdsListaAtividades);
end;

procedure TFrmClientes.FormataCPFCGC;
begin
     If not (Dm.CdsClientes.IsEmpty) Then
     begin
         If (dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
            dm.CdsClientesCLI_CGC.EditMask := '999.999.999-99;0'
         Else
            dm.CdsClientesCLI_CGC.EditMask := '99.999.999/9999-99;0';
     End;
end;

procedure TFrmClientes.CarregaFotoParaBanco(FileName: String);
Var
  stImagem: TFileStream;
begin
  stImagem := TFileStream.Create( FileName, fmOpenRead or fmShareDenyWrite );
  Try
     // ibdsCredenciadosFOTO é um campo BLOB SUB_TYPE 0
     dm.CdsClientesCLI_FOTO.LoadFromStream( stImagem );
     //
  Finally
     stImagem.Free;
  End;
end;

procedure TFrmClientes.ObtemImagemDoBanco(var imgDestino: TImage);
Var
  jpgImg: TJPEGImage;
  stMem: TMemoryStream;
begin
  If (dm.CdsClientesCLI_FOTO.IsNull) Then
  begin
       imgFotoFunc.Visible := False;
       Exit;
  End;
  //
  jpgImg := TJPEGImage.Create;
  stMem := TMemoryStream.Create;
  Try
      dm.CdsClientesCLI_FOTO.SaveToStream( stMem );
      stMem.Position := 0;
      jpgImg.LoadFromStream( stMem );
      imgDestino.Picture.Assign( jpgImg );
      imgFotoFunc.Visible := True;
  Finally
        stMem.Free;
        jpgImg.Free;
  End;
end;

procedure TFrmClientes.GetFotoCliente;
begin
     If not (dm.CdsClientesCLI_FOTO.IsNull) Then
         ObtemImagemDoBanco(imgFotoFunc)
     Else
         imgFotoFunc.Visible := False;
end;

procedure TFrmClientes.DBEdit16KeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
end;

end.
