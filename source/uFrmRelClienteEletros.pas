unit uFrmRelClienteEletros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmRelatorio, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr,
  DBClient, Provider, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppVar;

type
  TfrmRelClienteEletros = class(TfrmRelatorio)
    dstRelatorio: TSQLDataSet;
    dspRelatorio: TDataSetProvider;
    cdsRelatorio: TClientDataSet;
    dsRelatorio: TDataSource;
    RadioGroup1: TRadioGroup;
    cdsRelatorioCLI_CODIGO: TIntegerField;
    cdsRelatorioCLI_TIPOPESSOA: TStringField;
    cdsRelatorioCLI_CGC: TStringField;
    cdsRelatorioCLI_RAZAO: TStringField;
    cdsRelatorioCLI_FANTASIA: TStringField;
    cdsRelatorioCLI_NRBOX: TStringField;
    cdsRelatorioELE_DESCRICAO: TStringField;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage2: TppDBImage;
    ppLabel28: TppLabel;
    ppLine4: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine8: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppLabel16: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    cdsRelatorioCNPJCPF: TStringField;
    lblOrdem: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    procedure btImprimirClick(Sender: TObject);
    procedure cdsRelatorioCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClienteEletros: TfrmRelClienteEletros;

implementation

uses Udm, uFuncoes;

{$R *.dfm}

procedure TfrmRelClienteEletros.btImprimirClick(Sender: TObject);
Var
   aSQLTexto : String;
begin
  inherited;
      btImprimir.Enabled := False;
      try
           aSQLTexto := 'Select CL.CLI_CODIGO, CL.cli_tipopessoa, CL.cli_cgc, CL.CLI_RAZAO, CL.cli_fantasia, CL.CLI_NRBOX, E.ele_descricao from CLIENTES CL '+
                        'Inner join CLIENTE_ELETRO CE on ce.cle_cliente = cli_codigo '+
                        'Inner join eletros E on e.ele_codigo = CE.cle_eletro ';
           //
           Case (RadioGroup1.ItemIndex) of
               0 : aSQLTexto := aSQLTexto + 'Order by CL.CLI_CODIGO ';
               1 : aSQLTexto := aSQLTexto + 'Order by CL.CLI_RAZAO ';
           End;
           //
           aSQLTexto := aSQLTexto + ', E.ele_descricao ';
           //
           With cdsRelatorio do
            begin
                 Close;
                 CommandText := aSQLTexto;
                 Open;
                 //
                 If not (isEmpty) Then
                 begin
                      Case (RadioGroup1.ItemIndex) of
                        0 : lblOrdem.Caption := 'ORDEM : CÓDIGO';
                        1 : lblOrdem.Caption := 'ORDEM : NOME';
                      End;

                      ppReport1.PrintReport;
                 End;
            End;
      Finally
          btImprimir.Enabled := true;
      End;
end;

procedure TfrmRelClienteEletros.cdsRelatorioCalcFields(DataSet: TDataSet);
begin
  inherited;
      If (cdsRelatorio.State in [dsInternalCalc]) and
        NOT uFuncoes.Empty(cdsRelatorioCLI_TIPOPESSOA.AsString) Then
         if  (cdsRelatorioCLI_TIPOPESSOA.AsString = 'F') Then
             cdsRelatorioCNPJCPF.AsString :=  uFuncoes.FormataCPF(cdsRelatorioCLI_CGC.AsString)
         Else
             cdsRelatorioCNPJCPF.AsString :=  uFuncoes.FormataCNPJ(cdsRelatorioCLI_CGC.AsString);

end;

end.
