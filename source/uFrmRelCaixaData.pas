unit uFrmRelCaixaData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, Grids, DBGrids,
  FMTBcd, ppCtrls, ppBands, ppClass, ppStrtch, ppMemo, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, DB, ppDB, ppComm, ppRelatv, ppDBPipe,
  DBClient, SqlExpr;

type
  TfrmRelCaixaData = class(TForm)
    Panel1: TPanel;
    pnlCliente: TPanel;
    pnlBotoes: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    grdConsultar: TDBGrid;
    Label1: TLabel;
    edtDATA: TDateEdit;
    qryEntradaSaida: TSQLQuery;
    cdsMovCaixa: TClientDataSet;
    cdsMovCaixaMCA_MODALIDADE: TStringField;
    cdsMovCaixaMCA_MODANOME: TStringField;
    cdsMovCaixaMCA_NATUREZA: TIntegerField;
    cdsMovCaixaMCA_OBSERVACAO: TStringField;
    cdsMovCaixaMCA_VLMODALIDADE: TCurrencyField;
    cdsMovCaixaMCA_TIPOMOV: TStringField;
    cdsMovCaixaMCA_DESCNATU: TStringField;
    cdsMovCaixaMCA_SINAL: TStringField;
    cdsMovCaixaMCA_NOMENATUREZA: TStringField;
    qryMovCaixa: TSQLQuery;
    ppDBParametros: TppDBPipeline;
    dsMovCaixa: TDataSource;
    ppDBPipeMovCaixa: TppDBPipeline;
    ppRSituacaoCaixa: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lbl_NMRELA: TppLabel;
    lblCaixa: TppLabel;
    ppLine3: TppLine;
    ppDBImage1: TppDBImage;
    lblVLINICIAL: TppLabel;
    ppLine7: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
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
    qryVLINICIAL: TSQLQuery;
    ppLabel10: TppLabel;
    lbl_DATA: TppLabel;
    ppLabel11: TppLabel;
    lbl_Situacao: TppLabel;
    ppLabel12: TppLabel;
    lbl_CAIXA: TppLabel;
    qryVLINICIALMCA_VLMODALIDADE: TFMTBCDField;
    qryVLINICIALMCA_CAIXA: TIntegerField;
    qryVLINICIALMCA_NMCAIXA: TStringField;
    btnConsultar: TBitBtn;
    txtAtendentes: TppMemo;
    txtAtendentesValor: TppMemo;
    ppLabel13: TppLabel;
    txtComissao: TppMemo;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel16: TppLabel;
    txtTotalVendas: TppLabel;
    ppShape1: TppShape;
    ppLine11: TppLine;
    procedure edtDATAExit(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure edtDATAKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure cdsMovCaixaCalcFields(DataSet: TDataSet);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure edtDATAEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
  private
    procedure consulta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCaixaData: TfrmRelCaixaData;
  M_RGINIC, M_RGFINA : Integer;

implementation

uses udmConsulta, uFuncoes, Udm, UFrmAdmin, uDmRelatorios;

{$R *.dfm}

{ TfrmRelCaixaData }

procedure TfrmRelCaixaData.consulta;
begin
   try
     StrToDate(edtDATA.Text);
     //
     With dmConsultas.cdsCaixa do
     Begin
         Close;
         Params.ParamByName('pDTABERTURA').AsDate := edtDATA.Date;
         Open;
         //
     End;
     //
     {If (dmConsultas.cdsCaixa.IsEmpty) Then
     Begin
          Application.MessageBox('Não movimento de caixa na data indicada!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDATA.SetFocus;
          Exit;
     End;}
     //
  except

  end;
end;

procedure TfrmRelCaixaData.edtDATAExit(Sender: TObject);
begin
     If (edtDATA.Text = '  /  /    ') Then
       dmConsultas.cdsCaixa.Close;
     //
     try
        StrToDate(edtDATA.Text);
        edtDATA.Date := StrToDate(edtDATA.Text);
        //Consulta;
     except

     end;
     {If (edtDATA.Text <> '  /  /    ') Then
       Consulta;}
end;

procedure TfrmRelCaixaData.BtCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmRelCaixaData.edtDATAKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) and (edtDATA.Text <> '  /  /    ') Then
     Begin
         Key := #0;
         BtGravar.SetFocus;
     End;

end;

procedure TfrmRelCaixaData.FormShow(Sender: TObject);
begin
    edtDATA.Date := Date();
    //
    dm.RefreshCDS(Dm.CdsConfig);
    //
end;

procedure TfrmRelCaixaData.BtGravarClick(Sender: TObject);
Var
    M_DTMOVI : TDate;
    M_HOMOVI, M_CDMODA, M_NMMODA, M_SNDIGI :String;
    M_CDLOJA, M_CDCAIX : integer;
    M_VLINIC, M_TOTROC,M_VALORMODA, M_SOMAMODA, M_SOMADIFERENCA, TOTAL, M_TODESC : Real;
begin
   If (dmConsultas.cdsCaixa.Active)
     AND not (dmConsultas.cdsCaixa.IsEmpty) Then
   Begin
    try
     BtGravar.Enabled := False;
     //
     Try
        dm.parametros;
        //
        M_RGINIC := dmConsultas.cdsCaixaCAI_RGINICIAL.Value;
        If (dmConsultas.cdsCaixaCAI_SITUACAO.AsString = 'A') Then
            M_RGFINA := dm.CdsConfigCFG_SEQUENCIA.AsInteger
        Else
            M_RGFINA := dmConsultas.cdsCaixaCAI_RGFINAL.AsInteger;
        //
        M_CDLOJA := dmConsultas.cdsCaixaCAI_LOJA.AsInteger;
        M_CDCAIX := dmConsultas.cdsCaixaCAI_CAIXA.AsInteger;
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
            M_VLINIC := qryVLINICIAL.FieldByName('MCA_VLMODALIDADE').AsCurrency;
        //
        With ppRSituacaoCaixa do
        Begin
             lbl_NMRELA.Caption := 'SITUAÇÃO DO CAIXA';
             lblCaixa.Caption   := uFrmAdmin.M_NMUSUA;
             lblVLINICIAL.Caption := 'ABERTURA DO CAIXA : '+ FormatFloat('###,###,##0.#0',M_VLINIC);
             lbl_DATA.Caption     := edtDATA.Text;
             lbl_CAIXA.Caption    := uFuncoes.StrZero(InttoStr(M_CDCAIX),3)+ ' - '+ qryVLINICIAL.FieldByName('MCA_NMCAIXA').AsString;
             If (dmConsultas.cdsCaixaCAI_SITUACAO.AsString = 'A') Then
                 lbl_Situacao.Caption := 'ABERTO'
             Else
                 lbl_Situacao.Caption := 'FECHADO';
        End;
        //
        Dm.cdsModalidade.Close;
        With dm.dstModalidades do
        Begin
            Active := False;
            CommandText := 'Select * from MODALIDADE order By MOD_NOME';
            Active := True;
        End;
        Dm.cdsModalidade.Open;
        Dm.cdsModalidade.First;
        //
        cdsMovCaixa.Open;
        cdsMovCaixa.EmptyDataSet;
        //
        ppMmoModa.Lines.Clear;
        MmoValor.Lines.Clear;
        mmoInfo.Lines.Clear;
        mmoDiferenca.Lines.Clear;
        //
        M_SOMAMODA      := 0;
        M_SOMADIFERENCA := 0;
        TOTAL           := 0;
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
               cdsMovCaixa.Append;
               cdsMovCaixa.FieldByName('MCA_MODALIDADE').AsString := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsString;
               cdsMovCaixa.FieldByName('MCA_MODANOME').AsString   := Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
               cdsMovCaixa.FieldByName('MCA_NATUREZA').AsInteger  := qryMovCaixa.FieldByName('MCA_NATUREZA').AsInteger;
               M_TOTROC := qryMovCaixa.FieldByName('MCA_TOTROCO').AsCurrency;
               If not (Dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString = 'D') Then
                   M_TOTROC := 0;
               //
               cdsMovCaixa.FieldByName('MCA_VLMODALIDADE').AsCurrency := qryMovCaixa.FieldByName('TOTAL').AsCurrency - M_TOTROC;
               cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := 'V';
               cdsMovCaixa.Post;
               //
               M_VALORMODA := M_VALORMODA + (qryMovCaixa.FieldByName('TOTAL').AsCurrency-M_TOTROC);
               M_SOMAMODA  := M_SOMAMODA + M_VALORMODA;
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
               //
               M_VALORMODA := M_VALORMODA + qryEntradaSaida.FieldByName('MCA_VLMODALIDADE').AsCurrency;
               M_SOMAMODA  := M_SOMAMODA + qryEntradaSaida.FieldByName('MCA_VLMODALIDADE').AsCurrency;
               // Proximo
               qryEntradaSaida.Next;
             End;
           End;
            // Movimento do caixa - Recebimento de Conta
            With qryEntradaSaida do
            begin
               Active := False;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
               Params.ParamByName('pCAIXA').AsInteger := M_CDCAIX;
               Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
               Params.ParamByName('pSEQFINAL').AsInteger  := M_RGFINA;
               Params.ParamByName('pTIPOMOV').AsString := 'R';
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
               cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := 'R';
               cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := qryEntradaSaida.FieldByName('MCA_OBSEVACAO').AsString;
               cdsMovCaixa.Post;
               //
               M_VALORMODA := M_VALORMODA + qryEntradaSaida.FieldByName('MCA_VLMODALIDADE').AsCurrency;
               M_SOMAMODA  := M_SOMAMODA + qryEntradaSaida.FieldByName('MCA_VLMODALIDADE').AsCurrency;
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
               //
               M_VALORMODA := M_VALORMODA - (qryEntradaSaida.FieldByName('MCA_VLMODALIDADE').AsCurrency);
               M_SOMAMODA  := M_SOMAMODA - (qryEntradaSaida.FieldByName('MCA_VLMODALIDADE').AsCurrency);
               // Proximo
               qryEntradaSaida.Next;
             End;
           End;
           // Movimento do caixa - Conta a Pagar
           With qryEntradaSaida do
           begin
               Active := False;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
               Params.ParamByName('pCAIXA').AsInteger := M_CDCAIX;
               Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
               Params.ParamByName('pSEQFINAL').AsInteger  := M_RGFINA;
               Params.ParamByName('pTIPOMOV').AsString := 'P';
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
               cdsMovCaixa.FieldByName('MCA_TIPOMOV').AsString    := 'P';
               cdsMovCaixa.FieldByName('MCA_OBSERVACAO').AsString := qryEntradaSaida.FieldByName('MCA_OBSEVACAO').AsString;
               cdsMovCaixa.Post;
               //
               M_VALORMODA := M_VALORMODA - (qryEntradaSaida.FieldByName('MCA_VLMODALIDADE').AsCurrency);
               M_SOMAMODA  := M_SOMAMODA - (qryEntradaSaida.FieldByName('MCA_VLMODALIDADE').AsCurrency);
               // Proximo
               qryEntradaSaida.Next;
             End;
           End;
          //
          If (M_VALORMODA <> 0) Then
          Begin
               With ppRSituacaoCaixa do
               Begin
                   ppMmoModa.Lines.Add(Dm.cdsModalidade.FieldByName('MOD_NOME').AsString);
                   MmoValor.Lines.Add(FormatFloat('###,###,##0.#0',M_VALORMODA));
               End;
          End;
          //
          If (dmConsultas.cdsCaixaCAI_SITUACAO.AsString = 'F') Then
          Begin
               With dmConsultas.qryCaixaFechar do
               Begin
                    Close;
                    Params.ParamByName('pNUMERO').AsInteger     := dmConsultas.cdsCaixaCAI_NUMERO.AsInteger;
                    Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
                    Open;
               End;
               //
               If not (dmConsultas.qryCaixaFechar.IsEmpty) Then
               Begin
                   With ppRSituacaoCaixa do
                   Begin
                       If (dmConsultas.qryCaixaFechar.FieldByName('CXF_VALOR').AsCurrency > 0) Then
                       begin
                          mmoInfo.Lines.Add(FormatFloat('###,###,##0.#0',dmConsultas.qryCaixaFechar.FieldByName('CXF_VALOR').AsCurrency));
                          mmoDiferenca.Lines.Add(FormatFloat('###,###,##0.#0',
                             dmConsultas.qryCaixaFechar.FieldByName('CXF_VALOR').AsCurrency - M_VALORMODA));
                       End
                       else
                       begin
                            mmoInfo.Lines.Add(' ');
                            mmoDiferenca.Lines.Add(' ');
                       End;
                       //
                       M_SOMADIFERENCA := M_SOMADIFERENCA + dmConsultas.qryCaixaFechar.FieldByName('CXF_VALOR').AsCurrency;
                       TOTAL           := TOTAL + (dmConsultas.qryCaixaFechar.FieldByName('CXF_VALOR').AsCurrency - M_VALORMODA);
                   End;
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
       With ppRSituacaoCaixa do
       Begin
             //
             ppMmoModa.Lines.Add(uFuncoes.Replicate('-',42));
             MmoValor.Lines.Add (uFuncoes.Replicate('-',28));
             //
             ppMmoModa.Lines.Add('TOTAL :');
             MmoValor.Lines.Add(FormatFloat('###,###,##0.#0',M_SOMAMODA));
             //
             If (dmConsultas.cdsCaixaCAI_SITUACAO.AsString = 'F') Then
             Begin
                  mmoInfo.Lines.Add(uFuncoes.Replicate('-',28));
                  mmoDiferenca.Lines.Add(uFuncoes.Replicate('-',28));
                  // mmoInfo.Lines.Add(FormatFloat('###,###,##0.#0', M_SOMADIFERENCA));
                  mmoDiferenca.Lines.Add(FormatFloat('###,###,##0.#0',TOTAL));
             End;
             //
             dmRelatorios.Comissoes(M_RGINIC, M_RGFINA);
             //
             If not (dmRelatorios.cdscomissoes.IsEmpty) Then
              begin
                   txtAtendentes.Lines.Clear;
                   txtAtendentesValor.Lines.Clear;
                   txtComissao.Lines.Clear;
                   //
                   dmRelatorios.cdscomissoes.First;
                   //
                   While not (dmRelatorios.cdscomissoes.Eof) do
                    begin
                         txtAtendentes.Lines.Add(dmRelatorios.cdsComissoesFUN_NOME.AsString);
                         txtAtendentesValor.Lines.Add(FormatFloat('###,##0.#0',dmRelatorios.cdsComissoesTOTAL.AsCurrency));
                         txtComissao.Lines.Add(FormatFloat('##,##0.#0',dmRelatorios.cdsComissoesTAXA.AsCurrency));
                         //
                         dmRelatorios.cdscomissoes.Next;
                    End;
              End;
              //
              txtTotalVendas.Caption  := '';
              //
              dmRelatorios.TeleEntregas(M_RGINIC, M_RGFINA);
              //
              If not (dmRelatorios.cdsTeleEntrega.IsEmpty) Then
                begin
                      If (dmRelatorios.cdsTeleEntregaTOTAL_VENDA.AsFloat > 0) Then
                          txtTotalVendas.Caption   := FormatFloat('###,##0.#0', (dmRelatorios.cdsTeleEntregaTOTAL_VENDA.AsFloat * 100) / M_SOMAMODA) + ' %'
                      Else
                          txtTotalVendas.Caption   := '';
                      // dmRelatorios.cdsTeleEntregaTOTAL_VENDA.AsFloat
                      {txtTotalServico.Caption  := FormatFloat('###,##0.#0',dmRelatorios.cdsTeleEntregaTOTAL_SERVICO.AsFloat);
                      txtTotalServicos.Caption := FormatFloat('###,##0.#0',dmRelatorios.cdsTeleEntregaTOTAL_VENDA.AsFloat + dmRelatorios.cdsTeleEntregaTOTAL_SERVICO.AsFloat);}
                End;
             // Imprimir na tela
             PrintReport;
       End;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //
             Close;
        End;
     End;
    Finally
         BtGravar.Enabled := True;
    End;
    Application.ProcessMessages;
  End;
end;

procedure TfrmRelCaixaData.cdsMovCaixaCalcFields(DataSet: TDataSet);
begin
     If (cdsMovCaixaMCA_TIPOMOV.AsString = 'V') THEN
       cdsMovCaixaMCA_DESCNATU.AsString := 'TOTAL VENDIDO'
     Else
       cdsMovCaixaMCA_DESCNATU.AsString :=
          cdsMovCaixaMCA_NOMENATUREZA.AsString;
     //
     If (cdsMovCaixaMCA_TIPOMOV.AsString = '%') THEN
        cdsMovCaixaMCA_DESCNATU.AsString := 'TOTAL DE DESCONTOS'; 
     //
     If (cdsMovCaixaMCA_TIPOMOV.AsString = 'V')
       or (cdsMovCaixaMCA_TIPOMOV.AsString = 'E') THEN
          cdsMovCaixaMCA_SINAL.AsString := '(+)'
     Else
          cdsMovCaixaMCA_SINAL.AsString := '(-)';
end;

procedure TfrmRelCaixaData.grdConsultarDblClick(Sender: TObject);
begin
     If (dmConsultas.cdsCaixa.Active)
       AND not (dmConsultas.cdsCaixa.IsEmpty) Then
          BtGravarClick(Sender);
end;

procedure TfrmRelCaixaData.edtDATAEnter(Sender: TObject);
begin
   // edtDATA.Clear;
end;

procedure TfrmRelCaixaData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmConsultas.cdsCaixa.Close;
     //
     Action := caFree;
end;

procedure TfrmRelCaixaData.btnConsultarClick(Sender: TObject);
begin
     If (edtDATA.Text <> '  /  /    ' ) Then
        Consulta;
end;

End.
