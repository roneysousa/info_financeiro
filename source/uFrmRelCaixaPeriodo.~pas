unit uFrmRelCaixaPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, ToolEdit, ExtCtrls,
  FMTBcd, DB, DBClient, SqlExpr, Provider, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl, ppBands, ppCache,
  ppVar, DBXpress, ppStrtch, ppMemo;

type
  TFrmRelCaixaPeriodo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    pnlCliente: TPanel;
    grdConsultar: TDBGrid;
    pnlBotoes: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    edtDTFINA: TDateEdit;
    Label2: TLabel;
    qryVLINICIAL: TSQLQuery;
    qryVLINICIALMCA_CAIXA: TIntegerField;
    qryVLINICIALMCA_VLMODALIDADE: TFMTBCDField;
    qryVLINICIALMCA_NMCAIXA: TStringField;
    qryEntradaSaida: TSQLQuery;
    qryMovCaixa: TSQLQuery;
    btnFiltra: TBitBtn;
    dstCaixa: TSQLDataSet;
    dspCaixa: TDataSetProvider;
    dsCaixa: TDataSource;
    cdsCaixa: TClientDataSet;
    dstRelCaixa: TSQLDataSet;
    dspRelCaixa: TDataSetProvider;
    cdsRelCaixa: TClientDataSet;
    dsRelCaixa: TDataSource;
    ppRepCaixaPeriodo: TppReport;
    ppDBPMovCaixa: TppDBPipeline;
    cdsRelCaixaMOD_NOME: TStringField;
    cdsRelCaixaMCA_LOJA: TIntegerField;
    cdsRelCaixaMCA_CAIXA: TIntegerField;
    cdsRelCaixaVALOR: TFMTBCDField;
    cdsRelCaixaTROCO: TFMTBCDField;
    dstCaixaCAI_NUMERO: TIntegerField;
    dstCaixaCAI_LOJA: TIntegerField;
    dstCaixaEMP_FANTASIA: TStringField;
    dstCaixaCAI_DTABERTURA: TDateField;
    dstCaixaCAI_DTFECHAMENTO: TDateField;
    dstCaixaCAI_RGINICIAL: TIntegerField;
    dstCaixaCAI_RGFINAL: TIntegerField;
    dstCaixaCAI_CAIXA: TIntegerField;
    dstCaixaCAI_SITUACAO: TStringField;
    cdsCaixaCAI_NUMERO: TIntegerField;
    cdsCaixaCAI_LOJA: TIntegerField;
    cdsCaixaEMP_FANTASIA: TStringField;
    cdsCaixaCAI_DTABERTURA: TDateField;
    cdsCaixaCAI_DTFECHAMENTO: TDateField;
    cdsCaixaCAI_RGINICIAL: TIntegerField;
    cdsCaixaCAI_RGFINAL: TIntegerField;
    cdsCaixaCAI_CAIXA: TIntegerField;
    cdsCaixaCAI_SITUACAO: TStringField;
    cdsMovCaixa: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    CurrencyField1: TCurrencyField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    dsMovCaixa: TDataSource;
    cdsMovCaixaMCA_VLTROCO: TCurrencyField;
    cdsMovCaixaMCA_VLDIGITADO: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    lbl_NMRELA: TppLabel;
    lblCaixa: TppLabel;
    ppLine3: TppLine;
    ppDBImage1: TppDBImage;
    lblVLINICIAL: TppLabel;
    ppLine7: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    lbl_DATA: TppLabel;
    ppLabel12: TppLabel;
    lbl_CAIXA: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppMmoModa: TppMemo;
    ppLabel5: TppLabel;
    MmoValor: TppMemo;
    mmoInfo: TppMemo;
    mmoDiferenca: TppMemo;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine6: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel4: TppLabel;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppLine2: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    txtTOMODA: TppDBCalc;
    ppLine1: TppLine;
    ppLine4: TppLine;
    qryCaixaFechar: TSQLQuery;
    ppLabel11: TppLabel;
    btnGerar: TBitBtn;
    procedure BtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtGravarClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure dsCaixaDataChange(Sender: TObject; Field: TField);
    procedure edtDTINICKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINAKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure edtDTINICEnter(Sender: TObject);
    procedure edtDTFINAEnter(Sender: TObject);
  private
    { Private declarations }
    procedure consulta;
    procedure GERAR_DADOS(M_NRCAIX, M_RGINIC, M_RGFINA : Integer);
    function VALOR_DIGITADO(W_NRCAIX, W_CDMODA : Integer): Double;
    Procedure Fechar_Dataset;
  public
    { Public declarations }
  end;

var
  FrmRelCaixaPeriodo: TFrmRelCaixaPeriodo;
  M_VLABER : Double;

implementation

uses udmConsulta, Udm, UFrmAdmin, uFuncoes;

{$R *.dfm}

procedure TFrmRelCaixaPeriodo.BtCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmRelCaixaPeriodo.consulta;
begin
   If (edtDTINIC.Text = '  /  /    ' ) Then
    begin
         Application.MessageBox('Digite o período inicial!!!',
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         edtDTINIC.SetFocus;
         Exit;
    End;

   try
     //
     With cdsCaixa do
     Begin
         Close;
         Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
         Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
         Params.ParamByName('pFLSITU').AsString  := 'F';
         Open;
         //
         If (IsEmpty) Then
           begin
                Application.MessageBox('Não há movimento no período indicado!!!',
                   'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC.SetFocus;
           End;
     End;
     //
  except

  end;
end;

procedure TFrmRelCaixaPeriodo.FormShow(Sender: TObject);
begin
     edtDTINIC.Date := Date();
     edtDTFINA.Date := Date();
     //
     btnGerar.Enabled := False;
end;

procedure TFrmRelCaixaPeriodo.btnFiltraClick(Sender: TObject);
begin
     //
     If (edtDTINIC.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite a período inicial!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC.SetFocus;
           Exit;
     End;
     //
     If (edtDTFINA.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite a período final!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTFINA.SetFocus;
           Exit;
     End;
     //
     If (edtDTINIC.Date > edtDTFINA.Date) Then
     Begin
           Application.MessageBox('Período inicial maior quer período final!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC.SetFocus;
           Exit;
     End;
     //
     consulta;
end;

procedure TFrmRelCaixaPeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     cdsCaixa.Close;
     //
     Action := caFree;
end;

procedure TFrmRelCaixaPeriodo.BtGravarClick(Sender: TObject);
begin
     If (cdsCaixa.Active)
       And not (cdsCaixa.IsEmpty) Then
       Begin
            try
               BtGravar.Enabled := False;
               Screen.Cursor := crHourGlass;
               //
               Try
                    dm.parametros;
                    //
                    With cdsRelCaixa do
                      begin
                           Close;
                           Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                           Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
                           Params.ParamByName('pCAIXA').AsInteger  := cdsCaixaCAI_CAIXA.AsInteger;
                           Params.ParamByName('pTIPO1').AsString   := 'F';
                           Params.ParamByName('pTIPO2').AsString   := 'C';
                           Open;
                           //
                           If not (IsEmpty) Then
                            begin
                                 with ppRepCaixaPeriodo do
                                 begin
                                      lbl_NMRELA.Caption := 'SITUAÇÃO DO CAIXA';
                                      lblCaixa.Caption   := uFrmAdmin.M_NMUSUA;
                                      lbl_DATA.Caption   := edtDTINIC.Text + ' À ' + edtDTFINA.Text;
                                      lbl_CAIXA.Caption  := uFuncoes.StrZero(cdsCaixaCAI_CAIXA.AsString,3)+ ' - '+ uFuncoes.NOME_CAIXA(cdsCaixaCAI_CAIXA.AsInteger);
                                      //
                                      PrintReport;
                                 End;
                            End
                            Else
                            begin
                                 Application.MessageBox('Não há movimento no período indicado!!!',
                                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                                 Close;
                                 edtDTINIC.SetFocus;
                                 Exit;
                            End;
                      End;
                    //
               Except
                     on Exc:Exception do
                     begin
                           Application.MessageBox(PChar('Erro ao tentar gera relatório. '+#13
                                   + Exc.Message),
                                   'ATENÇÃO', MB_OK+MB_ICONERROR +MB_APPLMODAL);
                     End;
               End;
            Finally
               BtGravar.Enabled := True;
                Screen.Cursor := crDefault;
            End;
            Application.ProcessMessages;
       End;
end;

procedure TFrmRelCaixaPeriodo.GERAR_DADOS(M_NRCAIX, M_RGINIC,
  M_RGFINA: Integer);
Var
    M_CDLOJA, M_CDCAIX : Integer;
    M_TOTROC, M_VALORMODA, M_TODESC : double;
begin
        dm.parametros;
        //
        M_RGINIC := cdsCaixaCAI_RGINICIAL.Value;
        //
        If (cdsCaixaCAI_SITUACAO.AsString = 'A') Then
            M_RGFINA := dm.CdsConfigCFG_SEQUENCIA.AsInteger
        Else
            M_RGFINA := cdsCaixaCAI_RGFINAL.AsInteger;
        //
        M_CDLOJA := cdsCaixaCAI_LOJA.AsInteger;
        M_CDCAIX := cdsCaixaCAI_CAIXA.AsInteger;
        //
        Dm.cdsModalidade.Close;
        With dm.dstModalidades do
        Begin
            Active := False;
            CommandText := 'Select * from MODALIDADE order By MOD_NOME';
            Active := True;
        End;
        //
        With qryVLINICIAL do
        Begin
             Close;
             Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
             Params.ParamByName('pCAIXA').AsInteger     := M_CDCAIX;
             Params.ParamByName('pTIPOMOV').AsString    := 'A';
             //
             Open;
        End;
        //
        If not (qryVLINICIAL.IsEmpty) Then
            M_VLABER := M_VLABER + qryVLINICIAL.FieldByName('MCA_VLMODALIDADE').AsCurrency;
        //
        Dm.cdsModalidade.Open;
        Dm.cdsModalidade.First;
        //
        While not (Dm.cdsModalidade.Eof) do
        Begin
            M_TOTROC    := 0;
            M_VALORMODA := 0;   
            // Movimento do caixa - Vendas
            With qryMovCaixa do
            begin
               Active := False;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
               Params.ParamByName('pCAIXA').AsInteger := M_CDCAIX;
               Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
               Params.ParamByName('pSEQFINAL').AsInteger  := M_RGFINA;
               Params.ParamByName('pTIPOMOV').AsString := 'V';
               Active := True;
            End;
            //
          If not (qryMovCaixa.IsEmpty) Then  //
            Begin
               //
               If not (cdsMovCaixa.Locate('MCA_MODALIDADE',Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger,[])) Then
                   cdsMovCaixa.Append
               Else
                   cdsMovCaixa.Edit;
               //
               cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
               cdsMovCaixa.FieldByName('MCA_MODANOME').AsString   := Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
               cdsMovCaixa.FieldByName('MCA_NATUREZA').AsInteger  := qryMovCaixa.FieldByName('MCA_NATUREZA').AsInteger;
               M_TOTROC := qryMovCaixa.FieldByName('MCA_TOTROCO').AsCurrency;
               If not (Dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString = 'D') Then
                   M_TOTROC := 0;
               //
               cdsMovCaixa.FieldByName('MCA_VLDIGITADO').AsFloat  :=
                   cdsMovCaixa.FieldByName('MCA_VLDIGITADO').AsFloat + VALOR_DIGITADO(M_NRCAIX,Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger);
               //
               cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency + (qryMovCaixa.FieldByName('TOTAL').AsCurrency - M_TOTROC);
               //cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency + (cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency - M_TOTROC);
               cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := 'V';
               //cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := 'VENDAS';
               cdsMovCaixa.Post;
               //
               //M_VALORMODA := M_VALORMODA + (qryMovCaixa.FieldByName('TOTAL').AsCurrency-M_TOTROC);
               //
            End;
            // Movimento do caixa - Entradas
            With qryEntradaSaida do
            begin
               Active := False;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
               Params.ParamByName('pCAIXA').AsInteger := M_CDCAIX;
               Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
               Params.ParamByName('pSEQFINAL').AsInteger  := M_RGFINA;
               Params.ParamByName('pTIPOMOV').AsString := 'E';
               Active := True;
           End;
           //
           If not (qryEntradaSaida.IsEmpty) Then
           Begin
             //
             qryEntradaSaida.First;
             While not (qryEntradaSaida.Eof) DO
             Begin
               cdsMovCaixa.Append;
               cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
               cdsMovCaixa.FieldByName('MCA_MODANOME').AsString   := Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
               cdsMovCaixa.FieldByName('MCA_NATUREZA').AsInteger  := qryEntradaSaida.FieldByName('MCA_NATUREZA').AsInteger;
               cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := qryEntradaSaida.FieldByName('MCA_VLMODALIDADE').AsCurrency;
               cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := 'E';
               cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := qryEntradaSaida.FieldByName('MCA_OBSEVACAO').AsString;
               cdsMovCaixa.Post;
               // Proximo
               qryEntradaSaida.Next;
             End;
           End;
           // Movimento do caixa - Saida
           With qryEntradaSaida do
           begin
               Active := False;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
               Params.ParamByName('pCAIXA').AsInteger := M_CDCAIX;
               Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
               Params.ParamByName('pSEQFINAL').AsInteger  := M_RGFINA;
               Params.ParamByName('pTIPOMOV').AsString := 'S';
               Active := True;
           End;
          //
          If not (qryEntradaSaida.IsEmpty) Then  //
           Begin
             qryEntradaSaida.First;
             While not (qryEntradaSaida.Eof) DO
             Begin
               //
               cdsMovCaixa.Append;
               cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
               cdsMovCaixa.FieldByName('MCA_MODANOME').AsString   := Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
               cdsMovCaixa.FieldByName('MCA_NATUREZA').AsInteger  := qryEntradaSaida.FieldByName('MCA_NATUREZA').AsInteger;
               cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := -(qryEntradaSaida.FieldByName('MCA_VLMODALIDADE').AsCurrency);
               cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := 'S';
               cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := qryEntradaSaida.FieldByName('MCA_OBSEVACAO').AsString;
               cdsMovCaixa.Post;
               // Proximo
               qryEntradaSaida.Next;
             End;
           End;
          //
          Dm.cdsModalidade.Next;
        End;  // Fim-do-enquanto
        // Desconto
        With dmConsultas.cdsMovCaixa do
        Begin
             Active := False;
             Params.ParamByName('pLOJA').AsInteger   := M_CDLOJA;
             Params.ParamByName('pCAIXA').AsInteger  := M_CDCAIX;
             Params.ParamByName('pINICIO').AsInteger := M_RGINIC;
             Params.ParamByName('pFINAL').AsInteger  := M_RGFINA;
             Params.ParamByName('pTIPO').AsString    := 'V';
             Active := True;
        End;
        //
        M_TODESC := 0;
        While not (dmConsultas.cdsMovCaixa.Eof) do
        Begin
             With dmConsultas.qryVenda do
             Begin
                  Close;
                  Params.ParamByName('pSEQUENCIA').AsInteger  := dmConsultas.cdsMovCaixa.FieldByName('MCA_SEQUENCIA').AsInteger;
                  Params.ParamByName('pLOJA').AsInteger       := dmConsultas.cdsMovCaixa.FieldByName('MCA_LOJA').AsInteger;
                  Params.ParamByName('pPEDIDO').AsInteger     := dmConsultas.cdsMovCaixa.FieldByName('MCA_VENDA').AsInteger;
                  Open;
             End;
             //
             If not (dmConsultas.qryVenda.IsEmpty) Then
                 M_TODESC := M_TODESC + dmConsultas.qryVenda.FieldByName('MOV_DESCONTO').AsCurrency;
             // Proximo
             dmConsultas.cdsMovCaixa.Next;
        End;
        //
        If (M_TODESC > 0) Then
        Begin
            cdsMovCaixa.Append;
            cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := '00';
            cdsMovCaixa.FieldByName('MCA_MODANOME').AsString   := 'DESCONTO';
            cdsMovCaixa.FieldByName('MCA_NATUREZA').AsInteger  := 0;
            cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := M_TODESC;
            cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := '%';
            cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := '';
            cdsMovCaixa.Post;
        End;
        //
end;

procedure TFrmRelCaixaPeriodo.btnGerarClick(Sender: TObject);
Var
  TD : TTransactionDesc;
begin
  If (cdsCaixa.IsEmpty) Then
     btnFiltra.SetFocus;
  //
  BtCancelar.Enabled := False;
  btnGerar.Enabled   := False;
  //
  try
     Screen.Cursor := crHourGlass;
     // Inicia um transação no BD
     TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);
     //
     Try
          cdsMovCaixa.Open;
          cdsMovCaixa.EmptyDataSet;
          //
          ppMmoModa.Lines.Clear;
          MmoValor.Lines.Clear;
          mmoInfo.Lines.Clear;
          mmoDiferenca.Lines.Clear;
          //
          M_VLABER := 0;
          //
          With cdsCaixa do
            begin
                 DisableControls;
                 First;
                 While not (Eof) do
                  begin
                       GERAR_DADOS(FieldByName('CAI_NUMERO').AsInteger,
                                   FieldByName('CAI_RGINICIAL').AsInteger,
                                   FieldByName('CAI_RGFINAL').AsInteger);
                       //
                       Next;
                  End;
                  EnableControls;
            End;
           // Grava
           Dm.SqlAdmin.Commit(TD);
           //
           With ppRepCaixaPeriodo do
            begin
                 With cdsMovCaixa do
                  begin
                       Close;
                       CommandText := '';
                       Open;
                  End;
                 //
                 lblVLINICIAL.Caption := '';
                 lbl_NMRELA.Caption := 'SITUAÇÃO DO CAIXA';
                 lblCaixa.Caption   := uFrmAdmin.M_NMUSUA;
                 lbl_DATA.Caption     := edtDTINIC.Text +  ' À '+ edtDTFINA.Text ;
                 lbl_CAIXA.Caption    := uFuncoes.StrZero(cdsCaixaCAI_CAIXA.AsString,3) + ' - '+uFuncoes.NOME_CAIXA(cdsCaixaCAI_CAIXA.AsInteger) ;
                 //
                 cdsMovCaixa.First;
                 While not (cdsMovCaixa.Eof) do
                  begin
                       If (cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsInteger > 0) Then
                       begin
                            ppMmoModa.Lines.Add(cdsMovCaixa.FieldByName('MCA_MODANOME').AsString);
                            MmoValor.Lines.Add(FormatFloat('###,###,##0.00', cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsFloat));
                            mmoInfo.Lines.Add(FormatFloat('###,###,##0.00', cdsMovCaixa.FieldByName('MCA_VLDIGITADO').AsFloat));
                            mmoDiferenca.Lines.Add(FormatFloat('###,###,##0.00', (cdsMovCaixa.FieldByName('MCA_VLDIGITADO').AsFloat - cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsFloat)));
                       End;
                       //
                       cdsMovCaixa.Next;
                  End;
                 //
                 lblVLINICIAL.Caption := 'TOTAL DE ABERTURA DE CAIXA : ' + FormatFloat('###,##0.00',M_VLABER);
                 //
                 PrintReport;
            End;
     Except
          on e: exception do
          begin
              Application.MessageBox(PChar('Erro ao tentar gerar relatorio! Erro:'+#13
                      + E.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
          End;
     End;
  Finally
        consulta;
        // 
        BtCancelar.Enabled := true;
        btnGerar.Enabled   := true;
        //
        Screen.Cursor := crDefault;
  End;
  Application.ProcessMessages;
end;

procedure TFrmRelCaixaPeriodo.dsCaixaDataChange(Sender: TObject;
  Field: TField);
begin
     If (cdsCaixa.Active) and not (cdsCaixa.IsEmpty ) Then
        btnGerar.Enabled := True
     Else
        btnGerar.Enabled := False;
end;

function TFrmRelCaixaPeriodo.VALOR_DIGITADO(W_NRCAIX,
  W_CDMODA: Integer): Double;
begin
     Result := 0;
     //
     With qryCaixaFechar do
      begin
           Close;
           Params.ParamByName('pNUMERO').AsInteger     := W_NRCAIX;
           Params.ParamByName('pMODALIDADE').AsInteger := W_CDMODA;
           Open;
           //
           If not(IsEmpty) Then
             Result :=  FieldByName('CXF_VALOR').AsFloat;
      End;
end;

procedure TFrmRelCaixaPeriodo.edtDTINICKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) and (edtDTINIC.Text <> '  /  /    ') Then
     Begin
         Key := #0;
         edtDTFINA.SetFocus;
     End;
end;

procedure TFrmRelCaixaPeriodo.edtDTFINAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) and (edtDTINIC.Text <> '  /  /    ') Then
     Begin
         Key := #0;
         btnFiltra.SetFocus;
     End;
end;

procedure TFrmRelCaixaPeriodo.edtDTINICExit(Sender: TObject);
begin
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

procedure TFrmRelCaixaPeriodo.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC.SetFocus;
                Exit;
            End;
            edtDTFINA.Date := StrToDate(edtDTFINA.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTFINA.Date := Date();
             edtDTFINA.SetFocus;
             Exit;
          End;
        end;
     End;

end;

procedure TFrmRelCaixaPeriodo.edtDTINICEnter(Sender: TObject);
begin
     Fechar_Dataset;
End;

procedure TFrmRelCaixaPeriodo.edtDTFINAEnter(Sender: TObject);
begin
     Fechar_Dataset;
end;

procedure TFrmRelCaixaPeriodo.Fechar_Dataset;
begin
     cdsCaixa.Close;
     btnGerar.Enabled := False;
end;

end.
