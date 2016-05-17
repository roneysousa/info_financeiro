unit uFrmTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls, Mask, ToolEdit,
  CurrEdit, Grids, DBGrids, DBXpress, DBClient, FMTBcd, SqlExpr;

type
  TfrmTransferencias = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtAdicionar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Panel3: TPanel;
    pnlDados: TPanel;
    Label1: TLabel;
    cmbOrigem: TDBLookupComboBox;
    dsItens: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    cmbDestino: TDBLookupComboBox;
    Label4: TLabel;
    cmbEntregador: TDBLookupComboBox;
    DBText1: TDBText;
    dbGridDados: TDBGrid;
    Label5: TLabel;
    edtCDPROD: TEdit;
    edtDESCRICAO: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtQuantidade: TCurrencyEdit;
    Label8: TLabel;
    edtCDUNID: TEdit;
    cdsItensTransf: TClientDataSet;
    cdsItensTransfPRT_CODIGO: TStringField;
    cdsItensTransfPRT_DESCRICAO: TStringField;
    cdsItensTransfPRT_UNIDADE: TStringField;
    cdsItensTransfPRT_QUANTIDADE: TFloatField;
    cdsItensTransfPRT_VLCOMPRA: TCurrencyField;
    cdsItensTransfPRT_VLCUSTO: TCurrencyField;
    cdsItensTransfPRT_VLVENDA: TCurrencyField;
    cdsItensTransfPRT_SUBTOTAL: TCurrencyField;
    qryEstoque: TSQLQuery;
    BtExcluir: TBitBtn;
    spLocCliente: TSpeedButton;
    qryProdutos: TSQLQuery;
    procedure BtSairClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure cdsItensTransfCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCDPRODChange(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
  private
    novo, alterar, apagar : String;
    procedure tratabotoes;
    Function LOCALIZAR_PRODUTO(M_CDPROD : String) : boolean;
    procedure busca;
    procedure ADICIONAR;
    procedure LIMPAR;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransferencias: TfrmTransferencias;
  W_CDPROD, M_NMPROD, M_CDUNID: STRING;
  M_VLCOMP, M_VLCUST, M_VLVEND : Real;
  TD : TTransactionDesc;

implementation

uses uDm2, Udm, udmConsulta, uFuncoes, UFrmAdmin, uFrmProcurarProduto;

{$R *.dfm}

procedure TfrmTransferencias.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmTransferencias.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtExcluir.Enabled   := not BtExcluir.Enabled; 
   BtCancelar.Enabled  := not BtCancelar.Enabled;
   BtGravar.Enabled    := not BtGravar.Enabled;
   BtSair.Enabled      := not BtSair.Enabled;
   pnlDados.Enabled    := not pnlDados.Enabled;
end;

procedure TfrmTransferencias.BtAdicionarClick(Sender: TObject);
Var
   W_NRTRAN : INTEGER;
begin
    tratabotoes;
    dm.parametros;
    W_NRTRAN := dm.CdsConfigCFG_TRANSFERENCIA.Value+1;
    //
    dm2.cdsTranferencias.close;
    With dm2.dstTransferencias do
    begin
         Active := False;
         CommandText := 'select * from TRANSFERENCIAS Where (TRA_NRTRANSFERENCIA = :pNRTRANSFERENCIA)';
         Params.ParamByName('pNRTRANSFERENCIA').AsInteger := W_NRTRAN;
         Active := True;
    End;
    dm2.cdsTranferencias.Open;
    //
    cdsItensTransf.EmptyDataSet;
    //
    If (dm2.cdsTranferencias.IsEmpty) Then
    Begin
        dm2.cdsTranferencias.Append;
        dm2.cdsTranferenciasTRA_NRTRANSFERENCIA.Value := W_NRTRAN;
        cmbOrigem.SetFocus;
    End
    Else
    Begin
         tratabotoes;
         Application.MessageBox('Número de transferência já existe!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         Exit;
    End;
end;

procedure TfrmTransferencias.BtCancelarClick(Sender: TObject);
begin
    tratabotoes;
    dm2.cdsTranferencias.Cancel;
    dm2.cdsTranferencias.Close;
    cdsItensTransf.EmptyDataSet;
    //
    LIMPAR;
end;

procedure TfrmTransferencias.cmbDestinoExit(Sender: TObject);
begin
      If (cmbDestino.Text = cmbOrigem.Text) Then
      Begin
           Application.MessageBox('Loja de destino não pode ser a mesma de origem!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbDestino.SetFocus; 
           Exit;
      End;
end;

function TfrmTransferencias.LOCALIZAR_PRODUTO(M_CDPROD: String): boolean;
begin
     With dmConsultas.qryProdutos do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select PRO_CODIGO, PRO_DESCRICAO, UNI_CODIGO, PRO_VLCOMPRA,');
          SQL.Add('PRO_VLCUSTO, PRO_VLVENDA from PRODUTOS Where (PRO_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsString := M_CDPROD;
          Open;
     End;
     //
     If (dmConsultas.qryProdutos.IsEmpty) Then
         result := False
     Else
     Begin
         W_CDPROD := dmConsultas.qryProdutos.fieldByname('PRO_CODIGO').AsString;
         M_NMPROD := dmConsultas.qryProdutos.fieldByname('PRO_DESCRICAO').AsString;
         M_CDUNID := dmConsultas.qryProdutos.fieldByname('UNI_CODIGO').AsString;
         M_VLCOMP := dmConsultas.qryProdutos.fieldByname('PRO_VLCOMPRA').AsCurrency;
         M_VLCUST := dmConsultas.qryProdutos.fieldByname('PRO_VLCUSTO').AsCurrency;
         M_VLVEND := dmConsultas.qryProdutos.fieldByname('PRO_VLVENDA').AsCurrency;
         //
         result := True;
     End;
end;

procedure TfrmTransferencias.busca;
begin
     If (LOCALIZAR_PRODUTO(edtCDPROD.Text) = False) Then
     Begin
          Application.MessageBox('Código de produto não cadastrado!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          //
          edtDESCRICAO.Clear;
          edtCDPROD.Clear;
          edtCDPROD.SetFocus;
          Exit;
     End
     Else
     Begin
          {With qryEstoque do
          Begin
               Close;
               Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
               Open;
          End;
          //
          If (qryEstoque.IsEmpty) Then
          Begin
               Application.MessageBox(PChar('Produto não cadastrado no '+#13+'estoque da loja '+cmbOrigem.Text+'!!!')
               ,'ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               edtCDPROD.Clear;
               edtCDPROD.SetFocus;
               Exit;
          End;}
          //
          edtDESCRICAO.Text := M_NMPROD;
          edtCDUNID.Text    := M_CDUNID;
          //
          edtQuantidade.SetFocus;
     End;
end;

procedure TfrmTransferencias.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     IF (key = #13) and (edtQuantidade.Value > 0) Then
     Begin
          Key := #0;
          //
          edtCDPROD.SetFocus;
          //ADICIONAR;                 
     End;
end;

procedure TfrmTransferencias.ADICIONAR;
begin
     // INCLUIR NOVO REGISTRO
     cdsItensTransf.Append;
     cdsItensTransf.FieldByName('PRT_CODIGO').AsString := W_CDPROD;
     cdsItensTransf.FieldByName('PRT_DESCRICAO').AsString := M_NMPROD;
     cdsItensTransf.FieldByName('PRT_UNIDADE').AsString   := M_CDUNID;
     cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat := edtQuantidade.Value;
     cdsItensTransf.FieldByName('PRT_VLCOMPRA').AsCurrency := M_VLCOMP;
     cdsItensTransf.FieldByName('PRT_VLCUSTO').AsCurrency  := M_VLCUST;
     cdsItensTransf.FieldByName('PRT_VLVENDA').AsCurrency  := M_VLVEND;
     cdsItensTransf.Post;
     //
     edtCDPROD.Clear;
     edtDESCRICAO.Clear;
     edtCDUNID.Clear;
     edtQuantidade.Clear;
     //
     BtGravar.Enabled := True;
     edtCDPROD.SetFocus;
end;

procedure TfrmTransferencias.edtCDPRODExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDPROD.Text) Then
     begin
           If (dmConsultas.GetProduto(edtCDPROD.Text)) Then
            begin
                Application.MessageBox('Este produto é um serviço.','ATENÇÃO',
                   MB_OK+MB_ICONWARNING+MB_APPLMODAL);
                edtCDPROD.Clear;
                edtCDPROD.SetFocus;
                Exit;
            End;
          //
          With qryEstoque do
          Begin
               Close;
               Params.ParamByName('pLOJA').AsInteger  := dm2.cdsTranferencias.FieldByName('TRA_LOJAORIGEM').AsInteger;
               Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(edtCDPROD.Text,13);
               Open;
          End;
          //
          If (qryEstoque.IsEmpty) Then
          Begin
               Application.MessageBox(PChar('Produto não cadastrado no '+#13+'estoque da loja '+cmbOrigem.Text+'!!!')
               ,'ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               edtCDPROD.Clear;
               edtCDPROD.SetFocus;
               Exit;
          End;
          //
          edtCDPROD.Text := uFuncoes.StrZero(edtCDPROD.Text,13);
          busca;
     End
     Else
          edtCDPROD.Clear;
end;

procedure TfrmTransferencias.edtCDPRODKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and NOT uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
          Key := #0;
          edtQuantidade.SetFocus;
     End;
     //
      If (key =#13) and (uFuncoes.Empty(edtCDPROD.Text)) Then
      begin
           key:=#0;
           //
           try
               Application.CreateForm(TfrmLocalizaProduto, frmLocalizaProduto);
               uFrmProcurarProduto.M_NRFORM := 2;
               frmLocalizaProduto.ShowModal;
           Finally
               If not uFuncoes.Empty(uFrmProcurarProduto.M_CDPROD) Then
                   edtCDPROD.Text := uFrmProcurarProduto.M_CDPROD;
               //
               frmLocalizaProduto.Free;
               If not uFuncoes.Empty(edtCDPROD.Text) Then
                   edtQuantidade.SetFocus
               Else
                   edtCDPROD.SetFocus;
           End;
      End;
end;

procedure TfrmTransferencias.edtQuantidadeEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
        edtCDPROD.SetFocus;
end;

procedure TfrmTransferencias.LIMPAR;
begin
     edtCDPROD.Clear;
     edtDESCRICAO.Clear;
     edtCDUNID.Clear;
     edtQuantidade.Clear;
end;

procedure TfrmTransferencias.BtGravarClick(Sender: TObject);
Var
   M_QTANTE, M_QTATUA : Double;
   M_DTMOVI : TDate;
   M_HOMOVI, M_TPMOVI, M_TPMOVI2  :String;
   M_NRTRAN, M_NRSEQU, M_CDLOJA : Integer;
   M_LJORIG, M_LJDEST : Integer;
   M_VLCOMP2, M_VLCUST2, M_VLVENDPRO : Real;
begin
     If uFuncoes.Empty(cmbOrigem.Text) Then
     Begin
          Application.MessageBox(PChar('Selecione a loja de origem!!!')
               ,'ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbOrigem.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbDestino.Text) Then
     Begin
          Application.MessageBox(PChar('Selecione a loja de destino!!!')
               ,'ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbDestino.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbEntregador.Text) Then
     Begin
          Application.MessageBox(PChar('Selecione o entregador!!!')
               ,'ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbEntregador.SetFocus;
          Exit;
     End;
     //
     If (cdsItensTransf.IsEmpty) Then
     Begin
          Application.MessageBox(PChar('Não há produtos a serem '+#13+'transferidos!!!')
               ,'ATENÇÃO',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtCDPROD.Clear;
          edtCDPROD.SetFocus;
          Exit;
     End;
     //
     Try
         tratabotoes;
         // Inicia um transação no BD
         TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
         TD.IsolationLevel := xilREADCOMMITTED;
         Dm.SqlAdmin.StartTransaction(TD);
         //
         M_CDLOJA := StrtoInt(UFrmAdmin.M_CDLOJA);
         M_DTMOVI := Date();
         M_HOMOVI := TimetoStr(Time);
         M_TPMOVI  := 'TS';
         M_TPMOVI2 := 'TE';
         // Banco Transeferencias
         If (dm2.cdsTranferencias.State in [dsInsert]) Then
         Begin
              dm.parametros;
              dm.CdsConfig.Edit;
              Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
              dm.CdsConfigCFG_TRANSFERENCIA.Value := dm.CdsConfigCFG_TRANSFERENCIA.Value+1;
              dm2.cdsTranferenciasTRA_NRTRANSFERENCIA.Value :=
                    dm.CdsConfigCFG_TRANSFERENCIA.Value;
              M_NRTRAN := dm.CdsConfigCFG_TRANSFERENCIA.Value;
              M_NRSEQU := Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger;
              dm.CdsConfig.Post;
              dm.CdsConfig.ApplyUpdates(0);
         End;
         //
         dm2.cdsTranferenciasTRA_SITUACAO.AsString := 'T';
         dm2.cdsTranferenciasTRA_DATA.Value    := M_DTMOVI;
         dm2.cdsTranferenciasTRA_HORA.AsString := M_HOMOVI;
         dm2.cdsTranferenciasTRA_USUARIO.AsInteger := StrtoInt(UFrmAdmin.M_CDUSUA);
         dm2.cdsTranferencias.Post;
         dm2.cdsTranferencias.ApplyUpdates(0);
         //
         M_LJORIG := dm2.cdsTranferenciasTRA_LOJAORIGEM.AsInteger;
         M_LJDEST := dm2.cdsTranferenciasTRA_LOJADESTINO.AsInteger;
         //
         cdsItensTransf.First;
         cdsItensTransf.DisableControls;
         //
           While not (cdsItensTransf.Eof) do
           Begin
                // Loja de origem
                //  Tabela de estoque
                Dm.cdsEstoque.Close;
                With Dm.dstEstoque do
                Begin
                     Active := False;
                     CommandText := 'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and (PRO_CODIGO = :pCODIGO)';
                     //
                     Params.ParamByName('pCODIGOLOJA').AsInteger := M_LJORIG;
                     Params.ParamByName('pCODIGO').AsString      := cdsItensTransf.FieldByName('PRT_CODIGO').AsString;
                     Active := True;
                End;
                Dm.cdsEstoque.Open;
                // Tabela de Estoque
                M_QTANTE := 0;
                If (Dm.cdsEstoque.IsEmpty) Then  // Se não encontrar
                begin
                     Dm.cdsEstoque.Append;
                     Dm.cdsEstoque.FieldByName('EST_CODIGOLOJA').AsInteger := M_LJORIG;
                     Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString := cdsItensTransf.FieldByName('PRT_CODIGO').AsString;
                     Dm.cdsEstoque.FieldByName('UNI_CODIGO').AsString := cdsItensTransf.FieldByName('PRT_UNIDADE').AsString;
                     Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime := M_DTMOVI;
                     Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat := cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat;
                     Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                             Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat;
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
                     Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime := M_DTMOVI;
                     Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat := cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat;
                     Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                             Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat;
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
                     Params.ParamByName('pSEQUENCIA').AsInteger := M_NRSEQU;
                     Params.ParamByName('pLOJA').AsInteger      := M_LJORIG;
                     Params.ParamByName('pPRODUTO').AsString     := cdsItensTransf.FieldByName('PRT_CODIGO').AsString;
                     Active := True;
                End;
                //
                With qryProdutos do
                Begin
                     Close;
                     Params.ParamByName('pCODIGO').AsString := cdsItensTransf.FieldByName('PRT_CODIGO').AsString;
                     Open;
                End;
                //
                If not (qryProdutos.IsEmpty) Then
                Begin
                     M_VLCOMP2    := qryProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
                     M_VLCUST2    := qryProdutos.FieldByName('PRO_VLCUSTO').AsCurrency;
                     M_VLVENDPRO  := qryProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
                End;
                //
                Dm.cdsHistorico.Open;
                //
                With Dm.cdsHistorico do
                Begin
                      Append;
                      FieldByName('HIS_SEQUENCIA').AsInteger := M_NRSEQU;
                      FieldByName('HIS_LOJA').AsInteger      := M_LJORIG;
                      FieldByName('HIS_DOCUMENTO').AsInteger := M_NRTRAN;
                      FieldByName('HIS_PRODUTO').AsString    := cdsItensTransf.FieldByName('PRT_CODIGO').AsString;
                      FieldByName('HIS_UNIDADE').AsString    := cdsItensTransf.FieldByName('PRT_UNIDADE').AsString;
                      FieldByName('HIS_DATA').AsDateTime     := M_DTMOVI;
                      FieldByName('HIS_HORA').AsString       := M_HOMOVI;
                      FieldByName('HIS_TIPO').AsString       := M_TPMOVI;
                      FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                      FieldByName('HIS_MOVIMENTO').AsFloat   := cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat;
                      FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST2;
                      FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP2;
                      FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
                      FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                      FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
                      //FieldByName('HIS_MOTIVO')
                      Post;
                      ApplyUpdates(0);
                End;
                // Loja de destino
                //  Tabela de estoque
                Dm.cdsEstoque.Close;
                With Dm.dstEstoque do
                Begin
                     Active := False;
                     CommandText := 'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and (PRO_CODIGO = :pCODIGO)';
                     //
                     Params.ParamByName('pCODIGOLOJA').AsInteger := M_LJDEST;
                     Params.ParamByName('pCODIGO').AsString      := cdsItensTransf.FieldByName('PRT_CODIGO').AsString;
                     Active := True;
                End;
                Dm.cdsEstoque.Open;
                // Tabela de Estoque
                M_QTANTE := 0;
                If (Dm.cdsEstoque.IsEmpty) Then  // Se não encontrar
                begin
                     Dm.cdsEstoque.Append;
                     Dm.cdsEstoque.FieldByName('EST_CODIGOLOJA').AsInteger := M_LJDEST;
                     Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString := cdsItensTransf.FieldByName('PRT_CODIGO').AsString;
                     Dm.cdsEstoque.FieldByName('UNI_CODIGO').AsString := cdsItensTransf.FieldByName('PRT_UNIDADE').AsString;
                     Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime := M_DTMOVI;
                     Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat := cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat;
                     Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                             Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat + cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat;
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
                     Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime := M_DTMOVI;
                     Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat := cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat;
                     Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                             Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat + cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat;
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
                     Params.ParamByName('pSEQUENCIA').AsInteger := M_NRSEQU;
                     Params.ParamByName('pLOJA').AsInteger      := M_LJDEST;
                     Params.ParamByName('pPRODUTO').AsString     := cdsItensTransf.FieldByName('PRT_CODIGO').AsString;
                     Active := True;
                End;
                //
                With qryProdutos do
                Begin
                     Close;
                     Params.ParamByName('pCODIGO').AsString := cdsItensTransf.FieldByName('PRT_CODIGO').AsString;
                     Open;
                End;
                //
                If not (qryProdutos.IsEmpty) Then
                Begin
                     M_VLCOMP2    := qryProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
                     M_VLCUST2    := qryProdutos.FieldByName('PRO_VLCUSTO').AsCurrency;
                     M_VLVENDPRO  := qryProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
                End;
                //
                Dm.cdsHistorico.Open;
                //
                With Dm.cdsHistorico do
                Begin
                      Append;
                      FieldByName('HIS_SEQUENCIA').AsInteger := M_NRSEQU;
                      FieldByName('HIS_LOJA').AsInteger      := M_LJDEST;
                      FieldByName('HIS_DOCUMENTO').AsInteger := M_NRTRAN;
                      FieldByName('HIS_PRODUTO').AsString    := cdsItensTransf.FieldByName('PRT_CODIGO').AsString;
                      FieldByName('HIS_UNIDADE').AsString    := cdsItensTransf.FieldByName('PRT_UNIDADE').AsString;
                      FieldByName('HIS_DATA').AsDateTime     := M_DTMOVI;
                      FieldByName('HIS_HORA').AsString       := M_HOMOVI;
                      FieldByName('HIS_TIPO').AsString       := M_TPMOVI2;
                      FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                      FieldByName('HIS_MOVIMENTO').AsFloat   := cdsItensTransf.FieldByName('PRT_QUANTIDADE').AsFloat;
                      FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                      FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST2;
                      FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP2;
                      FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
                      FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
                      //FieldByName('HIS_MOTIVO')
                      Post;
                      ApplyUpdates(0);
                End;
                // Proximo
                cdsItensTransf.Next;
           End;
           //cdsItensTransf.EnableControls;
         Application.MessageBox('Transferência concluída com sucesso!!!','ATENÇÃO',
            MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         // Grava
         Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
         //
         Close;
     Except
         on Exc:Exception do
         begin
              Application.MessageBox(PChar('Erro ao tentar gravar registro!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transação no BD.
              Dm.SqlAdmin.Rollback(TD);
         End;
     End;
end;

procedure TfrmTransferencias.cdsItensTransfCalcFields(DataSet: TDataSet);
begin
     cdsItensTransfPRT_SUBTOTAL.AsCurrency :=
         cdsItensTransfPRT_QUANTIDADE.AsCurrency *
         cdsItensTransfPRT_VLCOMPRA.AsCurrency;
end;

procedure TfrmTransferencias.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Transferências'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     BtAdicionar.Visible := (novo = 'S');
     //BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');
     //
   End;
   //
   dm2.cdsTranferencias.close;
   cdsItensTransf.Open;
end;

procedure TfrmTransferencias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      cdsItensTransf.Close;
      //
      Action := caFree;
end;

procedure TfrmTransferencias.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
     Begin
          edtDESCRICAO.Clear;
          edtCDUNID.Clear;
          edtQuantidade.Clear;
     End;
end;

procedure TfrmTransferencias.edtQuantidadeExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtQuantidade.Text) Then
        ADICIONAR;
end;

procedure TfrmTransferencias.BtExcluirClick(Sender: TObject);
begin
  if cdsItensTransf.RecordCount > 0 then
  Begin
   Try
     If Application.MessageBox('Deseja excluir este registro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       cdsItensTransf.Delete;
   Except
         on Exc:Exception do
         begin
              Application.MessageBox(PChar('Erro ao tentar excluir registro!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         End;
   End;
  End;
end;

procedure TfrmTransferencias.spLocClienteClick(Sender: TObject);
begin
    try
               Application.CreateForm(TfrmLocalizaProduto, frmLocalizaProduto);
               uFrmProcurarProduto.M_NRFORM := 2;
               frmLocalizaProduto.ShowModal;
    Finally
               If not uFuncoes.Empty(uFrmProcurarProduto.M_CDPROD) Then
                   edtCDPROD.Text := uFrmProcurarProduto.M_CDPROD;
               //
               frmLocalizaProduto.Free;
               If not uFuncoes.Empty(edtCDPROD.Text) Then
                   edtQuantidade.SetFocus
               Else
                   edtCDPROD.SetFocus;
    End;
end;

end.
