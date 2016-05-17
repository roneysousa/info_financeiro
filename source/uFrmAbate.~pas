unit uFrmAbate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ToolEdit,
  CurrEdit, DBXpress, jpeg;

type
  TfrmCadAbate = class(TfrmCadastro)
    Panel5: TPanel;
    Label2: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtPerda: TCurrencyEdit;
    cmbTipo: TDBLookupComboBox;
    dbePeso: TDBEdit;
    dbePesoMedio: TDBEdit;
    dstDerivados: TSQLDataSet;
    dspDerivados: TDataSetProvider;
    cdsDerivados: TClientDataSet;
    dsDerivados: TDataSource;
    cdsDerivadosDER_ID: TIntegerField;
    cdsDerivadosDER_DESCRICAO: TStringField;
    cdsDerivadosDER_PRODUTO: TStringField;
    cdsDerivadosDER_QUANTIDADE: TFMTBCDField;
    cdsDerivadosDER_PECENTUAL: TFMTBCDField;
    cdsDerivadosDER_PRONOME: TStringField;
    Label6: TLabel;
    qryProcura: TSQLQuery;
    Label7: TLabel;
    Label9: TLabel;
    cdsConsultarPER_SEQUENCIA: TIntegerField;
    cdsConsultarPED_DESCRICAO: TStringField;
    cdsDerivadosDES_PESOAPOSABATE: TFloatField;
    dbGridDados: TDBGrid;
    cdsDerivadosDER_MARGEMERRO: TFMTBCDField;
    cdsDerivadosDER_PESO: TFMTBCDField;
    qrySoma: TSQLQuery;
    qrySomaSOMA: TFMTBCDField;
    dstDerivadosDER_ID: TIntegerField;
    dstDerivadosDER_DESCRICAO: TStringField;
    dstDerivadosDER_PRODUTO: TStringField;
    dstDerivadosDER_QUANTIDADE: TFMTBCDField;
    dstDerivadosDER_PECENTUAL: TFMTBCDField;
    dstDerivadosDER_MARGEMERRO: TFMTBCDField;
    dstDerivadosDER_PESO: TFMTBCDField;
    Label1: TLabel;
    cmbLoja: TComboBox;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure cmbTipoKeyPress(Sender: TObject; var Key: Char);
    procedure dbePesoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeAposKeyPress(Sender: TObject; var Key: Char);
    procedure dbePesoMedioKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoClick(Sender: TObject);
    procedure cmbTipoExit(Sender: TObject);
    procedure dbePesoExit(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure dbePesoEnter(Sender: TObject);
    procedure dbePesoChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure cdsDerivadosCalcFields(DataSet: TDataSet);
    procedure dbeAposExit(Sender: TObject);
    procedure dbGridDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridDadosEnter(Sender: TObject);
    procedure dbGridDadosColEnter(Sender: TObject);
  private
    procedure MOSTRAR_DADOS;
    procedure tratabotoes;
    procedure buscar;
    procedure CALCULAR;
    procedure CMB_LOJAS;
    function CDLOJA(M_NMLOJA : String) : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAbate: TfrmCadAbate;
  TD : TTransactionDesc;
  M_TOPERC : Real;
  M_MARGEMERRO : Double;

implementation

uses Udm, uFuncoes, UFrmAdmin, udmConsulta;

{$R *.dfm}

procedure TfrmCadAbate.MOSTRAR_DADOS;
begin
     dm.parametros;
     dm.cdsAbate.Close;
     With dm.dstAbate do
     Begin
          Active := False;
          CommandText := 'Select * from ABATE Where (ABT_SEQUENCIA = :pSEQUENCIA)';
          Params.ParamByName('pSEQUENCIA').AsInteger := uFuncoes.mvcodigo('ABT_SEQUENCIA','ABATE');
          Active := True;
     End;
     dm.cdsAbate.Open;
     //
     If not (dm.cdsAbate.IsEmpty) Then
     Begin
         cdsDerivados.Close;
         With dstDerivados do
         Begin
              Active := False;
              CommandText := 'Select * from DERIVADOS Where (DER_ID = :pID)';
              Params.ParamByName('pID').AsInteger := dm.cdsAbate.FieldByName('ABT_TIPO').AsInteger;
              Active := True;
         End;
         cdsDerivados.Open;
         PageControl1.ActivePageIndex := 0;
     End
     Else
         PageControl1.ActivePageIndex := 1;
     //
     CALCULAR;
end;

procedure TfrmCadAbate.FormCreate(Sender: TObject);
begin
  inherited;
     MOSTRAR_DADOS;
     //
end;

procedure TfrmCadAbate.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select * from PERDAS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where PER_SEQUENCIA = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(PED_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by PED_DESCRICAO';
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

procedure TfrmCadAbate.btnAlterarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  buscar;
  If (dm.cdsAbate.IsEmpty ) Then
  begin
      //tratabotoes;
      PageControl1.ActivePageIndex := 0;
      dm.parametros;
      cdsDerivados.Close;
      dm.cdsAbate.Append;
      dm.cdsAbate.FieldByName('ABT_SEQUENCIA').Value := dm.CdsConfigCFG_ABATE.Value+1;
      dm.cdsAbate.FieldByName('ABT_TIPO').AsInteger  := cdsConsultar.FieldByName('PER_SEQUENCIA').AsInteger;
      dbePeso.SetFocus;
  End
  Else
  begin
      CALCULAR;
      //
      PageControl1.ActivePageIndex := 0;
      dbePeso.SetFocus;
  End;
end;

procedure TfrmCadAbate.buscar;
begin
     dm.parametros;
     dm.cdsAbate.Close;
     With dm.dstAbate do
     Begin
          Active := False;
          CommandText := 'Select * from ABATE Where (ABT_TIPO = :pTIPO)';
          Params.ParamByName('pTIPO').AsInteger := cdsConsultar.FieldByName('PER_SEQUENCIA').AsInteger;
          Active := True;
     End;
     dm.cdsAbate.Open;
     //
     If not (dm.cdsAbate.IsEmpty) Then
     Begin
         cdsDerivados.Close;
         With dstDerivados do
         Begin
              Active := False;
              CommandText := 'Select * from DERIVADOS Where (DER_ID = :pID)';
              Params.ParamByName('pID').AsInteger := cdsConsultar.FieldByName('PER_SEQUENCIA').AsInteger;
              Active := True;
         End;
         cdsDerivados.Open;
         PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadAbate.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadAbate.BtAdicionarClick(Sender: TObject);
Var
    W_NRSEQU : Integer;
begin
  inherited;
  tratabotoes;
  dm.parametros;
  W_NRSEQU := dm.CdsConfigCFG_ABATE.Value+1;
  //
  cdsDerivados.Close;
  CMB_LOJAS;
  cmbLoja.Enabled := true;
  //
  {dm.cdsAbate.Close;
  With dm.dstAbate do
  Begin
       Active := False;
       CommandText := 'select * from ABATE '

       Active := True;
  End;
  dm.cdsAbate.Open;}
  //
  dm.cdsAbate.Append;
  cmbTipo.ReadOnly := False;
  cmbLoja.SetFocus;
  dm.cdsAbateABT_SEQUENCIA.Value := W_NRSEQU;
  edtPerda.Clear;
end;

procedure TfrmCadAbate.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsAbate.Cancel;
  cmbTipo.ReadOnly := True;
  //
  If not (dm.cdsAbate.IsEmpty) Then
      MOSTRAR_DADOS
  Else
      cdsDerivados.Close;
  //
  cmbLoja.Clear; 
  cmbLoja.Enabled := False;    
end;

procedure TfrmCadAbate.BtGravarClick(Sender: TObject);
Var
   M_QTANTE, M_QTATUA : Double;
   M_DTMOVI : TDate;
   M_HOMOVI, M_NRSEQU :String;
   M_CDLOJA : Integer;
   M_VLPERD, M_PSMEDIO : Double;
begin
  inherited;
      If uFuncoes.Empty(cmbLoja.Text) Then
      Begin
             Application.MessageBox('Selecione a loja!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             cmbLoja.SetFocus;
             Exit;
      End;
      //
      If uFuncoes.Empty(cmbTipo.Text) Then
      Begin
             Application.MessageBox('Selecione o tipo!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             cmbTipo.SetFocus;
             Exit;
      End;
      //
      If uFuncoes.Empty(dbePeso.Text) Then
      Begin
             Application.MessageBox('Digite o peso!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dbePeso.SetFocus;
             Exit;
      End;
      //
      Try
          // Inicia um transação no BD
           TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
           TD.IsolationLevel := xilREADCOMMITTED;
           Dm.SqlAdmin.StartTransaction(TD);
           //
           tratabotoes;
           //
           M_CDLOJA := CDLOJA(cmbLoja.Text);
           M_DTMOVI := Date();
           M_HOMOVI := TimetoStr(Time);
           //
           if dm.cdsAbate.State in [dsinsert] then
           begin
               dm.parametros;
               dm.CdsConfig.Edit;
               dm.CdsConfigCFG_ABATE.Value := dm.CdsConfigCFG_ABATE.Value+1;
               dm.cdsAbateABT_SEQUENCIA.Value := dm.CdsConfigCFG_ABATE.Value;
               Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                  Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
               dm.CdsConfig.Post;
               dm.CdsConfig.ApplyUpdates(0);
           end;
           //
           if dm.cdsAbate.State in [dsEdit] then
           begin
               dm.parametros;
               dm.CdsConfig.Edit;
               Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                  Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
               dm.CdsConfig.Post;
               dm.CdsConfig.ApplyUpdates(0);
           end;
           //
           M_NRSEQU := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat),10);
           //
           With qrySoma do
           Begin
                Close;
                 Params.ParamByName('pID').AsInteger :=
                   dm.cdsAbate.FieldByName('ABT_TIPO').AsInteger;
                Open;
           End;
           // Peso apos o abate
           dm.cdsAbate.FieldByName('ABT_PESOAPOSABATE').AsFloat :=
                  qrySoma.FieldByName('SOMA').AsFloat;
           // Valor da perda
           M_VLPERD := dm.cdsAbate.FieldByName('ABT_PESO').AsFloat
                    - dm.cdsAbate.FieldByName('ABT_PESOAPOSABATE').AsFloat;
           //
           M_PSMEDIO := (M_VLPERD + M_MARGEMERRO)/2;
           // Salva registro
           dm.cdsAbate.Post;
           dm.cdsAbate.ApplyUpdates(0);
           //
           cdsDerivados.First;
           While not (cdsDerivados.Eof) do
           Begin
                cdsDerivados.Edit;
                // Estoque
                Dm.cdsEstoque.Close;
                With Dm.dstEstoque do
                Begin
                     Active := False;
                     CommandText := 'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and (PRO_CODIGO = :pCODIGO)';
                     //
                     Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
                     Params.ParamByName('pCODIGO').AsString := cdsDerivados.FieldByName('DER_PRODUTO').AsString;
                     Active := True;
                End;
                Dm.cdsEstoque.Open;
                //
                M_QTANTE := 0;
                If (Dm.cdsEstoque.IsEmpty) Then  // Se não encontrar
                begin
                     Dm.cdsEstoque.Append;
                     Dm.cdsEstoque.FieldByName('EST_CODIGOLOJA').AsInteger := M_CDLOJA;
                     Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString      := cdsDerivados.FieldByName('DER_PRODUTO').AsString;
                     Dm.cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTMOVI;
                     If (cdsDerivados.FieldByName('DER_QUANTIDADE').AsFloat > 0) Then
                     begin
                         Dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := cdsDerivados.FieldByName('DER_QUANTIDADE').AsFloat;
                         Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                             Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat + cdsDerivados.FieldByName('DER_QUANTIDADE').AsFloat;
                     End
                     Else
                     Begin
                         Dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := cdsDerivados.FieldByName('DER_PESO').AsFloat;
                         Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                             Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat + cdsDerivados.FieldByName('DER_PESO').AsFloat;
                     End;
                     //
                     M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                     Dm.cdsEstoque.Post;
                     Dm.cdsEstoque.ApplyUpdates(0);
                End
                Else
                Begin
                     Dm.cdsEstoque.Edit;
                     //
                     M_QTANTE := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                     //
                     Dm.cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTMOVI;
                     //
                     If (cdsDerivados.FieldByName('DER_QUANTIDADE').AsFloat > 0) Then
                     begin
                         Dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := cdsDerivados.FieldByName('DER_QUANTIDADE').AsFloat;
                         Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                             Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat + cdsDerivados.FieldByName('DER_QUANTIDADE').AsFloat;
                     End
                     Else
                     Begin
                         Dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := cdsDerivados.FieldByName('DER_PESO').AsFloat;
                         Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                             Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat + cdsDerivados.FieldByName('DER_PESO').AsFloat;
                     End;
                     //
                     M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                     Dm.cdsEstoque.Post;
                     Dm.cdsEstoque.ApplyUpdates(0);
                End;
                // Historico
                Dm.cdsHistorico.Close;
                With Dm.dstHistorico do
                Begin
                     Active := False;
                     CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                                   +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                     Params.ParamByName('pSEQUENCIA').AsInteger := StrtoInt(M_NRSEQU);
                     Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                     Params.ParamByName('pPRODUTO').AsString    := cdsDerivados.FieldByName('DER_PRODUTO').AsString;
                     Active := True;
                End;
                Dm.cdsHistorico.Open;
                //
                With Dm.cdsHistorico do
                Begin
                      Append;
                      FieldByName('HIS_SEQUENCIA').AsInteger := StrtoInt(M_NRSEQU);
                      FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
                      FieldByName('HIS_PRODUTO').AsString    := cdsDerivados.FieldByName('DER_PRODUTO').AsString;
                      FieldByName('HIS_DATA').AsDateTime     := M_DTMOVI;
                      FieldByName('HIS_HORA').AsString       := M_HOMOVI;
                      FieldByName('HIS_TIPO').AsString       := 'FA';
                      FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                      If (cdsDerivados.FieldByName('DER_QUANTIDADE').AsFloat > 0) Then
                          FieldByName('HIS_MOVIMENTO').AsFloat   := cdsDerivados.FieldByName('DER_QUANTIDADE').AsFloat
                      Else
                          FieldByName('HIS_MOVIMENTO').AsFloat   := cdsDerivados.FieldByName('DER_PESO').AsFloat;
                      FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                      FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
                      // Grava
                      Post;
                      ApplyUpdates(0);
                End;
                //
                cdsDerivados.FieldByName('DER_MARGEMERRO').AsFloat := M_PSMEDIO;
                // Proximo
                cdsDerivados.Next;
           End;
           //
           cdsDerivados.ApplyUpdates(0);
           //
           CALCULAR;
           //
           Application.MessageBox('Registro gravador com sucesso!!!','CONCLUÍDO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbTipo.ReadOnly := False;
           cmbLoja.Enabled := False;
           // Grava
           Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
      Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar gravar registro!!!'+#13
                        + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                dm.cdsAbate.Cancel;        
                //  Cancelar transação no BD.
                Dm.SqlAdmin.Rollback(TD);
                //
                cmbTipo.ReadOnly := False;
          End;
      End;
end;

procedure TfrmCadAbate.cmbTipoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If (Key = #27) and (dm.cdsAbate.State in [dsInsert]) Then
     Begin
          Key := #0;
          BtCancelarClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(cmbTipo.Text) Then
     Begin
          Key := #0;
          dbePeso.SetFocus;
     End;
end;

procedure TfrmCadAbate.dbePesoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If (Key = #13) and not uFuncoes.Empty(dbePeso.Text) Then
     Begin
          Key := #0;
          dbGridDados.SetFocus;
     End;
end;

procedure TfrmCadAbate.dbeAposKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
{     If (Key = #13) and not uFuncoes.Empty(dbeApos.Text) Then
     Begin
          Key := #0;
          dbePesoMedio.SetFocus;
     End;}
end;

procedure TfrmCadAbate.dbePesoMedioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If (Key = #13) and not uFuncoes.Empty(dbePesoMedio.Text) Then
     Begin
          Key := #0;
          BtGravar.SetFocus;
     End;
end;

procedure TfrmCadAbate.CALCULAR;
begin
    M_TOPERC := 0;
    //
    If (cdsDerivados.Active) Then
    Begin
      cdsDerivados.DisableControls;
      cdsDerivados.First;
      While not (cdsDerivados.Eof) do
      Begin
            If (cdsDerivados.FieldByName('DER_PECENTUAL').AsFloat > 0) Then
                M_TOPERC := M_TOPERC + cdsDerivados.FieldByName('DES_PESOAPOSABATE').AsFloat;
           // Proximo
           cdsDerivados.Next;
      End;
      //
      cdsDerivados.EnableControls;
      //
      If (dm.cdsAbate.state in [dsInsert, dsEdit]) Then
      Begin
          edtPerda.Value :=  dm.cdsAbate.FieldByName('ABT_PESO').AsCurrency - M_TOPERC;
              dm.cdsAbate.FieldByName('ABT_PESOMEDIO').AsFloat :=
          dm.cdsAbate.FieldByName('ABT_PESO').AsFloat - M_MARGEMERRO;
      End;
      //
      cdsDerivados.First;
    End;
end;

procedure TfrmCadAbate.cmbTipoClick(Sender: TObject);
begin
  inherited;
{         cdsDerivados.Close;
         With dstDerivados do
         Begin
              Active := False;
              CommandText := 'Select * from DERIVADOS Where (DER_ID = :pID)';
              Params.ParamByName('pID').AsInteger := dm.cdsAbate.FieldByName('ABT_TIPO').AsInteger;
              Active := True;
         End;
         cdsDerivados.Open;
         CALCULAR;
         PageControl1.ActivePageIndex := 0;}
end;

procedure TfrmCadAbate.cmbTipoExit(Sender: TObject);
begin
  inherited;
   If (dm.cdsAbate.State in [dsInsert]) Then
   Begin
      If not uFuncoes.Empty(cmbTipo.Text) Then
      Begin
           With qryProcura do
           Begin
                Close;
                Params.ParamByName('pTIPO').AsInteger := dm.cdsAbate.FieldByName('ABT_TIPO').AsInteger;
                Open;
           End;
           //
           cdsDerivados.Close;
           With dstDerivados do
           Begin
              Active := False;
              CommandText := 'Select * from DERIVADOS Where (DER_ID = :pID)';
              Params.ParamByName('pID').AsInteger := dm.cdsAbate.FieldByName('ABT_TIPO').AsInteger;
              Active := True;
           End;
           cdsDerivados.Open;
           //
           If not (cdsDerivados.IsEmpty) Then
              M_MARGEMERRO := cdsDerivados.FieldByname('DER_MARGEMERRO').AsFloat
           Else
              M_MARGEMERRO := 0;
      End;
   End;
end;

procedure TfrmCadAbate.dbePesoExit(Sender: TObject);
begin
  inherited;
    If not uFuncoes.Empty(dbePeso.Text) then
    begin
         cdsDerivados.Close;
         With dstDerivados do
         Begin
              Active := False;
              CommandText := 'Select * from DERIVADOS Where (DER_ID = :pID)';
              Params.ParamByName('pID').AsInteger := dm.cdsAbate.FieldByName('ABT_TIPO').AsInteger;
              Active := True;
         End;
         cdsDerivados.Open;
         //
       CALCULAR;
    End;
end;

procedure TfrmCadAbate.TabSheet2Show(Sender: TObject);
begin
  inherited;
     If (dm.cdsAbate.State in [dsInsert] ) Then
       BtCancelarClick(Sender);
end;

procedure TfrmCadAbate.dbePesoEnter(Sender: TObject);
begin
  inherited;
      cmbTipoExit(Sender);
end;

procedure TfrmCadAbate.dbePesoChange(Sender: TObject);
begin
  inherited;
    If uFuncoes.Empty(dbePeso.Text) Then
        edtPerda.Clear;
end;

procedure TfrmCadAbate.PageControl1Change(Sender: TObject);
begin
  inherited;
     If (PageControl1.ActivePageIndex = 0)
       and (dm.cdsAbate.IsEmpty) Then
     begin
         cdsDerivados.Close;
         edtPerda.Clear;
     End;
     //
end;

procedure TfrmCadAbate.BtEditarClick(Sender: TObject);
begin
  inherited;
  if dm.cdsAbate.RecordCount > 0 then
  Begin
      tratabotoes;
      cmbTipo.ReadOnly := True;
      dm.cdsAbate.Edit;
      dbePeso.SetFocus;
  End;
end;

procedure TfrmCadAbate.cdsDerivadosCalcFields(DataSet: TDataSet);
var ValorAposAbate: double;
begin
  inherited;
     ValorAposAbate := dm.cdsAbate.FieldByName('ABT_PESO').AsFloat - M_MARGEMERRO;

     if (ValorAposAbate  > 0)
      and (cdsDerivadosDER_PECENTUAL.AsFloat > 0) Then
        cdsDerivadosDES_PESOAPOSABATE.AsFloat :=
          uFuncoes.Gerapercentual(ValorAposAbate, cdsDerivadosDER_PECENTUAL.AsFloat)
     Else
        cdsDerivadosDES_PESOAPOSABATE.AsFloat := 0;


end;

procedure TfrmCadAbate.dbeAposExit(Sender: TObject);
begin
  inherited;
         cdsDerivados.Close;
         With dstDerivados do
         Begin
              Active := False;
              CommandText := 'Select * from DERIVADOS Where (DER_ID = :pID)';
              Params.ParamByName('pID').AsInteger := dm.cdsAbate.FieldByName('ABT_TIPO').AsInteger;
              Active := True;
         End;
         cdsDerivados.Open;
         //
         CALCULAR;
end;

procedure TfrmCadAbate.dbGridDadosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
{    If (key = #13) and
          (dm.cdsAbate.state in [dsInsert, dsEdit]) Then
    Begin
      key := #0;
      //
      With qrySoma do
      Begin
           Close;
           Params.ParamByName('pID').AsInteger :=
             dm.cdsAbate.FieldByName('ABT_TIPO').AsInteger;
           ExecSQL;
      End;
      dm.cdsAbate.FieldByName('ABT_PESOAPOSABATE').AsFloat :=
              qrySoma.FieldByName('SOMA').AsFloat;
    End;}
end;

procedure TfrmCadAbate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dm.CdsEmpresas.Close;
end;

procedure TfrmCadAbate.CMB_LOJAS;
begin
    dm.CdsEmpresas.Close;
     With dm.SdsEmpresas do
     Begin
          Active := False;
          CommandText := 'Select * from EMPRESAS order by EMP_FANTASIA';
          Active := True;
     End;
     dm.CdsEmpresas.Open;
     //
     dm.CdsEmpresas.First;
     While not (dm.CdsEmpresas.Eof) do
     Begin
          cmbLoja.Items.Add(dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString);
          //
          dm.CdsEmpresas.Next;
     End;
     //
     dm.CdsEmpresas.Close;
end;

function TfrmCadAbate.CDLOJA(M_NMLOJA: String): integer;
begin
     With dmConsultas.qryLoja do
     Begin
          SQL.Clear;
          Close;
          Sql.Add('Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS');
          Sql.Add('Where (EMP_FANTASIA = :pNOME)');
          Params.ParamByName('pNOME').AsString := cmbLoja.Text;
          Open;
     End;
     //
     If not (dmConsultas.qryLoja.IsEmpty) Then
       result := dmConsultas.qryLoja.FieldByname('EMP_CODIGO').AsInteger;
end;

procedure TfrmCadAbate.dbGridDadosEnter(Sender: TObject);
begin
  inherited;
     dbGridDados.SelectedIndex := 4;
end;

procedure TfrmCadAbate.dbGridDadosColEnter(Sender: TObject);
begin
  inherited;
   dbGridDados.SelectedIndex := 4;
end;

end.
