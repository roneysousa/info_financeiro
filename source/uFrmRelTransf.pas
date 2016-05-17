unit uFrmRelTransf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, FMTBcd, DB, SqlExpr,
  DBClient, Provider, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppVar;

type
  TfrmRelTransferencias = class(TForm)
    pnlDados: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cmbDestino: TComboBox;
    cmbNMLOJA: TComboBox;
    Panel2: TPanel;
    BtSair: TBitBtn;
    btImprimir: TBitBtn;
    edtDTINIC: TDateEdit;
    Label3: TLabel;
    edtDTFINA: TDateEdit;
    dstTransferencias: TSQLDataSet;
    dspTransf: TDataSetProvider;
    cdsTransf: TClientDataSet;
    dsTransf: TDataSource;
    ppReport1: TppReport;
    ppDBTransferencia: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppLine3: TppLine;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel12: TppLabel;
    ppLine5: TppLine;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    cdsTransfTRA_DATA: TDateField;
    cdsTransfLOJ_ORIGEM: TStringField;
    cdsTransfLOJ_DESTINO: TStringField;
    cdsTransfHIS_PRODUTO: TStringField;
    cdsTransfPRO_DESCRICAO: TStringField;
    cdsTransfUNI_CODIGO: TStringField;
    cdsTransfHIS_MOVIMENTO: TFMTBCDField;
    cdsTransfHIS_VLCOMPRA: TFMTBCDField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    cdsTransfHIS_SUBTOTAL: TCurrencyField;
    txtPeriodo: TppLabel;
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbNMLOJAExit(Sender: TObject);
    procedure cdsTransfCalcFields(DataSet: TDataSet);
  private
    procedure LOJAS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTransferencias: TfrmRelTransferencias;

implementation

uses udmConsulta, uFuncoes, Udm;

{$R *.dfm}

procedure TfrmRelTransferencias.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelTransferencias.LOJAS;
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
     cmbDestino.Clear;
     //
     cmbNMLOJA.Items.Add('');
     cmbDestino.Items.Add('');
     //
     While not (dmConsultas.qryLoja.Eof) do
     Begin
          cmbNMLOJA.Items.Add(dmConsultas.qryLoja.FieldByName('EMP_FANTASIA').AsString);
          cmbDestino.Items.Add(dmConsultas.qryLoja.FieldByName('EMP_FANTASIA').AsString);
          //
          dmConsultas.qryLoja.Next;
     End;
     //
     cmbNMLOJA.ItemIndex := 0;
     cmbDestino.ItemIndex := 0;
end;

procedure TfrmRelTransferencias.FormShow(Sender: TObject);
begin
     LOJAS;
end;

procedure TfrmRelTransferencias.edtDTINICExit(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC.Text);
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

procedure TfrmRelTransferencias.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer periodo final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTINIC.SetFocus;
                Exit;
            End;
            //
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

procedure TfrmRelTransferencias.btImprimirClick(Sender: TObject);
Var
    Linha : String;
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
     If (edtDTINIC.Date > edtDTFINA.Date) Then
     Begin
          Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTINIC.SetFocus;
          Exit;
     End;
     //
     Try
         cdsTransf.Close;
         //
         With dstTransferencias do
         Begin
               Active := False;
               Linha  := 'Select T.TRA_DATA, '+
                         '(Select L.EMP_FANTASIA from EMPRESAS L Where (L.EMP_CODIGO = T.TRA_LOJAORIGEM)) AS LOJ_ORIGEM, '+
                         '(Select L.EMP_FANTASIA from EMPRESAS L Where (L.EMP_CODIGO = T.TRA_LOJADESTINO)) AS LOJ_DESTINO, '+
                         'H.HIS_PRODUTO, P.PRO_DESCRICAO, P.UNI_CODIGO, H.HIS_MOVIMENTO, '+
                         'H.HIS_VLCOMPRA '+
                         'from HISTORICO H '+
                         'INNER join PRODUTOS P ON P.PRO_CODIGO = H.HIS_PRODUTO '+
                         'INNER join TRANSFERENCIAS T ON T.tra_nrtransferencia = H.HIS_DOCUMENTO '+
                         'Where (H.HIS_TIPO = '+QuotedStr('TS')+') '+
                         'and (H.HIS_DATA >= :pDTINICIAL) AND (H.HIS_DATA <= :pDTFINAL)';
               //
               If not uFuncoes.Empty(cmbNMLOJA.Text) Then
                   Linha := Linha + ' And (T.TRA_LOJAORIGEM = :pCDORIGEM)';
               If not uFuncoes.Empty(cmbDestino.Text) Then
                   Linha := Linha + ' And (T.TRA_LOJADESTINO = :pCDDESTINO)';
               CommandText := Linha;
               //
               Params.ParamByName('pDTINICIAL').AsDate := edtDTINIC.Date;
               Params.ParamByName('pDTFINAL').AsDate   := edtDTFINA.Date;
               If not uFuncoes.Empty(cmbNMLOJA.Text) Then
                  Params.ParamByName('pCDORIGEM').AsInteger := uFuncoes.CDLOJA(cmbNMLOJA.Text);
               If not uFuncoes.Empty(cmbDestino.Text) Then
                  Params.ParamByName('pCDDESTINO').AsInteger := uFuncoes.CDLOJA(cmbDestino.Text);
               //
               Active := True;
         End;
         //
         cdsTransf.Open;
         //
          With ppReport1 do
          Begin
                 txtPeriodo.Caption := 'PERÍODO : '+edtDTINIC.Text +' A '+ edtDTFINA.Text;
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

procedure TfrmRelTransferencias.cmbDestinoExit(Sender: TObject);
begin
    If not uFuncoes.Empty(cmbDestino.Text) Then
      If (cmbDestino.Text = cmbNMLOJA.Text) Then
      Begin
           Application.MessageBox('Loja de destino não pode ser a mesma de origem!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbDestino.ItemIndex := 0;
           cmbDestino.SetFocus;
           Exit;
      End;
end;

procedure TfrmRelTransferencias.cmbNMLOJAExit(Sender: TObject);
begin
    If not uFuncoes.Empty(cmbNMLOJA.Text) Then
      If (cmbNMLOJA.Text = cmbDestino.Text ) Then
      Begin
           Application.MessageBox('Loja de origem não pode ser a mesma de destino!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbNMLOJA.ItemIndex := 0;
           cmbNMLOJA.SetFocus;
           Exit;
      End;
end;

procedure TfrmRelTransferencias.cdsTransfCalcFields(DataSet: TDataSet);
begin
      cdsTransfHIS_SUBTOTAL.AsCurrency :=
        cdsTransfHIS_MOVIMENTO.AsFloat *
        cdsTransfHIS_VLCOMPRA.AsCurrency;
end;

end.
