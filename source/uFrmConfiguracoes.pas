unit uFrmConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, DBXpress, ExtDlgs, DB,
  ComCtrls;

type
  TfrmConfiguracoes = class(TForm)
    Panel3: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    BtEditar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    imgLogo: TDBImage;
    Label1: TLabel;
    btProcurar: TBitBtn;
    Label2: TLabel;
    dbePECOMI: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    cmbSOESTOQUE: TComboBox;
    Label9: TLabel;
    cmbLotes: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    cmbCupomvenda: TComboBox;
    cmbEtiqueta: TComboBox;
    TabSheet3: TTabSheet;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    TabSheet4: TTabSheet;
    Label13: TLabel;
    dbeMensagem: TDBEdit;
    Label14: TLabel;
    dbeLocal: TDBEdit;
    Label15: TLabel;
    DBMemo1: TDBMemo;
    TabSheet5: TTabSheet;
    Label17: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label18: TLabel;
    dbePasta: TDBEdit;
    Label19: TLabel;
    DBEdit3: TDBEdit;
    Label20: TLabel;
    DBEdit7: TDBEdit;
    Label21: TLabel;
    dbeSenhaEmail: TDBEdit;
    Label23: TLabel;
    DBEdit9: TDBEdit;
    Label22: TLabel;
    DBEdit10: TDBEdit;
    DBMemo2: TDBMemo;
    Label24: TLabel;
    TabSheet6: TTabSheet;
    Label25: TLabel;
    dbeQTMESAS: TDBEdit;
    Label26: TLabel;
    dbeOrcamentos: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    dbeTaxaServico: TDBEdit;
    Label30: TLabel;
    DBEdit8: TDBEdit;
    Label29: TLabel;
    Label31: TLabel;
    DBMemo3: TDBMemo;
    Label32: TLabel;
    DBEdit11: TDBEdit;
    Label33: TLabel;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    procedure BtSairClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btProcurarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure imgLogoDblClick(Sender: TObject);
    procedure dbePADRAOBARRASKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure dbeCedenteKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dbeQTMESASExit(Sender: TObject);
    procedure dbeOrcamentosKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTaxaServicoExit(Sender: TObject);
    procedure DBEdit8KeyPress(Sender: TObject; var Key: Char);
  private
     novo, alterar, apagar : String;  
     procedure tratabotoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

uses Udm, uFuncoes, UFrmAdmin, udmConsulta, uDmRelatorios, Math;

{$R *.dfm}

procedure TfrmConfiguracoes.BtSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmConfiguracoes.BtCancelarClick(Sender: TObject);
begin
     tratabotoes;
     DM.CdsConfig.Cancel;
end;

procedure TfrmConfiguracoes.BtGravarClick(Sender: TObject);
Var
   TD : TTransactionDesc;
begin
     If Empty(DBLookupComboBox1.Text) Then
     begin
          DBLookupComboBox1.SetFocus;
          Exit;
     End;
     //
     tratabotoes;
     Try
        // Inicia um transação no BD
        TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
        TD.IsolationLevel := xilREADCOMMITTED;
        Dm.SqlAdmin.StartTransaction(TD);
        //
        If uFuncoes.Empty(DM.CdsConfig.FieldByName('CFG_IMPRESSORA').AsString) Then
           DM.CdsConfig.FieldByName('CFG_IMPRESSORA').AsInteger := 1;
        // somente estoque
        If (cmbSOESTOQUE.ItemIndex = 0) Then
           dm.CdsConfigCFG_FLVENDAESTOQUE.AsString := 'S'
        Else
           dm.CdsConfigCFG_FLVENDAESTOQUE.AsString := 'N';
        //Lotes
        If (cmbLotes.ItemIndex = 0) Then
            dm.CdsConfigCFG_FLLOTE.AsString := 'S'
        Else
            dm.CdsConfigCFG_FLLOTE.AsString := 'N';
        //
        If (cmbCupomvenda.ItemIndex = 0) Then
           dm.CdsConfigCFG_FLCUPOMVENDA.AsString := 'S'
        Else
           dm.CdsConfigCFG_FLCUPOMVENDA.AsString := 'N';
        //
        If (cmbEtiqueta.ItemIndex = 0) Then
           dm.CdsConfigCFG_PADRAOBARRAS.AsString := '1'
        Else
           dm.CdsConfigCFG_PADRAOBARRAS.AsString := '2';
        //
        If (Dm.CdsConfigCFG_CONTA_CAIXA.IsNull) Then
            Dm.CdsConfigCFG_CONTA_CAIXA.AsInteger := 1;
        //
        If not uFuncoes.Empty(Dm.cdsconfigCFG_EMAIL_PASSWORD.asString) Then
           Dm.cdsconfigCFG_EMAIL_PASSWORD.asString :=
                uFuncoes.Criptografia(dbeSenhaEmail.Text, uFuncoes.chave);
        //
        If uFuncoes.Empty(Dm.cdsconfigCFG_FLFECHAR_ORCAMENTO.AsString) Then
           Dm.cdsconfigCFG_FLFECHAR_ORCAMENTO.AsString := 'N';
        //
        DM.CdsConfig.Post;
        DM.CdsConfig.ApplyUpdates(0);
        //
        //UFrmAdmin.M_CDLOJA := dm.CdsConfigCFG_LOJAPADRAO.AsString;
        // Grava
        Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar gravar registro!!!'#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
        End;
     End;
end;

procedure TfrmConfiguracoes.btProcurarClick(Sender: TObject);
begin
  If (dm.CdsConfig.State in [dsEdit]) Then
  Begin
     Try
          If (OpenPictureDialog1.Execute) Then
             imgLogo.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar abrir imagem!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
  End;
end;

procedure TfrmConfiguracoes.tratabotoes;
begin
   BtEditar.Enabled   := not BtEditar.Enabled;
   btProcurar.Enabled := not btProcurar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled   := not BtGravar.Enabled;
   BtSair.Enabled     := not BtSair.Enabled;
   imgLogo.Enabled    := not imgLogo.Enabled;
   cmbSOESTOQUE.Enabled := NOT cmbSOESTOQUE.Enabled;
   cmbLotes.Enabled     := NOT cmbLotes.Enabled;
   cmbCupomvenda.Enabled := not cmbCupomvenda.Enabled;
   cmbEtiqueta.Enabled  := not cmbEtiqueta.Enabled;
end;

procedure TfrmConfiguracoes.BtEditarClick(Sender: TObject);
begin
      tratabotoes;
      dmConsultas.cdsNatureza.Close;
      dmConsultas.cdsNatureza.Open;
      //
      dm.CdsConfig.Edit;
      //
      If not uFuncoes.Empty(Dm.cdsconfigCFG_EMAIL_PASSWORD.asString) Then
           Dm.cdsconfigCFG_EMAIL_PASSWORD.asString :=
                uFuncoes.Criptografia(dbeSenhaEmail.Text, uFuncoes.chave);
      //
      If (PageControl1.ActivePageIndex = 0) Then
         DBLookupComboBox1.SetFocus;
      If (PageControl1.ActivePageIndex = 1) Then
         dbePECOMI.SetFocus;
end;


procedure TfrmConfiguracoes.imgLogoDblClick(Sender: TObject);
begin
      btProcurarClick(Sender);
end;

procedure TfrmConfiguracoes.dbePADRAOBARRASKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
end;

procedure TfrmConfiguracoes.FormShow(Sender: TObject);
begin
     cmbSOESTOQUE.Enabled  := False;
     cmbLotes.Enabled      := False;
     cmbCupomvenda.Enabled := False;
     cmbEtiqueta.Enabled   := False;
     //
     PageControl1.ActivePageIndex := 0;
     //
     dm.parametros;
     If (dm.CdsConfigCFG_FLVENDAESTOQUE.AsString = 'S') Then
        cmbSOESTOQUE.ItemIndex := 0
     Else
        cmbSOESTOQUE.ItemIndex := 1;
     // Lotes
     If (dm.CdsConfigCFG_FLLOTE.AsString = 'S') Then
        cmbLotes.ItemIndex := 0
     Else
        cmbLotes.ItemIndex := 1;
     //
     If (dm.CdsConfigCFG_FLCUPOMVENDA.AsString = 'S') Then
        cmbCupomvenda.ItemIndex := 0
     Else
        cmbCupomvenda.ItemIndex := 1;
     //
     If (dm.CdsConfigCFG_PADRAOBARRAS.AsString = '1') Then
         cmbEtiqueta.ItemIndex := 0
     Else
         cmbEtiqueta.ItemIndex := 1;
     //
     Dm.RefreshCDS(dmRelatorios.cdsContaSaldo);
     Dm.RefreshCDS(dmRelatorios.cdsCedentes); 
end;

procedure TfrmConfiguracoes.DBLookupComboBox1Exit(Sender: TObject);
begin
     If not Empty(DBLookupComboBox1.Text) Then
        If not (dmConsultas.GetNatureza(DBLookupComboBox1.Text) ) Then
             Begin
                  Application.MessageBox(PChar('Tipo de Natureza não é de crédito!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                  DBLookupComboBox1.SetFocus;
                  Exit;
             End;
end;

procedure TfrmConfiguracoes.dbeCedenteKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Configuração'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     //BtAdicionar.Visible := (novo = 'S');
     BtEditar.Visible    := (alterar = 'S');
     //BtExcluir.Visible   := (apagar = 'S');
     //
   End;
end;

procedure TfrmConfiguracoes.dbeQTMESASExit(Sender: TObject);
begin
     if (Dm.CdsConfig.State in [dsEdit]) and not uFuncoes.Empty(Dm.CdsConfigCFG_QTMESAS.AsString)  Then
         if (Dm.CdsConfigCFG_QTMESAS.AsInteger < 1) Then
           begin
                dbeQTMESAS.Clear;
                dbeQTMESAS.SetFocus;
                Exit;
           End;
end;

procedure TfrmConfiguracoes.dbeOrcamentosKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (Dm.CdsConfig.State in [dsEdit]) Then
       If not( key in['S','N', #8, #13] ) then
            key:=#0;
end;

procedure TfrmConfiguracoes.dbeTaxaServicoExit(Sender: TObject);
begin
     if (Dm.CdsConfig.State = dsEdit) and not uFuncoes.Empty(Dm.CdsConfigCFG_TAXA_SERVICO.AsString) Then
       if (Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat < 0) or
         (Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat > 100)  Then
         begin
              Application.MessageBox(PChar('Valor para taxa inválido !'),
               'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
              dbeTaxaServico.SetFocus;
              Exit;
         End;
end;

procedure TfrmConfiguracoes.DBEdit8KeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

end.
