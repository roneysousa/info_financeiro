unit uFrmRelProdClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmRelatorio, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBPipe, FMTBcd, DB,
  SqlExpr, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, DBClient, Provider;

type
  TfrmRelProdCliente = class(TfrmRelatorio)
    Label2: TLabel;
    cmbNMLOJA: TComboBox;
    Label5: TLabel;
    edtDTINIC: TDateEdit;
    Label6: TLabel;
    edtDTFINI: TDateEdit;
    edtCDCLIE: TEdit;
    spLocCliente: TSpeedButton;
    Label1: TLabel;
    lblCliente: TLabel;
    ppReport1: TppReport;
    ppDBPipProdCliente: TppDBPipeline;
    ppHeaderBand2: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppLabel9: TppLabel;
    txtEmpresa2: TppLabel;
    txtPeriodo2: TppLabel;
    txtRelatorio1: TppLabel;
    txtTipoCliente: TppLabel;
    txtRegiao: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine6: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine7: TppLine;
    ppLabel15: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel16: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    dstProdutosClientes: TSQLDataSet;
    dspProdutosClientes: TDataSetProvider;
    cdsProdutosCliente: TClientDataSet;
    dsProdutosCliente: TDataSource;
    cdsProdutosClienteHIS_LOJA: TIntegerField;
    cdsProdutosClienteCLI_CODIGO: TIntegerField;
    cdsProdutosClienteCLI_FANTASIA: TStringField;
    cdsProdutosClienteHIS_PRODUTO: TStringField;
    cdsProdutosClientePRO_DESCRICAO: TStringField;
    cdsProdutosClienteQUANT: TFMTBCDField;
    cdsProdutosClienteVALOR: TFMTBCDField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    lblOrdem: TLabel;
    cmbOrdem: TComboBox;
    ppLine3: TppLine;
    ppDBCalc2: TppDBCalc;
    cdsProdutosClienteFOR_FANTASIA: TStringField;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    cmbTPCLIENTE: TComboBox;
    cmbRegiao: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    cdsProdutosClienteSUB_TOTAL: TCurrencyField;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure spLocClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINIExit(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure cdsProdutosClienteCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure LOJAS;
    procedure TIPO_CLIENTE;
    Procedure REGIAO;
  public
    { Public declarations }
  end;

var
  frmRelProdCliente: TfrmRelProdCliente;

implementation

uses udmConsulta, uFuncoes, uLocCliente, Udm;

{$R *.dfm}

procedure TfrmRelProdCliente.edtCDCLIEExit(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
      begin
           edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
           If not (dmConsultas.BUSCA_CLIENTE(StrtoInt(edtCDCLIE.Text))) Then
            begin
                 Application.MessageBox(PChar('Código de cliente não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 lblCliente.Caption := '';
                 edtCDCLIE.Clear;
                 edtCDCLIE.SetFocus;
                 Exit;
            End
            Else
                lblCliente.Caption := dmConsultas.qryLocCliente.FieldByName('CLI_FANTASIA').AsString;
      End;
end;

procedure TfrmRelProdCliente.edtCDCLIEKeyPress(Sender: TObject;
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

procedure TfrmRelProdCliente.LOJAS;
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

procedure TfrmRelProdCliente.spLocClienteClick(Sender: TObject);
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

procedure TfrmRelProdCliente.FormShow(Sender: TObject);
begin
  inherited;
    LOJAS;
    REGIAO;
    TIPO_CLIENTE;
    lblCliente.Caption := ' ';
    //
    cmbNMLOJA.SetFocus;
    edtDTINIC.Date := Date();
    edtDTFINI.Date := Date();
end;

procedure TfrmRelProdCliente.edtDTINICExit(Sender: TObject);
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

procedure TfrmRelProdCliente.edtDTFINIExit(Sender: TObject);
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

procedure TfrmRelProdCliente.edtCDCLIEChange(Sender: TObject);
begin
  inherited;
       If uFuncoes.Empty(edtCDCLIE.Text) Then
           lblCliente.Caption := ' ';
end;

procedure TfrmRelProdCliente.btImprimirClick(Sender: TObject);
begin
  inherited;
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
    //
     Try
          txtRegiao.Caption      := 'REGIÃO : TODAS';
          txtTipoCliente.Caption := 'TIPO CLIENTE : TODOS';
          //
          With cdsProdutosCliente do
            begin
                 Close;
                 CommandText := 'Select H.HIS_LOJA, C.CLI_CODIGO, C.CLI_FANTASIA, H.HIS_PRODUTO, P.PRO_DESCRICAO, F.FOR_FANTASIA, SUM(H.HIS_MOVIMENTO) as QUANT, ';
                 If (Dm.CdsConfigCFG_TELA_PEDIDO.AsInteger = 1) Then
                    CommandText := CommandText +  ' Sum(PV.MOP_VALOR) AS VALOR'
                 Else
                    CommandText := CommandText +  ' Sum(H.HIS_VLVENDA) as VALOR ';
                 CommandText := CommandText + ' FROM HISTORICO H '+
                                ' INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO '+
                                ' INNER join VENDAS M ON H.HIS_DOCUMENTO = M.MOV_PEDIDO '+
                                ' INNER join CLIENTES C ON M.MOV_CLIENTE = C.CLI_CODIGO '+
                                ' INNER join FORNECEDORES F ON P.FOR_CODIGO = F.FOR_CODIGO ';
                 If (Dm.CdsConfigCFG_TELA_PEDIDO.AsInteger = 1 ) Then
                    CommandText := CommandText +  'INNER JOIN PROVENDAS PV ON (PV.MOP_PEDIDO = M.MOV_PEDIDO) AND (PV.MOP_PRODUTO = P.PRO_CODIGO) ';
                 CommandText := CommandText +  ' Where (H.HIS_LOJA = :pLOJA) '+
                                ' AND (H.HIS_DATA >= :pDTINICIAL) AND (H.HIS_DATA <= :pDTFINAL) '+
                                ' AND (H.HIS_TIPO = :pTIPO) ';
                 If not uFuncoes.Empty(edtCDCLIE.Text) Then
                    CommandText := CommandText + ' And (C.CLI_CODIGO = '+QuotedStr(edtCDCLIE.Text)+ ')';
                 //
                 If not uFuncoes.Empty(cmbTPCLIENTE.Text) Then
                 begin
                     CommandText := CommandText + ' And (CLI_TIPOCLIENTE = '+QuotedStr(InttoStr(uFuncoes.GetTipoCliente(cmbTPCLIENTE.Text)))+ ')';
                     txtTipoCliente.Caption := 'TIPO CLIENTE : '+ cmbTPCLIENTE.Text;
                 End;
                 //
                 If not uFuncoes.Empty(cmbRegiao.Text) Then
                 Begin
                     CommandText := CommandText + ' And (CLI_REGIAO = '+QuotedStr(InttoStr(uFuncoes.GetRegiao(cmbRegiao.Text)))+ ')';
                     txtRegiao.Caption := 'REGIÃO : '+ cmbRegiao.Text;
                 End;
                 //
                 CommandText := CommandText + ' Group by H.HIS_LOJA, C.CLI_CODIGO, C.CLI_FANTASIA, H.HIS_PRODUTO, P.PRO_DESCRICAO, F.FOR_FANTASIA '+
                                ' Order by C.CLI_FANTASIA';
                 If (cmbOrdem.ItemIndex = 0) Then
                     CommandText := CommandText + ', Sum(H.HIS_VLVENDA) Desc '
                 Else
                     CommandText := CommandText + ', Sum(H.HIS_MOVIMENTO) Desc';
                 //
                 Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                 Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate   := edtDTFINI.Date;
                 Params.ParamByName('pTIPO').AsString    := 'V';
                 FetchParams; 
                 Open;
                 //
                 If not (IsEmpty) Then
                  begin
                       txtRelatorio1.Caption := 'PRODUTOS POR CLIENTES';
                       txtEmpresa2.Caption   := cmbNMLOJA.Text;
                       txtPeriodo2.Caption   := edtDTINIC.Text + ' À '+edtDTFINI.Text;
                       //
                       ppReport1.PrintReport;
                  End
                  Else
                  begin
                      Application.MessageBox('Não há movimento no período inidicado!!!','ATENÇÃO',
                         MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      Close;
                  End;
            End;
     Finally
           btImprimir.Enabled := True;
     End;
end;

procedure TfrmRelProdCliente.REGIAO;
begin
     With dmConsultas.qryConsulta do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select REG_CODIGO, REG_DESCRICAO from REGIAO');
          SQL.Add('order by REG_DESCRICAO');
          Open;
          First;
     End;
     //
     cmbRegiao.Clear;
     cmbRegiao.Items.Add(' ');
     While not (dmConsultas.qryConsulta.Eof) do
     Begin
          cmbRegiao.Items.Add(dmConsultas.qryConsulta.FieldByName('REG_DESCRICAO').AsString);
          //
          dmConsultas.qryConsulta.Next;
     End;
end;

procedure TfrmRelProdCliente.TIPO_CLIENTE;
begin
     With dmConsultas.qryConsulta do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select TPC_CODIGO, TPC_DESCRICAO from TIPOCLIENTE');
          SQL.Add('order by TPC_DESCRICAO');
          Open;
          First;
     End;
     //
     cmbTPCLIENTE.Clear;
     cmbTPCLIENTE.Items.Add(' ');
     While not (dmConsultas.qryConsulta.Eof) do
     Begin
          cmbTPCLIENTE.Items.Add(dmConsultas.qryConsulta.FieldByName('TPC_DESCRICAO').AsString);
          //
          dmConsultas.qryConsulta.Next;
     End;
end;

procedure TfrmRelProdCliente.cdsProdutosClienteCalcFields(
  DataSet: TDataSet);
begin
  inherited;
     //If () Then
      cdsProdutosClienteSUB_TOTAL.AsCurrency :=
         cdsProdutosClienteVALOR.AsCurrency *
         cdsProdutosClienteQUANT.AsFloat; 
end;

end.
