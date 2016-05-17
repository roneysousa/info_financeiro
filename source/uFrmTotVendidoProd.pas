unit uFrmTotVendidoProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr,
  DBClient, Provider, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppVar;

type
  TfrmRelTotalVendido = class(TForm)
    pnlDados: TPanel;
    Label4: TLabel;
    cmbFabricante: TComboBox;
    Panel2: TPanel;
    BtSair: TBitBtn;
    btImprimir: TBitBtn;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    Label1: TLabel;
    dstTotalVendido: TSQLDataSet;
    dspTotalVendido: TDataSetProvider;
    cdsTotalVendido: TClientDataSet;
    dsTotalVendido: TDataSource;
    ppReport1: TppReport;
    ppDBProdutos: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLabel8: TppLabel;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppLine3: TppLine;
    ppLine1: TppLine;
    ppLine5: TppLine;
    ppLabel12: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    txtPeriodo: TppLabel;
    txtFabricante: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    cdsTotalVendidoPRO_CODIGO: TStringField;
    cdsTotalVendidoPRO_DESCRICAO: TStringField;
    cdsTotalVendidoFOR_FANTASIA: TStringField;
    cdsTotalVendidoUNI_CODIGO: TStringField;
    cdsTotalVendidoQUANTVENDIDA: TFMTBCDField;
    dspEstoque: TDataSetProvider;
    dstEstoque: TSQLDataSet;
    cdsEstoque: TClientDataSet;
    dsEstoque: TDataSource;
    cdsTotalVendidoPRO_QUANTATUAL: TFloatField;
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
  private
    procedure FABRICANTE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTotalVendido: TfrmRelTotalVendido;

implementation

uses udmConsulta, uFuncoes, Udm;

{$R *.dfm}

procedure TfrmRelTotalVendido.BtSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmRelTotalVendido.FABRICANTE;
begin
     dmConsultas.cdsFornecedor.close;
     With dmConsultas.dstSubSecao do
     Begin
          Active := False;
          CommandText :=  'select FOR_CODIGO, FOR_FANTASIA, FOR_RAZAO from FORNECEDORES order by FOR_FANTASIA';
          Active := True;
     End;
     dmConsultas.cdsFornecedor.Open;
     dmConsultas.cdsFornecedor.First;
     //
     cmbFabricante.Clear;
     While not (dmConsultas.cdsFornecedor.Eof) do
     Begin
          cmbFabricante.Items.Add(dmConsultas.cdsFornecedor.FieldByName('FOR_FANTASIA').AsString);
          //
          dmConsultas.cdsFornecedor.Next;
     End;
end;

procedure TfrmRelTotalVendido.FormShow(Sender: TObject);
begin
    FABRICANTE;
    //
    edtDTINIC.SetFocus; 
end;

procedure TfrmRelTotalVendido.btImprimirClick(Sender: TObject);
Var
   W_CDFORN : Integer;
   Linha : String;
begin
      If not uFuncoes.Empty(cmbFabricante.Text) Then
         W_CDFORN := uFuncoes.CDFABRICANTE(cmbFabricante.Text);
      //
      Try
           cdsTotalVendido.Close;
           With dstTotalVendido do
           Begin
                Active := False;
                //
                Linha  := 'Select DISTINCT P.PRO_CODIGO, P.PRO_DESCRICAO, F.for_fantasia, P.uni_codigo, '
                         +' Sum(H.his_movimento) AS QUANTVENDIDA '
                         +' from PRODUTOS P '
                         +' INNER join ESTOQUE E ON E.PRO_CODIGO = P.PRO_CODIGO '
                         +' INNER join HISTORICO H ON H.HIS_PRODUTO = P.PRO_CODIGO '
                         +' INNER join FORNECEDORES F ON F.FOR_CODIGO = P.FOR_CODIGO '
                         +' Where (H.HIS_TIPO = '+QuotedStr('V')+')';
                          //
                          If (edtDTINIC.Text <> '  /  /    ')
                            and (edtDTFINA.Text <> '  /  /    ')
                            and uFuncoes.empty(cmbFabricante.Text)  Then
                              //Linha := Linha + ' And (H.HIS_DATA >= '+QuotedStr(edtDTINIC.Text) +' AND (H.HIS_DATA <= '+QuotedStr(edtDTFINA.Text) + ') ';
                              Linha := Linha + ' And (H.HIS_DATA >= :pDTINICIAL) AND (H.HIS_DATA <= :pDTFINAL) ';
                          //
                          If (edtDTINIC.Text <> '  /  /    ')
                            and (edtDTFINA.Text <> '  /  /    ')
                            and not uFuncoes.empty(cmbFabricante.Text)  Then
                               Linha := Linha + ' And (H.HIS_DATA >= :pDTINICIAL) AND (H.HIS_DATA <= :pDTFINAL) and (P.for_codigo = '+QuotedStr(InttoStr(W_CDFORN)) +')';
                          //
                          If (edtDTINIC.Text = '  /  /    ')
                            and (edtDTFINA.Text = '  /  /    ')
                            and not uFuncoes.empty(cmbFabricante.Text)  Then
                               Linha := Linha + ' And (P.for_codigo = '+QuotedStr(InttoStr(W_CDFORN)) +')';
                          //
                Linha := Linha + 'Group By P.PRO_CODIGO, P.PRO_DESCRICAO, F.for_fantasia, P.uni_codigo ';
                CommandText := Linha;
                //
                If (edtDTINIC.Text <> '  /  /    ')
                  and (edtDTFINA.Text <> '  /  /    ')
                  and uFuncoes.empty(cmbFabricante.Text)  Then
                Begin
                     Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                     Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
                End;
                //
                If (edtDTINIC.Text <> '  /  /    ')
                  and (edtDTFINA.Text <> '  /  /    ')
                  and not uFuncoes.empty(cmbFabricante.Text)  Then
                Begin
                     Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
                     Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
                End;
                //
                Active := True;
           End;
           //
           //cdsTotalVendido.FetchParams;
           cdsTotalVendido.Open;
           //
           With ppReport1 DO
           begin
                If (edtDTINIC.Text <> '  /  /    ')
                   and (edtDTFINA.Text <> '  /  /    ') Then
                    txtPeriodo.Caption := 'PERÍODO : '+edtDTINIC.Text +' A '+edtDTFINA.Text;

                If not uFuncoes.Empty(cmbFabricante.Text) Then
                  txtFabricante.Caption := 'FABRICANTE : '+cmbFabricante.Text;
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

procedure TfrmRelTotalVendido.edtDTINICExit(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC.Text);
            edtDTINIC.date := StrToDate(edtDTINIC.Text);
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

procedure TfrmRelTotalVendido.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            edtDTFINA.date := StrToDate(edtDTFINA.Text);
            //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
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

end.
