unit uFrmRelCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ppCtrls, ppBands, ppClass,
  ppStrtch, ppMemo, ppVar, ppPrnabl, ppCache, ppProd, ppReport, DB, ppDB,
  ppComm, ppRelatv, ppDBPipe, DBClient, FMTBcd, SqlExpr;

type
  TfrmRelCaixa = class(TForm)
    pnlCliente: TPanel;
    Label4: TLabel;
    lbl_NMUSUA: TLabel;
    sbLocCaixa: TSpeedButton;
    dbeCAIXA: TEdit;
    pnlBotoes: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
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
    qryCaixa: TSQLQuery;
    qryMovCaixa: TSQLQuery;
    qryVLINICIAL: TSQLQuery;
    qryProcurar: TSQLQuery;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    qryEntradaSaida: TSQLQuery;
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeCAIXAKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCAIXAExit(Sender: TObject);
    procedure sbLocCaixaClick(Sender: TObject);
    procedure cdsMovCaixaCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
   procedure VALIDAR_CAIXA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCaixa: TfrmRelCaixa;
  M_NRSEQU, M_QTTENT, M_NRCAIX, W_CDLOJA : Integer;
  M_RGINIC, M_RGFINA : Integer;
  M_SNATUAL : String;

implementation

uses uFuncoes, Udm, udmConsulta, uFrmBuscaCaixa;

{$R *.dfm}

procedure TfrmRelCaixa.BtCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelCaixa.BtGravarClick(Sender: TObject);
Var
    M_DTMOVI : TDate;
    M_HOMOVI, M_CDMODA, M_NMMODA, M_SNDIGI :String;
    M_CDLOJA : integer;
    M_VLINIC, M_TOTROC,M_VALORMODA, M_SOMAMODA : Real;
begin
     Try
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
        M_SOMAMODA := 0;
        //
        While not (Dm.cdsModalidade.Eof) do
        Begin
            M_TOTROC := 0;
            M_VALORMODA := 0;
            // Movimento do caixa - Vendas
            With qryMovCaixa do
            begin
               Active := False;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
               Params.ParamByName('pCAIXA').AsInteger := StrtoInt(dbeCAIXA.Text);
               Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
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
               Params.ParamByName('pCAIXA').AsInteger := StrtoInt(dbeCAIXA.Text);
               Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
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
           // Movimento do caixa - Saida
           With qryEntradaSaida do
           begin
               Active := False;
               Params.ParamByName('pMODALIDADE').AsInteger := Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
               Params.ParamByName('pCAIXA').AsInteger := StrtoInt(dbeCAIXA.Text);
               Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
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
          Dm.cdsModalidade.Next;
        End;  // Fim-do-enquanto
        //
        With qryVLINICIAL do
        Begin
             Close;
             Params.ParamByName('pSEQUENCIA').AsInteger := M_RGINIC;
             Params.ParamByName('pCAIXA').AsInteger     := StrtoInt(dbeCAIXA.text);
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
             lblCaixa.Caption   := lbl_NMUSUA.Caption;
             lblVLINICIAL.Caption := 'ABERTURA DO CAIXA : '+ FormatFloat('###,###,##0.#0',M_VLINIC);
             //
             ppMmoModa.Lines.Add(uFuncoes.Replicate('-',45));
             MmoValor.Lines.Add(uFuncoes.Replicate('-',30));
             //
             ppMmoModa.Lines.Add('TOTAL :');
             MmoValor.Lines.Add(FormatFloat('###,###,##0.#0',M_SOMAMODA));
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
End;

procedure TfrmRelCaixa.VALIDAR_CAIXA;
begin
     With qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA from USUARIOS');
          SQL.Add('Where (SEN_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(dbeCAIXA.Text);
          //
          Open;
     End;
     //
     If (qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de caixa não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMUSUA.Caption := '';
          dbeCAIXA.SetFocus;
          dbeCAIXA.Clear;
          Exit;
     End
     Else
     begin
          If (qryProcurar.FieldByName('SEN_FLCAIXA').AsString = 'N')
            OR uFuncoes.Empty(qryProcurar.FieldByName('SEN_FLCAIXA').AsString) Then
          Begin
               Application.MessageBox('Usuário não é caixa!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               qryProcurar.Close;
               lbl_NMUSUA.Caption := '';
               dbeCAIXA.SetFocus;
               dbeCAIXA.Clear;
               Exit;
          End;
          //
          With qryCaixa do
          Begin
               Close;
               Params.ParamByName('pCAIXA').AsInteger   := StrtoInt(dbeCAIXA.Text);
               Params.ParamByName('pSITUACAO').AsString := 'A';
               Open;
          End;
          //
          If (qryCaixa.IsEmpty) Then
          begin
               MessageBox (Application.Handle, pChar('Caixa já está fechado para '+#13+'este operador!!!'),
                           'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);
               qryCaixa.Close;
               dbeCAIXA.Clear;
               dbeCAIXA.SetFocus;
               Exit;
          End
          Else
          begin
              //
              lbl_NMUSUA.Caption := qryProcurar.FieldByName('SEN_NOME').AsString;
              M_SNATUAL          := qryProcurar.FieldByName('SEN_SNATUA').AsString;
              M_RGINIC := qryCaixa.FieldByName('CAI_RGINICIAL').AsInteger;
              M_RGFINA := qryCaixa.FieldByName('CAI_RGFINAL').AsInteger;
              M_NRCAIX := qryCaixa.FieldByName('CAI_NUMERO').AsInteger;
              dbeCAIXA.Text := uFuncoes.StrZero(dbeCAIXA.Text,3);
              //
              BtGravar.SetFocus; 
          End;
     End;
end;


procedure TfrmRelCaixa.dbeCAIXAKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13]) then
        key:=#0;
     //
     If (key = #13) and uFuncoes.Empty(dbeCAIXA.Text) Then
     Begin
          Key := #0;
          sbLocCaixaClick(Sender);
     End;
     //
     If (key = #13) and NOT uFuncoes.Empty(dbeCAIXA.Text) Then
     Begin
          Key := #0;
          BtGravar.SetFocus;
     End;

end;

procedure TfrmRelCaixa.dbeCAIXAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeCAIXA.Text) Then
          VALIDAR_CAIXA;
end;

procedure TfrmRelCaixa.sbLocCaixaClick(Sender: TObject);
begin
  with TfrmBuscaCaixa.create(self) do
  try
    uFrmBuscaCaixa.W_NRFORM := 3;
    showmodal;
  finally
    If not uFuncoes.Empty(uFrmBuscaCaixa.M_CDCAIX) Then
         dbeCAIXA.Text := uFuncoes.StrZero(uFrmBuscaCaixa.M_CDCAIX,3);
    free;
  end;
end;

procedure TfrmRelCaixa.cdsMovCaixaCalcFields(DataSet: TDataSet);
begin
     If (cdsMovCaixaMCA_TIPOMOV.AsString = 'V') THEN
       cdsMovCaixaMCA_DESCNATU.AsString := 'TOTAL VENDIDO'
     Else
       cdsMovCaixaMCA_DESCNATU.AsString :=
          cdsMovCaixaMCA_NOMENATUREZA.AsString;
     //
     If (cdsMovCaixaMCA_TIPOMOV.AsString = 'V')
       or (cdsMovCaixaMCA_TIPOMOV.AsString = 'E') THEN
          cdsMovCaixaMCA_SINAL.AsString := '(+)'
     Else
          cdsMovCaixaMCA_SINAL.AsString := '(-)';
end;

procedure TfrmRelCaixa.FormShow(Sender: TObject);
begin
    lbl_NMUSUA.Caption := '';
end;

end.
