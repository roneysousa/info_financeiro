unit uFrmFecharEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBXpress,
  DB, DBClient, FMTBcd, SqlExpr;

type
  TfrmFecharEntrada = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label8: TLabel;
    edtVLMERC: TCurrencyEdit;
    Label9: TLabel;
    edtBASEICMS: TCurrencyEdit;
    Label10: TLabel;
    Label11: TLabel;
    edtBASESUBS: TCurrencyEdit;
    Label12: TLabel;
    edtVLSUBST: TCurrencyEdit;
    Label13: TLabel;
    cmbTPFRETE: TComboBox;
    Label14: TLabel;
    edtVLFRETE: TCurrencyEdit;
    Label15: TLabel;
    edtVLIPI: TCurrencyEdit;
    Label16: TLabel;
    edtVLSEGURO: TCurrencyEdit;
    Label17: TLabel;
    edtDespesas: TCurrencyEdit;
    Label18: TLabel;
    edtDesconto: TCurrencyEdit;
    Label19: TLabel;
    edtVLNOTA: TCurrencyEdit;
    cdsEntrada: TClientDataSet;
    cdsEntradaENT_NUMERO: TIntegerField;
    cdsEntradaENT_LOJA: TIntegerField;
    cdsEntradaLOJ_NMLOJA: TStringField;
    cdsEntradaFOR_CODIGO: TIntegerField;
    cdsEntradaFOR_NOME: TStringField;
    cdsEntradaENT_DTPEDIDO: TDateField;
    cdsEntradaENT_DTEMISSAO: TDateField;
    cdsEntradaENT_DTRECEBIMENTO: TDateField;
    cdsEntradaENT_NRNOTA: TIntegerField;
    cdsEntradaENT_SERIENOTA: TStringField;
    cdsEntradaENT_VALORMERCADORIA: TCurrencyField;
    edtVLICMS: TCurrencyEdit;
    qryProdutos: TSQLQuery;
    cdsEntradaENT_TRANSPORTADORA: TIntegerField;
    Label20: TLabel;
    edtCDTRANSP: TEdit;
    Panel3: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    cdsEntradaENT_NMTRANSP: TStringField;
    spTransportadora: TSpeedButton;
    Label5: TLabel;
    Label4: TLabel;
    dbeDTPEDI: TMaskEdit;
    dbeDTEMISS: TMaskEdit;
    lbl_Transportadora: TEdit;
    procedure BtGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure spTransportadoraClick(Sender: TObject);
    procedure edtCDTRANSPExit(Sender: TObject);
    procedure edtCDTRANSPKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDTRANSPChange(Sender: TObject);
    procedure edtVLMERCExit(Sender: TObject);
    procedure edtVLSUBSTExit(Sender: TObject);
    procedure edtVLIPIExit(Sender: TObject);
    procedure edtVLSEGUROExit(Sender: TObject);
    procedure edtDespesasExit(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtVLNOTAExit(Sender: TObject);
  private
     function VALOR_NOTA() : Real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFecharEntrada: TfrmFecharEntrada;
  M_FLCANC, M_CDFORN : String;
  W_TOMERC, W_TOTIPI, W_TOICMS : Real;
  W_VALIPI, W_VLICMS : Real;

implementation

uses Udm, UFrmAdmin, uFrmCadEntradaMercadoria, uFuncoes, uDm2, uFrmLocFornec,
  udmConsulta;

{$R *.dfm}

procedure TfrmFecharEntrada.BtGravarClick(Sender: TObject);
Var
   M_NRPEDI, M_NRENTR, M_CDLOJA, M_SEQPAG, W_NRSEQU : Integer;
   M_QTANTE, M_QTATUA : Double;
   M_CDPROD, M_HOMOVI : String;
   M_VLNOTA, M_VLCOMP, M_VLCUST, M_VLVENDPRO : Real;
   M_VALIPI, M_VLICMS : Real;
   M_DTMOVI : TDate;
begin
//     ShowMessage('Modulo ainda não concluido!!!');
     If uFuncoes.Empty(cmbTPFRETE.Text) Then
     Begin
          Application.MessageBox(PChar('Selecione o tipo de frete!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbTPFRETE.SetFocus;
          Exit;
     End;
        //
        Transacao.TransactionID := StrtoInt(UFrmAdmin.M_CDUSUA);
        Transacao.IsolationLevel := xilREPEATABLEREAD;
        dm.SqlAdmin.StartTransaction(Transacao);
     //
     Try
        //
        dm.parametros;
        dm.CdsConfig.Edit;
        dm.CdsConfigCFG_ENTRADA.Value       := dm.CdsConfigCFG_ENTRADA.Value+1;
        dm.CdsConfigCFG_SEQUENCIA.AsInteger := dm.CdsConfigCFG_SEQUENCIA.AsInteger + 1;
        dm.CdsConfigCFG_SEQPAGAR.AsInteger  := dm.CdsConfigCFG_SEQPAGAR.AsInteger + 1;
        M_NRENTR := dm.CdsConfigCFG_ENTRADA.AsInteger;
        M_SEQPAG := dm.CdsConfigCFG_SEQPAGAR.AsInteger;
        W_NRSEQU := dm.CdsConfigCFG_SEQUENCIA.AsInteger;
        M_CDLOJA := cdsEntrada.FieldByName('ENT_LOJA').AsInteger;
        dm.CdsConfig.Post;
        dm.CdsConfig.ApplyUpdates(0);
        //
        M_DTMOVI := Date();
        M_HOMOVI := TimetoStr(Time);
        M_VALIPI := edtVLIPI.Value;
        M_VLICMS := edtVLICMS.Value;
        // Estoque
        DM2.cdsProdutos.DisableControls;
        DM2.cdsProdutos.First;
        //
        While not (DM2.cdsProdutos.Eof) do
        Begin
              M_CDPROD := uFuncoes.StrZero(DM2.cdsProdutos.FieldByName('PRO_CODIGO').AsString,13);
              // Tabela ProdutoEntradas
              With DM2.cdsProdutoEntrada do
              Begin
                   Active  := False;
                   Params.ParamByName('pNUMERO').AsInteger := M_NRENTR;
                   Params.ParamByName('pCODIGO').AsString  := M_CDPROD;
                   Active  := True;
                   //
                   If (IsEmpty) Then
                   Begin
                        Append;
                        FieldByName('ENP_NUMERO').AsInteger    := M_NRENTR;
                        FieldByName('PRO_CODIGO').AsString     := uFuncoes.StrZero(DM2.cdsProdutos.FieldByName('PRO_CODIGO').AsString,13);
                        FieldByName('UNI_UNIDADE').AsString    := DM2.cdsProdutos.FieldByName('UNI_DESCRICAO').AsString;
                        FieldByName('ENP_QUANTIDADE').AsFloat  := DM2.cdsProdutos.FieldByName('ENP_QUANTIDADE').AsFloat;
                        FieldByName('ENP_VALOR').AsCurrency    := DM2.cdsProdutos.FieldByName('ENP_VALOR').AsCurrency;
                        FieldByName('ENP_IPI').AsCurrency      := DM2.cdsProdutos.FieldByName('ENP_IPI').AsCurrency;
                        FieldByName('ENP_ICMS').AsCurrency     := DM2.cdsProdutos.FieldByName('ENP_ICMS').AsCurrency;
                        Post;
                        ApplyUpdates(0);
                   End;
              End;
              //  Tabela de estoque
              Dm.cdsEstoque.Close;
              With Dm.dstEstoque do
              Begin
                     Active := False;
                     CommandText := 'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and (PRO_CODIGO = :pCODIGO)';
                     //
                     Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
                     Params.ParamByName('pCODIGO').AsString      := M_CDPROD;
                     Active := True;
              End;
              Dm.cdsEstoque.Open;
              // Tabela de Estoque
              M_QTANTE := 0;
              If (Dm.cdsEstoque.IsEmpty) Then  // Se não encontrar
                begin
                     Dm.cdsEstoque.Append;
                     Dm.cdsEstoque.FieldByName('EST_CODIGOLOJA').AsInteger := M_CDLOJA;
                     Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString      := uFuncoes.StrZero(M_CDPROD,13);
                     Dm.cdsEstoque.FieldByName('UNI_CODIGO').AsString      := DM2.cdsProdutos.FieldByName('UNI_DESCRICAO').AsString;
                     Dm.cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTMOVI;
                     Dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := DM2.cdsProdutos.FieldByName('ENP_QUANTIDADE').AsFloat;
                     Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                             Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat + DM2.cdsProdutos.FieldByName('ENP_QUANTIDADE').AsFloat;
                     M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                     Dm.cdsEstoque.Post;
                     Dm.cdsEstoque.ApplyUpdates(0);
                End
                Else
                Begin
                     Dm.cdsEstoque.Edit;
                     //
                     M_QTANTE := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                     //
                     Dm.cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTMOVI;
                     Dm.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := DM2.cdsProdutos.FieldByName('ENP_QUANTIDADE').AsFloat;
                     Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                             Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat + DM2.cdsProdutos.FieldByName('ENP_QUANTIDADE').AsFloat;
                     M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                     Dm.cdsEstoque.Post;
                     Dm.cdsEstoque.ApplyUpdates(0);
                End;
                // Tabela de historico
                Dm.cdsHistorico.Close;
                With Dm.dstHistorico do
                Begin
                     Active := False;
                     CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                                   +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                     Params.ParamByName('pSEQUENCIA').AsInteger := W_NRSEQU;
                     Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                     Params.ParamByName('pPRODUTO').AsString    := M_CDPROD;
                     Active := True;
                End;
                Dm.cdsHistorico.Open;
                //  aqui
                With dmConsultas.cdsConsulta2 do
                Begin
                     Active := False;
                     CommandText := 'Select PRO_CODIGO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_VLVENDA from PRODUTOS Where (PRO_CODIGO = :pCODIGO)';
                     Params.ParamByName('pCODIGO').AsString := M_CDPROD;
                     Active := True;
                End;
                //
                If not (dmConsultas.cdsConsulta2.IsEmpty) Then
                Begin
                   With dmConsultas do
                   begin
                     M_VLCOMP     := cdsConsulta2.FieldByName('PRO_VLCOMPRA').AsCurrency;
                     M_VLCUST     := cdsConsulta2.FieldByName('PRO_VLCUSTO').AsCurrency;
                     M_VLVENDPRO  := cdsConsulta2.FieldByName('PRO_VLVENDA').AsCurrency;
                  End;
                End;
                //
                With Dm.cdsHistorico do
                Begin
                      Append;
                      FieldByName('HIS_SEQUENCIA').AsInteger := W_NRSEQU;
                      FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
                      FieldByName('HIS_PRODUTO').AsString    := M_CDPROD;
                      FieldByName('HIS_UNIDADE').AsString    := DM2.cdsProdutos.FieldByName('UNI_DESCRICAO').AsString;
                      FieldByName('HIS_DATA').AsDateTime     := M_DTMOVI;
                      FieldByName('HIS_HORA').AsString       := M_HOMOVI;
                      FieldByName('HIS_TIPO').AsString       := 'E';
                      FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                      FieldByName('HIS_MOVIMENTO').AsFloat   := DM2.cdsProdutos.FieldByName('ENP_QUANTIDADE').AsFloat;
                      FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST;
                      FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP;
                      FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
                      FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                      FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(uFrmAdmin.M_CDUSUA);
                      Post;
                      ApplyUpdates(0);
                End;
              // Lote
              If not uFuncoes.Empty(DM2.cdsProdutos.FieldByName('PRO_NRLOTE').AsString) Then
              begin
                dm2.cdsLotes.Close;
                With dm2.dstLotes do
                begin
                   Active := False;
                   CommandText := 'Select * from LOTES Where (LOT_NRLOTE = :pLOTE) and (LOT_PROCODIGO = :pCODIGO)';
                   Params.ParamByName('pLOTE').AsString   := DM2.cdsProdutos.FieldByName('PRO_NRLOTE').AsString;
                   Params.ParamByName('pCODIGO').AsString := M_CDPROD;
                   Active := True;
                End;
                dm2.cdsLotes.Open;
                //
                If (dm2.cdsLotes.IsEmpty) Then
                begin
                   // Incluir
                   With dm2.cdsLotes do
                   Begin
                        Append;
                        FieldByName('LOT_PROCODIGO').AsString  := M_CDPROD;
                        FieldByName('LOT_NRLOTE').AsString     := DM2.cdsProdutos.FieldByName('PRO_NRLOTE').AsString;
                        FieldByName('LOT_QUANTIDADE').AsFloat  := DM2.cdsProdutos.FieldByName('ENP_QUANTIDADE').AsFloat;
                        If (DM2.cdsProdutos.FieldByName('PRO_NRLOTE').AsString <> 'GERAL') Then
                            FieldByName('LOT_DTVENCIMENTO').AsDateTime := DM2.cdsProdutos.FieldByName('PRO_DTVENCIMENTO').AsDateTime;
                        //
                        Post;
                        ApplyUpdates(0);
                   End;
                End
                Else
                Begin
                   // Editar
                   With dm2.cdsLotes do
                   Begin
                        Edit;
                        FieldByName('LOT_QUANTIDADE').AsFloat  := FieldByName('LOT_QUANTIDADE').AsFloat
                                               + DM2.cdsProdutos.FieldByName('ENP_QUANTIDADE').AsFloat;
                        //FieldByName('LOT_DTVENCIMENTO').AsDateTime := DM2.cdsProdutos.FieldByName('PRO_DTVENCIMENTO').AsDateTime;
                        //
                        Post;
                        ApplyUpdates(0);
                   End;
                End;
              End;
              // Proximo
              DM2.cdsProdutos.Next;
        End;
        DM2.cdsProdutos.EnableControls;
        //
        With dm2.cdsEntradas do
        Begin
             Active := False;
             Params.ParamByName('pLOJA').AsInteger    := M_CDLOJA;
             Params.ParamByName('pNUMERO').AsInteger  := M_NRENTR;
             Active := True;
             //
             If (IsEmpty) Then
             Begin
                  Append;
                  FieldByName('ENT_NUMERO').AsInteger  := M_NRENTR;
                  FieldByName('ENT_LOJA').AsInteger    := M_CDLOJA;
                  FieldByName('ENT_DATAPEDIDO').AsDateTime  := cdsEntrada.FieldByName('ENT_DTPEDIDO').AsDateTime;
                  FieldByName('ENT_DATAENTRADA').AsDateTime := cdsEntrada.FieldByName('ENT_DTRECEBIMENTO').AsDateTime;
                  //FieldByName('ENT_NATUREZAOPERACAO').AsInteger  :=
                  FieldByName('ENT_DATAEMISSAONOTA').AsDateTime  := cdsEntrada.FieldByName('ENT_DTEMISSAO').AsDateTime;
                  FieldByName('ENT_FORNECEDOR').AsInteger   := cdsEntrada.FieldByName('FOR_CODIGO').AsInteger;
                  If not uFuncoes.Empty(edtCDTRANSP.Text) Then
                     FieldByName('ENT_TRANSPORTADORA').AsInteger := StrtoInt(edtCDTRANSP.Text);
                  FieldByName('ENT_NUMERONOTA').AsString    := uFuncoes.StrZero(cdsEntrada.FieldByName('ENT_NRNOTA').AsString,10);
                  FieldByName('ENT_SERIENOTA').AsString     := uFuncoes.StrZero(cdsEntrada.FieldByName('ENT_SERIENOTA').AsString,2);
                  FieldByName('ENT_VALORMERCADORIAS').AsCurrency   := edtVLMERC.Value;
                  If (cmbTPFRETE.Text = 'FOB' ) Then
                      FieldByName('ENT_TIPOFRETE').AsString := 'F'
                  Else
                      FieldByName('ENT_TIPOFRETE').AsString := 'C';
                  FieldByName('ENT_VALORFRETE').AsCurrency  := edtVLFRETE.Value;
                  FieldByName('ENT_BASECALCULOICMS').AsCurrency   := edtBASEICMS.Value;
                  FieldByName('ENT_VALORICMS').AsCurrency         := edtVLICMS.Value;
                  FieldByName('ENT_BASECALCULOSUBSTITUICAO').AsCurrency := edtBASESUBS.Value;
                  FieldByName('ENT_VALORSUBSTITUICAO').AsCurrency := edtVLSUBST.Value;
                  FieldByName('ENT_VALORIPI').AsCurrency          := edtVLIPI.Value;
                  FieldByName('ENT_VALORSEGURO').AsCurrency       := edtVLSEGURO.Value;
                  FieldByName('ENT_OUTRASPESPESAS').AsCurrency    := edtDespesas.Value;
                  FieldByName('ENT_VALORDESCONTO').AsCurrency     := edtDesconto.Value;
                  FieldByName('ENT_VALORNOTA').AsCurrency         := edtVLNOTA.Value;
                  FieldByName('ENT_SITUACAO').AsString            := 'A';
                  FieldByName('ENT_USUARIO').AsInteger            := StrtoInt(uFrmAdmin.M_CDUSUA);
                  // Grava
                  Post;
                  ApplyUpdates(0);
             End;
        End;
        //
        dm.SqlAdmin.Commit(Transacao);
        //
        Application.MessageBox(PChar('Entrada de Mercadoria realizada com sucesso!!!'),
                      'CONCLUÍDO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        //
        Close;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.SqlAdmin.Rollback(Transacao);
           //
           Close;
        End;
     End;
end;

procedure TfrmFecharEntrada.FormActivate(Sender: TObject);
begin
     lbl_Transportadora.Clear;
     //
     dbeDTEMISS.Text := cdsEntrada.FieldByName('ENT_DTEMISSAO').AsString;
     dbeDTPEDI.Text  := cdsEntrada.FieldByName('ENT_DTPEDIDO').AsString;
     //dbeDTRECE.Text  := cdsEntrada.FieldByName('ENT_DTRECEBIMENTO').AsString;
     //
     W_TOMERC        := cdsEntrada.FieldByName('ENT_VALORMERCADORIA').AsCurrency;
     edtBASEICMS.Value := W_TOICMS;
     edtVLICMS.Value   := W_VLICMS;
     edtVLIPI.Value    := M_VALIPI;
     edtVLMERC.Value := cdsEntrada.FieldByName('ENT_VALORMERCADORIA').AsCurrency;
     edtVLNOTA.Value := VALOR_NOTA();
     //
     edtCDTRANSP.SetFocus;
end;

procedure TfrmFecharEntrada.BtCancelarClick(Sender: TObject);
begin
     M_FLCANC := 'S';
     Close;
end;

procedure TfrmFecharEntrada.FormCreate(Sender: TObject);
begin
      M_FLCANC := 'N';
end;

procedure TfrmFecharEntrada.FormKeyPress(Sender: TObject; var Key: Char);
begin
{  if Key =#13 then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;}
end;

procedure TfrmFecharEntrada.spTransportadoraClick(Sender: TObject);
begin
  with TfrmBuscaFornec.create(self) do
  try
     uFrmLocFornec.M_NRFROM := 3;
     showmodal;
  finally
    edtCDTRANSP.Text := M_CDFORN;
    edtVLMERC.SetFocus;
    free;
  end;
end;

procedure TfrmFecharEntrada.edtCDTRANSPExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDTRANSP.Text) Then
     Begin
          With dmConsultas.qryFornec do
          Begin
               Close;
               Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDTRANSP.Text);
               Open;
          End;
          //
          If (dmConsultas.qryFornec.IsEmpty) Then
          Begin
              Application.MessageBox(PChar('Transportadora não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_Transportadora.Clear;
              edtCDTRANSP.Clear;
              edtCDTRANSP.SetFocus;
              Exit;
          End
          Else
          Begin
               lbl_Transportadora.Text := dmConsultas.qryFornec.FieldByName('FOR_FANTASIA').AsString;
               edtCDTRANSP.Text := uFuncoes.StrZero(edtCDTRANSP.Text,5);
               edtBASEICMS.SetFocus;
          End;
          //
     End;
end;

procedure TfrmFecharEntrada.edtCDTRANSPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (Key = #13) and uFuncoes.Empty(edtCDTRANSP.Text) Then
    Begin
         key:=#0;
         spTransportadoraClick(Sender);
    End;
    //
    If (Key = #13) and not uFuncoes.Empty(edtCDTRANSP.Text) Then
    Begin
         key:=#0;
         edtVLMERC.SetFocus;
    End;
end;

procedure TfrmFecharEntrada.edtCDTRANSPChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDTRANSP.Text) Then
       lbl_Transportadora.Clear;
end;

function TfrmFecharEntrada.VALOR_NOTA: Real;
begin
     result := (edtVLMERC.Value + edtVLIPI.Value + edtVLSUBST.Value
              + edtVLSEGURO.Value + edtDespesas.Value) - edtDesconto.Value; 
end;

procedure TfrmFecharEntrada.edtVLMERCExit(Sender: TObject);
begin
     edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtVLSUBSTExit(Sender: TObject);
begin
      edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtVLIPIExit(Sender: TObject);
begin
      edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtVLSEGUROExit(Sender: TObject);
begin
     edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtDespesasExit(Sender: TObject);
begin
     edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtDescontoExit(Sender: TObject);
begin
     edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtVLNOTAExit(Sender: TObject);
begin
     edtVLNOTA.Value := VALOR_NOTA();
end;

end.
