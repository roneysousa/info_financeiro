unit uFrmExcessoSugestao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr, DBClient,
  Provider, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe;

type
  TfrmRelExcessoSugestao = class(TForm)
    pnlDados: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cmbNMSECAO: TComboBox;
    cmbNMLOJA: TComboBox;
    Panel2: TPanel;
    BtSair: TBitBtn;
    btImprimir: TBitBtn;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosPRO_CDPROD: TStringField;
    cdsDadosPRO_NMPROD: TStringField;
    cdsDadosPRO_NMFABR: TStringField;
    cdsDadosPRO_CDUNID: TStringField;
    cdsDadosPRO_ESTOQU: TFloatField;
    cdsDadosPRO_MEDIA: TCurrencyField;
    cdsDadosPRO_EXCESSO: TFloatField;
    cdsDadosPRO_SUGEST: TFloatField;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosFOR_FANTASIA: TStringField;
    cdsProdutosUNI_CODIGO: TStringField;
    cdsProdutosTOTALVENDIDO: TFMTBCDField;
    cdsProdutosMEDIA: TFMTBCDField;
    cdsProdutosEST_QUANTIDADE: TFMTBCDField;
    cdsProdutosEST_CODIGOLOJA: TIntegerField;
    cdsProdutosEXCESSO: TFMTBCDField;
    ppDBProdutos: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel8: TppLabel;
    lbl_NMRELA: TppLabel;
    ppLabel3: TppLabel;
    lbl_loja: TppLabel;
    ppLabel14: TppLabel;
    txtSecao: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    ppLabel12: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine5: TppLine;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    txtExcesso: TppLabel;
    txtCampo: TppDBText;
    procedure FormShow(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    procedure SECOES;
    procedure LOJAS; 
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelExcessoSugestao: TfrmRelExcessoSugestao;
  M_NRFORM : Integer;

implementation

uses udmConsulta, uFuncoes, Udm;

{$R *.dfm}

{ TfrmRelExcessoSugestao }

procedure TfrmRelExcessoSugestao.LOJAS;
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

procedure TfrmRelExcessoSugestao.SECOES;
begin
     dmConsultas.cdsSecoes.Close;
     With dmConsultas.dstSecoes do
     Begin
          Active := False;
          CommandText :=  'Select * from SECAO order by SEC_DESCRICAO';
          Active := True;
     End;
     dmConsultas.cdsSecoes.Open;
     dmConsultas.cdsSecoes.First;
     //
     cmbNMSECAO.Clear;
     While not (dmConsultas.cdsSecoes.Eof) do
     Begin
          If not uFuncoes.Empty(dmConsultas.cdsSecoes.FieldByName('SEC_DESCRICAO').AsString) Then
              cmbNMSECAO.Items.Add(dmConsultas.cdsSecoes.FieldByName('SEC_DESCRICAO').AsString);
          //
          dmConsultas.cdsSecoes.Next;
     End;
end;

procedure TfrmRelExcessoSugestao.FormShow(Sender: TObject);
begin
     LOJAS;
     SECOES;
end;

procedure TfrmRelExcessoSugestao.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelExcessoSugestao.btImprimirClick(Sender: TObject);
Var
   M_DTINIC, M_DTFINA : TDate;
begin
     If uFuncoes.Empty(cmbNMLOJA.Text) Then
     Begin
           Application.MessageBox('Selecione a loja!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbNMLOJA.SetFocus;
           Exit;
     End;
     //
     If uFuncoes.Empty(cmbNMSECAO.Text) Then
     Begin
           Application.MessageBox('Selecione a seção!!!','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbNMSECAO.SetFocus;
           Exit;
     End;
     //
   Try
     Screen.Cursor := crHourGlass;
     //
     btImprimir.Enabled := False;
     //
     Try
          M_DTINIC := IncMonth(Date(),-3);
          M_DTFINA := Date();
          //
          cdsProdutos.Close;
          With dstProdutos do
          Begin
               Active := False;
               Params.ParamByName('pDTINICIAL').AsDate := M_DTINIC;
               Params.ParamByName('pDTFINAL').AsDate   := M_DTFINA;
               Params.ParamByName('pLOJA').AsInteger   := uFuncoes.CDLOJA(cmbNMLOJA.Text);
               Params.ParamByName('pSECAO').AsInteger  := uFuncoes.CDSECAO(cmbNMSECAO.Text);
               Active := True;
          End;
          cdsProdutos.Open;
          //
          If not (cdsProdutos.IsEmpty) Then
          Begin
               If (cdsDados.Active = False) Then
                 cdsDados.Open;
               //
               With cdsDados do
               Begin
                    EmptyDataSet;
                    cdsProdutos.First;
                    //
                    While not (cdsProdutos.Eof) do
                    Begin
                        If (M_NRFORM = 1) Then
                        Begin
                           If (cdsProdutos.FieldByName('MEDIA').AsFloat <
                              cdsProdutos.FieldByName('EST_QUANTIDADE').AsFloat) Then
                           Begin
                               Append;
                               FieldByName('PRO_CDPROD').AsString := cdsProdutos.FieldByName('PRO_CODIGO').AsString;
                               FieldByName('PRO_NMPROD').AsString := cdsProdutos.FieldByName('PRO_DESCRICAO').AsString;
                               FieldByName('PRO_NMFABR').AsString := cdsProdutos.FieldByName('FOR_FANTASIA').AsString;
                               FieldByName('PRO_CDUNID').AsString := cdsProdutos.FieldByName('UNI_CODIGO').AsString;
                               FieldByName('PRO_ESTOQU').AsFloat  := cdsProdutos.FieldByName('EST_QUANTIDADE').AsFloat;
                               FieldByName('PRO_MEDIA').AsFloat   := cdsProdutos.FieldByName('MEDIA').AsFloat;
                               FieldByName('PRO_EXCESSO').AsFloat := cdsProdutos.FieldByName('EXCESSO').AsFloat;
                               Post;
                           End;    // Fim-se MEDIA < QUANTIDADE
                        End;
                        //
                        If (M_NRFORM = 2) Then
                        Begin
                           If (cdsProdutos.FieldByName('MEDIA').AsFloat >
                              cdsProdutos.FieldByName('EST_QUANTIDADE').AsFloat) Then
                           Begin
                               Append;
                               FieldByName('PRO_CDPROD').AsString := cdsProdutos.FieldByName('PRO_CODIGO').AsString;
                               FieldByName('PRO_NMPROD').AsString := cdsProdutos.FieldByName('PRO_DESCRICAO').AsString;
                               FieldByName('PRO_NMFABR').AsString := cdsProdutos.FieldByName('FOR_FANTASIA').AsString;
                               FieldByName('PRO_CDUNID').AsString := cdsProdutos.FieldByName('UNI_CODIGO').AsString;
                               FieldByName('PRO_ESTOQU').AsFloat  := cdsProdutos.FieldByName('EST_QUANTIDADE').AsFloat;
                               FieldByName('PRO_MEDIA').AsFloat   := cdsProdutos.FieldByName('MEDIA').AsFloat;
                               FieldByName('PRO_SUGEST').AsFloat := cdsProdutos.FieldByName('EXCESSO').AsFloat;
                               Post;
                           End;    // Fim-se MEDIA < QUANTIDADE
                        End;
                        //
                        cdsProdutos.Next;
                    End;
               End;
               //
               With ppReport1 do
               begin
                   lbl_NMRELA.Caption := 'SUGESTÃO DE COMPRA';
                   lbl_loja.Caption   := cmbNMLOJA.Text;
                   txtSecao.Caption   := cmbNMSECAO.Text;
                   //
                   If (M_NRFORM = 2) Then
                   Begin
                        txtExcesso.Caption := 'SUGESTÃO';
                        txtCampo.DataField := 'PRO_SUGEST';
                   End;
                   //
                   PrintReport;
               End;  // With
          End
          Else
          Begin
              Application.MessageBox('Não há produtos!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              cdsProdutos.Close;
          End;
     Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar gerar relatório!!!'+#13
                        + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          End;
     End;
  finally
      Screen.Cursor := crDefault;
      btImprimir.Enabled := True;
  end;
     Application.ProcessMessages;
end;

end.
