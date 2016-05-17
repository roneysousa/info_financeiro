unit uFrmRelMovCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmRelatorio, StdCtrls, Buttons, ExtCtrls, Mask, VDODmPrinter, VDOCaPrinter,
  ToolEdit, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TfrmRelMovimentoCaixa = class(TfrmRelatorio)
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    cmbConta: TComboBox;
    lblConta2: TLabel;
    Label2: TLabel;
    dstMovCaixa: TSQLDataSet;
    dspMovCaixa: TDataSetProvider;
    cdsMovCaixa: TClientDataSet;
    cdsMovCaixaCGM_LOJA: TIntegerField;
    cdsMovCaixaCGM_TIPO_MOV: TStringField;
    cdsMovCaixaCGM_DTMOVI: TDateField;
    cdsMovCaixaCGM_VLMOVIMENTO: TFMTBCDField;
    cdsMovCaixaCGM_DESCRICAO: TStringField;
    cdsMovCaixaCGM_VLMOVIMENTO_1: TFMTBCDField;
    cdsMovCaixaCGS_DESCRICAO: TStringField;
    cdsMovCaixaCGM_CLIENTE: TIntegerField;
    cdsMovCaixaCGM_FORNECEDOR: TIntegerField;
    cdsMovCaixaNAT_NOME: TStringField;
    cdsMovCaixaCGM_RECEITA: TFloatField;
    cdsMovCaixaCGM_DESPESA: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure cdsMovCaixaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelMovimentoCaixa: TfrmRelMovimentoCaixa;

implementation

uses uFuncoes, Udm, UFrmAdmin, udmDados, uDmRelatorios, Math;

{$R *.dfm}

procedure TfrmRelMovimentoCaixa.FormShow(Sender: TObject);
begin
  inherited;
     Dm.CampoConta(cmbConta);
     //
     edtDTINIC.Date := Date();
     edtDTFINA.Date := Date();
end;

procedure TfrmRelMovimentoCaixa.btImprimirClick(Sender: TObject);
Var
  // Variável da classe TVDOCaPrinter  que fará o relatório
    VDOImpressora : TVDOCaPrinter;
    Linha : string;
    LinCab1, LinCab2, M_ESPACO : String;
    M_POSINI, M_QTCARA : integer;
    M_VLSALD, M_TOCTPG, M_RECEIT, M_DESPES : Double;
begin
     if (edtDTINIC.Text = '  /  /    ' ) Then
      Begin
           edtDTINIC.SetFocus;
           raise Exception.Create('Informe o período inicial.');
      End;
      //
     if (edtDTFINA.Text = '  /  /    ' ) Then
      Begin
           edtDTFINA.SetFocus;
           raise Exception.Create('Informe o período final.');
      End;
      // 
     try
        VDOImpressora := TVDOCaPrinter.Create(Self);
        VDOImpressora.Title := 'Visualizar Impressão';
        { Informando que haverá quebra de página }
        VDOImpressora.Paper.AutoNewPage := True;
        VDOImpressora.ShowPreview       := True;
        VDOImpressora.ShowProgress      := True;
        //VDOImpressora.Font.Name         := 'Arial';
        VDOImpressora.Font.Size         := 8;
        M_QTCARA := 159;
        //
        With VDOImpressora do
        Begin
            BeginDoc;
            //
            Font.Style := [];
            //
            M_POSINI := 0;
            NewLine();
            Print(M_POSINI, Format('%-80s',['INFOG2 AUTOMAÇÃO                              DATA/HORA.: '+ DatetoStr(Date)+' - '+TimetoStr(Time)]),TRUE);
            Print(M_POSINI, Format('%-80s',['MOVIMENTO DE CAIXA                            USUARIO...: '+ uFrmAdmin.M_NMUSUA]),TRUE);
            Print(M_POSINI, Format('%-80s',[uFuncoes.Replicate('-',81)]), True);
            Print(M_POSINI, Format('%-80s',['PERIODO........: '+edtDTINIC.Text+ ' a '+ edtDTFINA.Text]),true);
            Print(M_POSINI, Format('%-80s',[uFuncoes.Replicate('-',138)]), True);
            Print(M_POSINI, Format('%-80s',['DATA       NATUREZA                       HISTORICO                                 COMPLEMENTO                   RECEITA    DESPESA  MOD']), true);
            Print(M_POSINI, Format('%-80s',[uFuncoes.Replicate('-',138)]), True);
            // Aqui
            M_RECEIT := 0;
            M_DESPES := 0;
            //
            With cdsMovCaixa do
              begin
                   Active := False;
                   CommandText := 'Select MC.cgm_loja, N.NAT_NOME, MC.cgm_tipo_mov, MC.cgm_dtmovi, ';
                   CommandText := CommandText + 'MC.cgm_vlmovimento, MC.cgm_descricao, MC.cgm_vlmovimento, CS.CGS_DESCRICAO, ';
                   CommandText := CommandText + 'MC.cgm_cliente,  MC.CGM_FORNECEDOR ';
                   CommandText := CommandText + 'from MOVIMENTO_CONTAS MC ';
                   CommandText := CommandText + 'INNER join NATUREZA N ON MC.cgm_natureza = N.nat_codigo ';
                   CommandText := CommandText + 'INNER join contas_saldos CS ON MC.cgm_conta_saiu = CS.cgs_codigo ';
                   CommandText := CommandText + 'WHERE (MC.cgm_dtmovi between :pDTINIC AND :pDTFINA) ';
                   If not Empty(cmbConta.Text) Then
                       CommandText := CommandText + ' and (MC.cgm_conta_saiu = '+QuotedStr(InttoStr(dm.GetCodConta(cmbConta.Text)))+') ';
                   //
                   Params.ParamByName('pDTINIC').AsDate := edtDTINIC.Date;
                   Params.ParamByName('pDTFINA').AsDate := edtDTFINA.Date;
                   Active := True;
                   //
                   if not (IsEmpty) Then
                    begin
                         First;
                         While not (Eof) do
                          begin
                               Print(M_POSINI , Format('%-11s', [FieldByName('CGM_DTMOVI').AsString]));
                               Print(M_POSINI , Format('%-31s', [FieldByName('NAT_NOME').AsString]));
                               Print(M_POSINI , Format('%-50s', [FieldByName('CGM_DESCRICAO').AsString]));
                               Print(M_POSINI , Format('%-12s', [uFuncoes.Replicate('',20)]));
                               //
                               If (Alltrim(cdsMovCaixaCGM_TIPO_MOV.AsString) = 'E' ) Then
                               Begin
                                    Print(M_POSINI ,     Format('%-17s',[uFuncoes.Padr(FormatFloat('###,###,##0.#0',FieldByName('CGM_RECEITA').AsCurrency),17)]));
                                    Print(M_POSINI ,     Format('%-12s',[uFuncoes.Padr('0,00',12)]));
                                    M_RECEIT := M_RECEIT + FieldByName('CGM_RECEITA').AsCurrency;
                               End;
                               //
                               If (Alltrim(cdsMovCaixaCGM_TIPO_MOV.AsString) = 'S' ) Then
                               begin
                                    Print(M_POSINI ,     Format('%-17s',[uFuncoes.Padr('0,00',17)]));
                                    Print(M_POSINI ,     Format('%-12s',[uFuncoes.Padr(FormatFloat('###,###,##0.#0',FieldByName('CGM_DESPESA').AsCurrency),12)]));
                                    M_DESPES := M_DESPES + FieldByName('CGM_DESPESA').AsCurrency;
                               End;
                               //
                               Print(M_POSINI , Format('%4s', [Copy(FieldByName('CGS_DESCRICAO').AsString,1,3)]),true);
                               //
                               Next;
                          End;
                    End;
              End;
            Print(M_POSINI, Format('%-80s',[uFuncoes.Replicate('-',138)]), True);
            Print(M_POSINI, Format('%-80s',['TOTAL GERAL ==> ']));
            Print(M_POSINI + 109, Format('%-13s',[uFuncoes.Padr(FormatFloat('###,###,##0.#0', M_RECEIT),12)]));
            Print(M_POSINI + 123, Format('%-11s',[uFuncoes.Padr(FormatFloat('###,###,##0.#0', M_DESPES),10)]),true);
            NewLine();
            Print(M_POSINI, Format('%-80s',['>> CONTAS']),true);
            Dm.RefreshCDS(dmdados.cdsContaSaldo);
            With dmdados.cdsContaSaldo do
            begin
                 First;
                 M_VLSALD := 0;
                 While not (Eof) do
                  begin
                       Print(M_POSINI + 5,  Format('%-30s',[FieldByName('CGS_DESCRICAO').AsString]));
                       Print(M_POSINI + 31, Format('%-1s', [':']));
                       Print(M_POSINI ,     Format('%-17s',[uFuncoes.Padr(FormatFloat('###,###,##0.#0',FieldByName('CGS_VALOR_SALDO').AsCurrency),17)]),true);
                       M_VLSALD := M_VLSALD + FieldByName('CGS_VALOR_SALDO').AsCurrency;
                       //
                       Next;
                  End;
            End;
            Print(M_POSINI, Format('%-80s',[uFuncoes.Replicate('-',53)]), True);
            Print(M_POSINI + 5, Format('%-30s',['SALDO ATUAL ==>']));
            Print(M_POSINI + 31, Format('%-1s', [' ']));
            Print(M_POSINI ,     Format('%-17s',[uFuncoes.Padr(FormatFloat('###,###,##0.#0', M_VLSALD),17)]),true);
            //
            NewLine();
            Print(M_POSINI, Format('%-80s',['>> CONTAS A PAGAR']),true);
            Print(M_POSINI + 5, Format('%-30s',['FORNECEDOR']));
            Print(M_POSINI + 31, Format('%-1s', [' ']));
            Print(M_POSINI ,    Format('%-20s',[uFuncoes.Replicate('-',11)+'DEBITO']), True);
            //
            With dmRelatorios.cdsContasPagar do
              begin
                   close;
                   Params.ParamByName('pSITUACAO').AsString := 'A';
                   Open;
                   //
                   If Not (IsEmpty) Then
                    Begin
                         First;
                         M_TOCTPG := 0;
                         While not (Eof) do
                          begin
                               Print(M_POSINI + 5, Format('%-30s',[FieldByName('FOR_FANTASIA').AsString]));
                               Print(M_POSINI + 31, Format('%-1s', [' ']));
                               Print(M_POSINI ,    Format('%-20s',[uFuncoes.Padr(FormatFloat('###,###,##0.#0', FieldByName('PAG_VALORPARCELA').AsFloat),17)]),True);
                               M_TOCTPG := M_TOCTPG + FieldByName('PAG_VALORPARCELA').AsFloat;
                               //
                               Next;
                          End;
                    End;
              End;
            //
            Print(M_POSINI, Format('%-80s',[uFuncoes.Replicate('-',53)]), True);
            Print(M_POSINI + 5, Format('%-30s',['TOTAL GERAL ==>']));
            Print(M_POSINI + 31, Format('%-1s', [' ']));
            Print(M_POSINI ,     Format('%-17s',[uFuncoes.Padr(FormatFloat('###,###,##0.#0', M_TOCTPG),17)]),true);
            NewLine();
          //
          EndDoc;
          FreeAndNil(VDOImpressora);
       End; // fim- with VDOImpressora
     finally

     End;
     //
  inherited;
end;

procedure TfrmRelMovimentoCaixa.cdsMovCaixaCalcFields(DataSet: TDataSet);
begin
  inherited;
       if (Alltrim(cdsMovCaixaCGM_TIPO_MOV.AsString) = 'E' ) Then
            cdsMovCaixaCGM_RECEITA.AsFloat := cdsMovCaixaCGM_VLMOVIMENTO.AsFloat;
       if (Alltrim(cdsMovCaixaCGM_TIPO_MOV.AsString) = 'S' ) Then
            cdsMovCaixaCGM_DESPESA.AsFloat := cdsMovCaixaCGM_VLMOVIMENTO.AsFloat;
end;

end.
