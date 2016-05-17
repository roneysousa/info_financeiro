unit uFrmVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gradient, StdCtrls, ExtCtrls, RXCtrls, Buttons, Grids, DBGrids,
  DB, DBClient, Menus, ComCtrls, FMTBcd, SqlExpr, Mask, DBCtrls, Gradient1,
  Provider;

type
  TfrmVendas = class(TForm)
    pnlSuperior: TPanel;
    lblNomePro: TLabel;
    pnlDESCRICAO: TPanel;
    lblUnidade: TLabel;
    lblQuant: TLabel;
    lblValor: TLabel;
    pnlUNID: TPanel;
    edtQuant: TPanel;
    pnlVLUNIT: TPanel;
    GridItens: TDBGrid;
    imgCodBar: TImage;
    lblCodigo: TLabel;
    imgMoedas: TImage;
    lblTotal: TLabel;
    edtTOTAL: TPanel;
    imgDinheiro: TImage;
    lblFormaPg: TLabel;
    lbl_ESC: TLabel;
    lbl_Cancela: TLabel;
    pnCDBARRAS: TPanel;
    edtCodigo: TEdit;
    btNovaVenda: TBitBtn;
    MainMenu1: TMainMenu;
    PDV1: TMenuItem;
    mnuLeituraXItem: TMenuItem;
    mnuReducaoZItem: TMenuItem;
    N1: TMenuItem;
    mnuCancelarItemAnterior: TMenuItem;
    mnuItemGenericoItem: TMenuItem;
    mnuCancelarmentodeCupomItem: TMenuItem;
    StatusBar1: TStatusBar;
    qryProdutos: TSQLQuery;
    graCaixaLivre: TGradiente;
    rxlCaixaLivre: TRxLabel;
    pnlImage: TPanel;
    Image1: TImage;
    edtNRCUPOM: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtMODELO: TEdit;
    Label3: TLabel;
    edtOPERADOR: TEdit;
    Timer1: TTimer;
    edtCDVEND: TEdit;
    lblVendedor: TLabel;
    N2: TMenuItem;
    mnuMemoriaFiscalItem: TMenuItem;
    mnuCancelarltimoCupomItem: TMenuItem;
    edtLoja: TEdit;
    Label5: TLabel;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btNovaVendaClick(Sender: TObject);
    procedure mnuLeituraXItemClick(Sender: TObject);
    procedure mnuReducaoZItemClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoChange(Sender: TObject);
    procedure mnuCancelarItemAnteriorClick(Sender: TObject);
    procedure mnuItemGenericoItemClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure edtCDVENDExit(Sender: TObject);
    procedure edtCDVENDKeyPress(Sender: TObject; var Key: Char);
    procedure GridItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnuCancelarmentodeCupomItemClick(Sender: TObject);
    procedure mnuMemoriaFiscalItemClick(Sender: TObject);
    procedure mnuCancelarltimoCupomItemClick(Sender: TObject);
    procedure edtMesaKeyPress(Sender: TObject; var Key: Char);
  private
     procedure INICIA_VALORES;
     procedure NOVA_VENDA;
     procedure INCLUIR_ITEM;
     function LOJA(W_CDCAIX : integer) : Integer;
     function BUSCA_ALIQUOTA(W_CDPROD : String ) : String;
     Procedure CANCELA_VENDA;
     function InputBoxVendedor(const ACaption, APrompt:string): string;
    { Private declarations }
  public
    function IMPRESSORA(W_CDCAIX : integer) : Integer;
    procedure LIMPA(Estado : String);
    procedure COMPONENTES_INVISIVEL(Estado : String);
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;
  M_QTPROD: Double;
  M_CDPROD, M_NMPROD,M_CDUNID, W_CDVEND : String;
  M_FLFRAC, M_CDTRIB, M_TPDESC : String;
  M_NRVEND, M_CDBARR, M_TPQUAN, W_NMVEND : String;
  M_NRSEQU, M_TPMOVI, M_VLTRIB, M_CDMODA, M_NMMODA, M_FLBAIX, M_CDBAIX : String;
  M_VLVEND, M_VLDESC, M_SUBTOT,M_TOVEND, W_VLVEND : Real;
  M_VLTROC, M_VLMODA,M_VLSUBT : Real;
  iRetorno,M_DECIMAL,M_NRITEM, M_CDLOJA, M_IMPRES, M_NRMESA : Integer;
  M_FLVEND : Boolean;
  M_CDARMA : String;
  M_LIDESC, M_VLFRAC, M_VLCOMP, M_VLCUST : Double;
  M_FLESTO, M_NRLOTE, M_VLALIQ, M_BARRAS  : String;

implementation

uses UFrmAdmin, uFormaPagamento, Udm, uFuncoes, uFrmProcurarProduto, udmConsulta, uDm2, uFrmMemFiscal, uFrmSeleLote, uFiscal,
  udmDados;

const
    ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
    ScreenHeight: LongInt = 600;

{$R *.dfm}

procedure TfrmVendas.FormActivate(Sender: TObject);
begin
     If (M_FLVEND = false) Then
     begin
           pnlDESCRICAO.Caption :='';
           pnlUNID.Caption :='';
           pnlVLUNIT.Caption :='';
           lblCodigo.Caption :='&Codigo:';
           edtQuant.Caption :='1';
           edtCodigo.Text := '';
           edtTotal.Caption := '0,00';
           //bdtN_Venda.Caption := ' ';
           frmVendas.INICIA_VALORES;
           // desabilita Menus
           mnuCancelarItemAnterior.Enabled     := False;
           mnuItemGenericoItem.Enabled := False;
           mnuCancelarmentodeCupomItem.Enabled := False;
           //
           mnuLeituraXItem.Enabled     := True;
           mnuReducaoZItem.Enabled     := True;
           mnuMemoriaFiscalItem.Enabled  := True;
     End;
     //
     LIMPA('1');
     //
     edtCDVEND.Clear;
end;

procedure TfrmVendas.INICIA_VALORES;
begin
     uFrmVendas.M_TOVEND := 0;
     uFrmVendas.M_FLVEND := False;
     uFrmVendas.M_VLVEND := 0;
     uFrmVendas.M_VLDESC := 0;
     uFrmVendas.M_SUBTOT := 0;
     uFrmVendas.M_VLTROC := 0;
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
    scaled := true;
    if (screen.width <> ScreenWidth) then
    begin
        height := longint(height) * longint(screen.height) DIV ScreenHeight;
        width := longint(width) * longint(screen.width) DIV ScreenWidth;
        scaleBy(screen.width, ScreenWidth);
    end;
     //
     //edtOPERADOR.Text := uFuncoes.StrZero(UFrmAdmin.M_CDUSUA,3);
     M_FLVEND := False;
end;

procedure TfrmVendas.LIMPA(Estado: String);
begin
   If (Estado = '1') Then
   begin
        pnlSuperior.Color   := clGray;
        //lblNVenda.Visible   := False;
        GridItens.Visible   := False;
        //pnlImage.Visible    := False;
        lblNomePro.Visible  := False;
        pnlDESCRICAO.Visible := False;
        lblUnidade.Visible := False;
        pnlUNID.Visible := False;
        edtQuant.Visible := False;
        lblQuant.Visible := False;
        pnlVLUNIT.Visible := False;
        lblValor.Visible := False;
        //lblListaPro.Visible := False;
        pnCDBARRAS.Visible := False;
        edtCodigo.Visible := False;
        imgCodBar.Visible := False;
        lblCodigo.Visible := False;
        imgMoedas.Visible := False;
        edtTOTAL.Visible := False;
        lblTotal.Visible := False;
        //bdtN_Venda.Visible := False;
        //lblNovaVenda.Visible := False;
        imgDinheiro.Visible := False;
        lblFormaPg.Visible := False;
        //imgNovaVenda.Visible := False;
        //pnlFormaPag.Visible := False;
        lbl_Cancela.Visible := False;
        lbl_ESC.Visible := False;
        //
        //lbl_Desconto.Visible     := False;
        //edtDescontoPerc.Visible  := False;
        //edtDescontoValor.Visible := False;
        //
        graCaixaLivre.Align := alClient;
        //rxlCaixaLivre.Left  := 50;
        //(FrmPrincipal.Width Div 2) - (pnlFormaPag.Width Div 2);
        //rxlCaixaLivre.Top   := (FrmAdmin.Height Div 2) - (150+StatusBar1.Height)+20;
        rxlCaixaLivre.Visible := True;
        graCaixaLivre.Visible := True;
        M_FLVEND := False;
        btNovaVenda.Visible   := True;
       //btNovaVenda.SetFocus;
       //  MENUS
       mnuLeituraXItem.Enabled      := True;
       mnuReducaoZItem.Enabled      := True;
       mnuMemoriaFiscalItem.Enabled  := True;
       //
       mnuCancelarItemAnterior.Enabled           := False;
       mnuItemGenericoItem.Enabled       := False;
       mnuCancelarmentodeCupomItem.Enabled := False;
  End
  Else
  begin
    graCaixaLivre.Visible := False;
    rxlCaixaLivre.Visible := False;
    btNovaVenda.Visible := False;
    //
    pnlSuperior.Color   := clBlue;
    //lblNVenda.Visible   := True;
    GridItens.Visible   := True;
    //pnlImage.Visible    := True;
    lblNomePro.Visible  := True;
    pnlDESCRICAO.Visible := True;
    lblUnidade.Visible := True;
    pnlUNID.Visible := True;
    edtQuant.Visible := True;
    lblQuant.Visible := True;
    pnlVLUNIT.Visible := True;
    lblValor.Visible := True;
    //lblListaPro.Visible := True;
    pnCDBARRAS.Visible := True;
    edtCodigo.Visible := True;
    imgCodBar.Visible := True;
    lblCodigo.Visible := True;
    imgDinheiro.Visible := True;
    //imgMoedas.Visible := True;
    edtTOTAL.Visible := True;
    lblTotal.Visible := True;
    //bdtN_Venda.Visible := True;
    //lblNovaVenda.Visible := True;
    lblFormaPg.Visible  := True;
    lbl_Cancela.Visible := True;
    lbl_ESC.Visible     := True;
    //
    //lbl_Desconto.Visible     := True;
    //edtDescontoPerc.Visible  := True;
    //edtDescontoValor.Visible := True;
    //imgNovaVenda.Visible := True;
    //
    mnuLeituraXItem.Enabled      := True;
    mnuReducaoZItem.Enabled      := True;
    mnuMemoriaFiscalItem.Enabled  := True;
    //
    mnuCancelarItemAnterior.Enabled           := False;
    mnuItemGenericoItem.Enabled       := False;
    mnuCancelarmentodeCupomItem.Enabled := False;
  End;
end;

procedure TfrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      // se pressionar Ctrl+Shift+Del
      If (ssCtrl in Shift) and (Key = 46) then
       begin
            If (M_FLMAST = 0) Then
            Begin
                 Dm.Fiscal_Usuario(StrtoInt(edtOPERADOR.Text));
                 M_IMPRES := IMPRESSORA(M_FLMAST);
            End;
            //
            If (graCaixaLivre.Visible = False) Then
                CANCELA_VENDA;
            //
            If (M_FLMAST = 0) Then
                M_IMPRES := IMPRESSORA(StrtoInt(edtOPERADOR.Text));
            //
            Exit;
       End;
      // Se pressionar F2.
      if (key = vk_F2) and (graCaixaLivre.Visible = False)  then
      begin
           If uFuncoes.Empty(edtCDVEND.Text) Then
           Begin
               Application.MessageBox('Digite o código do vendedor!!!',
                   'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
               edtCDVEND.SetFocus;
               Exit;
           End;
           //
           If (M_TOVEND = 0) Then
           begin
               edtCodigo.SetFocus;
               exit;
           end;
           //
           If (M_FLVEND = True) Then
           begin
                Application.CreateForm(TfrmFormaPagamento, frmFormaPagamento); // Carrega form na memória
                try
                   pnlSuperior.Color := clGray;
                   W_VLVEND := M_TOVEND;
                   uFormaPagamento.M_CDVEND := StrtoInt(edtCDVEND.Text);
                   uFormaPagamento.M_NMVEND := W_NMVEND;
                   uFormaPagamento.M_CDCAIX := StrtoInt(edtOPERADOR.Text);
                   frmFormaPagamento.ShowModal;
                Finally
                   frmFormaPagamento.Free;                              //Libera Memória
                   If (M_FLVEND = False) Then
                   Begin
                        pnlDESCRICAO.Caption :='';
                        pnlUNID.Caption :='';
                        pnlVLUNIT.Caption :='';
                        lblCodigo.Caption :='&Codigo:';
                        edtQuant.Caption :='1';
                        edtCodigo.Text := '';
                        edtTotal.Caption := '0,00';
                        //bdtN_Venda.Caption := ' ';
                        frmVendas.INICIA_VALORES;
                        // desabilita Menus
                        mnuCancelarItemAnterior.Enabled     := False;
                        mnuItemGenericoItem.Enabled := False;
                        mnuCancelarmentodeCupomItem.Enabled := False;
                        //
                        Limpa('1');
                        //
                        mnuCancelarltimoCupomItem.Enabled := True;
                   End;
                End;
           end
           else
           begin
               Application.MessageBox (PChar('Você têm que abrir uma nova venda!!!'),
                  'Aviso',MB_ICONSTOP+ MB_OK);
               exit;
           end;
      end;
end;

procedure TfrmVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
     // (pnlFormaPag.Visible = False)
     If (key = #27) and (graCaixaLivre.Visible = False) Then
     begin
         Key := #0;
         If (Application.MessageBox('Confirma cancelamento de venda?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes) Then
         begin
              iRetorno := uFiscal.FISCAL('CancelaCupom', M_IMPRES);
              //
              If (iRetorno = 1) Then
                  Begin
                    //
                    pnlDESCRICAO.Caption :='';
                    pnlUNID.Caption :='';
                    pnlVLUNIT.Caption :='';
                    lblCodigo.Caption :='&Codigo:';
                    edtQuant.Caption :='1';
                    edtCodigo.Text := '';
                    edtTotal.Caption := '0,00';
                    LIMPA('1');
                  End;
         End;
     End;
     //
end;

procedure TfrmVendas.FormShow(Sender: TObject);
begin
     LIMPA('1');
     mnuCancelarltimoCupomItem.Enabled := False;
     //
     dm.parametros;
     M_FLESTO := dm.CdsConfigCFG_FLVENDAESTOQUE.AsString;  
     StatusBar1.Panels[0].Text := FrmAdmin.StatusBar1.Panels[0].Text;
     //
     M_BARRAS := Dm.Retorna_Barras();
     M_IMPRES := IMPRESSORA(StrtoInt(edtOPERADOR.Text));
     edtLoja.Text := uFuncoes.StrZero(dmConsultas.GetLoja(StrtoInt(edtOPERADOR.Text)),3);
     //
     if (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'S') Then
          GridItens.Columns[7].Visible := True
      Else
          GridItens.Columns[7].Visible := False;
end;


procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmVendas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     //CanClose := False;
     If (M_FLVEND = True) Then
     begin
         If (Application.MessageBox(PcHar('Confirma cancelamento de venda?'),
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes) Then
         begin
              If (M_NRITEM >= 1) Then
                 iRetorno := uFiscal.FISCAL('CancelaCupom', M_IMPRES)
              Else
                 iRetorno := 1;
              //
              If (iRetorno = 1) Then
                 CanClose := True;
         End
         Else
             CanClose := False;
     End
     Else
         CanClose := True;
end;

procedure TfrmVendas.btNovaVendaClick(Sender: TObject);
begin
 try
   Screen.Cursor := crHourGlass;
   //
     If (dm.CdsConfigCFG_FLVENDEDOR.AsString = 'N') Then
        edtCDVEND.Clear;
     // Verifica Impressora
     iRetorno := uFiscal.FISCAL('StatusEcf',M_IMPRES);
     //
     If (iRetorno <> 1) Then
     begin
         LIMPA('1');
         Exit;
     end;
     //
     LIMPA('2');
     //
     If (M_FLVEND = False) Then
     Begin
          //INICIA_VALORES;
          NOVA_VENDA;
          GridItens.Visible := True;
          edtCodigo.Enabled := True;
          edtCodigo.Clear;
          edtCodigo.SetFocus;
     End
     ELse
     begin
         Application.MessageBox('Você tem que fechar a venda atual.',
               'Atenção', MB_IconInformation + MB_OK);
         Exit;
     End;
 finally
  Screen.Cursor := crDefault;
 end;
 Application.ProcessMessages;
end;

procedure TfrmVendas.NOVA_VENDA;
begin
    Try
       Screen.Cursor := crHourGlass;
            // Abre o cupom fiscal na impressora.
            {iRetorno := uBematech.Bematech_FI_AbreCupom(pchar(''));
            uBematech.Analisa_iRetorno();
            uBematech.Retorno_Impressora();}
            //
            // menu
            {If iRetorno = 1 then
            begin}
                  If (Dm.CdsConfig.Active = False) Then
                      Dm.CdsConfig.Open;
                  //
                  Dm.CdsConfig.edit;
                  //
                  M_NRVEND := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_VENDA').AsFloat),7);
                  M_NRSEQU := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat),10);
                  //
                  Dm.CdsConfig.Cancel;
                  //
                  M_QTPROD  := 1;
                  M_NRITEM  := 0;
                  //M_FLCAAT  := True;
                  //Zera o troco e o Total
                  M_VLTROC  := 0;
                  M_TOVEND  := 0;
                  M_VLVEND  := 0;
                  M_FLVEND  := True;
                  //
                  dm.cdsItensVendas.EmptyDataSet;
                  //bdtN_Venda.Caption := M_NRVEND;
                  //cdsItensVendas.Open;
                  GridItens.Visible  := True;
                  edtCodigo.Enabled :=  True;
                  edtCodigo.SetFocus;
            //End;      // fim-do-retorno abre cupom
            //
            {iRetorno := uBematech.Bematech_FI_CancelaCupom();
            uBematech.Analisa_iRetorno();
            uBematech.Retorno_Impressora();}
            //
            Screen.Cursor := crDefault;
            Application.ProcessMessages;
    Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar iniciar uma nova venda!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              {iRetorno := uBematech.Bematech_FI_CancelaCupom();
              uBematech.Analisa_iRetorno();
              uBematech.Retorno_Impressora();}
              //
              //cdsItensVendas.Close;
              //
              pnlDESCRICAO.Caption :='';
              pnlUNID.Caption :='';
              pnlVLUNIT.Caption :='';
              lblCodigo.Caption :='&Codigo:';
              edtQuant.Caption :='1';
              edtCodigo.Text := '';
              edtTotal.Caption := '0,00';
              //bdtN_Venda.Caption := ' ';
              GridItens.Visible  := False;
              LIMPA('1');
              //
              M_FLVEND := False;
              Screen.Cursor := crDefault;
          //
         End;
    End;
end;

procedure TfrmVendas.mnuLeituraXItemClick(Sender: TObject);
begin
// ---------------------------- Leitura X -------------------------------
     Try
        If (M_FLVEND = False) Then
             uFiscal.FISCAL('LeituraX', M_IMPRES)
        Else
        Begin
             Application.MessageBox (PChar( 'Você tem que fechar a venda atual!!!'),
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
             Exit;
        End;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Erro ao tentar realizar leitura X!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
end;

procedure TfrmVendas.mnuReducaoZItemClick(Sender: TObject);
begin
// ---------------------------- Redução Z -------------------------------
     Try
         If (M_FLVEND =  False) Then
         begin
             If Application.MessageBox (PCHar('A Redução Z impossibilitará novas impressões'+#13
                            +'de Cupons Fiscais!'+#13+#13+'Continua ?'),
                            'ATENÇÃO',MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=idYes then
                 uFiscal.FISCAL('ReducaoZ',M_IMPRES)
             Else
                 Exit;
         //
         End
         Else
         Begin
              Application.MessageBox (PChar('Você tem que fechar a venda atual!!!'),
                  'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
              Exit;
         End;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Erro ao tentar realizar Redução Z!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
end;

procedure TfrmVendas.edtCodigoKeyPress(Sender: TObject; var Key: Char);
Var
    N_QTPROD : Double;
    M_TESTE, M_FLSAIR : Boolean;
    M_TENTATIVA : Integer;
begin
     If not( key in['0'..'9',#8,#13,#42, #27,','] ) then
          key:=#0;
     //
     If (key = #27) and (graCaixaLivre.Visible = False) Then
     begin
         Key := #0;
         If (Application.MessageBox('Confirma cancelamento de venda?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes) Then
         begin
              // Verifica Impressora
              iRetorno := uFiscal.FISCAL('StatusEcf',M_IMPRES);
              //
              If (iRetorno = 1) Then
                begin
                    pnlDESCRICAO.Caption :='';
                    pnlUNID.Caption :='';
                    pnlVLUNIT.Caption :='';
                    lblCodigo.Caption :='&Codigo:';
                    edtQuant.Caption :='1';
                    edtCodigo.Text := '';
                    edtTotal.Caption := '0,00';
                    //
                    LIMPA('1');
                End;
         End;
     End;
      // Se digita o "*" e o edtCodigo estive em branco.
      If (key = #42) and (edtCodigo.Text='') Then
          key:=#0;
      //
      If (key =#13) and (uFuncoes.Empty(edtCodigo.Text)) Then
      begin
           key:=#0;
           //
           try
               Application.CreateForm(TfrmLocalizaProduto, frmLocalizaProduto);
               uFrmProcurarProduto.M_NRFORM := 1;
               frmLocalizaProduto.ShowModal;
               {if (frmLocalizaProduto.ShowModal = mrOk) Then
                begin
                   If not uFuncoes.Empty(uFrmProcurarProduto.M_CDPROD) Then
                   //If not (frmLocalizaProduto.cdsProdutos.IsEmpty) Then
                   begin
                      edtCodigo.Text := uFrmProcurarProduto.M_CDPROD;
                      key:= #13;
                   End;
                End;}
           Finally
               //
                   If not uFuncoes.Empty(uFrmProcurarProduto.M_CDPROD) Then
                   //If not (frmLocalizaProduto.cdsProdutos.IsEmpty) Then
                   begin
                      edtCodigo.Text := uFrmProcurarProduto.M_CDPROD;
                      key:= #13;
                   End;
                //
               frmLocalizaProduto.Free;
               edtCodigo.SetFocus;
           End;
      End;
      // Se digita o "*"
      If (key = #42) Then
      begin
          edtQuant.Font.Color := clRed;
          //Remove o asterisco do edtCodigo.
          M_QTPROD  := StrtoFloat(edtCodigo.Text);
          edtQuant.Caption := edtCodigo.Text;
          edtCodigo.SetFocus;
          edtCodigo.text:='';
          exit;
      end;
      // Pressione o ENTER.
      If (Key = #13) and not uFuncoes.Empty(edtCodigo.Text) Then
      Begin
         key := #0;
         // Nova alteração
         If (edtCodigo.Text = M_BARRAS) Then
          begin
               Dm.Fiscal_Usuario(StrtoInt(edtOPERADOR.Text));
               //
               CANCELA_VENDA;
               //
               M_IMPRES := IMPRESSORA(StrtoInt(edtOPERADOR.Text));
               //
               Exit;
          End;
         //
         Try
           //Procura_Produto
           If Not(Dm.cdsProdutos.Active) Then        // Se estiver fechado
                  Dm.cdsProdutos.Open;              // Abre.
           //
           edtCodigo.text := Format('%13S',[uFuncoes.StrZero(edtCodigo.text,13)]);
           //
           //With qryProdutos do
           With cdsProdutos do
           begin
                Active := False;
                //CommandText := 
                //
                Params.ParamByName('pCODIGO').AsString := edtCodigo.text;
                Params.ParamByName('pBARRAS').AsString := edtCodigo.text;
                //
                Active := True;
           End;
           //
           If (cdsProdutos.IsEmpty) Then
           begin
                 Application.MessageBox (PChar('Produto não cadastrado !'),
                            'AVISO',MB_ICONSTOP+ MB_OK);
                 edtCodigo.Clear;
                 edtCodigo.SetFocus;
                 Exit;
           End
           Else
           Begin
               // nova alteração : 24-01-2007
               If uFuncoes.Empty(cdsProdutos.FieldByName('TRI_CODIGO').AsString)
                      and (M_IMPRES > 0) Then
                begin
                     Application.MessageBox('Produto sem tributação!!!',
                                'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     //
                     cdsProdutos.Close;
                     edtCodigo.Clear;
                     edtCodigo.SetFocus;
                     Exit;
                End;
               // Novo 04/01/2008
               M_TESTE := False;
             If uFuncoes.Empty(edtCDVEND.Text) Then
              begin
               If (dmConsultas.GetProduto(edtCodigo.Text)) or (Dm.cdsconfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'S') Then
               begin
                    W_CDVEND := '';
                    M_TENTATIVA := 0;
                    M_FLSAIR := False;
                    //
                     While not M_TESTE do
                      begin
                           //W_CDVEND := inputbox('Vendedor','Digite o código do vendedor?','');
                           W_CDVEND := InputBoxVendedor('Vendedor','Digite o código do vendedor?');
                           If Empty(W_CDVEND) Then
                            begin
                                Application.MessageBox('Você deve digitar um código de vendedor válido.',
                                    'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
                                 M_TENTATIVA := M_TENTATIVA + 1;
                            End
                           else
                           begin
                               M_TESTE  := dmConsultas.GetVendedor(StrtoInt(W_CDVEND));
                               If not (M_TESTE) Then
                                    Application.MessageBox('Vendedor não cadastrado.',
                                      'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL)
                               Else
                                   if uFuncoes.Empty(edtCDVEND.Text) Then
                                       edtCDVEND.Text := uFuncoes.StrZero(W_CDVEND,6);
                           End;
                           //
                           If (M_TENTATIVA > 3) Then
                            begin
                                 M_FLSAIR := true;
                                 Break;
                            End;
                           //
                      End;   // fim-do-enquanto
                    //
                    if (M_FLSAIR) Then
                     begin
                          edtCodigo.Clear;
                          edtCodigo.SetFocus;
                          Exit;
                     End;
               End;
              End;
               // Carrega as variaveis de memoria
               M_CDPROD := cdsProdutos.FieldByName('PRO_CODIGO').AsString;
               M_CDBARR := cdsProdutos.FieldByName('PRO_BARRAS').AsString;
               M_NMPROD := Copy(cdsProdutos.FieldByName('PRO_DESCRICAO').AsString,1,29);
               M_CDUNID := cdsProdutos.FieldByName('UNI_CODIGO').AsString;
               M_CDARMA := cdsProdutos.FieldByName('UNI_ARMAZENAMENTO').AsString;
               M_CDTRIB := cdsProdutos.FieldByName('TRI_CODIGO').AsString;
               M_VLVEND := cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
               M_LIDESC := cdsProdutos.FieldByName('PRO_LIMDESCONTO').AsFloat;
               M_VLFRAC := cdsProdutos.FieldByName('PRO_FRACAO').AsCurrency;
               M_VLCOMP := cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
               M_VLCUST := cdsProdutos.FieldByName('PRO_VLCUSTO').AsCurrency;
               If not uFuncoes.Empty(cdsProdutos.FieldByName('PRO_CODIGOBAIXA').AsString) Then
               begin
                   M_FLBAIX := 'S';
                   M_CDBAIX := cdsProdutos.FieldByName('PRO_CODIGOBAIXA').AsString;
               End
               Else
                   M_FLBAIX := 'N';
               //M_QTPROD := edtQuant.Caption;
               //
               Try
                    InttoStr(StrtoInt(edtQuant.Caption));
                    M_FLFRAC := 'N';
               Except
                    M_FLFRAC := 'S';
               End;
               //
               N_QTPROD := StrtoFloat(edtQuant.Caption);
               //
               M_SUBTOT := M_VLVEND*M_QTPROD;
               //
               pnlDESCRICAO.Caption := M_NMPROD;
               pnlUNID.Caption      := M_CDUNID;
               pnlVLUNIT.Caption    := FormatFloat('#,##0.00',M_VLVEND);
               //
               If (M_FLESTO = 'S') and (M_TESTE = False) Then
               Begin
                    With dmConsultas.qryEstoque do
                    Begin
                         Close;
                         Params.ParamByName('pLOJA').AsInteger  := LOJA(StrtoInt(edtOPERADOR.Text));
                         Params.ParamByName('pCODIGO').AsString := M_CDPROD;
                         Open;
                    End;
                    //
                    If not (dmConsultas.qryEstoque.IsEmpty) Then
                    Begin
                         // Se menor que zero
                         If (dmConsultas.qryEstoque.FieldByName('EST_QUANTIDADE').AsFloat <=0 ) Then
                         Begin
                             Application.MessageBox (PChar('Não há quantidade digitada no estoque !'),
                                'AVISO',MB_ICONSTOP+ MB_OK);
                             //
                             pnlDESCRICAO.Caption := '';
                             pnlUNID.Caption      := '';
                             pnlVLUNIT.Caption    := '';
                             //
                             dmConsultas.qryEstoque.Close;
                             edtCodigo.Clear;
                             edtCodigo.SetFocus;
                             Exit;
                         End;
                         // se Maior que a quant. em estoque
                         If (dmConsultas.qryEstoque.FieldByName('EST_QUANTIDADE').AsFloat < N_QTPROD) Then
                         Begin
                             Application.MessageBox (PCHar('Quantidade digitada maior que '+#13
                                   +'quantidade no estoque !'),
                                'AVISO',MB_ICONSTOP+ MB_OK);
                             //
                             pnlDESCRICAO.Caption := '';
                             edtQuant.Font.Color  := clBlack;
                             edtQuant.Caption     := '1';
                             M_QTPROD := 1;
                             pnlUNID.Caption      := '';
                             pnlVLUNIT.Caption    := '';
                             //
                             dmConsultas.qryEstoque.Close;
                             edtCodigo.Clear;
                             edtCodigo.SetFocus;
                             Exit;
                         End;
                    End
                    Else
                    Begin
                         Application.MessageBox (PChar('Não há produto no estoque !'),
                           'AVISO',MB_ICONSTOP+ MB_OK);
                         //
                         pnlDESCRICAO.Caption := '';
                         pnlUNID.Caption      := '';
                         pnlVLUNIT.Caption    := '';
                         //
                         dmConsultas.qryEstoque.Close;
                         edtCodigo.Clear;
                         edtCodigo.SetFocus;
                         Exit;
                    End;
               End;
                //
                If (M_NRITEM = 0) Then
                     iRetorno := uFiscal.FISCAL('AbriCupom', M_IMPRES);
                If (iRetorno = 1) Then
                    begin
                         M_VLALIQ := uFuncoes.Alltrim(BUSCA_ALIQUOTA(M_CDPROD));

                         Try
                            InttoStr(StrtoInt(edtQuant.Caption));
                            M_FLFRAC := 'N';
                         Except
                            M_FLFRAC := 'S';
                         End;
                         //
                         If (M_FLFRAC = 'S') Then          // 'F' para Fracionária
                               iRetorno := uFiscal.FISCAL('VendaItem', M_IMPRES,
                                     ( M_CDPROD ),
                                     ( M_NMPROD ),
                                     ( M_VLALIQ ),
                                     ( 'F' ),
                                     ( FormatFloat('#,##0.#00',M_QTPROD )),
                                     ('2'),
                                     ( FormatFloat('###,##0.#0',M_VLVEND) ),
                                     ( '%' ),
                                     ( '0000') )
                         Else
                                iRetorno := uFiscal.FISCAL('VendaItem', M_IMPRES,
                                     ( M_CDPROD ),
                                     ( M_NMPROD ),
                                     ( M_VLALIQ ),
                                     ( 'I' ),
                                     ( FloattoStr(M_QTPROD) ),
                                     ('2'),
                                     ( FormatFloat('###,##0.#0',M_VLVEND) ),
                                     ( '%' ),
                                     ( '0000') );
                     End;
               If (iRetorno = 1) Then
               Begin
                     //  Calcula
                     M_TOVEND := uFuncoes.Arredondar(M_TOVEND+(M_QTPROD*M_VLVEND),2);
                     edtTOTAL.Caption := FormatFloat('###,###,##0.00', M_TOVEND);
                     edtQuant.Caption := FloattoStr(M_QTPROD);
                     //
                     INCLUIR_ITEM;
                     //
                     edtQuant.Font.Color:= clBlack;
                     If (dm.CdsConfigCFG_FLLOTE.AsString = 'S') Then
                     begin
                          dm2.cdsLotes.Close;
                          With dm2.dstLotes do
                          Begin
                               Active := False;
                               CommandText := 'Select * from LOTES Where (LOT_PROCODIGO = :pCODIGO) AND (LOT_QUANTIDADE > :pQUANTIDADE)';
                               Params.ParamByName('pCODIGO').AsString    := uFuncoes.StrZero(edtCodigo.Text,13);
                               Params.ParamByName('pQUANTIDADE').AsFloat := 0;
                               Active := True;
                          End;
                          dm2.cdsLotes.Open;
                          //
                          If not (dm2.cdsLotes.IsEmpty) Then
                          begin
                              If (dm2.cdsLotes.RecordCount = 1) Then
                              Begin
                                   dm.cdsItensVendas.Edit;
                                   If (dm.CdsConfigCFG_FLLOTE.AsString = 'S' ) Then
                                         dm.cdsItensVendas.FieldByName('ITE_NRLOTE').AsString := dm2.cdsLotes.FieldByName('LOT_NRLOTE').AsString
                                   Else
                                         dm.cdsItensVendas.FieldByName('ITE_NRLOTE').AsString := 'GERAL';
                                   //
                                   dm.cdsItensVendas.Post;
                              End
                              Else
                              Begin
                                with TfrmSelecionaLote.create(self) do
                                  try
                                     uFrmSeleLote.M_NRFORM := 2;
                                     showmodal;
                                  finally
                                     free;
                                       //
                                     dm.cdsItensVendas.Last;
                                     dm.cdsItensVendas.Edit;
                                     If (dm.CdsConfigCFG_FLLOTE.AsString = 'S' ) Then
                                         dm.cdsItensVendas.FieldByName('ITE_NRLOTE').AsString := M_NRLOTE
                                     Else
                                         dm.cdsItensVendas.FieldByName('ITE_NRLOTE').AsString := 'GERAL';
                                     //
                                     dm.cdsItensVendas.Post;
                                 end;
                              End;
                          End;
                     End;
               End
               Else
               begin
                   iRetorno := uFiscal.FISCAL('CancelaCupom',M_IMPRES);
                     If (iRetorno = 1) Then
                        Begin
                          pnlDESCRICAO.Caption := '';
                          pnlUNID.Caption      := '';
                          pnlVLUNIT.Caption    := '';
                          lblCodigo.Caption    := '&Codigo:';
                          edtQuant.Caption     := '1';
                          edtCodigo.Text       := '';
                          edtTotal.Caption     := '0,00';
                          //
                          LIMPA('1');
                          Exit;
                        End;
               End;
               //limpa o edtCodigo e coloca o foco nele.
               edtCodigo.Clear;
               edtCodigo.SetFocus;
           End;               // fim da Procurar produto
         Except
             on Exc:Exception do
             begin
                  Application.MessageBox(PChar('Error na inclusão do item!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   //
                   If (M_FLVEND  = True) Then
                   begin
                     iRetorno := uFiscal.FISCAL('CancelaCupom', M_IMPRES);
                     //
                     If (iRetorno = 1) Then
                        Begin
                          pnlDESCRICAO.Caption := '';
                          pnlUNID.Caption      := '';
                          pnlVLUNIT.Caption    := '';
                          lblCodigo.Caption    := '&Codigo:';
                          edtQuant.Caption     := '1';
                          edtCodigo.Text       := '';
                          edtTotal.Caption     := '0,00';
                          //
                          LIMPA('1');
                        End;
                   End;
                   //
                   M_FLVEND := False;
                   //
                   If (graCaixaLivre.Visible = False) Then
                   begin
                       edtCodigo.Clear;
                       edtCodigo.SetFocus;
                   End;
             End;
         End;
      End;      //Pressionamento de ENTER
end;

procedure TfrmVendas.edtCodigoChange(Sender: TObject);
begin
        If (edtCodigo.text='*') or (edtCodigo.text=',') Then
             edtCodigo.text:='';
end;

procedure TfrmVendas.INCLUIR_ITEM;
Var
   Tot:Real;
   Lin1:String;
   cNumItem,cCdProd,cDescric:String;
   Lin2,Lin3:String;
   cQuant,cUnidade,cValorUn,cSubTot :String;
   M_FLDECI : Integer;
begin
     //
     If (edtCodigo.Text <>' ') and (edtCodigo.Text<>'0') Then
     begin
        try
              // Adionar o nº de itens.
              M_NRITEM := M_NRITEM+1;
                    // Atribui valores a variaveis locais
                    cNumItem := StrZero(InttoStr(M_NRITEM),03);
                    // Atribui valores das variaveis nas linhas
                    If not (Dm.cdsItensVendas.Active) Then
                       Dm.cdsItensVendas.Open;
                    //
                    With Dm.cdsItensVendas do
                        Begin
                             Append;
                             FieldByName('ITE_NRITEN').AsString := cNumItem;
                             FieldByName('ITE_CDITEN').AsString := M_CDPROD;
                             FieldByName('ITE_NMDESC').AsString := M_NMPROD;
                             FieldByName('ITE_CDUNID').AsString := M_CDUNID;
                             FieldByName('ITE_QTITEN').AsCurrency := M_QTPROD;
                             FieldByName('ITE_VLUNIT').AsCurrency := M_VLVEND;
                             FieldByName('ITE_VLCOMP').AsCurrency := M_VLCOMP;
                             FieldByName('ITE_VLCUST').AsCurrency := M_VLCUST;
                             FieldByName('ITE_NRLOTE').AsString   := 'GERAL';
                             If (M_FLBAIX = 'S') Then
                                 FieldByName('ITE_CDBAIX').AsString := M_CDBAIX;
                             if not Empty(W_CDVEND) Then
                                 FieldByName('ITE_VENDEDOR').AsInteger := StrtoInt(W_CDVEND);
                             Post;
                        End;
                        //
                        M_QTPROD := 1;
                        // desabilita Menus
                        mnuCancelarItemAnterior.Enabled     := True;
                        mnuItemGenericoItem.Enabled := True;
                        mnuCancelarmentodeCupomItem.Enabled := True;
                        //
                        mnuLeituraXItem.Enabled     := False;
                        mnuReducaoZItem.Enabled     := False;
                        mnuMemoriaFiscalItem.Enabled  := False;
        Except
             on Exc:Exception do
             begin
                  Application.MessageBox(PChar('Error na inclusão do item!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                  //
                  If (M_FLVEND  = True) Then
                   begin
                     iRetorno := uFiscal.FISCAL('CancelaCupom', M_IMPRES);
                     //
                     If (iRetorno = 1) Then
                        Begin
                          pnlDESCRICAO.Caption := '';
                          pnlUNID.Caption      := '';
                          pnlVLUNIT.Caption    := '';
                          lblCodigo.Caption    := '&Codigo:';
                          edtQuant.Caption     := '1';
                          edtCodigo.Text       := '';
                          edtTotal.Caption     := '0,00';
                          //
                          LIMPA('1');
                        End;
                   End;
             End;
        End;
     end;
end;

procedure TfrmVendas.mnuCancelarItemAnteriorClick(Sender: TObject);
begin
   If (M_FLVEND = True) Then
   begin
        Dm.cdsItensVendas.Last;
        If (Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString <> 'C') Then
          Begin
              iRetorno := uFiscal.FISCAL('CancelaItemAnterior', M_IMPRES);
              If (iRetorno = 1) Then
                  Begin
                      Dm.cdsItensVendas.Edit;
                      Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString := 'C';
                      Dm.cdsItensVendas.Post;
                      //
                      M_TOVEND := Arredondar(M_TOVEND-M_SUBTOT,2);
                      edtTOTAL.Caption := FormatFloat('###,###,##0.00',M_TOVEND);
                  End;
          End
          Else
          begin
              Application.MessageBox (Pchar('O item '+uFuncoes.StrZero(InttoStr(M_NRITEM),3)
                  +' já foi cancelado!!!'),'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
              Exit;
          End;
   End
   Else
       Application.MessageBox (PChar('Não há venda aberta !'),
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
end;

procedure TfrmVendas.mnuItemGenericoItemClick(Sender: TObject);
Var
   W_NRITEM : String;
   W_VLTOIT : Double;
begin
   If (M_FLVEND = True) Then
   begin
        W_NRITEM := InputBox('Cancelar item', 'Digite o número do item?', '');
        Try
             StrtoInt(W_NRITEM);
             W_NRITEM := uFuncoes.StrZero(Copy(W_NRITEM,1,3),3);
        Except
              Application.MessageBox (Pchar('Cancelamento de item não executado !'),
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
              Exit;
        End;
        //
        If (Dm.cdsItensVendas.Locate('ITE_NRITEN',W_NRITEM,[])) Then
        Begin
            If (Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString <> 'C') Then
            Begin
                iRetorno := uFiscal.FISCAL('CancelaItemGenerico',M_IMPRES, W_NRITEM);
                If (iRetorno = 1) Then
                    Begin
                        Dm.cdsItensVendas.Edit;
                        Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString := 'C';
                        Dm.cdsItensVendas.Post;
                        //
                        Dm.cdsItensVendas.DisableControls;
                        Dm.cdsItensVendas.First;
                        M_TOVEND := 0;
                        //
                        While not (Dm.cdsItensVendas.Eof) do
                        Begin
                             If (Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString <> 'C') Then
                             M_TOVEND := M_TOVEND + Arredondar(Dm.cdsItensVendas.FieldByName('ITE_VLSUBT').AsCurrency ,2);
                             //
                             Dm.cdsItensVendas.Next;
                        End;
                        //
                        Dm.cdsItensVendas.EnableControls;
                        //
                        edtTOTAL.Caption := FormatFloat('###,###,##0.00',M_TOVEND);
                    End;
            End
            Else
            begin
                Application.MessageBox ( Pchar('O item '+Dm.cdsItensVendas.FieldByName('ITE_NRITEN').AsString
                    +' já foi cancelado!!!'),'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
                Exit;
            End;
        End
        Else
        begin
             Application.MessageBox (Pchar('O item '+uFuncoes.StrZero(W_NRITEM,3)
                   +' não existe!!!'),'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
             Exit;
        End;
   End
   Else
       Application.MessageBox (PChar( 'Não há venda aberta !'),
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
end;

procedure TfrmVendas.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      // Se pressionar F2.
      if (key = vk_F2)  then
      begin
           {If uFuncoes.Empty(edtCDVEND.Text) Then
           Begin
               MessageBox (Application.Handle, 'Digite o código do vendedor!!!',
                 'ATENÇÃO',MB_ICONSTOP+ MB_OK+MB_APPLMODAL);
               edtCDVEND.SetFocus;
               Exit;
           End;}
           //
           If (M_TOVEND = 0) and (M_FLVEND = True) Then
           begin
               edtCodigo.SetFocus;
               exit;
           end;
           //
      end;
end;

procedure TfrmVendas.COMPONENTES_INVISIVEL(Estado: String);
begin
     If (Estado = '1') Then
     begin
           frmVendas.pnlUNID.Enabled      := True;
           frmVendas.edtQuant.Enabled     := True;
           frmVendas.pnlVLUNIT.Enabled    := True;
           frmVendas.GridItens.Enabled    := True;
           frmVendas.pnCDBARRAS.Enabled   := True;
           frmVendas.edtCodigo.Enabled    := True;
           //
           frmVendas.edtTOTAL.Caption  := FormatFloat('###,##0.00',M_TOVEND);
     End
     Else
     begin
           frmVendas.pnlUNID.Enabled      := False;
           frmVendas.edtQuant.Enabled     := False;
           frmVendas.pnlVLUNIT.Enabled    := False;
           frmVendas.GridItens.Enabled    := False;
           frmVendas.pnCDBARRAS.Enabled   := False;
           frmVendas.edtCodigo.Enabled    := False;
     End;
end;

procedure TfrmVendas.Timer1Timer(Sender: TObject);
begin
     StatusBar1.Panels[2].Text := 'Data/Hora : '+DatetoStr(Date)+' - '+TimetoStr(Time);
end;

procedure TfrmVendas.edtCDVENDExit(Sender: TObject);
begin
      If not uFuncoes.Empty(edtCDVEND.Text) Then
      Begin
           With dmConsultas.cdsVendedor do
           Begin
                Active := False;
                Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDVEND.Text);
                Active := True;
           End;
           //
           If (dmConsultas.cdsVendedor.IsEmpty) Then
           Begin
                Application.MessageBox (PChar('Código de vendedor não cadastrado !'),
                    'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
               dmConsultas.cdsVendedor.Close;
               edtCDVEND.Clear;
               edtCDVEND.SetFocus;
               Exit;
           End
           Else
           Begin
               W_NMVEND := dmConsultas.cdsVendedor.FieldByName('FUN_NOME').AsString;
               //
               edtCDVEND.Text := uFuncoes.StrZero(edtCDVEND.Text,6);
               If (graCaixaLivre.Visible = False) Then
                   edtCodigo.SetFocus
               Else
                  btNovaVenda.SetFocus;
           End;
      End;
end;

procedure TfrmVendas.edtCDVENDKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8,#13,#27] ) then
          key:=#0;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDVEND.Text) Then
     Begin
          Key := #0;
          //
           With dmConsultas.cdsVendedor do
           Begin
                Close;
                Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDVEND.Text);
                Open;
           End;
           //
           If (dmConsultas.cdsVendedor.IsEmpty) Then
           Begin
                Application.MessageBox (PChar('Código de vendedor não cadastrado !'),
                    'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
               dmConsultas.cdsVendedor.Close;
               edtCDVEND.Clear;
               edtCDVEND.SetFocus;
               Exit;
           End
           Else
               edtCodigo.SetFocus;
     End;
end;

procedure TfrmVendas.GridItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
end;

procedure TfrmVendas.mnuCancelarmentodeCupomItemClick(Sender: TObject);
begin
         If (Application.MessageBox('Confirma cancelamento de venda?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes) Then
         begin
              iRetorno := uFiscal.FISCAL('CancelaCupom', M_IMPRES);
              //
              If (iRetorno = 1) Then
                  Begin
                      pnlDESCRICAO.Caption := '';
                      pnlUNID.Caption      := '';
                      pnlVLUNIT.Caption    := '';
                      lblCodigo.Caption    := '&Codigo:';
                      edtQuant.Caption     := '1';
                      edtCodigo.Text       := '';
                      edtTotal.Caption     := '0,00';
                      //
                      LIMPA('1');
              End;
         End;
end;

procedure TfrmVendas.mnuMemoriaFiscalItemClick(Sender: TObject);
begin
     If (M_FLVEND = False) Then
     Begin
          with TfrmMemoriaFiscal.create(self) do
            try
               showmodal;
            finally
               free;
             end;
     End
     Else
     begin
          Application.MessageBox (PChar('Você tem que fechar a venda atual!!!'),
                'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
          Exit;
     End;
end;

function TfrmVendas.LOJA(W_CDCAIX : integer) : Integer;
begin
     With dmConsultas.qryCaixa do
     begin
          Close;
          Params.ParamByName('pCAIXA').AsInteger    := W_CDCAIX;
          Params.ParamByName('pSITUACAO').AsString  := 'A';
          Open;
     End;
     //
     result := dmConsultas.qryCaixa.FieldbyName('CAI_LOJA').AsInteger;
end;

function TfrmVendas.IMPRESSORA(W_CDCAIX : integer): Integer;
begin
     With dmConsultas.qryImpressoraCaixa do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger := W_CDCAIX;
          Open;
     End;
     //
     If (dmConsultas.qryImpressoraCaixa.FieldByName('SEN_FLIMPRESSORA').AsString = '1') Then
         result := dmConsultas.qryImpressoraCaixa.FieldByName('SEN_ECF').AsInteger
     Else
         result := 0;
end;

function TfrmVendas.BUSCA_ALIQUOTA(W_CDPROD: String): String;
begin
     With dmConsultas.qryAliquota do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsString := W_CDPROD;
          Open;
     End;
     //
     if not (dmConsultas.qryAliquota.IsEmpty)  then
        result := dmConsultas.qryAliquota.FieldByName('TRI_INDICE_ECF').AsString
     else
        result := ufuncoes.Replicate(' ',4);
end;

procedure TfrmVendas.mnuCancelarltimoCupomItemClick(Sender: TObject);
begin
     Try
        iRetorno := uFiscal.FISCAL('CancelaCupom', M_IMPRES);
        //
        if (iRetorno = 1) Then
          Begin
               pnlDESCRICAO.Caption := '';
               pnlUNID.Caption      := '';
               pnlVLUNIT.Caption    := '';
               lblCodigo.Caption    := '&Codigo:';
               edtQuant.Caption     := '1';
               edtCodigo.Text       := '';
               edtTotal.Caption     := '0,00';
               //
               mnuCancelarltimoCupomItem.Enabled := False;
               LIMPA('1');
          End;
     Except

     End;
end;

procedure TfrmVendas.CANCELA_VENDA;
begin
     If (M_NRITEM > 0) Then
         iRetorno := uFiscal.FISCAL('CancelaCupom', M_IMPRES)
     Else
         iRetorno := 1;
         //
         If (iRetorno = 1) Then
         Begin
            //
            pnlDESCRICAO.Caption :='';
            pnlUNID.Caption :='';
            pnlVLUNIT.Caption :='';
            lblCodigo.Caption :='&Codigo:';
            edtQuant.Caption :='1';
            edtCodigo.Text := '';
            edtTotal.Caption := '0,00';
            LIMPA('1');
         End;
end;

procedure TfrmVendas.edtMesaKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8,#13,#27] ) then
          key:=#0;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDVEND.Text) Then
     Begin
          Key := #0;
          //
           With dmConsultas.cdsVendedor do
           Begin
                Close;
                Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDVEND.Text);
                Open;
           End;
           //
           
     End;

end;

function TfrmVendas.InputBoxVendedor(const ACaption,
  APrompt: string): string;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: string;
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  Result := '';
  Form := TForm.Create(Application);
  with Form do
  try
    Canvas.Font := Font;
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
    DialogUnits.X := DialogUnits.X div 52;
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(180, DialogUnits.X, 4);
    ClientHeight := MulDiv(63, DialogUnits.Y, 8);
    Position := poScreenCenter;
    Prompt := TLabel.Create(Form);
    with Prompt do
    begin
      Parent := Form;
      AutoSize := True;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Caption := APrompt;
    end;
    Edit := TEdit.Create(Form);
    with Edit do
    begin
      Parent := Form;
      Left := Prompt.Left;
      Top := MulDiv(19, DialogUnits.Y, 8);
      Width := MulDiv(164, DialogUnits.X, 4);
      MaxLength := 3;
      //PasswordChar := '*';
      SelectAll;
    end;
    ButtonTop := MulDiv(41, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'OK';
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'Cancel';
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    if ShowModal = mrOk then
    begin
      Value := Edit.Text;
      Result := Value;
    end;
  finally
    Form.Free;
    Form:=nil;
  end;
end;

end.
