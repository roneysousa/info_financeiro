unit uRelTotVendidoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, ppBands, ppCache,
  ppClass, ppComm, ppRelatv, ppProd, ppReport, ppDB, ppDBPipe, ppCtrls,
  ppPrnabl, DBXpress, ppVar, DB, FMTBcd, SqlExpr, DBClient, Provider;

type
  TfrmRelTotalProdutos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label1: TLabel;
    cmbNMLOJA: TComboBox;
    edtDTINIC: TDateEdit;
    edtDTFINI: TDateEdit;
    Label2: TLabel;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    lbl_NMRELA: TppLabel;
    lblCaixa: TppLabel;
    lbl_DATA: TppLabel;
    ppDBParametros: TppDBPipeline;
    ppLine5: TppLine;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    dsTotalProdutos: TDataSource;
    ppDBPTotalProduto: TppDBPipeline;
    ppLabel3: TppLabel;
    lbl_loja: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppDBText4: TppDBText;
    ppLabel11: TppLabel;
    Label3: TLabel;
    dstLojas: TSQLDataSet;
    dspLojas: TDataSetProvider;
    cdsLojas: TClientDataSet;
    cdsLojasEMP_CODIGO: TIntegerField;
    cdsLojasEMP_FANTASIA: TStringField;
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINIExit(Sender: TObject);
  private
    procedure LOJAS;
    function CDLOJA(M_NMLOJA : String) : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTotalProdutos: TfrmRelTotalProdutos;
  TD : TTransactionDesc;

implementation

uses udmConsulta, Udm, UFrmAdmin, uFuncoes, uDmRelatorios;

{$R *.dfm}

procedure TfrmRelTotalProdutos.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmRelTotalProdutos.LOJAS;
begin
     {With cdsLojas do
     Begin
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS');
          SQL.Add('order by EMP_FANTASIA');
          Open;
          //First;
     End;}
     Dm.RefreshCDS(cdsLojas);
     //
     cmbNMLOJA.Clear;
     cdsLojas.First;
     While not (cdsLojas.Eof) do
     Begin
          cmbNMLOJA.Items.Add(cdsLojas.FieldByName('EMP_FANTASIA').AsString);
          //
          cdsLojas.Next;
     End;
end;

procedure TfrmRelTotalProdutos.FormShow(Sender: TObject);
begin
    LOJAS;
    edtDTINIC.Date := Date();
    edtDTFINI.Date := Date();
end;

function TfrmRelTotalProdutos.CDLOJA(M_NMLOJA: String): integer;
Var
   qryLoja : TSQLQuery;
begin
     qryLoja := TSQLQuery.Create(nil);
     //
     With qryLoja do
      try
          SQLConnection := Dm.SqlAdmin;
          SQL.Clear;
          Close;
          Sql.Add('Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS');
          Sql.Add('Where (EMP_FANTASIA = :pNOME)');
          Params.ParamByName('pNOME').AsString := cmbNMLOJA.Text;
          Open;
          //
          If not (IsEmpty) Then
            result := FieldByname('EMP_CODIGO').AsInteger;
      Finally
           Free;
      End;
end;

procedure TfrmRelTotalProdutos.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
           Application.MessageBox('Selecione a loja!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbNMLOJA.SetFocus;
           Exit;
     End;
     //
     If (edtDTINIC.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite a período inicial!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC.SetFocus;
           Exit;
     End;
     //
     If (edtDTFINI.Text = '  /  /    ') Then
     Begin
           Application.MessageBox('Digite a período final!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTFINI.SetFocus;
           Exit;
     End;
     //
     If (edtDTINIC.Date > edtDTFINI.Date) Then
     Begin
           Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINIC.SetFocus;
           Exit;
     End;
     //
     Try
          // Inicia um transação no BD
           TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
           TD.IsolationLevel := xilREADCOMMITTED;
           Dm.SqlAdmin.StartTransaction(TD);
           //
           With dmRelatorios.cdsTotalProdutos do
           Begin
                Close;
                Params.ParamByName('pLOJA').AsInteger := CDLOJA(cmbNMLOJA.Text);
                Params.ParamByName('pDTINIC').AsDate  := edtDTINIC.Date;
                Params.ParamByName('pDTFINA').AsDate  := edtDTFINI.Date;
                Open;
           End;
           //
           With ppReport1 do
           Begin
               lbl_NMRELA.Caption := 'TOTAL DE PRODUTOS VENDIDOS';
               lbl_loja.Caption   := cmbNMLOJA.Text; 
               lblCaixa.Caption   := uFrmAdmin.M_NMUSUA;
               lbl_DATA.Caption   := edtDTINIC.Text + ' à '+edtDTFINI.Text; 
               PrintReport;
           End;
           // Grava
           Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
     Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar gerar relatório!!!'+#13
                        + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //  Cancelar transação no BD.
                Dm.SqlAdmin.Rollback(TD);
          End;
     End;
end;

procedure TfrmRelTotalProdutos.edtDTINICExit(Sender: TObject);
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

procedure TfrmRelTotalProdutos.edtDTFINIExit(Sender: TObject);
begin
     If (edtDTFINI.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINI.Text);
            //
            If (edtDTINIC.Date > edtDTFINI.Date) Then
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
             edtDTFINI.Date := Date();
             edtDTFINI.SetFocus;
             Exit;
          End;
        end;
     End;
end;

end.
