unit uFrmReajuste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBXpress,
  FMTBcd, DB, SqlExpr, DBClient, Provider, BmsXPProgressBar;

type
  TfrmReajuste = class(TForm)
    pnlProgressao: TPanel;
    pnlInferior: TPanel;
    btConfirma: TBitBtn;
    BtSair: TBitBtn;
    pnlTopo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCDPROD: TEdit;
    cmbSecao: TComboBox;
    edtBARRAS: TEdit;
    edtPERC: TCurrencyEdit;
    cmbSubSecao: TComboBox;
    cmbFabricante: TComboBox;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dstProdutosPRO_CODIGO: TStringField;
    dstProdutosPRO_BARRAS: TStringField;
    dstProdutosPRO_VLCOMPRA: TFMTBCDField;
    dstProdutosPRO_VLVENDA: TFMTBCDField;
    dstProdutosPRO_LUCROBRUTO: TFMTBCDField;
    dstProdutosPRO_LUCROLIQUIDO: TFMTBCDField;
    dstProdutosPRO_DTALTERACAO: TDateField;
    dstProdutosPRO_HOREAJUTE: TStringField;
    dstProdutosPRO_USUARIO_REAJUSTE: TIntegerField;
    dstProdutosPRO_VALOR_ANTERIOR: TFMTBCDField;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_BARRAS: TStringField;
    cdsProdutosPRO_VLCOMPRA: TFMTBCDField;
    cdsProdutosPRO_VLVENDA: TFMTBCDField;
    cdsProdutosPRO_LUCROBRUTO: TFMTBCDField;
    cdsProdutosPRO_LUCROLIQUIDO: TFMTBCDField;
    cdsProdutosPRO_DTALTERACAO: TDateField;
    cdsProdutosPRO_HOREAJUTE: TStringField;
    cdsProdutosPRO_USUARIO_REAJUSTE: TIntegerField;
    cdsProdutosPRO_VALOR_ANTERIOR: TFMTBCDField;
    dstProdutosSEC_CODIGO: TIntegerField;
    dstProdutosSUB_CODIGO: TIntegerField;
    dstProdutosFOR_CODIGO: TIntegerField;
    cdsProdutosSEC_CODIGO: TIntegerField;
    cdsProdutosSUB_CODIGO: TIntegerField;
    cdsProdutosFOR_CODIGO: TIntegerField;
    dstProdutosPRO_TAXAS: TFMTBCDField;
    dstProdutosPRO_IPI: TFMTBCDField;
    dstProdutosPRO_FRETE: TFMTBCDField;
    dstProdutosTRI_CODIGO: TIntegerField;
    dstProdutosPRO_REDUCAOICMS: TFMTBCDField;
    cdsProdutosPRO_TAXAS: TFMTBCDField;
    cdsProdutosPRO_IPI: TFMTBCDField;
    cdsProdutosPRO_FRETE: TFMTBCDField;
    cdsProdutosTRI_CODIGO: TIntegerField;
    cdsProdutosPRO_REDUCAOICMS: TFMTBCDField;
    lbl_QTREGI: TLabel;
    BmsXPProgressBar1: TBmsXPProgressBar;
    lblPercentual: TLabel;
    Label23: TLabel;
    procedure BtSairClick(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtBARRASExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbSecaoExit(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
    procedure edtPERCExit(Sender: TObject);
    procedure edtPERCChange(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure cmbFabricanteChange(Sender: TObject);
    procedure cmbSecaoChange(Sender: TObject);
    procedure cmbSubSecaoChange(Sender: TObject);
    procedure edtBARRASChange(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtBARRASKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;    
    procedure SECOES;
    procedure SUBSECAO;
    procedure FABRICANTE;
    procedure HABILITAR_BOTAO;
    //
    function CALCULA_LUCROLIQUIDO(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQU : Real;
       W_CDTRIB : Integer) : Real;
    function CALCULA_LUCROBRUTO(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQUIDO : Real;
       W_CDTRIB : Integer) : Real;
    function VALOR_VENDA(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQU : Real;
       W_CDTRIB : Integer) : Real;
  public
    { Public declarations }
  end;

var
  frmReajuste: TfrmReajuste;

implementation

uses uFuncoes, udmConsulta,UFrmAdmin, Udm;

{$R *.dfm}

procedure TfrmReajuste.BtSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmReajuste.edtCDPRODExit(Sender: TObject);
begin
     If not uFuncoes.Empty (edtCDPROD.Text ) Then
        edtCDPROD.Text := uFuncoes.StrZero(edtCDPROD.Text,13);
end;

procedure TfrmReajuste.edtBARRASExit(Sender: TObject);
begin
     If not uFuncoes.Empty (edtBARRAS.Text ) Then
        edtBARRAS.Text := uFuncoes.StrZero(edtBARRAS.Text,13);
end;

procedure TfrmReajuste.SECOES;
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
     cmbSecao.Clear;
     cmbSecao.Items.Add('');
     While not (dmConsultas.cdsSecoes.Eof) do
     Begin
          cmbSecao.Items.Add( dmConsultas.cdsSecoes.FieldByName('SEC_DESCRICAO').AsString);
          //
          dmConsultas.cdsSecoes.Next;
     End;
end;

procedure TfrmReajuste.SUBSECAO;
begin
     dmConsultas.cdsSubSecao.Close;
     With dmConsultas.dstSubSecao do
     Begin
          Active := False;
          CommandText := 'Select * from SUBSECAO Where (SEC_CODIGO = :pSECAO) order by SUB_DESCRICAO';
          //
          Params.ParamByName('pSECAO').AsInteger := uFuncoes.CDSECAO(cmbSecao.Text);
          Active := True;
     End;
     dmConsultas.cdsSubSecao.Open;
     //
     dmConsultas.cdsSubSecao.First;
     //
     cmbSUBSECAO.Clear;
     cmbSUBSECAO.Items.Add('');
     While not (dmConsultas.cdsSubSecao.Eof) do
     Begin
          cmbSUBSECAO.Items.Add(dmConsultas.cdsSubSecao.FieldByName('SUB_DESCRICAO').AsString);
          //
          dmConsultas.cdsSubSecao.Next;
     End;
end;

procedure TfrmReajuste.FormShow(Sender: TObject);
begin
    SECOES;
    FABRICANTE;
    //
    btConfirma.Enabled := False;
    //
    edtCDPROD.SetFocus;
end;

procedure TfrmReajuste.FABRICANTE;
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
     cmbFabricante.Items.Add('');
     While not (dmConsultas.cdsFornecedor.Eof) do
     Begin
          cmbFabricante.Items.Add(dmConsultas.cdsFornecedor.FieldByName('FOR_FANTASIA').AsString);
          //
          dmConsultas.cdsFornecedor.Next;
     End;
end;

procedure TfrmReajuste.cmbSecaoExit(Sender: TObject);
begin
      If not uFuncoes.Empty(cmbSecao.Text) Then
      begin
            SUBSECAO;
            cmbSubSecao.Enabled := True;
            cmbSubSecao.SetFocus; 
      End
      Else
          cmbSubSecao.Enabled := False;
end;

procedure TfrmReajuste.btConfirmaClick(Sender: TObject);
Var
    TD : TTransactionDesc;
    LINHA, M_HOMOVI : String;
    Cont, Total : Integer;
    M_VLANTE , VALOR : Double;
    M_DTMOVI : TDate;
begin
     If (edtPERC.Value <= 0) Then
      begin
           Application.MessageBox('Digite o percentual de reajuste!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtPERC.SetFocus;
           Exit;
      End;
  Try
     //
     Screen.Cursor := crHourGlass;
     pnlProgressao.Visible  := True;
     BmsXPProgressBar1.Visible := True;
     lblPercentual.Visible     := True;
     lbl_QTREGI.Visible     := True;
     // Inicia um transação no BD
     {TD.TransactionID  := StrtoInt(uFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);}
     Dm.Start;
     //
     M_DTMOVI := Date();
     M_HOMOVI := Copy(TimetoStr(Time),1,5);
     M_VLANTE := 0;
     //
     try
         LINHA := 'Select PRO_CODIGO, PRO_BARRAS, PRO_VLCOMPRA, PRO_VLVENDA, PRO_LUCROBRUTO, PRO_LUCROLIQUIDO, PRO_DTALTERACAO, PRO_HOREAJUTE, ' +
                  'PRO_USUARIO_REAJUSTE, PRO_VALOR_ANTERIOR, SEC_CODIGO, SUB_CODIGO, FOR_CODIGO, PRO_TAXAS, PRO_IPI, PRO_FRETE, TRI_CODIGO, PRO_REDUCAOICMS from PRODUTOS ';
         //
         cdsProdutos.Close;
         With dstProdutos do
          begin
               Active := False;
               // Codigo produto
               If not uFuncoes.Empty(edtCDPROD.Text)
                  and uFuncoes.Empty(cmbFabricante.Text)
                  and uFuncoes.Empty(cmbSecao.Text)
                  and uFuncoes.Empty(cmbSubSecao.Text)
                  and uFuncoes.Empty(edtBARRAS.Text) Then
                Begin
                     CommandText := LINHA + ' Where (PRO_CODIGO = :pCODIGO)';
                     Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
                End;
               // Codigo Barras
               If     uFuncoes.Empty(edtCDPROD.Text)
                  and uFuncoes.Empty(cmbFabricante.Text)
                  and uFuncoes.Empty(cmbSecao.Text)
                  and uFuncoes.Empty(cmbSubSecao.Text)
                  and not uFuncoes.Empty(edtBARRAS.Text) Then
                Begin
                     CommandText := LINHA + ' Where (PRO_BARRAS = :pCODIGO)';
                     Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtBARRAS.Text,13);
                End;
               // Codigo Fornecedor
               If     uFuncoes.Empty(edtCDPROD.Text)
                  and not uFuncoes.Empty(cmbFabricante.Text)
                  and uFuncoes.Empty(cmbSecao.Text)
                  and uFuncoes.Empty(cmbSubSecao.Text)
                  and uFuncoes.Empty(edtBARRAS.Text) Then
                Begin
                     CommandText := LINHA + ' Where (FOR_CODIGO = :pCODIGO)';
                     Params.ParamByName('pCODIGO').AsInteger := uFuncoes.CDFABRICANTE(cmbFabricante.Text);
                End;
               // Codigo Seção
               If     uFuncoes.Empty(edtCDPROD.Text)
                  and uFuncoes.Empty(cmbFabricante.Text)
                  and not uFuncoes.Empty(cmbSecao.Text)
                  and uFuncoes.Empty(cmbSubSecao.Text)
                  and uFuncoes.Empty(edtBARRAS.Text) Then
                Begin
                     CommandText := LINHA + ' Where (SEC_CODIGO = :pCODIGO)';
                     Params.ParamByName('pCODIGO').AsInteger := uFuncoes.CDSECAO(cmbSecao.Text);
                End;
               // Codigo Seção e Sub-Seção
               If     uFuncoes.Empty(edtCDPROD.Text)
                  and uFuncoes.Empty(cmbFabricante.Text)
                  and not uFuncoes.Empty(cmbSecao.Text)
                  and uFuncoes.Empty(cmbSubSecao.Text)
                  and uFuncoes.Empty(edtBARRAS.Text) Then
                Begin
                     CommandText := LINHA + ' Where (SEC_CODIGO = :pCODIGO) and (SUB_CODIGO = :pSUBCODIGO) ';
                     Params.ParamByName('pCODIGO').AsInteger    := uFuncoes.CDSECAO(cmbSecao.Text);
                     Params.ParamByName('pSUBCODIGO').AsInteger := uFuncoes.CDSUBSECAO(uFuncoes.CDSECAO(cmbSecao.Text), cmbSubSecao.Text);
                End;
               // Codigo produto e Fornecedor
               If not uFuncoes.Empty(edtCDPROD.Text)
                  and not uFuncoes.Empty(cmbFabricante.Text)
                  and uFuncoes.Empty(cmbSecao.Text)
                  and uFuncoes.Empty(cmbSubSecao.Text)
                  and uFuncoes.Empty(edtBARRAS.Text) Then
                Begin
                     CommandText := LINHA + ' Where (PRO_CODIGO = :pCODIGO) and (FOR_CODIGO = :pCDFORN) ';
                     Params.ParamByName('pCODIGO').AsString  := uFuncoes.StrZero(edtCDPROD.Text,13);
                     Params.ParamByName('pCDFORN').AsInteger := uFuncoes.CDFABRICANTE(cmbFabricante.Text);
                End;
               //
               Active := True;
          End;
         cdsProdutos.FetchParams;
         cdsProdutos.Open;
         //
         If not (cdsProdutos.IsEmpty) Then
          begin
              Total := cdsProdutos.RecordCount;
              BmsXPProgressBar1.Position := 0;
              Cont  := 0;
              //
              With cdsProdutos do
              begin
                   DisableControls;
                   First;
                   While not (Eof) do
                     begin
                          Edit;
                          VALOR := 0;
                          M_VLANTE := FieldByName('PRO_VLVENDA').AsFloat;
                          // Lucro Bruto
                          FieldByName('PRO_LUCROBRUTO').AsCurrency :=
                               CALCULA_LUCROBRUTO(cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency,
                               FieldByName('PRO_IPI').AsCurrency,
                               FieldByName('PRO_FRETE').AsCurrency,
                               FieldByName('PRO_REDUCAOICMS').AsCurrency,
                               FieldByName('PRO_TAXAS').AsCurrency,
                               FieldByName('PRO_LUCROBRUTO').AsCurrency,
                               FieldByName('PRO_LUCROLIQUIDO').AsCurrency,
                               FieldByName('TRI_CODIGO').AsInteger);
                          // Lucro Liquido
                          FieldByName('PRO_LUCROLIQUIDO').AsCurrency :=
                              VALOR_VENDA(cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency,
                              FieldByName('PRO_IPI').AsCurrency,
                              FieldByName('PRO_FRETE').AsCurrency,
                              FieldByName('PRO_REDUCAOICMS').AsCurrency,
                              FieldByName('PRO_TAXAS').AsCurrency,
                              FieldByName('PRO_LUCROBRUTO').AsCurrency,
                              FieldByName('PRO_LUCROLIQUIDO').AsCurrency,
                              FieldByName('TRI_CODIGO').AsInteger);
                          // Valor de venda
                          FieldByName('PRO_VLVENDA').AsFloat     :=
                               M_VLANTE + uFuncoes.Gerapercentual(M_VLANTE,edtPERC.Value);
                          //
                          FieldByName('PRO_VALOR_ANTERIOR').AsCurrency := M_VLANTE;
                          FieldByName('PRO_DTALTERACAO').AsDateTime    := M_DTMOVI;
                          FieldByName('PRO_HOREAJUTE').AsString        := M_HOMOVI;
                          FieldByName('PRO_USUARIO_REAJUSTE').AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
                          //
                          Cont := Cont + 1;
                          BmsXPProgressBar1.Position := (Cont * 100) div Total;
                          lblPercentual.Caption := InttoStr(BmsXPProgressBar1.Position)+'%';
                          //
                          Application.ProcessMessages;
                          //
                          M_VLANTE := 0;
                          Next;
                   End;  // Fim-enquanto
                ApplyUpdates(0);
              EnableControls;
              End;  // Fim-with
              //
              Application.MessageBox(PChar('Reajuste realizado com sucesso.'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          End;  // Fim-se
          //
          //Dm.SqlAdmin.Commit(TD);
          Dm.Comit(dm.Transc);
          //
          Close;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar realizar reajuste!!!'
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              //Dm.SqlAdmin.Rollback(TD);
              Dm.Rollback;
              //
              Close;
        End;
     End;
  Finally
      Screen.Cursor := crDefault;
      BmsXPProgressBar1.Visible := False;
      lblPercentual.Visible     := False;
      lbl_QTREGI.Visible        := False;
      pnlProgressao.Visible     := False;
  end;
     Application.ProcessMessages;
end;

procedure TfrmReajuste.edtPERCExit(Sender: TObject);
begin
{     If (edtPERC.Value > 0) Then
        btConfirma.Enabled := True
     Else
        btConfirma.Enabled := False;}
end;

function TfrmReajuste.CALCULA_LUCROBRUTO(W_VLCOMP, W_PERIPI, W_PEFRET,
  W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQUIDO: Real;
  W_CDTRIB: Integer): Real;
Var
      M_VLIPFT, M_VLICME, M_VLTAXA, M_PEICMV, M_VLVEND, M_VLCUST : Real;
      M_PECOMI, M_PERPIS, M_PECOFI, M_PEIPMF : Real;
      M_VLFORM, W_VLFORM, M_VLIMPO, M_LULIQU : Real;
Begin
        //***  Valores calculados sobre o valor de compra
        M_VLIPFT := W_VLCOMP*(W_PERIPI+W_PEFRET)/100;   // && Valor do ipi + valor de frete
        M_VLICME := W_VLCOMP*(W_ICMSCO)/100;            //&& ICMS de compra
        M_VLTAXA := W_VLCOMP*(W_PETAXA)/100;
        //
        M_PECOMI := dm.CdsConfigCFG_PECOMI.AsFloat;
        M_PERPIS := dm.CdsConfigCFG_PERPIS.AsFloat;
        M_PECOFI := dm.CdsConfigCFG_PECOFI.AsFloat;
        M_PEIPMF := dm.CdsConfigCFG_PEIPMF.AsFloat;
        //
        M_PEICMV := 0;
        //
        IF (W_CDTRIB <> 0) Then
        Begin
             With dmConsultas.qryTributacao do
             begin
                  Close;
                  Params.ParamByName('pCODIGO').AsInteger := W_CDTRIB;
                  Open;
             End;
             //
             If not (dmConsultas.qryTributacao.IsEmpty ) Then
                 M_PEICMV := dmConsultas.qryTributacao.FieldByName('TRI_ICMS').AsCurrency;
        End;
        //***  Valores somados ao valor de compra
        M_VLFORM := W_VLCOMP + M_VLIPFT - M_VLICME + M_VLTAXA;
        IF (W_LUBRUTO <> 0) Then
        Begin
           //M_VLVEND := M_VLFORM*(1+(W_LUBRUTO/100));
           cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency := M_VLFORM*(1+(W_LUBRUTO/100));
           // Valor dos percentuais cobrados sobre valor de venda
           //M_VLIMPO := M_VLVEND*((M_PEICMV+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
           M_VLIMPO := cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency*
               ((M_PEICMV+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
           W_VLFORM := M_VLFORM + M_VLIMPO;
           //M_LULIQU := (M_VLVEND - W_VLFORM)/M_VLVEND * 100;
           M_LULIQU := (cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency - W_VLFORM)/
            cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency * 100;
        End;
        //
        M_VLVEND := M_VLFORM/(1-(M_PEICMV+W_LULIQUIDO+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
        //
        cdsProdutos.FieldByName('PRO_LUCROLIQUIDO').AsCurrency := M_LULIQU;
end;

function TfrmReajuste.CALCULA_LUCROLIQUIDO(W_VLCOMP, W_PERIPI, W_PEFRET,
  W_ICMSCO, W_PETAXA, W_LUBRUTO, W_LULIQU: Real; W_CDTRIB: Integer): Real;
Var
      M_VLIPFT, M_VLICME, M_VLTAXA, M_PEICMV, M_VLVEND, M_VLCUST : Real;
      M_PECOMI, M_PERPIS, M_PECOFI, M_PEIPMF : Real;
      M_LUBRUT, M_LULIQU : Real;
Begin
        //***  Valores calculados sobre o valor de compra
        M_VLIPFT := W_VLCOMP*(W_PERIPI+W_PEFRET)/100;    // && Valor do ipi + valor de frete
        M_VLICME := W_VLCOMP*(W_ICMSCO)/100;              //&& ICMS de compra
        M_VLTAXA := W_VLCOMP*(W_PETAXA)/100;              //&& Valor do desconto
        //
        M_PECOMI := dm.CdsConfigCFG_PECOMI.AsFloat;
        M_PERPIS := dm.CdsConfigCFG_PERPIS.AsFloat;
        M_PECOFI := dm.CdsConfigCFG_PECOFI.AsFloat;
        M_PEIPMF := dm.CdsConfigCFG_PEIPMF.AsFloat;
        //
        M_PEICMV := 0;
        //
        IF (W_CDTRIB <> 0) Then
        Begin
             With dmConsultas.qryTributacao do
             begin
                  Close;
                  Params.ParamByName('pCODIGO').AsInteger := W_CDTRIB;
                  Open;
             End;
             //
             If not (dmConsultas.qryTributacao.IsEmpty ) Then
                 M_PEICMV := dmConsultas.qryTributacao.FieldByName('TRI_ICMS').AsCurrency;
        End;
        //
        // ***  Valores somados ao valor de compra
        M_VLCUST := W_VLCOMP + M_VLIPFT - M_VLICME + M_VLTAXA;
        //
        M_VLVEND := 0;
        M_LUBRUT := 0;
        If (W_VLCOMP > 0) then
           Begin
             M_VLVEND := M_VLCUST/(1-(M_PEICMV+W_LULIQU+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
             M_LUBRUT := Arredondar((M_VLVEND - M_VLCUST) / M_VLCUST * 100,2);
           End;
        //
        result   := M_VLVEND;
        cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency := M_LUBRUT;
end;

function TfrmReajuste.VALOR_VENDA(W_VLCOMP, W_PERIPI, W_PEFRET, W_ICMSCO,
  W_PETAXA, W_LUBRUTO, W_LULIQU: Real; W_CDTRIB: Integer): Real;
Var
      M_VLIPFT, M_VLICME, M_VLTAXA, M_PEICMV, M_VLVEND, M_VLCUST : Real;
      M_PECOMI, M_PERPIS, M_PECOFI, M_PEIPMF : Real;
      M_VLIMPO, W_VLCUST, M_VLBRUT : Real;
Begin
        //***  Valores calculados sobre o valor de compra
        M_VLIPFT := W_VLCOMP*(W_PERIPI+W_PEFRET)/100;   // && Valor do ipi + valor de frete
        M_VLICME := W_VLCOMP*(W_ICMSCO)/100;            //&& ICMS de compra
        M_VLTAXA := W_VLCOMP*(W_PETAXA)/100;            //&& Valor do desconto
        M_VLVEND := cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
        //
        M_PECOMI := dm.CdsConfigCFG_PECOMI.AsFloat;
        M_PERPIS := dm.CdsConfigCFG_PERPIS.AsFloat;
        M_PECOFI := dm.CdsConfigCFG_PECOFI.AsFloat;
        M_PEIPMF := dm.CdsConfigCFG_PEIPMF.AsFloat;
        //
        M_PEICMV := 0;
        //
        IF (W_CDTRIB <> 0) Then
        Begin
             With dmConsultas.qryTributacao do
             begin
                  Close;
                  Params.ParamByName('pCODIGO').AsInteger := W_CDTRIB;
                  Open;
             End;
             //
             If not (dmConsultas.qryTributacao.IsEmpty ) Then
                 M_PEICMV := dmConsultas.qryTributacao.FieldByName('TRI_ICMS').AsCurrency;
        End;
        //***  Valores somados ao valor de compra
        M_VLCUST := W_VLCOMP + M_VLIPFT - M_VLICME + M_VLTAXA;
        //
        M_VLBRUT := Arredondar((M_VLVEND - M_VLCUST) / M_VLCUST * 100,2);
        // Valor dos percentuais cobrados sobre valor de venda
        M_VLIMPO := M_VLVEND *((M_PEICMV+M_PECOMI+M_PERPIS+M_PECOFI+M_PEIPMF)/100);
        W_VLCUST := M_VLCUST + M_VLIMPO;
        // Valor liquido
        result  := (M_VLVEND - W_VLCUST)/M_VLVEND * 100;
        // Valor bruto
        cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency := M_VLBRUT;
end;

procedure TfrmReajuste.edtPERCChange(Sender: TObject);
begin
     HABILITAR_BOTAO;
     //
     If uFuncoes.Empty(edtPERC.Text) Then
        btConfirma.Enabled := False; 
end;

procedure TfrmReajuste.HABILITAR_BOTAO;
begin
     If not uFuncoes.Empty(edtPERC.Text) and (edtPERC.Value > 0) Then
        If  not uFuncoes.Empty(edtCDPROD.Text)
            or not uFuncoes.Empty(cmbFabricante.Text)
            or not uFuncoes.Empty(cmbSecao.Text)
            or not uFuncoes.Empty(cmbSubSecao.Text)
            or not uFuncoes.Empty(edtBARRAS.Text)  Then
              btConfirma.Enabled := True
        Else
              btConfirma.Enabled := False;
end;

procedure TfrmReajuste.edtCDPRODChange(Sender: TObject);
begin
     HABILITAR_BOTAO;
end;

procedure TfrmReajuste.cmbFabricanteChange(Sender: TObject);
begin
     HABILITAR_BOTAO;
end;

procedure TfrmReajuste.cmbSecaoChange(Sender: TObject);
begin
     HABILITAR_BOTAO;
end;

procedure TfrmReajuste.cmbSubSecaoChange(Sender: TObject);
begin
     HABILITAR_BOTAO;
end;

procedure TfrmReajuste.edtBARRASChange(Sender: TObject);
begin
     HABILITAR_BOTAO;
end;

procedure TfrmReajuste.edtCDPRODKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmReajuste.edtBARRASKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmReajuste.FormCreate(Sender: TObject);
begin
   If not (UFrmAdmin.admin) Then
   begin
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Reajuste'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     btConfirma.Visible := (novo = 'S');
     //BtEditar.Visible    := (alterar = 'S');
     //BtExcluir.Visible   := (apagar = 'S');
  End;
end;

end.
