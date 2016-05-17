unit uFrmRelVendaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr, DBClient,
  Provider, ppVar, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport;

type
  TfrmRelVendaCaixa = class(TForm)
    pnlDados: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BtSair: TBitBtn;
    btImprimir: TBitBtn;
    edtCDCAIXA: TEdit;
    lbl_NMUSUA: TLabel;
    dstCaixa: TSQLDataSet;
    dspCaixa: TDataSetProvider;
    cdsCaixa: TClientDataSet;
    dsCaixa: TDataSource;
    ppReport1: TppReport;
    ppDBCaixa: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLabel8: TppLabel;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLabel12: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine5: TppLine;
    cdsCaixaSEN_NOME: TStringField;
    cdsCaixaMCA_DTMOVIMENTO: TDateField;
    cdsCaixaMCA_HRMOVIMENTO: TStringField;
    cdsCaixaMOV_NOMECLIENTE: TStringField;
    cdsCaixaMOV_VALOR: TFMTBCDField;
    txtCaixa: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel3: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel5: TppLabel;
    procedure BtSairClick(Sender: TObject);
    procedure edtCDCAIXAKeyPress(Sender: TObject; var Key: Char);
    procedure btImprimirClick(Sender: TObject);
    procedure edtCDCAIXAExit(Sender: TObject);
    procedure edtCDCAIXAChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendaCaixa: TfrmRelVendaCaixa;

implementation

uses Udm, uFuncoes, udmConsulta;

{$R *.dfm}

procedure TfrmRelVendaCaixa.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmRelVendaCaixa.edtCDCAIXAKeyPress(Sender: TObject; var Key: Char);
begin
      If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     If not( key in['0'..'9',#8, #13]) then
        key:=#0;
     //
     {If (key = #13) and uFuncoes.Empty(dbeCAIXA.Text) Then
     Begin
          Key := #0;
          sbLocCaixaClick(Sender);
     End;}
     //
     If (key = #13) and not uFuncoes.Empty(edtCDCAIXA.Text) Then
     Begin
          Key := #0;
          btImprimir.SetFocus;
     End;

end;

procedure TfrmRelVendaCaixa.btImprimirClick(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCAIXA.Text) Then
     Begin
           Application.MessageBox('Digite o codigo de caixa!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtCDCAIXA.SetFocus;
           Exit;
     End;
     //
     Try
          cdsCaixa.Close;
          With dstCaixa do
          Begin
               Active := False;
               Params.ParamByName('pCAIXA').AsInteger := StrtoInt(edtCDCAIXA.Text);
               Active := True;
          End;
          //
          cdsCaixa.Open;
          //
          With ppReport1 do
          Begin
                 txtCaixa.Caption := 'CAIXA : '+ lbl_NMUSUA.Caption;
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

procedure TfrmRelVendaCaixa.edtCDCAIXAExit(Sender: TObject);
begin
     With dmConsultas.qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA from USUARIOS');
          SQL.Add('Where (SEN_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDCAIXA.Text);
          //
          Open;
     End;
     //
     If (dmConsultas.qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de caixa não cadastrado!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMUSUA.Caption := '';
          edtCDCAIXA.SetFocus;
          edtCDCAIXA.Clear;
          Exit;
     End
     Else
     begin
          If (dmConsultas.qryProcurar.FieldByName('SEN_FLCAIXA').AsString = 'N')
          OR uFuncoes.Empty(dmConsultas.qryProcurar.FieldByName('SEN_FLCAIXA').AsString) Then
          Begin
               Application.MessageBox('Usuário não é caixa!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dmConsultas.qryProcurar.Close;
               lbl_NMUSUA.Caption := '';
               edtCDCAIXA.SetFocus;
               edtCDCAIXA.Clear;
               Exit;
          End
          Else
          begin
               lbl_NMUSUA.Caption := dmConsultas.qryProcurar.FieldByName('SEN_NOME').AsString;
               btImprimir.SetFocus;  
          End;
          //
     End;
end;

procedure TfrmRelVendaCaixa.edtCDCAIXAChange(Sender: TObject);
begin
      If uFuncoes.Empty(edtCDCAIXA.Text) Then
          lbl_NMUSUA.Caption := '';
end;

procedure TfrmRelVendaCaixa.FormShow(Sender: TObject);
begin
     lbl_NMUSUA.Caption := '';
end;

end.
