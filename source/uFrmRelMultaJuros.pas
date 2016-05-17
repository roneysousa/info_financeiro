unit uFrmRelMultaJuros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPeriodo, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls,
  FMTBcd, DB, SqlExpr, DBClient, Provider, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppBands, ppVar, ppCtrls, ppPrnabl,
  ppCache;

type
  TfrmRelMultaJuros = class(TfrmRelPeriodo)
    dstConsulta: TSQLDataSet;
    Label4: TLabel;
    cmbNMLOJA: TComboBox;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    cdsConsultaVALOR: TFMTBCDField;
    cdsConsultaPAGO: TFMTBCDField;
    cdsConsultaTOTAL: TFMTBCDField;
    cdsConsultaDESCONTO: TFMTBCDField;
    cdsConsultaMULTA: TFMTBCDField;
    cdsConsultaJUROS: TFMTBCDField;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage2: TppDBImage;
    ppLabel5: TppLabel;
    txtPeriodo: TppLabel;
    lblSituacao: TppLabel;
    ppLine1: TppLine;
    ppLine6: TppLine;
    ppLabel14: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel15: TppLabel;
    ppLine3: TppLine;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    procedure BtImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelMultaJuros: TfrmRelMultaJuros;

implementation

uses Udm, uFuncoes, udmConsulta;

{$R *.dfm}

procedure TfrmRelMultaJuros.BtImprimirClick(Sender: TObject);
Var
  iLoja : Integer;
begin
  inherited;
      If uFuncoes.Empty(cmbNMLOJA.Text) Then
       begin
            cmbNMLOJA.SetFocus;
            Exit;
       End;
       //
       If (edtDTINIC.Text = '  /  /    ') Then
       begin
            edtDTINIC.SetFocus;
            Exit;
       End;
       //
      If (edtDTFINA.Text = '  /  /    ') Then
       begin
            edtDTFINA.SetFocus;
            Exit;
       End;
       //
       iLoja := uFuncoes.CDLOJA(cmbNMLOJA.Text);
      try
            With cdsConsulta do
              begin
                   Close;
                   Params.ParamByName('pDTINICIO').AsDate := edtDTINIC.Date;
                   Params.ParamByName('pDTFINAL').AsDate  := edtDTFINA.Date;
                   Params.ParamByName('pLOJA').AsInteger  := iLoja;
                   Params.ParamByName('pSITUACAO').AsString := 'P';
                   open;
                   //
                   If not (IsEmpty) Then
                    begin
                         with ppReport1 do
                          begin
                               lblSituacao.Caption := 'CONDOMINIO : '+cmbNMLOJA.Text;
                               txtPeriodo.Caption  := 'PERÍODO : '+edtDTINIC.Text + ' A ' + edtDTFINA.Text;
                               PrintReport;
                          End;
                    End
                    Else
                        ShowMessage('Não há movimento no período indicado.');
              End;
      Except

      End;
end;

procedure TfrmRelMultaJuros.FormShow(Sender: TObject);
begin
  inherited;
      dmConsultas.Lojas(cmbNMLOJA);
      cmbNMLOJA.SetFocus;
end;

end.
