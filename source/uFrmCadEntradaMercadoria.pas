unit uFrmCadEntradaMercadoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids,
  ToolEdit, CurrEdit, DBXpress, DB, Gradient, DBClient, RXCtrls, FMTBcd,
  SqlExpr, Gradient1;

type
  TfrmCadEntrada = class(TForm)
    pnlSuperior: TPanel;
    pnlCentral: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnlBotoes: TPanel;
    BtAdicionar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    pnlProdutos: TPanel;
    grdConsultar: TDBGrid;
    edtCDPROD: TEdit;
    edtQUANT: TCurrencyEdit;
    edtValor: TCurrencyEdit;
    edtIPI: TCurrencyEdit;
    edtICMS: TCurrencyEdit;
    edtSubTotal: TCurrencyEdit;
    dbeNRPEDI: TEdit;
    edtCDFORN: TEdit;
    spFornecedor: TSpeedButton;
    dbeNRNOTA: TMaskEdit;
    dbeSERIE: TMaskEdit;
    dsProdutos: TDataSource;
    cmbUNIDADE: TComboBox;
    spProdutos: TSpeedButton;
    cmbLoja: TComboBox;
    qryLoja: TSQLQuery;
    qryLojaEMP_CODIGO: TIntegerField;
    qryLojaEMP_FANTASIA: TStringField;
    qryLojaEMP_RAZAO: TStringField;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox1: TGroupBox;
    lbl_NRPEDIDO: TLabel;
    edtNRLOTE: TEdit;
    lbl_lotes: TLabel;
    dbeDTPEDI: TDateEdit;
    dbeDTEMISS: TDateEdit;
    dbeDTRECE: TDateEdit;
    edtDTVENC: TDateEdit;
    cdsLoja: TClientDataSet;
    pnlTotal: TPanel;
    Label9: TLabel;
    Gradiente2: TGradiente;
    lbl_TOTAL: TRxLabel;
    lbl_NMPROD: TEdit;
    lbl_NMFORN: TEdit;
    procedure BtSairClick(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCDFORNKeyPress(Sender: TObject; var Key: Char);
    procedure edtSubTotalKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDFORNExit(Sender: TObject);
    procedure dbeNRNOTAKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNRNOTAExit(Sender: TObject);
    procedure edtQUANTExit(Sender: TObject);
    procedure edtQUANTKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODChange(Sender: TObject);
    procedure edtCDPRODEnter(Sender: TObject);
    procedure edtIPIKeyPress(Sender: TObject; var Key: Char);
    procedure edtICMSKeyPress(Sender: TObject; var Key: Char);
    procedure cmbUNIDADEKeyPress(Sender: TObject; var Key: Char);
    procedure cmbUNIDADEEnter(Sender: TObject);
    procedure spFornecedorClick(Sender: TObject);
    procedure edtCDFORNChange(Sender: TObject);
    procedure dbeDTPEDIKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDTEMISSKeyPress(Sender: TObject; var Key: Char);
    procedure dbeSERIEKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDTRECEKeyPress(Sender: TObject; var Key: Char);
    procedure spProdutosClick(Sender: TObject);
    procedure cmbLojaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbeSERIEExit(Sender: TObject);
    procedure edtSubTotalExit(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure cmbLojaEnter(Sender: TObject);
    procedure dbeDTPEDIExit(Sender: TObject);
    procedure dbeDTEMISSExit(Sender: TObject);
    procedure dbeDTRECEExit(Sender: TObject);
    procedure edtDTVENCExit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure Adicionar_Produtos;
     procedure CALCULAR;
     procedure LOJA;
     Function VALIDAR_NOTA(W_CDFORN, W_NRNOTA, W_CDCURS : Integer; W_NRSERI : String) : Boolean;
     procedure CODIGO_LOJA;
     procedure LOTES;
    { Private declarations }
  public
     procedure CANCELAR;
     procedure Limpar_campos;
    { Public declarations }
  end;

var
  frmCadEntrada: TfrmCadEntrada;
  Transacao: TTransactionDesc;
  M_NRPEDI : integer;
  M_VALIPI, M_VLICMS : Real;
  M_TOENTR, M_TOTIPI, M_TOICMS : Real;
  M_CDFORN, M_CDLOJA, M_CDPROD : String;
  W_CDLOJA : Integer;

implementation

uses Udm, UFrmAdmin, udmConsulta, uFuncoes, uFrmFecharEntrada,
  uFrmLocFornec, uFrmLocLoja, uFrmBuscaProdutos, uDm2;

const
    ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
    ScreenHeight: LongInt = 600;

{$R *.dfm}

procedure TfrmCadEntrada.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadEntrada.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   //BtEditar.Enabled := not BtEditar.Enabled;
   //BtExcluir.Enabled := not BtExcluir.Enabled;
   //BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   pnlProdutos.Enabled := not pnlProdutos.Enabled;
   pnlSuperior.Enabled := not pnlSuperior.Enabled;
end;

procedure TfrmCadEntrada.edtCDPRODKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (Key = #13) and uFuncoes.Empty(edtCDPROD.Text) Then
    Begin
         key:=#0;
         spProdutosClick(Sender);
    End;
    //
    If (Key = #13) and not uFuncoes.Empty(edtCDPROD.Text) Then
    Begin
         key:=#0;
         //
         cmbUNIDADE.SetFocus; 
         {With dmConsultas.qryProdutos do
         Begin
              Close;
              //
              Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
              //
              Open;
         End;
         //
         If not (dmConsultas.qryProdutos.IsEmpty) Then
         Begin
              lbl_NMPROD.Caption := dmConsultas.qryProdutos.FieldByName('PRO_DESCRICAO').AsString;
              edtValor.Value     := dmConsultas.qryProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
              cmbUNIDADE.Items.Add(dmConsultas.qryProdutos.FieldByName('UNI_CODIGO').AsString);
              If not uFuncoes.Empty(dmConsultas.qryProdutos.FieldByName('UNI_ARMAZENAMENTO').AsString) Then
                If  (dmConsultas.qryProdutos.FieldByName('UNI_CODIGO').AsString <>
                  dmConsultas.qryProdutos.FieldByName('UNI_ARMAZENAMENTO').AsString) Then
                 cmbUNIDADE.Items.Add(dmConsultas.qryProdutos.FieldByName('UNI_ARMAZENAMENTO').AsString);
              edtCDPROD.Text     := uFuncoes.StrZero(edtCDPROD.Text,13);
              cmbUNIDADE.SetFocus;
              //edtUNIDADE.SetFocus;
         End
         Else
         Begin
              Application.MessageBox(PChar('Código de produto não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_NMPROD.Caption := '';
              edtCDPROD.Clear;
              edtCDPROD.SetFocus;
              Exit;
         End;}
    End;
end;

procedure TfrmCadEntrada.BtAdicionarClick(Sender: TObject);
begin
     Try
        tratabotoes;
        dm.parametros;
        //
        M_TOENTR := 0;
        M_TOTIPI := 0;
        M_TOICMS := 0;
        //
        LOJA;
        //
        cmbLoja.SetFocus;
        dbeNRPEDI.Text := uFuncoes.StrZero(FloattoStr(dm.CdsConfigCFG_ENTRADA.Value+1),10);
        lbl_NRPEDIDO.Caption := uFuncoes.StrZero(FloattoStr(dm.CdsConfigCFG_ENTRADA.Value+1),10);
        {dbeDTPEDI.Text  := DatetoStr(Date());
        dbeDTEMISS.Text := DatetoStr(Date());}
        dbeDTRECE.Text  := DatetoStr(Date());
        //
        M_NRPEDI := StrtoInt(dbeNRPEDI.Text);
       //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar adicionar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
end;

procedure TfrmCadEntrada.BtEditarClick(Sender: TObject);
begin
     Try
        tratabotoes;
       //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar adicionar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
end;

procedure TfrmCadEntrada.BtGravarClick(Sender: TObject);
Var
    M_BSICMS, M_VLICMS : Real;
begin
     If (M_TOENTR = 0) AND (DM2.cdsProdutos.IsEmpty) Then
     Begin
          Application.MessageBox(PChar('Não há itens na entrada!!!'),
                               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
          edtCDPROD.Clear;
          edtCDPROD.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbLoja.Text) Then
     Begin
          Application.MessageBox(PChar('Selecione a loja!!!'),
                               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
          cmbLoja.Clear;
          cmbLoja.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
          Application.MessageBox(PChar('Digite o código do fornecedor!!!'),
                               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
          edtCDFORN.Clear;
          edtCDFORN.SetFocus;
          Exit;
     End;
     //
     If (dbeDTPEDI.Text = '  /  /    ') Then
     Begin
          Application.MessageBox(PChar('Digite a data do pedido!!!'),
                               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
          dbeDTPEDI.Clear;
          dbeDTPEDI.SetFocus;
          Exit;
     End;
     //
     If (dbeDTEMISS.Text = '  /  /    ') Then
     Begin
          Application.MessageBox(PChar('Digite a data da emissão!!!'),
                               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
          dbeDTEMISS.Clear;
          dbeDTEMISS.SetFocus;
          Exit;
     End;
     //
     If (dbeDTRECE.Text = '  /  /    ') Then
     Begin
          Application.MessageBox(PChar('Digite a data de recebimento!!!'),
                               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
          dbeDTRECE.Clear;
          dbeDTRECE.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(dbeNRNOTA.Text) Then
     Begin
          Application.MessageBox(PChar('Digite o número da nota!!!'),
                               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
          dbeNRNOTA.Clear;
          dbeNRNOTA.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(dbeSERIE.Text) Then
     Begin
          Application.MessageBox(PChar('Digite a serie da nota!!!'),
                               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
          dbeSERIE.Clear;
          dbeSERIE.SetFocus;
          Exit;
     End;
     //
     Try
        tratabotoes;
        //
        Application.CreateForm(TfrmFecharEntrada, frmFecharEntrada);{Carrega form na memória}
        try
          //
          M_BSICMS := 0;
          M_VLICMS := 0;
          M_VALIPI := 0;
          //
          With DM2.cdsProdutos do
          Begin
               DisableControls;
               First;
               //
               While not (EoF) do
               Begin
                   If (FieldByName('ENP_ICMS').AsFloat > 0) Then
                   Begin
                         M_BSICMS := M_BSICMS + FieldByName('ENP_SUBTOTAL').AsCurrency;
                         M_VLICMS := M_VLICMS +
                              uFuncoes.Gerapercentual(FieldByName('ENP_SUBTOTAL').AsCurrency, FieldByName('ENP_ICMS').AsFloat);
                   End;
                   //
                   If (FieldByName('ENP_IPI').AsFloat > 0) Then
                      M_VALIPI := M_VALIPI +
                           uFuncoes.Gerapercentual(FieldByName('ENP_SUBTOTAL').AsCurrency, FieldByName('ENP_IPI').AsFloat);
                   //   Proximo
                   Next;
               End;   // Fim-do-enquanto
               //
               EnableControls;
          End;
          //
          W_CDLOJA := uFuncoes.CDLOJA(cmbLoja.Text);
          //
          With frmFecharEntrada.cdsEntrada do
          Begin
             Append;
             FieldByName('ENT_NUMERO').AsInteger := StrtoInt(dbeNRPEDI.Text);
             FieldByName('ENT_LOJA').AsInteger   := W_CDLOJA;
             FieldByName('LOJ_NMLOJA').AsString  := cmbLoja.Text;
             FieldByName('FOR_CODIGO').AsInteger := StrtoInt(edtCDFORN.Text);
             //FieldByName('ENT_TRANSPORTADORA').AsInteger := StrtoInt(edtCDTRANSP.Text);
             FieldByName('FOR_NOME').AsString     := lbl_NMFORN.Text;
             //FieldByName('ENT_NMTRANSP').AsString := lbl_NMTRANSP.Caption;
             FieldByName('ENT_DTPEDIDO').AsDateTime := StrtoDate(dbeDTPEDI.Text);
             FieldByName('ENT_DTEMISSAO').AsDateTime := StrtoDate(dbeDTEMISS.Text);
             FieldByName('ENT_DTRECEBIMENTO').AsDateTime := StrtoDate(dbeDTRECE.Text);
             FieldByName('ENT_NRNOTA').AsInteger := StrtoInt(dbeNRNOTA.Text);
             FieldByName('ENT_SERIENOTA').AsString := dbeSERIE.Text;
             FieldByName('ENT_VALORMERCADORIA').AsCurrency := M_TOENTR;
             //
             Post;
          End;
            //
            uFrmFecharEntrada.W_TOTIPI := M_TOTIPI;
            uFrmFecharEntrada.W_TOICMS := M_BSICMS;
            uFrmFecharEntrada.W_VALIPI := M_VALIPI;
            uFrmFecharEntrada.W_VLICMS := M_VLICMS;
            //
            frmFecharEntrada.showmodal;
        finally
            //If (ufrmFecharEntrada.M_FLCANC = 'S') Then
                  CANCELAR;
            frmFecharEntrada.Release;
            frmFecharEntrada := nil;
            //frmFecharEntrada.free;
            //
        end;
        //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           //dm.SqlAdmin.Rollback(Transacao);
        End;
     End;
end;

procedure TfrmCadEntrada.BtCancelarClick(Sender: TObject);
begin
     Try
        tratabotoes;
        CANCELAR;
       //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar cancelar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
end;

procedure TfrmCadEntrada.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Entrada de Mercadorias'));
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
     //BtEditar.Visible    := (alterar = 'S');
     //BtExcluir.Visible   := (apagar = 'S');
  End;
  //
 {    scaled := true;
    if (screen.width <> ScreenWidth) then
    begin
        height := longint(height) * longint(screen.height) DIV ScreenHeight;
        width := longint(width) * longint(screen.width) DIV ScreenWidth;
        scaleBy(screen.width, ScreenWidth);
    end;}
    //
    pnlProdutos.Enabled := False;
    pnlSuperior.Enabled := False;
    //
    lbl_NMPROD.Clear;
    W_CDLOJA := 1;
end;

procedure TfrmCadEntrada.edtCDFORNKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (Key = #13) and uFuncoes.Empty(edtCDFORN.Text) Then
    Begin
         key:=#0;
         spFornecedorClick(Sender);
    End;
    //
    If (Key = #13) and not uFuncoes.Empty(edtCDFORN.Text) Then
    Begin
         key:=#0;
         dbeDTPEDI.SetFocus;
    End;
end;

procedure TfrmCadEntrada.edtSubTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) and not uFuncoes.Empty(edtSubTotal.Text) Then
     Begin
          Key := #0;
          //
          edtCDPROD.SetFocus;
          //Adicionar_Produtos;
     End;
end;

procedure TfrmCadEntrada.edtCDFORNExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
          With dmConsultas.qryFornec do
          Begin
               Close;
               Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDFORN.Text);
               Open;
          End;
          //
          If (dmConsultas.qryFornec.IsEmpty) Then
          Begin
              Application.MessageBox(PChar('Fornecedor não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_NMFORN.Clear;
              edtCDFORN.Clear;
              edtCDFORN.SetFocus;
              Exit;
          End
          Else
          Begin
             If not uFuncoes.Empty(edtCDFORN.text)
               and not uFuncoes.Empty(dbeNRNOTA.Text)
               And not uFuncoes.Empty(dbeSERIE.Text) Then
             Begin
               If (VALIDAR_NOTA(StrtoInt(edtCDFORN.text), StrtoInt(dbeNRNOTA.Text),
                   1, dbeSERIE.Text) = False) Then
               Begin
                   dbeDTPEDI.SetFocus;
               End
               Else
                   edtCDFORN.SetFocus;
             End;
             //
             lbl_NMFORN.Text := dmConsultas.qryFornec.FieldByName('FOR_FANTASIA').AsString;
             edtCDFORN.Text := uFuncoes.StrZero(edtCDFORN.Text,5);
          End;
          //
     End;
end;

procedure TfrmCadEntrada.dbeNRNOTAKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13, #27] ) then
        key:=#0;
    //
    If (key = #27) Then
    begin
         key:=#0;
         BtCancelarClick(Sender);
    End;
    //
    If (Key = #13) and not uFuncoes.Empty(dbeNRNOTA.Text) Then
    Begin
         key:=#0;
         dbeSERIE.SetFocus;
    End;
end;

procedure TfrmCadEntrada.dbeNRNOTAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeNRNOTA.Text) Then
     begin
         dbeNRNOTA.Text := uFuncoes.StrZero(dbeNRNOTA.Text,10);
         If not uFuncoes.Empty(edtCDFORN.text)
            and not uFuncoes.Empty(dbeNRNOTA.Text)
            And not uFuncoes.Empty(dbeSERIE.Text) Then
         Begin
             If (VALIDAR_NOTA(StrtoInt(edtCDFORN.text), StrtoInt(dbeNRNOTA.Text),
                 2, dbeSERIE.Text) = False) Then
                 dbeSERIE.SetFocus
             Else
                 dbeNRNOTA.SetFocus;
         End;
     End;
{     If not uFuncoes.Empty(dbeNRNOTA.Text)
       and not uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
           With dmConsultas.qryEntrada do
           Begin
                Close;
                //
                Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDFORN.Text);
                Params.ParamByName('pNRNOTA').AsString  := uFuncoes.StrZero(dbeNRNOTA.Text,10);
                //
                Open;
           End;
           //
           If not (dmConsultas.qryEntrada.IsEmpty) Then
           Begin
              Application.MessageBox(PChar('Registro de nota já cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              dbeNRNOTA.Clear;
              dbeNRNOTA.SetFocus;
              Exit;
           End
           Else
               dbeNRNOTA.Text := uFuncoes.StrZero(dbeNRNOTA.Text,10);
     End;}
end;

procedure TfrmCadEntrada.edtQUANTExit(Sender: TObject);
begin
     {If not uFuncoes.Empty(edtQUANT.Text) Then
         edtQUANT.Text :=  Format('%9.3f',[ StrtoFloat(edtQUANT.Text)]);}
     //
     If (edtQUANT.Value = 0) Then
       edtQUANT.SetFocus;
     //
     If (edtQUANT.Value > 0) Then
     Begin
           CALCULAR;
           edtValor.SetFocus;
     End;
end;

procedure TfrmCadEntrada.edtQUANTKeyPress(Sender: TObject; var Key: Char);
begin
      If (Key = #27) Then
      Begin
           Key := #0;
           cmbUNIDADE.SetFocus; 
      End;
      //
      If (Key = #13) Then
      //and (edtQUANT.Value > 0) Then
      Begin
           Key := #0;
           //CALCULAR;
           edtValor.SetFocus;
      End;
end;

procedure TfrmCadEntrada.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
      If (Key = #13) and (edtValor.Value > 0) Then
      Begin
           Key := #0;
           CALCULAR;
           //edtSubTotal.Value := edtValor.Value * edtQUANT.Value;
           edtIPI.SetFocus;
      End;
end;

procedure TfrmCadEntrada.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text ) Then
     Begin
          Limpar_campos;
     End;
end;

procedure TfrmCadEntrada.Limpar_campos;
begin
     lbl_NMPROD.Clear;
     //edtUNIDADE.Clear;
     edtQUANT.Clear;
     edtValor.Clear;
     edtIPI.Clear;
     edtICMS.Clear;
     edtSubTotal.Clear;
     cmbUNIDADE.Clear;
     edtNRLOTE.Clear;
     edtDTVENC.Clear;  
end;

procedure TfrmCadEntrada.Adicionar_Produtos;
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
     begin
         edtCDPROD.SetFocus;
         Exit;
     End;
     //
     If uFuncoes.Empty(cmbUNIDADE.Text) Then
     begin
         cmbUNIDADE.SetFocus;
         Exit;
     End;
     //
     If uFuncoes.Empty(edtQUANT.Text) or (edtQUANT.Value <=0) Then
     begin
         edtQUANT.SetFocus;
         Exit;
     End;
     //
     If uFuncoes.Empty(edtValor.Text) or (edtValor.Value <=0) Then
     begin
         edtValor.SetFocus;
         Exit;
     End;
     //
     With DM2.cdsProdutos do
     Begin
          Append;
          FieldByName('PRO_CODIGO').AsString    := edtCDPROD.Text;
          FieldByName('PRO_NOME').AsString := lbl_NMPROD.Text;
          FieldByName('UNI_DESCRICAO').AsString := cmbUNIDADE.Text;
          If not uFuncoes.Empty(edtNRLOTE.Text) Then
          begin
              FieldByName('PRO_NRLOTE').AsString         := edtNRLOTE.Text;
              FieldByName('PRO_DTVENCIMENTO').AsDateTime := StrtoDate(edtDTVENC.Text);
          End
          Else
          Begin
              FieldByName('PRO_NRLOTE').AsString         := 'GERAL';
              FieldByName('PRO_DTVENCIMENTO').Clear; 
          End;
          FieldByName('ENP_QUANTIDADE').AsFloat := StrtoFloat(Format('%9.3f',[ edtQUANT.Value]));
          FieldByName('ENP_VALOR').AsCurrency   := edtValor.Value;
          FieldByName('ENP_IPI').AsCurrency     := edtIPI.Value;
          FieldByName('ENP_ICMS').AsCurrency    := edtICMS.Value;
          FieldByName('ENP_SUBTOTAL').AsCurrency:= edtSubTotal.Value;
          Post;
          //
          M_TOENTR := 0;
          M_TOTIPI := 0;
          M_TOICMS := 0;
          M_VALIPI := 0;
          M_VLICMS := 0;
          //
          DisableControls;
          First;
          //
          While not (DM2.cdsProdutos.Eof) do
          Begin
                Edit;
                M_TOENTR := M_TOENTR + FieldByName('ENP_SUBTOTAL').AsCurrency;
                If (FieldByName('ENP_IPI').AsCurrency > 0) Then
                   M_VALIPI := M_VALIPI + FieldByName('ENP_SUBTOTAL').AsCurrency;
                If (FieldByName('ENP_ICMS').AsCurrency > 0) Then
                   M_VLICMS := M_VLICMS + FieldByName('ENP_SUBTOTAL').AsCurrency;
                //
                M_TOTIPI := M_TOTIPI + FieldByName('ENP_IPI').AsCurrency;
                M_TOICMS := M_TOICMS + FieldByName('ENP_ICMS').AsCurrency;
                //
                Next;
          End;
          //
          EnableControls;
     End;
     //
     lbl_TOTAL.Caption := FormatFloat('###,###,##0.#0',M_TOENTR);
     //
     edtCDPROD.Clear;
     edtCDPROD.SetFocus;
end;

procedure TfrmCadEntrada.edtCDPRODEnter(Sender: TObject);
begin
      Limpar_campos;
end;

procedure TfrmCadEntrada.CANCELAR;
begin
     edtCDPROD.Clear;
     dbeNRPEDI.Clear;
     edtCDFORN.Clear;
     lbl_NMFORN.Clear;
     dbeDTPEDI.Clear;
     dbeDTEMISS.Clear;
     dbeDTRECE.Clear;
     dbeNRNOTA.Clear;
     dbeSERIE.Clear;
     cmbLoja.Clear;
     lbl_NRPEDIDO.Caption := '0000000000';
     //
     If not (DM2.cdsProdutos.IsEmpty) Then
        DM2.cdsProdutos.EmptyDataSet;
     //
     lbl_TOTAL.Caption := '0,00';
end;

procedure TfrmCadEntrada.CALCULAR;
begin
     edtSubTotal.Value := edtValor.Value * edtQUANT.Value;
end;

procedure TfrmCadEntrada.edtIPIKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) Then
     Begin
          Key := #0;
          edtICMS.SetFocus;
     End;
end;

procedure TfrmCadEntrada.edtICMSKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) Then
     Begin
          Key := #0;
          edtSubTotal.SetFocus;
     End;
end;

procedure TfrmCadEntrada.cmbUNIDADEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) and not uFuncoes.Empty(cmbUNIDADE.Text) Then
     Begin
          Key := #0;
          edtQUANT.SetFocus;
     End;
end;

procedure TfrmCadEntrada.cmbUNIDADEEnter(Sender: TObject);
begin
     cmbUNIDADE.ItemIndex := 0;
end;

procedure TfrmCadEntrada.spFornecedorClick(Sender: TObject);
begin
  with TfrmBuscaFornec.create(self) do
  try
     uFrmLocFornec.M_NRFROM := 2;
     showmodal;
  finally
    edtCDFORN.Text := M_CDFORN;
    If not uFuncoes.Empty(edtCDFORN.Text) Then
       dbeDTPEDI.SetFocus
    Else
       edtCDFORN.SetFocus; 
    free;
  end;
end;


procedure TfrmCadEntrada.edtCDFORNChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDFORN.Text) Then
       lbl_NMFORN.Clear;
end;

procedure TfrmCadEntrada.dbeDTPEDIKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #27) Then
    begin
         key:=#0;
         BtCancelarClick(Sender);
    End;
    //
    If (Key = #13) and not uFuncoes.Empty(dbeDTPEDI.Text) Then
    Begin
         key:=#0;
         dbeDTEMISS.SetFocus;
    End;
end;

procedure TfrmCadEntrada.dbeDTEMISSKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (key = #27) Then
    begin
         key:=#0;
         BtCancelarClick(Sender);
    End;
    //
    If (Key = #13) and not uFuncoes.Empty(dbeDTEMISS.Text) Then
    Begin
         key:=#0;
         dbeDTRECE.SetFocus;
    End;
end;

procedure TfrmCadEntrada.dbeSERIEKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #27) Then
    begin
         key:=#0;
         BtCancelarClick(Sender);
    End;
    //
    If (Key = #13) and not uFuncoes.Empty(dbeSERIE.Text) Then
    Begin
         key:=#0;
         edtCDPROD.SetFocus;
    End;
end;

procedure TfrmCadEntrada.dbeDTRECEKeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #27) Then
    begin
         key:=#0;
         BtCancelarClick(Sender);
    End;
    //
    If (Key = #13) and not uFuncoes.Empty(dbeDTRECE.Text) Then
    Begin
         key:=#0;
         dbeNRNOTA.SetFocus;
    End;
end;

procedure TfrmCadEntrada.spProdutosClick(Sender: TObject);
begin
  with TfrmBuscaProduto.create(self) do
  try
     uFrmBuscaProdutos.M_NRFROM := 1;
     showmodal;
  finally
    edtCDPROD.Text := M_CDPROD;
    If not uFuncoes.Empty(edtCDPROD.Text) Then
       cmbUNIDADE.SetFocus
    Else
       edtCDPROD.SetFocus; 
    free;
  end;
end;

procedure TfrmCadEntrada.LOJA;
begin
     dmConsultas.Lojas(cmbLoja);
     {With qryLoja do
     Begin
          Close;
          Open;
          First;
     End;
     //
     cmbLoja.Clear;
     If not (qryLoja.IsEmpty) Then
     begin
          While not (qryLoja.Eof) do
          Begin
               cmbLoja.Items.Add(qryLoja.FieldByName('EMP_FANTASIA').AsString);
               //
               qryLoja.Next;
          End;
     End;
     //cmbLoja.ItemIndex := 0;}
end;

procedure TfrmCadEntrada.cmbLojaKeyPress(Sender: TObject; var Key: Char);
begin
    If (Key = #13) and not uFuncoes.Empty(cmbLoja.Text) Then
    Begin
         key:=#0;
         edtCDFORN.SetFocus;
    End;
end;

procedure TfrmCadEntrada.FormShow(Sender: TObject);
begin
     lbl_NMFORN.Clear;
     LOTES;
end;

procedure TfrmCadEntrada.CODIGO_LOJA;
begin
     With dmConsultas.qryLoja do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger := dm.cdsMovimento.FieldByName('MOV_LOJA').AsInteger;
          Open;
     End;
     //
     cmbLoja.Clear;
     If not (dmConsultas.qryLoja.IsEmpty) Then
        cmbLoja.Items.Add(dmConsultas.qryLoja.FieldByName('EMP_FANTASIA').AsString);
     cmbLoja.ItemIndex := 0;
end;

procedure TfrmCadEntrada.dbeSERIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeSERIE.Text) Then
     begin
         //dbeSERIE.Text := uFuncoes.StrZero(dbeSERIE.Text,2);
         If not uFuncoes.Empty(edtCDFORN.text)
            and not uFuncoes.Empty(dbeNRNOTA.Text)
            And not uFuncoes.Empty(dbeSERIE.Text) Then
         Begin
             If (VALIDAR_NOTA(StrtoInt(edtCDFORN.text), StrtoInt(dbeNRNOTA.Text),
                 3, dbeSERIE.Text) = False) Then
                 edtCDPROD.SetFocus
             Else
                 dbeSERIE.SetFocus;
         End;        
     End;
end;

procedure TfrmCadEntrada.edtSubTotalExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRLOTE.Text)
       and (edtDTVENC.Text = '  /  /    ') Then
     begin
          edtDTVENC.SetFocus;
          Exit;
     End;
     //     
     If not uFuncoes.Empty(edtSubTotal.Text) Then
        Adicionar_Produtos;
end;

procedure TfrmCadEntrada.edtCDPRODExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
          If (dmConsultas.GetProduto(edtCDPROD.Text)) Then
            begin
                Application.MessageBox('Este produto é um serviço.','ATENÇÃO',
                   MB_OK+MB_ICONWARNING+MB_APPLMODAL);
                edtCDPROD.Clear;
                edtCDPROD.SetFocus;
                Exit;
            End;
            //
         With dmConsultas.qryProdutos do
         Begin
              SQL.Clear;
              Close;
              SQL.Add('Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO, UNI_CODIGO, UNI_ARMAZENAMENTO, ');
              SQL.Add('PRO_VLVENDA, PRO_VLCOMPRA from PRODUTOS Where (PRO_CODIGO = :pCODIGO)');
              SQL.Add(' OR (PRO_BARRAS = :pBARRAS)');
              //
              Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
              Params.ParamByName('pBARRAS').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
              //
              Open;
         End;
         //
         If not (dmConsultas.qryProdutos.IsEmpty) Then
         Begin
              lbl_NMPROD.Text := dmConsultas.qryProdutos.FieldByName('PRO_DESCRICAO').AsString;
              edtValor.Value     := dmConsultas.qryProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
              cmbUNIDADE.Items.Add(dmConsultas.qryProdutos.FieldByName('UNI_CODIGO').AsString);
              If not uFuncoes.Empty(dmConsultas.qryProdutos.FieldByName('UNI_ARMAZENAMENTO').AsString) Then
                If  (dmConsultas.qryProdutos.FieldByName('UNI_CODIGO').AsString <>
                  dmConsultas.qryProdutos.FieldByName('UNI_ARMAZENAMENTO').AsString) Then
                 cmbUNIDADE.Items.Add(dmConsultas.qryProdutos.FieldByName('UNI_ARMAZENAMENTO').AsString);
              //edtCDPROD.Text     := uFuncoes.StrZero(edtCDPROD.Text,13);
              edtCDPROD.Text     := dmConsultas.qryProdutos.FieldByName('PRO_CODIGO').AsString; 
              //
              If (edtNRLOTE.Visible = True) Then
                 edtNRLOTE.SetFocus
              Else
                 cmbUNIDADE.SetFocus;
         End
         Else
         Begin
                If (dmConsultas.qryProdutos.IsEmpty) Then
                Begin
                    Application.MessageBox(PChar('Código de produto não cadastrado!!!'),
                        'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                    lbl_NMPROD.Clear;
                    edtCDPROD.Clear;
                    edtCDPROD.SetFocus;
                    Exit;
                End;    
         End;
     End;
end;

procedure TfrmCadEntrada.edtValorExit(Sender: TObject);
begin
     If (edtValor.Value > 0) Then
     Begin
           CALCULAR;
           edtIPI.SetFocus;
     End;
end;

procedure TfrmCadEntrada.cmbLojaEnter(Sender: TObject);
begin
     If uFuncoes.Empty(cmbLoja.Text) Then
         LOJA;
end;


function TfrmCadEntrada.VALIDAR_NOTA(W_CDFORN, W_NRNOTA,
  W_CDCURS: Integer ; W_NRSERI : String): Boolean;
begin
     If not uFuncoes.Empty(InttoStr(W_CDFORN))
       and not uFuncoes.Empty(InttoStr(W_NRNOTA))
       and not uFuncoes.Empty(W_NRSERI) Then
     Begin
           With dmConsultas.qryEntrada do
           Begin
                Close;
                //
                Params.ParamByName('pCODIGO').AsInteger   := W_CDFORN;
                Params.ParamByName('pNRNOTA').AsString    := uFuncoes.StrZero(InttoStr(W_NRNOTA),10);
                Params.ParamByName('pSERIENOTA').AsString := uFuncoes.StrZero(W_NRSERI,2);
                //
                Open;
           End;
           //
           If not (dmConsultas.qryEntrada.IsEmpty) Then
           Begin
              Application.MessageBox(PChar('Registro de nota já cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              result := True;
              Exit;
           End;
     End
     Else
         result := False;
end;

procedure TfrmCadEntrada.dbeDTPEDIExit(Sender: TObject);
begin
     If (dbeDTPEDI.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(dbeDTPEDI.Text);
              dbeDTPEDI.Text := DatetoStr(StrToDate(dbeDTPEDI.Text));
              //
              If (StrToDate(dbeDTPEDI.Text)>Date()) Then
              Begin
                   Application.MessageBox(PChar('Data do pedido deve ser menor que a atual!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeDTPEDI.Clear;
                   dbeDTPEDI.SetFocus;
                   Exit;
              End;
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTPEDI.Clear;
                     dbeDTPEDI.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmCadEntrada.dbeDTEMISSExit(Sender: TObject);
begin
     If (dbeDTEMISS.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(dbeDTEMISS.Text);
              dbeDTEMISS.Text := DatetoStr(StrToDate(dbeDTEMISS.Text));
              //
              If (dbeDTPEDI.Text <> '  /  /    ') Then
              Begin
                If (StrToDate(dbeDTEMISS.Text) < StrToDate(dbeDTPEDI.Text)) Then
                Begin
                   Application.MessageBox(PChar('Data de emissão menor que a data do pedido!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeDTEMISS.Clear;
                   dbeDTEMISS.SetFocus;
                   Exit;
                End;
              End;
              //
              If (StrToDate(dbeDTEMISS.Text) > Date()) Then
              Begin
                   Application.MessageBox(PChar('Data de emissão maior que a data atual!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeDTEMISS.Clear;
                   dbeDTEMISS.SetFocus;
                   Exit;
              End;
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTEMISS.Clear;
                     dbeDTEMISS.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmCadEntrada.dbeDTRECEExit(Sender: TObject);
begin
     If (dbeDTRECE.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(dbeDTRECE.Text);
              dbeDTRECE.Text := DatetoStr(StrToDate(dbeDTRECE.Text));
              //
              If (dbeDTEMISS.Text <> '  /  /    ') Then
              Begin
                If (StrToDate(dbeDTRECE.Text) < StrtoDate(dbeDTEMISS.Text)) Then
                Begin
                   Application.MessageBox(PChar('Data de recebimento menor que a de emissão!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeDTRECE.Text := DatetoStr(Date());
                   dbeDTRECE.SetFocus;
                   Exit;
                End;
                //
                If (StrToDate(dbeDTRECE.Text) > Date()) Then
                Begin
                   Application.MessageBox(PChar('Data de recebimento maior que a atual!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeDTRECE.Text := DatetoStr(Date());
                   dbeDTRECE.SetFocus;
                   Exit;
                End;
              End;
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTRECE.Clear;
                     dbeDTRECE.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmCadEntrada.LOTES;
begin
     DM.parametros; 
     If (dm.CdsConfigCFG_FLLOTE.AsString = 'N') Then
     Begin
        edtNRLOTE.Visible := False;
        lbl_lotes.Visible := False;
        edtDTVENC.Visible := False;
     End;
end;

procedure TfrmCadEntrada.edtDTVENCExit(Sender: TObject);
begin
     If (edtDTVENC.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTVENC.Text);
              edtDTVENC.Text := DatetoStr(StrToDate(edtDTVENC.Text));
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTVENC.Clear;
                     edtDTVENC.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmCadEntrada.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13, '.',','] ) then
        key:=#0;
end;

End.
