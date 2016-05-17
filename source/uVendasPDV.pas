unit uVendasPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, Mask, ToolEdit, CurrEdit,
  Grids, DBGrids, DB, Gradient, RXCtrls, FMTBcd, SqlExpr, DBClient;

type
  TfrmVenda = class(TForm)
    pnlSuperior: TPanel;
    lblNVenda: TLabel;
    ListBox2: TListBox;
    ListBox1: TListBox;
    lblNomePro: TLabel;
    pnlDESCRICAO: TPanel;
    lblUnidade: TLabel;
    pnlUNID: TPanel;
    edtQuant: TPanel;
    lblQuant: TLabel;
    pnlVLUNIT: TPanel;
    lblValor: TLabel;
    lblListaPro: TLabel;
    pnCDBARRAS: TPanel;
    edtCodigo: TEdit;
    imgCodBar: TImage;
    lblCodigo: TLabel;
    imgMoedas: TImage;
    edtTOTAL: TPanel;
    lblTotal: TLabel;
    bdtN_Venda: TLabel;
    imgDinheiro: TImage;
    lblFormaPg: TLabel;
    btNovaVenda: TBitBtn;
    lbl_Cancela: TLabel;
    lbl_ESC: TLabel;
    qryMovProduto: TSQLQuery;
    qryItensTemp: TSQLQuery;
    qryProdutos: TSQLQuery;
    qryProdutosPRO_CDPROD: TStringField;
    qryProdutosPRO_CDBARR: TStringField;
    qryProdutosPRO_NMPROD: TStringField;
    qryProdutosPRO_CDTRIB: TStringField;
    qryProdutosPRO_CDUNID: TStringField;
    qryProdutosPRO_VLVEND: TFloatField;
    rxlCaixaLivre: TRxLabel;
    graCaixaLivre: TGradiente;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure edtDinheiroKeyPress(Sender: TObject; var Key: Char);
    procedure edtDinheiroExit(Sender: TObject);
    procedure edtChequeExit(Sender: TObject);
    procedure edtChequeKeyPress(Sender: TObject; var Key: Char);
    procedure edtCartaoExit(Sender: TObject);
    procedure edtCartaoKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure btNovaVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtVLDESCExit(Sender: TObject);
    procedure edtVLDESCKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtCartaoChange(Sender: TObject);
    procedure edtQTPARCExit(Sender: TObject);
    procedure edtQTPARCChange(Sender: TObject);
    procedure edtDescontoPercKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoPercChange(Sender: TObject);
  private
    { Private declarations }
  public
     procedure LIMPA_TELA;
     procedure INICIA_VALORES;
     procedure ListDados;
     procedure NOVA_VENDA;
     procedure COMPONENTES_INVISIVEL(Estado : String);
     procedure LIMPA(Estado : String);
    { Public declarations }
  end;

var
  frmVenda: TfrmVenda;
  M_QTPROD: double;
  M_CDPROD, M_NMPROD,M_CDUNID : String;
  M_FLPROD, M_CDTRIB, M_TPDESC : String;
  M_NRVEND, M_CDBARR, M_TPQUAN  : String;
  M_NRSEQU, M_TPMOVI, M_VLTRIB, M_CDMODA, M_NMMODA : String;
  M_VLVEND, M_VLDESC, M_SUBTOT,M_TOVEND, W_VLVEND : Real;
  M_VLTROC, M_VLMODA,M_VLSUBT : Real;
  iRetorno,M_DECIMAL,M_NRITEM : Integer;
  M_FLVEND, M_FLCAAT, M_FLDESC : Boolean;
  M_VLDINH,M_VLCHEQ,M_VLCART,M_TOENTR : Double;
  M_MDDINH,M_MDCHEQ,M_MDCART : String;

implementation

Uses uFuncoes,uBematech, uFormaPagamento, Udm, UFrmAdmin;

{$R *.dfm}

procedure TfrmVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{     dmPDV.cdsProdutos.Close;
     dmPDV.cdsParametros.Close;
     dmPDV.cdsVendas.Close;
     dmPDV.cdsVendas.Close;
     dmPDV.cdsMovProduto.Close;
     dmPDV.cdsMovCaixa.Close;
     dmPDV.cdsTributacao.Close;
     dmPDV.cdsVendas.Close;
     //dmPDV.tbTemp.Close;
     //
     frmPrincipal.CoolBar1.Visible := True;
     frmPrincipal.mnuVendaItem.Enabled := True;
     frmPrincipal.Menus('2');
     uFuncoes.Limpar_Status;
     //
     frmPrincipal.mnuCancelarItem.Enabled := False;
     frmPrincipal.mnuItemGenericoItem.Enabled := False;
     frmPrincipal.mnuCancelarmentoCupomItem.Enabled := False;}
     //
     Action := caFree;
end;

procedure TfrmVenda.edtCodigoChange(Sender: TObject);
begin
        If (edtCodigo.text='*') or (edtCodigo.text=',') Then
             edtCodigo.text:='';
end;

procedure TfrmVenda.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
      If not( key in['0'..'9',#8,#13,#42,','] ) then
          key:=#0;
      // Se digita o "*" e o edtCodigo estive em branco.
      If (key = #42) and (edtCodigo.Text='') Then
          key:=#0;
      //
      If (key =#13) and (uFuncoes.Empty(edtCodigo.Text)) Then
      begin
           key:=#0;
           {Application.CreateForm(TfrmLocalizaProduto, frmLocalizaProduto); //Carrega form na memória
           try
               frmLocalizaProduto.ShowModal;
           Finally
               frmLocalizaProduto.Free;                              //Libera Memória
           End;}
      End;
      // Se digita o "*"
      If (key = #42) Then
      begin
          edtQuant.Font.Color := clRed;
          //Remove o asterisco do edtCodigo.
          M_QTPROD  := StrtoFloat(edtCodigo.Text);
          edtQuant.Caption :=edtCodigo.Text;
          edtCodigo.SetFocus;
          edtCodigo.text:='';
          exit;
      end;
      // Pressione o ENTER.
      If (Key = #13) Then
      Begin
         key := #0;
         Try
           //Procura_Produto
           If Not(Dm.cdsProdutos.Active) Then        // Se estiver fechado
                  Dm.cdsProdutos.Open;              // Abre.
           //
           edtCodigo.text := Format('%13S',[uFuncoes.StrZero(edtCodigo.text,13)]);
           //
           With qryProdutos do
           begin
                //SQL.Clear;
                Close;
                //SQL.Add('Select * from SACPRO Where PRO_CDBARR='+quotedstr(edtCodigo.text));
                Params.ParamByName('pCDPROD').AsString := edtCodigo.text;
                Open;
           End;
           //
           If not (qryProdutos.Locate('PRO_CDBARR',edtCodigo.Text,[])) Then
           begin
                 MessageBox (Application.Handle, 'Produto não cadastrado.',
                            'AVISO',MB_ICONSTOP+ MB_OK);
                 edtCodigo.Clear;
                 edtCodigo.SetFocus;
                 Exit;
           End
           Else
           Begin
               // Carrega as variaveis de memoria
               M_CDPROD := qryProdutos.FieldByName('PRO_CDPROD').AsString;
               M_CDBARR := qryProdutos.FieldByName('PRO_CDBARR').AsString;
               M_NMPROD := qryProdutos.FieldByName('PRO_NMPROD').AsString;
               M_CDUNID := qryProdutos.FieldByName('PRO_CDUNID').AsString;
               //M_QTPROD := edtQuant.Caption;
               //M_FLPROD
               //
               Try
                    InttoStr(StrtoInt(edtQuant.Caption));
                    M_FLPROD := 'N';
               Except
                    M_FLPROD := 'S';
               End;
               //
               M_VLVEND := qryProdutos.FieldByName('PRO_VLVEND').AsCurrency;
               M_CDTRIB := qryProdutos.FieldByName('PRO_CDTRIB').AsString;
               //
               {If (Dm.cdsTributacao.Locate('TRI_CDTRIB',M_CDTRIB,[])) Then
                   M_VLTRIB := Dm.cdsTributacao.FieldByName('TRI_INDECF').AsString
               Else}
                   M_VLTRIB := 'FI';
               //
               M_SUBTOT := M_VLVEND*M_QTPROD;
               //
               pnlDESCRICAO.Caption := M_NMPROD;
               pnlUNID.Caption      := M_CDUNID;
               pnlVLUNIT.Caption    := FormatFloat('#,##0.00',M_VLVEND);
               //
               //edtDescontoPerc.ReadOnly := False;
               //edtDescontoPerc.SetFocus;
               // Verifica se a impressora está conectada.
               {iRetorno := Bematech_FI_VerificaImpressoraLigada();
               uBematech.Analisa_iRetorno();
               uBematech.Retorno_Impressora();
               //
               If iRetorno = 1 then
               begin
                   // Tipo de Decimal com 2 para duas casas
                   M_DECIMAL := 2;
                   // Verifica o Tipo de Desconto: '%' para percentual ou '$' para valor
                   M_TPDESC := '%';
                   //M_TPDESC := '$';
                   //  Verifica o Tipo da Quantidade: E vende o item.
                   If M_FLPROD = 'S' Then          // 'F' para Fracionária
                   begin
                        M_TPQUAN := 'F';
                        iRetorno  := uBematech.Bematech_FI_VendeItem( pchar(M_CDPROD), pchar(M_NMPROD), pchar(M_VLTRIB),
                                     pchar(M_TPQUAN), pchar(FormatFloat('#,##0.000',M_QTPROD)),M_DECIMAL,pchar(pnlVLUNIT.Caption),
                                     pchar(M_TPDESC), pchar('0000'));
                   End
                   Else
                   begin                          // 'I' para Inteira
                        M_TPQUAN := 'I';
                        iRetorno  := uBematech.Bematech_FI_VendeItem( pchar(M_CDPROD), pchar(M_NMPROD), pchar(M_VLTRIB),
                                     pchar(M_TPQUAN), pchar(FormatFloat('###',M_QTPROD)), M_DECIMAL,pchar(pnlVLUNIT.Caption),
                                     pchar(M_TPDESC), pchar('0000'));
                   End;
                   //
                   uBematech.Analisa_iRetorno();
                   uBematech.Retorno_Impressora();
                   //
                   If iRetorno = 1 then
                   begin
                        //  Calcula
                        M_TOVEND := uFuncoes.Arredondar(M_TOVEND+(M_QTPROD*M_VLVEND),2);
                        edtTOTAL.Caption := FormatFloat('###,###,##0.00', M_TOVEND);
                        edtQuant.Caption := FloattoStr(M_QTPROD);
                        //limpa o edtCodigo e coloca o foco nele.
                        edtCodigo.Clear;
                        edtCodigo.SetFocus;
                        //
                        ListDados;
                        //
                        edtQuant.Font.Color:= clBlack;
                        edtCodigo.SetFocus;
                   End      // Fim-do-retorno do vende Item
                   Else
                   begin
                        ShowMessage('Retorno : '+InttoStr(iRetorno));
                        edtQuant.Font.Color:= clBlack;
                        edtCodigo.Clear;
                        edtCodigo.SetFocus;
                        Exit;
                   End;
               End;           // Fim-do-Retorno da VerificaImpressoraLigada}
           End;               // fim da Procurar produto
         Except
              MessageBox (Application.Handle, 'Error na inclusão do item!!!',
                            'ERROR',MB_ICONSTOP+ MB_OK);
              //
               iRetorno := uBematech.Bematech_FI_CancelaCupom();
               uBematech.Analisa_iRetorno();
               //Retorno_Impressora();
               //
               M_FLVEND := False;
              //
              edtCodigo.Clear;
              edtCodigo.SetFocus;
         End;
      End;      //Pressionamento de ENTER
end;

procedure TfrmVenda.ListDados;
Var
   Tot:Real;
   Lin1:String;
   cNumItem,cCdProd,cDescric:String;
   Lin2,Lin3:String;
   cQuant,cUnidade,cValorUn,cSubTot:String;
begin
     //
     If (edtCodigo.Text <>' ') and (edtCodigo.Text<>'0') Then
     begin
          // Adionar o nº de itens.
          M_NRITEM := M_NRITEM+1;
          // Atribui valores a variaveis locais
          cNumItem := StrZero(InttoStr(M_NRITEM),03);
          cCdProd  := qryProdutos.FieldByName('PRO_CDPROD').AsString;
          cDescric := qryProdutos.FieldByName('PRO_NMPROD').AsString;
          // Sub-Total.
          Tot:= StrtoFloat(edtQuant.Caption)*qryProdutos.FieldByName('PRO_VLVEND').AsFloat;
          cQuant   := FloattoStr(M_QTPROD);
          cUnidade := Alltrim(qryProdutos.FieldByName('PRO_CDUNID').AsString);
          cValorUn := 'R$ '+FormatFloat('###,##0.00',
                      StrtoFloat(qryProdutos.FieldByName('PRO_VLVEND').AsString));
          cSubTot  := 'R$ '+FormatFloat('###,##0.00',uFuncoes.Arredondar(Tot,2));
          // Atribui valores das variaveis nas linhas
          Lin1 := cNumItem+'   '+cCdProd+'   '+cDescric;
          Lin2 := Padr(cQuant,4)+'      '+Padr(cUnidade,5)+'       '+cValorUn+'     '
               +Padr(cSubTot,12);
       //Lin2:= Replicate(Chr(32),02)+Padr(cQuant,6)+Replicate(Chr(32),15)+Padr(cUnidade,5)+
       //       Replicate(Chr(32),15)+Padr(cValorUn,12)+Replicate(Chr(32),20)+Padr(cSubTot,12);

       //Lin2:= Replicate(Chr(32),02)+Format('%5s',[cQuant])+Replicate(Chr(32),15)+Format('%5s',[cUnidade])+
       //       Replicate(Chr(32),15)+Format('%12s',[cValorUn])+Replicate(Chr(32),20)+Format('%12s',[cSubTot]);
       Lin3:= Replicate(Chr(45),120);
       {  Carrega o listBox com os dados}
       ListBox1.Items.Add(Lin1);
       ListBox1.Items.Add(Lin2);
       ListBox1.Items.Add(Lin3);
       ListBox2.Items.Add(Lin1);
       ListBox2.Items.Add(Lin2);
       // Desconto
       If (M_FLDESC = True) Then
       begin
            ListBox2.Items.Add('  '+'Desconto'+'   '+FormatFloat('##0.#0',M_VLDESC*100));
       End;
       // Seleciona o ultimo item do listBox.
       ListBox1.ItemIndex :=ListBox1.Items.Count - 1;
       // Inclui o novo item na venda.
       With qryMovProduto do
       begin
            SQL.Clear;
            Close;
            SQL.Add('INSERT INTO SACMOP (MOP_NRVEND, MOP_NRITEM, MOP_CDPROD, MOP_QTPROD, MOP_VLPROD, MOP_VLDESC)');
            SQL.Add('VALUES (:pNRVEND, :pNRITEM, :pCDPROD, :pQTPROD, :pVLPROD, :pVLDESC)');
            //
            Params[0].AsString := StrZero(M_NRVEND,7);                 // MOP_NRVEND
            Params[1].AsString := cNumItem;                            // MOP_NRITEM
            Params[2].AsString := M_CDPROD;                            // MOP_CDPROD;
            Params[3].AsFloat  := M_QTPROD;                            // MOP_QTPROD;
            Params[4].AsFloat  := M_VLVEND;                            // MOP_VLVEND;
            Params[5].AsFloat  := M_VLDESC;                            // MOP_VLDESC;
            ExecSQL;
       End;
       // Tabela temporaria
       With qryItensTemp do
       begin
            SQL.Clear;
            Close;
            SQL.Add('INSERT INTO SACTMP (ITE_NRITEM, ITE_NRVEND, ITE_CDPROD, ITE_VLVEND, ITE_QTITEM, ITE_FLCANC, ITE_TOITEM)');
            SQL.Add('VALUES (:pNRITEM, :pNRVEND, :pCDPROD, :pVLVEND, :pQTITEM, :pFLCANC, :pTOITEM )');
            //
            Params[0].AsString := StrZero(InttoStr(M_NRITEM),3);       // ITE_NRITEM;
            Params[1].AsString := StrZero(M_NRVEND,7);                 // ITE_NRVEND;
            Params[2].AsString := M_CDPROD;                            // ITE_CDPROD;
            Params[3].AsFloat  := M_VLVEND;                            // ITE_VLVEND;
            Params[4].AsFloat  := M_QTPROD;                            // ITE_QTPROD;
            Params[5].AsString := 'N';                                 // ITE_FLCANC;
            Params[6].AsFloat  := M_VLVEND*M_QTPROD;                   // ITE_TOITEM;
            ExecSQL;
       End;
       //
       M_QTPROD := 1;
       M_FLCAAT := False;
       // desabilita Menus
       {frmPrincipal.mnuCancelarItem.Enabled     := True;
       frmPrincipal.mnuItemGenericoItem.Enabled := True;}
   end;
end;

procedure TfrmVenda.FormActivate(Sender: TObject);
begin
     //
     If (M_FLVEND = false) Then
     begin
           ListBox1.Clear;
           ListBox2.Clear;
           pnlDESCRICAO.Caption :='';
           pnlUNID.Caption :='';
           pnlVLUNIT.Caption :='';
           lblCodigo.Caption :='&Codigo:';
           edtQuant.Caption :='1';
           edtCodigo.Text := '';
           edtTotal.Caption := '0,00';
           bdtN_Venda.Caption := ' ';
           frmVenda.INICIA_VALORES;
           // desabilita Menus
           {frmPrincipal.mnuCancelarItem.Enabled     := False;
           frmPrincipal.mnuItemGenericoItem.Enabled := False;
           frmPrincipal.mnuCancelarmentoCupomItem.Enabled := False;}
     End;
     //
end;

procedure TfrmVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      // Se pressionar F2.
      if (key = vk_F2)  then
      begin
           If (M_TOVEND = 0) Then
           begin
               MessageBox (Application.Handle, 'Total igual a (0) ZERO.',
               'Aviso',MB_ICONSTOP+ MB_OK);
               exit;
           end;
           //
           If (M_FLVEND = True) Then
           begin
                Application.CreateForm(TfrmFormaPagamento, frmFormaPagamento); // Carrega form na memória
                try
                   pnlSuperior.Color := clGray;
                   //COMPONENTES_INVISIVEL('2');
                   W_VLVEND := M_TOVEND;
                   frmFormaPagamento.ShowModal;
                Finally
                   frmFormaPagamento.Free;                              //Libera Memória
                End;
                //
                //
                //(FrmPrincipal.Width Div 2) - (pnlFormaPag.Width Div 2);
                //pnlFormaPag.Top    := 410;
                //(FrmPrincipal.Height Div 2) - (pnlFormaPag.Height Div 2 + FrmPrincipal.StatusBar1.Height);
                //txtTOENTR.Caption := '0,00';
                //txtTROCO.Caption  := '0,00';
                //
                //edtVLDESC.Clear;
                //edtVLDESC.SetFocus;
                //frmFormaPagamento.edtDinheiro.SetFocus;
                //exit;
           end
           else
           begin
               MessageBox (Application.Handle, 'Você têm que abrir uma nova venda!!!',
               'Aviso',MB_ICONSTOP+ MB_OK);
               exit;
           end;
      end;
End;

procedure TfrmVenda.NOVA_VENDA;
begin
    Try
       Screen.Cursor := crHourGlass;
            //uFuncoes.EsvaziaTabela(Dm.tbTemp);
            // Abre o cupom fiscal na impressora.
            iRetorno := uBematech.Bematech_FI_AbreCupom(pchar(''));
            uBematech.Analisa_iRetorno();
            //uBematech.Retorno_Impressora();
            // menu
            //frmPrincipal.mnuCancelarmentoCupomItem.Enabled := True;
            //
            {If iRetorno = 1 then
            begin}
                  If (Dm.CdsConfig.Active = False) Then
                      Dm.CdsConfig.Open;
                  //
                  Dm.CdsConfig.edit;
                  Dm.CdsConfig.FieldByName('PAR_NRVEND').AsFloat :=
                            Dm.CdsConfig.FieldByName('PAR_NRVEND').AsFloat+1;
                  Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsFloat :=
                            Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsFloat+1;
                  //
                  Dm.CdsConfig.Post;
                  Dm.CdsConfig.ApplyUpdates(0); 
                  //
                  M_NRVEND := StrZero(Dm.CdsConfig.FieldByName('PAR_NRVEND').AsString,7);
                  //
                  M_QTPROD  := 1;
                  M_NRITEM  := 0;
                  M_FLCAAT  := True;
                  //Zera o troco e o Total
                  M_VLTROC  := 0;
                  M_TOVEND  := 0;
                  M_VLVEND  := 0;
                  M_FLVEND  := True;
                  // Limpa Area de Trabalho
                  //LIMPA_TELA;
                  //
                  bdtN_Venda.Caption := M_NRVEND;
                  edtCodigo.Enabled :=  True;
                  edtCodigo.SetFocus;
            //End;      // fim-do-retorno abre cupom
            Screen.Cursor := crDefault;
            Application.ProcessMessages;
    Except
          Application.MessageBox('Erro ao tentar iniciar uma nova venda!!!',
                                 'ATENÇÃO', MB_OK+MB_ICONQUESTION);
          {If (M_FLVEND = True) Then
          begin}
              iRetorno := uBematech.Bematech_FI_CancelaCupom();
              uBematech.Analisa_iRetorno();
              //uBematech.Retorno_Impressora();
              //
              frmVenda.ListBox1.Clear;
              frmVenda.ListBox2.Clear;
              frmVenda.pnlDESCRICAO.Caption :='';
              frmVenda.pnlUNID.Caption :='';
              frmVenda.pnlVLUNIT.Caption :='';
              frmVenda.lblCodigo.Caption :='&Codigo:';
              frmVenda.edtQuant.Caption :='1';
              frmVenda.edtCodigo.Text := '';
              frmVenda.edtTotal.Caption := '0,00';
              frmVenda.bdtN_Venda.Caption := ' ';
              frmVenda.LIMPA('1');
              //
              M_FLVEND := False;
          //End;
          //
          Screen.Cursor := crDefault;
    End;
end;

procedure TfrmVenda.LIMPA_TELA;
begin
     //Limpa o listBox e os paineis
     uVendasPDV.frmVenda.ListBox1.Clear;
     uVendasPDV.frmVenda.ListBox2.Clear;
     uVendasPDV.frmVenda.pnlDESCRICAO.Caption :='';
     uVendasPDV.frmVenda.pnlUNID.Caption :='';
     uVendasPDV.frmVenda.pnlVLUNIT.Caption :='';
     uVendasPDV.frmVenda.lblCodigo.Caption :='&Codigo:';
     uVendasPDV.frmVenda.edtQuant.Caption :='1';
     uVendasPDV.frmVenda.edtCodigo.Text := '';
     uVendasPDV.frmVenda.edtTotal.Caption := '0,00';
     uVendasPDV.frmVenda.bdtN_Venda.Caption := ' ';
end;

procedure TfrmVenda.FormCreate(Sender: TObject);
begin
     //pnlFormaPag.Visible := False;
     // Verifica Impressora
     iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
     uBematech.Analisa_iRetorno();
     //uBematech.Retorno_Impressora();
     //
     If (iRetorno <> 1) Then
     begin
          FrmAdmin.StatusBar1.Panels[0].Text := 'Impressora não está on-line!!!';
          btNovaVenda.Enabled := False;
     End;
     //
     M_FLVEND := False;
end;

procedure TfrmVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
     // (pnlFormaPag.Visible = False)
     If (key = #27) and (graCaixaLivre.Visible = False)  Then
     begin
         Key := #0;
         If (Application.MessageBox('Confirma cancelamento de venda?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes) Then
         begin
              //FrmAdmin.mnuCancelarmentoCupomItemClick(Sender);
              //
              ListBox1.Clear;
              ListBox2.Clear;
              pnlDESCRICAO.Caption :='';
              pnlUNID.Caption :='';
              pnlVLUNIT.Caption :='';
              lblCodigo.Caption :='&Codigo:';
              edtQuant.Caption :='1';
              edtCodigo.Text := '';
              edtTotal.Caption := '0,00';
              bdtN_Venda.Caption := ' ';
              //
              LIMPA('1');
         End;
     End;
end;

procedure TfrmVenda.INICIA_VALORES;
begin
     uVendasPDV.M_TOVEND := 0;
     uVendasPDV.M_FLVEND := False;
     uVendasPDV.M_VLVEND := 0;
     uVendasPDV.M_VLDESC := 0;
     uVendasPDV.M_SUBTOT := 0;
     uVendasPDV.M_VLTROC := 0;
     //
     //uVendasPDV.frmVenda.edtCodigo.Enabled := False;
end;

procedure TfrmVenda.Button1Click(Sender: TObject);
begin
         // ------------------- Cancelamento do Cupom Fiscal ---------------------
         //If (M_FLVEND = True) Then
         //begin
              // Verifica se a impressora está ligada ou conectada no computador.
              iRetorno := Bematech_FI_VerificaImpressoraLigada();
              if (iRetorno = 1) then
              Begin
                   iRetorno := Bematech_FI_CancelaCupom();
                   Analisa_iRetorno();
                   //Retorno_Impressora();
              End;
              //
              INICIA_VALORES;
              bdtN_Venda.Caption := '';
              ShowMessage('Venda n.º '+M_NRVEND+' cancelada!!!');
         //End;
end;

procedure TfrmVenda.btConfirmarClick(Sender: TObject);
Var
   M_ACRDES, M_TPACDE,M_VLACDE, W_NRSEQU : String;
   M_FLTROC, M_FLOTEF : Boolean;
   M_FMPGTO ,M_OPTEF :String;
begin
 // incia
{ Dm.dbPDV.StartTransaction;
 Try
       M_FLTROC := False;
       M_FLOTEF := False;
       btConfirmar.Enabled := False;
       frmPrincipal.StatusBar1.Panels[0].Text := 'Inciando fechamento de venda...';
       M_TPMOVI := 'V';
       M_VLDINH := 0;
       M_VLCHEQ := 0;
       M_VLCART := 0;
       //
       Try
           M_VLDINH := StrtoFloat(FormatFloat('###.##0,00',StrtoFloat(edtDinheiro.Text)));
       Except
           M_VLDINH := 0;
       End;
       //
       Try
           M_VLCHEQ := StrtoFloat(FormatFloat('###.##0,00',StrtoFloat(edtCheque.Text)));
       Except
           M_VLCHEQ := 0;
       End;
       //
       Try
           M_VLCART := StrtoFloat(FormatFloat('###.##0,00',StrtoFloat(edtCartao.Text)));
       Except
           M_VLCART := 0;
       End;
       //
       M_MDDINH := 'DINHEIRO';
       M_MDCHEQ := 'CHEQUE';
       M_MDCART := 'CARTAO';
       // Valor de Entrada
       If (M_VLCART>0) then   // Se for cartão
       begin
           M_TOENTR := Arredondar(M_VLCART,2);
           edtCartao.Value := 0;
           M_FLOTEF := True;
       End
       Else                   // Se não
       begin
           M_TOENTR := Arredondar(M_VLDINH+M_VLCHEQ,2);
           edtDinheiro.Value := 0;
           edtCheque.Value   := 0;
       End;
       //
       //txtTOENTR.Caption := uFuncoes.Padr(FormatFloat('#,###,##0.00', M_TOENTR),18);
       //
       If (M_TOENTR < Arredondar(uVendasPDV.M_TOVEND,2)) Then
       begin
            Application.MessageBox('O valor de entrada deve ser maior'+#13
                                +'ou igual ao valor Total.','ATENÇÃO', MB_OK+MB_ICONSTOP);
            //Tabela.First;
            btConfirmar.Enabled := True;
            edtDinheiro.SetFocus;
            exit;                     // sair da procedure.
       end;
       //
       uVendasPDV.M_VLTROC := M_TOENTR-uVendasPDV.M_TOVEND;
       //
       ListBox1.Enabled := True;
       ListBox1.Items.Add(' ');
       //
       M_VLDESC := edtVLDESC.Value;
       If (M_VLDESC >= 1) Then
       begin
            ListBox1.Items.Add('SUBTOTAL R$                                              '+Padr(FormatFloat('###,##0.00',M_VLSUBT),12));
            //ListBox1.Items.Add('DESCONTO                                                 '+Padr(FormatFloat('###,##0.00',M_VLDESC),12)+'%');
            ListBox1.Items.Add('DESCONTO '+edtVLDESC.Text+'%'+'                                  '+Padr(FormatFloat('###,##0.00',M_TOVEND-M_VLSUBT),12));
            //M_TOVEND*M_VLDESC
       End;
       //
            ListBox1.Items.Add(' ');
            ListBox1.Items.Add('TOTAL CUPOM                                              '+Padr(FormatFloat('###,##0.00',M_TOVEND),12));
       ListBox1.Items.Add(Replicate(Chr(45),120));
       //Imprime a(s) forma(s) de pagamento e o(s) valor(es) pago(s) nessa forma.  FloattoStr(ValorVenda)
       If (M_VLDINH > 0) and (M_VLCART = 0) Then
            ListBox1.Items.Add('DINHEIRO                                                    '+Padr(FormatFloat('###,##0.00',M_VLDINH),14));
       //
       If (M_VLCHEQ > 0) and (M_VLCART = 0) Then
            ListBox1.Items.Add('CHEQUE                                                      '+Padr(FormatFloat('###,##0.00',M_VLCHEQ),14));
       If (M_VLCART > 0) and (M_VLDINH = 0) and (M_VLCHEQ = 0) Then
            ListBox1.Items.Add('CARTÃO                                                      '+Padr(FormatFloat('###,##0.00',M_VLCART),14));
       //
            ListBox1.Items.Add(' ');
            ListBox1.Items.Add('TOTAL ENTRADA                                            '+Padr(FormatFloat('###,##0.00',M_TOENTR),12));
            ListBox1.Items.Add(Replicate(Chr(45),120));
            ListBox1.Items.Add('TROCO                                                       '+Padr(FormatFloat('###,##0.00',M_VLTROC),14));
       //
       ListBox1.Items.Add(' ');
       ListBox1.ItemIndex :=ListBox1.Items.Count - 1;
       //
       lblCodigo.Caption := 'TROCO:';
       imgCodBar.Visible := False;
       imgMoedas.Left    := imgCodBar.Left;
       imgMoedas.Visible := True;
       edtCodigo.Enabled := True;
       edtCodigo.Visible := False;
       pnCDBARRAS.Caption := FormatFloat('###,##0.00',M_VLTROC);
       //
       If (edtCodigo.Text = uFuncoes.Padr('0,00',25)) Then
           M_FLTROC := False
       Else
           M_FLTROC := True;
       // Testa se a impressora Fiscal está ligada
       iRetorno := Bematech_FI_VerificaImpressoraLigada();
       Analisa_iRetorno();
       Retorno_Impressora();
       If iRetorno = 1 then
       begin
            // Inicia o fechamento do cupom com o uso das formas de pagamento.
            M_ACRDES := 'D';
            M_TPACDE := '%';
            M_VLDESC := 0;
            //StrtoFloat(edtVLDESC.Text);
            M_VLACDE := '0';
            //FormatFloat('#0,#0',M_VLDESC*100);
            //iRetorno := Bematech_I_IniciaFechamentoCupom(sAcreDesc, sTipoAcreDesc, Edit1.Text);
            iRetorno := uBematech.Bematech_FI_IniciaFechamentoCupom(pchar(M_ACRDES) , pchar(M_TPACDE), pchar(M_VLACDE));
            {uBematech.Analisa_iRetorno();
            uBematech.Retorno_Impressora();
            //
             iRetorno := Bematech_FI_AcrescimoDescontoSubtotalMFD( pchar( cAcresDesc ),
                                                      pchar( cTipoAcresDesc ),
                                                      pchar( cValorAcresDesc ) );
                //Imprime a(s) forma(s) de pagamento e o(s) valor(es) pago(s) nessa forma.  FloattoStr(ValorVenda)
                If (M_VLDINH > 0) Then
                     iRetorno := uBematech.Bematech_FI_EfetuaFormaPagamento(pchar(M_MDDINH) ,pchar(FormatFloat('###,##0.00',M_VLDINH)));
                If (M_VLCHEQ > 0) Then
                     iRetorno := uBematech.Bematech_FI_EfetuaFormaPagamento(pchar(M_MDCHEQ) ,pchar(FormatFloat('###,##0.00',M_VLCHEQ)));
                If (M_VLCART > 0) Then
                     iRetorno := uBematech.Bematech_FI_EfetuaFormaPagamentoMFD(pchar('CARTAO'+' '+cmbCartoes.Text),
                            pchar(FormatFloat('###,##0.00',M_VLCART)),pchar(edtQTPARC.Text),pchar('Compra parcelada'));
                //
                uBematech.Analisa_iRetorno();
                uBematech.Retorno_Impressora();
                // Termina o fechamento do cupom com mensagem promocional.
                iRetorno := uBematech.Bematech_FI_TerminaFechamentoCupom(pchar('   Obrigado, volte sempre !!! >>> InfoPDV.'));
                {uBematech.Analisa_iRetorno();
                uBematech.Retorno_Impressora();
                // Modulo TEF
                If (M_FLOTEF = True)  Then
                begin
                     // Esta função trava o teclado e o mouse, nas operações de TEF.
                     iRetorno := uBematech.Bematech_FI_IniciaModoTEF();
                     // Abre o comprovante não fiscal vinculado.
                     iRetorno := uBematech.Bematech_FI_AbreComprovanteNaoFiscalVinculado( pchar(M_MDCART+' '+cmbCartoes.Text), pchar( '' ), pchar( '' ) );
                     // Imprime o comprovante não fiscal
                     iRetorno := Bematech_FI_UsaComprovanteNaoFiscalVinculadoTEF( pchar( 'InfoG2 Tecnologia em Sistemas!!!') );
                     // Encerrar o comprovante não fiscal vinculado.
                     iRetorno := Bematech_FI_FechaComprovanteNaoFiscalVinculado();
                     // Esta função destrava o teclado e o mouse, nas operações de TEF.
                     iRetorno := Bematech_FI_FinalizaModoTEF();
                End;
       //End;
       // Grava dados no BD.
       Dm.cdsVendas.Append;
       Dm.cdsVendas.FieldByName('VEN_NRVEND').AsString := uFuncoes.StrZero(M_NRVEND,7);
       Dm.cdsVendas.FieldByName('VEN_VLDESC').AsFloat  := M_VLDESC;
       Dm.cdsVendas.FieldByName('VEN_DTVEND').AsDateTime := Date();
       Dm.cdsVendas.FieldByName('VEN_HOVEND').AsDateTime := Time();
       Dm.cdsVendas.Post;
       //  modalidade DINHEIRO
       If (M_VLDINH > 0) Then
       begin
            Dm.CdsConfig.Edit;
            Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsFloat :=
                  Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsFloat+1;
            Dm.CdsConfig.Post;
            W_NRSEQU := uFuncoes.StrZero(Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsString,10);
            //
            Dm.cdsMovCaixa.Append;
            Dm.cdsMovCaixa.FieldByName('MCA_NRSEQU').AsString := W_NRSEQU;
            Dm.cdsMovCaixa.FieldByName('MCA_NRVEND').AsString := M_NRVEND;
            Dm.cdsMovCaixa.FieldByName('MCA_DTMOVI').AsDateTime := Date();
            Dm.cdsMovCaixa.FieldByName('MCA_HOMOVI').AsDateTime := Time();
            Dm.cdsMovCaixa.FieldByName('MCA_CDCAIX').AsString := uPrincipalPDV.M_CDCAIX;
            Dm.cdsMovCaixa.FieldByName('MCA_CDMODA').AsString := '01';
            Dm.cdsMovCaixa.FieldByName('MCA_NMMODA').AsString := M_MDDINH;
            Dm.cdsMovCaixa.FieldByName('MCA_VLMODA').AsCurrency := M_VLDINH;
            Dm.cdsMovCaixa.FieldByName('MCA_TPMOVI').AsString := 'V';
            Dm.cdsMovCaixa.Post;
       End;
       //  modalidade CHEQUE
       If (M_VLCHEQ > 0) Then
       begin
            Dm.CdsConfig.Edit;
            Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsFloat :=
                  Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsFloat+1;
            Dm.CdsConfig.Post;
            W_NRSEQU := uFuncoes.StrZero(Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsString,10);
            //
            Dm.cdsMovCaixa.Append;
            Dm.cdsMovCaixa.FieldByName('MCA_NRSEQU').AsString := W_NRSEQU;
            Dm.cdsMovCaixa.FieldByName('MCA_NRVEND').AsString := M_NRVEND;
            Dm.cdsMovCaixa.FieldByName('MCA_DTMOVI').AsDateTime := Date();
            Dm.cdsMovCaixa.FieldByName('MCA_HOMOVI').AsDateTime := Time();
            Dm.cdsMovCaixa.FieldByName('MCA_CDCAIX').AsString := uPrincipalPDV.M_CDCAIX;
            Dm.cdsMovCaixa.FieldByName('MCA_CDMODA').AsString := '02';
            Dm.cdsMovCaixa.FieldByName('MCA_NMMODA').AsString := M_MDCHEQ;
            Dm.cdsMovCaixa.FieldByName('MCA_VLMODA').AsCurrency := M_VLCHEQ;
            Dm.cdsMovCaixa.FieldByName('MCA_TPMOVI').AsString := 'V';
            Dm.cdsMovCaixa.Post;
       End;
       //  modalidade CARTÃO
       If (M_VLCHEQ > 0) Then
       begin
            Dm.CdsConfig.Edit;
            Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsFloat :=
                  Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsFloat+1;
            Dm.CdsConfig.Post;
            W_NRSEQU := uFuncoes.StrZero(Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsString,10);
            //
            Dm.cdsMovCaixa.Append;
            Dm.cdsMovCaixa.FieldByName('MCA_NRSEQU').AsString := W_NRSEQU;
            Dm.cdsMovCaixa.FieldByName('MCA_NRVEND').AsString := M_NRVEND;
            Dm.cdsMovCaixa.FieldByName('MCA_DTMOVI').AsDateTime := Date();
            Dm.cdsMovCaixa.FieldByName('MCA_HOMOVI').AsDateTime := Time();
            Dm.cdsMovCaixa.FieldByName('MCA_CDCAIX').AsString := uPrincipalPDV.M_CDCAIX;
            Dm.cdsMovCaixa.FieldByName('MCA_CDMODA').AsString := '03';
            Dm.cdsMovCaixa.FieldByName('MCA_NMMODA').AsString := M_MDCART;
            Dm.cdsMovCaixa.FieldByName('MCA_VLMODA').AsCurrency := M_VLCART;
            Dm.cdsMovCaixa.FieldByName('MCA_TPMOVI').AsString := 'V';
            Dm.cdsMovCaixa.Post;
       End;
       //  TROCO
       If (M_FLTROC = True) Then
       begin
            Dm.CdsConfig.Edit;
            Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsFloat :=
                  Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsFloat+1;
            Dm.CdsConfig.Post;
            W_NRSEQU := uFuncoes.StrZero(Dm.CdsConfig.FieldByName('PAR_NRSEQU').AsString,10);
            //
            Dm.cdsMovCaixa.Append;
            Dm.cdsMovCaixa.FieldByName('MCA_NRSEQU').AsString := W_NRSEQU;
            Dm.cdsMovCaixa.FieldByName('MCA_NRVEND').AsString := M_NRVEND;
            Dm.cdsMovCaixa.FieldByName('MCA_DTMOVI').AsDateTime := Date();
            Dm.cdsMovCaixa.FieldByName('MCA_HOMOVI').AsDateTime := Time();
            Dm.cdsMovCaixa.FieldByName('MCA_CDCAIX').AsString := uPrincipalPDV.M_CDCAIX;
            Dm.cdsMovCaixa.FieldByName('MCA_CDMODA').AsString := '00';
            Dm.cdsMovCaixa.FieldByName('MCA_NMMODA').AsString := 'TROCO';
            Dm.cdsMovCaixa.FieldByName('MCA_VLMODA').AsCurrency := M_VLTROC;
            Dm.cdsMovCaixa.FieldByName('MCA_TPMOVI').AsString := 'T';
            Dm.cdsMovCaixa.Post;
       End;
       //
       uVendasPDV.M_FLVEND := False;
       COMPONENTES_INVISIVEL('1');
       // Grava
       Dm.dbPDV.Commit;
       frmPrincipal.StatusBar1.Panels[0].Text := 'Fechamento concluido.';
       MessageBox (Application.Handle, pChar('Venda N.º '+M_NRVEND +' concluida com sucesso.'),
                     'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
                  frmPrincipal.StatusBar1.Panels[0].Text := ' ';
       //
       ListBox1.Clear;
       ListBox2.Clear;
       pnlDESCRICAO.Caption :='';
       pnlUNID.Caption :='';
       pnlVLUNIT.Caption :='';
       lblCodigo.Caption :='&Codigo:';
       edtQuant.Caption :='1';
       edtCodigo.Text := '';
       edtTotal.Caption := '0,00';
       bdtN_Venda.Caption := ' ';
       pnlFormaPag.Visible := False;
       edtCodigo.Visible := True;
       pnCDBARRAS.Caption := ' ';
       // Jalena com a mensagem de caixa Livre.
       LIMPA('1');
       //
 Except
       MessageBox (Application.Handle, pChar('Erro no fechamento de Venda N.º '+M_NRVEND),
                     'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
       //  Cancelar transação no BD.
       Dm.dbPDV.Rollback;
       // Cancela cupom
       frmPrincipal.mnuCancelarmentoCupomItemClick(Sender);
 End;}
end;

procedure TfrmVenda.btCancelarClick(Sender: TObject);
begin
{      pnlFormaPag.Visible := False;
      M_TOVEND := W_VLVEND;
      COMPONENTES_INVISIVEL('1');
      edtCodigo.Enabled   :=  True;
      edtCodigo.SetFocus;}
end;

procedure TfrmVenda.edtDinheiroKeyPress(Sender: TObject; var Key: Char);
begin
    If (Key = #13) Then
    begin
        Key := #0;
        //edtCheque.SetFocus;
    End;
    //
    If (key = #27) Then
    begin
         Key := #0;
         {pnlFormaPag.Visible := False;
         M_TOVEND := W_VLVEND;
         COMPONENTES_INVISIVEL('1');
         edtCodigo.Enabled   :=  True;
         edtCodigo.SetFocus;}
    End;
end;

procedure TfrmVenda.edtDinheiroExit(Sender: TObject);
begin
     //txtTOENTR.Caption := FormatFloat('###,##0.00',edtDinheiro.Value+edtCheque.value);
end;

procedure TfrmVenda.edtChequeExit(Sender: TObject);
begin
     //txtTOENTR.Caption := FormatFloat('###,##0.00',edtDinheiro.Value+edtCheque.value);
end;

procedure TfrmVenda.edtChequeKeyPress(Sender: TObject; var Key: Char);
begin
    If (Key = #13) Then
    begin
        Key := #0;
        //edtCartao.SetFocus;
    End;
    //
    If (key = #27) Then
    begin
         Key := #0;
        { pnlFormaPag.Visible := False;
         M_TOVEND := W_VLVEND;
         COMPONENTES_INVISIVEL('1');
         edtCodigo.Enabled   :=  True;
         edtCodigo.SetFocus;}
    End;
end;

procedure TfrmVenda.edtCartaoExit(Sender: TObject);
begin
     //txtTOENTR.Caption := FormatFloat('###,##0.00',edtDinheiro.Value+edtCheque.value+edtCartao.Value);
     {If (edtDinheiro.Text <> '') or  (edtCheque.text<> '') Then
         txtTOENTR.Caption := FormatFloat('###,##0.00',edtDinheiro.Value+edtCheque.value)
     Else
         txtTOENTR.Caption := FormatFloat('###,##0.00',edtCartao.value);}
end;

procedure TfrmVenda.edtCartaoKeyPress(Sender: TObject; var Key: Char);
begin
{    If (Key = #13) Then
    begin
        Key := #0;
        //edtVLDESC.SetFocus;
        If (edtCartao.Value>0) Then
        begin
            lbl_cartao.Visible := True;
            cmbCartoes.Visible := True;
            cmbCartoes.ItemIndex := 0;
            lbl_Parcelas.Visible  := True;
            edtQTPARC.Value := 1;
            edtQTPARC.Visible  := True;
            edtVLPARC.Visible  := True;
            //
            cmbCartoes.SetFocus;
        End
        Else    // Vai para o botao Confirma
            btConfirmar.SetFocus;
    End;
    //
    If (key = #27) Then
    begin
         Key := #0;
         pnlFormaPag.Visible := False;
         M_TOVEND := W_VLVEND;
         COMPONENTES_INVISIVEL('1');
         edtCodigo.Enabled   :=  True;
         edtCodigo.SetFocus;
    End;}
end;

procedure TfrmVenda.COMPONENTES_INVISIVEL(Estado : String);
begin
     If (Estado = '1') Then
     begin
           pnlUNID.Enabled      := True;
           edtQuant.Enabled     := True;
           pnlVLUNIT.Enabled    := True;
           ListBox1.Enabled     := True;
           ListBox2.Enabled     := True;
           pnCDBARRAS.Enabled   := True;
           edtCodigo.Enabled    := True;
           //
           edtTOTAL.Caption  := FormatFloat('###,##0.00',M_TOVEND);
     End
     Else
     begin
           pnlUNID.Enabled      := False;
           edtQuant.Enabled     := False;
           pnlVLUNIT.Enabled    := False;
           ListBox1.Enabled     := False;
           ListBox2.Enabled     := False;
           pnCDBARRAS.Enabled   := False;
           edtCodigo.Enabled    := False;
     End;
End;

procedure TfrmVenda.LIMPA(Estado : String);
begin
   If (Estado = '1') Then
   begin
    pnlSuperior.Color   := clGray;
    lblNVenda.Visible   := False;
    ListBox2.Visible    := False;
    ListBox1.Visible    := False;
    lblNomePro.Visible  := False;
    pnlDESCRICAO.Visible := False;
    lblUnidade.Visible := False;
    pnlUNID.Visible := False;
    edtQuant.Visible := False;
    lblQuant.Visible := False;
    pnlVLUNIT.Visible := False;
    lblValor.Visible := False;
    lblListaPro.Visible := False;
    pnCDBARRAS.Visible := False;
    edtCodigo.Visible := False;
    imgCodBar.Visible := False;
    lblCodigo.Visible := False;
    imgMoedas.Visible := False;
    edtTOTAL.Visible := False;
    lblTotal.Visible := False;
    bdtN_Venda.Visible := False;
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
    rxlCaixaLivre.Left  := 50;
    //(FrmPrincipal.Width Div 2) - (pnlFormaPag.Width Div 2);
    rxlCaixaLivre.Top   := (FrmAdmin.Height Div 2) - (150+FrmAdmin.StatusBar1.Height)+20;
    rxlCaixaLivre.Visible := True;
    graCaixaLivre.Visible := True;
    M_FLVEND := False;
    btNovaVenda.Visible   := True;
    //btNovaVenda.SetFocus;
    //  MENUS
    {FrmAdmin.mnuMemoriaFiscalItem.Enabled := True;
    FrmAdmin.mnuLeituraXItem.Enabled      := True;
    FrmAdmin.mnuReducaoZItem.Enabled      := True;
    //
    FrmAdmin.mnuCancelarItem.Enabled           := False;
    FrmAdmin.mnuItemGenericoItem.Enabled       := False;
    FrmAdmin.mnuCancelarmentoCupomItem.Enabled := False;}
  End
  Else
  begin
    graCaixaLivre.Visible := False;
    rxlCaixaLivre.Visible := False;
    btNovaVenda.Visible := False;
    //
    pnlSuperior.Color   := clBlue;
    lblNVenda.Visible   := True;
    ListBox2.Visible    := True;
    ListBox1.Visible    := True;
    lblNomePro.Visible  := True;
    pnlDESCRICAO.Visible := True;
    lblUnidade.Visible := True;
    pnlUNID.Visible := True;
    edtQuant.Visible := True;
    lblQuant.Visible := True;
    pnlVLUNIT.Visible := True;
    lblValor.Visible := True;
    lblListaPro.Visible := True;
    pnCDBARRAS.Visible := True;
    edtCodigo.Visible := True;
    imgCodBar.Visible := True;
    lblCodigo.Visible := True;
    imgDinheiro.Visible := True;
    //imgMoedas.Visible := True;
    edtTOTAL.Visible := True;
    lblTotal.Visible := True;
    bdtN_Venda.Visible := True;
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
    {FrmAdmin.mnuMemoriaFiscalItem.Enabled := False;
    FrmAdmin.mnuLeituraXItem.Enabled      := False;
    FrmAdmin.mnuReducaoZItem.Enabled      := False;
    //
    FrmAdmin.mnuCancelarItem.Enabled           := True;
    FrmAdmin.mnuItemGenericoItem.Enabled       := True;
    FrmAdmin.mnuCancelarmentoCupomItem.Enabled := True;}
  End;
end;

procedure TfrmVenda.Button2Click(Sender: TObject);
begin
     LIMPA('1');
end;

procedure TfrmVenda.btNovaVendaClick(Sender: TObject);
begin
     LIMPA('2');
     //
     {Application.MessageBox('Inciando nova venda.',
         'Atenção', MB_IconInformation + MB_OK);}

     // Verifica Impressora
     iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
     uBematech.Analisa_iRetorno();
     //uBematech.Retorno_Impressora();
     //
     If (iRetorno <> 1) Then
     begin
         FrmAdmin.StatusBar1.Panels[0].Text := 'Impressora não está on-line!!!';
         Application.MessageBox('A impressora está desligada ou'+#13
                               +'não está conectada!!!',
               'ATENÇÃO', MB_IconInformation + MB_OK);
         LIMPA('1');
         Exit;
     end;
     //
     If (M_FLVEND = False) Then
     Begin
          //INICIA_VALORES;
          //If (iRetorno = 1) Then
          //begin
                FrmAdmin.StatusBar1.Panels[0].Text := ' ';
                NOVA_VENDA;
                edtCodigo.Enabled := True;
                edtCodigo.Clear;
                edtCodigo.SetFocus;
     End
     ELse
     begin
            Application.MessageBox('Você tem que fechar a venda atual.',
               'Atenção', MB_IconInformation + MB_OK);
            //M_FLVEND := False;
            Exit;
     End;
end;

procedure TfrmVenda.FormShow(Sender: TObject);
begin
     LIMPA('1');
end;

procedure TfrmVenda.edtVLDESCExit(Sender: TObject);
Var
    W_VLDESC : Double;
begin

    { If (edtVLDESC.text > '0,00') Then
     Begin
          W_VLDESC := StrtoFloat(edtVLDESC.text);
          M_VLSUBT := M_TOVEND;
          M_VLDESC := W_VLDESC/100;
          M_TOVEND := M_TOVEND-(M_TOVEND*M_VLDESC);
          txtTOVEND.Caption := FormatFloat('###,##0.00',M_TOVEND);
          edtTOTAL.Caption  := FormatFloat('###,##0.00',M_TOVEND);
     End
     Else
          Exit;}
end;

procedure TfrmVenda.edtVLDESCKeyPress(Sender: TObject; var Key: Char);
begin
    If (Key = #13) Then
    begin
        Key := #0;
        //edtDinheiro.SetFocus;
    End;

end;

procedure TfrmVenda.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose := False;
     If (M_FLVEND = True) Then
     begin
            Application.MessageBox('Você tem que fechar a venda atual.',
               'Atenção', MB_IconInformation + MB_OK);
            CanClose := False;
            Exit;
     End
     Else
          CanClose := True;
end;

procedure TfrmVenda.edtCartaoChange(Sender: TObject);
begin
{     If (edtCartao.Value > 0) Then
     begin
          edtDinheiro.Value := 0;
          edtCheque.Value   := 0;
     End;}
end;

procedure TfrmVenda.edtQTPARCExit(Sender: TObject);
begin
{     If (edtQTPARC.Value<1) Then
     begin
          MessageBox (Application.Handle, 'A quantidade de parcelas não'+#13
                                         +'pode ser menor que uma!!!',
                   'AVISO',MB_ICONSTOP+ MB_OK);
          edtQTPARC.SetFocus;
     End;}
end;

procedure TfrmVenda.edtQTPARCChange(Sender: TObject);
begin
//     edtVLPARC.Value := Arredondar(M_TOVEND/edtQTPARC.Value,2);
end;

procedure TfrmVenda.edtDescontoPercKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) Then
     begin
          Key := #0;
               // Verifica se a impressora está conectada.
               iRetorno := Bematech_FI_VerificaImpressoraLigada();
               uBematech.Analisa_iRetorno();
               //uBematech.Retorno_Impressora();
               //
               If iRetorno = 1 then
               begin
                   // Tipo de Decimal com 2 para duas casas
                   M_DECIMAL := 2;
                   // Verifica o Tipo de Desconto: '%' para percentual ou '$' para valor
                   M_VLDESC := 0;
                   M_TPDESC := '%';
                   //M_VLDESC := uFuncoes.Gerapercentual(StrtoFloat(pnlVLUNIT.Caption),edtDescontoPerc.Value);
                   If (M_VLDESC > 0) Then
                       M_FLDESC := True
                   Else
                       M_FLDESC := False;
                   //M_TPDESC := '$';
                   //  Verifica o Tipo da Quantidade: E vende o item.
                   If M_FLPROD = 'S' Then          // 'F' para Fracionária
                   begin
                        M_TPQUAN := 'F';
                        iRetorno  := uBematech.Bematech_FI_VendeItem( pchar(M_CDPROD), pchar(M_NMPROD), pchar(M_VLTRIB),
                                     pchar(M_TPQUAN), pchar(FormatFloat('#,##0.000',M_QTPROD)),M_DECIMAL,pchar(pnlVLUNIT.Caption),
                                     pchar(M_TPDESC), pchar(FloattoStr(M_VLDESC)));
                   End
                   Else
                   begin                          // 'I' para Inteira
                        M_TPQUAN := 'I';
                        iRetorno  := uBematech.Bematech_FI_VendeItem( pchar(M_CDPROD), pchar(M_NMPROD), pchar(M_VLTRIB),
                                     pchar(M_TPQUAN), pchar(FormatFloat('###',M_QTPROD)), M_DECIMAL,pchar(pnlVLUNIT.Caption),
                                     pchar(M_TPDESC), pchar(FloattoStr(M_VLDESC)));
                   End;
                   //
                   uBematech.Analisa_iRetorno();
                   //uBematech.Retorno_Impressora();
                   //
                   If iRetorno = 1 then
                   begin
                        //  Calcula
                        M_TOVEND := uFuncoes.Arredondar(M_TOVEND+(M_QTPROD*M_VLVEND),2);
                        edtTOTAL.Caption := FormatFloat('###,###,##0.00', M_TOVEND);
                        edtQuant.Caption := FloattoStr(M_QTPROD);
                        //limpa o edtCodigo e coloca o foco nele.
                        edtCodigo.Clear;
                        edtCodigo.SetFocus;
                        //
                        ListDados;
                        //
                        //edtDescontoPerc.Value  := 0;
                        //edtDescontoValor.Value := 0;
                        //
                        //edtDescontoPerc.ReadOnly := True;
                        edtQuant.Font.Color:= clBlack;
                        edtCodigo.SetFocus;
                   End;
              End
              Else
                   begin
                        ShowMessage('Retorno : '+InttoStr(iRetorno));
                        edtQuant.Font.Color:= clBlack;
                        edtCodigo.Clear;
                        edtCodigo.SetFocus;
                        Exit;
                   End;
       End;
end;

procedure TfrmVenda.edtDescontoPercChange(Sender: TObject);
Var
    W_VLUNIT : Real;
begin
     W_VLUNIT := StrtoFloat(pnlVLUNIT.Caption);
     //
     //edtDescontoValor.Value := uFuncoes.Gerapercentual(W_VLUNIT,edtDescontoPerc.Value);
end;

end.
