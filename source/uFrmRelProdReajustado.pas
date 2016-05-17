unit uFrmRelProdReajustado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPeriodo, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls,
  FMTBcd, DBClient, Provider, DB, SqlExpr, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppVar, ppCtrls, ppPrnabl, ppBands,
  ppCache;

type
  TfrmRelProdutosReajustados = class(TfrmRelPeriodo)
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_BARRAS: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosPRO_VLCOMPRA: TFMTBCDField;
    cdsProdutosPRO_VLVENDA: TFMTBCDField;
    cdsProdutosPRO_DTALTERACAO: TDateField;
    cdsProdutosPRO_LUCROBRUTO: TFMTBCDField;
    cdsProdutosPRO_LUCROLIQUIDO: TFMTBCDField;
    cdsProdutosPRO_HOREAJUTE: TStringField;
    cdsProdutosPRO_VALOR_ANTERIOR: TFMTBCDField;
    ppReport1: TppReport;
    ppDBProdutos: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLabel8: TppLabel;
    ppLabel3: TppLabel;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    txtPeriodo: TppLabel;
    ppLabel2: TppLabel;
    txtUsuario: TppLabel;
    dsProdutos: TDataSource;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel11: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    procedure BtImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutosReajustados: TfrmRelProdutosReajustados;

implementation

uses Udm, uFuncoes, UFrmAdmin;

{$R *.dfm}

procedure TfrmRelProdutosReajustados.BtImprimirClick(Sender: TObject);
begin
  inherited;
     If (edtDTINIC.Text = '  /  /    ' ) Then
     Begin
          Application.MessageBox('Digite o periodo inicial!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTINIC.SetFocus;
          Exit;
     End;
     //
     If (edtDTFINA.Text = '  /  /    ' ) Then
     Begin
          Application.MessageBox('Digite o periodo final!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTFINA.SetFocus;
          Exit;
     End;
     //
     try
        With cdsProdutos do
          begin
               Close;
               Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
               Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
               Open;
               //
               If not(IsEmpty) then
                begin
                     With ppReport1 do
                      begin
                           txtPeriodo.Caption := edtDTINIC.text + ' À '+ edtDTFINA.Text;
                           txtUsuario.Caption := UFrmAdmin.M_NMUSUA;
                           //
                           PrintReport; 
                      End;
                End
                Else
                begin
                    Application.MessageBox('Não há produtos reajustados no período.','ATENÇÃO',
                        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                    //
                    Close;
                End;
          End;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Error ao tentar gerar relatorio!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               BtImprimir.Enabled := True;
        End;
     End;
end;

end.
