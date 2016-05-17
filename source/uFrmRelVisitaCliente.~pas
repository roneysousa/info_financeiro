unit uFrmRelVisitaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmRelatorio, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit,
  FMTBcd, DB, SqlExpr, DBClient, Provider, Grids, DBGrids, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl, ppBands,
  ppCache, ppVar;

type
  TfrmRelVisitaCliente = class(TfrmRelatorio)
    Label2: TLabel;
    cmbNMLOJA: TComboBox;
    Label5: TLabel;
    edtDTINIC: TDateEdit;
    Label6: TLabel;
    edtDTFINI: TDateEdit;
    Label1: TLabel;
    edtCDCLIE: TEdit;
    spLocCliente: TSpeedButton;
    lblCliente: TLabel;
    dstVisitaCliente: TSQLDataSet;
    dspVisitaCliente: TDataSetProvider;
    cdsVisitaCliente: TClientDataSet;
    cdsDados: TClientDataSet;
    cdsDadosPEDIDO: TStringField;
    cdsDadosDTMOVI: TDateField;
    cdsDadosLOJA: TIntegerField;
    cdsDadosCDCLIENTE: TStringField;
    cdsDadosNOME: TStringField;
    cdsDadosPRODUTO: TStringField;
    cdsDadosDESCPRODUTO: TStringField;
    cdsDadosFORNECEDOR: TStringField;
    cdsDadosQUANT: TFloatField;
    cdsDadosVALOR: TCurrencyField;
    dsDados: TDataSource;
    Label4: TLabel;
    cmbRegiao: TComboBox;
    dstClientes: TSQLDataSet;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    ppReport1: TppReport;
    ppDBDados: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblEmpresa: TppLabel;
    ppLabel9: TppLabel;
    txtEmpresa2: TppLabel;
    txtPeriodo2: TppLabel;
    txtRelatorio1: TppLabel;
    txtCliente: TppLabel;
    txtRegiao: TppLabel;
    ppDBImage2: TppDBImage;
    ppLine7: TppLine;
    ppLabel15: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel16: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    cdsDadosCIDADE: TStringField;
    cdsVisitaClienteMOV_PEDIDO: TIntegerField;
    cdsVisitaClienteMOV_DATAVENDA: TDateField;
    cdsVisitaClienteMOV_LOJA: TIntegerField;
    cdsVisitaClienteMOV_CLIENTE: TIntegerField;
    cdsVisitaClienteCLI_FANTASIA: TStringField;
    cdsVisitaClienteCID_CODIGO: TIntegerField;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    cdsVisitaClienteMOV_VALOR: TFMTBCDField;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    procedure FormShow(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINIExit(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
     procedure LOJAS;
     Procedure REGIAO;
  public
    { Public declarations }
  end;

var
  frmRelVisitaCliente: TfrmRelVisitaCliente;

implementation

uses udmConsulta, uFuncoes, uLocCliente, Udm;

{$R *.dfm}

{ TfrmRelVisitaCliente }

procedure TfrmRelVisitaCliente.LOJAS;
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

procedure TfrmRelVisitaCliente.FormShow(Sender: TObject);
begin
  inherited;
      LOJAS;
      REGIAO;
      edtDTINIC.Date := Date();
      edtDTFINI.Date := Date();
      lblCliente.Caption := '';
      //
      cdsDados.Close;
end;

procedure TfrmRelVisitaCliente.btImprimirClick(Sender: TObject);
Var
   M_NRPEDI : Integer;
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
       cdsDados.Open;
       cdsDados.EmptyDataSet;
       //
       With cdsClientes do
       begin
            close;
            {CommandText := 'Select M.MOV_PEDIDO, M.MOV_LOJA, C.CLI_CODIGO, C.CLI_FANTASIA '+
                           ' FROM VENDAS M '+
                           ' INNER join CLIENTES C ON M.MOV_CLIENTE = C.CLI_CODIGO '+
                           ' Where (M.MOV_LOJA = :pLOJA) '+
                           ' AND (M.MOV_DATAVENDA >= :pDTINICIAL) AND (M.MOV_DATAVENDA <= :pDTFINAL) ';
            If not uFuncoes.Empty(edtCDCLIE.Text) Then
                 CommandText := CommandText + 'and (M.MOV_CLIENTE = '+QuotedStr(edtCDCLIE.Text)+ ')';
            If not uFuncoes.Empty(cmbRegiao.Text) Then
                 CommandText := CommandText + 'and (C.CLI_REGIAO = '+QuotedStr(InttoStr(uFuncoes.GetRegiao(cmbRegiao.Text)))+ ')';
            //
            CommandText := CommandText +' Group by M.MOV_PEDIDO, M.MOV_LOJA, C.CLI_CODIGO, C.CLI_FANTASIA '+
                           ' Order by C.CLI_FANTASIA';}
            //
            CommandText := 'Select M.MOV_LOJA, C.CLI_CODIGO, C.CLI_FANTASIA '+
                           ' FROM VENDAS M '+
                           ' INNER join CLIENTES C ON M.MOV_CLIENTE = C.CLI_CODIGO '+
                           ' Where (M.MOV_LOJA = :pLOJA) '+
                           ' AND (M.MOV_DATAVENDA >= :pDTINICIAL) AND (M.MOV_DATAVENDA <= :pDTFINAL) ';
            If not uFuncoes.Empty(edtCDCLIE.Text) Then
                 CommandText := CommandText + 'and (M.MOV_CLIENTE = '+QuotedStr(edtCDCLIE.Text)+ ')';
            If not uFuncoes.Empty(cmbRegiao.Text) Then
                 CommandText := CommandText + 'and (C.CLI_REGIAO = '+QuotedStr(InttoStr(uFuncoes.GetRegiao(cmbRegiao.Text)))+ ')';
            //
            CommandText := CommandText +' Group by M.MOV_LOJA, C.CLI_CODIGO, C.CLI_FANTASIA '+
                           ' Order by C.CLI_FANTASIA';
            //
            Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
            //Params.ParamByName('pCLIENTE').AsInteger := StrtoInt(edtCDCLIE.Text);
            Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
            Params.ParamByName('pDTFINAL').AsDate   := edtDTFINI.Date;
            Open;
       End;
       //
      If not(cdsClientes.IsEmpty) Then
      begin
        //
        cdsClientes.First;
        While not (cdsClientes.eof) do
        begin
          //
          cdsConsulta.Close;
          with dstConsulta do
            begin
               Active := False;
               CommandText := 'Select MOV_PEDIDO, MOV_DATAVENDA from VENDAS '+
                              ' Where (MOV_DATAVENDA >= :pDTINICIAL) '+
                              ' and   (MOV_DATAVENDA <= :pDTFINAL) '+
                              ' and   (MOV_CLIENTE    = :pCLIENTE)';
               Params.ParamByName('pCLIENTE').AsInteger   := cdsClientes.FieldByName('CLI_CODIGO').AsInteger;
               Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
               Params.ParamByName('pDTFINAL').AsDate   := edtDTFINI.Date;
               Active := True;
            End;
          cdsConsulta.FetchParams;
          cdsConsulta.Open;
          //
         If not(cdsConsulta.IsEmpty) Then
         begin
            // Ultimo Registro de venda
            cdsConsulta.Last;
            M_NRPEDI := cdsConsulta.FieldByName('MOV_PEDIDO').AsInteger;
           //
          With cdsVisitaCliente do
            begin
                 Close;
                 CommandText := 'Select M.MOV_PEDIDO, M.MOV_DATAVENDA, M.MOV_LOJA, M.MOV_CLIENTE, M.MOV_VALOR, C.CLI_FANTASIA, C.CID_CODIGO '+
                                'FROM VENDAS M '+
                                'INNER join CLIENTES C ON M.MOV_CLIENTE = C.CLI_CODIGO '+
                                'Where (M.MOV_LOJA = :pLOJA) '+
                                ' and (M.MOV_PEDIDO = '+QuotedStr(InttoStr(M_NRPEDI))+') '+
                                'Group by M.MOV_PEDIDO, M.MOV_DATAVENDA, M.MOV_LOJA, M.MOV_CLIENTE, M.MOV_VALOR, C.CLI_FANTASIA, C.CID_CODIGO '+
                                'Order by C.CLI_FANTASIA';
                 // 'AND (H.HIS_DATA >= :pDTINICIAL) AND (H.HIS_DATA <= :pDTFINAL) '+
                 //
                 Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                 //
                 Open;
                 //
                 If not (IsEmpty) Then
                  begin
                        First;
                        While not (Eof) do
                          begin
                               cdsDados.Append;
                               //
                               cdsDadosPEDIDO.AsString   := uFuncoes.StrZero(FieldByName('MOV_PEDIDO').AsString,7);
                               cdsDadosDTMOVI.AsDateTime := FieldByName('MOV_DATAVENDA').AsDateTime;
                               cdsDadosLOJA.AsInteger    := FieldByName('MOV_LOJA').AsInteger;
                               cdsDadosCDCLIENTE.AsString := uFuncoes.StrZero(FieldByName('MOV_CLIENTE').AsString,7);
                               cdsDadosNOME.AsString     := FieldByName('CLI_FANTASIA').AsString;
                               cdsDadosCIDADE.AsString   := uFuncoes.GetCidade(FieldByName('CID_CODIGO').AsInteger);
                               {cdsDadosPRODUTO.AsString  := FieldByName('HIS_PRODUTO').AsString;
                               cdsDadosDESCPRODUTO.AsString := FieldByName('PRO_DESCRICAO').AsString;
                               cdsDadosFORNECEDOR.AsString  := uFuncoes.NOME_FORNECEDOR(FieldByName('HIS_PRODUTO').AsString) ;
                               cdsDadosQUANT.AsFloat     := FieldByName('QUANT').AsFloat;}
                               cdsDadosVALOR.AsCurrency  := FieldByName('MOV_VALOR').AsCurrency;
                               //
                               cdsDados.Post;
                               //
                               Next;
                          End;
                  End;
            End;   //fim-cdsVisitaCliente
         End;
            //
            cdsClientes.Next;
        End; //fim-enquanto
        //
        With ppReport1 do
          begin
               txtRelatorio1.Caption := 'RELATÓRIO DE VISITA DE CLIENTE';
               txtEmpresa2.Caption := cmbNMLOJA.Text;
               txtPeriodo2.Caption := edtDTINIC.Text + ' À '+edtDTFINI.Text;
               If uFuncoes.Empty(edtCDCLIE.Text) Then
                   txtCliente.Caption := 'CLIENTE : TODOS'
               Else
                   txtCliente.Caption := 'CLIENTE : '+lblCliente.Caption;
               If uFuncoes.Empty(cmbRegiao.Text) Then
                  txtRegiao.Caption  := 'REGIÃO  : TODAS'
               Else
                  txtRegiao.Caption  := 'REGIÃO  : '+cmbRegiao.Text;
               //
               PrintReport;
          End;
      End //fim-do-se
      else
      begin
           Application.MessageBox('Não há movimento no período inidicado!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
      End;
       //
    Finally
          btImprimir.Enabled := True;
    End;
end;

procedure TfrmRelVisitaCliente.edtDTINICExit(Sender: TObject);
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

procedure TfrmRelVisitaCliente.edtDTFINIExit(Sender: TObject);
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

procedure TfrmRelVisitaCliente.spLocClienteClick(Sender: TObject);
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

procedure TfrmRelVisitaCliente.edtCDCLIEChange(Sender: TObject);
begin
  inherited;
       If uFuncoes.Empty(edtCDCLIE.Text) Then
           lblCliente.Caption := ' ';
end;

procedure TfrmRelVisitaCliente.edtCDCLIEExit(Sender: TObject);
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
                 lblCliente.Caption := '';
                 edtCDCLIE.SetFocus;
                 Exit;
            End
            Else
                lblCliente.Caption := dmConsultas.qryLocCliente.FieldByname('CLI_FANTASIA').AsString;
      End;
end;

procedure TfrmRelVisitaCliente.edtCDCLIEKeyPress(Sender: TObject;
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

procedure TfrmRelVisitaCliente.REGIAO;
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

end.
