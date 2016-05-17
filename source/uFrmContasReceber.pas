unit uFrmContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DB, Mask,
  DBCtrls, FMTBcd, DBClient, Provider, SqlExpr, ToolEdit, CurrEdit, DBXpress, UFrmAdmin;

type
  TfrmContasReceber = class(TForm)
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtPesquisar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    btnConsultar: TBitBtn;
    btnAlterar: TBitBtn;
    Panel3: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    grdConsultar: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    qryProcurar: TSQLQuery;
    lbl_NMLOJA: TLabel;
    lbl_NMCLIE: TLabel;
    edtDTINIC: TMaskEdit;
    edtDTFINA: TMaskEdit;
    cdsConsultarDEB_LOJA: TIntegerField;
    cdsConsultarDEB_NRCREDITO: TIntegerField;
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarDEB_PARCELA: TStringField;
    cdsConsultarDEB_DESCRICAO: TStringField;
    cdsConsultarDEB_DTMOVIMENTO: TDateField;
    cdsConsultarDEB_DTVENCIMENTO: TDateField;
    cdsConsultarDEB_DTPAGAMENTO: TDateField;
    cdsConsultarDEB_VLPARCELA: TFMTBCDField;
    lblConsultar: TLabel;
    edtCDLOJA: TDBEdit;
    edtCDCLIE: TDBEdit;
    edtDTMOVI: TDBEdit;
    edtDTVENC: TDBEdit;
    edtVALOR: TDBEdit;
    edtDESCRICAO: TDBEdit;
    DBText1: TDBText;
    sbLocLoja: TSpeedButton;
    sbCliente: TSpeedButton;
    procedure BtPesquisarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCDLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTMOVIExit(Sender: TObject);
    procedure edtDTVENCExit(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtCDLOJAExit(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtDTVENCKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDLOJAChange(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure dsConsultarStateChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure edtDTFINAChange(Sender: TObject);
    procedure edtDTINICChange(Sender: TObject);
    procedure sbLocLojaClick(Sender: TObject);
    procedure sbClienteClick(Sender: TObject);
  private
     procedure tratabotoes;
     procedure buscar;
     procedure NOVO;
     procedure VALIDAR_LOJA;
     procedure VALIDAR_CLIENTE;
     procedure HABILITAR_CONTROLES;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasReceber: TfrmContasReceber;
  Transacao: TTransactionDesc;
  M_TPOPER, M_CDLOJA : String;
  M_NRCRED : Integer;

implementation

uses Udm, uFuncoes, uFrmLocLoja, uLocCliente;

{$R *.dfm}

procedure TfrmContasReceber.BtPesquisarClick(Sender: TObject);
begin
    PageControl1.ActivePageIndex := 1;
end;

procedure TfrmContasReceber.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmContasReceber.FormCreate(Sender: TObject);
begin
     //lbl_NRCRED.Caption := '';
     lbl_NMLOJA.Caption := '';
     lbl_NMCLIE.Caption := '';
     //
     PageControl1.ActivePageIndex := 0;
     HABILITAR_CONTROLES;
end;

procedure TfrmContasReceber.edtCDLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
      If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
      //
      If (Key = #13) and uFuncoes.Empty(edtCDLOJA.Text) Then
      Begin
           Key := #0;
           sbLocLojaClick(Sender);
      End;
end;

procedure TfrmContasReceber.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
      If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
      //
      If (Key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
      Begin
           Key := #0;
           sbClienteClick(Sender);
      End;
end;

procedure TfrmContasReceber.edtDTMOVIExit(Sender: TObject);
begin
  If (edtDTMOVI.Text <> '  /  /    ') Then
  Begin
    try
        StrToDate(edtDTMOVI.Text);
    except
        on EConvertError do
        begin
            ShowMessage ('Data Inválida!');
            edtDTMOVI.SetFocus;
        End;
    end;
  End;
end;

procedure TfrmContasReceber.edtDTVENCExit(Sender: TObject);
begin
  If (edtDTVENC.Text <> '  /  /    ') Then
  Begin
    try
        StrToDate(edtDTVENC.Text);
        //
        If (StrToDate(edtDTVENC.Text) < StrToDate(edtDTMOVI.Text)) Then
        Begin
            edtDTVENC.SetFocus;
            Exit;
        End;
    except
        on EConvertError do
        begin
            ShowMessage ('Data Inválida!');
            edtDTVENC.SetFocus;
        End;
    end;
  End;
end;

procedure TfrmContasReceber.buscar;
begin
     dm.cdsDebito.Close;
     With dm.dstDebito do
     Begin
             Active := False;
             CommandText := 'Select * from DEBITO Where (DEB_LOJA = :pLOJA)';
             CommandText := CommandText+' AND (DEB_NRCREDITO = :pNRCREDITO)';
             Params.ParamByName('pLOJA').AsInteger      := cdsConsultar.FieldByName('DEB_LOJA').AsInteger;
             Params.ParamByName('pNRCREDITO').AsInteger := cdsConsultar.FieldByName('DEB_NRCREDITO').AsInteger;;
             Active := True;
     End;
     dm.cdsDebito.Open;
     //
     //lbl_NRCRED.Caption := ufuncoes.StrZero(dm.cdsDebito.FieldByName('DEB_NRCREDITO').AsString,7);
     edtCDLOJA.Text := ufuncoes.StrZero(dm.cdsDebito.FieldByName('DEB_LOJA').AsString,3);
     VALIDAR_LOJA;
     edtCDCLIE.Text := ufuncoes.StrZero(dm.cdsDebito.FieldByName('CLI_CODIGO').AsString,7);
     VALIDAR_CLIENTE;
     edtDTMOVI.Text := dm.cdsDebito.FieldByName('DEB_DTMOVIMENTO').AsString;
     edtDTVENC.Text := dm.cdsDebito.FieldByName('DEB_DTVENCIMENTO').AsString;
     edtVALOR.Text  := dm.cdsDebito.FieldByName('DEB_VLPARCELA').AsString;
     edtDESCRICAO.Text := dm.cdsDebito.FieldByName('DEB_DESCRICAO').AsString;
end;

procedure TfrmContasReceber.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   //
   sbLocLoja.Enabled := not sbLocLoja.Enabled;
   sbCliente.Enabled := not sbCliente.Enabled;
end;

procedure TfrmContasReceber.NOVO;
var
  i : Integer;
begin
  for i := 0 to PageControl1.Pages[0].ControlCount - 1 do
    if PageControl1.Pages[0].Controls[i] is TEdit then
      (PageControl1.Pages[0].Controls[i] as TEdit).Clear
    else
    if PageControl1.Pages[0].Controls[i] is TComboBox then
      (PageControl1.Pages[0].Controls[i] as TComboBox).ItemIndex := -1
    else
    if PageControl1.Pages[0].Controls[i] is TRadioGroup then
      (PageControl1.Pages[0].Controls[i] as TRadioGroup).ItemIndex := -1
    else
    if PageControl1.Pages[0].Controls[i] is TCheckBox then
      (PageControl1.Pages[0].Controls[i] as TCheckBox).Checked := False
    else
    if PageControl1.Pages[0].Controls[i] is TMaskEdit then
      (PageControl1.Pages[0].Controls[i] as TMaskEdit).Clear
    else
    if PageControl1.Pages[0].Controls[i] is TDBLookupComboBox then
      (PageControl1.Pages[0].Controls[i] as TDBLookupComboBox).KeyValue := null;
      //
      //lbl_NRCRED.Caption := '';
      lbl_NMLOJA.Caption := '';
      lbl_NMCLIE.Caption := '';
      edtVALOR.Text      := '0';
end;

procedure TfrmContasReceber.BtAdicionarClick(Sender: TObject);
begin
      tratabotoes;
      HABILITAR_CONTROLES;
      NOVO;
      //
      dm.parametros;
      M_NRCRED := dm.CdsConfigCFG_CREDITO.Value+1;
      //
      dm.cdsDebito.Close;
      With dm.dstDebito do
      Begin
               Active := False;
               CommandText := 'Select * from DEBITO Where (DEB_LOJA = :pLOJA)';
               CommandText := CommandText+' AND (DEB_NRCREDITO = :pNRCREDITO)';
               Params.ParamByName('pLOJA').AsInteger      := uFuncoes.mvcodigo('EMP_CODIGO','EMPRESAS') ;
               Params.ParamByName('pNRCREDITO').AsInteger := M_NRCRED;
               Active := True;
      End;
      dm.cdsDebito.Open;
      dm.cdsDebito.Append;
      //
      dm.cdsDebito.FieldByName('DEB_NRCREDITO').Value := M_NRCRED;
      //lbl_NRCRED.Caption := uFuncoes.StrZero(dm.cdsDebito.FieldByName('DEB_NRCREDITO').AsString,7);
      //
      //lbl_NRCRED.Caption := uFuncoes.StrZero(InttoStr(dm.CdsConfigCFG_CREDITO.AsInteger + 1),7);
      edtDTMOVI.Text := DatetoStr(Date);
      M_TPOPER := 'I';
      //
      edtCDLOJA.Enabled := True;
      edtCDLOJA.SetFocus;
end;

procedure TfrmContasReceber.BtEditarClick(Sender: TObject);
begin
      tratabotoes;
      HABILITAR_CONTROLES;
      M_TPOPER := 'A';
end;

procedure TfrmContasReceber.BtCancelarClick(Sender: TObject);
begin
      tratabotoes;
      HABILITAR_CONTROLES;
      dm.cdsDebito.Close; 
      NOVO;
end;

procedure TfrmContasReceber.BtGravarClick(Sender: TObject);
Var
    M_QTPARC : integer;
    M_NRPARC : String;
begin
     If uFuncoes.Empty(edtCDLOJA.Text) Then
     Begin
          Application.MessageBox(PChar('Digite o código da loja!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtCDLOJA.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Application.MessageBox(PChar('Digite o código do cliente!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtCDCLIE.SetFocus;
          Exit;
     End;
     //
     If (edtDTMOVI.Text = '  /  /    ') Then
     Begin
          Application.MessageBox(PChar('Digite a data do movimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTMOVI.SetFocus;
          Exit;
     End;
     //
     If (edtDTVENC.Text = '  /  /    ') Then
     Begin
          Application.MessageBox(PChar('Digite a data do vencimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTVENC.SetFocus;
          Exit;
     End;
     //
     If (StrtoFloat(edtVALOR.text) = 0) Then
     Begin
          Application.MessageBox(PChar('Digite o valor!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtVALOR.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtDESCRICAO.Text) Then
     Begin
          Application.MessageBox(PChar('Digite a descrição!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDESCRICAO.SetFocus;
          Exit;
     End;
     //
     Try
        //
        Transacao.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
        Transacao.IsolationLevel := xilREPEATABLEREAD;
        dm.SqlAdmin.StartTransaction(Transacao);
        //
        M_NRPARC := '01';
        M_QTPARC := 1;
        //
        If (dm.cdsDebito.State in [dsInsert]) Then
        Begin
            //
            dm.parametros;
            dm.CdsConfig.Edit;
            dm.CdsConfigCFG_CREDITO.Value := dm.CdsConfigCFG_CREDITO.Value +1;
            dm.CdsConfig.Post;
            dm.CdsConfig.ApplyUpdates(0);
            M_NRCRED := dm.CdsConfigCFG_CREDITO.Value;
            //
             dm.cdsDebito.FieldByName('DEB_NRCREDITO').AsInteger := M_NRCRED;
             dm.cdsDebito.FieldByName('DEB_PARCELA').AsString     := M_NRPARC;
             dm.cdsDebito.FieldByName('DEB_QTPARCELA').AsInteger  := M_QTPARC;
             dm.cdsDebito.FieldByName('DEB_TOVENDA').AsCurrency   := dm.cdsDebito.FieldByName('DEB_VLPARCELA').AsCurrency;
             dm.cdsDebito.FieldByName('DEB_VLRESTANTE').AsCurrency  := dm.cdsDebito.FieldByName('DEB_VLPARCELA').AsCurrency;
             dm.cdsDebito.FieldByName('DEB_SITUACAO').AsString    := 'A';
             dm.cdsDebito.FieldByName('DEB_DTALTERACAO').AsDateTime := Date();
             dm.cdsDebito.FieldByName('SEN_CODIGO').AsString      := UFrmAdmin.M_CDUSUA;
            //
            dm.cdsDebito.Post;
            dm.cdsDebito.ApplyUpdates(0);
            //
             Application.MessageBox(PChar('Registro de credito incluido!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End
        Else
        Begin
          // Editando
          If (dm.cdsDebito.State in [dsEdit]) Then
          Begin
             //
             dm.cdsDebito.FieldByName('DEB_TOVENDA').AsCurrency    := dm.cdsDebito.FieldByName('DEB_VLPARCELA').AsCurrency;
             dm.cdsDebito.FieldByName('DEB_VLRESTANTE').AsCurrency := dm.cdsDebito.FieldByName('DEB_VLPARCELA').AsCurrency;
             dm.cdsDebito.FieldByName('DEB_DTALTERACAO').AsDateTime := Date();
             //
             dm.cdsDebito.Post;
             dm.cdsDebito.ApplyUpdates(0);
             //
             Application.MessageBox(PChar('Registro de credito alterado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         End;
        End;
        //
        tratabotoes;
        HABILITAR_CONTROLES;
        //
        dm.cdsDebito.Close;
        //
        dm.SqlAdmin.Commit(Transacao);
        //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.SqlAdmin.Rollback(Transacao);
        End;
     End;
end;

procedure TfrmContasReceber.VALIDAR_LOJA;
begin
     With qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_RAZAO from EMPRESAS');
          SQL.Add('Where (EMP_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDLOJA.Text);
          //
          Open;
     End;
     //
     If (qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de loja não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMLOJA.Caption := '';
          edtCDLOJA.SetFocus;
          edtCDLOJA.Clear;
          Exit;
     End
     Else
     Begin
         lbl_NMLOJA.Caption := qryProcurar.FieldByName('EMP_RAZAO').AsString;
         edtCDLOJA.Text := uFuncoes.StrZero(edtCDLOJA.Text,3); 
     End;
end;

procedure TfrmContasReceber.edtCDLOJAExit(Sender: TObject);
begin
     If not ufuncoes.Empty(edtCDLOJA.Text) Then
        VALIDAR_LOJA;
end;

procedure TfrmContasReceber.HABILITAR_CONTROLES;
begin
    edtCDLOJA.Enabled := NOT edtCDLOJA.Enabled;
    edtCDCLIE.Enabled := NOT edtCDCLIE.Enabled;
    edtDTMOVI.Enabled := NOT edtDTMOVI.Enabled;
    edtDTVENC.Enabled := NOT edtDTVENC.Enabled;
    edtVALOR.Enabled  := NOT edtVALOR.Enabled;
    edtDESCRICAO.Enabled := NOT edtDESCRICAO.Enabled;
end;

procedure TfrmContasReceber.VALIDAR_CLIENTE;
begin
     With qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select CLI_CODIGO, CLI_FANTASIA from CLIENTES');
          SQL.Add('Where (CLI_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDCLIE.Text);
          //
          Open;
     End;
     //
     If (qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de cliente não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMCLIE.Caption := '';
          edtCDCLIE.SetFocus;
          edtCDCLIE.Clear;
          Exit;
     End
     Else
     Begin
          lbl_NMCLIE.Caption := qryProcurar.FieldByName('CLI_FANTASIA').AsString;
          edtCDCLIE.Text     := uFuncoes.StrZero(edtCDCLIE.Text,7);
     End;
end;

procedure TfrmContasReceber.edtCDCLIEExit(Sender: TObject);
begin
     If not ufuncoes.Empty(edtCDCLIE.Text) Then
        VALIDAR_CLIENTE;
end;

procedure TfrmContasReceber.edtDTVENCKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #27) Then
     begin
          Key := #0;
          edtDTVENC.Clear; 
     End;
end;

procedure TfrmContasReceber.edtCDLOJAChange(Sender: TObject);
begin
    If uFuncoes.Empty(edtCDLOJA.Text) Then
      lbl_NMLOJA.Caption := '';
end;

procedure TfrmContasReceber.edtCDCLIEChange(Sender: TObject);
begin
    If uFuncoes.Empty(edtCDCLIE.Text) Then
         lbl_NMCLIE.Caption := '';

end;

procedure TfrmContasReceber.btnConsultarClick(Sender: TObject);
begin
    If (edtDTINIC.Text <> '  /  /    ') and (edtDTFINA.Text <> '  /  /    ') Then
    Begin
         cdsConsultar.Close;
         With datasetConsultar do
         Begin
               Active := False;
               Params.ParamByName('pDTINIC').AsDate := StrtoDate(edtDTINIC.Text);
               Params.ParamByName('pDTFINA').AsDate := StrtoDate(edtDTFINA.Text);
               Active := True;
         End;
         cdsConsultar.Open;
         //
          if cdsConsultar.IsEmpty then
          begin
            MessageDlg('Nenhum registro encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
            edtDTINIC.Clear;
            edtDTFINA.Clear;
            if edtDTINIC.CanFocus then
            edtDTINIC.SetFocus;
          end;
    End;
end;

procedure TfrmContasReceber.edtDTINICExit(Sender: TObject);
begin
  If (edtDTINIC.Text <> '  /  /    ') Then
  Begin
    try
        StrToDate(edtDTINIC.Text);
    except
        on EConvertError do
        begin
            ShowMessage ('Data Inválida!');
            edtDTINIC.SetFocus;
        End;
    end;
  End;
end;

procedure TfrmContasReceber.edtDTFINAExit(Sender: TObject);
begin
  If (edtDTFINA.Text <> '  /  /    ') Then
  Begin
    try
        StrToDate(edtDTFINA.Text);
        //
        If (StrToDate(edtDTFINA.Text) < StrToDate(edtDTINIC.Text)) Then
        Begin
            edtDTFINA.SetFocus;
            Exit;
        End;
    except
        on EConvertError do
        begin
            ShowMessage ('Data Inválida!');
            edtDTFINA.SetFocus;
        End;
    end;
  End;
end;

procedure TfrmContasReceber.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;

end;

procedure TfrmContasReceber.dsConsultarStateChange(Sender: TObject);
begin
  btnAlterar.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmContasReceber.btnAlterarClick(Sender: TObject);
begin
  tratabotoes;
  HABILITAR_CONTROLES;
  buscar;
  PageControl1.ActivePageIndex := 0;
  cdsConsultar.Close; 
  M_TPOPER := 'A';
  dm.cdsDebito.Edit;
  edtCDLOJA.Enabled := False;
  edtCDCLIE.SetFocus;
end;

procedure TfrmContasReceber.TabSheet2Show(Sender: TObject);
begin
     cdsConsultar.Close;
     edtDTINIC.Clear;
     edtDTFINA.Clear;
     //
     edtDTINIC.SetFocus; 
end;

procedure TfrmContasReceber.BtExcluirClick(Sender: TObject);
begin
  if dm.cdsDebito.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin

     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmContasReceber.grdConsultarDblClick(Sender: TObject);
begin
     If not (cdsConsultar.IsEmpty) Then
       btnAlterarClick(Sender);
end;

procedure TfrmContasReceber.edtDTFINAChange(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
       cdsConsultar.Close;
end;

procedure TfrmContasReceber.edtDTINICChange(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') Then
       cdsConsultar.Close;
end;

procedure TfrmContasReceber.sbLocLojaClick(Sender: TObject);
begin
  with TfrmLocLoja.create(self) do
  try
     uFrmLocLoja.M_NRFROM := 2;
     showmodal;
  finally
    edtCDLOJA.Text := uFuncoes.StrZero(M_CDLOJA,3);
    lbl_NMLOJA.Caption := '';
    edtCDLOJA.SetFocus;
    free;
  end;
end;

procedure TfrmContasReceber.sbClienteClick(Sender: TObject);
begin
  with TfrmLocCliente.create(self) do
  try
    uLocCliente.M_NRFROM := 2;
    showmodal
  finally
    free;
    edtCDCLIE.SetFocus; 
  end;
end;

End.


