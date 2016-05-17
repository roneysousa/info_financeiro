unit uFrmRelTotVendCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmRelatorio, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, DBXpress,
  FMTBcd, DB, SqlExpr, Provider, DBClient, ppDB, ppVar, ppCtrls, ppBands,
  ppPrnabl, ppClass, ppCache, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport,
  RXSpin;

type
  TfrmRelTotVendCliente = class(TfrmRelatorio)
    Label2: TLabel;
    cmbNMLOJA: TComboBox;
    Label1: TLabel;
    cmbNMSECAO: TComboBox;
    Label3: TLabel;
    cmbSUBSECAO: TComboBox;
    Label4: TLabel;
    cmbFabricante: TComboBox;
    Label5: TLabel;
    edtDTINIC: TDateEdit;
    Label6: TLabel;
    edtDTFINI: TDateEdit;
    dstTotVendClientes: TSQLDataSet;
    dstTotVendido: TDataSetProvider;
    cdsTotalVendido: TClientDataSet;
    dsTotalVendido: TDataSource;
    cdsTotalVendidoHIS_LOJA: TIntegerField;
    cdsTotalVendidoMOV_CLIENTE: TIntegerField;
    cdsTotalVendidoMOV_NOMECLIENTE: TStringField;
    cdsTotalVendidoQUANT: TFMTBCDField;
    cdsTotalVendidoVALOR: TFMTBCDField;
    cdsTotalVendidoPERCENTUAL: TFloatField;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    txtEmpresa: TppLabel;
    txtPeriodo: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine4: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel7: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLine1: TppLine;
    ppLabel12: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    txtRelatorio: TppLabel;
    txtFabricante: TppLabel;
    txtSecao: TppLabel;
    txtSubsecao: TppLabel;
    lblTipo: TLabel;
    cmbMaisMenos: TComboBox;
    lbl_Limite: TLabel;
    edtLimite: TRxSpinEdit;
    dstMaisMenosProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsProdutosHIS_LOJA: TIntegerField;
    cdsProdutosHIS_PRODUTO: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosQUANT: TFMTBCDField;
    cdsProdutosVALOR: TFMTBCDField;
    cdsProdutosPERCENTUAL: TFloatField;
    dsProdutos: TDataSource;
    lblOrdem: TLabel;
    cmbOrdem: TComboBox;
    ppReport2: TppReport;
    ppDBPipProdutos: TppDBPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    lblEmpresa: TppLabel;
    ppLabel9: TppLabel;
    txtEmpresa2: TppLabel;
    txtPeriodo2: TppLabel;
    txtRelatorio1: TppLabel;
    txtFabricante2: TppLabel;
    txtSecao2: TppLabel;
    txtSubsecao2: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel15: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel16: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine8: TppLine;
    ppDBText7: TppDBText;
    ppLabel17: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    txtTipo: TppLabel;
    txtOrdem: TppLabel;
    txtLimite: TppLabel;
    ppLabel21: TppLabel;
    txtValor: TppLabel;
    txtQuant: TppLabel;
    ppDBText8: TppDBText;
    ppLine9: TppLine;
    ppReport3: TppReport;
    ppDBPLimite: TppDBPipeline;
    cdsLimite: TClientDataSet;
    dsProdutosLimites: TDataSource;
    cdsLimiteLOJA: TIntegerField;
    cdsLimitePRODUTO: TStringField;
    cdsLimiteDESCRICAO: TStringField;
    cdsLimiteQUANTIDADE: TFloatField;
    cdsLimiteVALOR: TCurrencyField;
    cdsLimitePERCENTUAL: TFloatField;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    txtEmpresa3: TppLabel;
    txtPeriodo3: TppLabel;
    txtRelatorio2: TppLabel;
    txtFabricante3: TppLabel;
    txtSecao3: TppLabel;
    txtSubsecao3: TppLabel;
    ppDBImage3: TppDBImage;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    txtTipo2: TppLabel;
    txtOrdem2: TppLabel;
    txtLimite1: TppLabel;
    ppLabel40: TppLabel;
    txtValor1: TppLabel;
    txtQuant1: TppLabel;
    ppLine12: TppLine;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine13: TppLine;
    ppLabel43: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel44: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLine14: TppLine;
    ppLabel45: TppLabel;
    ppDBCalc5: TppDBCalc;
    cdsLimiteFORNECEDOR: TStringField;
    cdsLimiteSECAO: TStringField;
    edtCDCLIE: TEdit;
    spLocCliente: TSpeedButton;
    cdsLimiteCOR: TStringField;
    cdsProdutosCOR_DESCRICAO: TStringField;
    cdsProdutosSEC_DESCRICAO: TStringField;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsNovoProdutos: TClientDataSet;
    cdsNovoProdutosMOV_LOJA: TIntegerField;
    cdsNovoProdutosPRO_DESCRICAO: TStringField;
    cdsNovoProdutosMOP_CODCOR: TIntegerField;
    cdsNovoProdutosQUANT: TIntegerField;
    cdsNovoProdutosVALOR: TFMTBCDField;
    cdsNovoProdutosPRO_CODIGO: TStringField;
    cdsNovoProdutosPERCENTUAL: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINIExit(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure cmbNMSECAOExit(Sender: TObject);
    procedure cmbNMSECAOEnter(Sender: TObject);
    procedure cdsTotalVendidoCalcFields(DataSet: TDataSet);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsNovoProdutosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SECOES;
    procedure SUBSECAO;
    procedure LOJAS;
    procedure FABRICANTE;
  public
    { Public declarations }
  end;

var
  frmRelTotVendCliente: TfrmRelTotVendCliente;
  M_TOTAL, M_QUANT : Double;
  M_NRFORM : INTEGER;

implementation

uses udmConsulta, uFuncoes, UFrmAdmin, Udm, uLocCliente;

{$R *.dfm}

{ TfrmRelTotVendCliente }

procedure TfrmRelTotVendCliente.FABRICANTE;
begin
     dmConsultas.cdsFornecedor.close;
     With dmConsultas.dstSubSecao do
     Begin
          Active := False;
          CommandText :=  'select FOR_CODIGO, FOR_FANTASIA, FOR_RAZAO from FORNECEDORES order by FOR_FANTASIA';
          Active := True;
     End;
     dmConsultas.cdsFornecedor.Open;
     dmConsultas.cdsFornecedor.First;
     //
     cmbFabricante.Clear;
     cmbFabricante.Items.Add(' ');
     While not (dmConsultas.cdsFornecedor.Eof) do
     Begin
          cmbFabricante.Items.Add(dmConsultas.cdsFornecedor.FieldByName('FOR_FANTASIA').AsString);
          //
          dmConsultas.cdsFornecedor.Next;
     End;
end;

procedure TfrmRelTotVendCliente.LOJAS;
begin
     With dmConsultas.qryLoja do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS');
          SQL.Add('order by EMP_FANTASIA');
          Open;
          First;
     End;
     //
     cmbNMLOJA.Clear;
     While not (dmConsultas.qryLoja.Eof) do
     Begin
          cmbNMLOJA.Items.Add(dmConsultas.qryLoja.FieldByName('EMP_FANTASIA').AsString);
          //
          dmConsultas.qryLoja.Next;
     End;
end;

procedure TfrmRelTotVendCliente.SECOES;
begin
     dmConsultas.cdsSecoes.Close;
     With dmConsultas.dstSecoes do
     Begin
          Active := False;
          CommandText :=  'Select * from SECAO order by SEC_DESCRICAO';
          Active := True;
     End;
     dmConsultas.cdsSecoes.Open;
     dmConsultas.cdsSecoes.First;
     //
     cmbNMSECAO.Clear;
     cmbNMSECAO.Items.Add(' ');
     While not (dmConsultas.cdsSecoes.Eof) do
     Begin
          If not uFuncoes.Empty(dmConsultas.cdsSecoes.FieldByName('SEC_DESCRICAO').AsString) Then
              cmbNMSECAO.Items.Add(dmConsultas.cdsSecoes.FieldByName('SEC_DESCRICAO').AsString);
          //
          dmConsultas.cdsSecoes.Next;
     End;
end;

procedure TfrmRelTotVendCliente.SUBSECAO;
begin
     dmConsultas.cdsSubSecao.Close;
     With dmConsultas.dstSubSecao do
     Begin
          Active := False;
          CommandText := 'Select * from SUBSECAO Where (SEC_CODIGO = :pSECAO) order by SUB_DESCRICAO';
          //
          Params.ParamByName('pSECAO').AsInteger := uFuncoes.CDSECAO(cmbNMSECAO.Text);
          Active := True;
     End;
     dmConsultas.cdsSubSecao.Open;
     //
     dmConsultas.cdsSubSecao.First;
     //
     cmbSUBSECAO.Clear;
     cmbSUBSECAO.Items.Add(' ');
     While not (dmConsultas.cdsSubSecao.Eof) do
     Begin
          If not uFuncoes.Empty(dmConsultas.cdsSubSecao.FieldByName('SUB_DESCRICAO').AsString) Then
              cmbSUBSECAO.Items.Add(dmConsultas.cdsSubSecao.FieldByName('SUB_DESCRICAO').AsString);
          //
          dmConsultas.cdsSubSecao.Next;
     End;
end;

procedure TfrmRelTotVendCliente.FormShow(Sender: TObject);
begin
  inherited;
    //
    If (M_NRFORM = 1) Then
    begin
         lblTipo.Visible := False;
         cmbMaisMenos.Visible := False;
         lbl_Limite.Visible := False;
         edtLimite.Visible  := False;
         lblOrdem.Visible   := False;
         cmbOrdem.Visible   := false;
    End
    Else
    begin
         lblTipo.Visible := True;
         cmbMaisMenos.Visible := True;
         lbl_Limite.Visible := True;
         edtLimite.Visible  := True;
         lblOrdem.Visible   := True;
         cmbOrdem.Visible   := True;
    End;
    //
    SECOES;
    LOJAS;
    FABRICANTE;
    //
    cmbNMLOJA.SetFocus;
    edtDTINIC.Date := Date();
    edtDTFINI.Date := Date();
end;

procedure TfrmRelTotVendCliente.edtDTINICExit(Sender: TObject);
begin
  inherited;
     If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC.Text);
            edtDTINIC.Date := StrToDate(edtDTINIC.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTINIC.Date := Date();
             edtDTINIC.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmRelTotVendCliente.edtDTFINIExit(Sender: TObject);
begin
  inherited;
     If (edtDTFINI.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINI.Text);
            //
            If (edtDTINIC.Date > edtDTFINI.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC.SetFocus;
                Exit;
            End;
            edtDTFINI.Date := StrToDate(edtDTFINI.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTFINI.Date := Date();
             edtDTFINI.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmRelTotVendCliente.btImprimirClick(Sender: TObject);
Var
  TD : TTransactionDesc;
  M_LIMITE : Integer;
begin
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
           Application.MessageBox('Selecione a loja!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbNMLOJA.SetFocus;
           Exit;
     End;
     //
     If (edtDTINIC.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite a período inicial!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC.SetFocus;
           Exit;
     End;
     //
     If (edtDTFINI.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite a período final!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTFINI.SetFocus;
           Exit;
     End;
     //
     If (edtDTINIC.Date > edtDTFINI.Date) Then
     Begin
           Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC.SetFocus;
           Exit;
     End;
     //
  btImprimir.Enabled := False;
  Try
    Screen.Cursor := crHourGlass;
    //
    If (M_NRFORM = 1) Then
    begin
      Try
          // Inicia um transação no BD
           TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
           TD.IsolationLevel := xilREADCOMMITTED;
           Dm.SqlAdmin.StartTransaction(TD);
           //
           M_TOTAL := 0;
           //
           With cdsTotalVendido do
            begin
                 Close;
                 CommandText := 'Select H.HIS_LOJA, M.MOV_CLIENTE, M.MOV_NOMECLIENTE, ';
                 If not uFuncoes.Empty(cmbFabricante.Text) Then
                   CommandText :=  CommandText  + ' P.FOR_CODIGO, ';
                 //  
                 CommandText :=  CommandText  + ' Sum(H.HIS_MOVIMENTO) as QUANT, ' +
                                'Sum(H.HIS_VLVENDA) as VALOR '+
                                'FROM HISTORICO H '+
                                'INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO '+
                                'INNER join VENDAS M ON H.HIS_DOCUMENTO = M.MOV_PEDIDO '+
                                'Where (H.HIS_LOJA = :pLOJA) '+
                                'AND (H.HIS_DATA >= :pDTINICIAL) AND (H.HIS_DATA <= :pDTFINAL) '+
                                'AND (H.HIS_TIPO = :pTIPO) ';
                                if not uFuncoes.Empty(cmbFabricante.Text) Then
                                    CommandText := CommandText + ' and (P.FOR_CODIGO = :pFORNECEDOR) ';
                                If not uFuncoes.Empty(cmbNMSECAO.Text) Then
                                    CommandText := CommandText + ' and (P.SEC_CODIGO = :pSECAO) ';
                                If not uFuncoes.Empty(cmbSUBSECAO.Text) Then
                                    CommandText := CommandText + ' and (P.SUB_CODIGO = :pSUBSECAO) ';
                 CommandText := CommandText + 'Group by H.HIS_LOJA, M.MOV_CLIENTE, M.MOV_NOMECLIENTE ';
                 If not uFuncoes.Empty(cmbFabricante.Text) Then
                   CommandText :=  CommandText  + ', P.FOR_CODIGO ';
                 //
                 CommandText := CommandText +'Order by M.MOV_NOMECLIENTE ';
                 //
                 Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                 Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate   := edtDTFINI.Date;
                 Params.ParamByName('pTIPO').AsString    := 'V';
                 if not uFuncoes.Empty(cmbFabricante.Text) Then
                      Params.ParamByName('pFORNECEDOR').AsInteger := uFuncoes.CDFABRICANTE(cmbFabricante.Text);
                 If not uFuncoes.Empty(cmbNMSECAO.Text) Then
                      Params.ParamByName('pSECAO').AsInteger      := uFuncoes.CDSECAO(cmbNMSECAO.Text);
                 If not uFuncoes.Empty(cmbSUBSECAO.Text) Then
                      Params.ParamByName('pSUBSECAO').AsInteger   := uFuncoes.CDSUBSECAO(uFuncoes.CDSECAO(cmbNMSECAO.Text), cmbSUBSECAO.Text);
                 Open;
                 //
                 First;
                 While not (EoF) do
                  begin
                       M_TOTAL := M_TOTAL + FieldByName('VALOR').AsCurrency;
                       //
                       Next;
                  End;
                  //
                  First;
                  //
                  If not (IsEmpty) Then
                   begin
                         With ppReport1 do
                          begin
                               txtRelatorio.Caption := 'RELAÇÃO DE TOTAL VENDIDO POR CLIENTE';
                               txtEmpresa.Caption := cmbNMLOJA.Text;
                               txtPeriodo.Caption := edtDTINIC.Text + ' À '+ edtDTFINI.Text;
                               If not uFuncoes.Empty(cmbFabricante.Text) Then
                                  txtFabricante.Caption := 'FORNECEDOR : '+cmbFabricante.Text
                               Else
                                  txtFabricante.Caption := 'FORNECEDOR : TODOS';
                               //
                               If not uFuncoes.Empty(cmbNMSECAO.Text) Then
                                  txtSecao.Caption := 'SEÇÃO : '+cmbNMSECAO.Text
                               Else
                                  txtSecao.Caption := 'SEÇÃO : TODAS';
                               //
                               If not uFuncoes.Empty(cmbSUBSECAO.Text) Then
                                  txtSubsecao.Caption := 'SUBSEÇÃO : '+cmbSUBSECAO.Text
                               Else
                                  txtSubsecao.Caption := 'SUBSEÇÃO : TODAS';
                               //
                               PrintReport;
                          End;
                   End
                   Else
                   begin
                        Application.MessageBox('Não há movimento para loja no período indicado.','ATENÇÃO',
                          MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                        cmbNMLOJA.SetFocus;
                   End;
            End;
           // Grava
           Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
      Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar gerar relatório!!!'+#13
                        + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //  Cancelar transação no BD.
                Dm.SqlAdmin.Rollback(TD);
          End;
      End;
    End;
    //
    If (M_NRFORM = 2) Then
      begin
          // Inicia um transação no BD
          TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
          TD.IsolationLevel := xilREADCOMMITTED;
          Dm.SqlAdmin.StartTransaction(TD);
          try
           M_TOTAL := 0;
           M_QUANT := 0;
           //
           With cdsNovoProdutos do
            begin
                 Close;
                 CommandText := 'Select M.MOV_LOJA, P.PRO_DESCRICAO, P.PRO_CODIGO,  '+
                                ' PV.MOP_CODCOR, Count(*) as QUANT, Sum(PV.MOP_VALOR) as VALOR '+
                                ' FROM VENDAS M '+
                                ' INNER join PROVENDAS PV ON PV.MOP_PEDIDO = M.MOV_PEDIDO '+
                                ' INNER join PRODUTOS P ON PV.MOP_PRODUTO = P.PRO_CODIGO '+
                                ' Where (M.MOV_LOJA = :pLOJA) '+
                                ' AND (M.MOV_DATAVENDA >= :pDTINICIAL) AND (M.MOV_DATAVENDA <= :pDTFINAL) '+
                                ' AND (M.MOV_SITUACAO = :pTIPO) ';
                                if not uFuncoes.Empty(cmbFabricante.Text) Then
                                    CommandText := CommandText + ' and (P.FOR_CODIGO = '+QuotedStr(inttostr(uFuncoes.CDFABRICANTE(cmbFabricante.Text))) + ')';
                                    //CommandText := CommandText + ' and (P.FOR_CODIGO = :pFORNECEDOR) ';
                                If not uFuncoes.Empty(cmbNMSECAO.Text) Then
                                    CommandText := CommandText + ' and (P.SEC_CODIGO = '+QuotedStr(InttoStr(uFuncoes.CDSECAO(cmbNMSECAO.Text))) +') ';
                                    //CommandText := CommandText + ' and (P.SEC_CODIGO = :pSECAO) ';
                                If not uFuncoes.Empty(cmbSUBSECAO.Text) Then
                                    CommandText := CommandText + ' and (P.SUB_CODIGO = '+QuotedStr(InttoStr(uFuncoes.CDSUBSECAO(uFuncoes.CDSECAO(cmbNMSECAO.Text), cmbSUBSECAO.Text))) +') ';
                                    //CommandText := CommandText + ' and (P.SUB_CODIGO = :pSUBSECAO) ';
                 CommandText := CommandText + 'Group by M.MOV_LOJA, P.PRO_DESCRICAO, P.PRO_CODIGO, PV.MOP_CODCOR  ';
                 //
                 If (cmbOrdem.ItemIndex = 0) and (cmbMaisMenos.ItemIndex = 0) Then
                 begin
                     CommandText := CommandText + ' Order by Sum(PV.MOP_VALOR) desc ';
                     txtTipo.Caption  := 'MAIS VENDIDOS';
                     txtOrdem.Caption := 'VALOR';
                     //
                     If (edtLimite.AsInteger > 0) Then
                      begin
                           txtTipo2.Caption  := 'MAIS VENDIDOS';
                           txtOrdem2.Caption := 'VALOR';
                      End;
                 End;
                 If (cmbOrdem.ItemIndex = 0) and (cmbMaisMenos.ItemIndex = 1) Then
                 begin
                     CommandText := CommandText + ' Order by Sum(PV.MOP_VALOR)';
                     txtTipo.Caption  := 'MENOS VENDIDOS';
                     txtOrdem.Caption := 'VALOR';
                     If (edtLimite.AsInteger > 0) Then
                      begin
                           txtTipo2.Caption  := 'MENOS VENDIDOS';
                           txtOrdem2.Caption := 'VALOR';
                      End;
                 End;
                 If (cmbOrdem.ItemIndex = 1) and (cmbMaisMenos.ItemIndex = 0) Then
                 begin
                     CommandText := CommandText + ' Order by QUANT desc ';
                     txtTipo.Caption  := 'MAIS VENDIDOS';
                     txtOrdem.Caption := 'QUANTIDADE';
                     If (edtLimite.AsInteger > 0) Then
                      begin
                           txtTipo2.Caption  := 'MAIS VENDIDOS';
                           txtOrdem2.Caption := 'QUANTIDADE';
                      End;
                 End;
                 If (cmbOrdem.ItemIndex = 1) and (cmbMaisMenos.ItemIndex = 1) Then
                 begin
                     CommandText := CommandText + ' Order by QUANT';
                     txtTipo.Caption  := 'MENOS VENDIDOS';
                     txtOrdem.Caption := 'QUANTIDADE';
                     If (edtLimite.AsInteger > 0) Then
                      begin
                          txtTipo2.Caption  := 'MENOS VENDIDOS';
                          txtOrdem2.Caption := 'QUANTIDADE';
                      End;
                 End;
                 //
                 Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                 Params.ParamByName('pDTINICIAL').AsDateTime := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDateTime   := edtDTFINI.Date;
                 Params.ParamByName('pTIPO').AsString    := 'F';
                 {if not uFuncoes.Empty(cmbFabricante.Text) Then
                      Params.ParamByName('pFORNECEDOR').AsInteger := uFuncoes.CDFABRICANTE(cmbFabricante.Text);
                 If not uFuncoes.Empty(cmbNMSECAO.Text) Then
                      Params.ParamByName('pSECAO').AsInteger      := uFuncoes.CDSECAO(cmbNMSECAO.Text);
                 If not uFuncoes.Empty(cmbSUBSECAO.Text) Then
                      Params.ParamByName('pSUBSECAO').AsInteger   := uFuncoes.CDSUBSECAO(uFuncoes.CDSECAO(cmbNMSECAO.Text), cmbSUBSECAO.Text);}
                 //
                 //FetchParams;
                 Open;
                 //
                 First;
                 While not (EoF) do
                  begin
                       M_TOTAL := M_TOTAL + FieldByName('VALOR').AsCurrency;
                       M_QUANT := M_QUANT + FieldByName('QUANT').AsFloat;
                       //
                       Next;
                  End;
                  //
                  First;
           //
           {With cdsProdutos do
            begin
                 Close;
                 CommandText := 'Select H.HIS_LOJA, H.HIS_PRODUTO, P.PRO_DESCRICAO, C.COR_DESCRICAO, S.SEC_DESCRICAO , SUM(H.HIS_MOVIMENTO) as QUANT,' +
                                'Sum(H.HIS_VLVENDA) as VALOR '+
                                'FROM HISTORICO H '+
                                'INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO '+
                                'INNER join CORES    C ON P.PRO_COR = C.COR_CODIGO '+
                                'INNER join SECAO    S ON P.SEC_CODIGO = S.SEC_CODIGO '+
                                'Where (H.HIS_LOJA = :pLOJA) '+
                                'AND (H.HIS_DATA >= :pDTINICIAL) AND (H.HIS_DATA <= :pDTFINAL) '+
                                'AND (H.HIS_TIPO = :pTIPO) ';
                                if not uFuncoes.Empty(cmbFabricante.Text) Then
                                    CommandText := CommandText + ' and (P.FOR_CODIGO = :pFORNECEDOR) ';
                                If not uFuncoes.Empty(cmbNMSECAO.Text) Then
                                    CommandText := CommandText + ' and (P.SEC_CODIGO = :pSECAO) ';
                                If not uFuncoes.Empty(cmbSUBSECAO.Text) Then
                                    CommandText := CommandText + ' and (P.SUB_CODIGO = :pSUBSECAO) ';
                 CommandText := CommandText + 'Group by H.HIS_LOJA, H.HIS_PRODUTO, P.PRO_DESCRICAO, C.COR_DESCRICAO, S.SEC_DESCRICAO ';
                 //
                 If (cmbOrdem.ItemIndex = 0) and (cmbMaisMenos.ItemIndex = 0) Then
                 begin
                     CommandText := CommandText + 'Order by Sum(H.HIS_VLVENDA) desc ';
                     txtTipo.Caption  := 'MAIS VENDIDOS';
                     txtOrdem.Caption := 'VALOR';
                     //
                     If (edtLimite.AsInteger > 0) Then
                      begin
                           txtTipo2.Caption  := 'MAIS VENDIDOS';
                           txtOrdem2.Caption := 'VALOR';
                      End;
                 End;
                 If (cmbOrdem.ItemIndex = 0) and (cmbMaisMenos.ItemIndex = 1) Then
                 begin
                     CommandText := CommandText + 'Order by Sum(H.HIS_VLVENDA)';
                     txtTipo.Caption  := 'MENOS VENDIDOS';
                     txtOrdem.Caption := 'VALOR';
                     If (edtLimite.AsInteger > 0) Then
                      begin
                           txtTipo2.Caption  := 'MENOS VENDIDOS';
                           txtOrdem2.Caption := 'VALOR';
                      End;
                 End;
                 If (cmbOrdem.ItemIndex = 1) and (cmbMaisMenos.ItemIndex = 0) Then
                 begin
                     CommandText := CommandText + 'Order by Sum(H.HIS_MOVIMENTO) desc ';
                     txtTipo.Caption  := 'MAIS VENDIDOS';
                     txtOrdem.Caption := 'QUANTIDADE';
                     If (edtLimite.AsInteger > 0) Then
                      begin
                           txtTipo2.Caption  := 'MAIS VENDIDOS';
                           txtOrdem2.Caption := 'QUANTIDADE';
                      End;
                 End;
                 If (cmbOrdem.ItemIndex = 1) and (cmbMaisMenos.ItemIndex = 1) Then
                 begin
                     CommandText := CommandText + 'Order by Sum(H.HIS_MOVIMENTO)';
                     txtTipo.Caption  := 'MENOS VENDIDOS';
                     txtOrdem.Caption := 'QUANTIDADE';
                     If (edtLimite.AsInteger > 0) Then
                      begin
                          txtTipo2.Caption  := 'MENOS VENDIDOS';
                          txtOrdem2.Caption := 'QUANTIDADE';
                      End;
                 End;
                 //
                 Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                 Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate   := edtDTFINI.Date;
                 Params.ParamByName('pTIPO').AsString    := 'V';
                 if not uFuncoes.Empty(cmbFabricante.Text) Then
                      Params.ParamByName('pFORNECEDOR').AsInteger := uFuncoes.CDFABRICANTE(cmbFabricante.Text);
                 If not uFuncoes.Empty(cmbNMSECAO.Text) Then
                      Params.ParamByName('pSECAO').AsInteger      := uFuncoes.CDSECAO(cmbNMSECAO.Text);
                 If not uFuncoes.Empty(cmbSUBSECAO.Text) Then
                      Params.ParamByName('pSUBSECAO').AsInteger   := uFuncoes.CDSUBSECAO(uFuncoes.CDSECAO(cmbNMSECAO.Text), cmbSUBSECAO.Text);
                 Open;
                 //
                 First;
                 While not (EoF) do
                  begin
                       M_TOTAL := M_TOTAL + FieldByName('VALOR').AsCurrency;
                       M_QUANT := M_QUANT + FieldByName('QUANT').AsFloat;
                       //
                       Next;
                  End;
                  //
                  First;}
                  //
                  If (edtLimite.AsInteger > 0) then
                    begin
                         cdsLimite.Close;
                         cdsLimite.Open;
                         cdsLimite.EmptyDataSet;
                         //
                         M_LIMITE := 1;
                         While not (Eof) and (M_LIMITE <= edtLimite.AsInteger) do
                          begin
                               cdsLimite.Append;
                               cdsLimite.FieldByName('LOJA').AsInteger     := FieldByName('MOV_LOJA').AsInteger;
                               cdsLimite.FieldByName('PRODUTO').AsString   := FieldByName('PRO_CODIGO').AsString;
                               cdsLimite.FieldByName('DESCRICAO').AsString := FieldByName('PRO_DESCRICAO').AsString;
                               cdsLimite.FieldByName('QUANTIDADE').AsFloat := FieldByName('QUANT').AsFloat;
                               cdsLimite.FieldByName('VALOR').AsCurrency   := FieldByName('VALOR').AsCurrency;
                               cdsLimite.FieldByName('PERCENTUAL').AsFloat := FieldByName('PERCENTUAL').AsFloat;
                               cdsLimite.FieldByName('FORNECEDOR').AsString := uFuncoes.NOME_FORNECEDOR(FieldByName('PRO_CODIGO').AsString);
                               cdsLimite.FieldByName('SECAO').AsString     := uFuncoes.NOME_SECAO(FieldByName('PRO_CODIGO').AsString);
                               cdsLimite.FieldByName('COR').AsString       := uFuncoes.GetCor(FieldByName('MOP_CODCOR').AsInteger);
                               {                               cdsLimite.FieldByName('LOJA').AsInteger     := FieldByName('HIS_LOJA').AsInteger;
                               cdsLimite.FieldByName('PRODUTO').AsString   := FieldByName('HIS_PRODUTO').AsString;
                               cdsLimite.FieldByName('DESCRICAO').AsString := FieldByName('PRO_DESCRICAO').AsString;
                               cdsLimite.FieldByName('QUANTIDADE').AsFloat := FieldByName('QUANT').AsFloat;
                               cdsLimite.FieldByName('VALOR').AsCurrency   := FieldByName('VALOR').AsCurrency;
                               cdsLimite.FieldByName('PERCENTUAL').AsFloat := FieldByName('PERCENTUAL').AsFloat;
                               cdsLimite.FieldByName('FORNECEDOR').AsString := uFuncoes.NOME_FORNECEDOR(FieldByName('HIS_PRODUTO').AsString);
                               cdsLimite.FieldByName('SECAO').AsString     := uFuncoes.NOME_SECAO(FieldByName('HIS_PRODUTO').AsString);
                               cdsLimite.FieldByName('COR').AsString       := FieldByName('COR_DESCRICAO').AsString;}
                               //uFuncoes.GetCor();
                               cdsLimite.Post;
                               //
                               M_LIMITE := M_LIMITE + 1;
                               //
                               Next;
                          End;
                    End;
                  //
                  If not (IsEmpty) Then
                   begin
                      If (edtLimite.AsInteger = 0) then
                      begin
                         With ppReport2 do
                          begin
                               txtRelatorio1.Caption := 'RELAÇÃO DE PRODUTOS MAIS E MENOS VENDIDOS';
                               txtEmpresa2.Caption := cmbNMLOJA.Text;
                               txtPeriodo2.Caption := edtDTINIC.Text + ' À '+ edtDTFINI.Text;
                               If (edtLimite.AsInteger = 0) Then
                                   txtLimite.Caption := 'TODOS'
                               Else
                                   txtLimite.Caption := edtLimite.Text + ' '+cmbMaisMenos.Text;
                               If not uFuncoes.Empty(cmbFabricante.Text) Then
                                  txtFabricante2.Caption := 'FORNECEDOR : '+cmbFabricante.Text
                               Else
                                  txtFabricante2.Caption := 'FORNECEDOR : TODOS';
                               //
                               If not uFuncoes.Empty(cmbNMSECAO.Text) Then
                                  txtSecao2.Caption := 'SEÇÃO : '+cmbNMSECAO.Text
                               Else
                                  txtSecao2.Caption := 'SEÇÃO : TODAS';
                               //
                               If not uFuncoes.Empty(cmbSUBSECAO.Text) Then
                                  txtSubsecao2.Caption := 'SUBSEÇÃO : '+cmbSUBSECAO.Text
                               Else
                                  txtSubsecao2.Caption := 'SUBSEÇÃO : TODAS';
                               //
                               txtValor.Caption := FormatFloat('###,##0.#0',M_TOTAL);
                               txtQuant.Caption := FormatFloat('###,##0.#00',M_QUANT);
                               //
                               PrintReport;
                          End;
                      End
                      Else
                      begin
                         With ppReport3 do
                          begin
                               txtRelatorio2.Caption := 'RELAÇÃO DE PRODUTOS MAIS E MENOS VENDIDOS';
                               txtEmpresa3.Caption := cmbNMLOJA.Text;
                               txtPeriodo3.Caption := edtDTINIC.Text + ' À '+ edtDTFINI.Text;
                               txtLimite1.Caption := edtLimite.Text + ' '+cmbMaisMenos.Text;
                               //
                               If not uFuncoes.Empty(cmbFabricante.Text) Then
                                  txtFabricante3.Caption := 'FORNECEDOR : '+cmbFabricante.Text
                               Else
                                  txtFabricante3.Caption := 'FORNECEDOR : TODOS';
                               //
                               If not uFuncoes.Empty(cmbNMSECAO.Text) Then
                                  txtSecao3.Caption := 'SEÇÃO : '+cmbNMSECAO.Text
                               Else
                                  txtSecao3.Caption := 'SEÇÃO : TODAS';
                               //
                               If not uFuncoes.Empty(cmbSUBSECAO.Text) Then
                                  txtSubsecao3.Caption := 'SUBSEÇÃO : '+cmbSUBSECAO.Text
                               Else
                                  txtSubsecao3.Caption := 'SUBSEÇÃO : TODAS';
                               //
                               txtValor1.Caption := FormatFloat('###,##0.#0',M_TOTAL);
                               txtQuant1.Caption := FormatFloat('###,##0.#00',M_QUANT);
                               //
                               PrintReport;
                          End;
                      End;
                   End
                   Else
                   begin
                        Application.MessageBox('Não há movimento para loja no período indicado.','ATENÇÃO',
                          MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                        cmbNMLOJA.SetFocus;
                   End;
            End;   
               // Grava
               Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
          Except
            on Exc:Exception do
            begin
                  Application.MessageBox(PChar('Erro ao tentar gerar relatório!!!'+#13
                          + Exc.Message),
                        'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                  //  Cancelar transação no BD.
                  Dm.SqlAdmin.Rollback(TD);
            End;
          End;

      End;  
  Finally
        btImprimir.Enabled := True;
        Screen.Cursor := crDefault;
  End;
  Application.ProcessMessages;
end;

procedure TfrmRelTotVendCliente.cmbNMSECAOExit(Sender: TObject);
begin
  inherited;
      If not uFuncoes.Empty(cmbNMSECAO.Text) Then
         SUBSECAO;
end;

procedure TfrmRelTotVendCliente.cmbNMSECAOEnter(Sender: TObject);
begin
  inherited;
       cmbSUBSECAO.Clear;  
end;

procedure TfrmRelTotVendCliente.cdsTotalVendidoCalcFields(
  DataSet: TDataSet);
begin
   if (M_TOTAL > 0) Then
    cdsTotalVendidoPERCENTUAL.AsFloat :=
               (cdsTotalVendidoVALOR.AsFloat / M_TOTAL ) * 100;
end;

procedure TfrmRelTotVendCliente.cdsProdutosCalcFields(DataSet: TDataSet);
begin
   if (M_TOTAL > 0) Then
    cdsProdutosPERCENTUAL.AsFloat :=
               (cdsProdutosVALOR.AsFloat / M_TOTAL ) * 100;
end;

procedure TfrmRelTotVendCliente.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClienteClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          //
     End;
end;

procedure TfrmRelTotVendCliente.spLocClienteClick(Sender: TObject);
begin
  inherited;
  edtCDCLIE.SetFocus;
  with TfrmLocCliente.create(self) do
  try
    uLocCliente.M_NRFROM := 5;
    showmodal;
  finally
    If not (cdsConsultaCliente.IsEmpty) Then
       edtCDCLIE.Text := uFuncoes.StrZero(cdsConsultaCliente.FieldByname('CLI_CODIGO').AsString,7);
    free;
  end;
end;

procedure TfrmRelTotVendCliente.edtCDCLIEExit(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
      begin
           edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
           If not (dmConsultas.BUSCA_CLIENTE(StrtoInt(edtCDCLIE.Text))) Then
            begin
                 Application.MessageBox(PChar('Código de cliente não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edtCDCLIE.Clear;
                 edtCDCLIE.SetFocus;
                 Exit;
            End;
      End;
end;

procedure TfrmRelTotVendCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      cdsTotalVendido.Close;
      cdsProdutos.Close;
end;

procedure TfrmRelTotVendCliente.cdsNovoProdutosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
   if (M_TOTAL > 0) Then
    cdsNovoProdutosPERCENTUAL.AsFloat :=
               (cdsNovoProdutosVALOR.AsFloat / M_TOTAL ) * 100;
end;

end.
