unit uFrmRelTotVendVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, FMTBcd, DB, SqlExpr,
  DBClient, Provider, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppVar, ComCtrls, VDODmPrinter;

type
  TfrmRelTotVendVendedor = class(TForm)
    Panel2: TPanel;
    BtSair: TBitBtn;
    btImprimir: TBitBtn;
    dstVendas: TSQLDataSet;
    dspVendas: TDataSetProvider;
    cdsVendas: TClientDataSet;
    dsVendas: TDataSource;
    ppReport1: TppReport;
    ppDBVendedores: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel1: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel12: TppLabel;
    ppLine5: TppLine;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    txtPeriodo: TppLabel;
    cdsVendasMOV_VENDEDOR: TIntegerField;
    cdsVendasSUM: TFMTBCDField;
    cdsVendasFUN_NOME: TStringField;
    cdsVendasCODIGO: TStringField;
    ppLabel3: TppLabel;
    dstDetalhado: TSQLDataSet;
    dspDetalhado: TDataSetProvider;
    cdsDetalhado: TClientDataSet;
    dsDetalhado: TDataSource;
    cdsDetalhadoMOV_VENDEDOR: TIntegerField;
    cdsDetalhadoFUN_NOME: TStringField;
    cdsDetalhadoPRO_DESCRICAO: TStringField;
    cdsDetalhadoQUANT: TFMTBCDField;
    cdsDetalhadoVALOR: TFMTBCDField;
    ppReport2: TppReport;
    ppDBPDetalhado: TppDBPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppDBImage2: TppDBImage;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    txtPeriodo2: TppLabel;
    ppLine2: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppLabel11: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine6: TppLine;
    ppLabel14: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel16: TppLabel;
    ppDBText8: TppDBText;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    ckbDetalhado: TCheckBox;
    Label2: TLabel;
    edtDTINIC2: TDateEdit;
    edtDTFINA2: TDateEdit;
    ckbDetalhado2: TCheckBox;
    dstVendedores: TSQLDataSet;
    cdsVendedores: TClientDataSet;
    dsVendedores: TDataSource;
    dspVendedores: TDataSetProvider;
    ppReport3: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand3: TppHeaderBand;
    ppDBImage3: TppDBImage;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    txtPeriodo3: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine7: TppLine;
    ppLabel20: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel21: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppDBText13: TppDBText;
    ppLabel26: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLine10: TppLine;
    cdsVendedoresMOV_PEDIDO: TIntegerField;
    cdsVendedoresMOV_DATAVENDA: TDateField;
    cdsVendedoresMOV_HORAVENDA: TStringField;
    cdsVendedoresPRO_DESCRICAO: TStringField;
    cdsVendedoresHIS_VLVENDA: TFMTBCDField;
    cdsVendedoresMOV_ENTRADA: TFMTBCDField;
    cdsVendedoresVENDEDOR: TStringField;
    ppLabel19: TppLabel;
    ppDBText9: TppDBText;
    ppLabel22: TppLabel;
    ppLabel27: TppLabel;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    cdsVendedoresHIS_VENDEDOR: TIntegerField;
    cdsVendedoresPRO_VLDESC: TFloatField;
    cdsVendedoresPRO_VLACRE: TFloatField;
    cdsVendedoresPRO_DIFDESC: TFloatField;
    cdsVendedoresPRO_DIFACRE: TFloatField;
    cdsVendedoresMOV_VALOR: TFMTBCDField;
    cdsVendedoresPRO_AVISTA: TFloatField;
    cdsVendedoresPRO_APRAZO: TFloatField;
    cdsVendedoresMOV_DESCONTO: TFMTBCDField;
    cdsVendedoresHIS_PRODUTO: TStringField;
    cdsVendedoresMOV_ACRESCIMO: TFMTBCDField;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLine11: TppLine;
    ppLabel33: TppLabel;
    ppVariable1: TppVariable;
    ppVariable2: TppVariable;
    ppVariable3: TppVariable;
    cdsVendedoresSUB_PEAVISTA: TBCDField;
    cdsVendedoresSUB_PEAPRAZO: TBCDField;
    cbxVendedor: TCheckBox;
    dstRelatorio: TSQLDataSet;
    dspRelatorio: TDataSetProvider;
    cdsRelatorio: TClientDataSet;
    dsRelatorio: TDataSource;
    ppDBPipeline2: TppDBPipeline;
    cdsRelatorioFUN_NOME: TStringField;
    cdsRelatorioPRO_DESCRICAO: TStringField;
    cdsRelatorioQUANT: TFMTBCDField;
    cdsRelatorioVALOR: TFMTBCDField;
    dstRelatorioFUN_NOME: TStringField;
    dstRelatorioPRO_DESCRICAO: TStringField;
    dstRelatorioQUANT: TFMTBCDField;
    dstRelatorioVALOR: TFMTBCDField;
    ppReport4: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBImage4: TppDBImage;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    lblPeriodo4: TppLabel;
    ppDBText19: TppDBText;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel41: TppLabel;
    ppLine12: TppLine;
    ppLabel42: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppLine13: TppLine;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLine14: TppLine;
    ppLine15: TppLine;
    tbsComissao: TTabSheet;
    Label3: TLabel;
    edtDTINIC3: TDateEdit;
    edtDTFINA3: TDateEdit;
    dstComissao: TSQLDataSet;
    dspComissao: TDataSetProvider;
    cdsComissao: TClientDataSet;
    dsComissao: TDataSource;
    ppRepComissao: TppReport;
    ppDBPComissao: TppDBPipeline;
    cdsComissaoMOV_PEDIDO: TIntegerField;
    cdsComissaoMOV_DATAVENDA: TDateField;
    cdsComissaoMOV_VALOR: TFMTBCDField;
    cdsComissaoFUN_CODIGO: TIntegerField;
    cdsComissaoFUN_NOME: TStringField;
    cdsComissaoMOV_TAXA_SERVICO: TBCDField;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLabel36: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppImgLogo: TppImage;
    ppLine19: TppLine;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppDBCalc6: TppDBCalc;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    txtPeriodoComissao: TppLabel;
    procedure BtSairClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure cdsVendasCalcFields(DataSet: TDataSet);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTINIC2Exit(Sender: TObject);
    procedure edtDTFINA2Exit(Sender: TObject);
    procedure cdsVendedoresCalcFields(DataSet: TDataSet);
    procedure ppVariable2Print(Sender: TObject);
    procedure ppVariable3Print(Sender: TObject);
    procedure ppVariable1Print(Sender: TObject);
    procedure ckbDetalhadoClick(Sender: TObject);
    procedure edtDTINIC3Exit(Sender: TObject);
    procedure edtDTFINA3Exit(Sender: TObject);
  private
    { Private declarations }
    Procedure RelComissao(aDtInicio, aDtFinal : TDate; aSituacao : String);
  public
    { Public declarations }
  end;

var
  frmRelTotVendVendedor: TfrmRelTotVendVendedor;
  M_NRVEND, W_NRVEND : Integer;

implementation

uses Udm, uFuncoes, udmDados, DateUtils;

{$R *.dfm}

procedure TfrmRelTotVendVendedor.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelTotVendVendedor.btImprimirClick(Sender: TObject);
begin
   If (PageControl1.ActivePageIndex = 0 ) Then
   begin

     If (edtDTINIC.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite o período inicial!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC.SetFocus;
           Exit;
     End;
     //
     If (edtDTFINA.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite o período final!!!','ATENÇÃO',
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
   End;
   //
   If (PageControl1.ActivePageIndex = 2 ) Then
   begin

     If (edtDTINIC3.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite o período inicial!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC3.SetFocus;
           Exit;
     End;
     //
     If (edtDTFINA3.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite o período final!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTFINA3.SetFocus;
           Exit;
     End;
     //
     If (edtDTINIC3.Date > edtDTFINA3.Date) Then
      Begin
           Application.MessageBox('Período inicial maior quer período final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC3.SetFocus;
           Exit;
      End;
   End;
   //
  Try
     btImprimir.Enabled := False;
     //
   If (PageControl1.ActivePageIndex = 0 ) Then
   begin
     If not (ckbDetalhado.Checked) Then
     begin
       Try
          //
          With cdsVendas do
          Begin
               Active := False;
               Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
               Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
               Active := True;
          End;
          //
          If not (cdsVendas.IsEmpty) Then
          begin
            With ppReport1 do
            Begin
                 txtPeriodo.Caption := 'PERÍODO : '+edtDTINIC.Text +' A '+ edtDTFINA.Text;
                 //
                 PrintReport;
            End;
          End
          else
              Application.MessageBox(PChar('Não há movimento no período indicado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar gerar relatório!!!'+#13
                        + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          End;
        End;
      End  // simples
      Else
      begin
        if not (cbxVendedor.Checked) Then
         begin
          try
            With cdsDetalhado do
            Begin
                 Active := False;
                 Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
                 Active := True;
            End;
            //
            If not (cdsDetalhado.IsEmpty) Then
            begin
              With ppReport2 do
              Begin
                   txtPeriodo2.Caption := 'PERÍODO : '+edtDTINIC.Text +' A '+ edtDTFINA.Text;
                   //
                   PrintReport;
              End;
            End
            else
                Application.MessageBox(PChar('Não há movimento no período indicado !'),
                        'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          Except
             on Exc:Exception do
             begin
                 Application.MessageBox(PChar('Erro ao tentar gerar relatório!!!'+#13
                        + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             End;
          End;
        End
        Else
        begin
             With cdsRelatorio do
              begin
                   close;
                   Params.ParamByName('pDTINICIAL').AsDateTime := edtDTINIC.Date;
                   Params.ParamByName('pDTFINAL').AsDateTime   := edtDTFINA.Date;
                   Open;
                   //
                   if not (IsEmpty) Then
                   begin
                       With ppReport4 do
                       begin
                           lblPeriodo4.Caption := 'PERÍODO : '+edtDTINIC.Text + ' À '+edtDTINIC2.Text;
                           PrintReport;
                       End;
                   End
                   else
                       Application.MessageBox(PChar('Não há movimento no período indicado!!!'),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              End;
        End;
      End;
   End;   // PageControl1
   //
   If (PageControl1.ActivePageIndex = 1) Then
   begin
        try
          With cdsVendedores do
          Begin
               Active := False;
               Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC2.Date;
               Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA2.Date;
               Params.ParamByName('pSITUACAO').AsString := 'F';
               Active := True;
          End;
          //
          If not (cdsVendedores.IsEmpty) Then
          begin
              With ppReport3 do
              Begin
                   txtPeriodo3.Caption := 'PERÍODO : '+edtDTINIC2.Text +' A '+ edtDTFINA2.Text;
                   //
                   PrintReport;
              End;
          End
          else
              Application.MessageBox(PChar('Não há movimento no período indicado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar gerar relatório!!!'+#13
                        + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          End;
        End;
   End;
   //
   If (PageControl1.ActivePageIndex = 2) Then
      begin
          If (Dm.CdsConfigCFG_FLMATRICIAL.AsString = 'N') Then
           Begin
             //
             With cdsComissao do
              begin
                 Active :=  False;
                 Params.ParamByName('pDTINICIAL').AsDate  := edtDTINIC3.Date;
                 Params.ParamByName('pDTFINAL').AsDate    := edtDTFINA3.Date;
                 Params.ParamByName('pSITUACAO').AsString := 'F';
                 Active := True;
                 //
                 If not (IsEmpty) Then
                  begin
                       With ppRepComissao do
                        begin
                             ppImgLogo.Picture.Assign(Dm.CdsConfigCFG_IMAGEMLOGO);
                             txtPeriodoComissao.Caption := 'PERÍODO : '+ edtDTINIC3.Text + ' À ' + edtDTFINA3.Text;
                             PrintReport;
                        End;
                  End
                  Else
                      Application.MessageBox(PChar('Não há movimento no período indicado!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              End;
           End
           Else
           Begin
                RelComissao(edtDTINIC.Date, edtDTFINA.Date, 'F');
                {Application.MessageBox(PChar('Modulo não concluído.'),
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);}
           End;
      End;
      //
  Finally
        btImprimir.Enabled := True;
  End;
  Application.ProcessMessages;
end;

procedure TfrmRelTotVendVendedor.cdsVendasCalcFields(DataSet: TDataSet);
begin
      cdsVendasCODIGO.AsString := uFuncoes.StrZero(cdsVendasMOV_VENDEDOR.AsString,5);
end;

procedure TfrmRelTotVendVendedor.edtDTINICExit(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC.Text);
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

procedure TfrmRelTotVendVendedor.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer período final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC.SetFocus;
                Exit;
            End;
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

procedure TfrmRelTotVendVendedor.FormShow(Sender: TObject);
begin
     edtDTINIC.Date := Date;
     edtDTFINA.Date := Date;
     //
     edtDTINIC2.Date := Date;
     edtDTFINA2.Date := Date;
     //
     edtDTINIC3.Date := date;
     edtDTFINA3.Date := Date;
     //
     PageControl1.ActivePageIndex := 0;
     W_NRVEND := 0;
end;

procedure TfrmRelTotVendVendedor.edtDTINIC2Exit(Sender: TObject);
begin
     If (edtDTINIC2.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC2.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTINIC2.Date := Date();
             edtDTINIC2.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmRelTotVendVendedor.edtDTFINA2Exit(Sender: TObject);
begin
     If (edtDTFINA2.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA2.Text);
            //
            If (edtDTINIC2.Date > edtDTFINA2.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC2.SetFocus;
                Exit;
            End;
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTFINA2.Date := Date();
             edtDTFINA2.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmRelTotVendVendedor.cdsVendedoresCalcFields(
  DataSet: TDataSet);
Var
     M_VLDESC, M_DIFDES : Double;
     M_VLACRE, M_DIFACR : Double;
begin
     if (cdsVendedores.State = dsInternalCalc) then
      begin
           M_NRVEND := cdsVendedoresMOV_PEDIDO.AsInteger;
           cdsVendedoresPRO_AVISTA.AsFloat := 0;
           //
           If (cdsVendedoresMOV_ENTRADA.AsFloat > 0) Then
           Begin
              cdsVendedoresPRO_AVISTA.AsFloat :=
                    //SetAvista(cdsVendedoresHIS_VLVENDA.AsFloat, cdsVendedoresMOV_VALOR.AsFloat);
                    SetAvista(cdsVendedoresMOV_ENTRADA.AsFloat, cdsVendedoresMOV_VALOR.AsFloat);
                    //cdsVendedoresHIS_VLVENDA.AsFloat
           end;
           //
           if (cdsVendedoresPRO_AVISTA.AsFloat = cdsVendedoresMOV_VALOR.AsFloat) Then
              cdsVendedoresPRO_APRAZO.AsFloat := 0
           Else
              cdsVendedoresPRO_APRAZO.AsFloat :=
                  cdsVendedoresHIS_VLVENDA.AsFloat - cdsVendedoresPRO_AVISTA.AsFloat;
           //
           If (cdsVendedoresMOV_DESCONTO.AsFloat > 0) Then
            begin
                 If (M_NRVEND <> W_NRVEND) Then
                 begin
                      M_VLDESC := SetValorDesc(cdsVendedoresMOV_PEDIDO.AsInteger,
                                   cdsVendedoresMOV_DESCONTO.AsFloat);
                      M_DIFDES := cdsVendedoresMOV_DESCONTO.AsFloat - (M_VLDESC * GetQuantItemVenda(cdsVendedoresMOV_PEDIDO.AsInteger));
                      cdsVendedoresPRO_VLDESC.AsFloat := M_VLDESC + M_DIFDES;
                 End
                 Else
                    cdsVendedoresPRO_VLDESC.AsFloat :=
                         SetValorDesc(cdsVendedoresMOV_PEDIDO.AsInteger,
                                   cdsVendedoresMOV_DESCONTO.AsFloat);
                 //
            End
            else
                cdsVendedoresPRO_VLDESC.AsFloat := 0;
            //
           If (cdsVendedoresMOV_ACRESCIMO.AsFloat > 0) Then
            begin
                 If (M_NRVEND <> W_NRVEND) Then
                 begin
                      M_VLACRE := SetValorAcre(cdsVendedoresMOV_PEDIDO.AsInteger,
                                   cdsVendedoresMOV_ACRESCIMO.AsFloat);
                      M_DIFACR := cdsVendedoresMOV_ACRESCIMO.AsFloat - (M_VLACRE * GetQuantItemVenda(cdsVendedoresMOV_PEDIDO.AsInteger));
                      cdsVendedoresPRO_VLACRE.AsFloat := M_VLACRE + M_DIFACR;
                 End
                 Else
                    cdsVendedoresPRO_VLACRE.AsFloat :=
                         SetValorAcre(cdsVendedoresMOV_PEDIDO.AsInteger,
                                   cdsVendedoresMOV_ACRESCIMO.AsFloat);
            End
            else
                cdsVendedoresPRO_VLACRE.AsFloat := 0;
            //
            W_NRVEND := cdsVendedoresMOV_PEDIDO.AsInteger;
      End;
end;

procedure TfrmRelTotVendVendedor.ppVariable2Print(Sender: TObject);
begin
     ppVariable2.Value := FormatFloat('###,##0.#0',uFuncoes.Gerapercentual(ppDBCalc2.Value, cdsVendedoresSUB_PEAVISTA.AsFloat));
end;

procedure TfrmRelTotVendVendedor.ppVariable3Print(Sender: TObject);
begin
     ppVariable3.Value := FormatFloat('###,##0.#0',uFuncoes.Gerapercentual(ppDBCalc3.Value, cdsVendedoresSUB_PEAPRAZO.AsFloat));
end;

procedure TfrmRelTotVendVendedor.ppVariable1Print(Sender: TObject);
begin
     ppVariable1.Value := FormatFloat('###,##0.#0',
         uFuncoes.Gerapercentual(ppDBCalc2.Value, cdsVendedoresSUB_PEAVISTA.AsFloat) +
         uFuncoes.Gerapercentual(ppDBCalc3.Value, cdsVendedoresSUB_PEAPRAZO.AsFloat));
end;

procedure TfrmRelTotVendVendedor.ckbDetalhadoClick(Sender: TObject);
begin
      cbxVendedor.Checked := ckbDetalhado.Checked; 
end;

procedure TfrmRelTotVendVendedor.edtDTINIC3Exit(Sender: TObject);
begin
     If (edtDTINIC3.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC3.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTINIC3.Date := Date();
             edtDTINIC3.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmRelTotVendVendedor.edtDTFINA3Exit(Sender: TObject);
begin
     If (edtDTFINA3.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA3.Text);
            //
            If (edtDTINIC3.Date > edtDTFINA3.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC3.SetFocus;
                Exit;
            End;
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTFINA3.Date := Date();
             edtDTFINA3.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmRelTotVendVendedor.RelComissao(aDtInicio, aDtFinal: TDate;
  aSituacao: String);
Var
    // Variável da classe TVDODmPrinter que fará o relatório
    VDOImpressora : TVDODmPrinter;
    Linha : string;
    M_QTCARA : Integer;
    M_POSINI : integer;
    //
    M_CDFUNC, M_QTREGI : Integer;
    M_TXSERV, fTotalComissao : Double;
begin
     With cdsComissao do
       begin
            Active :=  False;
            Params.ParamByName('pDTINICIAL').AsDate  := edtDTINIC3.Date;
            Params.ParamByName('pDTFINAL').AsDate    := edtDTFINA3.Date;
            Params.ParamByName('pSITUACAO').AsString := 'F';
            Active := True;
            //
            If not (IsEmpty) Then
              begin
                   M_QTREGI := cdsComissao.RecordCount;
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
                   //Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
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
                           Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('RELACAO DE COMISSAO', M_QTCARA),M_QTCARA ]), True);
                           { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
                           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*', M_QTCARA )]), True);
                           { Imprime o nome da Loja}
                           Print(M_POSINI, Format('%-48s', [uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString, M_QTCARA)]), True);                           Print(M_POSINI, Format('%-48s', [uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString, M_QTCARA)]), True);
                           { ---- Impressão dos Cabeçalho-----}
                           { Imprime e alinhado à esquerda dentro de uma área de 48 caracteres}
                           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('*',M_QTCARA )]),TRUE);
                           Print(M_POSINI, Format('%-48s', ['PERIODO.........: '+ DatetoStr(aDtInicio) + ' A ' + DatetoStr(aDtFinal)] ), True);
                           //NewLine(2);
                           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=',M_QTCARA )]),TRUE);
                           //
                           cdsComissao.First;
                           M_CDFUNC := cdsComissaoFUN_CODIGO.AsInteger;
                           Print(M_POSINI, Format('%-48s', ['FUNCIONARIO : ' + cdsComissaoFUN_NOME.AsString]),TRUE);
                           Print(M_POSINI, Format('%-8s',  ['N.VENDA']),False);
                           Print(M_POSINI, Format('%-10s', ['DATA']),False);
                           Print(M_POSINI, Format('%15s',  ['VALOR VENDA']),False);
                           Print(M_POSINI, Format('%15s',  ['TX.SERVICO']),TRUE);
                           Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',M_QTCARA )]),TRUE);
                           //
                           fTotalComissao := 0;
                           //
                           While not (cdsComissao.eof) do
                            begin
                                 If (M_CDFUNC <> cdsComissaoFUN_CODIGO.AsInteger) Then
                                  begin
                                       Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('=',M_QTCARA )]),TRUE);
                                       Print(M_POSINI, Format('%-48s', ['FUNCIONARIO : ' + cdsComissaoFUN_NOME.AsString]),TRUE);
                                       Print(M_POSINI, Format('%-8s',  ['N.VENDA']),False);
                                       Print(M_POSINI, Format('%-10s', ['DATA']),False);
                                       Print(M_POSINI, Format('%15s',  ['VALOR VENDA']),False);
                                       Print(M_POSINI, Format('%15s',  ['TX.SERVICO']),TRUE);
                                       Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',M_QTCARA )]),TRUE);
                                  End;
                                 // detalhes
                                 Print(M_POSINI, Format('%-8s', [uFuncoes.StrZero(cdsComissaoMOV_PEDIDO.AsString, 7)]),False);
                                 Print(M_POSINI, Format('%-10s',[cdsComissaoMOV_DATAVENDA.AsString]),False);
                                 Print(M_POSINI, Format('%15s', [FormatFloat('###,##0.#0',cdsComissaoMOV_VALOR.AsFloat)]),False);
                                 Print(M_POSINI, Format('%15s', [FormatFloat('###,##0.#0',cdsComissaoMOV_TAXA_SERVICO.AsFloat)]),TRUE);
                                 fTotalComissao := fTotalComissao + cdsComissaoMOV_TAXA_SERVICO.AsFloat;
                                 //
                                 M_CDFUNC := cdsComissaoFUN_CODIGO.AsInteger;
                                 //
                                 cdsComissao.Next;
                                 //
                                 If (M_CDFUNC <> cdsComissaoFUN_CODIGO.AsInteger) OR (EOF) Then
                                  begin
                                       Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',M_QTCARA )]),TRUE);
                                       Print(M_POSINI, Format('%-27s', [uFuncoes.Replicate(' ',12)+ 'VALOR DA COMISSAO ==> ']),false);
                                       Print(M_POSINI, Format('%14s',  [FormatFloat('###,##0.#0', fTotalComissao)]),TRUE);
                                       Print(M_POSINI, Format('%-48s', [uFuncoes.Replicate('-',M_QTCARA )]),TRUE);
                                       NewLine(2);
                                       fTotalComissao := 0;
                                  End;
                            End;
                            //
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
              End
              Else
                  Application.MessageBox(PChar('Não há movimento no período indicado!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       End;
end;

end.
