unit uFrmRelTotVendFabricante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmRelatorio, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, DBXpress,
  FMTBcd, DB, SqlExpr, DBClient, Provider, ppPrnabl, ppClass, ppCtrls,
  ppBands, ppCache, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport,
  ppVar;

type
  TfrmRelTotalVendidoFabricante = class(TfrmRelatorio)
    Label2: TLabel;
    cmbNMLOJA: TComboBox;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    Label3: TLabel;
    edtDTFINI: TDateEdit;
    dstTotVendido: TSQLDataSet;
    dspTotalVendidos: TDataSetProvider;
    cdsTotalVendido: TClientDataSet;
    dsTotalVendido: TDataSource;
    cdsTotalVendidoFOR_FANTASIA: TStringField;
    cdsTotalVendidoQUANT: TFMTBCDField;
    cdsTotalVendidoVALOR: TFMTBCDField;
    cdsTotalVendidoPERCENTUAL: TFloatField;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    txtEmpresa: TppLabel;
    txtPeriodo: TppLabel;
    ppLabel12: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine4: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBImage1: TppDBImage;
    ppLabel7: TppLabel;
    ppDBCalc4: TppDBCalc;
    txtRelatorio: TppLabel;
    cdsFabricantes: TClientDataSet;
    dsFabricante: TDataSource;
    cmbFabricante: TComboBox;
    Label4: TLabel;
    ppReport2: TppReport;
    ppDBPFabricante: TppDBPipeline;
    dstFabricante: TSQLDataSet;
    dspFabricantes: TDataSetProvider;
    cdsFabricantesFOR_FANTASIA: TStringField;
    cdsFabricantesMOV_PEDIDO: TIntegerField;
    cdsFabricantesCLI_FANTASIA: TStringField;
    cdsFabricantesCID_NOME: TStringField;
    cdsFabricantesVALOR: TFMTBCDField;
    ppHeaderBand2: TppHeaderBand;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    txtEmpresa2: TppLabel;
    txtPeriodo2: TppLabel;
    ppDBImage2: TppDBImage;
    txtRelatorio2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine7: TppLine;
    ppLabel19: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel20: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLine8: TppLine;
    ppDBCalc5: TppDBCalc;
    ppLabel21: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppLabel22: TppLabel;
    ppLine9: TppLine;
    ppDBCalc9: TppDBCalc;
    txtFornecedor: TppLabel;
    cdsFabricantesPEDIDO: TStringField;
    cdsFabricantesMOV_DATAVENDA: TDateField;
    ppDBText8: TppDBText;
    ppLabel16: TppLabel;
    ppLine10: TppLine;
    cdsTotalVendidoHIS_LOJA: TIntegerField;
    dstDados: TSQLDataSet;
    dspDados: TDataSetProvider;
    cdsDados: TClientDataSet;
    dsDados: TDataSource;
    cdsDadosMOV_LOJA: TIntegerField;
    cdsDadosMOV_PEDIDO: TIntegerField;
    cdsDadosMOV_DATAVENDA: TDateField;
    cdsDadosCLI_RAZAO: TStringField;
    cdsDadosCLI_FANTASIA: TStringField;
    cdsDadosCID_NOME: TStringField;
    cdsDadosFOR_FANTASIA: TStringField;
    cdsDadosMOV_VALOR: TFMTBCDField;
    ppReport3: TppReport;
    ppDBPipeline2: TppDBPipeline;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppDBImage3: TppDBImage;
    txtRelatorio3: TppLabel;
    ppLabel18: TppLabel;
    ppLabel23: TppLabel;
    txtFornecedor3: TppLabel;
    txtPeriodo3: TppLabel;
    txtEmpresa3: TppLabel;
    ppLabel27: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel17: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel24: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppDBText11: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine14: TppLine;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLine15: TppLine;
    ppDBCalc6: TppDBCalc;
    ppLabel31: TppLabel;
    ppDBCalc7: TppDBCalc;
    dstLojas: TSQLDataSet;
    dspLojas: TDataSetProvider;
    cdsLojas: TClientDataSet;
    cdsLojasEMP_CODIGO: TIntegerField;
    cdsLojasEMP_FANTASIA: TStringField;
    dstFornecedor: TSQLDataSet;
    dspFornecedor: TDataSetProvider;
    cdsFornecedor: TClientDataSet;
    cdsFornecedorFOR_CODIGO: TIntegerField;
    cdsFornecedorFOR_FANTASIA: TStringField;
    cdsFornecedorFOR_RAZAO: TStringField;
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINIExit(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsTotalVendidoCalcFields(DataSet: TDataSet);
    procedure cdsFabricantesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure LOJAS;
    procedure FABRICANTE;
  public
    { Public declarations }
  end;

var
  frmRelTotalVendidoFabricante: TfrmRelTotalVendidoFabricante;
  M_TOTAL : Double;

implementation

uses udmConsulta, uFuncoes, UFrmAdmin, Udm, DateUtils;

{$R *.dfm}

{ TfrmRelTotalVendidoFabricante }

procedure TfrmRelTotalVendidoFabricante.LOJAS;
begin
     {With dmConsultas.qryLoja do
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
     End; }

     Dm.RefreshCDS(cdsLojas);
     //
     cmbNMLOJA.Clear;
     cdsLojas.First;
     While not (cdsLojas.Eof) do
     Begin
          cmbNMLOJA.Items.Add(cdsLojas.FieldByName('EMP_FANTASIA').AsString);
          //
          cdsLojas.Next;
     End;
end;

procedure TfrmRelTotalVendidoFabricante.edtDTINICExit(Sender: TObject);
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

procedure TfrmRelTotalVendidoFabricante.edtDTFINIExit(Sender: TObject);
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

procedure TfrmRelTotalVendidoFabricante.btImprimirClick(Sender: TObject);
Var
  TD : TTransactionDesc;
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
     Try
         // Inicia um transação no BD
         TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
         TD.IsolationLevel := xilREADCOMMITTED;
         Dm.SqlAdmin.StartTransaction(TD);
         //
         M_TOTAL := 0;
         //
         If uFuncoes.Empty(cmbFabricante.Text) Then
         begin
           With cdsTotalVendido do
            begin
                 Close;
                 Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                 Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate   := edtDTFINI.Date;
                 Params.ParamByName('pTIPO').AsString    := 'V';
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
                               txtRelatorio.Caption := 'RELAÇÃO DE TOTAL VENDIDO POR FABRICANTE';
                               txtEmpresa.Caption := cmbNMLOJA.Text;
                               txtPeriodo.Caption := edtDTINIC.Text + ' À '+ edtDTFINI.Text;
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
         End
         Else
         begin
              With cdsFabricantes do
                begin
                     Close;
                     //
                    If (Dm.CdsConfigCFG_TELA_PEDIDO.AsInteger = 1 ) Then
                    begin
                        With ppReport3, cdsDados do
                          begin
                               Close;
                               CommandText := 'Select V.MOV_LOJA, V.MOV_PEDIDO, V.MOV_DATAVENDA, C.cli_razao, C.CLI_FANTASIA, CI.CID_NOME, '
                                    + 'F.FOR_FANTASIA, V.MOV_VALOR '
                                    + 'FROM VENDAS V '
                                    + 'INNER join CLIENTES C ON V.MOV_CLIENTE = C.CLI_CODIGO '
                                    + 'INNER join CIDADES CI ON C.CID_CODIGO = CI.CID_CODIGO '
                                    + 'INNER join PROVENDAS PV ON PV.MOP_PEDIDO = V.MOV_PEDIDO '
                                    + 'INNER join PRODUTOS P ON P.PRO_CODIGO = PV.MOP_PRODUTO '
                                    + 'INNER join FORNECEDORES F ON F.FOR_CODIGO = P.FOR_CODIGO '
                                    + ' Where (V.MOV_LOJA = :pLOJA) '
                                    + ' AND (V.MOV_DATAVENDA >= :pDTINICIAL) AND (V.MOV_DATAVENDA <= :pDTFINAL) '
                                    + ' AND (V.MOV_SITUACAO = :pTIPO) ';
                               //
                               If not uFuncoes.Empty(cmbFabricante.Text) Then
                                   CommandText := CommandText + ' And (F.FOR_CODIGO = '+ QuotedStr(InttoStr(uFuncoes.CDFABRICANTE(cmbFabricante.Text) ))+') ';
                               //
                               CommandText := CommandText + 'Group by V.MOV_LOJA, V.MOV_PEDIDO, V.MOV_DATAVENDA, ';
                               CommandText := CommandText + 'C.cli_razao, C.CLI_FANTASIA, CI.CID_NOME, ';
                               CommandText := CommandText + 'F.FOR_FANTASIA, V.MOV_VALOR ';
                               //
                               CommandText := CommandText + ' order by V.MOV_PEDIDO, V.MOV_DATAVENDA ';
                               Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                               Params.ParamByName('pDTINICIAL').AsDateTime := edtDTINIC.Date;
                               Params.ParamByName('pDTFINAL').AsDateTime   := edtDTFINI.Date;
                               Params.ParamByName('pTIPO').AsString    := 'F';
                               FetchParams;
                               Open;
                               //
                               If not (IsEmpty) Then
                               begin
                                     txtRelatorio3.Caption := 'RELAÇÃO DE TOTAL VENDIDO POR FABRICANTE';
                                     txtEmpresa3.Caption   := cmbNMLOJA.Text;
                                     txtPeriodo3.Caption   := edtDTINIC.Text + ' À '+edtDTFINI.Text;
                                     txtFornecedor3.Caption := 'FORNECEDOR : '+cmbFabricante.Text;
                                     //
                                     PrintReport;
                               End
                               Else
                               begin
                                    Application.MessageBox('Não há movimento para loja no período indicado.','ATENÇÃO',
                                       MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                                    cmbNMLOJA.SetFocus;
                               End;
                          End;
                    End
                    Else
                    begin
                     CommandText := 'Select H.HIS_LOJA, F.FOR_FANTASIA, V.MOV_PEDIDO, V.MOV_DATAVENDA, C.CLI_FANTASIA, CI.CID_NOME, '+
                                    ' Sum(H.HIS_VLVENDA) as VALOR '+
                                    ' FROM HISTORICO H '+
                                    ' INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO '+
                                    ' INNER join FORNECEDORES F ON P.FOR_CODIGO = F.FOR_CODIGO '+
                                    ' INNER join VENDAS V ON H.HIS_DOCUMENTO = V.MOV_PEDIDO '+
                                    ' INNER join CLIENTES C ON V.MOV_CLIENTE = C.CLI_CODIGO '+
                                    ' INNER join CIDADES CI ON C.CID_CODIGO = CI.CID_CODIGO '+
                                    ' Where (H.HIS_LOJA = :pLOJA) '+
                                    ' AND (H.HIS_DATA >= :pDTINICIAL) AND (H.HIS_DATA <= :pDTFINAL) '+
                                    ' AND (H.HIS_TIPO = :pTIPO) ';
                    //
                     If not uFuncoes.Empty(cmbFabricante.Text) Then
                         CommandText := CommandText + ' And (F.FOR_CODIGO = '+ QuotedStr(InttoStr(uFuncoes.CDFABRICANTE(cmbFabricante.Text) ))+') ';
                     //
                     CommandText := CommandText + ' Group by H.HIS_LOJA, F.FOR_FANTASIA, V.MOV_PEDIDO, V.MOV_DATAVENDA, CLI_FANTASIA, CI.CID_NOME ';
                     Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                     Params.ParamByName('pDTINICIAL').AsDateTime := edtDTINIC.Date;
                     Params.ParamByName('pDTFINAL').AsDateTime   := edtDTFINI.Date;
                     Params.ParamByName('pTIPO').AsString    := 'V';
                     Open;
                     //
                     If not (IsEmpty) Then
                      begin
                            txtRelatorio2.Caption := 'RELAÇÃO DE TOTAL VENDIDO POR FABRICANTE';
                            txtEmpresa2.Caption   := cmbNMLOJA.Text;
                            txtPeriodo2.Caption   := edtDTINIC.Text + ' À '+edtDTFINI.Text;
                            txtFornecedor.Caption := 'FORNECEDOR : '+cmbFabricante.Text;
                            //
                            ppReport2.PrintReport;
                      End
                      Else
                      begin
                           Application.MessageBox('Não há movimento para loja no período indicado.','ATENÇÃO',
                              MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                           cmbNMLOJA.SetFocus;
                      End;
                    End;
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
  Finally
        cdsFabricantes.Close;
        btImprimir.Enabled := True;
  End;
end;

procedure TfrmRelTotalVendidoFabricante.FormShow(Sender: TObject);
begin
    LOJAS;
    FABRICANTE;
    //
    edtDTINIC.Date := Date();
    edtDTFINI.Date := Date();
end;

procedure TfrmRelTotalVendidoFabricante.cdsTotalVendidoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
   if (M_TOTAL > 0) Then
    cdsTotalVendidoPERCENTUAL.AsFloat :=
               (cdsTotalVendidoVALOR.AsFloat / M_TOTAL ) * 100;
end;

procedure TfrmRelTotalVendidoFabricante.FABRICANTE;
begin
     {dmConsultas.cdsFornecedor.close;
     With dmConsultas.dstSubSecao do
     Begin
          Active := False;
          CommandText :=  'select FOR_CODIGO, FOR_FANTASIA, FOR_RAZAO from FORNECEDORES order by FOR_FANTASIA';
          Active := True;
     End;
     dmConsultas.cdsFornecedor.Open;
     dmConsultas.cdsFornecedor.First;}
     Dm.RefreshCDS(cdsFornecedor);
     //
     cmbFabricante.Clear;
     cmbFabricante.Items.Add(' ');
     While not (cdsFornecedor.Eof) do
     Begin
          cmbFabricante.Items.Add(cdsFornecedor.FieldByName('FOR_FANTASIA').AsString);
          //
          cdsFornecedor.Next;
     End;
end;

procedure TfrmRelTotalVendidoFabricante.cdsFabricantesCalcFields(
  DataSet: TDataSet);
begin
  inherited;
     cdsFabricantesPEDIDO.AsString :=
        uFuncoes.StrZero(cdsFabricantesMOV_PEDIDO.AsString,7);
end;

end.
