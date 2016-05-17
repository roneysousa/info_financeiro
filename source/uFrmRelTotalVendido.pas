unit uFrmRelTotalVendido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmRelatorio, StdCtrls, Buttons, ExtCtrls, ComCtrls, FMTBcd,
  DBClient, Provider, DB, SqlExpr, Mask, ToolEdit, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppDB, ppDBPipe, ppPrnabl, ppCtrls, ppBands,
  ppCache, DBCtrls, ppVar, VDODmPrinter;

type
  TfrmRelMesasEntregas = class(TfrmRelatorio)
    PageControl1: TPageControl;
    tbsMesas: TTabSheet;
    tbsProdutos: TTabSheet;
    TabSheet3: TTabSheet;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsMesasEntregas: TClientDataSet;
    Label1: TLabel;
    rgTipo: TRadioGroup;
    edtDTMOVI1: TDateEdit;
    ppRepMesaEntregas: TppReport;
    ppDBPMesasEntregas: TppDBPipeline;
    dsMesasEntregas: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppImage1: TppImage;
    ppLine1: TppLine;
    ppLine2: TppLine;
    txtTitulo1: TppLabel;
    txtPeriodo1: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppDBText6: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    txtMesaEntrega: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    cdsMesasEntregasMOV_PEDIDO: TIntegerField;
    cdsMesasEntregasMOV_CUPOM: TIntegerField;
    cdsMesasEntregasMOV_LOJA: TIntegerField;
    cdsMesasEntregasMOV_DATAVENDA: TDateField;
    cdsMesasEntregasMOV_CLIENTE: TIntegerField;
    cdsMesasEntregasMOV_VALOR: TFMTBCDField;
    cdsMesasEntregasMOV_NOMECLIENTE: TStringField;
    cdsMesasEntregasMOV_SITUACAO: TStringField;
    cdsMesasEntregasMOV_VENDEDOR: TIntegerField;
    cdsMesasEntregasMOV_DESCONTO: TFMTBCDField;
    cdsMesasEntregasMOV_HORAVENDA: TStringField;
    cdsMesasEntregasMOV_ACRESCIMO: TFMTBCDField;
    cdsMesasEntregasMOV_TAXA_SERVICO: TBCDField;
    cdsMesasEntregasMOV_NRMESA: TStringField;
    cdsMesasEntregasMOV_NMLOJA: TStringField;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel6: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    cdsMesasEntregasMOV_TOTAL: TFloatField;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    ppReProdutos: TppReport;
    ppDBProdutos: TppDBPipeline;
    cdsProdutosHIS_DATA: TDateField;
    cdsProdutosHIS_PRODUTO: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosHIS_VLVENDA: TFMTBCDField;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppImage2: TppImage;
    ppLine5: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine6: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppLine7: TppLine;
    cdsProdutosPRO_REFERENCIA: TStringField;
    ppLabel13: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine8: TppLine;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    Label2: TLabel;
    edtDTMOVI2: TDateEdit;
    Label3: TLabel;
    edtCDPROD: TEdit;
    sbLocProduto: TSpeedButton;
    dbeDescricao: TEdit;
    cdsProdutosTOTAL: TFMTBCDField;
    ppLabel16: TppLabel;
    txtData: TppLabel;
    txtProduto: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel17: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    procedure btImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsMesasEntregasCalcFields(DataSet: TDataSet);
    procedure sbLocProdutoClick(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
  private
    { Private declarations }
    Procedure RelTotalVendido(aData : Tdate; aTipo : String) ;
  public
    { Public declarations }
  end;

var
  frmRelMesasEntregas: TfrmRelMesasEntregas;

implementation

uses Udm, uFuncoes, udmDados, uFrmSeleProdutos, udmConsulta, Math;

{$R *.dfm}

procedure TfrmRelMesasEntregas.btImprimirClick(Sender: TObject);
begin
  inherited;
     Dm.RefreshCDS(Dm.CdsConfig);
     //
     If (PageControl1.ActivePage = tbsMesas ) Then
      begin
         If (Dm.CdsConfigCFG_FLMATRICIAL.AsString = 'N') Then
          Begin
           With cdsMesasEntregas do
            begin
                 Close;
                 Params[0].AsDateTime := edtDTMOVI1.Date;
                 If (rgTipo.ItemIndex = 0) Then
                   Params[1].AsString := '0%'
                 Else
                   Params[1].AsString := 'T%';
                 Open;
                 //
                 If Not (IsEmpty) Then
                  begin
                       ppImage1.Picture.Assign(Dm.CdsConfigCFG_IMAGEMLOGO);
                       If (rgTipo.ItemIndex = 0) Then
                        Begin
                           txtTitulo1.Caption := 'MOVIMENTO DE VENDAS : MESAS';
                           txtMesaEntrega.Caption := 'MESA';
                        End
                       Else
                        begin
                           txtTitulo1.Caption := 'MOVIMENTO DE VENDAS : ENTREGAS';
                           txtMesaEntrega.Caption := 'ENTREGA';
                        End;
                       //
                       txtPeriodo1.Caption := 'DATA : '+ edtDTMOVI1.Text;
                       //
                       ppRepMesaEntregas.PrintReport;
                  End
                  Else
                      ShowMessage('Não há movimento para data indicada.');
            End;
          End
          Else
           begin
                If (rgTipo.ItemIndex = 0) Then
                    RelTotalVendido(edtDTMOVI1.Date, '0')
                Else
                    RelTotalVendido(edtDTMOVI1.Date, 'T');
           End;
      End;
      //
     If (PageControl1.ActivePage = tbsProdutos ) Then
      begin
         TRY
           With cdsProdutos do
            begin
                 Close;
                 CommandText := 'Select H.HIS_DATA, H.HIS_PRODUTO, P.PRO_DESCRICAO, P.PRO_REFERENCIA, H.HIS_VLVENDA, Sum(H.HIS_MOVIMENTO) As TOTAL '+
                                ' from HISTORICO H Inner Join PRODUTOS P on P.PRO_CODIGO = H.HIS_PRODUTO '+
                                'Where (H.HIS_DATA = :pDATA) AND (H.his_tipo = :pTIPO) ';
                 If not uFuncoes.Empty(edtCDPROD.Text) Then
                    CommandText := CommandText + ' and (H.HIS_PRODUTO = :pPRODUTO) ';
                 //
                 CommandText := CommandText + ' Group by H.HIS_DATA, H.HIS_PRODUTO, P.PRO_DESCRICAO, P.PRO_REFERENCIA, H.HIS_VLVENDA ';
                 CommandText := CommandText + ' ORDER BY P.PRO_DESCRICAO ';
                 //
                 Params[0].AsDateTime := edtDTMOVI2.Date;
                 Params[1].AsString   := 'V';
                 If not uFuncoes.Empty(edtCDPROD.Text) Then
                     Params[2].AsString   := edtCDPROD.Text;
                 Open;
                 //
                 If Not (IsEmpty) Then
                  begin
                       ppImage2.Picture.Assign(Dm.CdsConfigCFG_IMAGEMLOGO);
                       txtData.Caption    := 'DATA    : '+ edtDTMOVI2.Text;
                       If not uFuncoes.Empty(edtCDPROD.Text) Then
                          txtProduto.Caption := 'PRODUTO : '+ dbeDescricao.Text
                       Else
                          txtProduto.Caption := 'PRODUTO : TODOS';
                       //
                       // txtPeriodo1.Caption := 'DATA : '+ edtDTMOVI1.Text;
                       //
                       ppReProdutos.PrintReport;
                  End
                  Else
                      ShowMessage('Não há movimento para data indicada.');
            End;
         Finally
              edtCDPROD.Clear;
              dbeDescricao.Clear;
         End;
      End;

end;

procedure TfrmRelMesasEntregas.FormShow(Sender: TObject);
begin
  inherited;
       PageControl1.ActivePageIndex := 0;
       edtDTMOVI1.Date := Date();
       edtDTMOVI2.Date := Date();
end;

procedure TfrmRelMesasEntregas.cdsMesasEntregasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
      if (cdsMesasEntregas.State = dsInternalCalc) Then
        cdsMesasEntregasMOV_TOTAL.AsFloat :=
          cdsMesasEntregasMOV_VALOR.AsFloat + cdsMesasEntregasMOV_TAXA_SERVICO.AsFloat;
end;

procedure TfrmRelMesasEntregas.sbLocProdutoClick(Sender: TObject);
begin
  inherited;
  // frmLocProdutos
   If (dmDados.cdsItensVenda.Active) and (dmDados.cdsItensVenda.State in [dsInsert, dsEdit]) Then
      with TfrmSelecionaProduto.create(self) do
      try
          if (showmodal = mrOK) Then
          begin
              If not (cdsProdutos.IsEmpty) Then
                  edtCDPROD.text := uFuncoes.StrZero(cdsProdutosPRO_CODIGO.AsString,13)
              Else
                 edtCDPROD.SetFocus;
          End;
      finally
          free;
          //
          btImprimir.SetFocus;
      end;
end;

procedure TfrmRelMesasEntregas.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8, #13, #27]) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDPROD.Text) Then
     begin
          Key := #0;
          sbLocProdutoClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDPROD.Text) Then
     begin
          Key := #0;
          Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TfrmRelMesasEntregas.edtCDPRODExit(Sender: TObject);
begin
  inherited;
      If not uFuncoes.Empty(edtCDPROD.Text) Then
      Begin
           //
           If not (dmConsultas.GetVerificaProduto(edtCDPROD.Text)) Then
           Begin
                Application.MessageBox (PChar('Código de produto não cadastrado !'),
                    'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
                edtCDPROD.Clear;
                edtCDPROD.SetFocus;
                Exit;
           End
           Else
           begin

               {If (dmConsultas.GetVerificaCodBarras(edtCDPROD.text)) Then
                   dmDados.cdsItensVendaPVI_PRODUTO.AsString := dmConsultas.GetBarrasCodProduto(dmDados.cdsItensVendaPVI_PRODUTO.AsString)
               Else
                   dmDados.cdsItensVendaPVI_PRODUTO.AsString := uFuncoes.StrZero(dmDados.cdsItensVendaPVI_PRODUTO.AsString,13);}
           End;
           //
           edtCDPROD.Text    := uFuncoes.StrZero(edtCDPROD.Text,13);
           dbeDescricao.Text := uFuncoes.NOME_PRODUTO(uFuncoes.StrZero(edtCDPROD.Text,13));
      End;
end;

procedure TfrmRelMesasEntregas.edtCDPRODChange(Sender: TObject);
begin
  inherited;
       If uFuncoes.Empty(edtCDPROD.Text) Then
           dbeDescricao.Clear;
end;

procedure TfrmRelMesasEntregas.RelTotalVendido(aData: Tdate;
  aTipo: String);
Var
    // Variável da classe TVDODmPrinter que fará o relatório
    VDOImpressora : TVDODmPrinter;
    Linha : string;
    M_QTCARA : Integer;
    M_POSINI : integer;
    //
    M_QTREGI : Integer;
    fTotalVenda, fTotalComissao : Double;
begin
     With cdsMesasEntregas do
       begin
            Close;
            Params[0].AsDateTime := edtDTMOVI1.Date;
            Params[1].AsString := aTipo +'%';
            Open;
            //
            If Not (IsEmpty) Then
             begin
                  If (aTipo = '0') Then
                      Linha := 'MOVIMENTO DE VENDAS : MESAS'
                  Else
                      Linha := 'MOVIMENTO DE VENDAS : ENTREGAS';
                  //
                  M_QTREGI := cdsMesasEntregas.RecordCount;
                  //
                  dm.CdsEmpresas.Close;
                  With dm.SdsEmpresas do
                   Begin
                        Active := False;
                        CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
                        Params.ParamByName('pCODIGO').AsInteger := 1;
                        Active := true;
                   End;
                  dm.CdsEmpresas.Open;
                  //
                   try
                      VDOImpressora := TVDODmPrinter.Create(nil);
                      VDOImpressora.Title := 'Visualizar Impressão';
                      VDOImpressora.ShowPreview       := True;
                      VDOImpressora.ShowProgress      := True;
                      VDOImpressora.ShowDialog        := False;
                      //
                      VDOImpressora.Font.Size         := fsCondensed;
                      M_QTCARA := 48;
                      //
                      With VDOImpressora do
                      Begin
                           BeginDoc;
                           //
                           Font.Size  := fsCondensed;
                           Font.Style := [];
                           { salta duas linhas}
                           NewLine(2);
                           M_POSINI := 0;
                           { Imprime e alinhado à esquerda dentro de uma área de 52 caracteres}
                           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',M_QTCARA )]), True);
                           { Imprime a string "Cupom ", alinhado à esquerda"-" dentro de uma área de trita caracteres}
                           Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('MOVIMENTO DE VENDAS', M_QTCARA),M_QTCARA ]), True);
                           { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
                           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*', M_QTCARA )]), True);
                           { Imprime o nome da Loja}
                           Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString, M_QTCARA)]), True);                           Print(M_POSINI, Format('%-48s', [uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString, M_QTCARA)]), True);
                           { ---- Impressão dos Cabeçalho-----}
                           { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
                           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',M_QTCARA )]),TRUE);
                           Print(M_POSINI, Format('%-48s', ['RELATORIO.......: '+ Linha]),TRUE);
                           Print(M_POSINI, Format('%-48s', ['DATA............: '+ DatetoStr(aData)] ), True);
                           //
                           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=',M_QTCARA )]),TRUE);
                           //
                           cdsMesasEntregas.First;
                           fTotalVenda    := 0;
                           fTotalComissao := 0;
                           //
                           Print(M_POSINI, Format('%-8s', ['VENDA']),false);
                           Print(M_POSINI, Format('%-10s',['DATA']),false);
                           If (aTipo = '0') Then
                               Print(M_POSINI, Format('%6s', ['MESA']),false)
                           Else
                               Print(M_POSINI, Format('%6s', ['ENTREGA']),false);
                           //
                           Print(M_POSINI, Format('%12s', ['VALOR']),false);
                           Print(M_POSINI, Format('%11s', ['TX.SERV.']),True);
                           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',M_QTCARA )]),TRUE);
                           //
                           While not (cdsMesasEntregas.eof) do
                            begin
                                 // detalhes
                                 Print(M_POSINI, Format('%-8s', [uFuncoes.StrZero(cdsMesasEntregasMOV_PEDIDO.AsString,7)]),false);
                                 Print(M_POSINI, Format('%-10s',[cdsMesasEntregasMOV_DATAVENDA.AsString]),false);
                                 Print(M_POSINI, Format('%6s', [cdsMesasEntregasMOV_NRMESA.AsString]),false);
                                 Print(M_POSINI, Format('%12s', [FormatFloat('###,##0.#0', cdsMesasEntregasMOV_VALOR.AsFloat)]),false);
                                 Print(M_POSINI, Format('%11s', [FormatFloat('###,##0.#0', cdsMesasEntregasMOV_TAXA_SERVICO.AsFloat)]),True);
                                 Print(M_POSINI, Format('%-48s',['CLIENTE : '+ cdsMesasEntregasMOV_NOMECLIENTE.AsString]),TRUE);
                                 //Print(M_POSINI, Format('%-48s',[]),TRUE);
                                 //
                                 fTotalVenda    := fTotalVenda + cdsMesasEntregasMOV_VALOR.AsFloat;
                                 fTotalComissao := fTotalComissao + cdsMesasEntregasMOV_TAXA_SERVICO.AsFloat;
                                 //
                                 cdsMesasEntregas.Next;
                                 //
                            End;
                            //
                            Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',M_QTCARA )]),TRUE);
                            {Print(M_POSINI, Format('%-18s',['REGISTRO(S): ' + InttoStr(cdsMesasEntregas.RecordCount)]),false);
                            Print(M_POSINI, Format('%-10s',['TOTAL ==> :']),false);
                            Print(M_POSINI, Format('%10s',[FormatFloat('###,##0.#0', fTotalVenda)]),false);
                            Print(M_POSINI, Format('%10s',[FormatFloat('###,##0.#0', fTotalComissao)]),True);}
                            Print(M_POSINI, Format('%-18s', ['REGISTRO(S): ' + InttoStr(cdsMesasEntregas.RecordCount)]),false);
                            Print(M_POSINI, Format('%-6s', [uFuncoes.Replicate(' ',6)]),false);
                            Print(M_POSINI, Format('%12s', [FormatFloat('###,##0.#0', fTotalVenda)]),false);
                            Print(M_POSINI, Format('%11s', [FormatFloat('###,##0.#0', fTotalComissao)]),True);

                            { Salta uma linhas }
                            NewLine(2);
                            { Imprime separador}
                            Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('*',M_QTCARA )]),true);
                            Print(M_POSINI,Format('%-48s', [uFuncoes.PadC(Dm.CdsConfigCFG_MENS_RODAPE.AsString,M_QTCARA)]),true);
                            Print(M_POSINI,Format('%-48s', [uFuncoes.Replicate('*',M_QTCARA )]),true);
                            Print(M_POSINI,Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']),true);
                            { Salta uma linhas }
                            NewLine(2);
                            //
                            EndDoc;
                            FreeAndNil(VDOImpressora);
                     End;   // fim-with VDOImpressora
                   Finally

                   End;
                  //
                  End
                  Else
                      ShowMessage('Não há movimento para data indicada.');
            //
            If not (IsEmpty) Then
              begin
              End
              Else
                  Application.MessageBox(PChar('Não há movimento no período indicado!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       End;
end;

end.
