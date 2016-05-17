unit uFrmCadUnidades2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids, DBGrids,
  Buttons, StdCtrls, ExtCtrls, Mask, DBCtrls, ComCtrls;

type
  TfrmCadUnidades2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtPesquisar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    dbeCDUNID: TDBEdit;
    dbeNMDESC: TDBEdit;
    TabSheet3: TTabSheet;
    Panel5: TPanel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    btnConsultar2: TBitBtn;
    btnAlterar2: TBitBtn;
    edtConsultar2: TEdit;
    Panel6: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    qryLocUnidade: TSQLQuery;
    dsUnidades: TDataSource;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarUNI_CODIGO: TStringField;
    cdsConsultarUNI_DESCRICAO: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultar2Click(Sender: TObject);
    procedure btnAlterar2Click(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure edtConsultar2Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure dsConsultarStateChange(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeNMDESCExit(Sender: TObject);
    procedure dbeCDUNIDExit(Sender: TObject);
    procedure edtConsultar2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure Validar_Codigo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUnidades2: TfrmCadUnidades2;

implementation

uses Udm, uFuncoes, udmConsulta, UFrmAdmin;

{$R *.dfm}

procedure TfrmCadUnidades2.FormActivate(Sender: TObject);
begin
     PageControl1.ActivePageIndex := 0;
  dm.cdsUnidades.Open;
end;

procedure TfrmCadUnidades2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dm.cdsUnidades.Close;
   Action := caFree;
end;

procedure TfrmCadUnidades2.btnConsultar2Click(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select UNI_CODIGO, UNI_DESCRICAO from UNIDADES ';
    case RadioGroup1.ItemIndex of
      0: CommandText := CommandText + ' where UPPER(UNI_CODIGO) like  ' + QuotedStr(AnsiUpperCase(edtConsultar2.Text) + '%');
      1: CommandText := CommandText + ' where UPPER(UNI_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar2.Text) + '%');
    end;
    CommandText := CommandText + ' order by UNI_DESCRICAO';
    Open;
    if IsEmpty then
    begin
      MessageDlg('Nenhum registro encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
      edtConsultar2.Clear;
      if edtConsultar2.CanFocus then
        edtConsultar2.SetFocus;
    end;
  end;
end;

procedure TfrmCadUnidades2.btnAlterar2Click(Sender: TObject);
begin
  If not (cdsConsultar.IsEmpty ) then
  begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       dbeCDUNID.SetFocus;
  End;
end;

procedure TfrmCadUnidades2.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.First;
end;

procedure TfrmCadUnidades2.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.Prior;

end;

procedure TfrmCadUnidades2.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.Next;
end;

procedure TfrmCadUnidades2.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.Last;
end;

procedure TfrmCadUnidades2.BtAdicionarClick(Sender: TObject);
begin
  tratabotoes;
  dm.cdsUnidades.Append;
  dbeCDUNID.Enabled := True;
  dbeCDUNID.SetFocus;
end;

procedure TfrmCadUnidades2.BtEditarClick(Sender: TObject);
begin
  if dm.cdsUnidades.RecordCount > 0 then
  Begin
      tratabotoes;
      dm.cdsUnidades.Edit;
      dbeCDUNID.Enabled := False;
      dbeNMDESC.SetFocus;
  End;
end;

procedure TfrmCadUnidades2.BtExcluirClick(Sender: TObject);
begin
  if dm.cdsUnidades.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este banco?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dm.cdsUnidades.Delete;
       dm.cdsUnidades.ApplyUpdates(0);
       {dm.cdsBancos.Close;
       dm.dstBancos.ParamByName('PCODIGO').AsString := dm.mscodigo('BAN_CODIGO','BANCOS');
       dm.cdsBancos.Open;}
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadUnidades2.BtCancelarClick(Sender: TObject);
begin
  tratabotoes;
  dm.cdsUnidades.Cancel;
end;

procedure TfrmCadUnidades2.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeCDUNID.Text) Then
  Begin
       Application.MessageBox('Digite o código da unidade!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeCDUNID.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(dbeNMDESC.Text) Then
  Begin
       Application.MessageBox('Digite a descrição da unidade!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMDESC.SetFocus;
       Exit;
  End;
  //
  If (dm.cdsUnidades.State = dsInsert) Then
     Validar_Codigo;
  //
  Try
    //
    tratabotoes;
    dm.cdsUnidades.Post;
    dm.cdsUnidades.ApplyUpdates(0);
    //
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.cdsUnidades.Cancel;
        End;
  End;

end;

procedure TfrmCadUnidades2.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadUnidades2.buscar;
begin
  dm.cdsUnidades.Close;
  With dm.dstUnidades do
  Begin
       Active := False;
       CommandText := 'Select UNI_CODIGO, UNI_DESCRICAO from UNIDADES '+
                      'Where (UNI_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('UNI_CODIGO').AsString;
       Active := True;
  End;
  dm.cdsUnidades.Open;
end;

procedure TfrmCadUnidades2.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadUnidades2.Validar_Codigo;
begin
     with qryLocUnidade do
     begin
           Close;
           Params.ParamByName('pCODIGO').AsString := dbeCDUNID.Text;
           Open;
        //
         if not IsEmpty then
         begin
             Application.MessageBox('Registro de unidade já cadastro!!!',
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             //
             if dbeCDUNID.CanFocus then
               dbeCDUNID.SetFocus;
             dbeCDUNID.Clear;
             //
             Exit;
         end;
     End;
end;

procedure TfrmCadUnidades2.edtConsultar2Change(Sender: TObject);
begin
     btnConsultar2.Enabled := (edtConsultar2.Text <> '');
     //
     If not uFUncoes.Empty(edtConsultar2.Text) Then
     begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select UNI_CODIGO, UNI_DESCRICAO from UNIDADES ';
               case RadioGroup1.ItemIndex of
                 0: CommandText := CommandText + ' where UPPER(UNI_CODIGO) like  ' + QuotedStr(AnsiUpperCase(edtConsultar2.Text) + '%');
                 1: CommandText := CommandText + ' where UPPER(UNI_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar2.Text) + '%');
               end;
               CommandText := CommandText + ' order by UNI_DESCRICAO';
               Open;
          End;  //fim-with
     End;   //fim-se
    //
    If uFuncoes.Empty(edtConsultar2.Text) Then
        cdsConsultar.Close;
end;

procedure TfrmCadUnidades2.RadioGroup1Click(Sender: TObject);
begin
    edtConsultar2.Clear; 
    edtConsultar2.SetFocus;
end;

procedure TfrmCadUnidades2.BtPesquisarClick(Sender: TObject);
begin
     PageControl1.ActivePageIndex := 1;
end;

procedure TfrmCadUnidades2.TabSheet3Show(Sender: TObject);
begin
      dsConsultar.DataSet.Close; 
      edtConsultar2.Clear;
      edtConsultar2.SetFocus;
end;

procedure TfrmCadUnidades2.dsConsultarStateChange(Sender: TObject);
begin
  btnAlterar2.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmCadUnidades2.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TfrmCadUnidades2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
end;

procedure TfrmCadUnidades2.dbeNMDESCExit(Sender: TObject);
begin
  If (Dm.cdsUnidades.State in [dsInsert]  )
    and not uFuncoes.Empty(dbeNMDESC.Text) Then
  begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select UNI_DESCRICAO from UNIDADES Where (UNI_DESCRICAO = :pNOME)');
           Params.ParamByName('pNOME').AsString := dbeNMDESC.Text;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Application.MessageBox('Unidade já cadastrada!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeNMDESC.SetFocus;
                 dbeNMDESC.Clear;
                 Exit;
            End;
      End;
   End;
end;

procedure TfrmCadUnidades2.dbeCDUNIDExit(Sender: TObject);
begin
  If (Dm.cdsUnidades.State in [dsInsert]  )
    and not uFuncoes.Empty(dbeCDUNID.Text) Then
  begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select UNI_CODIGO from UNIDADES Where (UNI_CODIGO = :pCODIGO)');
           Params.ParamByName('pCODIGO').AsString := dbeCDUNID.Text;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Application.MessageBox('Código de unidade já cadastrado!!!','ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeCDUNID.SetFocus;
                 dbeCDUNID.Clear;
                 Exit;
            End;
      End;
   End;
end;

procedure TfrmCadUnidades2.edtConsultar2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key =#13) and not uFuncoes.Empty(edtConsultar2.Text)then
  begin
      key :=#0;
      Perform(Wm_NextDlgCtl,0,0);
  end;
  //
end;

procedure TfrmCadUnidades2.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Unidades...'));
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
