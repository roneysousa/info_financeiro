unit uFrmRelFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr,
  DBClient, Provider, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppVar, ppStrtch, ppMemo,
  VDODmPrinter, VDOCaPrinter;

type
  TfrmRelFluxoCaixa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BtImprimir: TBitBtn;
    BtSair: TBitBtn;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    dstFluxoCaixa: TSQLDataSet;
    dspFluxo: TDataSetProvider;
    cdsFluxo: TClientDataSet;
    dsFluxo: TDataSource;
    ppReport1: TppReport;
    ppDBPFluxo: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    lbl_NMRELA: TppLabel;
    lbl_Usuario: TppLabel;
    lbl_DATA: TppLabel;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine5: TppLine;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel11: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppDBCVLVenda: TppDBCalc;
    ppDBCTotCompra: TppDBCalc;
    ppDBCTotBruto: TppDBCalc;
    cdsFluxoSEC_CODIGO: TIntegerField;
    cdsFluxoSEC_DESCRICAO: TStringField;
    cdsFluxoQUANTIDADE: TFMTBCDField;
    cdsFluxoVLVENDA: TFMTBCDField;
    cdsFluxoVLCOMPRA: TFMTBCDField;
    cdsFluxoBRUTO: TFMTBCDField;
    mmoContas: TppMemo;
    ppLabel12: TppLabel;
    mmoVLContas: TppMemo;
    ppLine4: TppLine;
    dstContasPagas: TSQLDataSet;
    dspContasPagas: TDataSetProvider;
    cdsContasPagas: TClientDataSet;
    dstModalidades: TSQLDataSet;
    cdsContasPagasPAG_DESCRICAO: TMemoField;
    cdsContasPagasPAG_VALORPARCELA: TFMTBCDField;
    dspModalidade: TDataSetProvider;
    cdsModalidade: TClientDataSet;
    qryDescontos: TSQLQuery;
    qryDescontosACRESCIMO: TFMTBCDField;
    qryDescontosDESCONTO: TFMTBCDField;
    cdsModalidadeMOD_NOME: TStringField;
    cdsModalidadeVALOR: TFMTBCDField;
    cdsContasPagasPAG_DATACOMPRA: TDateField;
    cbxMatricial: TCheckBox;
    procedure BtSairClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
     Procedure DESCONTO_ACRESCIMO;
     Procedure MATRICIAL;
     Procedure MATRICIAL_NOVO;
     Procedure RELATORIO_NOVO; 
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFluxoCaixa: TfrmRelFluxoCaixa;
  M_VLDESC, M_VLACRE : Double;

implementation

uses uFuncoes, Udm, UFrmAdmin, uFrmPreviewMatricial;

{$R *.dfm}

procedure TfrmRelFluxoCaixa.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelFluxoCaixa.edtDTINICExit(Sender: TObject);
begin
    If (edtDTINIC.Text <> '  /  /    ') Then
    begin
        try
              StrToDate(edtDTINIC.Text);
        except
              on EConvertError do
              begin
                  ShowMessage ('Data Inválida!');
                  edtDTINIC.SetFocus;
                  Exit;
              End;
        end;
    End;
end;

procedure TfrmRelFluxoCaixa.edtDTFINAExit(Sender: TObject);
begin
    If (edtDTFINA.Text <> '  /  /    ') Then
    begin
        try
              StrToDate(edtDTFINA.Text);
              //
              If (edtDTFINA.Date < edtDTINIC.Date) Then
              begin
                   edtDTFINA.SetFocus;
                   Exit;
              End;
        except
              on EConvertError do
              begin
                  ShowMessage ('Data Inválida!');
                  edtDTFINA.SetFocus;
                  Exit;
              End;
        end;
    End;
end;

procedure TfrmRelFluxoCaixa.BtImprimirClick(Sender: TObject);
var
    M_TOPO, M_TOTMOD, M_SUMPAG : Double;
    M_TOVEND, M_TOCOMP, M_TOBRUT, M_TOLIQU : Double;
begin
     If (edtDTINIC.Text = '  /  /    ') Then
     begin
          Application.MessageBox('Digite o período inicial!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTINIC.SetFocus;
          Exit;
     End;
     //
     If (edtDTFINA.Text  = '  /  /    ') Then
     begin
          Application.MessageBox('Digite o período final!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTFINA.SetFocus;
          Exit;
     End;
     //
   BtImprimir.enabled := False;
   try
    If not (cbxMatricial.Checked) Then
    begin
           //
           {M_TOVEND := 0;
           M_TOCOMP := 0;
           M_TOBRUT := 0;
           M_TOLIQU := 0;
           //
           With cdsFluxo do
            begin
                 Close;
                 Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
                 Open;
                 //
                 First;
                 While not (Eof) do
                  begin
                       M_TOCOMP := M_TOCOMP + FieldByName('VLCOMPRA').AsCurrency;
                       M_TOBRUT := M_TOBRUT + FieldByName('BRUTO').AsCurrency;
                       M_TOVEND := M_TOVEND + FieldByName('VLVENDA').AsCurrency;
                       //
                       next;
                  End;
            End;
           // Contas Pagas
           With cdsContasPagas do
            begin
                 Close;
                 Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
                 Open;
                 //
                 M_SUMPAG := 0;
                       mmoContas.Height   := 4.23;
                       mmoVLContas.Height := 4.23;
                       mmoContas.Lines.Clear;
                       mmoVLContas.Lines.Clear;
                 //
                 If not(IsEmpty) Then
                  begin
                       First;
                       //
                       While not (Eof) do
                        begin
                             With ppReport1 do
                              begin
                                   mmoContas.Lines.Add(Copy(cdsContasPagasPAG_DESCRICAO.AsString,1,29));
                                   mmoVLContas.Lines.Add(Format('%12.2f',[cdsContasPagasPAG_VALORPARCELA.AsCurrency]));
                                   //
                                   If not (EOf) Then
                                    begin
                                         mmoContas.Height   := mmoContas.Height   + 4.23;
                                         mmoVLContas.Height := mmoVLContas.Height + 4.23;
                                    End;
                              End;
                             M_SUMPAG := M_SUMPAG + cdsContasPagasPAG_VALORPARCELA.AsCurrency;
                             //
                             next;
                        End;
                  End;
            End;
           // Modalidades
           With cdsModalidade do
            begin
                 Close;
                 Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
                 Open;
                 //
                 M_TOTMOD := 0;
                 If not(IsEmpty) Then
                  begin
                       First;
                       //
                       mmoContas.Height   := mmoContas.Height   + 9;
                       mmoVLContas.Height := mmoVLContas.Height + 9;
                       mmoContas.Lines.Add(' ');
                       mmoVLContas.Lines.Add(' ');
                       mmoContas.Lines.Add('>> MODALIDADE VENDAS');
                       mmoVLContas.Lines.Add('');
                       //
                       While not (Eof) do
                        begin
                             //
                             With ppReport1 do
                              begin
                                   mmoContas.Lines.Add(uFuncoes.Alltrim(cdsModalidadeMOD_NOME.AsString));
                                   mmoVLContas.Lines.Add(Format('%12.2f',[cdsModalidadeVALOR.AsFloat]));
                                   //
                                   If not (EOf) Then
                                    begin
                                       mmoContas.Height   := mmoContas.Height   + 4.23;
                                       mmoVLContas.Height := mmoVLContas.Height + 4.23;
                                    End;
                              End;
                             M_TOPO   := M_TOPO + 4;
                             M_TOTMOD := M_TOTMOD + cdsModalidadeVALOR.AsFloat;
                             //
                             next;
                        End;
                        //
                        mmoContas.Height   := mmoContas.Height   + 4.23;
                        mmoVLContas.Height := mmoVLContas.Height + 4.23;
                        //
                        mmoContas.Lines.Add(uFuncoes.Replicate('-',60));
                        mmoVLContas.Lines.Add(uFuncoes.Replicate('-',20));
                        //
                        mmoContas.Lines.Add('TOTAL MODALIDADES ==>');
                        mmoVLContas.Lines.Add(Format('%12.2f',[M_TOTMOD]));
                        //
                        M_TOPO := M_TOPO + 4;
                  End;
            End;
            //
           DESCONTO_ACRESCIMO;
           //
           mmoContas.Height   := mmoContas.Height   + 84.6;
           mmoVLContas.Height := mmoVLContas.Height + 84.6;
           mmoContas.Lines.Add('');
           mmoContas.Lines.Add('');
           mmoVLContas.Lines.Add('');
           mmoVLContas.Lines.Add('');
           //
           mmoContas.Lines.Add('>> TOTAIS');
           mmoVLContas.Lines.Add('');
           mmoContas.Lines.Add(uFuncoes.Replicate('-',60));
           mmoVLContas.Lines.Add(uFuncoes.Replicate('-',20));
           //
           mmoContas.Lines.Add(Format('%-20s', ['TOTAL VENDIDO   ']));
           mmoVLContas.Lines.Add(Format('%12.2f',[M_TOVEND]));
           mmoContas.Lines.Add(Format('%-20s', ['VALOR DE COMPRA ']));
           mmoVLContas.Lines.Add(Format('%12.2f',[M_TOCOMP]));
           mmoContas.Lines.Add(Format('%-20s', ['LUCRO BRUTO     ']));
           mmoVLContas.Lines.Add(Format('%12.2f',[M_TOBRUT]));
           mmoContas.Lines.Add(Format('%-20s', ['DESCONTOS       ']));
           mmoVLContas.Lines.Add(Format('%12.2f',[M_VLDESC]));
           mmoContas.Lines.Add(Format('%-20s', ['ACRESCIMOS      ']));
           mmoVLContas.Lines.Add(Format('%12.2f',[M_VLACRE]));
           mmoContas.Lines.Add(Format('%-20s', ['CONTAS PAGAS    ']));
           mmoVLContas.Lines.Add(Format('%12.2f',[M_SUMPAG]));
           mmoContas.Lines.Add('');
           mmoVLContas.Lines.Add('');
           M_TOLIQU := M_TOVEND - (M_TOCOMP + M_VLDESC + M_SUMPAG) + M_VLACRE;
           mmoContas.Lines.Add(Format('%-20s', ['LUCRO LIQUIDO   ']));
           mmoVLContas.Lines.Add(Format('%12.2f',[M_TOLIQU]));
           //
           With ppReport1 do
            begin
                 lbl_Usuario.Caption := UFrmAdmin.M_NMUSUA;
                 lbl_DATA.Caption    := edtDTINIC.Text + ' à '+ edtDTFINA.Text;
                 //
                 PrintReport;
            End;           }
            //
            RELATORIO_NOVO;
    End
    Else
          MATRICIAL_NOVO;
          //MATRICIAL;
    //
  finally
         cdsFluxo.Close;
         cdsContasPagas.Close;
         cdsModalidade.Close;
         //
         BtImprimir.enabled := True;
  End;
end;

procedure TfrmRelFluxoCaixa.FormShow(Sender: TObject);
begin
     edtDTINIC.Date := Date();
     edtDTFINA.Date := Date();
end;

procedure TfrmRelFluxoCaixa.DESCONTO_ACRESCIMO;
begin
     With qryDescontos do
      begin
           close;
           Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
           Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 M_VLDESC := FieldByName('DESCONTO').AsCurrency;
                 M_VLACRE := FieldByName('ACRESCIMO').AsCurrency;
            End
            Else
            begin
                 M_VLDESC := 0;
                 M_VLACRE := 0;
            End;
            //
            close;
      End;
end;

procedure TfrmRelFluxoCaixa.MATRICIAL;
Var
  Impressora, Arquivo : TextFile;
  M_DTINIC, M_DTFINA : Tdate;
  M_CAMINH, M_NMFILE : String;
  M_SUMPAG, M_TOTMOD, M_TOVEND, M_TOCOMP : Double;
  M_TOBRUT, M_TOLIQU : Double;
  M_NRPAGE, M_LINHA : Integer;

procedure PAGINA;
  begin
       If (M_LINHA = 61) Then
          begin
              WriteLn(Arquivo);
              WriteLn(Arquivo, Format('%8s' , ['Pagina : '])+Format('%d' , [M_NRPAGE]));
              WriteLn(Arquivo);
              WriteLn(Arquivo);
              //
              M_NRPAGE := M_NRPAGE + 1;
              M_LINHA := 1;
          End;
  End;
begin
     try
        M_DTINIC := edtDTINIC.Date;
        M_DTFINA := edtDTFINA.Date;
        M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
        M_NMFILE := M_CAMINH+'\NN.TXT';
        //
        AssignFile(Arquivo, M_NMFILE);
        if FileExists(M_NMFILE) then
            DeleteFile(M_NMFILE);
        //
        Rewrite(Arquivo, M_NMFILE);
        //
        M_NRPAGE := 1;
        {envia caractere de controle para comprimir a impressão}
        Write(Arquivo,#15);
        M_LINHA := M_LINHA + 1;
        Writeln(Arquivo);
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo, 'RELATORIO..: FLUXO DE CAIXA');
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo, 'USUARIO....: '+ UFrmAdmin.M_NMUSUA);
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo, 'PERIODO....: '+ edtDTINIC.text + ' a '+edtDTFINA.text);
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo, uFuncoes.Replicate('=',100));
        M_LINHA := M_LINHA + 1;
        Write  (Arquivo, Format('%-10s',['COD.SECAO']));
        Write  (Arquivo, Format('%-32s',['NOME DA SECAO']));
        Write  (Arquivo, Format('%-13s',['QUANT.VENDIDA']));
        Write  (Arquivo, Format('%15s' ,['VENDA']));
        Write  (Arquivo, Format('%15s' ,['COMPRA']));
        WriteLn(Arquivo, Format('%15s' ,['LUC.BRUTO']));
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo, uFuncoes.Replicate('-',100));
        //
        With cdsFluxo do
           begin
                Close;
                Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
                Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
                Open;
                //
                First;
                While not (Eof) do
                 begin
                      M_LINHA := M_LINHA + 1;
                      Write  (Arquivo, Format('%10s' , [FieldByName('SEC_CODIGO').AsString+uFuncoes.Replicate(' ',5)]));
                      //Write  (Arquivo, Format('%5s' , [uFuncoes.Replicate(' ',5)]));
                      Write  (Arquivo, Format('%-33s',[FieldByName('SEC_DESCRICAO').AsString]));
                      Write  (Arquivo, Format('%12.3f',[FieldByName('QUANTIDADE').AsFloat]));
                      Write  (Arquivo, Format('%15.2f',[FieldByName('VLVENDA').AsCurrency]));
                      Write  (Arquivo, Format('%15.2f',[FieldByName('VLCOMPRA').AsCurrency]));
                      WriteLn(Arquivo, Format('%15.2f',[FieldByName('BRUTO').AsCurrency]));
                      //
                      M_TOCOMP := M_TOCOMP + FieldByName('VLCOMPRA').AsCurrency;
                      M_TOBRUT := M_TOBRUT + FieldByName('BRUTO').AsCurrency;
                      M_TOVEND := M_TOVEND + FieldByName('VLVENDA').AsCurrency;
                      //
                      PAGINA;
                      //
                      next;
                 End;
           End;
        //
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo, uFuncoes.Replicate('-',100));
        M_LINHA := M_LINHA + 1;
        Write  (Arquivo, uFuncoes.Replicate(' ',55));
        Write  (Arquivo, Format('%15.2f',[M_TOVEND]));
        Write  (Arquivo, Format('%15.2f',[M_TOCOMP]));
        WriteLn(Arquivo, Format('%15.2f',[M_TOBRUT]));
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo);
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo);
        PAGINA;
        // Contas Pagas
        With cdsContasPagas do
          begin
               Close;
               Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
               Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
               Open;
               //
               M_SUMPAG := 0;
               //
               If not(IsEmpty) Then
                begin
                     First;
                     //
                     M_LINHA := M_LINHA + 1;
                     WriteLn(Arquivo, Format('%-30s',['>>> CONTAS PAGAS']));
                     M_LINHA := M_LINHA + 1;
                     Writeln(Arquivo, Format('%-52s',[uFuncoes.Replicate('-',52)]));
                     //
                     While not (Eof) do
                      begin
                           M_LINHA := M_LINHA + 1;
                           Write  (Arquivo, Format('%-40s', [Copy(cdsContasPagasPAG_DESCRICAO.AsString,1,38)]));
                           WriteLn(Arquivo, Format('%12.2f',[cdsContasPagasPAG_VALORPARCELA.AsCurrency]));
                           //
                           M_SUMPAG := M_SUMPAG + cdsContasPagasPAG_VALORPARCELA.AsCurrency;
                           //
                           If (M_LINHA = 63) Then
                           begin
                                WriteLn(Arquivo, Format('%8s' , ['Pagina :'])+Format('%d' , [M_NRPAGE]));
                                WriteLn(Arquivo);
                                WriteLn(Arquivo);
                                WriteLn(Arquivo);
                                //
                                M_NRPAGE := M_NRPAGE + 1;
                                M_LINHA := 1;
                            End;
                           //
                           PAGINA;
                           //
                           next;
                      End;    // fim-enquanto
                End; // fim-se
          End; // fim-with
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo);
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo);
        // Modalidades
         With cdsModalidade do
            begin
                 Close;
                 Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
                 Open;
                 //
                 M_TOTMOD := 0;
                 If not(IsEmpty) Then
                  begin
                       First;
                       //
                       M_LINHA := M_LINHA + 1;
                       WriteLn(Arquivo, Format('%-30s',['>>> MODALIDADE VENDAS']));
                       //
                       While not (Eof) do
                        begin
                             M_LINHA := M_LINHA + 1;
                             Write  (Arquivo, Format('%-40s',[uFuncoes.Alltrim(cdsModalidadeMOD_NOME.AsString)]));
                             WriteLn(Arquivo, Format('%12.2f',[cdsModalidadeVALOR.AsFloat]));
                             //
                             M_TOTMOD := M_TOTMOD + cdsModalidadeVALOR.AsFloat;
                             //
                             PAGINA;
                             //
                             next;
                         End;
                        //
                        M_LINHA := M_LINHA + 1;
                        WriteLn(Arquivo, Format('%-52s',[uFuncoes.Replicate('-',52)]));
                        //
                        M_LINHA := M_LINHA + 1;
                        Write  (Arquivo, Format('%-40s',['TOTAL MODALIDADES ==>']));
                        WriteLn(Arquivo, Format('%12.2f',[M_TOTMOD]));
                        //
                  End;
            End;
        PAGINA;
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo);
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo);
        //
        DESCONTO_ACRESCIMO;
        //
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo, Format('%-52s',['>>> TOTAIS']));
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo, Format('%-52s',[uFuncoes.Replicate('-',52)]));
        //
        M_LINHA := M_LINHA + 1;
        Write  (Arquivo, Format('%-40s', ['TOTAL VENDIDO   ']));
        WriteLn(Arquivo, Format('%12.2f',[M_TOVEND]));
        M_LINHA := M_LINHA + 1;
        Write  (Arquivo, Format('%-40s', ['VALOR DE COMPRA ']));
        WriteLn(Arquivo, Format('%12.2f',[M_TOCOMP]));
        M_LINHA := M_LINHA + 1;
        Write  (Arquivo, Format('%-40s', ['LUCRO BRUTO     ']));
        WriteLn(Arquivo, Format('%12.2f',[M_TOBRUT]));
        M_LINHA := M_LINHA + 1;
        Write  (Arquivo, Format('%-40s', ['DESCONTOS       ']));
        WriteLn(Arquivo, Format('%12.2f',[M_VLDESC]));
        M_LINHA := M_LINHA + 1;
        Write  (Arquivo, Format('%-40s', ['ACRESCIMOS      ']));
        WriteLn(Arquivo, Format('%12.2f',[M_VLACRE]));
        M_LINHA := M_LINHA + 1;
        Write  (Arquivo, Format('%-40s', ['CONTAS PAGAS    ']));
        WriteLn(Arquivo, Format('%12.2f',[M_SUMPAG]));
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo);
        M_TOLIQU := M_TOVEND - (M_TOCOMP + M_VLDESC + M_SUMPAG) + M_VLACRE;
        M_LINHA := M_LINHA + 1;
        Write  (Arquivo, Format('%-40s', ['LUCRO LIQUIDO   ']));
        WriteLn(Arquivo, Format('%12.2f',[M_TOLIQU]));
        //
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo);
        M_LINHA := M_LINHA + 1;
        WriteLn(Arquivo);
     Finally
        CloseFile(Arquivo);
     End;
     //
     Application.CreateForm(TfrmPreviewMatr, frmPreviewMatr);
     Try
            frmPreviewMatr.mmoArquivo.Lines.LoadFromFile(M_NMFILE);
            frmPreviewMatr.ShowModal;
     Finally
            frmPreviewMatr.Release;
            frmPreviewMatr := nil;
     End;
end;

procedure TfrmRelFluxoCaixa.BitBtn1Click(Sender: TObject);
begin
     If (edtDTINIC.Text = '  /  /    ') Then
     begin
          Application.MessageBox('Digite o período inicial!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTINIC.SetFocus;
          Exit;
     End;
     //
     If (edtDTFINA.Text  = '  /  /    ') Then
     begin
          Application.MessageBox('Digite o período final!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTFINA.SetFocus;
          Exit;
     End;
     //
     MATRICIAL;
end;

procedure TfrmRelFluxoCaixa.MATRICIAL_NOVO;
Var
  Impressora, Arquivo : TextFile;
  M_DTINIC, M_DTFINA : Tdate;
  M_CAMINH, M_NMFILE : String;
  M_SUMPAG, M_TOTMOD, M_TOVEND, M_TOCOMP : Double;
  M_TOBRUT, M_TOLIQU : Double;
  M_NRPAGE, M_LINHA : Integer;
  // Variável da classe TVDOCaPrinter  que fará o relatório
    VDOImpressora : TVDODmPrinter;
    Linha : string;
    LinCab1, LinCab2, M_ESPACO : String;
    M_NUMMES, M_QTCARA : Integer;
    M_UNIDAD, M_QUANT, M_NMDESC, M_VLUNIT, M_VALISS : String;
    LINHA1, VALOR, M_POSINI : integer;

begin
     try
        M_DTINIC := edtDTINIC.Date;
        M_DTFINA := edtDTFINA.Date;
        //
        M_NRPAGE := 1;
        //
        VDOImpressora := TVDODmPrinter.Create(Self);
        VDOImpressora.Title := 'Visualizar Impressão';
        { Informando que haverá quebra de página }
        VDOImpressora.Paper.AutoNewPage := True;
        VDOImpressora.ShowPreview       := True;
        VDOImpressora.ShowProgress      := True;
        VDOImpressora.Font.Size         := fsCondensed;
        M_QTCARA := 159;
        //
        With VDOImpressora do
        Begin
            BeginDoc;
            //
            VDOImpressora.Font.Size         := fsCondensed;
            Font.Style := [];
            //
            M_POSINI := 0;
            NewLine();
            Print(M_POSINI, Format('%-30s',['RELATORIO..: FLUXO DE CAIXA']),TRUE);
            Print(M_POSINI, Format('%-30s',['USUARIO....: '+ UFrmAdmin.M_NMUSUA]),true);
            Print(M_POSINI, Format('%-30s',['PERIODO....: '+ edtDTINIC.text + ' a '+edtDTFINA.text]),true);
            Print(M_POSINI, Format('%-100s',[uFuncoes.Replicate('=',100)]),true);
            Print(M_POSINI, Format('%-10s',['COD.SECAO'])+
                            Format('%-32s',['NOME DA SECAO'])+
                            Format('%-13s',['QUANT.VENDIDA'])+
                            Format('%15s' ,['VENDA'])+
                            Format('%15s' ,['COMPRA'])+
                            Format('%15s' ,['LUC.BRUTO']),true);
            //
            Print(M_POSINI, Format('%100s' ,[uFuncoes.Replicate('-',100)]),true);
            //
            With cdsFluxo do
            begin
                Close;
                Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
                Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
                Open;
                //
                First;
                While not (Eof) do
                 begin
                      M_LINHA := M_LINHA + 1;
                      Print(M_POSINI, Format('%10s' , [FieldByName('SEC_CODIGO').AsString+uFuncoes.Replicate(' ',5)])+
                                      Format('%-33s',[FieldByName('SEC_DESCRICAO').AsString])+
                                      Format('%12.3f',[FieldByName('QUANTIDADE').AsFloat])+
                                      Format('%15.2f',[FieldByName('VLVENDA').AsCurrency])+
                                      Format('%15.2f',[FieldByName('VLCOMPRA').AsCurrency])+
                                      Format('%15.2f',[FieldByName('BRUTO').AsCurrency]),true);
                      //
                      M_TOCOMP := M_TOCOMP + FieldByName('VLCOMPRA').AsCurrency;
                      M_TOBRUT := M_TOBRUT + FieldByName('BRUTO').AsCurrency;
                      M_TOVEND := M_TOVEND + FieldByName('VLVENDA').AsCurrency;
                      //
                      next;
                 End;
            End;
        //
        M_LINHA := M_LINHA + 1;
        Print(M_POSINI, uFuncoes.Replicate('-',100),true);
        M_LINHA := M_LINHA + 1;
        Print(M_POSINI, uFuncoes.Replicate(' ',55)+
                        Format('%15.2f',[M_TOVEND])+
                        Format('%15.2f',[M_TOCOMP])+
                        Format('%15.2f',[M_TOBRUT]),true);
        //
        NewLine(2);
        // Contas Pagas
        With cdsContasPagas do
          begin
               Close;
               Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
               Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
               Open;
               //
               M_SUMPAG := 0;
               //
               If not(IsEmpty) Then
                begin
                     First;
                     //
                     Print(M_POSINI, Format('%-30s',['>>> CONTAS PAGAS']),true);
                     Print(M_POSINI, Format('%-52s',[uFuncoes.Replicate('-',52)]),true);
                     //
                     While not (Eof) do
                      begin
                           Print(M_POSINI, Format('%-40s', [Copy(cdsContasPagasPAG_DESCRICAO.AsString,1,38)])+
                                          Format('%12.2f',[cdsContasPagasPAG_VALORPARCELA.AsCurrency]),true);
                           //
                           M_SUMPAG := M_SUMPAG + cdsContasPagasPAG_VALORPARCELA.AsCurrency;
                           //
                           {If (M_LINHA = 63) Then
                           begin
                                Print(M_POSINI, Format('%8s' , ['Pagina :'])+Format('%d' , [M_NRPAGE]),true);
                                NewLine(3);
                            End;}
                           //
                           next;
                      End;    // fim-enquanto
                End; // fim-se
          End; // fim-with
          //
          NewLine(2);
          // Modalidades
          With cdsModalidade do
            begin
                 Close;
                 Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
                 Open;
                 //
                 M_TOTMOD := 0;
                 If not(IsEmpty) Then
                  begin
                       First;
                       //
                       M_LINHA := M_LINHA + 1;
                       Print(M_POSINI, Format('%-30s',['>>> MODALIDADE VENDAS']),true);
                       //
                       While not (Eof) do
                        begin
                             M_LINHA := M_LINHA + 1;
                             Print(M_POSINI, Format('%-40s',[uFuncoes.Alltrim(cdsModalidadeMOD_NOME.AsString)])+
                                             Format('%12.2f',[cdsModalidadeVALOR.AsFloat]),true);
                             //
                             M_TOTMOD := M_TOTMOD + cdsModalidadeVALOR.AsFloat;
                             //
                             next;
                         End;
                        //
                        M_LINHA := M_LINHA + 1;
                        Print(M_POSINI, Format('%-52s',[uFuncoes.Replicate('-',52)]),true);
                        //
                        M_LINHA := M_LINHA + 1;
                        Print(M_POSINI, Format('%-40s',['TOTAL MODALIDADES ==>'])+
                                        Format('%12.2f',[M_TOTMOD]),true);
                        //
                  End;
          End;
          //
          NewLine(2);
          //
          DESCONTO_ACRESCIMO;
          //
          Print(M_POSINI, Format('%-52s',['>>> TOTAIS']),true);
          Print(M_POSINI, Format('%-52s',[uFuncoes.Replicate('-',52)]),true);
          //
          Print(M_POSINI, Format('%-40s', ['TOTAL VENDIDO   '])+
                          Format('%12.2f',[M_TOVEND]),true);
          Print(M_POSINI, Format('%-40s', ['VALOR DE COMPRA '])+
                          Format('%12.2f',[M_TOCOMP]),true);
          Print(M_POSINI, Format('%-40s', ['LUCRO BRUTO     '])+
                          Format('%12.2f',[M_TOBRUT]),true);
          Print(M_POSINI, Format('%-40s', ['DESCONTOS       '])+
                          Format('%12.2f',[M_VLDESC]),true);
          Print(M_POSINI, Format('%-40s', ['ACRESCIMOS      '])+
                          Format('%12.2f',[M_VLACRE]),true);
          Print(M_POSINI, Format('%-40s', ['CONTAS PAGAS    '])+
                          Format('%12.2f',[M_SUMPAG]),true);
          NewLine();
          //
          M_TOLIQU := M_TOVEND - (M_TOCOMP + M_VLDESC + M_SUMPAG) + M_VLACRE;
          Print(M_POSINI, Format('%-40s', ['LUCRO LIQUIDO   '])+
                          Format('%12.2f',[M_TOLIQU]),true);
          //
          NewLine(3);
          //Print(M_POSINI, Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']),true);
          { Salta duas linhas }
          //NewLine(2);
          //
          EndDoc;
          FreeAndNil(VDOImpressora);
       End; // fim- with VDOImpressora
     Finally

     End;
     //
end;

procedure TfrmRelFluxoCaixa.RELATORIO_NOVO;
Var
  Impressora, Arquivo : TextFile;
  M_DTINIC, M_DTFINA : Tdate;
  M_CAMINH, M_NMFILE : String;
  M_SUMPAG, M_TOTMOD, M_TOVEND, M_TOCOMP : Double;
  M_TOBRUT, M_TOLIQU : Double;
  M_NRPAGE, M_LINHA : Integer;
  // Variável da classe TVDOCaPrinter  que fará o relatório
    VDOImpressora : TVDOCaPrinter;
    Linha : string;
    LinCab1, LinCab2, M_ESPACO : String;
    M_NUMMES, M_QTCARA : Integer;
    M_UNIDAD, M_QUANT, M_NMDESC, M_VLUNIT, M_VALISS : String;
    LINHA1, VALOR, M_POSINI : integer;

begin
     try
        M_DTINIC := edtDTINIC.Date;
        M_DTFINA := edtDTFINA.Date;
        //
        M_NRPAGE := 1;
        //
        VDOImpressora := TVDOCaPrinter.Create(Self);
        VDOImpressora.Title := 'Visualizar Impressão';
        { Informando que haverá quebra de página }
        VDOImpressora.Paper.AutoNewPage := True;
        VDOImpressora.ShowPreview       := True;
        VDOImpressora.ShowProgress      := True;
        //VDOImpressora.Font.Name         := 'Arial';
        VDOImpressora.Font.Size         := 9;
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
            Print(M_POSINI, Format('%-30s',['RELATORIO..: FLUXO DE CAIXA']),TRUE);
            Print(M_POSINI, Format('%-30s',['USUARIO....: '+ UFrmAdmin.M_NMUSUA]),true);
            Print(M_POSINI, Format('%-30s',['PERIODO....: '+ edtDTINIC.text + ' a '+edtDTFINA.text]),true);
            Print(M_POSINI, Format('%-100s',[uFuncoes.Replicate('=',100)]),true);
            Print(M_POSINI, Format('%-10s',['COD.SECAO'])+
                            Format('%-32s',['NOME DA SECAO'])+
                            Format('%-13s',['QUANT.VENDIDA'])+
                            Format('%15s' ,['VENDA'])+
                            Format('%15s' ,['COMPRA'])+
                            Format('%15s' ,['LUC.BRUTO']),true);
            //
            Print(M_POSINI, Format('%100s' ,[uFuncoes.Replicate('-',100)]),true);
            //
            With cdsFluxo do
            begin
                Close;
                Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
                Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
                Open;
                //
                First;
                While not (Eof) do
                 begin
                      M_LINHA := M_LINHA + 1;
                      Print(M_POSINI, Format('%10s' , [FieldByName('SEC_CODIGO').AsString+uFuncoes.Replicate(' ',5)])+
                                      Format('%-33s',[FieldByName('SEC_DESCRICAO').AsString])+
                                      Format('%12.3f',[FieldByName('QUANTIDADE').AsFloat])+
                                      Format('%15.2f',[FieldByName('VLVENDA').AsCurrency])+
                                      Format('%15.2f',[FieldByName('VLCOMPRA').AsCurrency])+
                                      Format('%15.2f',[FieldByName('BRUTO').AsCurrency]),true);
                      //
                      M_TOCOMP := M_TOCOMP + FieldByName('VLCOMPRA').AsCurrency;
                      M_TOBRUT := M_TOBRUT + FieldByName('BRUTO').AsCurrency;
                      M_TOVEND := M_TOVEND + FieldByName('VLVENDA').AsCurrency;
                      //
                      next;
                 End;
            End;
        //
        M_LINHA := M_LINHA + 1;
        Print(M_POSINI, uFuncoes.Replicate('-',100),true);
        M_LINHA := M_LINHA + 1;
        Print(M_POSINI, uFuncoes.Replicate(' ',55)+
                        Format('%15.2f',[M_TOVEND])+
                        Format('%15.2f',[M_TOCOMP])+
                        Format('%15.2f',[M_TOBRUT]),true);
        //
        NewLine(2);
        // Contas Pagas
        With cdsContasPagas do
          begin
               Close;
               Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
               Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
               Open;
               //
               M_SUMPAG := 0;
               //
               If not(IsEmpty) Then
                begin
                     First;
                     //
                     Print(M_POSINI, Format('%-30s',['>>> CONTAS PAGAS']),true);
                     Print(M_POSINI, Format('%-52s',[uFuncoes.Replicate('-',52)]),true);
                     //
                     While not (Eof) do
                      begin
                           {Print(M_POSINI, Format('%-40s', [Copy(cdsContasPagasPAG_DESCRICAO.AsString,1,38)])+
                                          Format('%12.2f',[cdsContasPagasPAG_VALORPARCELA.AsCurrency]),true);}
                           Print(M_POSINI, Format('%-40s', [Copy(uFuncoes.RemoveEnter(cdsContasPagasPAG_DESCRICAO.AsString),1,30)]));
                           Print(M_POSINI, Format('%12.2f',[cdsContasPagasPAG_VALORPARCELA.AsCurrency]),true);
                           //
                           M_SUMPAG := M_SUMPAG + cdsContasPagasPAG_VALORPARCELA.AsCurrency;
                           //
                           {If (M_LINHA = 63) Then
                           begin
                                Print(M_POSINI, Format('%8s' , ['Pagina :'])+Format('%d' , [M_NRPAGE]),true);
                                NewLine(3);
                            End;}
                           //
                           next;
                      End;    // fim-enquanto
                End; // fim-se
          End; // fim-with
          //
          NewLine(2);
          // Modalidades
          With cdsModalidade do
            begin
                 Close;
                 Params.ParamByName('pDTINCIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
                 Open;
                 //
                 M_TOTMOD := 0;
                 If not(IsEmpty) Then
                  begin
                       First;
                       //
                       M_LINHA := M_LINHA + 1;
                       Print(M_POSINI, Format('%-30s',['>>> MODALIDADE VENDAS']),true);
                       //
                       While not (Eof) do
                        begin
                             M_LINHA := M_LINHA + 1;
                             Print(M_POSINI, Format('%-40s',[uFuncoes.Alltrim(cdsModalidadeMOD_NOME.AsString)])+
                                             Format('%12.2f',[cdsModalidadeVALOR.AsFloat]),true);
                             //
                             M_TOTMOD := M_TOTMOD + cdsModalidadeVALOR.AsFloat;
                             //
                             next;
                         End;
                        //
                        M_LINHA := M_LINHA + 1;
                        Print(M_POSINI, Format('%-52s',[uFuncoes.Replicate('-',52)]),true);
                        //
                        M_LINHA := M_LINHA + 1;
                        Print(M_POSINI, Format('%-40s',['TOTAL MODALIDADES ==>'])+
                                        Format('%12.2f',[M_TOTMOD]),true);
                        //
                  End;
          End;
          //
          NewLine(2);
          //
          DESCONTO_ACRESCIMO;
          //
          Print(M_POSINI, Format('%-52s',['>>> TOTAIS']),true);
          Print(M_POSINI, Format('%-52s',[uFuncoes.Replicate('-',52)]),true);
          //
          Print(M_POSINI, Format('%-40s', ['TOTAL VENDIDO   '])+
                          Format('%12.2f',[M_TOVEND]),true);
          Print(M_POSINI, Format('%-40s', ['VALOR DE COMPRA '])+
                          Format('%12.2f',[M_TOCOMP]),true);
          Print(M_POSINI, Format('%-40s', ['LUCRO BRUTO     '])+
                          Format('%12.2f',[M_TOBRUT]),true);
          Print(M_POSINI, Format('%-40s', ['DESCONTOS       '])+
                          Format('%12.2f',[M_VLDESC]),true);
          Print(M_POSINI, Format('%-40s', ['ACRESCIMOS      '])+
                          Format('%12.2f',[M_VLACRE]),true);
          Print(M_POSINI, Format('%-40s', ['CONTAS PAGAS    '])+
                          Format('%12.2f',[M_SUMPAG]),true);
          NewLine();
          //
          M_TOLIQU := M_TOVEND - (M_TOCOMP + M_VLDESC + M_SUMPAG) + M_VLACRE;
          Print(M_POSINI, Format('%-40s', ['LUCRO LIQUIDO   '])+
                          Format('%12.2f',[M_TOLIQU]),true);
          //
          NewLine(3);
          //Print(M_POSINI, Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']),true);
          { Salta duas linhas }
          //NewLine(2);
          //
          EndDoc;
          FreeAndNil(VDOImpressora);
       End; // fim- with VDOImpressora
     Finally

     End;
     //
end;

end.
