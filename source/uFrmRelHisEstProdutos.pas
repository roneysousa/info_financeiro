unit uFrmRelHisEstProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, FMTBcd, DB, SqlExpr,
  DBClient, Provider, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe;

type
  TfrmRelHistEstProdutos = class(TForm)
    pnlDados: TPanel;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    Panel2: TPanel;
    BtSair: TBitBtn;
    btImprimir: TBitBtn;
    edtCDPROD: TEdit;
    Label2: TLabel;
    spProdutos: TSpeedButton;
    lbl_NMPROD: TLabel;
    dstHistorico: TSQLDataSet;
    dspHistorico: TDataSetProvider;
    cdsHistorico: TClientDataSet;
    dsHistorico: TDataSource;
    ppDBHistorico: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    cdsHistoricoHIS_PRODUTO: TStringField;
    cdsHistoricoHIS_DATA: TDateField;
    cdsHistoricoHIS_TIPO: TStringField;
    cdsHistoricoHIS_DOCUMENTO: TIntegerField;
    cdsHistoricoHIS_ANTERIOR: TFMTBCDField;
    cdsHistoricoHIS_ATUAL: TFMTBCDField;
    cdsHistoricoNOMEUSUARIO: TStringField;
    txtPeriodo: TppLabel;
    txtProduto: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel12: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine5: TppLine;
    cdsHistoricoHIS_NOMETIPO: TStringField;
    ppDBText8: TppDBText;
    cdsHistoricoHIS_MOVIMENTO: TFMTBCDField;
    cdsHistoricoHIS_NRDOCU: TStringField;
    procedure BtSairClick(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure spProdutosClick(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsHistoricoCalcFields(DataSet: TDataSet);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelHistEstProdutos: TfrmRelHistEstProdutos;
  M_CDPROD : String;

implementation

Uses uFrmBuscaProdutos, uFuncoes, udmConsulta, Udm;

{$R *.dfm}

procedure TfrmRelHistEstProdutos.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelHistEstProdutos.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
    //
    If (key = #13) and uFuncoes.Empty(edtCDPROD.Text)  Then
    Begin
         key:=#0;
         spProdutosClick(Sender);
    End;
end;

procedure TfrmRelHistEstProdutos.spProdutosClick(Sender: TObject);
begin
  with TfrmBuscaProduto.create(self) do
  try
     uFrmBuscaProdutos.M_NRFROM := 4;
     showmodal;
  finally
    edtCDPROD.Text := M_CDPROD;
    If not uFuncoes.Empty(edtCDPROD.Text) Then
       btImprimir.SetFocus
    Else
       edtCDPROD.SetFocus;
    free;
  end;
end;

procedure TfrmRelHistEstProdutos.edtCDPRODExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
         With dmConsultas.qryProdutos do
         Begin
              Close;
              //
              Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
              //
              Open;
         End;
         //
         If not (dmConsultas.qryProdutos.IsEmpty) Then
         Begin
              lbl_NMPROD.Caption := dmConsultas.qryProdutos.FieldByName('PRO_DESCRICAO').AsString;
              edtCDPROD.Text     := uFuncoes.StrZero(edtCDPROD.Text,13);
              btImprimir.SetFocus;
         End
         Else
         Begin
              Application.MessageBox(PChar('Código de produto não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_NMPROD.Caption := '';
              edtCDPROD.Clear;
              edtCDPROD.SetFocus;
              Exit;
         End;
     End;
end;

procedure TfrmRelHistEstProdutos.btImprimirClick(Sender: TObject);
begin
     If (edtDTINIC.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite o periodo inicial!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC.SetFocus;
           Exit;
     End;
     //
     If (edtDTFINA.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite o periodo final!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTFINA.SetFocus;
           Exit;
     End;
     //
     If uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
           Application.MessageBox('Digite o codigo do produto!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtCDPROD.SetFocus;
           Exit;
     End;
     //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC.SetFocus;
                Exit;
            End;
     
     //
      Try
            cdsHistorico.Close;
            With dstHistorico do
            Begin
                 Active := False;
                 Params.ParamByName('pPRODUTO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
                 Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                 Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
                 Active := True;
            End;
            //
            cdsHistorico.Open;
            //
            With ppReport1 do
            Begin
                 txtPeriodo.Caption := 'PERÍODO : '+edtDTINIC.Text +' A '+ edtDTFINA.Text;
                 txtProduto.Caption := 'PRODUTO : '+lbl_NMPROD.Caption;
                 // 
                 PrintReport;
            End;
      Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar gerar relatório!!!'+#13
                        + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          End;
      End;
end;

procedure TfrmRelHistEstProdutos.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
        lbl_NMPROD.Caption := '';
end;

procedure TfrmRelHistEstProdutos.FormShow(Sender: TObject);
begin
     lbl_NMPROD.Caption := '';
end;

procedure TfrmRelHistEstProdutos.cdsHistoricoCalcFields(DataSet: TDataSet);
begin
     If (cdsHistoricoHIS_TIPO.AsString = 'V ') then
        cdsHistoricoHIS_NOMETIPO.AsString := 'VENDA';
     If (cdsHistoricoHIS_TIPO.AsString = 'TE')
      OR (cdsHistoricoHIS_TIPO.AsString = 'TS') then
        cdsHistoricoHIS_NOMETIPO.AsString := 'TRANSFERENCIA';
     If (cdsHistoricoHIS_TIPO.AsString = 'E ') then
        cdsHistoricoHIS_NOMETIPO.AsString := 'ENTRADA';
     If (cdsHistoricoHIS_TIPO.AsString = 'S ') then
        cdsHistoricoHIS_NOMETIPO.AsString := 'SAIDA';
     //
     If not uFuncoes.Empty(cdsHistoricoHIS_DOCUMENTO.AsString) Then
        cdsHistoricoHIS_NRDOCU.AsString := uFuncoes.StrZero(cdsHistoricoHIS_DOCUMENTO.AsString,7); 
end;

procedure TfrmRelHistEstProdutos.edtDTINICExit(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC.Text);
            edtDTINIC.Date := StrToDate(edtDTINIC.Text);
            //
            If (edtDTINIC.Date > Date()) Then
            Begin
                Application.MessageBox('Período incial não pode ser maior que a data atual!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC.SetFocus;
                Exit;
            End;

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

procedure TfrmRelHistEstProdutos.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            edtDTFINA.date := StrToDate(edtDTFINA.Text);
            //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer periodo final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC.SetFocus;
                Exit;
            End;
            If (edtDTFINA.Date > Date()) Then
            Begin
                Application.MessageBox('Período final não pode ser maior que a data atual!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTFINA.SetFocus;
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

end.
