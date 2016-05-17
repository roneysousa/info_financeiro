unit uFrmCadDerivados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ToolEdit,
  CurrEdit, DBXpress, jpeg;

type
  TfrmCadDerivados = class(TfrmCadastro)
    Panel5: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    dbGridDados: TDBGrid;
    Panel7: TPanel;
    pnlDados: TPanel;
    edtCDPROD: TEdit;
    edtDESCRICAO: TEdit;
    edtQUANT: TCurrencyEdit;
    edtPERCE: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtPEPERDA: TCurrencyEdit;
    Label1: TLabel;
    dbeNMTIPO: TEdit;
    qryProcurar: TSQLQuery;
    spLocProduto: TSpeedButton;
    qryExcluir: TSQLQuery;
    cdsConsultarDER_ID: TIntegerField;
    cdsConsultarDER_DESCRICAO: TStringField;
    Image1: TImage;
    procedure BtAdicionarClick(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure edtQUANTKeyPress(Sender: TObject; var Key: Char);
    procedure edtPERCEKeyPress(Sender: TObject; var Key: Char);
    procedure BtGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtQUANTEnter(Sender: TObject);
    procedure edtPERCEEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCDPRODEnter(Sender: TObject);
    procedure dbeNMTIPOKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNMTIPOExit(Sender: TObject);
    procedure spLocProdutoClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure edtPERCEExit(Sender: TObject);
  private
     procedure tratabotoes;
     procedure buscar;
     procedure MOSTRA_DADOS;
     procedure LIMPAR;
     function SOMA() : Real;
     procedure SOMA_AUTO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDerivados: TfrmCadDerivados;
  TD : TTransactionDesc;
  M_NRIDEN, W_NRIDEN : Integer;
  M_TOPERD : Double;
  M_NMDESC, M_CDPROD : String;
  M_TIPOEXCLUSAO : Char;

implementation

uses Udm, uFuncoes, udmConsulta, UFrmAdmin, uFrmBuscaProdutos;

{$R *.dfm}

procedure TfrmCadDerivados.BtAdicionarClick(Sender: TObject);
begin
    inherited;
    dbeNMTIPO.Enabled := True;
    pnlDados.Enabled := True;
    //
    tratabotoes;
    dm.parametros;
    dm.CdsConfig.Edit;
    dm.CdsConfigCFG_IDDERIVADOS.AsInteger := dm.CdsConfigCFG_IDDERIVADOS.AsInteger+1;
    dm.CdsConfig.Post;
    dm.CdsConfig.ApplyUpdates(0);
    //
    W_NRIDEN := dm.CdsConfigCFG_IDDERIVADOS.AsInteger;
    M_TIPOEXCLUSAO := '1';
    //
    dm.cdsDerivados.Close;
    With dm.dstDerivados do
    Begin
                  Active := False;
                  CommandText := 'Select * from DERIVADOS Where ( DER_ID = :pID)';
                  Params.ParamByName('pID').AsInteger := W_NRIDEN;
                  Active := True;
    End;
    //
    dm.cdsDerivados.Open;
    //
    edtPEPERDA.Clear;
    dbeNMTIPO.Clear;
    dbeNMTIPO.SetFocus
end;

procedure TfrmCadDerivados.buscar;
begin
  dm.cdsDerivados.Close;
  With dm.dstDerivados do
  Begin
       Active := False;
       CommandText := 'Select * from DERIVADOS Where (DER_ID = :pID)';
       Params.ParamByName('pID').AsInteger := cdsConsultar.FieldByName('DER_ID').AsInteger;
       Active := True;
  End;
  dm.cdsDerivados.Open;
  //
  M_NMDESC := cdsConsultar.FieldByName('DER_DESCRICAO').AsString;
  dbeNMTIPO.Text := M_NMDESC;
  //
  {If (dm.cdsDerivados.IsEmpty) Then
  Begin
       dm.cdsDerivados.Append;
       dm.cdsDerivados.FieldByName('DER_SEQUENCIA').Value    := dm.CdsConfigCFG_IDDERIVADOS.Value+1;
       dm.cdsDerivados.FieldByName('DER_ID').AsInteger       := M_NRIDEN;
       dm.cdsDerivados.FieldByName('DER_DESCRICAO').AsString := M_NMDESC;
  End;}
end;

procedure TfrmCadDerivados.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   //BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   TabSheet2.Enabled   := not TabSheet2.Enabled; 
   //
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadDerivados.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If (key = #13) and not uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
          Key := #0;
          //
          With dmConsultas.qryProdutos do
          Begin
               Close;
               Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
               Open;
          End;
          //
          If (dmConsultas.qryProdutos.IsEmpty) Then
          Begin
               Application.MessageBox('Código de produto não cadastrado!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               //
               dmConsultas.qryProdutos.Close;
               edtDESCRICAO.Clear;
               edtCDPROD.Clear;
               edtCDPROD.SetFocus;
               Exit;
          End
          Else
          Begin
               tratabotoes;
               edtDESCRICAO.Text := dmConsultas.qryProdutos.FieldByName('PRO_DESCRICAO').AsString;
               edtQUANT.SetFocus;
          End;
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
          Key := #0;
          spLocProdutoClick(Sender);
     End;
end;

procedure TfrmCadDerivados.FormCreate(Sender: TObject);
begin
  inherited;
  MOSTRA_DADOS;
end;

procedure TfrmCadDerivados.LIMPAR;
begin
    edtCDPROD.Clear;
    edtDESCRICAO.Clear;
    edtQUANT.Clear;
    edtPERCE.Clear;
    //
end;

procedure TfrmCadDerivados.BtCancelarClick(Sender: TObject);
begin
  inherited;
      tratabotoes;
      dm.cdsDerivados.Close;
      dbeNMTIPO.Enabled := False;
      LIMPAR;
      MOSTRA_DADOS;
end;

procedure TfrmCadDerivados.edtQUANTKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
      If (Key = #13) Then
      Begin
           Key := #0;
           edtPERCE.SetFocus;
      End;
end;

procedure TfrmCadDerivados.edtPERCEKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
      If (Key = #13) Then
      Begin
           Key := #0;
           //
           //BtGravar.SetFocus;
       If uFuncoes.Empty(dbeNMTIPO.Text) Then
       Begin
            Application.MessageBox('Digite a descrição do tipo!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dbeNMTIPO.SetFocus;
            Exit;
       End;
       //
       edtCDPROD.SetFocus; 
       //
      End;
end;

procedure TfrmCadDerivados.BtGravarClick(Sender: TObject);
begin
  inherited;
       If uFuncoes.Empty(dbeNMTIPO.Text) Then
       Begin
            Application.MessageBox('Digite a descrição do tipo!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dbeNMTIPO.SetFocus;
            Exit;
       End;
       //
       Try
             tratabotoes;
             //
             TD.TransactionID := StrtoInt(UFrmAdmin.M_CDUSUA);
             TD.IsolationLevel := xilREPEATABLEREAD;
             dm.SqlAdmin.StartTransaction(TD);
             //
             If (dm.cdsDerivados.State in [dsInsert, dsEdit]) Then
             Begin
                 dm.cdsDerivados.Post;
                 dm.cdsDerivados.ApplyUpdates(0);
                 //
                 Application.MessageBox(PChar('Registro gravado com sucesso!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 //
                 //dm.cdsDerivados.Close;
             End;
             //
             dbeNMTIPO.Clear;
             edtPEPERDA.Clear;
             //
             M_TIPOEXCLUSAO := '0';
             //
             dm.SqlAdmin.Commit(TD);
             //
       Except
           on Exc:Exception do
           begin
                Application.MessageBox(PChar('Erro na inclusão do item!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //  Cancelar transação no BD.
                dm.SqlAdmin.Rollback(TD);
                dbeNMTIPO.Enabled := False;
          End;
       End;
end;

procedure TfrmCadDerivados.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select DER_ID, DER_DESCRICAO FROM DERIVADOS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where DER_ID = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(DER_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'Group by DER_ID, DER_DESCRICAO Order by DER_DESCRICAO';
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

procedure TfrmCadDerivados.btnAlterarClick(Sender: TObject);
begin
  inherited;
  //tratabotoes;
  buscar;
  If not (dm.cdsDerivados.IsEmpty) Then
     SOMA_AUTO
  Else
    edtPEPERDA.Clear;
  //
  PageControl1.ActivePageIndex := 0;
  BtAdicionar.SetFocus;
end;

procedure TfrmCadDerivados.edtCDPRODExit(Sender: TObject);
begin
  inherited;
    If not uFuncoes.Empty(edtCDPROD.Text) Then
    begin
          With dmConsultas.qryProdutos do
          Begin
               Close;
               Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
               Open;
          End;
          //
          If (dmConsultas.qryProdutos.IsEmpty) Then
          Begin
               Application.MessageBox('Código de produto não cadastrado!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               //
               dmConsultas.qryProdutos.Close;
               spLocProduto.Enabled := True;
               edtDESCRICAO.Clear;
               edtCDPROD.Clear;
               edtCDPROD.SetFocus;
               Exit;
          End
          Else
          Begin
               tratabotoes;
               edtCDPROD.Text := uFuncoes.StrZero(edtCDPROD.Text,13);
               spLocProduto.Enabled := False;
               edtDESCRICAO.Text := dmConsultas.qryProdutos.FieldByName('PRO_DESCRICAO').AsString;
               edtQUANT.SetFocus;
          End;

    End;
end;

procedure TfrmCadDerivados.edtQUANTEnter(Sender: TObject);
begin
  inherited;
    If uFuncoes.Empty(edtCDPROD.Text) Then
       edtCDPROD.SetFocus;
    //
end;

procedure TfrmCadDerivados.edtPERCEEnter(Sender: TObject);
begin
  inherited;
    If uFuncoes.Empty(edtCDPROD.Text) Then
       edtCDPROD.SetFocus;
    //
end;

procedure TfrmCadDerivados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    dm.cdsDerivados.Close;
end;

procedure TfrmCadDerivados.edtCDPRODEnter(Sender: TObject);
begin
  inherited;
    edtDESCRICAO.Clear;
    edtQUANT.Clear;
    edtPERCE.Clear;
    //
    If (dm.cdsDerivados.State in [dsInsert, dsEdit]) Then
       spLocProduto.Enabled := True
    Else
       spLocProduto.Enabled := False;
end;

function TfrmCadDerivados.SOMA: Real;
Var
   M_VLSOMA : REAL;
begin
    M_VLSOMA := 0;
    If not (dm.cdsDerivados.IsEmpty) Then
    Begin
      dm.cdsDerivados.DisableControls;
      dm.cdsDerivados.First;
      While not (dm.cdsDerivados.Eof) do
      Begin
           M_VLSOMA := M_VLSOMA + dm.cdsDerivados.FieldByName('DER_PECENTUAL').AsCurrency;
           //
           dm.cdsDerivados.Next;
      End;
      dm.cdsDerivados.EnableControls;
      //
      result := M_VLSOMA;
    End;
end;

procedure TfrmCadDerivados.SOMA_AUTO;
begin
     M_TOPERD := 100 - SOMA();
     edtPEPERDA.Text := FormatFloat('##0.#0',M_TOPERD);
end;

procedure TfrmCadDerivados.dbeNMTIPOKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
      If (Key = #13) and not ufuncoes.Empty(dbeNMTIPO.Text) Then
      Begin
           Key := #0;
           edtCDPROD.SetFocus;
      End;
end;

procedure TfrmCadDerivados.MOSTRA_DADOS;
begin
     dm.parametros;
     dm.cdsDerivados.Close;
     With dm.dstDerivados do
     Begin
          Active := False;
          CommandText := 'Select * from DERIVADOS Where (DER_ID = :pID)';
          Params.ParamByName('pID').AsInteger := uFuncoes.mvcodigo('DER_ID','DERIVADOS');
          Active := True;
     End;
     dm.cdsDerivados.Open;
     //
     M_NRIDEN := dm.cdsDerivados.FieldByName('DER_ID').AsInteger;
     M_NMDESC := dm.cdsDerivados.FieldByName('DER_DESCRICAO').AsString;
     //
     If not (dm.cdsDerivados.IsEmpty) Then
     begin
        SOMA_AUTO;
        dbeNMTIPO.Text := M_NMDESC;
     End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadDerivados.dbeNMTIPOExit(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(dbeNMTIPO.Text) Then
     Begin
          {With qryProcurar do
          Begin
                  SQL.Clear;
                  Close;
                  SQL.Add('Select PER_SEQUENCIA, PED_DESCRICAO from PERDAS ');
                  SQL.Add('Where (PED_DESCRICAO = :pDESCRICAO)');
                  Params.ParamByName('pDESCRICAO').AsString := dbeNMTIPO.Text;
                  Open;
          End;}
          //
          If not (qryProcurar.IsEmpty) Then
          Begin
             dm.cdsDerivados.Close;
             With dm.dstDerivados do
             Begin
                  Active := False;
                  CommandText := 'Select * from DERIVADOS Where (DER_DESCRICAO = :pDESCRICAO)';
                  Params.ParamByName('pDESCRICAO').AsString := dbeNMTIPO.Text;
                  Active := True;
             End;
             //
             dm.cdsDerivados.Open;
             //
             edtCDPROD.SetFocus;
          End;
          //
     End;
end;

procedure TfrmCadDerivados.spLocProdutoClick(Sender: TObject);
begin
  inherited;
    with TfrmBuscaProduto.create(self) do
    try
       M_NRFROM := 3;
       showmodal;
    finally
       free;
       If NOT uFuncoes.Empty(M_CDPROD) Then
       begin
           edtCDPROD.Text := M_CDPROD;
           edtQUANT.SetFocus;
           //
           //edtCDPROD
       End;
   end;
end;

procedure TfrmCadDerivados.BtExcluirClick(Sender: TObject);
Var
    M_IDDERI : integer;
begin
  inherited;
  if (dm.cdsDerivados.Active = True) and
    (dm.cdsDerivados.RecordCount > 0) then
     If Application.MessageBox('Deseja excluir este derivado?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       If (M_TIPOEXCLUSAO = '1') Then
       Begin
           dm.cdsDerivados.Delete;
           //dm.cdsDerivados.ApplyUpdates(0);
           //
           SOMA_AUTO;
       End
       Else
       Begin
            //dm.cdsDerivados.DisableControls;
            dm.cdsDerivados.First;
            M_IDDERI := dm.cdsDerivados.FieldByName('DER_ID').AsInteger;
            //
            dm.cdsDerivados.Close;
            With qryExcluir do
            Begin
                 Close;
                 Params.ParamByName('pID').AsInteger := M_IDDERI;
                 ExecSQL;
            End;
            //
            BtCancelarClick(Sender);
            //
            tratabotoes;
       End;
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadDerivados.edtPERCEExit(Sender: TObject);
begin
  inherited;
       If (edtQUANT.Value = 0) and (edtPERCE.Value = 0) Then
       Begin
            Application.MessageBox('Digite a quantidade!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            edtQUANT.SetFocus;
            Exit;
       End;
       //
       Try
             // Inicia um transação no BD
             TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
             TD.IsolationLevel := xilREADCOMMITTED;
             Dm.SqlAdmin.StartTransaction(TD);
             //
             M_NMDESC := dbeNMTIPO.Text;
             //
             {dm.cdsDerivados.Close;
             With dm.dstDerivados do
             Begin
                  Active := False;
                  CommandText := 'Select * from DERIVADOS Where ( = :pDESCRICAO)';
                  Params.ParamByName('pDESCRICAO').AsString := W_NRIDEN;
                  Active := True;
             End;}
             //
             //dm.cdsDerivados.Open;
             dm.cdsDerivados.Append;
             //
             dm.cdsDerivados.FieldByName('DER_ID').AsInteger       := W_NRIDEN;
             dm.cdsDerivados.FieldByName('DER_PRODUTO').AsString   := edtCDPROD.Text;
             dm.cdsDerivados.FieldByName('DER_DESCRICAO').AsString := M_NMDESC;
             //
             If (edtQUANT.Value > 0) Then
             Begin
                 dm.cdsDerivados.FieldByName('DER_QUANTIDADE').AsFloat := edtQUANT.Value;
                 dm.cdsDerivados.FieldByName('DER_PECENTUAL').AsFloat  := 0;
             End
             Else
             Begin
                 dm.cdsDerivados.FieldByName('DER_QUANTIDADE').AsFloat := 0;
                 dm.cdsDerivados.FieldByName('DER_PECENTUAL').AsFloat  := edtPERCE.Value;
             End;
             dm.cdsDerivados.Post;
             dm.cdsDerivados.ApplyUpdates(0);
             //
             SOMA_AUTO;
             //
             LIMPAR;
             // Grava
             Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
             //
             edtCDPROD.SetFocus;
       Except
           on Exc:Exception do
           begin
                Application.MessageBox(PChar('Erro na inclusão do item!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //  Cancelar transação no BD.
                Dm.SqlAdmin.Rollback(TD);
                //
          End;
       End;
end;

end.
