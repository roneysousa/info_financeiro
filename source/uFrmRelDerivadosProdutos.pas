unit uFrmRelDerivadosProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, FMTBcd, DB, SqlExpr,
  DBClient, Provider, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppVar, ppStrtch, ppMemo;

type
  TfrmRelDerivadosProdutos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cmbNMLOJA: TComboBox;
    edtDTINIC: TDateEdit;
    Panel2: TPanel;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    edtCDPROD: TEdit;
    Label4: TLabel;
    dstHisProdutos: TSQLDataSet;
    dspHisProdutos: TDataSetProvider;
    cdsHisProdutos: TClientDataSet;
    dsHisProdutos: TDataSource;
    ppReport1: TppReport;
    ppDBPipHisProdutos: TppDBPipeline;
    cdsHisProdutosHIS_PRODUTO: TStringField;
    cdsHisProdutosPRO_VLVENDA: TFMTBCDField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppLabel9: TppLabel;
    ppLabel3: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsHisProdutosPRO_DESCRICAO: TStringField;
    ppLabel5: TppLabel;
    txtLoja: TppLabel;
    txtProduto: TppLabel;
    txtEntrada: TppLabel;
    qryQuantEntra: TSQLQuery;
    qryQuantEntraEST_QUANTENTRADA: TFMTBCDField;
    ppLabel6: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel7: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine5: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine2: TppLine;
    dstHisProdutosHIS_PRODUTO: TStringField;
    dstHisProdutosHIS_VLVENDA: TFMTBCDField;
    dstHisProdutosPRO_VLVENDA: TFMTBCDField;
    cdsHisProdutosHIS_VLVENDA: TFMTBCDField;
    qryQuantEntraEST_QUANTIDADE: TFMTBCDField;
    lbl_nmprod: TLabel;
    dstHisProdutosMOVIMENTO: TFMTBCDField;
    cdsHisProdutosMOVIMENTO: TFMTBCDField;
    spLocProduto: TSpeedButton;
    ppLabel10: TppLabel;
    txtEstoqueAtual: TppLabel;
    ppMmoPerdas: TppMemo;
    dstHisPerda: TSQLDataSet;
    dspHisPerdas: TDataSetProvider;
    cdsHisPerdas: TClientDataSet;
    dstPerda: TSQLDataSet;
    dspPerda: TDataSetProvider;
    cdsPerda: TClientDataSet;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsHisPerdasHPD_NMPERDA: TStringField;
    cdsHisPerdasHPD_PRODUTO: TStringField;
    cdsHisPerdasHPD_IDPERDA: TIntegerField;
    cdsHisPerdasQUANTIDADE: TFMTBCDField;
    ppLabel11: TppLabel;
    ppMmoQuant: TppMemo;
    qryEstoqueAnterior: TSQLQuery;
    qryEstoqueAnteriorHIS_PRODUTO: TStringField;
    qryEstoqueAnteriorHIS_ANTERIOR: TFMTBCDField;
    qryEstoqueAnteriorHIS_MOVIMENTO: TFMTBCDField;
    qryEstoqueAnteriorHIS_DATA: TDateField;
    qryEstoqueAnteriorHIS_ATUAL: TFMTBCDField;
    ppLabel12: TppLabel;
    txtAnterior: TppLabel;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    cdsHisProdutosSUB_TOTAL: TCurrencyField;
    ppDBCalc3: TppDBCalc;
    ppLine4: TppLine;
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure BtGravarClick(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure spLocProdutoClick(Sender: TObject);
    procedure cdsHisProdutosCalcFields(DataSet: TDataSet);
    procedure cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTINICKeyPress(Sender: TObject; var Key: Char);
  private
    procedure LOJAS;
    Function ENTRADA(W_CDPROD : String ; W_DTENTR : TDate ) : real;
    Function ESTOQUE_ATUAL(W_CDPROD : String ; W_DTENTR : TDate ) : real;
    Function NOME_PRODUTO(CODIGO : String) : String;
    Function ESTOQUE_ANTERIOR(W_CDPROD : String; W_CDLOJA : Integer ;W_DTENTR : TDate) : real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelDerivadosProdutos: TfrmRelDerivadosProdutos;
  M_CDPROD, M_NMPROD : String;
  M_QTENTR,M_QTATUA : dOUBLE;

implementation

uses uFuncoes, udmConsulta, Udm, uFrmBuscaProdutos;

{$R *.dfm}

procedure TfrmRelDerivadosProdutos.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelDerivadosProdutos.LOJAS;
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

procedure TfrmRelDerivadosProdutos.FormShow(Sender: TObject);
begin
    lbl_nmprod.Caption := '';
    LOJAS;
    edtDTINIC.Date := Date();
end;

procedure TfrmRelDerivadosProdutos.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
         key:=#0;
         spLocProdutoClick(Sender);
     End;
     //
     If (key = #13) and not uFuncoes.Empty(edtCDPROD.Text) Then
      begin
           key := #0;
           edtDTINIC.SetFocus;
      End;
end;

procedure TfrmRelDerivadosProdutos.BtGravarClick(Sender: TObject);
Var
    M_TOTALPERDAS : Real;
begin
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
           Application.MessageBox('Selecione a loja!!!','ATEN��O',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbNMLOJA.SetFocus;
           Exit;
     End;
     //
     If uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
           Application.MessageBox('Digite o c�digo do produto!!!','ATEN��O',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtCDPROD.SetFocus;
           Exit;
     End;
     //
     If (edtDTINIC.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite a per�odo inicial!!!','ATEN��O',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC.SetFocus;
           Exit;
     End;
     //
     Try
          BtGravar.Enabled := False;
          //
          With cdsHisProdutos do
            begin
                 Close;
                 Params.ParamByName('pCODIGOBAIXA').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
                 Params.ParamByName('pLOJA').AsInteger       := uFuncoes.CDLOJA(cmbNMLOJA.Text);
                 Params.ParamByName('pDTMOVIMENTO').AsDate   := edtDTINIC.Date;
                 Params.ParamByName('pTIPO').AsString        := 'V';
                 Params.ParamByName('pDTENTRADA').AsDate     := edtDTINIC.Date;
                 Open;
            End;
          //
          With cdsHisPerdas do
           Begin
                Close;
                Params.ParamByName('pPRODUTO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
                Params.ParamByName('pDATA').AsDate      := edtDTINIC.Date;
                Open;
                First;
           End;
          //
          M_QTENTR :=  ENTRADA(uFuncoes.StrZero(edtCDPROD.Text,13),edtDTINIC.Date);
          M_QTATUA :=  ESTOQUE_ATUAL(uFuncoes.StrZero(edtCDPROD.Text,13),edtDTINIC.Date);
          M_NMPROD :=  NOME_PRODUTO(uFuncoes.StrZero(edtCDPROD.Text,13));
          M_TOTALPERDAS := 0;
          With ppReport1 do
          Begin
               ppMmoPerdas.Lines.Clear;
               ppMmoQuant.Lines.Clear;
               //
               While not (cdsHisPerdas.Eof) do
                 begin
                       ppMmoPerdas.Lines.Add(Copy(cdsHisPerdas.FieldByName('HPD_NMPERDA').AsString,1,20));
                       ppMmoQuant.Lines.Add(FormatFloat('###,##0.#00',cdsHisPerdas.FieldByName('QUANTIDADE').AsFloat));
                       M_TOTALPERDAS := M_TOTALPERDAS + cdsHisPerdas.FieldByName('QUANTIDADE').AsFloat;
                       //
                       cdsHisPerdas.next;
                 End;
                 //
                 ppMmoQuant.Lines.Add(uFuncoes.Replicate('-',10));
                 ppMmoPerdas.Lines.Add(uFuncoes.Replicate('-',40));
                 ppMmoPerdas.Lines.Add('TOTAL :');
                 ppMmoQuant.Lines.Add(FormatFloat('###,##0.#00',M_TOTALPERDAS));
               //
               txtAnterior.Caption := FormatFloat('###,##0.#00',ESTOQUE_ANTERIOR(uFuncoes.StrZero(edtCDPROD.Text,13),
                                       uFuncoes.CDLOJA(cmbNMLOJA.Text), edtDTINIC.Date));
               txtLoja.Caption     := cmbNMLOJA.Text;
               txtProduto.Caption  := M_NMPROD;
               txtEntrada.Caption  := FormatFloat('###,##0.#00',M_QTENTR);
               txtEstoqueAtual.Caption := FormatFloat('###,##0.#00',M_QTATUA);
               PrintReport;
          End;
          //
          BtGravar.Enabled := True;
     Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar gerar relat�rio!!!'+#13
                        + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                Close;
          End;
     End;
end;

procedure TfrmRelDerivadosProdutos.edtCDPRODExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDPROD.Text) then
     BEGIN
          If uFuncoes.PRODUTO_ESTOQUE(uFuncoes.StrZero(edtCDPROD.Text,13)
             , uFuncoes.CDLOJA(cmbNMLOJA.Text) ) Then
          Begin
                lbl_nmprod.Caption := NOME_PRODUTO(uFuncoes.StrZero(edtCDPROD.Text,13));
                edtCDPROD.Text := uFuncoes.StrZero(edtCDPROD.Text,13);
          End
          Else
          Begin
               Application.MessageBox(PChar('N�o h� produto no estoque!!!'),
                 'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               //lbl_NMPROD.Caption := '';
               edtCDPROD.Clear;
               edtCDPROD.SetFocus;
               Exit;
          End;
     End;
end;

function TfrmRelDerivadosProdutos.ENTRADA(W_CDPROD: String;
  W_DTENTR: TDate): real;
begin
     With qryQuantEntra do
     Begin
          Close;
          Params.ParamByName('pLoja').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
          Params.ParamByName('pCODIGO').AsString  := uFuncoes.StrZero(edtCDPROD.Text,13);
          Params.ParamByName('pDTENTRADA').AsDate := edtDTINIC.Date;
          Open;
     End;
     //
     result := qryQuantEntraEST_QUANTENTRADA.AsCurrency;
end;

function TfrmRelDerivadosProdutos.ESTOQUE_ATUAL(W_CDPROD: String;
  W_DTENTR: TDate): real;
begin
     With qryQuantEntra do
     Begin
          Close;
          Params.ParamByName('pLoja').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
          Params.ParamByName('pCODIGO').AsString  := uFuncoes.StrZero(edtCDPROD.Text,13);
          Params.ParamByName('pDTENTRADA').AsDate := edtDTINIC.Date;
          Open;
     End;
     //
     result := qryQuantEntraEST_QUANTIDADE.AsCurrency;
end;

function TfrmRelDerivadosProdutos.NOME_PRODUTO(CODIGO: String): String;
begin
     With dmConsultas.qryProdutos do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select PRO_CODIGO, PRO_DESCRICAO, UNI_CODIGO, UNI_ARMAZENAMENTO,');
          SQL.Add('PRO_VLVENDA from PRODUTOS Where (PRO_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsString := CODIGO;
          Open;
     end;
     //
     result := dmConsultas.qryProdutos.FieldByName('PRO_DESCRICAO').AsString;
end;

procedure TfrmRelDerivadosProdutos.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
       lbl_nmprod.Caption := '';
end;

procedure TfrmRelDerivadosProdutos.spLocProdutoClick(Sender: TObject);
begin
  with TfrmBuscaProduto.create(self) do
  try
     uFrmBuscaProdutos.M_NRFROM := 7;
     showmodal;
  finally
    If not uFuncoes.Empty(M_CDPROD) Then
    Begin
         edtCDPROD.Text := M_CDPROD;
         edtDTINIC.SetFocus;
    End
    Else
         edtCDPROD.SetFocus;
    free;
  end;
end;

function TfrmRelDerivadosProdutos.ESTOQUE_ANTERIOR(W_CDPROD: String;
  W_CDLOJA : Integer ; W_DTENTR: TDate): real;
begin
     With qryEstoqueAnterior do
      begin
           Close;
           Params.ParamByName('pPRODUTO').AsString := W_CDPROD;
           Params.ParamByName('pLOJA').AsInteger   := W_CDLOJA;
           Params.ParamByName('pTIPO').AsString    := 'E';
           Params.ParamByName('pDATA').AsDate      := W_DTENTR;
           Open;
      End;
      //
      result := qryEstoqueAnterior.FieldByName('HIS_ANTERIOR').AsFloat; 
end;

procedure TfrmRelDerivadosProdutos.cdsHisProdutosCalcFields(
  DataSet: TDataSet);
begin
     cdsHisProdutosSUB_TOTAL.AsCurrency :=
        cdsHisProdutosHIS_VLVENDA.AsCurrency *
        cdsHisProdutosMOVIMENTO.AsFloat; 
end;

procedure TfrmRelDerivadosProdutos.cmbNMLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text) Then
      begin
           key := #0;
           edtCDPROD.SetFocus;
      End;
end;

procedure TfrmRelDerivadosProdutos.edtDTINICKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtDTINIC.Text <> '  /  /    ') Then
      begin
           key := #0;
           BtGravar.SetFocus;
      End;
end;

end.
